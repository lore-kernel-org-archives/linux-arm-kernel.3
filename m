Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA883CA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRNSLRyn2N1iTesBby/+rq6D8yhyFSP+EyakI7q9A6g=; b=HBAIz/0CdHpir1qoayo4uu0D9r
	cGhimFyV6QlT2pqOF5qv7/PChT7jBNLhsf2rCu114pah1XZUh6BXuSfbfkdHNgtXRgwkxjAcHJCHG
	KS7WUQ2x9VuhltSZLE4Rkd3bri7IQ5SqYAxlStfzDsWsGQcqFQYy1E63WIGZFblvjPB+QwgNWl1Qq
	M/HohXK/YoTIrGrCB6SoVZZ1WR0mQ7We5ZvNYZlAWyueRGwH4ubueVEd8NROjCXS3H2b4h0/ETmwz
	vxfEnMUHkKDSFk7tm1qvXFKg9mhPffKXQh9HRarE/lC85S02qFz8EcDPYnIkdsY21HDp9WHyz6hcZ
	sKhFC0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBork-00000005Hzm-1110;
	Wed, 30 Sep 2026 07:36:36 +0000
Received: from mail-pj2-x16.google.com ([2607:f8b0:4864:39::16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBorg-00000005Hwv-40qg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:36:35 +0000
Received: by mail-pj2-x16.google.com with SMTP id 98e67ed59e1d1-3a4c276e1c7so236124a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753792; x=1791358592; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRNSLRyn2N1iTesBby/+rq6D8yhyFSP+EyakI7q9A6g=;
        b=kSmBxTIJdXxzW6BOYSjscFNcO7JJjEAh+EBrYtsuTOT+9R4BYr+KYIAsi1neFCot/E
         HaSTp8LB3SR4OT/eJ74DGMAPmLlzTpuUEqxS2jUcEFiM5u79kFmVj3EQp4H5FffT+yxH
         hn1O6gSrpdHA+X4Ed8Cx1Yh9zrJF8KzxICcP/lD5JWM/VyOgwYOS6+NWvmmxc73EQFp8
         rRKAQtb1pkx4Gf252C10ee8vS2rap/5Pyz9aYMUmrSOxOvAWy6wx8wm6mR45HwxS8/QU
         GGLRdSngnPjoKso4UPf8iXKxBFZ41XgXK0V32xoSnp6750EwEIFsWeVcNJ2r1susCnQN
         rMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753792; x=1791358592;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRNSLRyn2N1iTesBby/+rq6D8yhyFSP+EyakI7q9A6g=;
        b=eB4YAWsSfHhAhldBlI3e91VwFXZPKnRyoz8oeAhf7agPlERymfVukwuuC8yZ5ncClq
         9jillNSxQH9I1F/+XLLUUBHcDZzJj9FifimkZad+TveqyR6fSpr8nRC7TwNDWTqUL/8S
         n3jTKaVu5PnzyGFnCl2SEOr4PoncjuXRnXmeUPrJ95oTm+WROBGFPjQVzt7Gdqq662Hh
         y/d+KyrtrxjWo1de+tPJf/cwSaByoO4sOigG9t7ZjpTbvvQDHMRP5Pec7QnqatAfWPIP
         9MAfwBMOJNehL9a9CYkczCjnSWxnHzPPnVjIGh9v1Tnznq/oifb4kXmi4vmeur1ZCgyI
         xwrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQC4C4SOGynWfiiqW3g/9QeWp07ru4Uhy9zx/TNgYvffLrr95iGtx6fvUknTQJtJeuNzjixEsPIuSz4RRy6wa9@lists.infradead.org
X-Gm-Message-State: AFuF++n2V8keHqY0O6B4/3EaejaRPCFZk8nFRBAjp187Gxo32Fpg2mcH
	epv6CbK8Y3KAzODIl9vOSTF137dcIeeSRlNG0qdGC19dO/L0r2s7VQUk
X-Gm-Gg: AYBFou38mmD0TyLhtwNcNmFSNt4yHdGRpYBo9Ua/LX3bGhfllXz5vCQqnVZYjGICC0L
	kU+WtMFAUvqhjRSjFavOdb/KIPswtDjs7uClCRBgPe757h0NkUJCmsa92PhfSVB3suQIYBEX3Xg
	enBE2geDfB097NLmkRTGTgAXiTs0nh9hPSa+rLK6etMw26fL64Mzs+OBg8zQimWR9gumIeW36HZ
	fIwOW7PHjmZerkD2Ei07kQv11/VVkFgo93Vly6n0bL4vAUfz/3DGMugj5pPiXSQo8k51Mo9y13e
	O9fBRPZbgZZ9NESmghjlu4ViUOw0BvLc+0ZRHzxzAXAjdiTdMtlY3FUBTC4tVdkl+iXNrAB/MqB
	MZuiydH/o11niDbRXu/VgFhRR4oMz7YqdO3QxTJn/N1jZo09MiZ9WiX8QDr8G59gAJrEKs18gfs
	U0NGLJs4Q3ZtO/ADDGSTx+ciWO3OIvN2ZKGkl2eOWUIzsU5+3T38Puk8IqcQLVrVy2+rIbJ4OKL
	skNDCjWq0vrEvIcTtJu1fDyfSkqulk0GxOJl449JIoGAY3dO7WEd61kKNdDQp8MGbtPE+DuFL6W
	5UWs6oS3IAYYb79Ti5Cc/fU8wD+n36GQ2ULAeHqB5qTddOwz/g==
X-Received: by 2002:a05:6a20:d492:b0:3dd:a196:3095 with SMTP id adf61e73a8af0-3de9ebb39c1mr589504637.69.1790753791652;
        Wed, 30 Sep 2026 00:36:31 -0700 (PDT)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab202f1sm367179a12.27.2026.09.30.00.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:36:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>,
 Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 16/28] ASoC: apple: Add macaudio machine driver
Date: Wed, 30 Sep 2026 17:36:21 +1000
Message-ID: <ItQHm5ZKQ4Wltp6qbCRkSA@gmail.com>
In-Reply-To: <0ae94fbe-cd41-4d49-b073-e65ab8eff724@sirena.org.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
 <0ae94fbe-cd41-4d49-b073-e65ab8eff724@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_003633_016879_DC793EFB 
X-CRM114-Status: GOOD (  31.04  )
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

On Monday, 28 September 2026 9:03:13=E2=80=AFpm Australian Eastern Standard=
 Time Mark=20
Brown wrote:
> On Sat, Sep 26, 2026 at 11:06:02AM +1000, James Calligeros wrote:
> > On Tuesday, 22 September 2026 7:38:54=E2=80=AFpm Australian Eastern Sta=
ndard Time=20
Mark Brown wrote:
> > > > +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> > > > +		if (!snd_soc_control_matches(kctl,
> > > > volume_control_names[ma->cfg->amp]))
> > > > +			continue;
> > >=20
> > > This is used from the volume limit timeout work which doesn't hold the
> > > controls_rwsem, userspace can add or remove user controls which would
> > > change the list so the work needs to lock the controls list.
> >=20
> > Would it be sufficient to scoped_guard the controls_rwsem wherever we
> > use this pattern?
>=20
> I think so, but I didn't properly check.
>=20

I did some testing of this and it causes deadlocks if we try to take the
semaphore from inside the workqueue. I believe it is related to the fact
that speakersafetyd has a blocking handle to the controls open at all times.
This may be fixable by simply having speakersafetyd take a nonblocking
handle instead. I will do some more testing before submitting v2.

> > > > +static int macaudio_dpcm_hw_params(struct snd_pcm_substream
> > > > *substream,
> > > > +				   struct snd_pcm_hw_params *params)
> > > > +{
> > > > +	struct snd_soc_pcm_runtime *rtd =3D
> > > > snd_soc_substream_to_rtd(substream);
> > > > +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->ca=
rd);
> > > > +	struct macaudio_link_props *props =3D
> > > > &ma->link_props[rtd->dai_link->id];
> > > > +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> > > > +	struct snd_interval *rate =3D hw_param_interval(params,
> > > > +						     =20
SNDRV_PCM_HW_PARAM_RATE);
> > > > +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> > > > +	int i;
> > > > +
> > > > +	if (props->is_sense) {
> > > > +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> > > > +		return 0;
> > > > +	}
> > >=20
> > > It feels like this DAI ought to have separate ops...  Also, for the
> > > sense link will we definitely already have a rate set up?
> >=20
> > AIUI, the cpu rate should always be set up by the time we hit
> > this path as it is only taken when setting up the VISENSE FE (after the
> > playback stuff is already set up).
>=20
> Is that something we actually enforce or is that just a thing a sensible
> userspace should do?  I can see something racing.

We don't really enforce it. speakersafetyd is the only thing that opens the
VISENSE PCM and does a blocking read of samples
which only starts and subsequently completes after the "real" PCM
is configured and playback begins. The sample rate is reliably
reflected to speakersafetyd via the kcontrol on the VISENSE PCM. We
have not experienced any race issues with this arrangement in ~5 years
nor has anyone reported any to us. I'm happy to take pointers on
how we should be doing this if the current approach won't fly.



