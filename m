Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FFCC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8T9Ync4S8/idYhi/KBP3TT3uC1PIakYQ0ityoXM4RDE=; b=e6p4uclNZ/6mVaIcEx6UpdosSH
	cPMw4wP0f1kNiWXXSogXwmYr1juowe5ueVm0CI/z786K19gzIn1wDliVcymaD/s8A029t8wTj/ylb
	O6npXmf9wUpikx9oHJ+rucRDhlTTBWzCgTXt5shOffkd6GbgLxquikqcfp4wt9USC8kGFaygsl0Fh
	H37Hx6ZuJ+5F8F+3M5dSmWl9sFleTiDcSM2hMjok5qZrDK6RFfv5zmo61/VjZ+hirAN0sBpIqwUPS
	GqLLgxxD2+CAqZCS4NILWv9IabBM20/Z1vcZXh/vZajzAjBxKD+mX+aRegdVZb1CQMwdIFnj51/lF
	eFO2DoPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0oE-0000000FwdJ-4C3O;
	Fri, 14 Feb 2025 18:53:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07U-0000000Fp5H-1KYO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 18:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8T9Ync4S8/idYhi/KBP3TT3uC1PIakYQ0ityoXM4RDE=; b=d9mshUltloPYPwC0SGDjfYJHpn
	QTQFatqrtsQWJ4Qsvj0lL6Zj6uj+HLRHli6IPgP1D7JcycaWV1t/C29zoac12VbNMskumw+xcND7W
	LKLfdAN5DNHfL/0GaOstVbL7ckwMQndDPZyWHrGpybztYb2TEb94H/dKmVBn69PA5toCGBslwaYuj
	n/opUzndLzBULYhT+/Ctmg0Qt5IkpkJg7SJ0dobxiGvK/bPxTjFsZ74l28fNr8Nq4jlMe02CoV7+H
	ke2iStKRYC5YQLC4zTeZWoSDcaKGNPP3ZeowyzmlbEEtooc6WWYcVzKVwaLgqyf+X3eFfEdskKfez
	omVIFC/g==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07R-00000001J3T-0ypF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739556534; x=1771092534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1jirbwm0amL5vmDsxIqDjfqVX7+BXeBDlukbPMT/bKI=;
  b=XkVhHpAi07dV+a6TGXvUEUWY1UK3x3gbctKGVX5x3LRSyeCmjfM5mLR/
   atH4iAU16BZrOHDC3/V4eHrvlp0H+iQbHKV3HlGJGTg8yJD3vdWQYR7oB
   4AhYEaFCvY6Co/I2UAyKBJSkreCD+QTdXPoc4LRTpz3tFspnZYSBrbcOJ
   H3IJOgivWx+2yP1ITcgpT6zE63BVwFyS2MZG5RLI0WZNy95Tm+03txfT5
   TtuRKTI5t1k49NAqAGsHH58bSdehYB2nt2al5rSvk4jUpuCt0kvdPS6kz
   WmmpyFhEfWjgUBcpPaRbLdhJezX5EIj2HKuiDc25XP2TnLeLfbGSkRcv4
   A==;
X-CSE-ConnectionGUID: afEECSQvQkGMMmDvtHvTFg==
X-CSE-MsgGUID: dnELiuSgQq+xQPam+KENXg==
X-IronPort-AV: E=Sophos;i="6.13,286,1732604400"; 
   d="scan'208";a="37700932"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Feb 2025 11:08:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Feb 2025 11:08:26 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 14 Feb 2025 11:08:26 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <vkoul@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 7/8] ARM: dts: microchip: sama7d65: Add DMAs to sama7d65 SoC
Date: Fri, 14 Feb 2025 11:08:20 -0700
Message-ID: <78da4125a991c6f4081fce78825f1f983091e0f5.1739555984.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739555984.git.Ryan.Wanner@microchip.com>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_180853_725161_9FBF561F 
X-CRM114-Status: UNSURE (   9.13  )
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

Add DMAs to the SAMA7D65 SoC device tree.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index d06a51972d363..b472a7d929ee4 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -9,6 +9,7 @@
  */
 
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/dma/at91.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -95,6 +96,17 @@ chipid@e0020000 {
 			reg = <0xe0020000 0x8>;
 		};
 
+		dma2: dma-controller@e1200000 {
+			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
+			reg = <0xe1200000 0x1000>;
+			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 23>;
+			clock-names = "dma_clk";
+			dma-requests = <0>;
+			status = "disabled";
+		};
+
 		sdmmc1: mmc@e1208000 {
 			compatible = "microchip,sama7d65-sdhci", "microchip,sam9x60-sdhci";
 			reg = <0xe1208000 0x400>;
@@ -107,6 +119,26 @@ sdmmc1: mmc@e1208000 {
 			status = "disabled";
 		};
 
+		dma0: dma-controller@e1610000 {
+			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
+			reg = < 0xe1610000 0x1000>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 21>;
+			clock-names = "dma_clk";
+			status = "disabled";
+		};
+
+		dma1: dma-controller@e1614000 {
+			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
+			reg = <0xe1614000 0x1000>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 22>;
+			clock-names = "dma_clk";
+			status = "disabled";
+		};
+
 		pit64b0: timer@e1800000 {
 			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
 			reg = <0xe1800000 0x100>;
-- 
2.43.0


