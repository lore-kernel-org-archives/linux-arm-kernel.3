Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEE4C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MjSMNcZZ2ete1GWczfUi5IrEuGAKczh4J5IOTIEWugw=; b=iLTlkHn+hieCFzX4i1Vti0NoGB
	zsiT05PI2RlOWWNPUmlD699T6EUEXDj1nvYE0gg8JJTJAhX496Yja8C+YpbphA0qs86p8wAs1rE39
	exum/jsF4xSi4rW/O7yGi6zWvCOCAeZOzn3SOjSWqJlCrH4P2w+/zBM9hJieGzgKyZxRRe7BKX+EC
	qJcR+hqi35/9+hxfW3yaKU9Tj1nOMrpNjEChzbuacBH7n9wAoeYoTvL5+0H/Gr2O3RF6jg1kOad9l
	lxtk1t8DueLu6fVIwK9yd2xdOe8DA7WHEtObdbVvpDwrHUQK6pCiow/1ojrzXQFaje9aND2h4bp8O
	hQ7b9ssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUl4-00000004CHG-2zSR;
	Tue, 01 Jul 2025 06:46:22 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUNi-000000048Ar-1KLL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751350934; x=1782886934;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MjSMNcZZ2ete1GWczfUi5IrEuGAKczh4J5IOTIEWugw=;
  b=NmMuTBqzGPJqt9RdywFTa1reNpPPpHWFfui5ZcEN8IlYGxde6x/7vNiZ
   auowXG6ST+xSWC9G8OA1WqLhYNRKyneez2h8vF9gRW8ApyQUx8JDGJQN0
   N8HDPrt5alUHNZlrqndqVzkjMz+bANPrx5aWgHJ3fkIOMKidzSoT7fB90
   eOw0noV1iZ3kv3igJxQNhiSAXtEj6pktJ6WjpdP4/nFj0vUIX/AMsaR9Q
   OrwsIEa1JjNbELWwoDQDaoZNZrLEcTL/VhMAk+lSfijHqe/5vMj2UBgTO
   yAeOezlC3Pq2xVuGNLm0ZytlR59txc0/vreFD/2P/ikleyu+ZaGTWe5oV
   w==;
X-CSE-ConnectionGUID: dHZb3B1ySyuege6VeV3y6A==
X-CSE-MsgGUID: zxMUaGSqTsy5KQbFdKQa9g==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943273"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:22:09 +0200
X-CheckPoint: {68637E91-12-468F1319-EAD2FB43}
X-MAIL-CPID: 234CE97BDF3128C75316C14566837CCC_0
X-Control-Analysis: str=0001.0A006374.68637E9D.0022,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D2501613A2;
	Tue,  1 Jul 2025 08:22:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751350924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MjSMNcZZ2ete1GWczfUi5IrEuGAKczh4J5IOTIEWugw=;
	b=WQU/G5rjLQgX08HWWPHfri3RGMKs2e0YRbSH0K18xOjkA4C/8/oPgEsYtvlWEBy+uGdtl/
	Ty8aij/nVbp5gcSHABoq6SPVDYbEenh1z0ofR9/aH5PoqRylKabn4C9GqPzGF8QmYLhbLY
	nsBKKtN7xuBbWG4ICCbtPTbtO+e037kqRnfsQKPAoSiGLRFz5LoQ6I6eRiiVZnOmnIsLZt
	PL1OoDBsmYs5r1oEQndYo3DehHsMrZaDrAP1na7KNpYenSQMbT4oupL7bRU4oupM+oIWuj
	saT8vP82zQ8InxK6ieaXGsMj4d6PUUyoUyBbMAsfSETqYL95/1LT2FPGAX0qbA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: fsl-ls1043a: Add missing DMA entries for I2C & LPUART
Date: Tue,  1 Jul 2025 08:21:54 +0200
Message-ID: <20250701062157.514969-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_232215_078476_4CE76F2F 
X-CRM114-Status: UNSURE (   8.38  )
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

Only i2c0 had it's DMA channels configured. Add the missing one.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index c0e3e8fa1e794..26bea88cb967c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -550,6 +550,9 @@ i2c1: i2c@2190000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			scl-gpios = <&gpio4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 36>,
+			       <&edma0 1 37>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -563,6 +566,9 @@ i2c2: i2c@21a0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			scl-gpios = <&gpio4 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 34>,
+			       <&edma0 1 35>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -576,6 +582,9 @@ i2c3: i2c@21b0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			scl-gpios = <&gpio4 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 40>,
+			       <&edma0 1 41>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -717,6 +726,9 @@ lpuart0: serial@2950000 {
 			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen QORIQ_CLK_SYSCLK 0>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 32>,
+			       <&edma0 1 33>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -727,6 +739,9 @@ lpuart1: serial@2960000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 30>,
+			       <&edma0 1 31>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -737,6 +752,9 @@ lpuart2: serial@2970000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 28>,
+			       <&edma0 1 29>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -747,6 +765,9 @@ lpuart3: serial@2980000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 26>,
+			       <&edma0 1 27>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -757,6 +778,9 @@ lpuart4: serial@2990000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 24>,
+			       <&edma0 1 25>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -767,6 +791,9 @@ lpuart5: serial@29a0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 22>,
+			       <&edma0 1 23>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.43.0


