Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A980C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 22:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzQRA6RSKwvE9p9fmXPG0emKpd/WfAVetFz3/GIIivk=; b=Ctg/kmTTzttyQxnR1BEc3odHcx
	Ay6lQHTzCU39DcK/sxzv/Tem/gFKujN5UrkTzyTPtN+qNUIuhKBfXt4rambYulc57rPNvEoKz/9fC
	ryOEIKQdqrPZhv6V/Cb+cSUJ9Jguc5NJI/+lsW3PkxV2xW11tVtBVyhySbkmzTY6vFxgXshCVE7NK
	xziHEU9QvL+1xfTnZFuDSo0LaJEJLYS+WlGuDhBt6LdlI6LSumhiCaLC0li34Rf6vL2SOOIQr+TnE
	CEBF+GbQseLb1q4cRA07g7Br7VU3IX1NUpFClkV0T/N7L4mL5WDa4lUeMHgGoGSWpo8P2cOTa6Pnl
	xvsSIhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkU8R-00000000h82-1act;
	Thu, 16 Jul 2026 22:00:51 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkU8O-00000000h6X-18NH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 22:00:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47362928f65so6438737f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 15:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784239246; x=1784844046; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WzQRA6RSKwvE9p9fmXPG0emKpd/WfAVetFz3/GIIivk=;
        b=bMoykCWFr1cBAAypbi6NilnoPTD0smPpI508ZLGd6BxCHledtgTN/X13FwNxD6owUn
         qPDWL+HfaIdEO5gc5Pqk++eZOw//BnN7lyMb805Z8EXawGyQeJd6/jS5jYK8SXH05p61
         NhwBlsoAYsKUNXV7VHUFlJwCE8d/NuAPxTG7qX5ZQSqMykysxg7lPsp1FHE221Sm16UV
         KOop7FwV0hD5j1gtLAYmmtHRGOyRBDxW+aVVUe54PPPD2MmrYUhNUK3jRzx+fBDZXNfg
         P/mjGMQiHpQozvN2WcqwsUjq33lhOxjkhMkVobRSwAqyblRKUDfPq4E/AIJ+wkHTKFS/
         AleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784239246; x=1784844046;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzQRA6RSKwvE9p9fmXPG0emKpd/WfAVetFz3/GIIivk=;
        b=ah6jiRVd9B0xB2vRBY/7W7SE5jKums4Zh1g5lcO7Xai4JzQ9bmGebgv7/g6LLk5A3r
         jfI53Jnhm2eNNreZGvzLWlm4oF4eJkOOvZYJMTm+JbDP8v6doPNGDLSavW1eA1YnKq+6
         Sf2GZ+gdvRRC8DFUq7uQ/ooLAdcKMNhc9iYsCjQjPG2O1F1lhAWWGiH+udcWQNh11QbB
         7fNnpZFZacwmxvSVs5uoCpgeur8okawUn0AygtkptFfLvl7A6d0R7aoB0qyoIl4wewbM
         EsMuQ7o2qvV6UpG1Z1rOE2ZFrIuU1iqe2ep8bBXbfgx2Hbe5RyYujCEsasxfXR0Gwqyz
         QjuA==
X-Gm-Message-State: AOJu0YwunL+Gcam28Z4DK8jzA3M+LM+ZKAdsK0SG03qif4MvyMNeMTz5
	V9hGHePBVCJNxc0Ce/pz0I90uYQMMKpJHlUlx4UmmcHFk2u/7M/NW1gN3S4fGFtJlO0IpA==
X-Gm-Gg: AfdE7cmgCf65uAgr35glbmsaoFdDbfYZ6Ya5z8GtnhCJjoTaQMy8p6wSZepNdkdneX2
	DHP85hLdh2Ba8GTVcUriYosuwZlbbc5SmZgx0Q6JS28BT6qnEYT/u7ZaXZShYwr3+qlzHfqVAou
	CfBysMikKozORa1DrzFSzetR31A3E+vTzCHcyt9SSg5R93FwBfsruRRd7mPmIGN0yl28t8MyMk9
	06HAhFWwEFa58RC9a/YXnNWHuZzvWQK7hmDjvZ8OVvpc05SDx5RW3AVdNXYmtciDUUvj1LP8ELj
	BsY//1xD2PLlKXiOuxycrYuRHZ45SMmDTofuzdSR4E5f94SunHw6IU6FBIfnL4u40yM/WS5aH4E
	TInfkTbeyyDnrgP31ho5Lcuq88nVX0n3imBEFzB9TFd9Wndv96omNi76/MGtz3I4BCkXvOcRauE
	l6BF4lhgTK8p1VWw==
X-Received: by 2002:a05:6000:2084:b0:47e:4379:a4fd with SMTP id ffacd0b85a97d-47f6230e6e8mr3191f8f.19.1784239246369;
        Thu, 16 Jul 2026 15:00:46 -0700 (PDT)
Received: from strix.doe.home ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm29949056f8f.18.2026.07.16.15.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:00:45 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 13/13] ARM: dts: zte: Declare zx297520v3 CRM device nodes
Date: Fri, 17 Jul 2026 01:00:11 +0300
Message-ID: <20260717-zx29clk-v7-13-50abfa8dd594@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_150048_345263_50B6893B 
X-CRM114-Status: GOOD (  14.09  )
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
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 92 ++++++++++++++++++++++++++++++++---
 1 file changed, 84 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..b479d097f004 100644
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
+	osc26m: clock-26m {
 		compatible = "fixed-clock";
 		clock-frequency = <26000000>;
+		#clock-cells = <0>;
+	};
+
+	osc32k: clock-32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	timer {
@@ -70,13 +75,82 @@ gic: interrupt-controller@f2000000 {
 			      <0xf2040000 0x20000>;
 		};
 
+		topcrm: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+
+			syscon-reboot {
+				compatible = "syscon-reboot";
+				offset = <0x0>;
+				value = <0x1>;
+				mask = <0x1>;
+			};
+
+			usb-phy@84 {
+				compatible = "zte,zx297520v3-usb-phy";
+				reg = <0x84>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "usb-up", "usb-down", "hsic-up", "hsic-down";
+				resets = <&topcrm ZX297520V3_USB_PHY_RESET>,
+					 <&topcrm ZX297520V3_HSIC_PHY_RESET>;
+				reset-names = "usb", "hsic";
+				#phy-cells = <1>;
+			};
+		};
+
+		matrixcrm: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+				 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+				 <&topcrm ZX297520V3_GPLL_D2>, <&topcrm ZX297520V3_GATED_OSC26M>;
+			clock-names = "osc26m", "osc32k", "mpll", "mpll-d5", "dpll",
+				"gpll", "gpll-d2", "wclk-osc26m";
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
+			clock-names = "mpll-d5", "mpll-d4", "mpll-d6", "mpll-d8", "mpll-d12",
+				      "osc26m", "osc32k", "pclk", "tdm-wclk", "dpll-d4";
+			resets = <&matrixcrm ZX297520V3_LSP_RESET>;
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
 
@@ -85,8 +159,9 @@ uart1: serial@1408000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>, <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -95,8 +170,9 @@ uart2: serial@140d000 {
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
2.54.0

