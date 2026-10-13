Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05503CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fVc8UeH+5da/hVDNrPa5heU1KsL+eYQi/ZKHAgy494=; b=NiHZxqlPD6jcfZ2dJh6ELWQnxu
	cGcwUHwRuU3ZXQXOp0l7HDauUvEy7sYsAgar1sHBLrrc4X7Qb94wc0n6zitnetphZUbOfCjUDOiVj
	Xf7gWgdzxBwpbMDV2BmdLp5dcw+49W2reCH8DzBcPAZ8pKG4d3EYRLStAvu70BeyV/bCBmaupkWt+
	TL7zsrQcUvxIBXJ1Kt9zYwTR8xVPrASsYaUD8JbeIHrvxtx3CB+Jx7UnZms1C4W45bMnrFVzqh5bY
	T1X8j3tdvyaMDQghdHchew14KaxAKSGBuHvax+CwLM4OgL93GeF0IuIOf7s9Cku9jY1vNGduYeLDz
	LL0vfbdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGY-0000000DFrA-0FJV;
	Tue, 13 Oct 2026 15:18:10 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGU-0000000DFo5-24f7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:08 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8917c712f32so1396778b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904683; x=1792509483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fVc8UeH+5da/hVDNrPa5heU1KsL+eYQi/ZKHAgy494=;
        b=krRu6FdAeKOEuJrmqqB9Nbm6oBUsF9kw3ngEIMO/x/jgjZtyBu8UGYzdEGFRmsphUU
         CLxxAUVAd98bhNjFJntKzbBMc2pTphNhRuD6ddm7dF1G/78hRybcbE7l0fu+Gy/6NIrH
         RgU4XxF586FJ/lst6pfrX8tz3tdU29fcqbAkuvOtUiG4UNZiy3iMw4Uz7iBtqFB2HmxN
         CQMFGFaMEDRhPDidAW74U9P71/wxJZTuAPaDzxFVS+W9+wm9HxXBnjJYlv2JeW9I4T70
         OGLj+2Dg9jvvyx4i293WzsV2Go4PVpeOQlRB3dj8T4Qo/817xLXpVf1Bn+6Jc9oznlkX
         CpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904683; x=1792509483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fVc8UeH+5da/hVDNrPa5heU1KsL+eYQi/ZKHAgy494=;
        b=JJGYpcKGv9IjXsGb1SoKT3R7hhvZATIrwdce+LokUnvqsw3pcEMJ39oIxplcrJkMgU
         rj5hv8CpSVq/08NLKFqL1LiUFtvDZZnxvhHiTLIzGFIqw28WGtAC/dv2/czzODp+dlWD
         AWL34PP5dk6ADs4B50Y83IvAu0VN76HaHgWH9I4AzYNfSCgUuWSjgG5HnDwhT0CyNldu
         qAZioP3BC6vns35mfVUV5oOHSXUjUpB2+noj+CFObFrlEarn5Hph8T5lqxosbPPIg2vn
         lY+F9uOfQk1l6hzjbiDSIXN5wsCl+QxJZoa4Yu8htO9IhdSK2z/etBmbrA6yiSB02+3r
         AuEQ==
X-Forwarded-Encrypted: i=1; AKwUvByWt0w1avc0/iCdFign8kFMIEwj0vpKssPUCfGNZUpCitaG1AqiVFN+fTNPFLcwcJVj2dNkPgLMj5GeCv3dG6/l@lists.infradead.org
X-Gm-Message-State: AFq9FYKHJOwIrMevv1xXeMCjWi4zkDfLdgl8X3cBQ3/dC9r/B8P4vQf+
	thUZdWdrF89ibRh9LR6mbVL/05d58SKGzNtuk5kZMitvyjRp41EGly5S
X-Gm-Gg: AYBFou2ANgui6XGsmyjOSD8LhmcRiGDjefhLkZrgmVsevW5MSnjIsLDeAKCnRPPqiVs
	EMmeNb8CnT/2LrnSL6Y19HabJvHjfcTbMigsE6k4ljGv4YbdiDiFO28QW2Ytxc0/SeqZAr4x4J6
	fVUBbNwYz4qEGkUQMFUL3ZFjYk6Vgq225wZ+BTP2NVLVyBuMzkz/B+wb3PyWaVcZmm6gWORfjWv
	LkdfUq4oE0Qe5KM+ySet43G/rJd+zaAgQWdP2ZdK9k5m3E2j9ffMhE4PwHqvKHyAtvpXBqY1B2u
	MWeNFB9wk7cUwCSb8g7hqI21TPn6Cgt8FgIGyn056VnxEDlQHfCIp88F7yo2olO5PqKJRZmfO5R
	gLDhCI9ZbIa9sRwBBFPjm6sOxYHGM0u7R2ekQoSDKEDXgsz8/jlYnkitsf425D9eUv2DCKyQCEv
	GLUnnV2pD3UQd+WocHqO/G+x7R367tzSDzXYhaqJSFptbUiMJlG8K71s/2lPs3ztCc96oYsdzoI
	hxJP9Wr2ZXjmTeyfXFbD9HHtUFpE+kis7uP6MM=
X-Received: by 2002:a05:6a20:a10c:b0:3de:79fe:13f with SMTP id adf61e73a8af0-3e16bf27deemr11023823637.38.1791904682967;
        Tue, 13 Oct 2026 08:18:02 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:02 -0700 (PDT)
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
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 01/35] clk: mediatek: mt2712: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:00 +0900
Message-ID: <20261013151734.3177690-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081807_483979_9CBD0147 
X-CRM114-Status: GOOD (  13.39  )
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

clk_mt2712_apmixed_probe() in clk-mt2712-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt2712_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 54b18e9f83f8..087cf574bcdc 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -129,6 +129,8 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 		goto unregister_plls;
 	}
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.56.0


