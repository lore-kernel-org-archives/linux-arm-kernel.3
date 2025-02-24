Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A63C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvnvUxTc5AQaskJINeTmL3gncfKgdBsvPvsCNQOV7qs=; b=Uu9eK5tiim8Hx4Qf5m9ycVdnJ+
	4enTROORxj5PKKd7nDFKXlxRpkSUh80dcyczJBvzyDL375EYeAlPTHPNti4wTfo+MWo4GPeTEwgH7
	fXDjqZ8uA2guQtMg0FVqbt4R2gEF+dOOaJbtQHjFMSIHPODjGu18n7eDng2rWHdw8fz27kHk2xM5t
	ti6d/azfB6R4nagAoCqjq6H6H7K68Uj0l1OZYRvB3Q0RRKPinrwD+Df1ElAchtQ1Q72Mptfns5gVQ
	fyxaEjjew6bNQPEFr8B0TtwL0r1tX679uuVyRzkGjMtEyA++n++IDlFZ5uTGYGc0bjmtBkmRtII1q
	VZDaLIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaAT-0000000EFBY-3FTU;
	Mon, 24 Feb 2025 15:14:50 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZkk-0000000EAPq-1uV1;
	Mon, 24 Feb 2025 14:48:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A230442B2;
	Mon, 24 Feb 2025 14:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740408490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WvnvUxTc5AQaskJINeTmL3gncfKgdBsvPvsCNQOV7qs=;
	b=Q2LORdUD5tDm5eeAOWJ40SHFnvB+Eige1cCbnwZEEki9558eeomxRJKDhDTFOeaBUVoX7q
	72KS/Bb73OzGmGjmbNncuVdPLlAGBcuRJ3dE+YVS4uJn2S+pln5UG7vglFkRz6jhI0YJ2C
	3v76jFBTPHUhsXwN65FETkOLdIHNssRXwrXjz5j7VlqbMC/Fm7HGujkZlIK8uuzPRDMNMr
	Ejuq+fPzupxrnVDS8Cj58QbveUdu/ZlYZbD9N/fzd19pXylBPnhSbJLlxeEOnnkAZc/DaG
	TbJwWIrf11GPhxzWVYCACykoERN1td9OWy/mDsMo53Muc48il43af/d7NWXEBw==
Message-ID: <13348e9c-5690-4f5a-9086-5cc5540fa1db@bootlin.com>
Date: Mon, 24 Feb 2025 15:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 2/5] drm/rockchip: stop passing non struct drm_device to
 drm_err() and friends
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <cover.1737644530.git.jani.nikula@intel.com>
 <f42da4c9943a2f2a9de4272b7849e72236d4c3f9.1737644530.git.jani.nikula@intel.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <f42da4c9943a2f2a9de4272b7849e72236d4c3f9.1737644530.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejledtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteffhfdtiefgheffudeuvdekfefgvdduudfgffetteffvdetfffgjeevudfggfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehinhhtvghlrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvl
 heslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohephhhjtgesrhhotghkqdgthhhiphhsrdgtohhmpdhrtghpthhtohephhgvihhkohesshhnthgvtghhrdguvgdprhgtphhtthhopegrnhguhidrhigrnhesrhhotghkqdgthhhiphhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: louis.chauvet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_064814_784943_206D2B83 
X-CRM114-Status: GOOD (  17.16  )
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



Le 23/01/2025 à 16:09, Jani Nikula a écrit :
> The expectation is that the struct drm_device based logging helpers get
> passed an actual struct drm_device pointer rather than some random
> struct pointer where you can dereference the ->dev member.
> 
> Convert drm_err(hdmi, ...) to dev_err(hdmi->dev, ...). This matches
> current usage, but drops "[drm] *ERROR*" prefix from logging.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
> 
> Looks like it's possible to hunt down the struct drm_device in most of
> these cases, if that's desired. This was the simplest change.
> 
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> ---
>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c    | 16 ++++++++--------
>   drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++--------
>   2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index e7a6669c46b0..f737e7d46e66 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -203,7 +203,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>   
>   	hdmi->regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>   	if (IS_ERR(hdmi->regmap)) {
> -		drm_err(hdmi, "Unable to get rockchip,grf\n");
> +		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
>   		return PTR_ERR(hdmi->regmap);
>   	}
>   
> @@ -214,7 +214,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>   	if (IS_ERR(hdmi->ref_clk)) {
>   		ret = PTR_ERR(hdmi->ref_clk);
>   		if (ret != -EPROBE_DEFER)
> -			drm_err(hdmi, "failed to get reference clock\n");
> +			dev_err(hdmi->dev, "failed to get reference clock\n");
>   		return ret;
>   	}
>   
> @@ -222,7 +222,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>   	if (IS_ERR(hdmi->grf_clk)) {
>   		ret = PTR_ERR(hdmi->grf_clk);
>   		if (ret != -EPROBE_DEFER)
> -			drm_err(hdmi, "failed to get grf clock\n");
> +			dev_err(hdmi->dev, "failed to get grf clock\n");
>   		return ret;
>   	}
>   
> @@ -302,16 +302,16 @@ static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
>   
>   	ret = clk_prepare_enable(hdmi->grf_clk);
>   	if (ret < 0) {
> -		drm_err(hdmi, "failed to enable grfclk %d\n", ret);
> +		dev_err(hdmi->dev, "failed to enable grfclk %d\n", ret);
>   		return;
>   	}
>   
>   	ret = regmap_write(hdmi->regmap, hdmi->chip_data->lcdsel_grf_reg, val);
>   	if (ret != 0)
> -		drm_err(hdmi, "Could not write to GRF: %d\n", ret);
> +		dev_err(hdmi->dev, "Could not write to GRF: %d\n", ret);
>   
>   	clk_disable_unprepare(hdmi->grf_clk);
> -	drm_dbg(hdmi, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
> +	dev_dbg(hdmi->dev, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
>   }
>   
>   static int
> @@ -574,7 +574,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>   	ret = rockchip_hdmi_parse_dt(hdmi);
>   	if (ret) {
>   		if (ret != -EPROBE_DEFER)
> -			drm_err(hdmi, "Unable to parse OF data\n");
> +			dev_err(hdmi->dev, "Unable to parse OF data\n");
>   		return ret;
>   	}
>   
> @@ -582,7 +582,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>   	if (IS_ERR(hdmi->phy)) {
>   		ret = PTR_ERR(hdmi->phy);
>   		if (ret != -EPROBE_DEFER)
> -			drm_err(hdmi, "failed to get phy\n");
> +			dev_err(hdmi->dev, "failed to get phy\n");
>   		return ret;
>   	}
>   
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index f41151d49fca..3d1dddb34603 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -242,7 +242,7 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
>   	if (drm) {
>   		changed = drm_helper_hpd_irq_event(drm);
>   		if (changed)
> -			drm_dbg(hdmi, "connector status changed\n");
> +			dev_dbg(hdmi->dev, "connector status changed\n");
>   	}
>   }
>   
> @@ -472,7 +472,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>   		}
>   	}
>   	if (hdmi->port_id < 0) {
> -		drm_err(hdmi, "Failed to match HDMI port ID\n");
> +		dev_err(hdmi->dev, "Failed to match HDMI port ID\n");
>   		return hdmi->port_id;
>   	}
>   
> @@ -496,20 +496,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>   	hdmi->regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
>   						       "rockchip,grf");
>   	if (IS_ERR(hdmi->regmap)) {
> -		drm_err(hdmi, "Unable to get rockchip,grf\n");
> +		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
>   		return PTR_ERR(hdmi->regmap);
>   	}
>   
>   	hdmi->vo_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
>   							  "rockchip,vo-grf");
>   	if (IS_ERR(hdmi->vo_regmap)) {
> -		drm_err(hdmi, "Unable to get rockchip,vo-grf\n");
> +		dev_err(hdmi->dev, "Unable to get rockchip,vo-grf\n");
>   		return PTR_ERR(hdmi->vo_regmap);
>   	}
>   
>   	ret = devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
>   	if (ret < 0) {
> -		drm_err(hdmi, "Failed to get clocks: %d\n", ret);
> +		dev_err(hdmi->dev, "Failed to get clocks: %d\n", ret);
>   		return ret;
>   	}
>   
> @@ -517,7 +517,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>   						    GPIOD_OUT_HIGH);
>   	if (IS_ERR(hdmi->enable_gpio)) {
>   		ret = PTR_ERR(hdmi->enable_gpio);
> -		drm_err(hdmi, "Failed to request enable GPIO: %d\n", ret);
> +		dev_err(hdmi->dev, "Failed to request enable GPIO: %d\n", ret);
>   		return ret;
>   	}
>   
> @@ -525,7 +525,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>   	if (IS_ERR(hdmi->phy)) {
>   		ret = PTR_ERR(hdmi->phy);
>   		if (ret != -EPROBE_DEFER)
> -			drm_err(hdmi, "failed to get phy: %d\n", ret);
> +			dev_err(hdmi->dev, "failed to get phy: %d\n", ret);
>   		return ret;
>   	}
>   
> @@ -564,7 +564,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>   	connector = drm_bridge_connector_init(drm, encoder);
>   	if (IS_ERR(connector)) {
>   		ret = PTR_ERR(connector);
> -		drm_err(hdmi, "failed to init bridge connector: %d\n", ret);
> +		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
>   		return ret;
>   	}
>   

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



