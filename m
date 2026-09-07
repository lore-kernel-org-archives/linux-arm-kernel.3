Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754BBC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1yQZRT1NDiSBMDYApICTKX6DjUaKvxFXJuDnDEjfIo=; b=qoRfXWO0DJVV2vjjyoI8BMLNSQ
	grsGhC0t3CqsWG4gsllebVN9aPCOFa4+Y4GKcikvihd3fYAYRnbdlQz9t7rOlm0vfI5W/x/b79Enx
	N0UbSI1qwCMjnCNhfWxnen0gIwFOYuS+2aJ0LOansicGlmL2nPrUvOZJjf88ei1fRm+uaO7OYAWnK
	hQuo0PE+iTuw2CSWS8Rvxik5ZSwxOnv6sT83A03yT1iCGJwFZ8Py3qF9p3TqlrtLd2Fb7DwGm3OHJ
	O426gjlCrVlOe7i2/JsEAk2fcjXAo4NxxKUiMbRVS2bVhxZek21LK85IuFcSFQlUFNOADoEFi6Olm
	LDQFiZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XjO-00000006gdm-1BGf;
	Mon, 07 Sep 2026 11:41:46 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XjJ-00000006gaV-2HeA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:41:44 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-484374f54d0so2084254f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781300; x=1789386100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1yQZRT1NDiSBMDYApICTKX6DjUaKvxFXJuDnDEjfIo=;
        b=lR5hvQq1ZIpLLNPaTd1PgMumRj5JIdcJ7PDj1XLDkbUy0g1JMgGbHmqc57PWQDb6Qq
         +yZV1GWa39TqIvjVXi/ykibOJSdI9rS/GxbiwORwQhiaOSYbYoNOk//kD+Rb2nedPk3Q
         AAtDAflgwfWySe6ke3gOtKJvVe+ED0kl+GWLPzk9VMUDLmHDP/D+A00qk6KwpUJtd+Wv
         nSWi5u0g1z2l8i51QmdDcoQWr/AT+hJDHg5OsbfLW28+uQ+IHjKE1VVE5pYyY0TypPDm
         uL3GJPKCeH+ocpQe4fuPpUaSDaFWQhf/VXCTtb/Bu+PWKGd3yJOM7QdW6tyDyGI1djGT
         PlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781300; x=1789386100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1yQZRT1NDiSBMDYApICTKX6DjUaKvxFXJuDnDEjfIo=;
        b=DWzMvORV+2vfdrBp4xRdamlaiEOWLww9NplRBUcl/CIYiRuTsSMT3cLJXcXh6ENn+I
         uvXbUaglibiPsI/9STDtDnuBMUGCgUCjNIOA1mHWkJQfqqnPre6tsHfz2mIm1mJVY95T
         3Twd2ty1WiyUqxf0e/CUjlB3sBbGcQUxV8ZisGOGxvL1PyRSb2RfmkWwf/3E+G+Nc4Mu
         0IdTDVPqXtJEiVVhhBuTfNiq7mf2viXKEEbkh9E0maVKaiMMYiZMOzvxduFpec4563F1
         r4C7BCsjq0Xy6NJ2ee1XbqijrpyQWgYfwi47u1uWPjQtZgUiFuHPeD/mdOhZmqWceYb2
         RaZg==
X-Forwarded-Encrypted: i=1; AKwUvBxQt+GG9jhTKdgEBzJ35/YGGJ5CVpN+F6C4J8Aj2mz4PXEzxICZOfV7nd3NxgMujpOX3bKc/rPbf4U6zfmSnKS1@lists.infradead.org
X-Gm-Message-State: AFuF++mwRtRa4CCiFt3Utj8zMNtCNM5jMVN3soa9EzM+C4rtoDkx9oR5
	goSNjkNn1MesLSpffGS6/O3EkUgKo4XIm4Qxtr3vP5R7DHMh78OEQUaK
X-Gm-Gg: AYBFou2gnurSUk4rD5cIOySCC8vwZDBDnM4Q66Tdm3vK4E+yndUguXAlJ1wmiFD8IMd
	6GVQUSH0QCyLVJCPlQO8oXfj6uekW5R0TFOB/XGOaBVBLyL6eIfs67UWAODmuHm38DWc2sPv9D1
	7V1qltXxvAJxDer1ZCBquEaP5ElpCdFrUqxaSeVjzt9+du5cf0zs9WLMxYvSuSgsSYKu8IUPctW
	KyYqp+dOUeJ7y+RZnOILfFtKT+Fb815fBbDp22p9I+zim4MfRjNnIy8c0V9+CINjifBS/hszc4Y
	33uqF7sOIRagmrrGkldDlEqXhmUiLl+hz81F7tYZw4QHnRU1mR1dheFfDqBoGv8AEIRYOWjbyfC
	rORDrTjE45mOynK/+5QNP5Lqs67p3110ViJ4AYklDLvsp3WuVpzpNDdQVuAujz+ktS/1vMxtF3A
	Cw3QifMqxk22OWXDK4mZpJ2HplQJlA7l7m5YOH4GUgURjAHuMzLRnauhwseeq2LlNXw78daTn0F
	vXgI5JU37ub39t1VwPOwz9laUjohUTKR9l9bnea7Z0FSwyG53mgOdUHCBJr2/s=
X-Received: by 2002:a05:6000:612:b0:485:8e19:1979 with SMTP id ffacd0b85a97d-4858e191d46mr35494206f8f.11.1788781299615;
        Mon, 07 Sep 2026 04:41:39 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:39 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 13:41:32 +0200
Subject: [PATCH 3/4] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-3-ca0c63c2994f@toradex.com>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_044141_631531_67EE7058 
X-CRM114-Status: GOOD (  15.39  )
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

The overlay is also combined with the Verdin iMX8M Plus Dahlia carrier
board device trees to provide ready-to-use DTBs in both WiFi and
non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   7 ++
 .../imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso  | 132 +++++++++++++++++++++
 2 files changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 715235b62912..14ea662bdcfd 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -731,6 +731,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
@@ -739,7 +740,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
@@ -751,9 +754,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
 imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb \
+	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-dahlia.dtb \
+	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
 imx8mp-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..a2cba3d5a0fc
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
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
+
+&{/} {
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt101hvlnwc00", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		/*
+		 * Use a combined horizontal sync and back porch of 96 pixels. The
+		 * panel data sheet value of 88 pixels results in unstable display
+		 * output with the Verdin iMX8M Plus display pipeline.
+		 */
+		panel-timing {
+			clock-frequency = <69300000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <64 64 64>;
+			hfront-porch = <72 72 72>;
+			hsync-active = <0>;
+			hsync-len = <32 32 32>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <15 15 15>;
+			vfront-porch = <15 15 15>;
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
+&backlight {
+	/* Verdin PWM_3_DSI (SODIMM 19) */
+	pwms = <&pwm3 0 6666667 0>;
+
+	status = "okay";
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
+		/* Verdin GPIO_10_DSI (SODIMM 21) */
+		enable-gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
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


