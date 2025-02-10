Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7AAC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJRfGne+1TV9ashFe4VvW6fRk2CL7nzeA1eVvRlpELA=; b=poTamsGGD9YzRaLJbe86PnDxMB
	nYeDsqE43xoAFm5T4hTNqsYBev+d1as5l2xZGWGGpPF3uq2Q1043Qo8oR2qe78L+tofqwYIUR4Zcj
	mi4L9cJNiuGIsHbAUI57XiE6U7XTH7l4WY7X5WOsd7KV2x6AQYqhvk+kzAhybzN5nM8iQpADjm/P6
	wK1e8bOHhtGc0zyv7nQUJP1E71WJn+//cY1mFimHe0req08woEdrSmGPquGmpeJkl2Pg578Farxsb
	8wur7Zzf69/EBOOMqcB984yP7kOEHoS+Yr0qeFRIr0lXx1+lnb2zutewCm0ttIIlcOB54XOoDzMbE
	po2FoFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWIW-00000000Qr0-1MZc;
	Mon, 10 Feb 2025 16:06:12 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWCx-00000000PeJ-1rUQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739203227; x=1770739227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oJRfGne+1TV9ashFe4VvW6fRk2CL7nzeA1eVvRlpELA=;
  b=I+sO7hSLKNYGfR/CnMzoaNOPia+ctdX22aNn1AS+AMD4LCWMcYrtfNiJ
   Sgf/YZrSyHYRD6/fKpkiiHTHbSOKPH84BBu8BQJPCO4DmnuogcGI3fKGu
   jz5GPeiyPRoKV8bV2jNLWhnf3f7teJug43TjBheWeUcfv58tfK+/o/xiM
   dq6Czkktu+jL7jbYct7HbL9lbX+gmnT2YxY8VBA5pDaXAY3hfOJxMohKY
   0MmsWnd4v+oB68Th1MLtAUaM2Zsw9Qgq/RQsEDvFyjrg3xvEEOZ07Pix9
   bAeWA2GkHubaCMaads4jLEC9VIIClVWUxZNdH4lVaL5nn8yq7qOcnk9ba
   A==;
X-CSE-ConnectionGUID: 7bi8+9SGRBGJDm5SGNlRTQ==
X-CSE-MsgGUID: VOKpVHugRuC/h3BGDRYaeg==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41723664"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 17:00:25 +0100
X-CheckPoint: {67AA2299-15-28232521-C0C2250B}
X-MAIL-CPID: C697A590134ACF1114AF175211420857_4
X-Control-Analysis: str=0001.0A006366.67AA2299.00E4,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E899B168250;
	Mon, 10 Feb 2025 17:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739203221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oJRfGne+1TV9ashFe4VvW6fRk2CL7nzeA1eVvRlpELA=;
	b=MJEPmEx0leaC3HMJHT8d+3y3TIJ+bqMiLiiuFGMoZk7/fn8RQsGuH8CcNycwyIpJQJib5G
	IfWedpQhjt8/b+W9LCQ3897/sQk9v2lv4XN5uUjlmV/ZxZRxZgqjgp/mcr2OljSqbAbrPf
	FILMW8YgU8Wmf20mpMxEZK3vMFgcFFlhUD8fvdn0C69T2UnOeKMeyzKbtdK9zES5U+0LPS
	aFvESH24NWQT3ETJP5xQPYcxMsKQd1Ym9mUmf6xFBYLeFmuamlvhJMqXFtVWSVnxQKRipZ
	W9Ep5oYoNbT4NvXu42fSJp2pOeL1WEgT0TKmaTwwyJWF5IcchWuuUvHRNCNlIw==
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
Subject: [RFC PATCH 2/3] clk: imx: clk-fracn-gppll: Refactor clk_fracn_gppll_calc_rate
Date: Mon, 10 Feb 2025 17:00:10 +0100
Message-Id: <20250210160012.783446-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210160012.783446-1-alexander.stein@ew.tq-group.com>
References: <20250210160012.783446-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_080027_787854_9FA5BEFB 
X-CRM114-Status: GOOD (  13.30  )
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

Move the frequency calculation into its dedicated function for multiple
usage. No functional change.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 54 ++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 3aef548110e25..a7d57fbe93196 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -150,35 +150,15 @@ static long clk_fracn_gppll_round_rate(struct clk_hw *hw, unsigned long rate,
 	return rate_table[pll->rate_count - 1].rate;
 }
 
-static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+static long clk_fracn_gppll_calc_rate(struct clk_fracn_gppll *pll, u32 mfn,
+				      u32 mfd, u32 mfi, u32 rdiv, u32 odiv,
+				      unsigned long parent_rate)
 {
-	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
 	const struct imx_fracn_gppll_rate_table *rate_table = pll->rate_table;
-	u32 pll_div;
-	u32 mfi, mfn, mfd, rdiv, odiv;
 	u64 fvco = parent_rate;
 	long rate = 0;
 	int i;
 
-	if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
-		u32 pll_numerator, pll_denominator;
-
-		pll_numerator = readl_relaxed(pll->base + PLL_NUMERATOR);
-		mfn = FIELD_GET(PLL_MFN_MASK, pll_numerator);
-
-		pll_denominator = readl_relaxed(pll->base + PLL_DENOMINATOR);
-		mfd = FIELD_GET(PLL_MFD_MASK, pll_denominator);
-	} else {
-		mfd = 0;
-		mfn = 0;
-	}
-
-	pll_div = readl_relaxed(pll->base + PLL_DIV);
-	mfi = FIELD_GET(PLL_MFI_MASK, pll_div);
-
-	rdiv = FIELD_GET(PLL_RDIV_MASK, pll_div);
-	odiv = FIELD_GET(PLL_ODIV_MASK, pll_div);
-
 	/*
 	 * Sometimes, the recalculated rate has deviation due to
 	 * the frac part. So find the accurate pll rate from the table
@@ -222,6 +202,34 @@ static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned lon
 	return (unsigned long)fvco;
 }
 
+static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
+	u32 pll_div;
+	u32 mfi, mfn, mfd, rdiv, odiv;
+
+	if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
+		u32 pll_numerator, pll_denominator;
+
+		pll_numerator = readl_relaxed(pll->base + PLL_NUMERATOR);
+		mfn = FIELD_GET(PLL_MFN_MASK, pll_numerator);
+
+		pll_denominator = readl_relaxed(pll->base + PLL_DENOMINATOR);
+		mfd = FIELD_GET(PLL_MFD_MASK, pll_denominator);
+	} else {
+		mfd = 0;
+		mfn = 0;
+	}
+
+	pll_div = readl_relaxed(pll->base + PLL_DIV);
+	mfi = FIELD_GET(PLL_MFI_MASK, pll_div);
+
+	rdiv = FIELD_GET(PLL_RDIV_MASK, pll_div);
+	odiv = FIELD_GET(PLL_ODIV_MASK, pll_div);
+
+	return clk_fracn_gppll_calc_rate(pll, mfn, mfd, mfi, rdiv, odiv, parent_rate);
+}
+
 static int clk_fracn_gppll_wait_lock(struct clk_fracn_gppll *pll)
 {
 	u32 val;
-- 
2.34.1


