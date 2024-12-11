Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FC4E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nz4TyTapXzMqxCqKapCIOkriVuwdNpBfQogyQAqNO5U=; b=PVFRed4pYC3fxl5vkVuFLMjJFO
	i3CUqmoYUsIHpLOlW11dIp4ZWBeE5poqUm8Ou6Y70gbgAAmbxIgBH+4xRgH1nLA0s4SGAubcf86j9
	JHtoZb9KmARcwDbL7WfUs5Y04Ma3/wgG5BXa6dIGDfTcwZFqnjv433Cnb15rztLF8u8biJkryLKKn
	WuILfBq7KJrp0miF7v6y2rvgGxMEeM0I/L4av5LG6oLVCArvmkthWGlRaXfx99qUfRsbGPtLzaEth
	2dEgc5c75/DOv1YIF40eLUMp+hD8F/GMVEjOeRbRxzeZJBSz+wHsr8h31Nhlu/VECvCGjyzlo+ctR
	lZVx5WJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLV7A-0000000GJ0O-2fAe;
	Wed, 11 Dec 2024 22:23:28 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLV65-0000000GIpk-1Wxe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 22:22:23 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 240E3A03B8;
	Wed, 11 Dec 2024 23:22:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=nz4TyTapXzMqxCqKapCIOkriVuwdNpBfQogyQAqNO5U=; b=
	K5XQ3o/flOfsIMGkB0/xwZWBo0yU57mh6R0LLA5a9Kps0ubENp2mRsdi0DKUl2Hv
	w75bGzwlvDSMj4dlKoQUKXmkujGO6ehbsVPsdnfzxh9q1xgftI3dShXSH0H+CZWt
	6Ext/LxKqOkxFhRHE2ZEIveAojinCCKqzuxzq5MmDrlNWR10cOJ3N/XAi0CVS+KS
	Gi+1JaLD37SzTDJC4jl8YHiB34hohS8g5sWsEi7CWHcs7wwVahBDu8ChVkcv00xm
	n06I/jVIUJ8Pd2douQcv0P/h0oVpGIgDB6A+rK2+y5hE7QxbgaS5/MuYSfdvnVpm
	gJleH+K30yGqKJ8oSYA1lhzmUYHCxw8A8wqMvLK3+9uLnajr3dYFndyQtUheJmXO
	Ztnl4pbF5HnxkC5A9dSsbZq9ReaBqoHHq8Q47W90heGN/9hU1dctTIHxZtNMz8CH
	JoElni/DlBxEbj2i1saW3UomxRjYePDrH7IDzH0WA5f5+wCX/BUiJAebht5juJia
	29nfIBUPU45KUvcBYuzjK7c+ensyzAdxPef+q9DZE9pxqwUOU9MK1vQ8vNucUOl4
	DYb2ayR7KDgPYyQZjtbPasiEI9PaCRglUuz7uPEo18/k3pJ9wgfe6wywAvP49no5
	1eSVKByaUcCBu7+p0inCp16dOhfP5g6I4adBbLBjXas=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] ASoC: sun4i-codec: Use new devm clk and reset APIs
Date: Wed, 11 Dec 2024 23:22:05 +0100
Message-ID: <20241211222205.1915027-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1733955729;VERSION=7982;MC=3794370839;ID=394182;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485562726B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_142222_017478_D27F9E30 
X-CRM114-Status: GOOD (  14.66  )
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

Clean up error handling by using the new devm_
clock and reset functions. This should make it
easier to add new code, as we can eliminate the
"goto ladder" in probe().

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 sound/soc/sunxi/sun4i-codec.c | 41 ++++++-----------------------------
 1 file changed, 7 insertions(+), 34 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 3d6156fefe75..b0ca293979d7 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2273,7 +2273,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	}
 
 	/* Get the clocks from the DT */
-	scodec->clk_apb = devm_clk_get(&pdev->dev, "apb");
+	scodec->clk_apb = devm_clk_get_enabled(&pdev->dev, "apb");
 	if (IS_ERR(scodec->clk_apb)) {
 		dev_err(&pdev->dev, "Failed to get the APB clock\n");
 		return PTR_ERR(scodec->clk_apb);
@@ -2286,8 +2286,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	}
 
 	if (quirks->has_reset) {
-		scodec->rst = devm_reset_control_get_exclusive(&pdev->dev,
-							       NULL);
+		scodec->rst = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
 		if (IS_ERR(scodec->rst)) {
 			dev_err(&pdev->dev, "Failed to get reset control\n");
 			return PTR_ERR(scodec->rst);
@@ -2323,22 +2322,6 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Enable the bus clock */
-	if (clk_prepare_enable(scodec->clk_apb)) {
-		dev_err(&pdev->dev, "Failed to enable the APB clock\n");
-		return -EINVAL;
-	}
-
-	/* Deassert the reset control */
-	if (scodec->rst) {
-		ret = reset_control_deassert(scodec->rst);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"Failed to deassert the reset control\n");
-			goto err_clk_disable;
-		}
-	}
-
 	/* DMA configuration for TX FIFO */
 	scodec->playback_dma_data.addr = res->start + quirks->reg_dac_txdata;
 	scodec->playback_dma_data.maxburst = quirks->dma_max_burst;
@@ -2356,7 +2339,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 				     &sun4i_codec_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register our codec\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -2364,20 +2347,20 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 					      &dummy_cpu_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register our DAI\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	card = quirks->create_card(&pdev->dev);
 	if (IS_ERR(card)) {
 		ret = PTR_ERR(card);
 		dev_err(&pdev->dev, "Failed to create our card\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	snd_soc_card_set_drvdata(card, scodec);
@@ -2385,17 +2368,10 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	return 0;
-
-err_assert_reset:
-	if (scodec->rst)
-		reset_control_assert(scodec->rst);
-err_clk_disable:
-	clk_disable_unprepare(scodec->clk_apb);
-	return ret;
 }
 
 static void sun4i_codec_remove(struct platform_device *pdev)
@@ -2404,9 +2380,6 @@ static void sun4i_codec_remove(struct platform_device *pdev)
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(card);
 
 	snd_soc_unregister_card(card);
-	if (scodec->rst)
-		reset_control_assert(scodec->rst);
-	clk_disable_unprepare(scodec->clk_apb);
 }
 
 static struct platform_driver sun4i_codec_driver = {
-- 
2.34.1



