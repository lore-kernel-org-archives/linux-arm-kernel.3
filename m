Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D705CDB480
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5t3Yym7TNcn23mBBw6H+IPIGFaMcwRdXEZmNa7/R0B4=; b=yrLEiTGOzVCMb1GmNbxHNtM9O/
	cdOPwXjv6j02HEEzFZmEqG8OOjuEF1qFECv+h9gNGI4IPMqU2XYvkF7Ky7wSrM97/yj31d37bsCzN
	UDuz5SOe9p5yiGgxXJQ9bNAgcVbxxlhjEX7jDvdvxaF4t0RXN7J6L0J90TnlwqMlbB5V3anvIH9T/
	KkIIzj538iBXTz7d4D+gYlx0duY1IHNCQiE/5X7BMDACUPfOec4si3hgFsGPWnHGJ3Pz+DjSLLD47
	o4zB5YyA0hxvE7hTqe/AZO/je4zTISTUUv5wXs2yGsZU1IZlA3qD++sHn03vD7r5TMczcyEo4xxh2
	cAwDlHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7pi-00000006r1n-431s;
	Tue, 23 Jun 2026 20:34:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7pf-00000006r1N-31Jw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:34:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso2923255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782246894; x=1782851694; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5t3Yym7TNcn23mBBw6H+IPIGFaMcwRdXEZmNa7/R0B4=;
        b=HaMY6q/XHK718v4wVZ91DmA+f7kUcZ97OKXx3lKi0wVmYJHo+uQs0DSlBBFnz+ah2D
         NGl5wkETpYkjbw8OW9/dP+PvM/zFYEGgjD7Tth7BeRKLjN5AhXKVcwxVthvfxAzQe/lO
         PBNWrcbOKBO9osU8xc00u86nCnDwmwbM0pEybSrKZ034Kk2h1FF7VtnHWvhbq2lcEO3H
         xdUD5MuJfivjsFOfzaIVEniJBJITrt8eS4rSnp8SDfiaUJzrdkQSBFlBNZjVHjTMTvK2
         ROsjQVlq/kqImfji1DebkyDXlcWKDXtP6jxkY2TA5Ku8nr06arP5QffGF6/sPJu+FLtL
         aPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246894; x=1782851694;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t3Yym7TNcn23mBBw6H+IPIGFaMcwRdXEZmNa7/R0B4=;
        b=Z3Rlrgt2SEctP/9U0Jc6O3ItJUzaXITCEDgM70LiOAvD94wXPzjmRhUflwdlrdP7wj
         dd7OfYiggBx5gwlsCIwenwwnL6Ww65OUTV4IX1OvTZIi5y5cjcz2GZ6LktLf7uMEqLo6
         QQTlB7zn+1JjgDB14ApPqJHpqlA7Ii4xeBmaBEDibRTI9g4MqapdR4b1JFpwWG70xqQj
         P3EfnTKtm8jj4xO58muS4qcMJwcw8S/mFAdur1rvsWu/UXJ4IySdWGjQoaIdLkthauOs
         eKXOxZQG/QZpspcbHskgZF3UImhpZBg9C0E/yLOWs3+mL19xHTqKbGLGY48NGTfrIBlF
         pqFg==
X-Forwarded-Encrypted: i=1; AFNElJ+tK3XY81upKlFyCIAcU6k1NE40PtpLOKCwWZknjTA29e8NjBp4cCATRD3GnDKmtFG2kC2MhwZWt99Z8tm1sgVp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm//GhtcYBPcGTUchWwGFtYwpzXSOVX72Bk/0IE8GUvNZ70n3I
	HrJf4LPh0KlZmAJhD9OZ+kUvAUhSHqNaztFvtx+f98n6s49QR0lVmCMr
X-Gm-Gg: AfdE7clBozsTkkTx7LeLQtaGpwd3BV1FuRMJXujhvA1FT6eGhjqQ1kyjFGEyLJt1N68
	CYbXqHKTKFtkhR5D87RtI/1pn4iS9Vx4AKuh6iKOOzfYzEeyOwxd+StrWCgWmZi2hIZeRSfx5zc
	6CfOuInO+W57vHyaSMa8BTqv6sBm8So/RJiWlkrNw1ABBoQBS44AIOqg+qgHxcEl22xJS5DEM3f
	P80DA8NHfI7Ghdzwov98mcWPcGytwEcpVfe1WGiKZloJRpo9u4Oqbn8Xli9ODtsYXowMLcHrdtH
	CAREZspPxQmgtVWoGM10KpocUydxIh/1vwZ5163IIbJht2jBf8c69jdXovYBcYMRUz82nH4rx3a
	qwkStBr6vRw78vgzViV1TXh3aOZ+LjTqvmxlKFPrXPuh2KYUOt1AN3N8GBYwfX8H26bv/ky+q/F
	IQVrt//27ZbM2WOlHcdyf4
X-Received: by 2002:a05:600c:34c2:b0:492:465a:7e5b with SMTP id 5b1f17b1804b1-4926087371bmr2714075e9.22.1782246893690;
        Tue, 23 Jun 2026 13:34:53 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd154fdsm374613865e9.1.2026.06.23.13.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:34:53 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 23 Jun 2026 22:34:40 +0200
Subject: [PATCH] drm/sun4i: Remove dependency on DRM simple helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN/tOmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNj3eLSPJPM+OLM3IKcVF0j02QzCwsL01RjU0sloJaCotS0zAqwcdG
 xtbUAyL0mhF4AAAA=
X-Change-ID: 20260623-sun4i_simple-25c68885e359
To: Chen-Yu Tsai <wens@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_133455_836291_476C28A1 
X-CRM114-Status: GOOD (  14.06  )
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

Simple KMS helper are deprecated since they only add an intermediate
layer between drivers and the atomic modesetting.
This patch removes the dependency on drm simple helpers from sun4i
DRM drivers.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c |  9 ++++++---
 drivers/gpu/drm/sun4i/sun4i_lvds.c     | 10 +++++++---
 drivers/gpu/drm/sun4i/sun4i_rgb.c      | 10 +++++++---
 drivers/gpu/drm/sun4i/sun4i_tv.c       | 10 +++++++---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 +++++++---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  |  8 ++++++--
 6 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 8f64464621c9..e99f52ebb26f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -24,7 +24,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
@@ -172,6 +171,10 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder,
 	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
 }
 
+static const struct drm_encoder_funcs sun4i_hdmi_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs = {
 	.atomic_disable	= sun4i_hdmi_disable,
 	.atomic_enable	= sun4i_hdmi_enable,
@@ -624,8 +627,8 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&hdmi->encoder,
 			       &sun4i_hdmi_helper_funcs);
-	ret = drm_simple_encoder_init(drm, &hdmi->encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(drm, &hdmi->encoder, &sun4i_hdmi_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		dev_err(dev, "Couldn't initialise the HDMI encoder\n");
 		goto err_put_ddc_i2c;
diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index 6716e895ae8a..35a3f987c37a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -8,11 +8,11 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_tcon.h"
@@ -89,6 +89,10 @@ static void sun4i_lvds_encoder_disable(struct drm_encoder *encoder)
 	}
 }
 
+static const struct drm_encoder_funcs sun4i_lvds_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs sun4i_lvds_enc_helper_funcs = {
 	.disable	= sun4i_lvds_encoder_disable,
 	.enable		= sun4i_lvds_encoder_enable,
@@ -115,8 +119,8 @@ int sun4i_lvds_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 
 	drm_encoder_helper_add(&lvds->encoder,
 			       &sun4i_lvds_enc_helper_funcs);
-	ret = drm_simple_encoder_init(drm, &lvds->encoder,
-				      DRM_MODE_ENCODER_LVDS);
+	ret = drm_encoder_init(drm, &lvds->encoder, &sun4i_lvds_enc_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialise the lvds encoder\n");
 		goto err_out;
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index dfb6acc42f02..9c3fbf1b949e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -10,11 +10,11 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_tcon.h"
@@ -180,6 +180,10 @@ static void sun4i_rgb_encoder_disable(struct drm_encoder *encoder)
 	}
 }
 
+static const struct drm_encoder_funcs sun4i_rgb_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs sun4i_rgb_enc_helper_funcs = {
 	.disable	= sun4i_rgb_encoder_disable,
 	.enable		= sun4i_rgb_encoder_enable,
@@ -207,8 +211,8 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 
 	drm_encoder_helper_add(&rgb->encoder,
 			       &sun4i_rgb_enc_helper_funcs);
-	ret = drm_simple_encoder_init(drm, &rgb->encoder,
-				      DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(drm, &rgb->encoder, &sun4i_rgb_enc_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialise the rgb encoder\n");
 		goto err_out;
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 814b77f278f6..ce22f1662c0c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -16,11 +16,11 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_drv.h"
@@ -391,6 +391,10 @@ static void sun4i_tv_enable(struct drm_encoder *encoder,
 			   SUN4I_TVE_EN_ENABLE);
 }
 
+static const struct drm_encoder_funcs sun4i_tv_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
 	.atomic_disable	= sun4i_tv_disable,
 	.atomic_enable	= sun4i_tv_enable,
@@ -474,8 +478,8 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&tv->encoder,
 			       &sun4i_tv_helper_funcs);
-	ret = drm_simple_encoder_init(drm, &tv->encoder,
-				      DRM_MODE_ENCODER_TVDAC);
+	ret = drm_encoder_init(drm, &tv->encoder, &sun4i_tv_funcs,
+			       DRM_MODE_ENCODER_TVDAC, NULL);
 	if (ret) {
 		dev_err(dev, "Couldn't initialise the TV encoder\n");
 		goto err_disable_clk;
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index c35b70d83e53..f0c9f0e573d2 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -20,11 +20,11 @@
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_tcon.h"
@@ -842,6 +842,10 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
+static const struct drm_encoder_funcs sun6i_dsi_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
 	.disable	= sun6i_dsi_encoder_disable,
 	.enable		= sun6i_dsi_encoder_enable,
@@ -1056,8 +1060,8 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&dsi->encoder,
 			       &sun6i_dsi_enc_helper_funcs);
-	ret = drm_simple_encoder_init(drm, &dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm, &dsi->encoder, &sun6i_dsi_enc_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		dev_err(dsi->dev, "Couldn't initialise the DSI encoder\n");
 		return ret;
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 96532709c2a7..9694ad142a7d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -9,8 +9,8 @@
 #include <linux/platform_device.h>
 
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "sun8i_dw_hdmi.h"
 #include "sun8i_tcon_top.h"
@@ -23,6 +23,9 @@ static void sun8i_dw_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 
 	clk_set_rate(hdmi->clk_tmds, mode->crtc_clock * 1000);
 }
+static const struct drm_encoder_funcs sun8i_dw_hdmi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
 
 static const struct drm_encoder_helper_funcs
 sun8i_dw_hdmi_encoder_helper_funcs = {
@@ -180,7 +183,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_clk_tmds;
 
 	drm_encoder_helper_add(encoder, &sun8i_dw_hdmi_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm, encoder, &sun8i_dw_hdmi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	plat_data->mode_valid = hdmi->quirks->mode_valid;
 	plat_data->use_drm_infoframe = hdmi->quirks->use_drm_infoframe;

---
base-commit: e2a6e04d045a56c6dc61e1eb9e2a6d7cf86512cd
change-id: 20260623-sun4i_simple-25c68885e359

Best regards,
-- 
Diogo Silva <diogompaissilva@gmail.com>


