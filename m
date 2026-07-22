Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D945C531C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+Zg16Nd+8Y71u1eWZhDdWW4ImjjdugVLt2zrpnJS8c=; b=13nLhmBvedZPlRgQFAIIgNYtMH
	hZtsCKi0q8hTV8zLyIFULCG17mrjdu0h6BciVxWS+3Ty++h7MulS//Vk01EzayykpW/zMnq4PSIjW
	wmNRNqGCRHWd/R4qez2QPp0TNUjXIjNk3Q6ryFJ2cMxwqP+kjlVuoUXrdNqKA+L4A2x0u0mTDPvJs
	/zhed8YlaoXZyMzGa7PJF6svym4JG5IvasYKXiu7EChatEyLxOUGM5Wq9XlRrPSY3Dv6fdYJohx8T
	JtR01a7SVhUVbyz7vwTZDkicL5zRfr9NfMJtQK2nLAAJv+oKiRBAO8qcNYyg0umOrrg/OFTQTsIJY
	pFZYAQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdnr-0000000Ckok-1zeT;
	Wed, 22 Jul 2026 20:44:31 +0000
Received: from mail-43171.protonmail.ch ([185.70.43.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdnd-0000000Ckjb-0Gww
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail3; t=1784753055; x=1785012255;
	bh=c+Zg16Nd+8Y71u1eWZhDdWW4ImjjdugVLt2zrpnJS8c=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ah7B1VZ2lgy5N8NphkQArBrW71+Tpxwvo3UikPcXLYENJB0gMQ7wQZaQ2byx21VOI
	 /SxwN3isaiMosqMF7XoHD/ygcQxOriYlU7R6H+uWBBwUwcq38PSfDa1jk61GsEgS0z
	 PCCuq8WYqYJFqmJOhB83IrFmENn1ao6wTb9la4aqJNSy7FN1z0Rc3lmdY5KaqQATJ8
	 yBSYZ37GRJlRyhsy6s5tDAzJ5sM5gWm4xAM+QjOhFXmpNGL/Bh/ZOCPUKvDQaOSsNI
	 4sGEfKsxVguESKnOY12y4bSRapYBEjUiCi6HMCAkckMmGpyRZGY5ajlgtFhoHnB8lz
	 Lz+CwBsXHmovQ==
X-Pm-Submission-Id: 4h55p51vXBz1DDXJ
From: Alexandru Chimac <alex@chimac.ro>
Date: Wed, 22 Jul 2026 23:44:04 +0300
Subject: [PATCH v3 3/5] clk: samsung: clk-pll: Add support for pll_1061x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-exynos9610-clocks-v3-3-c672a2a30889@chimac.ro>
References: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
In-Reply-To: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Chimac <alex@chimac.ro>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784753044; l=4101;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=aT/7UDwG7HucZEHkHhBoKSD+EL5+NRiwl5XDslaNRL0=;
 b=Zrb5hMnWLoZ1jMurX2CF1f2GuwWZxbhvxNoH0kvPnc/9TAJq7iwNRYhufVi9XgZG6yoOEyFE+
 2+APvrbuPQnBEgtTKdE4I8jCg/jsqDzmMkI7k98CjVmjmI6lbidFYm1
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_134417_268871_C70FBDFE 
X-CRM114-Status: GOOD (  14.17  )
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

These PLLs are found in the Exynos9610 and Exynos9810 SoCs, and
are similar to pll_1460x (using CON3 instead of CON1), so the code
for that can handle this PLL with a few small adaptations.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 drivers/clk/samsung/clk-pll.c | 29 ++++++++++++++++++++++-------
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index e74552846ba3..2cda87235fa2 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -781,15 +781,20 @@ static unsigned long samsung_pll46xx_recalc_rate(struct clk_hw *hw,
 	u64 fvco = parent_rate;
 
 	pll_con0 = readl_relaxed(pll->con_reg);
-	pll_con1 = readl_relaxed(pll->con_reg + 4);
-	mdiv = (pll_con0 >> PLL46XX_MDIV_SHIFT) & ((pll->type == pll_1460x) ?
+	if (pll->type == pll_1061x)
+		pll_con1 = readl_relaxed(pll->con_reg + 0xc);
+	else
+		pll_con1 = readl_relaxed(pll->con_reg + 0x4);
+	mdiv = (pll_con0 >> PLL46XX_MDIV_SHIFT) & (((pll->type == pll_1460x)
+				|| (pll->type == pll_1061x)) ?
 				PLL1460X_MDIV_MASK : PLL46XX_MDIV_MASK);
 	pdiv = (pll_con0 >> PLL46XX_PDIV_SHIFT) & PLL46XX_PDIV_MASK;
 	sdiv = (pll_con0 >> PLL46XX_SDIV_SHIFT) & PLL46XX_SDIV_MASK;
 	kdiv = pll->type == pll_4650c ? pll_con1 & PLL4650C_KDIV_MASK :
 					pll_con1 & PLL46XX_KDIV_MASK;
 
-	shift = ((pll->type == pll_4600) || (pll->type == pll_1460x)) ? 16 : 10;
+	shift = ((pll->type == pll_4600) || (pll->type == pll_1460x)
+		 || (pll->type == pll_1061x)) ? 16 : 10;
 
 	fvco *= (mdiv << shift) + kdiv;
 	do_div(fvco, (pdiv << sdiv));
@@ -827,7 +832,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	con0 = readl_relaxed(pll->con_reg);
-	con1 = readl_relaxed(pll->con_reg + 0x4);
+	if (pll->type == pll_1061x)
+		con1 = readl_relaxed(pll->con_reg + 0xc);
+	else
+		con1 = readl_relaxed(pll->con_reg + 0x4);
 
 	if (!(samsung_pll46xx_mpk_change(con0, con1, rate))) {
 		/* If only s change, change just s value only*/
@@ -845,7 +853,7 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
 		lock = 0xffff;
 
 	/* Set PLL PMS and VSEL values. */
-	if (pll->type == pll_1460x) {
+	if ((pll->type == pll_1460x) || (pll->type == pll_1061x)) {
 		con0 &= ~((PLL1460X_MDIV_MASK << PLL46XX_MDIV_SHIFT) |
 			(PLL46XX_PDIV_MASK << PLL46XX_PDIV_SHIFT) |
 			(PLL46XX_SDIV_MASK << PLL46XX_SDIV_SHIFT));
@@ -862,7 +870,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
 			(rate->sdiv << PLL46XX_SDIV_SHIFT);
 
 	/* Set PLL K, MFR and MRR values. */
-	con1 = readl_relaxed(pll->con_reg + 0x4);
+	if (pll->type == pll_1061x)
+		con1 = readl_relaxed(pll->con_reg + 0xc);
+	else
+		con1 = readl_relaxed(pll->con_reg + 0x4);
 	con1 &= ~((PLL46XX_KDIV_MASK << PLL46XX_KDIV_SHIFT) |
 			(PLL46XX_MFR_MASK << PLL46XX_MFR_SHIFT) |
 			(PLL46XX_MRR_MASK << PLL46XX_MRR_SHIFT));
@@ -873,7 +884,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	/* Write configuration to PLL */
 	writel_relaxed(lock, pll->lock_reg);
 	writel_relaxed(con0, pll->con_reg);
-	writel_relaxed(con1, pll->con_reg + 0x4);
+	if (pll->type == pll_1061x)
+		writel_relaxed(con1, pll->con_reg + 0xc);
+	else
+		writel_relaxed(con1, pll->con_reg + 0x4);
 
 	/* Wait for PLL lock */
 	return samsung_pll_lock_wait(pll, PLL46XX_LOCKED);
@@ -1700,6 +1714,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_4650:
 	case pll_4650c:
 	case pll_1460x:
+	case pll_1061x:
 		if (!pll->rate_count)
 			init.ops = &samsung_pll46xx_clk_min_ops;
 		else
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index d6eb3246611b..44f5e99d303d 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -45,6 +45,7 @@ enum samsung_pll_type {
 	pll_531x,
 	pll_1051x,
 	pll_1052x,
+	pll_1061x,
 	pll_0717x,
 	pll_0718x,
 	pll_0732x,

-- 
2.54.0


