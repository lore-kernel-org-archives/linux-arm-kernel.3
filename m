Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4C3C79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2rcioPmzbUKXe4X6S487qXlDjlB4UWSVaIlNIbzY1s=; b=XytboiNZcqTdV+b+8v8vE6NKvw
	KWr0ua4CEEU4R5hATGEQuaSUG20Flf6J1RNeSsLGzTbd8PHy+32wZ0fiP86McyQe6Xi2FsdA/Kx9t
	8sFI41y8xsFqCGwTMU+SSAFY2TkxJIl/0yjifMX8V15j4ZdQuHO3qUlTVJNgY73MZhDJrIPkG5zLF
	Nq6193BJWR+puzU53ePPk+Og/+Coj2wISwHFu15Cux1bPWXAj5Cv+ZWdaNIG2+3DHdV7bqEutxIQ1
	sRvcNMpv8GKB0aaV+2cgN7yM96VXWicCJUMVI6iSdbFTKQNuUH8zU8dHiiqZWzu0d6/93QoA75+Uw
	XajULrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJr-00000002bn0-1YvM;
	Fri, 04 Sep 2026 15:59:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJf-00000002bS9-2YV7;
	Fri, 04 Sep 2026 15:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537537;
	bh=0D+0oi/WBwfqLpHH6F3fD5da8wlJsqjrCr/tqNkivPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OKgpEPZj2TjyRt2dMljMDCfFBD1dyaLwy1195Cg6twT9by7qqek7NhRKU5l3Dl/c8
	 Vk7FZyOL/vsyor10i6+k4uhnlyrBIKSB6oafn7Lhb0L6iCDgyfmcONoLABGjiVWr+w
	 2eyWlxGNLgRxSn49lsCQqwzy+9OI9MA1piB3OPhcqye8vtV2UpC+6bLhlLW6jgKCiQ
	 OW/9/QKabGTQ71QXIFP8b03BKkpdsPL+9f1GBCr6GSnaVBfeXF1D1s7u/2zkofKReV
	 SzrO1rmsoFC1gyNEImG7Wu5LgO/gQADAfbGTJxXvqVMaP+ROnOsNHXHf3qMqp1KAjN
	 EsWmD+kEIQM1g==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 054FD17E1298;
	Fri, 04 Sep 2026 17:58:55 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:20 +0200
Subject: [PATCH v6 09/27] clk: mediatek: Harmonize mtk_pll_fenc related
 symbol names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-9-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=4045;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=0D+0oi/WBwfqLpHH6F3fD5da8wlJsqjrCr/tqNkivPM=;
 b=yEWFTBIx6LNS1j6uJyf9hc0+BKZGAQ35f0OwqVDvM3hi+zdzO1OPztdZ9GniO39YRjRtB7uJA
 fMqF1L/V65XCCHKWvghpl9m4b3aSs3SXKUatu8BESwv65LWE+PXnobG
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_085859_824283_F7DA6C98 
X-CRM114-Status: GOOD (  13.96  )
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

Reviewed-by: Brian Masney <bmasney@redhat.com>
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
index ee88dc4a231a..814709db2924 100644
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


