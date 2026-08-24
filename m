Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EB3C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=61h2VgfdJWdqGSu+H9lxOdRkwIvPdz2MyXbWOLReTlM=; b=ltpFqHnMf6x/QW21jc+UxAiOKm
	elpL4xiMKa7NhUxy0nCQMWTBJwyyFFlevws6VVKuV8i95oODzvA+wL8srunoI4IvdEOBt77S0+2zC
	NGI5zZ2SxRfCBQw58Lz5HgiPqk3vSNjk4H2Y/wIn0VfX+E9FHdU7fRGFIiU1IB5bbERqCDXnEGrgT
	KjSgIlBSwH+auQkpR+d3LcBjs6BfM/0GsJ2LiPaPDCpj+qyDZDumJH1708Op2KgW3w8IlhqCghou9
	jL1eP2d3OowRDw12Djh055mvvUKKnQ3nPIMuH/vr6MgGUHrcopKflOmNJx5+DpJb6HpO6wnqqmrnx
	xyyJ672A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybJN-0000000HMol-2MdT;
	Mon, 24 Aug 2026 20:30:30 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybJL-0000000HMo7-20LS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 20:30:28 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84874b52eabso5097447b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 13:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787603426; x=1788208226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=61h2VgfdJWdqGSu+H9lxOdRkwIvPdz2MyXbWOLReTlM=;
        b=hQ9ON4OdS4PaLiiwwL3y+UOXRNL7esp1KwIjAaJk/FqxHSAk2MbhJIvpwBlM5XPuls
         +3aQz5erJBjUsglwUTrqfk2KeDRcThVmQtiFwoWhH/Hip8eLDRJtMQq7dLoZk0vp+tTa
         EftsA2jFxWFOgXjbc/HiioK61CM2mN9blzReUSh4G+b8q2A5alqQCcWV7/32NDSwOowP
         c5RFTrIfO54j6Q1kfxG3RCWfa6esuWCAAkkCm76D0F7Dd2M0tczyM6gp8hGTYG1ep4Hm
         qjxqHANSo//gzeKlgrdV6/xwMRlqCjJj+CU7NxJPbVQNXsaXEraABKmMRypfmyLB94wP
         6F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603426; x=1788208226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61h2VgfdJWdqGSu+H9lxOdRkwIvPdz2MyXbWOLReTlM=;
        b=JUieTv060usr08Lnf4Ai7oIjyOpxCMmVOog/oLL/0B/KTTbOzVqztkVelvxqMynuW3
         ygLFjkTS7QAg9AQV4HJcCjaPKCumlxYksfhVRV1a1DixZGaLG/uCYDkqm7Hi1lo80sIL
         eRGWZrCsNu4JyOXa548Lkk870hvV0V5CpGGQABOwzLzfgYDCtorCTjUy/Zi2CeH/VR1C
         fNl/aXOBabSiSSr4YrcLSd+x+v6089cHmN++F66exqoKP0+0SqUbLqjdQzA68HTn4if1
         Lg5Go3+AUGVLeRgFyeZrbyiWl+AJbPt5NmX9ePntJmcQnn4eA+n8CB7IujM+rumX6GDZ
         btLg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/+nr98UWUWN9V6MWbaEaQbIRu7fkelJerN9MQDzcwBH3nPZ+mTDvTHjpkH9U75J3FGWa0n9FQ1/7DGKbZuyC5@lists.infradead.org
X-Gm-Message-State: AFuF++ntv622L18fxmXQ0m2CzuZAmfd51j/kjvEQwZp0kvjfjexiphj7
	fc57rdavCqR5EfPF2dIcsLonob9/Rj1logK9GcGX2af+2ioxtorhW7WFS4N0Tg==
X-Gm-Gg: AR+sD12znu+1/B7DAmhBKU9NjNS48LXNaJwTqiT4J9+3y+/f7PWPd2OiFR77aT+a2BP
	9d7Dvcjvn6VVzJU7xpNbLuv9DIm/3TyDCh8PyByIqzmX5bi5FLBcuWFAnPRk4Gdu6C4Fn44vNG4
	Q7apwnHbhAV1EYF6brD1uz4hB/7cmk2w0W++FU2Xrd1/U7u+/W87+NTLxSqqrsm/GhaQ1CsKILu
	Rl7Y0nqY+KfKQd9m85hTnUlWam+5D3S7Ktf3xtSDDVFUQrPx26aSf/nbxfgdoykwo5p+N/aCW3w
	LoCDSpUJ9HySMuUNuuL+WFb+vapr2UCKTupmh0UDHTX0YlNkYJSCddYSpFY8uK7lhBJbijTOR8Q
	mGYP9zMPFi2v7UyJLyocSlLreSNwwJrU46tzSb/U695WTDwuPtajk/puaSFEcX1Ow3+J90ZwZw3
	YNvkP3ghqjgo1b0KB3VRtRdlgZtzAvFwXOGYomTU+xns3Xs1zukC0os1E2ydcbJjMy/C/d90b3+
	PCrkUhEYTUlGW8qS/2gF7d1/aXPnr86qZxWlaQMbgD8L5mjOzsXVUttOKJtXb2EL4YVyl+eCmMP
	sxdAsbPLh75C2UQyS0CN3zTJA+HD92tDMHxGXbm7MlgwHNbu
X-Received: by 2002:a05:6a00:369a:b0:847:893f:2d0c with SMTP id d2e1a72fcca58-8523c831155mr2621973b3a.5.1787603426483;
        Mon, 24 Aug 2026 13:30:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef09251sm2440917b3a.19.2026.08.24.13.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:30:25 -0700 (PDT)
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
Subject: [PATCHv5] ASoC: xilinx: formatter_pcm: use more devm in probe
Date: Mon, 24 Aug 2026 13:30:24 -0700
Message-ID: <20260824203024.15574-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_133027_519815_22148FE0 
X-CRM114-Status: GOOD (  17.35  )
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
 v5: fix wrong dev_err_probe call.
 v4: use dev_err_probe
 v3: rebase.
 v2: add signed-off-by. Further clean up some stuff.
 sound/soc/xilinx/xlnx_formatter_pcm.c | 79 ++++++++-------------------
 1 file changed, 22 insertions(+), 57 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 95312b4ddc5b..304220d9aaf5 100644
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
+			return dev_err_probe(dev, ret, "audio formatter reset failed\n");
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


