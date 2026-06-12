Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA38CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=; b=T8dGqcmtW8ubrqb3oHI556ZYxc
	wzEJqUnUJNzMuoU0o4Pde1syw0CkQNAN3M9rXt3LN/s6Tgt1WMMxPafs0MnLCkEo3t9+o653Stu/H
	3sQcx9BfNOtmM7/cbMTkci92FhwciwhNGZ6J1nnS9RorcB9NPUyA0xXBHrPnWWROkZzs05ZAecdky
	AQRD7nBfs8nqCkuHRd8tg0VT1UdggliDGgE+CwOBBypkunAyZhzTIS2qVCLI6LOY3cZqecu7Th7/g
	aJW3B/u5mUCj9arnYpuc2VZbKYYM14rPZq3sCTcXWcS4QQ6sNy8B2IRw9Krx23eZ7w3hKqmzi8sk6
	YFv9i2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ut-0000000Ay8B-1iqZ;
	Fri, 12 Jun 2026 13:27:23 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ur-0000000Ay6c-0jg0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:27:22 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1363fe80fe8so1467828c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270840; x=1781875640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=HJKQYpz78hf0a/NRklTiId4H/Spu9Wvrko7YrO+JVufwKbIV0+M32bGuwwY5w5xpC/
         cLKK1CTWZ8SbKU9+UXCOsNmiWacy79X++C8XjCKSN741CwvupOxLHFE5oh10z5sPbrYv
         rJYKBNHcI6XujnAJEys/a70juircCjfIDPzkMYbm3vc0L0WMVmqUrwNZ6i7x2vpNBXwr
         d+Hh6pYxVjJ/8YRHXIa7tHowHXzFXbtxTrtm2D8kt0/KZ1XLTL9+Iq6G4wYeynLyKPdl
         xqSe3TdZD+5mTNCraDyjvNWwc/zrJl/5Uer7WWXa7ZlFUQVDDeOFYV8wgHIotqwjt4TB
         +ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270840; x=1781875640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=kfCactTPPtrmWL2ImNqt1v1BwOacs5YUxMUQymEaz9pqACNJq5rxeEWyz8uO/WdFt/
         +vDjeOzNPg3SMbyoxPKjOmSKxKRv4T0S5rxDea236kFf42iUJG0eihkjE9AMLDaSqsMD
         iSuRJX9EJYsZ+8o0pjfzRyg1E3PTwC0bIodvBGl0G1FoHmNgbxYtFtyIPUeENmzVCl/F
         pZ43ltoOemgVSN/xHoDpmEW4G/OceiIv3FaieHxKbtQ8Ev2TbRdHFpdwLR7wD8Dt+Rcc
         HqKCK7YvsddZ+dVpIuztMXBLNRY0waZt4WLmNvmNZK9GLKdzt2yggQUOIMOZF+S9/d6r
         85ew==
X-Forwarded-Encrypted: i=1; AFNElJ/s6mmJ/vtwOb9E/xKeWuSg0kLbXzxwraTgKXfp/eig/I71Cq6hEjeI/hV3jChvCyEM+Dcz++Tw2IdfqG9b9vgU@lists.infradead.org
X-Gm-Message-State: AOJu0YxFTk7fF7Yy/WsL7/nlu9VTDfRatvhhxRmaCOPRsFxpKCaXU9Cp
	rmO5cL4Ht2vKqlNjvLb8RJfh6p5XehBYSdddo6bBg4X/j/FX8a5umQxT
X-Gm-Gg: Acq92OH+b/P0fyK2oUCSqEMbzYerDBVBk26Nyt4reZaF3AYVwZzYhendxkw3TFOJwSO
	PiDmVF7rL4XEMGWWo8f/qnctx0mlzwnvZPLopusUrfJJiOA6GzD8FDI5j83xc760Lsb3AK0fd//
	JIxVCqjpJznxCTrRWHzSPK1i4CXh31/YjYsVJzKOlyNDZFxFC0Yk1ek7PsCHKyZLp87gInX75W7
	hu0dG2zNdnelaG5nxj1FZ/Y7hrOVtNBY0U7daM4dACt93fCivAkBMSJ8IRXxVRvw2OLKBEDJR6i
	yh+9Z6/cxOGfdb8cLlt+PvBLRGD/wS30hd7x6brGe8Pv4WYFSCHqtUWYXjx8a7topTDBP42qSfd
	2TTSz3oFgdIw1hbNHS7qbIf9XoWqZENasAy1PG1utSquq//wAv3999XMJfGiMFMf6dQ10a7fle3
	fhAXwehPnt2k+td3Qa5xxH8PmwMOhOGJRlHoT6yBYeRpP8f8cZACQCDkcA5w==
X-Received: by 2002:a05:7300:238b:b0:2f5:3fb3:4a76 with SMTP id 5a478bee46e88-3081ff73b6fmr1678230eec.10.1781270840085;
        Fri, 12 Jun 2026 06:27:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:19 -0700 (PDT)
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
Subject: [PATCH 04/11] ASoC: fsl_esai: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:32 +0700
Message-ID: <20260612132639.78086-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062721_218783_0F81BA96 
X-CRM114-Status: GOOD (  11.82  )
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
 sound/soc/fsl/fsl_esai.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index cde0b0c6c1ef..4a530a6c33f0 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -709,10 +709,9 @@ static void fsl_esai_hw_reset(struct work_struct *work)
 {
 	struct fsl_esai *esai_priv = container_of(work, struct fsl_esai, work);
 	bool tx = true, rx = false, enabled[2];
-	unsigned long lock_flags;
 	u32 tfcr, rfcr;
 
-	spin_lock_irqsave(&esai_priv->lock, lock_flags);
+	guard(spinlock_irqsave)(&esai_priv->lock);
 	/* Save the registers */
 	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
 	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
@@ -750,8 +749,6 @@ static void fsl_esai_hw_reset(struct work_struct *work)
 		fsl_esai_trigger_start(esai_priv, tx);
 	if (enabled[rx])
 		fsl_esai_trigger_start(esai_priv, rx);
-
-	spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
 }
 
 static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -759,7 +756,6 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	unsigned long lock_flags;
 
 	esai_priv->channels[tx] = substream->runtime->channels;
 
@@ -767,16 +763,14 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&esai_priv->lock, lock_flags);
-		fsl_esai_trigger_start(esai_priv, tx);
-		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &esai_priv->lock)
+			fsl_esai_trigger_start(esai_priv, tx);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&esai_priv->lock, lock_flags);
-		fsl_esai_trigger_stop(esai_priv, tx);
-		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &esai_priv->lock)
+			fsl_esai_trigger_stop(esai_priv, tx);
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0


