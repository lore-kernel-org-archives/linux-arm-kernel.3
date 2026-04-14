Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E71F9D0DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSR1Y+txIPnNHc8zBYH8abpYlL3Re0aHOLErjGpByOc=; b=oEDQtx7FUc9pFKwHBEMS0A8fEG
	EDjOSdo7zulwlshw+MpUvh+wIe7pqiTza/eMRCTS15TpIlq+Wj2TsMunLKjpnbfvjm0HVabGb7jlk
	Vh6isPjSgqc3/+JNGbcOlzU5K3VKeRFBnV6q9WVzhR5cNH9NrZNRYcTTc13k4VGWWx4Ik+d/dR3wx
	pFSmxtnZcsolOvug00EUWAtbtsdRyv3vQXdeLcrT4yE89mQxhiosuLJUaIPyvJ9awanjTUG9Txg0y
	0x+PcMWPQruBFy9XuaRnxTJPkGu8jkjPdIVwoY+E4w2QBjFFHqN4Pclxw/N2vhiDSYIQ0yquKhO1+
	otqtsoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgOk-0000000Haq6-2mCb;
	Tue, 14 Apr 2026 16:13:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgOh-0000000Hape-444m;
	Tue, 14 Apr 2026 16:13:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 235B340DEA;
	Tue, 14 Apr 2026 16:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D690DC19425;
	Tue, 14 Apr 2026 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776183235;
	bh=IO4ywonkL7DSzA1j7r2F5qYT1Kbev7PVfGagAwllQUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwu/UDtgx4/YBtc19JUvhfvJhkFrBAYIw9hFKbVJ9rkT/NzYHIXz1bkX7hZ1YiWgK
	 dFhM18Gx/DMoH9UFLd9BxGu5/PmQiR5YTxLV3N9zJC6diSM//0Pslvx3DC2kTAYtEu
	 EQ9Gwe2ukP9P4QA9Wh2Qn8wvNqy5vUuewdtOr9mqCXDfR6XBXM7jxjvkmIaCcDpJKw
	 eIsG+u+MmEIPqPjNJYIFRUCactBIfXTNC7NpNCTb3CkDKI9mo7SAMH2792OzzWqCpE
	 Ivf6qGdeJqrEOmy/VMtQanxxGPQ43qXDyNPP8QUo05RiqeeTBn317TTMgWedR081og
	 SN4zGU/zQl12g==
Date: Tue, 14 Apr 2026 17:13:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 02/11] ASoC: meson: aiu-encoder-i2s: use gx_iface
 and gx_stream structures
Message-ID: <58d1df89-7c97-4e2f-af15-93d1f7bce5a7@sirena.org.uk>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
 <20260411-audin-rfc-v2-2-4c8a6ec5fcab@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gYIy0O5bB28fsder"
Content-Disposition: inline
In-Reply-To: <20260411-audin-rfc-v2-2-4c8a6ec5fcab@baylibre.com>
X-Cookie: Academicians care, that's who.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_091356_069081_0E720663 
X-CRM114-Status: GOOD (  14.78  )
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


--gYIy0O5bB28fsder
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 04:57:27PM +0200, Valerio Setti wrote:

> @@ -200,13 +200,17 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm=
_substream *substream,

> -	aiu_encoder_i2s_divider_enable(component, true);
> +	ret =3D gx_stream_set_cont_clocks(ts, iface->fmt);
> +	if (ret)
> +		dev_err(dai->dev, "failed to apply continuous clock setting\n");
> +
> +	aiu_encoder_i2s_divider_enable(component, 1);

If we're checking the error here we should probably return it as well.
Including the error code in the log message is also generally helpful.

> @@ -214,16 +218,20 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm=
_substream *substream,
>  static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>  				   struct snd_soc_dai *dai)
>  {
> +	struct gx_stream *ts =3D snd_soc_dai_get_dma_data(dai, substream);
>  	struct snd_soc_component *component =3D dai->component;
> =20
> -	aiu_encoder_i2s_divider_enable(component, false);
> -
> -	return 0;
> +	/* This is the last substream open and that is going to be closed. */
> +	if (snd_soc_dai_active(dai) <=3D 1)
> +		aiu_encoder_i2s_divider_enable(component, 0);
> +	return gx_stream_set_cont_clocks(ts, 0);
>  }

Note that we only hw_free() if we preprared, but we enable in
hw_params().

> @@ -284,6 +295,8 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_=
dai *dai, int clk_id,
>  	if (ret)
>  		dev_err(dai->dev, "Failed to set sysclk to %uHz", freq);
> =20
> +	aiu->i2s.iface.mclk_rate =3D freq;
> +
>  	return ret;
>  }

This means we store the new rate even if the set above failed.

--gYIy0O5bB28fsder
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneZ7wACgkQJNaLcl1U
h9Ad3Af/RhJ2L28N7i/aChvggwpANR0yRXtQJkvt0H9t5MTtdmhzQNlshMoA2NHz
Eh60IZd4InWHJrBe0Vyof62VkoKw1ryRN/devj6c7NVbKCtJ6LmNfqSut4h55Q2z
6Eu1qde7moQRulSJHRqnW3mNDn2B4RDaTw3mexGlKqHui3R0V6numiOhXGZ08ms4
cKKF9qaVy5rB0QjKuCpShcGR2x1hUXBboeo3szEQwJTDoiS99eA/S+3WP6THKIJR
eUqVORpNbCLmT1Pho2rTohXc0tnuPFtb8NocgtnVemwfm9C81B8TxspTwNmLD3qA
+iS3Kd+96yoD8HCRWH7szyxO78eRfA==
=iHoZ
-----END PGP SIGNATURE-----

--gYIy0O5bB28fsder--

