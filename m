Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97D2D58E7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 08:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMCtZh3s1MPyX6OvpvOhiWfZ85Z4lv+T3YdJvZr1/y4=; b=LQmmXbZF8Dqe3lIY657/9PvuYS
	r+6Pk+INxe00e+Oai+evzQ2iRfEbmzg0ZVDwHlDxImSfgK2uH2Ur8I16FqMExJtyVdCwq9fWthCdv
	HzZzwe5CSCRk4axsea4CT0Iad2LkLGMa4dY6FagMwHMNNiEQlaDlDUdyVU0pqiR+N1MjPFEp0q/BP
	SsBpV+hwNnYZPM83/F2YG6g3ipJSHkjaKMjYQmtbiEqOu72NAGX1rVCHhPjzMqH1GU2W15dpHyOFW
	kWrO+7mNloWHOHCW2OJ9ceV6TKT2+KverXYm0y5UczEy/RntqLuokri+D7Iz2SyPQ2MTkhShTMngb
	kVILIw5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyur-0000000CXiA-2hKs;
	Mon, 02 Mar 2026 08:46:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyup-0000000CXhj-1WfP;
	Mon, 02 Mar 2026 08:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D42EB437BD;
	Mon,  2 Mar 2026 08:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A83AC19423;
	Mon,  2 Mar 2026 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772441169;
	bh=YLIStkIR1KJnf5YwD17+MZnntYrS4W0CEDe/6e+dJPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5TC01paLL43eTxonms1l0UTMB4QscnLOYJJh0RDmcC95ZK4NIh4yD4712OZgUuCL
	 tGqNwHCeuKPPfd/Y9RMuzjFpMVmtx4gMtyFak2D4RcHbIe5Vj6uBb69MFJcJn8i1MV
	 LZ3G6cmaomOi4BrrxqreSH1M6xtIAVmo/cePrRxgpg98RMOH0Y27kjzCOFgFY32W9Z
	 YScYRspyy630xCT3XFhu+bPmy9R1s9nWAjo80hSv3xIbOX0venX94Nvrxjj1aRNf4p
	 kRf4aeZrCSzUJ13Por+I5nwALTVi5dTSqYKsEbG78P6SkwRUpll2ijXXo3iGzov5Qj
	 htsykmjAjatjw==
Date: Mon, 2 Mar 2026 09:46:06 +0100
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
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <20260302-literate-shrew-of-health-ec19d2@houat>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vlv6rbxnnxkik4dv"
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_004611_443014_D9B8C9B7 
X-CRM114-Status: GOOD (  23.29  )
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


--vlv6rbxnnxkik4dv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0

Hi,

On Fri, Feb 27, 2026 at 08:20:09PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
>=20
> Implement it by translating the requested drm_connector_color_format to
> a drm_output_color_format enum value as per the logic HDMI should use
> for this: Auto is translated to RGB, and a fallback to YUV420 is only
> performed if the original color format was auto.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++=
++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 9f3b696aceeb..31c6d55fa995 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -669,10 +669,34 @@ hdmi_compute_config(const struct drm_connector *con=
nector,
>  	unsigned int max_bpc =3D clamp_t(unsigned int,
>  				       conn_state->max_bpc,
>  				       8, connector->max_bpc);
> +	enum drm_output_color_format fmt;
>  	int ret;
> =20
> -	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> -				      DRM_OUTPUT_COLOR_FORMAT_RGB444);
> +	switch (conn_state->color_format) {
> +	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
> +	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
> +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_RGB444;
> +		break;
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
> +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_YCBCR444;
> +		break;
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
> +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_YCBCR422;
> +		break;
> +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
> +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
> +		break;
> +	default:
> +		drm_dbg_kms(connector->dev, "HDMI does not support color format '%d'.\=
n",
> +			    conn_state->color_format);
> +		return -EINVAL;
> +	}
> +
> +	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, f=
mt);
> +
> +	if (conn_state->color_format !=3D DRM_CONNECTOR_COLOR_FORMAT_AUTO)
> +		return ret;
> +

We discussed it before, and it wasn't as trivial as it should have been,
but now, I really feel something like the following would be simpler:

if (conn_state->color_format !=3D DRM_CONNECTOR_COLOR_FORMAT_AUTO) {
	enum drm_output_color_format fmt;

	switch (conn_state->color_format) {
	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
	     drm_warn(connector->dev, "The format shouldn't be auto here"); // or =
any better message
	     fallthrough;
	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
	     fmt =3D DRM_OUTPUT_COLOR_FORMAT_RGB444;
	     break;
	....
	}

	return hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, fmt);
}

ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
			      DRM_OUTPUT_COLOR_FORMAT_RGB444);

It makes it much clearer what the two branches are, and we don't have to
test for auto multiple times.

Maxime

--vlv6rbxnnxkik4dv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaVOSgAKCRAnX84Zoj2+
duj9AYC6G+CPt23Nm72keJB2VkI/OrdBkSffWrgwixDMIES2m/uxHVPMi8koLjpl
BYFiCIUBf0RielKN8kXZvqBYg3FOuVBkylhQtEUK3blNIgR3cHtExnVL3+ecatTR
DqljNp/Vrw==
=9ih2
-----END PGP SIGNATURE-----

--vlv6rbxnnxkik4dv--

