Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E86C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYkD1q0aRqr6KElRdE5BgRm9Og/hHqVfWxuBdCdQFY4=; b=SWQTKY6XNZxGnisMQf9O/4mNMw
	T2LDPNRJqlSzF7Jettt+hp87pCIS1O4UYaRgOnEBvJ5XODTrdOvXeWy6Wsjbpp6vB6ghUxyd8orVr
	gvTKYaeVfIWRv7BiZS04rgpzh+M0mM7bqwVx11N/7Ij3jNhrRWe5FuOHOks6/TyOXnwdNlLUjlAP4
	mVbWKQnyq6yDbhHB8k+3cwckSF5Hp5SiYFsUZOVkCLk92k0wQacjqfjo0HV3R8QgvsCnopoCvYFM8
	/uWeu1i6Mk/c6uHmnhd66Sb4pU+mLsYj+ISI2PsF5Ri0S13j1UVey2SQfmLFmwyMmtYUAgNWp4tDg
	oluQ+q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18b-00000007SV6-0xBe;
	Wed, 29 Jul 2026 10:03:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18H-00000007S6k-3tfk;
	Wed, 29 Jul 2026 10:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785319404;
	bh=pfLgn1qY0N8aVh+bblJ5HZjrcUlpk05lmxUhVzfshyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BpHbs3SE8x1nFPTtEFeiYUImi+LfzWd5Yoi7jWu19Uiutdte4BFDQ6rEk/JFchBkT
	 ZRohYvWuY/yR2jvWSVIYNzlnBOfMF3ZoqRJQNsZ87f8Q1kTVL9OzyPqbf3ZvNcnbU0
	 MBidqp+2uU90GmRliBwM66fEyNSmFqvaUpE5iiKh2mpK1IyTM55+tpLWeKkssbt65o
	 IxbYKZBsvq0+Cp8IozAGvoCK0WCjAnMUCK4T2/lCCZqkLC3nZMt9hm6sIo0wcRSa19
	 B8Ln87+/8+YyMv3X/TSTBM3tUiem1Pa03QYaiJFJ+47vraamv1jG18NqEXGbUbbL1S
	 9OiS/1rb8mPsw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EFA0C17E015B;
	Wed, 29 Jul 2026 12:03:22 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Jul 2026 12:02:56 +0200
Subject: [PATCH v4 12/24] clk: mediatek: pll: Add ops for PLLs using
 set/clr regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mt8189-clocks-system-base-v4-12-e356b813a64c@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785319387; l=4220;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=pfLgn1qY0N8aVh+bblJ5HZjrcUlpk05lmxUhVzfshyU=;
 b=Th+HKBijm1oW5R9Wh19eu21OSrArNPUdc7HYCjPbbM8vn4ch0tZkh2f4uz3DVRZNMKQVWPbxx
 BzgbVjxh7bRDuFBTmB2A3Z8vsk7eIZL4r3hMPaIMVM/I4QdSW4HDEXi
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_030326_177169_55A32232 
X-CRM114-Status: GOOD (  17.00  )
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

MT8189 SoC uses a new combination of status and set/clr registers to
control its PLL power state and perform BAR reset, that are different
than the current default clock prepare/unprepare operations are using.

Add new set of PLL clock operations to support this logic that relies
on the following registers for prepare/unprepare operations:
  - en/en_set/en_clr, rather than pwr register, for PLL power
    control
  - rst_bar/rst_bar_set/rst_bar_clr, rather than default rst_bar
    register for BAR reset control

Also, handle rst_bar register setting/clearing with a timeout, to
verify the operation was correctly performed.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 54 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-pll.h |  5 ++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 83a58ad23c5b..cf26f77303d4 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -32,6 +33,7 @@
 #define INTEGER_BITS		7
 
 #define PLL_STABILIZATION_DELAY		20 /* in us */
+#define RST_BAR_TIMEOUT			20 /* in us */
 
 int mtk_pll_is_prepared(struct clk_hw *hw)
 {
@@ -305,6 +307,48 @@ void mtk_pll_unprepare(struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(mtk_pll_unprepare);
 
+int mtk_pll_prepare_setclr(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+	u32 val = 0;
+	int ret;
+
+	mtk_pll_prepare_common(pll, pll->en_set_addr);
+
+	if (pll->data->flags & HAVE_RST_BAR) {
+		writel(pll->data->rst_bar_mask, pll->rst_bar_set_addr);
+
+		ret = readl_poll_timeout(pll->rst_bar_addr, val,
+					(val & pll->data->rst_bar_mask), 1,
+					RST_BAR_TIMEOUT);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_pll_prepare_setclr);
+
+void mtk_pll_unprepare_setclr(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+	u32 val = 0;
+	int ret;
+
+	if (pll->data->flags & HAVE_RST_BAR) {
+		writel(pll->data->rst_bar_mask, pll->rst_bar_clr_addr);
+
+		ret = readl_poll_timeout(pll->rst_bar_addr, val,
+					!(val & pll->data->rst_bar_mask), 1,
+					RST_BAR_TIMEOUT);
+		if (ret)
+			return;
+	}
+
+	mtk_pll_unprepare_common(pll, pll->en_clr_addr);
+}
+EXPORT_SYMBOL_GPL(mtk_pll_unprepare_setclr);
+
 static int mtk_pll_prepare_fenc_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
@@ -334,6 +378,16 @@ const struct clk_ops mtk_pll_ops = {
 };
 EXPORT_SYMBOL_GPL(mtk_pll_ops);
 
+const struct clk_ops mtk_pll_setclr_ops = {
+	.is_prepared	= mtk_pll_is_prepared,
+	.prepare	= mtk_pll_prepare_setclr,
+	.unprepare	= mtk_pll_unprepare_setclr,
+	.recalc_rate	= mtk_pll_recalc_rate,
+	.determine_rate = mtk_pll_determine_rate,
+	.set_rate	= mtk_pll_set_rate,
+};
+EXPORT_SYMBOL_GPL(mtk_pll_setclr_ops);
+
 const struct clk_ops mtk_pll_fenc_setclr_ops = {
 	.is_prepared	= mtk_pll_is_prepared_fenc_setclr,
 	.prepare	= mtk_pll_prepare_fenc_setclr,
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index 3aaf3a7654b5..296bed073290 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -92,6 +92,7 @@ void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
 
 extern const struct clk_ops mtk_pll_ops;
 extern const struct clk_ops mtk_pll_fenc_setclr_ops;
+extern const struct clk_ops mtk_pll_setclr_ops;
 
 static inline struct mtk_clk_pll *to_mtk_clk_pll(struct clk_hw *hw)
 {
@@ -104,6 +105,10 @@ int mtk_pll_prepare(struct clk_hw *hw);
 
 void mtk_pll_unprepare(struct clk_hw *hw);
 
+int mtk_pll_prepare_setclr(struct clk_hw *hw);
+
+void mtk_pll_unprepare_setclr(struct clk_hw *hw);
+
 unsigned long mtk_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate);
 
 void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,

-- 
2.55.0


