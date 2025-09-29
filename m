Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FDECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxCZTFF4iG3STPzoFw46Bohn0VkTc+z5x9foKK+SKnc=; b=mtYbz2QuydZB3Z11CbUMCBhMV6
	zwSsG+4jb822ydy4tXEwumCt8/D+vqbr0z6djugRiinM+zA66FTP4FvczKa7F1nSJ5jTXtcB70r0V
	R5iR0TxrVu2LNGU0UR7H+dOzQJPEy9qskpjPJraLtEFHRgS0WUAmeWDxt8nm1meZ6sr1Oe9PgvSYN
	mtr0BYRnrl8inN/d63AtAJAv/pXfUjiDHEA6z0Jtfu3XG3urqO2lZJcGjzJwh/HmljMlYG967FTVP
	kDwYOOP/1OnvZ3++c2YBWtgfBd5DfvNRoUAwayJ7s2F2zzrsdpjuwG0Z+bzJ6JuYlFc5825kfgDY+
	M33K5HhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Cll-00000002Rix-3tQd;
	Mon, 29 Sep 2025 12:14:17 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Clg-00000002Reu-3VIV;
	Mon, 29 Sep 2025 12:14:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759148037; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BwzAzwN22EUGxhmqj3i1ZgC5Hr1/JPnmFfY3mwxeW7MVh1mui6K9xu6nVfRvbSklvba+n0qisg7bbEZHYCHD1cVvmqYTQJp+xOf9dhtDu2NQHlKgQqEg2ULxM3ofOPsFkFhPn2b7xpjHqBLe/rr4tpZSqSvCEzlg/f+t4LcWjcA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759148037; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QxCZTFF4iG3STPzoFw46Bohn0VkTc+z5x9foKK+SKnc=; 
	b=chWjxtVClcCKhjU5Ir20yaVdE1kZPyyLUqCYmLFCIBfDYq2m7pAt/rRdHMXHZP0Zkl1VJmlEgYz1Vaw7taHF2+aAcZqZTU8sAWTesPMXOyODt/aAnuUNXLtkEkKfkdpJwHHn0RPAsAmdtfhn+Ea4uczvy+O7YJW/HYguOmFjbFk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759148036;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QxCZTFF4iG3STPzoFw46Bohn0VkTc+z5x9foKK+SKnc=;
	b=WQImkyqN0ts2FbkiuraOV8Q94f0LGL7NrIOMl3763L9oTAMp9z589bIxQ6vKTKhD
	6C1BcSiyVxQlgw1kuU8jntB3wMprV2wmdwbPvvRXLA4M95f4YjfUJXZWHohXmPXFdX5
	uJLBIS2geKleoqKyIJCfzOVfW2KPbCIDt2/t4T4A=
Received: by mx.zohomail.com with SMTPS id 1759148035478164.29442178412774;
	Mon, 29 Sep 2025 05:13:55 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 29 Sep 2025 14:13:22 +0200
Subject: [PATCH 3/4] clk: mediatek: Pass device to clk_hw_register for PLLs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-mtk-pll-rpm-v1-3-49541777878d@collabora.com>
References: <20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com>
In-Reply-To: <20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Guangjie Song <guangjie.song@mediatek.com>, 
 Laura Nao <laura.nao@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: kernel@collabora.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_051412_917328_88BCC764 
X-CRM114-Status: GOOD (  15.24  )
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
power management to work for the registered clocks. However, the
mediatek PLL clocks do not do this.

Change this by adding a struct device pointer argument to
mtk_clk_register_pll, and fix up the only other user of it. Also add a
new member to the struct mtk_clk_pll for the struct device pointer,
which is set by mtk_clk_register_pll and is used by
mtk_clk_register_pll_ops.

If mtk_clk_register_pll is called with a NULL struct device pointer,
then everything still works as expected; the clock core will simply
treat them as previously, i.e. without runtime power management.

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
index 0e2b94b9cd4b56adceee3b04e9ab24c2526471da..0f2a1d19eea78b7390b221af47016eb9897f3596 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -63,6 +63,7 @@ struct mtk_pll_data {
  */
 
 struct mtk_clk_pll {
+	struct device *dev;
 	struct clk_hw	hw;
 	void __iomem	*base_addr;
 	void __iomem	*pd_addr;
@@ -110,7 +111,8 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
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


