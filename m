Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B91CD3B987
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXlF2CrF8drqCqsEn9iennGlAQ4UE0/1nztVHdpAh70=; b=b/X8laNw8gshXHZU9iYwekgcCj
	dt2gDimV5ezk4BenDB+aiod2rMhakzHK+ymLHBRwmoyvy4DS+kCqExPVCIXh+TGTk1WkBqfwCZJVw
	Ihghhln85sLlRaZJgan2YI9R59VC3+mOEj6P8m3LjvSadBP4Qi0hIBMCHbScO2kvdB9EU26UhtCaW
	JNRvq4Vl+ld42fG82z81ZOz8Jqi5VVHiStiWdHyop1wQRA1giwzNhVnAZiorW5DFUC/NhoCye1Dpn
	AKaHZaUWJBkU0sw+dgcoKtaAO4EZZuy432H85i9ZiUcWMUSwbh78a/bT8jJoE1O9YX/I5+XN6Ckq5
	ViRlwKZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFuOU-0000000AXDN-36mt;
	Tue, 26 Nov 2024 12:10:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFuNW-0000000AX31-222j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69D415C4BBE;
	Tue, 26 Nov 2024 12:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCB1C4CECF;
	Tue, 26 Nov 2024 12:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732622953;
	bh=IVaFBfK34WQcQgwisIpVv9lgOwfqn9UOyfA72WAKaeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnYWEvQ/zxS4VZ3hf1sfYqZ+X1xXtSp89d5itOmnHz9g7lZNXLZwqk1LfHkCSBJty
	 Ws75UYikRO+C2mvCa9fNbOLT/HMNnLGyQzIFgY+4mLcjifHclxhFaLKjskt1jINajs
	 zytQRdsmjTLrgNaUKmja2yDF4Y2VCaHCYjMcPWXTYKxFIiPzW9RSonub3z6dI0nqF1
	 GfJe8zpsu8ptK5Kgf6aVWpu689PTz3yx5f/d9vC6S/2ymFN+d6hJEyfqk9/FvHAF6D
	 J/uz1w0PWLTjbrQnN80zNwy8eDZdCcIb2rtJQ01c/b/zzUTqcIC6QTIlR2msQK7vN1
	 KL/Re40ursfoA==
Date: Tue, 26 Nov 2024 13:09:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
Message-ID: <20241126-observant-coyote-of-glee-3b94dd@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
 <20241126-refreshing-slick-pig-baebab@houat>
 <zmrcuqiyz5gojhusysy7cytluedslqmfgzuslutqeg65iv7ju6@bggk7qbm6eas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bl5qc3dhl5qjushr"
Content-Disposition: inline
In-Reply-To: <zmrcuqiyz5gojhusysy7cytluedslqmfgzuslutqeg65iv7ju6@bggk7qbm6eas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_040914_613551_3459CFD1 
X-CRM114-Status: GOOD (  38.13  )
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


--bl5qc3dhl5qjushr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 12:34:26PM +0100, Sean Nyekjaer wrote:
> Hi,
>=20
> On Tue, Nov 26, 2024 at 09:38:55AM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, Nov 26, 2024 at 08:36:00AM +0100, Sean Nyekjaer wrote:
> > > On Mon, Nov 25, 2024 at 05:00:56PM +0100, Maxime Ripard wrote:
> > > > On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:
> > > > > Check if the required pixel clock is in within .5% range of the
> > > > > desired pixel clock.
> > > > > This will match the requirement for HDMI where a .5% tolerance is=
 allowed.
> > > > >=20
> > > > > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_modes.c | 34 +++++++++++++++++++++++++++++++=
+++
> > > > >  include/drm/drm_modes.h     |  2 ++
> > > > >  2 files changed, 36 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_mo=
des.c
> > > > > index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf8050=
2efde6e4d977b297f5d5359 100644
> > > > > --- a/drivers/gpu/drm/drm_modes.c
> > > > > +++ b/drivers/gpu/drm/drm_modes.c
> > > > > @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(co=
nst struct drm_display_mode *mode1,
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
> > > > > =20
> > > > > +/**
> > > > > + * drm_mode_validate_mode
> > > > > + * @mode: mode to check
> > > > > + * @rounded_rate: output pixel clock
> > > > > + *
> > > > > + * VESA DMT defines a tolerance of 0.5% on the pixel clock, whil=
e the
> > > > > + * CVT spec reuses that tolerance in its examples, so it looks t=
o be a
> > > > > + * good default tolerance for the EDID-based modes. Define it to=
 5 per
> > > > > + * mille to avoid floating point operations.
> > > > > + *
> > > > > + * Returns:
> > > > > + * The mode status
> > > > > + */
> > > > > +enum drm_mode_status drm_mode_validate_mode(const struct drm_dis=
play_mode *mode,
> > > > > +					    unsigned long long rounded_rate)
> > > > > +{
> > > > > +	enum drm_mode_status status;
> > > > > +	unsigned long long rate =3D mode->clock * 1000;
> > > > > +	unsigned long long lowest, highest;
> > > > > +
> > > > > +	lowest =3D rate * (1000 - 5);
> > > > > +	do_div(lowest, 1000);
> > > > > +	if (rounded_rate < lowest)
> > > > > +		return MODE_CLOCK_LOW;
> > > > > +
> > > > > +	highest =3D rate * (1000 + 5);
> > > > > +	do_div(highest, 1000);
> > > > > +	if (rounded_rate > highest)
> > > > > +		return MODE_CLOCK_HIGH;
> > > > > +
> > > > > +	return MODE_OK;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_mode_validate_mode);
> > > >=20
> > > > Thanks a lot for doing that!
> > > >=20
> > > > I wonder about the naming though (and prototype). I doesn't really
> > > > validates a mode, but rather makes sure that a given rate is a good
> > > > approximation of a pixel clock. So maybe something like
> > > > drm_mode_check_pixel_clock?
> > >=20
> > > Naming is hard :) I will use drm_mode_check_pixel_clock() for V2.
> > >=20
> > > Would it make sense to have the pixel clock requirement as a input
> > > parameter? For HDMI it is 0.5%
> >=20
> > This code was only used for panels so far. It reuses the same tolerance
> > than HDMI because we couldn't come up with anything better, but it
> > should totally apply to other things.
> >=20
> > > and in my case the LVDS panel 10%.
> >=20
> > 10% is a lot, and I'm not sure we'll want that. The framerate being
> > anywhere between 54 and 66 fps will trip a lot of applications too.
> >=20
> > Why do you need such a big tolerance?
>=20
> I don't need it, it was just from the datasheet for the LVDS panel :)

So you mean the panel accepts a pixel clock within +/- 10%?

That makes sense, but then we should also adjust the mode timings to
match so we still keep 60fps. There's much more to *that* than the
helpers you try to create though, so let's keep it aside for now.

Maxime

--bl5qc3dhl5qjushr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0W6YgAKCRAnX84Zoj2+
dpXoAYDLeWf70DH69fTHnomK56MfWzFnjFgfHOL2JNGDwN+jsyWwtUS3WtdF0/y2
pknqMxEBf1IBZxjfPUpqweJ/9xN8AsRg6qI+Acufa59QvrHl6wNmv7SdrD5RsgUt
B1PT5dMtYQ==
=sTTD
-----END PGP SIGNATURE-----

--bl5qc3dhl5qjushr--

