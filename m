Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC5FCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNQvp/eWwkD2QZuuf9D2poX/9RA0ShD7oqYYx3ps+FU=; b=d+ZfR9/vzso78VYJtrQ3PNGWGm
	eqW/HNSOsKmO2W1cBK7d5fH16Gas0HxRwkYKkaqo2q952pGQ5Or9iVhv7eYlouFTf0LTzpqsG6OVo
	SBP/xaCRfe0w8C41SoX8FZ6plIcBxLBbh+wphEs8mCJqUx14u3Sz3krSHZg3eHG5lGL3Gzjfpj5dy
	V8gNiTvFETbqKnYV8Zk2ssZniczHnUBz9HVfAwK3cwQSeNxENZVu0bZzIb81UvW+KERykFNetxWAP
	/oh6ZIYGdziD21hj4otUk+JU10++YASzy7GEs00GDiu+hYa4tnTI5Bt8CvQdUwjeF70Oawelhxq8J
	dEurSDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSihH-00000006QqB-1lFT;
	Thu, 28 May 2026 21:55:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSihC-00000006QmH-0LtA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:55:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so55351735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005316; x=1780610116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNQvp/eWwkD2QZuuf9D2poX/9RA0ShD7oqYYx3ps+FU=;
        b=cF67GJy0c0Jd1eDETpvcInoI+9XoMgs9kglUP/+iIcMVH6r0EVKfW+S27YurN3Acn7
         NEMnkoTk/ApKH29BbcMMoEnf9dqhpV6c54lPqu6Mib6BNBF5UItc+JzBWfjRw1cWH7af
         KSM61HW48bR9xdinqRDTe0luO5YWNLtoKNFa5c5V5lsF0QNgAl6tb+F7/CoLzg8v2s6A
         1PVaTXuNOViXTblQP0O1gYzGu3i5FM88RWRzgvtK7tX2SMpK93LdTbYvYFI6LLxoZ8TU
         tFcm1Tuu2ribEJnNkGf8K/nzxafV5gtLrr/p8E1s+shebfd5FHm9PHp4pR56CQVIouFU
         sl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005316; x=1780610116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CNQvp/eWwkD2QZuuf9D2poX/9RA0ShD7oqYYx3ps+FU=;
        b=kvOg5CqGDorUZXdJikMdKziDnpIsZO5k3HbEqr0ohsMxYyoo4Z/+Uh3xnLCgteLQyA
         DScfkPCmRaPSsxLjAfKTD6JPbzxx6e7ZAPOxzzXfKKQvzm/lDohbsQbD9uSHKVXg+04/
         NCyrbvBhMo8NYkKErcXeRFOhnNtaMLUPLsp8RY5XuLr+wbRl+6ive+RSlZQMfc3sAN75
         R/gzDmfk62DIfmVwJrmAl0M5RScuHVpSW8BjV6zJmRUgRPkw9jJd9Cq6UYQoB6BuwvkP
         SBY/+zGaWbzSRFdwN9Cg8WtcEI6Wl0/+cTZ3OrQp2Q+hJUYRspqv06XLjLInZFxRaWym
         8XIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9K5sKLPEN8nEcuCFfFiG6I2J9CbgvEpA0Uqtl27/iirb+49xiznfKhew1bFNBlN7j0+SBn4H7FoLVARwFxoa+5@lists.infradead.org
X-Gm-Message-State: AOJu0YzfpqBaZhraUzculV3X7V5LNvIRnELACM0PgTxu4eAfBQJdXP1D
	VEr1t9nTdiuXM26UXx9djp2aWrJAOaeRTYAnEGKXQxI9ZEmmG5cfv3y9YfdNUnfgpIfHYg==
X-Gm-Gg: Acq92OFqYV11IeGEktPzzIuwvP1XkBu67FSHJ0mNGxvXXfvOZ1jq+yM6Nbb3HsYmohu
	lZjmdq9b0cvgd128aBMEkQTtXW+zHdRV5KKtLfC36NfoHoERRT7TTXlX7rvZmMpX/1oZobH1vPL
	M/pbQaNcw0aCciY+xBLe44SJutxmM+/k7P5QDIqYSbnDUUriVArYd7yakIvLsINiHV+lIfAfQom
	49OMhwqlGIo2EKniQnKxj+gawO9zLThQ61SIltDAcGxw1IadaiDio5XiNuWe4UIqe5JNbHWSVHc
	xZqXhhhXd9U4Y2u9mKRLAk+gCAnBRLci9XHtufHZc7NJNPD21h2CJwFIw5Me5Eywginu0eajLoq
	58tH1aF9D326BQmOO6JckZbJlrzlFz2yHjn13UU1XTP0HMW84YSonPDJkM6rg3l8rJWzJpJz8jD
	7b94UAHPMkPdpZQn4R1naokW1kxqHmRBOodp1TbvqJYHrf
X-Received: by 2002:a05:600c:2113:b0:490:845e:3a6 with SMTP id 5b1f17b1804b1-4909c0b706amr2630715e9.25.1780005316082;
        Thu, 28 May 2026 14:55:16 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c967c6csm1191085e9.2.2026.05.28.14.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:55:15 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 29 May 2026 00:53:02 +0300
Subject: [PATCH RFC v3 5/5] ARM: dts: zte: Declare a zx297520v3 clock
 device nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-zx29clk-v3-5-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
In-Reply-To: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3665;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=eKCYysFcPuaXaoisFpLloAByZzjH3S4RlmU0j/f/7Ww=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqGLmonB1gQW4rZ70oU0qgrlZbtOo5IBUL5cz8K
 uiR7j+xheuJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCahi5qBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ44Q/8CIR9L5lArAiX4KXK9TNo8gozsOA+QtY
 xAaPTNtdFAYbufZxCearH5SOwIkECPWNXkoOHUgsqUkovgW9ytiFBM69T8PQHAbwEMq7tVnYFt3
 aE8SIFT7ExX5DKfG6TXFphrQcBkMoE1u8uv2d01pjRgs61xruYaGHsyIfjTbXn+4LIYpkGbZZcC
 p7O9mFhIkdna1PVWHx089Iq6jxx/2FOzfG0BdXVeTSNWwNhPE35VbGcTXxAIoFUECuoJZti/X6F
 zpr6kW8MY/kQ+ei71gaXAu2qrAPkg/W0NvV7owyKZAMYwGTbcDEUyxjW1yEqZSU5cGh5lpXJWjp
 uHJlsPCQ9DRQrmK/FcNaXRhE2GEMn7vZyKrKv57N1UogMS4ujjEBixkth6UjbC58nX4QNxM16Yj
 u/ctOLfzxCs5yjjvLMaTquro6kYv/Knh29PqekhtBEHq02JtZVFWUEohnBrzazD7WshWfm9Ng2q
 t5ToJPcsNzljawo7O9fBuuwqMhYqDOGhy1GZ+Ldq/f7Ft+/R4hb6hTqRREizKKl8+HhgjJQKOuJ
 pfYymxTsmB4iiTbEn4DVHLIq9DXnAQuL7Pztxvrfiq/du+2hgn2JGjSTj3G9pCbakLYCmV+qVCD
 Qnt1VogpwWWBkC2wl4JZzSECG3uiiam134qXk8hCLGtPbIBK3P2c=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_145518_149161_0CE1F70E 
X-CRM114-Status: GOOD (  14.12  )
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
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 55 ++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..9d80740ccf8a 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 
 / {
 	#address-cells = <1>;
@@ -20,13 +21,16 @@ cpu@0 {
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
@@ -70,13 +74,46 @@ gic: interrupt-controller@f2000000 {
 			      <0xf2040000 0x20000>;
 		};
 
+
+		topclk: clk@13b000 {
+			compatible = "zte,zx297520v3-topclk";
+			reg = <0x0013b000 0x400>,
+			      <0x01306000 0x400>;
+			reg-names = "top", "matrix";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+		};
+
+		lspclk: clk@1400000 {
+			compatible = "zte,zx297520v3-lspclk";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+
+			clocks = <&topclk ZX297520V3_LSP_MPLL_D5_WCLK>,
+				 <&topclk ZX297520V3_LSP_MPLL_D4_WCLK>,
+				 <&topclk ZX297520V3_LSP_MPLL_D6_WCLK>,
+				 <&topclk ZX297520V3_LSP_MPLL_D8_WCLK>,
+				 <&topclk ZX297520V3_LSP_MPLL_D12_WCLK>,
+				 <&topclk ZX297520V3_LSP_OSC26M_WCLK>,
+				 <&topclk ZX297520V3_LSP_OSC32K_WCLK>,
+				 <&topclk ZX297520V3_LSP_PCLK>,
+				 <&topclk ZX297520V3_LSP_TDM_WCLK>,
+				 <&topclk ZX297520V3_LSP_DPLL_D4_WCLK>;
+			clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+				      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+		};
+
 		uart0: serial@131000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topclk ZX297520V3_UART0_WCLK>, <&topclk ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topclk ZX297520V3_UART0_RESET>;
 			status = "disabled";
 		};
 
@@ -85,8 +122,9 @@ uart1: serial@1408000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspclk ZX297520V3_UART1_WCLK>, <&lspclk ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspclk ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -95,8 +133,9 @@ uart2: serial@140d000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspclk ZX297520V3_UART2_WCLK>, <&lspclk ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspclk ZX297520V3_UART2_RESET>;
 			status = "disabled";
 		};
 	};

-- 
2.53.0


