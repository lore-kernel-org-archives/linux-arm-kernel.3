Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803BACC6B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCl/6qeMZv3v3Pu317P8LnfQYMKKlWKvO4QJGZKNwak=; b=z3UBPCRMC9WxO5tg0FDicksvoS
	/03Kqiqmx55mDeN2dW4ZPbxso8Lr717ddE7rVH66kOmmq1e9J5HlatpOwHb4jcdhe4JP+yK6ROvY5
	IMUalg/TkY+ce5KEu4F6UVLlcjtyHnjNEyAAlz5BC7vaDEpQw09hBC3+2sq3GIvqqRKusFTf9t9Kc
	vaDxnQ7x+Z/KEVoGHfI+HDDtc5spNkBub1khkeFXUkZyEZ2Mju8UXsvL2Kz/1jPCDQ1kKID8Pvyhc
	s7nKjzxqj8N+EcBvOMLPWtNJ53EAGi5DJ46yn1QL9z7cLtSaY9wfmYY1qRSiqcDwO74KrujRbPZoI
	EHif4NyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeKP-0000000DJ9q-3AYd;
	Tue, 13 Oct 2026 15:22:09 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJC-0000000DIIh-3Wkn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:21:04 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cd623dfe420so141146a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904854; x=1792509654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCl/6qeMZv3v3Pu317P8LnfQYMKKlWKvO4QJGZKNwak=;
        b=CU2D3lguQZKx9j0M9OC2fbPiF7ZZAic1YxI7d4b0XUdmmmK7wgb1gz6HigFkz/hn5i
         P+RgMpKu4diVjG3DIe4aZBA9D0mhLOGq3AlhXJq9zua+zCCu75kZes6i+IKoQ9Lurz2I
         08WTErTZQhF7g0XTTYf3IcYRJNnlhaljFIQ8Lvp23aJAajVz8sR+5jgdxsGX9/xFpuyy
         IHF0mn/noAxU/S2iTEXpQ0At9TS6JXVVeXXjH015lxWAH3xNzbKqjLF2bLXoIA/14Q41
         QgxQj6+Vl3IUziNTxd9dhn3G4x8NpqMp80nSP2/QMGp0sUKhtcEM9Vvr51bAcNOHqQxj
         +qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904854; x=1792509654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YCl/6qeMZv3v3Pu317P8LnfQYMKKlWKvO4QJGZKNwak=;
        b=a0CfK6cYvSMXEZ41YJb8ZGnft27atM3t/HAmgRyMIBkugijBPwLdLs315nk3UkBk5K
         jVbJxF3S9QepLG3mCzptVK/B6Ccj2iJbHdQeLyXCWAaELFcPFqaX+TxLVIGV5TZKiife
         gFoKzsiCwNZ54Pj0T9iko6sRaMJuFSNlISkPU261yH/bx9ve6ZHLmhJRQqpPRhXg+GI9
         RovET/X6/B3KvUEQU9oeLGg4wIWuNxa5DFM/psan+MUZcc/VbYx/lODVkmPaFhwtPgxG
         xPyUrvUtDZjjKQEPBfAG3UvsAxGHEfrbaYylEEhTADjZ1RpiITOQn/NAHi1l0pWCgJUa
         gYpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRsCIXvtnRj89oaMYmmCaCy7olJThFHe9nT2pdBiIlKFaAAW7QiDP9AgKcQQDrqEpbtFBREFmpTTluRfc2xbdH@lists.infradead.org
X-Gm-Message-State: AFq9FYLnRXy/GZmP56ebaqI5kmqlC1pciNj1MErrbSDP7Ldpvre8ZVZx
	KGNsmmB1UEN5iaJdv4osHyCxepUqkwFezzd8yr9KgPb3ma5nBexuH3Qt
X-Gm-Gg: AYBFou33tAntDW+tIlT9J76ud7rBjZT36+4FpIdAEIpBv2ykElYSHickJtnLgtG9PRm
	BgeZd5ybbTx2beQwMGCBcVNceYlYX5mfVATyygWQPmmn71uemH8qlyeg2w3nOsJtnvK08TFIHKZ
	vWh+f7MGagSkgkVcdvWYxmX7qU+W/MbksknGTnJQBFY0JUNdOETK4Y3B/PqxCRe7HVvI2eaIlT0
	N/E05bCiJQJ8KrzYVwatas1VBQBFu/bMh2MTYGiMdi/vbUrdFS6eXrf8Fzz6OWbRb9qO/vJTys6
	tM1LkJKPlc/Mll+XHaAvhh1dZTznC4NdY8yJznjYBAZRuTf5goKFRv8DgN77VzJAEbh4JhwjUfm
	vUryaTAaukO2rW5B7i0vd7tT0Z50OIEjc/+qfgjuLAUbwcXH8U43e8QZBIDn8laKDpd4cBOYHwM
	izqZ/BkF4ozjW1qpIEbChrsVUFnwMSnVzV37cowQx1OAIivV7bcOv7qVsxG9N9PEGDrI7ch12hg
	lejx5HKU+t099Xio8X1u1so+mcb
X-Received: by 2002:a05:6a21:a346:b0:3e1:bc0e:196c with SMTP id adf61e73a8af0-3e1d253c104mr365944637.37.1791904853915;
        Tue, 13 Oct 2026 08:20:53 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:53 -0700 (PDT)
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
Subject: [PATCH v2 30/35] clk: mediatek: mt8186-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:29 +0900
Message-ID: <20261013151734.3177690-31-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082057_927702_B3A4DDE1 
X-CRM114-Status: GOOD (  16.30  )
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

The MT8186 apmixedsys driver previously needed custom probe/remove
callbacks to configure FHCTL for PLL frequency hopping and
register/unregister the affected PLL clocks. With PLL and FHCTL support
now available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
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
2.56.0


