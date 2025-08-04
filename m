Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80463C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWSLguugg2fUU2kfGXsngJH4MFNEedH5m0ppgVfZA8M=; b=HifglSrTiulNlU27yLKJrJHZLM
	cz5z+iL53uAhyiltTbOviL/OfTP867+QbdIoM3qyh/Dt4dasmFUdAND1omBmWVaRLrEHXiWeYOSHb
	gtKdSHPc+/fj1CZO7/ew7lTlRSTSciVn+pwVRumK6GPDggIY6OHzio7G2HHEjzvviXE6Vkq+D3tze
	26RfUTiuEP8WKbC5bc+a+IcTEkKq/APVROBrlmmjHJKb/a6Q2cbOGd7XG7K0WzSoRBu9UIHWczPa6
	epE9NKRjdTIlr5DCSZtRx/iG8lOLuI2NRoMpcS1f6ZVuyg0RRM6N4x6oVsy+q9rTRsOeBFbv70KGO
	GCxC/30Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisTp-0000000AC40-3mxp;
	Mon, 04 Aug 2025 10:31:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis31-0000000A921-3qXe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301843; x=1785837843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wSwA6wL4bDtKgaXwJ1S3APBLP/C0XSRWfQu/1acFsUE=;
  b=YTakpBgWXkz9RgEc/TDG6V3ah2pMZV0VH150eBuh6tDOE56Ab/qwMVBP
   tcyQkUfz71POe0QoRuBIvhbEfHIBNqSjSppnT/TD8CgWaOSJIAQowKiCM
   KuXQSXf1dZLJURYQ64eC1zVFvwcfA0B5TBxmDrAwsoOb97HSQk2orRI4v
   SdjyP1EuUPqlvs3iQTxZbLpoVz9370/sngiaBmAieAVL+BYX7nzMdI3qM
   0Gf5jjvmDIk7j9/kM9+BAMFEfNQZ4gJwmSdv0R0WOYXR+KecZkxGMgIKP
   ViSbGAHTZx4amAx4RhO/1Yn3Cw8kEk90Xp2fa6Czb6ZJcmVQHOFvnjCDE
   A==;
X-CSE-ConnectionGUID: +866aF0tQ+SVcfcIeqWRcg==
X-CSE-MsgGUID: +YCYjADVTiWX8fEDnlqPuA==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44245539"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:04:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:03:32 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:03:26 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>, Romain Sioen
	<romain.sioen@microchip.com>
Subject: [PATCH 10/15] ARM: dts: microchip: sama7d65: add node for the ADC
Date: Mon, 4 Aug 2025 15:32:14 +0530
Message-ID: <20250804100219.63325-11-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030404_024492_FC380FF0 
X-CRM114-Status: GOOD (  10.82  )
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

Add node for the ADC controller in sama7d65 SoC. Also add corresponding
regulator and pinmux for the ADC.

Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 .../dts/microchip/at91-sama7d65_curiosity.dts | 23 +++++++++++++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 29 +++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 7250823a6f59..7ecc748456ba 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -41,6 +41,14 @@ reg_5v: regulator-5v {
 
 };
 
+&adc {
+	vddana-supply = <&vddout25>;
+	vref-supply = <&vddout25>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc_default &pinctrl_adtrg_default>;
+	status = "okay";
+};
+
 &dma0 {
 	status = "okay";
 };
@@ -278,6 +286,16 @@ &main_xtal {
 };
 
 &pioa {
+	pinctrl_adc_default: adc_default {
+		pinmux = <PIN_PC5__GPIO>;
+		bias-disable;
+	};
+
+	pinctrl_adtrg_default: adtrg-default {
+		pinmux = <PIN_PB7__ADTRG>;
+		bias-pull-up;
+	};
+
 	pinctrl_gmac0_default: gmac0-default {
 		pinmux = <PIN_PA26__G0_TX0>,
 			 <PIN_PA27__G0_TX1>,
@@ -373,3 +391,8 @@ input@0 {
 &slow_xtal {
 	clock-frequency = <32768>;
 };
+
+&vddout25 {
+	vin-supply = <&vdd_3v3>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 2e20a7532c03..1f249323d08a 100644
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
@@ -83,6 +84,16 @@ slow_xtal: clock-slowxtal {
 		};
 	};
 
+	vddout25: fixed-regulator-vddout25 {
+		compatible = "regulator-fixed";
+
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
@@ -199,6 +210,24 @@ chipid@e0020000 {
 			reg = <0xe0020000 0x8>;
 		};
 
+		adc: adc@e1000000 {
+			compatible = "microchip,sama7d65-adc";
+			reg = <0xe1000000 0x200>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_GCK 25>;
+			assigned-clocks = <&pmc PMC_TYPE_GCK 25>;
+			assigned-clock-rates = <100000000>;
+			clock-names = "adc_clk";
+			dmas = <&dma0 AT91_XDMAC_DT_PERID(0)>;
+			dma-names = "rx";
+			atmel,min-sample-rate-hz = <200000>;
+			atmel,max-sample-rate-hz = <20000000>;
+			atmel,trigger-edge-type = <IRQ_TYPE_EDGE_RISING>;
+			atmel,startup-time-ms = <4>;
+			#io-channel-cells = <1>;
+			status = "disabled";
+		};
+
 		dma2: dma-controller@e1200000 {
 			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
 			reg = <0xe1200000 0x1000>;
-- 
2.34.1


