Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FE9CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=; b=hsoiV92ByZtUPRDatTAD3cIpy6
	Eimq7c6q6YyMBVBFC/7w8oGAaUtCoT1IbC3KKmwsfMCD04ID4VDg4EC2mqVuDPPKOJrx34bglWRBO
	tNCG6AQqUAW+Xs4PYMyzjD7vuWQBKioNuMrT0PexpTT0twDyRRAyRiFBCLhsF1bQ1emVigKNzp/5N
	nkErsPeis58FFsaD1LoMTaQu4gnKg4iRVkTbA397Qz2p3sMZUZKibVC8BKKUfz//jtNQHuLcBnetf
	173XetS02axxw1XWRoRNjIiaL2X4q00Jmd8vWELIHPloOEOLU4sSX3hjzh3xpGy2dFnfxZ9ZWI5P3
	xaRdZfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1uy-0000000AyBi-2H0j;
	Fri, 12 Jun 2026 13:27:28 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1uw-0000000AyAB-0GyW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:27:27 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-3074adb8fcaso2528844eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270845; x=1781875645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=fTvaNjUgjPFKUh8PBOtq0J5132Oes51OiHirX0ztW4tff8PWHRTq0GdKULSAvNhaLC
         7vPCSLvLkxvgzOVL8uJ6JaDBnNtW85LsPv0baLcU65Ha9Q0flfH1iX/lxjCrpMpTCkPa
         RcQN1cs8kYxEyXJDacCD1GPH8pfVitP7NGAtObYChcKb7rcZ/BOrzyUQvQwxIXWo/u3l
         Stque8m0US2YDZr23TVg30m5LugPmFw6bUsbToM4JVN1wGVCMVMHI8SU+VUe80soIy0t
         HcC34uaDUgnF0tDcNcCwwdbbs/w3XGtK37zjF5kEyI5x5NjKInDFPIx/LhzGXHJ169up
         ++ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270845; x=1781875645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=U2zGJu1fugxIGm/7PGlIaFc7TiXEn5lIlbm4uDwkfoU0OQSjzgU4mSbHxKNDLYldhZ
         jfEqO0AsWiPfZ1vj+VHneBaYFZ8ApwBKeMVRpit+f8Vzr7A+RJgVo12lTEd6KTlbTtuJ
         TFi6s71nVLxx9gWxmpV2z1N9zszHxe3Mfg03c1zEGawOmlBNJZhlCflMXQFw3ur++FaA
         xLwldAXyQymFBPYZbeFfSdwZU/R8jt+JWGi7b+tgLYQeKAZQyL3zs5qtCDjek7XlXqmv
         lnw3Mv3+qQmVplPjzIlZCXM1IdTjAr1DtCVE8e6f7E6OJyfqHfCfm0gTOnQ9+HhN5W9r
         jv0g==
X-Forwarded-Encrypted: i=1; AFNElJ/TwU2QwQ4tpO67nQVEUGmGrKJ+5jcsfibfLiAKpTYG+bxQ7FJKm/QAsL4OInBoR+jJc6ocPSN0UQT4IsACukeA@lists.infradead.org
X-Gm-Message-State: AOJu0YyzajLrWMrzyl+vQldH81TYVEz1DeXymHchopefjr8K5c8XqZHh
	sw2vTWiAsX8PTRKd4xp0E4ZDzDU/C9qxMaFGpzF1uT9+OLfu6w9fk62f
X-Gm-Gg: Acq92OER0IkTLaJUoEKS4dgyO6VZiPIKhHcvetQcwSwTcL9uPuz+RpRrCegs+AEU9bX
	VDoZ1HAIEaxSSE3tUDlZCqOnqV8r5HaM0nGwHTcmYLVyPiJNJ6pcqdRlH9UlW8MJl5iTY2RlHKZ
	RuPosG61lq76T01uIJT3acRq/Z7l32gsA+J9EVKgPT8W5P1KkND9ItGef3s949OR8psaQ+ArfZD
	SVg/NVvnM5RljVe7Mph66RIhUWYGGC78BSWx43ulQ6ZYF/aC0oXKQj2Ml0vMcV+3wMf/MTdBbYa
	AkLKLmBj6QmytMSWt4QOwl2kNuoUO9aTISqrscvuw37yo/KQk3PvTMMGKa2Ov1jcrMc1D3Ne1Py
	6i7CqJAUp7UIjIIE9A1QuEWY+3CVfDlPsW3OMQUHLuV9qfUvWaMKgFl3LhiJ6TwncY1MmP1cYJe
	y7tNSkyj1rioTHShMH90VnaP/CCoansSwFBWJdC2f5JM04wXxHXZuQBXl8SmynZxyh2sLp
X-Received: by 2002:a05:7300:2148:b0:2f5:5dd3:1fcf with SMTP id 5a478bee46e88-3081ff97b78mr1839542eec.10.1781270845378;
        Fri, 12 Jun 2026 06:27:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:25 -0700 (PDT)
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
Subject: [PATCH 05/11] ASoC: fsl_spdif: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:33 +0700
Message-ID: <20260612132639.78086-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062726_106289_46F79056 
X-CRM114-Status: GOOD (  10.88  )
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
 sound/soc/fsl/fsl_spdif.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 1b9be85b34c2..ad1206ed9882 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -853,17 +853,15 @@ static int fsl_spdif_subcode_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
-	unsigned long flags;
 	int ret = -EAGAIN;
 
-	spin_lock_irqsave(&ctrl->ctl_lock, flags);
+	guard(spinlock_irqsave)(&ctrl->ctl_lock);
 	if (ctrl->ready_buf) {
 		int idx = (ctrl->ready_buf - 1) * SPDIF_UBITS_SIZE;
 		memcpy(&ucontrol->value.iec958.subcode[0],
 				&ctrl->subcode[idx], SPDIF_UBITS_SIZE);
 		ret = 0;
 	}
-	spin_unlock_irqrestore(&ctrl->ctl_lock, flags);
 
 	return ret;
 }
@@ -885,17 +883,15 @@ static int fsl_spdif_qget(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
-	unsigned long flags;
 	int ret = -EAGAIN;
 
-	spin_lock_irqsave(&ctrl->ctl_lock, flags);
+	guard(spinlock_irqsave)(&ctrl->ctl_lock);
 	if (ctrl->ready_buf) {
 		int idx = (ctrl->ready_buf - 1) * SPDIF_QSUB_SIZE;
 		memcpy(&ucontrol->value.bytes.data[0],
 				&ctrl->qsub[idx], SPDIF_QSUB_SIZE);
 		ret = 0;
 	}
-	spin_unlock_irqrestore(&ctrl->ctl_lock, flags);
 
 	return ret;
 }
-- 
2.43.0


