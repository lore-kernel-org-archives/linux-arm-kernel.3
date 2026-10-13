Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB8DCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feoaN6NpRHCSeWvh9mDowzQEdrnMihG5ZQRjKnCemwM=; b=d/Fr4a1hw9UVH1Fv62GlzCoEsu
	v/zGbRIPF/QLTvOzqpZnG+pKryJ3Iq7MmwTgLoxQsmr4kAQF2g53a5zhQchA781eOte/SO/79EqcH
	Wc65x1uokmozHNRGj4kW7vV8RXimtzzudAj4/Y4A0ciUAInjq7U3Zm1t+75loenf54JXTNb9hX199
	Hv50qgl7jP+bwSxF3wFI+fPUlhmrnF2MaA7j+GZo8FtJB8SqwtO0pKH6C26HfcTXiV65hqP4nT+pW
	4vRxDE31EHLkFoUlUADILQwvH8Nlo2RiW9D5banITb6gFe+5oLbagcqy20bMk+2oVu1lj/Tpy8/kG
	lEH9m3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIR-0000000DHdt-3jAE;
	Tue, 13 Oct 2026 15:20:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIH-0000000DHRV-2yeF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 15:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=feoaN6NpRHCSeWvh9mDowzQEdrnMihG5ZQRjKnCemwM=; b=LeKHgSuYg2kBNLaUW7KiUQy9tY
	OAbo8TGhi3dO2GoMD8eQfbGQ2UTdja47bYTFUiGAc5jq9Q2pROc2ZTREUlgo/fEX9DcHbFfwl852W
	iYHerHE4WYh1SjU4SMjK1LIUobUuuoNeSsLXGEbDit8JGl7j/m5xtPR0nx/kiyxgjwFIByHCo05QY
	RKfFHzEK5Q6XkFxaC/aYhI3G62Zd+N/aR+dSersQ4r/PM3csTjOkPECIJfxGwsR+a0967Uh+aq6lI
	Hfo5M8Z/Vd6VQhno0KvLT29lNdN6GIkSad364TrCXYmCzbCFtskr5vCwL5NKrh5gJ5DJwuy1JYoH7
	16PJuIXw==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGeID-0000000FhXR-3TTt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:56 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-892734ce7e6so1178469b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904791; x=1792509591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feoaN6NpRHCSeWvh9mDowzQEdrnMihG5ZQRjKnCemwM=;
        b=hrNuKyz9DJK4POQfKheDCt3iUZdXcg9+NxaIfhKgzaYEG/WKxVj1d4df2E17LV9G+f
         4ei/GiPQ2lW9jPkomVdOR7BKSpeLVSIc9MyAlzKhUBSrPXkN9b2HrRP1ycAldAhz+a7Y
         u1FhAZkx3Kut2J0qvMGthivSLMD3b8F0lzG4STJU0NAzfxsNYO1y/g1WgfYpAGPgUmkE
         m4out74NkE9aQUfDD4jk4mC06L2qVuuZHpBRKkGcNafDCPfYEyFF7lg+6HXdMTnlgsRf
         t4kEh+hyyf/nuePxo1PvFW4/aX1cbt1CBz4LLzTCUoHgDF5zU0PMR97on75e/o2VFMNm
         /aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904791; x=1792509591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=feoaN6NpRHCSeWvh9mDowzQEdrnMihG5ZQRjKnCemwM=;
        b=aheioJ4UG+JDFpTCfTubIyXz1EfAFXwAXOPjBxQ1N6JkkbqclVeBYWojNscx8R8IVb
         rVhhqH9CXf/9AWKUL1HuLxkyo+/coOsUbQ8nKBDQR279tzJ7RKgg2A8Qn5rWHxSmvnZI
         ASlDDc9bYdtI6uxZqd328D32ImYyUgij6+A0dGzWquw7moa8vO9Acd+W9eAVMM7yAGeB
         DlAbypVDlc90IlFrLNNakE+wxajIAn5p9B43kRQEogB/xkShupdrSRMOA6SS2qzK3oW+
         qcVmjOHwO9FXcDXrcmXOTk9cRs8LER4h831Ar8qrH2Rv2cS7d85o8xoHFXg3HqyiOXQp
         24XA==
X-Forwarded-Encrypted: i=1; AKwUvBxDsrTRb7SnImWKDnM5UCZk8v7slcHf0HGN5co48TDxIqdGSmniTD70S3tuMeq9K00xSOCLokLk3y+D4q83hRiz@lists.infradead.org
X-Gm-Message-State: AFq9FYL2XZQ2UlPQfPPHXm1hfRSjdy8i1k9trXD5S67Fdh/D+gQn2fdX
	RazyVtjjZXsm7l3bL64/9PHv78ALHRgxsoNRGhlNewAYJZuWMHF04FDu
X-Gm-Gg: AYBFou0+8tzLZos088b4TdWbqkOvqoM7XI80CaRtg1Mz0iXUQAZaHnh8O+31f49G5w0
	RbSZGDaqV8BZX1Eseu+EudL8YLaKSgr/dAvCZawAcr92Hc2lf2m/YSvTmXFrzaSisIP1cBLyO3t
	uTON3Ure1fwOtaYfJ3iBAhunIOZyihn0t2SulczlD0JQ7OBmtK/lfsQckoq2YQhzDOUFWvZsNl6
	/eVEEDWcCqFpaur6rH1Eq9VZHWqIXFd27JduVrnrJtTQJNuuIanCMI3uazB7roUlz9dnxvaS4X6
	us99JkseBWHWZac1HI0pM05wzr/XL+cSqL500+UKfCyDKCCagVk+wh7G3gi4f7j1ocqAin4G64Q
	j75o6G+eXwZa+YB6xZRXTMQECys0Y2MwttRjtAv1J/XexfPyxGvpOqsOp3kqmP07pRNcTfVgujO
	Obk8CdLkcp7kNqwScqdpoh7Hc/QdmLaaXXY9gxer8qvyp52gifGwYF0bm3iZ13BS/sAOcA8bhCM
	/UylGZbws7sfRhWZwcf/efU5juJuAQQwAp9H2Y=
X-Received: by 2002:a05:6a20:6a0b:b0:3e1:348d:b477 with SMTP id adf61e73a8af0-3e16bf7e317mr11955865637.20.1791904791499;
        Tue, 13 Oct 2026 08:19:51 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:50 -0700 (PDT)
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
Subject: [PATCH v2 19/35] clk: mediatek: mt6779: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:18 +0900
Message-ID: <20261013151734.3177690-20-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_161953_947117_A6390080 
X-CRM114-Status: GOOD (  18.96  )
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

The MT6779 apmixedsys driver used a custom probe to register PLLs.
With PLL registration now supported by the common helpers, it can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Consolidate the apmixedsys, topckgen, and infracfg match entries under
a single platform driver, using struct mtk_clk_desc for the clock
configurations. Replace the custom arch_initcall() registration with
module_platform_driver().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt6779.c | 124 ++++++------------------------
 1 file changed, 22 insertions(+), 102 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 4b9dcb910b03..a806789ae27c 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -808,7 +808,7 @@ static const char * const i2s5_m_ck_parents[] = {
 	"aud_2_sel"
 };
 
-static const struct mtk_composite top_aud_muxes[] = {
+static const struct mtk_composite top_aud_muxes_divs[] = {
 	MUX(CLK_TOP_I2S0_M_SEL, "i2s0_m_ck_sel", i2s0_m_ck_parents,
 	    0x320, 8, 1),
 	MUX(CLK_TOP_I2S1_M_SEL, "i2s1_m_ck_sel", i2s1_m_ck_parents,
@@ -821,9 +821,7 @@ static const struct mtk_composite top_aud_muxes[] = {
 	    0x320, 12, 1),
 	MUX(CLK_TOP_I2S5_M_SEL, "i2s5_m_ck_sel", i2s5_m_ck_parents,
 	    0x328, 20, 1),
-};
 
-static struct mtk_composite top_aud_divs[] = {
 	DIV_GATE(CLK_TOP_APLL12_DIV0, "apll12_div0", "i2s0_m_ck_sel",
 		 0x320, 2, 0x324, 8, 0),
 	DIV_GATE(CLK_TOP_APLL12_DIV1, "apll12_div1", "i2s1_m_ck_sel",
@@ -1211,125 +1209,47 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0, 32, 8, 0x02D4, 1, 0, 0x14, 1, 0x02D8, 0, 0x02D4),
 };
 
-static int clk_mt6779_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-			       ARRAY_SIZE(apmixed_clks), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
-
-static int clk_mt6779_top_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-				    clk_data);
-
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-
-	mtk_clk_register_muxes(&pdev->dev, top_muxes,
-			       ARRAY_SIZE(top_muxes), node,
-			       &mt6779_clk_lock, clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_aud_muxes,
-				    ARRAY_SIZE(top_aud_muxes), base,
-				    &mt6779_clk_lock, clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_aud_divs,
-				    ARRAY_SIZE(top_aud_divs), base,
-				    &mt6779_clk_lock, clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
-
-static const struct of_device_id of_match_clk_mt6779[] = {
-	{
-		.compatible = "mediatek,mt6779-apmixed",
-		.data = clk_mt6779_apmixed_probe,
-	}, {
-		.compatible = "mediatek,mt6779-topckgen",
-		.data = clk_mt6779_top_probe,
-	}, {
-		/* sentinel */
-	}
+static const struct mtk_clk_desc apmixed_desc = {
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
 };
 
-static int clk_mt6779_probe(struct platform_device *pdev)
-{
-	int (*clk_probe)(struct platform_device *pdev);
-	int r;
-
-	clk_probe = of_device_get_match_data(&pdev->dev);
-	if (!clk_probe)
-		return -EINVAL;
-
-	r = clk_probe(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
+static const struct mtk_clk_desc topck_desc = {
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.mux_clks = top_muxes,
+	.num_mux_clks = ARRAY_SIZE(top_muxes),
+	.composite_clks = top_aud_muxes_divs,
+	.num_composite_clks = ARRAY_SIZE(top_aud_muxes_divs),
+	.clk_lock = &mt6779_clk_lock,
+};
 
 static const struct mtk_clk_desc infra_desc = {
 	.clks = infra_clks,
 	.num_clks = ARRAY_SIZE(infra_clks),
 };
 
-static const struct of_device_id of_match_clk_mt6779_infra[] = {
+static const struct of_device_id of_match_clk_mt6779[] = {
+	{ .compatible = "mediatek,mt6779-apmixed", .data = &apmixed_desc },
+	{ .compatible = "mediatek,mt6779-topckgen", .data = &topck_desc },
 	{ .compatible = "mediatek,mt6779-infracfg_ao", .data = &infra_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6779);
 
-static struct platform_driver clk_mt6779_infra_drv  = {
+static struct platform_driver clk_mt6779_drv  = {
 	.probe = mtk_clk_simple_probe,
 	.remove = mtk_clk_simple_remove,
-	.driver = {
-		.name = "clk-mt6779-infra",
-		.of_match_table = of_match_clk_mt6779_infra,
-	},
-};
-
-static struct platform_driver clk_mt6779_drv = {
-	.probe = clk_mt6779_probe,
 	.driver = {
 		.name = "clk-mt6779",
 		.of_match_table = of_match_clk_mt6779,
 	},
 };
-
-static int __init clk_mt6779_init(void)
-{
-	int ret = platform_driver_register(&clk_mt6779_drv);
-
-	if (ret)
-		return ret;
-	return platform_driver_register(&clk_mt6779_infra_drv);
-}
-
-arch_initcall(clk_mt6779_init);
+module_platform_driver(clk_mt6779_drv);
 
 MODULE_DESCRIPTION("MediaTek MT6779 main clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


