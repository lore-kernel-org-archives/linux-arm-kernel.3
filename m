Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD1CCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=; b=LjPbV/tyZDGpgzXZt25iwC5gg3
	3uenOjZGJWYJ4W3R0bG67xgDs4I1Dp2rw1YLMC1N3sbGUmbBg6Sub2NMAkiSAu1fSGP76if6SLL55
	akarE4RObiGYtDx+eBUYrHjMnPLVpC63kHEICdc2Yvfc0X+UAXBUZjjqvPCVshkKZT/1cQHKE+4ms
	YX21iT4VGGG/a0XTMgSfub1LPZ4ADzCNjr7pOUF2KF7nFxbD/tFF52YSTwjQ68bX5OvcSrF1JmTcE
	fkvlgLMpFxGR6RKDbN7QnqCyyZ4mYN7VHVZseRh0Cbr8KmmbK+lY0Wxi4//fjkebGl5GJooRnR8og
	6DzHyxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3nE-0000000Dyek-1Nn0;
	Mon, 15 Jun 2026 09:39:44 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3nC-0000000Dydz-2Myp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:39:43 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so2221919a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516382; x=1782121182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=EeaQZeXYjhjfxiouekkSt++JfkSqLvCZVj4mzzIIp9etLMTvt7PM7oD8tqNX0mtMmT
         c+GfD8vR5mdClFBe/FtTsuyP4KZ6c7nl1yjESEGEtn+BgNnz7vbAo7/X0eoOh5d/zzWt
         Y0u5/vs7jUpR+DEMk5kiAFKsxpWk4EXpmMnYPIYQ56ugZt/o9mRY1dDhRrouSUur9SYO
         2sxYgS+Lo1GhsPh8be3fsRdim8Y//kTcKOjnrEEB513KNJ/dXqlJpTpfGji1cRCCtslT
         OoL0nNCmW8bvhCX6MwZqXcIKIXbt0REHt/D+qp29idrr4pK//fy/0/mliusuEOoyeOPu
         7Lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516382; x=1782121182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XAdGAHmWyaxfC0CIkFTqcFEJz2zy9rtxVk5mFpwGBY=;
        b=l39IFUHmW6YqaNixbFwLue+/QvwTGk8QrOHDDhbBo/AoJ0izK0T9OuGco26dCC3dXr
         tCawRqMN9AC4T/roynlYmm/mZcRbQpgjkbPxb8ESl2lyhrpQr6CDoizifRRGgGW1GLEh
         QBp6N/Uaa71vySjWfGr9EryXDvZqrDKquKy8KTRQLbJhA7Vo2pDXJ/iJyKGbA28oGlC3
         8/2FYodE3QFosrV8P8pprrx+e04lOgv0HQZK89d2LmwiiVCh9Bc6Olr8aaP/IA6CY7y3
         48hw34Tx2udhWLKm7FRuGfNISxyrX9v+QhRCsLD4k9AMYUEzM/9Gmjn01jD0Cy4/30vj
         h/dw==
X-Forwarded-Encrypted: i=1; AFNElJ/3GyLkYFG3oPfqc9Fbk/GTqMvt/c0HI5AcablLdIA3P6VQqtkyXODRlAJaaDxqftZ0tWlMpx5zTPktIWAXXVyT@lists.infradead.org
X-Gm-Message-State: AOJu0YwZt/nyOd9jR86kM+pzU7y4BOaLYougSGP5sO6Bj80dh+BMECnH
	3DQ7+lRZv3IodJaPAXcvfq4qBz4Gq3AC1duZJ46NuuFuOAqForWqNAVN
X-Gm-Gg: Acq92OGR13/Paol+Q8Hin5bY6lsxGsDjHybFqLzUtnOT9v5bdl+e7YTsuDsKTe0LqeI
	grFJEuSZ3f5iST9JrGgCgbh9H10mXUdjp0D0mnRl2stynWc6UAs7O5KfLncJArItQpQ7Dssc0Wg
	Q7lBJbJZZGwG4Fbq1HsJf0sXBw3JFtpOkUHbGtBvz8GEGtZR3ciRnZq9nBobfc7edTn9OqUXE8/
	SzU8zRFtD9Qploj4w+8mnnkH5LKj83l/oWzFVHIr5vA+TlXMd4QXRBIOVJXwdtysASviPl3MwJn
	QWjvNzE7DCbJ3EnO1EZnKErX/Oo6S5VaTrFmYR4cOefzK1HHLm4nmhdx3tikOSWgPAFpSedZjpr
	GhXd9rePEn0mw4WJetpChHgDfy5VTunID5XdTZGLoAY4lmahMLlt6T6r297zZ24nFtIN9HZmKOe
	dETeucRi8flXMA6ydN3WHZlkMMnIBEGSO6gTEtYpIMHnorpGi5P5ZBumS+lg==
X-Received: by 2002:a17:90b:33ce:b0:36b:3ecd:88d2 with SMTP id 98e67ed59e1d1-37a01847928mr13640118a91.3.1781516381562;
        Mon, 15 Jun 2026 02:39:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:39:40 -0700 (PDT)
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
Subject: [PATCH v2 02/11] ASoC: fsl_audmix: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:15 +0700
Message-ID: <20260615093824.115751-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_023942_602915_AB64B547 
X-CRM114-Status: GOOD (  11.22  )
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


