Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B1ECD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXcmuDuWbm11caMZgoFDNnNhGqzpwO02IBzSYCaXizM=; b=oT4XAWPHDAU57T8k9cNGeKxQKF
	QF+lWVcYKKO/XSGIYJ3xgRhBETahkxxMQw6piWtMFTiHZIhxCP57mi4W+TvgmDdt8mduJ0ZW2VggW
	xfDCM+Qk6Er7Q7iXTc9pqKbJHECkGUunZNsgIndm5zVJR5DGF6zZM847AC0C0EtbM0Qjr60Axhe7t
	bvOMyUcD44iLOTliBXS1tInhuOeUehIDdzL/nAYHz37u2+e9creaugzYkpGJxfJdSgjE1tQxJ4Lia
	ArEybbLq/sOASiHOYqil0ImRZkiE1UUUAtfaFbNvCmP+bJ8Ne0zk0pD5UMpGVSaLqMBGyu8Xj2KVT
	heU21YNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNez-0000000Cuw8-1e1w;
	Tue, 02 Jun 2026 11:51:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNev-0000000Cuqb-1yGV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:51:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490ac10e337so12122825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401107; x=1781005907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXcmuDuWbm11caMZgoFDNnNhGqzpwO02IBzSYCaXizM=;
        b=Phs2IHdnvHuDthd3Erndd+1t41mMX29+XP2p3C4RnEPdRXMJ2ePh9BCTX/OWj+rmgg
         V3LM3yEyWzPOZ7LqAovlcjMobDPhpc6mbeYz891ijxEt2x1IPJGjCOa16KADR9qNcYay
         /SYDaXkmfj3Fm86Q3ZFliC8F2/Ft3mqN5TWcJWtkuweztn/jFxIGLdOB9ox0tJ4YZ1Yf
         /Z+Vuv2DppDXz9vRVG/mEPv4DqlNmiIi59hrd65BfXd0gfnn4cWG0/hTHdO8zUnd3fzJ
         R+MpzQBJmNBWKWJwyx7lxeBh9/x+se/URHnltFzmfGICtRd9udezSKMaK0MyIKwfczSW
         Rqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401107; x=1781005907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXcmuDuWbm11caMZgoFDNnNhGqzpwO02IBzSYCaXizM=;
        b=n0TEe2PEbPqigTguvwUB64CmCo4x1R5WyewMQSoEd5xzedEE1WnwSBFNIr7QArFyhp
         i3/Q8+dCXMLtIohWxDGf8u/tTP+o4KKiaiNdcYwYQQylh0QQy4xF81hgl6NIf6XgTmdo
         dFu/I/Nq12xXp1EgEOEXUhPmYwOS7e+AEC5N0BsuwSIgtIfIgygB+nCKfEbZiorsjz6L
         BlFuEKnEoBKnRiL7JyTOWMmhHvcYd1ukgfeF0n8RfaKatFASjkiI3OAhuHRNaoJI3mFc
         j613+cwL/QWOchSnbkCYppiM4ARbGcsw3EXUq5L3NaodDvSASZiyh+IhYQBGSYZiNzJv
         oVKw==
X-Forwarded-Encrypted: i=1; AFNElJ9AFFJUNxzSJMSXRGR4KOa1M1iPa0Hm5kceUkzzLa+EmoLaGZcb1SzYLKZ3hotgDcg12BeQRtTCgorfJhrlsYxh@lists.infradead.org
X-Gm-Message-State: AOJu0YyptsHyJ3hWruW8CWS6Wo0b/iDxIGJuawZAdmgooFnl2wb/SQz4
	L58Z0J8ArjeoC9cMRzWUQJn189UUy1SJbVlnK5ymEwMoJhaqVwzyQASO
X-Gm-Gg: Acq92OFOaOpDBGf3Jdn2SZiti4hucpbSCug8yVD57hRWOlk94PqYu45uHWx8BPKRAHp
	3kOM4jPEI/gOSGljhtSQ5KIM7tWPGCqZMOqzBP6GQFl1wfvfcrVViYJgoyVbt3OooekMr5DvBdp
	CAMMhYD78+U3V6YdvY17nuKjmoFYfOqSIJ6jjWx3d4GRY3DOgfzEhnYzmgLewHTaIKd3eHS3Dq1
	boodIdGmS595xEYRH79OPUznKRceIknj6fRsBnzteQO1plOmYP/LfShWeLd7+R0ZVbgRd4hcOqA
	lhHz1332JDnZpRACVb7ncBhWxYfh0rmpfgqlsIOE5QmuNE1fa8/uMcX035OOU+R25O0L6Wiu1eO
	x/i65SdjiHMGWPEkcJbl4ZPpno50X+Iw2xdtbG5O+OZT68tgDKx5sT8LRkXkr4Vc7vzOdsn05jQ
	9cYsbfJ9iUI4v1h6OItKM+fyUUsA==
X-Received: by 2002:a05:600c:82c3:b0:490:59cc:999f with SMTP id 5b1f17b1804b1-490a2901c21mr287671715e9.4.1780401107527;
        Tue, 02 Jun 2026 04:51:47 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:46 -0700 (PDT)
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
Subject: [PATCH v2 6/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 7" DSI
Date: Tue,  2 Jun 2026 12:51:29 +0100
Message-ID: <20260602115123.1324474-15-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602115123.1324474-9-ivitro@gmail.com>
References: <20260602115123.1324474-9-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_045149_558229_BE06E015 
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

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
DSI on the Aquila DSI_1 interface. Used on the Clover Board (J12), where
DSI_1 is exposed via a FFC/FPC connector.

The display includes an internal Texas Instruments SN65DSI83 DSI-to-LVDS
bridge driving a Riverdi RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel.
Touch input is provided by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Enable main_ehrpwm5 for Clover board.

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...am69-aquila-panel-cap-touch-7inch-dsi.dtso | 158 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index bf50b7a72973..a8c2fae6a212 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -204,6 +204,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
@@ -318,6 +319,9 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
+k3-am69-aquila-clover-panel-cap-touch-7inch-dsi-dtbs := \
+	k3-am69-aquila-clover.dtb \
+	k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
 k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
@@ -410,6 +414,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
+	k3-am69-aquila-clover-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..ce8490837c76
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" on Aquila DSI_1.
+ * Used on Clover Board (J12), DSI_1 is exposed via a FFC/FPC connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-dsi
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
+			hsync-len = <1 60 140>;
+			pixelclk-active = <1>;
+			vactive = <600>;
+			vback-porch = <13 13 13>;
+			vfront-porch = <1 12 127>;
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


