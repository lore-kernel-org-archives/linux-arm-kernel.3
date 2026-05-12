Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26D6CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGMbMgiPrQW9m7V0yb0uzVt7i0ChVnqwTfRSClSCuxg=; b=GfA0avWHTT3QaoAx3I8ewTeNFB
	vZ3hgrvLwuHuAeKgEm0Jy/OFMorBzWegVI0M66Ysu1Tr/qk6Ov2fqjshAaXXW43PwFx/7xCn3LbQ2
	fe+7/QkjPFusF4u8qPW1gME9UmyMWywvdefgWrod2F0RFbUnjyopglItN+8FrLJC9M9uPfIUYTJiq
	PxnLXCz6XtrHYpDzjq3l7IiiYHkDxTxx9JBgs+M137wJY0oDMpf91rGqFCGYXJPZ1I416hF3pT88B
	wohxVskyo+li9sUMGYZUvrqwmOZUFeIIDeR4NkW4bjSfCYAfQmF9qIjCneoAOyGVv1Fd9Nc468W1Y
	UHjoTmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjpx-0000000GKR6-0kSX;
	Tue, 12 May 2026 09:55:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjpv-0000000GKPv-0bKp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:55:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB8EE40DE0;
	Tue, 12 May 2026 09:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0C1C2BCB0;
	Tue, 12 May 2026 09:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778579733;
	bh=sKtOdshfCoX9MSFc77fz6L3nrgnwT/LACWvUhL5OfVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DxnuZ0dTMIPrtYkkFNyjpxIU2k1GNR56TB3NXSivcCStVQW683e2Xw7JJczyUi3ta
	 0MSLaDxb/f5MTm9aKw6LGkBNmmnTOz4uFtrljJyJ5KzusZdrgeDAumATwqAwpSKP/C
	 zk56xho1rCi3cE9YgLBMeZbEYyh48l1MDIHZg91ilibgHasAj1SNo/CG98mUN+NANp
	 kYljsLqCtoetCiGLGlxcrGLPqWEZu8TR4crtz8nDBvdk7piw6acWzgNYk1Hr0Xjg37
	 yYBXRSSWg6Sl/Yrt685291veeK7bzUZGNLPJVMvhsGfsvpqabZ9dMxpC4G0mujHmYS
	 9Qw2o2ZGnFXhA==
Date: Tue, 12 May 2026 11:55:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Simon Ser <contact@emersion.fr>, 
	Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>, 
	Sebastian Wick <sebastian.wick@redhat.com>, Alex Hung <alex.hung@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 10/20] drm/plane: Add new atomic_create_state callback
Message-ID: <20260512-versed-cougar-of-sunshine-dcf86c@houat>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-10-8b68d9db0d8b@kernel.org>
 <20260504165229.GM1344263@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="22373ydgvhi5g6fp"
Content-Disposition: inline
In-Reply-To: <20260504165229.GM1344263@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_025535_319289_33B77FCA 
X-CRM114-Status: GOOD (  34.35  )
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


--22373ydgvhi5g6fp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 10/20] drm/plane: Add new atomic_create_state callback
MIME-Version: 1.0

Hi,

On Mon, May 04, 2026 at 07:52:29PM +0300, Laurent Pinchart wrote:
> On Fri, Apr 24, 2026 at 12:18:50PM +0200, Maxime Ripard wrote:
> > Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
> > to drm_private_obj") introduced a new pattern for allocating drm object
> > states.
> >=20
> > Instead of relying on the reset() callback, it created a new
> > atomic_create_state hook. This is helpful because reset is a bit
> > overloaded: it's used to create the initial software state, reset it,
> > but also reset the hardware.
> >=20
> > It can also be used either at probe time, to create the initial state
> > and possibly reset the hardware to an expected default, but also during
> > suspend/resume.
> >=20
> > Both these cases come with different expectations too: during the
> > initialization, we want to initialize all states, but during
> > suspend/resume, drm_private_states for example are expected to be kept
> > around.
> >=20
> > reset() also isn't fallible, which makes it harder to handle
> > initialization errors properly. This is only really relevant for some
> > drivers though, since all the helpers for reset only create a new
> > state, and don't touch the hardware at all.
> >=20
> > It was thus decided to create a new hook that would allocate and
> > initialize a pristine state without any side effect:
> > atomic_create_state to untangle a bit some of it, and to separate the
> > initialization with the actual reset one might need during a
> > suspend/resume.
> >=20
> > Continue the transition to the new pattern with planes.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c | 25 +++++++++++++++++++++++=
++
> >  drivers/gpu/drm/drm_mode_config.c         | 21 ++++++++++++++++++++-
> >  include/drm/drm_atomic_state_helper.h     |  2 ++
> >  include/drm/drm_plane.h                   | 16 ++++++++++++++++
> >  4 files changed, 63 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/dr=
m/drm_atomic_state_helper.c
> > index 285efbf29520..50fe4eec41a8 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -338,10 +338,35 @@ void drm_atomic_helper_plane_reset(struct drm_pla=
ne *plane)
> >  	if (plane->state)
> >  		__drm_atomic_helper_plane_reset(plane, plane->state);
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_plane_reset);
> > =20
> > +/**
> > + * drm_atomic_helper_plane_create_state - default &drm_plane_funcs.ato=
mic_create_state hook for planes
>=20
> drm_atomic_helper_colorop_create_state() states "Allocates and
> initializes colorop atomic state", while here you document it as
> "default hook for planes". Consistency would be good.

I don't think it's inconsistent?

colorops don't have a create_state callback, so the only function to
create it is defined as "Allocates and initializes colorop atomic
state". For planes, the hook is documented as "Allocates a pristine,
initialized, state for the plane object and returns it.", and here we
have the default implementation for that hook, which is documented as
such.

It all seems consistent to me?

Maxime

--22373ydgvhi5g6fp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCagL5DgAKCRAnX84Zoj2+
dkRdAYD0DMSjBZG7KznVzXsEfKNp2FbSJf1ulgAd4J6iTdzQ1dB+YlrxnLFoX8sG
PCH3lKkBgN5APIC+q4CMgKtqaEulFN6SaM58HNWcqL5byNjMi/zSBGs3FJRVyiME
cyx+95kJPA==
=j3nb
-----END PGP SIGNATURE-----

--22373ydgvhi5g6fp--

