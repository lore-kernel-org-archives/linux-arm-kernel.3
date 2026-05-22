Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14E0CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 02:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7P3tHPmrG3wLPqmsJl2HC3o69eg3JUch5W4/s30Hz1E=; b=1FXsCNij7haMAVsAfj6wIWf1up
	DY2q1c5mh1tPpT8X6gfkNI5peN5L3IPWA4IGyNQ0ugIhEjvylzZVxvvpBbnfd5mJhjEsegtEGo55v
	6OxVYWObiWKK+xYxubGuYHW7DlDpAPpm8eK24UQoU9ocBpzxVpltyLDophjU56w6lfWxYA4er6OBA
	Fy6P7hDEFXMgAB3qfxd6Agdj53o77WiHIYWScTI1Zt/0naKCPnMIdFpUCjicR58HSnplGw1zwPPEe
	fxSQ/rpenabsUdEPVwbUImu4D1TZ1lLScjE5aGChOK/AVnlcVny/1nD/g9ZVD8CV0l6au56pSVqru
	eWm29AQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQFeX-00000009Yu8-0URa;
	Fri, 22 May 2026 02:30:21 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQFeU-00000009YtD-2XBF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 02:30:20 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1363e78746eso1654114c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779417017; x=1780021817; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7P3tHPmrG3wLPqmsJl2HC3o69eg3JUch5W4/s30Hz1E=;
        b=oMJgMwPMS5cAoLnQ3sC1RLaXlk1nSlG2/3b7aomF7LVnyYOjxM6XRYGAuRxX40JcNQ
         tXS2Cj2SGbWZsiJ3l76H8tZz84IoB45B5xeoUs9uqwe7ObUBE9wpVbDEkNvKXU5Li3MP
         n9JQCeG/7RpcJeOSj5v9gk59trKDQggHV1XRY8S9SV/xH4puq0rUwCYYwyRQW8+TjPTJ
         Mo9P1EDdIJKxfoop/pTTaDPh5YuiGMWSzZeZo1/7OuToICgH7JVfR5BSImGq1W2yJVbQ
         lZS1/KvFCC0g5W21LhwS826rRGc3EKsOItjb4zILu/sVtDKQE4MZuSHNlEDEbgCWs6+R
         nfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779417017; x=1780021817;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7P3tHPmrG3wLPqmsJl2HC3o69eg3JUch5W4/s30Hz1E=;
        b=aVPo2rl+DHCvC5QTL61SglxkGuIU+sxADd4FEFHT5cZJ7p2KL2ww9V2Xfs2nDHz8+Z
         IWzGrT+kyiEDPboWGr3sSvrKiPb1DvZ441zIvIpWtgLtwe9t5heWiTDD8oeil6VYve8d
         GvZXt40Ep/g0ewL89I3Lbwq/u3Rp+kOm5xmJafUaibJYxKt+NYTDGaur1RLH9zjPLroT
         nG/8cwS5O5i4UB7BlxEZIMB1xwBaEnW5sdTozi6PNJ+oKMegyZyFEkaoHiQr8wO+6plQ
         TfDAC6d+a77NE7R2Io5Ho1iUOhkIo01kxDkkDU+Whx6AZSPE9LW50mbW6/B/PrwyUsPt
         xIRQ==
X-Forwarded-Encrypted: i=1; AFNElJ86NfNN6vaMIiO/v8e0WGnAO0PWY2sQJJFSQz+Wub2pMGYahDfdx3g49SFaNMg06JV49c24Me/FVFuuHzJU8LDT@lists.infradead.org
X-Gm-Message-State: AOJu0Yww+YiG4i/G2lREFztuXBQNdwBuLnBQyM0gPfUrN9wqFrvUZEWy
	xKf9s2JJooR8MWqrHNfYXB2uGtLcPa4eJnCldfxKfOtnsre/2R9vdMEB
X-Gm-Gg: Acq92OHWwR3rmXStgF3ypsJGdQpv2IVX8HawmyDPdm3egyKD7c4/ztQyA8NHmA7ERxQ
	8duzohtF946Hqg524CJCjwL3eFmsA6qW0c7GY9idtGc/0+oMPxicy6a2QS17f+tdbpLQVpbA9vI
	lUFT1XF9g3yobL4csl9Iptn+o2Rrqeq37BO4gy7ywvYJLzzCsSlsK1TH1hAQsY2/F5LpLfh/4tS
	eKCt2jytPFIb5kiHLkggnrPPG7AGAsyJ0m2GO98vIK5E8CwyBvrAEcUXu/G34rnuLJ6PQPyIeUR
	E9XKsxB+p5MhHCyM5dGDRvedvdxtgutA5k7xlop2B/sjJ3pl3iF57kp+eUxdMJWVyLCfaCbZi9V
	cIoAPDjXzlQ0ACifhbjW7QbxJzRw0YkVRfrSf60OzNKw7zaCBXMSMVHHoqulnx+ZmOzeuAzKcMO
	ZOnVNj4a0gVBwxJ1AdHjQ7yMJap/VdaJP5f4OpPu+sqYubYhtEkd6GJyqUN3e5eSQLHGTG7KhSf
	g==
X-Received: by 2002:a05:7022:661f:b0:135:f2aa:46da with SMTP id a92af1059eb24-1365f812eefmr696894c88.16.1779417017083;
        Thu, 21 May 2026 19:30:17 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13669c6a2adsm293024c88.0.2026.05.21.19.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 19:30:16 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 21 May 2026 23:30:07 -0300
Subject: [PATCH] ASoC: rockchip: i2s: Use managed hclk and runtime PM
 cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-asoc-rockchip-i2s-devm-cleanup-v1-1-9319bd781393@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywrCMBBG4Vcps3agDaagryIu4uSvHS9NyNgil
 L67UZff5pyVDEVhdGxWKljUNE0V3a4hGcN0BWusJte6vvWu42BJuCS5y6iZ1RlHLE+WB8I0Z+4
 lRPhhf/DwVCO5YND3b3A6/23z5QZ5fau0bR/FocZRggAAAA==
X-Change-ID: 20260521-asoc-rockchip-i2s-devm-cleanup-6cade5f495e5
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5256;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=TMV3OUjSiKWrVH9DS2Bb4U32yk1kAQtbOJI6PQhF/+k=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFn8+7c+Pl3a4dA4+WnT0pC6856eb3pTIvWsll/tLAv/s
 1bePsGxo5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACYSK8fwz9R8pszmW4U/8iYG
 5VU7t8kESQb88EvrWX5vh1mvgrwXB8M/5cWzy6b+X9q3dUegnmSFT+rqjJN+wUa7/SOWc37vVvn
 MDQA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_193018_764360_141494E3 
X-CRM114-Status: GOOD (  17.60  )
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

The Rockchip I2S driver mixes devm-managed probe resources with manual
runtime PM and hclk cleanup.  This leaves the remove path doing runtime PM
shutdown and clock disable before devm-managed ASoC and PCM resources are
released.

Keep the bus clock enabled for the device lifetime with
devm_clk_get_enabled(), and move the runtime PM teardown into devres so the
unwind order matches the managed registrations.  This also removes the
remove callback, which only existed for cleanup.

Use a devm action for the final runtime suspend and register it before the
managed runtime PM action, so teardown disables runtime PM before forcing
the device into the suspended state.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 68 +++++++++++++++------------------------
 1 file changed, 26 insertions(+), 42 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 49ff86b35ef1..4e3af0f37941 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -664,6 +664,14 @@ static const struct of_device_id rockchip_i2s_match[] __maybe_unused = {
 };
 MODULE_DEVICE_TABLE(of, rockchip_i2s_match);
 
+static void rockchip_i2s_suspend(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		i2s_runtime_suspend(dev);
+}
+
 static int rockchip_i2s_init_dai(struct rk_i2s_dev *i2s, struct resource *res,
 				 struct snd_soc_dai_driver **dp)
 {
@@ -758,37 +766,28 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	}
 
 	/* try to prepare related clocks */
-	i2s->hclk = devm_clk_get(&pdev->dev, "i2s_hclk");
+	i2s->hclk = devm_clk_get_enabled(&pdev->dev, "i2s_hclk");
 	if (IS_ERR(i2s->hclk)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s bus clock\n");
 		return PTR_ERR(i2s->hclk);
 	}
-	ret = clk_prepare_enable(i2s->hclk);
-	if (ret) {
-		dev_err(i2s->dev, "hclock enable failed %d\n", ret);
-		return ret;
-	}
 
 	i2s->mclk = devm_clk_get(&pdev->dev, "i2s_clk");
 	if (IS_ERR(i2s->mclk)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s master clock\n");
-		ret = PTR_ERR(i2s->mclk);
-		goto err_clk;
+		return PTR_ERR(i2s->mclk);
 	}
 
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(regs)) {
-		ret = PTR_ERR(regs);
-		goto err_clk;
-	}
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					    &rockchip_i2s_regmap_config);
 	if (IS_ERR(i2s->regmap)) {
 		dev_err(&pdev->dev,
 			"Failed to initialise managed register map\n");
-		ret = PTR_ERR(i2s->regmap);
-		goto err_clk;
+		return PTR_ERR(i2s->regmap);
 	}
 
 	i2s->bclk_ratio = 64;
@@ -799,8 +798,7 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 			i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl, "bclk_off");
 			if (IS_ERR_OR_NULL(i2s->bclk_off)) {
 				dev_err(&pdev->dev, "failed to find i2s bclk_off\n");
-				ret = -EINVAL;
-				goto err_clk;
+				return -EINVAL;
 			}
 		}
 	} else {
@@ -811,16 +809,23 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, i2s);
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_add_action(&pdev->dev, rockchip_i2s_suspend, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = i2s_runtime_resume(&pdev->dev);
 		if (ret)
-			goto err_pm_disable;
+			return ret;
 	}
 
 	ret = rockchip_i2s_init_dai(i2s, res, &dai);
 	if (ret)
-		goto err_pm_disable;
+		return ret;
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rockchip_i2s_component,
@@ -828,36 +833,16 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI\n");
-		goto err_suspend;
+		return ret;
 	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM\n");
-		goto err_suspend;
+		return ret;
 	}
 
 	return 0;
-
-err_suspend:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		i2s_runtime_suspend(&pdev->dev);
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-err_clk:
-	clk_disable_unprepare(i2s->hclk);
-	return ret;
-}
-
-static void rockchip_i2s_remove(struct platform_device *pdev)
-{
-	struct rk_i2s_dev *i2s = dev_get_drvdata(&pdev->dev);
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		i2s_runtime_suspend(&pdev->dev);
-
-	clk_disable_unprepare(i2s->hclk);
 }
 
 static const struct dev_pm_ops rockchip_i2s_pm_ops = {
@@ -866,7 +851,6 @@ static const struct dev_pm_ops rockchip_i2s_pm_ops = {
 
 static struct platform_driver rockchip_i2s_driver = {
 	.probe = rockchip_i2s_probe,
-	.remove = rockchip_i2s_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(rockchip_i2s_match),

---
base-commit: 40cc9602caf2539369bd3dd7d66ee67e204e75ef
change-id: 20260521-asoc-rockchip-i2s-devm-cleanup-6cade5f495e5

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


