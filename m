Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F78C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg8Jme5PexkyEgenMV9ZNSXBG0k75+HQtQ7Cc373Klc=; b=vtcFtx14LvH3jlfJcDihKwGeIm
	ps2PbvGaPar4akPvIB9XGaAFtxeZ8RI112wND3PQuikzAkwUrF1DNEg014CevheGv24tOKuL0P1gB
	aeYy4iXYVmdK23meGXSpbxz+YLk+f0tvc5mCH3wbwig/F+loJcF1JM9jRrSXqm0MObzvAmdrle4Nl
	qs28w3+RW9aTM82xyi+3a4bNTPAu7YLryYffn+66hJ4eR4DTSRqf1H/rSPffSknMcVqOjEHdlWt0U
	vKcASxFROZb4N0yZz47lE6VODctlgDvFlTrr5cyfPakMBBTopQXKcRhxsOmt7rKdm54/5xdPLm2kE
	BuPhgx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVj-0000000HM5c-22kO;
	Mon, 03 Aug 2026 14:19:23 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVd-0000000HLyH-11Mv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:22 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38e08baf860so3007214a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766756; x=1786371556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg8Jme5PexkyEgenMV9ZNSXBG0k75+HQtQ7Cc373Klc=;
        b=QdTdaiq5x4xTu9sLtIrUljZA0BvlOE1danQ2geBcvCOmRWNY41eLnllLDZ3iZH8eai
         gVDsamLOdaghzDRPTdH/AYv1J/VpxT6xucV/roEptihRLk1uGS64xx5uk+BbCfXzy4rk
         mNAqjw1C6jBTtJmzTLVrtfZyDKMVRNFSgn+qAHin3vtL5Jew7j6v/+klGrEx7Inr5M22
         9rKHYJTPqTz52cAQXV4XtUKUixEVid8HRYCDHQoow8KLYE+B8TtyeQQpL0OnJdOtSJs6
         PZqCxsG64U+YkRSiYhLNciKQH59NLC/9cUE6b/tWUoaYznFxwRi85LIi2BOp1shzjrZ2
         aRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766756; x=1786371556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sg8Jme5PexkyEgenMV9ZNSXBG0k75+HQtQ7Cc373Klc=;
        b=R1jie90NbPdEVofLxUyjssC8fZdHWiHG+t4qJkDVjEVZUZBx0FUHtAqXVfpC2Zd1B5
         7DY4d01prWYRdRKway6nLTOaEIRKgbSdM3Hu2t9Y3q1g48VrFy2vmPuhivOTbrANaUy7
         RngUTn92gQWozswLyd+KEaH3e0ZRy1xNl5tXMiiNx0RvMyJkaKr3J1mYWA/7vvZGlNUa
         ncZoAAslXdVEFRPA2NbxokEVdAzO0QdTRvx/KXm2rrrO27Jp2zFDKpd2MdQZhlHV3pSE
         x1mMDba3Y1vwe63nbBjdiBS7Ti6FZsF1E81quP/6RYVj4l1Q7sO0viREJuaF5d07e44r
         BN+w==
X-Forwarded-Encrypted: i=1; AHgh+RoBJH0Kbmlhi3+Hs38sKOOnaiTBf7PGG1POWRMOMfxFFsJzwNC4RYOhzzLkYu1JoHrgYdNwKIBv38FjEfCik7Rn@lists.infradead.org
X-Gm-Message-State: AOJu0YzlXT87xCDHpzrUD3pmsZOtXfFqrkOW56m9b6czQNh90X2Gukwc
	5T80mKkvqOXCiTkxhqvmLxfqTtTpPtDDswIjFOil8QEMx5kBx1/wP+ww
X-Gm-Gg: AR+sD13ekpzXQ4aOflmE92LkMm6ELv0R2a8gEclhddqUaJJ2pk4sxHNAmc9skxhQAUS
	3wXt63x5UTbkwathfQoWIq4uyMAoEKHR8FxzXkTBl0VZnWvQb3kxWz9z0tB6URAJ7GxMhWWsV2t
	kxzfOQSjZsnU1xxV2w21vwXCFmk2cfMP2yYmaji9H9vH6rz+na1Gtwq3VXAAs9V/Zto/Vy7rskO
	Ro9HnmleYcwcamOQ2ThEDPXKW0WYYunKEp1veJWCPeQSXBZ+xEAH0ZkisRxDdmmhd2osm7V3xpm
	QSq7jfrZ8fbcSjSxV/J20WXMJo0ft/Crndp0ya4W6yyG8lmWcYDjLkfw8mVjS5rbf9uh2YkuRV5
	tzZ0dr4B2gRDhlzOuJXd1LNIpS25u5PNhm2kpN9N5eAwzM6LZhURsHtAoWDXs4VUoHl9o29j5Ah
	qCWzvzUePzgH2myDxXDWl1vxKeX2d0SkJtwqDOWnK5kHNk+/PHnAGS2Ac0Mtg6+dVscqNH5XiXB
	FJfT3WZLtUVBY6FDSLA
X-Received: by 2002:a17:90b:1b07:b0:38e:7f1b:efa with SMTP id 98e67ed59e1d1-38fbc438047mr9182294a91.11.1785766756347;
        Mon, 03 Aug 2026 07:19:16 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:16 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 24/32] clk: mediatek: mt8167-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:51 +0900
Message-ID: <20260803141659.559129-25-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071917_319011_AA659E12 
X-CRM114-Status: GOOD (  14.98  )
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

The MT8167 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.
Also, add a remove callback to properly support module unloading.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 50 ++++----------------
 1 file changed, 10 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index fb6c21bbeef8..2b1d1de74cdb 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -89,44 +89,13 @@ static const struct mtk_clk_divider adj_divs[] = {
 		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO),
 };
 
-static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_devm_alloc_clk_data(dev, MT8167_CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (ret)
-		return ret;
-
-	ret = mtk_clk_register_dividers(dev, adj_divs, ARRAY_SIZE(adj_divs), base,
-					&mt8167_apmixed_clk_lock, clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_dividers;
-
-	return 0;
-
-unregister_dividers:
-	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.divider_clks = adj_divs,
+	.num_divider_clks = ARRAY_SIZE(adj_divs),
+	.clk_lock = &mt8167_apmixed_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
 	{ .compatible = "mediatek,mt8167-apmixedsys" },
@@ -135,13 +104,14 @@ static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_apmixed);
 
 static struct platform_driver clk_mt8167_apmixed_drv = {
-	.probe = clk_mt8167_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8167-apmixed",
 		.of_match_table = of_match_clk_mt8167_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt8167_apmixed_drv)
+module_platform_driver(clk_mt8167_apmixed_drv)
 
 MODULE_DESCRIPTION("MediaTek MT8167 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0


