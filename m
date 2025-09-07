Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E46FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 21:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyVOX8CJP4Eun9xgsiaMmHggIf4GghGZrP5jblZ9w+E=; b=vvs76/eaEfndvvG3g2HVWzHIRO
	0FsKaDOkvVIRNOpzcnJXvCn4U0/zz8xuVEEBo0+xvhi9EBPrQPGhiD2bfVMl+wcIYrQaRFMhfBj/X
	C5tNIwNPpGGgbW1A67UPLx3cfdcKIO1SZsXsZQn0uPKQNMWtdEiUxKNBwh59ZFZ0cLELSJuP5PDDJ
	KsiQdWE6kdegC2l24Z4LbYFfa4f2s0QQh7QPcbHA6ASuOdkV9eZxgDlPtQohf9JtDWVz7L/pbLDvU
	Qkh4cZdLw/ARCsPP8Y31zCNCl4w3k58W+QU67Vaz+0AgHwYkbVqbxGMWWBn02WfepGhxvTHhYUad2
	W1WwpwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNL4-0000000D1Ie-1d5Q;
	Sun, 07 Sep 2025 21:54:22 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvN1d-0000000Cw2o-0hh6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 21:34:18 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4b490287648so67212741cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280856; x=1757885656; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyVOX8CJP4Eun9xgsiaMmHggIf4GghGZrP5jblZ9w+E=;
        b=iT53e2tBsH4rq+e79EF4uLIZ9JrD4mC8S8Yw9bdKJtOhty7rxFmjBud1JFRWYQdSYL
         acDI9aW4MyOp+0wLA1pf824q2eWrpRtI3mzIkzvJLuPEvPznTZCbwBwIJNNnJk378NKe
         16/4upLJNVMU1rBCQBXhfBVnPKCxcTyYbWzptC2IZzj/YsMycM2qJfWHdzUCKypMvNY2
         S5eGZDjyYQijIiADMk01FggMxYVKf2CezaCZ68qrzk24oKlX6NMLCclxCUSRbiFbfn0i
         VeEOLkpdhK0PXr6ie6SfwhCt8/gB27LCUUbZzRSmAv30cLsHcxDlUg6E+2cgTxd3OxUY
         jP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280856; x=1757885656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyVOX8CJP4Eun9xgsiaMmHggIf4GghGZrP5jblZ9w+E=;
        b=I4984LULzA3SHZMJfChGsQf73gdQ8OFpnJx+vU/QTfgfpBMEKCMmRkJds47Ig/t9XJ
         2iJ9JHO1g9eLPtoKrrwGMmOu8Xf0xPpAlHEBaIqNA+MNAEndPhpu1JRlwwK5KXOBtOeU
         ki9u2n/NHP6TcuPtbQkKgajZ/BE4uWDV5sra6jFLO3XwWD9p+Q2zKKY1Ihck/iKJv8iy
         GYef/re2N/mZytBp+4AyckkNYJHaUzLK24R9DZ+By5aCaOBO0NiefeCYVarRTTKU8Q2S
         fl/4bJuTlFSb683HRbidaZA4MQ4TazsACIeWiENETykmeHiKsUC0vhwsvOntdjpwpAIG
         AhrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Sol4Nv2GkiToDDH1oMVLtlL4kEjkLXUznxVRxh+TCMGFY1bKqnb43awdDFAQdghBwAgOP9hNpCJITW5AENWT@lists.infradead.org
X-Gm-Message-State: AOJu0YyPDnofAgc+9aoGgDxNckyAFdyxqzS5llRXLDgQWjTHLL13A4f1
	OK/dh4cUEy6d1TEOy2hsU+qlw/q3Y67bJVZ4eAeH3MYD++rWvND2YRmW
X-Gm-Gg: ASbGnct5IAfnfG7cGtmPhMUyyVrO/N9LaFjtzaiVEizQATcKXRuzyI1LyUagFy1iOou
	gg6gonTEfYDAgldh65gYOLSW4pg/kJTZpW8xUkWhPnDLceBImy9glJ6dz0jBwqZ2un0ljzXKpDx
	Zs/kMsyBdjgCrjooew7Rgz4qUC5FDfXMWZVcbFZ56pQC2qZ+dogHZ4+onwLuVLSbc3VMjga/ec/
	bAO/mqgk4LHHB1sU3h1dDsdgHE+IlpWjF3WQhvDQS4BY7Vg2jg9N6UZSl1p7sD/L0A5OJcjBNvz
	FXyuOQFKw9ghTsnovENgX7DzUkOYhxOCefO+7GWT4AITSaR0qMbO9PKbNyxEEJqMJsxwMg9kJLQ
	QRRVfLApmwAyNX2euJiiMZT7rEdoIRfVSbB48MkMmqw==
X-Google-Smtp-Source: AGHT+IE4N7nERDotWbpEG9IzsUbPV604Io0BD6zXS+NeYalVk+nzUifOQueoj/o7DgMydYrVBp4Giw==
X-Received: by 2002:a05:622a:1889:b0:4b4:8e48:a5c6 with SMTP id d75a77b69052e-4b5f8385b09mr59619771cf.17.1757280855807;
        Sun, 07 Sep 2025 14:34:15 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:15 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:34:02 +0000
Subject: [PATCH 6/8] arm64: dts: exynos990: Add UART nodes for PERIC0/1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-6-ae7600491a7f@gmail.com>
References: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=16399;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=3bBGb1Uw5JyU4dqixqHPyEJIUTJ5hlH58JpQhavAGcY=;
 b=C0b1ngz9ndij6dwMCxN1gupLHtVzA15vG4+ZHPG7a5HvCehdIlkJV9N4/0zqgpZAH8KQV0AGJ
 55Met+CYBZbBkKWJSIO0YE6xU5UG9uKlnT42knfV4mIm+KqIFqedJEs
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_143417_239219_6B9B7347 
X-CRM114-Status: GOOD (  11.68  )
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


