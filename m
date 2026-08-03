Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFDBC55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZCNDtviR1JC6xXXbBCpthup0l4v5bhXrxKWkP3TttE=; b=rWowLxvjI+da+3QbVE+Di/5zpH
	r+kEgkc6e2bSQXlKmi1PLqE7TUsZ6P2qqwepzd26KlOa8KTLMW1bFED9SFIlO3XfXh9RU5sMkkPQG
	sp7EoCRRRy/Ytm7OV2wsN2KvjPkKL+mnMylHsrOL3BiXreGpThH/dNFN5ljff8wieOM1sNEg0nZ7i
	t5h7Xq6znbZ12QrHqBp0UmUl3bpjN2p21zhjdDcyHgSVIfgBznXvYZ3nmg5X2Y5py/giSMH2R+rBQ
	tBVdtcqpk73WK5EfbGDvnF8ocOgGgWUbyBjSYJV+gd57vWMK19XDjPPo73aFmloQz9uwQ8c8/pWjf
	1M/BQGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVa-0000000HLuh-3xI7;
	Mon, 03 Aug 2026 14:19:14 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVY-0000000HLp8-2FsE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:13 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso2608850a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766752; x=1786371552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZCNDtviR1JC6xXXbBCpthup0l4v5bhXrxKWkP3TttE=;
        b=CehvcxcflRtPie+jYkrSaDvn0rv4p8gvt6OhXcyquOI3/9JxDlt/c4gaFCL7pIQP7+
         rQGCZHasBLPA+Fi7cTtzLNPSowOb4cFQz45lWbGxX8bgkqLQhFHYTC391Gpto2wy6PLc
         RbpukC9jtHH+tmAgA88j65fIbTyDFOaGHVYf0S2p7ztAHbr+QiGZwADmYXkMIPU9VEBO
         hzuuvkhBgyQ8ORPFAxwO+5kz5vNIMoe5rq6ZHurTv7ZU91xE7feEv3a3vGvib7JHdAXA
         JT8CZdfP8WmpDqAGS9/Qa8h8M5BOfcKpMbT0efj9TNW1yoKZg2c12rnU8YyjRTucdZoY
         CYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766752; x=1786371552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SZCNDtviR1JC6xXXbBCpthup0l4v5bhXrxKWkP3TttE=;
        b=hLi0BdQ96blAhv51rYDqk9R6/U96Us1ypKV9NwnAxKC8f2ZePaaRgbmX1V3dU+//Gu
         ADKeqPMA5ach+USk+Dc3qjOcbFLjzcC/UIiSInN2eV68auKByd65YtJlmXMbNcrdVvM3
         k7pLFpo6UgOSibFeIGnYB3ZbcvyUbypGuAHj0RsOep0GUmhWFlDQtRN34uaA+zpF0FXI
         6BmbkhM4e1MXOmH6bqBUL8LEns0rP+ovvEMOuM3UWHN5lf6BDaRY1bog1wsGNXEyPEWo
         okPY9Xa/1Tpoed8m4SaCY715G3TqYZp5O8nm9yG+ZEri/y0yLliWKEDDPLsOif8nXprV
         RUdw==
X-Forwarded-Encrypted: i=1; AHgh+RrczWag0qZNizfdDvv3lz7bL321yhWJxQX+AbC4dU+sOZULWKbPlLjj9wMma5j0zHDnoqbM0+WRYQC1egMl+0Ox@lists.infradead.org
X-Gm-Message-State: AOJu0YySMwJxCLSGVDT47NcgJIwoETzPxpYTBYnDzcL5LNbqJ1h3KISW
	SB2EX6DKPXcunMZapwBA/crsZxtuM2a9aaijADNgZ0SRJRkuyxi1u/uJ
X-Gm-Gg: AR+sD11vYrreBavNxPRVVNynBEEws62LKW2pC98/YSy5H1SvHJ2tXuWXngbUZYY8QXE
	iMAgKfMU/zQeF7nT7oE6ej2qcy+XGvwnuY0SHTLnO35kQhH9VcEi+5bKJwDzq//t4dJBFhSIbC1
	EQSz0lMIV96rvs8gktPyhLPrJ2PdhRn6YXK0PF/Y3Lq/9lM2A+OSDwbJdQ3eCUmI1qCoWjpzzL7
	GRS4tLXQPfDPkGFKz/BEKp0OjfvodR1Ag2waCGwTD0knXNEFcMrIRpciEugGsME5gzzKPHeusBu
	Q01jLyFz6TPSek3nlyDiMVzSvE798m88Y2Em0+IwOE0uh3UVSSb7QNu2gdYwfBkxEJ+Mqrm9iTR
	dQeou63JE9AmVA6wQ0j4Ig19kBgWxWjlaKofChcoqotGUVZZnqn7YR61woGXvrw/S0liIq/MXl/
	07LP24Zf2bPWwJ8Y4bZbHsj5bJzklmXcIHBXGqKzs7J7m/iuM7aOYfYBgZqaMRU5X/J/rBY4de1
	FMQgbO6eTvFCBkvSXZ1
X-Received: by 2002:a17:90b:2251:b0:384:5dbc:cba5 with SMTP id 98e67ed59e1d1-38fbc4cdedamr9399280a91.26.1785766751774;
        Mon, 03 Aug 2026 07:19:11 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:11 -0700 (PDT)
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
Subject: [PATCH 23/32] clk: mediatek: mt8135-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:50 +0900
Message-ID: <20260803141659.559129-24-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071912_590765_8AF25899 
X-CRM114-Status: GOOD (  15.07  )
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

The MT8135 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
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
2.55.0


