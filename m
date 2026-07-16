Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D466C44516
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/I42L0S4Ff6OUC3jayFxyXKCczhQUleKAYju5c3wos=; b=O+Q2Ew+Oz3F10ULM/WCE+bHRs+
	rQqup4PY37BXg3RO1vmtSQXNcGomxRevdHN12BPxjia5dBvU5clPydG+axSPzCOL6j/z0g19Cj1i/
	wLy7YPl7P8oP8WLMKKvmKy2tlh8siD6IrP+XHTmFNBBZPfjtLaXyUvz5fbkwj36gObGJnQnoRkjWe
	IVFF6vo0+E8L8WlV276PNNl2BWDrPOzHrrZN6+qXZUdRJlHWleGhzGJL7NKp61LFJ1/u7uGUFC+Wn
	I83GHdKufPlWPWtIF0N1oKafAeyfNQRcSf7CDgVld7sorrV5HD6iJqMH9xCkythx4hkjPn7y7E6mI
	P1e6e0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMlo-0000000HR8z-1IuP;
	Thu, 16 Jul 2026 14:09:00 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMlY-0000000HQzZ-0jHi;
	Thu, 16 Jul 2026 14:08:47 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id DEA25EC0190;
	Thu, 16 Jul 2026 05:51:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 16 Jul 2026 05:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784195478; x=
	1785059478; bh=9/I42L0S4Ff6OUC3jayFxyXKCczhQUleKAYju5c3wos=; b=r
	a6vOgs302ZOIeCAKg8doKuundp0mmyRngR9ZDWK1AlPXaFQCFocl/5XLY+/zQOhc
	9mpXkf9RKJobpeDpeARW2GnZGUsVPnVLyp3nM4NkQ/N3dNTlnwXFcpB01nvBUyTG
	Cko5NgrbCCcaHtLldfsZSBYsT0wwEySEOWCVem1hvaSmrza7Kjyj8f/bM++yxt8i
	axuUeR1wm+Nxn87UbbH0wIdReLxYlKPRXeacXfLzC00rBGyKmZfommXjKJKmJ1iI
	mTPjkwXIM40zaWDSm8KvO2FSLYMnG7Yh3M5/cVatcsNhj3Hbz0c4wrp7/JSiBWpk
	eIzjHHn+c3UoyVJg4V+uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784195478; x=1785059478; bh=9
	/I42L0S4Ff6OUC3jayFxyXKCczhQUleKAYju5c3wos=; b=RVc/Ml1pdEqwoSDRU
	8yfwB3YsvvkspAM7kO02OZtbjYXB/VKFZCAsa7RLa6eoQJEDFHTWSAwiF6ufqROz
	TB4dCuKf8dCuONMh5IoCLxpBRevnh1Q6LtPylA/roeyp+gx7ynBJfa98G59LHFQX
	kSLB3zcNIWnHJBJQEzCLAfiW/a5cNLO+2Gq4sOIeFvJGM5OAk73JALLBQU7ANaqp
	Amuw5t9nGCSamTbdCAnlDKqy35N69unv1cSXJsEU92G4dO1Ni5CdPfxIU+SXiaM/
	PZxJG6GZRY3NtBZr9HfcHhDcqbxZyXYGfHn+Ynx/0hU144rruIr3ul+fIDtb2qi0
	qgn/A==
X-ME-Sender: <xms:lqlYauwdYbh3iaAsIDiOIGtgqkGyj1naGdAr6kCzicxv3foMk5KftA>
    <xme:lqlYam2sl3d_zaf6hEBPKD8Z33Ur2cuzQ472xjx4bDyW1POBpGiLxKui1WASe-VT0
    eHW-no5QPkMuIDBDqcCaCQjo-bK_O4epYMdn2ADQYB2KQAvsPX1Ez4>
X-ME-Received: <xmr:lqlYakyRoB6SP-y-gH0cyaqCuuvGUXI_z7o_rGshWDxlZjQHa5Rmb-NnWk6kQbgjKI9BUdNZNwBxVbj9l8U>
X-ME-Proxy-Cause: dmFkZTFtkfwBXGbjNhgB32WMYlB2XgiV2xHyv9jbIJVWSbfe42+jzIVfbqxKpU5QvSVpo3
    PBLx8xg55SAzlgcodrAk1vlxBYB90Laa2ngMmN+0xfGtmuMF0d51TutWehRsNDmKzFqALi
    kkG7KpDNEZFAyNoydgJ9QBX+t8qiyMzWIJidfPG8pEGPQmwwq4BKUHsCIMEwEz+KRhhA5s
    Y0kbvaxGuUSs62QwMxcMV7+DYBqY22T6GlHwzwlE6+PmZQ6XP0XgeLhAuhne1w/oavMmc0
    TjHFtqyZJgCJ2hp9fKjvDDtlLp1i/cg7mgsJJaoi4cEYUb0vq0FKGvleJikVfAyUBYjdmc
    vWUjx0OKwVphRrMU4Gql3OZMmZsMslKxCIpgr2e5JdXyyrF4sFiJwYS/TkBNT8E7ZF8IOm
    0Fjhmuj9qqXtyjaJ1V0gRqhYEUK+7vwBOj9dBbjooTIUr7iUPCwUFdEArVM36XaiqU0URn
    cZgqHKWsEO2+VH6egO741tM2/jFDLwh6vtOQSOW6TLrE4Pa6A5qWWUIIPK5pE6RZUknsgP
    Y3cTTblr+J//qXWuBsdCT3FR2Ku1ZYe09xinoqR4ns49Zo8kF1aazaOtly+m74GV78jjhj
    caz7Iuo/r1g8fD7d/vnB+aYADcXyxWacepDjHVvWQz0NmZa0dssHuJ24MNkA
X-ME-Proxy: <xmx:lqlYarUmbVcOBd8xu21WoNE3UWdEceQSPUVzHn9urbCGtcxOX0RAIg>
    <xmx:lqlYag_xOUu2Txn-_kupAW-Cz74j9vPn3VOYwfYrCmBlwAYi4sJvtg>
    <xmx:lqlYauuUFStcr5BawkZ5jFXs5-z8INYENWyjMAZTE2KVEMhvvP9JJw>
    <xmx:lqlYag3zX2K4qXDoXXWuUIjjpBvkgRkinQ2DLUdV7ixIYi_1zZ1HQQ>
    <xmx:lqlYauDbE8VXpU_QB1Ua5G6LuADtzkym7kGtx4jVwMhJh7Fs8XL5LJWR>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jul 2026 05:51:15 -0400 (EDT)
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
Subject: [PATCH v3 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Thu, 16 Jul 2026 21:51:01 +1200
Message-ID: <20260716095101.2498464-3-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716095101.2498464-1-gahing@gahingwoo.com>
References: <20260716095101.2498464-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_070844_482153_B268CA6A 
X-CRM114-Status: GOOD (  15.03  )
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
 .../dts/rockchip/rk3576-armsom-cm5-io.dts     | 397 ++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 564 ++++++++++++++++++
 3 files changed, 962 insertions(+)
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
index 000000000..01ea60c48
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -0,0 +1,397 @@
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
index 000000000..631376354
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
@@ -0,0 +1,564 @@
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
+	/* The RX delay is added by the PHY, the TX delay by the MAC below. */
+	phy-mode = "rgmii-rxid";
+	clock_in_out = "output";
+	clocks = <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
+		 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
+		 <&cru CLK_GMAC0_PTP_REF>, <&cru REFCLKO25M_GMAC0_OUT>;
+	clock-names = "stmmaceth", "clk_mac_ref", "pclk_mac", "aclk_mac",
+		      "ptp_ref", "clk_mac_refout";
+	tx_delay = <0x21>;
+	rx_delay = <0x00>;
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
+		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
+		assigned-clocks = <&cru REFCLKO25M_GMAC0_OUT>;
+		assigned-clock-rates = <25000000>;
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


