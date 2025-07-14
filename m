Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD68C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YK+cWxERFjFzSa3SgGwxVoZ40egYs5AM8gPNgTHGtJs=; b=tmlV+2glC9Kebh92uTbY6EkvCH
	pPUhqbkfG7LLhrsROEXvosvhyFD8tDB5ZInhUrnYGp9+hWPgsnrI1sb2hQ9Zq2TKFXus0CFTFGeTo
	qDIXlsOIYNmLBgfn4a6b43EuRo93iDnZ9uTPs9cjlfjf7gwsaADyI3OnLE3kS4/I0tINwpzmzAJah
	eVqsnZ+VayWG37/AlFUVBfRuknW6RyFvKgzGjmG1wE3HTkSIcea5LO8VOO4slvxQTr/P8q+hmmvMH
	S3uUpK8zvhI5Lyges/HDXK6K/sUAE3C7GdfrooBtT87oaG6LZhUkqblgL3AJqbcIWbcmYD+wvSMdP
	8aqYWs2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnF-00000002ZYL-48cP;
	Mon, 14 Jul 2025 15:08:37 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK2d-00000002SLQ-1AFs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:20:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90AD4C753D;
	Mon, 14 Jul 2025 16:20:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502825; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YK+cWxERFjFzSa3SgGwxVoZ40egYs5AM8gPNgTHGtJs=;
	b=lkz/1vYZ/VmhzOQHSWmFPiQNtK58Mms6CN6jXcuyDi9bKhyDhmMdF7AYGlq2OoZNaI0rya
	AWDpnRRUwMGO7L3UM6GIiSEQzTr+XMZ+x8TdQsOSBeuPScnogS5aEmpgUoj7t0tMS6ZEwS
	EpDSCQNmEZJocCiU0VVLajbIkxg9OeDrpl6DHBIW/cQ7KXCM86PAb4K4cfU/mrb/GRGlwH
	3r4qr1snzc9VSnq6OJ4Yf7E2X0GTd7A9AWfStf6rRC6ynUPRKRwgQtR6LgciDv3PB+5px+
	Qj9yimYn5IwZobMnAGE1Hqq2JCd+Dd3BZvss/dHKVNFTV4EZzwIawy2XG/h21A==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 07/12] arm64: dts: imx8mp-kontron: Fix CAN_ADDR0 and CAN_ADDR1 GPIOs
Date: Mon, 14 Jul 2025 16:17:33 +0200
Message-ID: <20250714141852.116455-8-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_072027_457750_0E4C00E6 
X-CRM114-Status: UNSURE (   9.51  )
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

From: Annette Kobou <annette.kobou@kontron.de>

Some signal assignments were modified between hardware revisions
1 and 2:

Revision 1:

  - SPI_A_WP   -> CAN_ADDR0
  - SPI_A_HOLD -> CAN_ADDR1

Revision 2 and later:

  - SPI_A_SDI -> CAN_ADDR0
  - SPI_A_SDO -> CAN_ADDR1

Fix the labels and add the missing pinctrls.

Signed-off-by: Annette Kobou <annette.kobou@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../dts/freescale/imx8mp-kontron-bl-osm-s.dts | 31 ++++++++++++++++---
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 0eb9e726a9b81..4aa5c261b865d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -123,14 +123,12 @@ &gpio2 {
 
 /*
  * Rename SoM signals according to board usage:
- *   SPI_A_WP      -> CAN_ADDR0
- *   SPI_A_HOLD    -> CAN_ADDR1
  *   GPIO_B_0      -> DIO1_OUT
  *   GPIO_B_1      -> DIO2_OUT
  */
 &gpio3 {
 	gpio-line-names = "PCIE_WAKE", "PCIE_CLKREQ", "PCIE_A_PERST", "SDIO_B_D5",
-			  "SDIO_B_D6", "SDIO_B_D7", "CAN_ADDR0", "CAN_ADDR1",
+			  "SDIO_B_D6", "SDIO_B_D7", "SPI_A_WP", "SPI_A_HOLD",
 			  "UART_B_RTS", "UART_B_CTS", "SDIO_B_D0", "SDIO_B_D1",
 			  "SDIO_B_D2", "SDIO_B_D3", "SDIO_B_WP", "SDIO_B_D4",
 			  "PCIE_SM_ALERT", "SDIO_B_CLK", "SDIO_B_CMD", "DIO1_OUT",
@@ -159,6 +157,24 @@ &gpio4 {
 			  "GPIO_A_7", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_LRCLK";
 };
 
+/*
+ * Rename SoM signals according to board usage:
+ *   SPI_A_SDI	-> CAN_ADDR0
+ *   SPI_A_SDO	-> CAN_ADDR1
+ */
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio5>;
+	gpio-line-names = "I2S_BITCLK", "I2S_A_DATA_OUT", "I2S_MCLK", "PWM_2",
+			  "PWM_1", "PWM_0", "SPI_A_SCK", "CAN_ADDR1",
+			  "CAN_ADDR0", "SPI_A_CS0", "SPI_B_SCK", "SPI_B_SDO",
+			  "SPI_B_SDI", "SPI_B_CS0", "I2C_A_SCL", "I2C_A_SDA",
+			  "I2C_B_SCL", "I2C_B_SDA", "PCIE_SMCLK", "PCIE_SMDAT",
+			  "I2C_CAM_SCL", "I2C_CAM_SDA", "UART_A_RX", "UART_A_TX",
+			  "UART_C_RX", "UART_C_TX", "UART_CON_RX", "UART_CON_TX",
+			  "UART_B_RX", "UART_B_TX";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
@@ -297,9 +313,16 @@ MX8MP_IOMUXC_SD2_WP__GPIO2_IO20			0x46
 		>;
 	};
 
+	pinctrl_gpio5: gpio5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_MOSI__GPIO5_IO07		0x46 /* CAN_ADR0 */
+			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x46 /* CAN_ADR1 */
+		>;
+	};
+
 	pinctrl_usb_hub: usbhubgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14		0x46
 		>;
 	};
-};
+};
\ No newline at end of file
-- 
2.50.1


