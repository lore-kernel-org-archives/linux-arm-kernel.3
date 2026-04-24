Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28D7FE51E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ny5eTUcXQ8sNFg3rMzRvq70mTgpAZQXdLFwvbxlyggI=; b=ZJHxT3MA3nMycm3Pcm3UfQBYsQ
	e1bQY3QB2KCnGDBrjYyz/n8Wktr2+hOgtGz1f4FNe1t5SiwbyD+/KXPEGpwPX/XTR6KssxRiapG/5
	MD+c5EowjYuB6T2niYi5TXN+ZAv9Y0on9auLgDa5L9S6oeLvt1U7hKUgbLaroZfTjJdqFjGvvuWMM
	GxJ95WydK1I5PQ8qQDCKbgS1w67b3c2LpGWpbyRJrUvBdL8Dwzwa/IC7xjf3oRpgbgMmZqWTBZ72c
	5TF/2S0wpRHfl0Jgo8yhgd5v+j8gnnoqwd95/mOLHIClub018TS31XQCT5FO1SCyaX1M3Umlw5IaR
	vr75bBfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGC9U-0000000Csha-0cr6;
	Fri, 24 Apr 2026 08:44:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGC9R-0000000Csh0-0DY0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:44:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80AC143E0B;
	Fri, 24 Apr 2026 08:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB358C19425;
	Fri, 24 Apr 2026 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777020278;
	bh=ZPtRTAcO5vKULVkGrPOpdr9dYJKbJwHKAW4LzVRqvoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CW7ZL+CRxx2Sijgh6xjUCCZml3UTTpMsXH6cO1EZ6wibNcZoHu595LxCD4AB8p2gn
	 jSaoBI3ElXU1BYxmuOc3NDEcABEdeWKt6wgHB6S1IsWuiFyVWmWv6h/971fYooCBzo
	 RXo6526CET9X621wMlDYeWZctMcReAJzCTJhKeUpGjw8LbqkjVRhIMh6j6vBuXZgaN
	 vJhIZiRh3AQausKSMcfwwnRicX+K/+23ib3tV7aeM7/IdPKDxwRxc5oXLTYFRczQqC
	 tBByluQBB80/irXS/ql/+Ua1O0zUeEjDHWti0vhpQ85qMnzbxJfKvOh6qIr9+EWwRy
	 IX3mNtvMouAVQ==
Date: Fri, 24 Apr 2026 10:44:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
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
Subject: Re: [PATCH v2 15/20] drm/drv: Call drm_mode_config_create_state() by
 default
Message-ID: <20260424-nimble-asparagus-tarsier-15f8bb@houat>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-15-c63f1134e76c@kernel.org>
 <79cc30d5-80b5-4d87-a3ad-36d6fad98853@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3cb63aedvnuis3py"
Content-Disposition: inline
In-Reply-To: <79cc30d5-80b5-4d87-a3ad-36d6fad98853@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_014441_155961_AD2586D8 
X-CRM114-Status: GOOD (  26.33  )
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


--3cb63aedvnuis3py
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 15/20] drm/drv: Call drm_mode_config_create_state() by
 default
MIME-Version: 1.0

Hi,

On Tue, Apr 21, 2026 at 03:38:16PM +0200, Thomas Zimmermann wrote:
> Am 20.03.26 um 17:27 schrieb Maxime Ripard:
> > Almost all drivers, and our documented skeleton, call
> > drm_mode_config_reset() prior to calling drm_dev_register() to
> > initialize its DRM object states.
> >=20
> > Now that we have drm_mode_config_create_state() to create that initial
> > state if it doesn't exist, we can call it directly in
> > drm_dev_register(). That way, we know that the initial atomic state will
> > always be allocated without any boilerplate.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/drm_drv.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 2915118436ce8a6640cfb0c59936031990727ed1..820106d56ab399a39cac56d=
98662b5ddbcae8ded 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -1097,10 +1097,14 @@ int drm_dev_register(struct drm_device *dev, un=
signed long flags)
> >   	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> >   		ret =3D drm_modeset_register_all(dev);
> >   		if (ret)
> >   			goto err_unload;
> > +
> > +		ret =3D drm_mode_config_create_state(dev);
> > +		if (ret)
> > +			goto err_unload;
>=20
> Way too late.

Yeah... I think that was Ville's main objection too.

> Lets rather go through drivers and call this where they currently call
> drm_mode_config_reset() for initialization.

I was really hoping to remove the boilerplate from drivers, but I don't
really see a good place for it then. drm_mode_config_init() could be
another candidate, but it looks weird to put it there too.

I'll drop that then.

> This can be a single-patch mass conversion IMHO.

I'm not really sure? For it to work we'd need to convert these drivers
objects from reset to atomic_create_state too. I absolutely want to do
it next, but I don't think it will be as trivial as a sed call, and it
would probably be best done by driver to allow reverts if we screw up.

Maxime

--3cb63aedvnuis3py
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaestcwAKCRAnX84Zoj2+
dqD3AX91s5aTyrSIs+zg1NTVZ/3A3vLYBnSfFHi5Qil7rXN1H/JxIEEE9V0Ta7xL
sVv2OtMBfAktM0SQa0/hMpYggLwZw3S6EpI61etzjCn+mWT08kRxfRP0K6KBacXD
xc3d+CTDBg==
=tyOY
-----END PGP SIGNATURE-----

--3cb63aedvnuis3py--

