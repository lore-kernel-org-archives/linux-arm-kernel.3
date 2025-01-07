Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E365E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvX1mthwDAWliiiFfjxGWyVBkjDaPw/qHFlQ+7vkD58=; b=I3dRLNr9g48jJ/ww65iYfLNxjZ
	o78pt4rWIV/1gcffMUGRU6/xy5kJUTVHkYEGrDOqcn+Nrknqu5i6ECBJ9KFd4/zTYeyKWlZqcIhQH
	x/xxkqnXsgjahZvu5YctM90Ofhw9lSeaBbvnXD+El97GY7q3HNtHKjw6F/injATWf+jtt4hMLhys7
	ZZtSZTNuyteHByrXURsIn22FO0Gb2/OXzZpfOZgpfVXiGqSEN5Xzsle9q2XIjYAyh8C2eH9/7IALx
	NfkRTBz+VSLgHk3IjYcR35Qu2KiRPnOXplIg6xH81WAYKfSPES1DVt5MHKDkyJ4NXxwntrK02w5pD
	Yo/iJ8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCCp-00000005ZnZ-0qLe;
	Tue, 07 Jan 2025 16:13:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVC87-00000005Yh5-2kk6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736266111; x=1767802111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=urfNn5rVdf7gcjV7bg+HRVF6ewJXcTZT7wfn3zRvj2Y=;
  b=RXsLFvSyvdf4NCaJW3+dcS6cRbZmZljjM/syQaMV1t+nt3sCKgXyQR+c
   OKn4jd2aBzQ7QopX5Ag08kLu0H9b3b+DsX2Sa8Xv9on+2FzahNS+JlAMz
   JalzDmzzApk2um+GhVD0Rm0aEjs8ykz2CX0F6GRJeAMyDVwIWOmV2hc+k
   Ebi27rdPM4dBkhFsHZgLwJh25FY81iCA3HgQIOsR/1oLvDpdbIassEWqP
   D+uX1VOMgteEnRgfHMhoNZqG3lXFRmq/I9wypOdktE2aBOkTztncYSJ1f
   ZT5TUMXmjmdGMzDpYEM26J5b2AvdXUQA2ksqgoTgeZmBFPxy2Kdd7h3Lg
   Q==;
X-CSE-ConnectionGUID: lqpfnJzJQpCXzb9QKpQeRA==
X-CSE-MsgGUID: dNICsMlrT3qhDCy3ycLAog==
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="40091254"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Jan 2025 09:08:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 Jan 2025 09:08:18 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 7 Jan 2025 09:08:18 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v5 4/5] ARM: dts: microchip: add sama7d65 SoC DT
Date: Tue, 7 Jan 2025 09:07:26 -0700
Message-ID: <20250107160850.120537-5-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
References: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_080831_726324_EFFDBA2E 
X-CRM114-Status: GOOD (  11.98  )
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

Add Device Tree for sama7d65 SoC.

Co-developed-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
Co-developed-by: Varshini Rajendran <varshini.rajendran@microchip.com>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 145 ++++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 arch/arm/boot/dts/microchip/sama7d65.dtsi

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
new file mode 100644
index 000000000000..03e1adfdcd34
--- /dev/null
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ *  sama7d65.dtsi - Device Tree Include file for SAMA7D65 SoC
+ *
+ *  Copyright (C) 2024 Microchip Technology, Inc. and its subsidiaries
+ *
+ *  Author: Ryan Wanner <Ryan.Wanner@microchip.com>
+ *
+ */
+
+#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/mfd/at91-usart.h>
+
+/ {
+	model = "Microchip SAMA7D65 family SoC";
+	compatible = "microchip,sama7d65";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+			device_type = "cpu";
+			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
+			clock-names = "cpu";
+		};
+	};
+
+	clocks {
+		main_xtal: clock-mainxtal {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		 slow_xtal: clock-slowxtal {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		pioa: pinctrl@e0014000 {
+			compatible = "microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl";
+			reg = <0xe0014000 0x800>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		pmc: clock-controller@e0018000 {
+			compatible = "microchip,sama7d65-pmc", "syscon";
+			reg = <0xe0018000 0x200>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#clock-cells = <2>;
+			clocks = <&clk32k 1>, <&clk32k 0>, <&main_xtal>;
+			clock-names = "td_slck", "md_slck", "main_xtal";
+		};
+
+		clk32k: clock-controller@e001d500 {
+			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
+			reg = <0xe001d500 0x4>;
+			clocks = <&slow_xtal>;
+			#clock-cells = <1>;
+		};
+
+		sdmmc1: mmc@e1208000 {
+			compatible = "microchip,sama7d65-sdhci", "microchip,sam9x60-sdhci";
+			reg = <0xe1208000 0x400>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 76>, <&pmc PMC_TYPE_GCK 76>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&pmc PMC_TYPE_GCK 76>;
+			assigned-clock-rates = <200000000>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_MCK1>;
+			status = "disabled";
+		};
+
+		pit64b0: timer@e1800000 {
+			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
+			reg = <0xe1800000 0x100>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 66>, <&pmc PMC_TYPE_GCK 66>;
+			clock-names = "pclk", "gclk";
+		};
+
+		pit64b1: timer@e1804000 {
+			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
+			reg = <0xe1804000 0x100>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 67>, <&pmc PMC_TYPE_GCK 67>;
+			clock-names = "pclk", "gclk";
+		};
+
+		flx6: flexcom@e2020000 {
+			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
+			reg = <0xe2020000 0x200>;
+			ranges = <0x0 0xe2020000 0x800>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 40>;
+			status = "disabled";
+
+			uart6: serial@200 {
+				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 40>;
+				clock-names = "usart";
+				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
+				atmel,fifo-size = <16>;
+				status = "disabled";
+			};
+		};
+
+		gic: interrupt-controller@e8c11000 {
+			compatible = "arm,cortex-a7-gic";
+			reg = <0xe8c11000 0x1000>,
+			      <0xe8c12000 0x2000>;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+		};
+	};
+};
-- 
2.43.0


