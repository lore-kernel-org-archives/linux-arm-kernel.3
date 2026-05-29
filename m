Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5B2CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLxv8zp9lSvmgGc7G/y1gE3wg27H9sIghqq/rvMRlwc=; b=NAHklAZG6h8t0S8MEFPX05HsHZ
	F6PEc8eeTfg+NRW6lUmV7dV3sNswbWBv+j3tZJlLqZ3o8Gm1CCrajmOMTb4WdlIb8CShisO99pUVB
	oxhLvWasaL3e0Q5RP7v7eLeicztWCi0RSBe1NTXA5uoWuuScEggWe4nc//hissVodWm6PUcgwv5Eu
	Xdk8B91kGXBmF89BqwCuLFW79HPxOBrq8szBZSQC1k4M8biLk5/3ksUfrwtzhotepc6uAAKFnBzqX
	Ys7LKfSxhZNUa1Snc85e/HAYXBC4Fdqok9DsSNIBJE+PtpRO/FFJgL5+G9H/lcp9Sll4Az22GR0QK
	WZ0im7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw1u-00000007Kyh-1rU2;
	Fri, 29 May 2026 12:09:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw1r-00000007Kvt-0hnE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:09:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so88369165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056569; x=1780661369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLxv8zp9lSvmgGc7G/y1gE3wg27H9sIghqq/rvMRlwc=;
        b=O/56R1/gfCm9erMWzYfMfsPeEmRv6IRVy9B1sLaRbAk74Makz7XySJ5sfqd494L0MU
         OrkDrAEOKluolu/A8xWpXt6WL8muk4bIYEkNJr0bKvrOwZZKuwSRTe/AcZz7N80uKDL9
         iWFoN5zCyUW2/UuLe+pknmzLWPwV+6pR0upTkJ18X3zJelk4R9yyp9Cex/AfBfVNiN0X
         8MlG6xLnV/LQLdPZh4CIV6qSDqAtOV6ZZ8MJTf2Pb2xxVK5J0G+ojCORcIVgKZDzwThI
         cs9rMVtmYyp0hDtPP+Xq4Tb28EV1Zz7xEXPjxcXhyeQGOyiEP92lMQxGjiycEyOmNPmw
         c15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056569; x=1780661369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vLxv8zp9lSvmgGc7G/y1gE3wg27H9sIghqq/rvMRlwc=;
        b=j3ZVxV0YhP8oXK4gU3P9bb6YO59h+P+VnNJHCK/Ko5eh3kKv3O9y4qJmzLrTPIVPek
         eyr/sv/s3M+4/RP18aS6bJVqAy0lmnifDE2YiicpfOZuPUQKtBRi2CxJb/lqxm7y2aol
         VO7vIbP8hH+MFSgYRpdeA4xEHch8j1ToAAsmLxErvz2IWrHwGSF62T0Ru2X18rRN3Gf9
         O1WCV6gLXGaX13gvcejSeLi0UdeJLNHFzp/+affm1BZ6i8+Sv0lj+lRchUuuSiJgRX5Q
         eVfXL6K7D0mZoPxlJ8L6Sak1Mt6GWAqrJ44sfh0sHJ1scc8HFpIulJtUWv0veHHjLVsY
         PJaA==
X-Forwarded-Encrypted: i=1; AFNElJ954uMPrHdppFRlyWQFkcqFzFCXesmQ/XnuaXztfmvr/LKBfPY5BbepA1FikumO1ULZs89YXu1D2Jl/HAJvI5bI@lists.infradead.org
X-Gm-Message-State: AOJu0YygImP5Ab5B1i3n+Y35Be9718Dum4ZRTAVs1B9fVljBX59Pp9QF
	9bhM3X8ncJoqYLoeEkOlx9dHYcdhUmv+X88tNfzeJ49D9Ub5Zxd/TM1+
X-Gm-Gg: Acq92OFtScF0a9BUNEoUedtFDSO32ZAhqJB+dcZUGQqS1cGmOOT/Tpwr8kko338WZ9k
	naZUhUg83b97Z1ysfzDKYgSs1TUG7MDL23tW6k6+jNbtItAWGFZHZN/u5wRJIZdqLDfqDg+nXLE
	xo3VEbdfjOxovNy9HsB5zpx+Gr/9K7pcUrWX8U6E3NL9Jh7rpxZDFCvd/EjvHtSFGAqGyJJURDV
	Rpxueqs2XrZOi4Z4hp33OHxnC8xEZjn6ziXTxoxnp4b1q5dOLcgiADPxg1ZPgn/mAwJLfTBtusf
	xei466IwQZKUnpHZiiFh0tpnedh/i2xhY/qiELLnQ2WgSiOS8/1InQ9/nM4w9EwiyAgTpexsoul
	ljGyODDWm4osGVA8ZIQXs/qlkTRVmD6Po5y6QqH17C4q3jUrQjFf4BGV28GdfolsaCaHo3aafz9
	9qGP3l04qlLcHleUUrXw4g6/YE
X-Received: by 2002:a05:600c:4504:b0:490:51e2:d992 with SMTP id 5b1f17b1804b1-4909c0b3349mr46936675e9.13.1780056568939;
        Fri, 29 May 2026 05:09:28 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:28 -0700 (PDT)
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
Subject: [PATCH v1 5/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 10.1" DSI
Date: Fri, 29 May 2026 13:08:57 +0100
Message-ID: <20260529120853.636015-14-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529120853.636015-9-ivitro@gmail.com>
References: <20260529120853.636015-9-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_050931_267345_C382ED2A 
X-CRM114-Status: GOOD (  14.75  )
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
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...m69-aquila-panel-cap-touch-10inch-dsi.dtso | 149 ++++++++++++++++++
 2 files changed, 154 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index ce667843e58b..f9163643291d 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -172,15 +172,20 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
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
index 000000000000..3880026951f3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,149 @@
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
+		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
+		/* Aquila GPIO_18_DSI_1 (AQUILA B43) */
+		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.54.0


