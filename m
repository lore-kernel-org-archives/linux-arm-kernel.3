Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02727CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRWHJvrV87zg7wTj96AOWlFOZBTwq5ScjGQwkE9kXh8=; b=cncjVXW6OMGLUPt6tY8BTbHDbH
	C/s6ljEDaQVhArs3G2EBQzoE4ML9Mdm2btjHsYiqBQj6dyD3h8pQ94KjY9QV4NNm96NctyXDUyEqv
	GV2C9IajNr43zvYt6dRXUmhEYcNTr9xIxjZD9Qe8tWWQc4tBe3dyDHq5kkXFpuur8THfTudb272ZJ
	RkmI5NAC79LQ6X/20YfzFq2buQezI2QoI4FU5m3u/uPAMLmfk0sai3L2kGHyIym0pc7+6oHVTZBfx
	9ta4F/Vyp8pQZipkCZdIR8+Zv/hOi2LtNVxc7FHH9ikd8ccCttdvcSXB+tK+BR1CIpQMKbcC29jVs
	NGgw+12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB98m-00000000PpS-2LmL;
	Mon, 28 Sep 2026 11:03:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB98l-00000000PpJ-1fbV;
	Mon, 28 Sep 2026 11:03:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE72B60052;
	Mon, 28 Sep 2026 11:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D721F000FF;
	Mon, 28 Sep 2026 11:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593402;
	bh=GRWHJvrV87zg7wTj96AOWlFOZBTwq5ScjGQwkE9kXh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SG55Bru0an6HMsHCstSC1nYa8joHK0Q+fQpmoyTiAAChgQfIPQcwNa7hJ9c76ElZj
	 FgCSwH1n3QX9ODLvsg6/ddVH610KpnIKCCKouoFnzvI6opPVFzP37WYQ0EQX0Utohx
	 ATxj9lj/b0ABODdvh1GZw8OPnDV0kqw/pHaTF6MuyH0C0Uxnb4/kBtpngl3OyZ2Py8
	 YANozyrl7MmYGlJMWF13NnJoW/HYppQQ33kS/k7cMFQ0YRxxsdkLpBj7tUNZxUkPJd
	 FSqvcvJv4SftFwwGy1ip6sGS1RrZL6gkiSb+IS89vy77bsijRlMXSpgJSl9TMY8qvF
	 561BxhnzNAF9A==
Date: Mon, 28 Sep 2026 12:03:13 +0100
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
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
	linux-mediatek@lists.infradead.org,
	Hector Martin <marcan@marcan.st>,
	Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 16/28] ASoC: apple: Add macaudio machine driver
Message-ID: <0ae94fbe-cd41-4d49-b073-e65ab8eff724@sirena.org.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-16-741cc20a74e5@gmail.com>
 <arJMrsl45g2_bLPB@sirena.co.uk>
 <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o62xNzOzXCWulXud"
Content-Disposition: inline
In-Reply-To: <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
X-Cookie: All is fear in love and war.
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


--o62xNzOzXCWulXud
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 11:06:02AM +1000, James Calligeros wrote:
> On Tuesday, 22 September 2026 7:38:54=E2=80=AFpm Australian Eastern Stand=
ard Time Mark Brown wrote:

> > > +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> > > +		if (!snd_soc_control_matches(kctl, volume_control_names[ma->cfg->a=
mp]))
> > > +			continue;

> > This is used from the volume limit timeout work which doesn't hold the
> > controls_rwsem, userspace can add or remove user controls which would
> > change the list so the work needs to lock the controls list.

> Would it be sufficient to scoped_guard the controls_rwsem wherever we
> use this pattern?

I think so, but I didn't properly check.

> > > +static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substre=
am,
> > > +				   struct snd_pcm_hw_params *params)
> > > +{
> > > +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substr=
eam);
> > > +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card=
);
> > > +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link=
->id];
> > > +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> > > +	struct snd_interval *rate =3D hw_param_interval(params,
> > > +						      SNDRV_PCM_HW_PARAM_RATE);
> > > +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> > > +	int i;
> > > +
> > > +	if (props->is_sense) {
> > > +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> > > +		return 0;
> > > +	}

> > It feels like this DAI ought to have separate ops...  Also, for the
> > sense link will we definitely already have a rate set up?

> AIUI, the cpu rate should always be set up by the time we hit
> this path as it is only taken when setting up the VISENSE FE (after the
> playback stuff is already set up).

Is that something we actually enforce or is that just a thing a sensible
userspace should do?  I can see something racing.

--o62xNzOzXCWulXud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6SXAACgkQJNaLcl1U
h9DIuAf+MhyW6NwNfZ3Bqa+m4pMvFpTPdEbJLiFpeSW5EqKWKUoQ0S0CJTszd3Bq
zw8RLCiIUkMfvzpeQ6lgIYkpLAiHkB3jWyyD4wN+ienHL9xysW8MIjWGcGChA6r1
SroQD2iFq4g3Ek51Y7AqqFxZ7Y/SU0YhHI0Op2PXvtXed8j+IQCJo6ICEtkKz3Xz
o7dBOqx9xzCYzHpJLN35Q8D3V8TytTyTaVH6N4VWzj+LUo9OrrEOiDk3J/inWj39
PX0uD3e1ZY5boTMxOWYdAuKWUJ3GrbMN+RpPivdMSNLqB6ITPUafOfUIxq+DYJSc
5iIYKe247exzaqTaiKGmFS5J5o2eTA==
=oNVi
-----END PGP SIGNATURE-----

--o62xNzOzXCWulXud--

