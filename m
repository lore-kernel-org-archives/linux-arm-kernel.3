Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645D6C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNbAEqQ3dzAhzmo5DcpNruuevQ1QRA6TJaugf1zsVsY=; b=FGD3Rj1G2RHIwNWyCWSBhfw3jx
	4NtS/8byB+7t51iIgxdICXe7E5FnzKyr6npkWfImTfFsQFoTxZawgmUeUnSiXh6D1ABKT1FzGlgTh
	JPIqs/MuNoNKccxXtHdApWnd2ySdUvsdVEWrU6XoPH4g6eFjnH2J1c2qDDDuSdzt9OgDxHg1bnkB0
	EXSWDPgvdGZ2NQ/VLDQHDmyRjqM0Ev6gyMW7E8I/xEBXY6x4J1RT3OlYrLR/DWQvC8MOJlCZzwugb
	oJYuJhRFBKroZ0wxkqggLkt3vGUPyWMoLz3CPKWqwilcuIAh0hy6S+ZJ2RP0kIYM8JvYdtOBnAz6U
	qqEsznjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavMR-0000000CK8x-22KC;
	Thu, 23 Jan 2025 11:26:59 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavL8-0000000CJxH-3En3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:25:39 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso871643e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737631537; x=1738236337; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bNbAEqQ3dzAhzmo5DcpNruuevQ1QRA6TJaugf1zsVsY=;
        b=M+Fw+uKiYSg+2PsoaGMolJQFrsrLeQmCAHsEMd1Yrc6JhVDNd/fQZk+BKY6vALQyuK
         /TM6jctIsYTAEsaffyB3b3KDXqx8qXLfUt2YTRhMpOwHeGueMkX7yi7EbAlJg2laX7Bh
         0eK+AqVEOQC//LAanM/prH6xG0ggc+Q6whdVwk2B7pIPRXghnMl+No+qKEI3Ap0wPaKG
         vP338JTr/UR2ZBvYdOqqb/q6jMSozuHk6TegCl3/WE8211pzeNHDdA6JCaj2NjO8Ufbl
         p3haNKj7LcDJ8H5LgNStLN4glZc+tPtTU1k1GDkQ5IOwCdZCYqz152NYhX6ZFKa/3wml
         qQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737631537; x=1738236337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNbAEqQ3dzAhzmo5DcpNruuevQ1QRA6TJaugf1zsVsY=;
        b=AvjGnluNwXI3RttZ+fYbf9FRM9jg9tzhKaPk8OXO+hXtP4Y180zh0dBstiF6ZhDrkS
         KFn7kU42chpECOoGEesVBAIzG45Y118XaYC7ibS8W0KNj/PjCi74coTGI5ED00ogObdw
         rmlf666hs5sRLaUh4H0V4hBd7XYC/MVtZ8se9cF1Kg2t66hv0sab26G0ND2fJEZ2wXFJ
         /MhgEmXIHfwhnw41XiGokp3Tf4e8/2NtCdjWhXd/2C9BissUiKjZwDq62F31oJ7/3ru/
         eF4GsSop1UiUe/jTaedyc682IBGazA6/1mG/eSVTfQndq5yJrSP0rtBrWVByE/i5AEV/
         q72w==
X-Forwarded-Encrypted: i=1; AJvYcCWW37A5XvdzvHcDoSsnz6rLw63kPCqvAqlIyGWeUMQtGUQlcWBGTi5SNSDRfD2ftU13IBZflmDs8ap34qgFSDTZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzen56W0acbHbs9fBnFd/K3PYrzSKCILJKFFcwuGM3JoMEmrgC8
	NXkRB/eAILEHHSgsjQwPIpY6p6V7Rb0eiJoGnH6Vh9Q+QbeutoSVUKPgTIfI0v8=
X-Gm-Gg: ASbGncspJcOqAYfY91FuZov3bG3TFXMF50Fv1j8gkcxGehudnshy1v4sfiPaofUl72r
	C+Yq+IY5M0RiOIiElU8ZCeb8zwrMVCKPe2y1gHqKWtGAT0lVmFYAhZrwT02NyN7f5d0HXKYU5dh
	2mJrbusKBCutFJS7kUfOmFgDaN1Fnb8Z5klD2YCt5++uJLlQiLxegZGLurcX9nBtAE3G3xkpEGF
	iQS631lIIZnQU/SrYZ3IgrQ/6ELQv4Y6RvAbAZ2hQ/hyjX3JXTHDwkdBq2dhA7VKCPn9CfRJall
	A89RYgG+UqdakEKDULVVKGFrsADFNTv802KwlPNnGUveLitfZdnRS8WrJHJD
X-Google-Smtp-Source: AGHT+IE6ibA+SRqqESfpmIp0xn+MDgVnaMtNtXwPAf6a4XrGleP9tXnk5wy5cdgtpp2cytg3OJlqNw==
X-Received: by 2002:a05:6512:e83:b0:542:2a81:a759 with SMTP id 2adb3069b0e04-5439c21f23dmr7041361e87.2.1737631536605;
        Thu, 23 Jan 2025 03:25:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78955sm2603438e87.234.2025.01.23.03.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:25:36 -0800 (PST)
Date: Thu, 23 Jan 2025 13:25:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>, 
	Douglas Anderson <dianders@chromium.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 07/14] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <fw74xd2hgwc7iodhh5wb3ovd26tzlsomgypx4hqlqrxl4k2mdf@pycb5ugojyhr>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123100747.1841357-8-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_032538_817117_CDCCF7E4 
X-CRM114-Status: GOOD (  28.09  )
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

On Thu, Jan 23, 2025 at 06:07:40PM +0800, Damon Ding wrote:
> The main modification is moving the DP AUX initialization from function
> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> eDP panel during probing, it is also needed to advance PM operaions to
> ensure that eDP controller and phy are prepared for AUX transmission.

This doesn't sound right. Per the documentation of
drm_dp_aux::transfer(), the device should power itself up if transfer()
is called when it is powered off. The caller must only ensure that the
panel is on.

Doug, what's your opinion?

> 
> In addtion, add a new function analogix_dp_remove() to ensure symmetry
> for PM operations.
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
> 
> Changes in v6:
> - Use devm_pm_runtime_enable() instead of devm_add_action_or_reset()
> - Add a new function analogix_dp_remove() to ensure symmetry for PM
>   operations
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 57 ++++++++++---------
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  4 ++
>  include/drm/bridge/analogix_dp.h              |  1 +
>  3 files changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 8251adfce2f9..30da8a14361e 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1658,14 +1658,42 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
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
> +		ret = devm_pm_runtime_enable(dp->dev);
> +		if (ret)
> +			goto err_disable_pm_runtime;
> +	} else {
> +		ret = analogix_dp_resume(dp);
> +		if (ret)
> +			goto err_disable_clk;
> +	}
> +
>  	return dp;
>  
> +err_disable_pm_runtime:
> +	pm_runtime_dont_use_autosuspend(dp->dev);
>  err_disable_clk:
>  	clk_disable_unprepare(dp->clock);
>  	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_probe);
>  
> +void analogix_dp_remove(struct analogix_dp_device *dp)
> +{
> +	if (IS_ENABLED(CONFIG_PM))
> +		pm_runtime_dont_use_autosuspend(dp->dev);
> +	else
> +		analogix_dp_suspend(dp);
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_remove);
> +
>  int analogix_dp_suspend(struct analogix_dp_device *dp)
>  {
>  	phy_power_off(dp->phy);
> @@ -1708,25 +1736,12 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
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
> @@ -1739,13 +1754,6 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
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
> @@ -1762,13 +1770,6 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
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
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index a63c2c867059..13f32aeea7ca 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -459,6 +459,10 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  
>  static void rockchip_dp_remove(struct platform_device *pdev)
>  {
> +	struct rockchip_dp_device *dp = dev_get_drvdata(&pdev->dev);
> +
> +	analogix_dp_remove(dp->adp);
> +
>  	component_del(&pdev->dev, &rockchip_dp_component_ops);
>  }
>  
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index 1b119b547988..d9b721fd7201 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -43,6 +43,7 @@ int analogix_dp_suspend(struct analogix_dp_device *dp);
>  
>  struct analogix_dp_device *
>  analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data);
> +void analogix_dp_remove(struct analogix_dp_device *dp);
>  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev);
>  void analogix_dp_unbind(struct analogix_dp_device *dp);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

