Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF08CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=; b=X/w99OT4pOc8Na2Jirm9Vs7LI7
	vH7xtNWkxrJEaYVnQdwlGU7JdrmpXK5Mcr6Y9bmeGjLEQpOg2k8K7XVFSut4BIZ2/bM298RQNLQ6c
	OsStMZDkbHqIng+v6aF3pY+gBSOVqz3cs/q1Fm16BZsSpw+AYzP+EEIkmuE95cv6mosYXaDXvnvE/
	Z/618EN4PIbP+c8ydCuiDmvoCI1LqGDlZVqSDBJ/cY9ceHoF7/2RFEvCHpIrLSq/NU/SJw3vqcsll
	nJZuH1ybMyRK6Dt+4VDIRj1vFg5msF1amCc/pwh40s1u9VWIZ791oQdmx9A1kgqTMKzJYbhZhPU1i
	XrU9VVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3oE-0000000Dz3s-08M2;
	Mon, 15 Jun 2026 09:40:46 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3oA-0000000Dz1P-3RUi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:40:44 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-36da151a152so2155098a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516442; x=1782121242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=;
        b=QTVX43rVp43tTiHmh2tYPR6Mljs7xZZi+uDXZ8ooDLQy+n2ZmsHS04YI43mw4X9wRf
         M8Ku18jGafwEz2scpDGxJ7mmO51noV1AVxRNYhq8NWP0IdWQovLycYaRfL307YvX8hmB
         ELXTZP/QnEi13yBBBN03LuA4FHy+i5vnLznhBY9W4eFJKdmsWPPRjq5BTRQ9j7cRr+fJ
         tystU4JIpezH1ai31irhdVY/eTb7r9Nh4H9kJFv+YicdFiy15bvaH3YorkUAjIm+hB1e
         flP+DVNyfWNmTzudupzrIuDyKHnoEwlt1ONxv+o82ep47r69kU9xGquNN4ExdT0B8UUs
         kYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516442; x=1782121242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=;
        b=Ns/w/I/KL2KajKgh9Pul9LutKirC8Z7ze/zb35STeyiQulg8ah9cpP9yOBqUFF0bjj
         p3DPbtEenurOQdmidp1A1jtUmPU8A86Lf5sPVASeWm3l4+RPL3W9qW0dYOxFxZjiFkzO
         potAA4iQTgosdTeMR90BNhyUPHCPrvui3PM0jcYhURE0P8gohhvMoJtuIBPFxqfi71Zb
         v4gPf6ojvmQdwb4e8Z1W1xmSJlNe7hwnz66zq1+LBxnEM3VxvdXGRifM7909PrJBjK2k
         a7xPQ9ic+8jGYjL/8Cpe+xY3yf81D/jKv0Z35UcNLTGfQJuubp4HM9oPpFcwBYLat32g
         342Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Pn5poege0iEzxBmPOzF8vXJWgqd6gGldWOE492nwJoHyyCglxJtTyibphYofW2wxVetN4KXC7Yfv3SCKKzru9@lists.infradead.org
X-Gm-Message-State: AOJu0YwDkPDyqiFI8wX2ZROIJTxdGY5yD3CbbHTueCnYDsC418/avzRP
	/61pawZbzlJuOnKMfG1VGbHbS2Er21B+15sUTWvtwnDx1wQtAB/HB7gW
X-Gm-Gg: Acq92OHoEKdU9/xQZpkIbRivj8sZy35PxYADaxOowfDOJ3jBqRm96Zo/nrRltXBSmqP
	i9PDIwGL1Mh/MKqZCnLLyq1rSksAkyyDM9d3v0kQF8J4LgoKlVuy+2FOy08JBdR46mQo+6C5ePY
	/jsROLtenGWhii6KEa6H/AXX8yu0H63baIgrGNWE50KXTs7EHeU7WqyWYwtZUZSY9dFTkJvuMn/
	z54XYoBMMcWVKJx9tAbpQ6BVaf73kYktCo8na2og9RhiMETXOEBHz8jOuTWoKQ0QHNaZ+PuK7qy
	Y4yTXeIXfIaSpSg6hZmB+gDusRaqy0gj+i8hIyfjADM/fmI9CC9VpLqqO7K8G6oozAjbleFqeZE
	L52ex46VCflTVENC8r02TlrVMcqjGLUxDxMRBPTlJiL6zb5JfXE48DvLLu4G24hlHkF+n5kUSEy
	FKbIrPxSanXvc6EDpSv1A8wHkmjJiFfEYnaQUfg3Fm4FT5TncI1tiqDg2O4g==
X-Received: by 2002:a17:90b:2781:b0:365:a5f6:4a5c with SMTP id 98e67ed59e1d1-37c2bc5d202mr10797246a91.1.1781516441891;
        Mon, 15 Jun 2026 02:40:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 07/11] ASoC: fsl_xcvr: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:20 +0700
Message-ID: <20260615093824.115751-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_024042_860795_1A960B1D 
X-CRM114-Status: GOOD (  14.02  )
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_xcvr.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 6677d3bf36ec..41d100500534 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -797,10 +797,9 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	unsigned long lock_flags;
 	int ret = 0;
 
-	spin_lock_irqsave(&xcvr->lock, lock_flags);
+	guard(spinlock_irqsave)(&xcvr->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -812,7 +811,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DPTH_RESET(tx));
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to set DPATH RESET: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		if (tx) {
@@ -824,7 +823,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 						   FSL_XCVR_ISR_CMDC_TX_EN);
 				if (ret < 0) {
 					dev_err(dai->dev, "err updating isr %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				fallthrough;
 			case FSL_XCVR_MODE_SPDIF:
@@ -833,7 +832,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 						      FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
 				if (ret < 0) {
 					dev_err(dai->dev, "Failed to start DATA_TX: %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				break;
 			}
@@ -844,14 +843,14 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx), 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to enable DMA: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
 					 FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_IRQ_EARC_ALL);
 		if (ret < 0) {
 			dev_err(dai->dev, "Error while setting IER0: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		/* clear DPATH RESET */
@@ -860,7 +859,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to clear DPATH RESET: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		break;
@@ -873,14 +872,14 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx));
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to disable DMA: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
 					 FSL_XCVR_IRQ_EARC_ALL, 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to clear IER0: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		if (tx) {
@@ -891,7 +890,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 							FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
 				if (ret < 0) {
 					dev_err(dai->dev, "Failed to stop DATA_TX: %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				if (xcvr->soc_data->spdif_only)
 					break;
@@ -905,7 +904,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 				if (ret < 0) {
 					dev_err(dai->dev,
 						"Err updating ISR %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				break;
 			}
@@ -916,8 +915,6 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 		break;
 	}
 
-release_lock:
-	spin_unlock_irqrestore(&xcvr->lock, lock_flags);
 	return ret;
 }
 
@@ -1448,11 +1445,10 @@ static void reset_rx_work(struct work_struct *work)
 {
 	struct fsl_xcvr *xcvr = container_of(work, struct fsl_xcvr, work_rst);
 	struct device *dev = &xcvr->pdev->dev;
-	unsigned long lock_flags;
 	u32 ext_ctrl;
 
 	dev_dbg(dev, "reset rx path\n");
-	spin_lock_irqsave(&xcvr->lock, lock_flags);
+	guard(spinlock_irqsave)(&xcvr->lock);
 	regmap_read(xcvr->regmap, FSL_XCVR_EXT_CTRL, &ext_ctrl);
 
 	if (!(ext_ctrl & FSL_XCVR_EXT_CTRL_DMA_RD_DIS)) {
@@ -1469,7 +1465,6 @@ static void reset_rx_work(struct work_struct *work)
 				   FSL_XCVR_EXT_CTRL_RX_DPTH_RESET,
 				   0);
 	}
-	spin_unlock_irqrestore(&xcvr->lock, lock_flags);
 }
 
 static irqreturn_t irq0_isr(int irq, void *devid)
-- 
2.43.0


