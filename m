Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC0BC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 14:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMTnwmdkk+uzCiuT3AEif//3nnhtAzGl/6/QqF7JFc0=; b=1xIsAonvJmOeHzXKdrB585z3Yv
	jtq8iXGGrZ7XxP28Vhxqgp8ft5Y5JJU8mgYH0FHnrp1dr09TrncO9eMXOHEX5IMiJnS2GvoaspOoj
	aGHeij+OK916ZuW2DhpXkVY9JVAKNYIAOkJtA2ulQ4mkhKErVJOwYNLUoBRxCMZnNxIAYNvT4OoCO
	H4RZJ08l/+ihNR/BDsgVpOI/UtCw1dBaDNpChloksYuzUAT7AsPoeCqMacF3MTpcozcKadCCJao1h
	agDVLllHhjWplWJKOZ3F9GcxzaKqzKEWV9Sd/NRSPMKgf5SsRm/gslCq8hBG3QJOxt7G5efh8Df4q
	9xVA4KBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIE0-0000000CvRF-3Pc0;
	Tue, 05 Aug 2025 14:01:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujI8j-0000000Cu6y-39iY;
	Tue, 05 Aug 2025 13:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754402140;
	bh=RlcE9Jg2j9ECUaIkGmgoYUjHnr3YRO309JaqfhngUog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xa+mAZ17fBJ8PQ5jzXwrH4ZE2635KeuZcbmCcUyklhYvzOBtDYPMg6Aj7vGWSrZbJ
	 Og4YkUN7psPuJDyrvzY0mB34s/0qYhXCPBLWNfZelTg8NYI7859dFqa/MxNbDrxfOU
	 n0vzDzl8TZHIZmpjnZt4rcU+Te8FHOy3wy6qow651msVZjbf2G+QfilBshq5uelRcS
	 SfA8t5rWtltGj4qUiBDUpV8V9aoejyDKFLd5oZy2yV+1Q4QZaYcXP8oM1bG99+/cIz
	 jCL5ohXNagaSvXGsnCEKYeyARH2dbQMNWrMd0+2KvgH+liawOIwM0Ff0KRPz8aszA7
	 fQ4wkqq6QTEKQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:1976:d3fe:e682:e398])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5692517E04DA;
	Tue,  5 Aug 2025 15:55:39 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v4 01/27] clk: mediatek: clk-pll: Add set/clr regs for shared PLL enable control
Date: Tue,  5 Aug 2025 15:54:21 +0200
Message-Id: <20250805135447.149231-2-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805135447.149231-1-laura.nao@collabora.com>
References: <20250805135447.149231-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_065541_936420_FBB1C53E 
X-CRM114-Status: GOOD (  10.62  )
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

On MT8196, there are set/clr registers to control a shared PLL enable
register. These are intended to prevent different masters from
manipulating the PLLs independently. Add the corresponding en_set_reg
and en_clr_reg fields to the mtk_pll_data structure.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 4 ++++
 drivers/clk/mediatek/clk-pll.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index ce453e1718e5..49ca25dd5418 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -308,6 +308,10 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 		pll->en_addr = base + data->en_reg;
 	else
 		pll->en_addr = pll->base_addr + REG_CON0;
+	if (data->en_set_reg)
+		pll->en_set_addr = base + data->en_set_reg;
+	if (data->en_clr_reg)
+		pll->en_clr_addr = base + data->en_clr_reg;
 	pll->hw.init = &init;
 	pll->data = data;
 
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index 285c8db958b3..c4d06bb11516 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -47,6 +47,8 @@ struct mtk_pll_data {
 	const struct mtk_pll_div_table *div_table;
 	const char *parent_name;
 	u32 en_reg;
+	u32 en_set_reg;
+	u32 en_clr_reg;
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 	u8 pcw_chg_bit;
 };
@@ -68,6 +70,8 @@ struct mtk_clk_pll {
 	void __iomem	*pcw_addr;
 	void __iomem	*pcw_chg_addr;
 	void __iomem	*en_addr;
+	void __iomem	*en_set_addr;
+	void __iomem	*en_clr_addr;
 	const struct mtk_pll_data *data;
 };
 
-- 
2.39.5


