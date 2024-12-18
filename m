Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A0EE77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 08:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uENc3pcbSO7KO66KcRGgh8bEld+2asqIRXkHrQAr04A=; b=o3oIbamIINvVxGx6aIK5dU9YOo
	wyts9lVGXXYIvZt9bOhp2zR9qRfV1XSFXNrbvDrrkoMTHKrJkgJcz7cC5sj4e4iEt0yGHuDVeORLp
	abh+gxD15Vxw/Q+4kBGQ8sKEEcdedketZ5ChuOE4t1Y8vJ9WmIEumzc9yFsZUeCQFgfeY1yW63hnR
	5tlByqJCV21WK2rDydY6zWyxt0UkFpzIubykIFGjnx7HLNOhnN9DLFaiyBM+9hTTA0hLO/NnDTuTu
	3B2BA3+HzFsxdBI+cfsWlVdBC8lA44uNlFAbhsI4A6AKbbNjpOHj6dh+loK5XPHhGlekOPijRwrV4
	gTDCM03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp4L-0000000FszT-2ZMV;
	Wed, 18 Dec 2024 08:06:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp3E-0000000FsrC-2W20
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 08:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734509101; x=1766045101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tHhUwVI89duGuApu6c+HrvoQwjjesU12xZgxqJCiBXI=;
  b=GhHWcxWFibgwQOT6WlNKPIWbVjKsYAryZrJXtX73GIdINeiJ/EjPxuz+
   q5lJNsn32B9Ms2+koaBkxzAGWotwvrXqz/7Wk3Vdk+eyKBHdJNtNmj2NE
   5MRN5YcUfyZFqNWtQO5aKwV/LcLPRRPVjHsCxYd2eJdXbrxjO+tcKORvs
   9yKaBDv5cRo8OLjJuCpLWLhYcjhtxFfIBufbDsgqQjEi9t6ZOFx0QBSTK
   PDKY2OmzbiVsaLgscKhRCMDloS8eUA3sy9O7gquU8MBeor2O9jl9TmB0X
   iJqiOo+oKlhfS1pupAtQclrIxlrROL+B9H6aaDhginc9Gds4u8qnv/MfT
   w==;
X-CSE-ConnectionGUID: xTeLUC79Q52BURM6x9sMBQ==
X-CSE-MsgGUID: RQAWdpp8QhW9zjl9+yrjaA==
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="266906840"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Dec 2024 01:04:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 18 Dec 2024 01:04:43 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 18 Dec 2024 01:04:41 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 1/2] ARM: dts: microchip: sam9x60: Add address/size to spi-controller nodes
Date: Wed, 18 Dec 2024 10:03:32 +0200
Message-ID: <20241218080333.2225-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218080333.2225-1-mihai.sain@microchip.com>
References: <20241218080333.2225-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_000500_712800_E9AC3BBA 
X-CRM114-Status: UNSURE (   9.38  )
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

Since these properties are common for all spi subnodes,
add them to SoC dtsi instead of board dts.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x60.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index 36944e18a329..b8b2c1ddf3f1 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -197,6 +197,8 @@ spi4: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
 					clock-names = "spi_clk";
 					dmas = <&dma0
@@ -268,6 +270,8 @@ spi5: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <14 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
 					clock-names = "spi_clk";
 					dmas = <&dma0
@@ -768,6 +772,8 @@ spi0: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <5 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
 					clock-names = "spi_clk";
 					dmas = <&dma0
@@ -839,6 +845,8 @@ spi1: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <6 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
 					clock-names = "spi_clk";
 					dmas = <&dma0
@@ -910,6 +918,8 @@ spi2: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <7 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
 					clock-names = "spi_clk";
 					dmas = <&dma0
@@ -981,6 +991,8 @@ spi3: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
 					interrupts = <8 IRQ_TYPE_LEVEL_HIGH 7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
 					clock-names = "spi_clk";
 					dmas = <&dma0
-- 
2.47.1


