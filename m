Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64957C53216
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9/qs/F9HobWdTc41kv/ETxwCjjDOI/YVDkVTNYkddc=; b=C9hTstyJvAmg9sNisr/Kup0CuM
	qX8vUeUPy9nCwiuXztO4R4cxRMdLul8gSPSht7HXiZnErPC4IWHtWV/QpNnVxCK48TJrKf9XMEFXJ
	Nw65gyTEJy7ppnxfmE27BU5SSPBth655B5Goa4A4rlDElQFTOrRjgP2nyn1LJObnElTYDP0Jmem8C
	6/07bSK2U64VTdGstEmsIcPjW+pE77lOS1dNw9n9qtbYchGsnrcLrxPb/zA0E9X7b0rclBMM2NJch
	rSaAQzoso7R9Mr0cccP36MkyFUCuY8m31bLqfHwFkt5k/GMCsVReQu+lB7VX19sLP1Cc3cG0O4/fw
	vO7LDJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhf-0000000Gpb5-3cCg;
	Fri, 24 Jul 2026 16:24:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhc-0000000GpYE-3lW2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:24:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-495590ba856so6025645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910287; x=1785515087; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9/qs/F9HobWdTc41kv/ETxwCjjDOI/YVDkVTNYkddc=;
        b=d6Kq/sWLR807/CDFmP18WumefquAb5qvOZ60ER5T40Oe9448VK9E+eewp93fYwbSpy
         Dn4wPul12SQjodM2pklkdLAKje38+aIlpdr9WRMg6f/WWXvWq8d39CzLHUUk9XHTFPrZ
         mXbpwPVtkDAJN7GXq6K0pg6CRNrfH3W1aPV4BaO/X2wRvRSHwzDkPH4B80KfwAebrbcX
         ksGFvquSC/1qw+ekXPOfh/lG3+eimVfi91ehcWnxWBWOohCCA/FKl+Y0ICEa5M1w9DCl
         RxXS+KbReBel+D5IQX+GZ3dpm31W1V2C7C4n0wXvUPuh/VG5SYU6hMJXwHGtDVnucbGQ
         VJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910287; x=1785515087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9/qs/F9HobWdTc41kv/ETxwCjjDOI/YVDkVTNYkddc=;
        b=DMJ2QXCIdoBUsr3mXci1m6mHx0xW/xTYdFbq5U3P7qqjSBKAMNnTcKGNcfa3AQ6EvN
         lXglI18uK1beQMMViZV9NOQkD9x7XKTBFlwONVwnvS9baoIYX1Ru4CRnU3EUbNkZDPYc
         kuvsezraQ0EniHKDCj+5Yx8f1LS4Hr+zuRF0WslkdW5gEHkPm55AjUswRqprm0wR2SSZ
         Ukx1NEEC9R2JJFQz+hdDvWVhZ+IgaiQERZhQ07i3vwVg7ePGVQEkKWz6M6zvKe801/kk
         F/uNZjBm6BNxRWmd1UtqYVzoLOQz6s0+pC33rg/6Ncy0VZI5uOHwMgp+nE/hCPmBg0TZ
         JcGg==
X-Forwarded-Encrypted: i=1; AHgh+RqgMqLRhYq0YALgPKcddEWiLHttvhWl9RvtRH8s1q4EJsEKYjth0Lg9Bm/ErFqHC4nJJfaZ5WKkuRWgNBDKD39n@lists.infradead.org
X-Gm-Message-State: AOJu0YzC/TQ4/aDxfa18C0GsiirDMatX3b0SPVJS7yLmpEGRlGTmR1iJ
	V5NE2nQxZvFSlU2HBXsTzZnHrKzQOd6XvTTP24vZuN11IEt7u1JomFWy
X-Gm-Gg: AR+sD13Tba5OQYqgiBmp48iWZI7FroSmN1yC1y4fsGg6ChnzAMgzkMq1fS2TPL7IlKd
	uwedYlxkn6X2Vh5fy4pvFww3nL8ZRWDrYZnpTP0oxVe861ctIPbomXuWPYd8mUAy+GOLymFOUs3
	35WFUWdBvJBeVPb0rcD+eSVK/iIOlNqFzW2lmQnM5TIxizDwj23sXCE4+gllogUKnyJuyDPCl+j
	8Lhgs8jSgyA+qA6MYapGCBwyebjkGMiH+uNjXmDhJn8/R4ohkNskgqAejboP58od2+vc2YMlwOn
	Mynq05t9eSS8A/WLpvX34ZLiUoCtWwzZ+baFrC8MzRs34A+ToFFOwRRzSkeS7ybtCKZO5+ijKWN
	MX35LIs463PnCDdD2IUl4wqVCzMPS+gDoLiqxulIz7szsWCzK/FK8zcDnegv0W8ALZNCK78Zv6v
	UrQ2kIUru8VA7bHD+pN/Ms/T3wIo4h+Rz2j7QQZJMjgF1h+jwEFI+crHy6lqI5qYnzBf71VAP2e
	Rx6AA==
X-Received: by 2002:a05:600c:5246:b0:495:6482:9d8c with SMTP id 5b1f17b1804b1-49573d21d8emr93253455e9.37.1784910286651;
        Fri, 24 Jul 2026 09:24:46 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:45 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:31 +0200
Subject: [PATCH v2 5/7] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 Capacitive Touch Display 7" DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-5-9d7988bd76f6@toradex.com>
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
X-CRM114-CacheID: sfid-20260724_092449_009041_B17E0260 
X-CRM114-Status: GOOD (  14.10  )
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

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
on the Verdin DSI_1 interface. The display features an internal Texas
Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel. The touch input is provided
by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso   | 129 +++++++++++++++++++++
 2 files changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 00dc2893c754..fe261d7bdab5 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -191,12 +191,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
@@ -216,6 +218,8 @@ imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ver
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..0e15b4b3f3ec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" on Verdin DSI_1.
+ * On Dahlia (X17) and Development Board (X48), DSI_1 is exposed via a
+ * Samtec LSS-130 connector and requires the Toradex DSI Display Adapter
+ * to convert to FFC/FPC connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-dsi
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
+		compatible = "riverdi,rvt70hslnwca0", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		height-mm = <86>;
+		width-mm = <154>;
+
+		panel-timing {
+			clock-frequency = <51200000>;
+			de-active = <1>;
+			hactive = <1024>;
+			hback-porch = <100 100 100>;
+			hfront-porch = <16 160 216>;
+			hsync-active = <0>;
+			hsync-len = <50 60 140>;
+			pixelclk-active = <1>;
+			vactive = <600>;
+			vback-porch = <23 23 23>;
+			vfront-porch = <1 12 126>;
+			vsync-active = <0>;
+			vsync-len = <1 10 20>;
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


