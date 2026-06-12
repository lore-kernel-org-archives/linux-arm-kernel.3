Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6253BCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=; b=ebU/gYTjzaSKS2FvANVGiK/mr6
	ZOUyoYIMxWZuTUnGnLnx460a/DV9f47Ri06LvY/bXjAuufeEbv5VOQosb764XM8CjhFkFfMevFyKK
	PylIMWN9O5Ecp5ftCRTpA3+jFuH1eHnEfo/kLNGvbmE1gQ2Cgn4VIboxappfTNAN0cxMR4YNKB2gc
	+lyFfh0FcJYh1P2pSLFy4ZpVqgBVQmR698qMo52a7gqpb2sydqaTuDe6UHyCUlRc4hWP9LrLI2RJ6
	/01V5wF3ATnbogzrWbjHH9qfXyBp1dAO4Xudhfe3ZsBeNGCPP7ngGGTz2/qTFEV2uunVMN03cZaz9
	dmLpdAGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1vQ-0000000AyYl-1G60;
	Fri, 12 Jun 2026 13:27:56 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1vM-0000000AyUq-2pDH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:27:53 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-307d0405e07so1469534eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270872; x=1781875672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=fXgEA7siuxEYLblYrzfgSKyeDdGI+qxCIDSnjoDUVnNZcDWovENJnRM6LPYucB1cwM
         L6hT4tbBJqLhWzZEFQYtGkd+y6CFNM92Xy44rcXRp6t2MbwIigyvIo9sGrXPcBwWfos7
         LKMfmxkOHIxUTg9WA8rXwTv0EH9a4VdvpoqBLdPwj2F4VhGIpRNs7atL9ACyyYC+QVG/
         HjPUt+C/a5DrqIS0S7YXTmI/4qRLDeqcVSnUV0+Ba0b1Z1G0Ww9hfL2qpa6YTj8BQqmF
         7CzUCmpPpeqZqpV4pIfZ/D0hSf+2zdOTcQnatwiix9TYTZLJ5pxntHJOeAp/Kve3+1Hm
         +UFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270872; x=1781875672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=sbUl8/mMpT8Xih08yjN5L4nQtct4CR6l9XDnmNmmdggw08NesBVywJNrl2CFG9760w
         +Ba6l4GlhH9o+/rFvrXaDgd1ybxz1l4/0jIx8BjiC7emEixKB6ChjlcVZGV/yWxxF7p6
         +pl+EnI3+Dpro6Hk69lpQHnFR562K+Gvk1GuWu76SMBwY4ouFYuc/8KU3ZglPB/lKDIX
         q3yYtcjdniOZvbu+Qjx1FInDNZqUvNOtDltTuva5ahld8bVc2vbHvhbv9y4rbdRQRIiK
         LwejdTdUW3ERaSPMN+xO8W+SQQYVXUEnxkxe52W4K/0qlvticyc7TBOm2u0LpqOaSyFY
         ZVpA==
X-Forwarded-Encrypted: i=1; AFNElJ+eCxZw08FNtJsMD7Bw+/h0Rik4PYdSN+/L8t2I66jX140GdRzsaPXy0C7ma/Z2bxANSkN7pDvQJpRIHEaGtdXR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+ez20mPmXfYr7VEoUC9Wh+BKHiJD2UT5ioNwWGzk5p3lYbhIL
	8d26AfHfWzyHbG7T/kU1GlLJheWLGP4CNfAB9uPzBggZw6Fxh3JxobPE
X-Gm-Gg: Acq92OG4omXKKumNVQW0R0Eg2sF2W5yaoZ0CFWhDSDPY2pG7T1p0o3AtCjdsq+XRmha
	12X5aqsHnrzqmyrU1ODRJWVG/nKMw83z2LBGuApy8a1ia5LB9Ej7QzUJoTVrVlEqB4IkSzRPARx
	xbTiqjLTrEvuvSEkZBEPw072e+L6ugXPMwVQgmhiLhe/d0Ny4F+RJqjPjGqAo9CXs9r2/fuEIbe
	MA6EJN1uyz1PLrIPgVDaLZfYDm/2nDIF7DEviF0iIWwwPbX6wg4nNG5P5kdu9dogSRjc4djFrpv
	0+jwVQjv/UFBvZQ+50wKMuOMm3RytfUH0D/Ud+42MusXKYxYKMsg+wMoyIotZPKwXn8jp+4+LEl
	KXGXUtgjsyGgEef5NNCnvm38oshWEfuuZfQQc0OYq65KsvZUBUAF1lYu68WYzyLiMGPFSQCYoc/
	iFvK5ml/wMRADPcUCUjpgdI9f5feKPd8PpMI3GyP5OqwBvAeEXZSRxbctHXw==
X-Received: by 2002:a05:7300:c8c:b0:304:8364:e95c with SMTP id 5a478bee46e88-3081ffb2789mr1848291eec.15.1781270871669;
        Fri, 12 Jun 2026 06:27:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:51 -0700 (PDT)
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
Subject: [PATCH 10/11] ASoC: fsl: mpc5200_dma: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:38 +0700
Message-ID: <20260612132639.78086-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062752_905595_01057BD0 
X-CRM114-Status: GOOD (  17.42  )
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
 sound/soc/fsl/mpc5200_dma.c | 56 ++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 56e2cf2f727b..bfedb2dea0b3 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -77,18 +77,20 @@ static irqreturn_t psc_dma_bcom_irq(int irq, void *_psc_dma_stream)
 {
 	struct psc_dma_stream *s = _psc_dma_stream;
 
-	spin_lock(&s->psc_dma->lock);
-	/* For each finished period, dequeue the completed period buffer
-	 * and enqueue a new one in it's place. */
-	while (bcom_buffer_done(s->bcom_task)) {
-		bcom_retrieve_buffer(s->bcom_task, NULL, NULL);
+	scoped_guard(spinlock, &s->psc_dma->lock) {
+		/*
+		 * For each finished period, dequeue the completed period buffer
+		 * and enqueue a new one in its place
+		 */
+		while (bcom_buffer_done(s->bcom_task)) {
+			bcom_retrieve_buffer(s->bcom_task, NULL, NULL);
 
-		s->period_current = (s->period_current+1) % s->runtime->periods;
-		s->period_count++;
+			s->period_current = (s->period_current+1) % s->runtime->periods;
+			s->period_count++;
 
-		psc_dma_bcom_enqueue_next_buffer(s);
+			psc_dma_bcom_enqueue_next_buffer(s);
+		}
 	}
-	spin_unlock(&s->psc_dma->lock);
 
 	/* If the stream is active, then also inform the PCM middle layer
 	 * of the period finished event. */
@@ -116,7 +118,6 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 	struct psc_dma_stream *s = to_psc_dma_stream(substream, psc_dma);
 	struct mpc52xx_psc __iomem *regs = psc_dma->psc_regs;
 	u16 imr;
-	unsigned long flags;
 	int i;
 
 	switch (cmd) {
@@ -135,19 +136,18 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 		/* Fill up the bestcomm bd queue and enable DMA.
 		 * This will begin filling the PSC's fifo.
 		 */
-		spin_lock_irqsave(&psc_dma->lock, flags);
-
-		if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
-			bcom_gen_bd_rx_reset(s->bcom_task);
-		else
-			bcom_gen_bd_tx_reset(s->bcom_task);
+		scoped_guard(spinlock_irqsave, &psc_dma->lock) {
+			if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+				bcom_gen_bd_rx_reset(s->bcom_task);
+			else
+				bcom_gen_bd_tx_reset(s->bcom_task);
 
-		for (i = 0; i < runtime->periods; i++)
-			if (!bcom_queue_full(s->bcom_task))
-				psc_dma_bcom_enqueue_next_buffer(s);
+			for (i = 0; i < runtime->periods; i++)
+				if (!bcom_queue_full(s->bcom_task))
+					psc_dma_bcom_enqueue_next_buffer(s);
 
-		bcom_enable(s->bcom_task);
-		spin_unlock_irqrestore(&psc_dma->lock, flags);
+			bcom_enable(s->bcom_task);
+		}
 
 		out_8(&regs->command, MPC52xx_PSC_RST_ERR_STAT);
 
@@ -158,13 +158,13 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 			substream->pstr->stream, s->period_count);
 		s->active = 0;
 
-		spin_lock_irqsave(&psc_dma->lock, flags);
-		bcom_disable(s->bcom_task);
-		if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
-			bcom_gen_bd_rx_reset(s->bcom_task);
-		else
-			bcom_gen_bd_tx_reset(s->bcom_task);
-		spin_unlock_irqrestore(&psc_dma->lock, flags);
+		scoped_guard(spinlock_irqsave, &psc_dma->lock) {
+			bcom_disable(s->bcom_task);
+			if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+				bcom_gen_bd_rx_reset(s->bcom_task);
+			else
+				bcom_gen_bd_tx_reset(s->bcom_task);
+		}
 
 		break;
 
-- 
2.43.0


