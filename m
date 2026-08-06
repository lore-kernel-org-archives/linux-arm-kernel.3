Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE31C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 23:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hw1ZFxLKa2lyCMPhsVdiZhdCA+z9r+BreiBYhz8zEqE=; b=G4Lkggc22SCJH35/95dMF7TVaC
	x1m/+/itUUet9yBtnS3fhi6xA3eyQ26X8KzsGOZ23fP3F+izHmWfcikZfUePZ5WnNRwb1tj5GPaVu
	a50WEsD24YteEtKzYOBrFt5obCbK7mBGPiHyYvd4Y87Hkg97TDnRG+7rSLXQCqgwumZOyWhpPuyCO
	YP1fxX8Sh1IpRnVHZq73j3HrHiCvQArUvqTqlyZTOmDrvP+hsoqyoZILv32UsqDYkVoPQZE1jHiwF
	IDDTbGZkscTuWeupj5Oue864jdYranq60b9HzNfHxdNVU9JFmsQhS9PqK65f69/NIHSNue2Fya88n
	58gopLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7fH-00000006rQ9-2sNF;
	Thu, 06 Aug 2026 23:38:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7fF-00000006rPl-2cPI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 23:38:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso29918215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 16:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786059496; x=1786664296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hw1ZFxLKa2lyCMPhsVdiZhdCA+z9r+BreiBYhz8zEqE=;
        b=S3NLvdvT8wdV3EccJ87EXkVrja63YT1i6nHB9I9tkynkEosKumtJ+IGlsI75rh9wsc
         qSS5Zm0d53ohNbel+wdjJzVepN7Ulqr+LOXrW7Bi6bROQqBjVDY1x6QzIn3xpNt7kdYm
         UGh1Qc49nsBTFar2NNJJXxNAzHTbJ0Oaohc+e2vqffdoMBLgnCv/iTUKkgFlFT3/Seee
         cwAynhlsOC5Ez4J90gC37OJ0nXLyKTSbO3VbqpDOfc4eK9SEW3Rae59P0B4yxrgJkRpC
         Bn9dFm5ItTRLGBhQNxY3hD31bvEgLT/cgrGD3P5/ejUi8XOCki9nC7V3uTbUdnbVeop4
         5MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059496; x=1786664296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hw1ZFxLKa2lyCMPhsVdiZhdCA+z9r+BreiBYhz8zEqE=;
        b=Loa9jIX5GF8jOgkeQbwT8tQlfW7KpX9HFnpmZBo32xAM7U/oKp8XroLd5paIY1HxYB
         3JzQwSfKcv6TFGpswt49CSJ4oN7NFM9xMoYY+xhOIoWfmD5g8XNR8b1qPK2aBjScZELM
         qvm66iMrIUz/pxItPyujHHnQ/YcLLJt2anmVWriT2wPrf4NR+FhMezaN/huNnxfismXo
         UFgEBe2/l01b/lzBr/sy07Mpxfe3izSjx3oQJnqUNVXdNw5RsbO9lNrOrcTge5It5r58
         40SZzT7LyTyKG5pS+f4qbNrSP1Hs8cclByPKKNAgHJaQBiGEQYg0Q2fff5F4pbOJ5CGT
         JqnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJbOOgSle7KKq5FEYGpbx/rSZjavERvVwRdQf/xH5Spd4skitPK2kL8qhThPUq3VH65YcmH1DgO9gNdSxOw+/1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/nSLuIhvvMNJFtUEvHa4B3HuBut/CdIhBmv5IwVZjElzjzvC1
	S9lwB0Y5ji+CaqSOioRI1NuLpf0RWt6wDItgXY0S0DD9Cp4CBOWiuZuO
X-Gm-Gg: AR+sD13sh2mjiVwVERC9TjYviz1xCKhoB2eI5CmflE/KK5h8m0VF7SlUv7yOglaT12N
	2z4GtYSdpQNJgmSln31zuzqT5Sh/jOzP1OAS6h39C1NEobR/veM5cYZfX7WPh4Cdg6WQHTwvRL7
	A/yAxow9p3x/TNYvikQ+sj185/QH58TYhMs68fbsYzyz7sLwYNFBn1gBhbmGRXxy2/A6qRIvtko
	oeLgowmlWSJHAVcT/sjDwysKk7DlzQata7ZNfoRLijPUTkAOTlGMHD9A8Dz0SM9vTvXM14T4SMI
	Tf6JA54i+HxbZvXr3/8K0UcDNvUHQ9HBSOKiasE9sJsSgqUuB9MSKxdlUhyLyA3tSA6WzRh7LHh
	6nwADPiLv0AKy9pyHp24ZvEsKsEXMYzKKAyZriPUQeWsQQUXtGJjDND4N8+Jh5Y06fQOkk75azJ
	sWnvMbtjeSkTOGPSt4dfeHtANIw41SBokeWLFteSZh9Yqyw3HlsbhCjzg/zXCIvBd2QrfHEsF37
	abDovNPq6JfLwsHf8xpr+A0sSjREr8CJ/u6hz/85cKV4APpjggvqemI8MQxtX0Ro+OGoU5yGfyo
	tpUbUVC/sOWRg3uuZQTiWco69zAjP0PY1zne64gj2fuP0GhQ
X-Received: by 2002:a17:902:dac9:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d106da916bmr50227695ad.13.1786059496507;
        Thu, 06 Aug 2026 16:38:16 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4e7e7dsm1022865ad.73.2026.08.06.16.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 16:38:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: xilinx: formatter_pcm: use devm_clk_get_enabled and simplify probe
Date: Thu,  6 Aug 2026 16:38:12 -0700
Message-ID: <20260806233812.31851-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_163817_689903_28E1B567 
X-CRM114-Status: GOOD (  13.58  )
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

Use devm_clk_get_enabled() to let the clock be enabled automatically
and cleaned up on unbind, dropping the manual clk_prepare_enable() and
clk_disable_unprepare() calls in probe and remove.

Simplify the probe error paths by returning directly instead of
jumping to clk_err, and use devm_snd_soc_register_component() return
value directly.

Assisted-by: opencode:deepseek-v4-flash-free
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 47 ++++++++-------------------
 1 file changed, 13 insertions(+), 34 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index b50306b0fc06..948bc604738a 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -593,24 +593,17 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 	if (!aud_drv_data)
 		return -ENOMEM;
 
-	aud_drv_data->axi_clk = devm_clk_get(dev, "s_axi_lite_aclk");
+	aud_drv_data->axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
 	if (IS_ERR(aud_drv_data->axi_clk)) {
 		ret = PTR_ERR(aud_drv_data->axi_clk);
 		dev_err(dev, "failed to get s_axi_lite_aclk(%d)\n", ret);
 		return ret;
 	}
-	ret = clk_prepare_enable(aud_drv_data->axi_clk);
-	if (ret) {
-		dev_err(dev,
-			"failed to enable s_axi_lite_aclk(%d)\n", ret);
-		return ret;
-	}
 
 	aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(aud_drv_data->mmio)) {
 		dev_err(dev, "audio formatter ioremap failed\n");
-		ret = PTR_ERR(aud_drv_data->mmio);
-		goto clk_err;
+		return PTR_ERR(aud_drv_data->mmio);
 	}
 
 	val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
@@ -620,7 +613,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 					       XLNX_MM2S_OFFSET);
 		if (ret) {
 			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
+			return ret;
 		}
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_MM2S_OFFSET,
@@ -628,16 +621,15 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 
 		aud_drv_data->mm2s_irq = platform_get_irq_byname(pdev,
 								 "irq_mm2s");
-		if (aud_drv_data->mm2s_irq < 0) {
-			ret = aud_drv_data->mm2s_irq;
-			goto clk_err;
-		}
+		if (aud_drv_data->mm2s_irq < 0)
+			return aud_drv_data->mm2s_irq;
+
 		ret = devm_request_irq(dev, aud_drv_data->mm2s_irq,
 				       xlnx_mm2s_irq_handler, 0,
 				       "xlnx_formatter_pcm_mm2s_irq", aud_drv_data);
 		if (ret) {
 			dev_err(dev, "xlnx audio mm2s irq request failed\n");
-			goto clk_err;
+			return ret;
 		}
 	}
 	if (val & AUD_CFG_S2MM_MASK) {
@@ -646,7 +638,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 					       XLNX_S2MM_OFFSET);
 		if (ret) {
 			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
+			return ret;
 		}
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_S2MM_OFFSET,
@@ -654,34 +646,23 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 
 		aud_drv_data->s2mm_irq = platform_get_irq_byname(pdev,
 								 "irq_s2mm");
-		if (aud_drv_data->s2mm_irq < 0) {
-			ret = aud_drv_data->s2mm_irq;
-			goto clk_err;
-		}
+		if (aud_drv_data->s2mm_irq < 0)
+			return aud_drv_data->s2mm_irq;
+
 		ret = devm_request_irq(dev, aud_drv_data->s2mm_irq,
 				       xlnx_s2mm_irq_handler, 0,
 				       "xlnx_formatter_pcm_s2mm_irq",
 				       aud_drv_data);
 		if (ret) {
 			dev_err(dev, "xlnx audio s2mm irq request failed\n");
-			goto clk_err;
+			return ret;
 		}
 	}
 
 	dev_set_drvdata(dev, aud_drv_data);
 
-	ret = devm_snd_soc_register_component(dev, &xlnx_asoc_component,
+	return devm_snd_soc_register_component(dev, &xlnx_asoc_component,
 					      NULL, 0);
-	if (ret) {
-		dev_err(dev, "pcm platform device register failed\n");
-		goto clk_err;
-	}
-
-	return 0;
-
-clk_err:
-	clk_disable_unprepare(aud_drv_data->axi_clk);
-	return ret;
 }
 
 static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
@@ -698,8 +679,6 @@ static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
 
 	if (ret)
 		dev_err(&pdev->dev, "audio formatter reset failed\n");
-
-	clk_disable_unprepare(adata->axi_clk);
 }
 
 static const struct of_device_id xlnx_formatter_pcm_of_match[] = {
-- 
2.55.0


