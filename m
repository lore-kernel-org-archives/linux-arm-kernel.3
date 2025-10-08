Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A8ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJsRAjav3ZDmi2sZG+xEBRsiXb29hae9R43qCC2s6lg=; b=WbMhAidkS7ob+mbEqYGdROJhLb
	nQsiD1wKeY0zscnCfGebkVkd1efXRpG4M7qfUAXR9VsxuwtJpkty7ag3e2RuLqYebAEyVq+JGgfTe
	ISof385HlUbn9IaiFJfM6LNdVLEy3lzGZ4COa5ROJqx11GZnmpVCsrUy9DwG+8w5P9L0iOilXqPCK
	BjyS0ZM2B7woY6ZPb+MLqjgeiXh80/YDB4iOG1ZIrGdmANGPQjoHyWdlvtSKdyK0jezqe6tqQDUyN
	eTTRfJKZi7EWG2PrrLfoADeAJkLreQNLglQ3MMEMl4uNbFV3CRkF8csS7oYTD1aaAY2hTFCvCwl6V
	Y5RUathw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Wgy-00000004Fvu-40IO;
	Wed, 08 Oct 2025 16:07:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Wgw-00000004Fut-25C2;
	Wed, 08 Oct 2025 16:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759939565; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lctHQh5LNPjM6hMcCkjrr9YeG4BxrIkZdmUcoZH1HbkJ0kIc5DU06gtscxfdFLNYltMckLT418OnzEb27mlFOt//PBMihQMpS77y2ARiKzapwv4tEuiPIxa15JdCUOKpuvLWaMD37h+4kCG8CHdGdL4x7Iq/uaV5/dvIaWyhhII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759939565; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kJsRAjav3ZDmi2sZG+xEBRsiXb29hae9R43qCC2s6lg=; 
	b=QPBTOsR8DJfkJIo6ZAN4no1FEtH0PjWxfIi9UnEXqIYTLeDv4o7zSyg37QEREHYmOivwnsKlfTv35SHGN16BOJ/9Y14N09nWhSsGtXmp8wMtQ3tfhyKjfx8wxAP7qyOCzLDseThOYSXBeBlM2nScR9HH8okCQ/biPPVlupk4frA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759939565;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=kJsRAjav3ZDmi2sZG+xEBRsiXb29hae9R43qCC2s6lg=;
	b=KzNFGIie44JP/rsyaLC5S5HXBHSNvKJ/ON+RZxYmV0KYKMH1gqGQG1/6c4nKHhtY
	DfOE0ZKGukffQiU8tEqTCmRR34Fi4LbpVh0f+tmxv7p1d1fLw4Vfg6T675XznMrUd4W
	oEyN9AldhDUQcKFjlH1QBEyMqSESZVFDU5Jq7rG8=
Received: by mx.zohomail.com with SMTPS id 1759939563610836.7617931382553;
	Wed, 8 Oct 2025 09:06:03 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 08 Oct 2025 18:05:39 +0200
Subject: [PATCH v2 5/5] clk: mediatek: Add mfg_eb as parent to mt8196
 mfgpll clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-mtk-pll-rpm-v2-5-170ed0698560@collabora.com>
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
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
 linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_090702_598631_F03E98C9 
X-CRM114-Status: GOOD (  16.73  )
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

All the MFGPLL require MFG_EB to be on for any operation on them, and
they only tick when MFG_EB is on as well, therefore making this a
parent-child relationship.

This dependency wasn't clear during the initial upstreaming of these
clock controllers, as it only made itself known when I could observe
the effects of the clock by bringing up a different piece of hardware.

Add a new PLL_PARENT_EN flag to mediatek's clk-pll.h, and check for it
when initialising the pll to then translate it into the actual
CLK_OPS_PARENT_ENABLE flag.

Then add the mfg_eb parent to the mfgpll clocks, and set the new
PLL_PARENT_EN flag.

Fixes: 03dc02f8c7dc ("clk: mediatek: Add MT8196 mfg clock support")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/mediatek/clk-mt8196-mfg.c | 3 ++-
 drivers/clk/mediatek/clk-pll.c        | 3 +++
 drivers/clk/mediatek/clk-pll.h        | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-mfg.c b/drivers/clk/mediatek/clk-mt8196-mfg.c
index 8e09c0f7b7548f8e286671cea2dac64530b8ce47..de6f426f148184e1bb95b5cfca590b1763fc0573 100644
--- a/drivers/clk/mediatek/clk-mt8196-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8196-mfg.c
@@ -45,7 +45,7 @@
 		.en_reg = _en_reg,				\
 		.en_mask = _en_mask,				\
 		.pll_en_bit = _pll_en_bit,			\
-		.flags = _flags,				\
+		.flags = (_flags) | PLL_PARENT_EN,		\
 		.rst_bar_mask = _rst_bar_mask,			\
 		.fmax = MT8196_PLL_FMAX,			\
 		.fmin = MT8196_PLL_FMIN,			\
@@ -58,6 +58,7 @@
 		.pcw_shift = _pcw_shift,			\
 		.pcwbits = _pcwbits,				\
 		.pcwibits = MT8196_INTEGER_BITS,		\
+		.parent_name = "mfg_eb",			\
 	}
 
 static const struct mtk_pll_data mfg_ao_plls[] = {
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index c4f9c06e5133dbc5902f261353c197fbde95e54d..0f3759fcd9d0228c23f4916d041d17b731a6c838 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -359,6 +359,9 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 
 	init.name = data->name;
 	init.flags = (data->flags & PLL_AO) ? CLK_IS_CRITICAL : 0;
+	if (data->flags & PLL_PARENT_EN)
+		init.flags |= CLK_OPS_PARENT_ENABLE;
+
 	init.ops = pll_ops;
 	if (data->parent_name)
 		init.parent_names = &data->parent_name;
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index 0f2a1d19eea78b7390b221af47016eb9897f3596..492cad8ff80ba31a78a96085285cb938e9b978e9 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -21,6 +21,7 @@ struct mtk_pll_div_table {
 
 #define HAVE_RST_BAR	BIT(0)
 #define PLL_AO		BIT(1)
+#define PLL_PARENT_EN	BIT(2)
 #define POSTDIV_MASK	GENMASK(2, 0)
 
 struct mtk_pll_data {

-- 
2.51.0


