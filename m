Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394D7C79FB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+qgtzY6MaCxcO3ICUhFFV0vpVhq609X5qyt6lhvn+I=; b=fNA7pGI+OYtiE+peWdeJZex3tH
	G6mirk+fQ1/GGbTvPFUP1Lad/1kVJWRemzw3nIlDHv+mcCn2JiPrMT+e5mQPAzu92RPAleDYxgVca
	CyYxLmwczgCx1R3dDhHMNIevzUJNbNxdtNVfm9ky3Z6rvBj81LkIb7HQpcsPDIP/ALF7Byd28CaC9
	Z/nQGX6hm0lKTsX9x6+cI9NOko8Iyrfu6YXqd8qv3OzzXSjg4PSMdSaDKgeXVT15SBoDG2Ir5/wzQ
	MYcMS3RzaSaONYpnn1huPIqDVhu9coROHdNvvB7SrC7czg3ABrSaCEIK3cGfJeMEp5ufbJxZjCwRJ
	Nt5MazqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGH-00000009Bd9-2hMQ;
	Tue, 08 Sep 2026 13:53:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGC-00000009Bay-0uBV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=c+qgtzY6MaCxcO3ICUhFFV0vpVhq609X5qyt6lhvn+I=; b=hByVuYFnlIsJz/jVL6eZkUo0kS
	a9/OaY/e7ftTtQOquBtWZfqBwJqMU8MZ/mx9NQN47ReQuMktxpsbBFwZoUP4+mnGFYipvV6PaAKqV
	NJcn3fcDSlljX7rh+o3vt7bH1hnq1LnAyMJxW/AQ29TlydzS3V/CxjlW3fnMw5b/JYNvayeSo8bgM
	kugIgIRi9KDkUQ/vL4P7Es70+uZn14Gujyj6IwyVon0LKWvx1ngOXQE7uEiZ8VPdtuSyT7um1dO/2
	OKEkbvE8FFqyIHc/MDOE4CdPhq1u47Hk8/PFLj0TPKRCC4taZTvEXCzu6yqF9wwe1iot0alxhy6AC
	Kgz6lK6Q==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wG7-0000000HUeL-41n9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:15 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+qgtzY6MaCxcO3ICUhFFV0vpVhq609X5qyt6lhvn+I=;
	b=DROXpOLFySrkh7eL4lQh9iit7MxFoKhb71uLelpFGxy7/I5ZKe47l68H7agFYXxlQp7qMt
	CLLgUY6xExEO3wHxvHEaRtK48ogDIc4ot86M+TYQQrQLVC74tl8A31qBseDe1dwo5ppN06
	equkc5mzTbNaYFrG24QkcZCJklzuPqv6dxa/PDH7kQBaZBKN2CbJ+Xa1xzoDlWEyhMsJ2E
	1y8tbUZBkxk66NiqEJo3LBypvkArloNd6VYcxdU7j00us8w5u3SBkbL6LFejXbuxJkxNfU
	DDcxDrV2iD40jzmCF3T6K4aPAuzvLaX8J07Ju4qo2jWjfUxYNnvZontVl49JBA==
Date: Tue, 08 Sep 2026 15:51:51 +0200
Subject: [PATCH 4/9] arm64: dts: imx93-kontron: Adjust GPIO4_IO29 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-4-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=MMVzO63V/8fkJV9PzRy2jq7KDqxZ4OTRvgqObIY0heI=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsNNpM/ur9mvOcDckfzognLTk/MmLYrvdPudVfz6in
 8p6JuBoRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwER2/mVk+FsRZcesUFU/aXXO
 4VK+Kd/YG1lrgr9N4p5mU6D5uZhZiJFhr3OnrHrBqXQptvkeGXdjCx43WDZ5BYm1CRx/rfqhoJY
 NAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145312_223822_5AAB5ACF 
X-CRM114-Status: GOOD (  10.01  )
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

Early prototypes had GPIO4_IO29 control the CARRIER_PWR_EN signal.
This is now controlled by hardware and the GPIO4_IO29 is routed to
the GPIO_B_2 OSM pad.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 32 ++--------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index f881912cde46..36548d918169 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -34,29 +34,6 @@ reg_usdhc2_vcc: regulator-usdhc2-vcc {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "VCC_SDIO_A";
 	};
-
-	reg_vdd_carrier: regulator-vdd-carrier {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_vdd_carrier>;
-		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-name = "VDD_CARRIER";
-
-		regulator-state-standby {
-			regulator-on-in-suspend;
-		};
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-
-		regulator-state-disk {
-			regulator-off-in-suspend;
-		};
-	};
 };
 
 &flexcan1 { /* OSM-S CAN_A */
@@ -113,7 +90,7 @@ &gpio4 {
 			  "ETH_A_TXD3", "ETH_A_TXD2", "ETH_A_TXD1", "ETH_A_TXD0",
 			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "ETH_A_RX_CTL", "ETH_A_RX_CLK",
 			  "ETH_A_RXD0", "ETH_A_RXD1", "ETH_A_RXD2", "ETH_A_RXD3",
-			  "GPIO_B_0", "CARRIER_PWR_EN";
+			  "GPIO_B_0", "GPIO_B_2";
 };
 
 &lpi2c1 {
@@ -385,6 +362,7 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e /* GPIO_A_7 */
 	pinctrl_gpio4: gpio4grp {
 		fsl,pins = <
 			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x31e /* GPIO_B_0 */
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x31e /* GPIO_B_2 */
 		>;
 	};
 
@@ -465,12 +443,6 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07		0x31e /* SDIO_A_PWR_EN */
 		>;
 	};
 
-	pinctrl_reg_vdd_carrier: regvddcarriergrp {
-		fsl,pins = <
-			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x31e /* CARRIER_PWR_EN */
-		>;
-	};
-
 	pinctrl_rtc: rtcgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_VSELECT__GPIO3_IO19		0x31e

-- 
2.55.0


