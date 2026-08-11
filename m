Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84211C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NgsQJ4VjYv+Gww+JX6UCqUNvdvt9jcjvaOzC6yXUAwM=; b=iUbB+aAGu8v8Aw8OXb8BL8ExWQ
	uuRmoDqoGhB15iJ+jTSeqrRqjnRBxfMp7au1AHFb2X1xsCOMoWb/k4mDh8q6so30MKCw3OYIi4H3o
	cXZTZWfJWO4cUQg+UIFyyOE0j/R+V0yO1CavNeYHyvDwDM0I8yFL0d7jiQiyxH2988Tao5FbHk8pF
	T/PkiF1KqrCFLqRG4Kd2hGaKkv3qZnqIv1oMBhhnvGg1hkkfnLl7Kxx7l/VjmRrQ6yrUtfGlosYry
	w/rIDVpZ9b1jc8QO367tFToMb09/oJYSnoKLhzQKrwjPltgqYlodJvIuANnIKunPuQeGOr1MT1Wen
	MvrkltCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrYJ-0000000EnVc-0lo9;
	Tue, 11 Aug 2026 18:50:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrYG-0000000EnVG-2il5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 18:50:17 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ce98cb8165so3028695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 11:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786474216; x=1787079016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgsQJ4VjYv+Gww+JX6UCqUNvdvt9jcjvaOzC6yXUAwM=;
        b=iBEJpvYvbtdboRYNZsfmrSKgMNwnOtxLIvqfGnYQv3bM+kzUO0oi1OMBhPemaQq1Hd
         fQZwhhLtsY8XamIE1SIe0rSwD3k0O7mUZ1Rzas1wKC2wMWo8tww064IBfB6wS7Ot6U7T
         Nyvh9xN74tfr+dYtmXjA7nILzkHbcdcVbar1fU+01Vd67XjPLbqiVlQxAIxiZM0bXSDG
         SYHTBClnnhb6CotuHSoBVFDUpyd/pBvQD7uiDnRwDcpWsvJ0U6qAWhc0jz2vHBF+oYna
         dx6no2qUDqq/sYfqdBv7MAietAMXWrvrtfsewXjGL+/bu4wq5AGMK+Bi0pJnUw83RVBD
         wsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786474216; x=1787079016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgsQJ4VjYv+Gww+JX6UCqUNvdvt9jcjvaOzC6yXUAwM=;
        b=I51d6vQjf9SmYkVfmmalPoNCPZK+b/gRQ+hR6ySiPAE7UkoxgADkKB/fPQBNaEkuMf
         F2F+ZIkoDsoQkFDfb+kzx+PHuRz9bt7iaPIjY6uOevedKXc+HKpC+oQCnr46RhtvW0eq
         EpZcTf/2AHl8eXgZwPjOVeABxbdwnvVl1pMKGDOqwxV5C9QYBaW6R3STxiPF8VThE6kj
         W3ikSqPEvkvCICLyCc9J5CxrBChJ2idMjNoRx6NiXGIMeA0v+s9Bh6kfskL4HgB0S3n9
         KySnKWYbbd5LvaE57SMIVR7TenQ2xZMycSu78Z1y/KikbtMRQufxLcPsm8FaJD2S5d21
         cZgg==
X-Forwarded-Encrypted: i=1; AHgh+RpviwpJlqjCCRKne6flpZLyigj25v4Iuegjuj7cLjHif0mqtn+VOGE/+Q008fMaB1aydqSjER5WyuX46M8BbIJC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg+CTYJ6B2ueeQzAIjwgbPt1Wrsy0LI4mGCApBp5DQEOmacvnb
	KrMvxWbVmrweT8eqkQ6Hwy61+fkT3gaPSrOQYKjGT8EKvgofdTBQTmHrUxMXig==
X-Gm-Gg: AR+sD13vEkQc7nKARPJFNWRQGCM4STMFHvu7x61hVWACdn0RLEqLlxf4JadfLyIakct
	Xr+JDKK+7uEz7R+fPMsc/tx2IHaNiBUCTvyCm9+gQjQaR9l6VhQSxUqDItCBHJibcLQEqUkEWtB
	wj2Ocpofk4cnFOWqruYmeFSJAY7FMC9VcDIhQz9r/bSTfdOFXvmv+nW1JtdlaI+s/yWD0R7PU9R
	QTNKK9YKFmgv40D1rTsx/3s+on8tgV8JqFBrP0mb+sRYOwre+KlB2t1KGB3Vbr7C/uyxzTP67NK
	ZEgvKRCwbHdEwyzpkzlZWT2F1jltq89tf1o7WWGavLGbEpacX39Vzwq63tOGdRwyU/uLMsZiteX
	IItgSjJMYfJtTIr2U0bsphZU26YVQFsMuFdcswbnt6lGp5iuxOMuI0yigOLzkkaAfw8CG9YwWzy
	bGVWpsBd14EOLVXIX3qlh/03H0ACeiioazXwDhlgn1JbQ8marrPFnA0hV8AZS/RKIUIhZI95fu4
	hE8HynSzjilnM1xizJz7Tusm+89igrHtAqMJKG+ZGQnkF3xK9vkNrXP37mQb1eGgC72V7ci2QEt
	DtcOPdR8y50XADzvQhixT19aMKifqKKi7eY1rw==
X-Received: by 2002:a17:903:1988:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d32da51aeamr29355045ad.10.1786474215582;
        Tue, 11 Aug 2026 11:50:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315ef05fesm11600835ad.3.2026.08.11.11.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:50:14 -0700 (PDT)
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
Subject: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
Date: Tue, 11 Aug 2026 11:50:13 -0700
Message-ID: <20260811185013.26960-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_115016_694775_AED0C57B 
X-CRM114-Status: GOOD (  17.80  )
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
---
 v2: add signed-off-by. Further clean up some stuff.
 sound/soc/xilinx/xlnx_formatter_pcm.c | 70 ++++++++-------------------
 1 file changed, 20 insertions(+), 50 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 3d6f1e4046d8..eb878c75e293 100644
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
@@ -662,34 +647,21 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 
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
@@ -706,8 +678,6 @@ static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
 
 	if (ret)
 		dev_err(&pdev->dev, "audio formatter reset failed\n");
-
-	clk_disable_unprepare(adata->axi_clk);
 }
 
 static const struct of_device_id xlnx_formatter_pcm_of_match[] = {
-- 
2.55.0


