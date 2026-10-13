Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF7BCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iS9g8Y0A4CpO36TxjO7PQlqVvMbO+A/66QBST/Ft5vU=; b=K5JmbTNJRBMorn7u81eScP3uoX
	zAA9HThT8k9My49AOHqV8Ii6KsRmC+huBwGmbouhwHSisP5DHbi/25HjyPHGlZUfwIRVFklRyTVW2
	Mo6aJ/EznGJH+M8wELk3oKUHJyugsI1YJi06QKnMsz3ktRBiDOVyx91He01qnGDW+1m6P/nbz1gCE
	NJ8xOUeFNJjvBKOspHRkZskf5AAkM7wIAmrIchGdn3wtejFm4uww7j3hHvpMZDSxBQRS/kECLgzuV
	G7qzEZsur5LSquIex3R9FPcmFx6aG6FsgxXhX6SmhB1dEG56Mo0UggTI9M3tKUXqEl9tIRAvRkbNT
	VmmkASxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIO-0000000DHZz-1EQB;
	Tue, 13 Oct 2026 15:20:04 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeI0-0000000DHBW-0h97
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:42 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-89a595332c7so1580679b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904779; x=1792509579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iS9g8Y0A4CpO36TxjO7PQlqVvMbO+A/66QBST/Ft5vU=;
        b=XFeAI0j1Rki26V7XHI65t6KgaESnvfS0Mf9Uwf7QaRuRlXKkjk9SP4Xj2nZ3ZEnoGk
         QV93RL3ilHyDTtS0H5yYsIfwuNJD+dVMHN1TKM5Dg8aDcE84qLaGK314m2WceOSu0g8b
         o/YnTEe1hHvl/ulVOTAIC/x9gNAWLmiLXrlzQkE7Shz+XcfHqyvaiLv4snF03Knv7+R5
         r+YOz7KcAXPPttuSVZO0cg3HrypCaApnhbOxY10zQl3S9oehGCjexCD/4RumcLhN0Nk4
         paEhjfw4Z+LhB5mleMfTA1knu3fjj8/L1uiwf7vaT8IlE3WLJ6EZuf/LtkdYzp5GQOLV
         cPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904779; x=1792509579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iS9g8Y0A4CpO36TxjO7PQlqVvMbO+A/66QBST/Ft5vU=;
        b=sUy6lQGBvsBZ49K3Kdb1ILbI9dWs2ckF47Sy+hdF0vnRUoX2hZQk00Nu+h9LfFRIDF
         4h14JYBJQg2KYlvf2O8tDTZlbiRrdf5qbvTNr0XI+pHTL+PIfblvYj8RrrOXccEibfpH
         w3Bue8bMMZavQnNdqkYvl+9/FVYGq8XZPyiKV1BkX/JFZTyQQnESDCyMmiECP+HAg9by
         zi8eRZPVIXU8v8l2JAk3juDIeMRsWZ2udTbjkzBAW6EwiKHcM2LVqwzVCpyvVC4m0xvc
         DZ7wwHr/pP4sJPXNeRdRXP4ruZNHKDYnuwmffnGJFrTSDHd9RucA8uPeS94oHyGP39UG
         O8gg==
X-Forwarded-Encrypted: i=1; AKwUvBz6COny38XkkTMaddQjpFGfH8m8Ofe1yF54o3Fh59pRirNrm7bWK5O1UOZG4ZQ1UGu+s9vF0YfewlvtFmrOekg8@lists.infradead.org
X-Gm-Message-State: AFq9FYJZ89xQGMnXWpWibIN/pxOkCe+OCZNgFu2WmFsEpvYbmwVSmjHz
	GF9jAftSnkwSO//tmC8SoGd2JhbXkiuPWjbAHRsEFjrSlZ6YW5KbJ+mM
X-Gm-Gg: AYBFou1rlsB6B9tS3OlB47lE34tOmESXjNrQYmzOwCFrktAZ7pVDmvI+EahriPfOT5s
	dcXFlp//9JIfshyHgbJy4XCUWJ8LrWGlWHq+S480CRQhTxyyhvPlhJmo9cEpvWtsbnDDmpWlDD5
	E+sDfbh6APxGuRbrgweXCW8DCoKSY78LG7dD7JVnIy0MWigXA9mGlaJj9MpADJ1Vx4RPxuSSAlN
	Oq0dW0Bm/04p0nEicPJm3lio1vPLsUTzOBO6gyidLKHzaWnMStShhWu5VcJX9UItvdVuKj9Mj6v
	bt7kpuyOOGtjPIqPIdoNsUVUc1xs58kHi6F4mTdmf6Iv7JfHzH6gxUrnavop5SlSBXJ3H2xKZL3
	gp9qS/RDEb+35UMjIJsprGQEk7zR0PoFl7oSXFRRLqsR72pzr8GQ/GHFPwLiJThFt6+tg39HloN
	436hJ+LL0v0hZwnU7VP+kb+rPPt1pN33KJDa6QlPkwCyNlZQ8bJ6KDR8b7hMijGrX6evQmMn8fM
	+usn8Za6XAeh1BepHp8BKO2FekdmIu15IbGS9M=
X-Received: by 2002:a05:6a20:c78a:b0:3e1:2881:1c0e with SMTP id adf61e73a8af0-3e16bb06293mr10849435637.2.1791904779265;
        Tue, 13 Oct 2026 08:19:39 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:38 -0700 (PDT)
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
Subject: [PATCH v2 17/35] clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:16 +0900
Message-ID: <20261013151734.3177690-18-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081940_256526_D1801125 
X-CRM114-Status: GOOD (  16.29  )
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

The MT2712 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 50 +++-----------------
 1 file changed, 7 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 087cf574bcdc..1e06f87e71d0 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -109,56 +109,20 @@ static const struct mtk_pll_data plls[] = {
 	    0, 31, 0x0300, 4, 0, 0, 0, 0x0304, 0),
 };
 
-static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		dev_err(&pdev->dev, "Cannot register clock provider: %d\n", r);
-		goto unregister_plls;
-	}
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt2712_apmixed_remove(struct platform_device *pdev)
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
 
 static const struct of_device_id of_match_clk_mt2712_apmixed[] = {
-	{ .compatible = "mediatek,mt2712-apmixedsys" },
+	{ .compatible = "mediatek,mt2712-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_apmixed);
 
 static struct platform_driver clk_mt2712_apmixed_drv = {
-	.probe = clk_mt2712_apmixed_probe,
-	.remove = clk_mt2712_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2712-apmixed",
 		.of_match_table = of_match_clk_mt2712_apmixed,
-- 
2.56.0


