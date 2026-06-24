Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42F3CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYXFHsAJ/+YPM5VKCdBLeyhf6SMW4jWJQ75wvJBvxwE=; b=bc95h8k25VAMtOWnJuTO2EP0cF
	3mYQwVqXEnGUrRjtWyy33J6g2IIxvgR8SClLdQE+YhRvg3UE0Tq3o2wtytPKHWG67xlCT70e254GK
	xx6OkKYqvB7TVpsaslWlEO9+l4VoLtpBFyETQfWulkKWCgRG27BCnQABxXwB2ooyP7K7gn8+d8OT7
	mvB1h1RjwuahmtuXgVdEREkHbY9bbH+tkuwuVzYgCOFHPJOqlv7OirahJ2ROILUrTDYRmH71KGHcI
	2c2AZjG9ZRbqcYwS5k8mdgt95l4GOlAYIY/jYxpNJweJeVXI5QKtdpVrfyq2Y9NwzDIL/ntpksTxb
	Hvdd3Yig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPET-00000007yKi-1l6J;
	Wed, 24 Jun 2026 15:09:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPES-00000007yKW-3WDT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 15:09:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBA1260018;
	Wed, 24 Jun 2026 15:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A9B1F000E9;
	Wed, 24 Jun 2026 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782313779;
	bh=nYXFHsAJ/+YPM5VKCdBLeyhf6SMW4jWJQ75wvJBvxwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jeRocl3VdznUJWlLXpYFh0jH8rIjHIufr8jZWjRRGmCNBlcBVOUnBI3qqjmhvhCaP
	 2guiE4zvkZT+1x4r9Tfd8hPA+twEWYtei34OpCDFSzTd7XhklXuPCLRsJrCMHjZp5C
	 82nuAIe7RCAFRX65RN6kzHhEX1Fky8MWYAXLcADvHYNYd6hdGNFcntvaPA5ErzaoUo
	 JU8ySaXnvof7D9r0xExOfICtPxQxjLIKkhP5f7tJU6kRTrw34ngR1hweBdIj4CNFE1
	 zhilgY75adTj2urQDUfPuXa8Gua+hXoRmuHr35CdBIzmkKEZeAL067ne7OEaLysgmH
	 OFfjEfWKIovWw==
Date: Wed, 24 Jun 2026 17:09:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 26/37] drm: event-notifier: add mechanism to notify about
 hotplug events
Message-ID: <20260624-elegant-giraffe-of-finesse-d7d1a5@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-26-45e2bdb3dfb4@bootlin.com>
 <20260608-maize-rooster-of-youth-c0bbde@houat>
 <DJ4EWMIX84PN.3VTENLJT2FWDH@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="sih46xtj3h66m2kh"
Content-Disposition: inline
In-Reply-To: <DJ4EWMIX84PN.3VTENLJT2FWDH@bootlin.com>
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


--sih46xtj3h66m2kh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 26/37] drm: event-notifier: add mechanism to notify about
 hotplug events
MIME-Version: 1.0

On Tue, Jun 09, 2026 at 11:30:52AM +0200, Luca Ceresoli wrote:
> On Mon Jun 8, 2026 at 2:13 PM CEST, Maxime Ripard wrote:
> > On Tue, May 19, 2026 at 12:37:43PM +0200, Luca Ceresoli wrote:
> >> In preparation for supporting DRM bridge hotplug, add an event notifie=
r to
> >> allow interested parties to be notified about events they need to reac=
t to.
> >>
> >> For the initial implementation of bridge hotplug, two events are neede=
d:
> >> bridge detach (happening in drm_bridge.c) and MIPI device attach to MI=
PI
> >> host (happening in drm_mipi_dsi.c).
> >>
> >> For this reason implement the event notifier in a new common file that
> >> event producers can easily use to send events.
> >>
> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >
> > So, you claim in the commit message that it's about a hotplug event, but
> > the only events are the bridge being attached and detached, so not a
> > hotplug event?
> >
> > And why a bridge would want to be notified that itself (or another?)
> > bridge is being attached or detached?
> >
> > You need documentation, and a more descriptive commit message.
>=20
> Yes.
>=20
> But before that I need a decision about the scope we want to give to this
> notifier. It is a very generic module, with basically no dependencies, so
> people will try to add more unrelated events and we'd need to set a
> boundary.
>=20
> Options:
>=20
>  * Should it be for hotplug-related events only?
>  * Should it be for any DRM event that needs notifications?
>  * Something else?
>=20
> I'm happy to write that in the docs and commit message once it's agreed, =
so
> any comments would be welcome right now.

At the end of the day, you'd be the first user of it, so you get to make
the rules, but they should be written down :)

Maxime

--sih46xtj3h66m2kh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCajvzIgAKCRAnX84Zoj2+
diq9AYDS0++BFhEDXmstOP5s8ju5j4ZhnTJ84htQUTs/KNC7r9Sg1q/f9LCWWjoo
4ygrh/kBgM6Ap5lgJzGFC1vcBkanGawtHnUUVNL2ZCxahZlb9BKtCZusOCK/n06E
nEmYoeqy4A==
=wD9S
-----END PGP SIGNATURE-----

--sih46xtj3h66m2kh--

