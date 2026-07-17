Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A8AC4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZJeh48cU6eNQqkpuY3MFV3VRfsnxw3HepAo3o0YlOQ=; b=jyu8BPHZKwfz6ZdOpKew8a2rK3
	UMaBGmz5oRhZOxsP3Pt5w15M5AAIG+G+p70AOOvmxjiGxN3MO6MQb6U8vOG+bYQ+knjBzu8onyr8m
	aKWRhLbROW/W5yqsLlJ4ePkEr1Wvw3Y/GUsz8JNJ7YHmizw0hfN2qVDw6ltdU44HxtLOSKF4bsIvr
	SPyc/7i3ovuvoU0wIn1nFY4Os9mW/pyyO7jZbcJWwJcSVJ26/u0q1aevk859DXML2mnhtrnlyovhL
	Lp7ex6b63p/c5+9kcwVDQkdaG0UUbxHSVp9MRirh/opvX+f2FQJejdlMqHk0ltE88LuWFDLZJFIxg
	8iiiy8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcXd-00000001L3x-2X6w;
	Fri, 17 Jul 2026 06:59:25 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcXa-00000001L1p-2E0j;
	Fri, 17 Jul 2026 06:59:24 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailflow.stl.internal (Postfix) with ESMTP id AC28C13002D8;
	Fri, 17 Jul 2026 02:59:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 17 Jul 2026 02:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784271561; x=
	1784275161; bh=GZJeh48cU6eNQqkpuY3MFV3VRfsnxw3HepAo3o0YlOQ=; b=J
	OYnS9T5Vy0depqjXYPEhibwU9IYVkY+kzPHm/oSfY9vm89kEA/KXrD/2dGNM7PmV
	ydWXHKUOzEjSn9T6XxNM6Geu4gXnz9JugzJF2G/BAfEC3njNrZoxKrnwNd3U7Qpt
	I5+1TEj3ogh1eL4PBTDWfyfpcI5ttfEy5qO85ejImSJSurp2S/AWmcdPgaDcjmTR
	qCGQ0wJ8YkfcIT879DFhJ/6v11KpKywxqhPJhFcwZ/aQgKl36bAQc9gRn5+l5gTM
	DOtoc6im/9GbBS6je1a7DjPt7TyPU1QMpYOWH1BzQ4Ab4F/7Fx2sijxWBQTh3ljA
	k8US+3bZewwiN/w0Dv0fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784271561; x=1784275161; bh=G
	ZJeh48cU6eNQqkpuY3MFV3VRfsnxw3HepAo3o0YlOQ=; b=H/FViwifA8FL4rVFG
	tHG40rA3o8KiVDmxXcVvp3J3Vz+egh5lHaefpYLdxsY+XMYHUmLy8yvT37YukeA9
	lXYdY3B7HdwddxOxVBC8gGTn4KREY/vfK9vke9xqECqKvg8X0RNEtBf3hyrqmHIk
	9iW0mXhRI+wAa0oc5j7b6L98M4h6gI0LzhskdNvbNbHT9pGDFYuq3LaYGsELzJcg
	0NBowUmxUhKAA5nyoTp2FLIdbYV3mspIHq5dO76plJLoWyoYnkp7yNMT6seLvx5G
	TLy8RjdkVoCKSj9Flix+PNxcD1gQVYgZFFIvzIp2W/OHBBy0YH8kLIv73nTRhsqJ
	2LVXQ==
X-ME-Sender: <xms:yNJZau3aiF1fYGQSKNzzlP4Sn_lGMbIc93T5EEZ1QLltshqZWkIa7g>
    <xme:yNJZatoLPpiPGCX5qBZ7-d9jq230tvg-b3Y1a2k3XOjlGuI16MBoS4kkatQzrAZzW
    XBlsInSlJ5TRRAdI-I0_rEXvnAC33EFdQjziFUFEm19z6k70jY8>
X-ME-Received: <xmr:yNJZarUgr_2LnxlcUG58dGBjuREOvc_LjrOjszxD0c8vtQqeSGSE8C-pGP48Ic1y8R0rDByyplZo_Qi10Q8>
X-ME-Proxy-Cause: dmFkZTGDMf33VtYvlizcIzSRQERkkAxEUaP4bWS7F9Zbp5QCG+Q2poHUIHkElq0lVvMqZ6
    HCQZrEoqMp/A7glv+agiIPmlo4NvFHh+ipXSUMlyqcUKqk8X67jilZogHsqZ5UsrJ8Jnqd
    dB+Zs/4KZU7vesaCyvuIuu82LglwjUPchmnS+UfiVbOu6JSXxtLxmpLR7NU24BSbaCle/Q
    t3FoP8wm3P537yNvjIdRxT9L9fa8TuOdb1YXyNj9OhCRhRb+LqTjkW6lpv2RxClT2IxQ21
    8YFYN6W3TiOXUhfZkROb69UdfuTT8bhYx/BV3teKHrTv0e1/xtlW9tqbGYfR2uLXtWHal4
    2VnoEDhgsN8wkNCxm7Y/beg005NOlswe6dyiOnfTKGQFm02D8+T2DFBLsW37qWQeWGywdY
    15P9riSYxeGYK2iu/6SwF7OC0uvu8+HpISLJkYmrTQa/bF47wsfTbnNtnU+QQ0VnSbFHGk
    tfv4yiCCfsPyRYgSbm8Jrn95LoMz3IUEIyfBQosNT/XFfPCqBQNtmJvbo9qjD2CzbolsvG
    hTNdS3Ia+r6yBM5ybFBPEP9/Zg6ZVblP3CxIqdeoQLRxwsEdzv7wgqRx34QlqhoHp31wtB
    sbFUguIhTbn87cY4OJOoBzhrDf5p5/R0Y88PM1x1th6fgPYV1OtczcDC8fUg
X-ME-Proxy: <xmx:yNJZamqMRKjIpljP6XOyKLBYQ30Ep0Fx110rCLzxhruIROU3w6rehg>
    <xmx:yNJZaiDdLPWgoaKUtmdyIFDym8Mp0b60DHun9nZakk0FQAZe5LAYwg>
    <xmx:yNJZaiheRyWtElzlhqI1PtsY0KEU-ZwUcQmYiEmuMzNPj_t6Jk0lKg>
    <xmx:yNJZagZwmw7eGiF6pCNuY-g2N7CcxvINvu2PDpZe61tFOasTYc1tcQ>
    <xmx:ydJZaiGEyELWiwLhiHBam-RE3wjAFPP2ckMxgqdRC5O4JWUZyKsktA9o>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 02:59:17 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v4 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Fri, 17 Jul 2026 18:59:03 +1200
Message-ID: <20260717065903.2629399-3-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717065903.2629399-1-gahing@gahingwoo.com>
References: <20260717065903.2629399-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235922_694960_D76A32DC 
X-CRM114-Status: GOOD (  14.39  )
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

Add the ArmSoM CM5, an RK3576 compute module (rk3576-armsom-cm5.dtsi),
and its CM5-IO carrier (rk3576-armsom-cm5-io.dts). The module has the
RK806 PMIC, HYM8563 RTC, eMMC, GMAC0 with an on-module MotorComm YT8531
PHY, and the SDIO bus for the on-module WiFi. The carrier adds HDMI, a
GbE RJ45, two USB-A ports behind a USB3 hub, USB-C with FUSB302 and DP
alt-mode, a PCIe 2.0 x1 M.2 slot, microSD, status LEDs and a 40-pin
header.

The YT8531 has no crystal, so it uses the SoC 25 MHz reference output,
described on the gmac node as clk_mac_refout. Its reset is described at
the MDIO bus level: mdiobus releases a bus level reset before it scans
for PHY IDs, whereas a per-PHY reset-gpios is only applied once the PHY
has been found, which never happens while the PHY is still in reset.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-armsom-cm5-io.dts     | 402 +++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 558 ++++++++++++++++++
 3 files changed, 961 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index cb55c6b70..3ec0b6e20 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -165,6 +165,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-100ask-dshanpi-a1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-cm5-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
new file mode 100644
index 000000000..40d9be0c6
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * ArmSoM CM5-IO - official carrier board for the ArmSoM CM5 (RK3576) module.
+ *
+ * Carrier provides:
+ *   - Full-size HDMI 2.1 (HDMI TX via HDPTX PHY)
+ *   - Gigabit Ethernet RJ45 (GMAC0 + on-module YT8531)
+ *   - 2x USB-A behind a USB3 hub (combphy1 + u2phy1)
+ *   - USB-C with PD/altmode (FUSB302 on i2c0, combphy0 + USBDP PHY)
+ *   - M.2 PCIe 2.0 x1 slot (combphy0 as PCIe lane)
+ *   - microSD card slot
+ *   - Green/red status LEDs, 40-pin RPi-compatible header
+ *   - 12 V DC barrel jack
+ *
+ * Copyright (c) 2024 ArmSoM
+ * Copyright (c) 2026 Jiaxing Hu <gahing@gahingwoo.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
+#include "rk3576-armsom-cm5.dtsi"
+
+/ {
+	model = "ArmSoM CM5-IO";
+	compatible = "armsom,cm5-io", "armsom,cm5", "rockchip,rk3576";
+
+	aliases {
+		ethernet0 = &gmac0;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+	};
+
+	chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+
+	/* Full-size HDMI Type-A connector, driven by the SoC HDMI TX. */
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	/*
+	 * Carrier status LEDs (schematic ARMSOM-CM5-IO-1V1_20240829):
+	 *   green - GPIO2 PD0 (net LED_GREEN_EN)
+	 *   red   - GPIO2 PD1 (net LED_RED_EN)
+	 */
+	leds: leds {
+		compatible = "gpio-leds";
+
+		led_green: led-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio2 RK_PD0 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&led_green_en>;
+			default-state = "on";
+		};
+
+		led_red: led-red {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_FAULT;
+			gpios = <&gpio2 RK_PD1 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&led_red_en>;
+			default-state = "off";
+		};
+	};
+
+	/* Carrier power tree: 12 V barrel jack -> 5 V -> peripheral rails. */
+	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_12v0_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc_5v0_sys: regulator-vcc-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_12v0_dcin>;
+	};
+
+	vcc_5v0_device: regulator-vcc-5v0-device {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0_device";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_12v0_dcin>;
+	};
+
+	/* PCIe 3.3 V for the M.2 slot, gated by GPIO0 PC3. */
+	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_pwr_en>;
+		regulator-name = "vcc_3v3_pcie";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpios = <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <5000>;
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	/* USB-C / OTG 5 V, gated by GPIO2 PB6. */
+	vcc_5v0_typec0: regulator-vcc-5v0-typec0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_otg0_pwren>;
+		regulator-name = "vcc_5v0_typec0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0_device>;
+	};
+
+	/* USB-A host 5 V (through the hub), gated by GPIO4 PB0. */
+	vcc_5v0_usbhost: regulator-vcc-5v0-usbhost {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren>;
+		regulator-name = "vcc_5v0_usbhost";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0_device>;
+	};
+};
+
+/*
+ * ComboPHY0 -> PCIe lane (M.2 slot); ComboPHY1 -> USB3 lane (USB-A hub).
+ */
+&combphy0_ps {
+	status = "okay";
+};
+
+&combphy1_psu {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdmi_sound {
+	status = "okay";
+};
+
+&hdptxphy {
+	status = "okay";
+};
+
+/* SAI6 is the I2S CPU DAI feeding the HDMI audio path. */
+&sai6 {
+	status = "okay";
+};
+
+/* I2C0: FUSB302 USB-C PD controller @ 0x22, pinctrl i2c0m1 (PC4/PC5). */
+&i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0m1_xfer>;
+
+	usbc0: usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vcc_5v0_typec0>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			try-power-role = "sink";
+			op-sink-microwatt = <1000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				 PDO_FIXED(9000, 3000, PDO_FIXED_USB_COMM)
+				 PDO_FIXED(12000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0xffffffff>;
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					usbc0_orien_sw: endpoint {
+						remote-endpoint = <&usbdp_phy_orientation_switch>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					usbc0_role_sw: endpoint {
+						remote-endpoint = <&usb_drd0_role_switch>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					dp_altmode_mux: endpoint {
+						remote-endpoint = <&usbdp_phy_dp_altmode_mux>;
+					};
+				};
+			};
+		};
+	};
+};
+
+/*
+ * PCIe 2.0 x1 M.2 slot. Reset GPIO2 PB1, power vcc_3v3_pcie (GPIO0 PC3).
+ */
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_reset>;
+	reset-gpios = <&gpio2 RK_PB1 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc_3v3_pcie>;
+	status = "okay";
+};
+
+/* microSD card slot. */
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	max-frequency = <200000000>;
+	no-sdio;
+	no-mmc;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vccio_sd_s0>;
+	status = "okay";
+};
+
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	phy-supply = <&vcc_5v0_typec0>;
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc_5v0_usbhost>;
+	status = "okay";
+};
+
+/* Debug UART0 on the 40-pin header. */
+&uart0 {
+	pinctrl-0 = <&uart0m0_xfer>;
+	status = "okay";
+};
+
+/* USB DRD0: USB-C (USBDP SuperSpeed + USB2 HS), OTG with FUSB302 role-switch. */
+&usb_drd0_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb_drd0_role_switch: endpoint {
+			remote-endpoint = <&usbc0_role_sw>;
+		};
+	};
+};
+
+/* USB DRD1: USB-A ports behind the hub (combphy1 SuperSpeed + USB2 HS). */
+&usb_drd1_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbdp_phy {
+	status = "okay";
+	mode-switch;
+	orientation-switch;
+	sbu1-dc-gpios = <&gpio4 RK_PC4 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbdp_phy_orientation_switch: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_orien_sw>;
+		};
+
+		usbdp_phy_dp_altmode_mux: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&dp_altmode_mux>;
+		};
+	};
+};
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
+
+&pinctrl {
+	leds {
+		/* GPIO2 PD0 - green carrier LED */
+		led_green_en: led-green-en {
+			rockchip,pins = <2 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		/* GPIO2 PD1 - red carrier LED */
+		led_red_en: led-red-en {
+			rockchip,pins = <2 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie {
+		/* GPIO0 PC3 - PCIe power enable */
+		pcie_pwr_en: pcie-pwr-en {
+			rockchip,pins = <0 RK_PC3 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+		/* GPIO2 PB1 - PCIe PERST# */
+		pcie_reset: pcie-reset {
+			rockchip,pins = <2 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb {
+		/* GPIO4 PB0 - USB host 5V enable */
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		/* GPIO2 PB6 - USB OTG / Type-C 5V enable */
+		usb_otg0_pwren: usb-otg0-pwren {
+			rockchip,pins = <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		/* GPIO0 PB4 - FUSB302 INT# (active-low) */
+		usbc0_int: usbc0-int {
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
new file mode 100644
index 000000000..91d7918c2
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * ArmSoM CM5 - Rockchip RK3576 compute module (Raspberry Pi CM4 form factor).
+ *
+ * Common to all CM5 carriers. The carrier .dts includes this file, sets the
+ * board model/compatible, and adds carrier-specific peripherals.
+ *
+ * On-module devices:
+ *   - RK806 PMIC on I2C1
+ *   - HYM8563 RTC on I2C2
+ *   - eMMC (SDHCI)
+ *   - GMAC0 + MotorComm YT8531 Gigabit Ethernet PHY (RGMII)
+ *   - SYN43752 WiFi 6 + BT 5.x (SDIO + UART4)
+ *
+ * Copyright (c) 2024 ArmSoM
+ * Copyright (c) 2026 Jiaxing Hu <gahing@gahingwoo.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3576.dtsi"
+
+/ {
+	compatible = "armsom,cm5", "rockchip,rk3576";
+
+	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v1_nldo_s3";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	vcc_1v2_ufs_vccq_s0: regulator-vcc-1v2-ufs-vccq-s0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v2_ufs_vccq_s0";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	vcc_1v8_s0: regulator-vcc-1v8-s0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8_s0";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_1v8_s3>;
+	};
+
+	vcc_1v8_ufs_vccq2_s0: regulator-vcc-1v8-ufs-vccq2-s0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8_ufs_vccq2_s0";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_1v8_s3>;
+	};
+
+	vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_2v0_pldo_s3";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <2000000>;
+		regulator-max-microvolt = <2000000>;
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	vcc_3v3_s0: regulator-vcc-3v3-s0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_s0";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
+	vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_ufs_s0";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	/*
+	 * WiFi power sequencer for SYN43752. Reset GPIO1 PC6 active-low,
+	 * clock from the HYM8563 RTC oscillator.
+	 */
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&hym8563>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on>;
+		reset-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+/*
+ * GMAC0 drives an on-module MotorComm YT8531. The PHY has no local crystal, so
+ * it relies on the SoC 25 MHz reference: clk_mac_refout (REFCLKO25M_GMAC0_OUT)
+ * has to be named on the gmac node for dwmac-rk to enable it, and
+ * ethm0_clk0_25m_out routes it to the pad.
+ */
+&gmac0 {
+	phy-mode = "rgmii-id";
+	clock_in_out = "output";
+	clocks = <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
+		 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
+		 <&cru CLK_GMAC0_PTP_REF>, <&cru REFCLKO25M_GMAC0_OUT>;
+	clock-names = "stmmaceth", "clk_mac_ref", "pclk_mac", "aclk_mac",
+		      "ptp_ref", "clk_mac_refout";
+	phy-handle = <&rgmii_phy0>;
+	phy-supply = <&vcc_3v3_s3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth0m0_miim
+		     &eth0m0_tx_bus2
+		     &eth0m0_rx_bus2
+		     &eth0m0_rgmii_clk
+		     &eth0m0_rgmii_bus
+		     &ethm0_clk0_25m_out>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
+/* I2C1: RK806 PMIC @ 0x23 (interrupt on GPIO0 PA6). */
+&i2c1 {
+	status = "okay";
+
+	pmic@23 {
+		compatible = "rockchip,rk806";
+		reg = <0x23>;
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA6 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
+
+		system-power-controller;
+
+		vcc1-supply = <&vcc_5v0_sys>;
+		vcc2-supply = <&vcc_5v0_sys>;
+		vcc3-supply = <&vcc_5v0_sys>;
+		vcc4-supply = <&vcc_5v0_sys>;
+		vcc5-supply = <&vcc_5v0_sys>;
+		vcc6-supply = <&vcc_5v0_sys>;
+		vcc7-supply = <&vcc_5v0_sys>;
+		vcc8-supply = <&vcc_5v0_sys>;
+		vcc9-supply = <&vcc_5v0_sys>;
+		vcc10-supply = <&vcc_5v0_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc_5v0_sys>;
+		vcc13-supply = <&vcc_1v1_nldo_s3>;
+		vcc14-supply = <&vcc_1v1_nldo_s3>;
+		vcca-supply = <&vcc_5v0_sys>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		rk806_dvs1_null: dvs1-null-pins {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs2_null: dvs2-null-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs3_null: dvs3-null-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun0";
+		};
+
+		regulators {
+			vdd_cpu_big_s0: dcdc-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_cpu_big_s0";
+				regulator-enable-ramp-delay = <400>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_npu_s0: dcdc-reg2 {
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_npu_s0";
+				regulator-enable-ramp-delay = <400>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: dcdc-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_cpu_lit_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc_3v3_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vdd_gpu_s0: dcdc-reg5 {
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <900000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_gpu_s0";
+				regulator-enable-ramp-delay = <400>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			vddq_ddr_s0: dcdc-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vddq_ddr_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_logic_s0: dcdc-reg7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <800000>;
+				regulator-name = "vdd_logic_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3: dcdc-reg8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vdd2_ddr_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vdd_ddr_s0: dcdc-reg10 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vdd_ddr_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_1v8_s0: pldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca_1v8_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pldo2_s0: pldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca1v8_pldo2_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vdda_1v2_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcca_3v3_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vccio_sd_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pldo6_s3: pldo-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca1v8_pldo6_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd_0v75_s3: nldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdda_ddr_pll_s0: nldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdda_ddr_pll_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v75_hdmi_s0: nldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <837500>;
+				regulator-max-microvolt = <837500>;
+				regulator-name = "vdda0v75_hdmi_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v85_s0: nldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdda_0v85_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v75_s0: nldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdda_0v75_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+/* I2C2: HYM8563 RTC @ 0x51 (interrupt on GPIO0 PA0). */
+&i2c2 {
+	status = "okay";
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		clock-output-names = "hym8563";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hym8563_int>;
+		wakeup-source;
+		#clock-cells = <0>;
+	};
+};
+
+/*
+ * The PHY reset has to be described at the MDIO bus level: mdiobus releases a
+ * bus level reset before it scans for PHY IDs, whereas the per-PHY reset-gpios
+ * is only applied by phylib once the PHY has already been found, which never
+ * happens while the YT8531 is still held in reset.
+ */
+&mdio0 {
+	reset-gpios = <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
+	reset-delay-us = <20000>;
+	reset-post-delay-us = <100000>;
+
+	rgmii_phy0: phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+&saradc {
+	vref-supply = <&vcca_1v8_s0>;
+	status = "okay";
+};
+
+/* eMMC: on-module, HS400 200 MHz with enhanced strobe. */
+&sdhci {
+	bus-width = <8>;
+	full-pwr-cycle-in-suspend;
+	max-frequency = <200000000>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sdio;
+	no-sd;
+	non-removable;
+	/delete-property/ supports-cqe;
+	status = "okay";
+};
+
+/* SDIO: SYN43752 WiFi, power-sequenced by sdio_pwrseq, clock from HYM8563. */
+&sdio {
+	bus-width = <4>;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-sd;
+	no-mmc;
+	non-removable;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	wakeup-source;
+	status = "okay";
+};
+
+/* UART4: Bluetooth (SYN43752). */
+&uart4 {
+	pinctrl-0 = <&uart4m1_xfer &uart4m1_ctsn &uart4m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&pinctrl {
+	hym8563 {
+		hym8563_int: hym8563-int {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	wireless-wlan {
+		/* GPIO1 PC6 - WiFi power enable / reset (sdio_pwrseq) */
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
-- 
2.43.0


