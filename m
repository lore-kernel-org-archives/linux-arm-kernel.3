Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A230ACD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 16:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ik325qS+IlSAnQ/mwoET7pUu3OO4SnjA2/txbOoUzg=; b=SCbNltlLIYfWu/mwtvQYFSd8KE
	vt5YtpDZ/LRI3EoVwKpSoP3mDAgYSJAu2MfQY2CePJnuz5JfP0u5dnol7VuX15HQL68OfLKH3r7cN
	JGmOtkpBZmd+BZBN/eu1kWJDGOq6bhlr10g0ib970kjaUygmlFuQWC/GP51tFUfnE7UcIjKhqrYIj
	9us6iLG91hi48tAE3bQmpOLoIAJQXFlRuu+1ktAIBp/PkqVGsjcq+/G48xyS++lCGP1cFkBdTRbB9
	ZRh4cW8xvmA7AjBgpjm18KwRBZOfuiD+nWbgCVUBEj5PCK86rTQELPHJm/o0LZh79k0bctpMSZFqS
	YfY70Z1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTV-0000000BNkF-3tjC;
	Fri, 22 May 2026 16:11:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTR-0000000BNi1-1EkF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:11:46 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4585a116a4aso6315261f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466303; x=1780071103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ik325qS+IlSAnQ/mwoET7pUu3OO4SnjA2/txbOoUzg=;
        b=d+zKPXAct4lthNDEDUcgqqwVD3Ynjit7Ks/3YhlUhIGr6gSHq2wcdout/JJvuZ8wzY
         Fr6Se1PfdfVFLlt2Rfl58XzBwnwcAO9MnD/Rhe0NLh2Ejbt/+p8usmfBBDffM8Z+BZrj
         IOVBogUEpDr1naes9nTdExR1wmGSrtP0i/UzL/MFm/manu4S+/Sawo2Z31pjE0zbZ0KU
         kF2pUnoWx012saVlOTl55ajOBm3HYDeCFpx2x1Ch6ZKguWUhwp9OYzVvkANk8kPMV44Y
         MbMcK79ERNTyHJ8QzO5aGT1p+VCrf3fl8gNcuYT8VukxkzvcFE60j+rVYsxJG6Kz89DS
         pDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466303; x=1780071103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Ik325qS+IlSAnQ/mwoET7pUu3OO4SnjA2/txbOoUzg=;
        b=IOoIqPaN7q3Pf09NevXwecAYBSP9cc0zbeeJr4pa2vdm4O7/9nBFakL6Vw4L+KxS7e
         WHBcmQzjYi/Ib3PieoMyZjmiNUcLdkmo5EFNsIvSsAdGZVfV0pnBBwQWb7yvgzHAyGy1
         +Oa7OsTEeuzpUD+RBD3nNSSqnCNVE1wpj0VY8I9DCMFj0fpDU+Q2R/kh+u3AmW6nuEQd
         6m5Bac35ZN0NILV6WJMIbZY2Gj6xbpIM4EbVZh6rr+cnVffs041BwQADzg1sf0Nl1pUw
         er+2zspdxmCBH1oBuQ6+3VnLinJSStD5mYMuak5qu6L3WOxaWotu3IL+tuy8E1IsLzaJ
         IL4Q==
X-Forwarded-Encrypted: i=1; AFNElJ888Ue4BNqTLCnLm2PLEkaiFFiw1qnO0SaaiWWgml1PPw9zIEpJHR9aTzjBQYvvSNJ7l/zvmQOnKudyS/GlRa9n@lists.infradead.org
X-Gm-Message-State: AOJu0YzYpafHs97uqPGHLs9y1ARqDiH6uWmWXKxWVMU7+4cUjunHWXcR
	L/L5SiL7DAwaosPUBW8VByB0eLYUMWOcom7QSuGslMfDEmuRSORrpPts
X-Gm-Gg: Acq92OFYI0avTldRCNumEh4HAn9hhIJm+y7rnqliVMAtbPT3sZntNwNukD1Gs42Qf3T
	Tbd/iwBAx169X5FAgG0gxEdLB19ObUQSvS44Se9ku6A2N7MBcpFpSHag5mGXqDTW95d2JAluvDg
	qoXO+jKtTh1inTwCQ3vgg7O22Jvt+YLuYScIiqbZ2G0yPH7QYWAV5UL3WTd7831qKxEajdK/msx
	pSbSgMqoTmjXm+BEDCot28UxRpGyy14iFdXkkIENsnhOcniKGG4+Q4FKf8DRK4WHd2Bn1gSXHqY
	K4+g8lJsEDDMNm9HrR33QXwJ37mONL1Jz0o+hNe8Uwc2sgcO054e2BNVT5GGBvvI8HENR9ljnDC
	biaUJHYQKZSTX7f8BdYTnIFki+QBQGgDfpEK0q+vJUkQEaR3jF/yIrifkl5Zl2biDNPslBVDlz/
	7y7rAgHFzTGaBMl861KBIZYAMONu7upr1gbU2jxCyP0A==
X-Received: by 2002:a05:600c:3587:b0:48f:e230:2a20 with SMTP id 5b1f17b1804b1-490428eb9eemr61826885e9.31.1779466303106;
        Fri, 22 May 2026 09:11:43 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:42 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 02/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Fri, 22 May 2026 17:11:06 +0100
Message-ID: <20260522161105.277519-15-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_091145_370229_B204E3C9 
X-CRM114-Status: GOOD (  15.88  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via Verdin AM62 OLDI on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v3:
- Add missing regulator-name property on fixed regulators
- Simplify regulator labels
- Rename touch@ nodes to touchscreen@

Changes in v2:
- Use panel-simple compatible form

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...25-verdin-panel-cap-touch-10inch-lvds.dtso | 120 ++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index b2408f62c139..867c05b675d1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev-dsi-to-hdmi.dtb
@@ -213,6 +214,9 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
+	k3-am625-verdin-wifi-mallow.dtb \
+	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
@@ -315,6 +319,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..f83366b11bdb
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Verdin AM62 OLDI
+ * on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	backlight_pwm2: backlight-pwm2 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_gpio>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
+		enable-gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
+		/* Verdin PWM_2 (SODIMM 16) */
+		pwms = <&epwm0 1 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_pwm2>;
+		power-supply = <&reg_3v3_lvds>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&oldi0_out>;
+			};
+		};
+	};
+
+	reg_3v3_lvds: regulator-3v3-lvds {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_LVDS";
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* DSS VP1: internal DPI output to OLDIx */
+	port@0 {
+		reg = <0>;
+
+		dss0_out: endpoint {
+			remote-endpoint = <&oldi0_in>;
+		};
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>, <&pinctrl_i2s_2_sync_gpio>;
+		/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <37 IRQ_TYPE_EDGE_FALLING>;
+		/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		reset-gpios = <&main_gpio0 33 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&main_pmx0 {
+	/* Mallow Touch RST */
+	pinctrl_i2s_2_d_in_gpio: main-gpio0-33-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0088, PIN_INPUT, 7) /* (L24) GPMC0_OEn_REn.GPIO0_33 */ /* SODIMM 48 */
+		>;
+	};
+
+	/* Mallow Touch INT# */
+	pinctrl_i2s_2_sync_gpio: main-gpio0-37-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0098, PIN_INPUT, 7) /* (U23) GPMC0_WAIT0.GPIO0_37 */ /* SODIMM 44 */
+		>;
+	};
+};
+
+&oldi0 {
+	status = "okay";
+};
+
+&oldi0_port0 {
+	oldi0_in: endpoint {
+		remote-endpoint = <&dss0_out>;
+	};
+};
+
+&oldi0_port1 {
+	oldi0_out: endpoint {
+		remote-endpoint = <&panel_lvds_native_in>;
+	};
+};
-- 
2.54.0


