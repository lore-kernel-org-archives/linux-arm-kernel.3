Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33304C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 20:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1hCeXpXWagan4BjDtqiET2IflYSGY8D9XYFgH0KLPyE=; b=rlRq6oeHd51Ncg52+oE39QIF4g
	nGnLTUQ9qf7GBYvghneR5EG69y6jWgPq6PVo6zq0BTOwipnKqD9mwggEkA1AxJWfDssm6T+lrsjb1
	syAPIUIk1ei6DcgF/iwEvsy89KRO/lQaAAabu6tJcQ97Lny2FyNFsea2y1uQIruLoHwIY/qKkmK6+
	x0ucM8NgvUuq4jf0fuxHGfpi/cHg0z0d8NKT1zVAW8quRcZZB9nx4N8rk/ZXf8wHJPHExyqy2BLxJ
	uhlLa/fwRmb0gPg2q7ojb6WtYuwra41L/0dAVnnohvayMGLEvjTH0UaHmI/1K7U8P8HieCnb65wYQ
	j5HpFZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuylW-00000003AW6-2Hvf;
	Fri, 14 Aug 2026 20:44:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuylU-00000003AVk-1Aza
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 20:44:33 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso1271538a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 13:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786740271; x=1787345071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hCeXpXWagan4BjDtqiET2IflYSGY8D9XYFgH0KLPyE=;
        b=FufwsbZqcSPe+IwIOo+B83uayOLqYb5SrrFN1W7AbHBtBI0yh0wjLECiPhMBHcU3rK
         IolmCALQkIU3uEYX382A/UXfbyZQW3j9Ios8acZXqnIfMLuhEnPm2rZsL1Lyfm92hcnp
         fwPRAV6qwAE7xtSc6dtMDH66z9Sde8NJ61kc3CdtvVUPZRHHap4HW4VVaNy0IuWgn00m
         wTHgkpR6bSao08QhUthBY2HFGV8Y1G4sKbPKu8udqTurmKUwGEd900sUvbyvjcCi5zcm
         pvWrKlGRA3xjRawhkxZ9tLsHx7EDE/k6o5JVemaNubOW5+X0nAD1PQ7E9MVcyq7FISzs
         CPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786740271; x=1787345071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hCeXpXWagan4BjDtqiET2IflYSGY8D9XYFgH0KLPyE=;
        b=YQ5mnfF4vZlA0xtho7yr9WCW0V84Vsq1ykLh4tCyIlj9xXWUhaMR7lrIxh/YwPYW7S
         liLA61Wjzo3fZlvDAG7pafb6rlu7H75WJzrY9vvL62vsMwBUqlX1DsoHoS2MW4OYtBej
         LUmivPjIjtFgpw1ch4g9f4KPdn1G2QiMfoa90Wg8aU2VqNUXrP4L/iuQycOQOAtZ+SDy
         zaqnI/lpaNnovL+YXP4Xt5+NskF/bM4m3zt6hlU/WBlwOG5f5rQ3Z2B0ytQnxzIsE93j
         QWhL6+gJAVTlu2RBKrN/A5Sod+EGSSyMmm+8eQuH1+XqnYJr3M6u3XUCVuE8HYsqNOB1
         AAjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoU4opWrCl1rHYy55+ublaUgZyXIyUjbkcLqVZ6RzHdXaayJeHGjWtAd5AWiACufW8w++O41DuGNtNMmGzoFV7x@lists.infradead.org
X-Gm-Message-State: AOJu0YziYPdnUq/nCNPWWJiGDRm7jFVB7TyDdR+sKLjOHtv+YDtgyWNu
	TCj8L6LbmGD8I+Ng4yeXY1io3vXU71VUW6riNF3+Ye7JMA6jNnOKVcOW
X-Gm-Gg: AR+sD1150mOj3cKyiiJu/Z6Nc6onW64KEemFEP/d8CRJQAzILQukovleZcXlemh1icr
	Vlww7rYq3Ei5l0BdJVox8oJxHMa4zMlMeOT9/M+BO8PuYlQ+niD0no4zpwcomwaj2pHGBwnbFon
	NRj5k/moiTCKkjInYjrg0oPNCEritypXcowfwhWUHG4ufY9dUGUWfJKNuF0GwOydV6xAQZ0jfXt
	OKsKGMoNo70wqfA9hc1e1tpSeNIutYAfIL2mKOzyPoE9Sn+t8SRYuSx09qkdRhJNhCXzu34q+F3
	Kbws0WJAnjlYBqaDKsH6PsmQBMNQCnn1taoTdBzRB1XOrBm8Y/yBAmNdA5Ce4Dj//8FNGart8AU
	QXclqsYuWj3oQhRGisdRcwVsGgl3M2LztTOKe6R8A/RCnCuV73CsRYzD/b6nn5fED02nNtCsiOd
	cEV8scFqBLKh4hMEVzpTuZsl0qi/vroMLxgiRqLtMfHi0fUEIOWwXbOur50/uxVDvVlOrmwaDtx
	RGHc+W5+S/sn9UgL22knK7OyEghUvw/k51MtQpOu+tRXwsWP9BGIjb4CXwpQjqr7jao4bUrux0Z
	u5q0Fwp+Q2khRStbv+4IO2JeRd6wcWDvHFUidtg=
X-Received: by 2002:a17:90b:5803:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-3933cb3b889mr10137670a91.8.1786740271075;
        Fri, 14 Aug 2026 13:44:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b71e1f9sm1574288a91.3.2026.08.14.13.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 13:44:30 -0700 (PDT)
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
Subject: [PATCHv3] ASoC: xilinx: formatter_pcm: use more devm in probe
Date: Fri, 14 Aug 2026 13:44:28 -0700
Message-ID: <20260814204428.37786-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_134432_344027_3D4578E0 
X-CRM114-Status: GOOD (  17.47  )
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
clk_disable_unprepare() calls in probe and remove. As a result, move the
clk struct member into probe, which is the only place it's used.

Simplify the probe error paths by returning directly instead of
jumping to clk_err, and use devm_snd_soc_register_component() return
value directly. Also remove error message from ioremap as it throws one
itself. Same with devm_request_irq().

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Michal Simek <michal.simek@amd.com>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 v3: rebase.
 v2: add signed-off-by. Further clean up some stuff.
 sound/soc/xilinx/xlnx_formatter_pcm.c | 71 ++++++++-------------------
 1 file changed, 20 insertions(+), 51 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 3d6f1e4046d8..5f63fb28ea5f 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -82,7 +82,6 @@ struct xlnx_pcm_drv_data {
 	int mm2s_irq;
 	struct snd_pcm_substream *play_stream;
 	struct snd_pcm_substream *capture_stream;
-	struct clk *axi_clk;
 	unsigned int sysclk;
 };
 
@@ -596,30 +595,19 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 	u32 val;
 	struct xlnx_pcm_drv_data *aud_drv_data;
 	struct device *dev = &pdev->dev;
+	struct clk *axi_clk;
+
+	axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
+	if (IS_ERR(axi_clk))
+		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get s_axi_lite_aclk");
 
 	aud_drv_data = devm_kzalloc(dev, sizeof(*aud_drv_data), GFP_KERNEL);
 	if (!aud_drv_data)
 		return -ENOMEM;
 
-	aud_drv_data->axi_clk = devm_clk_get(dev, "s_axi_lite_aclk");
-	if (IS_ERR(aud_drv_data->axi_clk)) {
-		ret = PTR_ERR(aud_drv_data->axi_clk);
-		dev_err(dev, "failed to get s_axi_lite_aclk(%d)\n", ret);
-		return ret;
-	}
-	ret = clk_prepare_enable(aud_drv_data->axi_clk);
-	if (ret) {
-		dev_err(dev,
-			"failed to enable s_axi_lite_aclk(%d)\n", ret);
-		return ret;
-	}
-
 	aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(aud_drv_data->mmio)) {
-		dev_err(dev, "audio formatter ioremap failed\n");
-		ret = PTR_ERR(aud_drv_data->mmio);
-		goto clk_err;
-	}
+	if (IS_ERR(aud_drv_data->mmio))
+		return PTR_ERR(aud_drv_data->mmio);
 
 	val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
 	if (val & AUD_CFG_MM2S_MASK) {
@@ -628,7 +616,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 					       XLNX_MM2S_OFFSET);
 		if (ret) {
 			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
+			return ret;
 		}
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_MM2S_OFFSET,
@@ -636,17 +624,14 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 
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
-		if (ret) {
-			dev_err(dev, "xlnx audio mm2s irq request failed\n");
-			goto clk_err;
-		}
+		if (ret)
+			return ret;
 	}
 	if (val & AUD_CFG_S2MM_MASK) {
 		aud_drv_data->s2mm_presence = true;
@@ -654,7 +639,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 					       XLNX_S2MM_OFFSET);
 		if (ret) {
 			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
+			return ret;
 		}
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_S2MM_OFFSET,
@@ -662,34 +647,20 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 
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
-		if (ret) {
-			dev_err(dev, "xlnx audio s2mm irq request failed\n");
-			goto clk_err;
-		}
+		if (ret)
+			return ret;
 	}
 
 	dev_set_drvdata(dev, aud_drv_data);
 
-	ret = devm_snd_soc_register_component(dev, &xlnx_asoc_component,
-					      NULL, 0);
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
+	return devm_snd_soc_register_component(dev, &xlnx_asoc_component, NULL, 0);
 }
 
 static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
@@ -706,8 +677,6 @@ static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
 
 	if (ret)
 		dev_err(&pdev->dev, "audio formatter reset failed\n");
-
-	clk_disable_unprepare(adata->axi_clk);
 }
 
 static const struct of_device_id xlnx_formatter_pcm_of_match[] = {
-- 
2.55.0


