Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF2AC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfu6eLISeoWLoVNrhpCX0FpFSHnnXu01Kfc6jWC5OK8=; b=yItjQ8FrxMFnDjkmwzMqLAfWbt
	srTFvikHG8prqNyvWTXBDyf+oMhBlN6wDkAT06yfkSLSVnCGk61ZbYuYlukk65v2+2ZVGCv3t4feN
	hAmARBfAfDsReqLbET1L/qb3VwPA6a/UifBr2DG9iEJeO8EDEiO80vriGksQWTPD+QYvw0zBr46YU
	MpsB7iPw0jDYGXTaPSSTcBDhcVgopLxckAqRCWSAT4wEJyMQ4cO7dXwz7qLTOG3ihN82eBfS/6MUe
	98QniVS7Vaswqh9XZ1RRlWb4sbsCR5qr7lc2O2COkgqK2JPVl0paG0eDefRUpGyA3YinEgooolsqT
	nDw8KVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtWH-0000000HMyc-3lMs;
	Mon, 03 Aug 2026 14:19:57 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtWE-0000000HMrX-0NMj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:56 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38e347638adso4007123a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766793; x=1786371593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfu6eLISeoWLoVNrhpCX0FpFSHnnXu01Kfc6jWC5OK8=;
        b=GKDHRRPOv2HDlVpTF/9n/KIDa7YrjPvSg+wNNn5jvwKMjFL1AHXv+rAe5d8BkvpSDv
         FXxZP9Y1TBrff5cewUxstfGWTCNbcvw9GoHj+W8ulxLIN34J2ozy1AicwPWPP2HQyM3z
         DsP3+kzq9sB2Q0ZLM1bffbSCGE8fslJ9Towmz87dfYwEeNrwakpHF9zQUHpvUbCjY1DC
         kUXoncqcTKBPwnItDzz0VUVpz0zgN8YHozhElt6vn72+kA+lZwogcOKCFZONBh2s6GqY
         LDxvyNicIqhomkCwGoMkVdyGrO+YjtkhTRzBmbZ5Yzgbmyf3vFz7LLVumrouT5zN25RO
         nBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766793; x=1786371593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfu6eLISeoWLoVNrhpCX0FpFSHnnXu01Kfc6jWC5OK8=;
        b=hTDhtLtrFdadqsJTgFEmHDC+IPXhkuTe9nAvPYjELhXwJ0QhDa4NgKGG1m2tn2ZPrw
         swssNOoTsbBd78SfvbIWSBgpV3JBcPqQy+J/ktKbmbFj2B97QCmnqBbf1/sv3hIi0qzj
         TioqJr0deny+H3/IIPZKNjoAF+2Yi6HhLHuuQ0Fpf/vG4b1LVC6acRG7QXWLyfOPqshc
         3RTVNEyo6SqWs7xesAV4G2PsjzXEKggs9GhYi+5+X0jpQBweVC/FGrJKA4RB9QQ4N5q/
         7dsRCol5KAN6rOLNdm5S2i5T13v3sRDLvcHaUeoCWZbtKYxt0T28sRYyYjcK6FrI1TJP
         /Dhg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7/NopfL8rqZ4PI5iK+dkvbEF6XjwQo36/dfhTc2ioTkHpNYu5L8PuvYCizlCzOppNsoRJKwJGQ6i7OxjagMfM@lists.infradead.org
X-Gm-Message-State: AOJu0YxotK/MqHxXPzOf5XGQqKTwEOcKnuC+XsKzvdVAECkf95GLlmoW
	Dnesda8+6G1Vt5tudJn67HxBJ39vH0IE109WkutYruTa0bRNtlsZqRs2
X-Gm-Gg: AR+sD10fKTYdyz8pd3EvLE3AJ1ugqAxr6qsGKriSgIhgolXBk4/lowaGxrf1hwlJJjO
	e2uQskA9DTd2jz7N5wLkYVzfbK+wytEC/yC8wmSHg80Cw+umisvc9C5Q8J4/JmzzpwrZXUUFDp8
	/4STpi3mjwMe4yDX7EcheRyzS6f7Cae6XkQjad3pTSmPq3Wf7xF2uSGd920yeM0o2icqg5gPhzv
	8wYbYs7d8ZDcVymeFJRvBCl1pR0iNanwsBfM09s7saql/I8xz5/uExU70YA86jM+A6oHuz2U7g/
	fsYvKo6XDxqWD5aJLJxz1dFrjhtxUxIvSe12flyCz0HKYJmdsQYGTHJkFR/THFt4WxOFZKDv1Zn
	Q4bIISvhPgfLYDD5ECZE+ha9gRsUv4Bl6F7c8CWuCZ69jwaqWAuYJf2Ig0egU6MG3WOFxyF0f1W
	9+oWRWKKIpmMGQgN1V+0i2EZnmHy1mD6VdydP9cUkR7rh2s2paHV/XlVglNnR8UpPiC7mHr+NLp
	TzBdp4yul9usCLCDO82s/uxEvvcU48=
X-Received: by 2002:a17:90b:562b:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-38fbc4053e3mr8607547a91.6.1785766793277;
        Mon, 03 Aug 2026 07:19:53 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:52 -0700 (PDT)
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
Subject: [PATCH 32/32] clk: mediatek: mt8516-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:59 +0900
Message-ID: <20260803141659.559129-33-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071954_184833_433B7807 
X-CRM114-Status: GOOD (  16.16  )
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

The MT8516 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.
Also, add a remove callback to properly support module unloading.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
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
2.55.0


