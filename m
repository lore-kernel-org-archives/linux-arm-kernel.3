Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D814AD35E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 02:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8qWlHJLPEsvJFRVTli7X+xiYCADFiw+eeu8uvYBUh1E=; b=X9F+m4c8Z/5DIJzzskFl2p5pnC
	k81eYvCTSgMU2l4FjAFwtJDTn6qGitT4a4LEBc+C6rJYZ06JImCtzE86i3YfEQJamsRqbqh9Tz5tI
	N0kThpMDLTotIJFWe2B3oBbLT6uhi9T8umZEA9uFJlUImRWHeKSvIs4BAd4Z3VrHAqjoKycaKMoo6
	qEqUh6f+WxxHpQfHa7txlYIc5Z0la43TPPnvNDWZTpEzw0gp4UYuZmXDpg2cgHJDxD7ViXVjdraO4
	S3twTOr9Yh56vt8WHrb4nb3trOh4HavmeDqQoUDMGLtHxVNNtslNfkJosayiSik2NWAqX6n0JE+wo
	jcg+op2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8WEm-00000001cnX-2gZu;
	Wed, 06 Nov 2024 02:57:40 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8WD1-00000001cKu-17Hi;
	Wed, 06 Nov 2024 02:55:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XjqXm0lcPz2Fbr5;
	Wed,  6 Nov 2024 10:54:00 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id B91CE1A0188;
	Wed,  6 Nov 2024 10:55:40 +0800 (CST)
Received: from huawei.com (10.67.175.69) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 6 Nov
 2024 10:55:40 +0800
From: Zhang Kunbo <zhangkunbo@huawei.com>
To: <neil.armstrong@linaro.org>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chris.zjh@huawei.com>, <liaochang1@huawei.com>
Subject: [PATCH] drm/meson: Avoid use-after-free issues with crtc
Date: Wed, 6 Nov 2024 02:45:48 +0000
Message-ID: <20241106024548.1915611-1-zhangkunbo@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.69]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_185551_947280_B98E6F6E 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

It's dangerous to call drm_crtc_init_with_planes() whose second
argument is allocated with devm_kzalloc() [1][2].

Use drmm_kzalloc instead to avoid UAF.

[1] https://lore.kernel.org/all/a830685d8b10a00cfe0a86db1ee9fb13@ispras.ru
[2] https://lore.kernel.org/all/2111196.TG1k3f53YQ@avalon

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Signed-off-by: Zhang Kunbo <zhangkunbo@huawei.com>
---
 drivers/gpu/drm/meson/meson_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index d70616da8ce2..603022554a48 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -17,6 +17,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_managed.h>
 
 #include "meson_crtc.h"
 #include "meson_plane.h"
@@ -72,7 +73,6 @@ static void meson_crtc_disable_vblank(struct drm_crtc *crtc)
 static const struct drm_crtc_funcs meson_crtc_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.destroy		= drm_crtc_cleanup,
 	.page_flip		= drm_atomic_helper_page_flip,
 	.reset			= drm_atomic_helper_crtc_reset,
 	.set_config             = drm_atomic_helper_set_config,
@@ -677,14 +677,14 @@ int meson_crtc_create(struct meson_drm *priv)
 	struct drm_crtc *crtc;
 	int ret;
 
-	meson_crtc = devm_kzalloc(priv->drm->dev, sizeof(*meson_crtc),
+	meson_crtc = drmm_kzalloc(priv->drm, sizeof(*meson_crtc),
 				  GFP_KERNEL);
 	if (!meson_crtc)
 		return -ENOMEM;
 
 	meson_crtc->priv = priv;
 	crtc = &meson_crtc->base;
-	ret = drm_crtc_init_with_planes(priv->drm, crtc,
+	ret = drmm_crtc_init_with_planes(priv->drm, crtc,
 					priv->primary_plane, NULL,
 					&meson_crtc_funcs, "meson_crtc");
 	if (ret) {
-- 
2.34.1


