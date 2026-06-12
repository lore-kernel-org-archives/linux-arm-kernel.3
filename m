Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D10BCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=; b=ti1q7sQLK18fVaBfZay6GmSdu6
	gJSbKsbHvRpJRi1fZayidQRQyOmWrhMve4A2+oI+0c0oY8UGkqXB+pgl6W+SKDrzle8mrj0r1MIR0
	Fu129iBpQ2ynzfBb3Q4TxesnJRTsiz8A5n2lU2MnJPjJjU/glKRolCb7osFKD3K4p8RdBkhBLQ2vv
	yqR0E0PfFDAV1iTROR4CO+pjigKCgpWpyx44Yp/o+IuSa78KUVLkf5Jgl3pkuuEz33+bT+XFA4vio
	acy8ni0bDQ1clFSgKb2avAHxyvUFN3ax8cjL3VgRDRMFZtqyse2nQnRNGEV2NXQ7VOJ/d99mY83YM
	vY6OGBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1v9-0000000AyKJ-3bSw;
	Fri, 12 Jun 2026 13:27:39 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1v6-0000000AyH7-43qO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:27:38 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3074adb8fcaso2529180eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270856; x=1781875656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=;
        b=Jt6ddN4C0+iGmcEw8F6HCZtk37lD5GE38xsmZbYWSKMO3vsOqH8bZmrUFWB1lJomA5
         Xf1U1cAgo0kxZEUZZfHiwXz1EFia5SxjPog+XYVvAAy7tHNOY3+3Txm6mcxkXC3ld3hG
         yvqs19+n/dI9L1FwG+035d9fvapetyq/FTKvPxJYuRmsVPo9APozJUxyJam6pRBmexed
         uYmHc2AzxfOyGJ0AdDfHkPh8gKAX78rLquzbml000RGO2QD1bAloOM+ihm3MXLKEpmXT
         q9i2/mx+hUoFPITkeFj4gq+bGAL+19LZ6TV5984csdx5nhcseH86wWCT8Rkg0sxmz3c9
         dkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270856; x=1781875656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=;
        b=CkkbCCpmWm9eNqjXng60z/vO2rwXIpGL33bU89/GpfAyAof7KUI5nNYT4kCtgUnbab
         JyeF7iWy0YKThZb82FP5l+QE6nYUlQ1EdyRKFqGw1gtSJQ6ioSvaCEWwp+ZuVQoJj/Nv
         z1AVaty6/jhljQThqQsTohhk2iQLCWDEK4YW6l0AhXpb+smKVUj3viZ0O+xlxOis/WeD
         P8i2srXopmBYYDgihB1rynQPmQWTvlLSFQfiYUqHl48sMrh6NnMGAQsxb25YN3zRmFm+
         vgsu8FYpVzvGOqLdIx4Fr81gepGLJOpYYCvgIb7KdExy8xt3ddIDLdMvtL0Ob3DBsrCO
         vFxw==
X-Forwarded-Encrypted: i=1; AFNElJ8vQVI5jG+qO/azalhDnnxKBcgtQRBYpfcZ8fWy0xm2/GM+6t+SKAaI9fGkweK3CLU5ojIO3eK1GBHgi/6Ls9+n@lists.infradead.org
X-Gm-Message-State: AOJu0YyRtDiSBVjnmkVoFHWHULJqCfDkfQS0uD3Pka5BiepEgn5vHt3c
	H0NKp145gpmYHD9NPf51fWc1QXTBL4oMd54FSSkFV4bEsndFb80AWoiY
X-Gm-Gg: Acq92OEJsTQdMSQx4z7EQGhVmMEqN3cLDgY70ny/J/09eiOHhScM+vdE6V4eUfdIEw+
	r7Va38HS6YC49DZcs3T0YPGFrREtevj0TMdXnF5V9gdLD0K+npIekuY1RGD6YnM029+t28kVPRT
	Ah8bVwsfOSatdbUfauNKmFk3h9bk3VLzijnh6uWqu+rkXjfNLtklDgemDGMyZUQZ9UtOxStuJcZ
	slJPWwf63JsB9P9/iSRdIrrHKC0xlTKDNLt3kZMwfhDl/HtsamHzm3ClWjz3Ns2CpEvLnFDo02K
	x4Rs/RbQFxeZWgF3b3ngOTrkVCnPREYwSSmbJVuvcp9zVxiYgC6fn5Eb1AE6h7gQ23dXveVxfV8
	sUPPJSLi0AaMAcJMQAh4XleiXJ1KHYOVrrmUnpw3tN6TkB8UIO86k5zEU+luau+lbG1Jj2IlmnE
	YyV7wtI2TyevN35K6tkrkOTTH2vTRexVLpxY1t7URbFs1WAtkxjRh2+VI0IQ==
X-Received: by 2002:a05:7300:f082:b0:2ed:7e1:975 with SMTP id 5a478bee46e88-3081ff64a8emr1866575eec.1.1781270855805;
        Fri, 12 Jun 2026 06:27:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:35 -0700 (PDT)
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
Subject: [PATCH 07/11] ASoC: fsl_xcvr: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:35 +0700
Message-ID: <20260612132639.78086-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062737_010328_1A6D7D03 
X-CRM114-Status: GOOD (  13.61  )
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


