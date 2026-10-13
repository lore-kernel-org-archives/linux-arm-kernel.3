Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C907ACC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koJzOGNGhGI2FekRZoUPq9jws4eXY5RXfs5BhgV9YaI=; b=a96I5T9BO3Rl3aQj780sd49xW5
	uDH7Vq84Hr21KUvJWavVMCuq450YZUJuFjBa4iVG/w8JZv/6hmP6Nvdf4Uqj82kYje4dQMGBoyBTa
	jARCzQMTNzXe+rOlZacFmeGcRy4v9btEMwZoNkeBufz/UdsriQbbjOvJI0EV8tYrhOjRZRF2WFTQS
	EeSPnTppuwZvUAPX++V6bV4qmya1f3Hps9qqAZSZCBQXA7c23JQdTM1zVM5IRf3O++114/iUR155j
	djYguXGvm42Fg4ma/jX1E/HQtkZUjLiibs5DA5aGvMeJJFmeat1GNvPp194TJCWjEnMHjaNTmmcu2
	XFuiAyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeKU-0000000DJCN-1BSt;
	Tue, 13 Oct 2026 15:22:14 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJI-0000000DILK-1Wa4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:21:05 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1867433a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904860; x=1792509660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=koJzOGNGhGI2FekRZoUPq9jws4eXY5RXfs5BhgV9YaI=;
        b=Z9SR92dQmZ+cCoreEfPTPMTBTrcyKcQAvXVjucTL1CI2lAYyz0+P/s5OHMKaq1mCnT
         gKfQJFOyRZVhqMYpITP4+butWOnojawWUYT/zR8jJgVe4ffycuFBgJ+5mrOHKfZRvQH9
         WRw9jgsY9qQlj5XZGNjrkoiv56bWw/v5bHFspBRjdzgShAgpgHOvtv+F4OZsIJp/YV87
         Ye9HYfFNis6jEucQcLtnTB+udxXGgp7JQHGPWxGtnjP/GECMROd60/9ouOO9iPaxzdPl
         o7z3hf85IKXtGrC1422S5NCeSThuGypNbRj2ZUk1HeOzICzE10LX+BkaIuCGgjVg04qM
         T2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904860; x=1792509660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=koJzOGNGhGI2FekRZoUPq9jws4eXY5RXfs5BhgV9YaI=;
        b=QI4q6MlO0U6e+OMZ933HW26GSynDSKUXnfxZJPBsIUBsK18HyzATv+xu7fdgQvZ4TR
         DlUHwZEE4ZnHwQEPUqb/6KpecAbb7lfHqi1caOaVBzZeXsqT9P3+Onwn91aRMFxb19a+
         o4fYTPBod2y1Q5N8MJ70CVQF6Z8bULEbrOYM3fY1tQAP3K66B/T4WVenLPmiG0OAHIZN
         rcWA52LCCU/LxPkciRrNi25qeAj9xVlWj1KA3CfsyTyNNNZ8JxMM+hpb0J4xa2SBacvB
         kVWzbObc/UDsAGuLdhop+e76TTrozyyctztjVqecGx3MFo4urvFrHKVotk7oFZRIllqY
         2Ruw==
X-Forwarded-Encrypted: i=1; AKwUvBxyemK8xuOWz8wkzyAa2uXUrqYeaJF7V+1JGBthvcyjzoJVyArEAMjyGjBPcaGhKfNYu14xjKCkKTh+JZJNXB6X@lists.infradead.org
X-Gm-Message-State: AFq9FYLGV8wikYBHBhtR/BJYwcZkCutQbiPpcOv21OowrOIK2MKKq+pS
	pcjfvTSZMnbUnu5SXGGNehF/T1SdFmQldYt5u9UHf4alAtF7cyZBc2IZ
X-Gm-Gg: AYBFou0AwEga3sEBZxTG3HzTTjmMDWNKqOMFR7Ejfgp31nmeYBRySBgY4U9DsDJ0Z7J
	ApHWnd+sZ+NhCqq5Q2sNwU2zFCM7+AmSJJogXsBmsh6Xq5KPBaQzv5kbVPVeLROBlovMotZDf2P
	7X5sB/xaJoUXJ+qJicg66H/OPxQhBEkgg4E32Fu8lxiCGI9RFKBStcrgMvqSmPKeaqyQBPmk4HX
	nD6ar+akKpv0cm9nPw/z97jUDN2ueyiBNBUvyFyglS2v3sffDbDJLnvvAzG5ruT5Jm23tjI6gG7
	O1JLiHJGTWlHE3c2LpJN1DjhDbFyyoHqotMh9fvdDIXs4jZ8jJQbpl+Kh78oi+HjoFhSY+I/jAo
	0CCz9O5AkQASSKedcuhTIkOKlxTydZXLbEAkrAAmr31e+fVMWlR0Xt9XEBOnnZ9Ew84srBeTm39
	GOaBOtQ+qpB6AkFrsfMFfk9xcWwNhmF2FeGT/4PeFg+UcKJvL7f1cfzvincmdPocEo2ue7eBDhH
	OcrOol4lOaZ7dIYQw+cw6vgAgv8VQ==
X-Received: by 2002:a05:6a20:db0c:b0:3de:4976:a0fe with SMTP id adf61e73a8af0-3e16beec8b6mr11313108637.64.1791904859502;
        Tue, 13 Oct 2026 08:20:59 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:58 -0700 (PDT)
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
Subject: [PATCH v2 31/35] clk: mediatek: mt8188-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:30 +0900
Message-ID: <20261013151734.3177690-32-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082103_816555_8658F27E 
X-CRM114-Status: GOOD (  16.63  )
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

The MT8188 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 60 ++++----------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
index 48a2f61d4b77..3937d93cac34 100644
--- a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
@@ -89,62 +89,22 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0, 22, 0x0344, 24, 0, 0, 0, 0x0344, 0, 0, 0, 9),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+};
+
 static const struct of_device_id of_match_clk_mt8188_apmixed[] = {
-	{ .compatible = "mediatek,mt8188-apmixedsys" },
+	{ .compatible = "mediatek,mt8188-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_apmixed);
 
-static int clk_mt8188_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-				   ARRAY_SIZE(apmixed_clks), clk_data);
-	if (r)
-		goto unregister_plls;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_gates;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8188_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8188_apmixed_drv = {
-	.probe = clk_mt8188_apmixed_probe,
-	.remove = clk_mt8188_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-apmixed",
 		.of_match_table = of_match_clk_mt8188_apmixed,
-- 
2.56.0


