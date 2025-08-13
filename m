Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E30CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qAQfbsxZ2xxEAtuat8FTD4yEQiHGG+mhE5xvfud54U=; b=Q8xh1brZl0/Ozk+f8sAPF2vSyt
	4vAXkV2jYzP5QQzO0Uad+NwY/QVb5FxuRpl2/j/PL9tJkaz531GiHgU7ANZVlssmf0feraH7LLzk1
	yYg5r47HNf3MWEA0224Kd638hulYr80QXBFGNzADMMH+IitP7SbbAIVP8LVFu0v730/ImqpINvK2P
	WyI3U6qzOXfzC6PvsOvp8KUiyh1TvHqLMD1eMsbR0kejC647JUlRd8GZW/xv/TvW+NEjU4+ei0Ou3
	ZUh0nhT6/c4SraBmyD8Vbt4dmSPzO3jljY9whGpAU6cNPLqx8iipkQ315a5FHWB7OFn5Gap4RVbQf
	w3GIQ/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCML-0000000DtXr-2ZLT;
	Wed, 13 Aug 2025 14:21:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBfI-0000000Dmkp-1zF3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:37:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48748A57CFE;
	Wed, 13 Aug 2025 13:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6B4C4CEF5;
	Wed, 13 Aug 2025 13:37:12 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: rzg2: Increase CANFD clock rates
Date: Wed, 13 Aug 2025 15:37:04 +0200
Message-ID: <0dd1c17135707587e9e9d6d68b2eaa1921fbcb7a.1755090456.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755090456.git.geert+renesas@glider.be>
References: <cover.1755090456.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_063716_650769_D170EF03 
X-CRM114-Status: GOOD (  11.47  )
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

Currently, all RZ/G2 .dtsi files configure the CANFD core clocks to 40
MHz, which limits CAN-FD data transfer rates to 4 Mbps.  However, all
RZ/G2 SoCs support CANFD clock rates up to 80 MHz.

Now the R-Car CAN-FD driver has gained support for Transceiver Delay
Compensation, increase all appropriate CANFD clock rates to the
documented maximum, to support data rates up to 8 Mbps.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index c8b87aed92a368b1..6b737d91b320f483 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1186,7 +1186,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A774A1_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index f2fc2a2035a1d491..3f15d656215e15e8 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -1070,7 +1070,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A774B1_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 530ffd29cf13da00..55df063cb32327c2 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1029,7 +1029,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A774C0_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index e4dbda8c34d9eaef..5d730b488d46f24b 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -1298,7 +1298,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A774E1_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
-- 
2.43.0


