Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9CECC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyQIUlduan4uj3HkUskv3/VOAOYZ+LxCMRN6JoUgPXQ=; b=lNeMuoSEPkU0DoA9Sa95Fxvw9s
	sm1ZOK2xy9FaajydjsJqhhIbuziwrY3zkWek436LSY+Gyh1gcCxrfHNueXaHz0YA8zUAYN7i1v0t1
	hry9Bw/1/KXQddU/U2VTSJgbWHQzjvSvInn0XAxT7DcSrv2U1pLq2JEAA8u2nzxOkkJKDdD+x3N/P
	TnNyq0vZjL2/2ZqMvMoTd+I62y6/eAUla6E0iXGhwsQ/o0UyvJsGij7FivipArxqOe61Pe7WWAJiD
	CfEGvEPyYEMPLFj3axSP7/1ABBdNhR3Wh53WwoCCdURt6Df78SdWHYFhr5NbUb5gIISY2Tu8rkLc2
	LNWRzJfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ55-0000000CSZc-0O3K;
	Tue, 13 Oct 2026 09:45:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ51-0000000CSW4-0QTV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 09:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fyQIUlduan4uj3HkUskv3/VOAOYZ+LxCMRN6JoUgPXQ=; b=NEy5uRfiLGZoIt58EhEcKe7eep
	Tc1nsIWYo7NgZTHZu0lhAZrBJCpcfjWt89fCa7QcE1wtSOA9+jo4ukOd+xrIgG2zCsGO50zCCltVM
	gWxUbqMx6tz33N2hAwUEHHxA24RN2BOrjbeAWS9fB04q3F7Kmfa+Z+pBALTqt+C1KNP5ZdhAu/vZm
	gMvTAg7dOO/Ye845FyFkZg5U1vL7iyp5VI+GXaF7451lIg1iAkklP2gkEvuNWBUFOjNu1xQXJHQjv
	GT99yg0F8DT97tvc1XpJCfKBzHbjynZ8I9AB5xlubpNYwI/9ug81oCL6b9HptG/e+PBFeWVfyaR/0
	q1ybQMtw==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGZ4w-0000000FMgI-12FS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:45:53 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fyQIUlduan4uj3HkUskv3/VOAOYZ+LxCMRN6JoUgPXQ=;
	b=vKYdBSIqZkoUmDWhGpQ8grXi6ItjLTgwjdgupVOy9BkERBHnF4Ma7kzIztO+uSfCuJslK6
	ao29VaR7AMRYkbwr94yudXi+PKnKZpkCxf5p4o27dPLOrNAhI3Bj5kINOIXuSDq87FOA03
	MIsS5R7gmCDwRE1bpBcZuyf9DTQH8C4NADs3qdNeGeaVWYy2/F42FwYNXTiiY4iQvPUjDj
	vhiuca5/sEJqI0gYNgO1pS3EmLRRl36Ui1niSf1WBeWsu0T2aBnkppYeBCGC5AyCLd+a4t
	VPbM87S51zexDk6jKtIUOg2HCwSqtCsOJYYurnLPQBVc4lj+RwJ5SGb3WikPAA==
Date: Tue, 13 Oct 2026 11:44:53 +0200
Subject: [PATCH 8/8] arm64: dts: imx93-kontron: Fix GPIO labels according
 to OSM spec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-8-94f09ec520ef@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=e6m08tkTvA4gg72Au5Zi0RTkxyfrjwIcFur6slBKafI=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs36NL79lWpRRKqHy7tSQzOUTw91uPIpOcuzG2U2foM
 Yp+TF/bUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMBHnCkaGU09rZrzy/DwhTUA4
 qzWztPRy001tBc3oaCOBOeyJK45MZmT4dtqemYVhVW70S4lpj1au7DrX9+5SQVVSQM2d6xteWmo
 wAwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_104552_141018_D70D31CF 
X-CRM114-Status: GOOD (  10.10  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The OSM specification provides generic names for all pads. Fix the
GPIO labels to use the correct pad names in order to align the
labels with the spec and with other OSM module devicetrees.

Fixes: 2b52fd6035b7 ("arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 29 ++++++++++++++--------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index 850a92dd9b9ba..c104f42a825b9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -51,8 +51,8 @@ &gpio1 {
 	pinctrl-0 = <&pinctrl_gpio1>;
 	gpio-line-names = "", "", "I2C_A_SCL", "I2C_A_SDA",
 			  "UART_CON_RX", "UART_CON_TX", "UART_C_RX", "UART_C_TX",
-			  "CAN_A_TX", "CAN_A_RX", "GPIO_A_0", "SPI_A_CS0",
-			  "SPI_A_SDI", "SPI_A_SCK","SPI_A_SDO";
+			  "CAN_A_TX", "CAN_A_RX", "GPIO_A_0", "SPI_A_CS0#",
+			  "SPI_A_SDI_(IO0)", "SPI_A_SCK", "SPI_A_SDO_(IO1)";
 };
 
 &gpio2 {
@@ -61,7 +61,7 @@ &gpio2 {
 	gpio-line-names = "I2C_B_SDA", "I2C_B_SCL", "GPIO_B_1", "GPIO_A_2",
 			  "UART_B_TX", "UART_B_RX", "UART_B_CTS", "UART_B_RTS",
 			  "UART_A_TX", "UART_A_RX", "UART_A_CTS", "UART_A_RTS",
-			  "SPI_B_CS0", "SPI_B_SDI", "SPI_B_SDO", "SPI_B_SCK",
+			  "SPI_B_CS0#", "SPI_B_SDI", "SPI_B_SDO", "SPI_B_SCK",
 			  "I2S_BITCLK", "I2S_MCLK", "GPIO_A_1", "I2S_A_DATA_OUT",
 			  "I2S_A_DATA_IN", "PWM_2", "GPIO_A_3", "PWM_1",
 			  "PWM_0", "CAN_B_TX", "I2S_LRCLK", "CAN_B_RX", "GPIO_A_4",
@@ -71,7 +71,7 @@ &gpio2 {
 &gpio3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio3>;
-	gpio-line-names = "SDIO_A_CD", "SDIO_A_CLK", "SDIO_A_CMD", "SDIO_A_D0",
+	gpio-line-names = "SDIO_A_CD#", "SDIO_A_CLK", "SDIO_A_CMD", "SDIO_A_D0",
 			  "SDIO_A_D1", "SDIO_A_D2", "SDIO_A_D3", "SDIO_A_PWR_EN",
 			  "", "", "", "",
 			  "", "", "", "",
@@ -83,13 +83,20 @@ &gpio3 {
 &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio4>;
-	gpio-line-names = "ETH_B_MDC", "ETH_B_MDIO", "ETH_B_TXD3", "ETH_B_TXD2",
-			  "ETH_B_TXD1", "ETH_B_TXD0", "ETH_B_TX_EN", "ETH_B_TX_CLK",
-			  "ETH_B_RX_CTL", "ETH_B_RX_CLK", "ETH_B_RXD0", "ETH_B_RXD1",
-			  "ETH_B_RXD2", "ETH_B_RXD3", "ETH_MDC", "ETH_MDIO",
-			  "ETH_A_TXD3", "ETH_A_TXD2", "ETH_A_TXD1", "ETH_A_TXD0",
-			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "ETH_A_RX_CTL", "ETH_A_RX_CLK",
-			  "ETH_A_RXD0", "ETH_A_RXD1", "ETH_A_RXD2", "ETH_A_RXD3",
+	gpio-line-names = "ETH_B_MDC", "ETH_B_MDIO",
+			  "ETH_B_(S)(R)(G)MII_TXD3", "ETH_B_(S)(R)(G)MII_TXD2",
+			  "ETH_B_(S)(R)(G)MII_TXD1", "ETH_B_(S)(R)(G)MII_TXD0",
+			  "ETH_B_(R)(G)MII_TX_EN(_ER)", "ETH_B_(R)(G)MII_TX_CLK",
+			  "ETH_B_(R)(G)MII_RX_DV(_ER)", "ETH_B_(R)(G)MII_RX_CLK",
+			  "ETH_B_(S)(R)(G)MII_RXD0", "ETH_B_(S)(R)(G)MII_RXD1",
+			  "ETH_B_(R)(G)MII_RXD2", "ETH_B_(R)(G)MII_RXD3",
+			  "ETH_MDC", "ETH_MDIO",
+			  "ETH_A_(S)(R)(G)MII_TXD3", "ETH_A_(S)(R)(G)MII_TXD2",
+			  "ETH_A_(S)(R)(G)MII_TXD1", "ETH_A_(S)(R)(G)MII_TXD0",
+			  "ETH_A_(R)(G)MII_TX_EN(_ER)", "ETH_A_(R)(G)MII_TX_CLK",
+			  "ETH_A_(R)(G)MII_RX_DV(_ER)", "ETH_A_(R)(G)MII_RX_CLK",
+			  "ETH_A_(S)(R)(G)MII_RXD0", "ETH_A_(S)(R)(G)MII_RXD1",
+			  "ETH_A_(R)(G)MII_RXD2", "ETH_A_(R)(G)MII_RXD3",
 			  "GPIO_B_0", "GPIO_B_2";
 };
 

-- 
2.55.0


