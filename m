Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE958F30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpDt49gW8VSVLc5P1itBk8mCzYzqpKqFBpggkeBP84c=; b=MLVV2rkZQWqWWawgPhkesFML+q
	Q/783erRV9q5s1AvjwcU+Ct04/XrVk/oqYY1ZLISxULeJUD2mQmbAQoM9SDWUaLw0rodGykvOCj4q
	CNyjRL325D8PYPTBLpbCnxaPdJXHfp5vo4bohxU0pPiQWxSInPprUZ2nAQHLY3bGJHrQVFxVcIOre
	po9Vw3jPy2I2KQmIv5JbUUq+ano1zw/vn70V0OpdoYDr5FHjlMAeL44NEQMayVrStVRa0wKCckyZo
	L4moutVgzrdnXLLw2Te/XpWTAMopiW6/+n/xYZtL/XezFb5VU5hi5NN203dgwYbBn7ylubx3HR2nn
	wbh3kbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy50B-00000001Nic-2i7g;
	Thu, 05 Mar 2026 09:28:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy50A-00000001NiP-48dY;
	Thu, 05 Mar 2026 09:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E07461340;
	Thu,  5 Mar 2026 09:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AF9C116C6;
	Thu,  5 Mar 2026 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772702893;
	bh=eMEdAdxmi5XoFOVsNLtFj1G9gXiGNoC5/esgtPlElrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rI7HGIYhSvfO1RmPL7HM9zEdH40BCaFV4GwxZZJjuXF3OASqzHW3jOH+AkqYx0AUG
	 8+zQ87QG1y13OUntm0/TwT8WYNQXGWcBfbqSBLeGVbvp9AHtZZLURGBdLEfWt2lo5V
	 le0b7GQewa3RvZOpRCegZPxgVHgc3EDPFkhvqb/ey5q6I/g+xR5SFq7Xmi4x7cFv2O
	 LZs02z7aN6V4Z4FqV5gW9M+z/My2xLpx74i3BRILn+CmiCr/MAgM8jNnlgIVIOSApw
	 gDkrtyV4tUll/rdSmRF6JUE2LBOOgLmrk1cCyX9Zc6j1Tn9XC/oz4dzPh3/P0BP/q2
	 obZnRjiQsVFWg==
Date: Thu, 5 Mar 2026 10:28:11 +0100
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
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Andri Yngvason <andri@yngvason.is>, Werner Sembach <wse@tuxedocomputers.com>, 
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v9 02/19] drm: Add new general DRM property "color format"
Message-ID: <20260305-just-oxpecker-of-reward-e05e4f@houat>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="56nzglyxg7oadotv"
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
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


--56nzglyxg7oadotv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 02/19] drm: Add new general DRM property "color format"
MIME-Version: 1.0

Hi,

On Fri, Feb 27, 2026 at 08:20:07PM +0100, Nicolas Frattaroli wrote:
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 4af91e252fbd..b5bc93856ad1 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -579,6 +579,91 @@ enum drm_output_color_format {
>  	DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
>  };
> =20
> +/* Do not forget to adjust after modifying &enum drm_output_color_format=
 */
> +#define DRM_OUTPUT_COLOR_FORMAT_COUNT 4

Maybe we can put that as the last variant of our enum so we don't have
to always update it?

> +/**
> + * enum drm_connector_color_format - Connector Color Format Request
> + *
> + * This enum, unlike &enum drm_output_color_format, is used to specify r=
equests
> + * for a specific color format on a connector through the DRM "color for=
mat"
> + * property. The difference is that it has an "AUTO" value to specify th=
at
> + * no specific choice has been made.
> + */
> +enum drm_connector_color_format {
> +	/**
> +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display protocol
> +	 * helpers should pick a suitable color format. All implementations of a
> +	 * specific display protocol must behave the same way with "AUTO", but
> +	 * different display protocols do not necessarily have the same "AUTO"
> +	 * semantics.
> +	 *
> +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if the
> +	 * bandwidth required for full-scale RGB is not available, or the mode
> +	 * is YCbCr 4:2:0-only, as long as the mode and output both support
> +	 * YCbCr 4:2:0.
> +	 *
> +	 * For display protocols other than HDMI, the recursive bridge chain
> +	 * format selection picks the first chain of bridge formats that works,
> +	 * as has already been the case before the introduction of the "color
> +	 * format" property. Non-HDMI bridges should therefore either sort their
> +	 * bus output formats by preference, or agree on a unified auto format
> +	 * selection logic that's implemented in a common state helper (like
> +	 * how HDMI does it).
> +	 */
> +	DRM_CONNECTOR_COLOR_FORMAT_AUTO =3D 0,
> +
> +	/**
> +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> +	 */
> +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> +
> +	/**
> +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output format (ie.
> +	 * not subsampled)
> +	 */
> +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> +
> +	/**
> +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output format (ie.
> +	 * with horizontal subsampling)
> +	 */
> +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> +
> +	/**
> +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output format (ie.
> +	 * with horizontal and vertical subsampling)
> +	 */
> +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
> +};
> +
> +/* Do not forget to adjust after modifying &enum drm_connector_color_for=
mat */
> +#define DRM_CONNECTOR_COLOR_FORMAT_COUNT 5

Ditto

Maxime

--56nzglyxg7oadotv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaalMqgAKCRAnX84Zoj2+
dmOPAX92VmruO+gIj35XK8ogbZVYutcf8QCLMn4u+YKllIE7k9+XA+wG0UK9eYuH
cO1fW3UBfRH+rv+HolxgeR79kVh3vlGJgPBqkn4Am7SomEZ6vyimagwigP2i7czB
4BUuzmli8g==
=EFdZ
-----END PGP SIGNATURE-----

--56nzglyxg7oadotv--

