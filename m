Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D205C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 12:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAGv2SmzGXVdVgFW6Qn5tGYJomy3PZxv8s/XW9GmfCg=; b=fnUOpatadO1Ho05wvyhCkOui1y
	lCFm5BoXFafjHsNYyfOcFvA5N7QapunMRVN/Zi1Whc1U/gvb2oC+KuviVOsOHud2+Nd/H+YFkWTJP
	PtXld+Nz/4eey6cdhpCFowk+Hx/69qdRMLfwtlMBxilAV0AKHYQYDsYfzbyvuR+V0rjcYBX7p+ou1
	LVJ9Ice7obO/xKGGmJ+uPAEe0yM5XIUZl5+NQJN5qT/rnhDqcS+1fVM/jcBSbN1LsuoZo8D0pGh6E
	D5TnroJPp6qFuLvdKTAIN1bA/KZ6Z2+H4eJIpbQDFDy2dio9WoFr2wxm+Hur6RKER8zH3KovaBITq
	fYj5DMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tawIj-0000000CRMG-1t3N;
	Thu, 23 Jan 2025 12:27:13 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tawHR-0000000CREg-3pPL;
	Thu, 23 Jan 2025 12:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737635154; x=1769171154;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Y9y2JiSrLOPvXTWHcZparjJwT3r8iLZ2GoulTbz9w5s=;
  b=L/otT6a7WAQo0YuqTFYN18ybLYDaYjCPzcTmxwyCGapbAY9CO/t1DlLq
   UZ+ns6O1QBv1/nI/CIxBb9JKo1C2gVuCYvPqoUyLfSLoXheJH/Pt0I/Zi
   2JZuCcubMmABu32TFEjV2xGDnovqunjnAFGsi0u5qaKcGE6ZQWpCTk6Rr
   XWXFBd9gSyK1wr1MJkiZrnawybqCEA87/zOztLnP0un6tBKUQJ2vgR7ma
   88Ck7mSHvnyVeP7c5Vk2EVphLUrQG1WEvD7FAzTVML8iGAOfp9irp2/7V
   27x1vNJluunVTHyVueWTRUVl2vtk/1r9OrIYdpC3EXMd/E1f320zXGhbe
   Q==;
X-CSE-ConnectionGUID: EX8wGYfcRcGW78WJZ4gm+A==
X-CSE-MsgGUID: +QBq4MN9QnqJmQXisRgG8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37336135"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="37336135"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 04:25:41 -0800
X-CSE-ConnectionGUID: LAR+3lOGQqq3l5CRJiaT5Q==
X-CSE-MsgGUID: tzHN9lx5QzuLvdBtxS/HRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111462249"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 04:25:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Damon Ding
 <damon.ding@rock-chips.com>
Subject: Re: [PATCH v6 01/14] drm/rockchip: analogix_dp: Replace DRM_...()
 functions with drm_...()
In-Reply-To: <20250123100747.1841357-2-damon.ding@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-2-damon.ding@rock-chips.com>
Date: Thu, 23 Jan 2025 14:25:29 +0200
Message-ID: <87ikq5n2di.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_042553_971506_BBED4FE8 
X-CRM114-Status: GOOD (  18.98  )
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

On Thu, 23 Jan 2025, Damon Ding <damon.ding@rock-chips.com> wrote:
> According to the comments in include/drm/drm_print.h, the DRM_...()
> functions are deprecated in favor of drm_...() or dev_...() functions.
>
> Use drm_err()/drm_dbg_core()/drm_dbg_kms() instead of
> DRM_DEV_ERROR()/DRM_ERROR()/DRM_DEV_DEBUG()/DRM_DEBUG_KMS().
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>
> ---
>
> Changes in v6:
> - Use drm_...() uniformly rather than mixing drm_...() and dev_..()
> - Pass 'dp' in drm_...() rather than 'dp->drm_dev'
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 29 ++++++++++---------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 0844175c37c5..dd33d7540e4b 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -100,13 +100,13 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>  
>  	ret = clk_prepare_enable(dp->pclk);
>  	if (ret < 0) {
> -		DRM_DEV_ERROR(dp->dev, "failed to enable pclk %d\n", ret);
> +		drm_err(dp, "failed to enable pclk %d\n", ret);

Please don't do this.

You're supposed to pass struct drm_device to drm_err() and friends. Not
some random struct pointer that just happens to have a ->dev member.

The drm_* macros may change at any time to actually expect the correct
type.

BR,
Jani.


>  		return ret;
>  	}
>  
>  	ret = rockchip_dp_pre_init(dp);
>  	if (ret < 0) {
> -		DRM_DEV_ERROR(dp->dev, "failed to dp pre init %d\n", ret);
> +		drm_err(dp, "failed to dp pre init %d\n", ret);
>  		clk_disable_unprepare(dp->pclk);
>  		return ret;
>  	}
> @@ -126,12 +126,13 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>  static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
>  				 struct drm_connector *connector)
>  {
> +	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
>  	struct drm_display_info *di = &connector->display_info;
>  	/* VOP couldn't output YUV video format for eDP rightly */
>  	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
>  
>  	if ((di->color_formats & mask)) {
> -		DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
> +		drm_dbg_kms(dp, "Swapping display color format from YUV to RGB\n");
>  		di->color_formats &= ~mask;
>  		di->color_formats |= DRM_COLOR_FORMAT_RGB444;
>  		di->bpc = 8;
> @@ -201,17 +202,17 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
>  	else
>  		val = dp->data->lcdsel_big;
>  
> -	DRM_DEV_DEBUG(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
> +	drm_dbg_core(dp, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
>  
>  	ret = clk_prepare_enable(dp->grfclk);
>  	if (ret < 0) {
> -		DRM_DEV_ERROR(dp->dev, "failed to enable grfclk %d\n", ret);
> +		drm_err(dp, "failed to enable grfclk %d\n", ret);
>  		return;
>  	}
>  
>  	ret = regmap_write(dp->grf, dp->data->lcdsel_grf_reg, val);
>  	if (ret != 0)
> -		DRM_DEV_ERROR(dp->dev, "Could not write to GRF: %d\n", ret);
> +		drm_err(dp, "Could not write to GRF: %d\n", ret);
>  
>  	clk_disable_unprepare(dp->grfclk);
>  }
> @@ -236,7 +237,7 @@ static void rockchip_dp_drm_encoder_disable(struct drm_encoder *encoder,
>  
>  	ret = rockchip_drm_wait_vact_end(crtc, PSR_WAIT_LINE_FLAG_TIMEOUT_MS);
>  	if (ret)
> -		DRM_DEV_ERROR(dp->dev, "line flag irq timed out\n");
> +		drm_err(dp, "line flag irq timed out\n");
>  }
>  
>  static int
> @@ -277,7 +278,7 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>  
>  	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>  	if (IS_ERR(dp->grf)) {
> -		DRM_DEV_ERROR(dev, "failed to get rockchip,grf property\n");
> +		drm_err(dp, "failed to get rockchip,grf property\n");
>  		return PTR_ERR(dp->grf);
>  	}
>  
> @@ -287,19 +288,19 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>  	} else if (PTR_ERR(dp->grfclk) == -EPROBE_DEFER) {
>  		return -EPROBE_DEFER;
>  	} else if (IS_ERR(dp->grfclk)) {
> -		DRM_DEV_ERROR(dev, "failed to get grf clock\n");
> +		drm_err(dp, "failed to get grf clock\n");
>  		return PTR_ERR(dp->grfclk);
>  	}
>  
>  	dp->pclk = devm_clk_get(dev, "pclk");
>  	if (IS_ERR(dp->pclk)) {
> -		DRM_DEV_ERROR(dev, "failed to get pclk property\n");
> +		drm_err(dp, "failed to get pclk property\n");
>  		return PTR_ERR(dp->pclk);
>  	}
>  
>  	dp->rst = devm_reset_control_get(dev, "dp");
>  	if (IS_ERR(dp->rst)) {
> -		DRM_DEV_ERROR(dev, "failed to get dp reset control\n");
> +		drm_err(dp, "failed to get dp reset control\n");
>  		return PTR_ERR(dp->rst);
>  	}
>  
> @@ -315,12 +316,12 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
>  
>  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
>  							     dev->of_node);
> -	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
> +	drm_dbg_kms(dp, "possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>  
>  	ret = drm_simple_encoder_init(drm_dev, encoder,
>  				      DRM_MODE_ENCODER_TMDS);
>  	if (ret) {
> -		DRM_ERROR("failed to initialize encoder with drm\n");
> +		drm_err(dp, "failed to initialize encoder with drm\n");
>  		return ret;
>  	}
>  
> @@ -340,7 +341,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>  
>  	ret = rockchip_dp_drm_create_encoder(dp);
>  	if (ret) {
> -		DRM_ERROR("failed to create drm encoder\n");
> +		drm_err(dp, "failed to create drm encoder\n");
>  		return ret;
>  	}

-- 
Jani Nikula, Intel

