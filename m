Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0506EC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoJTb+3oMtlBGXFoyq7QIAMzphVtsDJaTXyZV9YL0Nc=; b=OlDUUUGuQI3qhHrAuVcCIAp3QS
	J8JhApirTet0XvoMbMyWa21kGNdDvzRkauJryVrbmzZm9E8ksRG/XLrfGMh1FgWvGxQnrrwXmFHqv
	iJQ4CeCwoKhi4iISTckGXO3T1E6NproG70PgDQMGi/mpKKjs1kqfhX3ZMwl7Hq+9nuSVby34wMdCa
	Z5ip9K9mV/HbJHMsWl4YljX4mwes9wqlfara1Y7+Es2bxupQm82yjfVc59Y1LMu/K12pKudgpm2BH
	rUKw60TZ9Av1cRRpBiNfHVO013oyvogXGRUM9O2bWnMsoFs0I+1vTc2skogWTlDrHSUE7rxE/hp5o
	lshim5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtmQ-00000005IL3-23S7;
	Thu, 06 Aug 2026 08:48:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtmN-00000005IIc-1YFm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786006126; x=1817542126;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/eM8hz28shrnbpDK7y2SGL0KHfDbbCGmq4bnAalgeqk=;
  b=0RisCRMxBIaOY2FlPzMKLjG00Nc+V93Z/hSPRE83lYQrKGsFB1QSK7Xi
   L/7C02dFFOI1HOpf4rSuq+O5F8yGB5M9qd3boMRR9q7TWTO4V9siEtDc9
   52CL4h8ebkMwj0kJzQlxY4MPD0GOZNrMh5045ura7TTTTCsS3KRaofPek
   EK4AUQEb5KF5qVwff7SHUgnppPtI5rM+FQDqkRhSdsoZuerjaLD3gPawD
   xgdFVYQ56nIq6Mnm0p3qxuyCxS6PewL8Royv10IS4NVkSOu6YMqiDSqMh
   lR4J6bfLWSuFk68oGwjoS54kPC8aTy5VQCg771T7QVMargKieJKHvjmaw
   A==;
X-CSE-ConnectionGUID: 2Eu9x+MhQfuluoh9zbcWSQ==
X-CSE-MsgGUID: 43zT3IMqT8+7KE6Wh1rX+Q==
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="71343337"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Aug 2026 01:48:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 6 Aug 2026 01:48:42 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 6 Aug 2026 01:48:33 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
	<Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
	<mazziesaccount@gmail.com>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 12/17] ARM: dts: microchip: sama7d65: Add ADC node
Date: Thu, 6 Aug 2026 13:10:19 +0530
Message-ID: <20260806074024.531259-13-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806074024.531259-1-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_014843_406071_6EF554AD 
X-CRM114-Status: UNSURE (   9.73  )
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

Add node for the ADC controller in sama7d65 SoC. Add the vddout25 fixed
regulator node which provides the 2.5V reference voltage for the ADC.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index dfac17e34e65..c35f27615bc4 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/at91.h>
 #include <dt-bindings/dma/at91.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/adc/at91-sama5d2_adc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/mfd/at91-usart.h>
@@ -95,6 +96,15 @@ slow_xtal: clock-slowxtal {
 		};
 	};
 
+	vddout25: fixed-regulator-vddout25 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDOUT25";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		regulator-boot-on;
+		status = "disabled";
+	};
+
 	ns_sram: sram@100000 {
 		compatible = "mmio-sram";
 		reg = <0x100000 0x20000>;
@@ -296,6 +306,24 @@ can4: can@e0838000 {
 			status = "disabled";
 		};
 
+		adc: adc@e1000000 {
+			compatible = "microchip,sama7d65-adc";
+			reg = <0xe1000000 0x200>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_GCK 25>;
+			clock-names = "adc_clk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 25>;
+			assigned-clock-rates = <100000000>;
+			dmas = <&dma0 AT91_XDMAC_DT_PERID(0)>;
+			dma-names = "rx";
+			#io-channel-cells = <1>;
+			atmel,min-sample-rate-hz = <200000>;
+			atmel,max-sample-rate-hz = <20000000>;
+			atmel,trigger-edge-type = <IRQ_TYPE_EDGE_RISING>;
+			atmel,startup-time-ms = <4>;
+			status = "disabled";
+		};
+
 		dma2: dma-controller@e1200000 {
 			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
 			reg = <0xe1200000 0x1000>;
-- 
2.34.1


