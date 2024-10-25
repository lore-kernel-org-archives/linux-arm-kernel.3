Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EBCD10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=goXfP12NdyXqfEtjdmE+Sw+InXCrHTgSpMmeNxMM+70=; b=Na6w7msljUlVJ5DSoanfiSV5os
	Dr2UaC7tXxAEeapdQRgrElyHw3gqIORxz7lUJkdohv8mwsluGwebs9i9qR46LQyyZQBED+Jb0Rdk7
	sOQCT2dk5JgF9vPEZroLmBDE8LuHXbEirtDXEak0gcpK5G7Hq+43XFPk5/hMweSwHuuBHK8PAkneR
	1hDVtv5zWN4Ss44m+8bbxYbkSy8PGsK3NADnwMZa2UlcUgcEeadjfg2MNBTzhtnNYonvZGKKLbAgt
	gV5PVbKnCuH/Yp91yQ06oW82Ro57FmXZkqJH5+69iXnuxhtBQOaR3TKEiovZb7xXY7tPSUA01M97z
	4QYoDXEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MbN-00000004Jse-1MWE;
	Fri, 25 Oct 2024 15:51:49 +0000
Received: from msa-209.smtpout.orange.fr ([193.252.23.209] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MWB-00000004JC6-1Qrm;
	Fri, 25 Oct 2024 15:46:29 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 4MW1tag1Z3B144MW2tnfRZ; Fri, 25 Oct 2024 17:46:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1729871179;
	bh=goXfP12NdyXqfEtjdmE+Sw+InXCrHTgSpMmeNxMM+70=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=blFkic2ynkTyXgIOuzF1e+2DLRxnlptZjw3hfUUlMsZDjYbwtNaUUBvLY8aXClf3w
	 dvOGERrp/7JvSSHsY7+oWbpY9ruJsc/+cJqM7JN/pN5G7TrkHM8YkRNW+KFPwq2om1
	 Nn9t8U8IsFIiQiIst/Y84jZbDKzoFQgA1ta+tilwnJPxgzIVNKlT712WTFBJSEfYTN
	 vATTdgSkMqyCfnHcB1vRJpI8ifHJHbyaR0S3NTU84T4O2poBrhRSl5uiRt/tCVqcIz
	 tXKeNEyqgCrm+iAx3JUIxI7Sgk8alMAso59xN6Oug3y7BB1VEo2XvH2QfBcE1NP8fK
	 UdA6NF5MjprZQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 25 Oct 2024 17:46:19 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt6735-apmixedsys: Fix an error handling path in clk_mt6735_apmixed_probe()
Date: Fri, 25 Oct 2024 17:46:08 +0200
Message-ID: <89ad840e7a484eaf4727470824acfe0fdc60fcef.1729871146.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_084627_812779_2446D02A 
X-CRM114-Status: GOOD (  11.55  )
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

If an error occurs after a successful mtk_alloc_clk_data(),
mtk_free_clk_data() should be called, as already done in the .remove()
function.

Switch to mtk_devm_alloc_clk_data() in order to fix the memory leak in the
probe function, and simplify the remove function.

Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index 104722a61dfd..e0949911e8f7 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -88,7 +88,7 @@ static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(apmixedsys_plls));
+	clk_data = mtk_devm_alloc_clk_data(&pdev->dev, ARRAY_SIZE(apmixedsys_plls));
 	if (!clk_data)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, clk_data);
@@ -114,7 +114,6 @@ static void clk_mt6735_apmixed_remove(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
 
 	mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls), clk_data);
-	mtk_free_clk_data(clk_data);
 }
 
 static const struct of_device_id of_match_mt6735_apmixedsys[] = {
-- 
2.47.0


