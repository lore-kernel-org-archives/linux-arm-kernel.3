Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCE4C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyBWGAUwgPvbG+kxK54yT+71Lwi1XH6IM529yhUdCDI=; b=YBfwWxT76flfUEZOd4OSj0nGtA
	IofAQeBVvS2128AP+6wyeBqtra1YDI9MwlpO/KPJzYnvoS7kpLsykhDi9P3Mmuy4I1+11mPZT5x5N
	emIyZNSHggLyAU2QyQku0Yn/AwlXTRlP7fDSzdhXncP3GnvW1fBOSL48FiunBkfElOSgPMV2kl/B8
	z/pPAl95i98sp1rw4xojp+D5d3681xM0BKlAZlDuaN2iFfeiyNJ2CVZt5GRAVCYJHPK3qg+G4T0Q3
	IjaKZNtnjskhnobxPvrTWrY6jekbugmDdd09j1Pi1wEqB2QzV2WvkJJ0ZcirTk5LjdUXul0UYgQ09
	Mh5TWU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUx-0000000HKwj-107o;
	Mon, 03 Aug 2026 14:18:35 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUt-0000000HKqI-1dRY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:34 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2447238a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766711; x=1786371511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyBWGAUwgPvbG+kxK54yT+71Lwi1XH6IM529yhUdCDI=;
        b=Bi+V725vydSi7Cxsrjsb2eviiAAIqeo3siBA4MEFx1sG2l2/n96Aiya/95476rvo0r
         RIZE4TO52sECehcbWc4swm60yf/TRPKVHTcOR/TChTjrDrrrZZ/UfgwuWu0EKkXlWGb+
         2NHskWYV+oqancdiO6eYnCNFMvH0jgNflHZltijPXHGDrI2IyrOJJhTNMAzjBI1vycI4
         zGwOfsP5vCbUmMcr0mc2tjGeMTWJSS75ZjCtWm6+RcCiSsH3zPorQOj5n9RaE2zkCOKm
         IuTTT9LpNi4XIsv8Hw9DLpHwZYSvOkqli/BcSPmO69G4rbvmD13DxXC5CZAYY/LYNX0m
         aKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766711; x=1786371511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyBWGAUwgPvbG+kxK54yT+71Lwi1XH6IM529yhUdCDI=;
        b=LExlgncDVJNkCNi1niQH2/4w9kILU1qceyPt26vUag0rNIBaueP6HjvY3dHukIW8lW
         Mf6cEySyIRND6ngjhSek5BTZDjyISub/PDR9ayYeK1PxuNUAo7U5vWklZmMxFtElyZHz
         kwunPnXtPkWO01X3cxgWH0edwuJmviefN8bBGatz/5DClyx183o65ODfL3Nsz8ZpPDxL
         KxFImKg96/TtlmCr2aBnFncscZ45j1EfrsSXFfHHS78cfqP7fUKI8S7/9Htt98Gde49R
         eQW7f6nm3ncyEvEHf9I7ex4I7kXTpajNLcvL9py+S8/dvf/AuM82QKuBaJpx82S+OeSW
         qSpw==
X-Forwarded-Encrypted: i=1; AHgh+RpBDFSpYYKuqU3yGh7/8fCvO9Z+mbBWPJ3p9TIRxnkYJfAuUj4zIRe/vOd8lJWl+9+QSKHAIGU2A1k9z2Z3mdMs@lists.infradead.org
X-Gm-Message-State: AOJu0YyXMr/ywbjsKwznE/HfWQmbj7yOmlYRJkaLBl08sHiQEr3KPzo8
	4IvpFlBBbrzpji3wEk31M2g+Uhw7FbCK4ABUiv2nqqJmsvE9XHlITfFP
X-Gm-Gg: AR+sD13d0DvVHmzLmnCzlRrdBGEZAh/mlc/y9Vl9+Y10RSxXRPbJSD7fvWzFPDoa8Ho
	RQJ+qYwxbJocyAD/KnMtwTVUtTA0vwWZH9hJ+Fz+q7HH1fsewsMI2uoDHwIXMc2yL1uh5kTl9eC
	gHBET0V2JOq7N/UjQQymWjwDC9i8WRGcDW3RsXkXaFHYVU4IErpZr5KETQCNGp2eM5kyVhiIAra
	Ln/8JXq0wEV6b5nZY00dfLG0OsrtiVoAcZU6V+l+HUiQlCBk0bWfTbinZ58ahf5/EcHtrMU6iHG
	EhANuBvMhLeCZKnxv0jrpd+EExKQp5PQEGVJvTCEy3/6hYY0WGi1y4gD7rT6nhhRZ5GAshpFNwi
	1UPJCwx/fFHTAivFe+NFBcO26HyZ0AV1kI7xIWaWSqeSIB5ZPFWBvjsaYpNOlWuQQMfQ/zCASPi
	E+joh0fhquxO+r/2pO9TKu/bZ5IMEn3rs6P+eDCYw6BaLtkPgL/LS+7zaVjsouEuxHSXwPiyTEw
	2lz7Ft8dFzxOl1BpF/1
X-Received: by 2002:a17:90b:4b12:b0:38f:57f3:4dc7 with SMTP id 98e67ed59e1d1-38fbc4c66c4mr9869202a91.26.1785766710548;
        Mon, 03 Aug 2026 07:18:30 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:30 -0700 (PDT)
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
Subject: [PATCH 14/32] clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:41 +0900
Message-ID: <20260803141659.559129-15-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071831_447498_FD379071 
X-CRM114-Status: GOOD (  15.08  )
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

The MT2712 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
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
2.55.0


