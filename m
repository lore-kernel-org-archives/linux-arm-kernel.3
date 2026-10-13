Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FF3CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEXcscvrJtgAmrYVGg0Xg0Qu27fkyZnfR3Z3i2hfldY=; b=WqQU/cR2L827sK03T88ke3hoyf
	VI3hej1DhYd5FMzMGBjcQPeZyaOCUp7rWDQxPjyCR3nD76nDViociHqVvOR97mUldzipjr8rcyWa1
	xADRKwwgHnHbKOnD2lkcV5wqVcuXYH1yMlcR3do0jNoeP97EAHqD2E+eSJ6Qe2r7PztyFigYOXFGW
	7Ti0c4+g10SAfbPnqc2qJoSn00ZUtk88YHNc3wp0VMzaNsFUwsqZfv5FHkh+jRqI+VYo4X/yzeyEC
	wyDFoU+w+tAMFfVyYr5qBMxgUyYVksBW/O5HilYE+2B75hRCdaoYQDyanRxHx4yloU/MBQXduEHwt
	6DB1W7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJm-0000000DIl6-2ePx;
	Tue, 13 Oct 2026 15:21:31 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIp-0000000DI2f-3skG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:46 +0000
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89a756e5d20so2367362b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904831; x=1792509631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEXcscvrJtgAmrYVGg0Xg0Qu27fkyZnfR3Z3i2hfldY=;
        b=KlXK20As1qvxSIzBiHzAPOmnAOyhYMxslavsz9PkmUeAhgp21yfKUN/A/fb20IPOzN
         B3Db0RyDOfYK27FJCGk0Z72xqDC0ZT9JSPA9UJsgfi2kwZjJHK0Z1VkR6NSKt0JQq/NX
         0VyRBRzup01pXE5ElOY7MQdN+xaAEC2m9ZYirv+oSIZGzGxzkgbaP30KmBfIsA6KbnRB
         5Jg++AsHVE88RXCGu0O9li5KzgRktf6CphnsVx0LcotliS01Ea59oILCY5km1o2zubyF
         G56KJhFdO0XB7vD2iBwSFUkXyCiPAGlclnVcXk9LO9iOkpXZURqgp6kexi7BcVtovk8S
         PouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904831; x=1792509631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEXcscvrJtgAmrYVGg0Xg0Qu27fkyZnfR3Z3i2hfldY=;
        b=mBPvpy0rZ3AQyBWaddabVKq69Flh+Wac6WegPpszdA3vrWMyEjEbybRP+XBGegZsT6
         EmbQdNFvcjG2ipw2KmVd/FNpTy2K4klc+TQY/5MwzqTOVDr4PWq19YA6cfW5BeDPSQEJ
         v/oaOUawjf7sdN3LsDovJ1y/9adD7GqY+gBUtcG+dzJAMxC0z7e4g5pRmnsvqMi5qFPi
         5VLQW4tdg72vN6eODa4OxgvLSiiX3HPBp6qGAksH7ezZrxwId5zIOuhUOFPc6Z1IuqTD
         ZGuy/ihBoWjQ1C5LM7RSVKnFe4NZ4ImYfJjW56dFLNwmo2EKQ5cxHaAH1JJBdj/Y1DUO
         dkoA==
X-Forwarded-Encrypted: i=1; AKwUvBzth8/su7KpYF4+IhihQ011JJrv0W7aIK/uLxY/N0nJnKRmiD5ebeQf0yCRjhm/sFFSpM3iyB9EsgaWZdlHvY4L@lists.infradead.org
X-Gm-Message-State: AFq9FYID3UmxMq5wumlJKIzs0wRQK96/SLytQzDM5UrDnc5kw33JZ/Ah
	wHO1MqtuGWI5ZDI6LoA9NdiVYr6EbtLnJBCnO6wGqxVGr6rvn6r7B7TA
X-Gm-Gg: AYBFou3+/h9rdqKk1IZm5Ewci+l6oWZpK650ZQiTC9IAqiK0DSF08kS5De+/Vl6T32D
	vsuPhcED/sYo8nRmIiRHEo/hAu6l9QpMY1Wqi+IwsseSthKhoGsPEsSv++OZUEG/aACJteUKGHv
	/ElaaTC6Ec447HLLrEKj3EKDGyMPr4BUx3APNtw8iCXTgvMCvdrwHvTfC7KGvOWQcrnO89tp1W5
	whrn1O/Mb/AcarxcNoahRoc7Sfh+xLHBmiNV2A81aAOgI+vITRqx3TrDYCw49vY9QudyVEFPEuy
	zVq39ZVqRwiQF6y6iurgl9Yf1UTfl+vZFyTF6Dc1Wf2S7qG4m5cea4GIZiNWUz2aBe/IepMhGyy
	BHYjfuQoE1n9H/bJxyvZ2AgD23pGNLfJ11yj5shHTPgr7/qZV2/S0VpvtOcc2FLGj4dPKMv9qJG
	kCZphGrgU1VEXq6/XdKA3xOnbCWHjPvgOfP0kB9wwpF06ZkI+3HmdURQY1INyWcKnZ6fmW8R+JZ
	/zr0yQGlQfjh7SEQvZYYpYoZu7T
X-Received: by 2002:a05:6a20:734d:b0:3dd:d887:3e28 with SMTP id adf61e73a8af0-3e16bf4e824mr10572171637.74.1791904830571;
        Tue, 13 Oct 2026 08:20:30 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:29 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 26/35] clk: mediatek: mt8135-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:25 +0900
Message-ID: <20261013151734.3177690-27-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082037_782726_496D62CA 
X-CRM114-Status: GOOD (  16.30  )
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

The MT8135 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 50 +++-----------------
 1 file changed, 7 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index e3b7dc13b458..fe868417de48 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -47,56 +47,20 @@ static const struct mtk_pll_data plls[] = {
 	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x304, 0x31c, 0x80000000, 0, 21, 0x2b0, 6, 0x0, 0x308, 0),
 };
 
-static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int ret;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls),
-				    clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-
-	return ret;
-}
-
-static void clk_mt8135_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-	mtk_free_clk_data(clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
 
 static const struct of_device_id of_match_clk_mt8135_apmixed[] = {
-	{ .compatible = "mediatek,mt8135-apmixedsys" },
+	{ .compatible = "mediatek,mt8135-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8135_apmixed);
 
 static struct platform_driver clk_mt8135_apmixed_drv = {
-	.probe = clk_mt8135_apmixed_probe,
-	.remove = clk_mt8135_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8135-apmixed",
 		.of_match_table = of_match_clk_mt8135_apmixed,
-- 
2.56.0


