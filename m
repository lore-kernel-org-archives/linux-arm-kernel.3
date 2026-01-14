Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1219D31A3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9hmPzenFNHaMEP2WOiENDOqLl4/pBzRMvq4zXQDd30=; b=Wj4M7i6HyrsD89G3nmJfMRgrzN
	AOfkENIgbMzDVUQGNpFMlkpNSiFLcm3ob0afrJtUcyeh9wJTrhIlEPbdHc483OnSyB4rw+r1EFtZr
	N9O0XxtJz84dfxMAw4Pqgs2Wgx8bntAWOg0GtKyoJFyd/kOvM1Dl+IjTojg0Eu83Jr3AHiDNGG8uO
	Nfi6OdRW96g/9fS/ifZ/o5WOYvjNPKrsFLGWjpxa4mL1NZMF+AaVor9mRefHa6oia09jDyFCUeWKo
	7gwGWc8/4kgalw+5gBmwhB001IU7rnRV/k9c/iwSJ4BxSB84NUpUOJws9UwBWi9raruDoIKhbFMAb
	tXwYqkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxno-00000008hA6-0AOg;
	Wed, 14 Jan 2026 10:08:36 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxnj-00000008h84-2z3l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:08:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 189B54E420D3;
	Wed, 14 Jan 2026 10:08:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE5BE6074A;
	Wed, 14 Jan 2026 10:08:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFEF7103C8951;
	Wed, 14 Jan 2026 11:08:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768385308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z9hmPzenFNHaMEP2WOiENDOqLl4/pBzRMvq4zXQDd30=;
	b=GDEsWcN0OQmo0Xuf/4owyxd3IfW887wWvn+avOzD4aebrRZvNrcrd+7b+JuvSYf/BJ2o6y
	XIRcpeASb8PCAFWvW13V53ww6G0cRESJL1ONydT3pTPnkqlGmG5Vnk8GkyMM+nZD6hJq+G
	YjHdiw7GlND0SzDh6MFC1+1avZpJPzvWtDApAQci2AKko5jsCmwxcvh3wjpNaYEu74iBq0
	e/rxHVQAoVuKHA+lxL3W0mS/U/v0ZIIKQ7sD5vFM9QBgIEtrC/pSFi985sfqLAIyyx5l8m
	Wm0d2FaBgc1R1hO/tZQw8f/pw8h2Lfk2Q5VSnRmMfl84dJz8EzN8LCd2Kjz+8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 11:08:20 +0100
Message-Id: <DFO89S1NDME1.1644YSMOMAAJ6@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: Add ->detect_ctx hook and
 drm_bridge_detect_ctx()
Cc: <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Maud Spierings" <maud_spierings@hotmail.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Sandy Huang"
 <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>
X-Mailer: aerc 0.20.1
References: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
 <20260113-dw-hdmi-qp-scramb-v2-1-ae7b2c58d24d@collabora.com>
In-Reply-To: <20260113-dw-hdmi-qp-scramb-v2-1-ae7b2c58d24d@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_020832_007358_71DB6904 
X-CRM114-Status: GOOD (  29.92  )
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

Hello Cristian,

On Mon Jan 12, 2026 at 11:26 PM CET, Cristian Ciocaltea wrote:
> Add an atomic variant of the ->detect callback and a new helper to call
> the hook while passing an optional drm_modeset_acquire_ctx reference.
>
> When both ->detect_ctx and ->detect are defined, the latter is ignored.
> If acquire_ctx is unset, the function takes care of the locking,
> while also handling EDEADLK.
>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 58 ++++++++++++++++++++++++++++++++++++++=
++++++
>  include/drm/drm_bridge.h     | 30 +++++++++++++++++++++++
>  2 files changed, 88 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 6dcf8f6d3ecf..0ef12bf98011 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1344,6 +1344,64 @@ drm_bridge_detect(struct drm_bridge *bridge, struc=
t drm_connector *connector)
>  }
>  EXPORT_SYMBOL_GPL(drm_bridge_detect);
>
> +/**
> + * drm_bridge_detect_ctx - check if anything is attached to the bridge o=
utput
> + * @bridge: bridge control structure
> + * @connector: attached connector
> + * @ctx: acquire_ctx, or NULL to let this function handle locking
> + *
> + * If the bridge supports output detection, as reported by the
> + * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect_c=
tx
> + * or &drm_bridge_funcs.detect for the bridge and return the connection =
status.
> + * Otherwise return connector_status_unknown.
> + *
> + * When both @ctx and &drm_bridge_funcs.detect_ctx are not set, this hel=
per
> + * function is equivalent to drm_bridge_detect() above.
> + *
> + * RETURNS:
> + * The detection status on success, or connector_status_unknown if the b=
ridge
> + * doesn't support output detection.
> + * If @ctx is set, it might also return -EDEADLK.
> + */
> +int drm_bridge_detect_ctx(struct drm_bridge *bridge,
> +			  struct drm_connector *connector,
> +			  struct drm_modeset_acquire_ctx *ctx)

Shouldn't this new function return the same type as detect, i.e. enum
drm_connector_status?

Otherwise (see below)...

> +{
> +	if (!(bridge->ops & DRM_BRIDGE_OP_DETECT))
> +		return connector_status_unknown;
> +
> +	if (bridge->funcs->detect_ctx) {
> +		struct drm_modeset_acquire_ctx br_ctx;
> +		int ret;
> +
> +		if (ctx)
> +			return bridge->funcs->detect_ctx(bridge, connector, ctx);
> +
> +		drm_modeset_acquire_init(&br_ctx, 0);
> +retry:
> +		ret =3D drm_modeset_lock(&connector->dev->mode_config.connection_mutex=
,
> +				       &br_ctx);
> +		if (!ret)
> +			ret =3D bridge->funcs->detect_ctx(bridge, connector, &br_ctx);
> +
> +		if (ret =3D=3D -EDEADLK) {
> +			drm_modeset_backoff(&br_ctx);
> +			goto retry;
> +		}
> +
> +		if (ret < 0)
> +			ret =3D connector_status_unknown;
> +
> +		drm_modeset_drop_locks(&br_ctx);
> +		drm_modeset_acquire_fini(&br_ctx);
> +
> +		return ret;
> +	}
> +
> +	return bridge->funcs->detect(bridge, connector);

...here you're converting an enum into an int, which is ok-isk but not
ideal.

> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -664,6 +664,33 @@ struct drm_bridge_funcs {
>  	enum drm_connector_status (*detect)(struct drm_bridge *bridge,
>  					    struct drm_connector *connector);
>
> +	/**
> +	 * @detect_ctx:
> +	 *
> +	 * Check if anything is attached to the bridge output.
> +	 *
> +	 * This callback is optional, if not implemented the bridge will be
> +	 * considered as always having a component attached to its output.
> +	 * Bridges that implement this callback shall set the
> +	 * DRM_BRIDGE_OP_DETECT flag in their &drm_bridge->ops.
> +	 *
> +	 * This is the atomic version of &drm_bridge_funcs.detect.

I may be missing something, but I'm a bit puzzled by the "atomic" word
here. For other funcs in this struct there's the old non-atomic func X and
the new atomic_X func that receives a pointer to struct drm_atomic_state.

Here I think you are using "atomic" with a more generic meaning. Maybe we'd
better use another wording to not confuse readers?

> +	 *
> +	 * To avoid races against concurrent connector state updates, the
> +	 * helper libraries always call this with ctx set to a valid context,
> +	 * and &drm_mode_config.connection_mutex will always be locked with
> +	 * the ctx parameter set to this ctx. This allows taking additional
> +	 * locks as required.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * &drm_connector_status indicating the bridge output status,
> +	 * or the error code returned by drm_modeset_lock(), -EDEADLK.
> +	 */
> +	int (*detect_ctx)(struct drm_bridge *bridge,
> +			  struct drm_connector *connector,
> +			  struct drm_modeset_acquire_ctx *ctx);

As above, shouldn't this new func return the same type as detect?

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

