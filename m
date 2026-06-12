Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FD6CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=; b=OxEUyuV/4VIyIs0v1ErhUoSHkb
	2WfSs3btFz43LuWuidcgrjjMIbkuCxtMHpwDUhyzUu8O1tWhvaPZ6avGp1aFlDrLlmf0ysV9UhC2s
	LZxSSVIkV1eoHPXedR3e+D0IHW52xHAC9c2mUWhfRyvSKi8LqppKvobron6gYXo5F6I5VQVZ6V3tn
	SSrmtKRh3BALFJgekWkdzM70biYMP/E+/TqcVVwD02BOwjH4VdAPY+7YWfzeNALhUPE5+p6e3VB2U
	Z/lW8KoKLArtx98ompNOzZ6oaZWyMpmuFMs/inc7VRmQsrovLhjtUR5USvlYoLU0tNT9Y6ETAytv6
	ojme7aBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1uj-0000000Ay26-0Ov5;
	Fri, 12 Jun 2026 13:27:13 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ug-0000000Ay18-0ouB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:27:12 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1384f8ee710so572036c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270829; x=1781875629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=Vr+DQREJo9GrptgiAy2ud3iSxyv51tOaDpK4wyCIGs8cS1k5V14I6rCe7RZYus08kW
         Ff7BG6Sw0tForzPfI230M+CA7O4FcA/ujHUdJ6fiIsOJiXd0W1PtXf9S5eiFcexG7AvM
         Ze/dViUJYWHMUNDsbplJFnFejcd9SmFb5K6O2MVxZAMlYR+IxrAR9oO6HiyN1X2FNinB
         YuckOmRv5ot7B0tKeTJnyE7fAHgpsZlwwNdxPcoRBU6WO8c/GLeNKOaPyo+baQIH/zu/
         qFc/ixuYMzpEBEJcHulG4ozLNXx6rnZlG2ZWLjfctQl/2XF+eB1nZAIMteFwYgN3MXOa
         uujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270829; x=1781875629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=s1XxqyeY/wcZ9FiTHyE6zBDn351vjMfh3pzeALunY7qyuedYW/RhzjjD+W5DNFZJRz
         B0qpED06FxgTISod39B33fkSUIlTVkKQwAPYpIBHUFnkAqpQDQWh+ObVI25upuQxEHbB
         YYwPdKb1YTB6t9RjIYe8zOEF4Xehu8utStDh3YzpwayfhHwDaKsEjlA4C71+7XaSTqEl
         JjI3Fy5dTNhf0AALf/MWt8brMbKw49Sl8oFczo2L37pjhInPwrNyrYuMo2Rwf0LCOKUo
         a49WSjukyvru3xWqpSxgUqVLo76yC3Q6yz14whoShep68+1Y3igcVQOcE1cJKCE+VPBi
         jkPw==
X-Forwarded-Encrypted: i=1; AFNElJ+mInzp4K4gaIQKlE+sYrRyNlihrUgdSGW3RLWyX9jebreK2Ni4n+5ITwL1VT3XUovsBEzAB00sLshinfg3WnqK@lists.infradead.org
X-Gm-Message-State: AOJu0YxD2z0q0tCVpUIL29+OlP7TCnNoV6EP65k3D342Zvi73JUmLR1G
	i32r926ihCpQKCZbpfTxGFWGR2MiCYRU65ZtY2Si/9+xcaS6YoIN5cBY
X-Gm-Gg: Acq92OE0FbprMkeLjUg79Ob8sUESvTcZ6+qnxPfxztTJonqzcAC/TvRRutTse8BJK+A
	3zuj1mMV74ER+26c3ubhs01neyWggL7JX8C160b9+rZGUSWc7DbDhtvaMrdLvlLu4AbdRIXm6+O
	oC1P/Bl0JcH7u67ukSMR4JeXS6cmF+QqAvAIAw+tJ1Xm2Vj9ATkGsuBuCfq7NodmDrmYPSaussq
	QaX5pbE8cUJgeWqDyPgCwc6WjmckmVdViry0uoh07TaEUDW04/womXkoM9pEiqMiccVyN3y73AY
	a7B30zcw8BDIVdBh2u4Upa6BdaaUyFY2CsaZ/wOVhLZ/5fctO8lFk16GwM/IVXrDDmndRwVh6A5
	XkjPVB0OUG69HOHtU38umy1uEliz+Wd+N5GRsbA1VeGJ3CuNWUJxsY0sy43HfyK77I+27C768zn
	+66lmB3YY/OIgstSx8F9Yeb9tAK0082IKXXZ7sE6IjcJ2cWFDWeYVmuROVsg==
X-Received: by 2002:a05:7301:fa0b:b0:304:2176:a871 with SMTP id 5a478bee46e88-3081fcdd9f9mr1776040eec.0.1781270829171;
        Fri, 12 Jun 2026 06:27:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:08 -0700 (PDT)
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
Subject: [PATCH 02/11] ASoC: fsl_audmix: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:30 +0700
Message-ID: <20260612132639.78086-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062710_597116_F99920FE 
X-CRM114-Status: GOOD (  10.71  )
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
 sound/soc/fsl/fsl_audmix.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 40a3b7432174..066239c64037 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -280,7 +280,6 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
 	struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
-	unsigned long lock_flags;
 
 	/* Capture stream shall not be handled */
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
@@ -290,16 +289,14 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&priv->lock, lock_flags);
-		priv->tdms |= BIT(dai->driver->id);
-		spin_unlock_irqrestore(&priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &priv->lock)
+			priv->tdms |= BIT(dai->driver->id);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&priv->lock, lock_flags);
-		priv->tdms &= ~BIT(dai->driver->id);
-		spin_unlock_irqrestore(&priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &priv->lock)
+			priv->tdms &= ~BIT(dai->driver->id);
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0


