Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BA7C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFy5iVZEOfPquGcw+vh6esYYUXcjeKTrkCboYc9Z/fs=; b=hBjZn3EPvrpMLGf1V+uOCfOb8e
	UglqxpllRQytLQ+r4nk7Xg+f8OChoiHzCeGZZxD0Z2w57YJiAff8rgqGjlmeNTAACsZgzp+cigu6/
	ZOb8ZkwxyisOxUhGnHy3TIzTQjiBFIHU2N2ZQrZZgFPvuZ9NEB/YJYZtTZxVzpY8nbMUm4e7Pr57K
	l9xqJ557e+m47yp6dz3C1YcD7197fHYiNPXdS5zkV5EEuZVVnO0RGRY9Ra9gkskT60PB3WKqGdBv5
	PlpdvyY9G3zzz/EpFMS6YtNVOLZBEObti9fMfF+44/1MdxcXAL7CHD6lvofiNbSIBhxGpgM7iViUF
	KAph3Gaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVR-0000000HLeY-3JMR;
	Mon, 03 Aug 2026 14:19:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVL-0000000HLTN-1ph6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:04 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso2608599a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766738; x=1786371538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EFy5iVZEOfPquGcw+vh6esYYUXcjeKTrkCboYc9Z/fs=;
        b=rHmTSBvc2UbfEaxnbk7pxl8FTGciGpa6NEE2q3b1iUR/TuZ0hDJ8gBmiTrMToNmSQj
         UMNmjSVbAe9RQPZucfxDJjDhyQYovZOiq5ybUGzmwkzAmK0rb1ZVNlhAe1OxG/3FBv8d
         7kOHwnyWg+eidnrhks8p+uprLCZpdW6ww5S0RhUkrMIIMEU8w1YfKX0IRxelFqYQW4JP
         GssIwoMc2aSvshawix/N5+c5r8Vpu0/jNd86fGCEPq5WMxTggDIDv1bXWD7GyyNyWVm9
         niPd1hW2nsRvpKcSMToQLPLCLVIVLoAmR9iMBzAY/YvNBRsm5bn3vvlahJaQcd4UU1SL
         l1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766738; x=1786371538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EFy5iVZEOfPquGcw+vh6esYYUXcjeKTrkCboYc9Z/fs=;
        b=WwbBOOynQs5dv75j1SrctlNe+Jd28J0q2IVyLIDtU6D2nq79D4BRIvUcpHm9fCXxTA
         anjX6bhoE4X+f1ERB4AInK63G4S4tO7H0VkwnI9PQGeJvDfLXdE/CSAbaSmrLRdDeT1M
         MEjDZCdR/9B3EBWRX4jf3U11+R1v018Y0W12mCPHpVLxAAzABVZ8+JQAgpJQKHUHn/DE
         QZLqKvIyGLBDBTEw5C6I+N+RQgPNhHazA/rRpsES0z3cgIHNEggBp+WlLt75hcWTco0C
         YNGqQ+2jHh3HdcDcliGjm/z9RjOXT1Sg9xMeeoOJnF5I8G+wbOl1TEgvtjGq5gfkbx8d
         +Lgg==
X-Forwarded-Encrypted: i=1; AHgh+Rqfv+PaJ2V46cCSAmOeu14I1+IMUcBGBenab9Ehm2durAmuFILoJShBpq02aTLnqVandQTTJd0U2tP1eXdghzHK@lists.infradead.org
X-Gm-Message-State: AOJu0YyBVtnFI+GYPQkQ+muhIoB8V9oz4oYqccgIfyaLqST0ziaj5oui
	odrttxlAiobilrYxy5qXS+qcoxoB3tN6qfVZSm8XKtieCX+j4nvFJAxE
X-Gm-Gg: AR+sD11J53aIGUl3e4xRg6x0e08R7Zu6XvI+u9jI4lwfIgWVu8b9V0F/Vzx031yT3Gu
	OyugkfE/kSiXTMTILmuao/gRbSy4fH5DQ8WnYe2+2ORxrYYSOoKo7YhdRlDcx0uBaz+Fd4Z6QP/
	QN3hnH/6uJgCA5xXb97jb0IIlJonXndDijOQkYslpQ7UdMR06qy4IiqvImDAgC8b+EEvatCH8Pu
	LxhdIFer59wHGjRKZtMSws/KZtcAwCW8K20M1lTEbXIq+SXQazOQIL44zB2j2fItwEUeBIHHltd
	GsE4GBng7xEPhDXJ/xBAbNuaRaE9kN2qjeRDleYaqoGwXA9L0ZFPYEt0m2yqWXFVvRS4lBoGjP7
	iKuq1dGZTgsVCzyeITial2Wp0IvnITB6cQY50H8Dz75fhQxxjgIMaLo2O33fn9830X8DlZM+C+G
	W/Jh0jpZqA95k867Mmr1OXBL6kSIyh4u6MZ/1KLPqJvctzAZvC84XRsrbXCj2PeTEfm3zLHvlpK
	xcMt1+alGgxE8FuJ/rR
X-Received: by 2002:a17:90b:3851:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38fbc52da42mr9027280a91.38.1785766738150;
        Mon, 03 Aug 2026 07:18:58 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:57 -0700 (PDT)
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
Subject: [PATCH 20/32] clk: mediatek: mt7981-apmixed: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:47 +0900
Message-ID: <20260803141659.559129-21-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071859_497907_87D810D1 
X-CRM114-Status: GOOD (  18.18  )
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

The MT7981 apmixed driver can use the MediaTek clock framework common
initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.
This change also makes it possible to build the driver as a module.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/Kconfig              |  2 +-
 drivers/clk/mediatek/clk-mt7981-apmixed.c | 37 ++++++-----------------
 2 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index f5460ce3ffba..6449b77d56ed 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -427,7 +427,7 @@ config COMMON_CLK_MT7629_HIFSYS
 	  to PCI-E and USB.
 
 config COMMON_CLK_MT7981
-	bool "Clock driver for MediaTek MT7981"
+	tristate "Clock driver for MediaTek MT7981"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
diff --git a/drivers/clk/mediatek/clk-mt7981-apmixed.c b/drivers/clk/mediatek/clk-mt7981-apmixed.c
index 851d0bc7840a..810395aff253 100644
--- a/drivers/clk/mediatek/clk-mt7981-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7981-apmixed.c
@@ -59,45 +59,26 @@ static const struct mtk_pll_data plls[] = {
 	    0x0278, 4, 0, 0x027C, 0),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7981_apmixed[] = {
-	{ .compatible = "mediatek,mt7981-apmixedsys", },
+	{ .compatible = "mediatek,mt7981-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_apmixed);
 
-static int clk_mt7981_apmixed_probe(struct platform_device *pdev)
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
 static struct platform_driver clk_mt7981_apmixed_drv = {
-	.probe = clk_mt7981_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7981-apmixed",
 		.of_match_table = of_match_clk_mt7981_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7981_apmixed_drv);
+module_platform_driver(clk_mt7981_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7981 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0


