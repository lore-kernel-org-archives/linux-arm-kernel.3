Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE23CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZ2CqpN6TY1CUJal15iLiTwlFidA8+74uvwknyoMa/U=; b=x9KTcV06+PGQQkqLG1ZrbCZcNV
	zG6GBFqvsxpLZ+9mwKoD4HlnCgQVbvF+a9MXkCGw2RTpk7IquhmXxoqceeTk+eYzrCIyzA6MBiqm/
	yufjJF3DQ7vMnIcB04nnt73zwjILgSAgkFElnffrVp8x2ZkNuHsu+kXWPFLbcSrIXDt75oYy/oFb9
	5I0+IIGXYuUoR65pAJ1MAa1QFiCByacSGDML1R/okSr1NH8q3KMrCjdambbQSIt5rECkEdAhOQy/0
	rakzpTVsOIDsFyiE3Vk7DSZGT0dPKuPK0Fq6uW/FLzBwM2KqBYJStyt9GtQ2v3F3Priu6dbZmTRO2
	ZYhjsjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCML-0000000DtX3-0E06;
	Wed, 13 Aug 2025 14:21:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBfF-0000000Dmka-0mel
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CE0A601FB;
	Wed, 13 Aug 2025 13:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A02CC4CEF7;
	Wed, 13 Aug 2025 13:37:10 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: rcar-gen3: Increase CANFD clock rates
Date: Wed, 13 Aug 2025 15:37:03 +0200
Message-ID: <d1ca3cd184193084b6de4332d47d0aee1923f6a6.1755090456.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755090456.git.geert+renesas@glider.be>
References: <cover.1755090456.git.geert+renesas@glider.be>
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

Currently, all R-Car Gen3 .dtsi files configure the CANFD core clocks to
40 MHz, which limits CAN-FD data transfer rates to 4 Mbps.  However, all
R-Car Gen3 SoCs except for R-Car D3 support CANFD clock rates up to 80
MHz.

Now the R-Car CAN-FD driver has gained support for Transceiver Delay
Compensation, increase all appropriate CANFD clock rates to the
documented maximum, to support data rates up to 8 Mbps.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 6ee9cdeb5a3ab478..c389ebc7e6ce8f00 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -1373,7 +1373,7 @@ canfd: can@e66c0000 {
 			       <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A7795_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index a323ac47ca70f3db..6d039019905ded0a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -1245,7 +1245,7 @@ canfd: can@e66c0000 {
 			       <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A7796_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 49f6d31c5903b8b3..1637b534fc68b19d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1245,7 +1245,7 @@ canfd: can@e66c0000 {
 			       <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A77961_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 136a22ca50b78674..353a771870893994 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1108,7 +1108,7 @@ canfd: can@e66c0000 {
 			       <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A77965_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 01744496805c3200..e7a5800bf74216fa 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -568,7 +568,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A77970_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index f7e506ad7a211a57..964aa14f3e65d925 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -621,7 +621,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A77980_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 6b8742045836b9b9..e16ede6eb3791ad1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1061,7 +1061,7 @@ canfd: can@e66c0000 {
 			       <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A77990_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
-- 
2.43.0


