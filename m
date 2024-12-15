Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3B2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 22:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8zJQiwJRrjqMkBOPhkt1Q19R5/YE7Y+e4Nf6Ao8GjPM=; b=M5g6WpzPWtx75dmnjh+obbMZy6
	XkPa+TvLJQXoKNzGwFtLP0qXbiqs7mMmfz7z4M8G0OL80C4ffytC8+LfA030jY3JpIhzGq+zpzLgu
	ST0SmWZkjQs2+TrzQCi8GwJnEE69JVDrlNhzq4zJ5UZq2THdas5d63txy1vqGqFIzqwDZVNTBQx8r
	4FVzHYOYzFY4GLI3hb01tbi+KLAC+Zsp/36qTJtYi8mrRGTYaKl/bCFfn89ewzAGobPGPwq0AhZc2
	ZFXJimbvrfQz7BDFti9Z6MuOntD7mc8Gq5A8HoM6bR1LkzeIuZO98dk8U1Yj5noxayFWX6SauuPJC
	FiWtkz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMwtJ-00000008YE0-2Pha;
	Sun, 15 Dec 2024 22:15:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMwsD-00000008Y2n-0RC1;
	Sun, 15 Dec 2024 22:14:02 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tMws6-000000002qE-1xbS;
	Sun, 15 Dec 2024 22:13:54 +0000
Date: Sun, 15 Dec 2024 22:13:49 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Golle <daniel@makrotopia.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	John Crispin <john@phrozen.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH 1/5] clk: mediatek: mt2701-vdec: fix conversion to
 mtk_clk_simple_probe
Message-ID: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_141401_141370_D34D4872 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

Commit 973d1607d936 ("clk: mediatek: mt2701: use mtk_clk_simple_probe to
simplify driver") broke DT bindings as the highest index was reduced by
1 because the id count starts from 1 and not from 0.

Fix this, like for other drivers which had the same issue, by adding a
dummy clk at index 0.

Fixes: 973d1607d936 ("clk: mediatek: mt2701: use mtk_clk_simple_probe to simplify driver")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt2701-vdec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt2701-vdec.c b/drivers/clk/mediatek/clk-mt2701-vdec.c
index 94db86f8d0a4..5299d92f3aba 100644
--- a/drivers/clk/mediatek/clk-mt2701-vdec.c
+++ b/drivers/clk/mediatek/clk-mt2701-vdec.c
@@ -31,6 +31,7 @@ static const struct mtk_gate_regs vdec1_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
 
 static const struct mtk_gate vdec_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "vdec_dummy"),
 	GATE_VDEC0(CLK_VDEC_CKGEN, "vdec_cken", "vdec_sel", 0),
 	GATE_VDEC1(CLK_VDEC_LARB, "vdec_larb_cken", "mm_sel", 0),
 };
-- 
2.47.1

