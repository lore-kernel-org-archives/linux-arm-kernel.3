Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69489CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdtbiphqaOoVk0Woyal1YTwVA1Q4Y7nI29mQ+zlJgS8=; b=HxNRJollWTRKQXW8wkqMcXUxNr
	7aYpDAZvzUikHhltfNVGXysb64UhD0QezcMUN2Dg0AbMz48Fp1LT8kVH1fUsx45xX7v0vPcYzmzd/
	sIE4RAEtWU/duO2F4vpEQdywD/nlDMbyj07VYshuzbPoOlfaizCrlM+zHEWxjtDEVR0eeO8eN6uz2
	Rcn0+bD+cx0YqPIXlByZ82uhvKhtrsV4ifd/RYebb7uh5Z4wKsUfUj63ig5PEUAh/pA5mFNaBVD+Q
	paHPLt00VSSuHKv3FuOmDUxks9vQuTo9WoHi+LgzEuryRfKQOpDr8mpSvW21ZOEShIVXJrtlUx6Js
	4J/DVKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeKL-0000000DJ5h-0CEO;
	Tue, 13 Oct 2026 15:22:05 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJ7-0000000DICR-1zCz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:51 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso1069726a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904848; x=1792509648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdtbiphqaOoVk0Woyal1YTwVA1Q4Y7nI29mQ+zlJgS8=;
        b=deon4W/b2XMpU33M0N9qklVH2nEoDVoj5zImR+aCALUiLIC8svW/z/IZ3KYD+XGu8U
         ++xaLLyjapn9WQl4n8o5WUWANh55WAT/40fy3PNYDWn3iZDWPP47Dof2njy3FptMNoXO
         7WldbjrUAQu4PJb9TnhHcRFlNE2dT/CHk/1kJaBta6cPyDbr5MBuJk7YBBeRmNNXfsrl
         kCXZEaRD3bSNUxbBUDIS8NZOgPJGGqF5HqW9QSrlbpmnaRt0Pj3p8IDgCBeaFSJvND2l
         /7ufCpoK6KmE3db9+IQAC5AmymwzRabZwNQtjJOFvfpI3rPqTDsZz1ek8Tu+Y1PuOlZg
         vnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904848; x=1792509648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdtbiphqaOoVk0Woyal1YTwVA1Q4Y7nI29mQ+zlJgS8=;
        b=zArpWUIudkIg6CJDdS6hO9x9ZgJwsaBPj/1XxdVtOecLGnDvvrx+TG3RP/uKAOm4fk
         Vr8uUQNVX2BK77TGxGenJzgGxiPoLPqAkwCrfO9lMFu+vu7o+LyI13yRYgd3pdjw1sIe
         Q1POJcr4OEl6PtOcpYPsKKHyDl0ty3xzu0E7nFrgdFLtMv/oCaDYU/9fk8Gw1oErXkVi
         Av8EG6rlmSlLhWGFchHKcYDfxxhCH7LnLrgdXRsBsgUUvTTlMVf2H1WiqUuvG+W3QuvM
         P7AnYmA8qAc29vb2nZBsrYW6y6vgIzxOr7TW78S7FVnM65RI/vBvQ1vS9iuSGeAdFU7J
         8jyA==
X-Forwarded-Encrypted: i=1; AKwUvByCcq5IhjcND4qEOmM0tYNRMNR9tqBHmOdB/3fxm9xkofSgY1ukKkmhv2RkYXPdOD72KLaYPCsMZu+oRoY8kPKr@lists.infradead.org
X-Gm-Message-State: AFq9FYLI5g88T9hD/DR4vRffYNaIQBx7hR9u7LaHjDkAGgLdAoEE9TVp
	SMjgYTIpf97R3NQvbuscAKxgKbT1jy4tPSkA7EfYUa9dYGpK/kYmpA68
X-Gm-Gg: AYBFou3GZF9aqpf8dRC8oodWdOZLxGrKUyiQp3A7Hpx+TF9aYJNUt9ZaN4tkieM7ClU
	XYpeDkgoCH7MrLXjFjUil4Tvl280PZXBz5G5Z93QnqnWLPkJnAhp4i+32IL4Me2yGkJtnco/uPB
	D0DUQmkO/9qBxrkcv5dtm2t3aikrUJSR37egPLcx2ZaXQAF3DWhv9HPZdyYgLmkay65iv9vzbbC
	KY9bu6j42mLVA5Ue970nAqNhrG3YOxuE2Z6cEo4Y2YJe7HqXKzbm5a0hHtWlKjgDzXezCxrE3Mx
	DJSz4e+2QWmdQbkBySduHItlVC6kVpshT76Qo0hbr5mNEBenNbfvzmthyzGwS79sK5AkiYV3GR0
	/XneI0unFJ/vLiV5pU6Xjp9r00JE0iJRUbyAbyoHF9M4+WBmrXbusAL2nrztHNopYYLy8LnPRPG
	JzNmUS7pJ5H2RUk72Vb3jAeT54XtP43LrzjR8VwBVbm1MQx1fEyGULXEVAldUfZ9mF8qkPf7wyQ
	VKuo0OVxulpMiZumnNOuvFvm0J/
X-Received: by 2002:a05:6a20:eed0:20b0:3e1:7fd5:cba1 with SMTP id adf61e73a8af0-3e17fd5d0edmr5812678637.43.1791904848262;
        Tue, 13 Oct 2026 08:20:48 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:46 -0700 (PDT)
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
Subject: [PATCH v2 29/35] clk: mediatek: mt8183: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:28 +0900
Message-ID: <20261013151734.3177690-30-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082049_560300_4F001CB1 
X-CRM114-Status: GOOD (  17.57  )
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

The MT8183 apmixedsys driver used a custom probe to register PLLs and
gates but had no remove callback. The audiosys driver used custom
probe/remove callbacks to populate and depopulate child devices.

With PLL registration and child-device population supported by the
common helpers, both drivers can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch the apmixedsys driver to module_platform_driver() so its clocks
are properly unregistered on module removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c | 51 ++++----------------
 drivers/clk/mediatek/clk-mt8183-audio.c      | 26 ++--------
 2 files changed, 13 insertions(+), 64 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-apmixedsys.c b/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
index 6242d4f5376e..deb96537a3ab 100644
--- a/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
@@ -139,59 +139,28 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0, 32, 8, 0x02B4, 1, 0x02BC, 0x0014, 1, 0x02B8, 0, 0x02B4),
 };
 
-static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
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
-	ret = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-				     ARRAY_SIZE(apmixed_clks), clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	return 0;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+};
 
 static const struct of_device_id of_match_clk_mt8183_apmixed[] = {
-	{ .compatible = "mediatek,mt8183-apmixedsys" },
+	{ .compatible = "mediatek,mt8183-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_apmixed);
 
 static struct platform_driver clk_mt8183_apmixed_drv = {
-	.probe = clk_mt8183_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-apmixed",
 		.of_match_table = of_match_clk_mt8183_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt8183_apmixed_drv)
+module_platform_driver(clk_mt8183_apmixed_drv)
 
 MODULE_DESCRIPTION("MediaTek MT8183 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt8183-audio.c b/drivers/clk/mediatek/clk-mt8183-audio.c
index 011d329ad30e..0a53b0408dcc 100644
--- a/drivers/clk/mediatek/clk-mt8183-audio.c
+++ b/drivers/clk/mediatek/clk-mt8183-audio.c
@@ -70,29 +70,9 @@ static const struct mtk_gate audio_clks[] = {
 static const struct mtk_clk_desc audio_desc = {
 	.clks = audio_clks,
 	.num_clks = ARRAY_SIZE(audio_clks),
+	.populate_children = true,
 };
 
-static int clk_mt8183_audio_probe(struct platform_device *pdev)
-{
-	int r;
-
-	r = mtk_clk_simple_probe(pdev);
-	if (r)
-		return r;
-
-	r = devm_of_platform_populate(&pdev->dev);
-	if (r)
-		mtk_clk_simple_remove(pdev);
-
-	return r;
-}
-
-static void clk_mt8183_audio_remove(struct platform_device *pdev)
-{
-	of_platform_depopulate(&pdev->dev);
-	mtk_clk_simple_remove(pdev);
-}
-
 static const struct of_device_id of_match_clk_mt8183_audio[] = {
 	{ .compatible = "mediatek,mt8183-audiosys", .data = &audio_desc },
 	{ /* sentinel */ }
@@ -100,8 +80,8 @@ static const struct of_device_id of_match_clk_mt8183_audio[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_audio);
 
 static struct platform_driver clk_mt8183_audio_drv = {
-	.probe = clk_mt8183_audio_probe,
-	.remove = clk_mt8183_audio_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-audio",
 		.of_match_table = of_match_clk_mt8183_audio,
-- 
2.56.0


