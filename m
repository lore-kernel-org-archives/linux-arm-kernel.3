Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F644CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 20:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTauSR6H/8NKinLJSb31gMD112liycecOTxKay+MW1Y=; b=dOm7tx9H1Ytkh+MSnIPuF21lR6
	YcxZ+leHbduiqKHzBLXy9iAqLDKVLQrdupLcoTiCsTR4xgy6CUTjCzE8hrOZGd4Prg0ZnED8S/+DU
	AXwb31SQryM0Dwduk8oTHJbYor/Lzf9swaT0m+SPhuamyrve9EzOE8nNLPezwxFJMwNRdS/XM8ac9
	c3y3FboXFI4Tj3WvhYjJo6C5MG1xeMTwcdBWwPdhja9xoYY3M/SzqiOniNkPPbXdRv3FLSqVsEhJL
	QKTFXFF/DJl8cgH0+5Wd55KJn176V8wxBOLnKmfmSTqzqK2ShiHOMIFP2bLRxuaf4ffrwipn9Fwv+
	G/NoLmeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvH6-0000000GoEY-1QL3;
	Sun, 27 Sep 2026 20:15:04 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvH3-0000000Go97-0UkW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 20:15:02 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485ac898fa4so1994091f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540099; x=1791144899; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTauSR6H/8NKinLJSb31gMD112liycecOTxKay+MW1Y=;
        b=BDWysMLa6ZszkFoW/bVYbnhd2ZaO0eF4rz950zRVwGqrYFOxE23e/7fuMgLXKgHJ9H
         3q3WTeSqeYpfafVDAHFRygCzDzjZsseIQ2NHaBNZ60+GviaUHOBHpgG86p4ZgjY841nH
         8mauhxehAJhyQYnQtaW7rHOFk4jewATem2PLJA0A+uwqzCZNT5XIAuXWPa+RkYUyNW/L
         IwDniT+vhJQmE61pquwp6Rjq2S8ywlEHJw8O95KYj5aG3NeDH2kqS1WUqE8gVr/frDrF
         I2Q4uFfeuWX9EVh3EghSMjEf+4r4qeKnQDpvdWxW48I2QJHPTGyQu0VOzhQzgC7Npi4z
         AlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540099; x=1791144899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTauSR6H/8NKinLJSb31gMD112liycecOTxKay+MW1Y=;
        b=DBnTBBt7LUgZPTKQxFgQKdKlcCz2lgNnAQ4KnGz0EsgbsX23vxSNWirCU77Ftln2r3
         e1gAozdK6SZyG3DmL1yF1UqWugtEC7HvoGEinmwp8wnXrmhXqUkFOqzAq+0Y1iE2svrf
         OU3RSCNL6OGDeFYCop/f4Q/RuuopNSQ97jcsueTWZ85JQcAixsVZdpKOAMWw3yA7tOsR
         cQ+9P+RbsnRAz67Wy71aApPZsu4yl0O0itbymfbjj3aWe2/dVgcLB3bK6HlKRcTCFjXl
         xkFGaLrSu6Qkhhrun3mznkCMnPn7HH7ZJcXoEse68R2tVgGg9pHKt6C39GnG6LCYaXij
         +sHA==
X-Forwarded-Encrypted: i=1; AKwUvBwdmRhJ1QebNCeYcAD/mWahxaCXlwvnAzobPZYdPj32CYsLHTDiLyiKFcqABcU2W1wXSJul5w/kRd8/YxLmpK/V@lists.infradead.org
X-Gm-Message-State: AFq9FYIjeKYKZ/EXQLLGYzV9PqcQlPKuLdwoLTZ3U32o5gkls1CbmKJ1
	ijW5E0xnRHKVWqX5WDm0POUrJrVdGGjP7b+mpSeoBpDTBeRnTK+CNjhm
X-Gm-Gg: AYBFou1d9W9DMGp9FnE76LGBPxskOVrJHr13IKkU6Tc1Vsq9F0YNEyvtTBIdARDTg0b
	4d80bcn5Q4qHxfFzzzS71iTukCaitpXWu2VM35ybW9TdKoXuAXhRjD7M+BgaemOAz62uI8HX74q
	wtslNnHvntMkYLWoorrsl0O+PFgyQnHPvyBzkYuM5dyNhE/icBxPLmed7qjKl2Vu83wjr1Gb1ky
	Un7ErN82Np3o6AGPGz5NQqcARrOCpzWSRBoh7TV0txF57IIKu7UWqhCO5d6d6GB3PYqmiLtISHL
	SxaT2Ec7V+VGX7AfYbjbD3h8D6ujpb6YUt9p/DQKtlwpcx8FC8KHvBOLHsNx7XgcSejBXK7JKPR
	Fv6XIyBOjlOeEWhWR4z0ujVRxNwSC514fwHInnrXQdVVw10DEFEGiHquZLFxXPRZKnKvrZnqOsA
	Ebq62krWWcxd346QkVWsZVDrsAsACbKab/T2oh/PO8YGG+WfdE2xz3MLrtlFU0iWNAhugQPAz1M
	AwHJu+h
X-Received: by 2002:a05:6000:2893:b0:487:10a9:57cb with SMTP id ffacd0b85a97d-488719756c5mr18798018f8f.49.1790540099202;
        Sun, 27 Sep 2026 13:14:59 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:58 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:41 +0300
Subject: [PATCH v13 13/13] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-13-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5992;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=nf0EyPFH35tSBIK5oZ5/jJ+smy+BLU/nT0Pmxgc+7L8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj1qMOhF4nhM5GAH4C4zIE2KCnpV3p7yPYxy
 HsWLuBVq++JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJNaRAAi92rO1TFDPk6AfkbezqImo7QQMmSE6G
 xzjgXmYfqzaDzA2JJ2MEt5ITYiH4sslWTHYOvxV8iBS0oaH8J4O5H6+xcPniz3W+snQvwwuz+Yt
 lJqDvK1FyY3Hw/TjoVzVYp+dI1DBj7J9iWFfcy62abwG2+FdE4877GYT88X4gM8LqUZ6goT9y4c
 SFMG3ERQS+PZeBNqDTU3xVZlm46MD6LGvThLvfsEOu6Lr/NKGn5Q4lufzGqnegL5evrbyBrVQWy
 Ggro6IegTW6hARhscDuM5zFxFCeX44v7fJwUFLf/MWk2Q7DVUbkhxtpyyqWWYnCuswA0jilu3XW
 Gh5vHFd1V9VnC7/l9vWCi56t7nnoQpKSfnYoR2q3EeJ1pn4+kO20uIWoy/q044FLzTrLsuM/Jc2
 +oLuGv/kJ0UWvzASZhsQkA9UFeDQ5JIRbKOj2/fFHtMjGAiHztjkrdV/n/UpThoNPHsEG38+Pg/
 SkknToYjaa9dUutBVehuE35RlMFKpxXyUHlvaCqLszJ+p3hC4kj3827Hs13LMFJa+QfqkLLcrjG
 0NcahDzzscsP7c/wSY9/uiLJtg8PsXGjzck854E9fxdxsZvKWAVQQ4GWnQYzi5kVWqlj2ZX4w1c
 l/+S4y5w44rxz8Nd4u4tem251TqfpZuBDEvKzJOadl8pAcn1W8jk=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_131501_308351_9943F20C 
X-CRM114-Status: GOOD (  17.02  )
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

This patch adds DT nodes for the main clock and reset controllers on the
zx297520v3 board. It replaces the temporary placeholder UART clocks with
the proper clocks exported by topcrm and lspcrm.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Version 11: Improved the above the line commit description, removing
references to "previous patches" that won't make sense when reading it
in the kernel commit log.

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
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 101 ++++++++++++++++++++++++++++++----
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
2.55.0


