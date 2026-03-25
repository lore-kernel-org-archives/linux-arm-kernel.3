Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57D9106B531
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPa05SxOFKFh9B88dCUlWpM7c0+FbNx80l87CJMZNdc=; b=MaqXWaLqsXl55f6xh0MOQ1R5ZB
	ImS/zqaPUf4mzL0FJ46jGDAzXZBtfzCFAFj79TZOt2sP9Gvac6zRTqywfItDjHihUwUz0H7xJ75g1
	mrHo4kX+7fMOX/ioFNCaWCmTb59sgYuJvBvGD+lidTpTDpxZrrszIqGMCzAVGO5ssOXDEHEfgtlUI
	gSsgvD5+NoFoeX5TF7/Ozi6NZXJbjC6FA2s0esGgYb5Fd1dvJaVM74dwyd0oZqPnRgv6xpRISQ1ZL
	cghyMFmPLTt8eydUk7e5VcX1zMa1xi2X/b8GOpLnQeslibu8/Sp9tx+wRVoiEtaAxwS9L9rV0SL7v
	Jma6qjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NvQ-00000003QP9-3b14;
	Wed, 25 Mar 2026 13:05:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NvN-00000003QOK-3eLl;
	Wed, 25 Mar 2026 13:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D929F40809;
	Wed, 25 Mar 2026 13:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FABC4CEF7;
	Wed, 25 Mar 2026 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443928;
	bh=aPMGk3jADcln8q+CeQZg3ofpMsUR6G6YPb/JjSH675o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkJ7MeTntxruIL7nO+EPdKYTYxw8SpxdkjEkM7l1A6XCC4fnHaHbYhYDKyFMNW7Du
	 Kz/YLyPVsNNbgDditw8AhEQA1mQ4/RZcDzp+/NzHuiNvvSH7CDqP2Kjc7aqjYMDkjG
	 dVdwu7s6FFBCdXWXg4W9mUlnNhcvEuhfSJEf0tchoCRvUmT+QCHaao2HOxDbF0p2kx
	 xV5ASeLropsHONR+RMEc+IYr5sLgTeMtVfGf90eGWeF75S+xpO8CUstpYLdXNdnXx8
	 bXy1d51lz72sLtmWF7I1xOfRU5IkaUDWHBNmFzFPiOlcYxnx1KUynWw89XisiKXg8c
	 PZoIAg8xb+TUQ==
Date: Wed, 25 Mar 2026 14:05:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Message-ID: <20260325-quaint-bull-of-fortitude-dc68da@houat>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com>
 <CAPY8ntB9f_=f5kru=8w9BpTuqQR+93maGpT61EKU28Uay2vq8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="qhd22dcfmqbzbfkk"
Content-Disposition: inline
In-Reply-To: <CAPY8ntB9f_=f5kru=8w9BpTuqQR+93maGpT61EKU28Uay2vq8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_060529_975907_AB1AB793 
X-CRM114-Status: GOOD (  23.17  )
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


--qhd22dcfmqbzbfkk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
MIME-Version: 1.0

Hi Dave,

On Wed, Mar 25, 2026 at 12:49:19PM +0000, Dave Stevenson wrote:
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index af8b92d2d5b7..bd549f912b76 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -571,14 +571,102 @@ enum drm_colorspace {
> >   *   YCbCr 4:2:2 output format (ie. with horizontal subsampling)
> >   * @DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> >   *   YCbCr 4:2:0 output format (ie. with horizontal and vertical subsa=
mpling)
> > + * @DRM_OUTPUT_COLOR_FORMAT_COUNT:
> > + *   Number of valid output color format values in this enum
> >   */
> >  enum drm_output_color_format {
> >         DRM_OUTPUT_COLOR_FORMAT_RGB444 =3D 0,
> >         DRM_OUTPUT_COLOR_FORMAT_YCBCR444,
> >         DRM_OUTPUT_COLOR_FORMAT_YCBCR422,
> >         DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
> > +       DRM_OUTPUT_COLOR_FORMAT_COUNT,
> >  };
> >
> > +/**
> > + * enum drm_connector_color_format - Connector Color Format Request
> > + *
> > + * This enum, unlike &enum drm_output_color_format, is used to specify=
 requests
> > + * for a specific color format on a connector through the DRM "color f=
ormat"
> > + * property. The difference is that it has an "AUTO" value to specify =
that
> > + * no specific choice has been made.
> > + */
> > +enum drm_connector_color_format {
> > +       /**
> > +        * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display prot=
ocol
> > +        * helpers should pick a suitable color format. All implementat=
ions of a
> > +        * specific display protocol must behave the same way with "AUT=
O", but
> > +        * different display protocols do not necessarily have the same=
 "AUTO"
> > +        * semantics.
> > +        *
> > +        * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if=
 the
> > +        * bandwidth required for full-scale RGB is not available, or t=
he mode
> > +        * is YCbCr 4:2:0-only, as long as the mode and output both sup=
port
> > +        * YCbCr 4:2:0.
>=20
> Is there a reason you propose dropping back to YCbCr 4:2:0 without
> trying YCbCr 4:2:2 first? Minimising the subsampling is surely
> beneficial, and vc4 for one can do 4:2:2 but not 4:2:0.

The "auto" behaviour is strictly identical to the one we have right now,
and this one stems from i915. Back when all that logic was added, it was
decided to align every driver behavior on i915 because that's what most
compositors would expect.

Maxime

--qhd22dcfmqbzbfkk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCacPdkQAKCRAnX84Zoj2+
drHtAYC+DuxgXCLhzVadFK3jmqH9FyaN19FHcokHPX07HgOJboZMiAKov3in7JDx
F2EVeaMBgOWXIimrG0/rhUteUiveBwgDmRTdeGj5T51fN1DLKTsNYPFR1cW+9rGb
iF4j/QhIQQ==
=of9f
-----END PGP SIGNATURE-----

--qhd22dcfmqbzbfkk--

