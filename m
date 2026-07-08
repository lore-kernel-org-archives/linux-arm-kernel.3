Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB87C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8mLykkioY9gB/csEoiMGrFSY7TuzOaT0dL6TaXHQpEY=; b=sDOZxpTsagUrjK8RDLMq33h5mA
	t/1VG6fEC3CAXI2RqVLkDp5xFJN1FJ09uPG7Db6gfxVpOauvjTvucwGmM46Fo9+rE6euXH11/JaJc
	bGi4ugiQK0KAHliHh8xnzpZjDzXsv5s4vjtNWZReekk1K+h2eV3TASk95RPxKyhpvSM25hyfNnKzj
	BEqCjIAF8o62QmDzdE0DEwhAH3YzpiGTK0OPsDHpSrMZLm3vhjdp8q/shMEfBMqsNfW3dGSfhxYe+
	QiLedGhc3jy7OatX1aqa7xedCxt6ELp1WhelHXLREJNkHSLMFws2Ig0uSHLHhn7JOlu1OLqIVJ0zz
	86z4H8dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whOR4-0000000GjeV-0Rcf;
	Wed, 08 Jul 2026 09:19:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whOR0-0000000Gjdu-471G;
	Wed, 08 Jul 2026 09:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783502352;
	bh=4H+StpOW2ZH0hn4OeaLVWGpQKMud7otOxAZzPt6gxyU=;
	h=From:Date:Subject:To:Cc:From;
	b=BL6oo2KOaOY8P9CiXuyeTGeHyyCgOERtejWG8PQgEsFFIYiJkDNsgeiate6HKB8Pp
	 4Qu0zmmliVMpunBLArD3kt78cckNb2XDIUwo01goTEdR9qlXgFVbdhfdo4QKWX6V8u
	 QHZKCsvBt34BlgJkOihAIOPvogUBfS4KG0a/BGNWCFppBHay2b28jH0dkxW1Txlch1
	 kdds4GZRwmtpMHZFob4uFlJZ7Mnh5v55fkALrUsr9qWbV7shmP6RL720jGmAG4R7X6
	 45LOQxkR33XUR7/bi/6c5zCH1deJFxJ5OsL29GD0QKG2+r4/27VvCNWmN2OKFdHvkM
	 vDHTF2l9hNUAg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8EB2917E0521;
	Wed, 08 Jul 2026 11:19:11 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 08 Jul 2026 11:18:59 +0200
Subject: [PATCH] clk: mediatek: pllfh: Fix IO remapping leak in
 register_pllfhs error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-clk-mediatek-pllfh-fix-v1-1-2cfc2d6b258e@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ7CIBBFr0Jm7SSIUUqvYrpAOrWTAq2ApknTu
 0usy/eS//4GmRJThlZskOjDmedY4XwS4EYbn4TcVwYl1U1q2aDzEwbq2RaacPF+GHHgFTUZZy9
 X0xhSUMdLoqp/4Xt3cKLXu/bLIeFhM6GbQ+DSikhrwf+Hhm7fv/+XTYuZAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783502351; l=4683;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=4H+StpOW2ZH0hn4OeaLVWGpQKMud7otOxAZzPt6gxyU=;
 b=NejNT+aEHaLKBMGOPalAU8w8iI66YYZDyCVarlySqapXDEAVq1t/74meWPuqrFdW9lBd1UIud
 kQ0cuKSTGJHCt3UCqknLZebd6K5QpPJpV+d7An1loKRmngpurlwc2kx
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_021915_201323_D7ECCAF5 
X-CRM114-Status: GOOD (  17.67  )
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

The patch is based on linux-next tree (tag: next-20260707).

[1]: https://sashiko.dev/#/patchset/20260701-mt8189-clocks-system-base-v1-0-2b048feea50a%40collabora.com?part=6
---
 drivers/clk/mediatek/clk-pllfh.c | 87 ++++++++++++++++++----------------------
 1 file changed, 39 insertions(+), 48 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index aa95cd9197b3..7463aa35d7e3 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -197,6 +197,43 @@ static void mtk_clk_unregister_pllfh(struct clk_hw *hw)
 	kfree(fh);
 }
 
+static void mtk_clk_cleanup_pllfhs(const struct mtk_pll_data *plls, int num_plls,
+				   struct mtk_pllfh_data *pllfhs, int num_fhs,
+				   struct clk_hw_onecell_data *clk_data)
+{
+	void __iomem *base = NULL, *fhctl_base = NULL;
+	int i;
+
+	for (i = num_plls - 1; i > 0; i--) {
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
+		if (use_fhctl) {
+			fhctl_base = pllfh->state.base;
+			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
+		} else {
+			base = mtk_clk_pll_get_base(clk_data->hws[pll->id],
+						    pll);
+			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
+		}
+
+		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
+	}
+
+	if (fhctl_base)
+		iounmap(fhctl_base);
+
+	iounmap(base);
+}
+
+
 int mtk_clk_register_pllfhs(struct device *dev,
 			    const struct mtk_pll_data *plls, int num_plls,
 			    struct mtk_pllfh_data *pllfhs, int num_fhs,
@@ -238,24 +275,7 @@ int mtk_clk_register_pllfhs(struct device *dev,
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
+	mtk_clk_cleanup_pllfhs(plls, i, pllfhs, num_fhs, clk_data);
 	return PTR_ERR(hw);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_pllfhs);
@@ -264,38 +284,9 @@ void mtk_clk_unregister_pllfhs(const struct mtk_pll_data *plls, int num_plls,
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
+	mtk_clk_cleanup_pllfhs(plls, num_plls, pllfhs, num_fhs, clk_data);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_unregister_pllfhs);

---
base-commit: b3a87fbe738f19cbe19411cf749f3d8c09c04de4
change-id: 20260708-clk-mediatek-pllfh-fix-7e9ca35989e2

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


