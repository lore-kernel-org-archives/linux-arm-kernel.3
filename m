Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F73ECD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=; b=yt6ldLRxShS49gN+rTkWau9heB
	4+RPRp2ZLY9TH3WD8wgSGvd2fDh2/gkwxX4mng882WI/IHu73FddeP1nMOp/wl46p1GSwyEDtGpEl
	vUwF7haSIgowYYTe/vsLx8bJRaebH4S/FirPN2mSdG/YV4TQOATi9nAqETBgaFFCVuAN21s8fuEZS
	F7wqbZ4DeW0EwFfRzikOSxe8oLaqzb2h0a/IH5cv9X3D7yT4ZFAdSsXoJVnR6g2XOtWju2hHCwYoE
	SSCor8CFx6e4NfViAsypcj9AguLGvuMOttVGUuEkvigUhLkmDw2nAQYxers5VAN9zh9BKKxUSnedH
	1MhW0igQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3oY-0000000DzGR-27WG;
	Mon, 15 Jun 2026 09:41:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3oT-0000000DzC4-25Bl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:41:02 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1435885a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516460; x=1782121260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=dOpbbjBvTcA0hqWnskvrAnKIRPwDheXEQssE4fetIgb8ynWON5lu32AR4Zdr9PKu63
         1oCblVTrEKpsWbPI+LMWjdnS95GbbzdjhAa0U/NGKGw/pfpInVZ0EVvM4imn+Q2P5Jyp
         j2uWptq5LH6njxy50WVwbMuGsDOKZTggWqp8tGpXh33N5EktqizKOezuLMwsChxeE21S
         QYfPKu4bC206k9qMrlby0EkNj82XUtJ0BED3+xw4yFouzdU8FPqHoSHVz72/qmOFWQci
         WRTTeA6ERXuCQkdG4koPyilNWwKiU8+UdF10XYnQIDuMPe7Oy5SY475brKGzi//wFUdP
         AY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516460; x=1782121260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=ZVPENgNzvPHea659WCvlTJMT1Xulwbwg0Ri0tbvz2g4S2r3zZBItRgedZr68fwwCfe
         wQdtJanaI56ZNyvk9CbLeSQukqh6MADttynEb41oFAREMhJBbYgczpTqZaLvATMz55af
         pzIKtmX7EgBUTSqeuw7S9l4b5GDRSxBHY85trQXCHMSL3KxGOhcce9CB9MRDbHG9u9XV
         /jsHUenveQ2zfOsBPe7p14PmIitL6k4DVGUnp65JpU1FLJgNQIuq1HqplU9NI9AVRwe6
         uJlKa+nUg1SKqjCcopvsf33z8qghlHfBvOxYDv/T+ktY/I2vSVToqbrTV8g9o+nkS/YS
         OjAA==
X-Forwarded-Encrypted: i=1; AFNElJ/6vJk7tsxQBg9osbfGNt6JI2LpEAGohtbqH5kMV6SF6bFBMlbj48nJP69ZcGUSFXoKiKcwqEQengS8Y6OYvQbc@lists.infradead.org
X-Gm-Message-State: AOJu0YzxOioYBmQCBAODuqu29HeMJNT0+3IdS42kgNufm+1o8ux7rgP3
	QhGT/qMW4xPAQX/8/kX0r5PZno4aFJrJCs44yGzCfxuB35ObkAC3AVSI
X-Gm-Gg: Acq92OH4Mt3lziWYjCEmOAcZDWMCNlTQxzjyNod8Vnn4OHY8W2P6J/vMPCeRB2Q4gip
	z4gUCfEE1iaNWk8ujxr95tOeGTJK2xwVaoE6E/ztomqz7FM1jHnF4ZGYCSmIu5bXr4nLxyqFOqr
	aVNotOjniMNDh2mP3ziDKQGBxQDsESFe5QCY+SkQh+/aggwWTySrRh8gOXZHd5NSXVxm/vddbC2
	NppcmwYT88SmeTyh5pMB3NxgAFwn+ykBQSpiCIF+mCog0jmnKhTcGR8k/2cU4SWc/cmw0Fusdmn
	Vb0ukfYD6zy842Sg8B36aXXIOM9m04s3lPQGVUwEkysebPcCWKjTL80Nl5VDg2bvLeHDwRsQ6V3
	rJutTDIc7CpXytTODTfWyHubNqxDVLQ5Ut+3ykBvxXEnq26yhNjRlYFyhd70SiUWxbkckixuBxJ
	oDyq06Ti/uDN+b8lBm0XzKwguavX2E+tjE2RFGsrQKGSr1vD54mS/Jz8wyVVuclUCrmQGY
X-Received: by 2002:a17:90a:d004:b0:36d:81b3:61a1 with SMTP id 98e67ed59e1d1-37a01c34487mr13541493a91.7.1781516460544;
        Mon, 15 Jun 2026 02:41:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:59 -0700 (PDT)
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
Subject: [PATCH v2 10/11] ASoC: fsl: mpc5200_dma: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:23 +0700
Message-ID: <20260615093824.115751-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_024101_699799_62D2449A 
X-CRM114-Status: GOOD (  17.93  )
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


