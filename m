Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCA8C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54y23mxK+nUslXjeRLc03HJMUkg572iXQMInlkBYXW8=; b=e8eAfB7cpDn26jtTZQrvIuVv+R
	Alc6/UNOADa8RgmH2VIRaj5j83dgZBE4lOmAwj3wvrgHSJSTEMLPAXV+poUpJxB893LezNo9wdPjV
	NXjqSQF0iyxyn0hTfB6seEJt2k5eJ76gtVPd1Nh8AVnQGa/Uhjn5rZyHPJItpMiuaCBZIsgyYX5mp
	QusC4vobHM0coDkt0yErtTUrE7kbT/wnoZ/OxRm1msqm49Cid1UAjpN2ZBBUktehjG5ZALH3oQClh
	RuzYHOCzHvLhmcCmrUGQk+PDCUJbfIZDOBTwMHyxfcBpjxn1Kd2WQ4V+Xf4435Is/J7EYMLGyAbas
	kdN3VbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyydd-00000001Vmu-2kip;
	Tue, 25 Aug 2026 21:24:57 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyydV-00000001Vfm-3qf7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:24:52 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so411869a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 14:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693088; x=1788297888; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54y23mxK+nUslXjeRLc03HJMUkg572iXQMInlkBYXW8=;
        b=QSKPLOoAy9PIKpUyK5jyrE2gSNObafJSd8LrX0ajNb3ZNIo9L6sbvM3rSG1pQrp3/5
         ZHUzv/MueeasDD0mA611WdzNJ7p6Wt/LsjclgG5tz0u8MXZFtZbHEuLoFcaMVG0HY070
         e6Nld/2vkYPqQrBfLLsqhZe5TWIGZ7oCWU3DkhFZ09Ra0XFlks2ruw4Hm8eR9Az1Mh8v
         h2DOOyHfi/ha71ka4eKTJXFhcKHLCZKNJA0lK/LyzBsPp61qCIQBhzq5Zd01s1H40keB
         IA+xELYGSvcaMWCasOfAm6xrP2A58ebyB+ylUxNqA9wBJHi+S1rzS97vXGaYwIRf3agn
         UAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693088; x=1788297888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54y23mxK+nUslXjeRLc03HJMUkg572iXQMInlkBYXW8=;
        b=RgXW9ol8Z0RG9+ffmT7WS0RdjkYqMm7QfFBDjmWv9KWdleWiKplS05gJRkKSIBWFvt
         Ps/CMF1uYXlhTea0Knu7sq8JpQa6Wz0q2H4GUR7IkxzLBVs7Apq/Q+qIcCxuEzlKMtW8
         AWwXzxY9pq7TUYxWPbUrndvkZQxetml4sz4y0fxWjlXcuhbupoGcdxbWwZoOc5XP2cnT
         UB4YiuvIpy3c1viZCxjo0+XfoWlVgwow7qVBeJtbhOTHpeWhwNARJwDKv9RGvBZ+xD3+
         jOtpIBefRWGj8i7mEQnks0jRE0SmZ4H3rSylr7u58i3KQNFM046clRJAP8UvRPXz4U5J
         ppOA==
X-Forwarded-Encrypted: i=1; AHgh+RpTTJxsgy0PEDadZWPiIhFrmgbDIwAtcXXy2a4ecnJPjflULs0F/n5Jti0A6d5xi0fWFgYin/RaVQChjUItSd36@lists.infradead.org
X-Gm-Message-State: AFuF++nl8Rc6aQsImWOvX+TVw296c2UvoqndIMXXnx61+MTCyfqCzs9H
	hLFZXvxeWG92x9x8SZzEIibsBUriSWl2YF0ETQ9DkiZ3JZZivqw+nDkO
X-Gm-Gg: AR+sD13NUUI5EBsNGWVBMx9msYCeaZ5N0KpRfl0/cA58PQkrAo8szqxXhoIF4GHENsd
	LTpldB6x7T5VKMzerX6zga+BWEMyolK6MTwSUnYEAqV3L0maE3xZtGgIcE7rin+Q1VfJhgQ7wU2
	Da25u+lNGY0R3RyX/fLRFH0R18ADvLdImUc5umyuQGq3SPXbizoiNkrs6iiVDENALIj5+Hf5eLw
	qSjvJEFhx9abSInZI19jdO6pfvh9N7Ix0/t/t8krPLCbP/u4US7xS+UV60PvdEp7vKagTFfpW6K
	vrz0h92FHH8jBkv6a1YEbeBi97I+OO47uW7cO//qBYuOTlEjhxYsONzJBdaYvGXMa9e7dI1oxmK
	Gc0H1DnXJ7/SczoeuCo5B6Ipi5Np4l9aJEOvWu+tApg6CGrjMgoaUMUCPVdS/m/WHysfPB3LrCy
	wwupdqztlnXHfgTe4sZ2l3hQGzbTXyVonOwvd0BGO4rhvQiFDZTGTJ/VKOP3Pd3ZUgbZRHUw==
X-Received: by 2002:a17:906:eecb:b0:c24:82b9:361c with SMTP id a640c23a62f3a-c250c3935b3mr149671566b.17.1787693087893;
        Tue, 25 Aug 2026 14:24:47 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:24:47 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 26 Aug 2026 00:24:03 +0300
Subject: [PATCH v11 04/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-zx29clk-v11-4-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
In-Reply-To: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
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
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5921;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=E5Alc+/mDwMOmQLSCpdE0r7HEmxSfA7wEQRrzpumkfg=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjggCSgDFlwAO6v+aca7cDP/I7mCJB9DfA7Arv
 191naDiv8yJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4IAhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLg6g//b0A9aN1Xnffa964EHOu7z9yng9YDKmt
 EKXY2SKL848HxXgX+VfcYidDnUYFHrcr1rWbaKVgqdZjQSorMrpsrSlK7FXj8ibsp+SZ9hWPDy2
 3Un0eK5ukH6A7UQosYWIaVodr+UhuXMJDNHGtp4qmwN7Cq3BtAWeaEiWkmmgsiwdzoutoK88Qdd
 Ubc293wZKpwn03xr1No2aOjGMIuN2ckTcLaBuvmbeq6SRMl/pOcKBg5iFSNcdKRVjS55Ahu54Cr
 fYHzbZb14Vfy8iUtopbitSYhJJAhT5rqPsRSSsXpxY/cnk7+k26vKFxgL5zf3EZlnp92So7X4Ho
 9+cQ2TgU7KJXOEBA8MkoTMLQKZQduMtJU/NKijqWJ6K3ZbLBbVOtncevR2jzCicemBktXCdNzg+
 /o8TCvz7Rj3CK/1BRHhfgAl6MLs9CijyiJRUmDV8APOPPHEY1IY5gPa8AY175Na1YYMCUtwLXku
 caz8lPlDCbyao/vRpEYUo9plKGTwS9Hn6jb26d3a1b1nL/obvuUX/3IRzQ3H+dT/cv8r3KDrIFE
 AdHSjkyy7ok2RAzrEXbpJXDXjncIvph176AUPWs7/WCX2FjNlQhc2CLu+xarYDqeHpXQHi6vowJ
 cEYt3JtzrFYI7FHCPcOl3sKf22cZT75+gLFjd69COHyiE+MPSQcc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_142450_016480_CE68B84D 
X-CRM114-Status: GOOD (  17.06  )
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
2.54.0


