Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B643BCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yxi/wE47a99ioZKRhiXdNPZKOFUf/VwFzstV1N+fI3o=; b=Hff5xUpgGuYLjFmEoNncoQTTgE
	uHtS0BsyA0H4h/axzfUBXOogPdBa28wAc1yfzfdJVE4YPzU5qDF2ez6n5YdjrPDBeowI2k8Xj38Iv
	c+uEro6T+fh4qW9GWcM1Lry2hzalg8urvMKDNQBtn4uHOkso2YcvKaGkZjC1mXYobXro8psF1Pc+D
	JX3dG2o6GDl/8VY1xrx1jg2KWSmgLupeiM04LhwSA53GgL1Wa33D2ayw7EwVtK0MvbI5GzuE2w8E4
	LibMrxZo4xkeFJrkNh0dtu3yN+EUjWmEdlA/TLjq01sAjZyc51VX7t5WffRwiI3T2mEIqp/9THW8D
	rc/u3NBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc12r-00000006Kcf-0aeK;
	Tue, 23 Jun 2026 13:20:05 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc12h-00000006KaA-3fxN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:20:00 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-697763eeafcso5607352a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782220794; x=1782825594; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yxi/wE47a99ioZKRhiXdNPZKOFUf/VwFzstV1N+fI3o=;
        b=MqHW/FlnrIT8YnZqUxDgmQO4bwczUicHzCVIZKQQptAz8TvfC6dj6pTyYAIaZPR0AD
         Wets8e9/Prj/MGUfkWKXseQYkeK7o2iqSBtLJqsm1CtA3WgqfDvkIMcbC0kawy9Yfzhr
         +IxIoX0C+79MuAQbo0CxgRVyL85g73h0dOdaa3FartSnw13DKTFhH1nP2pIsXo83yBv/
         O7hDlGpWoHqwMiOUodnH1wSWKrHKCBxlvo7ukWyOX6ljUNx3mHRyuC3KQdR8yJ9xu9by
         w+uiy3BtvJFsQASlr5uKcF0TBsDQOkEmhEhTWcTOp9MrkoOHr/amfHv/QuuHASeWq5JX
         1LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220794; x=1782825594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yxi/wE47a99ioZKRhiXdNPZKOFUf/VwFzstV1N+fI3o=;
        b=dHDr8W2CjwLCayXr1oXUPrZ9M7wLmiXa2giFlLl1k36P1Rt8/7rCIPsHthvkzQDmBm
         5PC/GM5bsxnqJ4Lygiib+Dla0OwXZZtK7f594E3uN3j54O8NR0SLiWk5wA/dCznO0zts
         iLqw0EoDp6ZSXAg2EGgCjWZaSyWR/hKqH1Qjm4loSsHtr8BAInTgHUqoQPEezTClPVk9
         Ar6jniN5t5I+0BvBI0bCC4nmqslZ3UDLpugtDDoXl+oN+xXJba+iPtsgHictHPnpZHSc
         Bc8KVa1KXjJT8Uu4ssliUmct5KeTpw4j2aLpP1m4cn725OgN2TCLtbRjc+JRr1UvFC8a
         OT8A==
X-Forwarded-Encrypted: i=1; AFNElJ/copofEicoW8CTJtwY1hDZrCipm2BHdfxXbGC7UgPXIMF2oWeT5g2gyVxvjOpbzFZuM/akhGOhcTpslytGHQcv@lists.infradead.org
X-Gm-Message-State: AOJu0YypBGdBK+RNoXiUlZsYs9I7qh49EQNkpooo/Wk94Eno+9CE0UHt
	24AYJILBn37y2KwHLQHbjtFzKPcLlr8zlybp+jQY+i2tAMpCp38giia0
X-Gm-Gg: AfdE7ckNcGqE75auHGx/niV0zo6TnQYQNBHHX8l0S1vwePXHQ0u6n2lQcAApomoOW5R
	yjOFzZtES2xAjeSZdr7v6ltKy4rtUax7dZ6ZIQPb9E5Re7MWmSSWtKdJYYexYT86kNcC4yRk5ME
	fCEH9eUNFrjJm+dCYzwFG3zOI6saL2kw27hinri3ROPK0rxBNtxxY54t18Nwk9SckghZTWG2mnv
	qxCOqgPLUViYwVIBMqQPYQMWjY9s5i6FcV08fHpGLx1Z1mOS7bgqBWhCus+XkCeis843pi4SOte
	dkq6eDR+ujAxOb1MXdUnknDubBxTZj3czZKpfJGJb9l4M3opeFn2VC0DUIcpzwDYPf2S3FNJhRs
	Tv2+ZQUL1JRmDviws7tyrepbJ1CnvSrSv8IwOs3jw5WTDoErXziYi3uJTLEaIn9+1Kjm6IE+RLB
	UEW5swRk+N1zsOae6a
X-Received: by 2002:a05:6402:3205:b0:687:7fa4:faa0 with SMTP id 4fb4d7f45d1cf-69711e0602bmr986767a12.23.1782220793768;
        Tue, 23 Jun 2026 06:19:53 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82f95dsm5060107a12.3.2026.06.23.06.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:19:53 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 23 Jun 2026 15:19:30 +0200
Subject: [PATCH v2 1/2] drm/exynos: Remove dependency on DRM simple helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-exynos-drm-simple-v2-1-a8d59678b7d2@gmail.com>
References: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
In-Reply-To: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_061956_401076_7BFB690F 
X-CRM114-Status: GOOD (  15.58  )
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
This patch removes the dependency on drm simple helpers from exynos
DRM drivers.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c       |  9 +++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  |  9 +++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  |  9 +++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c |  9 +++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 10 ++++++++--
 5 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index b80540328150..a2095fb43483 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -24,11 +24,11 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_crtc.h"
@@ -79,6 +79,10 @@ static void exynos_dp_nop(struct drm_encoder *encoder)
 	/* do nothing */
 }
 
+static const struct drm_encoder_funcs exynos_dp_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
 	.mode_set = exynos_dp_mode_set,
 	.enable = exynos_dp_nop,
@@ -95,7 +99,8 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 0dc36df6ada3..4a3d443a15e6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -12,10 +12,10 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <video/of_videomode.h>
 #include <video/videomode.h>
@@ -140,6 +140,10 @@ static void exynos_dpi_disable(struct drm_encoder *encoder)
 	}
 }
 
+static const struct drm_encoder_funcs exynos_dpi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs exynos_dpi_encoder_helper_funcs = {
 	.mode_set = exynos_dpi_mode_set,
 	.enable = exynos_dpi_enable,
@@ -194,7 +198,8 @@ int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder)
 {
 	int ret;
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_dpi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index c4d098ab7863..25c438cdc744 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -13,7 +13,7 @@
 
 #include <drm/bridge/samsung-dsim.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_drv.h"
@@ -22,6 +22,10 @@ struct exynos_dsi {
 	struct drm_encoder encoder;
 };
 
+static const struct drm_encoder_funcs exynos_drm_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static irqreturn_t exynos_dsi_te_irq_handler(struct samsung_dsim *dsim)
 {
 	struct exynos_dsi *dsi = dsim->priv;
@@ -79,7 +83,8 @@ static int exynos_dsi_bind(struct device *dev, struct device *master, void *data
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm_dev, encoder, &exynos_drm_dsi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 67bbf9b8bc0e..d905dc703c06 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -13,10 +13,10 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/exynos_drm.h>
 
@@ -403,6 +403,10 @@ static void exynos_vidi_disable(struct drm_encoder *encoder)
 {
 }
 
+static const struct drm_encoder_funcs exynos_vidi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs exynos_vidi_encoder_helper_funcs = {
 	.mode_set = exynos_vidi_mode_set,
 	.enable = exynos_vidi_enable,
@@ -445,7 +449,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm_dev, encoder, &exynos_vidi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_vidi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 09b2cabb236f..26baf5357997 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -36,9 +36,9 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "exynos_drm_crtc.h"
 #include "regs-hdmi.h"
@@ -1575,6 +1575,11 @@ static void hdmi_disable(struct drm_encoder *encoder)
 	mutex_unlock(&hdata->mutex);
 }
 
+static const struct drm_encoder_funcs exynos_hdmi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+
 static const struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs = {
 	.mode_fixup	= hdmi_mode_fixup,
 	.enable		= hdmi_enable,
@@ -1862,7 +1867,8 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	hdata->phy_clk.enable = hdmiphy_clk_enable;
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_hdmi_encoder_helper_funcs);
 

-- 
2.51.2


