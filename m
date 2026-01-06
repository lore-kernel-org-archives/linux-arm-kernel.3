Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F16CEFCE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSAb30vPwta0L6j5mRlEyTeFIJd6lPuoibY+qgqO0Dk=; b=u7R0iSJMJH3hJ2e35oemAO4rcc
	E7RtIwlifb+R2AABXCDFXN06Y4wOqkpRTIWBs3CmbnYfUkbvWxvg65JiH03GwvICHu+61+pjYmjuz
	votp67r/slisrvMzfxHqy/qkpZU9xGfTi4eAgyBWyo3jvzF1NmoYcHMigxPO1ZOqRLZRc+veuCLBL
	jcTuxVp5FfbL1RH6Cp+bJ6jI2+uS5adRZvo2wm8T84uDa751Lxiep01IDyMYGcJCP1TdlML2dvuGW
	wDKrQ9rXtkncWZSMSUi4uOL+I2+AVdgzncCANdcJhZNGv0sVZDfKnMz/7ZrnaIj8qTGm3MU5MJT9O
	lyAb3DIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6M-0000000Dbgw-2qNI;
	Tue, 06 Jan 2026 17:44:14 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6I-0000000Dbat-3dgC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:44:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 20845C1E4B2;
	Tue,  6 Jan 2026 17:43:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3231460739;
	Tue,  6 Jan 2026 17:44:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1AFE103C81A7;
	Tue,  6 Jan 2026 18:44:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RSAb30vPwta0L6j5mRlEyTeFIJd6lPuoibY+qgqO0Dk=;
	b=218m2JFAFbKKWUlQUsn2Wm6w3yVK4viodOWXVZp2fFlwZ445/2JYDQ82c4nchEP1Wc7BEj
	KOwFsCAfbuLy3cfxgnPZWsaeGn5iU6kuZuZdSZzFqmbHUazQ/Jjb0faP+8EA2XXy54s5Lc
	aEQr0KVGF+jGmWVwWL3n61fKG5LyfTA/iOzDLdrYO6mmNQAbokLYsPopsmeHJ2UeOer3hx
	t5NnU4ggEPcb6O8N8a/p1s+sdfIvJ+2CG3BbFah4qebfqmxw30jOhbYJgI3mhtG2VFqa7y
	OZe6t4UTq383p1fVjwr9S80ZQlSHlfg104GcSYOlJ/da8CDiGeLs+zyhHNotuw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:29 +0100
Subject: [PATCH v3 13/22] drm/tilcdc: Remove the useless module list
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-13-9bad0f742164@bootlin.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
In-Reply-To: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
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
X-CRM114-CacheID: sfid-20260106_094411_439347_9203ABFE 
X-CRM114-Status: GOOD (  14.98  )
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
index 6a08f50762af9..34d0e81552912 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -7,7 +7,6 @@
 /* LCDC DRM driver, based on da8xx-fb */
 
 #include <linux/mod_devicetable.h>
-#include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -34,8 +33,6 @@ enum {
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
@@ -474,15 +451,9 @@ static struct drm_info_list tilcdc_debugfs_list[] = {
 
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


