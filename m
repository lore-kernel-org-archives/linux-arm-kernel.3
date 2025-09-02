Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66058CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQGo8mSpNdawdXK5gcjr//W/UJwwByVl1T2RsevJCv8=; b=lcKgUC9HUUYAS4DQsDICKKQBkq
	2FLvjCw20ZGxscR8+gTS29K14JpZzBLrcOOOuAlzHdepQhuB24ctFvAMfqvcyeoevhY6kJTknWAg5
	GWYEhvFb2CvQN9q84M3Ce75ZK1/w9yKR5BQyGvSZm3UtZOs8GHfEpkEgYygnjCsEW7/UVd3qUQi6G
	Fo5rvmuAh8eWMTCG+5HG6dodVprg86r25V/7N1MQmVZU0qh4yzCz3tJm4beH1z5DNoHidt4Ozyv5d
	MZoJumZirUiVXTjKw7gryGoj6cUKj0KGjf8UprKGHNpoiWdwj6FeFDGqWdamfxr88J9MynwXGQ3h9
	lGx78Pgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTa5-00000000sQ7-3Rni;
	Tue, 02 Sep 2025 16:10:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ1v-0000000HC9n-2eeq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:22:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF5D640BFF;
	Tue,  2 Sep 2025 12:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3778AC4CEF9;
	Tue,  2 Sep 2025 12:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756815750;
	bh=WNvwZbGhhRwiEb2NPZN3SCJ15SAxBEIHxjUM1lFStyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YjxLry+kEeJUnxV6320vUXHUgAtysOdDe1jnnqQakBn7XHkLy8IoCYiz8XaXyarnp
	 bWqO7UB1DMQbu6g/GNEI/9c683OShl1Tm5ybjq3HTAJ0dXNzeBgLPPvO/SE7jgcA6c
	 on9jzYxcdrpIA8yMU+NHVWtno+Lr2A3a7ziQdUWLsRYUGyi58FjZMBnWq/r9qjRrVt
	 moZAi2g3uJsCbVOi+L0c9EDWk68EAcF57Jl4mdwJ2fRqfB31D0uMEk7wcBGy/tp+kM
	 ZrDCqn2GQow2szfYXf3yfR8Z0EfenYPsDinvAIX+5UA855oKs6nUJqJgTB/whvPG1t
	 ttqlMwa6eVV5A==
Date: Tue, 2 Sep 2025 14:22:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Zijun Hu <quic_zijuhu@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
Message-ID: <20250902-speedy-friendly-alpaca-f80709@houat>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
 <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
 <aJJ9ttmL7wiw41fY@smile.fi.intel.com>
 <20250814183609.3788a6df@booty>
 <aKXRHAyfPHPpZmMs@smile.fi.intel.com>
 <20250902135709.19e1ef54@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ha3ss3lic4lbxxde"
Content-Disposition: inline
In-Reply-To: <20250902135709.19e1ef54@booty>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_052231_716613_C6C612A4 
X-CRM114-Status: GOOD (  30.54  )
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


--ha3ss3lic4lbxxde
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 01:57:09PM +0200, Luca Ceresoli wrote:
> Hello DRM maintainers,
>=20
> On Wed, 20 Aug 2025 16:43:56 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>=20
> > On Thu, Aug 14, 2025 at 06:36:09PM +0200, Luca Ceresoli wrote:
> > > On Wed, 6 Aug 2025 00:55:02 +0300
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > >  =20
> > > > On Fri, Aug 01, 2025 at 07:05:23PM +0200, Luca Ceresoli wrote: =20
> > > > > Add an equivalent of list_first_entry_or_null() to obtain the las=
t element
> > > > > of a list.   =20
> > > >=20
> > > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> =20
> > >=20
> > > Thanks Andy!
> > >=20
> > > However I'm not sure when and where this should be applied.
> > >=20
> > > Except for this one patch, all patches in the series are for
> > > drm-misc-next. Also, patch 1 is currently not needed by any other
> > > series AFAIK.
> > >=20
> > > Based on the above, is it correct to assume that the whole series can
> > > be applied on drm-misc-next? (when other patches will have a
> > > R-by/Ack-by of course)
> > >=20
> > > Also, is Andy's A-by enough to apply this patch? =20
> >=20
> > The list.h is common for many, I think going via DRM with my Ack is eno=
ugh
> > based on the Git history of my changes in this file. But if you want mo=
re
> > reliable source, get an Ack from Andrew Morton.
>=20
> While applying this patch with dim on drm-misc-next, dim push-branch
> failed because:
>=20
>   dim: ERROR: cb86408b1fc2 ("list: add list_last_entry_or_null()"): Manda=
tory Maintainer Acked-by missing., aborting
>=20
> Looking at the dim code, it is looking for a Reviewed- or Acked-by from
> people listed by `scripts/get_maintainer.pl --no-git-fallback -m --nol
> --norolestats`. but that command returns an empty string, so it will
> never allow me to push.
>=20
> How can I get that commit pushed to drm-misc-next?

Adding a MAINTAINERS entry for it would be nice too

Maxime

--ha3ss3lic4lbxxde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLbhewAKCRAnX84Zoj2+
dkQBAYDszpV6SGYWBTBgJCvIUpiseT/exARuDvzdOQmtFKiQnfCnA6jnGgP8dcxi
1t81QSABfjclCtf2qV5ucKcKjfmq3i46LSX4vnLy8fnGVrq09f1F1r8yuY2lSQs0
Cp9wkfBFxA==
=G+6D
-----END PGP SIGNATURE-----

--ha3ss3lic4lbxxde--

