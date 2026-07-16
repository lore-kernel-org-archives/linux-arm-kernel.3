Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A801C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1RcUzFubrLSPOJNAhV5g/NysrNzTE7RrFaLaVTbccY=; b=nRsZq+XVot2b1SCcQHqOICGrwr
	FNsKogTEGWm2VrXF/Z5cg/jWEPakMznCvAU76uUpXOWjyXcienHaDn2bTb+ArsFMy3eV7RVx6rhpt
	C0dKjxSv9ixEVxlo7hAhTMMI737IZ0Ol7vTGxy5rO7OcC/mSqcidfDmDNawbRBYSCbyYIzpL0S6ko
	kjPu6be9mNrpad3abSU84cEP2Gio34m4ZT9oE0CSARHziYN00MeyFaCOTKnDtnE37wlppT3vWBM6N
	nAXAWHNO8pAsEWTamqvOKLIWjdwpGECjfl23fLEE6eWb4uRTdSEwcqw4hRTjsR5zKP4dyMza1APxE
	BdhzIMcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM33-0000000HNRH-2k0q;
	Thu, 16 Jul 2026 13:22:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM32-0000000HNR8-1I9q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 13:22:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B7ED743768;
	Thu, 16 Jul 2026 13:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE8F1F000E9;
	Thu, 16 Jul 2026 13:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784208163;
	bh=J1RcUzFubrLSPOJNAhV5g/NysrNzTE7RrFaLaVTbccY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e3jU/vXLz1kCVPN9lk57N/39U6sesNTekwEhhOhKLCJpwWQeRRkvy85ApYKpAbHr7
	 OHbvhz2KSV8mgXOlnjzugYt1f0B0lj2c8fjKuzxe4P4ekCdmrOKTtGmMKDZJjD9Oi+
	 pkIC2Ub5uINhYp7N27YXS3MtVPn2lfeb6bUArRfW1pR+l0/g3UI+UKbodoubFHdYJd
	 uCLqVTxT/2ZUzWHbZpsffXcIiRHfFGPkLaq/WukCsLFBtqfC/1jLrkdnSucx7W+6Xt
	 +8RHcpBDa2cownZYwQP+9CqmbTuaJtcqAkyAFqEWKdw0K3VADVqJOSXDd6Jg6bAxsH
	 l3c7SMtzsOzMA==
Date: Thu, 16 Jul 2026 15:22:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/37] drm/display: bridge-connector: split code creating
 the connector to a subfunction
Message-ID: <20260716-stoic-muskox-from-asgard-c12b65@houat>
References: <DJ735MTNMYD1.3LPNV404V8PIU@bootlin.com>
 <20260624-proud-unbiased-pony-ecc3c3@houat>
 <DJHEAWSEZR79.19UFIKS8QJBQ7@bootlin.com>
 <20260626-polite-hairy-perch-25e1aa@houat>
 <DJJ1MPCEJGZD.UZM9183V6ZE5@bootlin.com>
 <20260626-classy-nightingale-of-romance-1cacad@houat>
 <DJJ4X22CJ3FG.5EYF84LVRNOG@bootlin.com>
 <20260707-warping-goshawk-of-swiftness-beea4a@penduick>
 <20260707123205.GB211515@killaraus.ideasonboard.com>
 <DJZUXUBO8DI4.2J2NI3S0KYNUE@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hy4gwehtz7opgsid"
Content-Disposition: inline
In-Reply-To: <DJZUXUBO8DI4.2J2NI3S0KYNUE@bootlin.com>
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


--hy4gwehtz7opgsid
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 05/37] drm/display: bridge-connector: split code creating
 the connector to a subfunction
MIME-Version: 1.0

On Thu, Jul 16, 2026 at 10:37:24AM +0200, Luca Ceresoli wrote:
> >> > Now if the bridges start doing it themselves we should go back to
> >> > those encoder drivers and ditch all the drm_bridge_connector from
> >> > there?
> >> >
> >> > I must be missing something. Can you elaborate on this?
> >>
> >> drm_bridge_connectors bring together a (complete) bridge chain and a
> >> connector. If you don't have either anymore, then we shouldn't keep it
> >> around.
> >>
> >> What I was suggesting before was only a suggestion. I guess we could
> >> also make the encoder own the hotplug handling code and create the
> >> drm_bridge_connector when the chain is complete, and remove it when it=
's
> >> no longer the case.
> >
> > That's an interesting option. We don't have to keep drm_bridge_connector
> > in its current form, but I don't think we should go back to individual
> > bridge driver creating connectors, especially now that we have bridge
> > chains where the connector ops are implemented collectively by multiple
> > bridges.
>=20
> I definitely agree we don't want to add burden back on the encoder.

I don't think Laurent mentioned the encoder anywhere.

> >> We can discuss alternatives too. But either way, we shouldn't have it
> >> stick around.
>=20
> Bottom line, I roughly see three ideas mentioned:
>=20
>  1. (this series) extend the drm_bridge_connector to create the
>     drm_connector based on bridge hotplug events [+rename it]
>  2. - keep the drm_bridge_connector (mostly) as is
>     - let each encoder driver add/remove it based on bridge hotplug events
>     =3D> more burden on encoder drivers -> no

Can you motivate that with *any* reason? Because I really feel like it's
the best solution going forward.

Maxime

--hy4gwehtz7opgsid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaljbHAAKCRAnX84Zoj2+
dqTdAX929rSvBRbObFUgBFSbAjeGJKAihEQm5mwvUemnQR8RPQTHUpIFoxoU64cT
+ncZYoIBf2oprQXmliswkjFLbOXkrIghOFzxcuJlTTV7xnm4UrAXDjJgcRCFFbs8
Equ80zFtIg==
=nsi0
-----END PGP SIGNATURE-----

--hy4gwehtz7opgsid--

