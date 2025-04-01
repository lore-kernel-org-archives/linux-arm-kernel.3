Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C29C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cDujybJUZdaosUV5AXxEqre488KbsMk3vF88nvUOhA=; b=1Z78mQY+PL1qf32mbtx4h5A53L
	NkaPAgIzVOBMmu+SAGQ/cWSxyALozbSbR3bioGj3VH0K45+I71i+GZxahWDiLY/tNMH7+wF0Yga3V
	zCG6P4kEfFdzyr5OuIN5q3eHWZtW4fCEPzB3zddT3iN1jyvAAQ8u62EooNLEomgBf7Fab22fyd7p8
	6UCUd1+ci0GGTBWO7aKSOqTKQ5N4oZiwN5Qq/oEd829vaosoPMPv7ZWPdY4Ot2nkeiQFccgWUvTwJ
	gSkQ05uCSPN4I8gqJRTsXIuPt7BQ9moW+m/fjtf7D1q3FHVSay9cHxubMgP8mlE3jQ4cLmEnbGZJV
	2bjW7Ltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeKF-00000003qZt-2Onf;
	Tue, 01 Apr 2025 16:18:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeEw-00000003pSa-3FFM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743524006; x=1775060006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R+dvFcKSVcqqUDpItH268Ej1pZUEkDrwiH4aY6Td5JY=;
  b=gX51Mbw6zTc9Oyy0BOs4if+kn/+YEWEuW3UPAypMJ3kWRN6ImVOAFu1p
   oVnE5P4GUQUC2LSqp1UT7ra5/Mwlh6PVnAOnt0UefAwTFI1RVUl0VcHlU
   n19vrehoket8juNSdKy0ZUTtLW+Gx2VQXC7e3gOEWo46ywHxwCcojR92j
   SGcG/OHe7Z/bHI8JiWhTXmDb+9hKVtjGYTvl32X6dKxeJ7uS5smrp/Ig8
   oNygxgMA6TvQ7dW0AZb8t8KtHeI/PONcVADttPSca6DgJpjjOTjZqnz//
   LtYJe74UX0Prm5XmeBtHFPZCKcx8TDhO6GIU+77N6+FSHB/oC+Px8FB0h
   w==;
X-CSE-ConnectionGUID: ggLzNIpETriZ0zPViMY9HA==
X-CSE-MsgGUID: pl7XT+nXRGqhxAxzXvgSmQ==
X-IronPort-AV: E=Sophos;i="6.14,293,1736838000"; 
   d="scan'208";a="39512777"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Apr 2025 09:13:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 09:13:01 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 09:13:01 -0700
From: <Ryan.Wanner@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <onor+dt@kernel.org>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <nicolas.ferre@microchip.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 2/6] ARM: dts: microchip: sama7d65: Add gmac interfaces for sama7d65 SoC
Date: Tue, 1 Apr 2025 09:13:18 -0700
Message-ID: <05b107796b6f3a173d0dd0a5b2107b675cfd994e.1743523114.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743523114.git.Ryan.Wanner@microchip.com>
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_091326_888403_91F5C2D7 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add support for GMAC interfaces on SAMA7D65 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index b6710ccd4c36..cd17b838e179 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -169,6 +169,38 @@ dma1: dma-controller@e1614000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@e1618000 {
+			compatible = "microchip,sama7d65-gem", "microchip,sama7g5-gem";
+			reg = <0xe1618000 0x2000>;
+			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 46>, <&pmc PMC_TYPE_PERIPHERAL 46>, <&pmc PMC_TYPE_GCK 46>, <&pmc PMC_TYPE_GCK 49>;
+			clock-names = "pclk", "hclk", "tx_clk", "tsu_clk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 46>, <&pmc PMC_TYPE_GCK 49>;
+			assigned-clock-rates = <125000000>, <200000000>;
+			status = "disabled";
+		};
+
+		gmac1: ethernet@e161c000 {
+			compatible = "microchip,sama7d65-gem", "microchip,sama7g5-gem";
+			reg = <0xe161c000 0x2000>;
+			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 47>, <&pmc PMC_TYPE_PERIPHERAL 47>,<&pmc PMC_TYPE_GCK 47>, <&pmc PMC_TYPE_GCK 50>;
+			clock-names = "pclk", "hclk", "tx_clk", "tsu_clk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 47>, <&pmc PMC_TYPE_GCK 50>;
+			assigned-clock-rates = <125000000>, <200000000>;
+			status = "disabled";
+		};
+
 		pit64b0: timer@e1800000 {
 			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
 			reg = <0xe1800000 0x100>;
-- 
2.43.0


