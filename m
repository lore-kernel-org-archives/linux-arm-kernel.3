Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18027C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 20:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ve6ycQgrO4HeOCYbZzMNkFtrxZ2ddrP8G6fNlKk1+AU=; b=ykwtXNJlniqVDInQ4oL9dlFbyY
	65kxf4lG8yVFeqY+XMTYGEzsUJ9jduV2dLQ+IHcxKsBEpCiK77iIgAzDi8mwH2gXovpr90NRsFs3w
	GA1n+qf/dXkEUo2mIM13hw2Bw0M87t297jHq4fNs3H1Wstp3oCpIRNjAd84ZqpzgmxJVnIFtPYBXB
	XlQtbUXGnDo3rQp1LyDUy7WAZ2tD31wFY5rmlKaiROb84a8aJz3EnEwhTa6tXVddcTREOa8btWpbD
	+4V+IGAEluTocuwvnMxpwwEKwwH49jHQbt+CzmTF8863nsu6G91+Mqgqd5+OBO1r0ewOUFcDzyT5x
	FPtxdJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvft-0000000DLT6-3JAc;
	Sun, 28 Jun 2026 20:00:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfg-0000000DLEY-2Fs5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 20:00:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493a97fad2fso6750875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676803; x=1783281603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ve6ycQgrO4HeOCYbZzMNkFtrxZ2ddrP8G6fNlKk1+AU=;
        b=N3S/v4ssYKvpW+dPS07algTcl7rftC1PkbcPM7QxLAsZgSIanNPoEkAxltvhbrou6h
         cjW022wDWMvjCaj+eUpywKJt77MEzRutMgq2Pjf5VYhLJojCzSlYo+dTKbPhzBJ47qlS
         kYJOylaM12sCwkTNcLOdRopgL2ABR8wT0O0aqBAMajEmq8oJGZx5uB2SbUKcq7K7SdnI
         BQwfQdOgEAkI1uYkFxpOrWRiXMGJhPAMqi7wllje6l6fasUB5nXrGb0g1qydUGpaSTwL
         bjY8uCc7srO/iIMC6mAyPgqQVdH9T7ZasH45iC/VVOnutpmChs+vBcgSHYEM7DVH9L/w
         X6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676803; x=1783281603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ve6ycQgrO4HeOCYbZzMNkFtrxZ2ddrP8G6fNlKk1+AU=;
        b=rXJcHInGTMw0VNXAWhiUtoi03XbyulJSEy6E4qVm1SjyE6N2Et0w8BBKpfX8w2C58b
         nQdeh7upeg5KD55sxB6s57wTK/EJvilZeff0XCY6qHEEpxgnGmHUORPShY8S4eS/rVCR
         JR8J1nFhm5BoqW+bss7Te892vjhM1earHCMZlW3Cse/vdJNuiXjxSGyUy043nP3AJfxa
         cQ2sWMK+2RkRcUou5pYJqEVQ92SoLyvL68DnfigV1hT/LcAebdQpnqCixg/MMBpflAE7
         +bHgct6/VwbuHG7RMv6WgLgLgPnWiVYR4v3BFZz8lDX/ycqLpz86v2pz0YGAm5EIblH/
         PINQ==
X-Forwarded-Encrypted: i=1; AFNElJ95TU5HPBgPERX8UowqlH8ah1/pm1Vx6IL1TSB8B9ej3nr6ssROJrfiH1oZT6sc6ONP7u/DU8WqExcH35e7Ues9@lists.infradead.org
X-Gm-Message-State: AOJu0YwYaHWr7vLemD8R5X5gJgeVT9jvbPW2kmnODEnQwAj08ut9ybgU
	3QMkO10SRfyRh85QIhGr2V8SC98nyWtuLMooiDtFq6p8xh2EC7JqvODH
X-Gm-Gg: AfdE7ckg+/x8YCVn6OeYKxbsezrapebBqpsmmKCBaHeUKX80sUqEaxn+gAF8sTaW5fi
	hzWvPCOpTu9AxSsGoUmr8o8aAENG5vfXnlx/EQtotP+Y/tZww8pSBqYji4H2ZrmQ3IGd7nxR7S1
	HvAWbEiDh9VvESoFiCaa9f2KfxvVPPeiz0zPpIH5Xkr9n6FjxIvq+lqTAil0DhmRNeOQDJXsmcp
	9wTvIfo9xyVLk/VtiMf9WLADT8Vy3XjI9kQ1bku516WlKK/kaLDDnTtGjKTrUiPj0LX2tvhBqDP
	MzVU8d+r+a05xNyADuiRJ2B8kyP3MoPQhlLD0Bc7k05Evws36GExGeWmcf015OmnQR60z0XBEQb
	+Z/ZWci0/zg/mqe8IuZCwMYwKY96nzKS/axchZH91y6ePeg+gPfDC7Qslmxrz3TvtZ/CdeKxJjW
	ZQK3YcYyibHRQu7j+uMF4qGQg=
X-Received: by 2002:a05:600c:8b13:b0:492:3316:4b34 with SMTP id 5b1f17b1804b1-492668554afmr215573395e9.2.1782676802578;
        Sun, 28 Jun 2026 13:00:02 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 13:00:02 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:59:07 +0300
Subject: [PATCH RFC v5 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-12-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5977;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=yZupSlYaBF96l0nMGSeEbOxCyUX4xyQ8RZvaSmIUkDc=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0UvdGJ9CmBOwRNtJEXpIKLgNC7poT5oFUiI
 TiabV8KmJyJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKArg//RadVWBZNwbVkd4kayIvg35Jj5OC1Z46
 9NEgARBDbpqLs5gvIFJ/5oeQ1YizYlG5T2+Lpf/119n3hkOu/xNxdUFcVyh8m0I5Gh8eANvyLWk
 LIJuoKqMB3rz7MedQg6PVeib2MVcPd7sn803dRraNC2oDfWJVEhSmgQtcfkE8acHrLRVgtuXqtd
 aq9gx4mW1P/SdmhK9iYCjeFELVgSkUxYLqRR4NMni9euhtHBVmdcW9RsvVBwfqzrv95fDK8VsL4
 jwp0lYt/gke+FLxlHuiGnBLv0RgOf1tT6Va039NMHE5yEJsqy63uSzewwjJmmLdL+IKbZttu590
 so5pi2gY/qNK03Fbzw0nkJNbCwGRTqJuo1oO+f6xWirgBxVqOWFel2wHD83YAQuTYMggfvxVEcB
 1JMoj9318cBhF5l4sg8ivsDwS2lFHNWEwTleO0tbavhLs7U/ko95YhKIdR6vfRs9A5A86rH4BFx
 LFJeyWGm/X/zUC8u6mUZAdAwlkolPdEXQg3u1RARIPrtKrfVI9QeCZ6k9xy2/N6nEDpIdI2we5a
 CfcBclpco0eUzWu6cnZRMCt0IhGZp2mCvByTc9OhJTR2KaO2djrK2OC3mGXkG+K/EgZpB9XOOYL
 uILZbq6Yw2Wzm2Z6SR25J6tnW8gaZKSu4mD/hd13rtDmMg6GXSd0=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_130004_668566_1E001CAC 
X-CRM114-Status: GOOD (  13.92  )
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

This makes use of the driver added in the previous patches. It wires up
the uart clocks and resets and allows getting rid of the placeholder
uartclk node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 5:
Re-name from *clk to *crm
Add the syscon-reboot node here because the binding requires it
Re-add accidentally dropped uart2 IRQ
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 97 ++++++++++++++++++++++++++++++++---
 1 file changed, 89 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..2ae6b78bc034 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -4,6 +4,8 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 
 / {
 	#address-cells = <1>;
@@ -20,13 +22,16 @@ cpu@0 {
 		};
 	};
 
-	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
-	 * been added.
-	 */
-	uartclk: uartclk-26000000 {
-		#clock-cells = <0>;
+	osc26m: osc26m {
 		compatible = "fixed-clock";
 		clock-frequency = <26000000>;
+		#clock-cells = <0>;
+	};
+
+	osc32k: osc32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	timer {
@@ -70,13 +75,87 @@ gic: interrupt-controller@f2000000 {
 			      <0xf2040000 0x20000>;
 		};
 
+		topcrm: syscon@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+
+			syscon-reboot {
+				compatible = "syscon-reboot";
+				offset = <0x0>;
+				mask = <0x1>;
+			};
+		};
+
+		matrixcrm: syscon@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D2>,
+				 <&topcrm ZX297520V3_MPLL_D3>, <&topcrm ZX297520V3_MPLL_D4>,
+				 <&topcrm ZX297520V3_MPLL_D5>, <&topcrm ZX297520V3_MPLL_D6>,
+				 <&topcrm ZX297520V3_MPLL_D8>, <&topcrm ZX297520V3_MPLL_D12>,
+				 <&topcrm ZX297520V3_MPLL_D16>, <&topcrm ZX297520V3_MPLL_D26>,
+				 <&topcrm ZX297520V3_UPLL>, <&topcrm ZX297520V3_UPLL_D2>,
+				 <&topcrm ZX297520V3_UPLL_D3>, <&topcrm ZX297520V3_UPLL_D4>,
+				 <&topcrm ZX297520V3_UPLL_D5>, <&topcrm ZX297520V3_UPLL_D6>,
+				 <&topcrm ZX297520V3_UPLL_D8>, <&topcrm ZX297520V3_UPLL_D12>,
+				 <&topcrm ZX297520V3_UPLL_D16>,
+				 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_DPLL_D2>,
+				 <&topcrm ZX297520V3_DPLL_D3>, <&topcrm ZX297520V3_DPLL_D4>,
+				 <&topcrm ZX297520V3_DPLL_D5>, <&topcrm ZX297520V3_DPLL_D6>,
+				 <&topcrm ZX297520V3_DPLL_D8>, <&topcrm ZX297520V3_DPLL_D12>,
+				 <&topcrm ZX297520V3_DPLL_D16>,
+				 <&topcrm ZX297520V3_GPLL>, <&topcrm ZX297520V3_GPLL_D2>,
+				 <&topcrm ZX297520V3_GPLL_D3>, <&topcrm ZX297520V3_GPLL_D4>,
+				 <&topcrm ZX297520V3_GPLL_D5>, <&topcrm ZX297520V3_GPLL_D6>,
+				 <&topcrm ZX297520V3_GPLL_D8>, <&topcrm ZX297520V3_GPLL_D12>,
+				 <&topcrm ZX297520V3_GPLL_D16>;
+			clock-names = "osc26m", "osc32k", "mpll", "mpll_d2", "mpll_d3", "mpll_d4",
+				      "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12", "mpll_d16",
+				      "mpll_d26", "upll", "upll_d2", "upll_d3", "upll_d4",
+				      "upll_d5", "upll_d6", "upll_d8", "upll_d12", "upll_d16",
+				      "dpll", "dpll_d2", "dpll_d3", "dpll_d4", "dpll_d5", "dpll_d6",
+				      "dpll_d8", "dpll_d12", "dpll_d16", "gpll", "gpll_d2",
+				      "gpll_d3", "gpll_d4", "gpll_d5", "gpll_d6", "gpll_d8",
+				      "gpll_d12", "gpll_d16";
+			#clock-cells = <1>;
+			#hwlock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		lspcrm: clock-controller@1400000 {
+			compatible = "zte,zx297520v3-lspcrm";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+
+			clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_PCLK>,
+				 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+			clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+				      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+		};
+
+
 		uart0: serial@131000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topcrm ZX297520V3_UART0_WCLK>, <&topcrm ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topcrm ZX297520V3_UART0_RESET>;
 			status = "disabled";
 		};
 
@@ -85,8 +164,9 @@ uart1: serial@1408000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>, <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -95,8 +175,9 @@ uart2: serial@140d000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART2_WCLK>, <&lspcrm ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART2_RESET>;
 			status = "disabled";
 		};
 	};

-- 
2.53.0


