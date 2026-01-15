Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8C9D41174
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAdbCRbsqzDYxcrWyLexTRwdzkjkGo4bv7BLclwMV3A=; b=ysXoKbhZ+95RedYhVVP8zJ45N9
	3s0Itady3+tVw7P7MwtybKpL3LO8tfgokNqD56e6KroVMztwF1lZMH8Y6kzSynBrphTpTBV+IYw0k
	1ZCL4NsMLj1nADYxMGvFK7mQHMZu/+sz9OT8Hh9GhFVbnpLHHEpyAQ46yg+6Nz7QFdMATZd1dPW9x
	Sp7sB8kOFSF18SkQsvP0ddKzSB3feyq/soYnFezdmZyDJDN+j20a3EHmGMvrbkN9DetBqlRWQ1cGN
	XL77QV6tqwSpVkjEt0SS3cAXOs7tAM/ahh3f7JdvlNqnYQWOvE+3BjZ+1VrMmlhCgPP26PiZ5ASQD
	XZms2dpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLjV-0000000CFVm-2dJU;
	Thu, 15 Jan 2026 11:41:45 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLjS-0000000CFUK-38y9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:41:45 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-121a0bcd376so2136105c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477302; x=1769082102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAdbCRbsqzDYxcrWyLexTRwdzkjkGo4bv7BLclwMV3A=;
        b=nk5EOfnrdqAMqvmh72+NbpXUxNrrb1PdBWyxvlv+KojZjJ2cKtdl8Nir6nfkWaPp4q
         lxVCbenaKTwSP++TPj9KssDH5bDuSaLbT0Dv55ORPGxJOkvtdQYPtTt2CadZUVlWlV27
         y5AGrw9Xe84xWMyrdXYY/4K8Ib1jj+wjuN3yeHtV9w8t0NHoBJQwdJbFC+V1rEigVAFg
         UnfB1YjCxvKf1o7bbM1nCVCLoX0tmEeRjOEKHvjIK3zTCtjGvQuA1oFxs/ovgr4L79ov
         Rkk9YmbtEX+J9cMC08ZIyL0y+VYj5E/2cZWIia0hQ2Jdt9UcMrCR3u/IxG+ZPV5Y9AI3
         nVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477302; x=1769082102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kAdbCRbsqzDYxcrWyLexTRwdzkjkGo4bv7BLclwMV3A=;
        b=gQ9vVytJIJs/Yr6vGH4aB4WQUw/j1UO+Yqs3gTqgo+ctUcVIg9dp0Z1brXmZpWckno
         SNX03ChoAZz9XEptktisIBjtfDk6qKlsSv/gtPuB9n6v5jkoZKW25ExGt7dFKWN73MbO
         Q53OEEQ29EuN+CAJhyWjmatig1PUvZ7cqPtnThWxbUkIgNhEgK/E3hNklLjQvEQrEeQp
         B+b6kU+n3abfMXyO3kBxszCMap56d7qT22VU2QcpW4dCNSwi9/Udl/CS3FaCflkYSJtS
         9GwD8e8DNX8ysgOyAgGMJAHflrww01jRN6v4e+jVgU0dZsHiQMdskPM1h3A806Ft7LwX
         jXZA==
X-Forwarded-Encrypted: i=1; AJvYcCXqsAMTyNofg90HDzn0fBRzheX3vZGWHBZXcuVTJoukAWse3mX8Ix192S60hJF09meY4RIFdosAPGjCKzBsOdIP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsgq+7wqiqobHhe88rxN1884NYYmiD2x6E72yvG/nBChCNkNiZ
	w5ZSMwyPNVimU366HcJRAFZ/BVPX6uVFbXvk3K6WcGxARds2MwInYZT6hC+xvDxRPtY=
X-Gm-Gg: AY/fxX4M0FcVBQh1MmWt+SDfZttEUTjR2xf+zwYFbwsc6WBWn5Nwsl04to8Q6C2q2fF
	zc9Mm4gC56+eqa09417p1FwqSmwdRQaVY5BGQ5VUlb69gBcB2O++bk6eSlvM00t6pezguoVl9Uv
	zoA+R0N/BYZT1OUJo5aIjn3VH4EEmCxjaGVSi8X+nZl7tPZTzp4UAKxDx2KCa2U9Y+fNjNfYSpM
	/WtML05TXM+hCr4qGBcFAPv2Tru8yPnp9hTZ5jZxVYnJwhVeXql08vk6XIwQv5MdNbJ8J2HShax
	9ICdMn8c8918BthreW4AcU/zFIYtCcDs4uiYM7qI31jwo4BTzMV0YWlQFqlZUyx5lU/q9k4igI0
	36pXu+5PdMvH8Jzp6Tv0eEY87WX7nHKYcbKeaArfqlQiL5D6XtVWI1rjLx6C9Nn7/TNSt9qtGbQ
	44Kj1VcrJuIuWkXHKRi8C9xnpwRpT0iX0CpXbLwQMTnx0aFJ3W/taiZcRQM704jRsXU8KpwY9EP
	gvs/BUk
X-Received: by 2002:a05:7022:f316:b0:11d:f682:e475 with SMTP id a92af1059eb24-12336a8aac3mr6714358c88.40.1768477302029;
        Thu, 15 Jan 2026 03:41:42 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:41 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v5 08/11] arm64: dts: microchip: add LAN969x support
Date: Thu, 15 Jan 2026 12:37:33 +0100
Message-ID: <20260115114021.111324-9-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_034142_806428_6A1FBF02 
X-CRM114-Status: GOOD (  13.36  )
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
---
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
2.52.0


