Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D47BCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 20:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZycTGcqflUTi8jckNmrkgc5LMZTQ/XWz04YrmhHY6Q=; b=zqHKt1/TAZzkLNeHVudVl3dL4S
	EiDx41HXMhSuPGaDC3lC/5+Ipp2yiSlQ+TbL0EuEwV9FYrL9AwQovl7X5nQc52X6pQsch6QOoP7DW
	TsXTAwUi6jd0Uo41skEtWcSVn+SL/touY5GAu61h8zFqPWfkPvPgAsHnUkXWsXZa6EkE930bwR/56
	FCgDFWC4kWZO509K+Hwr8cYORfwZ5IjUBNYWN5Me2XHH9kUV5LgaV11iFw8Fu+2L3AJQU7i+zE8mA
	ODuvASRX7zwLbMVwMbGlpjS4LbHVnEQmIoIySh7Oy/aPyVDK7Jhr0/DkUKkkahRflCKtXe+ORgNDD
	XxfZKvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7K2B-00000009Mv7-0fjc;
	Fri, 10 Oct 2025 20:48:15 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7K27-00000009Mpo-22oA;
	Fri, 10 Oct 2025 20:48:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760129277; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FRB1JV3sOZSZ9JTFNpfXOd2Bv8HgJlwn+Mwuqs0hNoS0vUgHnNLQABUEEvKPwxcqs3HP2vmQ3oQMjStn/fgxJRPyISByAOhp0A9TUlyDa/TrDgVilXzXGq+intdCBoZ3w57VhUXsOh1XOFsBzEc53ExgQcY0v0xuAc+R2Mrpcz0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760129277; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bZycTGcqflUTi8jckNmrkgc5LMZTQ/XWz04YrmhHY6Q=; 
	b=lPEXIiqFJRpWR/7jKD5QtjKQUs4Ld6oAxVW7o3FszBl6VucePAMws4ilY0NR9aifc6ohf+PoaBfg3CzSMl/Qn9G+oTxjoRC6PfQOWb7K+1sipM2PS95sX/fZWFFhXfvdOblKxw4aTR8ly/xPgyY5/w3O6DXA4nBzQ7nvA2RTGEM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760129277;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=bZycTGcqflUTi8jckNmrkgc5LMZTQ/XWz04YrmhHY6Q=;
	b=QQFrYdfrOeZ1cCsQWfyZDKWD1n7ctc7DQvvMPQyevQLJBwGe9xZFN4Vs+bXqE/5/
	fZO2UAwhibKoElCFigRrflEaoUKfPSpInZ21hGxZah1FYWs9YS3c9HmqH7lYJ/ZczqU
	lQt3qv7b6VjE6k/GklM2bYNOZ5AsuHzZp83XWW3A=
Received: by mx.zohomail.com with SMTPS id 1760129275139615.3748636428318;
	Fri, 10 Oct 2025 13:47:55 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 10 Oct 2025 22:47:13 +0200
Subject: [PATCH v3 5/5] clk: mediatek: Add mfg_eb as parent to mt8196
 mfgpll clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-mtk-pll-rpm-v3-5-fb1bd15d734a@collabora.com>
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
X-CRM114-CacheID: sfid-20251010_134811_614989_7C4F2E5A 
X-CRM114-Status: GOOD (  16.98  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/mediatek/clk-mt8196-mfg.c | 13 +++++++------
 drivers/clk/mediatek/clk-pll.c        |  3 +++
 drivers/clk/mediatek/clk-pll.h        |  1 +
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-mfg.c b/drivers/clk/mediatek/clk-mt8196-mfg.c
index 8e09c0f7b7548f8e286671cea2dac64530b8ce47..a317183f1681bc6e8167c44b2bbe4a78566ba639 100644
--- a/drivers/clk/mediatek/clk-mt8196-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8196-mfg.c
@@ -58,24 +58,25 @@
 		.pcw_shift = _pcw_shift,			\
 		.pcwbits = _pcwbits,				\
 		.pcwibits = MT8196_INTEGER_BITS,		\
+		.parent_name = "mfg_eb",			\
 	}
 
 static const struct mtk_pll_data mfg_ao_plls[] = {
-	PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0, MFGPLL_CON0, 0, 0, 0,
-	    BIT(0), MFGPLL_CON1, 24, 0, 0, 0,
+	PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0, MFGPLL_CON0, 0, 0,
+	    PLL_PARENT_EN, BIT(0), MFGPLL_CON1, 24, 0, 0, 0,
 	    MFGPLL_CON1, 0, 22),
 };
 
 static const struct mtk_pll_data mfgsc0_ao_plls[] = {
 	PLL(CLK_MFGSC0_AO_MFGPLL_SC0, "mfgpll-sc0", MFGPLL_SC0_CON0,
-	    MFGPLL_SC0_CON0, 0, 0, 0, BIT(0), MFGPLL_SC0_CON1, 24, 0, 0, 0,
-	    MFGPLL_SC0_CON1, 0, 22),
+	    MFGPLL_SC0_CON0, 0, 0, PLL_PARENT_EN, BIT(0), MFGPLL_SC0_CON1, 24,
+	    0, 0, 0, MFGPLL_SC0_CON1, 0, 22),
 };
 
 static const struct mtk_pll_data mfgsc1_ao_plls[] = {
 	PLL(CLK_MFGSC1_AO_MFGPLL_SC1, "mfgpll-sc1", MFGPLL_SC1_CON0,
-	    MFGPLL_SC1_CON0, 0, 0, 0, BIT(0), MFGPLL_SC1_CON1, 24, 0, 0, 0,
-	    MFGPLL_SC1_CON1, 0, 22),
+	    MFGPLL_SC1_CON0, 0, 0, PLL_PARENT_EN, BIT(0), MFGPLL_SC1_CON1, 24,
+	    0, 0, 0, MFGPLL_SC1_CON1, 0, 22),
 };
 
 static const struct of_device_id of_match_clk_mt8196_mfg[] = {
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
index f6493699c4e367b45038ceede9565ae42a030b47..f49dc2732ffee50ebf023c01b513d74989a6ec7b 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -19,6 +19,7 @@ struct mtk_pll_div_table {
 
 #define HAVE_RST_BAR	BIT(0)
 #define PLL_AO		BIT(1)
+#define PLL_PARENT_EN	BIT(2)
 #define POSTDIV_MASK	GENMASK(2, 0)
 
 struct mtk_pll_data {

-- 
2.51.0


