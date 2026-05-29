Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548BDCD6E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+LmRi3vqEww8IUkZ6x6Xjh5yc2jTl/AU/ZgSXfkKiI=; b=m2FfYg6hi6exdYMDOWRzBX2tjI
	9Gr0J47HkU6AfOJq5jx3KkNLz8FJcB3FcfvGp+CIz0RpQ5+lXEF0g4K1CQ5A1jMI5Q6X17qS1TRfE
	b3Irzw3uQ+6Uh9zDvcgFu7WLW4Ml9QW01kCvb8hGJ2/0Qie1Qk1vOoyDSd6i23FsuLkQ7fUGXuSaJ
	fjsBIt6+UfGFrT2ckTcmKC7BoHI7u09uqxx8lK/tgHgOWcjHastLiV2C3J5PV+Gf9F0PjeV4O7zMD
	YBqYOI7PqA5FrN3bpEIma1QBvY/PmuqmJIdzVz7bu2AOnsulS+QZ9ocGUF2Pp3mi/owxvIK9brPEz
	e7fjJDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw1u-00000007Ky6-0FY2;
	Fri, 29 May 2026 12:09:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw1o-00000007Kv2-2HoY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:09:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so80390835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056566; x=1780661366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+LmRi3vqEww8IUkZ6x6Xjh5yc2jTl/AU/ZgSXfkKiI=;
        b=MII4MP9uTW0vxSMDJz76CW/U6E62HZdyKDmT59Sn4ky9x1ZlRoa0bCsI8xp5qsDgtN
         Y2vO5PT7Ejy/jHbbDXyEDGpr3AoGOgLTgTGIBU9Cr4ig+jPqKmkt2XPQzKysoKN4xqTO
         oYDVK39EREgPx6WzhgQjoE6PB+F1jdMhfAUSwI+9+SyrPzcQnDUo7vpIYHsLZ1a9LSTp
         oqaqcqkhrt6V3vSDXnlAdQT2Fma512L8sILPwVVsqib1iz+HuIhiGQOIGKUltTohGMST
         kwUh2YXKK2i0/kaomvdLBkySjGc7Ne6cR+PIFXt7IKqzwzj7sLrdyhqJXFwOuLnmSdNg
         bgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056566; x=1780661366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y+LmRi3vqEww8IUkZ6x6Xjh5yc2jTl/AU/ZgSXfkKiI=;
        b=Od6Ia/Ijt1zs6X3Hg7yNtpS9wZ38gk9ixlpmFljVZ535ZGuSqUhjLWagiSbPmRe50k
         qPAidVj1almBC+o5qq2ZS5TVa8oVw3o8AMZBBMjDhJw4d5TLpLQvPy68N9vfpGND9gr5
         gpCHUlRAHODJeBXskJ5zfibU+PIMAxNN7RexXR4Dv5iHgnO11wlcrlkZHw/mOYn4pZqy
         3Z0NLE+tM7CyxVaCGXzeu+iOSiWOJASmvtbz71Lt6dR3VogqsP+ygRh4kU9Qgd/7iaD0
         oNsqMDdAM7/Xy44OksDeaQ4AYYDcGarYZMw6rDuIULe2BJlvTPM/46Ww0cxVFmUtcKDf
         b0Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9ogOmagSb+LqHuSgDBm7xDFZ5llcH3MyzsJXHtfQKDIBr+kSzUhhS/wVTozUGNMFEY+E5bzVOpCnf2c06VSnNe@lists.infradead.org
X-Gm-Message-State: AOJu0YwAG97FziY/a5gYmbStpsu0dfdE2FUv/L9IOVY0fQBa863Wi9gu
	fdabdWzllnTnY/bnnlG8z+18sZqfdUzKdaLIckJagZKHdHBhRu4YSgHM
X-Gm-Gg: Acq92OGbodIvoNTcVQ35JZFHWij7EWSfwl6uEXSy+YTqy85WPdhctm7n6jJDWTRInWO
	APXbazW5frXUEn6kdDit89qCRjkXvdMUii/wjn7p+CzguTpG4Y58oySxI7f7yNguW6jOZKBFme2
	+Qu1HXHtDbmY29bSYIsFRmU9DX2PZ9SN4XBFbp8ODN/cGloyMqnft8wYyb/CMVDrFKyypig+3N3
	iaq7UiE/f29m/MKqNDrtwuSVXvauvWZxYf/u2YrqvUjxZR4kx6lUe+Api3BnW/dNg38EnbKNOxR
	cyf49mTy1vXnKKuou6ZlZyvGME0b5MTzlg5dCCz4IHIw53VPDYwH8AMVaQVWiqfGlKei1TvK/gB
	J8iFZfCaTgNWNisiAcj65ZF2+44YKojz9TSd1qfNSlTO6RqwToiypp19XEZPKarbTZLruqgomVR
	DN5fwhO8aJKOyjyrJKnmjW/uD7
X-Received: by 2002:a7b:cc1a:0:b0:490:845c:a1ea with SMTP id 5b1f17b1804b1-4909c0b0c32mr35903405e9.21.1780056566431;
        Fri, 29 May 2026 05:09:26 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:25 -0700 (PDT)
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
Subject: [PATCH v1 4/7] arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 7" DSI with adapter
Date: Fri, 29 May 2026 13:08:56 +0100
Message-ID: <20260529120853.636015-13-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529120853.636015-9-ivitro@gmail.com>
References: <20260529120853.636015-9-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_050928_621268_CEFBCFA0 
X-CRM114-Status: GOOD (  15.36  )
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

Add a device tree overlay for the Toradex Capacitive Touch Display 7" DSI
used with the Toradex DSI Display Adapter on the Aquila Development Board.
On this board, DSI_1 is exposed on connector J44 through a Samtec LSS-130
connector, and the adapter converts it to an FFC/FPC connector.

The display includes an internal Texas Instruments SN65DSI83 DSI-to-LVDS
bridge driving a Riverdi RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel. Touch
input is provided by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...ila-adapter-panel-cap-touch-7inch-dsi.dtso | 151 ++++++++++++++++++
 2 files changed, 156 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 39e4f96a968a..ce667843e58b 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -175,6 +175,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-am69-aquila-dev-dsi-to-hdmi-dtbs := k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
@@ -275,6 +276,9 @@ k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
+k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
 k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -353,6 +357,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
+	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..9c8ab35ef673
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" on Aquila DSI_1.
+ * Used on Development Board (J44), DSI_1 is exposed via a Samtec LSS-130
+ * connector, and requires the Toradex DSI Display Adapter to convert to
+ * FFC/FPC connector.
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
+/* I2C on DSI Connector Pin #52 and #54 */
+&i2c_dsi_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
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


