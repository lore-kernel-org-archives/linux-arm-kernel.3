Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C13DCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=; b=gxBXXIamKKwViUbQjl791mMZlx
	/MNjWWsfcwLrWJALAkYtH6+5H/rZ4F7i4gqm446pfmCdzQBFZ/N3oqWK8vItLlMokEa62+yF5A/53
	EDAEWCYc2oA1IlXOM/O6B6toVhYxW7dSMWRWlJGMJqJKvdTXt0bisHZCuco9+3Yz8Uj5gTZ9vKUTl
	/HlmryGhOpyvu4/1Dxv2d1iBJfuhquxD/1CO9vMmA7xzkDh/GKQJxq8dNZhmVAn4xYBxBHCkefJLp
	DERChoKbTd+Rs9mk73HF5RaFaeriq7KrY0K8fhopdDVTjDK1AX7N7hz75WgAVjYCyntipj/XzYmxA
	lgZhsBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3nv-0000000DyuM-2e3P;
	Mon, 15 Jun 2026 09:40:27 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3ns-0000000DytE-1SRN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:40:25 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so1799095a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516423; x=1782121223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=U8+MRy6sH92bC6y8WHivKhtVgQkvWkt+2zkRD+P2KRDdfADM5JSpkfPBUDOiPyUJHG
         JNM+/gexNLzUJb5as2xLHWmhrAqBmduDmB2L5j31wDMXPAlIz16vorQEqHUgVCJpAHB9
         T40UJlzg2MYQKEdefyO8PQBmF3xYIG/oLMbECqFsY8jPiw6XtKIXVJUX7ZLRj1Ar3i/6
         +ivZtoHzohPGJRS1PM9cN6PiHXXLuUOJoMMsVitGhh2+eKmGpGDjCmvgrUfwjUWzXxFp
         gW8SigJklKvyoE7D2CfJJoRcK09/x+PE6xkUvXzKBzEPPGw0D0xJnf9oTAfEBlS+fHf6
         5v5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516423; x=1782121223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=c8Vw5RJF6aZhCYVdoF4Fk/t0iB4eAnA6jZ2ybqCLlsoXkZ7wB/OxCXYoo6oPTNqQZQ
         7lTgzJ0QTIxzYYhEzAUzRTIuMB7A3CDXY/aqLwA3DAC+5T5Qt8ikjj2UORVv6hdReizf
         eP0O4kx5TSGQuZ3KdrrRFSbfKypV4ze9EcKY1pFl+Gux6NlTwXgMAB+sbshG9D/Qm8dC
         d7sodlcGBEnq/g8vZrECtv7n8OmcGkhTDYw5Sj7eF2daxTYSlVpiwiDs7WpysL2UuCDh
         bUPOYuH1nx5UgXvvCWBfVesGpSIDs77lW6VtGFd8yrQuu3XWwu1gWriX77aI4ELdvrvn
         AM6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Ixy/kcJFbwtIBDCpHBxdYVlAKgZW4RARPA/Th2PYEpbJJKwzjtCbjpbFkvYiDrKqaTpGU21WOqRQa1xbTE2UX@lists.infradead.org
X-Gm-Message-State: AOJu0YztVifby9NCGacoNZMu8ehErcEeTD9/mDKciSJJ/p3AXfCdsiOf
	SPG7vCRHpP2zB6XKknP1jHvn6XPCH7/HqLLmV7DPXy2f+qoaa2dhm6KB
X-Gm-Gg: Acq92OED8gFtXQRdPLwpHf57nDFamwY3fy4A8nGI/E39XVGWALcTVVlXKaGpj6hN+7H
	Bwd5vU8E0yjr0b/Ge/YHZEhlxat2yvNcnONa18x15yYFQQgaxiiRpvc3JwPXd96zUl04Aq1xram
	V3nOAoWj+xMck65phPr2En26MaNrf7lzfxYfwfghdtp/1brucPCAfS8bUC53YKDwLtMdfiXzA4+
	U0bfnliyOXqnIP1VZtpyzvE0J59GKVt0k9aUGB1MsexJgsV7bnfZ3wslTfTvNxXWdoW/U0H5cvj
	JxRY1RISGB3GKwzx1WrG1gr3HSpnz7hvq5n6Rv46ECNG9ihvGK63Fgp3utv4m+C2t3Hn+HkTaak
	4KYCAvtUcMn2iC2pczjXy5wzGpjDvnkaX2rnemDKHO37jPrHJuer36+tiRzTGBPiccBPAsD1LGe
	puSfCrjrDksmboUAyQ3SjqNOlPiuqxV4bQQhhKxXinMxDYe2cwTe11TBy7JKuT/kpE1rMY
X-Received: by 2002:a17:90b:3a81:b0:36d:633a:e7e5 with SMTP id 98e67ed59e1d1-37c2bc5d64bmr9860091a91.3.1781516423443;
        Mon, 15 Jun 2026 02:40:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:21 -0700 (PDT)
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
Subject: [PATCH v2 04/11] ASoC: fsl_esai: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:17 +0700
Message-ID: <20260615093824.115751-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_024024_378692_B53786F3 
X-CRM114-Status: GOOD (  12.23  )
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


