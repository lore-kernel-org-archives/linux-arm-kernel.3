Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7B9C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Byca7B+SvHo9poDjpj+NTEDwW3aW+UfYwBPg1UM/mI=; b=C6wEZwYEc5ubNcAZC7mPdFVa2l
	dzr87nLAMwcvC6g76cEljg8mBv1s65iCG8uTw7Y8JqaoOHNC4SXPw0KBMWykDF5d9Pp68/q4k6qgi
	unAtSCEwSVwWUrOFMqPCg1sJfBnuR8rbGTc+CJ47Z9oCfl6yYf+Eq6uKJKBfvu6Kn90c67oNZfim0
	ugd+daTgYt46jwwe2a35th4HSLAn8s4QkXFaUvzT0cAynceZxKMwN3q4engCl/KkDCzNdA8OB+gCQ
	dpeCsdrnJfv5q/13UaHYTYOUrYY/YA/4TCddE//S4jSr/ep4MqfXiqInvQcO4XnXeRuSvNFSs7+dY
	rdQCz6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEYY-000000088iA-06qY;
	Fri, 07 Feb 2025 02:57:26 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEX9-000000088VL-3TJX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:56:01 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-306007227d3so16344111fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896958; x=1739501758; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Byca7B+SvHo9poDjpj+NTEDwW3aW+UfYwBPg1UM/mI=;
        b=HaEbkkapjVy6HShwvt9OkXeT8gZjHSR5y1/wp6rtPYtWtspFPMh4c6kMXlIQZEmDC9
         J4aZWlDGPzpXK3f7RVrme+hEjHpVNtaf5oOqJlmT4UaZnPSG8BsfoenE4GAEsROHeQyu
         AKiDEIl8ZahnnFaeTa0QHlEscvS0MzqeLXiAtFzQEs6wY5Xc/Igi4/ZhcFj5EVHFvten
         lpM2kGS5vHhcWYjGQK2kVVqBxMoLIyHvyNOih5DQSL2nnPxBt65j6ZmoYEqB4GhuGbFb
         nntHMwLJHgInTygusQQKMzwtoGWbPCs+vTzxud9HkKm1Hkvvp0DeK1brPRb7P5tduA7n
         RbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896958; x=1739501758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Byca7B+SvHo9poDjpj+NTEDwW3aW+UfYwBPg1UM/mI=;
        b=hqJ5sLBfWWrEqXMzk7YxcAtexRPR8GEoTavSszfn1ckyRUWLd2zeiyKJtTYsO1M1oA
         oFmUvxtgA5jhcyCRg7gobYZzDTJ0Kt0za9FEPEALENdo75Hze7d9ciJdI9mo6X9DaUnx
         7aPL4Ddoqyfr3hCfJD0vXJO2Cx4kLIfLAM7x1XAdaVZso8MIzbQ6UTxgwqJRNY18neQc
         d3xG8JCPlzBQ0LWsroeIIY1ETCQpOOJedUX+acNQrP+/jKwrexWUfwwCe67YNtghUdjr
         3Hpaz65N4Ce0KsX8LReN/7umWjG8xv053L3ZplE5+6mTKec1KvoNxkaXicCGC6qJyQSy
         ft2g==
X-Forwarded-Encrypted: i=1; AJvYcCXncWH+z3GNqWRU3wAWcebe5hXvmWppafW49XrOxBw5AM3Aj+JC/vreArXvgnXPG4+YMgRn2rdpRN6YaaCrEM9a@lists.infradead.org
X-Gm-Message-State: AOJu0YwFfRBkh86638zWJHjOxqFgSSww2dzXTTaQIbnCHg3w8zLZ3TPs
	P1LPJGbii8AjJCnryJO2RGQPGSUJMoGTi91cwdw8Qm607onbG2/9Qnk/iqKWztw=
X-Gm-Gg: ASbGncv3QAEihpq40F3SSd1RPrCkTM6MvYs56TuzP+gYT/JDoHjic8J9qmBMLEVmXcd
	p7fQEdAOu/mp3hQmSkjsAsDkbYx5aV5IM9fTqNRThahDcIb0pOs9hKS2A3wLBTUNViX6+/4FIIr
	2xWhPqLsirItS1+RevQKHP/elMGke6dnpstarr8SosPRXMLf9VEHvTGIc6kgHEmDBbhkr/1zz6I
	snRBfti+AXMWkCoMluXr3jUMnDrHZ60NAVEUdT8PkQf0ds5jT8/joIttF4qiMT8TXbmKbnQ2mnZ
	upbPUZiQYMg8fVIURXNfFOMUhq3ZNKDIsZ+GiE6d7DxSavMcmnpdyDREZKlVO79UqJmoPQ8=
X-Google-Smtp-Source: AGHT+IFZ4T7u0nGpfUVwU5s+4eCkQKYR6Jj3XEJ5v8Yh2TBgTlWEdJadPmr9h+8Pcw7MtkjpxzqCxQ==
X-Received: by 2002:a05:651c:892:b0:2fb:8c9a:fe3f with SMTP id 38308e7fff4ca-307e5817d58mr4571041fa.22.1738896957912;
        Thu, 06 Feb 2025 18:55:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2d8efesm2799391fa.88.2025.02.06.18.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:55:56 -0800 (PST)
Date: Fri, 7 Feb 2025 04:55:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
Message-ID: <hc6llejnkhj5uaj5o4fof64hmderfcbfkrburv7nmqwzq2jnin@nac32akftsbm>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_185559_868893_E614366B 
X-CRM114-Status: GOOD (  38.39  )
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

On Thu, Feb 06, 2025 at 07:14:26PM +0100, Luca Ceresoli wrote:
> In order to support panels described either via graph links or via a
> subnode (e.g. "panel@0"), this driver uses low-level deprecated functions
> to find the next bridge. The resulting logic is complex and duplicates code
> already present in the DRM bridge core. Switch to the new APIs in DRM
> bridge core that allow to do the same in a much cleaner way.
> 
> Note there are two slight changes in the new logic intended to improve the
> final result:
> 
>  * the old code looks for a subnode with any name except "port" or "ports",
>    while the new code uses the node passed as a parameter
> 
>  * the old code looks for a subnode first and falls back to a graph link,
>    while the new code uses the reverse order because graph links are the
>    recommended device tree representation now
> 
> The first change makes the code more robust by avoiding the risk of using
> an unrelated node which is not describing a panel and not names "port" or
> "ports".
> 
> The second change is not expected to expose regressions because, in the
> cases where both a subnode and a graph link are used to describe a panel,
> the graph link should point to the subnode itself, such as in
> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> 
> As a further cleanup, use a temporary variable to assign dsi->out_bridge
> only on success. This avoids the risk of leaving a non-NULL value in
> dsi->out_bridge when samsung_dsim_host_attach() fails.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 55 ++++++-----------------------------
>  1 file changed, 9 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index f8b4fb8357659018ec0db65374ee5d05330639ae..bbd0a4f5a3f52b61bf48f10d6e8ca741bffa5e46 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1704,55 +1704,16 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
>  	struct device *dev = dsi->dev;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *remote;
> -	struct drm_panel *panel;
> +	struct drm_bridge *out_bridge;
>  	int ret;
>  
> -	/*
> -	 * Devices can also be child nodes when we also control that device
> -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> -	 *
> -	 * Lookup for a child node of the given parent that isn't either port
> -	 * or ports.
> -	 */

Please leave the comment in place (maybe rewrite it slightly).

> -	for_each_available_child_of_node(np, remote) {
> -		if (of_node_name_eq(remote, "port") ||
> -		    of_node_name_eq(remote, "ports"))
> -			continue;
> +	out_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
> +	if (IS_ERR(out_bridge) && PTR_ERR(out_bridge) != -EPROBE_DEFER)

Can it actually return EPROBE_DEFER?

> +		out_bridge = devm_drm_of_get_bridge_by_node(dev, device->dev.of_node);
>  
> -		goto of_find_panel_or_bridge;
> -	}
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
> -	remote = of_graph_get_remote_node(np, 1, 0);
> -
> -of_find_panel_or_bridge:
> -	if (!remote)
> -		return -ENODEV;
> -
> -	panel = of_drm_find_panel(remote);
> -	if (!IS_ERR(panel)) {
> -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> -	} else {
> -		dsi->out_bridge = of_drm_find_bridge(remote);
> -		if (!dsi->out_bridge)
> -			dsi->out_bridge = ERR_PTR(-EINVAL);
> -	}
> -
> -	of_node_put(remote);
> -
> -	if (IS_ERR(dsi->out_bridge)) {
> -		ret = PTR_ERR(dsi->out_bridge);
> -		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
> -		return ret;
> +	if (IS_ERR(out_bridge)) {
> +		DRM_DEV_ERROR(dev, "failed to find the bridge: %ld\n", PTR_ERR(out_bridge));
> +		return PTR_ERR(out_bridge);
>  	}
>  
>  	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
> @@ -1784,6 +1745,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	dsi->format = device->format;
>  	dsi->mode_flags = device->mode_flags;
>  
> +	dsi->out_bridge = out_bridge;
> +

Please move the assignment closer to the original place.

>  	return 0;
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

