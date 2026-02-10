Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8D1EB26F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeodPgCrqz/bdgN4qIeGKLgnr/3djN7UTM/5pdQBlfk=; b=YVMVo+OhqahdfEur9Jxhk+xDwc
	5KGV9zilQJapsYnTl7tLXw+pSrRboKf0iWg4Mj751DuhJNAEIvnjqqdXnxPt7beG51NcEci3eancT
	sCW9aXttFM+G4JQMpcf75C1J7UQw/Kzcew0Rzk6zrnYflDRlKrtz0ukMXVRIBsgCkga/DbwMYcFRm
	rbTr46aN4mLBauoSJWz6Qv5JJGh/lS06MmBCSrMmJIJPCrikyq9PNEjQcvmL1akSt37Gy7iQZSlxX
	yfIrpLhA4aEgWzKJ/a7B73iaZsMhJLNLFFI8xPpDO4QzqrR5DL7vhvZmHofH3sKsC+AICJdU1yjdD
	COxNr/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprTn-0000000HMMK-0M8K;
	Tue, 10 Feb 2026 17:24:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprTm-0000000HMM9-17kU;
	Tue, 10 Feb 2026 17:24:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E13160141;
	Tue, 10 Feb 2026 17:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CDBC19424;
	Tue, 10 Feb 2026 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770744289;
	bh=AybflH6vCiFt0c5IgI0vjl85jJ21G95boT+74nEtcOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ng5pmDJNkBc2/oSRx4pOQZtMwfVdnyLJCAe+kx5tWyYItYLMZQhdYN1JE+R3ufDCh
	 Sg3MPeIvUefZiasC4ZD9NZ69q61KWUj9jJc70gTsT44q7Q7e4ruOwJ9x+J4guA4lYn
	 72mmOFfmlEJ0RoX0lX6wRJTTZMjmjgf1RWmc5JylLOP3m0B0ER3uqzfdJ0LU6yYr89
	 1my9GNZBbWW+nOuxJ33JuBoa0ELUcTqbIRdBPIMnuLKZOhptweV4AQdHhfv2b3RHOk
	 fjvj7G/GuPv4VuzsnknEAcq+Hdt4sUa+ypgV+QzMPvpmipP+okDxfu9/sBzc27vkWV
	 hV0aZRNUVvh5A==
Date: Tue, 10 Feb 2026 18:24:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v7 03/22] drm: Add enum conversions between
 DRM_COLOR_FORMAT and HDMI_COLORSPACE
Message-ID: <20260210-prophetic-elk-of-superiority-b0ab03@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-3-ef790dae780c@collabora.com>
 <20260206-angelic-crimson-bug-aaab40@houat>
 <2028270.PYKUYFuaPT@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3gcl4wmc7phuuk27"
Content-Disposition: inline
In-Reply-To: <2028270.PYKUYFuaPT@workhorse>
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


--3gcl4wmc7phuuk27
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 03/22] drm: Add enum conversions between
 DRM_COLOR_FORMAT and HDMI_COLORSPACE
MIME-Version: 1.0

Hi,

On Sat, Feb 07, 2026 at 08:55:16PM +0100, Nicolas Frattaroli wrote:
> On Friday, 6 February 2026 15:08:46 Central European Standard Time Maxime=
 Ripard wrote:
> > On Wed, Jan 21, 2026 at 03:45:10PM +0100, Nicolas Frattaroli wrote:
> > > While the two enums have similar values, they're not identical, and
> > > HDMI's enum is defined as per the HDMI standard.
> > >=20
> > > Add a simple conversion function from DRM to HDMI. Unexpected inputs
> > > aren't handled in any clever way, DRM_COLOR_FORMAT_AUTO and any other
> > > value that doesn't cleanly map to HDMI just gets returned as
> > > HDMI_COLORSPACE_RGB.
> > >=20
> > > Add a second conversion function that gets a DRM_COLOR_FORMAT from an
> > > HDMI_COLORSPACE as well. In this case, reserved HDMI values that can't
> > > be converted will result in an -EINVAL return value.
> > >=20
> > > Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  include/drm/drm_connector.h | 54 +++++++++++++++++++++++++++++++++++=
++++++++++
> > >  1 file changed, 54 insertions(+)
> > >=20
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index b5604dca728a..ffeb42f3b4a3 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -2612,6 +2612,60 @@ int drm_connector_attach_color_format_property=
(struct drm_connector *connector);
> > > =20
> > >  const char *drm_get_color_format_name(enum drm_color_format color_fm=
t);
> > > =20
> > > +/**
> > > + * drm_color_format_to_hdmi_colorspace - convert DRM color format to=
 HDMI
> > > + * @fmt: the &enum drm_color_format to convert
> > > + *
> > > + * Convert a given &enum drm_color_format to an equivalent
> > > + * &enum hdmi_colorspace. For non-representable values and
> > > + * %DRM_COLOR_FORMAT_AUTO, the value %HDMI_COLORSPACE_RGB is returne=
d.
> > > + *
> > > + * Returns: the corresponding &enum hdmi_colorspace value
> > > + */
> > > +static inline enum hdmi_colorspace __pure
> > > +drm_color_format_to_hdmi_colorspace(enum drm_color_format fmt)
> > > +{
> > > +	switch (fmt) {
> > > +	default:
> > > +	case DRM_COLOR_FORMAT_AUTO:
> > > +	case DRM_COLOR_FORMAT_RGB444:
> > > +		return HDMI_COLORSPACE_RGB;
> >=20
> > I don't think that's correct. What auto ends up as totally depends on
> > the atomic state it comes with.
> >=20
> > At the very least, you should output a warning there, because that case
> > should never happen.
>=20
> Yeah, my hope was to keep this function __pure so that the compiler
> has maximum freedom to do whatever. With a WARN, it's got side-effects
> now, and we're no longer pure. With a status return value and an output
> parameter, it's no longer pure either, because the output parameter is
> not local memory.
>=20
> The limiting factor here is that as I understand correctly, I can't
> really extend the hdmi_colorspace enum, as it's basically 1:1 from
> the standard. Doing this would be the ideal solution, because we'd
> keep the function pure and without surprise conversions happening.

I feel like this kind of loops back into the other two reviews I did:
you paint yourself into a corner by having auto in the enum, and by
passing it directly to that function.

If, instead, you don't allow auto in the drm_color_format enum, and
resolve auto in the hdmi_compute_config function instead of passing it
directly, then we don't have to deal with it here.

> Looking at hdmi_colorspace_get_name in drivers/video/hdmi.c, it returns
> "Invalid" for any value not in the enum itself. Would it be allowable
> to tack an HDMI_COLORSPACE_INVALID at the end of the enum with perhaps
> a negative value, or is there a different approach you'd prefer?

And again, if we only ever have to deal with RGB, YUV420, 444 or 422,
then we always have valid values for HDMI_COLORSPACE.

Plus, the hdmi_colorspace enum matches what the hdmi spec defines, so we
can't really extend it, and most importantly, hdmi_colorspace_get_name()
is only ever used for debugging / logging purposes, it's never in the
"functional" path.

Maxime

--3gcl4wmc7phuuk27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYtp3QAKCRAnX84Zoj2+
dpXQAX9YW7+dFFercH/6Ci5pTtOduK0WFGtCE+czBS0MekL3hIR8Qk0XOe/wCQ0N
lSl/1g0BfiBZVN1+rZWOQ89eweN9INWHQO3r4Uh4l9OvZzduZolxq+5q62yTdhYG
QVZ10CHXHA==
=jFA7
-----END PGP SIGNATURE-----

--3gcl4wmc7phuuk27--

