Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07375C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IuUZGoiNHCcd6WaoCznRINiS0bC0Kq9wMArlqVtdSjs=; b=iVxxPwD0ly9h+9nHyc9I8imFf0
	BRPnYPEKaYcUlHDoviCZpQLODrRznf0IdOLNht4E3xUAJ1VboX65cttqkehM5C9ALNmrWWpqBRxY+
	dLZNSMi6wwUd9fTKnY07CXaafoNgFQ0seJV6+HZsEhn/koTrCpQ8WlAIWzSzaDBQMp6EbL3/qEv7U
	huswrmCI2/qSk7TxQ1c0TUZCAWyAEZgl+tz1VdryAB6hMaB77Zy89fpq6qBnoUxlKKeXh3ljvPBJv
	xGSMIOegeeBLN3nz0/I8jk85Kjyi4yaUaozNdpKcz74az6JDHllq1uEO0ZK1dlR9Powl7UqQn7AfY
	HmTXzp0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i3c-00000008NLm-1R93;
	Wed, 16 Sep 2026 05:19:44 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i3a-00000008NKw-18JL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:19:43 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2db1ca069c8so4752745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789535981; x=1790140781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IuUZGoiNHCcd6WaoCznRINiS0bC0Kq9wMArlqVtdSjs=;
        b=R8sj4ROgmULETl3j/jl8KlhKKpzJL87+mb6bBu2B+HH87poz+reVrPtIDMk5jnea0m
         38E3YjCJ1W3AXpTi9MSRguH7Iu6V+0vUpmQZZNrcmehoogo3KX/nX/jWNlaurMXgfW7R
         DqoD+mCmavKibdDE/12yRoK/jmJBZ2gJj5Ht2B7ChUFgAKCFip0hFvZEX0hPV1ef7KZ9
         R0rPGn3wQwbMLpL5kXEtqW7yUcW2Wp3ztIkR0xDebAuLMAfuPHRCYUP4kaceaskurJcz
         ZAgpxgtPI4LJn0JapJ3lZeMF5v5eB07XmPxoS+N9a6kF1apdZrhvomGt23R1Fgg4Mc+4
         Zm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535981; x=1790140781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IuUZGoiNHCcd6WaoCznRINiS0bC0Kq9wMArlqVtdSjs=;
        b=Fi6cRcGrZzrFzOrV6LJCj5vFawK48uUi+j/89kFZF6llursUrUFISmhulwsO3izPio
         073YghCqRp5SBe23Wj5ak78ckEkNmei+sHvMYodfK1zed9shv+X4iElid4TwdoqyJsJj
         And/cehsh6h5B9KPnHK4Ji3kWN3D73lDKY/BowbvikF5hFiXyIfzlAx8HHdlw1YisM4B
         2G2POynAaOJ1h8kytOBAF6PokuEnezl1wmy28WuS7XWHaCT3Zbe88DxBubCshroDG+3S
         0GL4IiRwGOkcHMmOvwRBc0rBP/t6iS5K/0x4007gCpQV6Vepg6ErZ5ajRkwd5FAdYKyE
         taFA==
X-Forwarded-Encrypted: i=1; AKwUvBy3ECOx8eKcXO5DF3UM0r6hBCHsF7ZKVHIs0lq7dr0ry+XYWdJ2J5qHIo/2rsLEgYrrErdHJjS2ksgwjIRojRnw@lists.infradead.org
X-Gm-Message-State: AFuF++mNqnoIevcM7rDQ+N2PML+owq+hSIX0vlEikyZmsqArSrUwE5Fg
	cHoaJg4+mgLUrPY2F5hBk4KJp2vbMt99DjQeAmId4cgsqa6qjUNGujnQ
X-Gm-Gg: AYBFou1TN1ARqcyLseY5fg3doNlA525IbvFuicRdilBhqE4IR3TP8LigrhRRHs8o7v3
	RH42G76vAFoF4AI8gfg5RqdXR3VKTarLyzzKbIRVFGoZDTy/2J8/E8aG8i8gfcAxgsZQUOz88RL
	8MyZtG54/GcJs9E99JlYmhSEH4pMmBKFLjS7x6psQcOZYvzxgBRmJDlcl8A42VdWJgBTtoiCnno
	MTG09nemf1PRVckxASPvKnaNvk6QXX+1qV7LXlatmthSuagBELKj8NBjOorpNlFvS4oyDo/Fdpo
	+MsmYGFGANSD9/nNOSDs40R8wciQ1swvaHWpAcO+6xzd9Ib8ffxD6Ztb4BTOzJ6D8ZRi/HxCG6h
	3mU/R7suFULZGXhwAaHYlJE5CdpmPMgnF0L1oxKi6KC/ihz+Ryaqk7usy2IwGV/lRFkFFS/speF
	WPuNGcvziK1Jn77Z+Z+tir7HMtdxnl+rY+52zNL5mKfMiFiTyEaG8yXycigPS6XW6PCwljWaqWV
	R9f0rVjrRfA36Um430J0G2EUhFET7295OBcUFybZLPkZYcc1cXNKW3m
X-Received: by 2002:a17:903:1251:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2dd8e752f13mr25316615ad.16.1789535980862;
        Tue, 15 Sep 2026 22:19:40 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89e92c0fsm5325165ad.23.2026.09.15.22.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:19:40 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mkl@pengutronix.de,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v4] arm64: dts: nuvoton: ma35d1: add CAN nodes
Date: Wed, 16 Sep 2026 13:18:27 +0800
Message-Id: <20260916051827.919538-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_221942_327168_06CDECCB 
X-CRM114-Status: GOOD (  12.76  )
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

Add controller nodes for the four Bosch M_CAN blocks found on the
Nuvoton MA35D1 SoC.

Additionally, configure pinctrl and enable CAN1 and CAN3 on the
MA35D1 SOM board. Also, update the APLL frequency to 160MHz to ensure
the CAN controllers receive the required input clock for 80MHz operation.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
v4:
 - Add hardware reset properties for CANFD0 through CANFD3.
v3:
 - Change CAN clock to 80MHz and APLL to 160MHz to use a higher multiple
   of 40MHz, as suggested by Marc.
v2: 
 - Move assigned-clocks and assigned-clock-rates configurations of
   CAN_DIV from SoC-level ma35d1.dtsi to board-level ma35d1-som-256m.dts
 - Update APLL frequency to 200MHz to ensure the CAN controllers
   receive the required 50MHz input clock.

 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 ++++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 56 +++++++++++++++++++
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..e2d3fde1dab3 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -39,6 +39,22 @@ clk_hxt: clock-hxt {
 	};
 };
 
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+	assigned-clocks = <&clk CAN1_DIV>;
+	assigned-clock-rates = <80000000>;
+	status = "okay";
+};
+
+&can3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can3>;
+	assigned-clocks = <&clk CAN3_DIV>;
+	assigned-clock-rates = <80000000>;
+	status = "okay";
+};
+
 &clk {
 	assigned-clocks = <&clk CAPLL>,
 			  <&clk DDRPLL>,
@@ -47,7 +63,7 @@ &clk {
 			  <&clk VPLL>;
 	assigned-clock-rates = <800000000>,
 			       <266000000>,
-			       <180000000>,
+			       <160000000>,
 			       <500000000>,
 			       <102000000>;
 	nuvoton,pll-mode = "integer",
@@ -58,6 +74,20 @@ &clk {
 };
 
 &pinctrl {
+	can-grp {
+		pinctrl_can1: can1-pins {
+			nuvoton,pins = <11 14 4>,
+				       <11 15 4>;
+			bias-disable;
+		};
+
+		pinctrl_can3: can3-pins {
+			nuvoton,pins = <11 10 3>,
+				       <11 11 3>;
+			bias-disable;
+		};
+	};
+
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
 			nuvoton,pins = <4 14 1>,
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..b3b8c8673a2a 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -244,6 +244,62 @@ gpion: gpio@340 {
 			};
 		};
 
+		can0: can@403c0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			resets = <&sys MA35D1_RESET_CANFD0>;
+			clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can1: can@403d0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403d0000 0x0 0x200>, <0x0 0x403d0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			resets = <&sys MA35D1_RESET_CANFD1>;
+			clocks = <&clk HCLK3>, <&clk CAN1_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can2: can@403e0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403e0000 0x0 0x200>, <0x0 0x403e0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			resets = <&sys MA35D1_RESET_CANFD2>;
+			clocks = <&clk HCLK3>, <&clk CAN2_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can3: can@403f0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403f0000 0x0 0x200>, <0x0 0x403f0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			resets = <&sys MA35D1_RESET_CANFD3>;
+			clocks = <&clk HCLK3>, <&clk CAN3_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
 		uart0: serial@40700000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40700000 0x0 0x100>;
-- 
2.34.1


