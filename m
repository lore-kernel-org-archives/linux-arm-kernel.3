Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A62C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxVJdG69CXDfbS7jCR8J3uQXwplIdnGXRXCFjwaVDdg=; b=3vFZ/JgQbgFDEIq/AxZHNrBPRz
	fhEPjhqcjdLo5VOqqXZKunEESh6zaPypzqVHdklNNFyJUjpaLlMgRZu3kiWvgbtnzTXZufJOj3ELE
	ZVI+OgiyiMMsFkBOTbX58MCak3lWDAsRxWhtBnYs0h9WDwGiMrpK13oNbSnysyjCPq+6hIcZ8PAsT
	LgkhWnQNW5yrOAFHX4rrKhAU9OOSGf6Wycrep5mDe3jBYaxOlWnj1K461eXLgAyn/dURJ2jPYY6Fw
	jVeBcWCTgsq7z8TEaSM+uHvCI4A2y8wAcIQ81ZPDUHOJioVMMrU55C1ilHIkFvvFQ56umXLYo/6bY
	eEzsXO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjid-00000008Wa4-2nEx;
	Thu, 27 Feb 2025 19:38:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC6-00000007xu7-2FBF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671582; x=1772207582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FqFmeojqTK+deQ4FOgVDuvvMDBOUq3qMFO0P9+tUytQ=;
  b=UMjofq2gV5T6ZriiJmYDFlIZlBMZHrHkWHuVQ6YRRFVGwplCh3uyD3/D
   Iwvh165ifdYfaO0CJo1N4y7skxmqOyF9XBfebQPYRbE8+wJZdQxtyHjWj
   Uy/WbiT6bgkyI6zNA6cNbaPgZjVhmAhqmZumxjJ6OrQdemDBA0CExYRE8
   WoKB4j1lAHOKbHzOYIEmAzkIif/fw1PuypKEuQD5JR7FaU2hqLQsAjjze
   6hL0TALJVZryp0au7isuu73D1T9R2vKbJ67RUOGSrSSGimkTYZl1YJS6D
   PoFKW9mJhxEfhA7aJ49RkU/tuLhnty6LSyyzbtBweorjK/8nXMjp4Kas7
   w==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: b83FHUnIRLOi9QLdwLO/vQ==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638179"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:52:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:46 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:46 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 14/21] ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
Date: Thu, 27 Feb 2025 08:52:01 -0700
Message-ID: <ab4002faa1b672023ffc97bf91755720508c275e.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075302_638603_5A1878CF 
X-CRM114-Status: UNSURE (   8.56  )
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

Add SRAM, secumod, UDDRC, and DDR3phy to enable support for low power modes.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 92a5347e35b5..c10cc3558efd 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -47,12 +47,37 @@ slow_xtal: clock-slowxtal {
 		};
 	};
 
+	ns_sram: sram@100000 {
+		compatible = "mmio-sram";
+		reg = <0x100000 0x20000>;
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		securam: sram@e0000800 {
+			compatible = "microchip,sama7d65-securam", "atmel,sama5d2-securam", "mmio-sram";
+			reg = <0xe0000800 0x4000>;
+			ranges = <0 0xe0000800 0x4000>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 17>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			no-memory-wc;
+		};
+
+		secumod: secumod@e0004000 {
+			compatible = "microchip,sama7d65-secumod", "atmel,sama5d2-secumod", "syscon";
+			reg = <0xe0004000 0x4000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
 		pioa: pinctrl@e0014000 {
 			compatible = "microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl";
 			reg = <0xe0014000 0x800>;
@@ -190,6 +215,16 @@ i2c10: i2c@600 {
 			};
 		};
 
+		uddrc: uddrc@e3800000 {
+			compatible = "microchip,sama7d65-uddrc", "microchip,sama7g5-uddrc";
+			reg = <0xe3800000 0x4000>;
+		};
+
+		ddr3phy: ddr3phy@e3804000 {
+			compatible = "microchip,sama7d65-ddr3phy", "microchip,sama7g5-ddr3phy";
+			reg = <0xe3804000 0x1000>;
+		};
+
 		gic: interrupt-controller@e8c11000 {
 			compatible = "arm,cortex-a7-gic";
 			reg = <0xe8c11000 0x1000>,
-- 
2.43.0


