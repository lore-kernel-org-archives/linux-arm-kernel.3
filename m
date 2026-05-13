Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA45CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lGs9D+YRCQGi58C7TkoM1KuAOJdJ2M4q7kERCI4rfg=; b=AtGZ6w0L7pEp33hbnBTxGvJPfX
	csB+QDLnhk/cwoFdY7q1xR06vraGDN0REb59zfyyN8DMkpFZ1m4Y7lD6QLbaredjRPxO/S0juJ9+L
	o+PN62jaPkEOuB4iDNXDZkGpOo3x3PZTGMtM+P1JWEj6pBTeTxLQ0cW8avt7XqPIPXBmzPsZUtQjD
	mFlXKUcJ5G9ugacsdGAU6ix2LvMsZx4wvEUpO93VVYDSIdSlOgF6/FjJJ5/1AH2Q7NxIdGBFZ50YL
	sqg0EPzYHg84cMnUc/3cO2cQeoGsjCCkQMY2Bm7dfKie26K2vU/TRDzCe2daJGBydiB/QTkilHj3i
	uEggkt/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74Q-00000002ED4-1pUn;
	Wed, 13 May 2026 10:44:06 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74M-00000002EBO-00TZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:44:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b4583f0a1aso43290075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 03:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669041; x=1779273841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lGs9D+YRCQGi58C7TkoM1KuAOJdJ2M4q7kERCI4rfg=;
        b=i+4/Oi9di6Zr5ZCeviiiLB7FMSzmjePeDIgCG8op6XF/R9cVf2Ox/pQjBLzBxsxZ/D
         kyWT7OKsWfE7sEMlS6258ncePdMwN/nOSfh+BhjpcFCXOnke/Z3RN1J1Uav9p1IfQ9yN
         PiJt5MHO1ra5cLd5BHbiehxegWsvqQDlq6v3Y8SVjh/NseN8r+D5SolgwMBPFIJG66UO
         gkWeMhLgr+ZaJFLOYQ+XpKmgHgEECUihzI8w/E8h8oiVZsi09Lqh9olfu26sjFq4K53Z
         Gpob4rXmUXPz840YXLIbABVfZlNBcZ2NHu5FEydNJF3jjeYt5+qpjW3DvEHBx4uprqWK
         XmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669041; x=1779273841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/lGs9D+YRCQGi58C7TkoM1KuAOJdJ2M4q7kERCI4rfg=;
        b=VqY/1pDUqK/Im27dQIFGNhCLRmPcsyZDXL6wq5XIXAsP4vqifUm4Fk3e+15/OGVXjZ
         A/nQgcsNyUjs0E9HB58o6TOKvXpUFIor6ry/xgCEDL/oSMxm1uygaxXzSw4I2XM/OqCp
         LboBxagTXGHTUBUUXoelv6UbT4feg94cKsUXZQFUWNVQUe7DuYTVlvc7brVmvIB31Qg+
         iSSLsxkHMMRV90L1JK2tWvVqajtHVyt40BD7Z1VLinQ2ki0Sb5ke6t5ArPfZCsr16nZQ
         zE4WKK88y+bbQTlGY5ypkDwACzs94lrsrybOygOnn6vDBeGQ6VnHIqbFGqCyXgGqhl/B
         1XYg==
X-Forwarded-Encrypted: i=1; AFNElJ9Dz1EZmD8wETlx9g0drLELyu9sjYUs+Zzm2fyjbZCiAYrUz1w/rZbG1tVfVIVG1/49OTFZIXeJ8VIWD4YBRgOR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7DNrc4+wBG4vGApZ1jeuv80cNzyv4lzDbgNn0eJe4JLPfS9YA
	sLXVUgNtlCQXbksNRff4CYKh8+itONveb9hbci1g2OCprEVllBfYST5X
X-Gm-Gg: Acq92OGU4d/I9ovLlN9qkq3FiRDkPkPqYS0eSwquU6yr7ZQoaTlH6chrdIDlPzYlHjl
	wIEF+VY5YUZGN4Jjm8cYX/+HyxFG2pxRQJKAG1uCi9SVfS3opfU4EvTeFDBZGNKvT/UMLtXTVfO
	9b7NfJk+ypS7fPKExQQgjcMQQW8R93eJU6h8ZQaruXph5UvTLlD3csHuOioSnj5JhdCzZLHaA3r
	AiA54wTgb1S7zDKLFADtnjNpX/zxdH6D7Q8WlDNqeW2rAFWixwLQlsyTmEoLymD+uLUV7kV5lLV
	aoxQYdvv1zV3gh9fX7ptF7pIBS0qiY58Pi0Ilr88y4mrXWqIMrIQLFL+9ec7TFExCkJMZmNKaP8
	4pxrniOgQVb56w8eJtbn7Z7TN2/5qrlAzi6hSzW2rypL/6R8VMK5IfNWV9SXoxxgCL1ooNAU7Ce
	4oM55mFyIwRs+TuzO8UW5R2LchqrVo9yXL3jkqlpW91KCFcOYjBMhjmQBcKQ==
X-Received: by 2002:a17:903:183:b0:2bd:3bfa:51fe with SMTP id d9443c01a7336-2bd3bfa6e4fmr11597115ad.41.1778669041190;
        Wed, 13 May 2026 03:44:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:44:01 -0700 (PDT)
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
Subject: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
Date: Wed, 13 May 2026 17:43:27 +0700
Message-ID: <20260513104329.81592-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513104329.81592-1-phucduc.bui@gmail.com>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_034402_071008_8BFF6DB2 
X-CRM114-Status: GOOD (  15.33  )
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
 sound/soc/stm/stm32_i2s.c | 67 ++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 37 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 6ca21780f21d..4fddb7ecd7fd 100644
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
+				break;
 
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


