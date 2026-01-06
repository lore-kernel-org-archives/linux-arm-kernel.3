Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF13ECEFCE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86uD/TZTv84PLQ1XJXf+TfRW/ckjofOVWcN3ccYwmA0=; b=fQvbVbLSu3BmpwPELesjRuIpW2
	j9oi5vwFa7bic3eiayMGw0ClQFEZ740wSRe236otACFAi0i5Hdi5O8S/B67O0oh4Cv4Zr+DTV7L5V
	v3R6rwHxLYs1hYvuzQtFv1PT1G4GOob99/u5WhqG04+yX2ZArQv7NplxvoWgMEThvuRf29D6h1YSC
	qPLRz7hylDGwQe+C0COCkgcjeQu6D5cNjAC89gQKbqnCVsp6Dh/j3aIzTgJm8ZENpK/CN72pWR4v4
	KbZuHIrtjCapQ3oJg2ldKj1dmDLh6AJRt/iph/q3WUhYd737Ftz/kZ/gwCv5qAU2w/bBUZ3gTu4aZ
	sJ/Gm1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6W-0000000DbsR-04P4;
	Tue, 06 Jan 2026 17:44:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6Q-0000000DbkW-2nVn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:44:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 17C05C1E4B2;
	Tue,  6 Jan 2026 17:43:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2560860739;
	Tue,  6 Jan 2026 17:44:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9A8B103C85D5;
	Tue,  6 Jan 2026 18:44:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=86uD/TZTv84PLQ1XJXf+TfRW/ckjofOVWcN3ccYwmA0=;
	b=Sj0NKrJvhaZYV9X5VMCGDcjShsVZmfHBzq1KlV+3ytKBwPWxvihWkXrcl3SkFoy6hcXrw7
	0Adqcm5fhDWiNqrCkqgxaGtqOHDZAsr6Jnhzw7TIWOF8kBI4Jz56Ga3Z7cQAJmPR5matMc
	E5AKWaObk0abHVda4Jb1P2Tt2pFVtX2QG/RQEbnNHsagfPviukQZ8khJy3sorKcfpTnP5i
	rpzSV7s8tBNrwz605XVFcWq5FFe/rEmA3JnzKKsxw6MI+fYi0Fwj9Hj1PQ4hDu9xr+e1iD
	D6GPchd54a1+XLimFAYM+xcrTSjroc24eKKPHXD5VvS594XhZw7EHY89yc1H3g==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:31 +0100
Subject: [PATCH v3 15/22] drm/tilcdc: Move tilcdc_init/fini closer to
 probe/remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-15-9bad0f742164@bootlin.com>
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
X-CRM114-CacheID: sfid-20260106_094419_105499_2FF658DF 
X-CRM114-Status: GOOD (  20.01  )
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

Move tilcdc_init/fini functions adjacent to the probe and remove functions
in preparation for cleanup and modernization. This improves readability
for subsequent commits that will refactor these functions.

No functional changes, only code reorganization.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v3:
- New patch.
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 238 ++++++++++++++++++------------------
 1 file changed, 119 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index a82a2494e23d9..c306fc3ae2784 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -140,6 +140,125 @@ static void tilcdc_irq_uninstall(struct drm_device *dev)
  * DRM operations:
  */
 
+#if defined(CONFIG_DEBUG_FS)
+static const struct {
+	const char *name;
+	uint8_t  rev;
+	uint8_t  save;
+	uint32_t reg;
+} registers[] =		{
+#define REG(rev, save, reg) { #reg, rev, save, reg }
+		/* exists in revision 1: */
+		REG(1, false, LCDC_PID_REG),
+		REG(1, true,  LCDC_CTRL_REG),
+		REG(1, false, LCDC_STAT_REG),
+		REG(1, true,  LCDC_RASTER_CTRL_REG),
+		REG(1, true,  LCDC_RASTER_TIMING_0_REG),
+		REG(1, true,  LCDC_RASTER_TIMING_1_REG),
+		REG(1, true,  LCDC_RASTER_TIMING_2_REG),
+		REG(1, true,  LCDC_DMA_CTRL_REG),
+		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_0_REG),
+		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_0_REG),
+		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_1_REG),
+		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_1_REG),
+		/* new in revision 2: */
+		REG(2, false, LCDC_RAW_STAT_REG),
+		REG(2, false, LCDC_MASKED_STAT_REG),
+		REG(2, true, LCDC_INT_ENABLE_SET_REG),
+		REG(2, false, LCDC_INT_ENABLE_CLR_REG),
+		REG(2, false, LCDC_END_OF_INT_IND_REG),
+		REG(2, true,  LCDC_CLK_ENABLE_REG),
+#undef REG
+};
+
+static int tilcdc_regs_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct tilcdc_drm_private *priv = dev->dev_private;
+	unsigned i;
+
+	pm_runtime_get_sync(dev->dev);
+
+	seq_printf(m, "revision: %d\n", priv->rev);
+
+	for (i = 0; i < ARRAY_SIZE(registers); i++)
+		if (priv->rev >= registers[i].rev)
+			seq_printf(m, "%s:\t %08x\n", registers[i].name,
+					tilcdc_read(dev, registers[i].reg));
+
+	pm_runtime_put_sync(dev->dev);
+
+	return 0;
+}
+
+static int tilcdc_mm_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
+	return 0;
+}
+
+static struct drm_info_list tilcdc_debugfs_list[] = {
+		{ "regs", tilcdc_regs_show, 0, NULL },
+		{ "mm",   tilcdc_mm_show,   0, NULL },
+};
+
+static void tilcdc_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(tilcdc_debugfs_list,
+				 ARRAY_SIZE(tilcdc_debugfs_list),
+				 minor->debugfs_root, minor);
+}
+#endif
+
+DEFINE_DRM_GEM_DMA_FOPS(fops);
+
+static const struct drm_driver tilcdc_driver = {
+	.driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	DRM_GEM_DMA_DRIVER_OPS,
+	DRM_FBDEV_DMA_DRIVER_OPS,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init       = tilcdc_debugfs_init,
+#endif
+	.fops               = &fops,
+	.name               = "tilcdc",
+	.desc               = "TI LCD Controller DRM",
+	.major              = 1,
+	.minor              = 0,
+};
+
+/*
+ * Power management:
+ */
+
+static int tilcdc_pm_suspend(struct device *dev)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	int ret = 0;
+
+	ret = drm_mode_config_helper_suspend(ddev);
+
+	/* Select sleep pin state */
+	pinctrl_pm_select_sleep_state(dev);
+
+	return ret;
+}
+
+static int tilcdc_pm_resume(struct device *dev)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+
+	/* Select default pin state */
+	pinctrl_pm_select_default_state(dev);
+	return  drm_mode_config_helper_resume(ddev);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(tilcdc_pm_ops,
+				tilcdc_pm_suspend, tilcdc_pm_resume);
+
 static void tilcdc_fini(struct drm_device *dev)
 {
 	struct tilcdc_drm_private *priv = dev->dev_private;
@@ -384,125 +503,6 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	return ret;
 }
 
-#if defined(CONFIG_DEBUG_FS)
-static const struct {
-	const char *name;
-	uint8_t  rev;
-	uint8_t  save;
-	uint32_t reg;
-} registers[] =		{
-#define REG(rev, save, reg) { #reg, rev, save, reg }
-		/* exists in revision 1: */
-		REG(1, false, LCDC_PID_REG),
-		REG(1, true,  LCDC_CTRL_REG),
-		REG(1, false, LCDC_STAT_REG),
-		REG(1, true,  LCDC_RASTER_CTRL_REG),
-		REG(1, true,  LCDC_RASTER_TIMING_0_REG),
-		REG(1, true,  LCDC_RASTER_TIMING_1_REG),
-		REG(1, true,  LCDC_RASTER_TIMING_2_REG),
-		REG(1, true,  LCDC_DMA_CTRL_REG),
-		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_0_REG),
-		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_0_REG),
-		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_1_REG),
-		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_1_REG),
-		/* new in revision 2: */
-		REG(2, false, LCDC_RAW_STAT_REG),
-		REG(2, false, LCDC_MASKED_STAT_REG),
-		REG(2, true, LCDC_INT_ENABLE_SET_REG),
-		REG(2, false, LCDC_INT_ENABLE_CLR_REG),
-		REG(2, false, LCDC_END_OF_INT_IND_REG),
-		REG(2, true,  LCDC_CLK_ENABLE_REG),
-#undef REG
-};
-
-static int tilcdc_regs_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
-	unsigned i;
-
-	pm_runtime_get_sync(dev->dev);
-
-	seq_printf(m, "revision: %d\n", priv->rev);
-
-	for (i = 0; i < ARRAY_SIZE(registers); i++)
-		if (priv->rev >= registers[i].rev)
-			seq_printf(m, "%s:\t %08x\n", registers[i].name,
-					tilcdc_read(dev, registers[i].reg));
-
-	pm_runtime_put_sync(dev->dev);
-
-	return 0;
-}
-
-static int tilcdc_mm_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct drm_printer p = drm_seq_file_printer(m);
-	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
-	return 0;
-}
-
-static struct drm_info_list tilcdc_debugfs_list[] = {
-		{ "regs", tilcdc_regs_show, 0, NULL },
-		{ "mm",   tilcdc_mm_show,   0, NULL },
-};
-
-static void tilcdc_debugfs_init(struct drm_minor *minor)
-{
-	drm_debugfs_create_files(tilcdc_debugfs_list,
-				 ARRAY_SIZE(tilcdc_debugfs_list),
-				 minor->debugfs_root, minor);
-}
-#endif
-
-DEFINE_DRM_GEM_DMA_FOPS(fops);
-
-static const struct drm_driver tilcdc_driver = {
-	.driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	DRM_GEM_DMA_DRIVER_OPS,
-	DRM_FBDEV_DMA_DRIVER_OPS,
-#ifdef CONFIG_DEBUG_FS
-	.debugfs_init       = tilcdc_debugfs_init,
-#endif
-	.fops               = &fops,
-	.name               = "tilcdc",
-	.desc               = "TI LCD Controller DRM",
-	.major              = 1,
-	.minor              = 0,
-};
-
-/*
- * Power management:
- */
-
-static int tilcdc_pm_suspend(struct device *dev)
-{
-	struct drm_device *ddev = dev_get_drvdata(dev);
-	int ret = 0;
-
-	ret = drm_mode_config_helper_suspend(ddev);
-
-	/* Select sleep pin state */
-	pinctrl_pm_select_sleep_state(dev);
-
-	return ret;
-}
-
-static int tilcdc_pm_resume(struct device *dev)
-{
-	struct drm_device *ddev = dev_get_drvdata(dev);
-
-	/* Select default pin state */
-	pinctrl_pm_select_default_state(dev);
-	return  drm_mode_config_helper_resume(ddev);
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(tilcdc_pm_ops,
-				tilcdc_pm_suspend, tilcdc_pm_resume);
-
 static int tilcdc_pdev_probe(struct platform_device *pdev)
 {
 	/* bail out early if no DT data: */

-- 
2.43.0


