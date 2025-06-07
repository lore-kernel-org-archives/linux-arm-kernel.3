Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADBEC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AsKkZqmpYGnDhrFl1iOAYiQoo+4nhS23D6Mggw18LTc=; b=uK1tdqtRWTcFzdemzFwSEe5pOt
	Bqlv12/z91luolfrQQerhAa4893LSozAy9ywUu8xExz1EFtcnw3hm0qzZWaV91upFvXXAy+5fo6rB
	wnFHt6zGyRMGgUnYFfyyfzyqv0mDQOlJB6G2vnJApO4Q6IrqxhX/vAmketUM8fNXIl6I7OohQly0t
	6VYwZsAnfMs3TPbaYcwmdMbMzQN0pmn0dXvRgAUSVdrqNkzWeCqX87NJF9m8XAM5OSJZr/K0ZjPzS
	7NKbu9JU+Pk55qPsGd8wcaD3nVjtFAd254mrbgrotX0YcnkEZQ+FmNMvhN7U3MC8C2Qag8I96F4Nt
	UvC+b2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNtyd-00000001jCm-1AmM;
	Sat, 07 Jun 2025 13:52:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNtwQ-00000001j2j-47sw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 13:50:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E2E85C57C5;
	Sat,  7 Jun 2025 13:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48649C4CEE4;
	Sat,  7 Jun 2025 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749304233;
	bh=sKhnDtstllZuii5hWHsr9I5he6MYPD06tRZoSOBtdoE=;
	h=From:To:Cc:Subject:Date:From;
	b=N7eEytPPe06EbRaeWSSfIFm2FNfiewNxewu0+HffGPb4l4UyFaUcxsh7oycYmym/B
	 5GL/ZFY9aSqI4xYy4f5u+dn0/sEO2W8wR1DKcWmjQ1P77QM5yvJoS6Wf8aB/jYRiQN
	 xgdHUMXdi4ebuXvrp/19Wyug+9K1LhZZlUFs3OP4Jb5EGKnmlBFdCOrwCofd3QP8wJ
	 AN+Xvsup6vNFfhrYFhXUnkflqZFwohTZebO/1jPeh41VqapRP95ZbzV8RlR2I39tge
	 MySk73S7dZAaiA/yhDCS68g6swtNFfCDsfsBgtr/ziyIwhYiEB+p1jlYvtm7mxTk94
	 nsifPwCFArmBA==
Received: by wens.tw (Postfix, from userid 1000)
	id 3FC195FD0C; Sat,  7 Jun 2025 21:50:30 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH] clk: sunxi-ng: a523: Mark MBUS clock as critical
Date: Sat,  7 Jun 2025 21:50:29 +0800
Message-Id: <20250607135029.2085140-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_065035_065681_42D129BF 
X-CRM114-Status: GOOD (  12.69  )
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

From: Chen-Yu Tsai <wens@csie.org>

The MBUS serves as the main data bus for various DMA masters in the
system. If its clock is not enabled, the DMA operations will stall,
leading to the peripherals stalling or timing out. This has been
observed as USB or MMC hosts timing out waiting for transactions
when the clock is automatically disabled by the CCF due to it not
being used.

Mark the clock as critical so that it never gets disabled.

Fixes: 74b0443a0d0a ("clk: sunxi-ng: a523: add system mod clocks")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 9efb9fd24b42..1a9a1cb869e2 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -385,7 +385,8 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
 					    0, 0,		/* no P */
 					    24, 3,	/* mux */
 					    BIT(31),	/* gate */
-					    0, CCU_FEATURE_UPDATE_BIT);
+					    CLK_IS_CRITICAL,
+					    CCU_FEATURE_UPDATE_BIT);
 
 static const struct clk_hw *mbus_hws[] = { &mbus_clk.common.hw };
 
-- 
2.39.5


