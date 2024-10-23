Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D69CFA45D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsucG0Q0vHPFBy6lzVvgyGm98jkpqjywCenuNv6tqlM=; b=eAzEz+sRU52dzYRnChFdzbPiGx
	vwjdR2ElYSSq1F4ybD9c1jpIKqkNO8cUZK+YBtODneAJ50nG/wXENk6SljAoidWj9QVlNZD1gBthx
	REsmld+v9m82fKYcObJ0BF7fGiJVfFAxXsgIe/ROwRTd6fIAoLnklBsBB7FCyFX70Jr7OmO7sfN3d
	R03G3y6rszBsxP3llZWVO3FZ31OseVK51Q6i4ctbO8zCNfj2ImxNfn+QLsnYQoD69cE+aO/aIGtCw
	ZvOW+iXqBAiVbiWblCG00cdoO1vYkAQCZrczZdUVtCUYU3OKugQEXFGAMV0qOfzaij5PnXLl9EDm/
	lLQsq+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fgO-0000000FSeQ-1yoB;
	Wed, 23 Oct 2024 18:02:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYy-0000000FDNs-48nd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tsucG0Q0vHPFBy6lzVvgyGm98jkpqjywCenuNv6tqlM=; b=NABhRX8GL8eDHoAcb6fbfZwpaM
	HcZci3OmAK/BIRU8p9TT7Rtse1por8USdblP0akzQ8x7VGJ5zSjWxQdQ+z4A2semAfRWqGFvOuzXq
	2lg/jMu0WO3ddWqCUbyGZuRgh9RXQjgWBuyG6UC0EypJ2+gDSVojJtobQJEhF9G714uHBsMhi7PFC
	iV45rRwr+elT4GEmTWIHh5GvdQDqhmkDcSoE1SFhhw7lEKd2cjFXcZk7ejbStlp/4lZ7rbKrByweM
	C67jQbZK5wyX+biW4pKzgtWfEeqB5az0QWYn6uWxk5RpmakFqWGZ5lVla8AiM/diH1d7fyEJQmIBH
	jWtM7NhQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYw-00000008TC5-0XPI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43152b79d25so68530965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702220; x=1730307020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsucG0Q0vHPFBy6lzVvgyGm98jkpqjywCenuNv6tqlM=;
        b=tOsHtqN2wgQwwSw9JdQxWL//SvwfeNZ2bqZf91RCmN7c0h6+DHbr37DGTSlW02qFbO
         q2ZsHsQCsxl1TdwhvqlJryIQqkX0TOVypVcoIAxT1wugutfgkzf/v5zWKehUc7733NWG
         opql9XRBlMoOhE38zoXqho+18ZRvTayG7UmdV4IQLyrUqPoJNlAq3Hm1KQ2U7Q7JXVFK
         hoa4iWiG9Iz6QJujD8xcckrRBO0S0fYHv50dS0G5D9HyW4HUHUVm9mZCVyZh7UDTRXby
         sAuaAfwAKQdx9pMKY6gbNzCpEPNeTg0b/Uo4g7l0ndcwA94qtvKCNk4gKrMioRjQMBUL
         JJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702220; x=1730307020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsucG0Q0vHPFBy6lzVvgyGm98jkpqjywCenuNv6tqlM=;
        b=uCxuResdxqj+dterez4LTv4MdSyt4UIWuRn6DO14jgqm1dLypkZ0XPNINU0B6syo5T
         LylSLbfqmSq3uPn6ThxJkKdIxKMoGj7pb0l89CEoJlrYQz2o/t6miQo+Y2i1dYrXy/Ch
         rDELY5jaAlPi0/l3iHSBMxyNN65he6/+3zqPYOE+eaeVfjXVWsYwtSRc0Cz4Gjj9qngo
         PAXhBmq+j1vHDyezDBsPAqDVuNmxCCQN+iCbcLj77Cbzivjgg1JODCtwb4LiYhwIRw7d
         GeE/4nMfwMvBZvk8ElTpRqr1los6JS/i9K8aCD1duE5LYcIbEFzHnIKwWqpEh3/WNmnJ
         F2rw==
X-Forwarded-Encrypted: i=1; AJvYcCXE819R2wIOEjY2RY3uHZHwZxyJILM1u551cm+dx/lhnbmJrvHpVRJWGQIJBhhdYw+SMEka1EtY/YIXKHFTBNIt@lists.infradead.org
X-Gm-Message-State: AOJu0YyLrHfH8ACPJfLhGSCA6S9eWaWAkXhEEes51r2whdDGbwrWP+Cq
	XhCTLp2pThJPK9XxKxp5FVA8s1c20QZ3DhBCFAKQQfsal+tRrUp2gJf/cJFnsBw=
X-Google-Smtp-Source: AGHT+IF+z5G2SpbBJXEoTC4AhNnyHaZc8I8tY/B+b0FqCsjD1XtrGZGyhc0Zli024GaKfZ4+HiMwEw==
X-Received: by 2002:a05:600c:4fcd:b0:431:508a:1a7b with SMTP id 5b1f17b1804b1-431841a3efbmr26173175e9.34.1729702219677;
        Wed, 23 Oct 2024 09:50:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:19 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:09 +0100
Subject: [PATCH 12/37] drm/vc4: crtc: Add support for BCM2712 PixelValves
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-12-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_175022_329654_3D2257C2 
X-CRM114-Status: GOOD (  19.62  )
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

From: Maxime Ripard <mripard@kernel.org>

The PixelValves found on the BCM2712 are similar to the ones found in
the previous generation.

Compared to BCM2711:
- the pixelvalves only drive one HDMI controller each
- HDMI1 PixelValve has a FIFO long enough to support 4k at 60Hz
- support has been added for odd horizontal timings whilst at 2pixels/clock

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 49 ++++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h  |  2 ++
 drivers/gpu/drm/vc4/vc4_regs.h |  6 ++++++
 3 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 53bca104d0d5..bfa25efa5db2 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -240,6 +240,11 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
 	struct vc4_dev *vc4 = to_vc4_dev(vc4_crtc->base.dev);
+
+	/*
+	 * NOTE: Could we use register 0x68 (PV_HW_CFG1) to get the FIFO
+	 * size?
+	 */
 	u32 fifo_len_bytes = pv_data->fifo_depth;
 
 	/*
@@ -421,6 +426,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 		 */
 		CRTC_WRITE(PV_V_CONTROL,
 			   PV_VCONTROL_CONTINUOUS |
+			   (vc4->gen >= VC4_GEN_6_C ? PV_VCONTROL_ODD_TIMING : 0) |
 			   (is_dsi ? PV_VCONTROL_DSI : 0) |
 			   PV_VCONTROL_INTERLACE |
 			   (odd_field_first
@@ -432,6 +438,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 	} else {
 		CRTC_WRITE(PV_V_CONTROL,
 			   PV_VCONTROL_CONTINUOUS |
+			   (vc4->gen >= VC4_GEN_6_C ? PV_VCONTROL_ODD_TIMING : 0) |
 			   (is_dsi ? PV_VCONTROL_DSI : 0));
 		CRTC_WRITE(PV_VSYNCD_EVEN, 0);
 	}
@@ -446,11 +453,17 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 	if (is_dsi)
 		CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
 
-	if (vc4->gen == VC4_GEN_5)
+	if (vc4->gen >= VC4_GEN_5)
 		CRTC_WRITE(PV_MUX_CFG,
 			   VC4_SET_FIELD(PV_MUX_CFG_RGB_PIXEL_MUX_MODE_NO_SWAP,
 					 PV_MUX_CFG_RGB_PIXEL_MUX_MODE));
 
+	if (vc4->gen >= VC4_GEN_6_C)
+		CRTC_WRITE(PV_PIPE_INIT_CTRL,
+			   VC4_SET_FIELD(1, PV_PIPE_INIT_CTRL_PV_INIT_WIDTH) |
+			   VC4_SET_FIELD(1, PV_PIPE_INIT_CTRL_PV_INIT_IDLE) |
+			   PV_PIPE_INIT_CTRL_PV_INIT_EN);
+
 	CRTC_WRITE(PV_CONTROL, PV_CONTROL_FIFO_CLR |
 		   vc4_crtc_get_fifo_full_level_bits(vc4_crtc, format) |
 		   VC4_SET_FIELD(format, PV_CONTROL_FORMAT) |
@@ -549,7 +562,11 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 	if (!(of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
 				      "brcm,bcm2711-pixelvalve2") ||
 	      of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
-				      "brcm,bcm2711-pixelvalve4")))
+				      "brcm,bcm2711-pixelvalve4") ||
+	      of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
+				      "brcm,bcm2712-pixelvalve0") ||
+	      of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
+				      "brcm,bcm2712-pixelvalve1")))
 		return 0;
 
 	if (!(CRTC_READ(PV_CONTROL) & PV_CONTROL_EN))
@@ -1292,6 +1309,32 @@ const struct vc4_pv_data bcm2711_pv4_data = {
 	},
 };
 
+const struct vc4_pv_data bcm2712_pv0_data = {
+	.base = {
+		.debugfs_name = "crtc0_regs",
+		.hvs_available_channels = BIT(0),
+		.hvs_output = 0,
+	},
+	.fifo_depth = 64,
+	.pixels_per_clock = 1,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_HDMI0,
+	},
+};
+
+const struct vc4_pv_data bcm2712_pv1_data = {
+	.base = {
+		.debugfs_name = "crtc1_regs",
+		.hvs_available_channels = BIT(1),
+		.hvs_output = 1,
+	},
+	.fifo_depth = 64,
+	.pixels_per_clock = 1,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_HDMI1,
+	},
+};
+
 static const struct of_device_id vc4_crtc_dt_match[] = {
 	{ .compatible = "brcm,bcm2835-pixelvalve0", .data = &bcm2835_pv0_data },
 	{ .compatible = "brcm,bcm2835-pixelvalve1", .data = &bcm2835_pv1_data },
@@ -1301,6 +1344,8 @@ static const struct of_device_id vc4_crtc_dt_match[] = {
 	{ .compatible = "brcm,bcm2711-pixelvalve2", .data = &bcm2711_pv2_data },
 	{ .compatible = "brcm,bcm2711-pixelvalve3", .data = &bcm2711_pv3_data },
 	{ .compatible = "brcm,bcm2711-pixelvalve4", .data = &bcm2711_pv4_data },
+	{ .compatible = "brcm,bcm2712-pixelvalve0", .data = &bcm2712_pv0_data },
+	{ .compatible = "brcm,bcm2712-pixelvalve1", .data = &bcm2712_pv1_data },
 	{}
 };
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index aea585bf83eb..a68cea921c11 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -558,6 +558,8 @@ extern const struct vc4_pv_data bcm2711_pv1_data;
 extern const struct vc4_pv_data bcm2711_pv2_data;
 extern const struct vc4_pv_data bcm2711_pv3_data;
 extern const struct vc4_pv_data bcm2711_pv4_data;
+extern const struct vc4_pv_data bcm2712_pv0_data;
+extern const struct vc4_pv_data bcm2712_pv1_data;
 
 struct vc4_crtc {
 	struct drm_crtc base;
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 9226429539cf..731b13742ef5 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -155,6 +155,7 @@
 # define PV_CONTROL_EN				BIT(0)
 
 #define PV_V_CONTROL				0x04
+# define PV_VCONTROL_ODD_TIMING			BIT(29)
 # define PV_VCONTROL_ODD_DELAY_MASK		VC4_MASK(22, 6)
 # define PV_VCONTROL_ODD_DELAY_SHIFT		6
 # define PV_VCONTROL_ODD_FIRST			BIT(5)
@@ -215,6 +216,11 @@
 # define PV_MUX_CFG_RGB_PIXEL_MUX_MODE_SHIFT	2
 # define PV_MUX_CFG_RGB_PIXEL_MUX_MODE_NO_SWAP	8
 
+#define PV_PIPE_INIT_CTRL			0x94
+# define PV_PIPE_INIT_CTRL_PV_INIT_WIDTH_MASK	VC4_MASK(11, 8)
+# define PV_PIPE_INIT_CTRL_PV_INIT_IDLE_MASK	VC4_MASK(7, 4)
+# define PV_PIPE_INIT_CTRL_PV_INIT_EN		BIT(0)
+
 #define SCALER_CHANNELS_COUNT			3
 
 #define SCALER_DISPCTRL                         0x00000000

-- 
2.34.1


