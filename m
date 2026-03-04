Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5197AEF8FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2tE5zCq5iE+7KwSUMgIsmKRLUq7bBMqRO9vqSR5i7E4=; b=Hbxa7N9zkMMXBdv3SQNREGVD2E
	8brBVlrx/nzvTdhD6qMX5xVMz3GGIOCX4sMmQut3qV0DgKo1xlCYwyRiSLL2Bq2nPi+J/ekWPv0ah
	fX817HvTXRm8c/MbAMd3juWHDLw2Ut+DBApBDx9H6mYr6Zzs71uOIgDIXIw+f0I3wk1Os4BJMqgJa
	rC1CVozXbPmwq+llCKoQ1jrjFf/WUgwNeb8X+dakSAgqhTRrzsa/JdgNWVLcEt8O9MywCzxScyBQE
	89/7e3MPaDHFwqHNKwzEhD0lq7C/WuYp6Y2gd/7w5iUJEM6ka94KNqJM6KYgQ6hRzjHnxvcuhihXu
	oJ9Sr1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxp5y-000000004j5-3ZJY;
	Wed, 04 Mar 2026 16:29:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxp5w-000000004hy-0qzI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 16:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 607EA40E26;
	Wed,  4 Mar 2026 16:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69933C4CEF7;
	Wed,  4 Mar 2026 16:29:05 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Huy Bui <huy.bui.wm@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Khanh Le <khanh.le.xr@renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers
Date: Wed,  4 Mar 2026 17:29:01 +0100
Message-ID: <1f9dd274720ea1b66617a5dd84f76c3efc829dc8.1772641415.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_082908_284132_D2371CBD 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

SPI interrupts are in the range 0-987.  Extended SPI interrupts should
use GIC_ESPI, instead of abusing GIC_SPI with a manual offset of 4064.

Fixes: 63500d12cf76d003 ("arm64: dts: renesas: Add R8A78000 SoC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-fixes for v7.0.

 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 03639d0e5e339b14..3ec1b53d27828296 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -698,7 +698,7 @@ scif0: serial@c0700000 {
 			compatible = "renesas,scif-r8a78000",
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0700000 0 0x40>;
-			interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 10 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -708,7 +708,7 @@ scif1: serial@c0704000 {
 			compatible = "renesas,scif-r8a78000",
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0704000 0 0x40>;
-			interrupts = <GIC_SPI 4075 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -718,7 +718,7 @@ scif3: serial@c0708000 {
 			compatible = "renesas,scif-r8a78000",
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc0708000 0 0x40>;
-			interrupts = <GIC_SPI 4076 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 12 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -728,7 +728,7 @@ scif4: serial@c070c000 {
 			compatible = "renesas,scif-r8a78000",
 				     "renesas,rcar-gen5-scif", "renesas,scif";
 			reg = <0 0xc070c000 0 0x40>;
-			interrupts = <GIC_SPI 4077 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 13 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -738,7 +738,7 @@ hscif0: serial@c0710000 {
 			compatible = "renesas,hscif-r8a78000",
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0710000 0 0x60>;
-			interrupts = <GIC_SPI 4078 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 14 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -748,7 +748,7 @@ hscif1: serial@c0714000 {
 			compatible = "renesas,hscif-r8a78000",
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0714000 0 0x60>;
-			interrupts = <GIC_SPI 4079 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -758,7 +758,7 @@ hscif2: serial@c0718000 {
 			compatible = "renesas,hscif-r8a78000",
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc0718000 0 0x60>;
-			interrupts = <GIC_SPI 4080 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
@@ -768,7 +768,7 @@ hscif3: serial@c071c000 {
 			compatible = "renesas,hscif-r8a78000",
 				     "renesas,rcar-gen5-hscif", "renesas,hscif";
 			reg = <0 0xc071c000 0 0x60>;
-			interrupts = <GIC_SPI 4081 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 17 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			status = "disabled";
-- 
2.43.0


