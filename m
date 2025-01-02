Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0C9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 04:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRbuq/vJhOHDwWZyIZVQ1UR8FeorGGJoKh1JNDZST1k=; b=C5hycogHqULW7f31TCgcUyFU8+
	BsGspqcyWbYDbpnsUAXhQk/cG/z25TKwbw7yhpdoLJfVSEoPym7PhBhiVo9ZwKR0gSywH47JsGYGL
	Pv6IRVgp5e8M4Af63SufZzjAr7rVpK7iPiXPou+vAV4I707xE84ndgjBu5Ge2FD7KyBci/3lsOhP+
	/Wfx0mmHjZdet/CLlC0kmwlly7ujQN5aTDdtgblywnRVQLynPdNw8ekXfQA3tY4xhkUBjLcdtQ/vL
	khrpdQTOwNbV5jsOpmGBQCxgaQxatzpzdpUs2jjVm2em5PW1UDpdi6aeopiol4vH5A7EF0xjc4e8K
	HZChV0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTDCg-00000009jO6-3M4t;
	Thu, 02 Jan 2025 04:53:02 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTDBY-00000009jL4-1Ibe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 04:51:53 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-303489e8775so126677591fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jan 2025 20:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735793510; x=1736398310; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRbuq/vJhOHDwWZyIZVQ1UR8FeorGGJoKh1JNDZST1k=;
        b=BmGAkc8z0xmQDN04P8eolpfLp/h5WWlgOR0eVn87b6uVZfXI5Mo7djcqzTqGeNoJwz
         P/rHnycPWBirEtk/oCw3fa451RGwydvokMLfU00VVtqM1FZsjnCPUc/M8VliZXMtv/1f
         8E7WWKq0aNCRX0nlcoeSoo+38MMXY7swfiaK6/K2wKW7KVxWwz9MFtvjGD5GONUYAw2c
         gPsJXMq2QMFT9707WkFJF5ycArJxIVDOKRU+/DChT1piXNTq74l754200pYrlCx1+LYg
         h4KSkZASDve6+fAkoPHWv0a4sQWh2eKkfOJ0h9zMCjJOMzLy6tG8SWGhXRoF3s7pQAIp
         /w5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735793510; x=1736398310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRbuq/vJhOHDwWZyIZVQ1UR8FeorGGJoKh1JNDZST1k=;
        b=nPMu8NF+lX4l3GfTwUCOzccRlBB/9SGQPkbEV6oLcTfeBbORLNptjdBrZ5z1+NPQQg
         NAftdV9LyxO6+S0yV9EIW77gsjptyx//25lotcfJuCEkzHeiTIEd87+7zJibf8Dfw4zt
         Pg/0CBcoeOVwsQQIWf9cJ6fJ3/4CJJC6Nivlh181T18CU+9GPOAZRlysPkh7vl6Vi9PF
         Q+4cmfUwUNc3H33nh34hKqw7N8A8Pbs/yQdue0eap3q23O/hBI3wqXZEPhiPRU0BTuGW
         LWN2U7m2gvhkMbNG/IcrRS1nrTW8wWiHPABfcB07vr3CPyprKNbcwsDuiqmd6KMrj131
         HAsw==
X-Forwarded-Encrypted: i=1; AJvYcCXLjSaq/6c5r0u1aRS1XcvPd/da9hyt+udoSlN5LHjKe1oES9IX5I9vr+m8bcM+qY65nX882DPhwdBkMrWla/27@lists.infradead.org
X-Gm-Message-State: AOJu0YxKBdwykr72H/cRwFvCTihiSrcAavRriqciMnD0EA430TOE6HB0
	Ir/XTRpybLDI7T4aiPv+H3lQrGCJwsnQltXIoWAkuUNvs8hGoOUF9VgAaOA2aoQ=
X-Gm-Gg: ASbGncuFGzBdqzpgjglPyCjlenbdRd+3wiFMDKSWCVSyThMF3TlnmDI+zjHA8s1CVc3
	Aw/1urdyNDWQtle9/5s+pehjGEq+r5WKSMcELSr6fNpw0kg28/XMcvLIn6mjpbF3cg3w6+0r1jm
	0On8uP2n10Lv+wbyxqrxo48HbJEZ0Bgg8WwMtLoIY4+OyDRbqQjuQuMnW+Y1dNgH9TVT2QrdjrQ
	1gbbPDM1wrruyg1WlD5ihDJ6jMpGQaUuZMm5XSic75yy+V3RCtzq8e5k0Z0GPAXj8AjN0nOnQLn
	PpFFu9Yh0UJcpKA5Sh/nWR7mLi1VvDllbriz
X-Google-Smtp-Source: AGHT+IGE2Szq9qm9GN+rsyVm5RLYM6Bq9PLVSw4z6os4ljvKgQu4XGWjU61plLVc+yzsVHeip+HlRw==
X-Received: by 2002:a2e:a588:0:b0:2ff:c349:8d08 with SMTP id 38308e7fff4ca-3046851e529mr158851661fa.8.1735793510280;
        Wed, 01 Jan 2025 20:51:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c632sm42017411fa.21.2025.01.01.20.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 20:51:49 -0800 (PST)
Date: Thu, 2 Jan 2025 06:51:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <xqu2zjrefp2rgp2hyjqhi3nxypcxa7zpypct553upbxdsx64jr@wfn3dzzk3jxe>
References: <20241231192925.97614-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231192925.97614-1-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_205152_453550_E0E04BA9 
X-CRM114-Status: GOOD (  26.03  )
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

On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> HDMI but do not contain the HDMI connector node. This flag allows such
> DTs to work by creating the connector in the HDMI bridge driver. Do not
> use this flag, do not proliferate this flag, please fix your DTs.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Please describe that it is required for backwards compatibility with the
existing DTs. I think it is a good idea unless Shawn, Sascha or Fabio
tell that we should ignore backwards compatibility.

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V3: New patch
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++----
>  include/drm/bridge/dw_hdmi.h              |  2 ++
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 996733ed2c004..852e73c0f686f 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2893,9 +2893,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> -		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> -					 bridge, flags);
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		if (hdmi->plat_data->output_port_optional && !hdmi->next_bridge)
> +			return dw_hdmi_connector_create(hdmi);
> +		else
> +			return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> +						 bridge, flags);
> +	}
>  
>  	return dw_hdmi_connector_create(hdmi);
>  }
> @@ -3298,7 +3302,7 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
>  					  hdmi->plat_data->output_port,
>  					  -1);
>  	if (!remote)
> -		return -ENODEV;
> +		return hdmi->plat_data->output_port_optional ? 0 : -ENODEV;
>  
>  	hdmi->next_bridge = of_drm_find_bridge(remote);
>  	of_node_put(remote);
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 6a46baa0737cd..3bb6e633424a8 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -127,6 +127,8 @@ struct dw_hdmi_plat_data {
>  	struct regmap *regm;
>  
>  	unsigned int output_port;
> +	/* Used purely by MX8MP HDMI to work around broken DTs without HDMI connector node. */
> +	bool output_port_optional;
>  
>  	unsigned long input_bus_encoding;
>  	bool use_drm_infoframe;
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

