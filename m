Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE33C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hy3U0555sDJ6VNyHLjuVcEq+rtXFfUz3f5cVCQf0hWs=; b=X7SuMsB40GDIhiImoxJWsHluF8
	fJtaa4yRLtDTaJ4QN02log+/5wRXXHUYBjudP+ITYzPh55xFMKomXBS2kMkA4XTUtmhbAl03jR2mX
	aZMiMZt+tfMdjXhFAyvB3I80yBscA1A0HSbk24PzlNTzcEJSJY5uPcu0AxRO2GlZCA8v3/ZxtVzUb
	Rl28TMRq9J6SjRaWaQH4aXiJ3M0xs+0SAZWSGck7MkB2w11fctd0W5j/wXOy16xMk2rxx21kmwseB
	7eNdFFldY7KkgkKxDv+/bKFYWCA2I8SacpwFx8+JTpflVUHIeMfKsmZAER4nBmPLaW0B5XlMUdaXF
	DU3GMGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVq-0000000HMGx-0dAk;
	Mon, 03 Aug 2026 14:19:30 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVm-0000000HMA6-1d7F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:28 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3190157a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766766; x=1786371566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy3U0555sDJ6VNyHLjuVcEq+rtXFfUz3f5cVCQf0hWs=;
        b=OrfY+RIDKCxAU0eXI05B25eNx3b7CgLxXf7sK+OFLWCYgZm6XGDYorR6FaBzgWrp0k
         XMRhvD9k2Dltj8U3IL4LCoyAUZO/1UHfF/x1CHDu2SiI7Rdt3MdYLZgDTqMy7zktL+bx
         OEFSD5ssBwtTH67i7byYBA59eM4foz6m6xn2GZnjWRPCE3sTwUAf4xLL0T3dASAJzMJ7
         w7nfHVTOCJ8xQLwiMqO9Ppcr2LEG6A6izWt8fXGyno3mgBTUKMqd2B/JlIu7iBk6jBNY
         +ggtYgBgnEt9qQMkiBtNnTrVHKBhkmBHfKizc7EyxX+oG3ZNg1HzSse7GZff/H/0FMKB
         2nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766766; x=1786371566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hy3U0555sDJ6VNyHLjuVcEq+rtXFfUz3f5cVCQf0hWs=;
        b=iUxueJZZHSO2AtfR/BstZshNmKLUzEMIwNcMpQAB2qo1qvOYo9xgMapZpQoBxcU3gV
         BP3a7afGDbdzV3BgdpCK6E/jL6mDY0ipdDM3GLHcK0zRiwLxDGQaqRWDap4ZFZJmutzB
         du1hH+DHmyPCaBPWXbtpZhygmeCjckff/NNc8JaQEuLJ2SGTI52jxZsszcnQhv+iUqPl
         d21fLb/CrVwg4rxCZXJgp6Dkbv0x+6vyBM28VKnqp71TqyNu4/y9qZEYXf958qzEkeTb
         DYIDdue5A4gwo9RBLqZ7h5zUwOKHlT0uq+wiUYo4lWEy3fjG80tNPSjegFICbegZ4pdm
         mhwQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2JNihwx1vnigUfU/k7kMUDHpGdj4vSS/ZrZSTuUQ6mkXnDBkPL5pGOXC5YuMzNn1DhskX7HkuBxYGPBLOCwsT@lists.infradead.org
X-Gm-Message-State: AOJu0YydB3AlC8XLbl0c8otNZmUzHmMgPRmI52aBzT/qsZphsfQY0TL7
	xxtCGIYxpu1neXyqzjHgheJ0VzwbeSUtdxW93VpedHPZy3Zn8NzKoWZW
X-Gm-Gg: AR+sD12vU2KfiYZuLH10IP1CQoUuClpeMXEGHZPbKNuB1lt8GXLAUBh9f6sWtaDnNBj
	VlA/o5PC1ewMN/rgJb4v9btwtjs9rTXuKGqMPQc69sZdL2Vecx+jKs8PrOiSkhrJqs1lOEPal+D
	yXNJKJ9Lb2hmd05cqvGEotE2HkR9gqZrUrYX2gH+wdINrBCA1tZdq/CMXyRv/hzTV9TPN2cCthJ
	t8w1V/89ltq7h0aX/wTJUP3I45t3BaaWrDyCiJQdA7z7VRj4I62Ln/AmclCeEfJmFKaElaiWs9r
	LoSCA8P3HWA2d6FmxnvWgWO7nKF75/F9rFjObxPD8UcPQhv6fdzPUcOekBGNpZ61TJu+kjV3y0z
	AROsDnSAYsntqtOkFlKloUnUq3nJIFGboYsWMpmXRiSsKaqWpx38E7uPXu2TLAIFsn6AYmVM73M
	X06QrdWcRtY/OQIghIM3H03+nTGuzF7zaW/wyeM2zKjHhdY0S8oq/M0/wTvvdHFVeB1r1xcpSEj
	lVI/QbWNOFRVzBvp1AbmA==
X-Received: by 2002:a17:90b:4b41:b0:38d:e658:595a with SMTP id 98e67ed59e1d1-38fbc409a24mr9807228a91.2.1785766765595;
        Mon, 03 Aug 2026 07:19:25 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:25 -0700 (PDT)
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
Subject: [PATCH 26/32] clk: mediatek: mt8183: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:53 +0900
Message-ID: <20260803141659.559129-27-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071926_531397_59FF1CB2 
X-CRM114-Status: GOOD (  16.85  )
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

The MT8183 clock drivers can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.
For the apmixedsys driver, add a remove callback to properly support
module unloading.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
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
2.55.0


