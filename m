Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A93CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auCf8eCSpvAiDE8LzEvBEdtxk+NZAa2oXMsy16G7EVc=; b=28F+AqIfQWjqxPHyB80SCQH1Fs
	jnOEC7601lbABcOISB5Hot64AVoTktllKR/VeZ83gePwvfeijYDKC6sh6SfgfAQ7bknz9DKAy8AFV
	8QAwreKIHE5+4VahDQ/wWGj0Xy5x5Om1O4QLqBrg38T3n5GMV2w9+mw0PX4oh0EWc+ulmdQHo+M9/
	u0XmRd8+Zw8u3ZRESZ/z+JDhRVPhHx0/ckiCPvxmY8nQK2JcSooZwq51NF7tPP2snTLY3eNm5OgXf
	kRKGd9d6lWmAKuVQlqffmqY3tML7fX2WHf/Hfoj9+yV74UwzJhhefO7hg7GhHV//To8ZtXMWZk1YA
	sgjHfwkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJb-0000000DIdA-0iiG;
	Tue, 13 Oct 2026 15:21:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIz-0000000DI5W-0BiC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 15:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=auCf8eCSpvAiDE8LzEvBEdtxk+NZAa2oXMsy16G7EVc=; b=SmSDxK4RsTis7E+HSMuEZ/hV88
	u7LSUphd4rv/waB1f0yInNNDrJQdPHam5GHvClfeOjOcpUIC5Ij7yH4qbteQw5JFz8agPXVml70V2
	+0UkjXlcpUyFiBWX0ajnkLyYkkIzYZ2xRZXn0ttGLFiStO2rYD6FceNVdbo9SUNb4lHvWAs1OpSa6
	9AsLx67wU7sMmHH6F7nUDGJk7aYRqA5z1h88qc2Nzw7fjsNLv7QYqOvr0KYL9ZmLCV/SqbpqZAYPj
	tk7RlKHui9Liox64MxqF93Ktr6lfP7zJ/Dk1E2OOfLgkw26kyaFOB08oNoxmiA868RH6Xr56xe1BT
	2cyiNinA==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGeIv-0000000Fhev-3wYX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:39 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1052187a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904836; x=1792509636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auCf8eCSpvAiDE8LzEvBEdtxk+NZAa2oXMsy16G7EVc=;
        b=VFGRAZFRplismkFkBqaTeC6al84sugMvyaY+6n9epK5acsjR0sgpFGnJaYg3Ox0mXy
         WCZLEHaR4tWX3EcATJ0mKZaQ6MTxeqM79oIvOsez6IPCg70Zwddr15rH2PJ2nJ20h3Ay
         ck1owWj+ohPtI6oVercrxlFxLOi+muiFSnOlWw85UC3tmSwhMIps8apPeSP3GmtnnKvK
         x1elFnZ4LSV7eNQl9Gg2nJ7GM8uSaA1t72xU5Wve+yYDRxsFGvgFCxbb4dvhxiwT3UjL
         32jHaOVMMg2T4h427er9mZZbRwESbi+L77KRtasNt4gsRhQyfGv67qPh8T9rDwHRfhNg
         PEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904836; x=1792509636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=auCf8eCSpvAiDE8LzEvBEdtxk+NZAa2oXMsy16G7EVc=;
        b=VTwjOmqzbo/61Oyt5k+hfHM5i6BpUuGpNF+os32lTQbMKZqlPylgu/x++yMAlLDZQ7
         5a2AHVivHczVzkwjRn3cmhZBksRkMRzgT3gxqsOsO/AGg0+7ZnL3rxIMMg5dWuTMaWKj
         /fNcMcr8JhE3UzkAaXSb3ByfhHia/IL/YhvMXU4lFK5okguaRznD+l8s8YZg4/9x88iy
         Ra1bOTxosyiXnmNAWYLTdnqJdQk2N1gPNv28b5M8ULhrN77tHr3keUfTBLtb6PGUDLlF
         rdT7OFCgAzj8JQ2dCBkm4j/vW1LBIu6IJ9MLK8l3T+CbMRY9HYYHbhX0euXBy6MfYfUB
         GiMw==
X-Forwarded-Encrypted: i=1; AKwUvBz6NGcOFo5Y2TFxFoYGrat5PU1NAhVHbouUR5puewqXPUFe9bNbdd40M5MUjULOxYXv+XHfEsVEXQFRatv1jLCW@lists.infradead.org
X-Gm-Message-State: AFq9FYIlXtCxkmZTqWpQM6WrkdIaCCNPuyC/Ba4pBwXb9Z/YMFI8IB2t
	SihUdEVkLXGHRiEHM8B//Fhg/w9HfiU9N67jxljaaH5VroPqJYWJxlgj
X-Gm-Gg: AYBFou0KuFPIzLFGonh8wguf+i09URUUvQClp6w5FG6cqkUFSXP9E2/4NS8J05kbuz9
	04XJ6ZERwdOfLc3p9CvJDBu4ob+TdbtfDxkx74idc7p126iaUOn7A8sqz35wWlhu4gYXWEBaSeX
	/N6ZyRp9coWk3WlS2nZJlNkZtyYrmFDLVQjGSEgjr3cwz11KPy9D1PcaOYtrfsL9pBOlgH4ujPk
	zhUAQ2fipp26VCzfciTEnrd8lLAIW3K3jJbZMhwy/I3JQbTpbt/fDluaU5/Y9kBzds3diJ1Gynp
	TgCVJgdEitKXGKehtB3BxfCQ94SFRKB0QrGOwCV9jQPZjmLBvMzfgqtixh67MMlVaEV2nGUufSD
	S+Qw4Y+7u41RDEZUKEcwy1oXC/OXBO07sbTG3NAPzaCtmI9oJrYx9bN3vVgA0jun74t+0WJ6sUm
	0Z73IJHKH7PqC0A1HEu0tLk0wvMmTX47x2nO//AV+F/D56HkVkYdoxP9SFe/nCbc+l1Mha/+GFU
	9Be/pO5wZAn8oqURn4Cnenox0U2
X-Received: by 2002:a17:90b:2d86:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3ab3a60eb9bmr10510529a91.19.1791904835959;
        Tue, 13 Oct 2026 08:20:35 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:35 -0700 (PDT)
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
Subject: [PATCH v2 27/35] clk: mediatek: mt8167-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:26 +0900
Message-ID: <20261013151734.3177690-28-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_162038_206326_446B5717 
X-CRM114-Status: GOOD (  18.95  )
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

The MT8167 apmixedsys driver used a custom probe to register PLLs and
divider clocks but had no remove callback. With PLL registration now
supported alongside the existing divider-clock support,
the driver can use mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch to module_platform_driver() to support module unloading and
ensure that registered clocks are unregistered on removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
- Add missing `.data = &apmixed_desc` entry to the OF match table.
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 58 ++++++--------------
 1 file changed, 16 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index fb6c21bbeef8..aba33e5aafe6 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -89,59 +89,33 @@ static const struct mtk_clk_divider adj_divs[] = {
 		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO),
 };
 
-static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
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
-	clk_data = mtk_devm_alloc_clk_data(dev, MT8167_CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (ret)
-		return ret;
-
-	ret = mtk_clk_register_dividers(dev, adj_divs, ARRAY_SIZE(adj_divs), base,
-					&mt8167_apmixed_clk_lock, clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_dividers;
-
-	return 0;
-
-unregister_dividers:
-	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.divider_clks = adj_divs,
+	.num_divider_clks = ARRAY_SIZE(adj_divs),
+	.clk_lock = &mt8167_apmixed_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
-	{ .compatible = "mediatek,mt8167-apmixedsys" },
-	{ /* sentinel */ }
+	{
+		.compatible = "mediatek,mt8167-apmixedsys",
+		.data = &apmixed_desc,
+	}, {
+		/* sentinel */
+	},
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_apmixed);
 
 static struct platform_driver clk_mt8167_apmixed_drv = {
-	.probe = clk_mt8167_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8167-apmixed",
 		.of_match_table = of_match_clk_mt8167_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt8167_apmixed_drv)
+module_platform_driver(clk_mt8167_apmixed_drv)
 
 MODULE_DESCRIPTION("MediaTek MT8167 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


