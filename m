Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6248DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ppA8m/5ehAsAUIEID5gc3TtaxaY7qhRvgyIt23MZjI0=; b=bqwaG24crWQ66gbYDSMzqz+qN1
	YC/xtMdCCTEWIWCQdo4LGH8VVIjRnBuf8C7GdOk5KWuEW2ut1CbFTgrRP4PmDesZ+urPqi60WkB3N
	09f1+2639p7jQdFXJJK7jTSVYl95aX2gaHIQHo6+AXoEduwD3qHgrLvIv5djqlpxP7csZN5lTf1FM
	Hn7VwpQ0p3dgwRVcGMC1gDb626m3CaY0/4/aNY0JMj+PCgm7sINCZfoiUfvYSbVxqIKK0++M9iqn/
	NLjNYoJU/UpeOYoBRzDW0b1e7Qb0OEKIvPaylml3QgooK1YQrllCMeFTUPutdWhFCEm7eUqp6PWUI
	45fj6hDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnmm-00000002OgR-3WNx;
	Thu, 09 Jul 2026 12:23:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnmk-00000002OfM-0a9G;
	Thu, 09 Jul 2026 12:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783599796;
	bh=9Pqlzqz8P8MV2DzBL9Guxas/1Kj0iveewylpu/2a7js=;
	h=From:Date:Subject:To:Cc:From;
	b=aH4tVViNv6WsvRqhKw3v+bPERQ+FMnHani7zy6qxpCzNi8y34LojosQdlo+08hiIC
	 2qGtNlLLR3ObR5sPEvrUvAxKXUqGtu2VezVEU4t0/zapGWruS+fwMJFhfIMidsw4jT
	 JC2cS0dbIBPrAefzIKdek9lfB28FcsoLYE2RKxbBbhH26Y4G6fWakw0Jag/u8V07J+
	 r/7fzO7zom6sSTydeGeZyW4w39Uq1gumFhajbve0evB424pJ3IxRUE1Y+xAcsLPHjP
	 w6Iyv99qivcxqRi95CmBjYuWH8E6XMEgGJ9ELcg7YXOeUadpI4moDeFaYtP13/ZhwP
	 yQSfu0uJucuBg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EEC717E003B;
	Thu, 09 Jul 2026 14:23:15 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 09 Jul 2026 14:23:00 +0200
Subject: [PATCH v2] clk: mediatek: pllfh: Fix IO remapping leak in
 register_pllfhs error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-clk-mediatek-pllfh-fix-v2-1-a235078fe9d5@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOzQ6CMBCEX4Xs2TVQw58n38NwKGWRDYViWwmG8
 O5WiGeP3yTfzKzgyDI5uEYrWJrZsRkDiFMEqpPjg5CbwCBikcV5XKDSPQ7UsPTU46R122HLC+Z
 UKnlJy6IkAUGeLIV4L75XB1t6vkK/P0KopSNUZhjYX6ORFo+/DfgKHTtv7Hs/Nie78e/DnGCCQ
 rVKNFkt0oJuymgta2PlOQxBtW3bB2Qe8DTxAAAA
X-Change-ID: 20260708-clk-mediatek-pllfh-fix-7e9ca35989e2
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Johnson Wang <johnson.wang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783599795; l=5633;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=9Pqlzqz8P8MV2DzBL9Guxas/1Kj0iveewylpu/2a7js=;
 b=jE9jCdzkzh8aa4HUmAnn3mHzLjEi6hLljo63wHj/jSpK2+2wIGLOJG+IHzYvklQG1GNRk/l2v
 sDXLBohmW1SCJVwKh95ucfEzUimvEuvpkkD9S+c9fcAG1Uw24owDcsB
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_052322_928525_7A58A88A 
X-CRM114-Status: GOOD (  19.14  )
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

When mtk_clk_register_pllfhs function fails to register a PLL, it
unregisters all PLLs and cleans up itself in its error path before
returning, so the function callers don't need to do it.

But contrary to mtk_clk_unregister_pllfhs function, that does almost
the same sequence, it does not free the IO memory mapped on fhctl node,
leading to a leak.

Fix this leak by factorizing the cleanup sequence in a new private
function and use it both mtk_clk_register_pllfhs and
mtk_clk_unregister_pllfhs functions.

Also, change the loop index start value to avoid the -1 operation on
index at each loop.

Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
This patch aims to fix a issue, detected by Sashiko
during another series review ([1]), regarding the use of 
mtk_clk_register_pllfhs function.

The patch is based on linux-next tree (tag: next-20260708).

[1]: https://sashiko.dev/#/patchset/20260701-mt8189-clocks-system-base-v1-0-2b048feea50a%40collabora.com?part=6
---
Changes in v2:
- Rebased on next-20260708
- Fixed loop stop condition in mtk_clk_cleanup_pllfhs function (B. Masney and
  Sashiko)
- Reworked base and fhctl_base address handling in mtk_clk_cleanup_pllfhs. 
  The function has now both addresses as arguments, so it can either
  use the provided addresses (register cleanup case) or find them in
  the pllfh data structures if NULL addresses were given (unregister case) to
  unmap them (B. Masney and Sashiko)
- Link to v1: https://lore.kernel.org/r/20260708-clk-mediatek-pllfh-fix-v1-1-2cfc2d6b258e@collabora.com
---
 drivers/clk/mediatek/clk-pllfh.c | 98 ++++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index aa95cd9197b3..6249fb87b1f5 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -197,12 +197,56 @@ static void mtk_clk_unregister_pllfh(struct clk_hw *hw)
 	kfree(fh);
 }
 
+static void mtk_clk_cleanup_pllfhs(void __iomem *iomem_base,
+				   const struct mtk_pll_data *plls, int num_plls,
+				   void __iomem *iomem_fhctl_base,
+				   struct mtk_pllfh_data *pllfhs, int num_fhs,
+				   struct clk_hw_onecell_data *clk_data)
+{
+	void __iomem *base = iomem_base;
+	void __iomem *fhctl_base = iomem_fhctl_base;
+	int i;
+
+	for (i = num_plls - 1; i >= 0; i--) {
+		const struct mtk_pll_data *pll = &plls[i];
+		struct mtk_pllfh_data *pllfh;
+		bool use_fhctl;
+
+		if (IS_ERR_OR_NULL(clk_data->hws[pll->id]))
+			continue;
+
+		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
+		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
+
+		if (!base)
+			base = mtk_clk_pll_get_base(clk_data->hws[pll->id],
+							pll);
+
+		if (use_fhctl) {
+			if (!fhctl_base)
+				fhctl_base = pllfh->state.base;
+			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
+		} else {
+			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
+		}
+
+		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
+	}
+
+	if (fhctl_base)
+		iounmap(fhctl_base);
+
+	if (base)
+		iounmap(base);
+}
+
+
 int mtk_clk_register_pllfhs(struct device *dev,
 			    const struct mtk_pll_data *plls, int num_plls,
 			    struct mtk_pllfh_data *pllfhs, int num_fhs,
 			    struct clk_hw_onecell_data *clk_data)
 {
-	void __iomem *base;
+	void __iomem *base, *fhctl_base = NULL;
 	int i;
 	struct clk_hw *hw;
 
@@ -238,24 +282,8 @@ int mtk_clk_register_pllfhs(struct device *dev,
 	return 0;
 
 err:
-	while (--i >= 0) {
-		const struct mtk_pll_data *pll = &plls[i];
-		struct mtk_pllfh_data *pllfh;
-		bool use_fhctl;
-
-		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
-		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
-
-		if (use_fhctl)
-			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
-		else
-			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
-
-		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
-	}
-
-	iounmap(base);
-
+	mtk_clk_cleanup_pllfhs(base, plls, i, fhctl_base, pllfhs, num_fhs,
+			       clk_data);
 	return PTR_ERR(hw);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_pllfhs);
@@ -264,38 +292,10 @@ void mtk_clk_unregister_pllfhs(const struct mtk_pll_data *plls, int num_plls,
 			       struct mtk_pllfh_data *pllfhs, int num_fhs,
 			       struct clk_hw_onecell_data *clk_data)
 {
-	void __iomem *base = NULL, *fhctl_base = NULL;
-	int i;
-
 	if (!clk_data)
 		return;
 
-	for (i = num_plls; i > 0; i--) {
-		const struct mtk_pll_data *pll = &plls[i - 1];
-		struct mtk_pllfh_data *pllfh;
-		bool use_fhctl;
-
-		if (IS_ERR_OR_NULL(clk_data->hws[pll->id]))
-			continue;
-
-		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
-		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
-
-		if (use_fhctl) {
-			fhctl_base = pllfh->state.base;
-			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
-		} else {
-			base = mtk_clk_pll_get_base(clk_data->hws[pll->id],
-						    pll);
-			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
-		}
-
-		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
-	}
-
-	if (fhctl_base)
-		iounmap(fhctl_base);
-
-	iounmap(base);
+	mtk_clk_cleanup_pllfhs(NULL, plls, num_plls, NULL, pllfhs,
+			       num_fhs, clk_data);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_unregister_pllfhs);

---
base-commit: 451b00e20bcd5526c6def9ee76f9bdb322ae9b46
change-id: 20260708-clk-mediatek-pllfh-fix-7e9ca35989e2

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


