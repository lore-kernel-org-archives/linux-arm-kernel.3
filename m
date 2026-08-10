Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2DDC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 07:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFqgR5GSvMOEuQrtPZNNyIXv51CHwIdUk1flHNLoxSo=; b=Mrq8bhgvx8yUwWSW0wmEZ6YOYH
	Eav5kETBVbR1A+WN6gtNg1+YLOMKO3lzDuEuy5gmT6RqZJM1rBSBZQcBaE+hKJOaVfUOxJJ7ZIsl5
	jv6Fcn0GZlfd3+e7Gwp386MDh52DA/30X75R1z1aFGxwiLn8edLR0rSb2yUOTKNjNk5lmaz+Tnuep
	k06gGaeJoObr+7eOP5D5xqH86xnR9tESaf4YTLwUrwdZloxJu0iXruFE/edyxS9RcO8GXPjC8qkKI
	9wfgzX1p4n8yFusujdRapRWLfYg+TEZ1LsIrGAt7rLUO3bno6ojjWBSuQj0te1h3UBlAMzOnK30dy
	91bzkvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtK2f-0000000BAQy-3cg7;
	Mon, 10 Aug 2026 07:03:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtK2c-0000000BAPO-0sAA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 07:03:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so21642875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 00:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345400; x=1786950200; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UFqgR5GSvMOEuQrtPZNNyIXv51CHwIdUk1flHNLoxSo=;
        b=lmdywwCS6Z19LYZdooUJM9mHUJ+a4FL1qmiuQX4ceoZYUMXK1cM4P0iIMggprXHwTK
         oBNOv0TPjpw+LLVJAHq4eOhxivJEJjKvr0v88UGN47PRwBusWS/ybpWbnzyIwP8bnUxo
         d62oCKOygqYV85H0900dBqOg0B2zgBUmRwROdQowBv8nzGKfYZi2fmBqsr764f409pW1
         J0uAki/HutK26IyeE9KvowuYoGHudNvezR++0Av4E42QRonpXF0x5/8TDgPr1wUBOO0I
         4gAN32bMAEaeF6Vm41Qqt2rdm1Z9NBqNRJsUiZIOty3XS5tpBHM1sK1WrTjD36LHK7jO
         EWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345400; x=1786950200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFqgR5GSvMOEuQrtPZNNyIXv51CHwIdUk1flHNLoxSo=;
        b=rhLoR/gxF/A6WJVOpeXHqaMb9zx7cwJngiwTuTXuVyB5+x++iUC6thA/okik1lRUk5
         v+PsNLlaPWOGy1+5aaoI8koOJb9LGLWDkXAb0PkHChhEzAt3zm7lkpzXkyFB4nckdmhx
         d588Zc4I2tUMDS3dBjhdazI3LD4p8ql1hxd77bPJbPGjXNIkT2++snY5xntYOMM5r5w1
         D1rwUJo9OxUOVsKx4hVUEjH1QaCpe7e78lbbmdSYei3QBmp/GTeqHSUvfn5fFEqnHMyH
         1oKcdG4oiUacG2Zz3fpkuSwdXMyR9R7D8UWsZFCB9dpkBXwsKmZ4SCXOTszKrTEZELog
         5WSA==
X-Forwarded-Encrypted: i=1; AHgh+RqGy9NHqqxp5y5Mn94yj47LICabeO56v+zoS2gRjJ3Fh1pJ6C29KnkR1QgdykFV1HtfHIV8KK8z0he1HyzUQnL8@lists.infradead.org
X-Gm-Message-State: AOJu0YwWjepEarozLw1kN0ATjt/81cgZyGG3oNLQwUClOThhTc6K+1ad
	dk6CRiPQl1YcJkDYZ8SmwXKIQ5MNEmhu6p9i4sRycqj7T7K3sGlup3I9
X-Gm-Gg: AR+sD12G8ukoepZNHTS7qIPwxfKPuO2sD8zczXkdSsEBqjRQ/I838xjb+4mF1AC/UOI
	+nfCH7NshuRt1QvyLsYli3V0XAcxCbnRJuP9m6RS98OF6x3Pd8m2pbjCP8AxVMzegNdh2dtctzW
	lgMz6polZBCu+aEIMn4AG7inZc4z1Jh2BxVCZ7ViS/cIOwsZJ/XlybqokWjg5uP2XP1Jgz5k6KZ
	fvJx8lThts94EZwkMI5sAMHEQY4zUGAxFf8/3Z2DkYdPKdHjnokCX9AzGe7tSJ/5ozGCc0WF3iR
	2M0uI598dOlUvVhgsI/OLjEH2WjXm9pqsobAdMTapByb43HSG98SxwsqcUpo4jluN+fmcE1LboB
	MUuweLw3kKSQ4k71cGaw3Hjyxk1cEPhfs11se+YSF0rCSEXnegsIoK+b/W8Ygq+0bQqSjl39U6u
	F7qCPGMw7kydiwdii9LoRZq+LINIdUZ1wwfo9qY5rCmyCFoY+4LJW5al9zsBeFxGG5fsan6v083
	y1o8So9rvk=
X-Received: by 2002:a05:600c:3b20:b0:499:4893:97d3 with SMTP id 5b1f17b1804b1-4994e7cb8ebmr498120745e9.13.1786345400094;
        Mon, 10 Aug 2026 00:03:20 -0700 (PDT)
Received: from strix.doe.home ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800215078asm30548038f8f.12.2026.08.10.00.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 00:03:19 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	bmasney@redhat.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	linux@armlinux.org.uk,
	lee@kernel.org
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	mfd@lists.linux.dev
Subject: [PATCH v10 12/12] ARM: dts: zte: Declare zx297520v3 CRM device nodes
Date: Mon, 10 Aug 2026 10:03:10 +0300
Message-ID: <20260810070311.1110849-1-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_000322_272861_8F2FD0C2 
X-CRM114-Status: GOOD (  15.70  )
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

Version 10: Fix issues with dt-check-style --mode=strict in newly added
code, but left issues in existing nodes alone.

Version 9:
Sort new nodes by mmio address
rename syscon-reboot to "reboot"
adjust to changes in bindings

Version 7:
Add phy nodes to topcrm
Remove syscon from matrixclk again
Adapt remove now-removed extra clk inputs from matrix
Add reset to LSP
osc26m -> clock-26m for the fixed rate clocks, likewise for 32k

Version 6:
Add syscon to matrixclk

Version 5:
Re-name from *clk to *crm
Add the syscon-reboot node here because the binding requires it
Re-add accidentally dropped uart2 IRQ
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 101 +++++++++++++++++++++++---
 1 file changed, 89 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..ebac3cd137df 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -3,12 +3,26 @@
  * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
  */
 
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
 
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	osc26m: clock-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	osc32k: clock-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -20,15 +34,6 @@ cpu@0 {
 		};
 	};
 
-	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
-	 * been added.
-	 */
-	uartclk: uartclk-26000000 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <26000000>;
-	};
-
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
@@ -75,18 +80,87 @@ uart0: serial@131000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topcrm ZX297520V3_UART0_WCLK>,
+				 <&topcrm ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topcrm ZX297520V3_UART0_RESET>;
+
 			status = "disabled";
 		};
 
+		topcrm: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			#clock-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+			interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-up", "usb-down",
+					  "hsic-up", "hsic-down";
+			#phy-cells = <1>;
+			#reset-cells = <1>;
+
+			reboot {
+				compatible = "syscon-reboot";
+				mask = <0x1>;
+				offset = <0x0>;
+				value = <0x1>;
+			};
+		};
+
+		matrixcrm: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			#clock-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topcrm ZX297520V3_AHB_PCLK>,
+				 <&topcrm ZX297520V3_MPLL>,
+				 <&topcrm ZX297520V3_MPLL_D5>,
+				 <&topcrm ZX297520V3_DPLL>,
+				 <&topcrm ZX297520V3_GPLL>,
+				 <&topcrm ZX297520V3_GPLL_D2>,
+				 <&topcrm ZX297520V3_GATED_OSC26M>;
+			clock-names = "osc26m", "osc32k", "ahb", "mpll",
+				      "mpll-d5", "dpll", "gpll", "gpll-d2",
+				      "wclk-osc26m";
+			#hwlock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		lspcrm: clock-controller@1400000 {
+			compatible = "zte,zx297520v3-lspcrm";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
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
+			clock-names = "mpll-d5", "mpll-d4", "mpll-d6",
+				      "mpll-d8", "mpll-d12", "osc26m", "osc32k",
+				      "pclk", "tdm-wclk", "dpll-d4";
+			#reset-cells = <1>;
+			resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+		};
+
 		uart1: serial@1408000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>,
+				 <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
+
 			status = "disabled";
 		};
 
@@ -95,8 +169,11 @@ uart2: serial@140d000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART2_WCLK>,
+				 <&lspcrm ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART2_RESET>;
+
 			status = "disabled";
 		};
 	};
-- 
2.54.0


