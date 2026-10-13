Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81D4CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7A24ejUwY/Lw/k8ikBjY86/NzDpJfzki628g7H+OFKI=; b=4x6D6GyfUAAIU7abpMpCT6bZSf
	rthlVGLsQx8+LKIBmFOt85hWxcjNjileLvBG+Z9BReTNx2tTVtiU+bgKEnW/uNzS8wqiYNoHTaUA7
	sU+HkME8+Tx/kPock1Bx4UGvxL8rxGPLYIb+7a6Dub5NQlOf4AAlI85E4stFzM2gYiHbtXeX1Zaxe
	BztXTsXUjMbbpPBteZ/3BfxvWT/0d4SSACpfd1GXl3lXdUwgYj2ZJw+EWYdAbtK788mTgv8z20YZX
	lHS/Ytel1SEgTaY2UqTGLka7qgRkoj+HnqwhLafA5zuwWmiZK2aqdX8o/KM4qu/zAgXh70JA2iaSK
	gkRPAC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIR-0000000DHcz-1Gsq;
	Tue, 13 Oct 2026 15:20:07 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeI6-0000000DHIx-3JzJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:55 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1449407a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904786; x=1792509586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7A24ejUwY/Lw/k8ikBjY86/NzDpJfzki628g7H+OFKI=;
        b=BozTDyHZqukHuJU6BBpR01KBvoMvw7iGCnIoBj7XsZVowd9OozHFJBYestbxmpuehV
         Ay2BNChGc4prgTsFOSD1zMXPN4eAq+KEiKG14jhTXkTIc1jj9cBleJIgTXTZH3+5MkEJ
         nlyrTql404U4SI0i1QLg2ZjsPfdqCkP+ygIUDQ0ClXKHt9+xwoQv3U1/GCShY0b5bS57
         Vrh6D+m0CdIFuxId1Fcou03hxQjS7n4hvtzlgMjmM+SlrQDQCxxEpUKY5oKdW9/C//W6
         d4WvCNxomOeyBO6PTSLNbrSvSakg7k+16RQ/iiZAS/XyrTknX3C5ZmOq509V2RZVB2hI
         lrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904786; x=1792509586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7A24ejUwY/Lw/k8ikBjY86/NzDpJfzki628g7H+OFKI=;
        b=L8ZVT/4ANP0M/q81ik4+11HDET40TFa/dBA0+U3niLZCYNi/5G+/XpoRz0uuhQittd
         nRwpCpSCgpks0NlYl4liOkBgEGlReEpSizzAE24xMElkeuKrsNDF4pFADynTfq/dTxpj
         GSOjOTQj4YQ1/hd9v7TznSn2aNn+gtnsUrdkuGrTfE5x1iYLjYLUdmdF3AZfc1wQ4Pgp
         VODY3IbYn+SXkcUAu6Y+AOcCm5SxffW17hgzVLJB7B1JpLsrOeHspZeF4Xol0BNB8pkN
         +IxvlgAXVpNjXFuu6TZ4NeqQSNP/6u5gCK9tQy1A1f5+yB+2m6BcmOUI7NCdOCxYO9Ok
         J9GQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH78HEK2Us0HhRqg3xm1yVvcoGpnIHMNaC2VpZJSB7D9JqFn0Jbjlqkuz+ZSOT3X9BfW7641NjZcD4Q3ekcj1M@lists.infradead.org
X-Gm-Message-State: AFq9FYKCn1bf6sdIH67yTpONBvzs3ows/+SbAaEd8Pm4n2RhSrE2u2lb
	2x6Mll8uJxiiMQxXEa3uroj6R2aSAzRqb+zWE+pXqCEFpdhMdGAXYrNG
X-Gm-Gg: AYBFou1cyoPAM+4KETBYcMISZQw0Lm11sJY7bSZpu0z2AvkZ0EzDh2AxG+9BtIwnE8Q
	ccIQ9p1PBUrBXMvHvr+Mu1AoxD41AG56VvMY8fg3OQMxAqih5jIU38R9kvoARPE1/2RFOHGXHBN
	bS/2jFSpidQkEPn19nYmgP5wEC11mGzhZH3YfrFsQoC/2f22BLUl5Kug3BIY7gOZQw7OaBDPhDi
	xbgF+If3xdKjsPFm2PuAeNR+cFJT81LlerotXmML2dfVy1M2GRHhDNGz7Xni2p3tjU2T85GWKcY
	RoUPVckRgqgqR/l6YuLLTR61akJiDFHAn/iCgGSKtMynscdH+Ybldl/mplH9ByYxoXQrehEdiqt
	wO7A7Wz1RaWVWChJmTwqWkrryZbpQcK6BeumooClU/f460BhR7Rql9gg66UM5MQh0BFgyNhWJCN
	4bzSUEEtkVe8t0SlK9NbGIDSQ6cRUyjnoBAZ7iQtYaC26Pp5KJ8/w35r3HB+3sDHiAylJkCIrFS
	tFlp9CzThpUu9MDCuUoJ1Zmg6V0
X-Received: by 2002:a05:6a20:a120:b0:3d3:ae1f:d7f8 with SMTP id adf61e73a8af0-3e16bf77bd0mr11175399637.24.1791904786043;
        Tue, 13 Oct 2026 08:19:46 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:44 -0700 (PDT)
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
Subject: [PATCH v2 18/35] clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:17 +0900
Message-ID: <20261013151734.3177690-19-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081953_689941_A948D4F2 
X-CRM114-Status: GOOD (  16.27  )
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

The MT6735 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
- Diff changed by 935ad6242c47
  ("clk: mediatek: mt6735: Unregister PLLs on probe failure")
---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 51 +++-----------------
 1 file changed, 7 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index b6eb6a581c31..94cb0bee8bb4 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -77,57 +77,20 @@ static const struct mtk_pll_data apmixedsys_plls[] = {
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
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Failed to register clock provider: %d\n", ret);
-		mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
-					clk_data);
-	}
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
2.56.0


