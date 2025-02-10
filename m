Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3695AC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bOMbba0A1eJVbzvPVV/zSeVjS+2bYN5BuJsAKJgZbqQ=; b=4kJuBJ2L7WZFFBDLarGgz49o19
	fAGRXGxMRZx3xOuGknt5JbGk/2wMSv3aXsZdI/vtI9g6+WUVlievBv0NNoUebp462WBt3OQ7m9LWn
	KhA0YAboGowsBnfvc4frkZpuDj7bllhsHhRHDYtcIGJhBtO3me5I/RDX2AmiMFJ9MfnGjdLbVMbX0
	DSNw9m5M4VQvTmhhjwRLo9sWxiWSuVA49sUy0LKx9m3e3lC0U6rgl6wNq9Q0YXJfbKcDTrwry+0Hw
	ovpXuKnBiop2sJHRuDP4dFKVvjxLFerP6Nx6NKJdBSvfuiLwMNvAInBjVIX+oZnolDwSjJh4ilAwr
	H7KJsXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWH9-00000000QYl-0hSO;
	Mon, 10 Feb 2025 16:04:47 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWCw-00000000Pdx-0wHB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739203226; x=1770739226;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bOMbba0A1eJVbzvPVV/zSeVjS+2bYN5BuJsAKJgZbqQ=;
  b=Lka6XTnCmQeHFf2BlpNZmKYRXr47EL5tuapb9MrCrTxNSBGdMwfLRYnv
   1h9KIzpGM2wlhst4leD80FS4XsacUPEs5vXqwUUr4JzgK0sLMTXDi3M6W
   agdgAI9p62X5ScWoPtnz7xTSMDmogGyZBArGDcRDDsky3MxHFpigv1jHb
   IrSYaPGJFec7SJoH2aekpMoAsX9XJ2Adw69ByUHqeKoYeN0zsnVSa6rt4
   VOJxXv4vXGcwtvIn6tO7TYvOAnlLDF2B7a7a2PIZYFQ9k0y67xbZWb2J5
   4/Ei+Vy9lwRw3PDRhy0GMmUSZucs/VSXDS4BSjpvY9PNsvHzguDr/DDnU
   w==;
X-CSE-ConnectionGUID: 3yDWKte7RaiwtEJDQl2RIw==
X-CSE-MsgGUID: 2qOTWrZIQbygIG189aMiXA==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41723662"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 17:00:20 +0100
X-CheckPoint: {67AA2294-B-6E0A4539-DBC44C3A}
X-MAIL-CPID: 6A27F41018F237B18955565C9E442D6C_1
X-Control-Analysis: str=0001.0A006366.67AA2298.0035,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16F441615E5;
	Mon, 10 Feb 2025 17:00:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739203216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bOMbba0A1eJVbzvPVV/zSeVjS+2bYN5BuJsAKJgZbqQ=;
	b=qEnx/Gh/VTeWQNQT5jNkge6mW56hxuqyWi90pTqAu2L+2k0WZuqRoraM4Xqd13ckuUnFcE
	yrS5gm6sT3Y9HViD6HDMUXKqH0hgOC7Zt4aBWgLXtZjSH5P8InGYdWe/PtO86hWyscLs6+
	aHa60xhRFBZW0z5gFSj9YOecjP6Utb1Zfk8+Nk5r2G2Ak6M5xz6blbFvM3ihrrb5gbhiZo
	alLfxRtrsvBUjWRgaT0MaGjArx0SbT9w+IEJMIfNDuvxmMoyx2bcbPQuLc7uc95X27lwWS
	B4EJ8mgxeizhB2AcQoUp1wqnTfonFEuKZXdPcXo+N3b/PgPOTjwxm0G6CAyYwA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] clk: imx: clk-fracn-gppll: Do not access num/denom register for integer PLL
Date: Mon, 10 Feb 2025 17:00:09 +0100
Message-Id: <20250210160012.783446-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_080026_751335_37332543 
X-CRM114-Status: GOOD (  12.13  )
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

Similar to clk_fracn_gppll_set_rate(), do not access the numerator and
denominator register for integer PLL. Set MFD/MFN to 0 instead, so the
table lookup will match.
See i.MX93 RM section 74.5.2.1 (PLL memory map) for ARMPLL, addresses
0x40 and 0x50 are not listed/reserved.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 85771afd4698a..3aef548110e25 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -154,17 +154,24 @@ static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned lon
 {
 	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
 	const struct imx_fracn_gppll_rate_table *rate_table = pll->rate_table;
-	u32 pll_numerator, pll_denominator, pll_div;
+	u32 pll_div;
 	u32 mfi, mfn, mfd, rdiv, odiv;
 	u64 fvco = parent_rate;
 	long rate = 0;
 	int i;
 
-	pll_numerator = readl_relaxed(pll->base + PLL_NUMERATOR);
-	mfn = FIELD_GET(PLL_MFN_MASK, pll_numerator);
+	if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
+		u32 pll_numerator, pll_denominator;
+
+		pll_numerator = readl_relaxed(pll->base + PLL_NUMERATOR);
+		mfn = FIELD_GET(PLL_MFN_MASK, pll_numerator);
 
-	pll_denominator = readl_relaxed(pll->base + PLL_DENOMINATOR);
-	mfd = FIELD_GET(PLL_MFD_MASK, pll_denominator);
+		pll_denominator = readl_relaxed(pll->base + PLL_DENOMINATOR);
+		mfd = FIELD_GET(PLL_MFD_MASK, pll_denominator);
+	} else {
+		mfd = 0;
+		mfn = 0;
+	}
 
 	pll_div = readl_relaxed(pll->base + PLL_DIV);
 	mfi = FIELD_GET(PLL_MFI_MASK, pll_div);
-- 
2.34.1


