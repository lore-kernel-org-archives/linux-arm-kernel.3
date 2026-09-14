Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B44C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHdGMoxzi2wHxj/rRPHa6zr3JYkbxRfl/EgABIz7bgc=; b=LTs8MikgHzb5KqdK6Eho4uNSbB
	FoaCX/KMfPRTr7SN2a5UN81ZBQ1j7yrNyS4sWzK4XKXbvF/wXyrDKwB4J0hhSQsLKId6o/kiacxWp
	BdxYx6RtI6w9+FMMiHbD1BjXyfaQJr+syuF5reVpJg2ThKwRorQgy/Wg1EHHo63gA4qq205SOv84X
	p6CcFCtzcJL7QL8W7exCe8sGZocN9NpY99xOWq/7BuQxu/W6p8L42/Y/w3/EhjCodBEEsgMOH7mE6
	usY3mP1GWGfv0LEOyc2zjwysJaWgKCVrHA1Gocj3rigwMnhXln4MplnhTocIgwj6y7D9TYGm6dnsZ
	09U0m3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64yM-00000003H28-2mlj;
	Mon, 14 Sep 2026 11:35:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64yD-00000003Gus-2Us6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 11:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LHdGMoxzi2wHxj/rRPHa6zr3JYkbxRfl/EgABIz7bgc=; b=X4VAtTJ3YvLaDzcKvU+/NdRq9l
	xYLMXQrvZqAXA+G73276WOeOX+OldnzNGhb8tsOF2xiqZJJLgUPAYjWJ92aQdvBm4hcNpkSgAS4w2
	+Vfq0iN5NGvIHRhYvf8rWlt0byLEsEaHgI516By8st0h4mFVWm7sU2YFTWJ/cakffdtp1bykb8jgk
	PxI/a5yVyUd3AAlretUdsYn4m35lLfM3ocaK70h4ivJgAkRTmEjoZE2abEEYLE+Uqkn4vmQJuGmqU
	cWeoF6mQVkrIQDaeODSqWXdOMmvszoABNiTXs6BPz4+nBINZEVDibx3HMvSlwWHGG/xny6Zj3Ydrl
	7f1i1hGw==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x64xu-00000005XgK-0sb9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:35:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49e6e69d528so19134665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385712; x=1789990512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHdGMoxzi2wHxj/rRPHa6zr3JYkbxRfl/EgABIz7bgc=;
        b=lk4zKP3AEHbh76GQQZRaa9wFIK5wfmFXH4uGpkNoZhpndDBNitkTbVUlUXDRBwtuFd
         Uc9J8kcmjUJEqP7yVLNdG96keUpf+EqhJZ/p8g7IAUK3J/LCIK6TVuDoInQIfwiSs2Df
         x2rV0ZuMW6U62BEMds3CB0B0GmPfdZeQzN3OIYKOjdS2JDtJ/yhwvhehAJG4/dPtSzG/
         XB9K43DEek0JxJqw7sYpRmBsCDjrJ6J8wcSAuglxJ62ySpKUCBxAcfbWF0btKRBQyKs0
         kQXpUIAXbSD2JK1+SYNmNQbLjppGG73rVB1lLY+Yr0BTDxd4HqCRJ7kThM10sFXHA9aT
         lqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385712; x=1789990512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHdGMoxzi2wHxj/rRPHa6zr3JYkbxRfl/EgABIz7bgc=;
        b=hatwqXblREK/mctQbdmwlb+6BcZcb3zTtul70YBxuGNnOfybdLa5AZUZk9VbArjmPg
         ILqs5wzLZS7ze4XG3MfpCqtTFR4cwCJPX0fw1jJV6UPDQjkygYtJLzaFSqDP/kZVBW4z
         +vtYvDav3i1Q/Hj0RZTqC68pYgDoOT0dzF4QqRLigd3wnrrl96Kd42Ai2O2nCIJLRrd8
         wyGG3d71iYZnK/93nOb58Gf8ZTuslYUCCPyFVtsMHjWCm8fl8vaq/R82buaV4o00yYfg
         cEwEuh49G+qQyHg5y+1xegcJeGALgWJ6EH0TecJVlAMOMQRhyga57GlAVyh5Tibhg5CL
         xCWA==
X-Forwarded-Encrypted: i=1; AKwUvBytQx62kj2GGL9+9uWL+DlWelbw89573gaJ0Q/fRNdMwMhHydVW3LQVkscV6NLOW4IxgcceySuNmVGnRRgEYq/z@lists.infradead.org
X-Gm-Message-State: AFuF++mMn3IMyHF1pD7oSnKjz6hNszWI5nwa8du19GgYE4SSnTYM6Dsh
	v5XyBv4DzvvtyXyfinu5KQKh70g/SfzyjDdzKLtgDDbUOO3Q9gVPIq6B
X-Gm-Gg: AYBFou2ysjMpFN3OP6O1XMP+Y1Lk3tqYLJOIGD5fax18TVG/nL61FyzSowxTc5o1wGC
	NohdnxbxLHG2gPJmao3ghzM9XBrR7ZnVxgt4EKVJywo8W0W5Wzd8g6S+h75MRAxmzsNdz0DoXF5
	XDD74aFTB+B1vTGvJOd0qXSo/5MBWLsS4YzrXwMj/7xTTC9stIw/d5ef4oK02aiW4e+HvDZsmYA
	rXYNsJaSvXRvTl9zVYYkR2vVE96+IGmQpG35ieesDhmQZs7mutqxGdFXc7mX/h4cBaDG6rRHNgj
	l4D5aWi3sAEI5Li/6JPtbFglmSSwTnHivbjrhRdrezH/t6bWcm6Si5nfqm1GL/FGfsjY8zcbONH
	pYs46qP+dR9ktW69ctidVCDN94xG+B7yxpiamdtE5BR1FBBXj/ilS5PXiEglI0HmKutaYiqi100
	qIc6zyMsjRzyKGvVhMTkqNBjnFP8be97hL7FmKxtvBrGsiupc4SxKUSEckTPXDIx0nqwUpjVrvz
	DSwWkxw2JzgdvqvLyOI5xvE1w==
X-Received: by 2002:a05:600d:8644:20b0:49e:7cfc:a9b7 with SMTP id 5b1f17b1804b1-49e7cfca9eamr68145e9.18.1789385711541;
        Mon, 14 Sep 2026 04:35:11 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm27906531f8f.37.2026.09.14.04.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:35:11 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board support
Date: Mon, 14 Sep 2026 04:30:10 -0700
Message-ID: <20260914113010.988-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
References: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_123514_463961_376155A5 
X-CRM114-Status: GOOD (  17.43  )
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
* 16GB of LPDDR5 memory
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
index 000000000000..7860c113e9e0
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
+		stdout-path = "serial0:115200n8";
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


