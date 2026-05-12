Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17D8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JozA5hf1RcugYB9Q/kizMYiqVHYsdGcnid/EgaA6jB0=; b=XAKVHTxYXH+huvrVCX856L2Cvw
	ZK3pXPr3MsClPcQ+UMpDjZ6+SfeBrlxYGJPubK/owNw445p6QVfbAzcowhoVCdgLn7XWviPQFyKwu
	WVZgTl8PyX34Qi5Qpx06/PVcXr7+jNa7xLGQIN72r4gVXew6YD4vTRi8n0DVUmVRJ29lOM9Dgtr/9
	CzyZGN+fgSEpnYq7jZcvmrd+hyNW2EJ1cLPHLZAjvVNRsR4Mza/LdYO50+V3j/38JTOQ3rAHnVIwx
	A6UAJLboxh8T/aecdwzKEUHNjsgmz3FHDBrLkq4ON0CQfdTYCJHVQ1dQkSVFQUi5JpWYKu1zrUJtH
	HAl3ZIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMl7m-0000000GXPE-0rM1;
	Tue, 12 May 2026 11:18:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMl7k-0000000GXOc-0LHh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 11:18:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40BE843D6B;
	Tue, 12 May 2026 11:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968C9C2BCB0;
	Tue, 12 May 2026 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778584683;
	bh=izVpPklsgFhgBJ6UDkzs+YdvB1EtAk+r3l+WycQYVK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MI/cMLhrJ0d6BbO5le9N/pjNBvowsmBJX5p2aGRXKCvkEru0ZhZYb0gC7XQnEZJ3S
	 LbRF3MViww/nf4lziH+Eyn5CqRWN1xAAY+NODlFsE2tYoYO0ItSuFKmC+uxkBX8a8X
	 NczYDhnIJP3RPyMpEKx9+amQX5rXMHSWJL9zlYhhoLDuh9Y5EZMAhQYR4KpTBLjfaP
	 bafp/z9rmbrAtMGhR93r+nb1a+uJhZuZS2KU9Ooj/7LEIrVi65TnLMqZamjMXLNi8V
	 uTmLFAldAGbTgqHThC1qQJAzZY0sC1GqT3r7UNYFHkVHUQOiuOoBNVbBVnXJ61NZn/
	 OvCU2yP1S1Awg==
Date: Tue, 12 May 2026 13:18:00 +0200
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
Subject: Re: [PATCH v3 18/20] drm/tidss: Switch to
 drm_mode_config_create_initial_state()
Message-ID: <20260512-partridge-of-unexpected-contentment-ccceef@houat>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-18-8b68d9db0d8b@kernel.org>
 <20260504174907.GT1344263@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="y4bfkipmhdhmpwea"
Content-Disposition: inline
In-Reply-To: <20260504174907.GT1344263@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_041804_160640_2BC0F6F9 
X-CRM114-Status: GOOD (  23.74  )
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


--y4bfkipmhdhmpwea
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 18/20] drm/tidss: Switch to
 drm_mode_config_create_initial_state()
MIME-Version: 1.0

On Mon, May 04, 2026 at 08:49:07PM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> Thank you for the patch.
>=20
> On Fri, Apr 24, 2026 at 12:18:58PM +0200, Maxime Ripard wrote:
> > Now that drm_mode_config_create_initial_state() exists to create the
> > initial state, use it instead of drm_mode_config_reset() during
> > driver probe.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/tidss/tidss_drv.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/=
tidss_drv.c
> > index 1c8cc18bc53c..f5099d5d6e32 100644
> > --- a/drivers/gpu/drm/tidss/tidss_drv.c
> > +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> > @@ -169,11 +169,15 @@ static int tidss_probe(struct platform_device *pd=
ev)
> >  		goto err_runtime_suspend;
> >  	}
> > =20
> >  	drm_kms_helper_poll_init(ddev);
> > =20
> > -	drm_mode_config_reset(ddev);
> > +	ret =3D drm_mode_config_create_initial_state(ddev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to create initial state: %d\n", ret);
> > +		goto err_irq_uninstall;
> > +	}
>=20
> There's also a call to drm_mode_config_reset() in tidss_modeset_init(),
> shouldn't it be dropped ?

This has been fixed by f468fef38716 which is in drm-misc-next

Maxime

--y4bfkipmhdhmpwea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCagMMaAAKCRAnX84Zoj2+
duMkAX9Rlb2ZlLxkiSYUwHnQLHcT3AspaIvuP3QQ2XkS9gd4+lhw1TxXVQYzOpx/
xIszD98Bf2NlJxIM0uLxiH3sjS3jGpTbz+Ge+VMI9xSNO/XbIt4c4tka1DCPybKM
tJoOYMCdnA==
=YKv1
-----END PGP SIGNATURE-----

--y4bfkipmhdhmpwea--

