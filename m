Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F04ECC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V11FgU5Hk2iknPklJqDL6cWLAqsnrkzvHZD63RZ0N2Y=; b=zNAUk2Uh9Fgd8Vmy+trVPB8Nuj
	xkjrpw8d18m/nBo8TbwBb6ji7KD+sF2dHcwXlMQRvLFG5Pc2nMlDl78YdQHylQnan2eZZdX+15LSU
	VqfLQP/WCgWgsjvZLhlVqGRNmMZWKWLCox3uzWeWFXpG9egD1gnMXnUMVkxYr+fkggORotPoioLip
	XxMhvw3PbNb3aKOLeLDycoLEsjyC9vZgj4ZM8/9j/oGT9P9x/2hHx682eFqDG53gnz6HHYHvtHsi0
	XtnAxvM0sp90X+LgfLWsSA5osL3TMDWPmFIY0qtn9Sb5mfk6FxTNKrPtcb5qH4fiO33PuRmdbbDww
	bczb6HCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJ7-0000000DICl-0dZh;
	Tue, 13 Oct 2026 15:20:49 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIe-0000000DHuq-0tGi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:24 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso1239744a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904819; x=1792509619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V11FgU5Hk2iknPklJqDL6cWLAqsnrkzvHZD63RZ0N2Y=;
        b=HXKIHcY1K4a2wbUHKyOSfREOjofXXLuz5uNsJKzfNKaqSCQm+ndOH2/m8eYjQ/dtkf
         lGDJxw5xrH6k3ieeofh3E8VSR4MHcX6AJAjMHEDSI47A1kLtjjyigM7d7D+HAusIBD48
         rrMiezZeX+dtI2WFad+Z8NkkNMSTg2C3scq3dKf60KiPiWgaeU1aOivXudfNrcJaHQdt
         sue+am9gUV26yyNiI2kmzcZM7A1KFk5nOIvq0PgfNAzeyPtN35rNsNQwb/qPTHhyJ5r/
         36U9xNgoPyQtvdqdc6c97Fgb+WQ2FgYLqhwn3M2IcOV8ia1+ghihrysj1esKC3oyJZnd
         H8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904820; x=1792509620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V11FgU5Hk2iknPklJqDL6cWLAqsnrkzvHZD63RZ0N2Y=;
        b=VH0aNmPhm6VtST6JQ99RMpjm5mAR6L7byFQaj6Vb7gWHXCUvSztP9D2/ePkQsZ5NpU
         5TOah7uHidHatGM4QcBMDOYfZ91Ya11HE58QdIA+M0ouwpJhfIrgZnKbyyPbzBmwclyB
         T8FrCH/5gLXW1uZ9RGH2SleA+c6C9Lx1is5nYl/83CNUWQ3cUiDpn6xI6udHvz2M0EBB
         c7Dmm6fAhISm6yTmT9IWeI0mBnVCw/926GYZKrjQVRtzchhdBqM0PVm0x02aoTO8oXdm
         eO2Lq/qK6ayYItb8KkhPiJWfH8ynzfsZMh70xbFUhHkZaDWFzVM7g+cbyQi7qRcyLK96
         DPRA==
X-Forwarded-Encrypted: i=1; AKwUvBwgU0XkEACiC2xo1sJjYoS0wZlTKCmoOXibjfdbW5ZDXZ5CbLFDce25i23hoX4YwQG1I6UGhfXxp1i7m9FIpdgO@lists.infradead.org
X-Gm-Message-State: AFq9FYJW0KQyqit7RiNO8NLZXriRqVLiO/mofn98h2l2BT/lrvKk9PHr
	nHKAhOv2GDH7XlGMgxojVD/Fr6AzTFIPTs1gRuGdaitvVNQ1ZB51+fK0
X-Gm-Gg: AYBFou0I1mCWVD1BstIr4RRT64at160miBMxNcffNzrG5JyUk5Lu9rQvgEfsMOb+2Ic
	dt2JJeJILR30+Wi5v9ka5tZTpWdJzT4pDGj3kNWTAx/nhO+fxx6hLvABVXTGND+fBGAQMH2bOBe
	BVTU925uQd62F2WrwHy1Rmemi16C0NhNd+U+l5mZ2soK6dm0nP8bXl2oj2x6G22adJQ1M2cwQ4v
	C44SgYR22vo/DOu7IepOcJVoKnSjVv3n9Et4gGbneyApeWKgiEzQ78sRaqtioRXLsIzeonnPvgy
	cpWSWTuLniigGXXLrfcNhcKPPqFVCRfcg1ohjvKqGIsJpPQobKd1fbKCKT2i8W1IeGacMikaiD0
	1NSNpvnBwi7NNnRCiydv0zXyy1ckLSYwI/NDKlnAbHf7P+SIRmRMrSwd6rVOkHQrmCGOK09ooGz
	4/UXvf0HTrpjJAFSZdAZnFRgULqWDUwqJCDpJyGbhMF1dHrYve+Ykp981Ng82PNxhBHEZyExzHe
	ctpI1GfEAY2+4W0gfjuo1mbhXS1SA==
X-Received: by 2002:a05:6a21:e58c:b0:3e1:485a:8e72 with SMTP id adf61e73a8af0-3e16bb0d1e7mr10165482637.1.1791904819285;
        Tue, 13 Oct 2026 08:20:19 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:18 -0700 (PDT)
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
Subject: [PATCH v2 24/35] clk: mediatek: mt7986-apmixed: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:23 +0900
Message-ID: <20261013151734.3177690-25-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082020_276396_8184EFD0 
X-CRM114-Status: GOOD (  16.62  )
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

The MT7986 apmixedsys driver used a custom probe to register PLLs but
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
 drivers/clk/mediatek/clk-mt7986-apmixed.c | 37 ++++++-----------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index af3e002bbfb7..6df3e9555e4e 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -57,45 +57,26 @@ static const struct mtk_pll_data plls[] = {
 	    0x0278, 4, 0, 0x027c, 0),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7986_apmixed[] = {
-	{ .compatible = "mediatek,mt7986-apmixedsys", },
+	{ .compatible = "mediatek,mt7986-apmixedsys", .data = &apmixed_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7986_apmixed);
 
-static int clk_mt7986_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-		goto free_apmixed_data;
-	}
-	return r;
-
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7986_apmixed_drv = {
-	.probe = clk_mt7986_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7986-apmixed",
 		.of_match_table = of_match_clk_mt7986_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7986_apmixed_drv);
+module_platform_driver(clk_mt7986_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7986 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


