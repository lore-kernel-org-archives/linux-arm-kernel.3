Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8FBCD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4dulbXDAwQBxDOVeAokcoekpEexPLvg83xRvBbR29I=; b=epFHk5XzO+Uk4wVXdqFNmeFK37
	CaZU28igP61zZdgHzSqRwDlcsA63H3V2uVUgggz7QmnQ/dap7R3UNsnzVDvdzXTtDDfiOnUPCj6Uc
	iWk9x1wLjNSZdh1JUrr+M+ElPcKOc/W7IIHvXMknh5Gn1sP929z6QeGaQPi4kS5nca4E5X1auHNh0
	q8KduwScrOo3nes7MUQQJ6jxLA2kcvKGT+VOWL8wvww9eve4h0ZuEJB/8cSrJebUbjP6LtIp9AIt3
	xO8Z0oyp1DvTIOw9MG9Wk8R29V1IZIedYEpdH3hkwVJQV7/3g57XjJfMW8r0fOihKPuZBZy9y4UOA
	/aRg/XKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtjS-0000000DMGm-2Dxg;
	Mon, 04 May 2026 13:53:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtjP-0000000DMEN-1qsr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 13:53:09 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F04A69C;
	Mon,  4 May 2026 15:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777902780;
	bh=jAmwC7RoNIdGSDJJnfsMWk2C7VRG5k4+P0kWxDw9Xwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exN6jme3FnN7ZdO5dMT/84j58aS3PmMfbugbcsP5HQfKmXzQeMcPeaceQi3LUlvYy
	 14u80HmmnjNDtQbvRSMWvGlbBMYR1/5ISJlmGaTbSIFKRBeISfpeJr4m04M6OyWwT9
	 tIcGO430tOAc9odmsPTKtdJsFUpSNNMGDC2X6S7Q=
Date: Mon, 4 May 2026 16:53:00 +0300
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
Subject: Re: [PATCH v4 01/11] drm/bridge: drm_bridge_get/put(): ignore ERR_PTR
Message-ID: <20260504135300.GE1344263@killaraus.ideasonboard.com>
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
 <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-1-b578c3daaf10@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-1-b578c3daaf10@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_065307_618708_1CABBA27 
X-CRM114-Status: GOOD (  20.69  )
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

On Mon, May 04, 2026 at 12:45:04PM +0200, Luca Ceresoli wrote:
> Most functions returning a struct drm_bridge pointer currently return a
> valid pointer or NULL, but this restricts their ability to return an error
> code describing the error kind.
> 
> In preparation to have new APIs that can return a struct drm_bridge pointer
> holding an ERR_PTR (and for those which already do) make drm_bridge_get()
> and drm_bridge_put() ignore ERR_PTR values, just like they ignore NULL
> pointers.

The change in drm_bridge_put() looks good to me. I'm less sure about
drm_bridge_get(), is there a valid use case to call get() on a bridge
that is not valid ? Doesn't it indicate a clear error in the caller ?

> This will avoid annoying error checking in many places and the risk of
> missing error checks.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/all/20260318152533.GA633439@killaraus.ideasonboard.com/
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/omlnswxukeqgnatzdvooaashgkfcacjevkvbkm6xt33itgua2k@jcmzll2w6kdq/
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> 
> Changes in v4:
> - removed incorrect change to drm_bridge_clear_and_put() kdoc
> 
> Patch added in v2
> ---
>  drivers/gpu/drm/drm_bridge.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index d4b3478258ec..6fb71de6d22a 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -282,7 +282,7 @@ static void __drm_bridge_free(struct kref *kref)
>  
>  /**
>   * drm_bridge_get - Acquire a bridge reference
> - * @bridge: DRM bridge; if NULL this function does nothing
> + * @bridge: DRM bridge; if NULL or an ERR_PTR this function does nothing
>   *
>   * This function increments the bridge's refcount.
>   *
> @@ -291,7 +291,7 @@ static void __drm_bridge_free(struct kref *kref)
>   */
>  struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge)
>  {
> -	if (bridge)
> +	if (!IS_ERR_OR_NULL(bridge))
>  		kref_get(&bridge->refcount);
>  
>  	return bridge;
> @@ -300,7 +300,7 @@ EXPORT_SYMBOL(drm_bridge_get);
>  
>  /**
>   * drm_bridge_put - Release a bridge reference
> - * @bridge: DRM bridge; if NULL this function does nothing
> + * @bridge: DRM bridge; if NULL or an ERR_PTR this function does nothing
>   *
>   * This function decrements the bridge's reference count and frees the
>   * object if the reference count drops to zero.
> @@ -310,7 +310,7 @@ EXPORT_SYMBOL(drm_bridge_get);
>   */
>  void drm_bridge_put(struct drm_bridge *bridge)
>  {
> -	if (bridge)
> +	if (!IS_ERR_OR_NULL(bridge))
>  		kref_put(&bridge->refcount, __drm_bridge_free);
>  }
>  EXPORT_SYMBOL(drm_bridge_put);

-- 
Regards,

Laurent Pinchart

