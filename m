Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4257C982DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKMRSlk+kSO+I85v8aEyssRs5j3tcpi0RUOAjUjTJUw=; b=hfWqPN7FGjah/KI+TnNaxWNGq5
	kWIGYxShO05sTh+wce4gOQNWDiiOwRbVtPiWeCRxAzlwBd32yclIEvsVLFQRbEoruRe+gLlRLvj05
	AZefhiIi0eoUm5BIQix06xH0OLAHYHgdgRMmr8Vh9XyB1zuQ3KqZJztTqSL4SqWFliomX0qCmMo3C
	yDdpkdAMnMEoKH84YAhka4578aBW2noTJp8pIiBeFHtUR8oAS6TMJJ7GR7R/WFrkJ0IXFW9Sivfhu
	HI5Kf2T+9fH1PonrmL1ltPuhSzUCBjk6h1mhGsdte32WF7Gx70pzhoUz8RF/P/kgjVYWisVcrGmz1
	sbEfDXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnEL-0000000EWKI-0htL;
	Fri, 16 Jan 2026 17:03:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnEH-0000000EWFN-2XnH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:03:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1A0211A28D9;
	Fri, 16 Jan 2026 17:03:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC1AC606F9;
	Fri, 16 Jan 2026 17:03:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B631710B68CBA;
	Fri, 16 Jan 2026 18:03:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768582997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xKMRSlk+kSO+I85v8aEyssRs5j3tcpi0RUOAjUjTJUw=;
	b=JxZWnaR+TiqqE2+5REq3f0k8Jozy9UYa5fubLMUWJAi1lMo6s2f8SkxO2GD1L0hDYTylQl
	BTPg0eYounmB9sv4oXp662vTp4X9itiaaa7xlbd0GU7DUU0WH+pcZ89d+MKPDDfzRj8RJ4
	F/A+ROKmj+PyGxdfQRlvs9V3vW+mHdZ067SqHWiy7SGjXxWBHd8egvrWAKXtEcSjDpU6uF
	i912qzL7fPLuRcPHL2Bs4nPxjQBiqQBydXF0DSTFLFwrbAUDY1j7WN/Ye96duoSM4VGbl9
	VVleduW4CIhoWb0wmr3bghqQF8V1uLMNbIK7WjJCvdiHZ01UZLzNy4zribAoQw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:13 +0100
Subject: [PATCH v4 13/25] drm/tilcdc: Remove the useless module list
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-13-2c1c22143087@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_090321_931820_7EB4F848 
X-CRM114-Status: GOOD (  14.02  )
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

The tilcdc driver previously supported a sub-module system where
external display drivers (panels, encoders) could register themselves
through tilcdc_module_init() and be automatically initialized through
a module list. This infrastructure became unused after the component
framework support and panel driver was removed.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v3:
- Move the removal of module_init/exit in a following patch.
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 29 -----------------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h | 27 ---------------------------
 2 files changed, 56 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index d0503778b5f6f..20f93240b335c 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -7,7 +7,6 @@
 /* LCDC DRM driver, based on da8xx-fb */
 
 #include <linux/mod_devicetable.h>
-#include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -34,8 +33,6 @@ enum tilcdc_variant {
 	DA850_TILCDC,
 };
 
-static LIST_HEAD(module_list);
-
 static const u32 tilcdc_rev1_formats[] = { DRM_FORMAT_RGB565 };
 
 static const u32 tilcdc_straight_formats[] = { DRM_FORMAT_RGB565,
@@ -50,20 +47,6 @@ static const u32 tilcdc_legacy_formats[] = { DRM_FORMAT_RGB565,
 					     DRM_FORMAT_RGB888,
 					     DRM_FORMAT_XRGB8888 };
 
-void tilcdc_module_init(struct tilcdc_module *mod, const char *name,
-		const struct tilcdc_module_ops *funcs)
-{
-	mod->name = name;
-	mod->funcs = funcs;
-	INIT_LIST_HEAD(&mod->list);
-	list_add(&mod->list, &module_list);
-}
-
-void tilcdc_module_cleanup(struct tilcdc_module *mod)
-{
-	list_del(&mod->list);
-}
-
 static int tilcdc_atomic_check(struct drm_device *dev,
 			       struct drm_atomic_state *state)
 {
@@ -97,12 +80,6 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 static void modeset_init(struct drm_device *dev)
 {
 	struct tilcdc_drm_private *priv = dev->dev_private;
-	struct tilcdc_module *mod;
-
-	list_for_each_entry(mod, &module_list, list) {
-		DBG("loading module: %s", mod->name);
-		mod->funcs->modeset_init(mod, dev);
-	}
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
@@ -465,15 +442,9 @@ static struct drm_info_list tilcdc_debugfs_list[] = {
 
 static void tilcdc_debugfs_init(struct drm_minor *minor)
 {
-	struct tilcdc_module *mod;
-
 	drm_debugfs_create_files(tilcdc_debugfs_list,
 				 ARRAY_SIZE(tilcdc_debugfs_list),
 				 minor->debugfs_root, minor);
-
-	list_for_each_entry(mod, &module_list, list)
-		if (mod->funcs->debugfs_init)
-			mod->funcs->debugfs_init(mod, minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index dafb00908d1d4..60e85e29b1063 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -81,33 +81,6 @@ struct tilcdc_drm_private {
 	bool irq_enabled;
 };
 
-/* Sub-module for display.  Since we don't know at compile time what panels
- * or display adapter(s) might be present (for ex, off chip dvi/tfp410,
- * hdmi encoder, various lcd panels), the connector/encoder(s) are split into
- * separate drivers.  If they are probed and found to be present, they
- * register themselves with tilcdc_register_module().
- */
-struct tilcdc_module;
-
-struct tilcdc_module_ops {
-	/* create appropriate encoders/connectors: */
-	int (*modeset_init)(struct tilcdc_module *mod, struct drm_device *dev);
-#ifdef CONFIG_DEBUG_FS
-	/* create debugfs nodes (can be NULL): */
-	int (*debugfs_init)(struct tilcdc_module *mod, struct drm_minor *minor);
-#endif
-};
-
-struct tilcdc_module {
-	const char *name;
-	struct list_head list;
-	const struct tilcdc_module_ops *funcs;
-};
-
-void tilcdc_module_init(struct tilcdc_module *mod, const char *name,
-		const struct tilcdc_module_ops *funcs);
-void tilcdc_module_cleanup(struct tilcdc_module *mod);
-
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
 int tilcdc_crtc_create(struct drm_device *dev);

-- 
2.43.0


