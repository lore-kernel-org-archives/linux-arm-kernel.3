Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52C5CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 00:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vca/CKDASMzwEknu94jkYwLr91umSwU/eeXq3GdHWUE=; b=ONuy44bfJg8Eprliq5lZGbn0uL
	5rmY3jO4bBHmlW00YAX7xRw3cU5Jx9F15sPkW05S6FCFGojXkJRDIs06tq8JEQjJY1K4KGpOAdGDR
	xv4vQOzwRy7Z3bT/p++iYoss1kGzd6l6wu7Yt/xYyd3uCWbJBbYmGPFPIWxoYKW+ITjfCeyctW83B
	zDXoryXLWvE9aX3t/dxzj4uQSxaEpaUCU0JFhuQVmcOirFDvNiwO9CJqlmyeaVoTcgCt1rdJ/IvG+
	icpjZbPs812VDF22BAKx1Yrfmvaz2ExHyXJsb1ZIYOv485wRNpqqWwG803S0DfjrVg+tJ7bYyi/Cx
	LMp7qocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbSxp-00000004G37-1Zlx;
	Mon, 22 Jun 2026 00:56:37 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbSxm-00000004G2R-2txf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 00:56:36 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-37c6cd1ac98so3325820a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 17:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782089793; x=1782694593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vca/CKDASMzwEknu94jkYwLr91umSwU/eeXq3GdHWUE=;
        b=ToKLPfU30MrnN1E2zQJit7c36bE3o6q50TswbNpfHziSytbtyUG/1+FDB0qPXPBNf/
         ARSurhl1DK+DlKAwu9k04F3vX7DPIOf5klCLBc9h+WSzs3fZTwfsc101lsUI+2B2qgcy
         U6kFXLkPfH+bHT/YsL7Vbg68mRM9Q6mNIxkrvNqTgd2LAT9+dovaaOWwBHAsXSXFSr2X
         XDYnVgxHIa06+iVDk5IT4QuKm0zRwfFL7GuwOX0x9y0V/VeUMFkM0jp3btSELvPolHxB
         xK1FAX5vXPvE0n6bXxFYgUDkwspTrAIjoAO6p4wEaw/YtoQCNqYlpd8iAKZGunrHtIGO
         w+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782089793; x=1782694593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vca/CKDASMzwEknu94jkYwLr91umSwU/eeXq3GdHWUE=;
        b=ck9aa1Bsn0u7MmUw+qC9y6EQw3eu90xvmbdflrwuCOhzNBbSkYatYcoM87ngEMQYmd
         m/c68AFcp4Iu3kTZWZ13xijpDRDch68ZDJSilnFCeC41c+YohzJcG8TV4rNedUGeqVj3
         jVuROtJloapPLRu3UdrTbb8VZBV0mjZPE3J8OytDD8tt28WS6L0Zf1qvprFnoEDmcFt1
         VhR5GtrGDWpewt5PTZSCJNOQlinq8EweR21rkGvHt80cN8/hTI4KbeRaOJ1CdXmiIYTV
         Mqo6hg9zMytsrh9DqRZJLh/3CJqRIoSugJRtm1TtEU17C8tcA24cLtKd3J1sIvOOHFm8
         tLhA==
X-Forwarded-Encrypted: i=1; AHgh+RrQDQkMsm6nezbKhJvg9kQ8bLwyEVPY1nPkN064rjqlvqfMS67MPyFLtGZYP6yQ9c7Buqw8x2lz88rmCZOIUl1R@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1GNgycB4tiPocB9uG8qNtMVD/8srj+LkN3LsyvUmX43VECU0Z
	XGSGJjNq8nftyhsZOwIMxilAvdlY/tKHkeT+piQ83UhQ+fcvvWRuSESUU5FLJA==
X-Gm-Gg: AfdE7clXFuqe/DDt6QtlQ+b5gUj6MMZ+h0F65jGbJmpHBtbjeHkrYuhf8MFgCTG1QJn
	GHOrQGrNOGvNP0XtJzYIR0QcpoABoGx4KqksQEw42CrjtkzVHaq+AwkXKmk82328OOiDopah8cl
	BeYvjjRj+dUKV+qFY6DYnSAqO5RPvrmE38jibESgOx8pyxxMhXgIJbQ7FRz9eThUTk5FDTJ1Zpu
	i3RlRtFi+ss9aa2lnmJjWl/P99IKY/oyhNoBdVByOZkjNvnfrsYX/0bnjMFtoEtmbvguFUo1Fzh
	PuPGnbbi3alqTQLywvaBZDcSMS3LyFKNUIcTD4/A5xsdwX2NlNzcUMSIU55TwcSh4VI8U1Z5mIj
	kFtezpDbSu9QbQJPU0I2kUnYivoaNoL1uNrHFIc0nikbfJJPftO/wLc0V5DtN5QDtgYrpBFIhoL
	I0+6bDHNnljJIhdv+g0THWdiYgPyMlLmngywhNXhv+eA0Kf/Y=
X-Received: by 2002:a17:90b:1d4c:b0:36d:ae6a:22f4 with SMTP id 98e67ed59e1d1-37d1e8c9b8fmr11813445a91.15.1782089793457;
        Sun, 21 Jun 2026 17:56:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc2c8d829sm5441326a12.1.2026.06.21.17.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 17:56:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: rockchip: rockchip_sai: Hand over hclk control exclusively to Runtime PM
Date: Mon, 22 Jun 2026 07:56:13 +0700
Message-ID: <20260622005613.21870-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_175634_743383_A323D04D 
X-CRM114-Status: GOOD (  17.14  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Although switching to devm_clk_get_enabled() in a previous patch was
tested successfully, it introduces overlapping ownership of the clock
lifecycle. Since the driver requires early register access to read the
device version during probe(), enabling hclk at that point is mandatory.
However, relying on devres for automatic disabling at unbind, while calling
clk_disable_unprepare() manually at the end of probe() alongside Runtime
PM's autosuspend, creates redundant and overlapping clock management.

While this mixed approach might not trigger errors under normal test
conditions, it is architecturally sub-optimal. As stated in the code
comments, Runtime PM should exclusively own the clock for register
accesses after the initial configuration phase.

Clean up the design by:

   1 Reverting back to devm_clk_get() to remove the implicit devres
     enable/disable behavior.
   2 Manually enabling and disabling hclk explicitly only around the
     early register access before Runtime PM takes over.
   3 Dropping the stray clk_disable_unprepare() at the end of probe()
     so Runtime PM solely owns hclk afterward.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Links: 
1 This change is based on the discussion around manual hclk handing during probe(),
  as raised by Krysztof:
  https://lore.kernel.org/all/20e4754b-ea9a-404d-b529-ec44a7263cbf@kernel.org/#t
2 Background for the earlier devm_clk_get_enbabled() conversion:
  https://lore.kernel.org/all/2818018.CQOukoFCf9@workhorse/

An alternative approach would be use devm_regmap_init_mmio_clk() and let regmap
manage clock enablement around register accesses. If preferred, I can rework the 
driver accordingly.

 sound/soc/rockchip/rockchip_sai.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index a195e96fed0a..ebb491fac77d 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1438,20 +1438,30 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->mclk),
 				     "Failed to get mclk\n");
 
-	sai->hclk = devm_clk_get_enabled(&pdev->dev, "hclk");
+	sai->hclk = devm_clk_get(&pdev->dev, "hclk");
 	if (IS_ERR(sai->hclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
 				     "Failed to get hclk\n");
 
+	ret = clk_prepare_enable(sai->hclk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
+
 	regmap_read(sai->regmap, SAI_VERSION, &sai->version);
 
 	ret = rockchip_sai_init_dai(sai, res, &dai);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");
+		goto err_disable_hclk;
+	}
 
 	ret = rockchip_sai_parse_paths(sai, node);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
+		goto err_disable_hclk;
+	}
+
+	clk_disable_unprepare(sai->hclk);
 
 	/*
 	 * From here on, all register accesses need to be wrapped in
@@ -1482,8 +1492,6 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_put(&pdev->dev);
 
-	clk_disable_unprepare(sai->hclk);
-
 	return 0;
 
 err_runtime_suspend:
@@ -1493,6 +1501,11 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		rockchip_sai_runtime_suspend(&pdev->dev);
 
 	return ret;
+
+err_disable_hclk:
+	clk_disable_unprepare(sai->hclk);
+
+	return ret;
 }
 
 static void rockchip_sai_remove(struct platform_device *pdev)
-- 
2.43.0


