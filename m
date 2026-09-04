Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239B1C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1i9l1d8VMoSpKQaIxdgYqUl1B4rvtTzNTU4xHBwzZcY=; b=SJF0T8JCevW+VvKCj0pjd4h3wr
	VldzAdvPV0aHIQlW1ol1h3Kqg+kgILWSetjnOiX2oQ+ojt++ws1rOrHT0QWVgjM78cz7kplIoQg1A
	Blnv/gAZmldTzKt590C2vXHbekJ6NjPvLjT79DqFW3UcDi3HO8B2b9/KmN9KnQ03djXkyeSnbqzPg
	H2hg9K8a+6DuuMOhEUBzMCZs53IK0yoOlpRltwBXcmOsBMaSOACwzZ1Lb/kkjfT2VU7158Mu2kS+k
	7aIuYDCtfnzulyY+AZaqjIpe1N5nwjPlTDMZrxI7kYKPmWsK/nj5hYgx599MkTGQt+ga9p9Y55FFE
	knES21VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJt-00000002bsA-0yFL;
	Fri, 04 Sep 2026 15:59:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJj-00000002bZv-1pRk;
	Fri, 04 Sep 2026 15:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537541;
	bh=1piwe291SJzHCvmYgTYe5CleobD/ifmr/BhtwFBgFOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RyccvWL+IfVRdJ8RH0g3yenON+HlabScLKqf0ohkW+FU1X8KI+U4menm7e18Vy+T5
	 0O+DKoGL1cof/OXb7Lk284I2WmKN+2zjtYwI49z87fHTxMgMsPyJaUahaHRkNXiOrM
	 2ua8KsJhM2HUUXVqm+51M9Ij8Lz4ity/aJopq/s/14zwL6qg+pmuO/v2haOV5o/LPc
	 09//ubtQB5MDbi7JGK2GXaBNfFb+OK2+BIVDDu4ITGfO7UyXrYekmsoXQBgf/4LnKo
	 3OeqYF4ogH7sogwmds4+CRgP/vnbVpns/HxutFIkjLHs6ELni52/wYTvZ7+24bAo9o
	 cwelIUKZoCdTA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52B9517E14D2;
	Fri, 04 Sep 2026 17:59:00 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:23 +0200
Subject: [PATCH v6 12/27] clk: mediatek: pll: Add PLL stabilization delay
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-12-5df247f56938@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=1541;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=1piwe291SJzHCvmYgTYe5CleobD/ifmr/BhtwFBgFOM=;
 b=Hf+3XAUnkaNPFk/JON0jY6so4Hv87b2O1iV3DYnqgYm8uFi+Du6QhH8HQpCO/XJDS9hI+0Kg2
 hwnCoRpqfwxC4+9BVkswxVMtOnypcRDcNJHern4dddIasH0USa5ryN6
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_085903_641730_816A1BAC 
X-CRM114-Status: GOOD (  12.62  )
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

Several functions uses a hardcoded value (20), to represent the
needed delay to stabilize a PLL.
Add a common define for this value.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 2aaf2871ecf6..9a197a657dce 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -31,6 +31,8 @@
 /* default 7 bits integer, can be overridden with pcwibits. */
 #define INTEGER_BITS		7
 
+#define PLL_STABILIZATION_DELAY	20 /* in us */
+
 int mtk_pll_is_prepared(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
@@ -131,7 +133,7 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
 	/* restore tuner_en */
 	__mtk_pll_tuner_enable(pll);
 
-	udelay(20);
+	udelay(PLL_STABILIZATION_DELAY);
 }
 
 /*
@@ -264,7 +266,7 @@ int mtk_pll_prepare(struct clk_hw *hw)
 
 	__mtk_pll_tuner_enable(pll);
 
-	udelay(20);
+	udelay(PLL_STABILIZATION_DELAY);
 
 	if (pll->data->flags & HAVE_RST_BAR) {
 		r = readl(pll->rst_bar_addr);
@@ -306,7 +308,7 @@ static int mtk_pll_prepare_fenc_setclr(struct clk_hw *hw)
 	writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
 
 	/* Wait 20us after enable for the PLL to stabilize */
-	udelay(20);
+	udelay(PLL_STABILIZATION_DELAY);
 
 	return 0;
 }

-- 
2.55.0


