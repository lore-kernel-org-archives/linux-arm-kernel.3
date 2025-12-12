Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04E6D4336A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pMyHWq73Jx5Cd2nR1IOVPQPYrjrmaHdi+/UizpBYrI=; b=G0uacyyISwaenuvDWHKrVZ7lXh
	KPRt5FDvp+YulLBjM3HOlTEljrcE34EwZkphoB9koqeJbfWlLcrmhVOQi11Js5gaApvitzoJj0Zdr
	IuCe9OwSfyf/UEzlQaXSOqBesJCYIZ8pgMAeSuw6hK5Ie2IA16ifV29/Wro9NlVsQuIsJbaaiXx2A
	XdK7t/EmT/dW22gPX5IPbtJ9EJUrTebkoqSBd46MPRv6Yc7XSwj2kn6bxabMNnJLiTF0Cj4kF8jpn
	4luUR7bQVSGBVvYiNUSlYOEEyU9wNKt/D7fAW3z61MbSerM9kB6VLAASt4sFhV4JdtgjKjGsPY+pN
	0KLOmoEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzJ2-00000000L2l-0IeQ;
	Fri, 12 Dec 2025 09:19:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzJ0-00000000L2L-02kU;
	Fri, 12 Dec 2025 09:19:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71E02418B3;
	Fri, 12 Dec 2025 09:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05CDC4CEF1;
	Fri, 12 Dec 2025 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765531156;
	bh=rTVFEIXlAg4LKVZxNm5Zj42H5X95E6SJwUkQ3nsB4/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxUHWMzf+cKqrT/hmU19HU6p9JKSZpHCh0Vh9QdfCoh2bxafgcT3npLlPcUEV2xUp
	 1OLeISnrsthiDXk7NmXqos5Wh2OTLSa5DhrIJ/gX7NrQUHlGkylNTyqRbgfTmWOcWP
	 yhOHPIRC3ffNYfwJESW5hsnEXBYHuV8i+V9MFWlo5PCn9Kahza4Q9w8cOdKqD6iHhF
	 uucV7m+wdXGTqr9aK2Q1bTFLo93QK0jWShlYUKFLkypQuOCzvY6pJYB0fpRf8TkljL
	 5NQu8NDLNXcK0wQ6dzCc9Ftgtky/5+7UpTBJpa4dMlju1E9F9zpSzpOMhNIPsOEEaa
	 0YEULTJDFf+QA==
Date: Fri, 12 Dec 2025 10:19:13 +0100
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
	Rob Herring <robh@kernel.org>, kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v5 17/17] drm/tests: hdmi: Add tests for the color_format
 property
Message-ID: <20251212-discreet-wisteria-perch-edccad@penduick>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-17-63e82f1db1e1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7b5r3ycny55zq4mq"
Content-Disposition: inline
In-Reply-To: <20251128-color-format-v5-17-63e82f1db1e1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_011918_089436_B86B564C 
X-CRM114-Status: GOOD (  31.34  )
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


--7b5r3ycny55zq4mq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 17/17] drm/tests: hdmi: Add tests for the color_format
 property
MIME-Version: 1.0

On Fri, Nov 28, 2025 at 10:05:53PM +0100, Nicolas Frattaroli wrote:
> Add some KUnit tests to check the color_format property is working as
> expected with the HDMI state helper.
>=20
> The added tests check that AUTO results in RGB, and the YCBCR modes
> result in the corresponding YUV modes. An additional test ensures that
> only DRM_COLOR_FORMAT_AUTO falls back to YUV420 with a YUV420-only mode,
> and RGB errors out instead, while explicitly asking for YUV420 still
> works.
>=20
> This requires exporting hdmi_compute_config, so that it is accessible
> from the tests.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   3 +-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 109 +++++++++++++++=
++++++
>  include/drm/display/drm_hdmi_state_helper.h        |   4 +
>  3 files changed, 115 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 1800e00b30c5..e86fb837ceaf 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -641,7 +641,7 @@ hdmi_compute_format_bpc(const struct drm_connector *c=
onnector,
>  	return -EINVAL;
>  }
> =20
> -static int
> +int
>  hdmi_compute_config(const struct drm_connector *connector,
>  		    struct drm_connector_state *conn_state,
>  		    const struct drm_display_mode *mode)
> @@ -680,6 +680,7 @@ hdmi_compute_config(const struct drm_connector *conne=
ctor,
> =20
>  	return ret;
>  }
> +EXPORT_SYMBOL(hdmi_compute_config);

I don't think we need to export hdmi_compute_config directly, and if we
do, it shouldn't be named that way.

The rest of the tests in the suite manage to test everything fine
without exporting it. Is there any reason you can't do it for these
tests?

>  static int hdmi_generate_avi_infoframe(const struct drm_connector *conne=
ctor,
>  				       struct drm_connector_state *conn_state)
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 8bd412735000..e7050cd9cb12 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -55,6 +55,23 @@ static struct drm_display_mode *find_preferred_mode(st=
ruct drm_connector *connec
>  	return preferred;
>  }
> =20
> +static struct drm_display_mode *find_420_only_mode(struct drm_connector =
*connector)
> +{
> +	struct drm_device *drm =3D connector->dev;
> +	struct drm_display_mode *mode;
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	list_for_each_entry(mode, &connector->modes, head) {
> +		if (drm_mode_is_420_only(&connector->display_info, mode)) {
> +			mutex_unlock(&drm->mode_config.mutex);
> +			return mode;
> +		}
> +	}
> +	mutex_unlock(&drm->mode_config.mutex);
> +
> +	return NULL;
> +}
> +
>  static int set_connector_edid(struct kunit *test, struct drm_connector *=
connector,
>  			      const void *edid, size_t edid_len)
>  {
> @@ -1999,6 +2016,95 @@ static void drm_test_check_disable_connector(struc=
t kunit *test)
>  	drm_modeset_acquire_fini(&ctx);
>  }
> =20
> +struct color_format_test_param {
> +	enum drm_color_format fmt;
> +	enum hdmi_colorspace expected;
> +	const char *desc;
> +};
> +
> +/* Test that AUTO results in RGB, and explicit choices result in those */

We need a bit more details. Which EDID are you using, with which monitor
capabilities?

IIRC, we already have tests to make sure that the fallback happens and
only when it's supposed to. We just need to make sure we have asserts on
the property being auto for those.

This means we only need to test the !auto values, but we need to test it
both ways: that when the property is set and the display supports it,
the format chosen is indeed the one we asked for, but also that when the
property is set but the display doesn't support it, we get an error.

> +static void drm_test_check_hdmi_color_format(struct kunit *test)
> +{
> +	const struct color_format_test_param *param =3D test->param_value;
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector_state *conn_state;
> +	struct drm_display_info *info;
> +	struct drm_display_mode *preferred;
> +	int ret;
> +
> +	priv =3D drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> +				BIT(HDMI_COLORSPACE_RGB) |
> +				BIT(HDMI_COLORSPACE_YUV422) |
> +				BIT(HDMI_COLORSPACE_YUV420) |
> +				BIT(HDMI_COLORSPACE_YUV444),
> +				12,
> +				&dummy_connector_hdmi_funcs,
> +				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn_state =3D priv->connector.state;
> +	info =3D &priv->connector.display_info;
> +	conn_state->color_format =3D param->fmt;
> +	KUNIT_ASSERT_TRUE(test, priv->connector.ycbcr_420_allowed);
> +
> +	preferred =3D find_preferred_mode(&priv->connector);
> +	KUNIT_ASSERT_TRUE(test, drm_mode_is_420(info, preferred));
> +
> +	ret =3D hdmi_compute_config(&priv->connector, conn_state, preferred);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, param->expected);
> +}
> +
> +static const struct color_format_test_param hdmi_color_format_params[] =
=3D {
> +	{ DRM_COLOR_FORMAT_AUTO, HDMI_COLORSPACE_RGB, "AUTO -> RGB" },
> +	{ DRM_COLOR_FORMAT_YCBCR422, HDMI_COLORSPACE_YUV422, "YCBCR422 -> YUV42=
2" },
> +	{ DRM_COLOR_FORMAT_YCBCR420, HDMI_COLORSPACE_YUV420, "YCBCR420 -> YUV42=
0" },
> +	{ DRM_COLOR_FORMAT_YCBCR444, HDMI_COLORSPACE_YUV444, "YCBCR444 -> YUV44=
4" },
> +	{ DRM_COLOR_FORMAT_RGB444, HDMI_COLORSPACE_RGB, "RGB -> RGB" },
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(check_hdmi_color_format,
> +		  hdmi_color_format_params, desc);
> +
> +
> +/* Test that AUTO falls back to YUV420, and that RGB does not, but YUV42=
0 works */

Same thing, the description needs to be improved here.

Maxime

--7b5r3ycny55zq4mq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTveEAAKCRAnX84Zoj2+
dhf5AX0axu9eaz5PUFxm9wL8Scfvc12z75lvKpvF0Wa+0bZkHwFULJ8HlYvqkr0u
oaYG9h0Bf0ZRw+vCCL1izypO7FHFjavaMv/SjEhLVwTma92SorSqBsGraXbbXej1
NHkfv9J3OA==
=9ejj
-----END PGP SIGNATURE-----

--7b5r3ycny55zq4mq--

