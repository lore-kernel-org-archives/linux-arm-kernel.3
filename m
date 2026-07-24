Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B82C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVTL1LIZIJBZ+HNEuKmE3itj+OwBbRheOKwBy4/UbDA=; b=UGZhRVeOwBm8Phk4S0FJYnQrpE
	29Cqp0a6Y/lyOEZl4S8qCumks6iSdJo0iSxCpRV0+VbhJAlWj7uxsdapfn/1my1OdqLYR5WiFjOCm
	/dxms/UX8KJa/QCyziyKuZMDxIs0jFf1OQomdliIlCBKh0od6F3+9rm2+iEaeoO7cYAPiSLyO8nwJ
	ddhAB97mrmA7VdAPwW1n1oNZk+e2PIBHytPloFb5pPtdDmuikvKzb2P1NfD8wYgNow1Dwlm0ME5PH
	7d3OSU87uKSFiZkhEIcehfS2e8I4bJ5V0qMnLId3dadaPH1QRn7VJHnGgnHdmzLeoiw9xZaxobbTj
	RVvFYsZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK9Q-0000000Gzxp-2mTE;
	Fri, 24 Jul 2026 17:57:36 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK9O-0000000GzxH-3E1L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 17:57:36 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-9725084c547so411058241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784915853; x=1785520653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVTL1LIZIJBZ+HNEuKmE3itj+OwBbRheOKwBy4/UbDA=;
        b=RsXcJloN8Ce+KDpvw8BQ+ObylCiuGZvumr40SgzJ4bonhm8EDX8Zwfwkec5tKHI7/H
         zvsnjM5vT/O0NNt3Y60zzqRY+j2ynWZ43QETSQJ/LsB9yFaPfbXpchb14At7ipf1qRdY
         dNeNgljMUaNtoojcU0G0mUHLA4MiRFhyt6KM29Supa0XCAfuQ7qnG418JJVV6ickJbQG
         KGFYsviYshEJ/QMUwgjlyZfnmF1bcwPa7MccU2fZq8IW5D/uQS1YklWigD+38QhBR7qT
         sFR7Y+siSMzBNq4VnD3wVfCwr2svFFGDQF5Sp8G1rPTGxTNrz1eekWwsnvkG8ilyDqYW
         bpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784915853; x=1785520653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sVTL1LIZIJBZ+HNEuKmE3itj+OwBbRheOKwBy4/UbDA=;
        b=fcnFXFZz8WkOCsi1j1362ZNPRCqTdtRvnpxcyaA927H8u2zHR5UIJFe+8sSocvpXA6
         ykCSDWjsnZHbjuw3w518d3PUFpYqFqFaxEWiCK8RNOhmC3Dyb8E4KqYIPfoNJJ2H71XW
         B9i7B4OpE2qQMOJpDnoM50Xo6alJxU/gpmRi2p64qXoRyvsg3E2gAapzltkEeVg59Mly
         544KrqeaIrjKAQy6cIdCehRN5MwvV4BXGH53ufMKn4HD23dtjJHjN+apaWHtZ4WkSPnB
         h19IVHYSAAWZfw5Nkpgix1898tQaNjfzCQNgzU5eMrL236laTXuUtIHsrt83NHxUer1M
         ySVA==
X-Forwarded-Encrypted: i=1; AHgh+RpvcBqe+SUBlsdGyagJ9L8FrkfZm5Ll5sr6dak/pdqoSEf+PJC47fLcDtUAQTJEJyMAXdOr2e8/WvC3i6cm6Ewh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/wgTZvcIQ47Mhyd/5SinCdpLffawdQk8rRK/W8wbQdhUvIzR/
	aX2dsIhzHKBRatPrFUg662Yi4lLWKk/eKlloSgixijcy7S+116xPgqA5
X-Gm-Gg: AR+sD118kLjjFo0GwcKemyFIMwIjU/WByoV58OBCG4aP3fuoXnI0FTiowyRF3YUGxyG
	pTc1wQwCqjc+2AF6CKqZpWwGmwTMypZZAuvYGPSxkT2JR0VkSpYVF0nZnWiJUs6fraslF53i2fW
	o6aoB612p0AsNeyX2aPlBkQm3C3+VHPyHUpyhIlU4wW60rRp4oWuCTuv7pLp2693Gvl7LeCHwG8
	Quw5pgGpkiT/A6WV5ho3tTq0PBBBboubNG58ItsAIWzU00pCjtEs2jkSFMRc8FyFyYWZFrd9Fk9
	7jcElVy3MhW0SHq7iDWTk9+qfx7lCZXm5oWL15AfrVbO07GqfH5u+JWV84FIwR+aG2YGfkTBqi0
	+yA+8AN5Ysd3153nNojDavRMu5Y+Dnuel/dl4E1ymg39/mLu5BHaCPhB36ngyBGZdfr1ia8jpZs
	LvAnPn3/2OpQ==
X-Received: by 2002:a05:6102:919:b0:738:3525:43ff with SMTP id ada2fe7eead31-74d5fcd62d1mr4439412137.13.1784915853534;
        Fri, 24 Jul 2026 10:57:33 -0700 (PDT)
Received: from leonardoc-nb ([2804:1b3:a700:4ed8:4d0f:883e:31be:d914])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97774c901f5sm368376241.6.2026.07.24.10.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:57:33 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	leonardo.costa@toradex.com
Subject: [PATCH 1/1] arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Fri, 24 Jul 2026 14:56:34 -0300
Message-ID: <20260724175657.15398-2-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724175657.15398-1-leoreis.costa@gmail.com>
References: <20260724175657.15398-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_105734_836159_BC2AD3F4 
X-CRM114-Status: GOOD (  15.30  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
touch controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 133 ++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index fbbaf9478ec59..201460ee5669e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -180,6 +180,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
@@ -200,6 +201,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.d
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
@@ -223,6 +225,8 @@ imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640-24mhz.dtbo
 imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
new file mode 100644
index 0000000000000..db8c9d53763dd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1" V2 Used on Dahlia (X17) and Development Board (X48) that expose DSI_1
+ * via a Samtec LSS-130 connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-lvds-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_dsi_1_bkl_en>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT (SODIMM 46) - DSI_1_BKL_EN_LVDS */
+		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+		pwms = <&pwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_dsi_lvds>;
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <70000000>;
+			hactive = <1280>;
+			hback-porch = <55>;
+			hfront-porch = <55>;
+			hsync-len = <45>;
+			vactive = <800>;
+			vback-porch = <5>;
+			vfront-porch = <5>;
+			vsync-len = <3>;
+			de-active = <1>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_lvds: regulator-dsi-lvds {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>, <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		interrupt-parent = <&gpio3>;
+		interrupts = <15 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lvds_ti_sn65dsi84 {
+	vcc-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_lvds_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			dsi_lvds_bridge_out: endpoint {
+				remote-endpoint = <&panel_lvds_bridge_in>;
+			};
+		};
+	};
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

