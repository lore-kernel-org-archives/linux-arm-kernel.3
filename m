Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD024CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=; b=BtoscNHkIer8DPzpJgpsklKYPH
	vdcnSdmu9b9Pj5qsrim4wTeHPujC79ZLVLmBgJSdrG9w4QQ/61bCnx+TRrI49F6a98jUoAYwUdr52
	r4jDqr19IdQ2y3pF46WPk+ByVmoc3sbP1NA+vtVOfWYDMM701lJeHP+lBJhdpXvKKiT9bERXlSte8
	tY2mhtOsmG/s35FZYQtzZugwm1n/IxEpFbtS1Nqh5DoEaX1xiyzqEblZ5+w0AagL+KNWFaWlXHWMH
	+szLrcKy+zKmCvbzUrwYiT/fLpL1wf88KkmdLx8p1znbGQRQtlmMxJqpWqNmcg0ySjy+Ka8WnI/Om
	Q7nNKLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpuM-0000000HO8v-1Af4;
	Wed, 17 Jun 2026 13:02:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpuJ-0000000HO84-3qdm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 13:02:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b64c8311so55927515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781701333; x=1782306133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=;
        b=tLfaeuvtvXSzPeczxi5ZR5zQfdBgjo9YWJqXgYtF2CZ3aFo2+8/c2K9q09HRdAI2ky
         SbAUYaNnSROWBzc8YzcVr6ySgjU539d6Lq7acif9UUE/E132mvCgGtzb2vwP9pbN69/W
         XHgyfQAM4R2dzW11mIx2rOHcHic/aLj6tC1CWUKhC5Yl56/rbUEr7UVYjjD4QC2JjZm0
         q7uHRmXyvK42CYDPEhFPL5GZjxad3IcQCowuJjuyn6KTPc5MFjKG9mgVvLItMW7BNr5P
         6khcsEyEECXcPfA47CVF3GTqs1JukFILHO594k4OaeL3GeAlmAkNwSXXQnVMAbyPNWsK
         1H3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701333; x=1782306133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=;
        b=JT1k2d7PxtgaFyGeTZZB3e69fuqEdDlbyBachqC/7uq5pldvIigj8TGt8zjaXb1dvf
         xLYWOx0qPjv4p1hZQjRaBcJ+DIdCJrP9DY6GcppqB4fLZ5sXsgc189fE0PE3Zahjl/w2
         geNu4FPQ2MxcKMLVxvWtauoZP5CCTOi9X8s4TqoIdZ31PH0ZQxHFOPiMLoRBhwwEH+qP
         rrmb6fxN0V1f62oI+TsI5d7Jw/sLe9wi98+YTW0a39ffENyCHCrYpTzlEueZXoPucNgM
         iKLNRRnngVs3XW7O9e/jJcQWIT7daDqoUxAiGf8i2oaA1pS0G9jB9gjC2qaWDfCoSPYa
         +04A==
X-Forwarded-Encrypted: i=1; AFNElJ8lD6sPNQqIVEpJ1w+31DBFWuou5xUjI05u9OQ4CDhJm57ngYhCIITEFOc581biPSKWSG5+vi6Bvlu9N6aLmvbv@lists.infradead.org
X-Gm-Message-State: AOJu0YxW52neR8JH3yuc18ToNTZxOH/komvuPS0PZCfOqihYLhiU+EnG
	rNE2sXie2fFISMpRL4BlhRMQH1NRGMQdao9fE6etNzzJ/9/l5BIclRWmBY31Gd+j
X-Gm-Gg: Acq92OEdxmzl7DiCTpsuP0A8uE2WZuAv8Hk9QuYO6MWDI29RXQ0xouhNjWjeMMkxKfg
	FYslN2sFnHztBna//CbQTHPjCIR5waJ4P+C5rtDIqhc6uyabFC43UttsvahMSiJ0B6N64Y1tPgm
	ncEeOdloa741tWpxL19ntNcBOYZ/0GQnOUm/0isJzvGlAp+eimYLBs/nAAiyQbmuLlxm7xPii+j
	zVewn0QiCVoRXOGU47+tXn6+tTSZFAT1F3uJEO5UmDqctMTBv1q2Aaa+l4Q6ZFtVoM6eEQ160R1
	67UZRueptW96ZN3OQmVWbOS1pzF0LNQ58VFkTgr5775HQH2HUlrvarndnemUWWeEHvhRuTxJHYk
	7ddgwEjbX7a6xlV3hRo0nGOnzeAtDzye1Lq8EDhQOHMOoxok8KLXoCGUFkGf3XjVI0c8cy0wYHT
	8Vp6NujZIQ+Y/oNXpwkiqNOEn3imipS4JGcTzpWjrFKutdSQaMSQ==
X-Received: by 2002:a05:600c:8189:b0:492:32a0:7f92 with SMTP id 5b1f17b1804b1-492333aabe8mr70111375e9.12.1781701332662;
        Wed, 17 Jun 2026 06:02:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4ff67sm157906775e9.6.2026.06.17.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:02:11 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:02:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih
 <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, Benson Leung
 <bleung@chromium.org>, David Rhodes <david.rhodes@cirrus.com>, Richard
 Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, Support
 Opensource <support.opensource@diasemi.com>, Nick Li
 <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, Srinivas
 Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex
 locks
Message-ID: <20260617140209.3f89706c@pumpkin>
In-Reply-To: <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_060215_982717_C0C95947 
X-CRM114-Status: GOOD (  19.18  )
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

On Wed, 17 Jun 2026 11:57:49 +0100
Charles Keepax <ckeepax@opensource.cirrus.com> wrote:

> On Wed, Jun 17, 2026 at 05:31:32PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> > 
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> > 
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> > @@ -913,17 +908,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
> >  	if (override >= e->items)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&priv->jack_lock);
> > +	guard(mutex)(&priv->jack_lock);  
> 
> I believe you have to use scoped_guard here, as there is a return
> from the function above, if memory serves it attempts to release
> the mutex on that path despite it being above the guard.

Indeed.
I believe clang will complain.
That makes these mechanical conversions of existing code dangerous churn.

While using guard() (etc) can make it easier to ensure the lock is released
when functions have multiple error exits, I'm not convinced it makes the
code any easier to read (other people may disagree).

	David

> 
> Be worth having a quick scan through the rest of the series for
> this as well.
> 
> Thanks,
> Charles
> 


