Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DC4CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=; b=SDXENg/tsiRR3+AaRiTqSMCU0s
	5YopmKFgYFAvABbgppP8gdwbFUZBIIv/N7JJxbCqdq3ClE9MnJ5WHleUWqKpbzwS9zvljUuPWwH+P
	6XIJjSpFWXHxP3+EkRg9gFYwIPHlz0imPy+dbsDIP8KlzIeVGjWZIAO+7XRpXYRrljfbPNC2C8/oe
	soa5f5a78Sja1OML1w71h8Ra1hbD1bCBJtqedvSMOWGkENEfxX5S9s/ea/gEzlSjR+kGjJjXdSFA3
	Kc783stZDvmO7xZoawf6JiDQjtjYJj8siBrNIUFpSPxtrSnnejU36law1tALuFtWe4GkY4vWcCJij
	WHsF525g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3o0-0000000Dywd-38GO;
	Mon, 15 Jun 2026 09:40:32 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3ny-0000000DyvN-11Sy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:40:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so1118029a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516429; x=1782121229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=CtTZXhnxfC6GR2xHRmOpOA50kCzH+vyfjH5ER3Upy8ME/DU6FGOpHU2EbHfyt5LfL8
         f3En/STdrlyeviM6oYPjVJRtCge3f1WJaWfMHuNgwiTXrGX0FXE6VVc6XnBI5e1fgQ6f
         PTLwl46zLZAQaDXsEshZ/PRkpRfy40/lyo0+E200px0MQI8/e/DVEhmC2Fi5xwVDyuD6
         r0P3kSdIfX7baiJKtmizJwF7+wZjuYuVBwe/wDAVZCh5ig8djifqnkG88DNYM+bm9Fyg
         cLDaW6pFnL8ot6Kd5nJLTxGT838UlXkUYL5qSUXyD+lrUgH8asABeAcpnS+owemZ5hKo
         BkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516429; x=1782121229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=rGb66mNQLFvGOWOGw6r0807luTHs6MZZTdED3MllldZhFFrFaIxCXFUI8auQEUQxCk
         gYSPDhdUIe1qbb4KdrMOLmjtDMVMLbImp8yplHN4QCXY57dbK55HfuXPdSH86JsjmlM7
         ueUYE+bUaTkQRFtjmXhtQfEZn/wI1HzjZnnLpZkmikQGlBrC2zF2Sz5NCLg4iLRCdieb
         /LitidHkQIVrSnVZuO2OsVXyxhFuwu+QkpNL4+KwLou28qIsxbONcGr4EHH6h99IitGp
         uSyXTKeSqRuk84cPteX47Qo5zA+7Oz7HPtmHjxgOo8eLGY8wA8gZb7fNpxg3BXUkYU4n
         MnaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9d04n8u9CuC7KJT54hzAQncmsj/gHGnpyz+xF2alIPGC71TUusLJopuv/acwfVAz9OwC+nSW69/+DZBkYnZIXz@lists.infradead.org
X-Gm-Message-State: AOJu0YxiTWd51nQjke/bXmaOIR2unL5WJBjjr8p5lVZG8zTO2xMO9wbl
	UAc5CtQN6l7EnAWZrAs7n7eAb8ha5MhZMfRLCaM4PNhdEJcg6tJE0z88
X-Gm-Gg: Acq92OF0HluSfQX2jnrEJPl6kWmcP43VFInNS0CCAAzewBBrH6gfQMG3OXeceOCUBu/
	OLJ+f7JMSUvDbvapoFvl+wp8smyQrSiTEBRyQY6s+8kQtM/5PiNL+cG/78rYI7X2gyDy1l212vV
	WQVBzctILRtH9POrgVEbpxHs4PyJ6os6cGQnXIhOgAgeavNsHlHFwCivW7bdME/QBpEoYFIwOZi
	V+Lbs1DVDxCz+TgyfxiQNdVMk3ZXu5NgpidcOYP+rx5Kk3Ty0x+l4foHgLD/0iK3W460nq+NHrI
	hj8Hv8KWHK/u8luhz1KhccDGL50STjC+pD81Wwb0rT7UoJVm1Pg8Nn8UsmGgQBjmRQ9JnROa0mb
	5x0Bw2wCjuCSRr1tj9XfeByBeZs5IuSY0D63P2l6Uecti6K6OOArkOORvxvfXodu7/wMVqQYloh
	h1VH6KGVQI0MDJiM0VY0/mKh231GRl+xYZ+yFf4tvVestHUyKt5dfG1Tvxlw==
X-Received: by 2002:a17:90a:c890:b0:36d:b680:3029 with SMTP id 98e67ed59e1d1-37a01847858mr14328244a91.1.1781516429578;
        Mon, 15 Jun 2026 02:40:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:28 -0700 (PDT)
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
Subject: [PATCH v2 05/11] ASoC: fsl_spdif: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:18 +0700
Message-ID: <20260615093824.115751-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_024030_281040_E367AE57 
X-CRM114-Status: GOOD (  11.59  )
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


