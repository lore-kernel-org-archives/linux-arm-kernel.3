Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7BCC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lv5Fjwlf69P+VvNJeZf3y6F/gyQPeAJ9+/HJrZF0SBA=; b=luir1Sl9al84RBoX0YC0HSsZqt
	06PYGuAZpv7u3Czg6EiRJrK28WC6gqM9pQpC6nv6XBJulILvGT75nphxEBQbzzjTAZA0n2QkwnyAf
	DzANRMyQ5VhP4TjPlG+PmDciH9XgfD9tV/595ybm/ebztmz6m6kqga6g+bDBgmUD8aCPSo5OlS+6e
	USrYExAlSXKCrdIHyZgzBSvhr4whmMhgTB9wf7JfZ94LHaiSjKrTqYLn7BM2KvRXEq228zCvg6aad
	YgPMng9u35V6t1tKqWW9vF2I0fDwgINaHVORRV3A2Gk02t8xRlZldBWKMhXFDxQWPjaMrwNAtnscs
	gaiSJMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjij-00000008WnJ-1xLX;
	Thu, 27 Feb 2025 19:38:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC7-00000007xu7-3TkY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671583; x=1772207583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8iqa25WLbQ368CsVaPvdLG58CjAYmr/BYZ/mJasbeKA=;
  b=T3VJyaWnfZJXrG5xS5RnLbMEPNHUhHtexB2sWQ5NNQQUfn+qbyp0+q4h
   zLrwl52Soc4ScM9AzqR4PiPKyyjX+2GbN/FgoiZ6HEE8Mx36QNd480rcq
   lF9oHhYEyN882mK0fglMMdgA0ygQb9dSZcwo8dCI9PdueeIPHSL+AvRnk
   fv23DtzgqaHg7okF1hvCLrA5DsLi9GM6lvbbq5ICB9OYMzYch3bozFFIK
   3fzEVTYjjupQwAJJFpKGwEbN4l43K4YaY7PAjwDCj7BHJnWYEEkYDtktg
   QrucpN83+2LJU7vx1a4rR1ZS5ITPQEJdus9X/lgHLS9FzLP8FT8XAVfIF
   w==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: M217Fjv2TPm3bM4HNcQrFg==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638182"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:52:59 -0700
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
Subject: [PATCH v3 17/21] ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d65 SoC
Date: Thu, 27 Feb 2025 08:52:04 -0700
Message-ID: <6a1c058edee3fe1459dcb3a93a0a789a9ffff5f3.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075303_954019_15F8C4BB 
X-CRM114-Status: UNSURE (   9.48  )
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

Add RTT support for SAMA7D65 SoC. The GPBR is added so the SoC is able
to store the RTT time data.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index b0a676623100..aadeea132289 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -120,6 +120,13 @@ shdwc: poweroff@e001d200 {
 			status = "disabled";
 		};
 
+		rtt: rtc@e001d300 {
+			compatible = "microchip,sama7d65-rtt", "atmel,at91sam9260-rtt";
+			reg = <0xe001d300 0x30>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk32k 0>;
+		};
+
 		clk32k: clock-controller@e001d500 {
 			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
 			reg = <0xe001d500 0x4>;
@@ -132,6 +139,11 @@ chipid@e0020000 {
 			reg = <0xe0020000 0x8>;
 		};
 
+		gpbr: gpbr@e001d700 {
+			compatible = "microchip,sama7d65-gpbr", "syscon";
+			reg = <0xe001d700 0x48>;
+		};
+
 		dma2: dma-controller@e1200000 {
 			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
 			reg = <0xe1200000 0x1000>;
-- 
2.43.0


