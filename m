Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F95C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCVj1FlTShjtRVgqx/pUuo2vdas3/E1MArSsytI8S2Y=; b=2S+auxIvaLQAMLuvZAg5ei0Ji5
	El/2lzWu2YgzwZAUn5q1iB0UM0G3TmgqPyVHLMlgcrk+5jQE0fisAHrWREyUVPCAgKeyzFEwydWN3
	vlsyskOFV2oTRcaS7JkSu8dC80LkMJurj521pQ8HXwhJ5CbZTiwphA8/QA0XdkdkyGgDmQ5zcQxg1
	1NU4ol759mwyeyybBAFehtsnm0yphtt1NenIa4hFqHTtiOL4pk0xyL5rehuGCQmAWWe13CBR0KEXk
	RaNxNZjB6rlz7+uk6va4RoNS4+26q2VNnGo1AyBIwIot2HY/D0u2gooBKKPqCQfKaCfCjyB7wo+hy
	Kc9qUm6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18a-00000007SU4-3ZKZ;
	Wed, 29 Jul 2026 10:03:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18G-00000007S5Y-2GDu;
	Wed, 29 Jul 2026 10:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785319402;
	bh=xEeYmGMPvnAj8jbXB55YaPq0jUHYie7IR8h1C2C89Wg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ECBKyxNA0hnr2k2ijrm/u+SJYYyj8Ont1lkDYTLky8vLN3GkUBwNDuYx0Vt6MvH2l
	 5V3SJBheHsrWsfJc8TOdt0VfGHbMtDbBfnLdmS7AvihXzOQrZ2p3S+hDVsuSjczgSZ
	 QsLfM4cJsRjfOiofec7Dis+XCU7Dgxh3zm13uxAaBBkvQFsLtNceoL5TdAMXchK4ph
	 dMkbfZPoyOuR7+sCVt1+mjug8FFpmHXW0SUbPfTFovgSxagTMu4q7yksFu1sAndhHp
	 BWhWiwJQ5wxCgg9gIVjPbcmglQyfwwYeifAsEZkypWfV9Ii4d5WbdEz/MeMncdFcCf
	 0n8P06pek8qww==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF87217E0048;
	Wed, 29 Jul 2026 12:03:21 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Jul 2026 12:02:55 +0200
Subject: [PATCH v4 11/24] clk: mediatek: pll: split default
 prepare/unprepare callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mt8189-clocks-system-base-v4-11-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785319387; l=3742;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=xEeYmGMPvnAj8jbXB55YaPq0jUHYie7IR8h1C2C89Wg=;
 b=fx5ybOfhoYzmOOV8eXiyBMUHfB6Q7dC0pCNvTKXAsRkrgjUiq0uLg80gjH1bKg1Y9+TZJSKsF
 QuGOPhd1d7bAR+O4u9degOGmp84nkwZ8DfpDf5lJyXfsKgZllybNub2
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_030324_735240_B3942863 
X-CRM114-Status: GOOD (  14.08  )
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

In order to prepare the MT8189 SoC support, that requires different
registers to control PLL status and perform reset BAR, and so a
different sets of clock operations, split both mtk_pll_prepare and
mtk_pll_unprepare into several private subfunctions to factorize the
common code.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 61 ++++++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 4b0f7e2bfc5a..83a58ad23c5b 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -31,6 +31,8 @@
 /* default 7 bits integer, can be overridden with pcwibits. */
 #define INTEGER_BITS		7
 
+#define PLL_STABILIZATION_DELAY		20 /* in us */
+
 int mtk_pll_is_prepared(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
@@ -223,9 +225,9 @@ int mtk_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	return 0;
 }
 
-int mtk_pll_prepare(struct clk_hw *hw)
+static void mtk_pll_prepare_common(struct mtk_clk_pll *pll,
+				   void __iomem *en_addr)
 {
-	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 r;
 
 	r = readl(pll->pwr_addr) | CON0_PWR_ON;
@@ -236,8 +238,8 @@ int mtk_pll_prepare(struct clk_hw *hw)
 	writel(r, pll->pwr_addr);
 	udelay(1);
 
-	r = readl(pll->en_addr) | BIT(pll->data->pll_en_bit);
-	writel(r, pll->en_addr);
+	r = readl(en_addr) | BIT(pll->data->pll_en_bit);
+	writel(r, en_addr);
 
 	if (pll->data->en_mask) {
 		r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;
@@ -246,7 +248,37 @@ int mtk_pll_prepare(struct clk_hw *hw)
 
 	__mtk_pll_tuner_enable(pll);
 
-	udelay(20);
+	udelay(PLL_STABILIZATION_DELAY);
+}
+
+static void mtk_pll_unprepare_common(struct mtk_clk_pll *pll,
+				     void __iomem *en_addr)
+{
+	u32 r;
+
+	__mtk_pll_tuner_disable(pll);
+
+	if (pll->data->en_mask) {
+		r = readl(pll->base_addr + REG_CON0) & ~pll->data->en_mask;
+		writel(r, pll->base_addr + REG_CON0);
+	}
+
+	r = readl(en_addr) & ~BIT(pll->data->pll_en_bit);
+	writel(r, en_addr);
+
+	r = readl(pll->pwr_addr) | CON0_ISO_EN;
+	writel(r, pll->pwr_addr);
+
+	r = readl(pll->pwr_addr) & ~CON0_PWR_ON;
+	writel(r, pll->pwr_addr);
+}
+
+int mtk_pll_prepare(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+	u32 r;
+
+	mtk_pll_prepare_common(pll, pll->en_addr);
 
 	if (pll->data->flags & HAVE_RST_BAR) {
 		r = readl(pll->rst_bar_addr);
@@ -256,6 +288,7 @@ int mtk_pll_prepare(struct clk_hw *hw)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pll_prepare);
 
 void mtk_pll_unprepare(struct clk_hw *hw)
 {
@@ -268,22 +301,9 @@ void mtk_pll_unprepare(struct clk_hw *hw)
 		writel(r, pll->rst_bar_addr);
 	}
 
-	__mtk_pll_tuner_disable(pll);
-
-	if (pll->data->en_mask) {
-		r = readl(pll->base_addr + REG_CON0) & ~pll->data->en_mask;
-		writel(r, pll->base_addr + REG_CON0);
-	}
-
-	r = readl(pll->en_addr) & ~BIT(pll->data->pll_en_bit);
-	writel(r, pll->en_addr);
-
-	r = readl(pll->pwr_addr) | CON0_ISO_EN;
-	writel(r, pll->pwr_addr);
-
-	r = readl(pll->pwr_addr) & ~CON0_PWR_ON;
-	writel(r, pll->pwr_addr);
+	mtk_pll_unprepare_common(pll, pll->en_addr);
 }
+EXPORT_SYMBOL_GPL(mtk_pll_unprepare);
 
 static int mtk_pll_prepare_fenc_setclr(struct clk_hw *hw)
 {
@@ -312,6 +332,7 @@ const struct clk_ops mtk_pll_ops = {
 	.determine_rate = mtk_pll_determine_rate,
 	.set_rate	= mtk_pll_set_rate,
 };
+EXPORT_SYMBOL_GPL(mtk_pll_ops);
 
 const struct clk_ops mtk_pll_fenc_setclr_ops = {
 	.is_prepared	= mtk_pll_is_prepared_fenc_setclr,

-- 
2.55.0


