Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BDBC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQ7tlYQD+juZcuDPbtM9CSBLnEhqYupQN8u5lqSsZ7w=; b=IKSSfEIcPB3dCtqVvlhRlSm4nY
	UpDcrjNQrQHz95lEppyfL5bDHTKsrP6xz6idAwS9o4cRch/TmF+GjJ+V+hyL3yB42SIeebnmRYzPg
	o/FE0r12CuomF8SKmZlr1YCbX3Uadg0bJqAL1/b5BxaIcJ0slHbZBXGB92JmuIJpG/+85hcRcL1Hn
	tHxG/sfYv0ijETokfitR0aSTlZ+i9buxOeXT2ZV9/vDwNi+A1epKVCY7NwGW6vtAsLivXbf89P6rX
	hLIPZfMqp7cnLz5ljMxud2CrmGg+Iztzwpb1OhMZC8rTWo5iTpjgoZ22iUG6g/pWQz70goXx4psyC
	ydWOz82Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x672D-00000003qbg-1NnQ;
	Mon, 14 Sep 2026 13:47:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671U-00000003q2x-34lz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 13:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gQ7tlYQD+juZcuDPbtM9CSBLnEhqYupQN8u5lqSsZ7w=; b=c3ebSQGb6lguMZHYBEoLsa8wjV
	/0YiLjFYQDD7l/E2spyc/GjmqCll6fBaBeN4aZu2Kye2P4kECO9lmvQI4Q2D0iAf+qke8dPwPJ1Kj
	3cCEFQL69RoIEnFIdUV4QovCZP6pBn6ODjTe2Yb1oyLRgYNBdluXjHk8JSUeolt49mPg7Mek/CJIT
	gR7EM9IQyn02bLTPGFRQD/C9IanveF0Z3J+AwLwyiGY9bMEWKdlpTm8zcyTeFDPkbXqdq2EkC+kcd
	KRFaMOebyUG1XjXZUXN9JStKKUZ9vf3N2Y20KbZcMSgnOgca5F84gNRn3xdhU/OTr+c4suo+lhdyQ
	04DibyTA==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x671R-00000005gBy-277k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:47:03 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQ7tlYQD+juZcuDPbtM9CSBLnEhqYupQN8u5lqSsZ7w=;
	b=zJ3WQd4BojjBu4MLb+PcK05XjdaFNC84dAqOfGejoq24Omo9guDmGVIUOhNej7YBincm9z
	sNHsZRFIe7qHJdvbKUD9DCFBRReI/yacvRJlqrG0/y6Uw1z8+dFMQ7T6RMdJRmJxahc4SB
	4G4m9uFiT+d44YGdrPq+8YmYP3gkMI+YVzZCVjeI2ohuPwSTdKHrvAhkheAZbyosJ55YPC
	kYk2ebYP0JkFRyywKKTk2VYa67bUkk7M2qOqqlX90rKlyCa9737m8PXcTU0oZ3/jNHMN4s
	siMEGF57C91Y7RXaz2Hiowto9ArPkYusQiSd4KY7FZlaP7WMA0yaZxFiIW1Sdg==
Date: Mon, 14 Sep 2026 15:46:15 +0200
Subject: [PATCH v2 7/9] arm64: dts: imx8mm-kontron: Add GPIO labels and
 comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-7-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6947;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=tLR/ApaxeJaUnZcSY/lBN9zmpG+rQxYFy6C/HB1ebwY=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1NbP7WoGizrE+XfOsntsOApd+sPG+YuZNngmPnZ+
 fKtL5l7O0pZGMS4GGTFFFmk+C1e25rF+sgfq46CmcPKBDKEgYtTACbCvIaRYd55VZaflt9nXBT+
 bT1DjuvV0YhnnypuuS76veq/xfuNL84xMnyU3Fn8Nk5GaItZZbh51Xm+TdILD/ncn7K/+/NT59f
 Fz9kB
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_144701_805942_99FB9FA2 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Describe the GPIOs and their purpose using labels and comments.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 81 +++++++++++++++-------
 1 file changed, 55 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index 1f3d0577f10c..72588af057d2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -97,6 +97,7 @@ reg_vdd_5v: regulator-5v {
 	};
 };
 
+/* CAN */
 &ecspi2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi2>;
@@ -124,6 +125,7 @@ &ecspi3 {
 	status = "okay";
 };
 
+/* ETH0 */
 &fec1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet>;
@@ -163,9 +165,24 @@ led@1 {
 	};
 };
 
+/* DIO */
+&gpio1 {
+	gpio-line-names = "", "", "", "DOUT1",
+			  "", "", "DIN1", "DOUT2",
+			  "DIN2", "DOUT3", "DIN3", "DOUT4";
+};
+
 &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio4>;
+	gpio-line-names = "", "CAN_ADR0", "", "",
+			  "CAN_ADR1", "CAN_ADR2", "CAN_ADR3", "LED6",
+			  "LED4", "LED5", "", "",
+			  "", "", "DSI_MUX_SEL", "DSI_MUX_OE",
+			  "HDMI_IRQ", "LED1", "LED3", "LED2",
+			  "", "", "", "",
+			  "", "ETH_IRQ", "LVDS_EN", "PHY_RST",
+			  "CAN_IRQ", "UART2_RTS";
 
 	dsi_mux_sel_hdmi: dsi-mux-sel-hdmi-hog {
 		gpio-hog;
@@ -190,6 +207,10 @@ dsi-mux-oe-hog {
 	};
 };
 
+&gpio5 {
+	gpio-line-names = "", "", "DIN4";
+};
+
 &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -274,6 +295,7 @@ &pwm2 {
 	status = "okay";
 };
 
+/* RS232 */
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
@@ -281,6 +303,7 @@ &uart1 {
 	status = "okay";
 };
 
+/* RS485 */
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
@@ -324,6 +347,7 @@ usbnet: ethernet@1 {
 	};
 };
 
+/* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc2>;
@@ -341,13 +365,13 @@ &iomuxc {
 
 	pinctrl_adv7535: adv7535grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI1_TXD4_GPIO4_IO16		0x19
+			MX8MM_IOMUXC_SAI1_TXD4_GPIO4_IO16		0x19 /* HDMI_IRQ */
 		>;
 	};
 
 	pinctrl_can: cangrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19
+			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19 /* CAN_IRQ */
 		>;
 	};
 
@@ -356,7 +380,7 @@ pinctrl_ecspi2: ecspi2grp {
 			MX8MM_IOMUXC_ECSPI2_MISO_ECSPI2_MISO		0x82
 			MX8MM_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI		0x82
 			MX8MM_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK		0x82
-			MX8MM_IOMUXC_ECSPI2_SS0_GPIO5_IO13		0x19
+			MX8MM_IOMUXC_ECSPI2_SS0_GPIO5_IO13		0x19 /* ECSPI2_CS1 */
 		>;
 	};
 
@@ -365,7 +389,7 @@ pinctrl_ecspi3: ecspi3grp {
 			MX8MM_IOMUXC_UART2_RXD_ECSPI3_MISO		0x82
 			MX8MM_IOMUXC_UART1_TXD_ECSPI3_MOSI		0x82
 			MX8MM_IOMUXC_UART1_RXD_ECSPI3_SCLK		0x82
-			MX8MM_IOMUXC_UART2_TXD_GPIO5_IO25		0x19
+			MX8MM_IOMUXC_UART2_TXD_GPIO5_IO25		0x19 /* ECSPI3_CS1 */
 		>;
 	};
 
@@ -385,40 +409,45 @@ MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
 			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
 			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
-			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27		0x19 /* PHY RST */
-			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25		0x19 /* ETH IRQ */
+			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27		0x19 /* PHY_RST */
+			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25		0x19 /* ETH_IRQ */
 		>;
 	};
 
 	pinctrl_gpio_led: gpioledgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16		0x19
-			MX8MM_IOMUXC_SAI1_RXD5_GPIO4_IO7		0x19
-			MX8MM_IOMUXC_SAI1_RXD6_GPIO4_IO8		0x19
-			MX8MM_IOMUXC_SAI1_RXD7_GPIO4_IO9		0x19
-			MX8MM_IOMUXC_SAI1_TXD5_GPIO4_IO17		0x19
-			MX8MM_IOMUXC_SAI1_TXD6_GPIO4_IO18		0x19
-			MX8MM_IOMUXC_SAI1_TXD7_GPIO4_IO19		0x19
+			MX8MM_IOMUXC_SAI1_RXD5_GPIO4_IO7		0x19 /* LED6 */
+			MX8MM_IOMUXC_SAI1_RXD6_GPIO4_IO8		0x19 /* LED4 */
+			MX8MM_IOMUXC_SAI1_RXD7_GPIO4_IO9		0x19 /* LED5 */
+			MX8MM_IOMUXC_SAI1_TXD5_GPIO4_IO17		0x19 /* LED1 */
+			MX8MM_IOMUXC_SAI1_TXD6_GPIO4_IO18		0x19 /* LED3 */
+			MX8MM_IOMUXC_SAI1_TXD7_GPIO4_IO19		0x19 /* LED2 */
 		>;
 	};
 
 	pinctrl_gpio: gpiogrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x19
-			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7		0x19
-			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
-			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11		0x19
-			MX8MM_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19
-			MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8		0x19
-			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x19
-			MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2		0x19
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x19 /* DOUT1 */
+			MX8MM_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19 /* DIN1 */
+			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7		0x19 /* DOUT2 */
+			MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8		0x19 /* DIN2 */
+			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19 /* DOUT3 */
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x19 /* DIN3 */
+			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11		0x19 /* DOUT4 */
+			MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2		0x19 /* DIN4 */
 		>;
 	};
 
 	pinctrl_gpio4: gpio4grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI1_TXD2_GPIO4_IO14		0x19
-			MX8MM_IOMUXC_SAI1_TXD3_GPIO4_IO15		0x19
+			/* CAN address DIP switches 1-4 */
+			MX8MM_IOMUXC_SAI1_RXC_GPIO4_IO1			0x19 /* CAN_ADR0 */
+			MX8MM_IOMUXC_SAI1_RXD2_GPIO4_IO4		0x19 /* CAN_ADR1 */
+			MX8MM_IOMUXC_SAI1_RXD3_GPIO4_IO5		0x19 /* CAN_ADR2 */
+			MX8MM_IOMUXC_SAI1_RXD4_GPIO4_IO6		0x19 /* CAN_ADR3 */
+			MX8MM_IOMUXC_SAI1_TXD2_GPIO4_IO14		0x19 /* DSI_MUX_SEL */
+			MX8MM_IOMUXC_SAI1_TXD3_GPIO4_IO15		0x19 /* DSI_MUX_OE */
 		>;
 	};
 
@@ -444,7 +473,7 @@ MX8MM_IOMUXC_SPDIF_RX_PWM2_OUT			0x19
 
 	pinctrl_sn65dsi84: sn65dsi84grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26		0x19
+			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26		0x19 /* LVDS_EN */
 			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20			0x19
 		>;
 	};
@@ -463,13 +492,13 @@ pinctrl_uart2: uart2grp {
 			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x0
 			MX8MM_IOMUXC_SAI3_TXC_UART2_DCE_TX		0x0
 			MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B		0x0
-			MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29		0x19
+			MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29		0x19 /* UART2_RTS */
 		>;
 	};
 
 	pinctrl_usb_eth2: usbeth2grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_NAND_CE1_B_GPIO3_IO2		0x19
+			MX8MM_IOMUXC_NAND_CE1_B_GPIO3_IO2		0x19 /* ETH_RST */
 		>;
 	};
 
@@ -481,7 +510,7 @@ MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d0
 			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
-			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x19
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x19 /* SD2_CD */
 			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xd0
 		>;
 	};

-- 
2.55.0


