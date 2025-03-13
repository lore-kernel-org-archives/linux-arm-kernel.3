Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74ECC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIpma9xeMh2jEiOlj9brAGuLS9CT53dH9GcI8eP+3SU=; b=f38MOgRz2vpvS2HkesoQBUTqri
	1hSjNH9oOCHESlEhNE+5wAgX+IsAlHOQajJkyemZTa8w935r6crFlehxFDEzSuSlWaeANiSZeXzwY
	I51VBLtnqOUn7UOSsITW4a0KG3+2V1alJuhiJY8NwEOBisVwvxY3yF8oBJkYdUT3WeoWFaww04UEF
	pPIGY78uacP1uY3P4Vq/iFj9Sfykaw0CNSvD79gNkl2zIOOLlPkhiDK8vPhHcYGQcQUEbfQYHI/9k
	XwrZb21FmRQPvyMaZjjeM3onaGxFoj5nYmXPCl/wCppTUXrnFk38RXOpDVDK0sqbKdonq1xdZ3jqM
	89ytnZ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsn79-0000000CAjY-34f6;
	Thu, 13 Mar 2025 18:17:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmxl-0000000C8eU-21gN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 18:07:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 358F85C024B;
	Thu, 13 Mar 2025 18:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC9DC4CEDD;
	Thu, 13 Mar 2025 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741889240;
	bh=LBDygyoJCrpua6SXIWwJAmys+ep4tEGhwRmA/f8mNFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A7GffAg9ln+8ddpc3XHF5mYodpGPozRjbZE2ASQA0uPitbkBhZ6NoqIBX9GB4S5NR
	 7m02HDdwu86CTDTDcfvQcIEl7LBHY8tj5kglKlk1QwBDPlEO4zdIMqn5AWjkRBc6ZZ
	 Dh9ZnrD/2xCf3f5rIKeEgC7FnL6/t89pBRfQeyc24JFsMgUFzgDq3agV6BQXvOOKZy
	 fdFMj45V+StM2EofnH+HXziQaHNFi4lmcsMVDYyZ+ia9bNY722mEfZPrAG9VY74UVy
	 47v7JlAjAStpJ5nMClcdngU2nrl6ms2/FBm4IG/MruxvU18pZfzIhNWA4EREAb/VaE
	 YuW7R4GmbJjjQ==
Date: Thu, 13 Mar 2025 19:07:17 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250313-flying-crab-of-diversity-fa1db0@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <20250313125656.70448d09@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aukmwjacyebo6tff"
Content-Disposition: inline
In-Reply-To: <20250313125656.70448d09@booty>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_110721_606658_9AD33979 
X-CRM114-Status: GOOD (  36.47  )
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


--aukmwjacyebo6tff
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Thu, Mar 13, 2025 at 12:56:56PM +0100, Luca Ceresoli wrote:
> Hello Maxime,
>=20
> On Fri, 7 Feb 2025 12:47:51 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
> > On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:
> > > DRM bridges are currently considered as a fixed element of a DRM card=
, and
> > > thus their lifetime is assumed to extend for as long as the card
> > > exists. New use cases, such as hot-pluggable hardware with video brid=
ges,
> > > require DRM bridges to be added and removed to a DRM card without tea=
ring
> > > the card down. This is possible for connectors already (used by DP MS=
T), so
> > > add this possibility to DRM bridges as well.
> > >=20
> > > Implementation is based on drm_connector_init() as far as it makes se=
nse,
> > > and differs when it doesn't. A difference is that bridges are not exp=
osed
> > > to userspace, hence struct drm_bridge does not embed a struct
> > > drm_mode_object which would provide the refcount. Instead we add to s=
truct
> > > drm_bridge a refcount field (we don't need other struct drm_mode_obje=
ct
> > > fields here) and instead of using the drm_mode_object_*() functions we
> > > reimplement from those functions the few lines that drm_bridge needs =
for
> > > refcounting.
> > >=20
> > > Also add a new devm_drm_bridge_alloc() macro to allocate a new refcou=
nted
> > > bridge.
> > >=20
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com> =20
> >=20
> > So, a couple of general comments:
> >=20
> > - I've said it a couple of times already, but I really think you're
> >   making it harder than necessary for you here. This (and only this!)
> >   should be the very first series you should be pushing. The rest can
> >   only ever work if that work goes through, and it's already hard enough
> >   as it is. So, split that patch into a series of its own, get that
> >   merged, and then we will be able to deal with panels conversion and
> >   whatever. That's even more true with panels since there's ongoing work
> >   that will make it easier for you too. So the best thing here is
> >   probably to wait.
> >=20
> > - This patch really needs to be split into several patches, something
> >   along the lines of:
> >=20
> >   + Creating devm_drm_bridge_alloc()
> >   + Adding refcounting
> >   + Taking the references in all the needed places
> >   + Converting a bunch of drivers
>=20
> After reading Anusha's "[PATCH RFC 0/2] drm/panel: Refcounted panel
> allocation" [0] I think I need a clarification about the 4 steps you had
> outlined in the above quoted text. Are you suggesting those are four
> _series_, and you'd want to see a series only creating
> devm_drm_bridge_alloc() as a first step, similarly to Anusha's work?
>=20
> That was not my understanding so far, and so I've been working on a
> series containing all 4 items, and it's growing very long due to item 3
> needing to touch many dozen drivers which need to put a bridge (many
> are identical oneliner patches though).

I believe I've clarified it already in Anusha's series, but I think a
reasonable series for *early* work would be the bullet points 1, 2, a
bit of 3 and a bit of 4.

Once the API is agreed upon, 1, 2 and 4 should be in the same series. As
you've pointed out, item 3 can be large, so I don't really mind either
way.

Maxime

--aukmwjacyebo6tff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9Me1QAKCRDj7w1vZxhR
xaKTAPwM/vEJ/q5svZVQpJ0vicaocWo+A9AR6r66r2HSCd2dBQEAmADcvB9+ahJx
H0Gi0+cOjYMHnZOS3C3hF1znR1lh2Qw=
=qBFI
-----END PGP SIGNATURE-----

--aukmwjacyebo6tff--

