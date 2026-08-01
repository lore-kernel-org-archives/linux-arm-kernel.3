Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E06C55179
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 11:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=im0ZvwPiIBY8zTi3HDj4CFP94iV1UVrmA4gmdCqobZs=; b=wcJp2/kRkTCQhqSYLw+DypHsjR
	DOQUOhbgDNc6AuETPIgALj/wxUzFhAMTpZFR3+XSItfbxr9Wwpf7ICmylZOn/w47fvLagOi8r7K6Z
	vPBQ1xWt+6bB4y9io2tZapasxdLdX1DhrUY1Cq5oaWA8mXlZLqazhdZRYCx8gLVWPylsTjtLb5wLR
	zSukQU+OEceMrVbFtSY8FCBpO+mNibd7sHmFCDHTbYqFwCgDTrVTVjUYPne9WBI8Vw6UeXiJoeslb
	ZDkAVZXn+WX7xt9WPSqFbsY8Pc9ks0RDyB9oFwjVJ0A4J/W/JT0fXlJxZs0Rxi5n00GqVvRKqfaYh
	OjpI7E/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mZ-0000000EDSu-2cOF;
	Sat, 01 Aug 2026 11:21:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mQ-0000000ED9o-3O84;
	Sat, 01 Aug 2026 11:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785583273;
	bh=/oJY/lp7GPxMngsUs+sgToa+ZkeBA3vDXdxfmtcPW88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AUIj07zG338Rl9TMAeFWwwRwphsPymGVWTaqQXuppNvNRfsRcLRQQakjfbQ/1gFPo
	 4Hpd2mCJUIqDgeAjPUnrTdGSS229nZUPAeD9zI97QPgBgPwN3q2IpVOjJ3u/kMKhho
	 5eueZkjcWP3A1qm8bkyJNenfx5GMMEl6imgQB40bEYx9ATcfXPRXyeDnV2roAVX9eH
	 NbnjDuXfivIVZflEpE1S5y6U0yHjUHTq+rx7kY2sn3+QvbXdvBjhDfT5r42ddcbvXr
	 tD4lVE3mncHsMRbyONlG8rnyBrPh6/+NW2OBxtagavrpz7lxybQ7Vd8eFpeZfEry76
	 a5vH1kmX0IuaA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8BD8C17E0937;
	Sat, 01 Aug 2026 13:21:12 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Sat, 01 Aug 2026 13:20:55 +0200
Subject: [PATCH v5 09/25] clk: mediatek: Harmonize mtk_pll_fenc related
 symbol names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-mt8189-clocks-system-base-v5-9-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785583260; l=3997;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=/oJY/lp7GPxMngsUs+sgToa+ZkeBA3vDXdxfmtcPW88=;
 b=pjyDeVWi5Q39miN/vOSNqJGfO/UrVr/lYEGoZnYGW0Y6JzGKg1IVYaOOGMObyqVGjk6ofB9ey
 ZGhBV2FMKclBTQl0zqsPtu2GjHq+appfXqyrRYOCitQ5OYwimjd8ZTm
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_042127_053578_CC220A1C 
X-CRM114-Status: GOOD (  13.66  )
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

To prepare for the new clock ops set addition, with support for set/clr
enable logic only, rename mtk_pll_fenc_setclr_ops and its callback names
to harmonize the naming with the same suffix.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c   |  2 +-
 drivers/clk/mediatek/clk-pll.c               | 16 ++++++++--------
 drivers/clk/mediatek/clk-pll.h               |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-apmixedsys.c b/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
index c4ebb0170b82..41c5117b18f8 100644
--- a/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
@@ -83,7 +83,7 @@
 		.en_set_reg = PLLEN_ALL_SET,			\
 		.en_clr_reg = PLLEN_ALL_CLR,			\
 		.pll_en_bit = _pll_en_bit,			\
-		.ops = &mtk_pll_fenc_clr_set_ops,		\
+		.ops = &mtk_pll_fenc_setclr_ops,		\
 }
 
 struct mtk_pll_desc {
diff --git a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
index 7dcc164627c5..8a69f88e15a7 100644
--- a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
+++ b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
@@ -162,7 +162,7 @@
 		.en_set_reg = VLP_PLLEN_ALL_SET,		\
 		.en_clr_reg = VLP_PLLEN_ALL_CLR,		\
 		.pll_en_bit = _pll_en_bit,			\
-		.ops = &mtk_pll_fenc_clr_set_ops,		\
+		.ops = &mtk_pll_fenc_setclr_ops,		\
 }
 
 static DEFINE_SPINLOCK(mt8196_clk_vlp_lock);
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index e97064868908..ee478bc64085 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -38,7 +38,7 @@ int mtk_pll_is_prepared(struct clk_hw *hw)
 	return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) != 0;
 }
 
-static int mtk_pll_fenc_is_prepared(struct clk_hw *hw)
+static int mtk_pll_is_prepared_fenc_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 
@@ -285,7 +285,7 @@ void mtk_pll_unprepare(struct clk_hw *hw)
 	writel(r, pll->pwr_addr);
 }
 
-static int mtk_pll_prepare_setclr(struct clk_hw *hw)
+static int mtk_pll_prepare_fenc_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 
@@ -297,7 +297,7 @@ static int mtk_pll_prepare_setclr(struct clk_hw *hw)
 	return 0;
 }
 
-static void mtk_pll_unprepare_setclr(struct clk_hw *hw)
+static void mtk_pll_unprepare_fenc_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 
@@ -313,15 +313,15 @@ const struct clk_ops mtk_pll_ops = {
 	.set_rate	= mtk_pll_set_rate,
 };
 
-const struct clk_ops mtk_pll_fenc_clr_set_ops = {
-	.is_prepared	= mtk_pll_fenc_is_prepared,
-	.prepare	= mtk_pll_prepare_setclr,
-	.unprepare	= mtk_pll_unprepare_setclr,
+const struct clk_ops mtk_pll_fenc_setclr_ops = {
+	.is_prepared	= mtk_pll_is_prepared_fenc_setclr,
+	.prepare	= mtk_pll_prepare_fenc_setclr,
+	.unprepare	= mtk_pll_unprepare_fenc_setclr,
 	.recalc_rate	= mtk_pll_recalc_rate,
 	.determine_rate	= mtk_pll_determine_rate,
 	.set_rate	= mtk_pll_set_rate,
 };
-EXPORT_SYMBOL_GPL(mtk_pll_fenc_clr_set_ops);
+EXPORT_SYMBOL_GPL(mtk_pll_fenc_setclr_ops);
 
 struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 					const struct mtk_pll_data *data,
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index f49dc2732ffe..d6d34840c09d 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -85,7 +85,7 @@ void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
 			     struct clk_hw_onecell_data *clk_data);
 
 extern const struct clk_ops mtk_pll_ops;
-extern const struct clk_ops mtk_pll_fenc_clr_set_ops;
+extern const struct clk_ops mtk_pll_fenc_setclr_ops;
 
 static inline struct mtk_clk_pll *to_mtk_clk_pll(struct clk_hw *hw)
 {

-- 
2.55.0


