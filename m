Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD61C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGQIBuswS/4yyIsxA7OCFV3PFny5DyRXJhEt7NRmbGc=; b=QFLQxh/7ywR9FtYXfLFui89Xps
	9YQB/de5FaIaDTfTFE3seiYLc3WNqabWDjLh9GtfdsRae9yMynDhRUMyTnKhQ6shNXQzbnksBjOYG
	4kzrR/RInOFvbBOJggUJxUmKPYXW1zD0CxQ/VjPUhrSRTzlzkEcGzTXM/gb0qFjQLtDys3BUlC6E4
	nAa/QXQQqk42FqmCPN1R7lzQ/uVxVyZLqjzOZmJ09k5n63/haBohyTIpvMC9ixbtDTPLQpg3bVw60
	bD7rFBhwNqkv+E90UxgI1bAheF0rsZHO16ind2fmGC2NpAkcfFu1QkMLyaAbT/wjL3uvozVPaS0sj
	ZfLUo1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTaV-0000000BQsl-3iba;
	Wed, 11 Jun 2025 22:06:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRRK-0000000Az8v-0rAQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671330; x=1781207330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kdYI7la2MXOPJsmLxcbhbf8rxm86McFG70dJ9GfeAHw=;
  b=bJFrJJbAIO+OvzuKtbsXnC3k5YCq/UrCJm1Tua1FquoB669baDPJyEUB
   4jA1nJs1TJdoMHj+TjASlGHKcv0BTv/DBUbqUZ0lj6Vv4Yye90+oD10dv
   6LYXNaHODuydava5vfuWzP96iRAhjrUBQL/AAJTk3p8nHYtFvFUAzOg9D
   nPn0ViU4sluc6h/Ys161Lo/8VLzAb4372SOHu6rzKMzjclMR4Nf8ljUDc
   X3mQrZry9H4sE8+8xJbPpBE8CWFcTkaBDYSJTMEdt70CTLyBrr4WS9sCN
   smevIb+bgia30rLjeJidXiiBUqbA0jDHt27qp8uwycKt99RdaXzq+lW1V
   w==;
X-CSE-ConnectionGUID: Mlj04rVUS3aXDCaAEgxBzw==
X-CSE-MsgGUID: Sadl/DRsQzCUCCfuaf4XMQ==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="210175093"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:48:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 12:48:17 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 11 Jun 2025 12:48:17 -0700
From: <Ryan.Wanner@microchip.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<olivia@selenic.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 06/10] ARM: dts: microchip: sama7d65: Add crypto support
Date: Wed, 11 Jun 2025 12:47:30 -0700
Message-ID: <fc791949c97f368f32a710e64d8db4018e45e70f.1749666053.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124850_306608_7E9DEECD 
X-CRM114-Status: UNSURE (   8.77  )
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

Add and enable SHA, AES, TDES, and TRNG for SAMA7D65 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index d08d773b1cc5..90cbea576d91 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -186,6 +186,45 @@ sdmmc1: mmc@e1208000 {
 			status = "disabled";
 		};
 
+		aes: crypto@e1600000 {
+			compatible = "microchip,sama7d65-aes", "atmel,at91sam9g46-aes";
+			reg = <0xe1600000 0x100>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 26>;
+			clock-names = "aes_clk";
+			dmas = <&dma0 AT91_XDMAC_DT_PERID(1)>,
+			       <&dma0 AT91_XDMAC_DT_PERID(2)>;
+			dma-names = "tx", "rx";
+		};
+
+		sha: crypto@e1604000 {
+			compatible = "microchip,sama7d65-sha", "atmel,at91sam9g46-sha";
+			reg = <0xe1604000 0x100>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 78>;
+			clock-names = "sha_clk";
+			dmas = <&dma0 AT91_XDMAC_DT_PERID(48)>;
+			dma-names = "tx";
+		};
+
+		tdes: crypto@e1608000 {
+			compatible = "microchip,sama7d65-tdes", "atmel,at91sam9g46-tdes";
+			reg = <0xe1608000 0x100>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 91>;
+			clock-names = "tdes_clk";
+			dmas = <&dma0 AT91_XDMAC_DT_PERID(54)>,
+			       <&dma0 AT91_XDMAC_DT_PERID(53)>;
+			dma-names = "tx", "rx";
+		};
+
+		trng: rng@e160c000 {
+			compatible = "microchip,sama7d65-trng", "microchip,sam9x60-trng";
+			reg = <0xe160c000 0x100>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 92>;
+		};
+
 		dma0: dma-controller@e1610000 {
 			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
 			reg = <0xe1610000 0x1000>;
-- 
2.43.0


