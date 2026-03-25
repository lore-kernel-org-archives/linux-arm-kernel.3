Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80214109C029
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8XVkC8wuytXmqSHrSf3rlMMxINj+E9KqTpQaOet/TY=; b=jjeFK+GMTjhrMVuddjASBqIaa2
	KwDvP9Vl7f7XjEGeDyACgL7jyFvwofewWqVXxA6ehG4jZz8sUJ1+M9EiSG3ONckoaa49sClwWGE4s
	IA3AB9Z7IKcYx/ijotrKn9JLGBu9G1bWLo6mhAc+Tsm7g32aYF5KEG6N85rWm95VUhZh/p7cWPeDu
	lGGBI4HS2G5VAJ7qf6UUbZt9m9wxvmzugqiiqBZIcSVgQhkymtI6ckRR2uDZRBl/IbtMGGrqMElWl
	URnCSfjeHT62qE5VSZJ8M0Bil7MYx4ynOpR+ehJfzeuvkWXD6rx/DOzqIS6t4jF8RMWWWeFy6Z7sc
	rQm8fTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PfM-00000003j2V-3FSy;
	Wed, 25 Mar 2026 14:57:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PfK-00000003j27-0BqV;
	Wed, 25 Mar 2026 14:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3729A4024F;
	Wed, 25 Mar 2026 14:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAB7C4CEF7;
	Wed, 25 Mar 2026 14:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774450621;
	bh=kODB/4Odan0TLyX1+H2rGTJ1SkOip0pPH/GqtThBgFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lveoloIP8+97OC9m2l5bBmtBw6c3CSQdSICZGVMCZbaVAtz/7499RlssUCIk3l9al
	 BWGtZaB/Gwx87SRUYZ4cMxnfQOw/wFD3DxPoaz6ZMwVdXpkyx08nrQ9XGu9iAX/z5D
	 dXQvJWfV6yPc172xpKNvXzEkN0NwwG2R1phfqiDxfT8sDpBvBgM+V2xyA1LtHBt10T
	 rerF3gSEDkGf6dqX15xt8IzhWyiX9IARja5LRQxUZ3+w4ei87vSIWEb3ti0JiuO53z
	 NhJjjPjGV9Y3DR3hKAwYyg+sRfCMTELoq9pie6SsHbeivGmpPiJrLsmd6IyREGDtzg
	 sr4f14070acsA==
Date: Wed, 25 Mar 2026 15:56:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
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
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Werner Sembach <wse@tuxedocomputers.com>, Andri Yngvason <andri@yngvason.is>, 
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
Message-ID: <20260325-magnificent-ultraviolet-oarfish-baefbc@houat>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com>
 <acLDPYuaVI2-12JX@intel.com>
 <23910073.EfDdHjke4D@workhorse>
 <acLrv5hLyNss-Px5@intel.com>
 <20260325-neat-elegant-raven-ebc9ab@houat>
 <acPA60Ci3n_t__xF@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="mhdva7e7vsga4kjf"
Content-Disposition: inline
In-Reply-To: <acPA60Ci3n_t__xF@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_075702_141446_AA41AB08 
X-CRM114-Status: GOOD (  42.83  )
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


--mhdva7e7vsga4kjf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
MIME-Version: 1.0

On Wed, Mar 25, 2026 at 01:03:07PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Mar 25, 2026 at 09:24:27AM +0100, Maxime Ripard wrote:
> > On Tue, Mar 24, 2026 at 09:53:35PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Tue, Mar 24, 2026 at 08:10:11PM +0100, Nicolas Frattaroli wrote:
> > > > On Tuesday, 24 March 2026 18:00:45 Central European Standard Time V=
ille Syrj=E4l=E4 wrote:
> > > > > On Tue, Mar 24, 2026 at 05:01:07PM +0100, Nicolas Frattaroli wrot=
e:
> > > > > > +enum drm_connector_color_format {
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display pr=
otocol
> > > > > > +	 * helpers should pick a suitable color format. All implement=
ations of a
> > > > > > +	 * specific display protocol must behave the same way with "A=
UTO", but
> > > > > > +	 * different display protocols do not necessarily have the sa=
me "AUTO"
> > > > > > +	 * semantics.
> > > > > > +	 *
> > > > > > +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 =
if the
> > > > > > +	 * bandwidth required for full-scale RGB is not available, or=
 the mode
> > > > > > +	 * is YCbCr 4:2:0-only, as long as the mode and output both s=
upport
> > > > > > +	 * YCbCr 4:2:0.
> > > > > > +	 *
> > > > > > +	 * For display protocols other than HDMI, the recursive bridg=
e chain
> > > > > > +	 * format selection picks the first chain of bridge formats t=
hat works,
> > > > > > +	 * as has already been the case before the introduction of th=
e "color
> > > > > > +	 * format" property. Non-HDMI bridges should therefore either=
 sort their
> > > > > > +	 * bus output formats by preference, or agree on a unified au=
to format
> > > > > > +	 * selection logic that's implemented in a common state helpe=
r (like
> > > > > > +	 * how HDMI does it).
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_AUTO =3D 0,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output f=
ormat (ie.
> > > > > > +	 * not subsampled)
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output f=
ormat (ie.
> > > > > > +	 * with horizontal subsampling)
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output f=
ormat (ie.
> > > > > > +	 * with horizontal and vertical subsampling)
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
> > > > >=20
> > > > > Seems like this should document what the quantization range
> > > > > should be for each format.
> > > > >=20
> > > >=20
> > > > I don't think so? If you want per-component bit depth values,
> > > > DRM_FORMAT_* defines would be the appropriate values to use. This
> > > > enum is more abstract than that, and is there to communicate
> > > > YUV vs. RGB and chroma subsampling, with bit depth being handled
> > > > by other properties.
> > > >=20
> > > > If you mean the factor used for subsampling, then that'd only be
> > > > relevant if YCBCR410 was supported where one chroma plane isn't
> > > > halved but quartered in resolution. I suspect 4:1:0 will never
> > > > be added; no digital display protocol standard supports it to my
> > > > knowledge, and hopefully none ever will.
> > >=20
> > > No, I mean the quantization range (16-235 vs. 0-255 etc).
> > >=20
> > > The i915 behaviour is that YCbCr is always limited range,
> > > RGB can either be full or limited range depending on the=20
> > > "Broadcast RGB" property and other related factors.
> >=20
> > So far the HDMI state has both the format and quantization range as
> > different fields. I'm not sure we need to document the range in the
> > format field, maybe only mention it's not part of the format but has a
> > field of its own?
>=20
> I think we only have it for RGB (on some drivers only?). For YCbCr
> I think the assumption is limited range everywhere.
>=20
> But I'm not really concerned about documenting struct members.
> What I'm talking about is the *uapi* docs. Surely userspace
> will want to know what the new property actually does so the
> uapi needs to be documented properly. And down the line some
> new driver might also implement the wrong behaviour if there
> is no clear specification.

Ack

> So I'm thinking (or perhaps hoping) the rule might be something like:
> - YCbCr limited range=20
> - RGB full range if "Broadcast RGB" property is not present

Isn't it much more complicated than that for HDMI though? My
recollection was that any VIC but VIC1 would be limited range, and
anything else full range?

> - RGB full or limited range based on the "Broadcast RGB" property
>   if it's present
>=20
> I think the "Broadcast RGB" property itself might also be lacking
> proper uapi docs, so that may need to be remedied as well.

I took care of documenting it when merging the HDMI helpers:
https://docs.kernel.org/gpu/drm-kms.html#hdmi-specific-connector-properties

Maxime

--mhdva7e7vsga4kjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCacP3tQAKCRAnX84Zoj2+
dqD6AX9ruA9VQEK32t44/SErwn8ouTAnQA9K9i0WTlcaidv+2oyLtolh4CEvzUcR
Knh9fq4Bfjj/Wa5dcOSnIESCkqTRH/yo4UCESrmghwhyznX8ffjBrkE/aWSPhI2B
5bfXV1iang==
=9m7S
-----END PGP SIGNATURE-----

--mhdva7e7vsga4kjf--

