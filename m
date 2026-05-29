Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107E9CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rbuKL9h3xKy6UeQjAxSG2GvoC0sCeu/W5fIdC5/v7k=; b=eHu9zh/cS6PodrYJ9Jt3bkMmjh
	8pCTPA2l/0FJRtO+U92UJT51U07GAVzbZKqh8ngXUcW8t9aPzuY2IjBTjH1Ha3asfZMpUIN/WDhvZ
	TZaXoUa0wiDS6qV/zMSwNdoUm5c/X0aXmD+ZuZZ4Gvk2xWqNEddrcAYdBZOFtF5opZ7OnnmP/Og5U
	4pAlldIEwmUW2SxTJzbEA4wLEXoaTOvKIxNSidDsynfqa83fOMwUBmnAXwPEO8vniFaM40aSq1Qxk
	T/2A5wKqXqQ5U/oaxqEHH7CgXPyVSdZ91NIaLbO/fvLdEiXztrP8PGBQDGbGnrjIgolnLeT5NeRTa
	IkzUbVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw1t-00000007KxH-39Ic;
	Fri, 29 May 2026 12:09:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw1j-00000007KuD-06EH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:09:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so88367995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056561; x=1780661361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rbuKL9h3xKy6UeQjAxSG2GvoC0sCeu/W5fIdC5/v7k=;
        b=FDIHREdlH4Qyki0CN3A4Ai3KJRLg5sXHLXiaIP/eO7D1foaIBvf20X4wruG73NuiYd
         jbLmi8uAX9y6UordoPzuk6ncVT3QlqUzdiJZgETYF0d+spxvHA0br0/2CNTCBlQLKDzc
         zvUM/H5KKya/IKMNupxQO04/MSZ51LgD3/lgfDAKm+8QbLHpUBkpHs6H0IFLHkpDuvZA
         1dSQ/4QfGFVvgPipslvDUFCoCU1V6TV+OlS1cXNmZraFzT/FxjSBxDipwtxsVAJ5FB9I
         zeCicK4pbML/C8G9Pgri/1E51cvtJshZtZt3fUpDHdrcIGB+5qByEnJIkGQi1UpejB1p
         bVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056561; x=1780661361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0rbuKL9h3xKy6UeQjAxSG2GvoC0sCeu/W5fIdC5/v7k=;
        b=icnjZYO8Z6CuQhgVBhgJ/kc+aCYlTmfM4UAj/s7Fmxvm5eEhpik0cvvstq3vne9zKz
         +AQuNmUAJg2NIzaLhdW4Kj+2uXTq9h0afo7L6dZ30eHUMp7SsWhBWUD5PAsPzqWAvti1
         POsRe2y+aDzLOg4HYxHPnIrUaGWG0VCGkX3zgv83su14Li77zcNGXbbk4oXLn4WwVVXU
         vBpZUHU9KfOnsl4ISW6qBBsCSmA0P7+o7/aBb8Go91I12Ln+xz8L4Z58zx+8uw6LJ2Px
         BZyKXDvz0pY9B4+fToQ/MjYkGcsH8OuJ4wwYoZwvQnBd+XEkUtA5LLwrjUJMvBIJ8bxV
         pe8g==
X-Forwarded-Encrypted: i=1; AFNElJ/9JIRVn50q3uLVVSh64Ux3pqWvYDdvEFNYRn/Di981lJDO3kY0vFsvvYJiUJuHj/YGM9XqMez/SICNjVcYOZJD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+KICoTdjW9PBqT3/fYJeEH8h2B0f9OXJ49bhFjOZ18vnZtXO/
	esTJFeoYWDeyeNzTjXLeFFifhkqZdCVdbBv0Et3q0h0UuF6YfEN5dX4h
X-Gm-Gg: Acq92OG+rUveDzWlHwjKVtZOT6iK28ogtUyRxk1UZ3K/qUbt/QYVFmf66ED4ME2qSLW
	ka5Z1W0qknjti+ptr31BayxyPDXXV8TRrV+9rV92IAzdXbx1nRqalWNGTiQ/xOdidA/C4xTm2oj
	+zQ5Bcxj05Xm1IkWEj9M7PL36RmwbkYec7OL8+tTkqcdYkBdttz6WxkiGKiWUsYXWhi4vomtGzD
	uPVzRW5kDwFoyhDC+OTiAusE12M/i/RiUk7E2aJm4NZds9FyOYsPn8bmOydXFZr6L/ikhAMWvAs
	Gbz8L41vBO70RxZjOYI8KQNa9Zn3Xavct9OM6b2RZtn0EhqKDw3vRyklAmuIs4x+gMgB7+vp0OZ
	RCmPfLi8qHpGy6meRU81U4ESFqtOoVHPKoePNMUr6yq5MfhnzzhATLbwKzVa0/40YaZKuNm+ojz
	xsOZ6LEQkdcVltlIXVboAoX8tm
X-Received: by 2002:a05:600c:c4a4:b0:48f:e6de:1cba with SMTP id 5b1f17b1804b1-4909c0d67f1mr48432655e9.17.1780056560703;
        Fri, 29 May 2026 05:09:20 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:20 -0700 (PDT)
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
Subject: [PATCH v1 2/7] arm64: dts: ti: k3-am69-aquila: Add DSI to LVDS adapter with 10.1" display
Date: Fri, 29 May 2026 13:08:54 +0100
Message-ID: <20260529120853.636015-11-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529120853.636015-9-ivitro@gmail.com>
References: <20260529120853.636015-9-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_050923_928382_963F1A29 
X-CRM114-Status: GOOD (  14.95  )
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

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. Used on Development Board
(J44), where DSI_1 is exposed via a Samtec LSS-130 connector.

The adapter is based on the Texas Instruments SN65DSI84 DSI-to-LVDS
bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA LVDS panel.
Touch input is provided by an Atmel MaxTouch capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...la-dsi-to-lvds-panel-cap-touch-10inch.dtso | 142 ++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index c1aa5c1df927..bec6f11f3d44 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -178,6 +178,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
@@ -270,6 +271,9 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
+k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
@@ -344,6 +348,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
+	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..4bbcdb420143
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Aquila DSI_1 with Capacitive Touch Display 10.1"
+ * Used on Development Board (J44), DSI_1 is exposed via a Samtec LSS-130 connector.
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
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_19_dsi_1>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Aquila GPIO_19_DSI_1 (AQUILA B44) */
+		enable-gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
+		/* Aquila PWM_3_DSI (AQUILA B46) */
+		pwms = <&main_ehrpwm5 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_pwm3>;
+		power-supply = <&reg_3v3_dsi>;
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_3v3_dsi: regulator-3v3-dsi {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_DSI";
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
+&i2c_dsi_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
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
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&dsi0_out>;
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
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_17_dsi_1>, <&pinctrl_gpio_18_dsi_1>;
+		/* Aquila GPIO_17_DSI_1 (AQUILA B42) */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		/* Aquila GPIO_18_DSI_1 (AQUILA B43) */
+		reset-gpios = <&main_gpio0 31 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.54.0


