Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E305CC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYfKpm6t2d+y0gofCUNcKVDrQT5uFhjArzVmA/STbho=; b=DmtceeY0R0bRoA0F2YyxcCBmrx
	asuppX/pjb0d7zRB/c/OavstnMdD2pQRamQBvHxux6poYVZbXqIF8a8BhLKfxorsCawGTd4bMTvkZ
	5RnprYLWHM2mawXKURvF53rqubUs95YwsjX7x9sBFp5kR7O2UdELgjfnkOU9RM4JvgCVSoh7ohwYq
	9wpAZOppbfaBOvSO2O6PM73mLvV6PrxqUYWcxGJB3uqzEkaD1/B9ydRIyTegqlXRqrm1HHOW34OZK
	V13QPQqvsDkrdQuNRvDk5KIEbLFcbD5virTuDLp4lzNfpREOPi/fb/c5+M+Fp87kybDqPPlEpBN9L
	MXHNbtcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbiY-00000004DcZ-2A3K;
	Thu, 27 Aug 2026 15:08:38 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbiU-00000004Day-1ooB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:08:37 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so10485261fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843312; x=1788448112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYfKpm6t2d+y0gofCUNcKVDrQT5uFhjArzVmA/STbho=;
        b=TsmEbm9aDcMKC5NxkIpjxZZDvrsdB6Ely3/ghuOoruahiUFAviY826kowJ0TN6OskH
         L08Nqdq20cr/Esl7COe69t2JvaDGiMWl0+oiY4oikM+iiFMFOvHxg97kT/s8rRT1PX96
         WUvrw6A1ssxcZ1zzkOkwcmbRFK3JAd3kbEmrDgm74L/JQNnptaPC+s+H+PZk97TDas5L
         60T1ZvYdh+foMgTRnk9C4tvRbkNI/jd5UdcgIdTAUhnnPiu0p1xbUTRipM6YBFaraXhA
         6kTVjz0OVd2559gNOhFv5nEXvchRQCdNCta8yzsVt2YV81a5IvknK8BqCTZvlIbSpwH3
         kmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843312; x=1788448112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYfKpm6t2d+y0gofCUNcKVDrQT5uFhjArzVmA/STbho=;
        b=qbv7HSD7qTgMRgVqtCgIoX0nWhJE/qb4XQHk0sAq4QAmq2UDx4FcQbY4wF37AOV3VM
         OF1cgknBjYmaWkGtLtbRExZfI2Ujf976vdVPbcy9kw+Nj0bQomUp8g1lk0McGOe0r0Ez
         v9HbVfbrI8eRFm5hH0Vf9fqZRol/+vgSbsP7t2ft3/OANLNOZlb+rlAgBDtxpdfSAOLS
         adtohy6LQhYLGm4yGm2Xp7mLuiZ0dXlADifhrydGRXqOeroipHqvIJF4KdVsm+Ea/ELD
         9nNuhwdL6UVuAumKYu2q7eENK8rXn2Oigi7H2CggW6rCaeHVgnFCoYFo2eUho1cDiC3g
         yEVw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6TJiUwqZqvmmpM7yBl8vl0RbCyGIA3DyUCopAqLO0UxuAwp7vVnuMYns4KMh07cSLSfGXuIgMoG5X+uk9V36F@lists.infradead.org
X-Gm-Message-State: AFuF++mVFDAR0ABJ5atD9Ig3IQFTTFDMKHhQ8lhpxMx9ak5SntOCdvaj
	masJZWC78Zf+UIdIU+OVpHB/8YjLn285VBvv8QBywdXDxoKQkraTx4RT
X-Gm-Gg: AR+sD13iPArFZ0/W9RmgiJs6sPuU/0/pqw6WG60kIlkbIiuMAp41yZtwgHheNn3TPPo
	dt+0dgbvdrL5Kj2lY4F51GMa34dLFauJ2bMHFbzSX+Eqbj0A5aamdXtf45t2usPslWVTXHPQ+oM
	GGirHk7BjERJyQDfv6Ccbo5x8qtinBIxOMmjHLao1bJrS1wpL+dLS5jCELzK4Na3/ptYAWfHR80
	xOfPjYHsC60mrlFeIxxDIHxZWvvtyzV/8DFyRHAGM1GXhlyeW1v5L9PwDKiDELTgzg1UHH818v0
	BvvKPXMXarCxexVCnnRenKvSzOKVV/YxQO9m6PGqg8uu1jZ42G/ZtHQyY+1DmFr66y5D0xc5UZD
	0nQR4BwTTDHB/ulhzsg7//QvHmmHblTmtvujwwsaUpV31DKYgMFWRxc+dcD1gH0G2Oua0E3pQOJ
	30CVKrZmCLW3ZxQPCfjaIT4BJQPeJSU6Lyf2chQoTnBsSWGfOJHlef8xG3T4LPcST9NyPucKfUA
	ul2h8fKtAVI3Lw=
X-Received: by 2002:a05:651c:a38e:10b0:396:9897:4cc5 with SMTP id 38308e7fff4ca-3a1fd49833dmr30925551fa.5.1787843311736;
        Thu, 27 Aug 2026 08:08:31 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([165.85.187.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm10247151f8f.8.2026.08.27.08.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:08:31 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board support
Date: Thu, 27 Aug 2026 08:06:57 -0700
Message-ID: <20260827150657.1657-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
References: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_080834_530410_BC74D03C 
X-CRM114-Status: GOOD (  17.07  )
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
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 237 +++++++++++++++++++
 2 files changed, 238 insertions(+)
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
index 000000000000..7458e77dc2ae
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
@@ -0,0 +1,237 @@
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
+		bootph-pre-ram;
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
+	bootph-pre-ram;
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
+		bootph-pre-ram;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x31e
+			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
+		>;
+		bootph-pre-ram;
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
+		bootph-pre-ram;
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
+		bootph-pre-ram;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x31e
+		>;
+		bootph-pre-ram;
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
+		bootph-pre-ram;
+	};
+
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	bootph-pre-ram;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	bootph-pre-ram;
+	status = "okay";
+};
-- 
2.53.0


