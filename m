Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65494E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjIJpKGlM0gtWiQBxlwaVUAhcYgn8uwwEWeXUlNCUao=; b=rupNwroBYJ5NLllrQRLkYEdZkL
	D/GUrzDjlm38mdug8WOUk0y1XmTQfnvJLxtpidGlV4naYwLjkVdhn9g/IQTVioXs3r6zLtAVgpeua
	YceeUWGGOC4jUsRtk9ncmE5ecr73Sl84Z5BoIDjVpET6ZxvpGcx0KUBRWjItBduZmO42YzKK+IgFe
	K5AysTdp/SHWID4uxZiVKYeHFB0shSAFMgYLDAXZe/adA4Z1P9znuaI0TiLRCQO2tZMxekqkZstv/
	zcPBK0zG8sY7/v+IJqZKwh6cfXIZZ8MPoIY/zbw2dMhOikZ3iv2zwNcIieMpSBr4A6uoSArjA8wsQ
	BasoeYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN70B-00000009U3Q-2USL;
	Mon, 16 Dec 2024 09:02:55 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6vD-00000009THe-2bX6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 08:57:48 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso48301531fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 00:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734339465; x=1734944265; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AjIJpKGlM0gtWiQBxlwaVUAhcYgn8uwwEWeXUlNCUao=;
        b=gh73+Mwn6lUM7OQoswSknnXoNDRVrBJ7p3ZBE2pfYAPL8F+V7tMMYCWcv+r08DqyWq
         /8NnijnsVD48Qs9OKuKJByajPefYVRrXX3nPvQ2w/U24dzeHri4GEW/eGRmokQ++XI80
         GQ9ds4taDzij/QUa2H3P70fOIpUl2SBoEU37loxi54nantAgBK6DPyCq/lmkdoEumrDe
         4awQNdsqBa0l2036g7xZGPIXoVfOjh0piUVaGFIvADknHlRft63S6EZV0t14qgKcGCIs
         sTLul4CaUvD9dgl31bCXZfGJW0o3+pdDu5fMKqj4YBER/C3H+YzTB95KrGt1MJPzAEqs
         6ctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734339465; x=1734944265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjIJpKGlM0gtWiQBxlwaVUAhcYgn8uwwEWeXUlNCUao=;
        b=el3pXdjo2lqBOeadDDHfuIMp+vpbM7/M1Sh9BZdbPB6Xww1AGXszaXlQYU2NU2RM/B
         3u8B0Rkf7WQkR16917bxeIB3weFA7qgMGwtf55DalSKmZTgOcS8GJ6OJl4hRP1BZ7emH
         ADNzqNOQhEIFwFoeHepKvIfn2fAH44L6ZU8aq0JV9Jnhaqw8uJltJfQkSo5xBnnYvN1h
         Gw3GoCJl6Rn4G9kqJmX8bvoFPmXs4MKI2dNbaHIPdoUulVPMtI9iG4fEiHdLJUV7+9CK
         soC+D0H1wSQBZoeYnsszogg3aQ1UTQsTmuAY94VgNMAR8df7CeG71jQNFsgPeRIny2f5
         a7oA==
X-Forwarded-Encrypted: i=1; AJvYcCVOW99Apf1RtabeksiaHdoPgrkd/NrwOz/jqSkk15EH+mTlYac9aBxRIixwkOgLzOQkNVyKLNbIj9cF1q8xhiFN@lists.infradead.org
X-Gm-Message-State: AOJu0YyVB8xXxZ3/x61HUfDE3uLoPcBm9iiX6JV9xMg7ZuWT6MNSVYoU
	d02/9Yjj9jmdMrI++2GvHysFWffQX77i/0dXUS08/S8y9fLoddFMkMDKolwmhzI=
X-Gm-Gg: ASbGnculDgoddAnYfeQsq1ZkgGnrlafUvQVZn3fSeMr3oUeVE06lzPNC5aHQE6FMFFH
	cHBG0hlm2FKr6TL4pjnaDrq4neUrZm5H6fYj/iaSIP0x45cOH/cXXV3dPNm14Pk6wZ18IadGXJX
	RNfrcLaLRBSVRTSKNAuwrGNi4H3REtoLcORPOuRBBdUr1M/ve/5UXZ0v66mVc0coDSmzeT/TnYx
	QjIikOvVAko9VlypVa1cYVrd/3ynQauPr8jcU7UbyW+2Dc5sZL9ptil+dEb3/aLVYXf3Ob1i393
	y/g8RiAD4udXP6jDYdex1VGWWeIkveiQ98J8
X-Google-Smtp-Source: AGHT+IGiv0XpHh+7rtFdMzcdCLnItW3iZioZ/1D4bSk6d6rk/mbtm3bcDCP3tB0pIzXojiHobYEBPA==
X-Received: by 2002:a2e:be1e:0:b0:303:4289:b991 with SMTP id 38308e7fff4ca-303428a04efmr28820241fa.19.1734339465327;
        Mon, 16 Dec 2024 00:57:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344046c9asm8429141fa.50.2024.12.16.00.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:57:44 -0800 (PST)
Date: Mon, 16 Dec 2024 10:57:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 03/11] drm/rockchip: analogix_dp: Add support for
 RK3588
Message-ID: <gwogudb5vae7wu452zwuqmdlyaibenoso4f5pjmu3uttckhy2w@shndol4mz5n4>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-4-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216031225.3746-4-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_005747_710406_3DEA0B0C 
X-CRM114-Status: GOOD (  33.40  )
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

On Mon, Dec 16, 2024 at 11:12:17AM +0800, Damon Ding wrote:
> RK3588 integrates the analogix eDP 1.3 TX controller IP and the HDMI/eDP
> TX Combo PHY based on a Samsung IP block, and there are also two
> independent eDP display interface on RK3588 Soc.
> 
> Add just the basic support for now, i.e. RGB output up to 4K@60Hz, without
> the tests of audio, PSR and other eDP 1.3 specific features.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add support for the other eDP output edp1
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 82 ++++++++++++++++---
>  include/drm/bridge/analogix_dp.h              |  3 +-
>  2 files changed, 74 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 871606a31ef1..4c9a55776ada 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -51,10 +51,12 @@ struct rockchip_grf_reg_field {
>  /**
>   * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
>   * @lcdc_sel: grf register field of lcdc_sel
> + * @edp_mode: grf register field of edp_mode
>   * @chip_type: specific chip type
>   */
>  struct rockchip_dp_chip_data {
>  	const struct rockchip_grf_reg_field lcdc_sel;
> +	const struct rockchip_grf_reg_field edp_mode;
>  	u32	chip_type;
>  };
>  
> @@ -134,12 +136,21 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>  		return ret;
>  	}
>  
> +	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 1);
> +	if (ret != 0)
> +		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);

Is it to be called for non-eDP hosts too? Or for older hosts?

> +
>  	return ret;
>  }
>  
>  static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>  {
>  	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
> +	int ret;
> +
> +	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 0);
> +	if (ret != 0)
> +		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);

Same question.

>  
>  	clk_disable_unprepare(dp->pclk);
>  
> @@ -203,6 +214,10 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
>  	struct rockchip_dp_device *dp = encoder_to_dp(encoder);
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state;
> +	struct of_endpoint endpoint;
> +	struct device_node *remote_port, *remote_port_parent;
> +	char name[32];
> +	u32 port_id;
>  	int ret;
>  
>  	crtc = rockchip_dp_drm_get_new_crtc(encoder, state);
> @@ -220,13 +235,27 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
>  		return;
>  	}
>  
> -	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
> +	ret = drm_of_encoder_active_endpoint(dp->dev->of_node, encoder, &endpoint);
>  	if (ret < 0)
>  		return;
>  
> -	DRM_DEV_DEBUG(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
> +	remote_port_parent = of_graph_get_remote_port_parent(endpoint.local_node);
> +	if (remote_port_parent) {
> +		if (of_get_child_by_name(remote_port_parent, "ports")) {
> +			remote_port = of_graph_get_remote_port(endpoint.local_node);
> +			of_property_read_u32(remote_port, "reg", &port_id);
> +			of_node_put(remote_port);
> +			sprintf(name, "%s vp%d", remote_port_parent->full_name, port_id);
> +		} else {
> +			sprintf(name, "%s %s",
> +				remote_port_parent->full_name, endpoint.id ? "vopl" : "vopb");
> +		}
> +		of_node_put(remote_port_parent);
> +
> +		DRM_DEV_DEBUG(dp->dev, "%s output to edp\n", name);
> +	}

The "output to dp" message got dropped. Is it expected?

>  
> -	ret = rockchip_grf_field_write(dp->grf, &dp->data->lcdc_sel, ret);
> +	ret = rockchip_grf_field_write(dp->grf, &dp->data->lcdc_sel, endpoint.id);
>  	if (ret != 0)
>  		DRM_DEV_ERROR(dp->dev, "Could not write to GRF: %d\n", ret);
>  
> @@ -396,6 +425,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  	const struct rockchip_dp_chip_data *dp_data;
>  	struct drm_panel *panel = NULL;
>  	struct rockchip_dp_device *dp;
> +	int id, i;
>  	int ret;
>  
>  	dp_data = of_device_get_match_data(dev);
> @@ -410,9 +440,22 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  	if (!dp)
>  		return -ENOMEM;
>  
> +	id = of_alias_get_id(dev->of_node, "edp");
> +	if (id < 0)
> +		id = 0;

Alias is not documented.

Please check how other platforms handle device -> ID conversion and
consider following it (yes, the best option currently known is to
hardcode bus addresses into the driver data).

> +
> +	i = 0;
> +	while (is_rockchip(dp_data[i].chip_type))
> +		i++;
> +
> +	if (id >= i) {
> +		DRM_DEV_ERROR(dev, "invalid edp id: %d\n", id);
> +		return -ENODEV;
> +	}

Is it applicable to non-eDP case?

> +
>  	dp->dev = dev;
>  	dp->adp = ERR_PTR(-ENODEV);
> -	dp->data = dp_data;
> +	dp->data = &dp_data[id];
>  	dp->plat_data.panel = panel;
>  	dp->plat_data.dev_type = dp->data->chip_type;
>  	dp->plat_data.power_on = rockchip_dp_poweron;
> @@ -464,19 +507,38 @@ static int rockchip_dp_resume(struct device *dev)
>  static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_dp_pm_ops, rockchip_dp_suspend,
>  		rockchip_dp_resume, NULL);
>  
> -static const struct rockchip_dp_chip_data rk3399_edp = {
> -	.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
> -	.chip_type = RK3399_EDP,
> +static const struct rockchip_dp_chip_data rk3399_edp[] = {
> +	{
> +		.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
> +		.chip_type = RK3399_EDP,
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +static const struct rockchip_dp_chip_data rk3288_dp[] = {
> +	{
> +		.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
> +		.chip_type = RK3288_DP,
> +	},
> +	{ /* sentinel */ }
>  };
>  
> -static const struct rockchip_dp_chip_data rk3288_dp = {
> -	.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
> -	.chip_type = RK3288_DP,
> +static const struct rockchip_dp_chip_data rk3588_edp[] = {
> +	{
> +		.edp_mode = GRF_REG_FIELD(0x0000, 0, 0),
> +		.chip_type = RK3588_EDP,
> +	},
> +	{
> +		.edp_mode = GRF_REG_FIELD(0x0004, 0, 0),
> +		.chip_type = RK3588_EDP,
> +	},
> +	{ /* sentinel */ }
>  };
>  
>  static const struct of_device_id rockchip_dp_dt_ids[] = {
>  	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
>  	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
> +	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index 6002c5666031..54086cb2d97d 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -15,11 +15,12 @@ enum analogix_dp_devtype {
>  	EXYNOS_DP,
>  	RK3288_DP,
>  	RK3399_EDP,
> +	RK3588_EDP,
>  };
>  
>  static inline bool is_rockchip(enum analogix_dp_devtype type)
>  {
> -	return type == RK3288_DP || type == RK3399_EDP;
> +	return type == RK3288_DP || type == RK3399_EDP || type == RK3588_EDP;
>  }
>  
>  struct analogix_dp_plat_data {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

