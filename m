Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF11EE20A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 14:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXKmeV3DaVkBXi0Q3224U5nXBMx1CRsk0khqTA8jz+Y=; b=jgOKtprdcef2qHyggWWZcCa4Ml
	lT9Igp5scbnqAaUFpwGAfRxrUoamiH5lChZ7w/jadClMl/wtfjejFfMHLordNeUTNflLbyXPRzNsZ
	xBdL8got0pCqD9uHdYPgL2xtSuzTw4b0NiPLnIl7x9tVH8PR/fcyKue+Qf4eHHoPfR1cV8x364Zbo
	ja5wV1hdmCihjWgXryNn5s9vnX/EJbjr9fDQGuOa2++j6Lh2lBWPrbgUrsG7Z8qG5tQqDJLyhlsPH
	Uf5bq79WEyzZtX3+SVbo5JUQNH2EVc7NWwxyc6sYPhZ1Ev5ID27WwtP17hCicFrGWG0CQ3UPSbFTi
	lZP31l1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMSQ-0000000BPOm-0RI5;
	Fri, 06 Feb 2026 14:05:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMSO-0000000BPOA-3b2r;
	Fri, 06 Feb 2026 14:05:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4FEA6001A;
	Fri,  6 Feb 2026 14:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEE2C116C6;
	Fri,  6 Feb 2026 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770386711;
	bh=TaPvEsWxvpYYOThGeX1+fx1sD+0RPf/kwBUPBJTjDY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IauM6qxASUz/Fo2EiCWex3fCTVey671ArIsYwK+3iWyqrXjBxzIIu0605avahH/xr
	 bSczKKlSeMkMSaXRdtdNAm4UwaNkQISaJ4zChYTk8plrSLGlCORmAIB3y7aPZDe4W3
	 OMLxLp8FrcOjYrrUT+1D4xG/ZcuP8aTy+c8DrQT5CEluNQJ8y+by7nO9V4JKFd8kDf
	 gUyBwVFXjeV1lcwrd19xHwLadFcEVKvrpaQx8sJ5EyzqWQJtC6tjjnUlX2y38QsmVO
	 NavvJ2C/rmXxkBKX2/nuo7Rir0p9ae99WqUXRqq6JjEHoeddDS8lKaqWyY5NfewNXW
	 EeLaCc7mQMLFw==
Date: Fri, 6 Feb 2026 15:05:08 +0100
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
	Andri Yngvason <andri@yngvason.is>, Werner Sembach <wse@tuxedocomputers.com>, 
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v7 02/22] drm: Add new general DRM property "color format"
Message-ID: <20260206-deft-provocative-perch-6ca9bf@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-2-ef790dae780c@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="tlakrgvje6y2sbf2"
Content-Disposition: inline
In-Reply-To: <20260121-color-format-v7-2-ef790dae780c@collabora.com>
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


--tlakrgvje6y2sbf2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 02/22] drm: Add new general DRM property "color format"
MIME-Version: 1.0

Hi,

On Wed, Jan 21, 2026 at 03:45:09PM +0100, Nicolas Frattaroli wrote:
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 7eaec37ae1c7..b5604dca728a 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -556,6 +556,16 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_COUNT
>  };
> =20
> +enum drm_color_format {
> +	DRM_COLOR_FORMAT_AUTO			=3D 0,
> +	DRM_COLOR_FORMAT_RGB444			=3D BIT(0),
> +	DRM_COLOR_FORMAT_YCBCR444		=3D BIT(1),
> +	DRM_COLOR_FORMAT_YCBCR422		=3D BIT(2),
> +	DRM_COLOR_FORMAT_YCBCR420		=3D BIT(3),
> +};
> +
> +#define DRM_COLOR_FORMAT_COUNT 5
> +

I don't really see a reason to expose an enum, with a bunch of values
that are all mutually exclusive, as a bitmask. It's pretty inconsistent
with most (all?) the other similar properties we have.

I appreciate you did that to avoid fixing up every driver using those
values, but then maybe we don't have to? We could create a userspace
facing enum, and convert to DRM_COLOR_FORMAT internally.

Maxime

--tlakrgvje6y2sbf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYX1EAAKCRAnX84Zoj2+
dm20AYC5qAkdhJdQsWaSZelEFrrJKVRqs5zBtYWPBOAMRObg77mefUoSO3ktgK9d
TYXfpzUBgPXlGrYnILXs7XVYlFu//eO6ufmogZ3qIYuVKGT1yKooE8WKx/MfpzM3
iY+f6mFzuA==
=GGG7
-----END PGP SIGNATURE-----

--tlakrgvje6y2sbf2--

