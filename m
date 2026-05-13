Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E941CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=; b=e0F3WA2TzMMu5WY+4Ej5JjqfAW
	SaCWHI4C//HY5c6FddNOylA9Ee7kPcXEILT6osF8NT1dnb4cxBO4g55a49wNSjVEgxvcXUQ9Nw/Cp
	fWx2w6z955tWAKCDvIWEs2ihhAfFDEM3/cvAV+hS2TnGRjUQhUqu9Em+C6mN8KnJj8rK2sS3aQ8qJ
	TruCKQ1cQIw03Rk+WmwRaQ3Gas6g4YXQ1eGN35JJ7lkWkijMFsUIQRX7PqPrYuLb1/p3kfdvUYu1i
	XXjau62uhk/3V/XSklA2z5g17ls8MZ21LzHghJPklMzzX4QsV2IaWpQFejPGQ6elv19lkMTMqwMFV
	eYS8hqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74S-00000002EEp-2Dgx;
	Wed, 13 May 2026 10:44:08 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74R-00000002EDM-0asp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:44:08 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c80167f56cdso2688950a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669046; x=1779273846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
        b=syVPJGW+YP1HGVru8wmjfa8HvUWHHKqCgS4t/zHNcu/ifehC8QS9S7XeeEl3Myu4PQ
         uS7S8WOx1/b8ciHfoNlYVc0QVd7m0/jPKBAY+7YYJGdaWv1mT4ERxfDWHvLvP8ZbU5Xq
         uT25j+uVZEqbesPxia2D2NM6G7DEW0zW8xaU6i1gBPGM14rH1llCD0NXl7MZq6J7TRyI
         MLUQAIZ/6RnDEnF+VN39UkT4/w+h22b67p+SjsFXfguUF1uWQOAfuvg3tW+n2IxdqC4Q
         s40/0Ixlh3nfXX6WtAQlOVvgtfSsFK/nZlnEd8sQGWRb6XsGSshwe08uaBXI+wNoDKwz
         LBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669046; x=1779273846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
        b=MOuu1ikbgu+bbV/Bi47iLhmlmVVHsKPcwjbSYoMDfCwL4nWkxzACIgcovMmAVRabzm
         YbtGCdO83IkfsSpfColzEet5Ld5Nvf897ORayrAH0PL1C1s82xyQT7hDs7xcxn4TVOuX
         yNNo0KANAHYu09fQFSmVZVHIcSAfDv5zYkHoWBWZzpY8KkvgN17JYGiO/ArAwPfA1AGS
         OdbLY8b1tZpHPGTwMTmm3bm9fk9Lj9OvWKAxHmKtvRsU1MAzvXCRnV8sr9QKiDrCtz3Z
         mlxLWT9Dae2vnpocyhDx50uS6XXUuZrF/Aev/KmQYqiz0BabmKDfIYVqyJegLqHoJ+3q
         ahjw==
X-Forwarded-Encrypted: i=1; AFNElJ+55NfIwfeZyBtAL1F1vasV5fo+iuZL4xj8N3OZsx/J2rzIq68UT9rVy1swY31VPe1GwLxL8Rrwsy/JYMzXql3D@lists.infradead.org
X-Gm-Message-State: AOJu0YwMDZKIghLG/6El46OxG2MlrKfEfH5OCxYp+/74ah9Xs2JWCNAy
	PVlQYUPf4oYYJV6zZ1KNOPZPl4m79Ek+wOcUVFkh62roPP+1DEnHuzrK
X-Gm-Gg: Acq92OGzRDv6zxR7kSoy9eKTRJB+MloTqpSWRc/+vgY0QvU9zcSKxu9+zvyXQ05EOlf
	mxOc7cQlWl7DFE/1XiYuKZy4IV/5+60RQ3bvPaWBGZEiJUQhaF+C9O3XzgxBMcRxc0BEvhEIQ/9
	KZ747OOQIs1sXb6+H7UBPp9xAzrkkEFf6v2j92RiEDJkXkpGK9ES3mNfyiNvbb0TaTRLGIEo5kA
	8/9PI3FekpS96FLaySDdaAkvjDIsVnUHtiO4YjUkI1LD+DwIK8Sn7YGzVNRW4YAIkYTmwLmayml
	rsR8hKy3+PChid1ruoMqwBPS9B0OYIxieXGt2doBpRbwGC/8s97/YjYoCNYhZ7DxTZJyJEYpg8w
	PwsRW7nabIijmvu9u75fpcxBRTY0e1aPpfG0j2wbbMpXUOwdHHhcCP6Ne4CT3ERKO4K1KuSiw6f
	+TdXMA0cICjlxskORTxZjtIPzfLDkswdmJVbLusXsjr3oRNuMPvnzy9Psm2g==
X-Received: by 2002:a17:902:c40f:b0:2ba:bfc:76b5 with SMTP id d9443c01a7336-2bd2f4dba62mr24128275ad.4.1778669046222;
        Wed, 13 May 2026 03:44:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:44:06 -0700 (PDT)
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
Subject: [PATCH 3/4] ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
Date: Wed, 13 May 2026 17:43:28 +0700
Message-ID: <20260513104329.81592-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513104329.81592-1-phucduc.bui@gmail.com>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_034407_189512_BE4B3815 
X-CRM114-Status: GOOD (  14.21  )
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

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_sai_sub.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3e82fa90e719..ea9e8bddd63f 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -280,9 +280,8 @@ static int snd_pcm_iec958_get(struct snd_kcontrol *kcontrol,
 {
 	struct stm32_sai_sub_data *sai = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&sai->ctrl_lock);
+	guard(mutex)(&sai->ctrl_lock);
 	memcpy(uctl->value.iec958.status, sai->iec958.status, 4);
-	mutex_unlock(&sai->ctrl_lock);
 
 	return 0;
 }
@@ -292,9 +291,8 @@ static int snd_pcm_iec958_put(struct snd_kcontrol *kcontrol,
 {
 	struct stm32_sai_sub_data *sai = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&sai->ctrl_lock);
+	guard(mutex)(&sai->ctrl_lock);
 	memcpy(sai->iec958.status, uctl->value.iec958.status, 4);
-	mutex_unlock(&sai->ctrl_lock);
 
 	return 0;
 }
@@ -658,10 +656,10 @@ static irqreturn_t stm32_sai_isr(int irq, void *devid)
 		status = SNDRV_PCM_STATE_XRUN;
 	}
 
-	spin_lock(&sai->irq_lock);
-	if (status != SNDRV_PCM_STATE_RUNNING && sai->substream)
-		snd_pcm_stop_xrun(sai->substream);
-	spin_unlock(&sai->irq_lock);
+	scoped_guard(spinlock, &sai->irq_lock) {
+		if (status != SNDRV_PCM_STATE_RUNNING && sai->substream)
+			snd_pcm_stop_xrun(sai->substream);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -894,11 +892,9 @@ static int stm32_sai_startup(struct snd_pcm_substream *substream,
 {
 	struct stm32_sai_sub_data *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	int imr, cr2, ret;
-	unsigned long flags;
 
-	spin_lock_irqsave(&sai->irq_lock, flags);
-	sai->substream = substream;
-	spin_unlock_irqrestore(&sai->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &sai->irq_lock)
+		sai->substream = substream;
 
 	if (STM_SAI_PROTOCOL_IS_SPDIF(sai)) {
 		snd_pcm_hw_constraint_mask64(substream->runtime,
@@ -1083,7 +1079,7 @@ static void stm32_sai_set_iec958_status(struct stm32_sai_sub_data *sai,
 		return;
 
 	/* Force the sample rate according to runtime rate */
-	mutex_lock(&sai->ctrl_lock);
+	guard(mutex)(&sai->ctrl_lock);
 	switch (runtime->rate) {
 	case 22050:
 		sai->iec958.status[3] = IEC958_AES3_CON_FS_22050;
@@ -1116,7 +1112,6 @@ static void stm32_sai_set_iec958_status(struct stm32_sai_sub_data *sai,
 		sai->iec958.status[3] = IEC958_AES3_CON_FS_NOTID;
 		break;
 	}
-	mutex_unlock(&sai->ctrl_lock);
 }
 
 static int stm32_sai_configure_clock(struct snd_soc_dai *cpu_dai,
@@ -1284,7 +1279,6 @@ static void stm32_sai_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_sai_sub_data *sai = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 
 	stm32_sai_sub_reg_up(sai, STM_SAI_IMR_REGX, SAI_XIMR_MASK, 0);
 
@@ -1298,9 +1292,8 @@ static void stm32_sai_shutdown(struct snd_pcm_substream *substream,
 	if (!sai->sai_mclk && sai->put_sai_ck_rate)
 		sai->put_sai_ck_rate(sai);
 
-	spin_lock_irqsave(&sai->irq_lock, flags);
-	sai->substream = NULL;
-	spin_unlock_irqrestore(&sai->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &sai->irq_lock)
+		sai->substream = NULL;
 }
 
 static int stm32_sai_pcm_new(struct snd_soc_pcm_runtime *rtd,
-- 
2.43.0


