Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F7FD1681C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arlZlsrl7Omp9l8WVWNe8alZcUfP8kjuJknYc8ZEeVo=; b=Y2oXlnq9uy07uRSuqzbgnzKSo0
	8wUnjTtB8PzZ8gRBqMEFkqapiOfBlAiiX+jqU+mH9e3j5plXTQ7Q+iCfR6qtm81w0iR4Q3cob2rc5
	uNnuyx0O6uzv6YnE+fbmEpMiJHyte5JazIpId4ZOFJBvp3Av4l4vxthlODu5jWNUAthKTPWK+Q+GC
	SRc1/UvkcL9ECZ2bkOsd6wKglODLpdD+NIDursCU4PsOxFJOkQBKWUWhhd6dXbU2qJphPcLlHCGjs
	prRWR94rpyysulZH9ycvFum1cGPbMT/WLI1TaY7l1StbFgRlRbLS7QXdol3VYB/IyotJmtO5feIXl
	llWgUEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyI-00000002Evb-3q8J;
	Fri, 09 Jan 2026 11:48:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyF-00000002EtI-1HV9;
	Fri, 09 Jan 2026 11:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959276;
	bh=HZ4ivdpHHkfFE01oi4Dur/mcJGlfewHwfN3oW4iWGws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EtmXAsPX/lqxFX6xsjc+WpSRACVvZOdZP9eUru993RmbF1b0yrSI5biaMf1ATovXh
	 mPKbKRkN48edb5oY/1j/03ZYQFZuxJZbXqFuDibEl26/Z0WoEK4xQQTfi9CEhxwVJ3
	 ywhy3u8SPWIlwzLpPeEcFMxRYHtc6KG1L/pAGN1TqTMgO7ieoTtFNruruNAQa9obC4
	 +td2gUGqr2voZan8sG2Dfm260ERxy96Xmq08hnz5Ya8YLkBUlwnx/h57IBszFT8m97
	 no2DSMiBGI+kiDHUFl3/zwqXp4CPjoxJdpH1voz03JB7UV48ciRZUlc0emqbuOvy5W
	 UmLDQKdBL8o7Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4D6917E1380;
	Fri,  9 Jan 2026 12:47:55 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	hsinyi@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 01/11] arm64: dts: mediatek: mt8173: Fix pinctrl node names and cleanup
Date: Fri,  9 Jan 2026 12:47:37 +0100
Message-ID: <20260109114747.37189-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034759_700967_8334A8DD 
X-CRM114-Status: GOOD (  12.05  )
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

Fix the pinctrl node names to adhere to the bindings, as the main
pin node is supposed to be named like "uart0-pins" and the pinmux
node named like "pins-bus".

While at it, also cleanup all of the MTK_DRIVE_(x)mA by changing
that to just the (x) number.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  34 ++---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 138 +++++++++---------
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  60 ++++----
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  28 ++--
 4 files changed, 128 insertions(+), 132 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index dfc5c2f0ddef..1004eb8ea52c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -5,6 +5,14 @@
 
 #include "mt8173-elm.dtsi"
 
+&hdmi_mux_pins {
+	pins-mux {
+		pinmux = <MT8173_PIN_98_URTS1__FUNC_GPIO98>;
+		bias-pull-up;
+		output-high;
+	};
+};
+
 &i2c0 {
 	clock-frequency = <200000>;
 };
@@ -67,26 +75,16 @@ trackpad2: trackpad@2c {
 	};
 };
 
-&mmc1 {
-	wp-gpios = <&pio 42 GPIO_ACTIVE_HIGH>;
-};
-
-&pio {
-	hdmi_mux_pins: hdmi_mux_pins {
-		pins2 {
-			pinmux = <MT8173_PIN_98_URTS1__FUNC_GPIO98>;
-			bias-pull-up;
-			output-high;
-		};
+&mmc1_pins_default {
+	pins-wp {
+		pinmux = <MT8173_PIN_42_DSI_TE__FUNC_GPIO42>;
+		input-enable;
+		bias-pull-up;
 	};
+};
 
-	mmc1_pins_default: mmc1default {
-		pins_wp {
-			pinmux = <MT8173_PIN_42_DSI_TE__FUNC_GPIO42>;
-			input-enable;
-			bias-pull-up;
-		};
-	};
+&mmc1 {
+	wp-gpios = <&pio 42 GPIO_ACTIVE_HIGH>;
 };
 
 &touchscreen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 0d995b342d46..9ec930058b92 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -601,8 +601,8 @@ &pio {
 			  "SOC_I2C4_1V8_SDA_400K",
 			  "SOC_I2C4_1V8_SCL_400K";
 
-	aud_i2s2: aud_i2s2 {
-		pins1 {
+	aud_i2s2: aud-i2s2-pins {
+		pins-bus {
 			pinmux = <MT8173_PIN_128_I2S0_LRCK__FUNC_I2S1_WS>,
 				 <MT8173_PIN_129_I2S0_BCK__FUNC_I2S1_BCK>,
 				 <MT8173_PIN_130_I2S0_MCK__FUNC_I2S1_MCK>,
@@ -614,55 +614,55 @@ pins1 {
 		};
 	};
 
-	bl_fixed_pins: bl_fixed_pins {
-		pins1 {
+	bl_fixed_pins: backlight-pins {
+		pins-blon {
 			pinmux = <MT8173_PIN_32_UTXD2__FUNC_GPIO32>;
 			output-low;
 		};
 	};
 
-	bt_wake_pins: bt_wake_pins {
-		pins1 {
+	bt_wake_pins: bt-pins {
+		pins-wake {
 			pinmux = <MT8173_PIN_119_KPROW0__FUNC_GPIO119>;
 			bias-pull-up;
 		};
 	};
 
-	disp_pwm0_pins: disp_pwm0_pins {
+	disp_pwm0_pins: disp-pwm0-pins {
 		pins1 {
 			pinmux = <MT8173_PIN_87_DISP_PWM0__FUNC_DISP_PWM0>;
 			output-low;
 		};
 	};
 
-	gpio_keys_pins: gpio_keys_pins {
-		volume_pins {
+	gpio_keys_pins: gpio-keys-pins {
+		pins-volumeupdn {
 			pinmux = <MT8173_PIN_123_KPCOL1__FUNC_GPIO123>,
 				 <MT8173_PIN_124_KPCOL2__FUNC_GPIO124>;
 			bias-pull-up;
 		};
 
-		tablet_mode_pins {
+		pins-tabletmode {
 			pinmux = <MT8173_PIN_121_KPROW2__FUNC_GPIO121>;
 			bias-pull-up;
 		};
 	};
 
-	hdmi_mux_pins: hdmi_mux_pins {
-		pins1 {
+	hdmi_mux_pins: hdmi-pins {
+		pins-mux {
 			pinmux = <MT8173_PIN_36_DAISYNC__FUNC_GPIO36>;
 		};
 	};
 
-	i2c1_pins_a: i2c1 {
-		da9211_pins {
+	i2c1_pins_a: i2c1-pins {
+		pins-da9211 {
 			pinmux = <MT8173_PIN_15_EINT15__FUNC_GPIO15>;
 			bias-pull-up;
 		};
 	};
 
-	mmc0_pins_default: mmc0default {
-		pins_cmd_dat {
+	mmc0_pins_default: mmc0-default-pins {
+		pins-cmd-dat {
 			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
 				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
 				 <MT8173_PIN_59_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
@@ -675,68 +675,68 @@ pins_cmd_dat {
 			bias-pull-up;
 		};
 
-		pins_clk {
+		pins-clk {
 			pinmux = <MT8173_PIN_65_MSDC0_CLK__FUNC_MSDC0_CLK>;
 			bias-pull-down;
 		};
 
-		pins_rst {
+		pins-rst {
 			pinmux = <MT8173_PIN_68_MSDC0_RST___FUNC_MSDC0_RSTB>;
 			bias-pull-up;
 		};
 	};
 
-	mmc1_pins_default: mmc1default {
-		pins_cmd_dat {
+	mmc1_pins_default: mmc1-default-pins {
+		pins-cmd-dat {
 			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
 				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
 				 <MT8173_PIN_75_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
 				 <MT8173_PIN_76_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
 				 <MT8173_PIN_78_MSDC1_CMD__FUNC_MSDC1_CMD>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_4mA>;
+			drive-strength = <4>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
 		};
 
-		pins_clk {
+		pins-clk {
 			pinmux = <MT8173_PIN_77_MSDC1_CLK__FUNC_MSDC1_CLK>;
 			bias-pull-down;
-			drive-strength = <MTK_DRIVE_4mA>;
+			drive-strength = <4>;
 		};
 
-		pins_insert {
+		pins-insert {
 			pinmux = <MT8173_PIN_1_EINT1__FUNC_GPIO1>;
 			bias-pull-up;
 		};
 	};
 
-	mmc3_pins_default: mmc3default {
-		pins_dat {
+	mmc3_pins_default: mmc3-default-pins {
+		pins-dat {
 			pinmux = <MT8173_PIN_22_MSDC3_DAT0__FUNC_MSDC3_DAT0>,
 				 <MT8173_PIN_23_MSDC3_DAT1__FUNC_MSDC3_DAT1>,
 				 <MT8173_PIN_24_MSDC3_DAT2__FUNC_MSDC3_DAT2>,
 				 <MT8173_PIN_25_MSDC3_DAT3__FUNC_MSDC3_DAT3>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_8mA>;
+			drive-strength = <8>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
 		};
 
-		pins_cmd {
+		pins-cmd {
 			pinmux = <MT8173_PIN_27_MSDC3_CMD__FUNC_MSDC3_CMD>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_8mA>;
+			drive-strength = <8>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
 		};
 
-		pins_clk {
+		pins-clk {
 			pinmux = <MT8173_PIN_26_MSDC3_CLK__FUNC_MSDC3_CLK>;
 			bias-pull-down;
-			drive-strength = <MTK_DRIVE_8mA>;
+			drive-strength = <8>;
 		};
 	};
 
-	mmc0_pins_uhs: mmc0 {
-		pins_cmd_dat {
+	mmc0_pins_uhs: mmc0-uhs-pins {
+		pins-cmd-dat {
 			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
 				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
 				 <MT8173_PIN_59_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
@@ -747,109 +747,109 @@ pins_cmd_dat {
 				 <MT8173_PIN_64_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
 				 <MT8173_PIN_66_MSDC0_CMD__FUNC_MSDC0_CMD>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_6mA>;
+			drive-strength = <6>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
 		};
 
-		pins_clk {
+		pins-clk {
 			pinmux = <MT8173_PIN_65_MSDC0_CLK__FUNC_MSDC0_CLK>;
-			drive-strength = <MTK_DRIVE_6mA>;
+			drive-strength = <6>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
 		};
 
-		pins_ds {
+		pins-ds {
 			pinmux = <MT8173_PIN_67_MSDC0_DSL__FUNC_MSDC0_DSL>;
 			drive-strength = <MTK_DRIVE_10mA>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
 		};
 
-		pins_rst {
+		pins-rst {
 			pinmux = <MT8173_PIN_68_MSDC0_RST___FUNC_MSDC0_RSTB>;
 			bias-pull-up;
 		};
 	};
 
-	mmc1_pins_uhs: mmc1 {
-		pins_cmd_dat {
+	mmc1_pins_uhs: mmc1-pins {
+		pins-cmd-dat {
 			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
 				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
 				 <MT8173_PIN_75_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
 				 <MT8173_PIN_76_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
 				 <MT8173_PIN_78_MSDC1_CMD__FUNC_MSDC1_CMD>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_6mA>;
+			drive-strength = <6>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
 		};
 
-		pins_clk {
+		pins-clk {
 			pinmux = <MT8173_PIN_77_MSDC1_CLK__FUNC_MSDC1_CLK>;
-			drive-strength = <MTK_DRIVE_8mA>;
+			drive-strength = <8>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
 		};
 	};
 
-	mmc3_pins_uhs: mmc3 {
-		pins_dat {
+	mmc3_pins_uhs: mmc3-pins {
+		pins-dat {
 			pinmux = <MT8173_PIN_22_MSDC3_DAT0__FUNC_MSDC3_DAT0>,
 				 <MT8173_PIN_23_MSDC3_DAT1__FUNC_MSDC3_DAT1>,
 				 <MT8173_PIN_24_MSDC3_DAT2__FUNC_MSDC3_DAT2>,
 				 <MT8173_PIN_25_MSDC3_DAT3__FUNC_MSDC3_DAT3>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_8mA>;
+			drive-strength = <8>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
 		};
 
-		pins_cmd {
+		pins-cmd {
 			pinmux = <MT8173_PIN_27_MSDC3_CMD__FUNC_MSDC3_CMD>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_8mA>;
+			drive-strength = <8>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
 		};
 
-		pins_clk {
+		pins-clk {
 			pinmux = <MT8173_PIN_26_MSDC3_CLK__FUNC_MSDC3_CLK>;
-			drive-strength = <MTK_DRIVE_8mA>;
+			drive-strength = <8>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
 		};
 	};
 
-	nor_gpio1_pins: nor {
+	nor_gpio1_pins: nor-pins {
 		pins1 {
 			pinmux = <MT8173_PIN_6_EINT6__FUNC_SFCS0>,
 				 <MT8173_PIN_7_EINT7__FUNC_SFHOLD>,
 				 <MT8173_PIN_8_EINT8__FUNC_SFIN>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_4mA>;
+			drive-strength = <4>;
 			bias-pull-up;
 		};
 
 		pins2 {
 			pinmux = <MT8173_PIN_5_EINT5__FUNC_SFOUT>;
-			drive-strength = <MTK_DRIVE_4mA>;
+			drive-strength = <4>;
 			bias-pull-up;
 		};
 
-		pins_clk {
+		pins-clk {
 			pinmux = <MT8173_PIN_9_EINT9__FUNC_SFCK>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_4mA>;
+			drive-strength = <4>;
 			bias-pull-up;
 		};
 	};
 
-	panel_backlight_en_pins: panel_backlight_en_pins {
+	panel_backlight_en_pins: panel-backlight-en-pins {
 		pins1 {
 			pinmux = <MT8173_PIN_95_PCM_TX__FUNC_GPIO95>;
 		};
 	};
 
-	panel_fixed_pins: panel_fixed_pins {
+	panel_fixed_pins: panel-fixed-pins {
 		pins1 {
 			pinmux = <MT8173_PIN_41_CMMCLK__FUNC_GPIO41>;
 		};
 	};
 
-	ps8640_pins: ps8640_pins {
+	ps8640_pins: ps8640-pins {
 		pins1 {
 			pinmux = <MT8173_PIN_92_PCM_CLK__FUNC_GPIO92>,
 				 <MT8173_PIN_115_URTS0__FUNC_GPIO115>,
@@ -857,33 +857,33 @@ pins1 {
 		};
 	};
 
-	ps8640_fixed_pins: ps8640_fixed_pins {
+	ps8640_fixed_pins: ps8640-fixed-pins {
 		pins1 {
 			pinmux = <MT8173_PIN_30_URTS2__FUNC_GPIO30>;
 		};
 	};
 
-	rt5650_irq: rt5650_irq {
-		pins1 {
+	rt5650_irq: rt5650-pins {
+		pins-intn {
 			pinmux = <MT8173_PIN_3_EINT3__FUNC_GPIO3>;
 			bias-pull-down;
 		};
 	};
 
-	sdio_fixed_3v3_pins: sdio_fixed_3v3_pins {
+	sdio_fixed_3v3_pins: sdio-vreg-3v3-pins {
 		pins1 {
 			pinmux = <MT8173_PIN_85_AUD_DAT_MOSI__FUNC_GPIO85>;
 			output-low;
 		};
 	};
 
-	spi_pins_a: spi1 {
+	spi_pins_a: spi1-pins {
 		pins1 {
 			pinmux = <MT8173_PIN_0_EINT0__FUNC_GPIO0>;
 			bias-pull-up;
 		};
 
-		pins_spi {
+		pins-spi {
 			pinmux = <MT8173_PIN_102_MSDC2_DAT2__FUNC_SPI_CK_1_>,
 				 <MT8173_PIN_103_MSDC2_DAT3__FUNC_SPI_MI_1_>,
 				 <MT8173_PIN_104_MSDC2_CLK__FUNC_SPI_MO_1_>,
@@ -892,15 +892,15 @@ pins_spi {
 		};
 	};
 
-	trackpad_irq: trackpad_irq {
-		pins1 {
+	trackpad_irq: trackpad-pins {
+		pins-intn {
 			pinmux = <MT8173_PIN_117_URXD3__FUNC_GPIO117>;
 			input-enable;
 			bias-pull-up;
 		};
 	};
 
-	usb_pins: usb {
+	usb_pins: usb-pins {
 		pins1 {
 			pinmux = <MT8173_PIN_101_MSDC2_DAT1__FUNC_GPIO101>;
 			output-high;
@@ -908,8 +908,8 @@ pins1 {
 		};
 	};
 
-	wifi_wake_pins: wifi_wake_pins {
-		pins1 {
+	wifi_wake_pins: wifi-pins {
+		pins-wake {
 			pinmux = <MT8173_PIN_38_CONN_RST__FUNC_GPIO38>;
 			bias-pull-up;
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 9fffed0ef4bf..51118a4149d8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -172,15 +172,15 @@ &mmc1 {
 };
 
 &pio {
-	disp_pwm0_pins: disp_pwm0_pins {
+	disp_pwm0_pins: disp-pwm0-pins {
 		pins1 {
 			pinmux = <MT8173_PIN_87_DISP_PWM0__FUNC_DISP_PWM0>;
 			output-low;
 		};
 	};
 
-	mmc0_pins_default: mmc0default {
-		pins_cmd_dat {
+	mmc0_pins_default: mmc0-default-pins {
+		pins-cmd-dat {
 			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
 				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
 				 <MT8173_PIN_59_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
@@ -194,19 +194,19 @@ pins_cmd_dat {
 			bias-pull-up;
 		};
 
-		pins_clk {
+		pins-clk {
 			pinmux = <MT8173_PIN_65_MSDC0_CLK__FUNC_MSDC0_CLK>;
 			bias-pull-down;
 		};
 
-		pins_rst {
+		pins-rst {
 			pinmux = <MT8173_PIN_68_MSDC0_RST___FUNC_MSDC0_RSTB>;
 			bias-pull-up;
 		};
 	};
 
-	mmc1_pins_default: mmc1default {
-		pins_cmd_dat {
+	mmc1_pins_default: mmc1-default-pins {
+		pins-cmd-dat {
 			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
 				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
 				 <MT8173_PIN_75_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
@@ -217,20 +217,20 @@ pins_cmd_dat {
 			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
 		};
 
-		pins_clk {
+		pins-clk {
 			pinmux = <MT8173_PIN_77_MSDC1_CLK__FUNC_MSDC1_CLK>;
 			bias-pull-down;
 			drive-strength = <4>;
 		};
 
-		pins_insert {
+		pins-insert {
 			pinmux = <MT8173_PIN_132_I2S0_DATA1__FUNC_GPIO132>;
 			bias-pull-up;
 		};
 	};
 
-	mmc0_pins_uhs: mmc0 {
-		pins_cmd_dat {
+	mmc0_pins_uhs: mmc0-uhs-pins {
+		pins-cmd-dat {
 			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
 				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
 				 <MT8173_PIN_59_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
@@ -245,20 +245,29 @@ pins_cmd_dat {
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
 		};
 
-		pins_clk {
+		pins-clk {
 			pinmux = <MT8173_PIN_65_MSDC0_CLK__FUNC_MSDC0_CLK>;
 			drive-strength = <2>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
 		};
 
-		pins_rst {
+		pins-rst {
 			pinmux = <MT8173_PIN_68_MSDC0_RST___FUNC_MSDC0_RSTB>;
 			bias-pull-up;
 		};
 	};
 
-	mmc1_pins_uhs: mmc1 {
-		pins_cmd_dat {
+	spi_pins_a: spi0-pins {
+		pins-bus {
+			pinmux = <MT8173_PIN_69_SPI_CK__FUNC_SPI_CK_0_>,
+				<MT8173_PIN_70_SPI_MI__FUNC_SPI_MI_0_>,
+				<MT8173_PIN_71_SPI_MO__FUNC_SPI_MO_0_>,
+				<MT8173_PIN_72_SPI_CS__FUNC_SPI_CS_0_>;
+		};
+	};
+
+	mmc1_pins_uhs: mmc1-uhs-pins {
+		pins-cmd-dat {
 			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
 				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
 				 <MT8173_PIN_75_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
@@ -269,22 +278,22 @@ pins_cmd_dat {
 			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
 		};
 
-		pins_clk {
+		pins-clk {
 			pinmux = <MT8173_PIN_77_MSDC1_CLK__FUNC_MSDC1_CLK>;
 			drive-strength = <4>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
 		};
 	};
 
-	usb_id_pins_float: usb_iddig_pull_up {
-		pins_iddig {
+	usb_id_pins_float: usb-iddig-pu-pins {
+		pins-iddig-pu {
 			pinmux = <MT8173_PIN_16_IDDIG__FUNC_IDDIG>;
 			bias-pull-up;
 		};
 	};
 
-	usb_id_pins_ground: usb_iddig_pull_down {
-		pins_iddig {
+	usb_id_pins_ground: usb-iddig-pd-pins {
+		pins-iddig-pd {
 			pinmux = <MT8173_PIN_16_IDDIG__FUNC_IDDIG>;
 			bias-pull-down;
 		};
@@ -473,17 +482,6 @@ mt6397_vibr_reg: ldo_vibr {
 	};
 };
 
-&pio {
-	spi_pins_a: spi0 {
-		pins_spi {
-			pinmux = <MT8173_PIN_69_SPI_CK__FUNC_SPI_CK_0_>,
-				<MT8173_PIN_70_SPI_MI__FUNC_SPI_MI_0_>,
-				<MT8173_PIN_71_SPI_MO__FUNC_SPI_MO_0_>,
-				<MT8173_PIN_72_SPI_CS__FUNC_SPI_CS_0_>;
-		};
-	};
-};
-
 &spi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi_pins_a>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 122a57c3780b..78c2ccd5be13 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -391,58 +391,58 @@ pio: pinctrl@1000b000 {
 				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
 
-			hdmi_pin: xxx {
+			hdmi_pin: hdmi-hotplug-pins {
 
 				/*hdmi htplg pin*/
-				pins1 {
+				pins-htplg {
 					pinmux = <MT8173_PIN_21_HTPLG__FUNC_HTPLG>;
 					input-enable;
 					bias-pull-down;
 				};
 			};
 
-			i2c0_pins_a: i2c0 {
-				pins1 {
+			i2c0_pins_a: i2c0-pins {
+				pins-bus {
 					pinmux = <MT8173_PIN_45_SDA0__FUNC_SDA0>,
 						 <MT8173_PIN_46_SCL0__FUNC_SCL0>;
 					bias-disable;
 				};
 			};
 
-			i2c1_pins_a: i2c1 {
-				pins1 {
+			i2c1_pins_a: i2c1-pins {
+				pins-bus {
 					pinmux = <MT8173_PIN_125_SDA1__FUNC_SDA1>,
 						 <MT8173_PIN_126_SCL1__FUNC_SCL1>;
 					bias-disable;
 				};
 			};
 
-			i2c2_pins_a: i2c2 {
-				pins1 {
+			i2c2_pins_a: i2c2-pins {
+				pins-bus {
 					pinmux = <MT8173_PIN_43_SDA2__FUNC_SDA2>,
 						 <MT8173_PIN_44_SCL2__FUNC_SCL2>;
 					bias-disable;
 				};
 			};
 
-			i2c3_pins_a: i2c3 {
-				pins1 {
+			i2c3_pins_a: i2c3-pins {
+				pins-bus {
 					pinmux = <MT8173_PIN_106_SDA3__FUNC_SDA3>,
 						 <MT8173_PIN_107_SCL3__FUNC_SCL3>;
 					bias-disable;
 				};
 			};
 
-			i2c4_pins_a: i2c4 {
-				pins1 {
+			i2c4_pins_a: i2c4-pins {
+				pins-bus {
 					pinmux = <MT8173_PIN_133_SDA4__FUNC_SDA4>,
 						 <MT8173_PIN_134_SCL4__FUNC_SCL4>;
 					bias-disable;
 				};
 			};
 
-			i2c6_pins_a: i2c6 {
-				pins1 {
+			i2c6_pins_a: i2c6-pins {
+				pins-bus {
 					pinmux = <MT8173_PIN_100_MSDC2_DAT0__FUNC_SDA5>,
 						 <MT8173_PIN_101_MSDC2_DAT1__FUNC_SCL5>;
 					bias-disable;
-- 
2.52.0


