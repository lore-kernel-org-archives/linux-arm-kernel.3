Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430F1C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpCX0meP81IgLMRKrMih3dFzB8TrFYkEOwnV4YJCCJ4=; b=Ev4RgPJQXqd3DcW5yjumDsKvYJ
	jepa7CujSF0HCqRo/7FTnAlVrGUN94+qhy6P2452CvpeQ9mz4d9u71KPg0BzwtKimeoFVDfst0bZ2
	EBIo9o68YC1sBTKMjK3FuQ21ixE6Zdz43mckELdrmEJ6CtvxdIB4H11cc0vcW3Xu9TQ2DR520KLOY
	5B1k8T9T+OxmwPGK2yCg8W00gTo9acveDMeKyCddOQmRRjeU2doZZxdfW5CrUTR5S28FCtLUdVxS4
	U2dKZrAGggpPugKvbGtGFxl6qy5ejPwg24u0cyCY/zPDi74g+EFtfadZAK/Wdn8AQrBX964atFfEY
	onDZRWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVaL-00000000kyA-3J8k;
	Thu, 13 Aug 2026 13:35:05 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVaJ-00000000kw8-0Q3F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:35:04 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-848743155bcso959579b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628102; x=1787232902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpCX0meP81IgLMRKrMih3dFzB8TrFYkEOwnV4YJCCJ4=;
        b=gs7hkPN9Q04rsWTSB86npwpR5j9E/3HyZPpu9Kw2WTri4wGQQ4nRBDNPoUwEXiB3fr
         WtSEl3a4IKUsxfZYmbIAcXcvn7HZTmWTp8oskCvgTIk1zoXaF3/aWdd8ilNzNJdE69Xr
         BZ1uXWMzKGd958I5WwMFJRYoEubZ3yPuGks6n3S1+/9DzR0jtjrWydNkGyy0u2/ltoGW
         dh/K7JQxpP2CG6KCtyzl7pKzdMsGL2rXyiSP/EL/4Nv3mWhMHcdLrdrKDCCYgUktM2L9
         x/5KlV7v/rw2SVicztqjG015u7fFQF8Mf6irZ+1BAzut4gMbNbHl0Y45eIfkWoRW5QuH
         1O3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628102; x=1787232902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TpCX0meP81IgLMRKrMih3dFzB8TrFYkEOwnV4YJCCJ4=;
        b=sXgDBE8THp5aS3O26BRotBOOp3MsehGx5DwcxL5yQ4mgRgCPtiM5yN2bo3EXNL+3vR
         pV/EbKAJT+KZDvqTflGRfAnRiwJNZa2qhGWCf12Nzc1xvS5Tf4yuRgINleho8g4YAe4f
         ZqKLFKPtWNqAqjH9y8juyZSFPTQXfwuVlqoaPSb8gcqXcoH1XNLAsU0rf/mkRliB7jaG
         GESXlJgFuqCtgnmd2IeXDOMkc4KB5Q15v/o8kc+dDO2yRvSK8gCTXjnKh2sdRnDI59ac
         ofexZQO3XSkU4/80GEvVPoIl7jwNdAaizzhbzFK1iFzgWQn6WdN/18+4q0Sy4KeVlxhd
         z0iQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLLmOSW/60rFaUZBoQ6KacRwUa+oYlGktaL6RwPQmht9TCgWOEbrUCF9Or97OV4pPTqqCjmhWhbGNZrwRsiFJ+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/DQRzy1bZZT4IQEq0KpuLGvuGvp2qebiC51NqfGxWHYEvnIzk
	KSnzXSoMeV1WKd0R3lvfSFkvp8IXxgvdslCiaDSNpB7evpOQwOxcNbLT
X-Gm-Gg: AR+sD12YqFDtSIu02E+ll4VM0aHXkRbyeNJ+XeIsxmu54pTzKL5/D3Ti+UGvHatyp/2
	+JwIajxn2rwq1qieWICt+HZL8WCJAwjZMGYi00BjxY+so/E93hoXAQ1BX5fXRBbztCVVcAsHQCl
	cFd5dgBAVbzKZjGmY5DUN8v0iX6hEgJQ2eAYXbM1QFOLySV0fvD/4sjVwnyP7VxME2D/8rBdJQH
	zuCIgz6E1cffYLKL4oSIptvpGPoGYDE/vrerOJG+17Biu75NsVtmDtcZF7ARGB9BPDy/IsS9+hp
	DvvDVT9zgH8xR9n/uAzBLdiAs0ek0wQYN87T3yXejzoQxekP2DwOk4w5yptSSERyZyyrqSjLL76
	TJteVEXRYyUvUZJDiPXDeiBX8bKCymaDv3Vg+BSufahH/1BA7nnG2tPW7BujC4gJcGYS8XI5aVX
	coOGFZYa0JiXU8lQb4DZElLxlz/iRQmRK729QIJoMCFOaU/U7O01pWmdE9yY9PjdRqo2o=
X-Received: by 2002:a05:6a20:2d26:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3cc5539719bmr7639940637.22.1786628101706;
        Thu, 13 Aug 2026 06:35:01 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:35:00 -0700 (PDT)
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
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 5/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Thu, 13 Aug 2026 10:33:34 -0300
Message-ID: <20260813133335.1941580-6-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133335.1941580-1-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_063503_162316_198B0BE3 
X-CRM114-Status: GOOD (  15.38  )
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
 arch/arm64/boot/dts/freescale/Makefile        |   5 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 129 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2bfed5ac66ac..236bfb6a1e19 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -510,6 +510,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
@@ -521,6 +522,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
@@ -532,6 +534,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..32828e9bc534
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1" V2, used on Dahlia (X17) and Development Board (X48) that expose DSI_1
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
+	panel-lvds-bridge {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight>;
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
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&backlight {
+	/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+	pwms = <&pwm3 0 6666667 0>;
+
+	status = "okay";
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
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>,
+			    <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif1 {
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

