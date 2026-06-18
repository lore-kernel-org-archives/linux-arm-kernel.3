Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBC9CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=; b=0TQm9FpDNe+pOdK/Ure9x0U2gQ
	EWZE2jYVXl6QOdh4dhOn0l61j0yVf9gm2CrsdT1XKAD3znca6gh+tB1LBin5iJaMNbUm3TR6VLY5u
	XA7AafIrqRctZXpgECL4L8i1T7XFpdanfveS3A/Jj+9TQi56Mf6YXDaqdF6vfGlS+mQFUZTrhXl/E
	eY3EUzMm5uaS+DFHvJ5zd2KduvyLpWfa+pozbpMr4JRZmYnXNXokLrzN2Q7o9gC5qLhVF5igmKjS2
	8+a5waQLKhbI59Q+Rt5CHwL0MuBtSF++652alzb7EGV4cuKs743QocI1Mi+525tNtQEpUL4EGdPtw
	pvRcnf8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeZ-00000001AgQ-1T0N;
	Thu, 18 Jun 2026 11:11:23 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeW-00000001Ae9-2Lzu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:22 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-37cae998401so336273a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781080; x=1782385880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=;
        b=DO/HgyDVLQg1hszxd2HclcUYSFLdCEYOIg7N5EFbIn+wHmsbLV46cTgxsy41sUmX4S
         uSgC9YcQzGDbRJT7tkLd0k5QkGd95dTHmh66eJAjrUJznXrAiXrU39Xbzr9E0PIMRDAL
         UL4S8LunHHMDzlbqeDiRExO+IysGo25NzfgEhsPceE3DgtaXyg1M2yjsarp1M1zssNS/
         mAHgm0jB9WOhUUQ/tO+/e48Hl5uwpW23hXcILLpVDgnBdzpXME+ek2TDqhDUAe71DYoN
         k4F5nwTOnbPEIjYc37cu2ItKaCM5DgLtzDIVx60+h1PthUlPTj2xSnkZcMfMu9hC8Cpd
         GO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781080; x=1782385880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=;
        b=Nlzc+GFwA69epyadA1L6USWBzan/LagY5p8SmqySsQo/oiZ3SPZLWbWxdrR1Z4BrGW
         d0BMn/kKNuOKo1g5z8ZpthwmHOYjY0R+TZNx8B+IpOAd6rnuOOnizPAWnadjoJh+dsy+
         vQHFHCn9pMvvCY1Id8KEG3Xq7kGzeBP+lRK5euVbXaZpG2qCZma6y2MMTjksL3op7H+j
         qFZee8Lrxf5fl/G2ca7/z4OOa2D5PI7UTsgsYKt1hbcf6hzLhehTndBS0f/S0373q8ke
         xZRWqW/bMrWEP58OFmmih/s/pvXDbJItXFKJUMx5bo62cw2ax+TngyttE12Lv2AGFv7C
         THkw==
X-Forwarded-Encrypted: i=1; AFNElJ/0SZzQv5lp76mKskMVibWyt9laEM9olVK/1HWS+gtPUqyMJblBHocRQHPTM2uuxKv8I67UNCvnU6P4JsA/RhmV@lists.infradead.org
X-Gm-Message-State: AOJu0YyqMPtYTonk7iAVbz1CoT18Rfjz/7POCZpcUDv4xi5lmnMApMZQ
	UVpe6nUjkvhQy10LJW/MFB0MD0iw6anVUaGod2Vq4K46rBfixBKzSDzV
X-Gm-Gg: AfdE7cnAK/rBJKKw2Zep1tgfTkCUjeW51zwLJYSGIcPkRQP64q9X5otpnw2MqT+0qph
	H+T6eEnargVDOwLioxyFjv+oJc09fIrMFOoKC448HnVKBZ+uNQh17tZa3sY+046OFiJHEn8pX+5
	LmwXEmiu8d7aY9T7zFOMFGfmh3jF03w0e+/REj447Cn4pE43FVZIzr41gchTp5T7ZTP3CMLWR7H
	241pef3HgnNA6Cu3UX3RSej3O1SRdKmXlwxkZHS2/i7rpWEG6PLluj+oV0K5xJ8QrCt3H4A4eWP
	D0cosOIQ837OxyNGgslCQGGK9miz/E7HMZqr26buFDUmR+L6gFfMYzySsqjjFEpWWPgi6A9gS6B
	owwG3MPHl0r9dqrAq28LxYQpkU3PGslyd8qreGmSkyPGoNJZs+7rg07cuw0O/MbLMZElcn4Wvbn
	5xEhZczEussiJqW2g8qSCadpHbX6vnqeOSiJKdVRy+SEgYRd8=
X-Received: by 2002:a17:902:d4d1:b0:2c6:a99a:52a9 with SMTP id d9443c01a7336-2c6bbf99280mr82302315ad.7.1781781079841;
        Thu, 18 Jun 2026 04:11:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 74/78] ASoC: codecs: wm8962: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:23 +0700
Message-ID: <20260618110827.232983-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041120_599208_1B8A0517 
X-CRM114-Status: GOOD (  11.73  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8962.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index de18b1f85a32..6389990944ed 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -1568,7 +1568,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 	int dsp2_running = snd_soc_component_read(component, WM8962_DSP2_POWER_MANAGEMENT) &
 		WM8962_DSP2_ENA;
 
-	mutex_lock(&wm8962->dsp2_ena_lock);
+	guard(mutex)(&wm8962->dsp2_ena_lock);
 
 	if (ucontrol->value.integer.value[0])
 		wm8962->dsp2_ena |= 1 << shift;
@@ -1576,7 +1576,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 		wm8962->dsp2_ena &= ~(1 << shift);
 
 	if (wm8962->dsp2_ena == old)
-		goto out;
+		return ret;
 
 	ret = 1;
 
@@ -1587,9 +1587,6 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 			wm8962_dsp2_stop(component);
 	}
 
-out:
-	mutex_unlock(&wm8962->dsp2_ena_lock);
-
 	return ret;
 }
 
-- 
2.43.0


