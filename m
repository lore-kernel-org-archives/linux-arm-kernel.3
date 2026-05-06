Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F22CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6H69yYIu0ZRZpt5cxy6DiaQQJZWlk3GmWB+9Tjsp8E=; b=yqnewLvyYtq3yBGgw+pO5p1cQu
	Ze1T4U6+PfmwyLifDNSHG0zY940LvGqUqz5R+EWbipw42yEUYL0QWBBRmwNw8yIy2O/zk/1SSQmNb
	aGGCM97Zod86ALOXvgecrraFz78Dnug+BOR4sM5NRVjQ7yWucUYZsH7Y/d8eCgJdasjjR2uZjca+/
	amfZEkupOHs7pdu0ScHcpsIf/GmvATscfzr06Lg74NwZvcmrd8mEQDnx3QTMUBrgKDxEX59cFHXys
	28E0ktHcWUTww4IflDM6NnHwJXRe/kqVT7lNbOoKWbtpuo6lU4UupSfsDVRujwDa8PIq4cN6c1j7g
	VxKU5mkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbtL-00000000q91-20vH;
	Wed, 06 May 2026 13:02:19 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbtJ-00000000q63-12im
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 13:02:17 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so6906297e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778072535; x=1778677335; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6H69yYIu0ZRZpt5cxy6DiaQQJZWlk3GmWB+9Tjsp8E=;
        b=ryXPnBztm2x6q4Ovg3gFaFp/oSIT9RRNfZT6ySipjadGMy73w7XH3vEGisaPLUpNVn
         vZOKBhGvyDhabxCnwLb1BKMSK86kfyl2VNuRS37HBdMKItlzzKkD8ga7EHTTEk0wjASX
         7HZ9p1x6hdi4E4hc5WQOrSImewgEEk2lrs4NSsSf3yaL4kh6P7GlNbLRGBZTF/jR4ju3
         gwvTlUum+1YcXaFWvCqta0beYpdDTx6YhSSgMG3yoPSpXWvpZkX7IUEFWabC9fefejiJ
         FK3c44LDGXT4BKlYgmIvxK1Sf2JwvI5sCaeKESSN1gWMoJuaesVsxtNE8dv99PfTISbe
         Os8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072535; x=1778677335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w6H69yYIu0ZRZpt5cxy6DiaQQJZWlk3GmWB+9Tjsp8E=;
        b=JXIfEbKq0/IwTGS67zMyknii5S7LB31WYdtGLx4wrk5/wVoj+/oa1lAsAE0Ph3SXl1
         CLuZJXEoJUr3RU/wDabtx61YEM4df04QUEcB0Xvhq8PqMXj1gPmJ4R7L8ld/NExDd83H
         X2vdHJFI6d6SelhSq8H9ENG+jMeSeZFEvKPTOWl4tq5sqycctrX/eBcTwhG9sgs6bWHt
         GaHiVdFWzNyiWm+DZg5Tq1dHD0vftYlkebwBVFGSAvV48vpzbtOKr+MgKPnkGeCM+s9Z
         hQtlWH24hItlaQYMhwtni4zkdu97ji1f67eiPtL8ACd+meIliT0ltqTTCe0ITX1hTJ8O
         kdsA==
X-Forwarded-Encrypted: i=1; AFNElJ/gyW2zcEdDjqwBho+idojHkRJoX0J/ESq8F9iBpi3ADbm9ThDEUgmKJhh3Em5ninRoOxotvbjErg9WGd5XzB1V@lists.infradead.org
X-Gm-Message-State: AOJu0YwgECmE5IlC4zwnDluIWCVXITA7BZhnIDTERjQFKnDPu8SufGeD
	i2Gh/R0Nmz//BjAsCLMzah90eG2pDMVdera4YmxccuUANdGuP35+XmtH
X-Gm-Gg: AeBDietJgKkKn5IFULxZjUlyWPE+lLCqcvLPTNJjubIQ3yZAlOfOqnHxgDXYXgvk0UF
	oJBy4jncjz3F9CII0kRklYp8mfIkZaH1VuESdFmN1WGqt01TIL/ZLqHprk8j91HtfNhUB68fq8q
	sEXSSthV61kYr8c+dpBuwQb7j5CaNzNzQAKl7R+IVnWKH3R0zNUNLVQGzimE15Phakd1Ljk0Nen
	Jr9Q9oga1L9cm9H9uf/MCcVWihZdueWEDYZXpEEBOb21AC563JnLXZvqRNnC8cgW/7sOEsotzEM
	13/P0NciebpTThF/9CrdPTNV2IEI6Rz1EWim3BrjzphtbvWHkB/AP/XUp8ReQjjOcd0u4zc83Ld
	KfQdCQ02jqm8d9X8h0BDsUfpYminQaQGY9xP2iSBdYxNbuWcTwzybxesZwaBXtGVm1tZEZyOfh4
	siS4Uf5olQ8hdYYXHU6ARxcm+MlcISPB4vqFGH6Pj4Av2ZkaG40aftAnuZd6S7qfwUhy6jzb+di
	iBjW+dU+ISgy/sS+5P7lqVI5nPzLzQh+SNrBI6OBLPtw7rC3fgtSICQwCjMw9qOJfjN2nCtjykq
	s2uapfgSTXUIz6aPMLY9lQ==
X-Received: by 2002:a05:6512:400f:b0:5a4:1902:3d17 with SMTP id 2adb3069b0e04-5a887adfda4mr1167554e87.12.1778072532373;
        Wed, 06 May 2026 06:02:12 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm12288076f8f.12.2026.05.06.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:02:11 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 06 May 2026 15:01:57 +0200
Subject: [PATCH 3/3] arm64: dts: freescale: imx95-aquila: Add Clover
 carrier board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-add-aquila-imx95-v1-3-69c8ee1c5413@toradex.com>
References: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
In-Reply-To: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_060217_344882_F858CF1A 
X-CRM114-Status: GOOD (  14.27  )
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

From: Antoine Gouby <antoine.gouby@toradex.com>

Add support for the Aquila i.MX95 SoM mated with the Clover carrier
board. Clover is a low-cost carrier board for the Aquila family
featuring a small form factor (Nano-ITX 120mm x 120mm) and built for
volume production.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     | 294 +++++++++++++++++++++
 2 files changed, 295 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 178f55255dc14..55fb5f9f561ee 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -514,6 +514,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
new file mode 100644
index 0000000000000..021d437763412
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/clover
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx95-aquila.dtsi"
+
+/ {
+	model = "Aquila iMX95 on Aquila Clover Board";
+	compatible = "toradex,aquila-imx95-clover",
+		     "toradex,aquila-imx95",
+		     "fsl,imx95";
+
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	dp_1_connector: dp0-connector {
+		compatible = "dp-connector";
+		dp-pwr-supply = <&reg_dp_3p3v>;
+		type = "full-size";
+
+		port {
+			dp_1_connector_in: endpoint {
+				remote-endpoint = <&dsi2dp_out>;
+			};
+		};
+	};
+
+	reg_dp_3p3v: regulator-dp-3p3v {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_21_dp>;
+		/* Aquila GPIO_21_DP */
+		gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "DP_3V3";
+		startup-delay-us = <10000>;
+	};
+};
+
+/* Aquila ADC_[1-4] */
+&adc1 {
+	status = "okay";
+};
+
+/* Aquila CTRL_WAKE1_MICO# */
+&aquila_key_wake {
+	status = "okay";
+};
+
+&dsi2dp_out {
+	remote-endpoint = <&dp_1_connector_in>;
+};
+
+/* Aquila ETH_1 */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Aquila CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Aquila CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+/* Aquila CAN_3 */
+&flexcan3 {
+	status = "okay";
+};
+
+/* Aquila CAN_4 */
+&flexcan4 {
+	status = "okay";
+};
+
+/* Aquila QSPI_1 */
+&flexspi1 {
+	pinctrl-0 = <&pinctrl_flexspi1_4bit>,
+		    <&pinctrl_qspi_cs1>;
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <66000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		cdns,read-delay = <0>;
+		cdns,tchsh-ns = <3>;
+		cdns,tsd2d-ns = <10>;
+		cdns,tshsl-ns = <30>;
+		cdns,tslch-ns = <8>;
+	};
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_1>,
+		    <&pinctrl_gpio_2>,
+		    <&pinctrl_gpio_3>,
+		    <&pinctrl_gpio_4>;
+};
+
+/* Aquila I2C_2 */
+&i3c2 {
+	status = "okay";
+};
+
+/* Aquila I2C_1 */
+&lpi2c2 {
+	status = "okay";
+
+	fan_controller: fan@18 {
+		compatible = "ti,amc6821";
+		reg = <0x18>;
+		#pwm-cells = <2>;
+
+		fan {
+			cooling-levels = <255>;
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp1075";
+		reg = <0x4f>;
+	};
+
+	/* USB-C OTG (TCPC USB PD PHY) */
+	tcpc@52 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x52>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			op-sink-microwatt = <0>;
+			power-role = "dual";
+			self-powered;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb1_con_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb1_con_ss>;
+					};
+				};
+			};
+		};
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Aquila I2C_6 */
+&lpi2c5 {
+	status = "okay";
+};
+
+/* Aquila SPI_1 */
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6 &pinctrl_gpio_5>;
+	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>, <&gpio4 18 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+
+	tpm@1 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_6>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <12000000>;
+	};
+};
+
+/* Aquila UART_3, used as the Linux Console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Aquila UART_4 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* Aquila UART_1 */
+&lpuart3 {
+	status = "okay";
+};
+
+/* Aquila UART_2 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* Aquila PCIE_1 */
+&pcie0 {
+	status = "okay";
+};
+
+&som_dsi2dp_bridge {
+	status = "okay";
+};
+
+/* Aquila PWM_1 */
+&tpm3 {
+	status = "okay";
+};
+
+/* Aquila PWM_3_DSI and PWM_4_DP */
+&tpm5 {
+	status = "okay";
+};
+
+/* Aquila PWM_2 */
+&tpm6 {
+	status = "okay";
+};
+
+/* Aquila USB_2, optional Bluetooth USB */
+&usb2 {
+	status = "okay";
+};
+
+/* Aquila USB_1 */
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	status = "okay";
+
+	port {
+		usb1_con_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	orientation-switch;
+
+	status = "okay";
+
+	port {
+		usb1_con_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
+/* Aquila SD_1 */
+&usdhc2 {
+	status = "okay";
+};

-- 
2.43.0


