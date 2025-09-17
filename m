Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F58CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zo34a8R9GN78XrpTzcX8T4WsbuCdMbTcDRyJMCWYMNw=; b=rv+3PzysRfvajeEajE0ij826qk
	5a5HzDXOcigIlAE6leBSdrJShN6JBe4Nqd9I8yGqty+XnvqVtoYKllMwIDZ8Bqryd6dHaA4tfJGfo
	McsPSeMabJ4gFr4r6qi7l1czXUAekvJJGh/QxoRn7CJOcDK9lBRtcnCq9/UMtoNVDtE4OqK/unDEe
	O2JPIUfTGzpunuQti/ercT4S5GVPqm3pj9Tzj4nw2wWBsh6EsOans4DqWqILLq/pHolMgC/yQrOLd
	oM9CXHU5v30pS+tEphSR2/9P4ejvJsZJG+HuaB42GzovqMdfbVdnKZuQHPk49Mq4lwcGCsyD/ZEJL
	u0A3lQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymz0-0000000AXWu-2Nn2;
	Wed, 17 Sep 2025 07:53:42 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymyx-0000000AXVS-2AIv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:53:40 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-77b0a93e067so1323221b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 00:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758095619; x=1758700419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zo34a8R9GN78XrpTzcX8T4WsbuCdMbTcDRyJMCWYMNw=;
        b=X83936GEzsUXQQXIFR7K18WlMGr9IjBnBbOdHEp7zTsTbEPl3djMzOqOR5lNOQfS/p
         lCTMEgMz+vnPBkq6bACg3hImOgoqr7dmgOX7ax+idJlKuLGVWQW/4xr0TN2LvFGWGjAn
         Di7ZaZesIrvEX5RZxLMsHoG7z6g+HfGt39VqqQMXPKFd+loZR6Cimbmy5kZrGmA+alSW
         Q73QS8qRmgHdxS5uBKnq70Yq91wPlvQ0PlLJNxcY0F+OnfUAryNevg4ApTvx+ZlwTEhW
         X/tM2l39ldD1yYqs8VTmkuGgEOA9uUHoKmfWryam7NUCv6VVLWE2Of/+VfKdJ757myzr
         JQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758095619; x=1758700419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zo34a8R9GN78XrpTzcX8T4WsbuCdMbTcDRyJMCWYMNw=;
        b=JlpcDVKGRvVr1OyzEbDb5mZcurLConkW6nD9puqWs8f1adceuLP5feILaiVTgNf76R
         9GMUaYcVKiXnlasm0QeaaztP53mZWPvooXllhhWnbgHMR/+6IdXbAk9cNzgJMc6DoJNO
         YaeDfJiMGh5yflbRUYwlxyLqW3K8+jACp4TqlfQTX0U1QDuHGjoxnkr5Mgxr4BghCJe7
         cW9gw169tsOKIlyuzEs8/MQjmufmwnu7y056ca99A+82WC4dIMs7JYhkfILukiQW/WTq
         OtFkQp8jrgr06GnXmqcwaoo163LVRBOhmdpxTsh+xqhEaWoSIkm6k7pvCYYBRatlcPPS
         SfgA==
X-Forwarded-Encrypted: i=1; AJvYcCXwpEqUoN8T3+4J7iNm1EzvIKOT60mEmVQGsCJROKUKqYq4IG/DFbWjGIGTZRyHH2EBiJ6gY95altgsxPYL6adp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8DUvOSL1XBRY9uN1DTiJLiW3UigmxB8byZpBpgt97KzgsTPrb
	nn+Aydqd3CkVw3+vuPgNunNfMKg3C0VAShG23yVu+JAPQ51pRUD13I8R
X-Gm-Gg: ASbGncuuPqcU/u6x/JYO+39orlbCAfcKP09n97uaDy/J/Vr+UD/F1eagx9/SepG/nXu
	Zq7I+XMww0Sdu+vMgqFl8G3tsZBfssfPGw5i0614lafJCL74tps5WTp/b1ri/AT0QEfbBec4g6M
	d83uXhZubROZaTiqC7qruvoZJ4s17J6rqCrK9tERByjUAn7iRBsVufATeypZ32zjGl/XxCHRWEm
	yeLPrE3ilFhTLGVjyEu9h2NLPuGV9Arb0fFcQwqRzz/U3+Xsp67sZDy3ZVMMuw2qi0yEFIW9AcJ
	gbFplrfoT9ccVLM7vNTKPZu9DasdbfTqyevH5CLoy3pEGDgm9Uw0BeAvAsAdIMjvqD1Q1hSbahb
	7c0v82rIIraPlp3FbCGbge00reTuLeGAG3rzL18cS0UAsqDm4vfq/7775+kHPrbWDzNS1iXCUnI
	vzdBToM/qaFdvpC6Ta2+9/pkMp9bWFmMyYtIEHB+PsnA==
X-Google-Smtp-Source: AGHT+IGZZ6kp74iJ+DEVopRY55B0Sgz6x0DpICuv+z5mt9LxQCGCiSIkNq258NJtzrF4me5b3mXi7A==
X-Received: by 2002:a17:902:d4c3:b0:262:2ae8:2517 with SMTP id d9443c01a7336-268118b93f5mr14303825ad.5.1758095618311;
        Wed, 17 Sep 2025 00:53:38 -0700 (PDT)
Received: from meta-device (2001-b400-e359-6d3b-3881-d7b4-5e6b-c23a.emome-ip6.hinet.net. [2001:b400:e359:6d3b:3881:d7b4:5e6b:c23a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25db018df8bsm145984875ad.151.2025.09.17.00.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 00:53:38 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 2/2] ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
Date: Wed, 17 Sep 2025 15:53:32 +0800
Message-ID: <20250917075334.4044607-1-kevin.tung.openbmc@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_005339_586771_73EB61D1 
X-CRM114-Status: GOOD (  14.57  )
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

Add device tree for the Meta (Facebook) Yosemite5 compute node,
based on the AST2600 BMC.

The Yosemite5 platform provides monitoring of voltages, power,
temperatures, and other critical parameters across the motherboard,
CXL board, E1.S expansion board, and NIC components. The BMC also
logs relevant events and performs appropriate system actions in
response to abnormal conditions.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite5.dts  | 1063 +++++++++++++++++
 1 file changed, 1063 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
new file mode 100644
index 000000000000..9210504d96d5
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -0,0 +1,1063 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2025 Facebook Inc.
+
+/dts-v1/;
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Facebook Yosemite 5 BMC";
+	compatible = "facebook,yosemite5-bmc", "aspeed,ast2600";
+
+	aliases {
+		i2c16 = &i2c5mux0ch0;
+		i2c17 = &i2c5mux0ch1;
+		i2c18 = &i2c5mux0ch2;
+		i2c19 = &i2c5mux0ch3;
+		i2c20 = &i2c5mux1ch0;
+		i2c21 = &i2c5mux1ch1;
+		i2c22 = &i2c5mux1ch2;
+		i2c23 = &i2c5mux1ch3;
+		i2c24 = &i2c6mux0ch0;
+		i2c25 = &i2c6mux0ch1;
+		i2c26 = &i2c6mux0ch2;
+		i2c27 = &i2c6mux0ch3;
+		i2c28 = &i2c8mux0ch0;
+		i2c29 = &i2c8mux0ch1;
+		i2c30 = &i2c8mux0ch2;
+		i2c31 = &i2c8mux0ch3;
+		i2c32 = &i2c30mux0ch0;
+		i2c33 = &i2c30mux0ch1;
+		i2c34 = &i2c30mux0ch2;
+		i2c35 = &i2c30mux0ch3;
+		serial0 = &uart1;
+		serial2 = &uart3;
+		serial3 = &uart4;
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial4:57600n8";
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+					  <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+					  <&adc1 2>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "bmc_heartbeat_amber";
+			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-1 {
+			label = "fp_id_amber";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			label = "power_blue";
+			default-state = "off";
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	spi_gpio: spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+		num-chipselects = <1>;
+		status = "okay";
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
+};
+
+&adc0 {
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default
+		&pinctrl_adc1_default
+		&pinctrl_adc2_default
+		&pinctrl_adc3_default
+		&pinctrl_adc4_default
+		&pinctrl_adc5_default
+		&pinctrl_adc6_default
+		&pinctrl_adc7_default>;
+	status = "okay";
+};
+
+&adc1 {
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc10_default>;
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-128.dtsi"
+	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+		spi-max-frequency = <50000000>;
+	};
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"BATTERY_DETECT","","BMC_I2C1_FPGA_ALERT","BMC_READY",
+			"IOEXP_INT_3V3","FM_ID_LED","","",
+	/*C0-C7*/	"","","","",
+			"PMBUS_REQ_N","PSU_FW_UPDATE_REQ_N","","BMC_I2C_SSIF_ALERT",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"FM_BMC_MUX1_SEL","","","",
+			"","","FM_DEBUG_PORT_PRSNT_N","FM_BMC_DBP_PRESENT_N",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","FLASH_WP_STATUS","BMC_JTAG_MUX_SEL","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"PCIE_EP_RST_EN","BMC_FRU_WP","SCM_HPM_STBY_RST_N",
+			"SCM_HPM_STBY_EN","STBY_POWER_PG_3V3","TH500_SHDN_OK","","",
+	/*N0-N7*/	"led-postcode-0","led-postcode-1","led-postcode-2",
+			"led-postcode-3","led-postcode-4","led-postcode-5",
+			"led-postcode-6","led-postcode-7",
+	/*O0-O7*/	"RUN_POWER_PG","PWR_BRAKE","CHASSIS_AC_LOSS","BSM_PRSNT_N",
+			"PSU_SMB_ALERT","FM_TPM_PRSNT_0_N","PSU_FW_UPDATING_N","",
+	/*P0-P7*/	"PWR_BTN_BMC_N","IPEX_CABLE_PRSNT","ID_RST_BTN_BMC_N",
+			"RST_BMC_RSTBTN_OUT_N","BMC_PWR_LED","RUN_POWER_EN","SHDN_FORCE","",
+	/*Q0-Q7*/	"IRQ_PCH_TPM_SPI_LV3_N","USB_OC0_REAR_N","UART_MUX_SEL",
+			"I2C_MUX_RESET","RSVD_NV_PLT_DETECT","SPI_TPM_INT",
+			"CPU_JTAG_MUX_SELECT","THERM_BB_OVERT",
+	/*R0-R7*/	"THERM_BB_WARN","SPI_BMC_FPGA_INT","CPU_BOOT_DONE","PMBUS_GNT",
+			"CHASSIS_PWR_BRK","PCIE_WAKE","PDB_THERM_OVERT","SHDN_REQ",
+	/*S0-S7*/	"","","SYS_BMC_PWRBTN_N","FM_TPM_PRSNT_1_N",
+			"FM_BMC_DEBUG_SW_N","UID_LED_N","SYS_FAULT_LED_N","RUN_POWER_FAULT",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"FM_DBP_BMC_PRDY_N","","","","","","","",
+	/*V0-V7*/	"L2_RST_REQ_OUT","L0L1_RST_REQ_OUT","BMC_ID_BEEP_SEL",
+			"BMC_I2C0_FPGA_ALERT","SMB_BMC_TMP_ALERT","PWR_LED_N",
+			"SYS_RST_OUT","IRQ_TPM_SPI_N",
+	/*W0-W7*/	"","","","","","","IRQ_ESPI_LPC_SERIRQ_ALERT0_N","",
+	/*X0-X7*/	"","FM_DBP_CPU_PREQ_GF_N","","","","","","",
+	/*Y0-Y7*/	"","","FM_FLASH_LATCH_N","BMC_EMMC_RST_N","","","","",
+	/*Z0-Z7*/	"","","","","","","","";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/	"","","","","","","","",
+	/*18B0-18B7*/	"","","","","FM_BOARD_BMC_REV_ID0",
+			"FM_BOARD_BMC_REV_ID1","FM_BOARD_BMC_REV_ID2","",
+	/*18C0-18C7*/	"","","SPI_BMC_BIOS_ROM_IRQ0_N","","","","","",
+	/*18D0-18D7*/	"","","","","","","","",
+	/*18E0-18E3*/	"FM_BMC_PROT_LS_EN","AC_PWR_BMC_BTN_N","","";
+};
+
+/* MB CPLD I2C */
+&i2c0 {
+	status = "okay";
+};
+
+/* CPU I2C */
+&i2c1 {
+	status = "okay";
+};
+
+/* MCIO 2A I2C */
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	/* Socket 0 SBRMI */
+	sbrmi@3c {
+		compatible = "amd,sbrmi";
+		reg = <0x3c>;
+	};
+
+	/* Socket 0 SBTSI */
+	sbtsi@4c {
+		compatible = "amd,sbtsi";
+		reg = <0x4c>;
+	};
+};
+
+&i2c4 {
+	multi-master;
+	mctp-controller;
+	status = "okay";
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	/* OCP NIC TEMP */
+	temperature-sensor@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+
+	/* OCP NIC FRU EEPROM */
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+
+	/* I2C MUX for MCIO 1A */
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c5mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	/* I2C MUX for MCIO 0A */
+	i2c-mux@77 {
+		compatible = "nxp,pca9546";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c5mux1ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5mux1ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5mux1ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5mux1ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	/* I2C MUX for PWRPIC #13 ~ #16 */
+	i2c-mux@77 {
+		compatible = "nxp,pca9546";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* PWRPIC #13 */
+		i2c6mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* PWRPIC #14 */
+		i2c6mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* PWRPIC #16 */
+		i2c6mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* PWRPIC #15 */
+		i2c6mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+/* SCM CPLD I2C */
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+
+	power-monitor@14 {
+		compatible = "infineon,xdp710";
+		reg = <0x14>;
+	};
+
+	adc@1d {
+		compatible = "ti,adc128d818";
+		reg = <0x1d>;
+		ti,mode = /bits/ 8 <1>;
+	};
+
+	power-sensor@40 {
+		compatible = "ti,ina238";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+
+	/* PADDLE BD IOEXP */
+	gpio-expander@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"HSC_OC_GPIO0", "HSC_OC_GPIO1",
+			"HSC_OC_GPIO2", "HSC_OC_GPIO3";
+	};
+
+	power-sensor@42 {
+		compatible = "ti,ina238";
+		reg = <0x42>;
+		shunt-resistor = <1000>;
+	};
+
+	power-monitor@43 {
+		compatible = "lltc,ltc4287";
+		reg = <0x43>;
+		shunt-resistor-micro-ohms = <250>;
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina238";
+		reg = <0x44>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina238";
+		reg = <0x45>;
+		shunt-resistor = <1000>;
+	};
+
+	power-monitor@47 {
+		compatible = "ti,tps25990";
+		reg = <0x47>;
+		ti,rimon-micro-ohms = <430000000>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
+
+	/* PDB FRU */
+	eeprom@56 {
+		compatible = "atmel,24c128";
+		reg = <0x56>;
+	};
+
+	/* Paddle BD FRU */
+	eeprom@57 {
+		compatible = "atmel,24c128";
+		reg = <0x57>;
+	};
+
+	power-monitor@58 {
+		compatible = "renesas,isl28022";
+		reg = <0x58>;
+		shunt-resistor-micro-ohms = <1000>;
+	};
+
+	power-monitor@59 {
+		compatible = "renesas,isl28022";
+		reg = <0x59>;
+		shunt-resistor-micro-ohms = <1000>;
+	};
+
+	power-monitor@5a {
+		compatible = "renesas,isl28022";
+		reg = <0x5a>;
+		shunt-resistor-micro-ohms = <1000>;
+	};
+
+	power-monitor@5b {
+		compatible = "renesas,isl28022";
+		reg = <0x5b>;
+		shunt-resistor-micro-ohms = <1000>;
+	};
+
+	psu@5c {
+		compatible = "renesas,raa228006";
+		reg = <0x5c>;
+	};
+
+	fan-controller@5e{
+		compatible = "maxim,max31790";
+		reg = <0x5e>;
+	};
+
+	/* I2C MUX for PWRPIC #1, #2, #11, #12 */
+	i2c-mux@77 {
+		compatible = "nxp,pca9546";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* PWRPIC #1 */
+		i2c8mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* PWRPIC #2 */
+		i2c8mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* PWRPIC #12 (Connector to CXL BD) */
+		i2c8mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c-mux@70 {
+				compatible = "nxp,pca9546";
+				reg = <0x70>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				i2c30mux0ch0: i2c@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				i2c30mux0ch1: i2c@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				i2c30mux0ch2: i2c@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					adc@1e {
+						compatible = "ti,adc128d818";
+						reg = <0x1e>;
+						ti,mode = /bits/ 8 <1>;
+					};
+
+					adc@1f {
+						compatible = "ti,adc128d818";
+						reg = <0x1f>;
+						ti,mode = /bits/ 8 <1>;
+					};
+
+					/* CXL BD IOEXP */
+					gpio-expander@27 {
+						compatible = "nxp,pca9535";
+						reg = <0x27>;
+						gpio-controller;
+						#gpio-cells = <2>;
+						gpio-line-names =
+						"IRQ_TEMP_0_ALERT_N","IRQ_TEMP_1_ALERT_N",
+						"ALERT_PMBUS_0_N","ALERT_PMBUS_1_N",
+						"ALERT_PMBUS_2_N","IRQ_INA230_12V_ALERT_N",
+						"RST_IOX_CXL_N","DEBUG_UART_SEL_0",
+						"DEBUG_UART_SEL_1","BMC_REMOTEJTAG_EN_N",
+						"JTAG_BMC_3V3_CTL_CLR_N","DDR_CH02_I2C_MUX_SEL",
+						"DDR_CH13_I2C_MUX_SEL","SYS_OK",
+						"CXL_VRHOT_ALERT_R1_N","";
+					};
+
+					temperature-sensor@4a {
+						compatible = "ti,tmp75";
+						reg = <0x4a>;
+					};
+
+					temperature-sensor@4c {
+						compatible = "ti,tmp432";
+						reg = <0x4c>;
+					};
+
+					power-sensor@4d {
+						compatible = "ti,ina230";
+						reg = <0x4d>;
+						shunt-resistor = <2000>;
+					};
+
+					temperature-sensor@4e {
+						compatible = "ti,tmp75";
+						reg = <0x4e>;
+					};
+
+					/* CXL FRU */
+					eeprom@50 {
+						compatible = "atmel,24c64";
+						reg = <0x50>;
+					};
+				};
+
+				i2c30mux0ch3: i2c@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
+		/* PWRPIC #11 */
+		i2c8mux0ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c9 {
+	status = "okay";
+
+	temperature-sensor@4b {
+		compatible = "ti,tmp75";
+		reg = <0x4b>;
+	};
+
+	/* SCM FRU */
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+	};
+
+	/* BSM FRU */
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
+};
+
+/* MCIO 0A I2C */
+&i2c10 {
+	status = "okay";
+
+	/* E1S EB IOEXP0 */
+	gpio-expander@21 {
+		compatible = "nxp,pca9535";
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <172 IRQ_TYPE_EDGE_FALLING>;
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"RST_SMB_E1S_0","LED_ACTIVE_E1S_0",
+			"E1S_0_PRSNT_N","RST_PCIE_E1S_0_PERST",
+			"E1S_0_PWRDIS","ALERT_INA_0",
+			"","",
+			"RST_SMB_E1S_1","LED_ACTIVE_E1S_1",
+			"E1S_1_PRSNT_N","RST_PCIE_E1S_1_PERST",
+			"E1S_1_PWRDIS","ALERT_INA_1",
+			"","";
+	};
+
+	/* E1S EB IOEXP1 */
+	gpio-expander@22 {
+		compatible = "nxp,pca9535";
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <174 IRQ_TYPE_EDGE_FALLING>;
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"P12V_E1S_EN_0","PWRGD_P12V_E1S_0",
+			"P12V_E1S_FLTB_0","PWRGD_P3V3_E1S_0",
+			"FM_P3V3_E1S_0_FAULT","P12V_E1S_EN_1",
+			"PWRGD_P12V_E1S_1","P12V_E1S_FLTB_1",
+			"PWRGD_P3V3_E1S_1","FM_P3V3_E1S_1_FAULT",
+			"","",
+			"","",
+			"PWRGD_P3V3_AUX","ALERT_TEMP";
+	};
+
+	power-sensor@40 {
+		compatible = "ti,ina233";
+		reg = <0x40>;
+		shunt-resistor = <2000>;
+		ti,maximum-expected-current-microamp = <32768000>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina233";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+		ti,maximum-expected-current-microamp = <32768000>;
+	};
+
+	adc@48 {
+		compatible = "ti,ads7830";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
+
+	/* E1S EB FRU */
+	eeprom@54 {
+		compatible = "atmel,24c128";
+		reg = <0x54>;
+	};
+};
+
+&i2c11 {
+	status = "okay";
+
+	/* MB IOEXP */
+	gpio-expander@21 {
+		compatible = "nxp,pca9535";
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <170 IRQ_TYPE_EDGE_FALLING>;
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"ALERT_CLKMUX_0_LOSS_N","ALERT_CLKMUX_1_LOSS_N",
+			"ALERT_CLKMUX_2_LOSS_N","ALERT_CLKMUX_3_LOSS_N",
+			"FM_CLKMUX_0_SEL","FM_CLKMUX_1_SEL",
+			"FM_CLKMUX_2_SEL","FM_CLKMUX_3_SEL",
+			"RST_USB_HUB_0_N","FM_CLKGEN_GPIO2",
+			"","FM_BMC_RTC_RST",
+			"FM_P3V_BAT_SCALED_EN","",
+			"FM_CLKGEN_GPIO4","RST_USB_HUB_1_N";
+	};
+
+	power-sensor@40 {
+		compatible = "ti,ina230";
+		reg = <0x40>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@41 {
+		compatible = "ti,ina230";
+		reg = <0x41>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@42 {
+		compatible = "ti,ina230";
+		reg = <0x42>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@43 {
+		compatible = "ti,ina230";
+		reg = <0x43>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina230";
+		reg = <0x44>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
+
+	adc@48 {
+		compatible = "ti,ads7830";
+		reg = <0x48>;
+	};
+
+	adc@49 {
+		compatible = "ti,ads7830";
+		reg = <0x49>;
+	};
+
+	adc@4b {
+		compatible = "ti,ads7830";
+		reg = <0x4b>;
+	};
+};
+
+/* MCIO 4A I2C */
+&i2c12 {
+	multi-master;
+	mctp-controller;
+	status = "okay";
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+};
+
+&i2c13 {
+	status = "okay";
+
+	power-sensor@40 {
+		compatible = "ti,ina230";
+		reg = <0x40>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@41 {
+		compatible = "ti,ina230";
+		reg = <0x41>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina230";
+		reg = <0x44>;
+		shunt-resistor = <2000>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "national,lm75b";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "national,lm75b";
+		reg = <0x49>;
+	};
+
+	/* CLKGEN FRU */
+	eeprom@50 {
+		compatible = "atmel,24c16";
+		reg = <0x50>;
+	};
+
+	/* MB FRU */
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+
+	/* CPU FRU */
+	eeprom@53 {
+		compatible = "atmel,24c128";
+		reg = <0x53>;
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1339";
+		reg = <0x68>;
+	};
+};
+
+/* PROT reserve */
+&i2c14 {
+	status = "okay";
+};
+
+/* MCIO 3A I2C */
+&i2c15 {
+	status = "okay";
+};
+
+&kcs2 {
+	aspeed,lpc-io-reg = <0xca8>;
+	status = "okay";
+};
+
+&kcs3 {
+	aspeed,lpc-io-reg = <0xca2>;
+	status = "okay";
+};
+
+&mac2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ncsi3_default>;
+	use-ncsi;
+	ncsi-package = <1>;
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl_ncsi3_default: ncsi3_default {
+		function = "RMII3";
+		groups = "NCSI3";
+	};
+};
+
+&sgpiom0 {
+	ngpios = <128>;
+	bus-frequency = <2000000>;
+	gpio-line-names =
+	/*"input pin","output pin"*/
+	/*bit0-bit7*/
+	"PWRGD_CPU_PWROK","SGPIO_RSTBTN_OUT",
+	"PWRGD_CPU_PWROK_1","SGPIO_BMC_READY",
+	"PWRGD_CPU_PWROK_2","IBB_BMC_SRST",
+	"host0-ready","FM_I3C_SPD_AH_SEL_R",
+	"PCIe_HP_BOOT","FM_I3C_SPD_IP_SEL_R",
+	"PCIe_HP_DATA","FM_JTAG_BMC_MUX_S0_R",
+	"PCIe_HP_NIC","FM_JTAG_BMC_MUX_S1_R",
+	"","FM_JTAG_BMC_OE_1_R_N",
+	/*bit8-bit15*/
+	"PWRGD_PVDDCR_CPU0_P0","FM_JTAG_BMC_OE_R_N",
+	"PWRGD_PVDDCR_SOC_P0","FM_REMOTEJTAG_EN_R_N",
+	"PWRGD_PVDDCR_CPU1_P0","FM_CPU_FORCE_SELFREFRESH_R",
+	"PWRGD_P3V3_STBY","FM_CPU_NMI_SYNC_FLOOD_R_N",
+	"PWRGD_PVDD33_S5","FM_CPU_TRIGGERTSC_OE_R_N",
+	"PWRGD_PVDD18_S5_P0","FM_PASSWORD_CLEAR_R_N",
+	"PWRGD_PVDDIO_P0","FM_BIOS_USB_RECOVERY_N",
+	"PWRGD_PVDDIO_MEM_S3_P0","FM_USB_MUX_OE_R_N",
+	/*bit16-bit23*/
+	"PWRGD_P1V8_STBY","FM_USB_MUX_SEL_R",
+	"PWRGD_P1V0_STBY","RST_SMB_BOOT_R_N",
+	"PWRGD_P1V2_STBY","RST_SMB_MCIO0A_R_N",
+	"IBB_BMC_SRST","RST_SMB_NIC_R_N",
+	"PWRGD_P12V_E1S_0","FM_PPS_NIC_IN_BUF_OE_R_N",
+	"PWRGD_P12V_E1S_1","FM_PPS_NIC_IN_EN_R",
+	"RST_PCIE_BOOT_PERST_N","FM_PPS_NIC_IN_OE_R_N",
+	"PWRGD_P12V_NIC","FM_PPS_NIC_IN_S0_R",
+	/*bit24-bit31*/
+	"PWRGD_P12V_SCM","FM_PPS_NIC_IN_S1_R",
+	"PWRGD_P12V_DIMM","FM_PPS_NIC_OUT_BUF_OE_R_N",
+	"PWRGD_CPU_DIMM0_AH","FM_PPS_NIC_OUT_CPU_OE_R_N",
+	"PWRGD_CPU_DIMM1_IP","FM_PPS_NIC_OUT_EN_R",
+	"PWRGD_NIC_CPLD","JTAG_CPLD_DBREQ_R_N",
+	"ALERT_INA230_DIMM_0_N","HDT_HDR_RESET_R_N",
+	"ALERT_INA230_DIMM_1_N","FM_SMB_AUTH_MUX_OE_R_N",
+	"ALERT_INA230_E1S_0_N","FM_SCM_LED_R_N",
+	/*bit32-bit39*/
+	"ALERT_INA230_E1S_1_N","",
+	"ALERT_INA230_FAN0_N","",
+	"ALERT_INA230_FAN1_N","",
+	"ALERT_INA230_FAN2_N","",
+	"ALERT_INA230_FAN3_N","",
+	"ALERT_INA230_NIC_N","",
+	"ALERT_INA230_SCM_N","",
+	"ALERT_IRQ_PMBUS_PWR11_N","",
+	/*bit40-bit47*/
+	"ALERT_MCIO2A_LEAK_DETECT_N","",
+	"ALERT_MCIO3A_LEAK_DETECT_N","",
+	"ALERT_MCIO4A_LEAK_DETECT_N","",
+	"ALERT_OC_PADDLE2_N","",
+	"ALERT_OC_PWR2_N","",
+	"ALERT_OC_PWR11_N","",
+	"ALERT_PADDLE2_SMB_N","",
+	"ALERT_PWR14_SB2_LEAK_DETECT_N","",
+	/*bit48-bit55*/
+	"ALERT_PWR14_SB3_LEAK_DETECT_N","",
+	"ALERT_PWR15_SB2_LEAK_DETECT_N","",
+	"ALERT_PWR15_SB3_LEAK_DETECT_N","",
+	"ALERT_SMB_MCIO0A_N","",
+	"ALERT_SMB_MCIO1A_N","",
+	"ALERT_SMB_MCIO2A_N","",
+	"ALERT_SMB_MCIO2B_N","",
+	"ALERT_SMB_MCIO3A_N","",
+	/*bit56-bit63*/
+	"ALERT_SMB_MCIO3B_N","",
+	"ALERT_SMB_MCIO4A_N","",
+	"ALERT_SMB_MCIO4B_N","",
+	"ALERT_THERMALTRIP_MCIO1A_N","",
+	"ALERT_THERMALTRIP_MCIO2A_N","",
+	"ALERT_THERMALTRIP_MCIO3A_N","",
+	"ALERT_THERMALTRIP_MCIO4A_N","",
+	"ALERT_UV_PADDLE2_N","",
+	/*bit64-bit71*/
+	"ALERT_UV_PWR2_N","",
+	"ALERT_UV_PWR11_N","",
+	"ALERT_VR_SMB_N","",
+	"FAULT_FAN_0_N","",
+	"FAULT_FAN_1_N","",
+	"FAULT_FAN_2_N","",
+	"FAULT_FAN_3_N","",
+	"FAULT_P3V3_E1S_0_N","",
+	/*bit72-bit79*/
+	"FAULT_P3V3_E1S_1_N","",
+	"FAULT_P3V3_NIC_N","",
+	"FAULT_P12V_NIC_N","",
+	"FAULT_P12V_SCM_N","",
+	"P0_I3C_APML_ALERT_L","",
+	"ALERT_INLET_TEMP_N","",
+	"FM_CPU_PROCHOT_R_N","",
+	"FM_CPU_THERMTRIP_N","",
+	/*bit80-bit87*/
+	"ALERT_OUTLET_TEMP_N","",
+	"ALERT_RTC_N","",
+	"PVDDCR_CPU0_P0_OCP_N","",
+	"PVDDCR_CPU1_P0_OCP_N","",
+	"PVDDCR_SOC_P0_OCP_N","",
+	"MB_IOEXP_INT","",
+	"E1S_0_BD_IOEXP","",
+	"E1S_1_BD_IOEXP","",
+	/*bit88-bit95*/
+	"PADDLE_BD_IOEXP_INT","",
+	"FM_BOARD_REV_ID0","",
+	"FM_BOARD_REV_ID1","",
+	"FM_BOARD_REV_ID2","",
+	"FM_VR_TYPE_ID0","",
+	"FM_VR_TYPE_ID1","",
+	"PRSNT_BOOT_N_IOEXP","",
+	"PRSNT_DATA_N_IOEXP","",
+	/*bit96-bit103*/
+	"PRSNT_NIC_N_IOEXP","",
+	"PRSNT_BOOT_N_FF","",
+	"PRSNT_MCIO1A_N_FF","",
+	"NIC_PRSNT_N","",
+	"","",
+	"","",
+	"","",
+	"","",
+	/*bit104-bit111*/
+	"","","","","","","","","","","","","","","","",
+	/*bit112-bit119*/
+	"","","","","","","","","","","","","","","","",
+	/*bit120-bit127*/
+	"","","","","","","","","","","","","","","","";
+	status = "okay";
+};
+
+/* BIOS Flash */
+&spi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default>;
+	status = "okay";
+
+	flash@0 {
+		m25p,fast-read;
+		label = "pnor";
+		spi-max-frequency = <12000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+		status = "okay";
+	};
+};
+
+/* Host Console */
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+/* SOL */
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+/* BMC Console */
+&uart5 {
+	status = "okay";
+};
+
+&wdt1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+	aspeed,reset-type = "soc";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+	aspeed,ext-pulse-duration = <256>;
+	status = "okay";
+};
-- 
2.47.1


