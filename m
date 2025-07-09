Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD939C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SG2j29gwFX7k4otmmc53gu2ehTRqK5cM2QUQpZLRpQM=; b=eVJj/sBzOnpkQ1yef/LXO+SKnR
	oCBdxJ0ujmIfT6xOJX1yNBPqQbSsVjyZnrAY+PM3M6auXrgSxktHX9ZSvBz7XZR1u1M6QH0WF44uH
	appHsoRq2Vk4DCN5cO3pgXOsvM04qOHz4/FGn4kmmV8UV5RvvdzqkKXOMD1TWNXVMXaXvWEVXupRS
	ZFRxpRMDXkot8N0YOY7UnWuav5LTPlItUBfAH8PjRh8ihollt7y6v8/LR8iFhmBICWG4d4+Ly0gu0
	jUzpKYkPf1jO44qTnPoUZ8Xwr3ovcK+zJz91J1vioVTF/qCIT1nFnFusi9oGgSdhZf0qkrfiCI/HQ
	w0uzU9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdiG-0000000A7zO-0v7d;
	Wed, 09 Jul 2025 22:56:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZb5K-00000009mOw-3wg1;
	Wed, 09 Jul 2025 20:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SG2j29gwFX7k4otmmc53gu2ehTRqK5cM2QUQpZLRpQM=; b=B8OcAMendZ2VHmKakW/uwOROA0
	jAXbIt4sl51+KEYhLHfv+0BQIXg6J6mXwCqA4/JRcTu+UP/fI8u4DgUvS1Oe+5REOWVnuY4jyjpVi
	0xxa9EwS4+T89xLC02Gx/JFNpKE6XhlTgbilctfL6njO0a7DVqgE2vV93ijPF8k/hWzdbyy5kiYF5
	eLWJTRiXFd2A00buatLlUvazFzDJwSnfXJkZ7x2k7Ww9grH8pkRT03XdZ10ORnM9UM2h0DzOwCz33
	eKbqjziiFJADgyp5cFIpPRkJOuhadPgOGS1a8edyACUH/4JCv1bC6Bk+QQ7a+War2qi1WuUzwTvKl
	ei8kb6lw==;
Received: from i53875a79.versanet.de ([83.135.90.121] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZb4n-0006l3-60; Wed, 09 Jul 2025 22:07:33 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v2 07/12] drm/bridge: analogix_dp: Add support to find panel or
 bridge
Date: Wed, 09 Jul 2025 22:07:31 +0200
Message-ID: <4555084.IFkqi6BYcA@diego>
In-Reply-To: <20250709070139.3130635-8-damon.ding@rock-chips.com>
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_130807_000842_16965BE0 
X-CRM114-Status: GOOD (  25.05  )
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

Hi Damon,

Am Mittwoch, 9. Juli 2025, 09:01:34 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Damon Ding:
> Since the panel/bridge should logically be positioned behind the
> Analogix bridge in the display pipeline, it makes sense to handle
> the panel/bridge parsing on the Analogix side.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 48 +++++++++++++++++++
>  include/drm/bridge/analogix_dp.h              |  2 +
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 78d68310e4f6..660f95e90490 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -19,12 +19,14 @@
>  #include <linux/platform_device.h>
> =20
>  #include <drm/bridge/analogix_dp.h>
> +#include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> @@ -1707,6 +1709,52 @@ struct drm_dp_aux *analogix_dp_get_aux(struct anal=
ogix_dp_device *dp)
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
> =20
> +static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
> +{
> +	struct analogix_dp_device *dp =3D to_dp(aux);
> +	struct analogix_dp_plat_data *plat_data =3D dp->plat_data;
> +	int port =3D plat_data->dev_type =3D=3D EXYNOS_DP ? 0 : 1;
> +	int ret;
> +
> +	/*
> +	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no va=
lid panel
> +	 * or bridge nodes. The driver should go on for the driver-free bridge =
or the DP
> +	 * mode applications.
> +	 */
> +	ret =3D drm_of_find_panel_or_bridge(dp->dev->of_node, port, 0,
> +					  &plat_data->panel, &plat_data->bridge);

Could you check if this can use a panel-bridge?
See for example=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/rockchip/rockchip_rgb.c#n138
or a lot of other places for drm_panel_bridge_add()

So if drm_of_find_panel_or_bridge() finds a bridge, just use it; if it
finds a panel, drm_panel_bridge_add() just wraps a bridge around it
and all the code can just assume everything is bridge after that.



> +	if (ret && ret !=3D -ENODEV)
> +		return ret;
> +
> +	return component_add(dp->dev, plat_data->ops);
> +}
> +
> +int analogix_dp_find_panel_or_bridge(struct analogix_dp_device *dp)
> +{
> +	int ret;
> +
> +	ret =3D devm_of_dp_aux_populate_bus(&dp->aux, analogix_dp_aux_done_prob=
ing);
> +	if (ret) {
> +		/*
> +		 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing(=
) will
> +		 * not be called because there are no EP devices. Then the callback fu=
nction
> +		 * analogix_dp_aux_done_probing() will be called directly in order to =
support
> +		 * the other valid DT configurations.
> +		 *
> +		 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROB=
E_DEFER.
> +		 */
> +		if (ret !=3D -ENODEV) {
> +			dev_err(dp->dev, "failed to populate aux bus\n");
> +			return ret;
> +		}
> +
> +		return analogix_dp_aux_done_probing(&dp->aux);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_find_panel_or_bridge);
> +
>  MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
>  MODULE_DESCRIPTION("Analogix DP Core Driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analog=
ix_dp.h
> index 202e5eafb2cc..0b6d85f1924e 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -30,6 +30,7 @@ struct analogix_dp_plat_data {
>  	struct drm_bridge *bridge;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
> +	const struct component_ops *ops;
> =20
>  	int (*power_on)(struct analogix_dp_plat_data *);
>  	int (*power_off)(struct analogix_dp_plat_data *);
> @@ -52,5 +53,6 @@ int analogix_dp_stop_crc(struct drm_connector *connecto=
r);
> =20
>  struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp=
_aux *aux);
>  struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
> +int analogix_dp_find_panel_or_bridge(struct analogix_dp_device *dp);
> =20
>  #endif /* _ANALOGIX_DP_H_ */
>=20





