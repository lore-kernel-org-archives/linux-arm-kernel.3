Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C39CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5Du57R96zRr0qT2N8NRla64xZATGL3k04wUBGtEJC0=; b=xIPBiSDUWf8W6TC3KR4ndMhpBo
	Cqse7i7qN3nM//dE0dn1TNmU+2DKv4tnyKt5gCROTGeHf6JK5cU28esk34aJDXEXnEqXpzBIlHLcY
	vNJ02HLNOP5CxFaqpK/KjzBCDUR2hOX63iXDwEuA8ZWZN7iy3egU/FHseHNSwhN23cQivKDUuo6mP
	PreIoF9A4gkJsOIdsO9opIiHPRp01uSkqIzRsgHZYRCnOz3tWwDtLy8jf5IdRgeMN88rpNhQq+V83
	aKuagp9FC82Bg1h6zUSmGK6fnvDR2MjcrnIGT1oGic74SrDayPjhwvzn3v+hZ7RDyrYNS5Fhv6aU5
	jrg7hhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OcR-0000000HNuv-3PGe;
	Wed, 24 Sep 2025 12:29:11 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OcM-0000000HNrP-3CWF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:29:08 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-77f67ba775aso1071963b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 05:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716946; x=1759321746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5Du57R96zRr0qT2N8NRla64xZATGL3k04wUBGtEJC0=;
        b=it2dL3xmd+6kYq1gPQ2WFH9AEB5R5unOO8k7/ry5v/FY+jJdwMN4hz29shNy0qsAlU
         BhBAUvxk9agNBz71Z/WAhEH4C6EbomBFV2h0Qs/d0L6dSITj0IP6dS+8RJpu86LOzeK8
         nqaI63fkma25ZElxx6hkZRaTtrVc2eik+FZwQxu/Be+lIheyn2hd88zhlWJFSW94VXcc
         vQWhFPR5+uVcFxRLLf6BbRMATCaphBxLS9+1gg24ET9slz1bnsaTRUeo9cJ2MUe63x+a
         6+ojrK2fKxNWS1lFe0uTvgUyVMuCF2L4bN0xUXojOpLARWg56RNBXZwaGgB4y+mj8iP7
         1HpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716946; x=1759321746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5Du57R96zRr0qT2N8NRla64xZATGL3k04wUBGtEJC0=;
        b=BIrj6WXHQvIVq0jVd1pgGW6KvpJ4xx6wggGdPkbsRDsg6Cng9vYDzVGARNNpTAM4Kr
         GFpOW/3QH5lMyPwiwb9odrkLlLZSynvDzNLjYKTH0F35RscP8JK4xLdG1OAfCxrBEL1J
         OT5sVhAEN1jfd1CEM2rllLGyMjK+pQzxEEFi9XUp0HiXactL3gas8K5GEagcSx2ECT9j
         Y37ug5Kz0B1afvKyneccnexLxmR8eSeNypu2mbJ5ykXkh7hojx3L3dONifX0TehVNiu5
         6kVXfI5yHNK/5t76R/Go7scxEIEcd/mjqzOIwFoswpJo2HwsPVyOjHJOytO5bvBgATQV
         cq6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIYZJw5ZAMuskr8f+amTfKS5Z0taxjfUkzaCARtjQ4yb2ezAK0e1sNUzoZMuYHP/f2tEWAtHxu5M032zK6q9X6@lists.infradead.org
X-Gm-Message-State: AOJu0YyTBGpeGloTs+vVHRJ+4A3JVCGjarZaeNIzXo0Fmm4T/UskA6uh
	vt6j4MmDgmveDJecQjSnRPPpElsMZrJDHkiQPA7JEfyeBO5Td40pWOUD
X-Gm-Gg: ASbGncu9HYz2JvlmW8LTlHcsTACNKmBSzpHeSiHf/MLDT7Se8pZNSClUMsT324gdhH/
	yJuMULnUuIZBcdVjMEs+kht936D6KnCp9QQybKPCCf1XJe6L086K1cuVBdRW6Xn8/xfVIRBZSAs
	qFY7nej+ojZLjjYadC4+Gk2MiBJdzXiT2xM1RpWGsPT8TeY7uuzjFLaUT6Kj/o/k33HlcERl3Yq
	GtanuV3/NzQEcgP664xCznEiI1VJa+c8kpO0gOZ8alR/zKhiiZj1r6/u5+YoW5VsRu5ghYGBKId
	ZQba0iCi379IDbqKhGe9Q61l7AbNuTfCF71efGeWpSRNA/Xs67e2eei6b8rk4P/T+91+yatkid/
	UhFGGAaQ0GecWkkWoltfyeMg2U2BY9z1BJ30Yrp+FPR37IgSEdSWVdafumYYIEb4hjZ++4JN9pt
	iBcKu1lmG6wJI81+YW/7XsdVZPOxnAY9VromVC+PGz+L7gnVRAAMO6mW9z3/mykW/OKER+AiG9I
	pmcmAzd/aUJUZ7ka+DKFNM=
X-Google-Smtp-Source: AGHT+IEOjt65uHr4SCeGnj6QKxob9+OVYObaXZGpCSRncyS8lPcWtCB1at+amwD9mYZ7g36LUBGUmw==
X-Received: by 2002:a05:6a20:c791:b0:2e5:655c:7f7d with SMTP id adf61e73a8af0-2e5655c8120mr442980637.37.1758716945698;
        Wed, 24 Sep 2025 05:29:05 -0700 (PDT)
Received: from 2001-b400-e384-7809-32b4-db27-121a-a0aa.emome-ip6.hinet.net (2001-b400-e384-7809-50d7-4f66-57aa-588c.emome-ip6.hinet.net. [2001:b400:e384:7809:50d7:4f66:57aa:588c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f254f8f68sm11058495b3a.56.2025.09.24.05.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:29:05 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Wed, 24 Sep 2025 20:28:51 +0800
Subject: [PATCH v2 2/2] ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-yv5_add_dts-v2-2-39a4a8e3c9e6@gmail.com>
References: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
In-Reply-To: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
 Leo Yang <Leo-Yang@quantatw.com>, Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758716933; l=24324;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=INPD6SvS6X+KwaT17cxK5w/jgQiUjiexfArMIui2sQ0=;
 b=lMaTNuSPmJKqTyDsKzZF9RNzVD9VVstglqS6pEIY3klbLM7Q+v0arh5jGwLwMwsPd0SSRWJO7
 5ShNPdJTuK8DFNUS4nSQj0lvN9d13/OUMG3RxFTS4zR9EZfdGxEQZyM
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_052906_847385_86A35506 
X-CRM114-Status: GOOD (  14.83  )
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
 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 1068 ++++++++++++++++++++
 1 file changed, 1068 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
new file mode 100644
index 0000000000000000000000000000000000000000..d71106c21ccd8d984606f6689e8c2c55ecf28d05
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -0,0 +1,1068 @@
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
+		i2c-mux-idle-disconnect;
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
+		i2c-mux-idle-disconnect;
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
+		i2c-mux-idle-disconnect;
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
+		i2c-mux-idle-disconnect;
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
+				i2c-mux-idle-disconnect;
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
2.51.0


