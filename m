Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CC8CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 22:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyVOX8CJP4Eun9xgsiaMmHggIf4GghGZrP5jblZ9w+E=; b=TKXNM6Y8DLIgmVbAeDRK/cBlOr
	ZaF4ohku51IwQQk7E4gvBk62L7LBgy74/ffIWPWfxM84LqASfP+8RtvFrrYUgirFX2hk0ndd/bNYl
	aW9ya2T+l68Iepfzu0mSffyP7QQqfU896s8DcRDW6eDdlAyNat2wI9QsQb9Tz7Sxk+GOPkc4WtKAC
	KTgE9kI3mogtNgDvRcy8aGfKaXw9Z7O9wYjOfsY8rbRSEquUL59YYpvUJ2NIYzvpXpxUTXDHZ2Dmz
	+RAIZeUncolE8q9Fge6+oLAQAE+6I7QCUfeXZ8y00fqB5upai6OoK5PZ4KagwnhaU3TkFY6txu+Ns
	RTMXZWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNx8-0000000DAS9-2PBr;
	Sun, 07 Sep 2025 22:33:42 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNdj-0000000D5ge-3Ozm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 22:13:40 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-80bdff6d1e4so404954785a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 15:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283219; x=1757888019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyVOX8CJP4Eun9xgsiaMmHggIf4GghGZrP5jblZ9w+E=;
        b=P1DmOWJjpfOB0mRxrKzWWWeQW9eNprrP50eDnJqnVsZQbgW4ZNwkhKCh//OAT8RKX+
         ScrbZQ/Paqow+tnDfQOI7Pgf5mo8umDFRqjg7zEQYVmf4KAda0Ddu56KEBpQnb5WY/Qq
         9Ca4+O8oVJ79UzNtbHSl/QdRHE2vOXPNZqmn1IAHBvpwmn6FZI6qFOlbqqm2BuFi7fpn
         3aej7V8DDl6H48psdpAShoAT72AUaJySIRI2fv8mgp3B4IY9ExggGa/N8ivXZ6C4GzWM
         T2SsRpAU+9hYj2gkswSpGPQoVnuI2UXG2nHEnGHzK259PVtrbhCTaSv6J976KLP9eUAl
         8CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283219; x=1757888019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyVOX8CJP4Eun9xgsiaMmHggIf4GghGZrP5jblZ9w+E=;
        b=jYsbx0iwZl0hpB8YixDH8c3aauongp9uhxPkjQV+CKZ6A9Y1KdAHbyDegzfJwxrTYE
         53Ebv60oG+FApF5ogzsoDa4mj5lS7or/oxT8pBluFOdZTs2ZVKOczNMXV7yRo3OLMVur
         VwB2KdQCmCidS12Bup3kU05Sj+vtFQrp4ivbCw/Icof+3kflUi1MNMc7KuxN7ydYOEqy
         w2m/I+48i64Aiwka+sKlyTHjHfj10dynz/t00Tc2aL1Zx8PHVR2172FICxvpQujYnw/5
         KQLy2I2KrMp5aueRS3Ha2+jwPWzKDKH+69qZCiGwxijmb64yAmRQFIwXdLEE8galHBNb
         HKZg==
X-Forwarded-Encrypted: i=1; AJvYcCVjGNtEDIcKTkulFGXsMOkCejKkARILuiOHSDFYejTamRoXji321ryA5iI4O1eRs//174L3hFPSCJP+E2UoiHJX@lists.infradead.org
X-Gm-Message-State: AOJu0YwzEO6M3gD3hK78ve7aVy1JVp2quEsvsVkxoBKg+nAWNeLTNmG4
	h9DwUKlTlP6JPZ7nFJpMRvRCvg47Qr0k9E3b31M6Vp0i+Y5oyZlYq/TKAt+f5JEK
X-Gm-Gg: ASbGncu6NO4bTh/dMnRyDARytWkzW4ysfg6DLXhGPcuGa2Jy8wmhLBBfzOvEMuZ+Hex
	u5LmLLuCuBL8sPlYY3TIcNgbTMhOM2vs5s7P9V/5jR1T9K6APw0Yr+/nSiQjrUpfMJmAC8DmXr0
	FlBKljdxfWgjqq28z/w1JmN2BIMr8+jXUPMfetNnZ97dyyYbcT6JlHaFhGrgt8j6JTCjVYM5mNx
	SiQVUSzo6Y85q7TJMMnxpdZ4gNi44+rZxqtGYbeIczLAeyxgImGOhrQh7JCCU2lSOCPcRW9iEkb
	S40tPmjl6rwcxyiBYMysFQugLDgYN+mVxmsaq33MER6qwesW0boyG37fp/RqptaRDotGtJxLj2m
	WTl0ZexxpPpfHRhFxepNecUu6cI8ERJY9YiWXkFKR0A==
X-Google-Smtp-Source: AGHT+IGJjceQ22s7wNc/C5xHBBPPOUYOWOo3wFP5hZzlfEo1KqEMO475ZZ3vr9XCh8QLn7dzHgP/vQ==
X-Received: by 2002:a05:620a:4156:b0:806:9c53:d6ce with SMTP id af79cd13be357-813c07367cdmr608386785a.23.1757283218607;
        Sun, 07 Sep 2025 15:13:38 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:38 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:37 +0000
Subject: [PATCH v2 6/8] arm64: dts: exynos990: Add UART nodes for PERIC0/1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-6-58f41796d2d3@gmail.com>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=16399;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=3bBGb1Uw5JyU4dqixqHPyEJIUTJ5hlH58JpQhavAGcY=;
 b=mrE78bquDGC4VQIyyePsEEmx/mo34RKBikrtvdf1po7HROXKejgpnmBFb+1m1Haj2BUfACWuW
 hI1Bc00KWNZCBALX4S8Yen1UUWYLPerWBN/ptMKPsKFlaVg+5u+O0oD
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_151339_848391_93126BE8 
X-CRM114-Status: GOOD (  11.54  )
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

Add UART serial nodes for the PERIC0 and PERIC1 blocks.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 323 ++++++++++++++++++++++++++++++
 1 file changed, 323 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 1e09f3efe685748789ffd346cd914f9a8ba68f8b..de9cf9b2d1b28a62519d95549d04458c6e4fe16d 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/clock/samsung,exynos990.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/samsung,exynos-usi.h>
 
 / {
 	compatible = "samsung,exynos990";
@@ -272,6 +273,34 @@ pinctrl_peric0: pinctrl@10430000 {
 			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usi_uart: usi@105400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105400c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1000>;
+			samsung,mode = <USI_MODE_UART>;
+			status = "disabled";
+
+			serial_0: serial@10540000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10540000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart0_bus>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+		};
+
 		usi0: usi@105500c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x105500c0 0x20>;
@@ -283,6 +312,20 @@ usi0: usi@105500c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1004>;
 			status = "disabled";
+
+			serial_2: serial@10550000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10550000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_5>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart2_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi1: usi@105700c0 {
@@ -296,6 +339,20 @@ usi1: usi@105700c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x100c>;
 			status = "disabled";
+
+			serial_3: serial@10570000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10570000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_7>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart3_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi2: usi@105900c0 {
@@ -309,6 +366,20 @@ usi2: usi@105900c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1014>;
 			status = "disabled";
+
+			serial_4: serial@10590000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10590000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_9>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_9>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart4_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi3: usi@105b00c0 {
@@ -322,6 +393,20 @@ usi3: usi@105b00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x101c>;
 			status = "disabled";
+
+			serial_5: serial@105b0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x105b0000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_11>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_11>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart5_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi4: usi@105d00c0 {
@@ -335,6 +420,20 @@ usi4: usi@105d00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1024>;
 			status = "disabled";
+
+			serial_6: serial@105d0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x105d0000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_13>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_13>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart6_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi5: usi@105f00c0 {
@@ -348,6 +447,20 @@ usi5: usi@105f00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x102c>;
 			status = "disabled";
+
+			serial_7: serial@105f0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x105f0000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_15>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_15>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart7_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi13: usi@106300c0 {
@@ -361,6 +474,20 @@ usi13: usi@106300c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x103c>;
 			status = "disabled";
+
+			serial_15: serial@10630000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10630000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_3>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_3>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart15_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi14: usi@106500c0 {
@@ -374,6 +501,20 @@ usi14: usi@106500c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1044>;
 			status = "disabled";
+
+			serial_16: serial@10650000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10650000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_5>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart16_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled"
+			};
 		};
 
 		usi15: usi@106700c0 {
@@ -387,6 +528,20 @@ usi15: usi@106700c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x104c>;
 			status = "disabled";
+
+			serial_17: serial@10670000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10670000 0xc0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_7>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart17_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		cmu_peric1: clock-controller@10700000 {
@@ -412,6 +567,34 @@ pinctrl_peric1: pinctrl@10730000 {
 			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usi_bt_uart: usi@108400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108400c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_4>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1000>;
+			samsung,mode = <USI_MODE_UART>;
+			status = "disabled";
+
+			serial_1: serial@10840000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10840000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart1_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+		};
+
 		usi6: usi@108a00c0 {
 			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
 			reg = <0x108a00c0 0x20>;
@@ -423,6 +606,20 @@ usi6: usi@108a00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1018>;
 			status = "disabled";
+
+			serial_8: serial@108a0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x108a0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_10>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart8_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi7: usi@108c00c0 {
@@ -436,6 +633,20 @@ usi7: usi@108c00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1020>;
 			status = "disabled";
+
+			serial_9: serial@108c0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x108c0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_12>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart9_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi8: usi@108e00c0 {
@@ -449,6 +660,20 @@ usi8: usi@108e00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1028>;
 			status = "disabled";
+
+			serial_10: serial@108e0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x108e0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart10_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
 		};
 
 		usi9: usi@109000c0 {
@@ -462,6 +687,20 @@ usi9: usi@109000c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1030>;
 			status = "disabled";
+
+			serial_11: serial@10900000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10900000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_0>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_0>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart11_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
 		};
 
 		usi10: usi@109200c0 {
@@ -475,6 +714,20 @@ usi10: usi@109200c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1038>;
 			status = "disabled";
+
+			serial_12: serial@10920000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10920000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_2>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart12_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
 		};
 
 		usi11: usi@109400c0 {
@@ -488,6 +741,20 @@ usi11: usi@109400c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1040>;
 			status = "disabled";
+
+			serial_13: serial@10940000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10940000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart13_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi12: usi@109c00c0 {
@@ -501,6 +768,20 @@ usi12: usi@109c00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x2000>;
 			status = "disabled";
+
+			serial_14: serial@109c0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x109c0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_12>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_12>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart14_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi16: usi@109600c0 {
@@ -514,6 +795,20 @@ usi16: usi@109600c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1048>;
 			status = "disabled";
+
+			serial_18: serial@10960000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10960000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_6>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart18_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi17: usi@109900c0 {
@@ -527,6 +822,20 @@ usi17: usi@109900c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1050>;
 			status = "disabled";
+
+			serial_19: serial@10990000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x10990000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_9>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_9>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart19_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		usi18: usi@109e00c0 {
@@ -540,6 +849,20 @@ usi18: usi@109e00c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x2008>;
 			status = "disabled";
+
+			serial_20: serial@109e0000 {
+				compatible = "samsung,exynos990-uart",
+					     "samsung,exynos8895-uart";
+				reg = <0x109e0000 0xc0>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_14>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_14>;
+				clock-names = "uart", "clk_uart_baud0";
+				interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&uart20_bus_single>;
+				pinctrl-names = "default";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
 		};
 
 		cmu_hsi0: clock-controller@10a00000 {

-- 
2.50.1


