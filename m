Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8035CC79F87
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1+QszPOR74WtMu2Pm+gFdOy3IdnWXL8GhvfEwRIyEI=; b=TYasIvk3aOt6LwbD0VtUTjgWKw
	uhsCJ9f24JD6FIJrgaaYoZfxH1dRNaOMSLEqq0thb+1zSEWFwar6y0OxiN0SBY05PYl3QxsUl0BXK
	4MF1GA3xJJK5lRF+oP7xyBKnNMC9UnNAupHaJlEU61Qal3czZF1TnkvCBbWypbCetlptGmY64eUrm
	9/2uk9AEzS3Bp1catDTSM7hlSOV0cwWJsOUw7CNdZKB6m86lSqhlAOxfjO3mbV//jfleHnrfjwhUD
	xj9GoRsnnE8EqdXZ6vnjqTWz6dd1uVJKC52KO+RWmOghjOru1BxpBImVmQX91BfBq7D16svN/fCMS
	x44kJxCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJv-00000002byF-1fqX;
	Fri, 04 Sep 2026 15:59:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJm-00000002bdy-0DYP;
	Fri, 04 Sep 2026 15:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537544;
	bh=GZT4Tprcj/cd8JTciRawSozIscP5ax133CBUIJ7G/TE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j8xOY4TQ8dCs8BVFC5tHdeuslb69qBCSCMy1a23NYPhIm5u9+7g5nLueURtAKc29v
	 aArLy/nTxMcGe1QtW7Lopql5BJfuGW+9Rjrq3pj4ttXPbQUQhDafqOWm04vFHK61ww
	 WWVQAIzzb0L9u5YkktERPo+SRcVv/nXHj7MdfRj6GlDTQA8BqAJc4VSQE90bB1Zpyp
	 YVXd9kk02gCycTcBiWxYFtXc2xQOZyGJioKnbozx7LY/bTIOcGHZOvvJZTe2IsIzMp
	 iUUaJ7FpJAg4IdhzO6Gch1wacRaCMjZEIl1b0/eTkowzfvCb2KRtwP84/tB1fqSu9q
	 uv6gGvLXerxmA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 189C817E0FAA;
	Fri, 04 Sep 2026 17:59:03 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:25 +0200
Subject: [PATCH v6 14/27] clk: mediatek: pllfh: Add configurable clock ops
 to mtk_pllfh_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-14-5df247f56938@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=1957;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=GZT4Tprcj/cd8JTciRawSozIscP5ax133CBUIJ7G/TE=;
 b=rSIeVlaiKUPL4Z84GRg4Kqkc0Zl93GkEnK5ZmjNv6niMwTaO03+XlMdyN3Esej8b9rTSMMSO2
 0b4dHRmkrQGCmJtSEoKPgFHE2YLrC4FTTtCPtZ/ETAU0kbP5kDoHYpn
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_085906_247568_D6A30818 
X-CRM114-Status: GOOD (  15.40  )
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

Currently, the mtk_clk_register_pllfh functions always registers the
default PLL clock operation set (mtk_pllfh_ops). This does not allow
use a custom one, for SoC such as MT8189, that needs different
set with support for set/clr enable.

Add a new field for the ops to register in mtk_pllfh_data structure
and use this new field to either register it when not null or the
default ops otherwise.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pllfh.c | 5 +++--
 drivers/clk/mediatek/clk-pllfh.h | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index 6249fb87b1f5..cc73eb4f87e6 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -153,6 +153,8 @@ static struct clk_hw *
 mtk_clk_register_pllfh(struct device *dev, const struct mtk_pll_data *pll_data,
 		       struct mtk_pllfh_data *pllfh_data, void __iomem *base)
 {
+	const struct clk_ops *pllfh_ops = pllfh_data->data.ops ?
+					  pllfh_data->data.ops : &mtk_pllfh_ops;
 	struct clk_hw *hw;
 	struct mtk_fh *fh;
 	int ret;
@@ -169,8 +171,7 @@ mtk_clk_register_pllfh(struct device *dev, const struct mtk_pll_data *pll_data,
 
 	fh->clk_pll.dev = dev;
 
-	hw = mtk_clk_register_pll_ops(&fh->clk_pll, pll_data, base,
-				      &mtk_pllfh_ops);
+	hw = mtk_clk_register_pll_ops(&fh->clk_pll, pll_data, base, pllfh_ops);
 
 	if (IS_ERR(hw))
 		goto out;
diff --git a/drivers/clk/mediatek/clk-pllfh.h b/drivers/clk/mediatek/clk-pllfh.h
index a4f337acad71..d32bfe194ec4 100644
--- a/drivers/clk/mediatek/clk-pllfh.h
+++ b/drivers/clk/mediatek/clk-pllfh.h
@@ -34,6 +34,7 @@ struct fh_pll_data {
 	u32 updnlmt_shft;
 	u32 msk_frddsx_dys;
 	u32 msk_frddsx_dts;
+	const struct clk_ops *ops;
 };
 
 struct mtk_pllfh_data {

-- 
2.55.0


