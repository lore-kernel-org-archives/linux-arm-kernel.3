Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C761CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSbCz7BdsGrZ6dUKfbVogn0+RkzwW7W5/KZZkxx6YXQ=; b=KN6pSQUSiiHqz3PbGphYyxV7Xl
	EBwWTWcB3bzLn2QAgfO9bYyW7hPMccZvX3o0K2BYzz45ufB/hZnNPAolj4hXXIogmwb4GANzO9AJH
	/41ffYFGx/cVu6WLyWjJ0CfM7jz4ASZaI06qMCXjJ5M5xcUd+2JnT0GywPBNNnhItESNEDpSpRiHJ
	5aqOhyr2t+QJeOaBlEdhZVR0WEH1Tx6kF/ZLhG6x27HF2pAb8Naj/m75M8yc5PVOz+a92vlNgLNxD
	wZeHiWVKVXvW7f2FN5JiAG/9r1tgUcNgVDqL3aBkckVmqSf1pk7wAhKbepTUIRpxN2scSdnb1i3WZ
	IA9fyMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvCx-0000000DbLj-0fuT;
	Mon, 04 May 2026 15:27:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvCu-0000000DbKs-0u9w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 15:27:41 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6426C175;
	Mon,  4 May 2026 17:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777908456;
	bh=FTSgfFPCnzQLTG4eJxZAem+3dcr6wPJ3+G1sIL7RpM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1jZ0a3C6WrgBNNrmOhhF+xER7PP8ksCg7WfK+EHHpWugmOHtchtHIxqSgVOeFwh+
	 sl/1vOAKOQevSZvLEr3Q3UzV8EjOpdDxhKMrBJnYB/M5ORdHZOb1fyoZTCnOhfAHiC
	 JhgXEXNRhvND9Klnic6IkEjVExvb7u8s7nVGBVRk=
Date: Mon, 4 May 2026 18:27:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	John Stultz <jstultz@google.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 11/11] drm: of: forbid bridge-only calls to
 drm_of_find_panel_or_bridge()
Message-ID: <20260504152737.GD1455860@killaraus.ideasonboard.com>
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
 <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-11-b578c3daaf10@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-11-b578c3daaf10@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_082740_417086_20E5DEAA 
X-CRM114-Status: GOOD (  24.18  )
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

On Mon, May 04, 2026 at 12:45:14PM +0200, Luca Ceresoli wrote:
> Up to now drm_of_find_panel_or_bridge() can be called with a bridge pointer
> only, a panel pointer only, or both a bridge and a panel pointers. The
> logic to handle all the three cases is somewhat complex to read however.
> 
> Now all bridge-only callers have been converted to
> of_drm_get_bridge_by_endpoint(), which is simpler and handles bridge
> refcounting. So forbid new bridge-only users by mandating a non-NULL panel
> pointer in the docs and in the sanity checks along with a warning.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_of.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index ef6b09316963..d03ada82eac9 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -225,15 +225,15 @@ EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
>   * @np: device tree node containing encoder output ports
>   * @port: port in the device tree node
>   * @endpoint: endpoint in the device tree node
> - * @panel: pointer to hold returned drm_panel
> + * @panel: pointer to hold returned drm_panel, must not be NULL
>   * @bridge: pointer to hold returned drm_bridge
>   *
>   * Given a DT node's port and endpoint number, find the connected node and
> - * return either the associated struct drm_panel or drm_bridge device. Either
> - * @panel or @bridge must not be NULL.
> + * return either the associated struct drm_panel or drm_bridge device.
>   *
>   * This function is deprecated and should not be used in new drivers. Use
> - * devm_drm_of_get_bridge() instead.
> + * of_drm_get_bridge_by_endpoint() instead when not looking for a panel, or
> + * devm_drm_of_get_bridge() otherwise.
>   *
>   * Returns zero if successful, or one of the standard error codes if it fails.
>   */
> @@ -245,10 +245,10 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  	int ret = -EPROBE_DEFER;
>  	struct device_node *remote;
>  
> -	if (!panel && !bridge)
> +	if (WARN_ON(!panel))
>  		return -EINVAL;
> -	if (panel)
> -		*panel = NULL;
> +
> +	*panel = NULL;
>  
>  	/*
>  	 * of_graph_get_remote_node() produces a noisy error message if port
> @@ -263,13 +263,11 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  	if (!remote)
>  		return -ENODEV;
>  
> -	if (panel) {
> -		*panel = of_drm_find_panel(remote);
> -		if (!IS_ERR(*panel))
> -			ret = 0;
> -		else
> -			*panel = NULL;
> -	}
> +	*panel = of_drm_find_panel(remote);
> +	if (!IS_ERR(*panel))
> +		ret = 0;
> +	else
> +		*panel = NULL;
>  
>  	if (bridge) {
>  		if (ret) {
> 

-- 
Regards,

Laurent Pinchart

