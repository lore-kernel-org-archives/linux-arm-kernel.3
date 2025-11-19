Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9C5CF257C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 04:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSBEJqan3s0yKTSBo+2Da9OzI6hVXevsvKZmW9hixX8=; b=VdUgdpy4WgIEJvUL0cEJFE21/G
	ts16LZaLoSSsUiNtiSNkPyOghoRKObPmruGgUD7GRaaZ2Fha8fxGnOSDyuO8vM8LYOaOYYhwtKElA
	R7mA4dvB+UExtrFD8Rt2BbWBv44RsdZY+wWkuuO0QCkLmAQZovJ91uon+xHrG+dDRFjSY+XH/7qLW
	0nKSnVbF+ppv7fXocDUUcJmxHU4T7Amf27f+rHwiuK3i6xZ82Lbx7Kj88dyG0EjB+jVEBbYa6M34x
	YSbWXhWTlIXeTBw/EWc7QEoQa93k5D/jBfSll5pWKn0iJ/vyqaWjav1CbRxOoGC7SJ4eY0QiD7bre
	oOjbmMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZdm-00000001eCw-1Zr3;
	Wed, 19 Nov 2025 04:17:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZdj-00000001eAr-3dDO;
	Wed, 19 Nov 2025 04:17:57 +0000
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CD2D7DD9;
	Wed, 19 Nov 2025 05:15:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763525749;
	bh=k9XgYvXg+wjYK9oGaaaJfHYNam3rcMc0Uh8RTTWVT5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wMOj4w0tcYckHL1uLbD4I68O4YFcO2oAUfrEyfyPHXv95KApnfu3oTyZkA9doTCeo
	 erWWZqXi/ufzaUkv8FS2j3TTK85DVPRy1o9QOlpvvYkyxzlT4kIWWL643fEVn/wEwR
	 8h4B0+K0SviyCdj7VEhSntQn2abmkr3QgVEjIQsY=
Date: Wed, 19 Nov 2025 13:17:26 +0900
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
Subject: Re: [PATCH v4 05/10] drm/bridge: dw-hdmi-qp: Set bridge
 supported_formats
Message-ID: <20251119041726.GE10711@pendragon.ideasonboard.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-5-0ded72bd1b00@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-color-format-v4-5-0ded72bd1b00@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_201756_049139_5B2B7E15 
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

On Mon, Nov 17, 2025 at 08:11:49PM +0100, Nicolas Frattaroli wrote:
> The drm_bridge "supported_formats" member stores a bitmask of supported
> HDMI output formats if the bridge is in fact an HDMI bridge.

It would be nice to convert the supported_formats field to a bitmask of
DRM_MODE_COLOR_FORMAT_* values.

> 
> However, until now, the synopsys dw-hdmi-qp driver did not set this
> member in the bridge it creates.
> 
> Set it based on the platform data's supported_formats member, and
> default to BIT(HDMI_COLORSPACE_RGB) if it's absent, which preserves the
> previous behaviour.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index fe4c026280f0..cf888236bd65 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -1269,6 +1269,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
>  		dev_warn(dev, "Set ref_clk_rate to vendor default\n");
>  	}
>  
> +	if (plat_data->supported_formats)
> +		hdmi->bridge.supported_formats = plat_data->supported_formats;
> +	else
> +		hdmi->bridge.supported_formats = BIT(HDMI_COLORSPACE_RGB);
> +
>  	dw_hdmi_qp_init_hw(hdmi);
>  
>  	ret = devm_request_threaded_irq(dev, plat_data->main_irq,

-- 
Regards,

Laurent Pinchart

