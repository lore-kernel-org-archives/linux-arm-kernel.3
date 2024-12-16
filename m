Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C28E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 17:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJRLQvoiM2uK9G/IvN+jPx+hGzx5GhhUNmirbsQlJV8=; b=OlNIS+7ii4ZTdxrEheuPRcJ5GU
	zbcB1jVgsb4IXoZ6VJDstR37PuF+y40+mkB3wqmjMLoUbgA5kMmb8E1ozxewEyAh6uK48OaepHcYf
	XRHnn82WPi8IEWS5w4NFRAbkFdUVy1EprFTNAE2roJ9wDPga8k+sbckFFQY2ElhX1YTrKu/Kc0aCe
	zjo97eQcmvCf8/9uDU0cyF/fMYDsY6CpuJls8a9QDRudl2tpePJZDXM2OhlOvGZAxzP6oBd2Sp7ca
	bF7EFpfATTBEXMiFz8V9k4D2dF0nylA8ZQrH2U4tuaFVrjDfHqoCuiAPwSv+kxJbdSHBR710cYrdY
	1rfZVS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFD6-0000000Aoip-14fB;
	Mon, 16 Dec 2024 17:48:48 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFBy-0000000AoYM-3T0v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:47:40 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3003c82c95cso36565071fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734371257; x=1734976057; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJRLQvoiM2uK9G/IvN+jPx+hGzx5GhhUNmirbsQlJV8=;
        b=YrRMDMc7vKWTtowss2wt9WQWO+IyPLAEq2RdSIuAFhmj6/gRvfSAEoR2PIW0yNMaK9
         eCJZXKsx0Y/PALxJf8TicPBGWciDTEYt3Zo7JPeH3Uv6nJyamcaTPgsfjsFTQJocY6Wz
         z5vxScYD9a/UnjvJz/oBjNnRztHAtpk+No/DV5Q/L4PQH7XZB1+pu6osNqDRZISPHTcx
         EogSLTN3gvABdfNSXEtrwR0kNJJg0ipUZqsJG9pGfZXO14MXS/pu1m8OF37kC561vuZc
         8bGe2ajyKmDIAImK5+Eg8W6HVbtgCi4LZlxTeAWMaEjeWDa1pmkqqc/p0z3FVW1Oi7QZ
         ZqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371257; x=1734976057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJRLQvoiM2uK9G/IvN+jPx+hGzx5GhhUNmirbsQlJV8=;
        b=LPF/c3Vdql2dztYJhYVexbFf3b6Wgp4oiwKmh28RmQdrHd1eINszSsQXaxwqH0wJO1
         mjq5TZoGZTOeK6kCbMpvHCMgayk/IGOsiO3Yaa/bjuULGM+++puFTgSSueAoBH+39VnU
         T2zQlgCzg/jE+7BJZeSGp6GmNg29ZS+AwxZJs7ao6VcdWif+HRs7n+S4m0+YaTLDF7Fr
         +/gbQCUdNDbUjv+qndIywsu+U8+GL/tLVjyuqvAdI9IHpVb42Y8wGGkG/O8Y06+9FoNn
         Aia/pYSr8+h0U3oR3a48y9sM6Zv9vXABSbwI/8/Ed/GNUqu55TvMf3zAIo7tMS4Cj3nB
         686A==
X-Forwarded-Encrypted: i=1; AJvYcCVp8VGNWFwg3j5NLOFogA5apI5H/H0QuCOHUrIZRI8hBe3TDgNMfnuopr0KSf00Ai58Uz2E2+GfDw/RupBlz2yn@lists.infradead.org
X-Gm-Message-State: AOJu0YxSamAqDSM4Q4rCeibxAYNYT/PPMe58GozAKqoT0KIQQgyvlzV6
	ZNO2eWieno3RcbE5LkLqvR3KSFFP0oSETTeAK2iPZp/Sstgvesl0V4AfTmyUXUo=
X-Gm-Gg: ASbGncuKL8sSfbL3IEvpCShWjurHX2th0T3crIrcOqycVOyv+twyzcedYSpKtvhI5Qx
	Cv880R6ZWTj5/NxdbSNkX1pNb8JWZaLenRGjGan0HCcL91P2nXPe7z5gbHlblj8PZt/FH3oFoNQ
	0YJyzzni5dqeUlOBp5g1nPOTT6wWdFmPjBegyIG1jwDWXNI6dWixMSvCB19Pg+JrWAsX+HUStiJ
	iy7Mg1NU2AzqQzyJLkUFuuu86x+pS4UDwle8Bslrpx3lLnUCVNlIziZ4zMg2SABPYKmofzSiW0D
	XrKCJojfOGj38hc6+Mr+4fNvW5MetSSLtKX7
X-Google-Smtp-Source: AGHT+IE7Nu2UZ05CbJ5TijHkK7V7tWXZvLvPyH+Y6uLbXlSNImUM95D3nGxGooUa/clMhfRqrHaYLA==
X-Received: by 2002:a05:651c:501:b0:302:34da:ac30 with SMTP id 38308e7fff4ca-302544617f2mr44913431fa.18.1734371256503;
        Mon, 16 Dec 2024 09:47:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344062bd3sm9649911fa.66.2024.12.16.09.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:47:35 -0800 (PST)
Date: Mon, 16 Dec 2024 19:47:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 03/10] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <exocd3b65cy6cy5w47cwx3ykn54ncf34hwyj7ffihs5jjzean5@y677uywnlah2>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-3-50dc145a9c06@linaro.org>
 <20241216-heretic-mackerel-of-wholeness-fcfed7@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-heretic-mackerel-of-wholeness-fcfed7@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_094738_930239_8BCA72B6 
X-CRM114-Status: GOOD (  37.46  )
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

On Mon, Dec 16, 2024 at 06:04:41PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Dec 06, 2024 at 12:15:57PM +0200, Dmitry Baryshkov wrote:
> > Several DRM drivers implement HDMI codec support (despite its name it
> > applies to both HDMI and DisplayPort drivers). Implement generic
> > framework to be used by these drivers. This removes a requirement to
> > implement get_eld() callback and provides default implementation for
> > codec's plug handling.
> > 
> > The framework is integrated with the DRM HDMI Connector framework, but
> > can be used by DisplayPort drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/Makefile                   |   1 +
> >  drivers/gpu/drm/drm_connector.c            |   5 +
> >  drivers/gpu/drm/drm_connector_hdmi_codec.c | 185 +++++++++++++++++++++++++++++
> >  include/drm/drm_connector.h                |  80 +++++++++++++
> >  4 files changed, 271 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 1677c1f335fbb0c6114bdb4cc0b12eb407d84564..afdd9268ca23ac7602e73bbe45f3f9cd090a3afd 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -42,6 +42,7 @@ drm-y := \
> >  	drm_cache.o \
> >  	drm_color_mgmt.o \
> >  	drm_connector.o \
> > +	drm_connector_hdmi_codec.o \
> >  	drm_crtc.o \
> >  	drm_displayid.o \
> >  	drm_drv.o \
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index bbdaaf7022b62d84594a29f1b60144920903a99a..4abfbded962bf45b793a2bd5b1b5c4d9f478a1f7 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -33,6 +33,7 @@
> >  #include <drm/drm_sysfs.h>
> >  #include <drm/drm_utils.h>
> >  
> > +#include <linux/platform_device.h>
> >  #include <linux/property.h>
> >  #include <linux/uaccess.h>
> >  
> > @@ -280,6 +281,7 @@ static int __drm_connector_init(struct drm_device *dev,
> >  	mutex_init(&connector->eld_mutex);
> >  	mutex_init(&connector->edid_override_mutex);
> >  	mutex_init(&connector->hdmi.infoframes.lock);
> > +	mutex_init(&connector->hdmi_codec.lock);
> >  	connector->edid_blob_ptr = NULL;
> >  	connector->epoch_counter = 0;
> >  	connector->tile_blob_ptr = NULL;
> > @@ -632,6 +634,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
> >  		    DRM_CONNECTOR_REGISTERED))
> >  		drm_connector_unregister(connector);
> >  
> > +	platform_device_unregister(connector->hdmi_codec.codec_pdev);
> > +
> >  	if (connector->privacy_screen) {
> >  		drm_privacy_screen_put(connector->privacy_screen);
> >  		connector->privacy_screen = NULL;
> > @@ -670,6 +674,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
> >  		connector->funcs->atomic_destroy_state(connector,
> >  						       connector->state);
> >  
> > +	mutex_destroy(&connector->hdmi_codec.lock);
> >  	mutex_destroy(&connector->hdmi.infoframes.lock);
> >  	mutex_destroy(&connector->mutex);
> >  
> > diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec.c b/drivers/gpu/drm/drm_connector_hdmi_codec.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..1934fb53b4d128434559970c9fea548bbc4bedda
> > --- /dev/null
> > +++ b/drivers/gpu/drm/drm_connector_hdmi_codec.c
> > @@ -0,0 +1,185 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright (c) 2024 Linaro Ltd
> > + */
> > +
> > +#include <linux/mutex.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_device.h>
> > +
> > +#include <sound/hdmi-codec.h>
> > +
> > +static int drm_connector_hdmi_codec_audio_startup(struct device *dev, void *data)
> > +{
> > +	struct drm_connector *connector = data;
> > +	const struct drm_connector_hdmi_codec_funcs *funcs =
> > +		connector->hdmi.funcs->codec_funcs;
> > +
> > +	if (funcs->audio_startup)
> > +		return funcs->audio_startup(connector);
> > +
> > +	return 0;
> > +}
> > +
> > +static int drm_connector_hdmi_codec_prepare(struct device *dev, void *data,
> > +					    struct hdmi_codec_daifmt *fmt,
> > +					    struct hdmi_codec_params *hparms)
> > +{
> > +	struct drm_connector *connector = data;
> > +	const struct drm_connector_hdmi_codec_funcs *funcs =
> > +		connector->hdmi.funcs->codec_funcs;
> > +
> > +	return funcs->prepare(connector, fmt, hparms);
> > +}
> > +
> > +static void drm_connector_hdmi_codec_audio_shutdown(struct device *dev, void *data)
> > +{
> > +	struct drm_connector *connector = data;
> > +	const struct drm_connector_hdmi_codec_funcs *funcs =
> > +		connector->hdmi.funcs->codec_funcs;
> > +
> > +	return funcs->audio_shutdown(connector);
> > +}
> > +
> > +static int drm_connector_hdmi_codec_mute_stream(struct device *dev, void *data,
> > +						bool enable, int direction)
> > +{
> > +	struct drm_connector *connector = data;
> > +	const struct drm_connector_hdmi_codec_funcs *funcs =
> > +		connector->hdmi.funcs->codec_funcs;
> > +
> > +	if (funcs->mute_stream)
> > +		return funcs->mute_stream(connector, enable, direction);
> > +
> > +	return -ENOTSUPP;
> > +}
> > +
> > +static int drm_connector_hdmi_codec_get_dai_id(struct snd_soc_component *comment,
> > +		  struct device_node *endpoint,
> > +		  void *data)
> > +{
> > +	struct drm_connector *connector = data;
> > +	struct of_endpoint of_ep;
> > +	int ret;
> > +
> > +	if (connector->hdmi_codec.dai_port < 0)
> > +		return -ENOTSUPP;
> > +
> > +	ret = of_graph_parse_endpoint(endpoint, &of_ep);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (of_ep.port == connector->hdmi_codec.dai_port)
> > +		return 0;
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *data,
> > +					    uint8_t *buf, size_t len)
> > +{
> > +	struct drm_connector *connector = data;
> > +
> > +	mutex_lock(&connector->eld_mutex);
> > +	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> > +	mutex_unlock(&connector->eld_mutex);
> > +
> > +	return 0;
> > +}
> > +
> > +static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
> > +						    void *data,
> > +						    hdmi_codec_plugged_cb fn,
> > +						    struct device *codec_dev)
> > +{
> > +	struct drm_connector *connector = data;
> > +
> > +	mutex_lock(&connector->hdmi_codec.lock);
> > +
> > +	connector->hdmi_codec.plugged_cb = fn;
> > +	connector->hdmi_codec.plugged_cb_dev = codec_dev;
> > +
> > +	fn(codec_dev, connector->hdmi_codec.last_state);
> > +
> > +	mutex_unlock(&connector->hdmi_codec.lock);
> > +
> > +	return 0;
> > +}
> > +
> > +void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
> > +					     bool plugged)
> > +{
> > +	mutex_lock(&connector->hdmi_codec.lock);
> > +
> > +	connector->hdmi_codec.last_state = plugged;
> > +
> > +	if (connector->hdmi_codec.plugged_cb &&
> > +	    connector->hdmi_codec.plugged_cb_dev)
> > +		connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
> > +						 connector->hdmi_codec.last_state);
> > +
> > +	mutex_unlock(&connector->hdmi_codec.lock);
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
> > +
> > +static const struct hdmi_codec_ops drm_connector_hdmi_codec_ops = {
> > +	.audio_startup = drm_connector_hdmi_codec_audio_startup,
> > +	.prepare = drm_connector_hdmi_codec_prepare,
> > +	.audio_shutdown = drm_connector_hdmi_codec_audio_shutdown,
> > +	.mute_stream = drm_connector_hdmi_codec_mute_stream,
> > +	.get_eld = drm_connector_hdmi_codec_get_eld,
> > +	.get_dai_id = drm_connector_hdmi_codec_get_dai_id,
> > +	.hook_plugged_cb = drm_connector_hdmi_codec_hook_plugged_cb,
> > +};
> > +
> > +/**
> > + * drm_connector_hdmi_codec_init - Initialize HDMI Codec device for the DRM connector
> 
> I think it'd be better to call it drm_connector_hdmi_audio_init over
> drm_connector_hdmi_codec_init (feature over implementation).
> 
> > + * @connector: A pointer to the connector to allocate codec for
> > + * @hdmi_codec_dev: device to be used as a parent for the HDMI Codec
> > + * @max_i2s_playback_channels: maximum number of playback I2S channels
> > + * @spdif_playback: set if HDMI codec has S/PDIF playback port
> > + * @dai_port: sound DAI port, -1 if it is not enabled
> > + *
> > + * Create a HDMI codec device to be used with the specified connector.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int drm_connector_hdmi_codec_init(struct drm_connector *connector,
> > +				  struct device *hdmi_codec_dev,
> > +				  unsigned int max_i2s_playback_channels,
> > +				  bool spdif_playback,
> > +				  int dai_port)
> > +{
> > +	struct hdmi_codec_pdata codec_pdata = {
> > +		.ops = &drm_connector_hdmi_codec_ops,
> > +		.max_i2s_channels = max_i2s_playback_channels,
> > +		.i2s = !!max_i2s_playback_channels,
> > +		.spdif = spdif_playback,
> > +		.no_i2s_capture = true,
> > +		.no_spdif_capture = true,
> > +		.data = connector,
> > +	};
> > +	struct platform_device *pdev;
> > +
> > +	connector->hdmi_codec.dai_port = dai_port;
> > +
> > +	if (!connector->hdmi.funcs->codec_funcs->prepare ||
> > +	    !connector->hdmi.funcs->codec_funcs->audio_shutdown)
> > +		return -EINVAL;
> > +
> > +	pdev = platform_device_register_data(hdmi_codec_dev,
> > +					     HDMI_CODEC_DRV_NAME,
> > +					     PLATFORM_DEVID_AUTO,
> > +					     &codec_pdata, sizeof(codec_pdata));
> > +	if (IS_ERR(pdev))
> > +		return PTR_ERR(pdev);
> > +
> > +	connector->hdmi_codec.codec_pdev = pdev;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_codec_init);
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 1e2b25e204cb523d61d30f5409faa059bf2b86eb..1d113c0ceec7ce8196a412d7c00a1737175c6fbe 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -46,6 +46,8 @@ struct drm_property_blob;
> >  struct drm_printer;
> >  struct drm_privacy_screen;
> >  struct edid;
> > +struct hdmi_codec_daifmt;
> > +struct hdmi_codec_params;
> >  struct i2c_adapter;
> >  
> >  enum drm_connector_force {
> > @@ -1141,6 +1143,52 @@ struct drm_connector_state {
> >  	struct drm_connector_hdmi_state hdmi;
> >  };
> >  
> > +struct drm_connector_hdmi_codec_funcs {
> > +	/**
> > +	 * @audio_startup:
> > +	 *
> > +	 * Called when ASoC starts an audio stream setup. The
> > +	 * @hdmi_audio_startup is optional.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code otherwise
> > +	 */
> > +	int (*audio_startup)(struct drm_connector *connector);
> > +
> > +	/**
> > +	 * @prepare:
> > +	 * Configures HDMI-encoder for audio stream. Can be called
> > +	 * multiple times for each setup. Mandatory.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code otherwise
> > +	 */
> > +	int (*prepare)(struct drm_connector *connector,
> > +		       struct hdmi_codec_daifmt *fmt,
> > +		       struct hdmi_codec_params *hparms);
> 
> Missing newline
> 
> > +	/**
> > +	 * @audio_shutdown:
> > +	 *
> > +	 * Shut down the audio stream. Mandatory.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code otherwise
> > +	 */
> > +	void (*audio_shutdown)(struct drm_connector *connector);
> 
> And thus we can probably just call that one shutdown?

It should be called automatically by the sound system. I'd rather not
call items directly that we are not supposed to call.

-- 
With best wishes
Dmitry

