Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1527AD1118E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJWtf2kIy8lCBpcz/JyBziECbeFa7hVjHuwMzNqnPPg=; b=ysH01mCwWqGOt37BHQ4y00s588
	eTEFdWAocd3FDigEyZvZVQSsO0ipgXjcO+S+DL/jHo5r5/mXUGeTYArG99Lk2iK2h9xLAdSXBwkh5
	O+hUAbUSs0GyyZZ6V79uxyCle06q88IVhBxYijSL4RAJDOQr9MxRp7fP7MSb0xn9bIemuWKXU8v66
	wtLPcOd1xpS2D6wpsuJqfD17mU/s6cyBYqcDcVshRTGTmHeplR8hzS6LSI0ge8FQw9XjNnXV89qUg
	8FYRNhaRffKrzya8mNG6bbFkOAd5LcHeSWZ/+HDQIgF0DciYkE8ZpYsnr549mYkTApCRYyLx0Z6SW
	Hqy6dUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJRx-0000000FOiu-3vV9;
	Wed, 26 Nov 2025 17:37:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJRu-0000000FOgV-2S1B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 17:37:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2EAEB4E418FB;
	Wed, 26 Nov 2025 17:37:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0359460721;
	Wed, 26 Nov 2025 17:37:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E57BA102F22B1;
	Wed, 26 Nov 2025 18:36:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IJWtf2kIy8lCBpcz/JyBziECbeFa7hVjHuwMzNqnPPg=;
	b=01lxaJvy4NvnD7Bd7na8RY3i95UleIWUh8amKU6GPWbeGPSOgB6sIoOBbKxdQPfJvJuvAg
	B4gll/zh9mLakH7nQjwwJ9dPhtOCmGs+4uIVsaVx+26avrGtGArYrNAR72Mxg/iTZcEGdI
	4SF3dWBYfcrC1hj7IQnDBQatbJ4BM10+4yJSSGFUOBSTE8GRwSYPZCMvTo7IVV2wBky1Xo
	thBSdQwQR5wp9SYaDT9g/AjY7xzr8fqaRPYB1PvS2YUTui3bfSWKoarRBGgqcTXUTERybS
	XaJLTRjpIJYpVVzuOSoN0EFVeddiy8URdVKQ1UyxCx0gHYvLxQRJQF1C7cSNcw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:47 +0100
Subject: [PATCH 05/21] ARM: dts: omap: Bind panel to panel-dpi instead of
 ti,tilcdc,panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
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
X-CRM114-CacheID: sfid-20251126_093702_772371_B9B5C2BE 
X-CRM114-Status: GOOD (  15.64  )
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

Use panel-dpi driver instead of the deprecated tilcdc-panel driver in
preparation for removing the tilcdc-panel driver and binding.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

This patch is not tested. It would be nice if someone with one of this
board could test and validate it.
---
 arch/arm/boot/dts/ti/davinci/da850-evm.dts    | 26 +++++++++++++-------------
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts | 25 +++++++++----------------
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts   | 21 ++++++++++-----------
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts   | 22 +++++++++++-----------
 arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts | 25 +++++++++++++------------
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts     | 25 ++++++++++++-------------
 6 files changed, 68 insertions(+), 76 deletions(-)

diff --git a/arch/arm/boot/dts/ti/davinci/da850-evm.dts b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
index 38a191fb04149..79cca1f6205ef 100644
--- a/arch/arm/boot/dts/ti/davinci/da850-evm.dts
+++ b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
@@ -40,7 +40,7 @@ backlight: backlight-pwm {
 	};
 
 	panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pins>;
 		/*
@@ -50,17 +50,10 @@ panel {
 		 */
 		status = "okay";
 		enable-gpios = <&gpio 40 GPIO_ACTIVE_HIGH>; /* lcd_panel_pwr */
-
-		panel-info {
-			ac-bias = <255>;
-			ac-bias-intrpt = <0>;
-			dma-burst-sz = <16>;
-			bpp = <16>;
-			fdd = <0x80>;
-			sync-edge = <0>;
-			sync-ctrl = <1>;
-			raster-order = <0>;
-			fifo-th = <1>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc_out>;
+			};
 		};
 
 		display-timings {
@@ -222,6 +215,13 @@ &rtc0 {
 };
 
 &lcdc {
+	fifo-threshold = <16>;
+
+	port {
+		lcdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 	status = "okay";
 };
 
@@ -459,7 +459,7 @@ &vpif {
 	pinctrl-0 = <&vpif_capture_pins>, <&vpif_display_pins>;
 	/*
 	 * The vpif and the LCD are mutually exclusive.
-	 * To enable VPIF, disable the ti,tilcdc,panel then
+	 * To enable VPIF, disable the panel-dpi then
 	 * change the status below to 'okay'
 	 */
 	status = "disabled";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
index 4b070e634b281..f38ce9be2c106 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
@@ -68,10 +68,15 @@ gpio-poweroff {
 	};
 
 	panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 		pinctrl-names = "default", "sleep";
 		pinctrl-0 = <&lcd_pins_default &lcd_disen_pins>;
 		pinctrl-1 = <&lcd_pins_sleep>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc_out>;
+			};
+		};
 
 		display-timings {
 			timing-320x240 {
@@ -86,21 +91,9 @@ timing-320x240 {
 				clock-frequency = <9000000>;
 				hsync-active    = <0>;
 				vsync-active    = <0>;
+				pixelclk-active = <1>;
 			};
 		};
-		panel-info {
-			ac-bias           = <255>;
-			ac-bias-intrpt    = <0>;
-			dma-burst-sz      = <16>;
-			bpp               = <24>;
-			bus-width         = <16>;
-			fdd               = <0x80>;
-			sync-edge         = <0>;
-			sync-ctrl         = <1>;
-			raster-order      = <0>;
-			fifo-th           = <0>;
-		};
-
 	};
 
 	guardian_beeper: pwm-7 {
@@ -265,8 +258,8 @@ &lcdc {
 	blue-and-red-wiring = "crossed";
 	status = "okay";
 	port {
-		lcdc_0: endpoint@0 {
-			remote-endpoint = <0>;
+		lcdc_out: endpoint@0 {
+			remote-endpoint = <&panel_in>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
index c9ccb9de21ad7..2c5229d05ade7 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
@@ -50,20 +50,14 @@ lis3_reg: fixedregulator@1 {
 	};
 
 	panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 		status = "okay";
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pins_s0>;
-		panel-info {
-			ac-bias           = <255>;
-			ac-bias-intrpt    = <0>;
-			dma-burst-sz      = <16>;
-			bpp               = <16>;
-			fdd               = <0x80>;
-			sync-edge         = <0>;
-			sync-ctrl         = <1>;
-			raster-order      = <0>;
-			fifo-th           = <0>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc_out>;
+			};
 		};
 
 		display-timings {
@@ -395,6 +389,11 @@ &rtc {
 
 &lcdc {
 	status = "okay";
+	port {
+		lcdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
 
 &elm {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pepper.dts b/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
index e7d561a527fdd..2760c0eab50c2 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
@@ -31,7 +31,7 @@ leds: user-leds-pins {
 	};
 
 	panel: lcd_panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 	};
 
 	sound: sound_iface {
@@ -189,16 +189,10 @@ &panel {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&lcd_pins>;
-	panel-info {
-		ac-bias = <255>;
-		ac-bias-intrpt = <0>;
-		dma-burst-sz = <16>;
-		bpp = <32>;
-		fdd = <0x80>;
-		sync-edge = <0>;
-		sync-ctrl = <1>;
-		raster-order = <0>;
-		fifo-th = <0>;
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&lcdc_out>;
+		};
 	};
 	display-timings {
 		native-mode = <&timing0>;
@@ -214,12 +208,18 @@ timing0: timing-480x272 {
 			vsync-len = <10>;
 			hsync-active = <1>;
 			vsync-active = <1>;
+			pixelclk-active = <1>;
 		};
 	};
 };
 
 &lcdc {
 	status = "okay";
+	port {
+		lcdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
 
 &am33xx_pinmux {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts b/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts
index 2841e95d9a094..25ee855dd21a7 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts
@@ -13,23 +13,17 @@ / {
 
 	/* DRM display driver */
 	panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 		status = "okay";
 		pinctrl-names = "default", "sleep";
 		pinctrl-0 = <&lcd_pins_default>;
 		pinctrl-1 = <&lcd_pins_sleep>;
-
-		panel-info {
-			ac-bias           = <255>;
-			ac-bias-intrpt    = <0>;
-			dma-burst-sz      = <16>;
-			bpp               = <32>;
-			fdd               = <0x80>;
-			sync-edge         = <0>;
-			sync-ctrl         = <1>;
-			raster-order      = <0>;
-			fifo-th           = <0>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc_out>;
+			};
 		};
+
 		display-timings {
 			/* Timing selection performed by U-Boot */
 			timing0: lcd {/* 800x480p62 */
@@ -44,6 +38,7 @@ timing0: lcd {/* 800x480p62 */
 				vsync-len = <2>;
 				hsync-active = <1>;
 				vsync-active = <1>;
+				pixelclk-active = <1>;
 			};
 			timing1: dvi { /* 1024x768p60 */
 				clock-frequency = <65000000>;
@@ -57,6 +52,7 @@ timing1: dvi { /* 1024x768p60 */
 				vsync-len = <6>;
 				hsync-active = <0>;
 				vsync-active = <0>;
+				pixelclk-active = <1>;
 			};
 		};
 	};
@@ -173,4 +169,9 @@ lcd-ena-hog {
 /* Display */
 &lcdc {
 	status = "okay";
+	port {
+		lcdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
index f3524e5ee43e2..b4b2b6d18d646 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
@@ -123,22 +123,14 @@ audio_mclk: audio_mclk_gate@0 {
 	};
 
 	panel: lcd_panel {
-		compatible = "ti,tilcdc,panel";
+		compatible = "panel-dpi";
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pins>;
 
-		panel-info {
-			ac-bias = <255>;
-			ac-bias-intrpt = <0>;
-			dma-burst-sz = <16>;
-			bpp = <16>;
-			fdd = <0x80>;
-			tft-alt-mode = <0>;
-			mono-8bit-mode = <0>;
-			sync-edge = <0>;
-			sync-ctrl = <1>;
-			raster-order = <0>;
-			fifo-th = <0>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdc_out>;
+			};
 		};
 
 		display-timings {
@@ -157,6 +149,8 @@ timing0: 960x128 {
 				vfront-porch = <8>;
 				vsync-len = <4>;
 				vsync-active = <0>;
+
+				pixelclk-active = <1>;
 			};
 		};
 	};
@@ -711,6 +705,11 @@ &ehrpwm1 {
 
 &lcdc {
 	status = "okay";
+	port {
+		lcdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
 
 &tscadc {

-- 
2.43.0


