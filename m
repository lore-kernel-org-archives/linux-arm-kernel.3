Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A813FC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9F02/YDvnybxu8ztsJHZ1LF6k/z+auHcgxD1SfmGPM=; b=QehncjLkGB4bka6teIkIcAy5SN
	T5+Pu8wo+zBBDSd4FFTvat6qlEeIBb3Af7+iA8+4/Uer+k9qx8IoFKzMG8ba71acqLX2UG1fAKTYv
	J2IuoJnxXAYcGrdHO1GyC07h44uEGpToGxEpWJst1Nxxhq4kzJxfP7/tzsMrg8ZZ2OMERRYvfkm76
	mzvb18P9PebP0STX0JkWAndaNvHAx4F3J5bBDPrG2Va+Obesm5UFzIRhQFUhRFMqZB8teDnz3CJHs
	GDTke+g0ybDzv4e7iVqFBomKDQnHTvKTrPnGetVLXC2sBdfzz/mXIajFHbyrmhjng9fYRFw9EAZtL
	RjC/oWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEV6-000000088EL-1OVr;
	Fri, 07 Feb 2025 02:53:52 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgETi-000000087z0-2KVa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:52:27 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5439e331cceso1931245e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896745; x=1739501545; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h9F02/YDvnybxu8ztsJHZ1LF6k/z+auHcgxD1SfmGPM=;
        b=YC7fI25vkpUR8PwrWcZT2nVyIyn+sSIRlZd+LnleNH5kMWR/XHOpl3MEFM2d6K3uPS
         ykQOKU/T+pBsYRTZz5H+kwIPZ1Hm4wtWB870zzSpxJTVPhfZLKSDfiz2WhRhundviBMi
         iwnENfwnLFyQH0Mj2rqLumr1r6Xe5rJb0T+q/re8zVJRtbYbNXe/+wwlupp692GylwHu
         3+C1ivwxsmdSjMp+skug3aYZ+WtKsi5msDTaTxhGpol9N6FHrY9++03SwncUvJQHqyAv
         zjINQKuellj1RXkHx7scC96qSSJhPcZlfx2jzSTEpl6mHU3IOzooKh596lsWQAcxWb82
         jHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896745; x=1739501545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9F02/YDvnybxu8ztsJHZ1LF6k/z+auHcgxD1SfmGPM=;
        b=ZRlWlTNrPXiAs4rGhM0SawkbRaqnxxW3AG07CbIea9aIVysuLqSn8kaj1dgK9ng2qx
         ykgBxNnVHoSfVoIp/Sb/VifJIXbi1XWMX0nrWA+XtYmCge/AH/TM9Mo25VltzlIx8T7U
         xTAjx5FxL9WHEMcdALoV6TxwhoCYI7BDkbWlUtA8ucF4T5GX/vZtY2HMxsnVyB9BGJpN
         x83ubiKKBKZgIZfXys3rjAsQG9nF5vP1OXY3/eOpxmETYYOhjJk0LDlKM4xcygLCmJR+
         iUHaP96M/RnSE6iC8teiAxYtZvJFxA+6fBZIVcVbalzMLW1e0fk0yJwxV1POvj0vhu7d
         cUjw==
X-Forwarded-Encrypted: i=1; AJvYcCWtgAIYQCjfae3ONPCOwnSWtkFkV+oMwUqnalAXJA7oOdMTAEr1/2LYyxwEXk/EYtGbbV4GRIDtOgqSc6Bmp6v3@lists.infradead.org
X-Gm-Message-State: AOJu0YxuavEUT9d0kPCqYC2IsCacZTtGZuAzPmZ0xiXZ+Eg40lraJEP1
	Is+ojlorcAmCLmWRTlfv2fM797vUhnRnLoSMPvs30fQnBZFLauXf3huc7SkmLy8=
X-Gm-Gg: ASbGncvPqV+pPIixPZ0udzaIR/8scb8UVky06gkDMATn6Bnfx7+mvsJmRqrq3scH1oi
	4HJqbwfDaBdfG16XzGm57yz2xBxSJd6YVuMCp/cMiKS7KBflqR8gYEKbNgBvoBcZlReggXUZVI/
	kzHFIfMPmuVRL2KvjbMSeXJCYMYZhXL2bEZ/TcxOlwPCQJK4m1kBVgyS3fE4Pa5uTrZNzJAnEDe
	CColgxGbTohWS+YOMDFEkRLBhDkfKFEcudtBdTi/y0+WOXm2GpXjs/0dcW7+Yuwh1U/mlcZl9WU
	lE6Db+YUaYphfGdkh3b9jOZ8H8zfnkLuso+AosqXRpXYuBCi5UhDs6xTs2HuFOC/t785rQ8=
X-Google-Smtp-Source: AGHT+IFgW897y8GZ6q7fIx1eveSasf6e4TKZyOYUknvmrPjaAmKxvvhWspCZkVzJPR5Pf1lTvWOAUw==
X-Received: by 2002:a05:6512:1195:b0:542:6d01:f55c with SMTP id 2adb3069b0e04-54414a962c4mr418596e87.3.1738896744794;
        Thu, 06 Feb 2025 18:52:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441055573asm309217e87.81.2025.02.06.18.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:52:23 -0800 (PST)
Date: Fri, 7 Feb 2025 04:52:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 09/26] drm/bridge: move devm_drm_of_get_bridge and
 drmm_of_get_bridge to drm_bridge.c
Message-ID: <aayr7q6i3x34xw7ivvapnk6h6mgx67qhpv2rqk2gotejyjetwy@olb5lbwxd5e3>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_185226_638589_3698C8D0 
X-CRM114-Status: GOOD (  36.78  )
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

On Thu, Feb 06, 2025 at 07:14:24PM +0100, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() and drmm_of_get_bridge() do not have anything to
> do with struct drm_panel anymore, they just manage bridges. So move them
> from bridge/panel.c to drm_bridge.c.
> 
> Move also of_drm_find_bridge_by_endpoint() which is used only by
> devm_drm_of_get_bridge() and drmm_of_get_bridge().
> 
> No code changes, only move functions to a different file within the same
> module and add an #include as needed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 102 -----------------------------------------
>  drivers/gpu/drm/drm_bridge.c   | 100 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 100 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 6995de605e7317dd1eb153afd475746ced764712..1230ae50b2020e7a9306cac83009dd600dd61d26 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -418,49 +418,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
>  
> -/**
> - * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
> - * @np: device tree node containing encoder output ports
> - * @port: port in the device tree node
> - * @endpoint: endpoint in the device tree node
> - * @bridge: pointer to hold returned drm_bridge (must not be NULL)
> - *
> - * Given a DT node's port and endpoint number, find the connected node and
> - * return the associated struct drm_bridge.
> - *
> - * Returns zero if successful, or one of the standard error codes if it fails.
> - */
> -static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
> -					  int port, int endpoint,
> -					  struct drm_bridge **bridge)

I'd say make this function the main API instead (and name it drm_of
rather than of_drm, this can happen in the previous patch).

> -{
> -	int ret = -EPROBE_DEFER;
> -	struct device_node *remote;
> -
> -	if (!bridge)
> -		return -EINVAL;
> -
> -	/*
> -	 * of_graph_get_remote_node() produces a noisy error message if port
> -	 * node isn't found and the absence of the port is a legit case here,
> -	 * so at first we silently check whether graph presents in the
> -	 * device-tree node.
> -	 */
> -	if (!of_graph_is_present(np))
> -		return -ENODEV;
> -
> -	remote = of_graph_get_remote_node(np, port, endpoint);
> -	if (!remote)
> -		return -ENODEV;
> -
> -	*bridge = of_drm_find_bridge(remote);
> -	if (*bridge)
> -		ret = 0;
> -
> -	of_node_put(remote);
> -	return ret;
> -}
> -
>  /**
>   * of_drm_get_panel_orientation - look up the orientation of the panel through
>   * the "rotation" binding from a device tree node
> @@ -1150,62 +1107,3 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
>  	return &panel_bridge->connector;
>  }
>  EXPORT_SYMBOL(drm_panel_bridge_connector);
> -
> -#ifdef CONFIG_OF
> -/**
> - * devm_drm_of_get_bridge - Return next bridge in the chain
> - * @dev: device to tie the bridge lifetime to
> - * @np: device tree node containing encoder output ports
> - * @port: port in the device tree node
> - * @endpoint: endpoint in the device tree node
> - *
> - * Given a DT node's port and endpoint number, finds the connected node
> - * and returns the associated bridge if any.
> - *
> - * Returns a pointer to the bridge if successful, or an error pointer
> - * otherwise.
> - */
> -struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> -					  struct device_node *np,
> -					  u32 port, u32 endpoint)
> -{
> -	struct drm_bridge *bridge;
> -	int ret;
> -
> -	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	return bridge;
> -}

Then these two functions can go into the header as static inlines with
the proper deprecation notification. There is little point in having
them in the source file. I think eventually all users should be
converted into using your new of_drm_find_bridge_by_endpoint() funcion.

> -EXPORT_SYMBOL(devm_drm_of_get_bridge);
> -
> -/**
> - * drmm_of_get_bridge - Return next bridge in the chain
> - * @drm: device to tie the bridge lifetime to
> - * @np: device tree node containing encoder output ports
> - * @port: port in the device tree node
> - * @endpoint: endpoint in the device tree node
> - *
> - * Given a DT node's port and endpoint number, finds the connected node
> - * and returns the associated bridge if any.
> - *
> - * Returns a drmm managed pointer to the bridge if successful, or an error
> - * pointer otherwise.
> - */
> -struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
> -				      struct device_node *np,
> -				      u32 port, u32 endpoint)
> -{
> -	struct drm_bridge *bridge;
> -	int ret;
> -
> -	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	return bridge;
> -}
> -EXPORT_SYMBOL(drmm_of_get_bridge);
> -
> -#endif
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 87cebec2de806781cee22da54d666eee9bde3648..2aa17fbe538b86066c4e68f0d0e8046e9ca9b965 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -25,6 +25,7 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
> @@ -1334,6 +1335,105 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  	return NULL;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
> +
> +/**
> + * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + * @bridge: pointer to hold returned drm_bridge (must not be NULL)
> + *
> + * Given a DT node's port and endpoint number, find the connected node and
> + * return the associated struct drm_bridge.
> + *
> + * Returns zero if successful, or one of the standard error codes if it fails.
> + */
> +static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
> +					  int port, int endpoint,
> +					  struct drm_bridge **bridge)
> +{
> +	int ret = -EPROBE_DEFER;
> +	struct device_node *remote;
> +
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	/*
> +	 * of_graph_get_remote_node() produces a noisy error message if port
> +	 * node isn't found and the absence of the port is a legit case here,
> +	 * so at first we silently check whether graph presents in the
> +	 * device-tree node.
> +	 */
> +	if (!of_graph_is_present(np))
> +		return -ENODEV;
> +
> +	remote = of_graph_get_remote_node(np, port, endpoint);
> +	if (!remote)
> +		return -ENODEV;
> +
> +	*bridge = of_drm_find_bridge(remote);
> +	if (*bridge)
> +		ret = 0;
> +
> +	of_node_put(remote);
> +	return ret;
> +}
> +
> +/**
> + * devm_drm_of_get_bridge - Return next bridge in the chain
> + * @dev: device to tie the bridge lifetime to
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + *
> + * Given a DT node's port and endpoint number, finds the connected node
> + * and returns the associated bridge if any.
> + *
> + * Returns a pointer to the bridge if successful, or an error pointer
> + * otherwise.
> + */
> +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> +					  struct device_node *np,
> +					  u32 port, u32 endpoint)
> +{
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(devm_drm_of_get_bridge);
> +
> +/**
> + * drmm_of_get_bridge - Return next bridge in the chain
> + * @drm: device to tie the bridge lifetime to
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + *
> + * Given a DT node's port and endpoint number, finds the connected node
> + * and returns the associated bridge if any.
> + *
> + * Returns a drmm managed pointer to the bridge if successful, or an error
> + * pointer otherwise.
> + */
> +struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
> +				      struct device_node *np,
> +				      u32 port, u32 endpoint)
> +{
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(drmm_of_get_bridge);
>  #endif
>  
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

