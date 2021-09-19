<!DOCTYPE html>
<html lang="zh-CN">
<#import "common/header.ftl" as headInfo>
<@headInfo.head title="${category.name!}" type="category"/>
<body>
    <div id="Joe">
       <#include "common/navbar.ftl">
       <div class="joe_container joe_main_container">
            <div class="joe_main">
                <div class="joe_archive">
                    <div class="joe_archive__title">
                        <div class="joe_archive__title-title">
                            <span><i class="joe-font joe-icon-feather joe_archive__title-icon"></i>以下是</span>
                            <span class="muted ellipsis">${category.name!}</span>
                            <span>相关的文章</span>
                        </div>
                    </div>

                    <ul class="joe_archive__list joe_list" data-wow="on">
                        <#list posts.content as post>
                        <li class="joe_list__item wow default">
                            <div class="line"></div>
                            <a href="${post.fullPath!}" class="thumbnail" title="${post.title!}" target="_blank" rel="noopener noreferrer">
                                <#if post.thumbnail!=''>
                                  <#assign thumbnail=post.thumbnail>
                                <#else>
                                  <#assign thumbnail=settings.passage_thumbnail>
                                </#if>
                                <img width="100%" height="100%" class="lazyload" src="${settings.lazyload_thumbnail!'https://cdn.jsdelivr.net/gh/qinhua/cdn_assets/img/lazyload.jpeg'}" data-src="${thumbnail!}" onerror="this.src='${settings.fallback_img!}'" alt="${post.title!}">
                                <time datetime="${post.createTime?string('yyyy-MM-dd')}">${post.createTime?string('yyyy-MM-dd')}</time>
                                <i class="joe-font joe-icon-picture"></i>
                            </a>
                            <div class="information">
                                <a href="${post.fullPath!}" class="title" title="${post.title!}" target="_blank" rel="noopener noreferrer">${post.title!}</a>
                                <a class="abstract" href="${post.fullPath!}" title="文章摘要" target="_blank" rel="noopener noreferrer">${post.summary!}</a>
                                <div class="meta">
                                    <ul class="items">
                                        <li>${post.createTime?string('yyyy-MM-dd')}</li>
                                        <li>${post.visits!0} 阅读</li>
                                        <li>${post.commentCount!0} 评论</li>
                                        <li>${post.likes!0} 点赞</li>
                                    </ul>
                                </div>
                             </div>
                         </li>
                         </#list>
                    </ul>
                </div>
                <@paginationTag method="categoryPosts" slug="${category.slug!}" page="${posts.number}" total="${posts.totalPages}" display="3">
                    <#if (posts.totalPages == 0)>
                        <div class="joe_archive__empty">
                            <svg class="joe_archive__empty-icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="120" height="120">
                                <path d="M483.322 136.98l-2.08-116.502A19.278 19.278 0 0 1 499.266 0h2.512c12.439.104 22.574 10.063 22.574 22.43l4.048 114.446a22.702 22.702 0 0 1-22.606 22.43c-10.136-1.952-22.479-10.079-22.479-22.326h.016zm165.034 16.943c-8.751 8.695-23.27 5.847-32.045 0a22.638 22.638 0 0 1 0-31.702L700.8 44.156a23.006 23.006 0 0 1 31.933 0c8.76 8.703 8.76 23.118 0 28.958l-84.377 80.793zm-287.215 0l-84.369-80.921c-8.767-5.824-8.767-20.135 0-28.95a23.006 23.006 0 0 1 31.917 0l84.497 78.058a22.606 22.606 0 0 1 0 31.7c-8.775 5.944-23.278 8.8-32.045.113zm488.686 679.445v9.84l-8.871 3.663-306.238 125.43-5.76 2.64V645l9.904 17.15 60.283 105.063a15.206 15.206 0 0 0 13.03 7.327 14.879 14.879 0 0 0 7.952-2.055L850.17 658.047V833.36h-.328l-.016.008zm-671.486 13.503l-9.44-3.655V654.824l.448.456 236.396 117.086a23.86 23.86 0 0 0 7.96 2.047 17.15 17.15 0 0 0 14.158-7.759l59.715-104.615 9.92-17.158V977.46l-13.152-5.28-306.005-125.317zm-21.998-415.308l4.72-8.8 323.411 162.85 4.84 2.616-2.76 4.696-77.57 138.932-2.655 4.24-4.72-2.056L77.15 572.663l5.888-10.4 73.298-130.708h.008zM484.93 304.646l12.56-4.12V552.41h-6.336l-1.608-1.024-295.063-147.868 9.92-3.663 280.527-95.208zm328.716 95.784l14.175 4.695-291.487 146.708-7.375 3.663V303.054l5.303 1.6 279.392 95.792v-.016zM935.82 562.256l7.367 13.503-320.293 159.306-4.847 2.056-2.52-4.12-77.113-139.508-2.528-4.688 4.704-2.64L858.722 426.98l2.192 3.664 74.922 131.62h-.016zm49.1 12.463L884.863 397.334v-1.016a16.047 16.047 0 0 0-6.775-7.327l-359.05-133.797-1.04-.56-1.031-.464a14.967 14.967 0 0 0-7.968-2.176 13.71 13.71 0 0 0-7.84 2.176l-1.023.464-1.144.56-357.881 134.253a25.649 25.649 0 0 0-9.455 8.815l-100.04 178.52a19.414 19.414 0 0 0 8.88 24.958l81.249 40.053 8.43 4.231v207.15a18.91 18.91 0 0 0 10.48 17.151l358.45 151.42c2.99 1.487 6.223 2.159 9.438 2.159 3.248 0 6.48-.672 9.455-2.16l356.498-151.987h1.04a18.022 18.022 0 0 0 11.99-17.158V644.417l7.84-4.128 78.593-40.157 3.232-1.503 3.008-2.048a15.807 15.807 0 0 0 4.72-21.87v.008z"></path>
                            </svg>
                            <span>没有找到相关结果...</span>
                        </div>
                    <#elseif (posts.totalPages == 1)>
                    <#else>
                        <ul class="joe_pagination">
                            <#if pagination.hasPrev>
                                <li class="prev">
                                    <a href="${pagination.prevPageFullPath!}">
                                    <i class="joe-font joe-icon-prev"></i>
                                    </a>
                                </li>
                            </#if>
                            <#list pagination.rainbowPages as number>
                                <#if number.isCurrent>
                                    <li class="active">
                                        <a href="${number.fullPath!}">${number.page!}</a>
                                    </li>
                                <#else>
                                    <li>
                                        <a href="${number.fullPath!}">${number.page!}</a>
                                    </li>
                                </#if>
                            </#list>
                            <#if pagination.hasNext && (pagination.rainbowPages?size &gt;0)>
                                <li class="next">
                                    <a href="${pagination.nextPageFullPath!}">
                                        <i class="joe-font joe-icon-next"></i>
                                    </a>
                                </li>
                            </#if>
                        </ul>
                    </#if>    
                </@paginationTag> 
            </div>
            <#include "common/aside.ftl">
        </div>
        <#include "common/footer.ftl">
    </div>
    <#include "common/tail.ftl">
</body>

</html>