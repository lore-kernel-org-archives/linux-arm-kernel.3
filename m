Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16383C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/AMO1xY4JP5kH64PX2GgDemefdP3ZI3LO1e7DC60jI=; b=MP+r5Phv5WJnteqdsWjdtBvQWt
	dqre+DPMTZ6LLXsyZxD0lqK6U/lj7TU0RtZN6mM5qegV3IY2WersDhvdjDgSuCjQQ8XJsrYC6IWkz
	nA9X4bZLLDZzHfVIqRPV8NPkbL1o1KN5csVzKJo+htTRocvliSDP7Ovs1GsU3bmW/PduGp/AOPCvc
	8ffPr2Pch/2g1Lti83QdxfyBal745aCJu/ffh06YOmNF5PyUFjS+vh48niAUoN3JBREIbKKescbxK
	AyqcVjf6G9SPqPhHL8JKq8id6kLpcHySDPvUjDss2xRhBvAZLx51MFZlSKprltCFqxFA12rQn6/eA
	K8TjO8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KPz-0000000CCYH-1U9v;
	Wed, 09 Sep 2026 15:40:59 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KPx-0000000CCWk-28DB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:40:58 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e2406so10180675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968455; x=1789573255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/AMO1xY4JP5kH64PX2GgDemefdP3ZI3LO1e7DC60jI=;
        b=V08uI3xKEMLpnrxo8+6SYEyCVP6nW0qllpj8eQPdiBz038EoS25ZQjwWcbUsxPSGIV
         Xv0IuD5Gp3LQC7yKBSzHK7dHeXxzOLUnomt6jMWTlzLyKnw6gimT6bPLdix3V9ad5riI
         HsJCvQENorHlbiQRXfCQ7mA7beEmHXITdmA4imRPQS8c3dfncPAwCQZk0irMs6/QdYJe
         ynaVEbVYHgV2i+/pMK/YYOa50qPREXsBW8OYXvlu16E/Co5qQV8rNmqehxo/j0m0e469
         kFUmBICuriKv8V345ruqfcBwFIufw37uxSBS+2wMQwep2NGbBlsfpg4SJGaayxnV3snK
         T++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968455; x=1789573255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/AMO1xY4JP5kH64PX2GgDemefdP3ZI3LO1e7DC60jI=;
        b=sGc5AchE8UJxBwal3vxF+dtEy12yqW7tK9ckmPhvS/tko72fvFLpkMZb1Z0/ZMR1T4
         l+gtOnbRECMmEwD6kGh49wSSyH+kRT/7ggKapv/vNZtB14fG1tBDv0nMUgOX/wg0cKDd
         ouD2eTAxa89TVfhReV1HJOquxoAaugsa7I5qBx1hYgcXL0rua3U6I4TsInUcGmu3Q6Zz
         CW4rkG8Ut9haHHNwtQE9NEFypxX6J8NDZmnk76oW2HF/xNrHzKbE51oEEb4I1HER2OFf
         2oQ0bN4OyduShSJJvuk0xCQh2uI7DfLzizPhmSRWowHptEzWYrX74QsXFIdGj8mMtSQf
         sfCg==
X-Forwarded-Encrypted: i=1; AKwUvBwGtk8mLscnCuvJS6ja6QQe0STwjyCtbtR1lLfoTv526LtRWNl9tV37w/vyTcKfz/X9ivxXEVQd+C1MCWApwPcD@lists.infradead.org
X-Gm-Message-State: AFuF++mp7eRzdZCCFHqE63Nk6FxZSDSQYNV4qlzunrMNWIfX5E2+FMSJ
	l03n7CmTIpO8xTdbfNg9KGHdU9UybWxRPoYOA1OpioGbmnW0tjz32spL
X-Gm-Gg: AYBFou332WmazolIYvwB3D2NCsODflLFLV3FiPHzi9WsWVNE6xVATiYDa5cGpYStIIg
	LiRK3I3Sgh2scxhSlMDsjgr0Z2dFSr2xCAKAvjn18UY1PLnO5wts4yZH1QhCS4n+4YdLXXc99GD
	MC6bICvHiJiuQkdFC4+PXkg1xPiawbjP1BYeK5OHjS6ncjyx8s5n551Ag3hZIiPOfP/zqbDgBUW
	dcdPOSkknWuIYQxCphF50Af9295XLGf+JNSdsbllAEjZoGHfA1yuCvj7TTV6xctBYu0T8V1qG7Y
	I+XV9UZoNXuf5CBkBpbYZM+uYsBxMpFj0HmUciigyLvzOHeW1ulWgUADLM9e750przbfthmvkDC
	AOtmEcp3vPiNQQhlxk+xQF/gyB7Kc31GxmKlBmA6y8UQC6vXmpr9CuqHzzaauyfRYJk75owYXmx
	4Ba/AezL6Yi3e2NSqS3R5lLOhYJXPwsDf9TlijYyKWeQh89Tf80jW7/tGN6nrS+g/vHclxVpZuo
	OFvShkyudkFn28myc5u6TUETQ==
X-Received: by 2002:a05:600c:6216:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49d1754394emr171816965e9.2.1788968455450;
        Wed, 09 Sep 2026 08:40:55 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm43810943f8f.32.2026.09.09.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:40:55 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	consmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board support
Date: Wed,  9 Sep 2026 08:39:43 -0700
Message-ID: <20260909153943.1048-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_084057_604864_65D98520 
X-CRM114-Status: GOOD (  17.73  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add basic support for NXP's MR-NAVQ95 board. This board is designed for
robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
following hardware feats (list is not exhaustive):

* based on i.MX95 19x19 SoC
* 64GB eMMC
* up to 16GB of LPDDR5 memory
* 1 x USB 2.0 TypeC
* 1 x USB 3.0 TypeC
* 1 x RJ45 port with RTL8211 PHY

The support targets revision B of the board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 228 +++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 984642146dd9..b6dd7040c385 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -947,6 +947,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
new file mode 100644
index 000000000000..ab206fb726b5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx95.dtsi"
+
+/ {
+	model = "NXP MR-NAVQ95";
+	compatible = "fsl,imx95-navq", "fsl,imx95";
+
+	aliases {
+		ethernet0 = &enetc_port0;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* actual size filled in by the bootloader */
+		reg = <0x0 0x80000000 0 0x80000000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		bootph-pre-ram;
+		enable-active-high;
+		gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VDD_SD2_3V3";
+	};
+};
+
+&edma1 {
+	/* owned by M7 */
+	status = "reserved";
+};
+
+&edma2 {
+	/* channels 30-63 owned by M7 */
+	dma-channels = <30>;
+};
+
+&enetc_port0 {
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	i2c3_gpio_expander_21: gpio-expander@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_i2c3_gpio_expander_21>;
+		pinctrl-names = "default";
+	};
+};
+
+&lpuart1 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-0 = <&pinctrl_emdio>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	ethphy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <1>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&i2c3_gpio_expander_21 1 GPIO_ACTIVE_LOW>;
+		realtek,clkout-disable;
+	};
+};
+
+&scmi_iomuxc {
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC			0x57e>,
+			   <IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO			0x97e>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e>,
+			   <IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e>,
+			   <IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e>,
+			   <IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e>,
+			   <IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e>,
+			   <IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK		0x58e>,
+			   <IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e>,
+			   <IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK		0x58e>,
+			   <IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e>,
+			   <IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e>,
+			   <IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e>,
+			   <IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e>;
+	};
+
+	pinctrl_i2c3_gpio_expander_21: i2c3gpioexpander21grp {
+		fsl,pins = <IMX95_PAD_ENET2_RD3__GPIO4_IO_BIT27				0x31e>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e>,
+			   <IMX95_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX			0x31e>,
+			   <IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX			0x31e>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK				0x15fe>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD				0x13fe>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x13fe>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x13fe>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x13fe>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x13fe>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x13fe>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x13fe>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x13fe>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x13fe>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x15fe>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x138e>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x138e>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x138e>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x138e>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x138e>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x138e>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x138e>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x138e>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x158e>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0				0x31e>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e>,
+			   <IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e>,
+			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x138e>,
+			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x138e>,
+			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x138e>,
+			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x138e>,
+			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e>;
+	};
+};
+
+&usdhc1 {
+	bootph-pre-ram;
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+
+	status = "okay";
+};
+
+&usdhc2 {
+	bootph-pre-ram;
+	bus-width = <4>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+
+	status = "okay";
+};
-- 
2.53.0


