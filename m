Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDF3C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9F20fzricZrTGW+QeF883b7IwAmdJ0gyJoHIxyxNBc=; b=WbqLvXdkhhRNJvMDuCxDVOuCeQ
	2g9blKMKq8cJSINReiPRThic5dM9y9TUGtxQhN2NQTSWShN/M82UGvwlMGX3q0MY7ppNGJ/uzJceK
	B6f14rAaozkFiygjepxgbT8hVwW4gb28I2Kjej5S6s8Oyy9+WtfeyMsMVgs2xK+dT6CwA2KpwVbBb
	6sR9BhPrRfeuTVYUrv6TEUJBkwCDBmVGhneIYsQm5ifjNFxVJ7wQdymPT7uM85jJAOUTYpm7ya6si
	FORMLF3Vn9MOiuLpnj0gWf1uppoy7XGlv8C5dO4olTyaJJyk6dstjUOxdHVRni27uTOVAEcjyrClr
	1oXJLX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllt1-00000007jsC-2XtE;
	Sat, 22 Feb 2025 09:33:27 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tllqJ-00000007jTz-2MAj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:30:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38f286b5281so1412111f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 01:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740216638; x=1740821438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9F20fzricZrTGW+QeF883b7IwAmdJ0gyJoHIxyxNBc=;
        b=SL8+qeKKn1zVhgUgawvcFE3o1KRKihPDZLsXjyJOdIWlRrnDOcIDoy6nvv1xH6K5NQ
         IPTUCaJfxij7Wm4kRSm9NZfSKU4MaIevKBR9fXlQ8NN2GOepadkVCQxSzBl55vNuahsz
         U/qbc1rBwM9Q+4UFgG7KC/51BKsXyOOzosBrqdVHKdUcz5ipUEU+Dxb2MRlGhHoet+UX
         6FEoAfU++yIgTwZOvg7A9fGSuU54174oKi9Fujs9dKEvprPkBGYs8uUK9qAOtEbfktYn
         8bPXpL0qmjg8+BW0tx/QYh+rJhZhcTVv0XvPL6qNwF1oScJU4Ar3WD1yUfYUEeNwbKEp
         2EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740216638; x=1740821438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9F20fzricZrTGW+QeF883b7IwAmdJ0gyJoHIxyxNBc=;
        b=jIQ7sThzDcg3CA38Xcnq0pnVA3cfz1jftSIHnJbc5JAA08NiCcL7kRbyic2GzfO73k
         xKKcFXws30jQzl3jfE/1P4NDxnVY7TmqpOMmjfT3YFX18SzTJWs51xkcVmT0TfM/2PoU
         I/OrklbhKwSexnF+hpRlgQV0OhpLEvgHbKAL7TldVl0n0Y/Fmz8gEE75jV1N+43pOYSI
         OTiJLwGz2ce4l1xOEYA+vEBFTMeyH4BfG18QImDtFxb7MPy8PhJs8chPJZIhHTgbLhrY
         M21Rv0sNk8kcVxsI3ER67MDKusTjOkZGavxsT3BFV82a845EPwOWE94lQ/tTJntnrW0p
         lGTw==
X-Forwarded-Encrypted: i=1; AJvYcCUGOPyAvXeQfKO+kxd2gvXBWVmzIJuJI61M9c6dgNVfpPfMMTsPmrdCN6Web1j0tMvhpCiDmuCJS/sB6NjB3B4p@lists.infradead.org
X-Gm-Message-State: AOJu0YzqjMyZRh8EfgXQbqV2U5odzVsSM62lJPrV/EKOZhRQj1tM945W
	zeYs23QHRgTi8/mMK6DHn6Y/5LGGzKu3vJdhFmUSVFDzaLNxPVY7
X-Gm-Gg: ASbGncugV0qLLFG8IdCkqBzR3R9AkRVlkSc1pe0gFZZBh0qiCmEpkf2q/9fZnrzsoq0
	Agfxa7yMzdU5b1lyOl2/WMO/f8ZKaaPgcVGG+pNW54nIWNy9N6W7c3akKMYLDOpfY3Z+xDv7jWK
	QX65Yr7fSfBA+9nZkDQ5dDDbD85vxq8DkfSi/FAEYn+HVsC6Fd0ZIlSZjVvmRIQHOCZsDHvcO4x
	UKAZ1QYPWKFEtZiILCRBVQ+HucaUWaGOkz5SGwFMGZSRenzVqFrGle7/JjiCmXsc7MeFb6NwjA0
	sVQTrb13CQ5d+LFQw0tIkqgULD1H3dmB5/h14IdmIyw7M3ETEfyeMOVACSW6Z+LfgggEUoYbVV8
	pkA==
X-Google-Smtp-Source: AGHT+IGveW3w0SKQKx8LXKO0L/gAvng9bbQi2cKgrZ9bQASh6DROV0jb7VWS/TE7EA2uJePz27ztjw==
X-Received: by 2002:a5d:47a9:0:b0:385:f249:c336 with SMTP id ffacd0b85a97d-38f70859ab3mr5498849f8f.45.1740216637740;
        Sat, 22 Feb 2025 01:30:37 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8e62sm25790168f8f.71.2025.02.22.01.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:30:37 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v7 08/27] drm: sun4i: de3: add YUV support to the DE3 mixer
Date: Sat, 22 Feb 2025 10:30:35 +0100
Message-ID: <3860147.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20250216183710.8443-9-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
 <20250216183710.8443-9-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_013039_644092_B0F8F5AF 
X-CRM114-Status: GOOD (  24.04  )
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

Dne nedelja, 16. februar 2025 ob 19:36:08 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The mixer in the DE3 display engine supports YUV 8 and 10 bit
> formats in addition to 8-bit RGB. Add the required register
> configuration and format enumeration callback functions to the mixer,
> and store the in-use output format (defaulting to RGB) and color
> encoding in the mixer configuration.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>=20
> ---
> Changelog v4..v5:
> - Remove trailing whitespace
>=20
> Changelog v5..v6:
> - Move color format and encoding flags to mixer and add struct.
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 54 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 11 ++++++
>  2 files changed, 62 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index a170f68708b1f..bc934186bfd6f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -23,7 +23,10 @@
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_probe_helper.h>
> =20
> +#include <uapi/linux/media-bus-format.h>
> +
>  #include "sun4i_drv.h"
> +#include "sun50i_fmt.h"
>  #include "sun8i_mixer.h"
>  #include "sun8i_ui_layer.h"
>  #include "sun8i_vi_layer.h"
> @@ -390,12 +393,52 @@ static void sun8i_mixer_mode_set(struct sunxi_engin=
e *engine,
> =20
>  	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
>  			 interlaced ? "on" : "off");
> +
> +	if (mixer->color_model.format =3D=3D MEDIA_BUS_FMT_RGB888_1X24)
> +		val =3D SUN8I_MIXER_BLEND_COLOR_BLACK;
> +	else
> +		val =3D 0xff108080;
> +
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
> +
> +	if (mixer->cfg->has_formatter)
> +		sun50i_fmt_setup(mixer, mode->hdisplay,
> +				 mode->vdisplay, mixer->color_model.format);
> +}
> +
> +static u32 *sun8i_mixer_get_supported_fmts(struct sunxi_engine *engine, =
u32 *num)
> +{
> +	struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> +	u32 *formats, count;
> +
> +	count =3D 0;
> +
> +	formats =3D kcalloc(5, sizeof(*formats), GFP_KERNEL);
> +	if (!formats)
> +		return NULL;
> +
> +	if (mixer->cfg->has_formatter) {
> +		formats[count++] =3D MEDIA_BUS_FMT_UYYVYY10_0_5X30;
> +		formats[count++] =3D MEDIA_BUS_FMT_YUV8_1X24;
> +		formats[count++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
> +		formats[count++] =3D MEDIA_BUS_FMT_UYYVYY8_0_5X24;
> +	}
> +
> +	formats[count++] =3D MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	*num =3D count;
> +
> +	return formats;
>  }
> =20
>  static const struct sunxi_engine_ops sun8i_engine_ops =3D {
> -	.commit		=3D sun8i_mixer_commit,
> -	.layers_init	=3D sun8i_layers_init,
> -	.mode_set	=3D sun8i_mixer_mode_set,
> +	.commit			=3D sun8i_mixer_commit,
> +	.layers_init		=3D sun8i_layers_init,
> +	.mode_set		=3D sun8i_mixer_mode_set,
> +	.get_supported_fmts	=3D sun8i_mixer_get_supported_fmts,
>  };
> =20
>  static const struct regmap_config sun8i_mixer_regmap_config =3D {
> @@ -484,6 +527,11 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>  	if (!mixer->cfg)
>  		return -EINVAL;
> =20
> +	/* default output format, supported by all mixers */
> +	mixer->color_model.format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +	/* default color encoding, ignored with RGB I/O */
> +	mixer->color_model.encoding =3D DRM_COLOR_YCBCR_BT601;
> +
>  	regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index 8417b8fef2e1f..5f465a974fbdf 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -9,6 +9,7 @@
>  #include <linux/clk.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> +#include <drm/drm_color_mgmt.h>
>  #include <drm/drm_plane.h>
> =20
>  #include "sunxi_engine.h"
> @@ -177,6 +178,11 @@ struct sun8i_mixer_cfg {
>  	unsigned int	scanline_yuv;
>  };
> =20
> +struct sun8i_color_model {
> +	u32			format;
> +	enum drm_color_encoding	encoding;
> +};
> +
>  struct sun8i_mixer {
>  	struct sunxi_engine		engine;
> =20
> @@ -186,6 +192,11 @@ struct sun8i_mixer {
> =20
>  	struct clk			*bus_clk;
>  	struct clk			*mod_clk;
> +
> +	struct regmap			*top_regs;
> +	struct regmap			*disp_regs;

This chunk is DE33 specific and should go in patch 24.

Best regards,
Jernej

> +
> +	struct sun8i_color_model	color_model;
>  };
> =20
>  enum {
>=20





