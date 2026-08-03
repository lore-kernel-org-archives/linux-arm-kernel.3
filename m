Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7D9C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4vjRsmYjATMWW3awrsZtoWhxsLcy7oInLDZqihXyW8=; b=h3etE+KxXPugryYKQIbtCSHUlA
	HyuL+3uEeFGwrlmdccVtM9wnrnD6Qihz6WLHwnjpGwDyBVbiQg4l39f2VuD2tDfbWx2KfkdRwwqDk
	bcon2S2vT2qiBlvi57lgl2E4knjQr3XcO/BuLWq1sJ8n5TXD/QlVy11P1YZDD0ko2P2v0XnKshugU
	G0/smE21mS7FO8SsNDEBh9HnafU5GQQNjZrMd5vEE8QoPl8YvLDo1YDTU1Orlmn4l7dBofg0s6GQn
	AdPAVVMxVj8nXO9vhhuqj6+d2WSyy9jk1b44wzKnsxKgH3fGNbrvigRa8Myy/C3ldp/Szilze6UDb
	1GmcA0dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVx-0000000HMRl-2BVZ;
	Mon, 03 Aug 2026 14:19:37 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVq-0000000HMI0-3p9U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:36 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so2237983a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766770; x=1786371570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4vjRsmYjATMWW3awrsZtoWhxsLcy7oInLDZqihXyW8=;
        b=BrB+6V71L2m7aH2UG6p3yZO3XfXqQ5hMwFiVuuY8eCalgHUkcZxAYx0AMqBNDFwHzN
         R4yWSXcoYXNR5xyhAnApsWhN3WkcaNLr+swqYtqKk8BbHSqatPwj6UOUmkW9Fp0VMG3G
         Grr00fkEyNEQgIu2Khuv0SRODivW2T8YK6WA75Oo6xV1OaoAkkCWx/ZaHixod+7u/8qG
         urn26cYUbSL8tTIwpuJOxoM8nC0J9FZ/jFD40OJvDp8UaIHpk7oKDnhtRykT64An5vHz
         vKs6aD0vFaLGrGtc0u1cKztMsJbkypwz9/T4ste37skf5Wic+3JbLMlQiADctB5ON3FD
         URJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766770; x=1786371570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I4vjRsmYjATMWW3awrsZtoWhxsLcy7oInLDZqihXyW8=;
        b=YmG6o8Vj6/PUOtndwPS1dSuEWd7BA0JY6vMUScQnlWEsFbdXTnm4MyFjD4o3oalC5Z
         9cimicIl/dmojM509q3NQCgCnVPMeDpEuh0QsVcJIbAnPPpJzS6MWLbOi3ghdYYZwluS
         JwV/m+YVZkNi64hWux3bDN28NkiZ0kO9ab4Ywkvv0VA7F3zE5YvR9dBijE7oZkfz/kKf
         haiswSSa6h9ti2Kz72nZEfqA6xg9wsO1GiLes6u+/5m3EpYFLfk/9DfgNjHMfuqyOI9f
         T9jrg+mC7N2TLIu6oKm4tRNqdN5Imse30h8IcejOr7oLIkdY7WlCAiIDKaynBqXO61Z+
         K/Ew==
X-Forwarded-Encrypted: i=1; AHgh+RrVgy31C/rqOkKikEqTiTrpPkwn7R9WEax1M69QfrPf9zWxLMVyn5jnaJwrGOiSqWQXn+Atq6jFByJXEXB7Pc0t@lists.infradead.org
X-Gm-Message-State: AOJu0YwIXtmq15YnMtRGcU/v33g6BCDY5C3UvD69xHeFSJ+BrR5bWozw
	fovLg6p7BOKIOcwjyTi9M0EF7ULLpD/I4KDyqPkS89QoPFlogi7trlH3
X-Gm-Gg: AR+sD12GuXNAlDeSVxdIdOekffkzxB4+lpYzTuurLnO0Oxefe/fDBjy4hBgX0CWkNZi
	Z0IFWVLjNWdyelAkZ7zoITcXDsJ9laAhna/lyWSlBmyMscNGfLFkt7DwJeJadFLwQ78j95HHXEr
	SCG7P9N7/N6Y2XbNr6ntH2/W8IP942kiN/k/q2A8EkRtsdMoo2HTO6HRoXPFKH7xRF/lRP8HiOV
	QutdVoeQIu9mqfnk8Vwas3IftIMR+AfKnk9D36kEej/c/VLbjT0WVFXA9l/wkwsP6oTovVC0YjC
	Hggn4wStIrjaPSVp0iIyZVLGhJ+oUf/oV9ZrG2/HMgp7WLRqqokzc9EG7MQ4NxiEk5PQ+dpgLBc
	3Zgv96ukpDVZi5Uw/6i3B6RblvgxyERKym+AI3LMazC2ORHbf6rro8+B2B+8wPP7RJLsNyXEu15
	H0aWTc37G5FU7KvBV8eGdW2VC4Abw6bTFAC2pkn3QCtDLHZSsD+v+SWlXOpX4ibI2TeDi3e1Smj
	eBfrFQGUBbuQUbNNN8+
X-Received: by 2002:a17:90b:3b83:b0:381:973e:fa08 with SMTP id 98e67ed59e1d1-38fbc48ec1cmr9467935a91.18.1785766770208;
        Mon, 03 Aug 2026 07:19:30 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:29 -0700 (PDT)
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
Subject: [PATCH 27/32] clk: mediatek: mt8186-apmixedsys: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:54 +0900
Message-ID: <20260803141659.559129-28-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071931_037972_A5C56343 
X-CRM114-Status: GOOD (  14.88  )
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

The MT8186 apmixedsys driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c | 59 ++++----------------
 1 file changed, 11 insertions(+), 48 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
index d35dd2632e43..b674b1e581a5 100644
--- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -132,60 +132,23 @@ static struct mtk_pllfh_data pllfhs[] = {
 	FH(CLK_APMIXED_MSDCPLL, FH_MSDCPLL, 0x0118),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.fhctl_node = "mediatek,mt8186-fhctl",
+	.pllfhs = pllfhs,
+	.num_pllfhs = ARRAY_SIZE(pllfhs),
+};
+
 static const struct of_device_id of_match_clk_mt8186_apmixed[] = {
-	{ .compatible = "mediatek,mt8186-apmixedsys", },
+	{ .compatible = "mediatek,mt8186-apmixedsys", .data = &apmixed_desc },
 	{}
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_apmixed);
 
-static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const u8 *fhctl_node = "mediatek,mt8186-fhctl";
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
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8186_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8186_apmixed_drv = {
-	.probe = clk_mt8186_apmixed_probe,
-	.remove = clk_mt8186_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-apmixed",
 		.of_match_table = of_match_clk_mt8186_apmixed,
-- 
2.55.0


