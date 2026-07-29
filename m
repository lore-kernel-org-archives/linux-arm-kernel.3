Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7BCC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAdQkwU2PwOEodUlK/BSONJFJ2kfYX96n54l5W4YDwY=; b=cGug32uWOExLnmSpZx5IA5i4h5
	JkfNtGHHGfUP/RenwK5oMkNDgpzKFibSLFQCa/FkoLfxThq5E9HKNXj+0IGwzYrZ02jEnm9pgcAkp
	tO1XqDhc34vzh245naoXWsMVj9RkyssG5qgY+5oqE+uFP3SGACggX1Gj1hasYip+l56fAdeLAut7Y
	MKP8RvmeVH07jPAXxpGWF5ZRnUq7FI3w7zWWpxKZ4xZErOTB9/62cW1VOgCb198CZ211cJX8g5VoV
	ud/36+we13bxPyNaQfPvmvqY1ymR+GpfMR/BwZZ9RpuHH8N4QIm3rmYZh5zlzaCGyaaHn+2A6vCpa
	UzYFu9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18Y-00000007SQ0-2pm1;
	Wed, 29 Jul 2026 10:03:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18G-00000007S5E-0ilf;
	Wed, 29 Jul 2026 10:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785319401;
	bh=nmMkXcxJLcyi5jJSE7u+jNN//+j9QNGYv6dVLzwOIgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HP8GZ3hJiuhB5hkdQyhSkpwlK+Z5IwGeVe7ETdvj227waPj3BNGXOu87dNKWT3DlI
	 h192bfL7DyPi3dRyZJyxlUEs1Z4NN8BZQkQENyH0V0E/q23G+3KekjeSXSVa6Fm6S5
	 zm+jhO8kRceHcVJVos71dp7IBY6/1nmg294nbNfV9j4Wypbgfir/1PYiVXV3oMtmMa
	 d2aHx8Wsd1BulZKX9EcHcQfqrl0nfZ9qGHwguR/PrdF6OO55ri1GnH9vRlkl9lScYa
	 si2wY3iV8t0Lu1lq4XTGHtTNJyI/THRvz3Iw3Lpg54o1cUkv+o38kVcRKTNZSurss1
	 1YghktQ3gp20A==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9065E17E08A2;
	Wed, 29 Jul 2026 12:03:20 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Jul 2026 12:02:54 +0200
Subject: [PATCH v4 10/24] clk: mediatek: pll: Add BAR reset register
 offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mt8189-clocks-system-base-v4-10-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785319387; l=2982;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=nmMkXcxJLcyi5jJSE7u+jNN//+j9QNGYv6dVLzwOIgI=;
 b=a1RidghG79JOU3GtpHU5tmwM89ANwdY5s+tG1K/ip2V08gHJqbleAusPP5Icr+wlKw3Hu/UEk
 HAihp8ugk+kDi0CwFwEfX4bOcrDn7x+iYLr8mK2JOlym0mFKbtQxpFu
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_030324_375495_58A9F580 
X-CRM114-Status: GOOD (  13.75  )
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

Currently, the register offset to handle BAR reset, for PLLs that
support it, is hardcoded to CON0.
On MT8189 SoC, there are separate status, set and clr registers to
handle this, so differents offsets are needed.

Add the new fields for offsets and addresses to the MTK PLL data
structure and modify mtk_clk_register_pll_ops function to compute the
new register addresses so they are available for clock operation usage.

Also, replace reset BAR address computing by its computed address
from MTK PLL data structure in prepare/unprepare callbacks.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 18 ++++++++++++++----
 drivers/clk/mediatek/clk-pll.h |  6 ++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index ee478bc64085..4b0f7e2bfc5a 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -249,9 +249,9 @@ int mtk_pll_prepare(struct clk_hw *hw)
 	udelay(20);
 
 	if (pll->data->flags & HAVE_RST_BAR) {
-		r = readl(pll->base_addr + REG_CON0);
+		r = readl(pll->rst_bar_addr);
 		r |= pll->data->rst_bar_mask;
-		writel(r, pll->base_addr + REG_CON0);
+		writel(r, pll->rst_bar_addr);
 	}
 
 	return 0;
@@ -263,9 +263,9 @@ void mtk_pll_unprepare(struct clk_hw *hw)
 	u32 r;
 
 	if (pll->data->flags & HAVE_RST_BAR) {
-		r = readl(pll->base_addr + REG_CON0);
+		r = readl(pll->rst_bar_addr);
 		r &= ~pll->data->rst_bar_mask;
-		writel(r, pll->base_addr + REG_CON0);
+		writel(r, pll->rst_bar_addr);
 	}
 
 	__mtk_pll_tuner_disable(pll);
@@ -352,6 +352,16 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 		pll->en_set_addr = base + data->en_set_reg;
 	if (data->en_clr_reg)
 		pll->en_clr_addr = base + data->en_clr_reg;
+
+	if (data->rst_bar_reg)
+		pll->rst_bar_addr = base + data->rst_bar_reg;
+	else
+		pll->rst_bar_addr = pll->base_addr + REG_CON0;
+	if (data->rst_bar_set_reg)
+		pll->rst_bar_set_addr = base + data->rst_bar_set_reg;
+	if (data->rst_bar_clr_reg)
+		pll->rst_bar_clr_addr = base + data->rst_bar_clr_reg;
+
 	pll->hw.init = &init;
 	pll->data = data;
 
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index d6d34840c09d..3aaf3a7654b5 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -49,6 +49,9 @@ struct mtk_pll_data {
 	u32 en_reg;
 	u32 en_set_reg;
 	u32 en_clr_reg;
+	u32 rst_bar_reg;
+	u32 rst_bar_set_reg;
+	u32 rst_bar_clr_reg;
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 	u8 pcw_chg_bit;
 	u8 fenc_sta_bit;
@@ -75,6 +78,9 @@ struct mtk_clk_pll {
 	void __iomem	*en_set_addr;
 	void __iomem	*en_clr_addr;
 	void __iomem	*fenc_addr;
+	void __iomem	*rst_bar_addr;
+	void __iomem	*rst_bar_set_addr;
+	void __iomem	*rst_bar_clr_addr;
 	const struct mtk_pll_data *data;
 };
 

-- 
2.55.0


