Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D23106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yv3DgahW+8Di+Ae6kVC5TLkHixUv+/CDEG1z0t/clqU=; b=1KpZKQTnFpYyFuXTYRz6XHPV0Z
	NTpBtd2LkY5CQu/gXvXpB+UXIz6lR/BaV0PIJjYCJyroVyAWMCBzEUvTp3MgO+YIdbaea/PRkn19M
	5GtqefuQzfq9Ckd2Wd4f6H5s7Zf9ElM5c453pdo0IJva5NciEkN1zC4wKxJbN5Us5VZFACj/iyEjh
	dzh674SoWagghLKMTYbatup5D9rt5JKitJbGEQ9PUaUenW9tbo8M28XLcCSNhiUjy/4mlkTkVncjr
	4ojnHIkVo+Qr38LXg9fnwYbVzPCREdjX+LaFmRtJYUSW2j6eE6dGAdJtERqAhvXHuokilu3YpwBkq
	nlVNChIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hFR-00000005AeA-2oau;
	Thu, 26 Mar 2026 09:43:29 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hFM-00000005AbV-0ajp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:43:25 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c73e9e4cdf7so394849a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774518203; x=1775123003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv3DgahW+8Di+Ae6kVC5TLkHixUv+/CDEG1z0t/clqU=;
        b=NuioEOJuXP0w+ySUGpYNQltLlhpgaoRuYJYcwyjPTvSqlAs31GZyznY0y6KSFr0NoC
         AkN/7igXJc0ERPpOmFCTN3Jjxv4NdsiocxiJ9djwdkF5zq5lI8D1ceX3s84XYWq/uZs3
         WcLtW+mMcse0pIoJOu0C6zVbKI6SbGspwAy1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518203; x=1775123003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yv3DgahW+8Di+Ae6kVC5TLkHixUv+/CDEG1z0t/clqU=;
        b=Xv9w+YsaKQGUo+wwwjc6ZjfnFVktZ4Jlo+Gy7NoyXEHIQ6g1b3VBDcRShpNCGeXs78
         mgkgXPrAiYtfqc7fmJDYhAKyBM3NFwknAAcvE/BLW4FUmTmJFMNPQO1b94qUgZVh8ZEc
         ygWuJGmuO6YbE0DvfXZ19WOQ88BGlNV2WHZnmMm5SeggKRtkGoK2AAHQsB+Gtor4yWmt
         t9vsPs8BiThhxRW2nVLX44yAIqUQlbZHGzU5pC8AgvOw5mo2yb0LXgfLscN/KEUzNKzU
         SGL6dmx8wOSjYO6v3bjDFXjMxLRSe9TBYGcC/eplR/AO4SLM4QhVRLz2VPN4g3JE/t/0
         yljg==
X-Forwarded-Encrypted: i=1; AJvYcCX5inSVc4Q8pX2S+BfOi1a5R2mZY4JdggEZPisMBumfZIiqDX6fKWnI/jv/VtoiAYqwDBrpVk8xe2UJi4IZeuRA@lists.infradead.org
X-Gm-Message-State: AOJu0YxNht3BszshYKPzQGZoVHX4Rxo1OBdBiSt/Oy1PK1xTaJnzQ2Is
	J3Tsd1Zw5doW1Hjz2tqU8V34breVAhvGIM+mb0xJYi9YFAfdKcjRDxEuGPDdyW1wdA==
X-Gm-Gg: ATEYQzz9RH+oGFANr/KimLRdyzW9pcuVVoMyjZuzUXhXI7I0PqCC5/rGtqvipf16Eor
	FGFQ9Thd/cUL76vXmyMaxDDyThHGjd+bQ2Dm3D58bZYlfRpaftBFpwwntowmaNn4DI3MNGjLAxJ
	ZfBngHmh2XSdm4IPZ7MZO4fhbYZRr0RmcP/elyl0vRVzJtFcS7RobiywXUrIjB3Jid/H/zwBpPj
	gIPibpgLVP9vvQXRka1n36FANATvYOZovQVLmcMG2EFF5Iy9k4yZ0/Ym6DPsO2zklz3DFYB0NBw
	WTBCGMV1X4JJ3OQQAawLJMYfPcumi0QbGPYQuvp5yXBKGFtbYRRcYTMVzvk+Da87bnEFY2rfMuw
	rFWM8Mb7BT2lixhnWXez+f35EpkaU1W3cEpoWIEdJmx+xyRjBk0iIQtL+LzFkuU34RHeyx5AfOL
	ojqeswtQZsyu/PFvPI4Iwnrcet7wnf8NWHPDlcWNbS4Nnc/iYAtXL40BzkLPhj4Pjmw9jYMhxfk
	qVIScbZ
X-Received: by 2002:a05:6a21:9991:b0:39b:e321:67ea with SMTP id adf61e73a8af0-39c4ada6b00mr7445920637.45.1774518203067;
        Thu, 26 Mar 2026 02:43:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28fasm1673312a12.7.2026.03.26.02.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:43:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/exynos: Use DRM core dedicated DMA device tracking facility
Date: Thu, 26 Mar 2026 17:43:04 +0800
Message-ID: <20260326094308.1161335-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326094308.1161335-1-wenst@chromium.org>
References: <20260326094308.1161335-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_024324_198220_74591EA3 
X-CRM114-Status: GOOD (  22.20  )
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

The exynos driver tracks a dedicated DMA device in its private data.
The DRM core already has facilities to do this, and it is integrated
into DRM PRIME imports and GEM DMA helpers.

Convert the exynos driver to use the core's dedicated DMA device
tracking facility. Also get rid of exynos_drm_gem_prime_import() as
it is identical to drm_gem_prime_import() after the conversion.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 11 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_drv.c |  1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  8 --------
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 11 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 27 ++++++++++---------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h |  2 --
 6 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index ccc6b852ee7d..734741c80cbe 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -8,6 +8,7 @@
 #include <linux/iommu.h>
 #include <linux/platform_device.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
 
@@ -41,7 +42,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 	int ret = 0;
 
-	if (get_dma_ops(priv->dma_dev) != get_dma_ops(subdrv_dev)) {
+	if (get_dma_ops(drm_dev_dma_dev(drm_dev)) != get_dma_ops(subdrv_dev)) {
 		DRM_DEV_ERROR(subdrv_dev, "Device %s lacks support for IOMMU\n",
 			  dev_name(subdrv_dev));
 		return -EINVAL;
@@ -93,8 +94,8 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
 {
 	struct exynos_drm_private *priv = drm->dev_private;
 
-	if (!priv->dma_dev) {
-		priv->dma_dev = dev;
+	if (drm_dev_dma_dev(drm) == drm->dev) {
+		drm_dev_set_dma_dev(drm, dev);
 		DRM_INFO("Exynos DRM: using %s device for DMA mapping operations\n",
 			 dev_name(dev));
 	}
@@ -109,7 +110,7 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
 			mapping = arm_iommu_create_mapping(dev,
 				EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
 		else if (IS_ENABLED(CONFIG_IOMMU_DMA))
-			mapping = iommu_get_domain_for_dev(priv->dma_dev);
+			mapping = iommu_get_domain_for_dev(dev);
 
 		if (!mapping)
 			return -ENODEV;
@@ -135,5 +136,5 @@ void exynos_drm_cleanup_dma(struct drm_device *drm)
 
 	arm_iommu_release_mapping(priv->mapping);
 	priv->mapping = NULL;
-	priv->dma_dev = NULL;
+	drm_dev_set_dma_dev(drm, NULL);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2101a74dc1ed..9ee30086879f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -109,7 +109,6 @@ static const struct drm_driver exynos_drm_driver = {
 	.open			= exynos_drm_open,
 	.postclose		= exynos_drm_postclose,
 	.dumb_create		= exynos_drm_gem_dumb_create,
-	.gem_prime_import	= exynos_drm_gem_prime_import,
 	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
 	EXYNOS_DRM_FBDEV_DRIVER_OPS,
 	.ioctls			= exynos_ioctls,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 06c29ff2aac0..1ab7195d09ae 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -198,7 +198,6 @@ struct drm_exynos_file_private {
  */
 struct exynos_drm_private {
 	struct device *g2d_dev;
-	struct device *dma_dev;
 	struct device *vidi_dev;
 	void *mapping;
 
@@ -208,13 +207,6 @@ struct exynos_drm_private {
 	wait_queue_head_t	wait;
 };
 
-static inline struct device *to_dma_dev(struct drm_device *dev)
-{
-	struct exynos_drm_private *priv = dev->dev_private;
-
-	return priv->dma_dev;
-}
-
 static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
 {
 	struct exynos_drm_private *priv = drm_dev->dev_private;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 348603262af0..85a3a247dfca 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -20,6 +20,7 @@
 #include <linux/uaccess.h>
 #include <linux/workqueue.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
@@ -278,7 +279,7 @@ static int g2d_init_cmdlist(struct g2d_data *g2d)
 
 	g2d->cmdlist_dma_attrs = DMA_ATTR_WRITE_COMBINE;
 
-	g2d->cmdlist_pool_virt = dma_alloc_attrs(to_dma_dev(g2d->drm_dev),
+	g2d->cmdlist_pool_virt = dma_alloc_attrs(drm_dev_dma_dev(g2d->drm_dev),
 						G2D_CMDLIST_POOL_SIZE,
 						&g2d->cmdlist_pool, GFP_KERNEL,
 						g2d->cmdlist_dma_attrs);
@@ -311,7 +312,7 @@ static int g2d_init_cmdlist(struct g2d_data *g2d)
 	return 0;
 
 err:
-	dma_free_attrs(to_dma_dev(g2d->drm_dev), G2D_CMDLIST_POOL_SIZE,
+	dma_free_attrs(drm_dev_dma_dev(g2d->drm_dev), G2D_CMDLIST_POOL_SIZE,
 			g2d->cmdlist_pool_virt,
 			g2d->cmdlist_pool, g2d->cmdlist_dma_attrs);
 	return ret;
@@ -322,7 +323,7 @@ static void g2d_fini_cmdlist(struct g2d_data *g2d)
 	kfree(g2d->cmdlist_node);
 
 	if (g2d->cmdlist_pool_virt && g2d->cmdlist_pool) {
-		dma_free_attrs(to_dma_dev(g2d->drm_dev),
+		dma_free_attrs(drm_dev_dma_dev(g2d->drm_dev),
 				G2D_CMDLIST_POOL_SIZE,
 				g2d->cmdlist_pool_virt,
 				g2d->cmdlist_pool, g2d->cmdlist_dma_attrs);
@@ -397,7 +398,7 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
 		return;
 
 out:
-	dma_unmap_sgtable(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
+	dma_unmap_sgtable(drm_dev_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
 			  DMA_BIDIRECTIONAL, 0);
 
 	unpin_user_pages_dirty_lock(g2d_userptr->pages, g2d_userptr->npages,
@@ -506,7 +507,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 
 	g2d_userptr->sgt = sgt;
 
-	ret = dma_map_sgtable(to_dma_dev(g2d->drm_dev), sgt,
+	ret = dma_map_sgtable(drm_dev_dma_dev(g2d->drm_dev), sgt,
 			      DMA_BIDIRECTIONAL, 0);
 	if (ret) {
 		DRM_DEV_ERROR(g2d->dev, "failed to map sgt with dma region.\n");
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 59fd736a1fb9..9ec76163609f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -10,6 +10,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/module.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
@@ -29,7 +30,7 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 	unsigned long attr = 0;
 
 	if (exynos_gem->dma_addr) {
-		DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "already allocated.\n");
+		DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "already allocated.\n");
 		return 0;
 	}
 
@@ -54,18 +55,18 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 		attr |= DMA_ATTR_NO_KERNEL_MAPPING;
 
 	exynos_gem->dma_attrs = attr;
-	exynos_gem->cookie = dma_alloc_attrs(to_dma_dev(dev), exynos_gem->size,
+	exynos_gem->cookie = dma_alloc_attrs(drm_dev_dma_dev(dev), exynos_gem->size,
 					     &exynos_gem->dma_addr, GFP_KERNEL,
 					     exynos_gem->dma_attrs);
 	if (!exynos_gem->cookie) {
-		DRM_DEV_ERROR(to_dma_dev(dev), "failed to allocate buffer.\n");
+		DRM_DEV_ERROR(drm_dev_dma_dev(dev), "failed to allocate buffer.\n");
 		return -ENOMEM;
 	}
 
 	if (kvmap)
 		exynos_gem->kvaddr = exynos_gem->cookie;
 
-	DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
 			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
 	return 0;
 }
@@ -82,7 +83,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
 			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
 
-	dma_free_attrs(to_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
+	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
 			(dma_addr_t)exynos_gem->dma_addr,
 			exynos_gem->dma_attrs);
 }
@@ -101,7 +102,7 @@ static int exynos_drm_gem_handle_create(struct drm_gem_object *obj,
 	if (ret)
 		return ret;
 
-	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "gem handle = 0x%x\n", *handle);
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(obj->dev), "gem handle = 0x%x\n", *handle);
 
 	/* drop reference from allocate - handle holds it now. */
 	drm_gem_object_put(obj);
@@ -113,7 +114,7 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem)
 {
 	struct drm_gem_object *obj = &exynos_gem->base;
 
-	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "handle count = %d\n",
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(obj->dev), "handle count = %d\n",
 			  obj->handle_count);
 
 	/*
@@ -289,7 +290,7 @@ static int exynos_drm_gem_mmap_buffer(struct exynos_drm_gem *exynos_gem,
 	if (vm_size > exynos_gem->size)
 		return -EINVAL;
 
-	ret = dma_mmap_attrs(to_dma_dev(drm_dev), vma, exynos_gem->cookie,
+	ret = dma_mmap_attrs(drm_dev_dma_dev(drm_dev), vma, exynos_gem->cookie,
 			     exynos_gem->dma_addr, exynos_gem->size,
 			     exynos_gem->dma_attrs);
 	if (ret < 0) {
@@ -372,7 +373,7 @@ static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct
 
 	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
 
-	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "flags = 0x%x\n",
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(obj->dev), "flags = 0x%x\n",
 			  exynos_gem->flags);
 
 	/* non-cachable as default. */
@@ -398,12 +399,6 @@ static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct
 }
 
 /* low-level interface prime helpers */
-struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
-					    struct dma_buf *dma_buf)
-{
-	return drm_gem_prime_import_dev(dev, dma_buf, to_dma_dev(dev));
-}
-
 struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
@@ -415,7 +410,7 @@ struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	ret = dma_get_sgtable_attrs(to_dma_dev(drm_dev), sgt, exynos_gem->cookie,
+	ret = dma_get_sgtable_attrs(drm_dev_dma_dev(drm_dev), sgt, exynos_gem->cookie,
 				    exynos_gem->dma_addr, exynos_gem->size,
 				    exynos_gem->dma_attrs);
 	if (ret) {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 8b5bd20ae8c1..b6785f1136ab 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -94,8 +94,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 			       struct drm_mode_create_dumb *args);
 
 /* low-level interface prime helpers */
-struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
-					    struct dma_buf *dma_buf);
 struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *
 exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
-- 
2.53.0.1018.g2bb0e51243-goog


