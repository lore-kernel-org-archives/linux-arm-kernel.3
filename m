Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AC1CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fz/KT7FZQnrnf1XyyeQ/9bz8jLknhmPBerRCaK0Q4Go=; b=ZFIf8Jb4M8+uJI2342rRCpdBCb
	udOkhWQG07Rsw5RwbM7iIgWF9XJOU0ic5QSLHaoXgu/ua7Fl6jJR9taau8VmAUqYbPiKIGL34Y5GY
	r1c43MrD7ahffFJbQUnG36x7nK3w3m9BNA/LM94DGUq4QUzJZb2cIqDFA2W+Eq+TSQpmQPRPDRl5Z
	RKqsQUI9GYKoPqmc3srfTdehZpNbkmsRVsG8K6Hl6ivhqQERnHbqcsfHU39hsUsAkRqRTerPfvxFA
	9KUEYq3LAkqk8D3mHj+zNvUu1MOj+YVX2i2nKgpjYhLP+zO3su7/ViTbscRt1htDfN76Ninw+JeqZ
	DfQuYbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGm-0000000DG0V-3Sk1;
	Tue, 13 Oct 2026 15:18:24 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGX-0000000DFps-089d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:10 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-88b7d853b11so1969829b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904688; x=1792509488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz/KT7FZQnrnf1XyyeQ/9bz8jLknhmPBerRCaK0Q4Go=;
        b=EUvJqYKpLOstHFghLW6WtmUT26TML2chU8G/r6tQbhbZXxZAqsZsKJIylHMmcnPmbF
         RMP3GHqD8merb6ZvoR5U+h98aTdQOrFwgEHwXtS2TshWeG0v6l+SqA35stjFV06Ih57E
         12Hw7PuIg2bWZdSCwDBwynHfgLaCUmj/VdYmZvSlu4nvf0CQlXWGcjscj02g5xJmO3fh
         2z/nRIvxewTWHIe4j5F/b8f7sISayVs+Be5gpFHJVJY58JrZCeOITmZMrb04Nkr7JKcv
         tGqBpgY5y5HG57k8/LCVBGtf/vTv2HA1kUZrsfkppxXcyZVISAf6dhP/zPaF/YskZCyB
         6X6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904688; x=1792509488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fz/KT7FZQnrnf1XyyeQ/9bz8jLknhmPBerRCaK0Q4Go=;
        b=yH5ycshVBY7lQzZxvctrRLNjBaQaChqnWKzBPuvNKe/c2vZaYrcarYsjeQdYEMKnbs
         mg0ESzrSYQzKK2Z8aDmxAtHs/9kkGh+L/QYJvrlkO38inqqqJ5++3uj4auy3pj2N2eZ2
         DAXe9YB25GEYO+HD4H8JlIlVLCK/+yXfuapMUut4kfmNPYXSVpA1Q0rfAFJ5oe9gOi4x
         fzdhKclVLQ1hlZOFjwlXJJV/nawO91YwD6tCAQKzgSxJfLCN4KIPQnOV7vMF1MsynszF
         F0Ag5DTGr3pz2S6uNkbzQgoJ2tWO0H0GiqYOWRFP8XHnDHzXBVUE9knRd9czJf3elf+J
         TUjw==
X-Forwarded-Encrypted: i=1; AKwUvBwLsHYckos88d5YG9oujwJ6NkIskuuzhs+/eKWOLzhw3gFCml9i1CA2w0Jy2IsOl1wgyn7+f5bdhDWxFUt6khIX@lists.infradead.org
X-Gm-Message-State: AFq9FYJcMezbf8+ahNYNnfCS1sfzt1VO3QiBjsCyjHUssFbdnox1IuMW
	tyPfQPGeo+d87wGwC2uIDqXPAp7WunpjE2tTIM4+NyoxuEuIuXmK2VFT
X-Gm-Gg: AYBFou3dYJ+VFbBUQOgy8XDB3GO1ADGHAhmEwbvCpoEHS7i2+lqcRaM2IRhQIp+xPHF
	xxgY8sS2QGnwHBPxtnOMinHCbZHI/d0CpNeFiRpvLcdNucG3AOg1Lw5x38ghoKFlHQFX86pk5LK
	pTw3g58D6Jht9nTIMiN27FKmMR8FafO4Bo/yfQxwK5RkD+t5eMc0Ei+rS8T71VlW4t6fyGCAwxO
	RSAyCrlMnhWcrbhaie+tJdE+3/s8OVzajMHdYb5/vl+9oh8+nBsnCV6r1VPyAbN/F1Ug/ZKXeqI
	wX7dzXbR1WkixkfLYnwyoOb2AtbvlzUjZK8nQ5mhUmn8/8Qa0ACDiBx7ykv+T8yuoTRAuzo5OfD
	NkWqaWXYU8BHxwsa9TFi/NgCDyaW5R+PMbdrAq9vYkxccUv7G6FXYL1emsHnn981PZhjixDnQSL
	mhEGwxpbrDkpOH+iWWOU6rLs4+XahNJmdObqgbXSNIRIF3rOo1TYg9SP/SsBk5BhmT+3RSD2G8F
	3CZHs/UAD0Jhijh95ReFtKa30X1
X-Received: by 2002:a05:6a21:4eac:b0:3dd:a195:fa21 with SMTP id adf61e73a8af0-3e16bf54ae3mr10356368637.70.1791904687938;
        Tue, 13 Oct 2026 08:18:07 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:07 -0700 (PDT)
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
Subject: [PATCH v2 02/35] clk: mediatek: mt6795: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:01 +0900
Message-ID: <20261013151734.3177690-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081809_116045_AC4EFF01 
X-CRM114-Status: GOOD (  13.69  )
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

clk-mt6795-apmixedsys.c, clk-mt6795-infracfg.c and clk-mt6795-pericfg.c
do not call platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..239a3f5e1760 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -175,6 +175,8 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	dev_dbg(dev, "Performing initial setup for MD1\n");
 	clk_mt6795_apmixed_setup_md1(base);
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..914bb069aa85 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -116,6 +116,8 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index d48240eb2a67..27d0ef7d7b2f 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -125,6 +125,8 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_composites;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_composites:
-- 
2.56.0


