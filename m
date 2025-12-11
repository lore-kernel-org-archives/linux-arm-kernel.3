Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634E0D41D6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i06U48V1QlfdC71Az6GT0AOQaJkHqXg7US8ufDzb8no=; b=e+a2AZk263qHYXDGagExzd9Lwj
	7CVARvWNRSABbU47ec0QpLVAgg3FWfWwYm7rXkBCVhVmHCo6eEvpARwD40rsSbrBcgtllCoHh6kvR
	cuAQoMMunZ70VfgA46WCIPNDLrIT4sZpWy3EsSs+4xu8WTtH8Xfg37m0xjsArd3rsyW0UzbYHNazD
	larIvokpOeYn2hQLNR3ZYz7bgzHyd+Mu+Uzz3huZtrCsDTDnHRx4iTVZibnYKL0JcRxbUaNnHp78e
	YTyTXSuf37QRHKOILlMYNgb5Kn1I6+/UgRJ+ADnYvxwrLj8zeGVfmRxD5N3GH2/sC5sfDZ4E3mawD
	XQe3hrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjhr-0000000GxA8-14cJ;
	Thu, 11 Dec 2025 16:39:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjhn-0000000Gx86-3rqn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 16:39:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 83B981A20EE;
	Thu, 11 Dec 2025 16:39:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C7456072F;
	Thu, 11 Dec 2025 16:39:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21F4D103C8C1E;
	Thu, 11 Dec 2025 17:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765471188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i06U48V1QlfdC71Az6GT0AOQaJkHqXg7US8ufDzb8no=;
	b=Bs3BQ+pFVmaC9vUuIx5BPNRRVJ2vy3VTEQMGqqd/1413JVjvY9XBgyJlXPfAW0NamnamLb
	Rf69FJI3t0m+CwfxHoW/WfNrAPjYcOIOWeW3BNDpFm8CgqdCigsLUHjm+KcSdYNmO1471z
	xBSxQJCdgVmPlLcVQR8WnJLnfqnok6piBbvOYO9ZPav1uNYKkqtA73QWZYF0SpaSGc0REN
	sWmpWDezSHerVhNNpmIqB0JteM5UjfFPPJCdf6sRC/8r0EY2oBQTyX8Z5R1WY8pWyQMNdb
	3ht0JpCTAOe2kemvXFd527WmtSn7RKZih82tfN2Iij5sw28VT6FBPE2c9AW/Gg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:47 +0100
Subject: [PATCH v2 03/20] drm/tilcdc: Remove simulate_vesa_sync flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-3-f48bac3cd33e@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_083952_107896_F1003B7A 
X-CRM114-Status: GOOD (  16.04  )
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

The tilcdc hardware does not generate VESA-compliant sync signals. It
aligns the vertical sync (VS) on the second edge of the horizontal sync
(HS) instead of the first edge. To compensate for this hardware
behavior, the driver applies a timing adjustment in mode_fixup().

Previously, this adjustment was conditional based on the simulate_vesa_sync
flag, which was only set when using external encoders. This appears
problematic because:

1. The timing adjustment seems needed for the hardware behavior regardless
   of whether an external encoder is used
2. The external encoder infrastructure is driver-specific and being
   removed due to design issues
3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk)
   may not be getting the necessary timing adjustments

Remove the simulate_vesa_sync flag and apply the VESA sync timing
adjustment unconditionally, ensuring consistent behavior across all
configurations. While it's unclear if the previous conditional behavior
was causing actual issues, the unconditional adjustment better reflects
the hardware's characteristics.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Only few board currently use tilcdc not associated to a bridge like the
am335x_evm or the am335x-evmsk.
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c     | 16 ----------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h      |  2 --
 drivers/gpu/drm/tilcdc/tilcdc_external.c |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 52c95131af5af..b06b1453db2dd 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -47,9 +47,6 @@ struct tilcdc_crtc {
 
 	struct drm_framebuffer *next_fb;
 
-	/* Only set if an external encoder is connected */
-	bool simulate_vesa_sync;
-
 	int sync_lost_count;
 	bool frame_intact;
 	struct work_struct recover_work;
@@ -642,11 +639,6 @@ static bool tilcdc_crtc_mode_fixup(struct drm_crtc *crtc,
 		const struct drm_display_mode *mode,
 		struct drm_display_mode *adjusted_mode)
 {
-	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-
-	if (!tilcdc_crtc->simulate_vesa_sync)
-		return true;
-
 	/*
 	 * tilcdc does not generate VESA-compliant sync but aligns
 	 * VS on the second edge of HS instead of first edge.
@@ -866,14 +858,6 @@ void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
 	tilcdc_crtc->info = info;
 }
 
-void tilcdc_crtc_set_simulate_vesa_sync(struct drm_crtc *crtc,
-					bool simulate_vesa_sync)
-{
-	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-
-	tilcdc_crtc->simulate_vesa_sync = simulate_vesa_sync;
-}
-
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 58b276f82a669..3aba3a1155ba0 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -160,8 +160,6 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc);
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc);
 void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
 		const struct tilcdc_panel_info *info);
-void tilcdc_crtc_set_simulate_vesa_sync(struct drm_crtc *crtc,
-					bool simulate_vesa_sync);
 void tilcdc_crtc_shutdown(struct drm_crtc *crtc);
 void tilcdc_crtc_destroy(struct drm_crtc *crtc);
 int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 3b86d002ef62e..da755a411d9ff 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -80,7 +80,6 @@ int tilcdc_add_component_encoder(struct drm_device *ddev)
 		return -ENODEV;
 
 	/* Only tda998x is supported at the moment. */
-	tilcdc_crtc_set_simulate_vesa_sync(priv->crtc, true);
 	tilcdc_crtc_set_panel_info(priv->crtc, &panel_info_tda998x);
 
 	return 0;

-- 
2.43.0


