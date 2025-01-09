Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A524BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHN/5X/Qy69qyMpCWb8kneKgFMU5IOAUBhcGNPPugoM=; b=Xx0m1CYEhr/DSUBpJEAN6iu0OG
	4DCfcrwo60ezo6xxx9NyDeZOe+Isg5vj+1vKU5z5VA2T3YZps0VOzg4Pv9JIBB8xOA0tGdJ1u/FdY
	Agzwn9iQ0bSDBWmdiMV492G/taHX0B0wXlsi4qAEgLzbNnplKK8Z48I/tp1xN11pRBxUTQcXJswxC
	0sPThXpdkluFGMecKcw1QzOJsSnagE/HDaCegEN9ZW3/0qKPKnKTMSJrmLEhaqmgbfbaLYYKwUzjL
	7875MJ7Xa2BXLGaY55pFS7La5lxKqsSs5doWOTymgYBBJ/lVw26tQ1w1JV9cXvhJd2NvUt+ftUtks
	EUmAU4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrw5-0000000BthS-0rWu;
	Thu, 09 Jan 2025 12:46:53 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVruq-0000000BtNQ-2FLg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:45:38 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-306007227d3so3579791fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 04:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736426734; x=1737031534; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHN/5X/Qy69qyMpCWb8kneKgFMU5IOAUBhcGNPPugoM=;
        b=lNmjmPyh83kP6fuR7NDGzwxt0tHdNmzlA7L9TAPo+S7b+JIFO7VQNgz993KoOthprf
         rVNXLLovReOoOh0lG1yufedhDu/zxoFT7iZRiuLKXb0QfowH3tjpNIlJxzRa6MR3II+F
         Rh4uTvCoa/Yn3rdQUgvlfhUAdNLEgqta6uAU2+JqA9MNmLueHyuxYxArCU4pg865i4gK
         MM+R4VOvZsL2TTBrrIr0VGba2rfDFmUJuK6OFY6HetcenoCoPXGBKRBjq+etQoDHXmY7
         EcPa7oafvNE8cKdfj106PvDXnXFcOwsUlirhX0woBn40JBUPqg2vmO0TSiAi58BEohI6
         7l5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736426734; x=1737031534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHN/5X/Qy69qyMpCWb8kneKgFMU5IOAUBhcGNPPugoM=;
        b=w/0UcsWmI2pdAuMwT25d7/SlgsmH5mScvmqkAdWHI1FpOeDrYhppG1wyfbOUXX3/mv
         XkrcwerJaM2LjuEAOIUJVGJI6O09mmm1ZMEiek7OTfCKKZtqrI9CxaEPXMwbgMhuSRx1
         41f/h5kKPEimWWYo0jYhPSgppwAwI4oJz9sfVpXxKbX6GgiT9k0Zk/eaIm5DTCI0uKIf
         cf6SYk6oS/fsxAOeqSk4qkMnC6feRmL8Cdqx9OraSHk51NIGoCHoFQ+dPRrP6Nc/frrm
         s3+ofk4LRokNRJX5kNFRFHxafPIxD9AQjpbbTZOypdmxG7USKcql18iASDnYu8Hqp3HE
         xBJA==
X-Forwarded-Encrypted: i=1; AJvYcCUHzbn5g10+Q3JFKWUKzWEjYSsp9DTrc8eXc83I2176ouCJEx0I+bzzp3Pu5UXRigJAyThsITyAGhjeZRUE7Imv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp/EISyGDOgL3hWbi819yaOX+oQ8pbvoJULcPXgIh8no0eYdFH
	x3FyyEOP3mjxRl4g4ZuV1ng5aMi9tBkycJ40gDZgyzuU1i+bWEjgyTBN/vuQF/I=
X-Gm-Gg: ASbGncvzH7IVmZWHBpe6CfCHp66GEMQrbV2qR+/83zFea89T+Gnj6PJ2iFWeNyGxdu0
	jUm1Zd/2GlPiVR6ELAVb7oKUGgDNq3CQzRvV9v0hbv2kOE5tGBzC3iAfV+aQFfcFpVkk/ilTapX
	/5RGq/HPVXcvysW88Shbyzwxa7S5LSAuzXeS8PlJXmaT/qldisnJX3ZKPDHNJft+5LHBbRmDUZw
	gP4bBVTsafHDHKQz/71JjSFktEIumF+39GAV1tTai2O3x9WeyE7pOPk8d1yN74ZBZxGLK4inlJF
	6h82nNIXkIAe1tZ1dESFTJNlzFns0kenfYId
X-Google-Smtp-Source: AGHT+IElPQjul5XrLoFmXQxy4bhtqUX4GjET6+7h8yvFk+lQX7gbeGOus+f4biXivZj6ML5v9KKwQQ==
X-Received: by 2002:a05:651c:f11:b0:301:2d8d:a3ba with SMTP id 38308e7fff4ca-305f45a06d8mr18524331fa.23.1736426734459;
        Thu, 09 Jan 2025 04:45:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0cfc32sm1877911fa.45.2025.01.09.04.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:45:34 -0800 (PST)
Date: Thu, 9 Jan 2025 14:45:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 11/20] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <v3is3v3fpx42i2eh2qrfkx3qx3z7iema3honi544qoc4j2whdo@h6ajv5h53gry>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-12-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_044536_617654_8D042644 
X-CRM114-Status: GOOD (  24.10  )
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

On Thu, Jan 09, 2025 at 11:27:16AM +0800, Damon Ding wrote:
> The main modification is moving the DP AUX initialization from function
> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> eDP panel during probing, it is also needed to advance PM operaions to
> ensure that eDP controller and phy are prepared for AUX transmission.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
> 
> Changes in v5:
> - Advance PM operations to make eDP AUX work well
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 62 ++++++++++---------
>  1 file changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 8251adfce2f9..78e78fb474d3 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1548,6 +1548,18 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>  	return ret;
>  }
>  
> +static void analogix_dp_runtime_disable(void *data)
> +{
> +	struct analogix_dp_device *dp = (struct analogix_dp_device *)data;
> +
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		pm_runtime_dont_use_autosuspend(dp->dev);
> +		pm_runtime_disable(dp->dev);
> +	} else {
> +		analogix_dp_suspend(dp);
> +	}
> +}
> +
>  struct analogix_dp_device *
>  analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>  {
> @@ -1658,8 +1670,29 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>  	}
>  	disable_irq(dp->irq);
>  
> +	dp->aux.name = "DP-AUX";
> +	dp->aux.transfer = analogix_dpaux_transfer;
> +	dp->aux.dev = dp->dev;
> +	drm_dp_aux_init(&dp->aux);
> +
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		pm_runtime_use_autosuspend(dp->dev);
> +		pm_runtime_set_autosuspend_delay(dp->dev, 100);
> +		pm_runtime_enable(dp->dev);
> +	} else {
> +		ret = analogix_dp_resume(dp);
> +		if (ret)
> +			goto err_disable_clk;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, analogix_dp_runtime_disable, dp);

This looks like a local version of devm_pm_runtime_enable()

> +	if (ret)
> +		goto err_disable_pm_runtime;
> +
>  	return dp;
>  
> +err_disable_pm_runtime:
> +	analogix_dp_runtime_disable((void *)dp);
>  err_disable_clk:
>  	clk_disable_unprepare(dp->clock);
>  	return ERR_PTR(ret);
> @@ -1708,25 +1741,12 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  	dp->drm_dev = drm_dev;
>  	dp->encoder = dp->plat_data->encoder;
>  
> -	if (IS_ENABLED(CONFIG_PM)) {
> -		pm_runtime_use_autosuspend(dp->dev);
> -		pm_runtime_set_autosuspend_delay(dp->dev, 100);
> -		pm_runtime_enable(dp->dev);
> -	} else {
> -		ret = analogix_dp_resume(dp);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	dp->aux.name = "DP-AUX";
> -	dp->aux.transfer = analogix_dpaux_transfer;
> -	dp->aux.dev = dp->dev;
>  	dp->aux.drm_dev = drm_dev;
>  
>  	ret = drm_dp_aux_register(&dp->aux);
>  	if (ret) {
>  		DRM_ERROR("failed to register AUX (%d)\n", ret);
> -		goto err_disable_pm_runtime;
> +		return ret;
>  	}
>  
>  	ret = analogix_dp_create_bridge(drm_dev, dp);
> @@ -1739,13 +1759,6 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  
>  err_unregister_aux:
>  	drm_dp_aux_unregister(&dp->aux);
> -err_disable_pm_runtime:
> -	if (IS_ENABLED(CONFIG_PM)) {
> -		pm_runtime_dont_use_autosuspend(dp->dev);
> -		pm_runtime_disable(dp->dev);
> -	} else {
> -		analogix_dp_suspend(dp);
> -	}
>  
>  	return ret;
>  }
> @@ -1762,13 +1775,6 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
>  	}
>  
>  	drm_dp_aux_unregister(&dp->aux);
> -
> -	if (IS_ENABLED(CONFIG_PM)) {
> -		pm_runtime_dont_use_autosuspend(dp->dev);
> -		pm_runtime_disable(dp->dev);
> -	} else {
> -		analogix_dp_suspend(dp);
> -	}
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

