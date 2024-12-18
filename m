Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC5EE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 08:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryQ3vVmGrGoG3iQ90s+RoMW+1nGC867y/rxKJSgaFOQ=; b=S7ZEpTM+pyFdvaC+It5XCwZR2Y
	5TqdwvtNjv3dtAjZd8E0BEFbVRCIka7Yn/VCc3ei9fSTiSA/vyvSJ5t9/2m/qJCTfNhLde5p3gqzu
	de3dF7E4UmmdCPjRWYBv6E5gqnYSlIPeozDUHCim+M9KB4YkQjQM8pkOXDCtA1Q4z5wcIM2pJ6wqU
	cMS1bGoi3ZcLaIzcF07N4sRN6ed/X+bmxm+mS6yw2EvUmJb4tUl+25ucMnuZ5GT3/9rDWJ3hDUNX/
	VzPOzEjZRQOI8gh8kbW/JYm5v6OixzZRPfP48xH/XSdJw4+68N3b0bGfV6imBaQ3fzefWM5bmCGjS
	GQlQDDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp6T-0000000FtRC-3gnc;
	Wed, 18 Dec 2024 08:08:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp3G-0000000FsrC-0ON8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 08:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734509102; x=1766045102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yjlDOJGWzT/4izor2c2IpKm3XYaSgcXwaIVH7GcD7l8=;
  b=QBPDKMz/yd+9BixYXzmzzJJuJkM26502U9lX64tlKT0qWCtPQOoOMy6I
   +x8N1o8gbXqTCg9OSagDx0utQMaKk9WHhNPBGLQ+NuvVCGK055/T6K3O7
   RDwdZeRTmtiDVTizgEGUnqqgcKkDK8VHRupi7cI+IYkGwSHA2AxCXcTS6
   kVII+Jjzq1B1CNbG+bDZdCgKLDiJjzR3hxMGVwCXq0AdUQlITtvffqUJk
   86awvKdTo6VuF+fYm9ci8kyVTXD02c6BujxIPer0MhCQxgPYiRjG70jkm
   +dbsGkU+G8/HELXMwCvoj1wiQ6RcTlP1uXyrGKcf86+MLS4lHus55abjY
   Q==;
X-CSE-ConnectionGUID: xTeLUC79Q52BURM6x9sMBQ==
X-CSE-MsgGUID: IhPrvPJ0StSDC9RZq2fICQ==
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="266906841"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Dec 2024 01:05:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 18 Dec 2024 01:04:45 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 18 Dec 2024 01:04:43 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 2/2] ARM: dts: microchip: sam9x7: Add address/size to spi-controller nodes
Date: Wed, 18 Dec 2024 10:03:33 +0200
Message-ID: <20241218080333.2225-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218080333.2225-1-mihai.sain@microchip.com>
References: <20241218080333.2225-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_000502_138293_DB3C5062 
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
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index aedba0a8318f..b217a908f525 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -132,6 +132,8 @@ spi4: spi@400 {
 				compatible = "microchip,sam9x7-spi", "atmel,at91rm9200-spi";
 				reg = <0x400 0x200>;
 				interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
 				clock-names = "spi_clk";
 				dmas = <&dma0
@@ -203,6 +205,8 @@ spi5: spi@400 {
 				compatible = "microchip,sam9x7-spi", "atmel,at91rm9200-spi";
 				reg = <0x400 0x200>;
 				interrupts = <14 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
 				clock-names = "spi_clk";
 				dmas = <&dma0
@@ -697,6 +701,8 @@ spi0: spi@400 {
 				compatible = "microchip,sam9x7-spi", "atmel,at91rm9200-spi";
 				reg = <0x400 0x200>;
 				interrupts = <5 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
 				clock-names = "spi_clk";
 				dmas = <&dma0
@@ -768,6 +774,8 @@ spi1: spi@400 {
 				compatible = "microchip,sam9x7-spi", "atmel,at91rm9200-spi";
 				reg = <0x400 0x200>;
 				interrupts = <6 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
 				clock-names = "spi_clk";
 				dmas = <&dma0
@@ -839,6 +847,8 @@ spi2: spi@400 {
 				compatible = "microchip,sam9x7-spi", "atmel,at91rm9200-spi";
 				reg = <0x400 0x200>;
 				interrupts = <7 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
 				clock-names = "spi_clk";
 				dmas = <&dma0
@@ -910,6 +920,8 @@ spi3: spi@400 {
 				compatible = "microchip,sam9x7-spi", "atmel,at91rm9200-spi";
 				reg = <0x400 0x200>;
 				interrupts = <8 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
 				clock-names = "spi_clk";
 				dmas = <&dma0
-- 
2.47.1


