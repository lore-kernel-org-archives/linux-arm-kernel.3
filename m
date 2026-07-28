Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB744C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbWzvsTI30SQf61MYJkSumPCBvJo8f5hh8GqDaxsf24=; b=iU+bfEJiZr4tM+YUXJuz6PGMK9
	yEO8nhCOwKsrBD2xf7kW7o5G76GlhUy4d1u81mqtm5hb+jX/8OYBjDHj3uObSf9s1M2DP736gCQSw
	JhywqbiPQMFE05BLToqdbDD2IDxBpvVmBxVxR7k8O7+5sXEfI+D4lnaR4TNvf+1b5TLmPG5zsWxyb
	ZYYq02gRzZaw0ly/sHeHy10B6K7Yto45+YFIZ6PYmxOS/JUu+LfpeF2oCtjrKQjlv7geZ8rDxjyXT
	7y3rEOwE7687k8P8k7OrX+SlMPeT3WlgEm/eoG9kabPN1tINdceCm+BRCaBsHV3nBZRp9PkbjMh/I
	0hhw1mBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogMm-000000058G2-3qam;
	Tue, 28 Jul 2026 11:53:00 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogMf-000000058E8-3PW0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:52:55 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260728115247epoutp03d5a0aee33ae701947d5ee6289076d05b~Gce2H3-Q42105521055epoutp03w
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:52:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260728115247epoutp03d5a0aee33ae701947d5ee6289076d05b~Gce2H3-Q42105521055epoutp03w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239567;
	bh=hbWzvsTI30SQf61MYJkSumPCBvJo8f5hh8GqDaxsf24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dAA7kMbI4pq7a2Bo2RHDnCHLJrve1yAzmyai2VYJp9Y2RlqKgOjZCUP/8NCUdKD4i
	 fgMxNlSIrfF7q1CzbHe2kGWa/Ky9Z8BRkvfAD5+NzB0+JzbnO31pGI/6BKPDPJ5147
	 xyqaAf5Ql/o1TUMobpmqAmbhr/ZPhrpe2QhPnpIg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260728115246epcas5p4f89d78fccf3a138d0363a7cfc383216d~Gce1pLgQ42034920349epcas5p4w;
	Tue, 28 Jul 2026 11:52:46 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4h8Yk60qW5z6B9m9; Tue, 28 Jul
	2026 11:52:46 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6~Gce0kFyp-0256002560epcas5p24;
	Tue, 28 Jul 2026 11:52:45 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115240epsmtip165a648674550bc732bc8949467dc8337~GcevbktXi2401424014epsmtip1h;
	Tue, 28 Jul 2026 11:52:39 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 01/13] clk: samsung: clk-pll: Add supoprt for pll_4313
Date: Tue, 28 Jul 2026 17:40:59 +0530
Message-Id: <20260728121111.2077860-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115245epcas5p2ffe1f7c31c6dd85161445d61a94e82e6@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_045254_199126_15BD2C23 
X-CRM114-Status: GOOD (  16.99  )
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

From: Alim Akhtar <alim.akhtar@samsung.com>

PLLs 4313 are found in the Exynos8855 SoC and it is similar
to pll_531x except for CON8 offset, so re-using code for
pll_4313

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index e74552846ba3..b7605aa3c647 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1306,7 +1306,15 @@ static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
 	u64 mdiv, fout = parent_rate;
 
 	pll_con0 = readl_relaxed(pll->con_reg);
-	pll_con8 = readl_relaxed(pll->con_reg + 20);
+	if (pll->type == pll_4313) {
+		/* Offset for PLL_CON8 which hold FDIV different for PLL_4313
+		 * which is PLL_LOCKTIME_OFFSET - 0x4
+		 */
+		pll_con8 = readl_relaxed(pll->lock_reg - 4);
+	} else {
+		pll_con8 = readl_relaxed(pll->con_reg + 20);
+	}
+
 	mdiv = (pll_con0 >> PLL531X_MDIV_SHIFT) & PLL531X_MDIV_MASK;
 	pdiv = (pll_con0 >> PLL531X_PDIV_SHIFT) & PLL531X_PDIV_MASK;
 	sdiv = (pll_con0 >> PLL531X_SDIV_SHIFT) & PLL531X_SDIV_MASK;
@@ -1728,6 +1736,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		break;
 	case pll_531x:
 	case pll_4311:
+	case pll_4313:
 		init.ops = &samsung_pll531x_clk_ops;
 		break;
 	case pll_1031x:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index d6eb3246611b..ad47dd7b3ed2 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -49,6 +49,7 @@ enum samsung_pll_type {
 	pll_0718x,
 	pll_0732x,
 	pll_4311,
+	pll_4313,
 	pll_1017x,
 	pll_1031x,
 	pll_a9fracm,
-- 
2.34.1


