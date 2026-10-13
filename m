Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90944CC6B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUsiNYuvTluJUsDcmK/H2FYsH7QlWV0QeAePaJSh4tU=; b=iDyKc84PADKn5WbSxDUg80Ezcx
	CMeKhGelGwKnJHn6jKuWf7asOrE0NHVErSeh8/ZMhqHDX6kO2k/iwpFnF+sxrGMi1bibrMzwvaIPX
	yFwyil2fV7+i2KxlImmg51whP7ZSMlmVwyIBSfi764n7zyD8lW64NfHxX31q/+CdBWNhPNJ+elGfn
	BHFRIbN4HMmTGlwYjP+8kBXHHYFmz2C123ulUCj1kl2f4T+P4J3+09e3dOxpVN2V6eUT9eq4gUSYY
	ZBBSrUR35xLXftoao7SP825Vlgp1GH9lKsXBGf+OMiQ76lD41sD0iwuQHAj0ezgKAMY5jIgxQNHlq
	Ehqn97Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeKU-0000000DJEd-3sjp;
	Tue, 13 Oct 2026 15:22:20 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJO-0000000DIPK-0ZOf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:21:09 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1616181a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904865; x=1792509665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUsiNYuvTluJUsDcmK/H2FYsH7QlWV0QeAePaJSh4tU=;
        b=FvGA+FD+UvAjnGnBPR6u5keP4MdKetIuvd4PpSqEYLdvqqMJQBFNjviJCIB0DCorLZ
         4ePVRHKxwtsmTAvxbF+hVFe3Z//B/lRs3p3JeLISBl6KgkEGbTlUqWUQg1/D7jbImVwq
         Ph5sY9A7yEeEQ0YPsXero2p1QFPG/0aXfx64NPghgg1xT9s1Yevt5nw8614pH2ZILNR/
         8yZCxo+qgzP0eRPq9zR66T94m7811lGF3BzHDNWb0mVfNE+rydj6iGGy6Sa58voMgANW
         4cb8YnLjP5L8nI8nJa3b2UtCNtOxqKoIeUEgWG0+zTwDdymqVZ4cRJoPHWaS/da1014G
         WqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904865; x=1792509665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rUsiNYuvTluJUsDcmK/H2FYsH7QlWV0QeAePaJSh4tU=;
        b=RHybbdDLhHhyR03UxPS64ZhJ1RQlEir5ovWfMOQsgY36dUuvjrhngaAQp1kcQLYj8o
         StU3/b9tq68BXox4YFGpSKtQPaUTwJjgsHsQA0rUawKwXB3MbkXssOjXa3iiD1GxV6DO
         3QZxkrLZGt7KC3dabts0ulCVG+M7odMYavhLzQpFAsA5RbATK3l91AvaVeHzqeXzOeye
         sruDtCLaj00W21n2Ap+y80X2nDM0/33baryGMyVIW5uIy79GMujvBgSLCIX7fhEb99t2
         utIbx615p1c4RLR/dETCR6cQSUsMtH/GdXsPOZWKe2ZaLdecNQy9gkagLAD5V8m5jxAI
         IeLA==
X-Forwarded-Encrypted: i=1; AKwUvByquqkQtBa8PyZZQd9bK1DykOdywyC8G1CnpSuhyreapt1lA7lMAtof+apaKzxo8nttgcklMFdn5OKDzpSI/9Cg@lists.infradead.org
X-Gm-Message-State: AFq9FYLVEDh+UdRYoS5Os/2NJMcf2ncRTahRhOfADzF9BLypJRN4TGJG
	k/GXJwhmNy0ahwY4O8kmYhAZhm+3aKG1r1kg7QYKOfSGRxA2dzYlTRXn
X-Gm-Gg: AYBFou0btQvl2S8+0ebjVT1zbQIhKfWqIkXp3zbl4iJCD4UIt4qjob0oPHJKTrz1CCl
	KSWtoZ+ntkHWIqpktC4ZMEy/djUwiGuqA6LduplHlKZA289bDZ0qLHKnM4OjoAZc7KyazXu8LkZ
	EuvryjRQVx3uaH3Z8oHNF5K1amb06C5Vr0sS1ndcq925cOqfi1CHbctMegObNVilu2QvHY8GxWT
	kdLBMxaukcuEPTP9acwFB2jOwSdbft0Qk5/gP7prT99SaUzd+byqunxaMuLlW0wjIa+7cfwijCh
	qiAKPgiWiFfthN/kpgTF9k5dVoso0fjog4X89VRiKut0kHOe0lZOPEKDvts2zVWF0tKh/LuEtJE
	j4f9BsytP4vdX+YsPFHGHyuvpuXFVxGV1/RznmDbvCtGdimDZoeasNDSyKgLd6AT/InBZn4adOC
	KXkvw08d8TSz17jE5w2VZl+XqM+MUBaW1ejABhCaTWkX6chCvRfucv621IYqj7o1PJzhemkbWkH
	cGCWTRYcnj/mFM08ZKoymglnsPq
X-Received: by 2002:a05:6a20:4304:b0:3e1:1dcd:388d with SMTP id adf61e73a8af0-3e165054d74mr9519388637.40.1791904864753;
        Tue, 13 Oct 2026 08:21:04 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:21:04 -0700 (PDT)
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
Subject: [PATCH v2 32/35] clk: mediatek: mt8192: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:31 +0900
Message-ID: <20261013151734.3177690-33-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082106_234022_DC037C3E 
X-CRM114-Status: GOOD (  17.81  )
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

The MT8192 apmixedsys driver previously needed custom probe/remove
callbacks to configure FHCTL and register FHCTL clocks. With FHCTL
support now available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

The audsys driver can also use the common helpers, which now
support populating child devices.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 69 ++++----------------
 drivers/clk/mediatek/clk-mt8192-aud.c        | 26 +-------
 2 files changed, 16 insertions(+), 79 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index e6ac40e2f12d..92593370f23b 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -143,72 +143,29 @@ static struct mtk_pllfh_data pllfhs[] = {
 	FH(CLK_APMIXED_TVDPLL, FH_TVDPLL, 0x154),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.fhctl_node = "mediatek,mt8192-fhctl",
+	.pllfhs = pllfhs,
+	.num_pllfhs = ARRAY_SIZE(pllfhs),
+};
+
 static const struct of_device_id of_match_clk_mt8192_apmixed[] = {
-	{ .compatible = "mediatek,mt8192-apmixedsys" },
+	{ .compatible = "mediatek,mt8192-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_apmixed);
 
-static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const u8 *fhctl_node = "mediatek,mt8192-fhctl";
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
-				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-				   ARRAY_SIZE(apmixed_clks), clk_data);
-	if (r)
-		goto unregister_plls;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_gates;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8192_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8192_apmixed_drv = {
 	.driver = {
 		.name = "clk-mt8192-apmixed",
 		.of_match_table = of_match_clk_mt8192_apmixed,
 	},
-	.probe = clk_mt8192_apmixed_probe,
-	.remove = clk_mt8192_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8192_apmixed_drv);
 MODULE_DESCRIPTION("MediaTek MT8192 apmixed clocks driver");
diff --git a/drivers/clk/mediatek/clk-mt8192-aud.c b/drivers/clk/mediatek/clk-mt8192-aud.c
index f3ebf8713fbb..8625f656a2e4 100644
--- a/drivers/clk/mediatek/clk-mt8192-aud.c
+++ b/drivers/clk/mediatek/clk-mt8192-aud.c
@@ -80,29 +80,9 @@ static const struct mtk_gate aud_clks[] = {
 static const struct mtk_clk_desc aud_desc = {
 	.clks = aud_clks,
 	.num_clks = ARRAY_SIZE(aud_clks),
+	.populate_children = true,
 };
 
-static int clk_mt8192_aud_probe(struct platform_device *pdev)
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
-static void clk_mt8192_aud_remove(struct platform_device *pdev)
-{
-	of_platform_depopulate(&pdev->dev);
-	mtk_clk_simple_remove(pdev);
-}
-
 static const struct of_device_id of_match_clk_mt8192_aud[] = {
 	{ .compatible = "mediatek,mt8192-audsys", .data = &aud_desc },
 	{ /* sentinel */ }
@@ -110,8 +90,8 @@ static const struct of_device_id of_match_clk_mt8192_aud[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_aud);
 
 static struct platform_driver clk_mt8192_aud_drv = {
-	.probe = clk_mt8192_aud_probe,
-	.remove = clk_mt8192_aud_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-aud",
 		.of_match_table = of_match_clk_mt8192_aud,
-- 
2.56.0


