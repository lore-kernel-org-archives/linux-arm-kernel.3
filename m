Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45780CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 20:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32r8I0dbbvPxxnssyBIKBjZDYmfILScTBNW9LtvALP4=; b=azgkL1Rjm8dtYkRfsxJKRfdBet
	m87CLyuMVD6D5mCPgqh+vjxK+XbaQnmfziCuKrMhSV+rjbVF+ZAakUd+ngR4PDhkqOl3oGgJJ616J
	26VJsDa/w2HRIxzlpyayikxaXbqr7CLJGgyNfkgFRZxVcH9CRyPqTmzyu9ZRCHpNb1mXzn50kHkt1
	kGRuazCfhYkkezpf5/pEcyLYMN4SSYDHheGzOzeF9wqxIVSiAGqzq5/WVaiUFpCcVriDBGpkkYrPw
	DksAqTriWx289b1N6coiWcyTvvKG3E3r8qiJZzgrsjte2vOTHkkkHLh/Qgcb3M8O+L0EuWY6vclZn
	P2KLMI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7K25-00000009Mn9-2Hpy;
	Fri, 10 Oct 2025 20:48:09 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7K20-00000009MhD-2hwg;
	Fri, 10 Oct 2025 20:48:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760129269; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q6ekL3iEiAwGUU1vI++KUyIhWqYIBholVqOHIa1G10csdr79V2XRtG0R1wmdpEeTv3YCrUiZKMQdNrOe9Hp2rnqV50mcF4psJYnELvyY0eytS9rqUJPvDtdJbcYi7o7Nidv1D7UTyN5X9WlDU+/CJF7S6zt0uae1cpeNhlk+8J0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760129269; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=32r8I0dbbvPxxnssyBIKBjZDYmfILScTBNW9LtvALP4=; 
	b=dBg8bn3FHRe86YsOzhLvrNaMPMCZjyXRF8OdEKAPR1c/52z1YZs+P5iiBH9yKwT0AE7nnOsLG/V1WUMJ38OnV40BqujluuSvwJwKVGUt/c0Cx5UVh4ybGNl2itVsN724S/qENbwr/uoW7I//HwC/o+JSo6FMFv0+4LCfcAOliZs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760129269;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=32r8I0dbbvPxxnssyBIKBjZDYmfILScTBNW9LtvALP4=;
	b=ArToftCJpNVDosIkvFQTfMdG0tY2Aw/N3t+/kfTATAh7x1ExI9K8Zr5LzOg9t3bZ
	ebOH/+cTYNQRBV6+YswWIiu0yhJUMC5sw3YaESF7IvDYl4FH4owXWo3Hb3j0jVmapog
	5AQrgWxUcNaMfz+UhG04oOX+QRdTUoQTgSGUOw14=
Received: by mx.zohomail.com with SMTPS id 176012926846849.15724721205868;
	Fri, 10 Oct 2025 13:47:48 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 10 Oct 2025 22:47:11 +0200
Subject: [PATCH v3 3/5] clk: mediatek: Pass device to clk_hw_register for
 PLLs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-mtk-pll-rpm-v3-3-fb1bd15d734a@collabora.com>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
In-Reply-To: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 Laura Nao <laura.nao@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_134804_786318_E6DD47AB 
X-CRM114-Status: GOOD (  15.06  )
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

Passing the struct device pointer to clk_hw_register allows for runtime
power management to work for the registered clock controllers. However,
the mediatek PLL clocks do not do this.

Change this by adding a struct device pointer argument to
mtk_clk_register_pll, and fix up the only other user of it. Also add a
new member to the struct mtk_clk_pll for the struct device pointer,
which is set by mtk_clk_register_pll and is used by
mtk_clk_register_pll_ops.

If mtk_clk_register_pll is called with a NULL struct device pointer,
then everything still works as expected; the clock core will simply
treat them as previously, i.e. without runtime power management.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c   | 9 ++++++---
 drivers/clk/mediatek/clk-pll.h   | 4 +++-
 drivers/clk/mediatek/clk-pllfh.c | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 5caf91ae9ddbe4f4d7052864adf0a5a70bda66bc..c4f9c06e5133dbc5902f261353c197fbde95e54d 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -366,7 +366,7 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
 
-	ret = clk_hw_register(NULL, &pll->hw);
+	ret = clk_hw_register(pll->dev, &pll->hw);
 
 	if (ret)
 		return ERR_PTR(ret);
@@ -374,7 +374,8 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 	return &pll->hw;
 }
 
-struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
+struct clk_hw *mtk_clk_register_pll(struct device *dev,
+				    const struct mtk_pll_data *data,
 				    void __iomem *base)
 {
 	struct mtk_clk_pll *pll;
@@ -385,6 +386,8 @@ struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
 
+	pll->dev = dev;
+
 	hw = mtk_clk_register_pll_ops(pll, data, base, pll_ops);
 	if (IS_ERR(hw))
 		kfree(pll);
@@ -428,7 +431,7 @@ int mtk_clk_register_plls(struct device *dev,
 			continue;
 		}
 
-		hw = mtk_clk_register_pll(pll, base);
+		hw = mtk_clk_register_pll(dev, pll, base);
 
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %pe\n", pll->name,
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index 38fde1a273bff0a7a010a37356ebc715fe0720d3..f6493699c4e367b45038ceede9565ae42a030b47 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -61,6 +61,7 @@ struct mtk_pll_data {
  */
 
 struct mtk_clk_pll {
+	struct device *dev;
 	struct clk_hw	hw;
 	void __iomem	*base_addr;
 	void __iomem	*pd_addr;
@@ -108,7 +109,8 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 					const struct mtk_pll_data *data,
 					void __iomem *base,
 					const struct clk_ops *pll_ops);
-struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
+struct clk_hw *mtk_clk_register_pll(struct device *dev,
+				    const struct mtk_pll_data *data,
 				    void __iomem *base);
 void mtk_clk_unregister_pll(struct clk_hw *hw);
 
diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index 83630ee07ee976bf980c8cf2dd35ea24c1b40821..62bfe4a480f14a0a742fb094aff0e6d1a79fe0c3 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -220,7 +220,7 @@ int mtk_clk_register_pllfhs(struct device_node *node,
 		if (use_fhctl)
 			hw = mtk_clk_register_pllfh(pll, pllfh, base);
 		else
-			hw = mtk_clk_register_pll(pll, base);
+			hw = mtk_clk_register_pll(NULL, pll, base);
 
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register %s clk %s: %ld\n",

-- 
2.51.0


