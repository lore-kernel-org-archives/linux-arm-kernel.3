Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24BBC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 01:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPh7h4QVBO0+zLyzuNTJsDnUZi453ATtVOhNG9pw0Zg=; b=L8dwBNpWyBNb1o7aI90Y7sTgJB
	02jNXbPFxi5hEqcDgHCyTYmv7dw/0aKgQFYzqF2almIeGh6/RdOXgRTULaaQVp5FSNXjm8uZ0yQsA
	Agq4CCIETS9/FV7JcYuimti4kgZQs/5jGCOXQpDJiwL9UCVnJnU1U0JN+tvwaDKvlSoSTsPBx4RA0
	vEO/0QLLjJEpYE52Vh+uwu9abagLQaw0uqHtgC1nrmugVkVDrF3zLDLbS67vej9PJmuTcBOV6sUqC
	E7qOylv9r+ssJR6Xoag4GBf7XHW/yQnLLDyBhzTbGUpHs8pR75OupIpnWmmpoI/1p8mGJSII8y8UM
	Uw67K6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAGrq-0000000Empc-35dJ;
	Sat, 26 Sep 2026 01:06:18 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAGro-0000000Emoy-0v35
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 01:06:17 +0000
Received: by mail-pj2-x0d.google.com with SMTP id d9443c01a7336-2df964b6893so6530335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 18:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384775; x=1790989575; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPh7h4QVBO0+zLyzuNTJsDnUZi453ATtVOhNG9pw0Zg=;
        b=hEVFZv0eQKmIGUmyNPAwFSS3Y+KpdqWvh7RSUoSaCW/C8h2ysPWEkDAnZ+g9DiZI0r
         s6fWq7UjzbRp3YP+E35EIVZxXbGOSlP0v6JHvMN1GNBH2Kje/XUX+nRM5e5tOOgT7r3G
         g0HoZ5R5G2hgRQUsvt49Q/mBZ2H6GX66AScN7nXwJdRzDzxLqgYRn6geroRjAMNaOVXe
         CJWTNreLg/L3j2IK3xpZDfn8yLo5vzEvqzWkqdZxdlROqvNqMjJEdGDIFugDmh6q1hsK
         tN3YxmMC/rW83aF+Vfzx4rY9MPFulOxIKIUsoS37gG8EevbOwnWW/hPjjLm5F7VDlpEH
         94IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384775; x=1790989575;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPh7h4QVBO0+zLyzuNTJsDnUZi453ATtVOhNG9pw0Zg=;
        b=iOKVj3bc3UMAk46NISLyFdVARyJ9uJB5ta2gvHdrhzXUykR0SQedE4NvyQk+bv9mM4
         bDp/0r1Tdy41tMtB5ou6l3eCCFf+mhRjwGCLI6/XbaPw0EHb0aKTA3WSXvqo1thINBq6
         jb9BMKZJXY7HgLHxeEPQjCsZIOrDWoN8nCyBC0RVwjJeJ3s52gX6LscefDQC7UnyXssw
         wFlNwXIeMiHpPHb7llSbp7C5i36Uqrpwe49h8EE4ETM2j103GYm6vjSzflkTdNgBZoYZ
         mxm1GS0dpC1I85QFMNKeHBOk8s5VDm90lhLGpxRe++z/+MeNyyrDOLHQVGvqgb3uCmh7
         mJRw==
X-Forwarded-Encrypted: i=1; AKwUvBzk2SgTSK0nOVG+bIEiBticuVn+GwiIiEmapeBhoWZrjsJ0zSoS2vXHio324LDUt39B9tXI6pNz9wq3+ej3ytkH@lists.infradead.org
X-Gm-Message-State: AFuF++msXcB/cD4k8LOywhy6CRga4bpEvKtvywS+uGBY9b0KpCS/xGRS
	KRLf6FNRO8rsuum6tAMgFVRv7prwoSyTNeB/poXX99BItHbwzcggkJa8
X-Gm-Gg: AYBFou1L6P/2cPFs6cHgg1+NHCxCd9kCqQMcDkDsFP36OQIVSDSsUjsAdQqOV+YEICE
	uOONnPvMu7n/WopSCm3bVh7uA7QfIGPdSJtYEMEbhRAj45SBD9pgzsWJaUq3K2HZ80bEYwLlmJD
	leKcGoleEG9hiJ2l/QVVOyJN8vBUl8shC/lspLR/ZN4K//jNvRMVHIuERefd1LXodEu0krXFceJ
	TwJmSTO1tWnff4iRGRDx22TLiSfQ0he8LkBK3m/mDmFwezT6YRqSikSo9i7nEeocnDS2uNwuZpy
	yTHa5bEb2CS+9LtUxEkSrNAqmpZGq+csVaeMow2NvqjdBVPX30sIX9bZlNTWwBpTnkOw6kJXPpw
	gaVGdQrqTLp/5ildBbJu8Own+5NIcijtQl0ptfYhY8WM78+SddOKZdEJc5+vTcbENmGRiPgZncT
	Xgg06giDThJViTekdHqmRHx36XQKHHcTW5UnTj7x8U5K6HFSUxgAApVQkUl+z1tfCohMRwHivcT
	qkKdw60e3rIbTLzhM+376BP2+rfCgKWKz7EkkOT4T+qTigE8zh6p457XaEYdF7QW+XPvdwqfoOl
	7RcRyF334pyHYcVJdzJH7fkSeZEhh/IdbIp9yrnAb7RUPFqq/j4=
X-Received: by 2002:a17:903:245:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2df7da6101cmr56469765ad.9.1790384774750;
        Fri, 25 Sep 2026 18:06:14 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e032bsm17424215ad.27.2026.09.25.18.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:06:13 -0700 (PDT)
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
Date: Sat, 26 Sep 2026 11:06:02 +1000
Message-ID: <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
In-Reply-To: <arJMrsl45g2_bLPB@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-16-741cc20a74e5@gmail.com>
 <arJMrsl45g2_bLPB@sirena.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_180616_269962_67A82DB8 
X-CRM114-Status: GOOD (  19.71  )
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

Hi Mark,

On Tuesday, 22 September 2026 7:38:54=E2=80=AFpm Australian Eastern Standar=
d Time Mark Brown wrote:
> > +static void macaudio_vlimit_update(struct macaudio_snd_data *ma)
> > +{
> >=20
> > +
> > +	/* Check that *every* limited control is locked by the same owner */
> > +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> > +		if (!snd_soc_control_matches(kctl, volume_control_names[ma->cfg->amp=
]))
> > +			continue;
>=20
> This is used from the volume limit timeout work which doesn't hold the
> controls_rwsem, userspace can add or remove user controls which would
> change the list so the work needs to lock the controls list.
>=20

Would it be sufficient to scoped_guard the controls_rwsem wherever we
use this pattern?

> > +static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substream,
> > +				   struct snd_pcm_hw_params *params)
> > +{
> > +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substrea=
m);
> > +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card);
> > +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->=
id];
> > +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> > +	struct snd_interval *rate =3D hw_param_interval(params,
> > +						      SNDRV_PCM_HW_PARAM_RATE);
> > +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> > +	int i;
> > +
> > +	if (props->is_sense) {
> > +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> > +		return 0;
> > +	}
>=20
> It feels like this DAI ought to have separate ops...  Also, for the
> sense link will we definitely already have a rate set up?

AIUI, the cpu rate should always be set up by the time we hit
this path as it is only taken when setting up the VISENSE FE (after the
playback stuff is already set up).





