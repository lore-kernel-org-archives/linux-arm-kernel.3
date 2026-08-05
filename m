Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B805C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9Xpx+r1X/U+O6BQGl68ng/0DbgqZb5bhVkFJ9l/1JE=; b=GMi6Pe5KKNJhLw9n8hrL6XnfP1
	wTAe3H4miR8BIFlw53BkJst/w7oLPLgHrU4fW/oxK+M/2cL6fX2Engs/nV5YLpYO46r4A2HqJJnZz
	ArQqBVQLWa8vRnWYxelz2sHB3TpYk9UlOBqK3W9oNE7U1EY539ofuQksHTqDgFg0B1xSZOGe+MJW4
	dxUulI5ioY7YVRmyl0syC5HYjne76edEoagnarasFnEGCCnvA8B78Gft0suTs9Ljq+yBcA9m7yetp
	8wzzOlxElS8yZRfsJ1jyMJ1w3ND8Y2t9mHyp2uQb1ytx8x9RWXpLkFwx0Sl7IOEX8vVGg27yXFiym
	p+cBPGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdQs-00000004AZO-1Hee;
	Wed, 05 Aug 2026 15:21:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdQr-00000004AYG-1fNe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:21:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C33D4172D;
	Wed,  5 Aug 2026 15:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7736B1F00A3A;
	Wed,  5 Aug 2026 15:21:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 5/6] arm64: dts: renesas: r8a78000: Add CPG node
Date: Wed,  5 Aug 2026 17:20:53 +0200
Message-ID: <03a40ce94e01a5a390493b8c711c299d328a2db3.1785941595.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785941595.git.geert+renesas@glider.be>
References: <cover.1785941595.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a device node for the Clock Pulse Generator (CPG) on the R-Car X5H
(R8A78000) SoC.

Convert all (H)SCIF serial ports from dummy to CPG clocks, removing the
need for any dummy clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
v3:
  - Add Reviewed-by,

v2:
  - Split in separate CPG and MDLC patches.
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 59 +++++++++++++----------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index fb71974ef390509d..1fe078c7822c01a5 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r8a78000-cpg.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -668,23 +669,6 @@ L3_CA720_7: cache-controller-37 {
 		};
 	};
 
-	/*
-	 * In the early phase, there is no clock control support,
-	 * so assume that the clocks are enabled by default.
-	 * Therefore, dummy clocks are used.
-	 */
-	dummy_clk_sgasyncd16: dummy-clk-sgasyncd16 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <66666000>;
-	};
-
-	dummy_clk_sgasyncd4: dummy-clk-sgasyncd4 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <266660000>;
-	};
-
 	extal_clk: extal-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -882,7 +866,9 @@ scif0: serial@c0700000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0700000 0 0x40>;
 			interrupts = <GIC_ESPI 10 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
@@ -892,7 +878,9 @@ scif1: serial@c0704000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0704000 0 0x40>;
 			interrupts = <GIC_ESPI 11 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
@@ -902,7 +890,9 @@ scif3: serial@c0708000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0708000 0 0x40>;
 			interrupts = <GIC_ESPI 12 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
@@ -912,7 +902,9 @@ scif4: serial@c070c000 {
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc070c000 0 0x40>;
 			interrupts = <GIC_ESPI 13 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
@@ -922,7 +914,9 @@ hscif0: serial@c0710000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0710000 0 0x60>;
 			interrupts = <GIC_ESPI 14 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
@@ -932,7 +926,9 @@ hscif1: serial@c0714000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0714000 0 0x60>;
 			interrupts = <GIC_ESPI 15 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
@@ -942,7 +938,9 @@ hscif2: serial@c0718000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0718000 0 0x60>;
 			interrupts = <GIC_ESPI 16 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
@@ -952,7 +950,9 @@ hscif3: serial@c071c000 {
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc071c000 0 0x60>;
 			interrupts = <GIC_ESPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
+				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
 		};
@@ -965,6 +965,15 @@ stcm_transport: sram@c1060000 {
 			ranges = <0 0x0 0xc1060000 0x1c00>;
 			/* actual transport nodes must be set per board file */
 		};
+
+		cpg: clock-controller@c1320000 {
+			compatible = "renesas,r8a78000-cpg";
+			reg = <0 0xc1320000 0 0x10000>;
+			clocks = <&extal_clk>, <&extalr_clk>;
+			clock-names = "extal", "extalr";
+			#clock-cells = <1>;
+			bootph-all;
+		};
 	};
 
 	timer {
-- 
2.43.0


