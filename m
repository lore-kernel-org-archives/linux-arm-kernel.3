Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530A6CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=; b=m7iMjQYuFvPau7hDtKuRMS6zBB
	l1VIOL3xrF0z1RuwTMAEmBjKJT+mdMUjPyctLo+w2UhBS8hhXQSop8LZGrL6oNcm9cJlGXgV1xu16
	hje5uwKdOZJ1a7/n+i4v+If5wmqclEkQb6s5Us3vkOQJk/DiPBMbLUFJ/wzUrRqFLN3qXQXNc15jk
	z8GEiJyBOFg/rY7lC6pMvbDzRfzsLfs1MntpWWYZDTj0OjKgrQ6weyJnc50LceOKxEobPWjLUZXUp
	3/l4DxP3QC1X8JXfK1075ZIFfxKC00LS8d89uCTa7pBxZVOZU6EvzyHznsV3g/vPMXVTrU9JQVNJW
	+ZCrGaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqfe-00000008B8o-0G1R;
	Fri, 15 May 2026 11:25:34 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqfa-00000008B6v-1e91
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:25:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so84479345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844329; x=1779449129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
        b=Dq6p8AxPMhQemlYKgPYDvqhTSRmpGa4WETT1rILiD8fdfJ7bnWFpWAudFZs+XyyOvs
         B4ZFly/ZCj1yT3ee2WKP7wFs6CXhlHhOONkXYld57lvapBOWVBBNAo3rKPI4hvy+Nh8d
         jEhXyWHtXQEiq0NLOW4LRihLnjt7mXAC9TKDVKv70RGcJkdfUMNj69RtlANp8PHPnA9g
         xJSHVpBICEkj85yAFfIsb3yxnzkTcxFQq4aT/MOJPYCSY6nMpWaWhBDgWcKZ61MUVHTF
         La4Ik8kp4DUlhXNOAAQTpN3059MDOhduzYS9r4S/4iyoLPWVKgyZP/hkHArETxqHz6XE
         918g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844329; x=1779449129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
        b=ZXBFkDF7whEI7fd/FoETVFUwbfTFWSWvv+4uCA5DDJQYmPDxBKNU6qMI68UuynUM0F
         F2JCHl0r/ZgEZJktdYc3mJZJeeA5/016mEcvt2CtW7f6/2dOKrAmIXrOw2RbcI5n/Noz
         deDQIOOF3inAV/h7+k6Z8n4d+HfhsC7cuIZnAj4U8Lt/Ok5SwxwMF4ZCx5BA4BKuoA0h
         U59IQz5LmRKwABc5pirjdoy8FB17nUq0SAmaYZ9xKW4J3snhCjAmOFdLV8G6b9R8L211
         98RHnrSWfg0oIWWQkbWlz9IkrjDs/vkDahJMZpkHR9yjKiHEvT4FEr9hHPElWBCKXa5t
         37og==
X-Forwarded-Encrypted: i=1; AFNElJ87gp+Iqx1IMUJ/M3TF+EIyYK0AFqZl2W9eLLD05vSZaQQFPNdgmzLFyD19rmK2yhIphvoFIOrkGxK1ijoEzCvp@lists.infradead.org
X-Gm-Message-State: AOJu0YznUgF2tfCQ6aqyMwOk1oXqDI0FfuD5E6iFihUUPq7D5ikFfCpI
	pznpkwfy8M/jhhXt7UNFAfAQcxtcpRC/p0xBLzYmdb+hmloV8IMRKEoF
X-Gm-Gg: Acq92OEof4yl+Pz3W+hDHnIWoBrGHoJJmd9+WVbgx+e5TPHachwMUZC0O/DC3L2wpU0
	Z7DsQeEHUW/JHtRTnGB8gpvHudYfhLshWXE5aI7WQRN//JDZrWb0u4nrp1hEsRhDMPaegrO1VCg
	eoqU2feCAON9HqFzKNGeEeEFNM29R/37K3WX2AtER7Wk7Nky/TvlSEFPqU7NB9MAVLfdhWMmt+K
	fp4VuD74MuPChY6yl+guC9JZMo/cHuQVILLaivtlJoPxx4m0FRkW88bJbTaL8OPp85KCtfSrXO3
	CMbltwiqZ/QQPESNDQYg5tWVflry8YBOnA+sfLFlJm7+gY7i9pYFCIVh/yIXlCo/rrsZF9hDoYr
	6faC4IOKJUWJpapHKfBg+7x5zUI0d8p0+dQG1hMcflNRMU86D54NAMXFEeVBkCphKHNmiJl6CST
	uCZTHL0WIFNtQBzeKzeVStpq6opVKud/qwZ75Nq7dzhYimeaS0BMb1IZYN2afm9pOkxOV6
X-Received: by 2002:a17:902:d5d0:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2bd7e97a6c2mr26865625ad.41.1778844329329;
        Fri, 15 May 2026 04:25:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:25:28 -0700 (PDT)
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
Subject: [PATCH v2 3/4] ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
Date: Fri, 15 May 2026 18:24:57 +0700
Message-ID: <20260515112458.34378-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_042530_444433_AEA297EE 
X-CRM114-Status: GOOD (  13.64  )
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


