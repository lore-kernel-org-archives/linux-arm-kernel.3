Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D78C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf6ooxHCpPCPwrMpnj1PsrPR9RgeZkshiryAmOkeRBM=; b=rbSFhwkgJZJKr8o+dyvbDKfrM/
	xgLhj5sS86fI4pYHCZeJ9ysZyK95xLev6fw/OCZkj+ThXNO9DaHgqBoO83Q29ulYq/okWOxpfPAPS
	H3S4Vr05zseloGxeuuB/QlV5JsVoaOJCBcyz5ektmsG9kXgq6oPwkP1ts35lh+NibiZ65jrGw8hsi
	aaYBBi6e88obeDGAoOBgF6cBVpWcOYJTnjzAAp13lGax9LsEVZOdNJw7MAwcc+OJz6BFCQIusXdb1
	4rBHo6A+JXxcReyNh6gX08nlIoQ2wT5PCBXU0b9sXilW+7kXqb+y6MggVBqafaCjIzh/xZsRtqVM4
	JrFRVwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhf-0000000Gpah-35YI;
	Fri, 24 Jul 2026 16:24:51 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIha-0000000GpXO-24Eh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:24:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493f6de72faso5616095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910285; x=1785515085; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zf6ooxHCpPCPwrMpnj1PsrPR9RgeZkshiryAmOkeRBM=;
        b=i9/mk3e4pF+QXtihxEnTwX2mEKJTLwO0L+6iQub//24+YOlKkxRP/zsVHXefzT0OJu
         kwQ6AWFqecbsF3ilQQD6N6MBFAs0WYGzygYK06NlEyf5bHkNqAsEhuICtLF/x7g5IhRe
         mh8pWPpeCfu7l04t4nTfP71oll25Er9ckODQIQDkTE4Y5IYVqqOws53SkFYmJabZSzhJ
         wJkULqL/5sQ+m35gk0UM2yV8h4HlEe81UGqyGgcO6i+V4O7Tuz6pq/7KxcF82bOcHQw9
         ueYbYLBS2hcpXVdyzNEdRkPAL4KJBvUkNYE5CN59yzoiqA4BxuwcUPaAlkgTYLdGrMAo
         tgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910285; x=1785515085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zf6ooxHCpPCPwrMpnj1PsrPR9RgeZkshiryAmOkeRBM=;
        b=lIUrukd5B2QGU7wW13oVKU1PqtkBad+jyOAkarSpg1vvQMI/9lUxEEQGTkbF6DEQEW
         QF4qe5io5z2+pFftGg0V9dYAQKcBm8mEihyJ7NfIY76MNyrJH9oaoPnYfoxvGXtPcKyC
         nd72+Yn38H3pTq7qCLKEbKg59dRfm3sYQFW+d72+F/FnesJSq1XuHdx85HCiEyGclVxk
         WGUu9iZNQZ0xdGDuKaRpFlc+RKA490k4mwY1pwoW5Jyl0iMmCyM3vMl0jRjXxJZOLTgq
         JPLMZFbFhi75X2ZpmJh19PUvXlV37P2org5d92PBhr1a/torZhtFTIlCWP3NF3q/MbJI
         M2qQ==
X-Forwarded-Encrypted: i=1; AHgh+Roqp/L5NpQ2NyVcydC3kq6S11jcJt0HCphf+CFlAY47cnbANGlXLVrd2yy9qUMs20F56Duev1PyrUWtjd1ISkvg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2YmGTI+QJPIlEJlSH4uW2SCYMbuv4qFFO/6gwsD7G0FxaTWDu
	dO4qsTYRY33P7wT5K4nznyuI+GM8nbUHsF1fXfm1khNU1DeGY2OPc5Wh
X-Gm-Gg: AR+sD12URzw/0CAioDXdyFTRTUUADlYCn4AGvhFC9D+zybTmWK5UfI8zhPDuzhngK5m
	WLNagTZw7L0tR1RokjZ6BR6Q0KwYjGZR/lFkzMkemdJleF32NRmMcqoWHFZ8r5DSX2+e2RYCnzf
	cq6A76y0LbsroSOk/XctaPEcqLSwaDhGCqlgBS0ZU8nZK9WXzAGMvmOO0Fqm5Dm1k1po2rE+7NY
	wMU3VN0VlL+Nh6b7vR4/7OIUKmjJZKcjizmMbXjMxhPJldFj5l3eki7z8iIMTdzvQ0p+BvBxEHr
	N160kQkzcg1UEA3NzzruAign+EwyH9ic5M+AWPLCIRhCkkKs5X4gTTBUErG+2Z7QVPRyvReA5z+
	ChLx8vMj8kqofqsANjMouLTx5c2YTF6Miorqd4LifIK4fC8pTnlB53xhToJk4Tlw+uimc97w0D9
	EAMF7o3uz7s2gvHUpubZ3c9T5+yBACxGTTVD0eVoNaaS1G4GvgQjfcE03P9mvNiJF1s7NpY6jBm
	BH3tw==
X-Received: by 2002:a05:600c:474a:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-4969f3d5ad7mr14824415e9.16.1784910284450;
        Fri, 24 Jul 2026 09:24:44 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:43 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:30 +0200
Subject: [PATCH v2 4/7] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 Capacitive Touch Display 10.1" DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-4-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_092446_620494_42B5B913 
X-CRM114-Status: GOOD (  14.31  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Verdin DSI_1 interface. The display features an internal
Texas Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT101HVLNWC00 10.1" WXGA IPS TFT LCD panel. The touch input is
provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the Verdin iMX8M Mini Dahlia carrier
board device trees to provide ready-to-use DTBs in both WiFi and
non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   7 ++
 .../imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso  | 129 +++++++++++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 91ae54931818..00dc2893c754 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -181,6 +181,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
@@ -189,7 +190,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
@@ -202,9 +205,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
 imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb \
+	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-dahlia.dtb \
+	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..5626903d668a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" on Verdin DSI_1.
+ * On Dahlia (X17) and Development Board (X48), DSI_1 is exposed via a
+ * Samtec LSS-130 connector and requires the Toradex DSI Display Adapter
+ * to convert to FFC/FPC connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-dsi
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-display-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) */
+		pwms = <&pwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt101hvlnwc00", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <71100000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <64 64 64>;
+			hfront-porch = <36 36 36>;
+			hsync-active = <0>;
+			hsync-len = <24 24 24>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <24 24 24>;
+			vfront-porch = <8 8 8>;
+			vsync-active = <0>;
+			vsync-len = <8 8 8>;
+		};
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_10_dsi>;
+		/* Verdin GPIO_10_DSI (SODIMM 21) - DSI_1_BKL_EN */
+		enable-gpios = <&gpio3 3 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				dsi_lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_lvds_bridge_in>;
+				};
+			};
+		};
+	};
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2132";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>, <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
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
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

-- 
2.43.0


