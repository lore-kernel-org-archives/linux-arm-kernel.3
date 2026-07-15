Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6118FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tsnx7EZ3K3hSCWm/s0tNHSYkDr7roidM5tSjKqD3bPI=; b=y2fj+Qoty65YaWtx9Vob3IPGIv
	u6MU/ERcKDeprApb8OsagaVlQjMFTi3C0ogq1/UR6/EVWEZPyVV84VnjNhum3oyWbZ7pr8XI/Tp0n
	jstbr6DlvHHaIYARtPhIDTk8joopnWz1oaAcxU0gfv94W94lCHQ8iIuukgPJOzZzYNGgysjVcu0Kd
	i9qQkMNG1fXA8OSkp+hl3s+EQaVdkCQGagDDiA24DxG7/4fGkpIbkKgdYoe64boYcTedmB5Y9tzBL
	bCqStsucDYINTFsvC6JQN8c/gPJewcSO/DDlz5SiVm3E0aFdQCZVYM51W1E1aAqGAf7MRBpTX8B/l
	bBcxLJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvIt-0000000ECa3-3M4q;
	Wed, 15 Jul 2026 08:49:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvIt-0000000ECZp-0rzl;
	Wed, 15 Jul 2026 08:49:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 375F4600BB;
	Wed, 15 Jul 2026 08:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4BA1F000E9;
	Wed, 15 Jul 2026 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784105357;
	bh=Tsnx7EZ3K3hSCWm/s0tNHSYkDr7roidM5tSjKqD3bPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i6Cnb2E3I+/RyJKcTwEIKMcax4M0sD05NYGRKzvCDRdCd6kjNoteV/SmLGx3Lyjjw
	 9oDYbcsY2pP14PcN8Knk4UqbFwz7q0H8xlKkaMnSBrIGHtvDT6tKmYe0K6RgUdHK5u
	 yGvEcHmGsJTxvFxuW8wwnO/9JKSCVP6hH4b6C1zpM9Lv1OOxB6jXx6gF4GRqcu3lt9
	 XDy7WDX2U7ZL7ZvKSqkgpw3H6FBcUZz71FI+bAoLF1qCyh8uHQEtctRvdarC1c36UO
	 DRMZDs/8yAA+MPICnRFdhmdZEF2S8kNtEk0H5aGtjRHS74sZL1HeUraSUk2xW8VJaN
	 qa0sRcVChbguA==
Date: Wed, 15 Jul 2026 10:49:11 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Daniel Stone <daniels@collabora.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 02/39] drm/connector: Add caps-based HDMI connector
 init helper
Message-ID: <20260715-functional-jackrabbit-of-enhancement-7c0db6@houat>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-2-d79890d00b6a@collabora.com>
 <i4tjtsf5rsckfcayo5nuhlger5wqxn3ujeaubm4g2fgrwvhzb2@hf4uhgq3ja5p>
 <ad75cf26-9437-47d0-864d-d71263401615@collabora.com>
 <20260707-illegal-tuna-of-force-1c06e3@houat>
 <737678ab-f082-4a0e-b453-f403ba141437@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="cp5o5xnmuujb2sqc"
Content-Disposition: inline
In-Reply-To: <737678ab-f082-4a0e-b453-f403ba141437@collabora.com>
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


--cp5o5xnmuujb2sqc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 02/39] drm/connector: Add caps-based HDMI connector
 init helper
MIME-Version: 1.0

Hi,

On Wed, Jul 08, 2026 at 01:11:49PM +0300, Cristian Ciocaltea wrote:
> On 7/7/26 7:10 PM, Maxime Ripard wrote:
> > On Fri, Jul 03, 2026 at 10:31:55PM +0300, Cristian Ciocaltea wrote:
> >> Hi Dmitry,
> >>
> >> Thanks for your quick review!
> >>
> >> On 7/3/26 5:05 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Jul 02, 2026 at 05:46:15PM +0300, Cristian Ciocaltea wrote:
> >>>> In preparation for adding HDMI 2.x source capabilities, introduce st=
ruct
> >>>> drm_connector_hdmi_caps and a new drmm_connector_hdmi_init_with_caps=
()
> >>>> helper.
> >>>>
> >>>> The existing drmm_connector_hdmi_init() helper currently takes
> >>>> individual capability arguments such as supported_formats and max_bp=
c.
> >>>> Adding more HDMI-specific arguments to that function would not scale
> >>>> well, so move those values into a dedicated capabilities structure a=
nd
> >>>> implement the existing helper as a wrapper around the new caps-based
> >>>> interface.
> >>>
> >>> I think, it was an intention of Maxime: make sure that every driver is
> >>> forced to provide some values here. With the struct-based init it is
> >>> easy to overlook or to ommit a value.
> >>
> >> Agreed that the struct-based init loses the compile-time guarantee tha=
t every
> >> argument is explicitly provided - that's a real downside. =20
> >>
> >> I'd argue it's recoverable, though: the init helper validates the mand=
atory
> >> fields, so a driver that omits a required value gets rejected at init =
time
> >> rather than silently misconfigured.  The "you must provide sane values=
" property
> >> is expected to be preserved, just enforced at runtime instead of by the
> >> compiler.=20
> >=20
> > Yeah, I don't think we can win with C here. Rust might, but we're
> > probably a long way from that.
> >=20
> >> The main motivation for the struct is scalability/maintainability as w=
e add HDMI
> >> 2.x capabilities: new fields go into the struct rather than growing th=
e helper's
> >> argument list, so existing callers don't need churny signature updates=
 on every
> >> extension.
> >>
> >> FWIW, in the previous revision we discussed addressing the concern wit=
h a
> >> callback instead.  Sadly, I had to discard that approach, as it proved=
 not
> >> flexible enough, e.g. drm_bridge_connector_init() computes caps dynami=
cally, and
> >> would have required either stateful callbacks, or storing redundant/te=
mporary
> >> cap data in driver-private structures just to satisfy the callback.
> >=20
> > I just realized something reviewing your patch: we don't necessarily
> > need an extra argument or a callback, we can just put these fields into
> > drm_hdmi_connector_funcs directly, and then validate them in init.
>=20
> If I understand correctly, we should drop the drm_connector_hdmi_caps str=
uct
> introduced by this patch and move all its fields into drm_hdmi_connector_=
funcs.
>=20
> In that case, how should we proceed with drmm_connector_hdmi_init()? I se=
e the
> following options:
>=20
> 1. Continue with drmm_connector_hdmi_init_with_caps() after removing the =
caps
>    parameter, and then drop drmm_connector_hdmi_init() after the migratio=
n.

If we're going that road, we can also move the format, bpc and vendor
and product there for example.

> 2. Keep the existing (unaltered) drmm_connector_hdmi_init(), which would =
be
>    slightly inconsistent: supported_formats and max_bpc would still be pa=
ssed=20
>    as arguments, while the rest would go through drm_hdmi_connector_funcs.

I'm not sure why we would want to do that?

> 3. A variation of option 1: additionally rename
>    drmm_connector_hdmi_init_with_caps() to drmm_connector_hdmi_init() aft=
er the
>    migration.

It should be renamed indeed.

Maxime

--cp5o5xnmuujb2sqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaldJhgAKCRAnX84Zoj2+
dqO/AYC9AZdgH/JpMcBIWDu/Vknv6j6Z9Z489YI50y9fj0sorpkNqOxc3b1y9/b+
Rcc1YYQBf09mu2L5Oi1kiTr227962LwMKfviDKo0zifcYLjfkEzfBZUBCjdqznwe
/4szmSGb5g==
=1515
-----END PGP SIGNATURE-----

--cp5o5xnmuujb2sqc--

