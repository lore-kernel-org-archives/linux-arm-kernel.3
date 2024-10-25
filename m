Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99AED149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsucG0Q0vHPFBy6lzVvgyGm98jkpqjywCenuNv6tqlM=; b=X2uf9n4qHp2ELfqjuWB+gHTcAv
	LyZ/jWgQiuNu+jGg3eubmBCxaKNi1Ri9XZPUdggDGG0oPuB7xrOvynPXL7EIi99wz/Jwj2Yz1uBB9
	ihZgnPr86aAdSM6V7CX6+9A1jGBlEcDauh8/BYoQGsakE5bhlLshMEZXzEPB4bdjhARK1TMAo2yop
	rHKKrhLZ+nnBOzKS4zs4qXFqEavVuK3ofT3Mm8i/wBLfqwTdsoNN7GOhhqxu9O0DzROCicSgne9o+
	5CZIh9i3x4UKxfHJVZUFVdPNa/LrV75Yyj0M7Xvuul+d7IwI3hkam84fMp/z1XmC9oc4Ns/QmTBLD
	Mej5NeOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4O8f-00000004bLl-3OXL;
	Fri, 25 Oct 2024 17:30:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv4-00000004XqF-0MZF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43155afca99so22976955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876572; x=1730481372; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsucG0Q0vHPFBy6lzVvgyGm98jkpqjywCenuNv6tqlM=;
        b=GX6SREXNmeNJGfVPk301euskEDsy+bqRO6DsDfKbQSyymnt7dZEVCAunbkOwpZYY3b
         Sztjmc+80Re+bP3W4Uhb5L902rzXzxw6g0ladL2GGA1fu7s6nJ0JMepXo99YY/yJp46v
         pnggawWI+N3dgE0PArgh8xgo/7VOlI1iDGAyLxSXVFXmzECEmjQo5vvOirwmCz+S+UrC
         QfGiv0WpCQtyroJsllQkA1EfC/cRoQ62UWeM4PoJaBCfcU1rIdlhzvMWL+pRj5RBK7vJ
         IHjqWCp2kIxVlcviFuYfiyGTzoUijyoX5uHiZV8Qusy6gWdCR7DCmx0N0LNmbzM7EQZq
         WNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876572; x=1730481372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsucG0Q0vHPFBy6lzVvgyGm98jkpqjywCenuNv6tqlM=;
        b=msaGdSRxBG6ckDcDFYjgOqYsI9STUmwhK5qP0HWYwjk7pwoCfZdz3T6evu8eh13pfD
         iUNLdAj0ckp5TtULK8atx115ZTiy4yw/VoxH/obcRmGoNjWYJB55IoIp7Z1GH96v+348
         JHNfJ8dBOnkwA9j8AJbTS1FvjDZZPTMfgVQ9YG/rEsmrb97oPV58S1BJxLaKQYZYFr67
         dzHHvQcLcEnoMUy+pmKapn8RzsOH5On8/GXFARb38p8zyBhtqoIJfkI8ibfa4Kv3aQi7
         C7Tq2i1WJuacVP0OmDAV+YMMGPouWhISXq31f3wQfBV/b5xxWu0yFwCZcV+/XwYwj34P
         Z6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAGa3lAXTf6EpCqyy+vAbFXxO0vF76Us8EfmPIDeAF8KCXEmvH/Gqd7ofLRENeXcUmIuYG3JtSv9q2fDb3fA3M@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4D7E1mSIE6QLk7XwC+q27GuCxwAW3yOKILS6zAxoROJDS5Mdg
	2JCb3FVHV1UDUFh4Ku+6R78f8gRsdxquThWLxO66C9y8sdpfJOxW5V+Jidx7pl4=
X-Google-Smtp-Source: AGHT+IGUqMQQsp99SP+bQHGGlASJ4CwqsEZ+AnxXoU5Dx0q1aLWp3syCMzhCcHZAUhr5TKhw7gxREg==
X-Received: by 2002:a05:600c:3b1d:b0:42c:b8c9:16c8 with SMTP id 5b1f17b1804b1-4319a58a309mr2507395e9.10.1729876571991;
        Fri, 25 Oct 2024 10:16:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:11 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:42 +0100
Subject: [PATCH v2 11/36] drm/vc4: crtc: Add support for BCM2712
 PixelValves
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-11-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101614_428878_B6883ADE 
X-CRM114-Status: GOOD (  19.79  )
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


