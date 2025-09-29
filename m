Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3834BCAC5BD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 04:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sXHbeK++urRgXFZ0q5BURM+QBMH1xJNpaG+x/fCF18=; b=3N2OBZ/OuzgBG+bU+s1kkVJATk
	L5K4iR0kA0GZWFz8C2QMCwh4YJZ7yaOXprJLdljGIDJSJj3TE/iG65JYcaBn7gSVunw2VvIVE5/Jy
	IsBUevmTUc/bnoN0sJy4tAY2wY9gj5oPX7NjkxMjTP+hcnIyAA7ovQifKsVXaTu+Nu/3mrOQCnKWw
	1HlnJTWMC/MKoAEg6sM8ynG5hnGvaoVzB5rhyCojpRbPUf4MExp1ZLKhfyj0v+V1ur7ejg0gnHUAJ
	Qu3M2ujtYmZnoH7SLv13mfmLmKB2ETT958qXvrCCSYltjKWN/sMXGA936hfFvWWKu5yU+vkXUTf8r
	HVV1kYbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v35Vy-00000001JKb-0SfD;
	Mon, 29 Sep 2025 04:29:30 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v35Vs-00000001JIX-3U1K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 04:29:28 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250929042918epoutp0229c70a2096fa7c2a2799b8471e0cebcc~ppnbVs6vF2998629986epoutp02N
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250929042918epoutp0229c70a2096fa7c2a2799b8471e0cebcc~ppnbVs6vF2998629986epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759120158;
	bh=6sXHbeK++urRgXFZ0q5BURM+QBMH1xJNpaG+x/fCF18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j2npnJQweQ8Jqvw+0Wu5fGPU529Yz6EacXJlvGNDrYqr6bhquYsB1epkEUfh//UuI
	 369eJP+muCc2j6TG441PD55Y8oQm0BKL2ByAQKwBiuAfxxA3+S8FJNk75WTnTdedXR
	 b3i6sKou3zMvdGfEBwceCJMducCVfXSFawyBBiM8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250929042918epcas2p48ba6d48b41c6fdd147cf6c6850617c73~ppnbAiqdy1362413624epcas2p4W;
	Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.205]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cZp9p0Y7Mz6B9mL; Mon, 29 Sep
	2025 04:29:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250929042917epcas2p43d95408c9c43ff49ff6674136d7c64d3~ppnaD-lQX0591205912epcas2p4u;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929042917epsmtip1dc25e0c7a28d5a3a5ce6ffb1ebdba5be~ppnZ-VBh52522725227epsmtip1n;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
From: Hoyoung Lee <hy_fifty.lee@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: Hoyoung Lee <hy_fifty.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/exynos: Move mode_config setup from fb.c to drv.c
Date: Mon, 29 Sep 2025 13:31:10 +0900
Message-ID: <20250929043110.3631025-4-hy_fifty.lee@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250929042917epcas2p43d95408c9c43ff49ff6674136d7c64d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p43d95408c9c43ff49ff6674136d7c64d3
References: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
	<CGME20250929042917epcas2p43d95408c9c43ff49ff6674136d7c64d3@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_212925_181362_E673BC44 
X-CRM114-Status: GOOD (  18.09  )
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

Relocate exynos_drm_mode_config_init() and the mode_config funcs/helpers
from exynos_drm_fb.c to exynos_drm_drv.c, and invoke
drm_mode_config_init() from inside exynos_drm_mode_config_init().

Rationale: resolve the historical fb.c placement, align with common DRM
layering (mode_config is device-wide policy that belongs in the core
driver), and make initialization order explicit before creating KMS
objects and binding components.

No functional change intended.

Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 47 ++++++++++++++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_fb.c  | 34 ++----------------
 drivers/gpu/drm/exynos/exynos_drm_fb.h  |  7 ++--
 3 files changed, 49 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 1aea71778ab1..6362cd417a4e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -233,6 +233,43 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
 	return match ?: ERR_PTR(-ENODEV);
 }
 
+static struct drm_mode_config_helper_funcs exynos_drm_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
+static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
+	.fb_create = exynos_user_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static int exynos_drm_mode_config_init(struct drm_device *dev)
+{
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+
+	dev->mode_config.min_width = 0;
+	dev->mode_config.min_height = 0;
+
+	/*
+	 * set max width and height as default value(4096x4096).
+	 * this value would be used to check framebuffer size limitation
+	 * at drm_mode_addfb().
+	 */
+	dev->mode_config.max_width = 4096;
+	dev->mode_config.max_height = 4096;
+
+	dev->mode_config.funcs = &exynos_drm_mode_config_funcs;
+	dev->mode_config.helper_private = &exynos_drm_mode_config_helpers;
+
+	dev->mode_config.normalize_zpos = true;
+
+	return 0;
+}
+
 static int exynos_drm_bind(struct device *dev)
 {
 	struct exynos_drm_private *private;
@@ -257,9 +294,9 @@ static int exynos_drm_bind(struct device *dev)
 	dev_set_drvdata(dev, drm);
 	drm->dev_private = (void *)private;
 
-	drmm_mode_config_init(drm);
-
-	exynos_drm_mode_config_init(drm);
+	ret = exynos_drm_mode_config_init(drm);
+	if (ret)
+		goto err_free_private;
 
 	/* setup possible_clones. */
 	clone_mask = 0;
@@ -272,7 +309,7 @@ static int exynos_drm_bind(struct device *dev)
 	/* Try to bind all sub drivers. */
 	ret = component_bind_all(drm->dev, drm);
 	if (ret)
-		goto err_mode_config_cleanup;
+		goto err_free_private;
 
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret)
@@ -296,7 +333,7 @@ static int exynos_drm_bind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 err_unbind_all:
 	component_unbind_all(drm->dev, drm);
-err_mode_config_cleanup:
+err_free_private:
 	exynos_drm_cleanup_dma(drm);
 	kfree(private);
 	dev_set_drvdata(dev, NULL);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index ddd73e7f26a3..c118a079d308 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -8,8 +8,7 @@
  *	Seung-Woo Kim <sw0312.kim@samsung.com>
  */
 
-#include <drm/drm_atomic.h>
-#include <drm/drm_atomic_helper.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
@@ -93,7 +92,7 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
-static struct drm_framebuffer *
+struct drm_framebuffer *
 exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		      const struct drm_format_info *info,
 		      const struct drm_mode_fb_cmd2 *mode_cmd)
@@ -150,32 +149,3 @@ dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)
 	exynos_gem = to_exynos_gem(fb->obj[index]);
 	return exynos_gem->dma_addr + fb->offsets[index];
 }
-
-static struct drm_mode_config_helper_funcs exynos_drm_mode_config_helpers = {
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
-};
-
-static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
-	.fb_create = exynos_user_fb_create,
-	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
-};
-
-void exynos_drm_mode_config_init(struct drm_device *dev)
-{
-	dev->mode_config.min_width = 0;
-	dev->mode_config.min_height = 0;
-
-	/*
-	 * set max width and height as default value(4096x4096).
-	 * this value would be used to check framebuffer size limitation
-	 * at drm_mode_addfb().
-	 */
-	dev->mode_config.max_width = 4096;
-	dev->mode_config.max_height = 4096;
-
-	dev->mode_config.funcs = &exynos_drm_mode_config_funcs;
-	dev->mode_config.helper_private = &exynos_drm_mode_config_helpers;
-
-	dev->mode_config.normalize_zpos = true;
-}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.h b/drivers/gpu/drm/exynos/exynos_drm_fb.h
index fdc6cb40cc9c..0c79ce5d4a8d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.h
@@ -19,8 +19,11 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 			    struct exynos_drm_gem **exynos_gem,
 			    int count);
 
-dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index);
+struct drm_framebuffer *
+exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		      const struct drm_format_info *info,
+		      const struct drm_mode_fb_cmd2 *mode_cmd);
 
-void exynos_drm_mode_config_init(struct drm_device *dev);
+dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index);
 
 #endif
-- 
2.34.1


