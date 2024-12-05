Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C09BE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QK+GhkwqNWtQL6itiLSFflpYwQVDZQh8XSlU0rhiq7c=; b=EY1ScQ7jZK+FQ09fIecu82jufX
	JUBVFQ9BrCQexlbfSsgrGX26TRSr8Y2IYa6C2SBK8Cw5DIb6CebP6VtxnZSWf+FcezFlWzs9uOADP
	3+U4tYtzRck6BU7EMMGx+4TXg+BiRKpeC4G4IY5U5oy2bGe9If0oWi1g1+kgQTZ+o9YKvXRWmwioQ
	YCYJd7rXQ7eQ6LEDetXOAJXw9791ojlyxbtyJ4/A/1x4cfe/W93Yb8xOL0JHJsTr2aK5OknHoxTMg
	wSjNz/OrQKOMoLsnLxdEApHKgVF/6immqR84fKag4T4L/KuE60glyF1nvxGQmA10deiXNWOwZYvFm
	iH8tanhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHif-0000000HELW-3dqi;
	Thu, 05 Dec 2024 19:41:01 +0000
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHdw-0000000HDTF-07j7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 19:36:11 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y44Pf0r41zGp5Y;
	Thu, 05 Dec 2024 19:36:06 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y44PV08PYz6tkN;
	Thu,  5 Dec 2024 19:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733427360;
	bh=Djs3hVM5WphLELs/VNAZd7kS4SlmMzLUs16stVgHiRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SVPCLkfULUvZ40wR4NeRtqF5+1QTxjX7UdMZGeibEIFNdQAIaTmzM/M/Ib+RiZ9Au
	 ggsRluXs1iJXgyWTZRJv0jQY/5eVEyecPej1VqEfFZ+T8Q3WFytjV00+z2yH2V1uDG
	 gykyt6hBokBjimx8ZCvkuIiklqBi9uFnZJ0pJi7448tnqAyfnMF1zj5oPfQ4tlIzI2
	 jw0Ju5QiQi7QvPK5sQRgduNfpM+U0B4tIdGIPHYNHAJ5tyXU7hTqn/WTbt3Jn4gpYD
	 +JZ/wZ7+i/wu0OUh4bD0W7lr+K4xVjZDtVZSSdDXGKC/dAESrSSvaPpTXBCb5C577l
	 6b5BFKVItnNVg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
Date: Thu,  5 Dec 2024 20:34:22 +0100
Message-ID: <20241205193423.783815-3-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
References: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_113608_085100_137EB7F9 
X-CRM114-Status: GOOD (  15.12  )
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

These PLLs are found in the Exynos990 SoC. The PLLs are similar
to pll0822x.

pll0717x and pll0718x are an exception, and they use the mdiv
mask from 1718X (that is, one bit smaller).

Apart from that, the masks/shifts are identical to those of 0822x.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/clk/samsung/clk-pll.c | 14 ++++++++++++--
 drivers/clk/samsung/clk-pll.h |  3 +++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index be6b51694919..2e94bba6c396 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -430,7 +430,10 @@ static const struct clk_ops samsung_pll36xx_clk_min_ops = {
 #define PLL0822X_LOCK_STAT_SHIFT	(29)
 #define PLL0822X_ENABLE_SHIFT		(31)
 
-/* PLL1418x is similar to PLL0822x, except that MDIV is one bit smaller */
+/*
+ * PLL1418x, PLL0717x and PLL0718x are similar
+ * to PLL0822x, except that MDIV is one bit smaller
+ */
 #define PLL1418X_MDIV_MASK		(0x1FF)
 
 static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
@@ -441,10 +444,14 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 	u64 fvco = parent_rate;
 
 	pll_con3 = readl_relaxed(pll->con_reg);
-	if (pll->type != pll_1418x)
+
+	if (pll->type != pll_1418x &&
+	    pll->type != pll_0717x &&
+	    pll->type != pll_0718x)
 		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL0822X_MDIV_MASK;
 	else
 		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL1418X_MDIV_MASK;
+
 	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
 	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
 
@@ -1377,6 +1384,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_0516x:
 	case pll_0517x:
 	case pll_0518x:
+	case pll_0717x:
+	case pll_0718x:
+	case pll_0732x:
 		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 858ab367eb65..6ddc54d173a0 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -45,6 +45,9 @@ enum samsung_pll_type {
 	pll_531x,
 	pll_1051x,
 	pll_1052x,
+	pll_0717x,
+	pll_0718x,
+	pll_0732x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.45.2


