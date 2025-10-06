Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85CACAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZrFYIzPuk9rtzNXWXOQAERqhNp/BdwtufnfrutqIGq8=; b=Pw8DfwshTpuu80KhnnG+9+NStI
	sx4AAcQEWq2wzjG5O9/fhiTPjC2FGP1ohHXLx2t3I1dp9oxJvVg7BcxCaCukK0Zwo0QDThSze6RPd
	UlwahOjpdiRmcQ+H80GBQj3M7dNhRnVh9S7uiSQGGJmf4Z+QoFyZ3NFhLXWvrmYJTo/oPaqY7307s
	acTboLmEeZVekJRhrhW9zKDsAjGQu7VxYRroNbdMtZB5UoBEpON0zZ1VF6CAhYLSkjfpRNKsS4lbq
	7g0EK8pZkGOuwaiael5d2fxEfpv6DS1JCoDLeHD98edr/QAHVxue/I6kc8CtkD29Mt7nR8T6yihLO
	srvv4jqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hsK-0000000HH9c-3Q5h;
	Mon, 06 Oct 2025 09:51:24 +0000
Received: from mx-relay95-hz2.antispameurope.com ([94.100.136.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hsF-0000000HH94-3ME8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 09:51:23 +0000
ARC-Authentication-Results: i=1; mx-gate95-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ZrFYIzPuk9rtzNXWXOQAERqhNp/BdwtufnfrutqIGq8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1759744266;
 b=BcCCDO6Yes0vPrdiuAnWbd5tbFPtbM0XjY1M7/SXV6ZvAHi0lygUrW0YsoTpK0GBkqzWhGpQ
 xtoNnS0t9po6dcyzpd+lZJ3/RlFJNSLD33o15f4Bie3D1bz/TmGTfzoxqpJ3op77MJUrIwcMaTK
 j/DNn3IBlD+OGGna7HUoFtzmLHQqyl/trl8EzdugPf2sFEQa7t6fwMatXFg6rnlmdyhQzkurZYW
 CC8QZfG0MYKHtrUOXSDkCoUXpNO00iEBAu83cExzG2+j6P0Ww1aK/acpsqW6nFOniKhPnM+zj9D
 vh2hX4uzcQUqS4i7IhKC+KUM0HWFgD0ER4WD7x3kK2bvw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1759744266;
 b=diGZZvLwrWDEr/EJmW9Q9xqs5TyLPSkGjyEt9ddML7EG8HKJK4MeRV56SnY+qbYMJeuUnIPS
 IdGBkO6V5mjc28z8jH1Vr7+s/ugd+WtC9WfqudaGSdkWzVT4rlKD3fOyFDiUuYq3MGvEUZKqoQf
 soHBT9zs+uRc6kU02FRlGpD+Md9auEntrSKm0Pi7AW5l0JVrgGbMkDxqss/5dkH/RpCz07ZGByi
 t1l0VdZqKp57tSGBVfDvghNNuThW62L7z8SPOyhXxWSodUNpLI8YFIQmtP3TxFgcxqe2qCCFtWa
 yNtyoggN0KVzjgdcFRNqksp3APIxbtcp3aplnnbsVKldA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay95-hz2.antispameurope.com;
 Mon, 06 Oct 2025 11:51:06 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 279CFA4070E;
	Mon,  6 Oct 2025 11:50:57 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH] arm64: dts: ti: k3-am642-tqma64xxl: add boot phase tags
Date: Mon,  6 Oct 2025 11:50:36 +0200
Message-ID: <20251006095036.16367-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay95-hz2.antispameurope.com with 4cgDzj62dxz2Dj9k
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: a80b39d10b8b7722f74fa46e8949e3b1
X-cloud-security: scantime:1.793
DKIM-Signature: a=rsa-sha256;
 bh=ZrFYIzPuk9rtzNXWXOQAERqhNp/BdwtufnfrutqIGq8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1759744266; v=1;
 b=EXYp671mMSb0rlBN9BU6a9v0UyandQjAWunB0F+zsk+gZjPL1nCruFKhQRvdA740Xqpt/7Cz
 mi/2DVTgQOEDoz67aoTuw9cFVIw0vRJWpE+3WUli0sUjucZd1L3pnB2IGXkthW+kd2RdmX1NkOk
 cv4yf3kcN+DWx/tf661ZSi6wnYOoIrCgkimKNPovAGQADCHvw4Mml6qn4yjGYWebV+bW0ifuP1Y
 3X0c/46Yhqs4lrEnLCNCZV3Ox6gXi5bfXiRR4q8yrEi9wMRyB9rbxiIX9Qys2rv54dyaacFrcC9
 xZTQXSREvPzczjtqDSlWICa16kHssG7vwQJ55QzsWrvzg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_025120_219995_1FD8D4E9 
X-CRM114-Status: GOOD (  12.98  )
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

Similar to other AM64x-based boards, add boot phase tags to make the
Device Trees usable for firmware/bootloaders without modification.

Supported boot devices are eMMC/SD card, SPI-NOR and USB (both mass
storage and DFU). The I2C EEPROM is included to allow the firmware to
select the correct RAM configuration for different TQMa64xxL variants.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 .../dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts     | 18 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi | 12 ++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
index 8f64d6272b1ba..81e9e047281fd 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
@@ -167,6 +167,7 @@ reg_pwm_fan: regulator-pwm-fan {
 	};
 
 	reg_sd: regulator-sd {
+		bootph-all;
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&main_mmc1_reg_pins>;
@@ -245,6 +246,7 @@ icssg1_phy0c: ethernet-phy@c {
 
 
 &main_gpio0 {
+	bootph-all;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_gpio0_digital_pins>,
 		    <&main_gpio0_hog_pins>;
@@ -263,6 +265,7 @@ &main_gpio0 {
 };
 
 &main_gpio1 {
+	bootph-all;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_gpio1_hog_pins>,
 		    <&main_gpio1_pru_pins>;
@@ -332,6 +335,7 @@ &main_spi0 {
 
 /* UART/USB adapter port 1 */
 &main_uart0 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_uart0_pins>;
 	status = "okay";
@@ -492,11 +496,17 @@ &mcu_uart1 {
 };
 
 &serdes_ln_ctrl {
+	bootph-all;
 	idle-states = <AM64_SERDES0_LANE0_USB>;
 };
 
+&serdes_refclk {
+	bootph-all;
+};
+
 &serdes0 {
 	serdes0_usb_link: phy@0 {
+		bootph-all;
 		reg = <0>;
 		#phy-cells = <0>;
 		resets = <&serdes_wiz0 1>;
@@ -506,6 +516,7 @@ serdes0_usb_link: phy@0 {
 };
 
 &sdhci1 {
+	bootph-all;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc1_pins>;
 	bus-width = <4>;
@@ -524,6 +535,7 @@ adc {
 };
 
 &usb0 {
+	bootph-all;
 	/*
 	 * The CDNS USB driver currently doesn't support overcurrent GPIOs,
 	 * so there is no overcurrent detection. The OC pin is configured
@@ -538,6 +550,7 @@ &usb0 {
 };
 
 &usbss0 {
+	bootph-all;
 	ti,vbus-divider;
 };
 
@@ -621,6 +634,7 @@ AM64X_IOPAD(0x00ac, PIN_INPUT, 7)
 	};
 
 	main_gpio0_hog_pins: main-gpio0-hog-pins {
+		bootph-all;
 		pinctrl-single,pins = <
 			/* (P19) GPMC0_CSn2.GPIO0_43 - MMC1_CTRL */
 			AM64X_IOPAD(0x00b0, PIN_OUTPUT, 7)
@@ -730,6 +744,7 @@ AM64X_IOPAD(0x0258, PIN_OUTPUT, 0)
 	};
 
 	main_mmc1_pins: main-mmc1-pins {
+		bootph-all;
 		pinctrl-single,pins = <
 			/* (J19) MMC1_CMD */
 			AM64X_IOPAD(0x0294, PIN_INPUT, 0)
@@ -751,6 +766,7 @@ AM64X_IOPAD(0x0290, PIN_INPUT, 0)
 	};
 
 	main_mmc1_reg_pins: main-mmc1-reg-pins {
+		bootph-all;
 		pinctrl-single,pins = <
 			/* (C13) SPI0_CS1.GPIO1_43 - MMC1_SD_EN */
 			AM64X_IOPAD(0x020c, PIN_OUTPUT, 7)
@@ -791,6 +807,7 @@ AM64X_IOPAD(0x026c, PIN_INPUT, 7)
 	};
 
 	main_uart0_pins: main-uart0-pins {
+		bootph-pre-ram;
 		pinctrl-single,pins = <
 			/* (D15) UART0_RXD */
 			AM64X_IOPAD(0x0230, PIN_INPUT, 0)
@@ -861,6 +878,7 @@ AM64X_IOPAD(0x0088, PIN_OUTPUT, 2)
 	};
 
 	main_usb0_pins: main-usb0-pins {
+		bootph-all;
 		pinctrl-single,pins = <
 			/* (E19) USB0_DRVVBUS */
 			AM64X_IOPAD(0x02a8, PIN_OUTPUT, 0)
diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
index ff3b2e0b8dd45..a78297b9fa57e 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
@@ -14,6 +14,7 @@ aliases {
 	};
 
 	memory@80000000 {
+		bootph-pre-ram;
 		device_type = "memory";
 		/* 1G RAM - default variant */
 		reg = <0x00000000 0x80000000 0x00000000 0x40000000>;
@@ -54,7 +55,12 @@ reg_1v8: regulator-1v8 {
 	};
 };
 
+&fss {
+	bootph-all;
+};
+
 &main_i2c0 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins>;
 	clock-frequency = <400000>;
@@ -67,6 +73,7 @@ tmp1075: temperature-sensor@4a {
 	};
 
 	eeprom0: eeprom@50 {
+		bootph-pre-ram;
 		compatible = "st,24c02", "atmel,24c02";
 		reg = <0x50>;
 		vcc-supply = <&reg_1v8>;
@@ -89,11 +96,13 @@ eeprom1: eeprom@54 {
 };
 
 &ospi0 {
+	bootph-all;
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&ospi0_pins>;
 
 	flash@0 {
+		bootph-all;
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-tx-bus-width = <8>;
@@ -116,6 +125,7 @@ partitions {
 };
 
 &sdhci0 {
+	bootph-all;
 	status = "okay";
 	non-removable;
 	disable-wp;
@@ -126,6 +136,7 @@ &sdhci0 {
 
 &main_pmx0 {
 	main_i2c0_pins: main-i2c0-pins {
+		bootph-pre-ram;
 		pinctrl-single,pins = <
 			/* (A18) I2C0_SCL */
 			AM64X_IOPAD(0x0260, PIN_INPUT_PULLUP, 0)
@@ -135,6 +146,7 @@ AM64X_IOPAD(0x0264, PIN_INPUT_PULLUP, 0)
 	};
 
 	ospi0_pins: ospi0-pins {
+		bootph-all;
 		pinctrl-single,pins = <
 			/* (N20) OSPI0_CLK */
 			AM64X_IOPAD(0x0000, PIN_OUTPUT, 0)
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


