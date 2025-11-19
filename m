Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7D9CF257C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 04:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzZSfTO3fDr+v5y8qsx6snbbgoi2zSCmM+ewENUdd/c=; b=0DADAJQvIAy5qhCx193UYTg+1/
	uw4gfOPuTHej3ft6IqePe7OPXcFw4/aJLlOFJZ4LrhZ9UGAdzPIBYOAe6n0MHb5hX4Cg2xf7gygjP
	IrbHV5DoTr0k93AHGQmH5Qid0el6qtGerHCAjzLcZBSMlXR6LhDY03X2rEKlzWxNQAUDz3i1OZJpV
	Tj1y2Kfj+DHLPC63lx2MhKVqGQw0Yip+VvhAXX2lir0GV00OjM6WzHllH9vscD3/BHYoKyrjDMFXo
	b201Edz9k5FiQ8U3s0OuxKeMbV4PILa6iQNVfpOrm41yqoexJxjMrXJXMXJU82Bhydzq9i7Uq1ARt
	P/9BXDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZe6-00000001eS4-26Hp;
	Wed, 19 Nov 2025 04:18:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZe3-00000001eP7-2l4g;
	Wed, 19 Nov 2025 04:18:16 +0000
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 08E8FDD9;
	Wed, 19 Nov 2025 05:16:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763525770;
	bh=Co0SQdTL8Op1neOiTCduNOiGp6gu3Kt8Xc6qs6rJnZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Avztu/6TS5bq2e/sK12229OUVbG1IkQ3SJlt5Fqo3xPeyTSpPD8yNyN0X5siBD4en
	 mW9jba6o5mX6EH5BjkWy76EjvT/FJ7O1k2YlK4EJ66NWd3pc5/gguO1iuq6F8EhpQ/
	 g24tg3xmkJxc5vkin6RTxvPBT08bdLkKnWYztSDE=
Date: Wed, 19 Nov 2025 13:17:47 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, kernel@collabora.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 06/10] drm/rockchip: dw_hdmi_qp: Set supported_formats
 platdata
Message-ID: <20251119041747.GF10711@pendragon.ideasonboard.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-6-0ded72bd1b00@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-color-format-v4-6-0ded72bd1b00@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_201815_832379_BCB835C2 
X-CRM114-Status: GOOD (  24.76  )
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

On Mon, Nov 17, 2025 at 08:11:50PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the supported_formats member in the
> dw-hdmi-qp platform data struct, drivers that have access to this
> information should now set it.
> 
> Set it in the rockchip dw_hdmi_qp glue driver, where such a bitmask of
> supported color formats already exists. It just needs to be converted to
> the appropriate HDMI_COLORSPACE_ mask.
> 
> This allows this information to be passed down to the dw-hdmi-qp core,
> which sets it in the bridge it creates, and consequently will allow the
> common HDMI bridge code to act on it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index c9fe6aa3e3e3..7c294751de19 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -468,6 +468,28 @@ static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
>  
> +static const u32 supported_colorformats = DRM_COLOR_FORMAT_AUTO |
> +					  DRM_COLOR_FORMAT_RGB444 |
> +					  DRM_COLOR_FORMAT_YCBCR444;
> +
> +static unsigned int __pure drm_to_hdmi_fmts(const u32 fmt)
> +{
> +	unsigned int res = 0;
> +
> +	if (fmt & DRM_COLOR_FORMAT_AUTO)
> +		res |= BIT(HDMI_COLORSPACE_RGB);
> +	if (fmt & DRM_COLOR_FORMAT_RGB444)
> +		res |= BIT(HDMI_COLORSPACE_RGB);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR444)
> +		res |= BIT(HDMI_COLORSPACE_YUV444);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR422)
> +		res |= BIT(HDMI_COLORSPACE_YUV422);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR420)
> +		res |= BIT(HDMI_COLORSPACE_YUV420);
> +
> +	return res;
> +}
> +

This would be greatly simplified by turning supported_formats into a
bitmask of DRM_MODE_COLOR_FORMAT_* values, as suggested in 05/10.

>  static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  				    void *data)
>  {
> @@ -521,6 +543,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  	plat_data.phy_data = hdmi;
>  	plat_data.max_bpc = 10;
>  
> +	plat_data.supported_formats = drm_to_hdmi_fmts(supported_colorformats);
> +
>  	encoder = &hdmi->encoder.encoder;
>  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
>  

-- 
Regards,

Laurent Pinchart

