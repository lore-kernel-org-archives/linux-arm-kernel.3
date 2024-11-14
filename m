Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A3BD6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVZRN642JQTQuge+GGC/tGca/7Xy2qE9/pHbyr3mjrs=; b=2CTw3/SPv4C66Z7J0K+OD8nA7W
	wW1waxPNerxtpgD1tHZ2XQMUiH8Xwbm0imT77V7U8y+kjVQzCFSLheNTqa86YFhOIdW/jrYRm/eCg
	Bc/aZyyD+QZ2QsS2dPCSoOVybQ+V6iQgzCOy/Xzkg7maOTj+jTH7OU5AEYcqsNqZlWKWuWbozqqoN
	cMLRoQ+oPKPKCuxSzwqFzQ9q5/TE8Ijxw35XCuUecZDpn/O0wiTYH3j9QSeBPJEJAjxrBWURC0p1M
	OzA3RnXEvnfmMTZTNmtv0zRkOcoy5NL72EGWlAKms88i6YMrNoZjhGoUuZk2/KM4CBPNjtj5jNvkS
	te5tc2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBduO-00000000N6x-1vR2;
	Thu, 14 Nov 2024 17:45:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcqo-00000000A0P-1uAT
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Nov 2024 16:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vVZRN642JQTQuge+GGC/tGca/7Xy2qE9/pHbyr3mjrs=; b=MrrXxdfNjEzlMo49jSDvG83dhN
	LqjCZ26Qo6G3lUiNZl0MfWn0D7Fn6xddL2Dzv4ENHtCWoMr4CG227hIirLQhSMnnSJM7l19N4xDZr
	e4nvY7Mxpyaz613TC4uZmKERfqUbzeZYcHHtKLhDX7KpCYqkgLklztPham9A4PXBzvDCQnA8Lq2u5
	adULjrjZyABGvsb4z73k03OKqNJ4S44A+7NK5o+uDnGNvVyXnGDHvk5HqcgM8a+uKfBWhmLWrdowj
	llg6Vt6jEGrpbrc42EYGKZ7cVKKO258/Kt2CPj1ExRDdNrHlzmx6+8rYM/WUSuPPnfZ0p4+9wp2jS
	etodvWBg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbUt-000000003qX-0jqw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 15:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5145E5C5F9D;
	Thu, 14 Nov 2024 15:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED545C4CECD;
	Thu, 14 Nov 2024 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731596999;
	bh=ME6KIamWeSOI33s1Q/u3yOgoY7BAZ8vEfrd9GVx6Ubg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/1wb1nl/9lY6YzF0fepneAZtcvQkXu1q9cYzFfDJuEv9M5ZTJKPpmtJ8rafRzLd7
	 2LvC7DvtvK795F/6KJaBT+W27vIVT0An9ovJ1EQG7+bBGX0k69bztkTHjcCzE3Y6nr
	 p4zvmVapvs9WEFlLhUWvQatNbcNLzIZ+0H4QmcSZx9GnfSqAMFXEdmlGGUslPCsP36
	 q5/vDqggPq0B5qV4Di3o2gZ4AE9mKqycyaM84ffvSJCHqOkPRJBtJmmp+Jl1DuuYj3
	 ok6HU+ZqdHatdsxIs6nwPPGEfp0W0n8/8KI+P8eEY/XZu3feCXyy1RnjkZIXPRI4J+
	 hPPwIhVQTH0cQ==
Date: Thu, 14 Nov 2024 16:09:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 1/7] drm/display: hdmi: add generic mode_valid helper
Message-ID: <20241114-certain-ginger-quail-cd8b5d@houat>
References: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
 <20241109-hdmi-mode-valid-v3-1-5348c2368076@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ctnbsojadrep3a62"
Content-Disposition: inline
In-Reply-To: <20241109-hdmi-mode-valid-v3-1-5348c2368076@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_151103_536757_9E25043C 
X-CRM114-Status: GOOD (  28.48  )
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


--ctnbsojadrep3a62
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/7] drm/display: hdmi: add generic mode_valid helper
MIME-Version: 1.0

Hi,

On Sat, Nov 09, 2024 at 02:35:05PM +0200, Dmitry Baryshkov wrote:
> Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
> It can be either used directly or as a part of the .mode_valid callback.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  21 +++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 181 +++++++++++++++=
+++++-
>  include/drm/display/drm_hdmi_state_helper.h        |   4 +
>  3 files changed, 204 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index feb7a3a759811aed70c679be8704072093e2a79b..80bf2829ba89b5f84fed4fa9e=
b1d6302e10a4f9e 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -521,6 +521,27 @@ int drm_atomic_helper_connector_hdmi_check(struct dr=
m_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
> =20
> +/**
> + * drm_hdmi_connector_mode_valid() - Check if mode is valid for HDMI con=
nector
> + * @connector: DRM connector to validate the mode
> + * @mode: Display mode to validate
> + *
> + * Generic .mode_valid implementation for HDMI connectors.
> + */
> +enum drm_mode_status
> +drm_hdmi_connector_mode_valid(struct drm_connector *connector,
> +			      struct drm_display_mode *mode)
> +{
> +	unsigned long long clock;
> +
> +	clock =3D drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> +	if (!clock)
> +		return MODE_ERROR;
> +
> +	return hdmi_clock_valid(connector, mode, clock);
> +}
> +EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
> +
>  static int clear_device_infoframe(struct drm_connector *connector,
>  				  enum hdmi_infoframe_type type)
>  {
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 294773342e710dc56772f839c2db9c2e487bbc1e..67c3e882592b00d803d8cba5d=
183aa90339a16b4 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -43,10 +43,14 @@ struct drm_atomic_helper_connector_hdmi_priv {
>  static struct drm_display_mode *find_preferred_mode(struct drm_connector=
 *connector)
>  {
>  	struct drm_device *drm =3D connector->dev;
> -	struct drm_display_mode *mode, *preferred;
> +	struct drm_display_mode *mode, *preferred =3D NULL;
> =20
>  	mutex_lock(&drm->mode_config.mutex);
> -	preferred =3D list_first_entry(&connector->modes, struct drm_display_mo=
de, head);
> +
> +	/* Handle the case when all modes were rejected by mode_valid() */
> +	if (!list_empty(&connector->modes))
> +		preferred =3D list_first_entry(&connector->modes, struct drm_display_m=
ode, head);
> +

Sorry if it wasn't clear in my previous review, but I would have
expected a separate patch for that change.

>  	list_for_each_entry(mode, &connector->modes, head)
>  		if (mode->type & DRM_MODE_TYPE_PREFERRED)
>  			preferred =3D mode;
> @@ -125,6 +129,18 @@ static const struct drm_connector_hdmi_funcs reject_=
connector_hdmi_funcs =3D {
>  	.tmds_char_rate_valid	=3D reject_connector_tmds_char_rate_valid,
>  };
> =20
> +static enum drm_mode_status
> +reject_100MHz_connector_tmds_char_rate_valid(const struct drm_connector =
*connector,
> +					     const struct drm_display_mode *mode,
> +					     unsigned long long tmds_rate)
> +{
> +	return (tmds_rate > 100ULL * 1000 * 1000) ? MODE_BAD : MODE_OK;
> +}
> +
> +static const struct drm_connector_hdmi_funcs reject_100_MHz_connector_hd=
mi_funcs =3D {
> +	.tmds_char_rate_valid	=3D reject_100MHz_connector_tmds_char_rate_valid,
> +};
> +
>  static int dummy_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct drm_atomic_helper_connector_hdmi_priv *priv =3D
> @@ -147,6 +163,33 @@ static int dummy_connector_get_modes(struct drm_conn=
ector *connector)
>  static const struct drm_connector_helper_funcs dummy_connector_helper_fu=
ncs =3D {
>  	.atomic_check	=3D drm_atomic_helper_connector_hdmi_check,
>  	.get_modes	=3D dummy_connector_get_modes,
> +	.mode_valid	=3D drm_hdmi_connector_mode_valid,
> +};
> +
> +static int dummy_connector_get_modes_100MHz_max_clock(struct drm_connect=
or *connector)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv =3D
> +		connector_to_priv(connector);
> +	const struct drm_edid *edid;
> +	unsigned int num_modes;
> +
> +	edid =3D drm_edid_alloc(priv->current_edid, priv->current_edid_len);
> +	if (!edid)
> +		return -EINVAL;
> +
> +	drm_edid_connector_update(connector, edid);
> +	connector->display_info.max_tmds_clock =3D 100 * 1000;
> +	num_modes =3D drm_edid_connector_add_modes(connector);
> +
> +	drm_edid_free(edid);
> +
> +	return num_modes;
> +}

I'd rather create a new fake edid than mess with those fields directly.

> +static const struct drm_connector_helper_funcs dummy_connector_helper_fu=
ncs_max_tmds_clock =3D {
> +	.atomic_check	=3D drm_atomic_helper_connector_hdmi_check,
> +	.get_modes	=3D dummy_connector_get_modes_100MHz_max_clock,
> +	.mode_valid	=3D drm_hdmi_connector_mode_valid,
>  };
> =20
>  static void dummy_hdmi_connector_reset(struct drm_connector *connector)
> @@ -1734,9 +1777,143 @@ static struct kunit_suite drm_atomic_helper_conne=
ctor_hdmi_reset_test_suite =3D {
>  	.test_cases	=3D drm_atomic_helper_connector_hdmi_reset_tests,
>  };
> =20
> +static void drm_test_check_mode_valid(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector *conn;
> +	struct drm_display_mode *preferred;
> +
> +	priv =3D drm_atomic_helper_connector_hdmi_init(test,
> +						     BIT(HDMI_COLORSPACE_RGB),
> +						     8);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn =3D &priv->connector;
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 1920);
> +	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 1080);
> +	KUNIT_EXPECT_EQ(test, preferred->clock, 148500);
> +}

We need a comment on what that test tests, and expects.

> +/*
> + * Verify that tmds_char_rate_valid() can reject all modes.
> + */
> +static void drm_test_check_mode_valid_reject(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector *conn;
> +	struct drm_display_mode *preferred;
> +	struct drm_device *drm;
> +	int ret;
> +
> +	priv =3D drm_atomic_helper_connector_hdmi_init(test,
> +						     BIT(HDMI_COLORSPACE_RGB),
> +						     8);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn =3D &priv->connector;
> +
> +	/* You shouldn't be doing that at home. */
> +	conn->hdmi.funcs =3D &reject_connector_hdmi_funcs;

Just make drm_atomic_helper_connector_hdmi_init take an extra pointer.
(Also, that's a super bad name, drm_kunit_helper_connector_hdmi_init or
something would probably be better)

> +	priv->current_edid =3D test_edid_hdmi_1080p_rgb_max_200mhz;
> +	priv->current_edid_len =3D ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200m=
hz);
> +
> +	drm =3D &priv->drm;
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	ret =3D conn->funcs->fill_modes(conn, 4096, 4096);
> +	mutex_unlock(&drm->mode_config.mutex);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	preferred =3D find_preferred_mode(conn);
> +	KUNIT_ASSERT_NULL(test, preferred);
> +}

Ditto, I can't really say what this test is doing. That's true for all the =
tests.

Maxime

--ctnbsojadrep3a62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZzYSvwAKCRAnX84Zoj2+
dohLAYDBGNPxjefoQZarszL7SmQHh+gcbQ1qmjnw9mdINgc/xrWo0jnG44/KRH4H
jqxD/8oBgJL52VZMA1oI681jUMpkVkt6sXSZ/75bABFjvBkGWR7xbqe4Dd04shtl
08eYbNmcrw==
=VFIw
-----END PGP SIGNATURE-----

--ctnbsojadrep3a62--

