Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AECCD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gq8AnA9QGLhuYSw+tICygG0pQw5Dug4NgZkZsPxWBA=; b=E06tT9rx84Xe5XITyhc1ECNFJO
	tSfm3hCcU2+F33votGOOlLp5Io0ziaygLPUfBJA4MsKVTKW/tGMqmDgLxSuHVrvLsWYCg+eRRmah6
	800DYONGIoTzsX3ixu+NxPDTzR+XgvgwAMlBlk1a68QCe0SbUjW/CWwlreWf0dZzxiYU8Ic1tkQOT
	OMXm9jQhaC9jhqCnX0KN0roxxs1YF0H15BaB3uT/fXJSPjg9nZ/ELx37obOsN2R4EibWuUWY5uJDg
	rEe5zb8t42hpNeuuzA9n+smllwH2orx2PIhpqm5njdKmjXTNtLXQ+2tI380u27fjF2Bd65ph+ZhMz
	w2jphAYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN7Ae-00000002G4U-3MD0;
	Wed, 13 May 2026 10:50:32 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN7Ab-00000002G31-1gfZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:50:30 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-366139223e4so4041344a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669428; x=1779274228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gq8AnA9QGLhuYSw+tICygG0pQw5Dug4NgZkZsPxWBA=;
        b=VLx6KOBWvsOi687mHf0IfmSHBcmLVumaNoZ6e9/fZb8DbuQ+ZhdJjnYV1BoEH0DXIR
         7VEHNgzL0uxNxWQ9LyAaq5adDwhqs8ytZf9wejuVdWAsudV7Je8VWBDz5srbKUe194ee
         PqDmQRT+8DCe3tzSD+VYMW7/JvftoFhlc9+7REZX0JPoVDtjgkzC8T21lzYL7gQUaNq1
         6xvoJb5pxxhPWgzxnjfriV/UqZ/PDDIhrWapF3tNJvfdmXAyWHMf8+G6HDIH0+AfQssw
         dWDgAUQc3pX+kvbTN8mBj3iF32nhsbs+GCZYQQ0AM/6x/GnwGzez+Pw4+kvVLYnY+ECm
         ZsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669428; x=1779274228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gq8AnA9QGLhuYSw+tICygG0pQw5Dug4NgZkZsPxWBA=;
        b=XkytwdGY8kNJJ9bihtZGBwUq1SQb1XhWM2SDgPgu4TjFZA65udcYEwAHzCgzm6fP3/
         prMkgmtTIDelzr3NtrqICMIpOp7exqmXFH4aVXBSQd83enQPZGX8QSMpJFyYD8hfyyTu
         n/v9BCj7HfhVZ/HX7OUhyU15Qx8mNfZ4REnNeoumedLxKEVvoh4mhbEj9hU6L1YO6qOG
         RQW7sMBlOl1/t7WnUCO43vGr9WofAqRq2Vi8cUZwzge4Ea+y82qQvZpSnhpD6fLr0go4
         yHSQTKK7lTX5q9EDNUufHjwkW3jegCdiJZywPIcsFkEjChSCPJlFGpFLgYbs3P9c51Qc
         Nh7A==
X-Forwarded-Encrypted: i=1; AFNElJ/jbVG/KBsjXbyRQqa6YisMDfw0Bj4h8h3hAJOgNJHf6dx/Tb7OCMDPUUPJ2WQ1VcugDw+sKFwPEDsMGS6je3iR@lists.infradead.org
X-Gm-Message-State: AOJu0YwcJlyEJkfqCMnrUPqRrUbknsPY87F6B6Y2v0U86HlS4FOqcgHe
	ssT9M2AnsdbA3nhRs+b41WvOZoA4xID8ml1vpFXBcZPC0R0PMf2LQh6WT6kQuA==
X-Gm-Gg: Acq92OH1l6IWzPckHpd7aP+ZdHZoOuckv5p+81daOcQCPrf8wypd5ZhsC7Hs+PRKBBu
	7OxEp7IAvcLlC4hy+Kw+gT3TbbyQqI4AZQSqEFgpExvKdeQU1haPtTHFnkGpxG+FCB6GWiE86Kl
	Kb48Wr9t/LRGd9m9aX6UsFr3UQLH/1ecmRb4b4MmvziKLegOhapYxAO+T1P0uOsnW62m7kprJT3
	f2G9pNOz7oMJQDj/sRd1vui3cawc4E9JRUHelGWA12e5jUVOemR5XjQlR/ZdukyHgpJhnfapSKt
	f8FunK3iSds3wvk3XcD3flwNM6x+DFD3n0xnG9CJ9rVbKIy6uD6K0bivN98kEla+lMXvrz4l6fc
	19huVVU67UFpp5p7kSkydenCJB033zAG7Q1dCjPO+1HRrk+ibnv6MBHFEANgMfKRgF1XAfqDtpq
	6BL3v49GvuQk91CnFZoGPx/A2l4/6Z3Mxo/cvy0HldQZSFXh+POjuM25qQuQ==
X-Received: by 2002:a17:90b:54cb:b0:368:65bc:e32b with SMTP id 98e67ed59e1d1-368f3c151d8mr2923432a91.15.1778669428352;
        Wed, 13 May 2026 03:50:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf9b543sm2843136a91.16.2026.05.13.03.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:50:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Marcus Cooper <codekipper@gmail.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
Date: Wed, 13 May 2026 17:50:03 +0700
Message-ID: <20260513105003.81880-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_035029_442586_82D89D50 
X-CRM114-Status: GOOD (  11.18  )
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
 sound/soc/sunxi/sun4i-spdif.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index c2ec19437cd7..ec00779182db 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -427,10 +427,9 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 
-	spin_lock_irqsave(&host->lock, flags);
+	guard(spinlock_irqsave)(&host->lock);
 
 	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
 
@@ -444,8 +443,6 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	status[4] = reg & 0xff;
 	status[5] = (reg >> 8) & 0x3;
 
-	spin_unlock_irqrestore(&host->lock, flags);
-
 	return 0;
 }
 
@@ -455,11 +452,10 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 	bool chg0, chg1;
 
-	spin_lock_irqsave(&host->lock, flags);
+	guard(spinlock_irqsave)(&host->lock);
 
 	reg = (u32)status[3] << 24;
 	reg |= (u32)status[2] << 16;
@@ -483,8 +479,6 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 			   SUN4I_SPDIF_TXCFG_CHSTMODE |
 			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
 
-	spin_unlock_irqrestore(&host->lock, flags);
-
 	return chg0 || chg1;
 }
 
-- 
2.43.0


