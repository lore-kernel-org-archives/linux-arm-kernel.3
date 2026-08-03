Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAF6C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K3Yx6VzHM8GIbCrqX9zZGoEb/ITQ0QyQysBjSMYncA=; b=xbtC9j1GWZvr5z0eBXdeMQoeqg
	8gfNO9ruJTzuDXcC9IcnkVVngMxBpKa7rBViI9D6+N+12BvQ9Rl1FmZo+bnaqPa1WcCoHxquR9CvS
	roQxR/EUxHZEbpVVcPDmIsIQgyWlUwhV40edHyL3hlP66rljIaR75Urpkk+q/3By9z/Y3eKepLHis
	+S02sOriJSP0qCpV4gV4I11Y5Be2n5dGYuE/mQlca8xFPPsO4E6ZxyG3A2NyJxk6EBwl4nCaDU+2f
	ZOSOUGGIQSSGmGELAr8JAjJ1FLE6UlAXky8XlXQzSufc3zW8L2B+o+YC1Lbrjb4coO+Ehmgl+P/I7
	Z7pWgB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtV0-0000000HL1Q-2pfA;
	Mon, 03 Aug 2026 14:18:38 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUy-0000000HKxJ-0yQJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:37 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3408075a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766715; x=1786371515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3K3Yx6VzHM8GIbCrqX9zZGoEb/ITQ0QyQysBjSMYncA=;
        b=LUwwILH3Qd+dURaexrzcuL4/ciJwKkHO5IwG8VDTYUDDfSOKcTCX9BsYjbqTJGOk0C
         HbARE4ECjzMaqYSax4uCMo8/Osa6oBJ/xD9pNx9P2mBC1hQqPruKdVEaoRQqJv8siJ/0
         Pt9Q329aii3txRZ9U79VCR+axXfytqfpdMCGgM2n8B9DhwgVeBACYUqeql6w/ZMt3rzA
         VpwaPBLFGUm6H4KQuMlegktBLSexdZrcAC/11/IkmioyZIQNu/q6gauorQ6mfuJsd2Vv
         jkTeAkVFnsOYB5xhPn1YpiA6CYWQY8awAIEt7s9xTln9bXnaj/XZnzIroVvg+YESUf35
         NJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766715; x=1786371515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3K3Yx6VzHM8GIbCrqX9zZGoEb/ITQ0QyQysBjSMYncA=;
        b=jv6PDMPjfpDlCX8xjtt1I41XuPs0PsfYZFFWYMDXkac2if1TT5PACp6CZ/l9cX2DDE
         0avri0C1/mafZtZ35r007yP+Cd4+DIbmcjg77lQJXnKRXH2XR1fj1cbYEI5wM6n5F1m4
         c0wR4YjEGWLk1/6K+em8TVU9XFpQmK1Bj8TX7wiEGrUXykQS6jLqb0f0oyzx/Zjgqpev
         sAeZwPSxM1yQuUT9fo5olc5l3M+qTjTORWN8eSili3sf7z6VDmwBns5BhZbTRSy5jEXU
         6swtWs2GgKDw0wGtOPYMCD+5NycbgD1S9ZXR6Yqlkl/iUNzbQ1weoLpmhOPBuQNOirKN
         l/Kw==
X-Forwarded-Encrypted: i=1; AHgh+RrsX5oWHU/8g9bd7TnTuWG9V9c7GzKoc4BNyud2hVF6SgcBvS4d9zezH5olfUA64Ju74eOspxjHKpgRqUXHug8t@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy8Na38cWAmimKeaglfb8/t2JqbEs6oNy6riMoFq14pAD6oHva
	pMXt+hJFMd5E3R2Y7NWKR8llq1kn+yf+lWZKpuMswa5yTZpKMj6ki98K
X-Gm-Gg: AR+sD11S5hMrnmowonoSq0fICTTqzoeR8HXHWbp+oAlB4qbInFvz0jlfQ7GWL6HPsRd
	nzjf/Zy2GVgKH3vTm1ofEObV/lpPGowY5f11O003vloxLD2v9hWaQt9eKppZ6qqL6P9GGuKOeSn
	EppvJz4DPU7bzV7nJIC1buAk4wFqumoRoYKMpmIz34bo0xAMVoBTWrpnf8ZyPfLS4rS1XuFzMrw
	cudDVKiL4Bzy4hr5PcqaNEkcrSfz1D1uxJ3VekXV5eVbH3ajurLpGCDDfCzOZm123hY9M3qbfn/
	33aCl9Qq7Yvrv86mfbS6uNvtGqOg+sdB1P6ylRLzlyb41mwKbun8ySdELNRoRc+7a+GLLNWbuXs
	Ggn2ehV0PyBozRB0hmK9G9dmVhRc5rEuA0ctX23/qESW0Qe8L8oX5bDtUhyRRzTNRPV+FPu4fkg
	WYZp9oP1U4VIrWwllsP9wXYyr0VSoVgTWynQR16iRZrBZkhETpJYrQqa320Z8BQCYqlOmWgUSHy
	lTwpSxLqG9uWiFBrVl7
X-Received: by 2002:a17:90b:280a:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-38fbc4542edmr8751782a91.13.1785766715117;
        Mon, 03 Aug 2026 07:18:35 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:34 -0700 (PDT)
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
Subject: [PATCH 15/32] clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:42 +0900
Message-ID: <20260803141659.559129-16-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071836_284173_81F99A92 
X-CRM114-Status: GOOD (  15.38  )
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

The MT6735 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 48 +++-----------------
 1 file changed, 7 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index 9e30c089a209..94cb0bee8bb4 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -77,54 +77,20 @@ static const struct mtk_pll_data apmixedsys_plls[] = {
 	PLL(CLK_APMIXED_APLL2, "apll2", APLL2_CON0, APLL2_PWR_CON0, 0x00000001, 0, APLL2_CON0, 4, APLL2_CON2, AP_PLL_CON_5, 1, APLL2_CON1, 31, 0)
 };
 
-static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct clk_hw_onecell_data *clk_data;
-	int ret;
-
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_devm_alloc_clk_data(&pdev->dev, ARRAY_SIZE(apmixedsys_plls));
-	if (!clk_data)
-		return -ENOMEM;
-	platform_set_drvdata(pdev, clk_data);
-
-	ret = mtk_clk_register_plls(&pdev->dev, apmixedsys_plls,
-				    ARRAY_SIZE(apmixedsys_plls), clk_data);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register PLLs: %d\n", ret);
-		return ret;
-	}
-
-	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
-					  clk_data);
-	if (ret)
-		dev_err(&pdev->dev,
-			"Failed to register clock provider: %d\n", ret);
-
-	return ret;
-}
-
-static void clk_mt6735_apmixed_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls), clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = apmixedsys_plls,
+	.num_plls = ARRAY_SIZE(apmixedsys_plls),
+};
 
 static const struct of_device_id of_match_mt6735_apmixedsys[] = {
-	{ .compatible = "mediatek,mt6735-apmixedsys" },
+	{ .compatible = "mediatek,mt6735-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_mt6735_apmixedsys);
 
 static struct platform_driver clk_mt6735_apmixedsys = {
-	.probe = clk_mt6735_apmixed_probe,
-	.remove = clk_mt6735_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6735-apmixedsys",
 		.of_match_table = of_match_mt6735_apmixedsys,
-- 
2.55.0


