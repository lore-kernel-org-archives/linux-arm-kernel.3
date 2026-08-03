Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95983C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVSyODgpLB8kzwF/P+aweBPyvt+kaNsYNaxOR9uV3rM=; b=vwH0T5EW/gdHhzIDvb1V8Bqe2F
	B6rH2A0581QCKTMirj0fcbMFHtSa/KITfJxaAQbxFTgBAY22S11B8i6OGDiokzqAwRM2yPRgU83IZ
	+Hf9L4INBZd0ndG09rptjokEZuW5r6hsbRjoEvQPDVJ4OfDnRA8vbKJPedbD29r+QsEgyFj4myr7t
	R++o3YNpv8xtCzYSdk9h/+MtG+EFbyTuijsy/8myu31asGDZSWnCyP88DY1Bz5IAHB8ytQxNRrRfZ
	SaMybUuWeTxPQZyHm49QiOyi6wX0P1rtc5iMWNPYVtKa0rzWF1QNq5vb8pFTAjBe8SLt99SKDtlPF
	HJz44TQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtWF-0000000HMuQ-3D4S;
	Mon, 03 Aug 2026 14:19:55 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtWA-0000000HMlJ-0cx1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cee9b74ee1so26670495ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766789; x=1786371589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVSyODgpLB8kzwF/P+aweBPyvt+kaNsYNaxOR9uV3rM=;
        b=BvFTXN+IFIXqSyQ8yWMBBF9UvvbnlukzKlZ2Khk76FA+W8W2KxxfD9W3YtcPBZK2bJ
         WZxV0Kpi2sDK/GwCfyWcOXnfcHCNcED9+axvhePOPMJqZ/+9lv7xKS/rBVxma3q1Tjd0
         av+Z5esIIS2hnRy6DGjB8LFvToC7B54yWMi9qa3IOjz18M7XrDMQ59GlPXIv+Q2d3tRK
         Cia3sn8tcHfJRyztNVg+ciK3TsSZrRHrRD6czmlkJor9cFOESGOo9h7aYLoAiN99uUSF
         VheJ29DZ/QOsw07g/uDjIEOYavKII1yfjjRXU6IATdLZG4d0ix6N4tMFrh+tfcYORIud
         lNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766789; x=1786371589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pVSyODgpLB8kzwF/P+aweBPyvt+kaNsYNaxOR9uV3rM=;
        b=Kwl2xzEJcLMS5AkBVW29uN6aq7UdMmGJyBOL7SJT4QiAmaNb3s9nl+AUpwYejgJ6U1
         hm/T0C0WInO7uT+9pztsMSlbOP7/tle+vrawqn0N+yETEWm+LvaHGVFP9F5KNVLfy3p5
         mBtNlX2gdf9+/ye/oQtEZJM3DEgTUpQRcbMB0xYmYgCXRhhsPkvYhZjj4yQFiVyrwyy8
         nPWVw8ceF3TRoTrTRU+2GDol/teS1eBM5COZ6MNklJSqnbZ02J52ARDTJajlU8F8oQmt
         D8EBY1pNhR+Abl88xTgv/wfwqNzPHqLQEXDDZk8NwEWe2NzKJZgzKxpspRi2EHjmFvss
         Naww==
X-Forwarded-Encrypted: i=1; AHgh+RqJN/9u/duqKMGf6gg8l30ibc5tbWFgIHmDRZOC3O5wcNdrkHBFx0SPTW7FMgHs5n5fqKpqQl3YitjECexIizpI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+UlvJLyNfLPE7G6jDpQs7G8xFDCu9PcqBCuf8LG7jk1almcS8
	P0pCAn/gGOufIwu6vHmBbtNa6P4Bf6e5rXTmiu3Ipu8wDooComv5NY7X
X-Gm-Gg: AR+sD11OOukOFBw2yL80vXtgxcjNc900d0gUoIoUoRmqTOiNT475oKwmGOxqEzuom0S
	AZvimV8j8dSmaafbi7e0aY1kGWN+c2DYSEFiaSfhs8AN9+DNoGL3STdvAcD1jR8Kfzi844nDZAc
	HZBFGEOURG00+3drcPCVhTPx7lhLOj/PPiZ09uIfz11rA6CLjF3WBC3RrETRtaDVMHA8YYN5ImI
	0cHBKuTPulgsRpJJVd++AhUtZgMAvYLk+SjG+vORpLYSfGiRnSv45N/C3ZQzLUDpJAZqEurYV4s
	9BiHSRhUPun/q1BoX05l9Zdg2kacuOg2Fm4xKhq4QeziT6UsfbL+qqPFVYoRXAydWfdQOUCxCjO
	dXC4WezocpkNv92ddJQPFTn68pxQqBMFPXtP0K+j/qcbyKdOhWldOPUIEAZ5QEZHU7ogmuvQPK6
	CKOuyK80rztL0hQiphcUhRL1SH2LOaM8MUhKx0DicjtHf3lRawQutVwGZLGWSro9uk2ETBA4HWx
	qo2SO0l0uZbRhpdoomu
X-Received: by 2002:a17:90a:d2c8:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-38fbc40e00cmr8678919a91.3.1785766788659;
        Mon, 03 Aug 2026 07:19:48 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:48 -0700 (PDT)
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
Subject: [PATCH 31/32] clk: mediatek: mt8196: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:58 +0900
Message-ID: <20260803141659.559129-32-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071950_212236_E81189D7 
X-CRM114-Status: GOOD (  17.64  )
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

The MT8196 apmixedsys, mcusys and mfg clock drivers can use the
MediaTek clock framework common initialization sequence.
Reduce boilerplate code by creating struct mtk_clk_desc and using the
mtk_clk_simple_probe/remove helpers.

Note that the vlpckgen driver is excluded from this conversion because
its probe callback needs to initialize the APLL tuner registers, which
is not currently supported by the common simple probe helper.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c | 67 ++------------
 drivers/clk/mediatek/clk-mt8196-mcu.c        | 96 +++++++-------------
 drivers/clk/mediatek/clk-mt8196-mfg.c        | 84 +++++------------
 3 files changed, 63 insertions(+), 184 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-apmixedsys.c b/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
index c4ebb0170b82..a20fa02070a8 100644
--- a/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
@@ -86,11 +86,6 @@
 		.ops = &mtk_pll_fenc_clr_set_ops,		\
 }
 
-struct mtk_pll_desc {
-	const struct mtk_pll_data *clks;
-	size_t num_clks;
-};
-
 static const struct mtk_pll_data apmixed_plls[] = {
 	PLL_FENC(CLK_APMIXED_MAINPLL, "mainpll", MAINPLL_CON0, FENC_STATUS_CON0,
 		 7, PLL_AO, MAINPLL_CON1, 24, MAINPLL_CON1, 0, 22, 0),
@@ -110,9 +105,9 @@ static const struct mtk_pll_data apmixed_plls[] = {
 		 0, 0, SGMIIPLL_CON1, 24, SGMIIPLL_CON1, 0, 22, 7),
 };
 
-static const struct mtk_pll_desc apmixed_desc = {
-	.clks = apmixed_plls,
-	.num_clks = ARRAY_SIZE(apmixed_plls),
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = apmixed_plls,
+	.num_plls = ARRAY_SIZE(apmixed_plls),
 };
 
 static const struct mtk_pll_data apmixed2_plls[] = {
@@ -132,57 +127,11 @@ static const struct mtk_pll_data apmixed2_plls[] = {
 		 0, 0, TVDPLL3_CON1, 24, TVDPLL3_CON1, 0, 22, 6),
 };
 
-static const struct mtk_pll_desc apmixed2_desc = {
-	.clks = apmixed2_plls,
-	.num_clks = ARRAY_SIZE(apmixed2_plls),
+static const struct mtk_clk_desc apmixed2_desc = {
+	.plls = apmixed2_plls,
+	.num_plls = ARRAY_SIZE(apmixed2_plls),
 };
 
-static int clk_mt8196_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const struct mtk_pll_desc *mcd;
-	int r;
-
-	mcd = device_get_match_data(&pdev->dev);
-	if (!mcd)
-		return -EINVAL;
-
-	clk_data = mtk_alloc_clk_data(mcd->num_clks);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, mcd->clks, mcd->num_clks,
-				  clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(mcd->clks, mcd->num_clks, clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8196_apmixed_remove(struct platform_device *pdev)
-{
-	const struct mtk_pll_desc *mcd = device_get_match_data(&pdev->dev);
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(mcd->clks, mcd->num_clks, clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static const struct of_device_id of_match_clk_mt8196_apmixed[] = {
 	{ .compatible = "mediatek,mt8196-apmixedsys", .data = &apmixed_desc },
 	{ .compatible = "mediatek,mt8196-apmixedsys-gp2",
@@ -192,8 +141,8 @@ static const struct of_device_id of_match_clk_mt8196_apmixed[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_apmixed);
 
 static struct platform_driver clk_mt8196_apmixed_drv = {
-	.probe = clk_mt8196_apmixed_probe,
-	.remove = clk_mt8196_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-apmixed",
 		.of_match_table = of_match_clk_mt8196_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8196-mcu.c b/drivers/clk/mediatek/clk-mt8196-mcu.c
index 13642fc673c2..e392408c93b2 100644
--- a/drivers/clk/mediatek/clk-mt8196-mcu.c
+++ b/drivers/clk/mediatek/clk-mt8196-mcu.c
@@ -68,29 +68,44 @@
 		.pcwibits = MT8196_INTEGER_BITS,		\
 	}
 
-static const struct mtk_pll_data cpu_bl_plls[] = {
-	PLL(CLK_CPBL_ARMPLL_BL, "armpll-bl", ARMPLL_BL_CON0, ARMPLL_BL_CON0, 0,
-	    0, PLL_AO, BIT(0), ARMPLL_BL_CON1, 24, 0, 0, 0, ARMPLL_BL_CON1, 0, 22),
+static const struct mtk_clk_desc cpu_bl_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CPBL_ARMPLL_BL, "armpll-bl", ARMPLL_BL_CON0, ARMPLL_BL_CON0, 0,
+		    0, PLL_AO, BIT(0), ARMPLL_BL_CON1, 24, 0, 0, 0, ARMPLL_BL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data cpu_b_plls[] = {
-	PLL(CLK_CPB_ARMPLL_B, "armpll-b", ARMPLL_B_CON0, ARMPLL_B_CON0, 0, 0,
-	    PLL_AO, BIT(0), ARMPLL_B_CON1, 24, 0, 0, 0, ARMPLL_B_CON1, 0, 22),
+static const struct mtk_clk_desc cpu_b_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CPB_ARMPLL_B, "armpll-b", ARMPLL_B_CON0, ARMPLL_B_CON0, 0, 0,
+		    PLL_AO, BIT(0), ARMPLL_B_CON1, 24, 0, 0, 0, ARMPLL_B_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data cpu_ll_plls[] = {
-	PLL(CLK_CPLL_ARMPLL_LL, "armpll-ll", ARMPLL_LL_CON0, ARMPLL_LL_CON0, 0,
-	    0, PLL_AO, BIT(0), ARMPLL_LL_CON1, 24, 0, 0, 0, ARMPLL_LL_CON1, 0, 22),
+static const struct mtk_clk_desc cpu_ll_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CPLL_ARMPLL_LL, "armpll-ll", ARMPLL_LL_CON0, ARMPLL_LL_CON0, 0,
+		    0, PLL_AO, BIT(0), ARMPLL_LL_CON1, 24, 0, 0, 0, ARMPLL_LL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data cci_plls[] = {
-	PLL(CLK_CCIPLL, "ccipll", CCIPLL_CON0, CCIPLL_CON0, 0, 0, PLL_AO,
-	    BIT(0), CCIPLL_CON1, 24, 0, 0, 0, CCIPLL_CON1, 0, 22),
+static const struct mtk_clk_desc cci_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CCIPLL, "ccipll", CCIPLL_CON0, CCIPLL_CON0, 0, 0, PLL_AO,
+		    BIT(0), CCIPLL_CON1, 24, 0, 0, 0, CCIPLL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data ptp_plls[] = {
-	PLL(CLK_PTPPLL, "ptppll", PTPPLL_CON0, PTPPLL_CON0, 0, 0, PLL_AO,
-	    BIT(0), PTPPLL_CON1, 24, 0, 0, 0, PTPPLL_CON1, 0, 22),
+static const struct mtk_clk_desc ptp_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_PTPPLL, "ptppll", PTPPLL_CON0, PTPPLL_CON0, 0, 0, PLL_AO,
+		    BIT(0), PTPPLL_CON1, 24, 0, 0, 0, PTPPLL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
 static const struct of_device_id of_match_clk_mt8196_mcu[] = {
@@ -106,56 +121,9 @@ static const struct of_device_id of_match_clk_mt8196_mcu[] = {
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_mcu);
 
-static int clk_mt8196_mcu_probe(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const int num_plls = 1;
-	int r;
-
-	plls = of_device_get_match_data(&pdev->dev);
-	if (!plls)
-		return -EINVAL;
-
-	clk_data = mtk_alloc_clk_data(num_plls);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, num_plls, clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, num_plls, clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-
-	return r;
-}
-
-static void clk_mt8196_mcu_remove(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls = of_device_get_match_data(&pdev->dev);
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, 1, clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8196_mcu_drv = {
-	.probe = clk_mt8196_mcu_probe,
-	.remove = clk_mt8196_mcu_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-mcu",
 		.of_match_table = of_match_clk_mt8196_mcu,
diff --git a/drivers/clk/mediatek/clk-mt8196-mfg.c b/drivers/clk/mediatek/clk-mt8196-mfg.c
index a317183f1681..a209162f6207 100644
--- a/drivers/clk/mediatek/clk-mt8196-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8196-mfg.c
@@ -61,22 +61,31 @@
 		.parent_name = "mfg_eb",			\
 	}
 
-static const struct mtk_pll_data mfg_ao_plls[] = {
-	PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0, MFGPLL_CON0, 0, 0,
-	    PLL_PARENT_EN, BIT(0), MFGPLL_CON1, 24, 0, 0, 0,
-	    MFGPLL_CON1, 0, 22),
+static const struct mtk_clk_desc mfg_ao_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0,
+		    MFGPLL_CON0, 0, 0, PLL_PARENT_EN, BIT(0),
+		    MFGPLL_CON1, 24, 0, 0, 0, MFGPLL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data mfgsc0_ao_plls[] = {
-	PLL(CLK_MFGSC0_AO_MFGPLL_SC0, "mfgpll-sc0", MFGPLL_SC0_CON0,
-	    MFGPLL_SC0_CON0, 0, 0, PLL_PARENT_EN, BIT(0), MFGPLL_SC0_CON1, 24,
-	    0, 0, 0, MFGPLL_SC0_CON1, 0, 22),
+static const struct mtk_clk_desc mfgsc0_ao_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_MFGSC0_AO_MFGPLL_SC0, "mfgpll-sc0", MFGPLL_SC0_CON0,
+		    MFGPLL_SC0_CON0, 0, 0, PLL_PARENT_EN, BIT(0),
+		    MFGPLL_SC0_CON1, 24, 0, 0, 0, MFGPLL_SC0_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data mfgsc1_ao_plls[] = {
-	PLL(CLK_MFGSC1_AO_MFGPLL_SC1, "mfgpll-sc1", MFGPLL_SC1_CON0,
-	    MFGPLL_SC1_CON0, 0, 0, PLL_PARENT_EN, BIT(0), MFGPLL_SC1_CON1, 24,
-	    0, 0, 0, MFGPLL_SC1_CON1, 0, 22),
+static const struct mtk_clk_desc mfgsc1_ao_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_MFGSC1_AO_MFGPLL_SC1, "mfgpll-sc1", MFGPLL_SC1_CON0,
+		    MFGPLL_SC1_CON0, 0, 0, PLL_PARENT_EN, BIT(0),
+		    MFGPLL_SC1_CON1, 24, 0, 0, 0, MFGPLL_SC1_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
 static const struct of_device_id of_match_clk_mt8196_mfg[] = {
@@ -90,56 +99,9 @@ static const struct of_device_id of_match_clk_mt8196_mfg[] = {
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_mfg);
 
-static int clk_mt8196_mfg_probe(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const int num_plls = 1;
-	int r;
-
-	plls = of_device_get_match_data(&pdev->dev);
-	if (!plls)
-		return -EINVAL;
-
-	clk_data = mtk_alloc_clk_data(num_plls);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, num_plls, clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, num_plls, clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-
-	return r;
-}
-
-static void clk_mt8196_mfg_remove(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls = of_device_get_match_data(&pdev->dev);
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, 1, clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8196_mfg_drv = {
-	.probe = clk_mt8196_mfg_probe,
-	.remove = clk_mt8196_mfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-mfg",
 		.of_match_table = of_match_clk_mt8196_mfg,
-- 
2.55.0


