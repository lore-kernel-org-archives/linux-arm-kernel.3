Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C6ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXOb3YdKRM4sg0OdEZWS62sCVC29WoJvCtzBLBwZdiI=; b=bXb20X7z6j4ZYIKlytUYau+ITv
	Yo5V9xGeOw/mCYuaCxP8Kt+DH+u7+aoRM9+7Isrix5N2wekq6e61yxZMT3Ol3b2otp64fpHIYztHj
	PAl0g/fn+uIKNtsAksdqfD+oSqim0Qr4bx5MsTQpJQjzNitUKblevZFbBaBsgf35ZvM04wVoAsn6O
	5Ib9fTpwUB5rkYuTDsbFZJI+pWIotkqD2dzCCekbxjsNu1NKJaVAPB9uKrs9kaE+BSwOVd5n3CF4m
	k5WOIjFiYTMt+CsWIezb9sp8ysqMOdFoyiPehAEBFMP1xPm1cD18PabQ4IyW6q81GugkquLf4oQSG
	+ymyQrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqfY-00000008B5n-1AQH;
	Fri, 15 May 2026 11:25:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqfV-00000008B4f-305L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:25:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bd80b3aa13so5690415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844325; x=1779449125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXOb3YdKRM4sg0OdEZWS62sCVC29WoJvCtzBLBwZdiI=;
        b=CVOB+ZZGKDixNr0pOUIc4EDTdOC2t/XD3+kEUW7wR0G3M6Vj5I4tYz1igEA5op3BSS
         j8rgQOn/aHczbzRkOw2yYcBOIcJEb2OqT7LXdukgRq+MUAqGdxqVW+PXAzUM9tAzEC68
         yNR+FkfxCafN85durn+Bp+rIZX+Ac4auMF51n2x73PDCRdvMCwjl+xz5yfyHCMHgO5de
         PvLusOKw0qkVrwVkBF7Ls8r31xWJncLwPm3LyctIrIzyQ8DBG6X9FicSRnX1IZiTunTX
         iQT6u9U5M1chSR798Pp9C5Dd4CQUMk9HsDGgutGxOHAM/UZdPIkkfAOriA9Zuic9z0Se
         ICIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844325; x=1779449125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXOb3YdKRM4sg0OdEZWS62sCVC29WoJvCtzBLBwZdiI=;
        b=FSpfwLjtTfFILKwTTHc7fz/cn9b6AioLIB7Nh1uOp49J3adzTltLKO1jKCmOGatxyC
         uFhFAxsnAmfxdodvL3R4g15K7CMumd45Lk5ZW7/bnQyRjnuW97VAzcTZrb0wibYKGqpT
         ITi4tnrd3uNaN0U0HWBbdnNth+RxxBe7d/STOfwbJHkYUu4FnySYD4Bk7EBDK1tISZMG
         IcsmPoarBbQ+sk+LkNUtG+pV5T5m1D8i6GxExiPNjOiJsHB/VDr9Yan8JDtQlNpoIsX2
         x6eAjWnNbs015BUXEtbPIbKyL1D24ktKjqnk4ujdbkRyJfDSTO0vDva/NkBC9a3WWqhS
         +MGg==
X-Forwarded-Encrypted: i=1; AFNElJ9RglhTcy9FkOaBa8LCcz28/ayII8vJsfDDVBkrgXgTRHA9QyfF3+OUBb4rZEyVm5hxj8iUc0lxl2dBlY2tu63K@lists.infradead.org
X-Gm-Message-State: AOJu0YwlOYWFYxUtHpGNh6RJlYIQVxr0IjajG3N1958RUyk9tAyZWV8Q
	afZO34MMbvytl9oba6JnqtJOn7ItTCS+CQefuDqmSK8mhlD/La8Xk+8P
X-Gm-Gg: Acq92OEWe+DTuVb6NG84xSuE5wVvkg/UM7JGOAWv4+P267N43UioL6qgY7mBBM9QuvW
	YezokULaI/fln3Lu7QXXdZV9Rt4xKuVKzjgDVw+i+Kn7EPOEtzXgrV9gD+QiJbrI9Y1vPpNv0RI
	8garr9tRJ6NMJ/U/msIYd7R5TRQT/EIcHiPOO9kMcVdro101fOy5NhKcnVnsRH/1WCisb9600Nk
	RY6EQj8e1+FOVeaMlUanSCABQQMVFAzD26lFv+lhxr+NeM4TPTaeQtzPxpd/gSFnFCfxVtlst+5
	9jOdOLLZdTS87IZC/TjQFAldv4vLkJ/Wo2baInZ9cQqnbOyz8rVYb/ylMJZXHJyR+mkEzaB+eCR
	tJVH61cikGoqGPzES188Jn9bKSFVfmadEUYPR9ZrzVMLQgplOXNtiXwvvQDu4zx6Pe8WwkHuDrh
	VDuoFrOrNt7P80Sa2A7p3/WiE3b80IlUXFFUz5geQ/kjFZjdcHvBoT6z07GA==
X-Received: by 2002:a17:903:b45:b0:2b9:cd2d:6f13 with SMTP id d9443c01a7336-2bd7e7d88e8mr45702405ad.10.1778844324907;
        Fri, 15 May 2026 04:25:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:25:24 -0700 (PDT)
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
Subject: [PATCH v2 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
Date: Fri, 15 May 2026 18:24:56 +0700
Message-ID: <20260515112458.34378-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_042525_767250_1D90203A 
X-CRM114-Status: GOOD (  15.15  )
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

Changes in v2:

 Replace break statements inside scoped_guard() blocks with return 0
 in stm32_i2s trigger handling, since break only exits the implicit
 scoped_guard loop rather than the function switch block.


 sound/soc/stm/stm32_i2s.c | 67 ++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 37 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 6ca21780f21d..ae9e25657f3f 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -615,10 +615,10 @@ static irqreturn_t stm32_i2s_isr(int irq, void *devid)
 	if (flags & I2S_SR_TIFRE)
 		dev_dbg(&pdev->dev, "Frame error\n");
 
-	spin_lock(&i2s->irq_lock);
-	if (err && i2s->substream)
-		snd_pcm_stop_xrun(i2s->substream);
-	spin_unlock(&i2s->irq_lock);
+	scoped_guard(spinlock, &i2s->irq_lock) {
+		if (err && i2s->substream)
+			snd_pcm_stop_xrun(i2s->substream);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -905,12 +905,10 @@ static int stm32_i2s_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&i2s->irq_lock, flags);
-	i2s->substream = substream;
-	spin_unlock_irqrestore(&i2s->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &i2s->irq_lock)
+		i2s->substream = substream;
 
 	if ((i2s->fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_DSP_A)
 		snd_pcm_hw_constraint_single(substream->runtime,
@@ -982,19 +980,19 @@ static int stm32_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 		regmap_write_bits(i2s->regmap, STM32_I2S_IFCR_REG,
 				  I2S_IFCR_MASK, I2S_IFCR_MASK);
 
-		spin_lock(&i2s->lock_fd);
-		i2s->refcount++;
-		if (playback_flg) {
-			ier = I2S_IER_UDRIE;
-		} else {
-			ier = I2S_IER_OVRIE;
-
-			if (STM32_I2S_IS_MASTER(i2s) && i2s->refcount == 1)
-				/* dummy write to gate bus clocks */
-				regmap_write(i2s->regmap,
-					     STM32_I2S_TXDR_REG, 0);
+		scoped_guard(spinlock, &i2s->lock_fd) {
+			i2s->refcount++;
+			if (playback_flg) {
+				ier = I2S_IER_UDRIE;
+			} else {
+				ier = I2S_IER_OVRIE;
+
+				if (STM32_I2S_IS_MASTER(i2s) && i2s->refcount == 1)
+					/* dummy write to gate bus clocks */
+					regmap_write(i2s->regmap,
+						     STM32_I2S_TXDR_REG, 0);
+			}
 		}
-		spin_unlock(&i2s->lock_fd);
 
 		if (STM32_I2S_IS_SLAVE(i2s))
 			ier |= I2S_IER_TIFREIE;
@@ -1016,21 +1014,18 @@ static int stm32_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 					   I2S_IER_OVRIE,
 					   (unsigned int)~I2S_IER_OVRIE);
 
-		spin_lock(&i2s->lock_fd);
-		i2s->refcount--;
-		if (i2s->refcount) {
-			spin_unlock(&i2s->lock_fd);
-			break;
-		}
+		scoped_guard(spinlock, &i2s->lock_fd) {
+			i2s->refcount--;
+			if (i2s->refcount)
+				return 0;
 
-		ret = regmap_update_bits(i2s->regmap, STM32_I2S_CR1_REG,
-					 I2S_CR1_SPE, 0);
-		if (ret < 0) {
-			dev_err(cpu_dai->dev, "Error %d disabling I2S\n", ret);
-			spin_unlock(&i2s->lock_fd);
-			return ret;
+			ret = regmap_update_bits(i2s->regmap, STM32_I2S_CR1_REG,
+						 I2S_CR1_SPE, 0);
+			if (ret < 0) {
+				dev_err(cpu_dai->dev, "Error %d disabling I2S\n", ret);
+				return ret;
+			}
 		}
-		spin_unlock(&i2s->lock_fd);
 
 		cfg1_mask = I2S_CFG1_RXDMAEN | I2S_CFG1_TXDMAEN;
 		regmap_update_bits(i2s->regmap, STM32_I2S_CFG1_REG,
@@ -1047,7 +1042,6 @@ static void stm32_i2s_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 
 	clk_disable_unprepare(i2s->i2sclk);
 
@@ -1059,9 +1053,8 @@ static void stm32_i2s_shutdown(struct snd_pcm_substream *substream,
 	if (!i2s->i2smclk && i2s->put_i2s_clk_rate)
 		i2s->put_i2s_clk_rate(i2s);
 
-	spin_lock_irqsave(&i2s->irq_lock, flags);
-	i2s->substream = NULL;
-	spin_unlock_irqrestore(&i2s->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &i2s->irq_lock)
+		i2s->substream = NULL;
 }
 
 static int stm32_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
-- 
2.43.0


