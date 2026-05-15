Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A14ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=; b=Rw6hQEAEpur5FoFsGeLXeHWE/6
	3WJ8SYbLFtRlNXk0P8GbVa6gmu/BHeAUj5cGgmHGzptsVjL9Qwvr5oCJ9nmQvHVMdacDPg/UBSAko
	nnEoBmRo/03sdxkuROeGSalSD2VRkVziGxiRd30Kvvb6BDu/23FoNXF9GcfT1A2IjmPwaeveqR1xo
	rU6rLKpk2rFHQIpIhXzaEAY0oR9IUYvLvcoExD5QwVzDpmNs8wPeFG5xCc6/9qAajyNe4POWqA13A
	9zLh7xuYvsVNljZ35MH4Y8lKd2WoIN9J0Ne15+XUHqreG9ZXNFu70Da6IUU8jlYtyy1YxGlbUaWGm
	ETZ3JHIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqfh-00000008BAf-0m8d;
	Fri, 15 May 2026 11:25:37 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqfe-00000008B9F-3z6e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:25:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bcf48850c4so36045925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844334; x=1779449134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
        b=lGXE/iz+shz0mrNHWXYJKG6+rwpvXXoFp1VlECPkQ0+Z8Rgl9IGi3cWb6uKvwRxLxI
         X0/oHeMvOv9chaJB5SBJ0FiRqN3SSyDMPR378zbtRxfZaErA3pSiwAMGtUrhswuszCM0
         pBY7D8GJAsbYuQCzFo1oqp68dqxvmx2cwP3DDHwpux9avzYo2vlikRur2I+g3TGJQxuq
         Fpw4N/Lom9LkMUeulVTprLvYADS7LcbmSZHG1DgBJXNcIoyisyNYVm32IiVrF9Z7ZYIX
         fG8HKXbCbr+NzbBBedzsUoN3D8W2OEJPclkaONpuw6EOufpxAdOGnkkjRfahyZhbHQw4
         gCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844334; x=1779449134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
        b=KPgJ1S3SS13dRS42dCx9wPscti3GIYkrFu3GO0F8AEdpvi/ueIXZIoZ9Le5d0tC17u
         IaYzZdUM7Jyfa39uWMK8POnJyZazA58NBCDGFFwmvuiVOz50ktCmFCIUYoMPU/AfCtcK
         MQZdznQmGOTZuXKgICEkeb497nvZP/aGxKwP4qWF3LRDebxZqJlydBvUVaRTueUTBnJQ
         X6byUw0dyO7oDqJWc6N77NbatjvuhkCa280g5DMDxCa6UIbKBCPjcRCFVyx+xZM5YO8X
         0Xz8EhNt0VVL+rJ+24+GKya7+Lzsp1VOG4wfmAUC4PGvcLR2F37iGKHl7mOp7bNFxPp5
         HVsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nPFAKgC5MJUbjGIiYd/bK7UYQdtOmJnxxJ9GavM+djv6en6WPOP0rMhdlTFtg+ltIQaC+qMtBLqFdJ6ISNyvd@lists.infradead.org
X-Gm-Message-State: AOJu0YzWYGm1tbEYpS5pF/4vmgI6I4UESCFCif4etsieG7S1PbV6QZS2
	F2otC+oSxTEboGJkFqqqZbNdcSqG/vhUn+WtKZjxVzxwm1XOdC0WgCsS
X-Gm-Gg: Acq92OFtFs1oiT7ERns1f4F521yx1W+l6vkcz2hnFaaogFAyanzypNd3oU/MQxW6DYs
	FMKrcxwAcRg5H9azAt1rkSMRSlGHEMMwup/NOyaAkuUcU970msR3d2YataYIf+onGfGUo/kcIyk
	rGfOZFVx5cEYNCl5r9SbXusxu+dCRk+LeU1YuuNt4r2N2Owwz6BAbCxQowfWnIfZUZsENqbPi4a
	cthV1gZ3u9xSF271rpimDoueCZm1iHIr3iyvFlFHgFJ08h5QXWHyzXF7cPVGvzyefZ+4h4bGd5K
	NMQ7tEEiRl9ZZKeMLsrTlc9ogXuIdHoSq7zUAdYxRN015V5qhCn3e0sQBZo8kmB8GMMNEzaGUq/
	sXyWAyZOMQ6ysQdG4zstDPppzJZgAWYfAF08LiftONltLX1je2w+3k5uMiEfnwjyseF4ccHYHva
	K2Owz8lcUUqRW+LanlpImAIgmUbh/GGoGLdcXrQ26jVlFPpTSQWnvZ52etCH3IS8mAspJo
X-Received: by 2002:a17:903:1250:b0:2bd:7bec:f0d8 with SMTP id d9443c01a7336-2bd7e8386dbmr42166865ad.13.1778844334085;
        Fri, 15 May 2026 04:25:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:25:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/4] ASoC: stm: stm32_spdifrx: Use guard() for spin locks
Date: Fri, 15 May 2026 18:24:58 +0700
Message-ID: <20260515112458.34378-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_042534_987158_640178A1 
X-CRM114-Status: GOOD (  13.86  )
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
 sound/soc/stm/stm32_spdifrx.c | 44 +++++++++++++----------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 57b711c44278..2f83ca989e68 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -322,7 +322,6 @@ static void stm32_spdifrx_dma_ctrl_stop(struct stm32_spdifrx_data *spdifrx)
 static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 {
 	int cr, cr_mask, imr, ret;
-	unsigned long flags;
 
 	/* Enable IRQs */
 	imr = SPDIFRX_IMR_IFEIE | SPDIFRX_IMR_SYNCDIE | SPDIFRX_IMR_PERRIE;
@@ -330,7 +329,7 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&spdifrx->lock, flags);
+	guard(spinlock_irqsave)(&spdifrx->lock);
 
 	spdifrx->refcount++;
 
@@ -365,22 +364,17 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 				"Failed to start synchronization\n");
 	}
 
-	spin_unlock_irqrestore(&spdifrx->lock, flags);
-
 	return ret;
 }
 
 static void stm32_spdifrx_stop(struct stm32_spdifrx_data *spdifrx)
 {
 	int cr, cr_mask, reg;
-	unsigned long flags;
 
-	spin_lock_irqsave(&spdifrx->lock, flags);
+	guard(spinlock_irqsave)(&spdifrx->lock);
 
-	if (--spdifrx->refcount) {
-		spin_unlock_irqrestore(&spdifrx->lock, flags);
+	if (--spdifrx->refcount)
 		return;
-	}
 
 	cr = SPDIFRX_CR_SPDIFENSET(SPDIFRX_SPDIFEN_DISABLE);
 	cr_mask = SPDIFRX_CR_SPDIFEN_MASK | SPDIFRX_CR_RXDMAEN;
@@ -396,8 +390,6 @@ static void stm32_spdifrx_stop(struct stm32_spdifrx_data *spdifrx)
 	/* dummy read to clear CSRNE and RXNE in status register */
 	regmap_read(spdifrx->regmap, STM32_SPDIFRX_DR, &reg);
 	regmap_read(spdifrx->regmap, STM32_SPDIFRX_CSR, &reg);
-
-	spin_unlock_irqrestore(&spdifrx->lock, flags);
 }
 
 static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
@@ -744,19 +736,19 @@ static irqreturn_t stm32_spdifrx_isr(int irq, void *devid)
 			return IRQ_HANDLED;
 		}
 
-		spin_lock(&spdifrx->irq_lock);
-		if (spdifrx->substream)
-			snd_pcm_stop(spdifrx->substream,
-				     SNDRV_PCM_STATE_DISCONNECTED);
-		spin_unlock(&spdifrx->irq_lock);
+		scoped_guard(spinlock, &spdifrx->irq_lock) {
+			if (spdifrx->substream)
+				snd_pcm_stop(spdifrx->substream,
+					     SNDRV_PCM_STATE_DISCONNECTED);
+		}
 
 		return IRQ_HANDLED;
 	}
 
-	spin_lock(&spdifrx->irq_lock);
-	if (err_xrun && spdifrx->substream)
-		snd_pcm_stop_xrun(spdifrx->substream);
-	spin_unlock(&spdifrx->irq_lock);
+	scoped_guard(spinlock, &spdifrx->irq_lock) {
+		if (err_xrun && spdifrx->substream)
+			snd_pcm_stop_xrun(spdifrx->substream);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -765,12 +757,10 @@ static int stm32_spdifrx_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_spdifrx_data *spdifrx = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&spdifrx->irq_lock, flags);
-	spdifrx->substream = substream;
-	spin_unlock_irqrestore(&spdifrx->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &spdifrx->irq_lock)
+		spdifrx->substream = substream;
 
 	ret = clk_prepare_enable(spdifrx->kclk);
 	if (ret)
@@ -846,11 +836,9 @@ static void stm32_spdifrx_shutdown(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_spdifrx_data *spdifrx = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 
-	spin_lock_irqsave(&spdifrx->irq_lock, flags);
-	spdifrx->substream = NULL;
-	spin_unlock_irqrestore(&spdifrx->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &spdifrx->irq_lock)
+		spdifrx->substream = NULL;
 
 	clk_disable_unprepare(spdifrx->kclk);
 }
-- 
2.43.0


