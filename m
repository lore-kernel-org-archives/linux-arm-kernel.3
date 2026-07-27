Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2839C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAtpWFpXBCB2TwlFP1ROJK7e4/4ihHdc0dQDuwgQXcs=; b=iNOM6PDKeeI5ltFjYk9kcqx2x2
	7z+XuOT92T/MPMWN1dl5ni8PTF7PTxNamv5TSvJVLAN+tTI3Tw6d7mTS6i+mD0eGKVFa8khHRhx+b
	8jE58Wna6kDfqtuMshhLTfAq4vV6mdU6YIh6tYHa0STj5B7mvyGy+m1BioWEJ2g977gnWWnmzISaj
	gwJPEGMQcfnmLBjy0oxa3Z0ZOy4Be/1+a83rHq4nFYyqL/zG5FexRmQO6AbeYPsFmKQqStCi5hSkB
	XUZXhl7fIqKVJSw/WtAT0ExvA2cOqm8UyUuHtiZV04W76qHLBJy3OKnCU2krQP2mFKOCEGHBznLTF
	Fa8OgHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ28-00000003eZV-3DIN;
	Mon, 27 Jul 2026 18:26:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ20-00000003eQO-1ZUh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 18:26:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49553515a8bso36156265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 11:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176787; x=1785781587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAtpWFpXBCB2TwlFP1ROJK7e4/4ihHdc0dQDuwgQXcs=;
        b=Tx00oCcYjLQZdLlDCsKU7qcvUBjrSUkH877xflxP+7r8lDFTzMesnR8EE2IOPY0580
         G7zkjIIdz7Wy30DABzZ/8fzt/qGlMlUbRKcrOASmS9B4QxWtjKLnDjeH1e8Moj+c67BG
         zNeFQb3Jx1upw14v+BHN2/EIPk8WSOpurj/PB31xrFcMNiFjgPUclYF6oN/Rxf0sDgGn
         cl9iAp9Op+RoOiIxqI8v3UMwyNf1l9Ip4M1LfWtF1WSrY7qZLOAlTuhjGv+F+0sGgrR8
         R4Hv4Sqy/TUfOzEDhaKoU0ooy9+7UB60rvfrwe/WX4J5fxq0JCbX3RTYUPC23T9N4B+W
         I5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176787; x=1785781587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAtpWFpXBCB2TwlFP1ROJK7e4/4ihHdc0dQDuwgQXcs=;
        b=NX7R0AYm22xzBfoP9cQrm5dRs+FbsjzHSJ+Q0vPsFWwHvzL9OJXk5SkIspage7US8t
         UFkSYyeYti5siXVQEBHHShags1AmHUiKxkY8GMA+Sn/QxfExTWpF2QAXr+X+XmNiStfl
         v3pk0IcRZw9SgyEqgcBnCCbJ7g4BJ3PwzpqkMrhMtz7tVXA6b5cjM41D7VnpMabCdlLT
         kPvFDupxDvEPdTeCwVdLgtHu9jOKVXVD37rLmBKX0apzBaph0tnmvqWds2qQCKtLX1hW
         /BtfHileWNWCrKUFbtlQsGA68DOh17HSoD2DQR+nko8lBQzm6mp8w5AoYLH6t+HL0G+M
         GgLA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9oikcXKxTbOBIJKboow1w0kZ9CCMZW+wLK4ANtCTSpJuyaVIXMJbvgNqPGXDQhwdb2+KBlc1wXzgnI5VOssYY@lists.infradead.org
X-Gm-Message-State: AOJu0YxyznRLECwO7x0lOQNgTjfNjIcyvzX7RlmaB6K+fbcX2uWVG3T6
	WZ/cqFoqGBhSxsyl3x8FgoM4naAx7zN/E737agt4Cf/ixDP/HOGXGOlw
X-Gm-Gg: AR+sD11aoVMtPLCofAJSTDvHBBCaQINLLx7vdoeC3c/RXnFARGjaVE81gXrvywWO3RW
	zBDrnNCBPoYVz13Q8460vWZO6lj3xDml1+1U9N59kUhSMDW4TxkV7u7B2hAp88+aQrSx+/k4vp0
	Ue8jfJ+jYyX4QDrV5ChVSplEv9V9/tO8rPUYysieWiuV5KOO9OYmTHRV/pAYKVv7Sn1UNgjLhPV
	TIf1unMUrlByIjmzK26cO2cB44/pl4fsYnxHRExZXMIx1FD0a4hvdXzf/TaSBmS1buoJCf41gnf
	hUCCwdahaDoKFByT7AfPbi2j2YtkqUyjrk42l0llRVZj0TjQI8pGl0yQe0JuDVIVubhG4JBx5Ru
	8yeNoJpK9iYf6snQdhL0CWc43Hq9rPKUgZYs7VDf6ch4jOFNm1UaKZgtozUA6cOV4Jcd+k52vdK
	fkEWw6EpBbcQKn5275bhdHMMo=
X-Received: by 2002:a05:600c:6986:b0:495:3f48:5df2 with SMTP id 5b1f17b1804b1-496b5722341mr144689655e9.29.1785176786691;
        Mon, 27 Jul 2026 11:26:26 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:26:26 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:27 +0300
Subject: [PATCH v8 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-12-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5268;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=9WNPKFjal9TFI7ztjsCWddsA0DdgrD8Tk7Zv4ZNs/pI=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J7FbZD2m/JMVFcXnBCdwNjgRof/lPXlFIYI
 Eof9rYGcc2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiexsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIpNg/8CjhYfS1jEJRHFiBgBHY94DxsbwC80LV
 FJ+iqaQIJn9SQuRM8mcsHnPvkhxHspQMK/XJoHvbxDakU6CLMUjEUC/UE23nvkXuFgYGRU/bm/K
 nM30erogA/6Ee87GbATgpz/U4rwxXmsnszROwKfVBppkIKxtV4+rGEuZNe4xaa94+Kft6zZgU3a
 V6G20JybDFvY0lxCpFFJlXMDsEMMUelTb+MkDUP2C5zVJRrgbnbgoXH01jvVZXRbQ2CB6I8DA8f
 UEm03N9S9rFjiivNza1972Ecx7uJQxjeIGgTLegxJdPk21AQZmdz9yggFPWh6aEbjRw828osEss
 NUQVKk18v7d92C2XIQQRUT+qpl4BIHR6qeMfnP6SpTq/m6SWKz/MiVLL2NWLgopShaX7HImgAVx
 /50BLdsMcVsUOsPTZJ/R78p75U2CJ5D9eAdc8WDLV6XYnHQfJmeuoDyFG/jEAayFsrLaPQEi75A
 ldzwsNiYqXbZAYmPVNnaTyB0ZiZTgpGRA/+r2OTLWullukCrBP+WcqVxH59ovKFr+Hn10RGFG1/
 +FVupuf6muERBXFswb3B5VDtNewieyxjenmfbinlRAnBLYtlOX9wL88glUI0pIMrDn1uAiv+hkh
 gxxePgHKcQ6WxmDfdh35grba3iONAhD6V3AuPNNWN5e9ErGqwK0g=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_112628_481853_97C03F0F 
X-CRM114-Status: GOOD (  14.99  )
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
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 84 +++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..8d911795936b 100644
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
@@ -70,13 +75,74 @@ gic: interrupt-controller@f2000000 {
 			      <0xf2040000 0x20000>;
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
+			resets = <&topcrm ZX297520V3_USB_PHY_RESET>,
+				 <&topcrm ZX297520V3_HSIC_PHY_RESET>;
+			reset-names = "usb", "hsic";
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+			#reset-cells = <1>;
+
+			syscon-reboot {
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
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+				 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+				 <&topcrm ZX297520V3_GPLL_D2>, <&topcrm ZX297520V3_GATED_OSC26M>;
+			clock-names = "osc26m", "osc32k", "mpll", "mpll-d5", "dpll",
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
 
@@ -85,8 +151,9 @@ uart1: serial@1408000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>, <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -95,8 +162,9 @@ uart2: serial@140d000 {
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


