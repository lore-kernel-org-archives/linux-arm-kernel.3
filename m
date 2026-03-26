Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA15D106F311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sqa1QRax78p6uiplIT8BF/VoDghK3e5D0/5tQD3aqOM=; b=Rn2RyuDOWTlOoeyGSmBtdhvXNW
	j/eo4vVltiNw8CIlnJ5a1kRqPNMZT8nHFBXrDxmLFhO2QQZlAwacZHul9JSmLKLLdnIbWOY/0sBsE
	7dmmHlG7eCNUtw4Blz3HMolX+t86dMjvWtQGt+Drv41OZ3kHSe40dCkS4Z7ahKifj7mUBG3Qy7XTj
	tB3pyd1s4ISme9CJH10LoFnvAOlRnsDAFpeGiB/2QN5WAzVT8CA3JiJAFEi1xHKPQT9MyjKkHu2+6
	Frv2R1smXN8DG+V52ikYGZDIq8oNFhCGloInodi/An3n8UWoaujtip+wP6OABI8FvGYQEyov+4XH3
	ZE8iLhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hZ5-00000005E3J-2bpQ;
	Thu, 26 Mar 2026 10:03:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hYY-00000005Dlb-3Kul
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 10:03:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b07069e2efso4648695ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774519394; x=1775124194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sqa1QRax78p6uiplIT8BF/VoDghK3e5D0/5tQD3aqOM=;
        b=SzJ04JcHbPpOEP8/XqNyHvotNRX6pqngomEBNB29GsuLWKvrfg3VpAtjRbgsu94X0F
         PBIX2qaHjtTSOcxknf/8mlCVtdRqCNwveDBUABL2HoaYUCoe40yuQKVbsUe3h/Y1mViJ
         gnArewzWS4kFDt3tPITcEw2MgezzS0E626QCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519394; x=1775124194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sqa1QRax78p6uiplIT8BF/VoDghK3e5D0/5tQD3aqOM=;
        b=HyDDLUaMcUEFOnFHNZzCx8yLMz/DLgrT5pi9yDi+0svfnTtLY8SLjeSr3ra8n7ONzc
         7Brq1S/xCjTQSRcyoUMyV/Yyg0I/9ot0wl0k+thUxKOR9I9XOH0RhmoSNm4Vk5LLrjUr
         lEaJ39uOAmxNJLErROfMzC1Pw6VuQhy2RwQD7IvawSIjt1DOk6ppk1qgdq8QkoEjJbKI
         SOgQXaQPeOkoyEXZJwDchM6g3cQBFpwJLsAeX6Al91PMGJ0282XAzodi1Q78ipeGdrg1
         9wE+eGq9asFMuZDY+ziUZ5BhDzzhFy+2LQL3lJG3l3Lbvj8I8A65h/9dANCju79uAsI2
         sUkg==
X-Forwarded-Encrypted: i=1; AJvYcCVUSOMUa4CRf1Dpc6dJu1MuTBseoY8LdmlARTWk+/3z2skiAWD0XFctp5DPkfqsOMYrnZa44tc3RVILj3NqHjfx@lists.infradead.org
X-Gm-Message-State: AOJu0YxhiSsA7hQj7gObpUKqONy5boDyDOMd6qgVMLpjZXsW7W4OoNEJ
	h6kpk0EUGKBP18fRWYq7kt/v78n20tOjLxY+JmbMOt/lvUoOqN0VTp6FD2xXn1X3iA==
X-Gm-Gg: ATEYQzxLyv+k5G1UJE8oMdNduCJ5eX8UcEeSVR7nD1euPfD7IhBM5SiBZdSJfwIGw5E
	VrakdzVnqqJmYGu8X9DoP4C2Gq3taS36YGjVKsTIMEmzsyoMaZH4w2l/ywGA4W1HXu82uiGFFsl
	0QwInbxrQOdmLFdZzX4digLxVOuyI/tBmXJTxXVBeAvjTURH3Ri9xTSdaSeTuJ+MBBQGJxUBGX6
	qYhiC2ikHb+PZE9y4Wl5xLnx0KwpjhNAt5oPURyFT9dAbI5N84cAGEA1C9aE8fLkv20S6WbbawK
	ABZ/Hpwr0DgYAfR3QpvFm9YnYj5FLES7iluDGOEbtk1/z6iE80f0oEGo1V7hfM2V2t6SMj1FPoW
	2f9eWeqNv43QaJl05MxyBF1APWuz81yOjR2Zx1oozaJHdlIaZtzX4o1DVJoQNfZiu8muzG8PAVu
	3SHCTe6OfxawQyBx35Zb3aigXNkCH9ipSXhg0VuE6AdrKbEIsH/oBUMiDW0NfoPNEqO5BeIKP36
	EWZI9Va
X-Received: by 2002:a17:903:2352:b0:2b0:66bc:2282 with SMTP id d9443c01a7336-2b0b0986e43mr73995145ad.6.1774519394114;
        Thu, 26 Mar 2026 03:03:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7c2942sm23339435ad.36.2026.03.26.03.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:03:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 3/3] drm/gem-dma: Support DRM_MODE_DUMB_KERNEL_MAP flag
Date: Thu, 26 Mar 2026 18:01:45 +0800
Message-ID: <20260326100248.1171828-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326100248.1171828-1-wenst@chromium.org>
References: <20260326100248.1171828-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030317_185328_8B8E8A48 
X-CRM114-Status: GOOD (  23.37  )
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

From: Rob Herring <robh@kernel.org>

Add support in DMA helpers to handle callers specifying
DRM_MODE_DUMB_KERNEL_MAP flag. Existing behavior is maintained with this
change. drm_gem_dma_dumb_create() always creates a kernel mapping as
before. drm_gem_dma_dumb_create_internal() lets the caller set the flags
as desired.

drm_gem_dma_dumb_create_internal() users have DRM_MODE_DUMB_KERNEL_MAP
added to preserve existing behavior.

A dumb buffer allocated from these devices can be shared (exported) to
another device. The consuming device may require the kernel mapping to
scan out the buffer to its own display. Such devices include DisplayLink
and various MIPI DBI based displays. Therefore altering the behavior
should be given much consideration.

Signed-off-by: Rob Herring <robh@kernel.org>
[wenst@chromium.org: Rebase onto renamed GEM DMA helpers]
[wenst@chromium.org: show "vaddr=(no mapping)" in drm_gem_dma_print_info()]
[wenst@chromium.org: Add DRM_MODE_DUMB_KERNEL_MAP to new drivers]
[wenst@chromium.org: Add flags field to drm_gem_dma_create_with_handle()
		     kerneldoc]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Added back DRM_MODE_DUMB_KERNEL_MAP flag to all drivers calling
  drm_gem_dma_dumb_create_internal()
- Expanded commit message to cover display drivers needing the kernel
  mapping to do scan out

Changes since v1:
- Rebased onto renamed GEM DMA helpers
- Added check in drm_fb_dma_get_scanout_buffer() and drm_gem_dma_vmap().
- Made drm_gem_dma_print_info() show "vaddr=(no mapping)" for objects
  allocated without kernel mapping
- Dropped existing DRM_MODE_DUMB_KERNEL_MAP flag addition in various
  drivers
- Added DRM_MODE_DUMB_KERNEL_MAP flag to adp_drm_gem_dumb_create()
- Added flags field kerneldoc for drm_gem_dma_create_with_handle()

Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Janne Grunau <j@jannau.net>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/adp/adp_drv.c                 |  1 +
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  1 +
 drivers/gpu/drm/arm/malidp_drv.c              |  1 +
 drivers/gpu/drm/drm_fb_dma_helper.c           |  4 ++
 drivers/gpu/drm/drm_gem_dma_helper.c          | 67 ++++++++++++-------
 drivers/gpu/drm/logicvc/logicvc_drm.c         |  1 +
 drivers/gpu/drm/meson/meson_drv.c             |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  1 +
 drivers/gpu/drm/stm/drv.c                     |  3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  1 +
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +
 drivers/gpu/drm/verisilicon/vs_drm.c          |  2 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |  2 +
 14 files changed, 63 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 4554cf75565e..c549b44b3814 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -95,6 +95,7 @@ static int adp_drm_gem_dumb_create(struct drm_file *file_priv,
 {
 	args->height = ALIGN(args->height, 64);
 	args->size = args->pitch * args->height;
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 
 	return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
 }
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 6ed504099188..2c096ebaea33 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -29,6 +29,7 @@ static int komeda_gem_dma_dumb_create(struct drm_file *file,
 	struct komeda_dev *mdev = dev->dev_private;
 	u32 pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 	args->pitch = ALIGN(pitch, mdev->chip.bus_width);
 
 	return drm_gem_dma_dumb_create_internal(file, dev, args);
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index b765f6c9eea4..5519f48a27c0 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -464,6 +464,7 @@ static int malidp_dumb_create(struct drm_file *file_priv,
 	/* allocate for the worst case scenario, i.e. rotated buffers */
 	u8 alignment = malidp_hw_get_pitch_align(malidp->dev, 1);
 
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), alignment);
 
 	return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index fd71969d2fb1..12a44accc48c 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -187,6 +187,10 @@ int drm_fb_dma_get_scanout_buffer(struct drm_plane *plane,
 	if (!dma_obj->vaddr)
 		return -ENODEV;
 
+	/* Buffer was allocated with NO_KERNEL_MAPPING */
+	if (dma_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
+		return -ENODEV;
+
 	iosys_map_set_vaddr(&sb->map[0], dma_obj->vaddr);
 	sb->format = fb->format;
 	sb->height = fb->height;
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 9722c9fc86f3..281fb563f061 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -116,26 +116,8 @@ __drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
 	return ERR_PTR(ret);
 }
 
-/**
- * drm_gem_dma_create - allocate an object with the given size
- * @drm: DRM device
- * @size: size of the object to allocate
- *
- * This function creates a DMA GEM object and allocates memory as backing store.
- * The allocated memory will occupy a contiguous chunk of bus address space.
- *
- * For devices that are directly connected to the memory bus then the allocated
- * memory will be physically contiguous. For devices that access through an
- * IOMMU, then the allocated memory is not expected to be physically contiguous
- * because having contiguous IOVAs is sufficient to meet a devices DMA
- * requirements.
- *
- * Returns:
- * A struct drm_gem_dma_object * on success or an ERR_PTR()-encoded negative
- * error code on failure.
- */
-struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
-					      size_t size)
+static struct drm_gem_dma_object *
+drm_gem_dma_create_flags(struct drm_device *drm, size_t size, u32 flags)
 {
 	struct drm_gem_dma_object *dma_obj;
 	int ret;
@@ -146,6 +128,9 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 	if (IS_ERR(dma_obj))
 		return dma_obj;
 
+	if (!(flags & DRM_MODE_DUMB_KERNEL_MAP))
+		dma_obj->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
+
 	if (dma_obj->map_noncoherent) {
 		dma_obj->vaddr = dma_alloc_noncoherent(drm_dev_dma_dev(drm),
 						       size,
@@ -171,6 +156,30 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 	drm_gem_object_put(&dma_obj->base);
 	return ERR_PTR(ret);
 }
+
+/**
+ * drm_gem_dma_create - allocate an object with the given size
+ * @drm: DRM device
+ * @size: size of the object to allocate
+ *
+ * This function creates a DMA GEM object and allocates memory as backing store.
+ * The allocated memory will occupy a contiguous chunk of bus address space.
+ *
+ * For devices that are directly connected to the memory bus then the allocated
+ * memory will be physically contiguous. For devices that access through an
+ * IOMMU, then the allocated memory is not expected to be physically contiguous
+ * because having contiguous IOVAs is sufficient to meet a devices DMA
+ * requirements.
+ *
+ * Returns:
+ * A struct drm_gem_dma_object * on success or an ERR_PTR()-encoded negative
+ * error code on failure.
+ */
+struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
+					      size_t size)
+{
+	return drm_gem_dma_create_flags(drm, size, DRM_MODE_DUMB_KERNEL_MAP);
+}
 EXPORT_SYMBOL_GPL(drm_gem_dma_create);
 
 /**
@@ -179,6 +188,7 @@ EXPORT_SYMBOL_GPL(drm_gem_dma_create);
  * @file_priv: DRM file-private structure to register the handle for
  * @drm: DRM device
  * @size: size of the object to allocate
+ * @flags: DRM_MODE_DUMB_* flags if any
  * @handle: return location for the GEM handle
  *
  * This function creates a DMA GEM object, allocating a chunk of memory as
@@ -194,14 +204,14 @@ EXPORT_SYMBOL_GPL(drm_gem_dma_create);
  */
 static struct drm_gem_dma_object *
 drm_gem_dma_create_with_handle(struct drm_file *file_priv,
-			       struct drm_device *drm, size_t size,
+			       struct drm_device *drm, size_t size, u32 flags,
 			       uint32_t *handle)
 {
 	struct drm_gem_dma_object *dma_obj;
 	struct drm_gem_object *gem_obj;
 	int ret;
 
-	dma_obj = drm_gem_dma_create(drm, size);
+	dma_obj = drm_gem_dma_create_flags(drm, size, DRM_MODE_DUMB_KERNEL_MAP);
 	if (IS_ERR(dma_obj))
 		return dma_obj;
 
@@ -283,7 +293,7 @@ int drm_gem_dma_dumb_create_internal(struct drm_file *file_priv,
 		args->size = args->pitch * args->height;
 
 	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
-						 &args->handle);
+						 args->flags, &args->handle);
 	return PTR_ERR_OR_ZERO(dma_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gem_dma_dumb_create_internal);
@@ -313,12 +323,13 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
 	struct drm_gem_dma_object *dma_obj;
 	int ret;
 
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 	ret = drm_mode_size_dumb(drm, args, 0, 0);
 	if (ret)
 		return ret;
 
 	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
-						 &args->handle);
+						 args->flags, &args->handle);
 	return PTR_ERR_OR_ZERO(dma_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gem_dma_dumb_create);
@@ -412,7 +423,10 @@ void drm_gem_dma_print_info(const struct drm_gem_dma_object *dma_obj,
 			    struct drm_printer *p, unsigned int indent)
 {
 	drm_printf_indent(p, indent, "dma_addr=%pad\n", &dma_obj->dma_addr);
-	drm_printf_indent(p, indent, "vaddr=%p\n", dma_obj->vaddr);
+	if (dma_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
+		drm_printf_indent(p, indent, "vaddr=(no mapping)\n");
+	else
+		drm_printf_indent(p, indent, "vaddr=%p\n", dma_obj->vaddr);
 }
 EXPORT_SYMBOL(drm_gem_dma_print_info);
 
@@ -511,6 +525,9 @@ EXPORT_SYMBOL_GPL(drm_gem_dma_prime_import_sg_table);
 int drm_gem_dma_vmap(struct drm_gem_dma_object *dma_obj,
 		     struct iosys_map *map)
 {
+	if (dma_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
+		return -ENOMEM;
+
 	iosys_map_set_vaddr(map, dma_obj->vaddr);
 
 	return 0;
diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index bbebf4fc7f51..595a71163cb5 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -39,6 +39,7 @@ static int logicvc_drm_gem_dma_dumb_create(struct drm_file *file_priv,
 {
 	struct logicvc_drm *logicvc = logicvc_drm(drm_dev);
 
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 	/* Stride is always fixed to its configuration value. */
 	args->pitch = logicvc->config.row_stride * DIV_ROUND_UP(args->bpp, 8);
 
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16d3..9fa339d6e273 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -83,6 +83,7 @@ static irqreturn_t meson_irq(int irq, void *arg)
 static int meson_dumb_create(struct drm_file *file, struct drm_device *dev,
 			     struct drm_mode_create_dumb *args)
 {
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 	/*
 	 * We need 64bytes aligned stride, and PAGE aligned size
 	 */
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 60e6f43b8ab2..611fe3d4a4d8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -424,6 +424,8 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
+
 	return drm_gem_dma_dumb_create_internal(file, dev, args);
 }
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 87f171145a23..359f85bd84eb 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -184,6 +184,7 @@ int rzg2l_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 	unsigned int align = 16 * args->bpp / 8;
 
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 	args->pitch = roundup(min_pitch, align);
 
 	return drm_gem_dma_dumb_create_internal(file, dev, args);
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 56d53ac3082d..a0bc2e215adb 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -51,8 +51,9 @@ static int stm_gem_dma_dumb_create(struct drm_file *file,
 	 * in order to optimize data transfer, pitch is aligned on
 	 * 128 bytes, height is aligned on 4 bytes
 	 */
-	args->pitch = roundup(min_pitch, 128);
 	args->height = roundup(args->height, 4);
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
+	args->pitch = roundup(min_pitch, 128);
 
 	return drm_gem_dma_dumb_create_internal(file, dev, args);
 }
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 8a409eee1dca..d3ff53ce2450 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -36,6 +36,7 @@ static int drm_sun4i_gem_dumb_create(struct drm_file *file_priv,
 				     struct drm_device *drm,
 				     struct drm_mode_create_dumb *args)
 {
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 	/* The hardware only allows even pitches for YUV buffers. */
 	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), 2);
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index a14ecb769461..7a04cf52f511 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -87,6 +87,8 @@ static int vc5_dumb_create(struct drm_file *file_priv,
 	if (ret)
 		return ret;
 
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
+
 	return drm_gem_dma_dumb_create_internal(file_priv, dev, args);
 }
 
diff --git a/drivers/gpu/drm/verisilicon/vs_drm.c b/drivers/gpu/drm/verisilicon/vs_drm.c
index fd259d53f49f..fe3591244d02 100644
--- a/drivers/gpu/drm/verisilicon/vs_drm.c
+++ b/drivers/gpu/drm/verisilicon/vs_drm.c
@@ -44,6 +44,8 @@ static int vs_gem_dumb_create(struct drm_file *file_priv,
 	if (ret)
 		return ret;
 
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
+
 	return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
 }
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 02f3a7d78cf8..aa3822b3cb08 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -371,6 +371,8 @@ static int zynqmp_dpsub_dumb_create(struct drm_file *file_priv,
 	if (ret)
 		return ret;
 
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
+
 	return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
 }
 
-- 
2.53.0.1018.g2bb0e51243-goog


