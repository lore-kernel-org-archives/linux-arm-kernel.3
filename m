Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BA2C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 20:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvzEYaG5KL1DCfKUfT9u24qjpaGL2kBtVkoPG7vk0nE=; b=1EnK/G9NtwOOMdzKiiI6hBFzDz
	LjHh9ywqhDCVcNvMDh7aUXWnyRD0z+52aiiZWyNOW1O5Wss1pl7Che6p4GJk65m93UjCmi1VDsrOH
	xLhx265wSUpTliqDvh1LFOLdCExP2CWfTfjwNPEI1St6yvxRWZoh/ykBF4AclJCvF+Tcwhj5IpRVJ
	tm3MrpQDirS/HK4YLV4jag3u3ndfx8huc/sArZaRPRISsGHDQQqA7H8O57945e6Fvf2BFRhf8B8qh
	Xwj6g6dbHjfbUXiAyYHRskXEbIJD5EKksEZwFihc1Ho1qS/Gin5tU2NLaYANwtR/+5HCFHNzxPEJv
	DwSWWJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqctr-0000000G2Iq-40Yu;
	Sun, 02 Aug 2026 20:35:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqcto-0000000G2CB-0qH7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 20:35:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-495437bb891so10672785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 13:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702906; x=1786307706; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvzEYaG5KL1DCfKUfT9u24qjpaGL2kBtVkoPG7vk0nE=;
        b=jANZydmyjVG5131o6v/OhVNBAZTq5eH/FvJSFHwcSrS+dVJo/2AojvSmchYWxEQqag
         8lgUkqV7hgqvguhmFZXV3T6Vp4dSFt44ja08sXAKKdZznkndop/P2jh2Pz/84ChWJJ5H
         jrtLsgxw/uM0jXFf8ow8VnYSjqpkpxwgrZFy4oJ2CZQ+TGOY0B5Q+Ix4hgcHZ7ePPQ7W
         fuJ3phuHsmgYDYug0juBXNi9VOrn5nJZGoYSzhD8TkmCGrt5HEE6TSepQksmz3nu9b33
         REeaIFmxZIHxun1mOggSR+4/v23AkdGvkoD9PtF/ngeNxrivt5v+Ps3mjiK4syYXHRez
         82xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702906; x=1786307706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvzEYaG5KL1DCfKUfT9u24qjpaGL2kBtVkoPG7vk0nE=;
        b=COWBBaM3/9IhNz+2DQgn9WA3bh4qeyD7SZMJv4WnOQ9lrKM9pzbvd7Td2FlQ8/9Dw1
         IDSRcFgOariIzxD3e94xA2t8cLA2OQFs/xEd7N3kZ9Dc2AzslS2DjZNt+CIozvDoPuHB
         vvQuniGWmkhcJ+bCA1Ncv7IHQCi2yn03iBUKxvivA9WgQdYkavS5ln2m4A/Dua7Si46D
         6lQEXwssbHWDQo14W5XZZrjBDjW0W+iCBtB3R7HLyfLBRNwDPEfaSZExLOnFMRGXEj1m
         4xH35PntD5+9TwZ/exiN3D6lW+t0TxqVlbRyz4D8ku8meRbduzGbIx81dvmO190NJodo
         pT3A==
X-Forwarded-Encrypted: i=1; AHgh+RrfiTCHhRBSesbMe/8/VX8wEQ1zB9ogONUDvJo/JxulA0rceXbIN2zsVNKcz0hy1YsJ5KFxfFOpldnGW4ITBRsD@lists.infradead.org
X-Gm-Message-State: AOJu0YwXpQluzYYGGpO384qL1G2+4w7MEiedgg8eRphePxfCS2UoG7+E
	1Msmr09C7+2rkgLPv3N9BCCtIxOH1bHVYJ4SKEcZFdKkkMDrGVrI3V/W
X-Gm-Gg: AR+sD121VZOnUmy32ORAWjCry9Dm9AjYG1QOzZqIX3JJ3wFFMkP4wEDcc/74SiC39um
	pK65+LLirAVOIw7JH6TGYqZHJr827fG4yOIjnc6OZWlLm4tgDB64efChKoZO3Urrs1Q6swU/2pV
	2TYFSj9e/yaAhJ1nQPqnKVmrdK6lPQrFEB3cjNbGXQ2cEWkq50sBenrVXZDef2n28uN2M+mccCm
	ObM4P3IFhawl6GLop1lkWfnIIUJNWqKJOK0IwaJDchXVqW3Jzb9vNOldMN+hrhEDXHEgcwP8fZV
	OHQve1YaGJnIFC2gur2LDH5N6Wivyc5aE+jvOENd8QOFW5zTOm2wqJOg5crfgJzPIfKDNfRrQzk
	FAKVQocolJ86jlbFiHQitECVdOrt/lf6GGIN4LOTem81FokdQM4fqrJWzmtOjO1chmgggHajcrt
	Icay8d2k+UoOdNl/A6LKdklLNK9iwWJovaqVsKECGkwYUgm5DzYZa8uKFnDHo+N4urCWIPKA45
X-Received: by 2002:a05:600c:6298:b0:497:ff5a:38b9 with SMTP id 5b1f17b1804b1-4980ebc216amr136052085e9.9.1785702906383;
        Sun, 02 Aug 2026 13:35:06 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:35:05 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:44 +0300
Subject: [PATCH v9 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-12-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5251;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=IpNPrcYTLAqFJmETJtmAVtdcREnzQQbvbMDwDDk/4OY=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6my4F5YNtlLMJvdd9J/r91nVBhltsGymwrZK
 o2xEn0+CvKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIWmBAApDEIYa96wbF3yvX0uqVAgKw6wkqgUYn
 8vhEtTrLxW7GM/VBsxk3ML3zaZMH2jKbBTqu2IiTxdDyDMRobFtEOjVqWE2u9FdDge6kiNWpDVv
 gUOotksD035n5N9tkYjARluu8hIEALSa2ZoV5IfqGViwCpP+WrlA3cjw0efI+ZAL+wa6otZ1mAM
 xroBhWmLkbrvflqiMnXfv5k+ZshECo1xpQTGU0eSklH7pOCtVJ//ExjwktCfDYf7tRiEAw6LCda
 6gUs2vUN5RnsLj6uAPdqqxInmxW9EXaqVvpNNcmeBa+8TCjSNxeFmOYIOFAZnY3vuoIJsXJwUsy
 PxVp242pqAuG/5EFwjTUl34GGaycJTGEphccECSpg+6Mimf3Wu2tbbBAJFeJ86CLcq57Gv8Xpkx
 ll93oxgU6u4FZ4tV7cUWduODvfpxHN2/tEgQwZL6JZW5tlliiMTrBHSaRkQmRxbjrsKm/W/Q01S
 AeqgLelaNL22KcX3+GsowLDkj6Hirm69uNzfNcpsPO3WrcK+VGhGZ2NQ95q+jQ85f5pWBMhz0QZ
 gDWxMGzjA5k79gXtI3tpVlzoaO3FOfRjPLoo4a6QrZbt0gxIgKPVaJvPXttiIatD7xSnD+iHiWg
 rKB7Ph6c+63MX4LufRZGxltAXjPEL/WJYZGJtqw168MOWxDCGoMU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_133508_309904_D7424932 
X-CRM114-Status: GOOD (  14.90  )
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
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 81 +++++++++++++++++++++++++++++++----
 1 file changed, 73 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..579ad45028f6 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -3,7 +3,9 @@
  * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
  */
 
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
 
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
@@ -75,18 +80,77 @@ uart0: serial@131000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topcrm ZX297520V3_UART0_WCLK>, <&topcrm ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topcrm ZX297520V3_UART0_RESET>;
 			status = "disabled";
 		};
 
+		topcrm: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+			interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-up", "usb-down", "hsic-up", "hsic-down";
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+			#reset-cells = <1>;
+
+			reboot {
+				compatible = "syscon-reboot";
+				offset = <0x0>;
+				value = <0x1>;
+				mask = <0x1>;
+			};
+		};
+
+		matrixcrm: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			clocks = <&osc26m>, <&osc32k>, <&topcrm ZX297520V3_AHB_PCLK>,
+				 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+				 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+				 <&topcrm ZX297520V3_GPLL_D2>, <&topcrm ZX297520V3_GATED_OSC26M>;
+			clock-names = "osc26m", "osc32k", "ahb", "mpll", "mpll-d5", "dpll",
+				      "gpll", "gpll-d2", "wclk-osc26m";
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
 		uart1: serial@1408000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>, <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -95,8 +159,9 @@ uart2: serial@140d000 {
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


