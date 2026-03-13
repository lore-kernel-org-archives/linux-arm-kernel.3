Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185B8105F787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wn/UD6BZCdexx1c4zCWwh2htyXc5RV8C9vfJwOLQF/M=; b=TrDBJt8XLuOkwY8r7dZcd5D4KN
	Chy7/wAA/i9m5/87DPUIIC5bjwPSiooFuZ/wlfxwTH/WT6NvkSYXkuqCPH6B6sB1ZpSWv46h0HJ5C
	DDllLvm6AShb9kErrLZ0zF1b6DW2566rnSK8KeLfjZ9A4xQQR3Vs7J4UmInhq0zzvFB/gVWWn0Vu8
	NHyK5+mD6mdynIVqnfjuPX/OnqU36tlpeL/6HrOl9Y4NtsWN+7WHRzgtsdxGulmQnm0kVVOsaQIba
	/jmPWJmMqe+rQZm2zIkVnn529JKJrqPFBA6ecdQ+hdc4TPf7f+nKWzCaxO9kc5e3II+MunY18/bhw
	gJDQ+hRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yLX-0000000HKIE-2984;
	Fri, 13 Mar 2026 08:58:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yLT-0000000HKFn-3zFP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 08:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wn/UD6BZCdexx1c4zCWwh2htyXc5RV8C9vfJwOLQF/M=; b=CclZbzSLIE8cTcNvfvCgd7sQO0
	7HTC8o4vMq5dlIf279F+SZHsCujt3/bGYNQTkLEeeKxhsTMas/J3jxazVo70mWl76OwbMi+JtHIMW
	30jZnRA2GJr49t5hZ7SNai/ts4ASTanEQB0I1hWqpQiSDezP3ytPKLpRums+4Ko5bhdjW3d332q6z
	tVOU1KpkwqrX/gEbDm9NHi5vJpyOBROLZjx9lZP5TMYAuu0PoVOthNAcL4vHD+VZYfUP7/K/8jSel
	B+f5Jdf2iAVY2V19Et3ETqmA5gwaNn4qVmnpRKjURnnjXyddP5NpQ1hR7/69vP1qtWqUSbqU+fgaE
	NP0NkF4g==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yLP-00000002uKn-2U03
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 08:58:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso1823286f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773392286; x=1773997086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wn/UD6BZCdexx1c4zCWwh2htyXc5RV8C9vfJwOLQF/M=;
        b=kRCC69DlIVf4UeYJwWYohUJ0bitmINbbJglxMAcwlUT5k4QUpOccpWN/2pnOxdaY2d
         U9cnuxuiUW0VPI+Rru/D+GLh+42MeB9J1GC62vtHFLmfr8xheMdb3L94tOSS5LEEJReW
         LM3twdqYNv2d6KcQeWp01ef9PNnBdwMMTN7VkQL+sTx/yd5kStH0M/hGBHkdq5wG7PPU
         goJBDz1bYAtazHfJ6kCce6CbEkIFlDOvJSGPhQH4ESJDHEbihrmgYGvur+PO4eoP0h18
         Sh8kOLlbVYzyuFAnZ2v/AZzqv3gGcmJDU511CdCgqwFI1MuDaZsPAFXIvO4j8qs2C75z
         beFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392286; x=1773997086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wn/UD6BZCdexx1c4zCWwh2htyXc5RV8C9vfJwOLQF/M=;
        b=RGCtDxwIjk47uX+OfvttAfNxcgKtCl5nTZqe4/WXcVW18NtAmcsPqNPrMiVs5xb9DN
         i2riHCCbakJ3UCToHxGmNHRSZnvWaA8Cc3gi1QIJwnAVFtMURNuQ37+tVPycwYwxdCKp
         L3VjQH7PHESH/itckj9HOt/zJPdX9O7LLUEWwK7IRnEQo66Cm+oLY+MVUc3sX4tLM7z9
         oUlr7KZDJ2ZYuRXcg7NBfgxU7WP6jk5O1tP6EOJRHCPGzEqd9k+N0ba3x7XoegXQHTKm
         vlAkeeL4fn/ce6gHFfhKprcvr4AdUL48WmXXlIhca1gvi5L2+EKRf6/W4QONtcalAWxN
         ZZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTn/NQW1FzdtUtDIft053gFLxDOlOLeA0uRklforPX4Tq+yYGqhOd9LXiKu5eMNAPYmgBHYadxoSIiMhUgVSUD@lists.infradead.org
X-Gm-Message-State: AOJu0YykTKy81i7ZaqKIaMFx6HzUPDt7xiwYjV1Ez3yMsIOAIJKd7MM9
	Kc7MbuGdb0ko6DF0EIggp6MAghazudff1hDcIJE5budFYKLpenK7u44g
X-Gm-Gg: ATEYQzxAcm/9n/wGmTNOk0zww3lkK+KpqrRRbkJ1FjLSQhJ5M5LE6U6iDQ6rd+rkjz1
	u2yTYXfqndYLimJbUmukh0HzyE2h7pZPnecYRn4124jV2mVnd4WJpq/TX8cagvPlIo+fGQHo+6w
	TmEwSWcuIsNdCOHHWM/Iv3Qv+vqGN8ipGuF1YLgpDjBFX++u3TDJBiIdyP9f1mi7lcdpBl7ys0+
	YRThcbAKX9e0DLyM4Hm7/b2abXsSZwiaa6MWPcvetyZfk97g98SwcIh8xIUeAB0198o4AfQ/+UP
	nJWQHaQxXyEEOjHc1G1f2yZDWtYY4BzN/2dO6z3RbghGWWqpd8rZDoXKFQzURe9jDxnnwCaIyJp
	EgtHBRFTmNZ19HJc8KCa41lozdXJ8QEiHdPj35AqMT58rZ5uRXKv2CShAX8AAwSFVtLrN2i745f
	fAAQFNAyOcG2L5KR0NCc9CMt/mvFbsKfPHPy3N18ZAYbZkDa8ugYac+xt0UZ6RDrqWTHrtHH7zs
	udVxL1v8MAJ7dbN+C62zSFy4po=
X-Received: by 2002:a05:6000:1ac8:b0:435:94c1:3714 with SMTP id ffacd0b85a97d-43a04d130e8mr5113241f8f.0.1773392285759;
        Fri, 13 Mar 2026 01:58:05 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm7663718f8f.36.2026.03.13.01.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:58:05 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 13 Mar 2026 09:57:44 +0100
Subject: [PATCH v2 3/6] arm64: dts: freescale: imx95-verdin: Add Dahlia
 carrier board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-verdin-imx95-upstream-frank-li-base-v2-3-bd488be7c699@toradex.com>
References: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
In-Reply-To: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_085808_074351_85C094EB 
X-CRM114-Status: GOOD (  13.04  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add support for the Verdin i.MX95 mated with the Verdin Dahlia carrier
board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v2: Reordered nodes alphanumerically by node name
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-3-823fad02def9@toradex.com/
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../boot/dts/freescale/imx95-verdin-dahlia.dtsi    | 270 +++++++++++++++++++++
 .../dts/freescale/imx95-verdin-nonwifi-dahlia.dts  |  21 ++
 .../dts/freescale/imx95-verdin-wifi-dahlia.dts     |  21 ++
 4 files changed, 314 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 12cbb60cb0cd..952268856cac 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -452,7 +452,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi
new file mode 100644
index 000000000000..889b71aa3de0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin iMX95 SoM on Dahlia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	reg_1v8_sw: regulator-1v8-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "On-carrier +V1.8_SW";
+	};
+
+	reg_pcie: regulator-pcie {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "PCIE_1_PWR_EN";
+	};
+
+	reg_usb_hub: regulator-usb-hub {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "HUB_PWR_EN";
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "verdin-wm8904";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"Microphone Jack", "MICBIAS",
+			"IN1L", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904_1a>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+	};
+};
+
+/* Verdin ADC_1, ADC_2, ADC_3 and ADC_4 */
+&adc1 {
+	status = "okay";
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Verdin CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Verdin CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+/* Verdin QSPI_1 */
+&flexspi1 {
+	status = "okay";
+};
+
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio1>,
+		    <&pinctrl_gpio2>,
+		    <&pinctrl_gpio3>;
+};
+
+&gpio3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio6>;
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio5>;
+};
+
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio4>;
+};
+
+/* Verdin I2C_3_HDMI */
+&i3c2 {
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&lpi2c3 {
+	status = "okay";
+};
+
+/* Verdin I2C_1 */
+&lpi2c4 {
+	status = "okay";
+
+	wm8904_1a: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sai3_mclk>;
+		clocks = <&scmi_clk IMX95_CLK_SAI3>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_1v8_sw>;
+		CPVDD-supply = <&reg_1v8_sw>;
+		DBVDD-supply = <&reg_1v8_sw>;
+		DCVDD-supply = <&reg_1v8_sw>;
+		MICVDD-supply = <&reg_1v8_sw>;
+	};
+
+	/* Current measurement into module VCC */
+	hwmon@40 {
+		compatible = "ti,ina219";
+		reg = <0x40>;
+		shunt-resistor = <10000>;
+	};
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp75c";
+		reg = <0x4f>;
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Verdin I2C_4_CSI */
+&lpi2c5 {
+	status = "okay";
+};
+
+/* Verdin UART_3, used as the Linux console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Verdin UART_4 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* Verdin UART_2 */
+&lpuart8 {
+	status = "okay";
+};
+
+/* Verdin PCIE_1 */
+&pcie0 {
+	vpcie-supply = <&reg_pcie>;
+
+	status = "okay";
+};
+
+/* We support turning off sleep moci on Dahlia */
+&reg_force_sleep_moci {
+	status = "disabled";
+};
+
+/* Verdin I2S_1 */
+&sai3 {
+	status = "okay";
+};
+
+/* Verdin PWM_1 */
+&tpm4 {
+	status = "okay";
+};
+
+/* Verdin PWM_2 */
+&tpm5 {
+	status = "okay";
+};
+
+/* Verdin PWM_3_DSI */
+&tpm6 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usb2 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usb3 {
+	fsl,permanently-attached;
+
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	usb_hub_3_0: usb-hub@1 {
+		compatible = "usb424,5744";
+		reg = <1>;
+		peer-hub = <&usb_hub_2_0>;
+		vdd-supply = <&reg_usb_hub>;
+	};
+
+	usb_hub_2_0: usb-hub@2 {
+		compatible = "usb424,2744";
+		reg = <2>;
+		peer-hub = <&usb_hub_3_0>;
+		vdd-supply = <&reg_usb_hub>;
+	};
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+/* Verdin SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+/* Verdin CTRL_WAKE1_MICO# */
+&verdin_gpio_keys {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dts
new file mode 100644
index 000000000000..16975ae12fcb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-nonwifi.dtsi"
+#include "imx95-verdin-dahlia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 on Dahlia Board";
+	compatible = "toradex,verdin-imx95-nonwifi-dahlia",
+		     "toradex,verdin-imx95-nonwifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dts
new file mode 100644
index 000000000000..bafbe1179ec8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-wifi.dtsi"
+#include "imx95-verdin-dahlia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 WB on Dahlia Board";
+	compatible = "toradex,verdin-imx95-wifi-dahlia",
+		     "toradex,verdin-imx95-wifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};

-- 
2.43.0


