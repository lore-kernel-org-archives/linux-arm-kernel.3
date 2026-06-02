Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB989CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rW3dGwAqiUruHWn/0Ai/AGMfG26DoRiScxLbS+CHlR8=; b=nXhYk8CLHlIZ7XYVnaol/yAeZu
	BMEeZKoSKHNyv2qEIasth3CSrIFTae1eho/U7tspKI56Qzjxr+jBeNFo5D5Ltxrj9YwUiCDwdCegH
	ZnzxjHmGY4o85+Tl1gT9HIIB0djHI99vorZtBuNiTzrvsMqC+4xSexuL0x1MCE2iFjmDFdG3FM3WU
	Bsi81R4HYuJjO4+1zTq980ZDXRygVi9a33fnoaC6GUqUFzci9Nef6/koMOuv5ukK54aRiW+btzU7X
	6SrElWmePBOXwd8Vf0SFOYa23s3oE84LbD/W0MT65VE62rv3Jh2dXlTKGQgUD5BPH3by/X1j8Bmju
	8vbVd/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNew-0000000CutV-44tb;
	Tue, 02 Jun 2026 11:51:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNeu-0000000CupP-0dJH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:51:49 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso9918385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 04:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401106; x=1781005906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW3dGwAqiUruHWn/0Ai/AGMfG26DoRiScxLbS+CHlR8=;
        b=h0DQ4rIDvwy4vkClXfLCizjQ9f02qalr+TRA/2N3j1+QaAXGSAkXE9EPljljmCr/0b
         QgZRebuYeihPG3iPGeuoKR4iiOH/OaSVl3uaDKvOX9OdbfwiliSMt4/mcVNpiWPsRr5u
         AzBC1us4GpfnMd+ykM6HCZEAw4NO/0iGMWknVKCRgGjyAXlG9AcZUwbbx9YztIzrT03M
         8rYQI5954uWI2vQzJhX+LE0/AHeRS+S7xaFqKlsI1WfaF82f3ulsr/RX7uzMjWn90DNS
         3nbgaVKbDFLMsUmtzbWORwL05WlUTKNp06Z3yHkEuLDQijdEA9mpCpN9x2HE+6JQotAK
         Sf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401106; x=1781005906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rW3dGwAqiUruHWn/0Ai/AGMfG26DoRiScxLbS+CHlR8=;
        b=i/5DsQPpnv8sZRjNtF9/pD0AreOiVFBDl57ZLiNfVqj5BLgiU5cnv5jWFrzZelObvX
         Lju4RmHz1NigQlgZto9BR+ijNeWZnDcxDbMA1z1xXzOc64gR3pn7uAY+ZLxuA6DZuw3P
         RMi8w7YsDOS4+RrPLWYFo0Pd0L1y9EPEqVXOnSMhlFj90k10e3WDnlKYxn8OJVnyFOfb
         pgBd1HtnIWwD52JN4BNDkCcRucMgfBNyPRJqQCjt/ARA6sRcG49jr5Hwjlkyt/kPY8Bg
         ZahAH7BEKoEELPNgf1a/s2x8UKF4kGHxXp+KBDxNef2AOVkIBcAyp0K0ANoUvJCYuwD8
         sRUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DFiFyrR0hl5psCh6ZgvXYniLzFrTi3GM9pxnCHVzZMlyJ+BRs2qY1I5KUGfZBi38tdG2SZff5JuUq2z8gIzWv@lists.infradead.org
X-Gm-Message-State: AOJu0YyPDHShzk22a9FSkJ/cjmMWWLpS0bQa9yYcRo8kYow2MeYBAZpm
	gfql8x9mmqTHIdvIDqJIDTzG99FF06FUpoVUIyiYEwLNWYHe6Fj0NxtU
X-Gm-Gg: Acq92OFLFUV0jSFVJzix11ZLbXGg4LV+BoG1lF+EJ6fUHaWvLUJ64R4XKtU21YGzjTU
	A3TBrZle1zjkTCYKgh3XfGT8pTvyQenJtJm/etWuRuik818Edqii4z+yG/P6DbOlmkFaXkhvPnq
	D3HDJOcdD4Dv1NFZoAsgOs0qnx+Uu2S83O4WRmeMYFM6pPJ+KHF4Sa6jd51HP2iPVUppIJRvjoQ
	CzjV0T94psiIm52eMRzFi9Htcno8PkTpcYZ67vBj084bdtlJnbCpKEVPDMLFO+nemsU2e6WiER3
	tfqY1G8H4K8OOE/y8apZFKwBYXGmmgeCGZ+lkkjgYnXrwmOUzHwAroIEn+d2+nYZt6/bcXasveU
	f3af2FXRdBvSXzMhleyzQVtiHGn2oaK1uEcr9ItzKUfNgedFNEgLgOXDRKXtlu/QYtR/Nf4EcnO
	d+0N0EeKiC6tNlP5PkdCCU/aoVng==
X-Received: by 2002:a05:600d:8488:10b0:490:9dc3:3483 with SMTP id 5b1f17b1804b1-490b0e373a0mr40839215e9.2.1780401106125;
        Tue, 02 Jun 2026 04:51:46 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:45 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 10.1" DSI
Date: Tue,  2 Jun 2026 12:51:28 +0100
Message-ID: <20260602115123.1324474-14-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602115123.1324474-9-ivitro@gmail.com>
References: <20260602115123.1324474-9-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_045148_339359_8194C53A 
X-CRM114-Status: GOOD (  16.33  )
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
DSI on the Aquila DSI_1 interface. Used on the Clover Board (J12), where
DSI_1 is exposed via a FFC/FPC connector.

The display includes an internal Texas Instruments SN65DSI83 DSI-to-LVDS
bridge driving a Riverdi RVT101HVLNWC00 10.1" WXGA IPS TFT LCD panel.
Touch input is provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the Aquila AM69 Clover carrier board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Enable main_ehrpwm5 for Clover board

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...m69-aquila-panel-cap-touch-10inch-dsi.dtso | 158 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index c145cc4ca7fc..bf50b7a72973 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -190,15 +190,20 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 
 # Boards with J784s4 SoC
+k3-am69-aquila-clover-panel-cap-touch-10inch-dsi-dtbs := \
+	k3-am69-aquila-clover.dtb \
+	k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
 k3-am69-aquila-dev-dsi-to-hdmi-dtbs := k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..c5d597873440
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" on Aquila DSI_1.
+ * Used on Clover Board (J12), DSI_1 is exposed via a FFC/FPC connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-dsi
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
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Aquila PWM_3_DSI (AQUILA B46) */
+		pwms = <&main_ehrpwm5 0 6666667 0>;
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
+			clock-frequency = <72400000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <83 83 83>;
+			hfront-porch = <12 72 132>;
+			hsync-active = <0>;
+			hsync-len = <1 5 40>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <13 13 13>;
+			vfront-porch = <1 15 49>;
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
+&dphy_tx0 {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+};
+
+&dsi0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@0 {
+		reg = <0>;
+
+		dsi0_out: endpoint {
+			remote-endpoint = <&dsi_lvds_bridge_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi2_out>;
+		};
+	};
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@2 {
+		reg = <2>;
+
+		dpi2_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
+};
+
+/* Aquila PWM_3_DSI */
+&main_ehrpwm5 {
+	status = "okay";
+};
+
+/* Aquila I2C_3_DSI1 */
+&main_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_20_dsi_1>;
+		/* Aquila GPIO_20_DSI_1 (AQUILA B45) */
+		enable-gpios = <&main_gpio0 18 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+					data-lanes = <1 2 3 4>;
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
+		pinctrl-0 = <&pinctrl_gpio_17_dsi_1>, <&pinctrl_gpio_18_dsi_1>;
+		/* Aquila GPIO_17_DSI_1 (AQUILA B42) */
+		interrupt-parent = <&main_gpio0>;
+		/*
+		 * Data-ready pulse is ~200 us; either edge can be used,
+		 * use the rising edge because the falling edge is noisy.
+		 */
+		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
+		/* Aquila GPIO_18_DSI_1 (AQUILA B43) */
+		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.54.0


