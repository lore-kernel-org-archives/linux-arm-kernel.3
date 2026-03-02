Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D4FE9B36B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrbWY653WsfzoqInQOu5Am3TFi1abpgQkLM/m4XSvUI=; b=Yb3+dfs60a/pcF7F2tWgcGLG7S
	tYFWjTp1C+5v0JJIywt5yx2QtB3xMpliXGS9w7ApHuVkmPoxe/y5NAhh4ucPWTyuW6OLe4GGXYD92
	4o9YQGtJwwLNVpqVY8+Z0UP4++DCv4sMcC4a7pBtYLoXOln5Zlr+vFjxHXqZkQlA+OXXQg3VyIcyx
	u8duovDobJ6KXnJ38QGMKMNuXPU37TLP0GH6+ec+VvhDi05rCIa/voRufgSinLnMUqz/ZZG54qNZh
	x0RUQlZvOdyrXKiTviDbtphBF6u0DRNEtzng5OEDZEQq9I9nbBtGe2q1qCLgQXUMjWO1dTiWL3WRK
	hvqPpa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Lp-0000000Co9q-0wsH;
	Mon, 02 Mar 2026 11:22:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Lm-0000000Co6m-3kGJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:22:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48374014a77so51628685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1772450529; x=1773055329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrbWY653WsfzoqInQOu5Am3TFi1abpgQkLM/m4XSvUI=;
        b=bWOpzzEGOkbTzNh4x3z7JFOci6VNHGyR5g0GtxGDbbcUfGDwaqEtUcxXXqjtIQgAKZ
         p9MGBWnFLTWEBEVh5IY2mPrYlMJDko9tFx7+alzBcqK2zrLuiBCznEugRJRspOq9DDU/
         db1a3KvK+fF1VOiSdIYwudnGgqn/kukW8+LxuBAJyJzblqEohjP9h9dWk02RA5N6liGE
         eKUo+a11Ef2TEdLUaFV/YlyTLBn4wGlTmCpdXRzoaXrXHnYlLhfNyVaxm8igFHFjm5ml
         P+ZfQpmUJU8CkZGeyWx14KIiBW6nUXE+MgTd/mPbOZqS6Ytl01641TED24c5WcKPi4vj
         C+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450529; x=1773055329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JrbWY653WsfzoqInQOu5Am3TFi1abpgQkLM/m4XSvUI=;
        b=dfGZk0+03vzqDxvu6vOtyLA4eKyvjnX/mGtyWH2nDtrNFatR8nsQ9Hf4wr/Eo5QV3V
         AcHLzyPU/UFX8BHzXdkiNwS99jkyHqR4YZmVBXnsIQeJSXRQOHbAi9pqhaWRdOQxgn2l
         e8JqqQWwUwSmQokG7DaxE61/G8gyJNh1CttEVEKfGybwl2F4T+gpHtfu+fui6xkDIX2k
         oRLKte3Hs/71u/YSA1/t9o9AnHCvIr5dckJhhNjvH/VkxT+7Z/2wfXdo2dLzwsa4S7Yv
         jUDwKSMAzYpipeMXRdxHkP/aQWsHehGfn9VGRoJE+NlDJhbik+TeJUUhlsq07BFwTAc8
         TA/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVab5pr8i7a2xYxqHrqYHmxJyQLsWH4cDFCeCIvXlMTaunUM69asydk/5GV2KttJjInNeAhA1xa9wrDvwjyt7Yq@lists.infradead.org
X-Gm-Message-State: AOJu0YwPg5LC+dztlugYDAmi9IxLJ3v+Vn543pgesbzTpkK+oDVqNziZ
	x+ExJqIEDx72nlYTQzjTOA2j3+kQQrkjO2o6MtOU34qOnCqxKWBHQcwHJXkSxsqmIsA=
X-Gm-Gg: ATEYQzx8pl45Z4ACQ9eh0e7BN+e+5bLNrDmPAI/HdTV0Jqn//xS83mL90hREdQpw9hB
	hVJe3GEu38jhuNkeKL+D4uGeiqcHbMw1sxt662yZIoH7XRCl492EMh6IfNE0I5LWZNkg5p7OWIQ
	5XATmXQ6cQLIVeiK2mbZRvG26HRsHK8ZtevzDeTkUWbevanluBusFntYwgXR1lyNm8bwUMEL3aq
	ZXOBl/xTSsfCGUV9bEtFpclfyeRVbCOiisjuR7mBW+1BSZLj/Af/eFMulKOIMAGDKNiCJL/8ZcI
	TvcHzCmcsCwIPqnLjcnbSfxltalM6cgEAKib7HB2SktFEa8mnXnlvSGP8Wr0d7kgeT7r00JdAIz
	dVx+0LH2KilSd8Wf0N1T4lAqzrZ35Zysi1PIV/BPqSieb0n+qRSI1Vm3zzgBWCCAOUR1HmJO80s
	DomMbaXAxcsbfQgA+Mt7HXwPOA6PiJ2VRtdSyMZ4yshX9/vXFIh4ZlnvdJcLnJ3KJdaxyOXH2jR
	rnWHTTjROB5JZs/XRlNKDXasXwwNNmn55qq/ZvUECA=
X-Received: by 2002:a05:600c:b86:b0:483:badb:618a with SMTP id 5b1f17b1804b1-483c9c1525emr197436275e9.27.1772450529074;
        Mon, 02 Mar 2026 03:22:09 -0800 (PST)
Received: from fedora (cpe-109-60-83-135.zg3.cable.xnet.hr. [109.60.83.135])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm292493035e9.3.2026.03.02.03.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:22:08 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v6 4/6] arm64: dts: microchip: add LAN969x support
Date: Mon,  2 Mar 2026 12:20:12 +0100
Message-ID: <20260302112153.464422-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302112153.464422-1-robert.marko@sartura.hr>
References: <20260302112153.464422-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_032211_094859_0C2703D8 
X-CRM114-Status: GOOD (  13.88  )
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

Add support for Microchip LAN969x switch SoC series by adding the SoC DTSI.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v6:
* Pick Acked-by from Daniel

Changes in v5:
* Pick Reviewed-by from Claudiu

Changes in v4:
* Adapt to clock indexes now being in a DTS header only

Changes in v2:
* Rename to lan9691
* Split SoC DTSI and evaluation board commits
* Use SoC specific compatibles for devices
* Alphanumerically sort remaining nodes
* Apply DTS coding style

 arch/arm64/boot/dts/microchip/lan9691.dtsi | 488 +++++++++++++++++++++
 1 file changed, 488 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/lan9691.dtsi

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
new file mode 100644
index 000000000000..235e56bebbdb
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -0,0 +1,488 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 Microchip Technology Inc. and its subsidiaries.
+ */
+
+#include <dt-bindings/dma/at91.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mfd/at91-usart.h>
+#include <dt-bindings/mfd/atmel-flexcom.h>
+
+#include "clk-lan9691.h"
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	model = "Microchip LAN969x";
+	compatible = "microchip,lan9691";
+	interrupt-parent = <&gic>;
+
+	clocks {
+		fx100_clk: fx100-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <320000000>;
+		};
+
+		cpu_clk: cpu-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1000000000>;
+		};
+
+		ddr_clk: ddr-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <600000000>;
+		};
+
+		fabric_clk: fabric-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <250000000>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0x0 0x0>;
+			next-level-cache = <&l2_0>;
+		};
+
+		l2_0: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Secure Phys IRQ */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Non-secure Phys IRQ */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virt IRQ */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hyp IRQ */
+	};
+
+	axi: axi {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		usb: usb@300000 {
+			compatible = "microchip,lan9691-dwc3", "snps,dwc3";
+			reg = <0x300000 0x80000>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks GCK_GATE_USB_DRD>,
+				 <&clks GCK_ID_USB_REFCLK>;
+			clock-names = "bus_early", "ref";
+			assigned-clocks = <&clks GCK_ID_USB_REFCLK>;
+			assigned-clock-rates = <60000000>;
+			maximum-speed = "high-speed";
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		flx0: flexcom@e0040000 {
+			compatible = "microchip,lan9691-flexcom", "atmel,sama5d2-flexcom";
+			reg = <0xe0040000 0x100>;
+			ranges = <0x0 0xe0040000 0x800>;
+			clocks = <&clks GCK_ID_FLEXCOM0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usart0: serial@200 {
+				compatible = "microchip,lan9691-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
+				       <&dma AT91_XDMAC_DT_PERID(2)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				clock-names = "usart";
+				atmel,fifo-size = <32>;
+				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
+				status = "disabled";
+			};
+
+			spi0: spi@400 {
+				compatible = "microchip,lan9691-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
+				       <&dma AT91_XDMAC_DT_PERID(2)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
+			i2c0: i2c@600 {
+				compatible = "microchip,lan9691-i2c", "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
+				       <&dma AT91_XDMAC_DT_PERID(2)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		flx1: flexcom@e0044000 {
+			compatible = "microchip,lan9691-flexcom", "atmel,sama5d2-flexcom";
+			reg = <0xe0044000 0x100>;
+			ranges = <0x0 0xe0044000 0x800>;
+			clocks = <&clks GCK_ID_FLEXCOM1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usart1: serial@200 {
+				compatible = "microchip,lan9691-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
+				       <&dma AT91_XDMAC_DT_PERID(2)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				clock-names = "usart";
+				atmel,fifo-size = <32>;
+				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
+				status = "disabled";
+			};
+
+			spi1: spi@400 {
+				compatible = "microchip,lan9691-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
+				       <&dma AT91_XDMAC_DT_PERID(2)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@600 {
+				compatible = "microchip,lan9691-i2c", "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
+				       <&dma AT91_XDMAC_DT_PERID(2)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		trng: rng@e0048000 {
+			compatible = "microchip,lan9691-trng", "atmel,at91sam9g45-trng";
+			reg = <0xe0048000 0x100>;
+			clocks = <&fabric_clk>;
+			status = "disabled";
+		};
+
+		aes: crypto@e004c000 {
+			compatible = "microchip,lan9691-aes", "atmel,at91sam9g46-aes";
+			reg = <0xe004c000 0x100>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dma AT91_XDMAC_DT_PERID(12)>,
+			       <&dma AT91_XDMAC_DT_PERID(13)>;
+			dma-names = "tx", "rx";
+			clocks = <&fabric_clk>;
+			clock-names = "aes_clk";
+			status = "disabled";
+		};
+
+		flx2: flexcom@e0060000 {
+			compatible = "microchip,lan9691-flexcom", "atmel,sama5d2-flexcom";
+			reg = <0xe0060000 0x100>;
+			ranges = <0x0 0xe0060000 0x800>;
+			clocks = <&clks GCK_ID_FLEXCOM2>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usart2: serial@200 {
+				compatible = "microchip,lan9691-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(7)>,
+				       <&dma AT91_XDMAC_DT_PERID(6)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				clock-names = "usart";
+				atmel,fifo-size = <32>;
+				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
+				status = "disabled";
+			};
+
+			spi2: spi@400 {
+				compatible = "microchip,lan9691-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(7)>,
+				       <&dma AT91_XDMAC_DT_PERID(6)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@600 {
+				compatible = "microchip,lan9691-i2c", "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(7)>,
+				       <&dma AT91_XDMAC_DT_PERID(6)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		flx3: flexcom@e0064000 {
+			compatible = "microchip,lan9691-flexcom", "atmel,sama5d2-flexcom";
+			reg = <0xe0064000 0x100>;
+			ranges = <0x0 0xe0064000 0x800>;
+			clocks = <&clks GCK_ID_FLEXCOM3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usart3: serial@200 {
+				compatible = "microchip,lan9691-usart", "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(9)>,
+				       <&dma AT91_XDMAC_DT_PERID(8)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				clock-names = "usart";
+				atmel,fifo-size = <32>;
+				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
+				status = "disabled";
+			};
+
+			spi3: spi@400 {
+				compatible = "microchip,lan9691-spi", "atmel,at91rm9200-spi";
+				reg = <0x400 0x200>;
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(9)>,
+				       <&dma AT91_XDMAC_DT_PERID(8)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				clock-names = "spi_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@600 {
+				compatible = "microchip,lan9691-i2c", "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma AT91_XDMAC_DT_PERID(9)>,
+				       <&dma AT91_XDMAC_DT_PERID(8)>;
+				dma-names = "tx", "rx";
+				clocks = <&fabric_clk>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		dma: dma-controller@e0068000 {
+			compatible = "microchip,lan9691-dma", "microchip,sama7g5-dma";
+			reg = <0xe0068000 0x1000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <16>;
+			#dma-cells = <1>;
+			clocks = <&fabric_clk>;
+			clock-names = "dma_clk";
+		};
+
+		sha: crypto@e006c000 {
+			compatible = "microchip,lan9691-sha", "atmel,at91sam9g46-sha";
+			reg = <0xe006c000 0xec>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dma AT91_XDMAC_DT_PERID(14)>;
+			dma-names = "tx";
+			clocks = <&fabric_clk>;
+			clock-names = "sha_clk";
+			status = "disabled";
+		};
+
+		timer: timer@e008c000 {
+			compatible = "snps,dw-apb-timer";
+			reg = <0xe008c000 0x400>;
+			clocks = <&fabric_clk>;
+			clock-names = "timer";
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		watchdog: watchdog@e0090000 {
+			compatible = "snps,dw-wdt";
+			reg = <0xe0090000 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>;
+		};
+
+		cpu_ctrl: syscon@e00c0000 {
+			compatible = "microchip,lan966x-cpu-syscon", "syscon";
+			reg = <0xe00c0000 0x350>;
+		};
+
+		switch: switch@e00c0000 {
+			compatible = "microchip,lan9691-switch";
+			reg = <0xe00c0000 0x0010000>,
+			      <0xe2010000 0x1410000>;
+			reg-names = "cpu", "devices";
+			interrupt-names = "xtr", "fdma", "ptp";
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&reset 0>;
+			reset-names = "switch";
+			status = "disabled";
+		};
+
+		clks: clock-controller@e00c00b4 {
+			compatible = "microchip,lan9691-gck";
+			reg = <0xe00c00b4 0x30>, <0xe00c0308 0x4>;
+			#clock-cells = <1>;
+			clocks = <&cpu_clk>, <&ddr_clk>, <&fx100_clk>;
+			clock-names = "cpu", "ddr", "sys";
+		};
+
+		reset: reset-controller@e201000c {
+			compatible = "microchip,lan9691-switch-reset",
+				     "microchip,lan966x-switch-reset";
+			reg = <0xe201000c 0x4>;
+			reg-names = "gcb";
+			#reset-cells = <1>;
+			cpu-syscon = <&cpu_ctrl>;
+		};
+
+		gpio: pinctrl@e20100d4 {
+			compatible = "microchip,lan9691-pinctrl";
+			reg = <0xe20100d4 0xd4>,
+			      <0xe2010370 0xa8>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&gpio 0 0 66>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+		};
+
+		mdio0: mdio@e20101a8 {
+			compatible = "microchip,lan9691-miim", "mscc,ocelot-miim";
+			reg = <0xe20101a8 0x24>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&fx100_clk>;
+			status = "disabled";
+		};
+
+		mdio1: mdio@e20101cc {
+			compatible = "microchip,lan9691-miim", "mscc,ocelot-miim";
+			reg = <0xe20101cc 0x24>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&fx100_clk>;
+			status = "disabled";
+		};
+
+		sgpio: gpio@e2010230 {
+			compatible = "microchip,lan9691-sgpio", "microchip,sparx5-sgpio";
+			reg = <0xe2010230 0x118>;
+			clocks = <&fx100_clk>;
+			resets = <&reset 0>;
+			reset-names = "switch";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			sgpio_in: gpio@0 {
+				compatible = "microchip,lan9691-sgpio-bank",
+					     "microchip,sparx5-sgpio-bank";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+			};
+
+			sgpio_out: gpio@1 {
+				compatible = "microchip,lan9691-sgpio-bank",
+					     "microchip,sparx5-sgpio-bank";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <3>;
+			};
+		};
+
+		tmon: hwmon@e2020100 {
+			compatible = "microchip,lan9691-temp", "microchip,sparx5-temp";
+			reg = <0xe2020100 0xc>;
+			clocks = <&fx100_clk>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		serdes: serdes@e3410000 {
+			compatible = "microchip,lan9691-serdes";
+			reg = <0xe3410000 0x150000>;
+			#phy-cells = <1>;
+			clocks = <&fabric_clk>;
+		};
+
+		gic: interrupt-controller@e8c11000 {
+			compatible = "arm,gic-400";
+			reg = <0xe8c11000 0x1000>, /* Distributor GICD_ */
+			      <0xe8c12000 0x2000>, /* CPU interface GICC_ */
+			      <0xe8c14000 0x2000>, /* Virt interface control */
+			      <0xe8c16000 0x2000>; /* Virt CPU interface */
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+};
-- 
2.53.0


