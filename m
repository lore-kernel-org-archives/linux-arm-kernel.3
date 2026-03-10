Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9894DFCC9AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhpK4GrpeMoLnC/DzcBviTqJRmg276GHAkV9Nol90pk=; b=jCczi7yi29J/EYeWjlfmm10eHy
	2RFa88OSqLDSaVOVcxgSMLNkC+dUIkzJHMqcwTSr41aXnOc1XU5u5PYIDAFHKQTWSLnhkUHIQ7YPq
	EJKoZL3TBJKF8ch5a3oXor8o4R9hnFwn9SxxXhsqmzZ2HyouFHWE90NsL6Rr+fSsuIIWXcohj0bCe
	KF36KcYlXlIITqBPnN6RkofiYn1zYSCz41Z8QZzTTcjWeWb9Gwf3fNN3+CcwOLSqL2FQHCibvn0Gh
	XewIGzTYeV5BmR2DRonLu8owzyk7CgO/MtNV0ta+rzZvdEysld4egxVzUhwjDpk4HWcVWE/y5dkqF
	d4W9/x/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznjP-00000008eOX-1fUK;
	Tue, 10 Mar 2026 03:26:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznjO-00000008eNY-1MPe
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Mar 2026 03:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DhpK4GrpeMoLnC/DzcBviTqJRmg276GHAkV9Nol90pk=; b=FV4r1fDO0/9pC/t3gb3NWiMReK
	nNhOvcwFpv2MYBOHOF2B2yXK+tlpyqy1qqOUOmSAN/xeVcfMTie2ltz1nahLgX93xJNaFuenMkn9T
	elMbHHqiCjsTLjPetVLAJysayHhBO5m0p68ItVQNxnV3+Z47Z7O0gBw9PjaEwj7x/7m4gzl4UQTv2
	q8ZfbliJrWvGHXmn4L47/CZ9W2nQUf9/MQ/9GXlFRdlIj8f+0cA3Z52vbsLK2UTbcfxovUQfPZXTp
	tUq6Wgp2zsTJMss4UX/Sc5oJvK6YSNcafBR3xJpJ/h0vzMb2NEUd6Ac4//srf3zUnAVzYrgqznHzs
	VICEpPWg==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznjK-0000000Dekt-19wP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:26:00 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c7393c6832bso1724953a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 20:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773113152; x=1773717952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhpK4GrpeMoLnC/DzcBviTqJRmg276GHAkV9Nol90pk=;
        b=iMPcP3CF9Bs7LdjWfG5aJ4dVx7EeE+DAW6FzsGOm0BNJXxT5rm3mERKEhlPqhTPiHy
         ABrwNn1eM3lrdD1Z3Ge+g1R0lLT75HRsTfpn7uSufhZlP7obMOVsO69Rpk8+AZeiRoJ8
         ZvHeWL1+rwByKgUCfU4R2plCpnp8dLlh0kP00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113152; x=1773717952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DhpK4GrpeMoLnC/DzcBviTqJRmg276GHAkV9Nol90pk=;
        b=ZRti8Kcz1AdgTKlJad7eLPcHiZ5KVhvmV/MSXSIdz7IXT0R3/M11m57b/tELgofm1M
         RPWGXCp/cqvMLDxoiVjwXfsalZlARw1iAY/Qg6jLtZ3Ym/82m0+ngGYnamkHBhIQuruC
         lUbKsNC3Pv6r+OWWBADpF3ZNc/Cq0BYnUxwgtBXVKOxf99nfjHGDJ6cwT5ioWQu7JvoT
         dcVots0QwqXHRTY+TnJREZGSJnqj5dXMVIK7w3vF+dyPymEzJrlcvEOLTx/A0EULf22K
         FmFAG33d5J9hmm+bXk4lt51xU0643R1bvislKmJSDj1AvzllmIQWpB2QTqwDYsopLy4R
         0Dbw==
X-Forwarded-Encrypted: i=1; AJvYcCUWqO0UNOEv90ecNzHAyMCX4fGxNqina5hO1i0uShRyctUGA7p+I/IIWdADmUNTj9FUNobFNnZU5Sm1prbukkEx@lists.infradead.org
X-Gm-Message-State: AOJu0YzzJwLci6q/ywaK9bVBfG1yhflm4bE/7ngBdUGN4BwS/v3ySJSU
	0A4xxJAQOO8zZuZZe5eSE+gPi73+5o94z3O/aT2oFBiP++7yh3MW+bsxWQkeA1yuvg==
X-Gm-Gg: ATEYQzwbF+an3g1bxkbqCaTpQHG7+sCBMCj1Ghq0syD6R3pAaDpbPRCdrYF3ieO5Hwh
	73Ercgtbg7ljStHp6BuPH3S3D2Gcsm/ZQoCWPr29zmxGfgtJKp221y1yB8kbojWimgjqQyS4cLT
	5V1imY3l0yvab9kA8sz+pbRL4IU1qwPC6EIN1S0+PxrS54GQDxd7QH62nc7HF/l9HG9hwY8rtd9
	xy+DBxiQqYtDlSxv5WnUaUosp8maxotdBJdPrCgPTTOh+vRxaWfJ6oJWWMFXMOhFVwJwU7cWTuW
	b3c7G0O3GA9zyhEIBatd9JgdWqNkQ1qa5q74+Ii1tKNOSiAXzd0OQwL53iSAFcy8pYoOFgN2et3
	E+9f9oFlJAjxih6QRmMUTxwd51dsxWQjFdxCPHV4cAiYoBtE5sghBrKRwRl1ssHg27ZlH7MaDGl
	v+8o7NC+Vup7QtKzAOcIwTwMXgF9sxzesnvBo4HFzdNnm9D4Mdpb6ckOLmtDm9ItlDHmUoRVnxz
	sfKZHJ5RIwgTdSHLiI=
X-Received: by 2002:a17:903:2308:b0:2ae:7ed6:7d15 with SMTP id d9443c01a7336-2ae824dd2camr135797415ad.28.1773113151793;
        Mon, 09 Mar 2026 20:25:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm126695095ad.5.2026.03.09.20.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:25:51 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 3/4] drm/mediatek: Set dedicated DMA device and drop custom GEM callbacks
Date: Tue, 10 Mar 2026 11:25:08 +0800
Message-ID: <20260310032511.2545500-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310032511.2545500-1-wenst@chromium.org>
References: <20260310032511.2545500-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_032558_504236_3A3D7046 
X-CRM114-Status: GOOD (  34.30  )
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

In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
drm_gem_dma_object, but custom callbacks were still needed to deal with
using the first device of the pipeline as the DMA device, instead of
the MMSYS device that the DRM driver binds to.

Turns out there is already partial support for dedicated DMA devices in
the DRM subsystem for PRIME imports. The preceding patches add support
for dedicated DMA devices to the GEM DMA helpers.

This allows us to just set the dedicated DMA device for the DRM device,
and drop all the custom GEM callbacks. Also drop the .dma_dev field
from the driver private data as it is no longer needed.

There are slight differences in the mmap helper: the VM_DONTDUMP and
VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj().
VM_IO probably doesn't make sense since the buffer is allocated using
dma_alloc_attrs().

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c    |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  21 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |   1 -
 drivers/gpu/drm/mediatek/mtk_gem.c     | 231 -------------------------
 drivers/gpu/drm/mediatek/mtk_gem.h     |  17 --
 5 files changed, 3 insertions(+), 268 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.h

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 351d58c50b84..fcb16f3f7b23 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -23,7 +23,6 @@
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_gem.h"
 #include "mtk_plane.h"
 
 /*
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a94c51a83261..6f6db2e1980e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -19,6 +19,7 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
@@ -29,7 +30,6 @@
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"
-#include "mtk_gem.h"
 
 #define DRIVER_NAME "mediatek"
 #define DRIVER_DESC "Mediatek SoC DRM"
@@ -565,8 +565,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		goto err_component_unbind;
 	}
 
-	for (i = 0; i < private->data->mmsys_dev_num; i++)
-		private->all_drm_private[i]->dma_dev = dma_dev;
+	drm_dev_set_dma_dev(drm, dma_dev);
 
 	/*
 	 * Configure the DMA segment size to make sure we get contiguous IOVA
@@ -600,26 +599,12 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 
 DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
 
-/*
- * We need to override this because the device used to import the memory is
- * not dev->dev, as drm_gem_prime_import() expects.
- */
-static struct drm_gem_object *mtk_gem_prime_import(struct drm_device *dev,
-						   struct dma_buf *dma_buf)
-{
-	struct mtk_drm_private *private = dev->dev_private;
-
-	return drm_gem_prime_import_dev(dev, dma_buf, private->dma_dev);
-}
-
 static const struct drm_driver mtk_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 
-	.dumb_create = mtk_gem_dumb_create,
+	DRM_GEM_DMA_DRIVER_OPS,
 	DRM_FBDEV_DMA_DRIVER_OPS,
 
-	.gem_prime_import = mtk_gem_prime_import,
-	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
 	.fops = &mtk_drm_fops,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 675cdc90a440..1fc3df4b5485 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -54,7 +54,6 @@ struct mtk_mmsys_driver_data {
 
 struct mtk_drm_private {
 	struct drm_device *drm;
-	struct device *dma_dev;
 	bool mtk_drm_bound;
 	bool drm_master;
 	struct device *dev;
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
deleted file mode 100644
index f059a1452220..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ /dev/null
@@ -1,231 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2015 MediaTek Inc.
- * Copyright (c) 2025 Collabora Ltd.
- *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
- */
-
-#include <linux/dma-buf.h>
-#include <linux/vmalloc.h>
-
-#include <drm/drm.h>
-#include <drm/drm_device.h>
-#include <drm/drm_gem.h>
-#include <drm/drm_gem_dma_helper.h>
-#include <drm/drm_prime.h>
-#include <drm/drm_print.h>
-
-#include "mtk_drm_drv.h"
-#include "mtk_gem.h"
-
-static int mtk_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
-
-static void mtk_gem_free_object(struct drm_gem_object *obj)
-{
-	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
-
-	if (dma_obj->sgt)
-		drm_prime_gem_destroy(obj, dma_obj->sgt);
-	else
-		dma_free_wc(priv->dma_dev, dma_obj->base.size,
-			    dma_obj->vaddr, dma_obj->dma_addr);
-
-	/* release file pointer to gem object. */
-	drm_gem_object_release(obj);
-
-	kfree(dma_obj);
-}
-
-/*
- * Allocate a sg_table for this GEM object.
- * Note: Both the table's contents, and the sg_table itself must be freed by
- *       the caller.
- * Returns a pointer to the newly allocated sg_table, or an ERR_PTR() error.
- */
-static struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj)
-{
-	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
-	struct sg_table *sgt;
-	int ret;
-
-	sgt = kzalloc_obj(*sgt);
-	if (!sgt)
-		return ERR_PTR(-ENOMEM);
-
-	ret = dma_get_sgtable(priv->dma_dev, sgt, dma_obj->vaddr,
-			      dma_obj->dma_addr, obj->size);
-	if (ret) {
-		DRM_ERROR("failed to allocate sgt, %d\n", ret);
-		kfree(sgt);
-		return ERR_PTR(ret);
-	}
-
-	return sgt;
-}
-
-static const struct drm_gem_object_funcs mtk_gem_object_funcs = {
-	.free = mtk_gem_free_object,
-	.print_info = drm_gem_dma_object_print_info,
-	.get_sg_table = mtk_gem_prime_get_sg_table,
-	.vmap = drm_gem_dma_object_vmap,
-	.mmap = mtk_gem_object_mmap,
-	.vm_ops = &drm_gem_dma_vm_ops,
-};
-
-static struct drm_gem_dma_object *mtk_gem_init(struct drm_device *dev,
-					unsigned long size, bool private)
-{
-	struct drm_gem_dma_object *dma_obj;
-	int ret;
-
-	size = round_up(size, PAGE_SIZE);
-
-	if (size == 0)
-		return ERR_PTR(-EINVAL);
-
-	dma_obj = kzalloc_obj(*dma_obj);
-	if (!dma_obj)
-		return ERR_PTR(-ENOMEM);
-
-	dma_obj->base.funcs = &mtk_gem_object_funcs;
-
-	if (private) {
-		ret = 0;
-		drm_gem_private_object_init(dev, &dma_obj->base, size);
-	} else {
-		ret = drm_gem_object_init(dev, &dma_obj->base, size);
-	}
-	if (ret) {
-		DRM_ERROR("failed to initialize gem object\n");
-		kfree(dma_obj);
-		return ERR_PTR(ret);
-	}
-
-	return dma_obj;
-}
-
-static struct drm_gem_dma_object *mtk_gem_create(struct drm_device *dev, size_t size)
-{
-	struct mtk_drm_private *priv = dev->dev_private;
-	struct drm_gem_dma_object *dma_obj;
-	struct drm_gem_object *obj;
-	int ret;
-
-	dma_obj = mtk_gem_init(dev, size, false);
-	if (IS_ERR(dma_obj))
-		return ERR_CAST(dma_obj);
-
-	obj = &dma_obj->base;
-
-	dma_obj->vaddr = dma_alloc_wc(priv->dma_dev, obj->size,
-				      &dma_obj->dma_addr,
-				      GFP_KERNEL | __GFP_NOWARN);
-	if (!dma_obj->vaddr) {
-		DRM_ERROR("failed to allocate %zx byte dma buffer", obj->size);
-		ret = -ENOMEM;
-		goto err_gem_free;
-	}
-
-	DRM_DEBUG_DRIVER("vaddr = %p dma_addr = %pad size = %zu\n",
-			 dma_obj->vaddr, &dma_obj->dma_addr,
-			 size);
-
-	return dma_obj;
-
-err_gem_free:
-	drm_gem_object_release(obj);
-	kfree(dma_obj);
-	return ERR_PTR(ret);
-}
-
-int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
-			struct drm_mode_create_dumb *args)
-{
-	struct drm_gem_dma_object *dma_obj;
-	int ret;
-
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-
-	/*
-	 * Multiply 2 variables of different types,
-	 * for example: args->size = args->spacing * args->height;
-	 * may cause coverity issue with unintentional overflow.
-	 */
-	args->size = args->pitch;
-	args->size *= args->height;
-
-	dma_obj = mtk_gem_create(dev, args->size);
-	if (IS_ERR(dma_obj))
-		return PTR_ERR(dma_obj);
-
-	/*
-	 * allocate a id of idr table where the obj is registered
-	 * and handle has the id what user can see.
-	 */
-	ret = drm_gem_handle_create(file_priv, &dma_obj->base, &args->handle);
-	if (ret)
-		goto err_handle_create;
-
-	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put(&dma_obj->base);
-
-	return 0;
-
-err_handle_create:
-	mtk_gem_free_object(&dma_obj->base);
-	return ret;
-}
-
-static int mtk_gem_object_mmap(struct drm_gem_object *obj,
-			       struct vm_area_struct *vma)
-
-{
-	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
-	int ret;
-
-	/*
-	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
-	 * whole buffer from the start.
-	 */
-	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
-
-	/*
-	 * dma_alloc_attrs() allocated a struct page table for mtk_gem, so clear
-	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
-	 */
-	vm_flags_mod(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
-
-	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
-	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
-
-	ret = dma_mmap_wc(priv->dma_dev, vma, dma_obj->vaddr,
-			  dma_obj->dma_addr, obj->size);
-	if (ret)
-		drm_gem_vm_close(vma);
-
-	return ret;
-}
-
-struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
-			struct dma_buf_attachment *attach, struct sg_table *sgt)
-{
-	struct drm_gem_dma_object *dma_obj;
-
-	/* check if the entries in the sg_table are contiguous */
-	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size) {
-		DRM_ERROR("sg_table is not contiguous");
-		return ERR_PTR(-EINVAL);
-	}
-
-	dma_obj = mtk_gem_init(dev, attach->dmabuf->size, true);
-	if (IS_ERR(dma_obj))
-		return ERR_CAST(dma_obj);
-
-	dma_obj->dma_addr = sg_dma_address(sgt->sgl);
-	dma_obj->sgt = sgt;
-
-	return &dma_obj->base;
-}
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.h b/drivers/gpu/drm/mediatek/mtk_gem.h
deleted file mode 100644
index afebc3a970a8..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_gem.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2015 MediaTek Inc.
- */
-
-#ifndef _MTK_GEM_H_
-#define _MTK_GEM_H_
-
-#include <drm/drm_gem.h>
-#include <drm/drm_gem_dma_helper.h>
-
-int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
-			struct drm_mode_create_dumb *args);
-struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
-			struct dma_buf_attachment *attach, struct sg_table *sg);
-
-#endif
-- 
2.53.0.473.g4a7958ca14-goog


