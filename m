Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC7FCC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhDzmwJCJ52+w45ZL03KR603UOMuV25rBPU/GIg++dM=; b=BFx1cT3Ra6tCX/uWbO6branNYA
	Q/qoaNYH5c5mx9ua+h0riFNoGn5DDG2svYAlpojIGLT3lDniMFex0sZ+x4qisGLL3xAb0lPCR+VBU
	pqItLLeCvT9YFZhRDjy1fuS2o0Br83yMgwW0jtFaZw0Ehh3LE19M2cgshADHCpzNOx+mPcIEC9KJg
	y2BLWMDzbMzElrcdFEd9x4pLhp1ZzujE/pwg7IzD44WI1um4crGJlVEkUB7bb409yc4nOmO46hfR7
	mPtw1mK47p/x6U05AmZdvmYJZOmN9mvOIYzkD5UAgq4t88p7xuruYCvqv8YbHKxv19sujn1t8QluT
	mb+0SIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeKe-0000000DJMR-2VAJ;
	Tue, 13 Oct 2026 15:22:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJi-0000000DIk4-21fw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 15:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RhDzmwJCJ52+w45ZL03KR603UOMuV25rBPU/GIg++dM=; b=bWeiroJWGY0e/bmgXpoEQoC0y1
	UUe5L3WzB8YeasFxvtd2QcNDmCGDaC724IDKIVdKK3y7svj1Xf+xkFc/Atx6tgpDm9CPNlA/yGVnY
	fjIqYFVEnqmibazk9CNz0CS8jskCDXrYjYh0CB+144weU8TKa4FsVFyWUCTbVER4Y8oD6oCj4kCGb
	iwKlF2vwupPUIEyJRjJAJRj3CYBFwoAFMoIly2dTIRUMGS7EHfcpQvPviGnpaiDempA5iWsXpzetT
	V+FiGuEtITIr+Z1LRrKtnAAIJ3TVzKf7sVF0QqQrH4HBhyhlmbR2Qt1PsBjqNoFK6L8DVK5W/0tAc
	4LHMiG8w==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGeJf-0000000Fho1-1yjs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:21:25 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so1273480a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904881; x=1792509681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhDzmwJCJ52+w45ZL03KR603UOMuV25rBPU/GIg++dM=;
        b=Jwv0F9wUgX5Qu2GQL+40Kv8L4Y5NwlWpY68saNciZhu2lkTgdbAZ17e1mB6gq3cV0a
         il+DYEGdIbEaqTgoZmWE3M6sOs7Wt+p45WqsZMjClWA3B25GjwMQRq7MKmJqstALpVk8
         j1MoDGhR1B0tIiWtGbvbvGZ0hSaGFJXq3IrV01aOjEpi8yCfNQON4SOkPOrCh/RSLdjY
         mrjqdqvchw3MhilRcZQ4HzVTB89GuuL5fRXHAg6LIUVquoHcDxMFYAzABaOEqKTVAMKQ
         i3btVuKdS7MEkrqhp0Y2pMiTvGETUd2GrJv49Ksro3wJ+MOvfgLXmN3tJNd0VoEzulZo
         kJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904881; x=1792509681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhDzmwJCJ52+w45ZL03KR603UOMuV25rBPU/GIg++dM=;
        b=hpBFaYAv8oEFM9bTnRDTs9y1TE3RgAS1Hl4g4z7JzOcAa4QiGl+Whjp5hwo7lOCP9M
         39G+2yGs/K1eoaoazkde5gT/vZNvUBcued/5ziEIYCoJRm8CFauL2d6tulcjhUE5Pafw
         YW5YAbsOoFQ1g31gFuPNYKwtewlKxSVmCVdG77x1eUXCz05zAdiiXIaBqx8RbFYP/pyL
         PooGQLE8ylaVuLPg7MQ0Y+Nb+lsWmpoYC4N2eGE/yLvtPx3SZNnfe6PMyMy3l1Nn/i0q
         jfwGCZ85Ra7chf5BXTq7uO/M1qgGFEQUBr6Pb90wBayQ4Vz6Q2oXK9JyOK9NFWr3Ml1L
         mNJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEYEazryuvkozP8Gugc2kwexphZ57GiXJOCGS/LyuhyQtmd15/JwpkLUWJAVbC3TvHEYtqL6zmZvwqg9CWakzP@lists.infradead.org
X-Gm-Message-State: AFq9FYLYNa6XxP+bWK2JzU487k8BjCqMwB4xW0XCtZBvgBtBC86TPfLe
	3xaDvytt85Ndv9tDWQMqw8dZUC39WW4vM/oi9RrqGS619IkhxN5eaJFCw0O2lA==
X-Gm-Gg: AYBFou3HweRdYTcUchA/SPANv0gXtZHsrQnvmqtrMN7TXA0434Ahb07Ns5i7HQWmhlN
	k0J7UtEowy1ZH2uit1r6lBi1kHfPk1UBFmtyfBhKjcCaDoTxJwtSEGs/PMPD+3NviHxgUinrjfP
	nVDVwb4TQA8vS7+BDFcuY42H4RsWGW/18FQMArJO6szky7xt3rJVWpb9enGb/1Y7UimnC6Y5IdT
	bKf6xh8eKr2Lo74nPl+mX3ANSayOome54yvo/iN3HMMyvdmbFfo2XyMnopkyqkCfE/afe2Ha6We
	fycI8C8ssL6iYEmS5maPSUmV9YwAsQXhPK9ASyB6OXeXiIx1euH1pLo0/SCpYb5JYE5QUN61zQu
	+pKp2XvjKhvCqMDqPtlT6Fjldzccc74G2RCe761l4Lj6salA+9V2pu1tHNShuJPiUmezjHv+02y
	jz7NSWqxD2qrnRyoM/Y1JVzRkA7vNO9DKWP9DZG6GRUp9GFKedzuHqElru1vnaGxllMeOzkO/m7
	JSupTTDqiBGTLqzOx0TqBCnDx6+
X-Received: by 2002:a17:90b:2687:b0:3ab:22fe:b13a with SMTP id 98e67ed59e1d1-3ab3a79a2efmr11338174a91.40.1791904880877;
        Tue, 13 Oct 2026 08:21:20 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:21:20 -0700 (PDT)
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
Subject: [PATCH v2 35/35] clk: mediatek: mt8516-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:34 +0900
Message-ID: <20261013151734.3177690-36-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_162123_733980_A2C931A0 
X-CRM114-Status: GOOD (  17.96  )
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

The MT8516 apmixedsys driver used a custom probe to register PLLs but
had no remove callback. With PLL registration and unregistration
handled by the common helpers,
the driver can use mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch to module_platform_driver() to support module unloading and
ensure that registered clocks are unregistered on removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c | 42 ++++----------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8516-apmixedsys.c b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
index 2a6206cae2f0..2fb09e7acde7 100644
--- a/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
@@ -71,52 +71,26 @@ static const struct mtk_pll_data plls[] = {
 	    31, 0x01A0, 1, 0x01B4, 0x01A4, 0),
 };
 
-static int clk_mt8516_apmixed_probe(struct platform_device *pdev)
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
-	clk_data = mtk_devm_alloc_clk_data(dev, CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (ret)
-		return ret;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	return 0;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
 
 static const struct of_device_id of_match_clk_mt8516_apmixed[] = {
-	{ .compatible = "mediatek,mt8516-apmixedsys" },
+	{ .compatible = "mediatek,mt8516-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8516_apmixed);
 
 static struct platform_driver clk_mt8516_apmixed_drv = {
-	.probe = clk_mt8516_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8516-apmixed",
 		.of_match_table = of_match_clk_mt8516_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt8516_apmixed_drv)
+module_platform_driver(clk_mt8516_apmixed_drv)
 
 MODULE_DESCRIPTION("MediaTek MT8516 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


