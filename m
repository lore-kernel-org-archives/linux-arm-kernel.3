Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71266C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 20:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urirR26CynIZdKaIXIqCtw+Qb6Z0mYe98NOgI61FCqY=; b=VvO9W/TLP+TxNjLJ97VlrnGHuy
	VhhVidRzUcRt206UENpg3krCwWGQwuSNdRfvtOinQxmGCtQ75RndMUvSrtiAFGRcobqHvOHIhPx9e
	3g1+AQkSKu5dN8HVYwXVPhReS+DACW/txIoLRb6eKSdO3utwEZuU2v6FX123J46OBwvuXM+5XuzKD
	yK7tSRN0xoiundAFIQ6ujMJ6Iyfb9JLIMlVhG9wVVni300VLw99hKrADQgAlKgTtPLQcz6bD4Eo2T
	EVYNyxvIsIAxz3oDX0+V5KlEmnJIiPJZnX5j+jmmyCNvy27g5aO4MWcyLffREDDtly3iCB89v5f79
	/8UWiqKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrwU-00000005mnY-3Xfn;
	Tue, 28 Jan 2025 20:12:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrq1-00000005mFA-2g47
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Jan 2025 20:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=urirR26CynIZdKaIXIqCtw+Qb6Z0mYe98NOgI61FCqY=; b=LGh0UIyw/cDB4w6Caz//5f9S4c
	Qr747P+ZZ2mOiHqB3TQ1Tmbffg+yDRlXlsoEyhsr/SBI56R8qXH4VvhMiR2SubWvOxUBZ/J1lK6y6
	m0hMmzR2z2UdT2kUMJBXVXF1VO8LbGwRKGAkcMxsu86Yck8adHgUzkp8/Af/+IjeitkNCMBhgds1E
	/aJK/Q6LmgIM2tuPSNUO6p6+R7WuADE3lVrWoxNQPbeWvdtR8v6N2JPPkhhWZJr1s1CNtXA1gYUKb
	w09jDWr9acuYdGV+Ni87E29wkFVAgGFTwvunJIRHKmxd3QNt3Z3IJ6G6V4XmI4fXa3YieBxvRyDtG
	Cx48EZug==;
Received: from mail.netcube.li ([173.249.15.149])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrpy-0000000F0CM-2a44
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 20:05:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=urirR26CynIZdKaIXIqCtw+Qb6Z0mYe98NOgI61FCqY=;
	b=A09SY8cT5PHiIMeHNJWqZYckyEYN6cPp9Z7PY6kpXLfO4NeUek/9lNAkcjUNSnrToAS8iVqkCs6jTKDjC88htoDOZbi2PkDxtsBUTTFwX5eeFAbGDFzEPFpd/n7+Z69Dyosae/5bmPpsKsYJrGnJXFXCRj3BQ20SQA0IiWLT06k=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Tue, 28 Jan 2025 21:05:20 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/4] ARM: dts: sunxi: add support for NetCube Systems Kumquat
Date: Tue, 28 Jan 2025 21:03:53 +0100
Message-Id: <20250128200355.1948997-5-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128200355.1948997-1-lukas.schmid@netcube.li>
References: <20250128200355.1948997-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_200530_886153_69681425 
X-CRM114-Status: GOOD (  17.63  )
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

NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
including:

- 64MB DDR2 included in SoC
- 10/100 Mbps Ethernet
- USB-C DRD
- Audio Codec
- Isolated CAN-FD
- ESP32 over SDIO
- 8MB SPI-NOR Flash for bootloader
- I2C EEPROM for MAC addresses
- SDIO Connector for eMMC or SD-Card
- 8x 12/24V IOs, 4x normally open relays
- DS3232 RTC with Battery Backup
- QWIIC connectors for external I2C devices

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 278 ++++++++++++++++++
 2 files changed, 280 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 48666f73e638..d799ad153b37 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 := -@
 DTC_FLAGS_sun8i-h3-orangepi-pc := -@
 DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 := -@
 DTC_FLAGS_sun8i-h3-orangepi-pc-plus := -@
+DTC_FLAGS_sun8i-v3s-netcube-kumquat := -@
 dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a23-evb.dtb \
 	sun8i-a23-gt90h-v4.dtb \
@@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-v3s-anbernic-rg-nano.dtb \
 	sun8i-v3s-licheepi-zero.dtb \
 	sun8i-v3s-licheepi-zero-dock.dtb \
+	sun8i-v3s-netcube-kumquat.dtb \
 	sun8i-v40-bananapi-m2-berry.dtb
 dtb-$(CONFIG_MACH_SUN9I) += \
 	sun9i-a80-optimus.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
new file mode 100644
index 000000000000..e4e98ddfbd96
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
+ */
+
+/dts-v1/;
+#include "sun8i-v3s.dtsi"
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/{
+	model = "NetCube Systems Kumquat";
+	compatible = "netcube,kumquat", "allwinner,sun8i-v3s";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &emac;
+		rtc0 = &ds3232;
+		rtc1 = &rtc; /* not battery backed */
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	/* 40 MHz Crystal Oscillator on PCB */
+	clk_can0: clock-can0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency  = <40000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		key-user {
+			label = "GPIO Key User";
+			linux,code = <KEY_PROG1>;
+			gpios = <&pio 1 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PB2 */
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-heartbeat {
+			gpios = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
+			linux,default-trigger = "heartbeat";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+		};
+
+		led-mmc0-act {
+			gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
+			linux,default-trigger = "mmc0";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK;
+		};
+	};
+
+	/* EA3036C Switching 3 Channel Regulator - Channel 2 */
+	reg_vcc3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vcc5v0>;
+	};
+
+	/* K7805-1000R3 Switching Regulator supplied from main 12/24V terminal block */
+	reg_vcc5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&codec {
+	allwinner,audio-routing =
+		"Headphone", "HP",
+		"Headphone", "HPCOM",
+		"MIC1", "Mic",
+		"Mic", "HBIAS";
+	status = "okay";
+};
+
+&ehci {
+	status = "okay";
+};
+
+&emac {
+	allwinner,leds-active-low;
+	nvmem-cells = <&eth0_macaddress>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	ds3232: rtc@68 {
+		compatible = "dallas,ds3232";
+		reg = <0x68>;
+	};
+
+	eeprom0: eeprom@50 {
+		compatible = "atmel,24c02";		/* actually it's a 24AA02E48 */
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&reg_vcc3v3>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		eth0_macaddress: macaddress@fa {
+			reg = <0xfa 0x06>;
+		};
+	};
+
+	tusb320: typec@60 {
+		compatible = "ti,tusb320";
+		reg = <0x60>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+/* Exposed as the Flash/SD Header on the board */
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+/* Connected to the on-board ESP32 */
+&mmc1 {
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+&ohci {
+	status = "okay";
+};
+
+/* Disable external 32k osc as it is broken on current revision */
+&osc32k {
+	status = "disabled";
+};
+
+&pio {
+	vcc-pb-supply = <&reg_vcc3v3>;
+	vcc-pc-supply = <&reg_vcc3v3>;
+	vcc-pe-supply = <&reg_vcc3v3>;
+	vcc-pf-supply = <&reg_vcc3v3>;
+	vcc-pg-supply = <&reg_vcc3v3>;
+
+	gpio-line-names = "", "", "", "", // PA
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "CAN_nCS", "CAN_nINT", "USER_SW", "PB3", // PB
+			  "USB_ID", "USBC_nINT", "I2C0_SCL", "I2C0_SDA",
+			  "UART0_TX", "UART0_RX", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "SPI_MISO", "SPI_SCK", "FLASH_nCS", "SPI_MOSI", // PC
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "", // PD
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "Q12", "Q11", "Q10", "Q9", // PE
+			  "LED_SYS0", "I1", "Q1", "Q2",
+			  "I2", "I3", "Q3", "Q4",
+			  "I4", "I5", "Q5", "Q6",
+			  "I6", "I7", "Q7", "Q8",
+			  "I8", "UART1_TXD", "UART1_RXD", "ESP_nRST",
+			  "ESP_nBOOT", "", "", "",
+			  "", "", "", "",
+			  "SD_D1", "SD_D0", "SD_CLK", "SD_CMD", // PF
+			  "SD_D3", "SD_D2", "LED_SYS1", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
+			  "ESP_D2", "ESP_D3", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+/* Disable external 32k osc as it is broken on current revision */
+&rtc {
+	/delete-property/ clocks;
+};
+
+/* Exposed as a USB-C connector with USB-Serial converter */
+&uart0 {
+	pinctrl-0 = <&uart0_pb_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* Connected to the Bootloader/Console of the ESP32 */
+&uart1 {
+	pinctrl-0 = <&uart1_pe_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb_otg {
+	extcon = <&tusb320 0>;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
+	status = "okay";
+};
+
+&spi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		label = "firmware";
+		spi-max-frequency = <40000000>;
+	};
+
+	can@1 {
+		compatible = "microchip,mcp2518fd";
+		reg = <1>;
+		clocks = <&clk_can0>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 1 IRQ_TYPE_LEVEL_LOW>;  /* PB1 */
+		spi-max-frequency = <20000000>;
+		vdd-supply = <&reg_vcc3v3>;
+		xceiver-supply = <&reg_vcc3v3>;
+	};
+};
-- 
2.39.5



