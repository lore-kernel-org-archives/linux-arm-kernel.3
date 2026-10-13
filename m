Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B00CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvOEPFtPzQzKLUYMK93ocRj37FpDFeyR1MEc3ztTr0s=; b=xrJOOLIvlG7crNOHdCFosms9+F
	8ruw8KOUiV/Q1clOQLW9NgBk6q3IydExxxWR59cGN19mEEYkPO0y1PFdS+JvqtS9L/lbgXNRg6plZ
	gkDms4NgtgeihD2oqki7alRr5x9KJ6ScQCs/oibX6HcNQIrSy4R65fG7rYG/QktqxOR2tpfsDS/gZ
	EO8QX6YXs0KsKdoTZyD/J8GsGL37IGVJGnI9yRmEcuFdlP3KHbW+AzRyXQY8VkxXcOgg2QaTsq9J8
	4ILzFBLsR6B4HzECRvwANxjBMtk3FJq32Wmbg5JKiU0c2Ig3X+IhM1m9Zmpx9kPfKeEypG7ADBiGz
	FkKTBm0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb36-0000000CkeS-2PWR;
	Tue, 13 Oct 2026 11:52:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb34-0000000CkbP-3yRO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 11:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KvOEPFtPzQzKLUYMK93ocRj37FpDFeyR1MEc3ztTr0s=; b=J9BmGA5o4ho7KwfLQ4WlxSGyyY
	XWLkYg7cZhOsRNSHvkKojdMGTgnRfQutQO1ByLuz1kDqVwpNdaYHLsqUwGOK3ZgTFk4zAzBFXcolL
	T5plfct3q3D01CniC9gdU6BBgo/VP3in/d8T1LEelzgwST/KG5OKEqxh5UR0zDIXePaAlpaE6Y0HV
	a5vkFUS1slAbtgoS78/HobPDsZ74BvoZKJY6ZHCetxo5JzQh11NXA41NtLkRUJV1H0APbV9GfnOrQ
	7UeGPWv+Zb5h/FK6sVvQvBipR5P700P+LH8Ud1LplnKdPq5wWEC8aOkYzbyQyr7nlJiPqGZ+TPXSm
	Ep9mYy9A==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGb31-0000000FV2d-4Axl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 11:52:01 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvOEPFtPzQzKLUYMK93ocRj37FpDFeyR1MEc3ztTr0s=;
	b=0hLHGN4Euaz+k8H8mT+zSljroDdM6C/aycHOEYzzrhczz4jEtpUxTrt3qjYD9T/JoJOCQf
	e6bhmNl+YV0ZdyB/K1gyERjptuN1FnQqF+Qhs7VSy5ibcrb27ldRKSTKenqczxk1mVQQ5B
	Yk+7Y0yz6Mw1ZhWBIUn1DdgPq+DwvFp3QC4RFt/cUbI3KstX+AcVa/qrq5z0w8SQJwDKPZ
	osxWUaUKDxW8292FYshsLIQ10c4tOp7bGBIp5PKOBUAe4cCG0Kphwp9ZcYommPYqC+TCeW
	8teETg2u34WPSH4hFDN59OryAgRwfoUcxIXfXmoUz+SeJLaVrgHv7yH2I1zy7w==
Date: Tue, 13 Oct 2026 13:51:11 +0200
Subject: [PATCH v2 6/9] arm64: dts: imx8mm-kontron: Fix GPIO label for
 PCIe_SM_ALERT#
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-6-d464ca652c91@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=2405;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=aaxRKaOe/mV9rDuv1flggH0cjtsajMFJy+hs4E1+4IQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctJ/7+vON3fliDdIr/m+7YVD46MvW1St88tb1njixQ
 255/bVLHaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABN5dJORYW1sN6/1oYfhmz8Z
 f9WT03QLDD4qrnqyZ8rraXJyFvptKxkZnj1ddCBtwmLRCoeu3T7t9rdiAzpKeGqCD5mkV79LXlD
 NDgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_125200_191971_C70A3C39 
X-CRM114-Status: GOOD (  11.53  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The OSM specification provides generic names for all pads. Fix the
GPIO label for PCIe_SM_ALERT# to use the correct pad name in order
to align the label with the spec and with other OSM module
devicetrees.

Also fix the label in the BL board devicetree that overrides the GPIO
labels of the SoM.

Fixes: 6f5e6d7306c0 ("arm64: dts: imx8mm-kontron: Refactor devicetree for OSM-S module and board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
index 3a166cf0afcb7..8d17701233876 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
@@ -156,7 +156,7 @@ &gpio4 {
 			  "DIO4_IN", "SPI_A_/WP_(IO2)", "SPI_A_/HOLD_(IO3)", "GPIO_C_6",
 			  "I2S_MCLK", "UART_A_TX", "UART_A_RX", "UART_A_CTS",
 			  "UART_A_RTS", "", "", "",
-			  "PCIe_SM_ALERT", "UART_B_RTS", "UART_B_CTS", "UART_B_RX";
+			  "PCIe_SM_ALERT#", "UART_B_RTS", "UART_B_CTS", "UART_B_RX";
 };
 
 &i2c3 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index 35b76cd02b1df..9fb229815c1fe 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -223,7 +223,7 @@ &gpio4 {
 			  "GPIO_B_7", "SPI_A_/WP_(IO2)", "SPI_A_/HOLD_(IO3)", "GPIO_C_6",
 			  "I2S_MCLK", "UART_A_TX", "UART_A_RX", "UART_A_CTS",
 			  "UART_A_RTS", "", "", "",
-			  "PCIe_SM_ALERT", "UART_B_RTS", "UART_B_CTS", "UART_B_RX";
+			  "PCIe_SM_ALERT#", "UART_B_RTS", "UART_B_CTS", "UART_B_RX";
 };
 
 &gpio5 {
@@ -614,7 +614,7 @@ pinctrl_pcie: pciegrp {
 			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22		0x19 /* PCIe_CLKREQ# */
 			MX8MM_IOMUXC_SAI5_RXD2_GPIO3_IO23		0x19 /* PCIe_A_PERST# */
 			MX8MM_IOMUXC_SAI5_RXD3_GPIO3_IO24		0x19 /* PCIe_WAKE# */
-			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19 /* PCIe_SM_ALERT */
+			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19 /* PCIe_SM_ALERT# */
 		>;
 	};
 

-- 
2.55.0


