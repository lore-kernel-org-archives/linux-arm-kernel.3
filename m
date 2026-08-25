Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911EBC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3m/EDZr4T39sfvz1Va34weL4DM8C2AwTVI2AUMgcU1g=; b=DmGZtYO5kkmkFV+aGmS3FT8KWO
	D7IwGycfzMnRA1C9twItVUk+1nuhrr1UQFW1so20Yp+voT0AEHiUT3knkg+g/2PXQim5yuYhw5rT9
	/mA1cHWNBUiD48H/4UE3QuJVqKTepyyJ0Z7kodqHTLSLRCucFU3XVOZqBw0XPCzsW+KkuQp2u76rE
	dVgIKCw8Kr5zRV6e2LjR5rWE59qLofDWW3TkFxODMwYlDbZn9TWWW2vrlPwggVbKa36WR9cBhh4/x
	HgfTTjDAoHhCOvX56O2hslsyt4Aib0mBfkUyxpGnuwfNnjvurvXDAC9yN9GAJRBJuTjClmY/4h2sM
	npTQTqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypzt-00000000jZE-15Ng;
	Tue, 25 Aug 2026 12:11:21 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypzm-00000000jXf-2bFv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:11:18 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so8442652a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 05:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659872; x=1788264672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3m/EDZr4T39sfvz1Va34weL4DM8C2AwTVI2AUMgcU1g=;
        b=mU0p0PP6Jgit/iPx0KAX056aCtq1H479bBJ/JDJ/q6+UL9qCbO+qST7zth1GtqEtl8
         e3oduvGpzAEIyW2g0doOhr8RtE7Q60f+dMubXFHG7iRQjsqxTPsKFFRcC/r7SIEO6/Yf
         IOVBaUh/nB637NrgguvlApldEkI6LyyNqqXOkrsA5sAo1JgqWiB60ovqSsf+ExB+1Pw7
         gs3STmN+aFrVNkXeoEr2HE6xE2mF+Lc6wFcIiUaXRek9gNEtnEbdATrVu/paUDXgFcMe
         zfAJKLZckiZp17CIjGFlvVQaUdR93nfPUqNjcqm8u2lPia9Jh8EVTDrWoZHnn7MLSp8j
         vaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659872; x=1788264672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3m/EDZr4T39sfvz1Va34weL4DM8C2AwTVI2AUMgcU1g=;
        b=MXIhuoAUoP8QRuWkw15UxPO9rkK1PH2JYJpwIC15a83m6dhCeJh5A0gXKKL8eHI7Av
         6hH37rGBKi3AcJoBSmKYFmkgTzuceY/Q1WpZbr21XBJ2FK8XUpuRe6lvK3I3IviRCmdN
         S8BjXhu4CkCn6UX4ulQXhgb4KZUBA69YtluxXqFBFU9u9JsIE0H6mcAEmaWp8LBrEw9m
         sNedV1izM9Zo/sXilSkhAi0T+MwoHK9BlE/PU72/VnpaoMTYVEujsSv8p1SZpl+a7LWl
         Q/3lshfv9cIwmpbXx7S4z292biIwk9Y7E8JoJHss1tAHhbvMtcJHDK19/i4sBvyvC1c0
         /rMw==
X-Forwarded-Encrypted: i=1; AHgh+RpVLU7frSg37+6Xzy2Q/MYzP+BMzkyFEq0anBPGlTYZ78wytkoXqeIk+78SAcHadUaqK0K+bPPZzXLXPdVU9q/x@lists.infradead.org
X-Gm-Message-State: AFuF++nZhNesXixm+caCmYSnyjibi0wSbQadPrjbCkgPaWZwZ0/UleYC
	Ks9dsmSszbv91YrT74Iio9Xo9hfYbDPBwY+ytfNROdZtgFO+BYWhWHSa
X-Gm-Gg: AR+sD11tWRazNPI4bckcTA5TLvAlr43sVqckGzxVYwtambXGmW63Mlam7O2JC8dmvP8
	8TwaoetuNSLLuYCfgmkzfN5Hx4zpc4Mbna+L/YLgT6EvldgSzlUlZzIf8iyT2VyeHUSvkQvxwyn
	Ch5Yq6VW0GFhmMiF0It8ZKok2bEQqeFgE5h6pIDMDQJxFUpxwAcptURVRjD+l5aJ46NOcgnJLMM
	kNuE1f/tq/54FR848WffoJ8miW/ovhEeJelNr6Xyr7RdfgI3BjguWbEjvwlYRh30vOvcT5dFaQ/
	ttmGbebkQOsDj2yokxrlZCGhQdl36bvgV8vOM73ZDevWzp+wqTGLXh+aQdXqnax2F5MpepY71PR
	EXSGZQdoin2gOlzFSNew9SWH2lo8LzPdGrPXTbgIas3+QpkYdbjWsulQCd6HwF+MRWs7lZGFCn9
	K1kecXr07LarbZJk+WuT4/7IyXPa1E5EllvWEGJS8J97k1AfuvoJO2L7ergDPxX0HNb4SdphE0g
	UQFoH3JahDM7bo=
X-Received: by 2002:a05:6402:20cd:b0:6a3:6d83:ba44 with SMTP id 4fb4d7f45d1cf-6a582b05701mr30688214a12.2.1787659872446;
        Tue, 25 Aug 2026 05:11:12 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199767sm13841351a12.15.2026.08.25.05.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:11:11 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board support
Date: Tue, 25 Aug 2026 05:08:12 -0700
Message-ID: <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_051114_712621_96975BDA 
X-CRM114-Status: GOOD (  17.33  )
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
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 267 +++++++++++++++++++
 2 files changed, 268 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..4c5ef83cd857 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -712,6 +712,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
new file mode 100644
index 000000000000..f7ddc39f9b21
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
@@ -0,0 +1,267 @@
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
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VDD_SD2_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <12000>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&lpi2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	i2c3_gpio_expander_21: gpio-expander@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c3_gpio_expander_21>;
+	};
+};
+
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_emdio>;
+	status = "okay";
+
+	ethphy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <1>;
+		reset-gpios = <&i2c3_gpio_expander_21 1 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		realtek,clkout-disable;
+	};
+};
+
+&scmi_iomuxc {
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC		0x57e
+			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
+		>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3         0x57e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2         0x57e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1         0x57e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0         0x57e
+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL   0x57e
+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK      0x58e
+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL   0x57e
+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK      0x58e
+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0         0x57e
+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1         0x57e
+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2         0x57e
+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3         0x57e
+		>;
+	};
+
+	pinctrl_i2c3_gpio_expander_21: i2c3gpioexpander21grp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_RD3__GPIO4_IO_BIT27			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e
+			IMX95_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x31e
+			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x15fe
+			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x13fe
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
-- 
2.53.0


