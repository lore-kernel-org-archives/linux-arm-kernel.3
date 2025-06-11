Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B16C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mr2DJ7MdVCjot72OEHYbWScw7uBlZ60CPplGmgVDUvA=; b=SR8Z1UEyFbELJaGOBLnoHZ6lQB
	CnXSItZ9CjYu0T2flNhgD85wtxuJpv4ea8jxFlLrA2wRkw1PGCVxQZkS9mzcQwLphNkv1OV2RCLMI
	GubWdZyS1s2gNwMpHfiphPKpxQDMF594eBZt8MjUWF8cu6oAxNK+/bbZepJpF0Zpo6OQ+NkyLIPJ9
	mqGzkUTcEk1thCXqQW6Sa5nz2cLjP+Ftp+dT6GMyiOQI+QDnmEzbfpbPNnDG/51ad4HUBAcqXzOJg
	AOaDV6Nhuyp3LZBADg4HGrK7ae11SO6Tyj45H4hOrLZ6rx7U5f45EUJPzb8h2CUdAZleHBfS7YwRw
	oa53xVQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTei-0000000BRGa-1JAZ;
	Wed, 11 Jun 2025 22:10:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRRK-0000000Az8O-3IxS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749671330; x=1781207330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B4LrMX/BxSp8xAduMHQETZgtbDiFuZUcH/aqOW3/Mqc=;
  b=zEX9pYQR3W4tk8sz101jF6vkRO0CEbaeLXDwBY0+vUnnEvI/L17auQlB
   V3AfPzuUsbm0yb4n662z3teQYntuq6jZn8csLSfgr9XB1OD2zXlHBxxBd
   yhmwpfpxrH8uvGixdE+wybm0pSAr43361DaiB6NaRsZO1b6olBAe+NuyC
   aCOP2PmBgYuNOEuZ37bOfoxguHrK8QSW/gt1uexWgLz2ZaXU1XBLnvzzQ
   Qjno7xFDC9t6oKH+jrpBoTRF23fFhG5lj2O/OVd6zXAI7Ln5RanBo7s/S
   1b0H2KwHE2BTxfv3Qx7ILZ1zv70tF+QAB43H/KatOsrdaShUj7hg2pL28
   Q==;
X-CSE-ConnectionGUID: Mlj04rVUS3aXDCaAEgxBzw==
X-CSE-MsgGUID: G1euUUH8S26wiHIAZbAfzQ==
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="210175096"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 12:48:49 -0700
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
Subject: [PATCH v2 08/10] ARM: dts: microchip: sama7d65: Add CAN bus support
Date: Wed, 11 Jun 2025 12:47:32 -0700
Message-ID: <f80a4206c05ed5d80a9527476963a18070ca42b6.1749666053.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124850_888735_B7D5EC92 
X-CRM114-Status: UNSURE (   9.37  )
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

Add support for CAN bus to the SAMA7D65 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 80 +++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 796909fa2368..a62d2ef9fcab 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -163,6 +163,86 @@ chipid@e0020000 {
 			reg = <0xe0020000 0x8>;
 		};
 
+		can0: can@e0828000 {
+			compatible = "bosch,m_can";
+			reg = <0xe0828000 0x200>, <0x100000 0x7800>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 58>, <&pmc PMC_TYPE_GCK 58>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 58>;
+			assigned-clock-rates = <40000000>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			bosch,mram-cfg = <0x3400 0 0 64 0 0 32 32>;
+			status = "disabled";
+		};
+
+		can1: can@e082c000 {
+			compatible = "bosch,m_can";
+			reg = <0xe082c000 0x200>, <0x100000 0xbc00>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 59>, <&pmc PMC_TYPE_GCK 59>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 59>;
+			assigned-clock-rates = <40000000>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			bosch,mram-cfg = <0x7800 0 0 64 0 0 32 32>;
+			status = "disabled";
+		};
+
+		can2: can@e0830000 {
+			compatible = "bosch,m_can";
+			reg = <0xe0830000 0x200>, <0x100000 0x10000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 60>, <&pmc PMC_TYPE_GCK 60>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 60>;
+			assigned-clock-rates = <40000000>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			bosch,mram-cfg = <0xbc00 0 0 64 0 0 32 32>;
+			status = "disabled";
+		};
+
+		can3: can@e0834000 {
+			compatible = "bosch,m_can";
+			reg = <0xe0834000 0x200>, <0x110000 0x4400>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 61>, <&pmc PMC_TYPE_GCK 61>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 61>;
+			assigned-clock-rates = <40000000>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			bosch,mram-cfg = <0x0 0 0 64 0 0 32 32>;
+			status = "disabled";
+		};
+
+		can4: can@e0838000 {
+			compatible = "bosch,m_can";
+			reg = <0xe0838000 0x200>, <0x110000 0x8800>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 62>, <&pmc PMC_TYPE_GCK 62>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 62>;
+			assigned-clock-rates = <40000000>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			bosch,mram-cfg = <0x4400 0 0 64 0 0 32 32>;
+			status = "disabled";
+		};
+
 		dma2: dma-controller@e1200000 {
 			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
 			reg = <0xe1200000 0x1000>;
-- 
2.43.0


