Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C361FCD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=; b=xPjXK1MNyMlP5isAWs7vNWjb2n
	xb75BBX7/mBi6laFJ8z5VApmHdCFojDfw9AUsrJrgwuI7oLq1glnlAfL254uooAaqUwuRgWt7ZBh5
	hq5xmYTyRUPCUV50Fdktrgv1gp4sk/zCnTO/CPq0a1MkBX/hRBEtJwukX8pCMgINF45qxlFM0uMrd
	rAC1Df5fljoqEE3060wS+B9/lTvuFczqOpv75tD1u6z1UKqyAMBU8w3JXnRS9Bd/JmNcCy9Fg08hH
	hQPVS293d8LgwwOmU+A7pR0NM1dygKvCAzIHBv8rgza9W5a68ZwzfI8lBCcaXW+IbrPrszDd19+Sl
	Wo51fB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74Z-00000002EIP-0LtK;
	Wed, 13 May 2026 10:44:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74W-00000002EGN-17Jq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:44:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bcd3ac3307so18344125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 03:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669051; x=1779273851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
        b=sW6QQ0sSXDKnflZnVeUj3HTUJTjwYGnROAS+t70VhbP/acSxY5xU3hndzVvMXugEqD
         XAOdbr6GTnW+hw4IrbLCrTihUt3EcLpKc4P6+nTlLNixQIOkCHE3+UY2CWiYzUaLB8ro
         GrOzw0AJV7AMgsQ2e/Y61ut3qj7fq8sSnm6q5wapqrNlIQvrq3+ySezzdi9glLm2b0nz
         eGw/hcnTzRFv+JjImNLaFsxvi6TH8jLi6mITti6ZXVJZURSCSK/wxnz9YUa6VJxXLk6b
         I34ZIaOYC1H0bx1tmcfzFcntcwbI16a1qdVFV254QTlkRhv7Rale2VWHbpkMaGvxNKL0
         zFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669051; x=1779273851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
        b=sHILgkNoCGwRu6IlJgErjHhl6ctl09jwp+8BKSu0vIsqC1hJJEg4Ajr7Myvtvldgfx
         oWdnonEs4EHF8WGZGcJWLIJDKs/SgVGNn0MAzuixK9qlBh63DIGKAu01ze3GjDZ7j0ah
         onyErwYl8cVmFFjOsEEqC9NhstSdZWHNYz5adHB7pLqc5R9fShiAajF5AiLK9EC5y/3f
         Om51J5Ry89vBeU5zpsag/u7zAeFtqQIrLgyTgw/qkeL0SrpOvXqkYthbDUaLAPF7UXbO
         mWYj4ZPnlq34WaMWowVYpSLDvu0fCGvRXBj+AQhXFDIlhVxN0QvrFQOk9cv0DAp99eYQ
         zyJw==
X-Forwarded-Encrypted: i=1; AFNElJ+225xuAf14gHBHiVOp0sOtK0BGRr+dzpG/dhcESMb7LKxRrD9Gxd2PKFz/1aiZRLOpZSbIp76rG4EmGyUbcZDp@lists.infradead.org
X-Gm-Message-State: AOJu0YxlnAFjwPPRp1AqDwAMw/8za7pFrT+gGDhJhecRs4jfhVlDNJCG
	3rphJQMU0H1tsF8HXdgSjci9iUSIba2QgAeTYe2hc2tQFfEZCUHo7e3u
X-Gm-Gg: Acq92OGUeQRY5d5AMQu9Z17h99kFbbfUrz1Dj3lxPdZR84zBeFWxYR22ciAcv9QswgT
	sztL2zqQbKwz0QZyGTh3xff2lvP4N0xOPxR3XCT3RLHoU9FGeoUM/amzHfB4dFwy5LRaoUMiEu6
	XKJXxf4qhbPW0KW+X0TtEblAc9dDaxwnVrTjnTHiF1J3yMngS+G+t9JEBS9MK5MT07GmRe8MV+L
	XmZm42pWXuv8MCLXOMWn4vfSDE0VKncF6f5gQ4BHpieUb7f2+s16UwMy/D2Msgr27PrbVj58kCN
	DdgBPDCX9KAp/wg1sZGTOZJHXZCLjS1LZ82Z4dzVHVJhUFQv4MYeQRoBig8a8D6TSBavwtqe09j
	z/hTcAlGUJpqiiK9zNg2aTOJA8SHiJCg0PZK0aI5Ot/+8ji6f5EwDEevFb7wpY6aGQqE9cyRvBY
	yRbG9FIjoPmvtDNhSxAk9YSIFQqIIcM37ZzNBM5EHjFHWrW/AeOAPUHaamXw==
X-Received: by 2002:a17:903:3843:b0:2b2:4260:109 with SMTP id d9443c01a7336-2bd275c6580mr30109575ad.23.1778669051359;
        Wed, 13 May 2026 03:44:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:44:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: stm: stm32_spdifrx: Use guard() for spin locks
Date: Wed, 13 May 2026 17:43:29 +0700
Message-ID: <20260513104329.81592-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513104329.81592-1-phucduc.bui@gmail.com>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_034412_324309_66880C2D 
X-CRM114-Status: GOOD (  14.24  )
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


