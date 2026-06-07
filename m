Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604B1CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97NZlk873g/D280FN02tm4Cwk27MbU4WZEUElaU0aQM=; b=f12UOjioBpFYMDbF7X7j64r3fl
	tbl9Slbb7vfwicrn5r5b0nvG7dyfhSw6qYFHlq6Q9rXkStFF7pFDtBT0lWRblGj8glQ+kpWenH2CH
	mih0TPbvCI9fhBAq56Tm8M5LDyPH1eYZzNvmn3dKDmdX2qLi2EMNhZfp2eaGGz17mlHB0PIoMpcoD
	EHfhLpQlzuWYoAGkGo8ucHHB/gboKvBzXWuTg7Wo34G3mFdSCqQ6QKmLIZOEOJMGHV1mn2IpjSPLw
	VziYc+3FWvviHxclCiR4U9Gl1uTNTZmN/ALUy/1f2+qG/MrMiTKAoA57NZ8ErunxZUx19qR6X1Zox
	sK6zuzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWBDs-00000002CkL-0Naf;
	Sun, 07 Jun 2026 10:59:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWBDp-00000002Cjr-4BbE;
	Sun, 07 Jun 2026 10:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=97NZlk873g/D280FN02tm4Cwk27MbU4WZEUElaU0aQM=; b=gmiN5pvjvSslkFeya7EuNki80z
	Qv3sH3Vh16k9AXWcagQLxnhxoDd7f3QtMAvEyrA6paLlnLN0/6ayEGeuifHytKkoxXhFdw8XiKrDh
	T9130QoSZa0s2glYzMT2/e/bgrOd9PynunSBzAW7XIvhvyzXa90BSEyzko4omuBcHEY22T2pbb5IV
	G+lE+ZaEXoUOse9OZTRVJTQQmEM2+I2ffXf/HWOUcUwug/lbNm695Cl8qRJGbFvyjLAfcuKxB7glf
	DmiY11iAM9YRkxRV2u0XE88uTgbvharrnzIXPXNRWtq7u/f8GX50f1b0wYPZJxR4PwH4FSYRSGuuV
	2aALXJDA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Diogo Silva <diogompaissilva@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Diogo Silva <diogompaissilva@gmail.com>
Subject: Re: [PATCH] drm/rockchip: dsi: Open-code drm_simple_encoder_init()
Date: Sun, 07 Jun 2026 12:59:00 +0200
Message-ID: <5277524.h16uAIiOU7@phil>
In-Reply-To: <20260604123224.192543-2-diogompaissilva@gmail.com>
References: <20260604123224.192543-2-diogompaissilva@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_035918_138693_B7F69F41 
X-CRM114-Status: GOOD (  19.34  )
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

Hi Diego,

Am Donnerstag, 4. Juni 2026, 14:32:25 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Diogo Silva:
> Remove the dependency on drm_simple_kms_helper by open-coding the
> drm_simple_encoder_init call.

this description is missing a rationale.

Looking at the drm git history, I guess here you could add a second
paragraph, with something like:

=2D---------- 8< -----------
The helpers have been deprecated for years as they only add an an
intermediate layer between atomic modesetting and the DRM driver.
=2D---------- 8< -----------

Shamelessly stolen from the Todo item ;-)


> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 9 +++++++--

Any reason for only changing the DSI driver?

Looking at [0] a number of the Rockchip drivers use the same pattern:
=2D drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
=2D drivers/gpu/drm/rockchip/cdn-dp-core.c
=2D drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
=2D drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
=2D drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
=2D drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
=2D drivers/gpu/drm/rockchip/rk3066_hdmi.c
=2D drivers/gpu/drm/rockchip/rockchip_lvds.c
=2D drivers/gpu/drm/rockchip/rockchip_rgb.c

You can just do all Rockchip ones - even in one patch I think :-) .


Thanks
Heiko

[0] https://elixir.bootlin.com/linux/v7.1-rc6/A/ident/drm_simple_encoder_in=
it


>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gp=
u/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 3547d91b25d3..a09b382d208e 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -25,7 +25,6 @@
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
> -#include <drm/drm_simple_kms_helper.h>
> =20
>  #include "rockchip_drm_drv.h"
> =20
> @@ -825,6 +824,10 @@ static void dw_mipi_dsi_encoder_enable(struct drm_en=
coder *encoder)
>  	clk_disable_unprepare(dsi->grf_clk);
>  }
> =20
> +static const struct drm_encoder_funcs dw_mipi_dsi_encoder_funcs =3D {
> +	.destroy =3D drm_encoder_cleanup,
> +};
> +
>  static const struct drm_encoder_helper_funcs
>  dw_mipi_dsi_encoder_helper_funcs =3D {
>  	.atomic_check =3D dw_mipi_dsi_encoder_atomic_check,
> @@ -840,7 +843,9 @@ static int rockchip_dsi_drm_create_encoder(struct dw_=
mipi_dsi_rockchip *dsi,
>  	encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm_dev,
>  							     dsi->dev->of_node);
> =20
> -	ret =3D drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
> +	ret =3D drm_encoder_init(drm_dev, encoder,
> +				&dw_mipi_dsi_encoder_funcs,
> +				DRM_MODE_ENCODER_DSI, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to initialize encoder with drm\n");
>  		return ret;
>=20





