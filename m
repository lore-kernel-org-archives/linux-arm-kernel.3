Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EC0CEFCE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fps6g9LWWXg0MG7oGSOCMmVB+nQ8IBqq80KDII52FI=; b=kbhdTJ7PXigTrLEZcq3hiFTdDe
	5wJyAvqDhOfV7qhBD/ITrNdTJaFG20saLyY8b68VUBKTo2P70cMnOKErfsGq6iL38YMWs4hpkVij7
	4zuTWvRps+lO5qHfZ4Oz3cyOYB14EQNAyyDuRcmg7oTeVMwaMQWdmT8I/fpdpt+ZAJW9fBi0RAvoF
	tyKBXZKgZZ46Q8g7noqn68zWDowz1dU1ZtNFLZrCzImU9utwHsq9xf2Hr9vsXuaafMp6oitigmxJ1
	qXAxRpluMcyIxxUOjIimv1BmvJo+piks7igwfyfTPe9yP1YCMey06Ma1u+8+Dw25fqCSmz3WhmhCL
	nEjhIHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6o-0000000DcA7-0fSQ;
	Tue, 06 Jan 2026 17:44:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6j-0000000Dc6B-1gPV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 Jan 2026 17:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0fps6g9LWWXg0MG7oGSOCMmVB+nQ8IBqq80KDII52FI=; b=LTZw4o9FsPOhBoHPhvroWV/nUF
	8DejkWtNot3zLTBMWx3wdm2gfPJvjKphV4OffEnKnz21e/WE6tP96i1Mel2PxzJ06fIXq1SjOsfDN
	7ymGJSKWnkyKkd5ewIom4R3ufxc4a0rEibzUu8pjOJyzM7ZvkmWPyOA7e8s+E9sMKYm1VA/DB5fAm
	VyZNOTE3lMQUcMOZm7AUtnQmpnJM2UuvEhBZ276UO0mju4YPMTIl9JyE7z7mtRiBml0VYwfBZBkAD
	n2mzwxj1p7q8LY7hc3KwV8EkvLub2UoClkFZuWzCuCRE+BBM4hE2Ub1jlfob53t0towjDsE/WfLFk
	+18s3p/A==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6f-0000000A9Vr-231F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:44:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 352061A26A6;
	Tue,  6 Jan 2026 17:44:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09F3660739;
	Tue,  6 Jan 2026 17:44:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBC5E103C81A0;
	Tue,  6 Jan 2026 18:44:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0fps6g9LWWXg0MG7oGSOCMmVB+nQ8IBqq80KDII52FI=;
	b=T126NLxSBG2Ho4+5WWDGJplQWR+hecuZe4wmVNBRCZvT5trIvGn8cCqDTTzZpnuaBG7f6T
	b5KB2piI1EZZoEflA2k87Xy8q+2GbvbUz0Pora9GvNJnrSIzgImfUhaZ2u2NxF0opNvskC
	JNpkijj7YeTeLdC3pOjpH4XA8XyIt+Pwz0GAaKyS2EI5Z7EKgtH88jiocVHxusL75llnjG
	sjQWMqQIwP7v/FxVGLKQuvBHo2FYjipsZey+3ongOA3CCvgzrLTtCbERE+15V2P5U3QD7g
	HKlKrUgbDhSwS+5/b7n09kd/1SbizwmLG5uzN4ZbIsCPloNWjD3N9FPubt8R0w==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:33 +0100
Subject: [PATCH v3 17/22] drm/tilcdc: Remove the use of drm_device
 private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-17-9bad0f742164@bootlin.com>
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
X-CRM114-CacheID: sfid-20260106_174433_604674_7483E99D 
X-CRM114-Status: GOOD (  18.65  )
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

The DRM core documentation recommends against using dev_private:
"Instead of using this pointer it is recommended that drivers use
embed the struct &drm_device in their larger per-device structure."

This patch refactors the tilcdc driver to follow this recommendation
by embedding struct drm_device within struct tilcdc_drm_private and
replacing all dev->dev_private accesses with the ddev_to_tilcdc_priv()
helper macro that uses container_of().

This change aligns the driver with modern DRM best practices.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c    | 28 ++++++++++++++--------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h     |  2 ++
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c |  4 ++--
 drivers/gpu/drm/tilcdc/tilcdc_plane.c   |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h    |  8 ++++----
 5 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 5b8aba0765f9b..0bd99a2efeeb4 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -59,7 +59,7 @@ struct tilcdc_crtc {
 static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct drm_gem_dma_object *gem;
 	dma_addr_t start, end;
 	u64 dma_base_and_ceiling;
@@ -94,7 +94,7 @@ static void tilcdc_crtc_load_palette(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	int ret;
 
 	reinit_completion(&tilcdc_crtc->palette_loaded);
@@ -136,7 +136,7 @@ static void tilcdc_crtc_load_palette(struct drm_crtc *crtc)
 
 static void tilcdc_crtc_enable_irqs(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	tilcdc_clear_irqstatus(dev, 0xffffffff);
 
@@ -153,7 +153,7 @@ static void tilcdc_crtc_enable_irqs(struct drm_device *dev)
 
 static void tilcdc_crtc_disable_irqs(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	/* disable irqs that we might have enabled: */
 	if (priv->rev == 1) {
@@ -173,7 +173,7 @@ static void tilcdc_crtc_disable_irqs(struct drm_device *dev)
 static void reset(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	if (priv->rev != 2)
 		return;
@@ -198,7 +198,7 @@ static unsigned int tilcdc_pclk_diff(unsigned long rate,
 static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	unsigned long clk_rate, real_pclk_rate, pclk_rate;
 	unsigned int clkdiv;
@@ -270,7 +270,7 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	uint32_t reg, hbp, hfp, hsw, vbp, vfp, vsw;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct drm_framebuffer *fb = crtc->primary->state->fb;
@@ -557,7 +557,7 @@ static void tilcdc_crtc_recover_work(struct work_struct *work)
 
 void tilcdc_crtc_destroy(struct drm_crtc *crtc)
 {
-	struct tilcdc_drm_private *priv = crtc->dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(crtc->dev);
 
 	tilcdc_crtc_shutdown(crtc);
 
@@ -647,7 +647,7 @@ static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
@@ -670,7 +670,7 @@ static void tilcdc_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
@@ -728,7 +728,7 @@ static enum drm_mode_status
 tilcdc_crtc_mode_valid(struct drm_crtc *crtc,
 		       const struct drm_display_mode *mode)
 {
-	struct tilcdc_drm_private *priv = crtc->dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(crtc->dev);
 	unsigned int bandwidth;
 	uint32_t hbp, hfp, hsw, vbp, vfp, vsw;
 
@@ -826,7 +826,7 @@ static const struct drm_crtc_helper_funcs tilcdc_crtc_helper_funcs = {
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 
 	drm_modeset_lock(&crtc->mutex, NULL);
@@ -850,7 +850,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	uint32_t stat, reg;
 
 	stat = tilcdc_read_irqstatus(dev);
@@ -958,7 +958,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 
 int tilcdc_crtc_create(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct tilcdc_crtc *tilcdc_crtc;
 	struct drm_crtc *crtc;
 	int ret;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index e3d04a3eb25b4..c69e279a2539d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -85,6 +85,8 @@ struct tilcdc_drm_private {
 
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
+#define ddev_to_tilcdc_priv(x) container_of(x, struct tilcdc_drm_private, ddev)
+
 int tilcdc_crtc_create(struct drm_device *dev);
 irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc);
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index b1c7b2257df30..d42be3e16c536 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -34,7 +34,7 @@ struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
 static
 int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 {
-	struct tilcdc_drm_private *priv = ddev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
 	int ret;
 
 	priv->encoder->possible_crtcs = BIT(0);
@@ -52,7 +52,7 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 
 int tilcdc_encoder_create(struct drm_device *ddev)
 {
-	struct tilcdc_drm_private *priv = ddev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
 	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	int ret;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index aa72ca679598b..a77a5b22ebd96 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -101,7 +101,7 @@ static const struct drm_plane_helper_funcs plane_helper_funcs = {
 int tilcdc_plane_init(struct drm_device *dev,
 		      struct drm_plane *plane)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	int ret;
 
 	ret = drm_universal_plane_init(dev, plane, 1, &tilcdc_plane_funcs,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_regs.h b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
index f90e2dc3457cd..26ebaf1e0f70f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_regs.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
@@ -113,13 +113,13 @@
 
 static inline void tilcdc_write(struct drm_device *dev, u32 reg, u32 data)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	iowrite32(data, priv->mmio + reg);
 }
 
 static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	volatile void __iomem *addr = priv->mmio + reg;
 
 #if defined(iowrite64) && !defined(iowrite64_is_nonatomic)
@@ -133,7 +133,7 @@ static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
 
 static inline u32 tilcdc_read(struct drm_device *dev, u32 reg)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	return ioread32(priv->mmio + reg);
 }
 
@@ -156,7 +156,7 @@ static inline void tilcdc_clear(struct drm_device *dev, u32 reg, u32 mask)
 /* the register to read/clear irqstatus differs between v1 and v2 of the IP */
 static inline u32 tilcdc_irqstatus_reg(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	return (priv->rev == 2) ? LCDC_MASKED_STAT_REG : LCDC_STAT_REG;
 }
 

-- 
2.43.0


