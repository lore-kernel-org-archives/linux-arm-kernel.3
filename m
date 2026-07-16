Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BD5C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMht40QLzWVG/mfdw3LVM0kTmUTUuw/6X42aBPd68yA=; b=xlWJw/KtEMf82vDF8k17S1GAnm
	35UhFgqzu7PRytX8CxXznPKrAhBx6dnB99YiheCOeoKqpUR5GrfrHBWn4Y0tIyho3JfKb08914nfd
	aCAMlsxV5jLqKqS/6hQF9Tn3aOMBru2y2z8saMjBRt8dep662+/OokEKB8vjJ1U/LJXoYYkd38TKR
	y5jgfrMUtqZWujld8LJPiTUSG5+Dttlk/dbxZtwVUoYg8WXj8KaxoTo/m2FVyeeKOTkWdkPRTIYJ6
	4NWJC+hZf+/xf7pctSGu+hvEVzQAYMNepsV7Zj8Ll5n75r1H6yvzt8AMp9TS91QtgMhRtmyRYsRp+
	el+m/56w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMOV-0000000HPG6-0Nvc;
	Thu, 16 Jul 2026 13:44:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMOT-0000000HPFq-3WX9;
	Thu, 16 Jul 2026 13:44:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D9F940A57;
	Thu, 16 Jul 2026 13:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16B21F00A3F;
	Thu, 16 Jul 2026 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784209493;
	bh=uMht40QLzWVG/mfdw3LVM0kTmUTUuw/6X42aBPd68yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HxipJ+JEjk52tLpQHoWT5d8XKmpp6nxOOcKEjdJwaqSTGMwCkPZAGpq9B49xNs8Yi
	 FYkrGpWBxfFgl6QsxP/FM0mS0n8iR9NCtoznTmW8aNYABcOVXf+uz/StvXUvSfW0yM
	 BVXWTm/eypaG6n0cI06euAXXuqCqj9592PNRXJlwvaFhQk0fR52TMSNcBn2vD59EhR
	 FLuKbiEHH9WBgnSvhUuorYV+hvW/sWWZL7oKf9EYFiVAwBgf7jrjegj1Q3iiSg9Oqp
	 9J3WTM+XJMuSKa4va5LPnzSWQLJHSjaROfOlfd3/cHxq5mv0An4kZIAn9XkZEptfMa
	 cmV4Yqb/RNyeA==
Date: Thu, 16 Jul 2026 15:44:50 +0200
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
Message-ID: <20260716-mega-ocelot-of-foundation-e3bcf6@houat>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-2-d79890d00b6a@collabora.com>
 <i4tjtsf5rsckfcayo5nuhlger5wqxn3ujeaubm4g2fgrwvhzb2@hf4uhgq3ja5p>
 <ad75cf26-9437-47d0-864d-d71263401615@collabora.com>
 <20260707-illegal-tuna-of-force-1c06e3@houat>
 <737678ab-f082-4a0e-b453-f403ba141437@collabora.com>
 <80374deb-3246-413f-a043-66bcdb438ab1@collabora.com>
 <20260715-fair-opalescent-rhino-c6407b@houat>
 <45113534-94ad-4a0f-8014-c04e9ab67a26@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vbfjhkjchwklmxe6"
Content-Disposition: inline
In-Reply-To: <45113534-94ad-4a0f-8014-c04e9ab67a26@collabora.com>
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


--vbfjhkjchwklmxe6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 02/39] drm/connector: Add caps-based HDMI connector
 init helper
MIME-Version: 1.0

On Wed, Jul 15, 2026 at 01:34:19PM +0300, Cristian Ciocaltea wrote:
> On 7/15/26 11:50 AM, Maxime Ripard wrote:
> > On Fri, Jul 10, 2026 at 01:27:37PM +0300, Cristian Ciocaltea wrote:
> >> On 7/8/26 1:11 PM, Cristian Ciocaltea wrote:
> >>> Hi Maxime,
> >>>
> >>> On 7/7/26 7:10 PM, Maxime Ripard wrote:
> >>>> On Fri, Jul 03, 2026 at 10:31:55PM +0300, Cristian Ciocaltea wrote:
> >>>>> Hi Dmitry,
> >>>>>
> >>>>> Thanks for your quick review!
> >>>>>
> >>>>> On 7/3/26 5:05 PM, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Jul 02, 2026 at 05:46:15PM +0300, Cristian Ciocaltea wrote:
> >>>>>>> In preparation for adding HDMI 2.x source capabilities, introduce=
 struct
> >>>>>>> drm_connector_hdmi_caps and a new drmm_connector_hdmi_init_with_c=
aps()
> >>>>>>> helper.
> >>>>>>>
> >>>>>>> The existing drmm_connector_hdmi_init() helper currently takes
> >>>>>>> individual capability arguments such as supported_formats and max=
_bpc.
> >>>>>>> Adding more HDMI-specific arguments to that function would not sc=
ale
> >>>>>>> well, so move those values into a dedicated capabilities structur=
e and
> >>>>>>> implement the existing helper as a wrapper around the new caps-ba=
sed
> >>>>>>> interface.
> >>>>>>
> >>>>>> I think, it was an intention of Maxime: make sure that every drive=
r is
> >>>>>> forced to provide some values here. With the struct-based init it =
is
> >>>>>> easy to overlook or to ommit a value.
> >>>>>
> >>>>> Agreed that the struct-based init loses the compile-time guarantee =
that every
> >>>>> argument is explicitly provided - that's a real downside. =20
> >>>>>
> >>>>> I'd argue it's recoverable, though: the init helper validates the m=
andatory
> >>>>> fields, so a driver that omits a required value gets rejected at in=
it time
> >>>>> rather than silently misconfigured.  The "you must provide sane val=
ues" property
> >>>>> is expected to be preserved, just enforced at runtime instead of by=
 the
> >>>>> compiler.=20
> >>>>
> >>>> Yeah, I don't think we can win with C here. Rust might, but we're
> >>>> probably a long way from that.
> >>>>
> >>>>> The main motivation for the struct is scalability/maintainability a=
s we add HDMI
> >>>>> 2.x capabilities: new fields go into the struct rather than growing=
 the helper's
> >>>>> argument list, so existing callers don't need churny signature upda=
tes on every
> >>>>> extension.
> >>>>>
> >>>>> FWIW, in the previous revision we discussed addressing the concern =
with a
> >>>>> callback instead.  Sadly, I had to discard that approach, as it pro=
ved not
> >>>>> flexible enough, e.g. drm_bridge_connector_init() computes caps dyn=
amically, and
> >>>>> would have required either stateful callbacks, or storing redundant=
/temporary
> >>>>> cap data in driver-private structures just to satisfy the callback.
> >>>>
> >>>> I just realized something reviewing your patch: we don't necessarily
> >>>> need an extra argument or a callback, we can just put these fields i=
nto
> >>>> drm_hdmi_connector_funcs directly, and then validate them in init.
> >>>
> >>> If I understand correctly, we should drop the drm_connector_hdmi_caps=
 struct
> >>> introduced by this patch and move all its fields into drm_hdmi_connec=
tor_funcs.
> >>>
> >>> In that case, how should we proceed with drmm_connector_hdmi_init()?=
=20
> >>
> >> Actually, this brings us to the callback issue: we cannot compute caps
> >> dynamically, as it only works with static data, since funcs is suppose=
d to be
> >> immutable.
> >=20
> > Does it? The core and helpers must consider it immutable but it doesn't
> > have to. drm_bridge_connector for example could totally allocate it and
> > dynamically create it based on the bridge capabilities.
>=20
> If we take the VC4 case, is it fine to drop the const from the static
> drm_connector_hdmi_funcs to allow dynamically setting up supported_hdmi_v=
er and
> max_bpc in vc4_hdmi_connector_init()?
>=20
> static struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs =3D {
> 	.tmds_char_rate_valid	 =3D vc4_hdmi_connector_clock_valid,
> 	...
> }
>=20
> static int vc4_hdmi_connector_init()=20
> {
> 	...
>    =20
> 	if (vc4_hdmi->variant->supports_hdr)
> 		vc4_hdmi_hdmi_connector_funcs.max_bpc =3D 12;
>=20
> 	if (vc4_hdmi->variant->max_pixel_clock >=3D HDMI_2_0_TMDS_CHAR_RATE_MAX_=
HZ)
> 		vc4_hdmi_hdmi_connector_funcs.supported_hdmi_ver =3D HDMI_VERSION_2_0;
> 	else if (vc4_hdmi->variant->max_pixel_clock >=3D HDMI_1_3_TMDS_CHAR_RATE=
_MAX_HZ)
> 		vc4_hdmi_hdmi_connector_funcs.supported_hdmi_ver =3D HDMI_VERSION_1_3;
> 	...
> }

No, but you don't have to do that either.

You have three cases:
 - Rpi < 4 has max_bpc =3D 8, HDMI 1.4
 - RPI 4 HDMI 0 and RPI 5 has max_bpc =3D 12, HDMI 2.0
 - RPI 4 HDMI 1 has max_bpc =3D 12, HDMI 1.4

Just create three different structures, and put a pointer to the right
one in the vc4_hdmi_variant structure. There's no need to be dynamic
there.

Maxime

--vbfjhkjchwklmxe6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaljgUgAKCRAnX84Zoj2+
djxIAYDPtQoVb/W6EH/U9Qki8Z7ALhZ58LpPruuVYz3nKWBeFXKtHYgc/rrgstSx
zNA3la8BfAj5ec7Ciys5lGuBT3lBFyLefqiagAgWNQ5tt8CSNfJDFQHWwheV8qKz
JW8wiSpEZw==
=cm7W
-----END PGP SIGNATURE-----

--vbfjhkjchwklmxe6--

