Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D92FC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 05:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LHlqmGMbfsxtCYIUcQEVll9m/OkCwVr2FmGex2YgLq0=; b=LOCr1HuefR9C7reqQnUbvsQCUW
	MJEHaqvCkpdcQs5s+mjRVPT226h+AyWCYp/cBt5kLV2X7wIEHQghKFatDEswYklXu/2ITjs19IR/W
	AeHOrXeGLvzAljsNUE7rwtyNjfGfbTsQfYW/Rsk5Jd3k97EZQGbeG44awGllRQ+QuLelz7peU2OMk
	BVBNCEyw4kI/c1KYXl8uxXQPVf4dm9utvWquNoeAV9eGIeRphZpzd0o/6v2RmH4sPh1M33RNCLCUt
	jHO+fdxLw+oT/6KcBTcbUpqQ0AvCv+87QDaOiRGMLBotz5JpLGnLUhkgUVmyruXJNe+PQFQWH0e0i
	sZbrEQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0Jd-0000000F4gS-2qNN;
	Sun, 23 Aug 2026 05:00:17 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0Jb-0000000F4g4-0Bsw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 05:00:16 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3178002a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 22:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787461214; x=1788066014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHlqmGMbfsxtCYIUcQEVll9m/OkCwVr2FmGex2YgLq0=;
        b=jArwNp91mLESlLsP9zA6Qax+nNKC/PnhZv/atll9dx5fcWYYfauY6GGQw2CRrFw8uG
         /8N71/T0f9VCELiyZ//evEyeHKr1utYJXDvhTXKBp7eysP520OwMKmaSxEcRglBTYlmY
         gOl6YtnyocAOxyuVamJC3/rJJDprVf2xNWGn+Ayt+wQSw1e/6nQgk1V23ThAIoIZhRUb
         Uw76kvDlzxKTG5IOdjRPqgciOgK7u/ozb0YetXjNe8b47wdyc+ZYXXB7/F/Fy9ZVEQxm
         LE8Vp36gnb1V3NxyFfFRqpzCsd9BUE1buvFzNjJ8+Ijf7vtrsveCgCJD59ZQKImZHiz2
         6muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787461214; x=1788066014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHlqmGMbfsxtCYIUcQEVll9m/OkCwVr2FmGex2YgLq0=;
        b=cavvpy+FQ6fIc9Ug4ugVtAQc3iAl1UJQIBJYhm1U/ArstxlWCslHX7KjjerrzG6nb7
         m3e6bSvlwpLD49h9YQIiDWWRnG6CvPgI1w8s3R5NUZQoL5JZM9U8WPqXzgLTGPpWdtk0
         5p0kvL4PDa9grhztAgG0WrpffQ0Au61Fzl3t8TlfNiYBJSw/M1Kbhwg8oik6GgbJEn4y
         r7way1w7cnKYDRCp2V0ItLZdzVhiKwI6+PhgsNqrOXmGZHnvL79Ki8rvFXhT/kv/FGnn
         iJ6/2TU+Yw4kRs0TZZhyxCOkIo6ea2w/JaeVCn6rfbWLJUHaEzPu//iGrKuAJ6nIWPfv
         0WeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpQzHKdlNi/6fsn51KPNYWkCvPOEhfbxXtDSdEsdlNQZQw1KG/lXo4yUO+e35+sfKtYQ5aqBKETw3d/1GDs5zJ@lists.infradead.org
X-Gm-Message-State: AFuF++k3Tfn75ODU1C5xhBaV8mF6a8+TLEVG51Qq8SBOL0z2uSiSFl2Z
	/3qK5TgjYa63iAO/P0ebqnbqpjh8hA8rxA8JdL2CxpO2K8iBrs9YoSGH
X-Gm-Gg: AR+sD11CPh+R0s4d8ZrC/8VsXwbTdodyFnebEUVprinpYlrX6+GIdOxFbtRNFfwDIK1
	+T5zInM+5dp2QiXScCC/aDYlkrQ/bIZJPVaKhJ8fliFQr1u52+Gi+fkfaT3Gq9is6lMHe6mJHBG
	dkzJxwMwZhDc+CS3/ZdSekpbh7PJ4uepqfJEDWGZNz1XkI5wtSuNuQqX/F47gqpuKiflQwJPeFF
	AizxJQ4uhOu/TroMuryveafo9vtf4ITB8dC6JBE2iJC9cSJFaoum253vqxj/DXxdgmZErzdD/nF
	Fi+aU1s0+Sv1H7E3vFIJBJLAmSo6PZd7dNe0tfW1s0EsNK1ijZ/sfuBKhNPycc2aWeeBK6vrOMa
	puCMzlCFweJCHUsYgR2Yf4UgdaW9B3H9zHtYOiAIYofhL0jTQvkJkWmqXM4z4efWIwud41raaLL
	DBDcAZX9cwQQRqGJsGVFU8pKTTnAlnPjl+ew4pwFJBu72E4CvN4ttbjDR8pmW2dpVhHAGfZNA3x
	sLS5S6mnnOgqpP5ic9jSR3saJ6P+N90cPjeyVuBMEOkl+lklNihBy7T6spqgvxeCfP3AV9nYueU
	DQhmPLCfls8e/5Qf9dDJFKoDjFPyW2nbJNFsPA==
X-Received: by 2002:a17:90b:3c84:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-395c3542369mr34039656a91.4.1787461214151;
        Sat, 22 Aug 2026 22:00:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c9128498sm2813642a91.2.2026.08.22.22.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 22:00:13 -0700 (PDT)
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
Subject: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
Date: Sat, 22 Aug 2026 22:00:12 -0700
Message-ID: <20260823050012.17067-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_220015_102275_775446F7 
X-CRM114-Status: GOOD (  17.33  )
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
 v4: use dev_err_probe
 v3: rebase.
 v2: add signed-off-by. Further clean up some stuff.
 sound/soc/xilinx/xlnx_formatter_pcm.c | 79 ++++++++-------------------
 1 file changed, 22 insertions(+), 57 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 95312b4ddc5b..3c321c19f829 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -81,7 +81,6 @@ struct xlnx_pcm_drv_data {
 	int mm2s_irq;
 	struct snd_pcm_substream *play_stream;
 	struct snd_pcm_substream *capture_stream;
-	struct clk *axi_clk;
 	unsigned int sysclk;
 };
 
@@ -595,100 +594,68 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
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
 		aud_drv_data->mm2s_presence = true;
 		ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
 					       XLNX_MM2S_OFFSET);
-		if (ret) {
-			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "audio formatter reset failed\n");
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_MM2S_OFFSET,
 					    SNDRV_PCM_STREAM_PLAYBACK);
 
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
 		ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
 					       XLNX_S2MM_OFFSET);
-		if (ret) {
-			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
-		}
+		if (ret)
+			return dev_err_probe(dev, "audio formatter reset failed\n");
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_S2MM_OFFSET,
 					    SNDRV_PCM_STREAM_CAPTURE);
 
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
@@ -705,8 +672,6 @@ static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
 
 	if (ret)
 		dev_err(&pdev->dev, "audio formatter reset failed\n");
-
-	clk_disable_unprepare(adata->axi_clk);
 }
 
 static const struct of_device_id xlnx_formatter_pcm_of_match[] = {
-- 
2.55.0


