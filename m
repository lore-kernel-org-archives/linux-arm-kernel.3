Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC57C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 03:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17pakd/Znr7AQ717iCmCdIgifIQxR3pgh2Z0bF8TxTs=; b=EtMv89m63WsnsT2ld1bPsvSAGi
	VgvGhYkvghbBj/fJhQ2FAsvbfw+J4i8eeK/G1D+PRuUP5o6dr12G9apYf/87HP9OFKywYm+WtkVO8
	g6IJl8yvo2ZXV+NbO/2OoT+qsjYuy+hUVlYoW/5JOh9m4LOB+rTNaDVclk1uCjBO+AXLoG0IQFSeW
	bBeS7osklwP0pb5yTjBaNw9typOayfXWnWsYbl/4A3YDv+JfbW4JsWBYcEZ4Sn9H+hIvOJOI/5z0t
	72tUbBikGYQWHcpc0POHb4e1iN8uA84E/iKcI0a074H6KHIXCBr7SApFS0phHm/GM0VMJIfBfIvo+
	K9xAPLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEte-00000008BgP-0to1;
	Fri, 07 Feb 2025 03:19:14 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEsG-00000008BV9-0H1y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 03:17:49 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5440d5aae5cso1752457e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 19:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738898266; x=1739503066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17pakd/Znr7AQ717iCmCdIgifIQxR3pgh2Z0bF8TxTs=;
        b=EAVJ3OOHqwGEPwyrMO4i7lV3Bt81Ofge+/TTvFN2sN1na8YcgjBcyTnjwh7X6Qyf5n
         T2kA9k/Zwzl9pmdE4TZ/+QRqsyJiwg1nxzs0G8gWXFYPKdQeeEIL9FsSpNTDp6WJETW2
         GpzdFMw/VngikPhc6E0wYLpesw34E8VLrJwXhNw4p6v+EpHdqJ/xWtw4834GGKeQB0mN
         ZVCKoUPwTWN+AHd6Afs5pGMDtHAmv94Uy3/yZ51uAKR6FPlarExo5mgPRlrf55bvZnrF
         iGVs+u6Yb3GyHvixn4gGwxBx0HpkLI8AXKYj/+XedhC9n2sDvYJPSCDGsK7NCxli8Esp
         Pciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738898266; x=1739503066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17pakd/Znr7AQ717iCmCdIgifIQxR3pgh2Z0bF8TxTs=;
        b=L7FnRq/+rWzTS6jKcXJmiOBOb/OGF8H7WswTkfB1dDhdafBBfb1lyo0hMxXlHmooKM
         p5J7jQEnw3SlOz4fFCz1RJqu1JyTGlouaCcjR4lsMVtnQO03dQg0wVCAGiHQBhSOE7Vl
         AUrZnW9NL0KDqsTDn4I628ldmfEqbum31XN9neomE0Qr+Lpxs/a85H7/Xdvx+v4qlyB3
         PczkSjVrx3HXF8tmhot1YcWDzVCs4HwQPAG5czC3YCfIEQ31rUSrjQ8Jk6/4t/sHN1Mj
         OdicGEGz8tqdXKSKxTwbuYZ1cHNvTOjGzYfkFJ1+1PV9vIgBBdr4dCiSwQM4qg94gVd2
         7xGg==
X-Forwarded-Encrypted: i=1; AJvYcCU8Fp+ZvQ674U2fVDMkGkkEBaIrbl2tGB5Ht4N4Nj5vVh8CzigCwH/pKNds0zr3tq5ruRLTLS+c8ltIF8dKMNcV@lists.infradead.org
X-Gm-Message-State: AOJu0YzNKv4/T3tCuCcuKTVNpcnR0jUfZM3tVCY1g8CJxTSmu3WkY5cX
	l/IwGYS5bDCxQM66KgX6pVv6kZxJR6ERybR9RFmdCye0GLv27HpnfB4jD9s6BvU=
X-Gm-Gg: ASbGncuWnGGP6uZf0baHzBexoixqILi/Mq8WCBt2384LCOxvh/FYGxRtcyvcGPxYjKV
	mnLAHrUukOMimZAHKmn41KXIa1/8d7vlODprQU3n3nZhcOKGyu3k0Mw/KjTrnDYYiGknyDXfTqM
	eA3Dwr/YLV9oO2jTl1XISmjrw+a0w5+8phNyHFGOTYzneq4ba7yyLVwIzGr5gbOmIUfwb9fzYR8
	Hwr8IWeKXmapjkgq9P5H/g8ExSjJU4e9aMln9drYhGndnF5a+ouXX9U9dyKODAZs3XI9dgWFI7P
	2r5LV5JMnRMLP9UuDqgcjzzSyHUlb7mbEIjj5ld3N7FTq4Rsb1G7LHpDfvvWr1zanP9mbJA=
X-Google-Smtp-Source: AGHT+IGFRWR3LZSENTzR1jrQjMzeY7hexf5uTv34xRfQ9DibP0IYIH3nm+4A52IVjL038EoBPPmYtg==
X-Received: by 2002:a05:6512:2105:b0:53e:ca48:776e with SMTP id 2adb3069b0e04-54414b043d3mr248350e87.36.1738898266070;
        Thu, 06 Feb 2025 19:17:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54410603876sm310371e87.211.2025.02.06.19.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 19:17:44 -0800 (PST)
Date: Fri, 7 Feb 2025 05:17:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 15/26] drm/bridge: devm_drm_of_get_bridge and
 drmm_of_get_bridge: automatically put the bridge
Message-ID: <w3qufv73ldzdcfuz6n3prx4di2dhoq2wfqmmvxvxkea6uqxkge@pjwmugvicsbt>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_191748_119920_698D718A 
X-CRM114-Status: GOOD (  30.25  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 06, 2025 at 07:14:30PM +0100, Luca Ceresoli wrote:
> Add a devm/drmm action to these functions so the bridge reference is
> dropped automatically when the caller is removed.

I think the get() should go to the underlying of_drm_bridge_find() function.

Also it really feels like it's an overkill to keep the wrappers. After
getting bridge being handled by the panel code would it be possible to
drop all of them? Then this patch might introduce one new devm_
function? Or are drmm_ functions actually being used to store data in
the drmm-managed memory?

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index f694b32ca59cb91c32846bc00b43360df41cc1ad..497ec06dfcb05ab5dee8ea5e8f1eafb9c2807612 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -33,6 +33,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>  
> @@ -1459,6 +1460,13 @@ static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
>  	return ret;
>  }
>  
> +static void devm_drm_bridge_put_void(void *data)
> +{
> +	struct drm_bridge *bridge = (struct drm_bridge *)data;
> +
> +	drm_bridge_put(bridge);
> +}
> +
>  /**
>   * devm_drm_of_get_bridge - Return next bridge in the chain
>   * @dev: device to tie the bridge lifetime to
> @@ -1469,6 +1477,10 @@ static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
>   * Given a DT node's port and endpoint number, finds the connected node
>   * and returns the associated bridge if any.
>   *
> + * The refcount of the returned bridge is incremented, but the caller does
> + * not have to call drm_bridge_put() when done with the bridge. It will be
> + * done by devres when @dev is removed.
> + *
>   * Returns a pointer to the bridge if successful, or an error pointer
>   * otherwise.
>   */
> @@ -1483,6 +1495,10 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	ret = devm_add_action_or_reset(dev, devm_drm_bridge_put_void, bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return bridge;
>  }
>  EXPORT_SYMBOL(devm_drm_of_get_bridge);
> @@ -1497,6 +1513,10 @@ EXPORT_SYMBOL(devm_drm_of_get_bridge);
>   * graph link search is not enough, e.g. for drivers that need to support
>   * panels described only as subnodes.
>   *
> + * The refcount of the returned bridge is incremented, but the caller does
> + * not have to call drm_bridge_put() when done with the bridge. It will be
> + * done by devres when @dev is removed.
> + *
>   * RETURNS:
>   * A pointer to the bridge if successful, or an error pointer otherwise.
>   */
> @@ -1513,10 +1533,21 @@ struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
>  	if (!bridge)
>  		return ERR_PTR(-ENODEV);
>  
> +	ret = devm_add_action_or_reset(dev, devm_drm_bridge_put_void, bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return bridge;
>  }
>  EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
>  
> +static void drmm_bridge_put_void(struct drm_device *drm, void *ptr)
> +{
> +	struct drm_bridge *bridge = ptr;
> +
> +	drm_bridge_put(bridge);
> +}
> +
>  /**
>   * drmm_of_get_bridge - Return next bridge in the chain
>   * @drm: device to tie the bridge lifetime to
> @@ -1527,6 +1558,10 @@ EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
>   * Given a DT node's port and endpoint number, finds the connected node
>   * and returns the associated bridge if any.
>   *
> + * The refcount of the returned bridge is incremented, but the caller does
> + * not have to call drm_bridge_put() when done with the bridge. It will be
> + * done by drmm when @dev is removed.
> + *
>   * Returns a drmm managed pointer to the bridge if successful, or an error
>   * pointer otherwise.
>   */
> @@ -1541,6 +1576,10 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	ret = drmm_add_action_or_reset(drm, drmm_bridge_put_void, bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return bridge;
>  }
>  EXPORT_SYMBOL(drmm_of_get_bridge);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

