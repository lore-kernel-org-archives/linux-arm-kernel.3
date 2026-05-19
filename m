Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413AACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6bJZDYJT83Yengys4nY8WqNTTAiIaKBsz2clDdAmEE=; b=W+KATonT2hff5dU0yIo+XK9vLP
	ruQgxSKQl19Dng59x3OjK77Jf4sCGi/s8d53F2WIxiLLLTomJ4xmtAXUoZvJ9CrvGy9I18RQpK2bI
	Oap9jzLazoT7IX21MjlmgEYjoDySxRnMrm/bTGl0s+kBgHmNEeqXYAG8q/vg5HnTIyON6b8oIo82L
	ZBywSVdXTO2Yi1PKOgvJ8UP9lmYVEDV6hLvVI+4URd0ve7K0FgIn7WSOBNczXLB52kuPF6L29CzRv
	Ui3Ncb/1hMKNVgccKuSqE0JckIAtZXiC+Q0AMsamIdczPNmtI37WrpLAq7vo9L97mKVpr59YkRO69
	DVlPG0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPE62-00000000Mvt-1Agh;
	Tue, 19 May 2026 06:38:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPE60-00000000MvP-2oYk;
	Tue, 19 May 2026 06:38:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21A3460052;
	Tue, 19 May 2026 06:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2782BC2BCB3;
	Tue, 19 May 2026 06:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779172707;
	bh=cjYVbPJQCGhm17FuSh8gv8edfxPU3cXLLZYrNXSnF3o=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=YL27wRlQWuRGTjLPbFmIwp65kOtw/48RGsAWfmBZzvFHgtx9fGauj2FzjYQEv4Lc9
	 T1vK6/kpRGSyvmYiL1h8RzPxBTPaofkURJrt/wi9Z+kxZ8uo/f8Db8qpsqmeK66NVW
	 FuBsRENvddT7ULqmvMWCWpVpLDCRUT/1RefPk4CfJw89JPoD7qtOSqxRx02xu/YfjF
	 NyC2lHHO9qxm01QZb20IkIT1H+Qi/RPpwRcKM8oKOAzGlW9s1mHDId/dz3DK5FdxIT
	 CPkkPSsq08y8HBc1IInhFG+4u2y6VqgxoL1Aw0Yt0Q+Viq/iW1Ha/rfv7c9aGjMfNc
	 ZJhG1edm+zKZA==
Message-ID: <0133e67b-0c85-4805-87a6-7fe30f9856f2@kernel.org>
Date: Tue, 19 May 2026 08:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 06/13] drm/meson: encoder_hdmi: Use bridge connector CEC
 notifier
To: Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20260518194744.2483580-1-jonas@kwiboo.se>
 <20260518194744.2483580-7-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518194744.2483580-7-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 18/05/2026 21:47, Jonas Karlman wrote:
> The dw-hdmi bridge detect() func now updates EDID and CEC phys addr for
> the connector and any registered generic CEC notifier.
> 
> Replace the open-coded CEC notifier handling with use of the bridge CEC
> notifier op.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/gpu/drm/meson/Kconfig              |  1 +
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c | 85 +++++-----------------
>  2 files changed, 19 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
> index 417f79829cf8..0dc5ca21e4fc 100644
> --- a/drivers/gpu/drm/meson/Kconfig
> +++ b/drivers/gpu/drm/meson/Kconfig
> @@ -13,6 +13,7 @@ config DRM_MESON
>  	select REGMAP_MMIO
>  	select MESON_CANVAS
>  	select CEC_CORE if CEC_NOTIFIER
> +	select DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER if CEC_NOTIFIER
>  
>  config DRM_MESON_DW_HDMI
>  	tristate "HDMI Synopsys Controller support for Amlogic Meson Display"
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 1b9a1d9ed3d3..45104ef35344 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -16,8 +16,6 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  
> -#include <media/cec-notifier.h>
> -
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
> @@ -41,7 +39,6 @@ struct meson_encoder_hdmi {
>  	struct drm_connector *connector;
>  	struct meson_drm *priv;
>  	unsigned long output_bus_fmt;
> -	struct cec_notifier *cec_notifier;
>  };
>  
>  #define bridge_to_meson_encoder_hdmi(x) \
> @@ -57,14 +54,6 @@ static int meson_encoder_hdmi_attach(struct drm_bridge *bridge,
>  				 &encoder_hdmi->bridge, flags);
>  }
>  
> -static void meson_encoder_hdmi_detach(struct drm_bridge *bridge)
> -{
> -	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> -
> -	cec_notifier_conn_unregister(encoder_hdmi->cec_notifier);
> -	encoder_hdmi->cec_notifier = NULL;
> -}
> -
>  static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>  					const struct drm_display_mode *mode)
>  {
> @@ -321,27 +310,9 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
>  	return 0;
>  }
>  
> -static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
> -					  struct drm_connector *connector,
> -					  enum drm_connector_status status)
> -{
> -	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> -
> -	if (!encoder_hdmi->cec_notifier)
> -		return;
> -
> -	if (status == connector_status_connected)
> -		cec_notifier_set_phys_addr(encoder_hdmi->cec_notifier,
> -					   connector->display_info.source_physical_address);
> -	else
> -		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
> -}
> -
>  static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
>  	.attach = meson_encoder_hdmi_attach,
> -	.detach = meson_encoder_hdmi_detach,
>  	.mode_valid = meson_encoder_hdmi_mode_valid,
> -	.hpd_notify = meson_encoder_hdmi_hpd_notify,
>  	.atomic_enable = meson_encoder_hdmi_atomic_enable,
>  	.atomic_disable = meson_encoder_hdmi_atomic_disable,
>  	.atomic_get_input_bus_fmts = meson_encoder_hdmi_get_inp_bus_fmts,
> @@ -374,9 +345,9 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>  
>  	meson_encoder_hdmi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
>  	if (!meson_encoder_hdmi->bridge.next_bridge) {
> -		ret = dev_err_probe(priv->dev, -EPROBE_DEFER,
> -				    "Failed to find HDMI transceiver bridge\n");
> -		goto err_put_node;
> +		of_node_put(remote);
> +		return dev_err_probe(priv->dev, -EPROBE_DEFER,
> +				     "Failed to find HDMI transceiver bridge\n");
>  	}
>  
>  	/* HDMI Encoder Bridge */
> @@ -384,6 +355,13 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>  	meson_encoder_hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  	meson_encoder_hdmi->bridge.interlace_allowed = true;
>  
> +	pdev = of_find_device_by_node(remote);
> +	of_node_put(remote);
> +	if (pdev) {
> +		meson_encoder_hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER;
> +		meson_encoder_hdmi->bridge.hdmi_cec_dev = &pdev->dev;
> +	}
> +
>  	drm_bridge_add(&meson_encoder_hdmi->bridge);
>  
>  	meson_encoder_hdmi->priv = priv;
> @@ -391,30 +369,24 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>  	/* Encoder */
>  	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
>  				      DRM_MODE_ENCODER_TMDS);
> -	if (ret) {
> -		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
> -		goto err_put_node;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
>  
>  	meson_encoder_hdmi->encoder.possible_crtcs = BIT(0);
>  
>  	/* Attach HDMI Encoder Bridge to Encoder */
>  	ret = drm_bridge_attach(&meson_encoder_hdmi->encoder, &meson_encoder_hdmi->bridge, NULL,
>  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -	if (ret) {
> -		dev_err_probe(priv->dev, ret, "Failed to attach bridge\n");
> -		goto err_put_node;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret, "Failed to attach bridge\n");
>  
>  	/* Initialize & attach Bridge Connector */
>  	meson_encoder_hdmi->connector = drm_bridge_connector_init(priv->drm,
>  							&meson_encoder_hdmi->encoder);
> -	if (IS_ERR(meson_encoder_hdmi->connector)) {
> -		ret = dev_err_probe(priv->dev,
> -				    PTR_ERR(meson_encoder_hdmi->connector),
> -				    "Unable to create HDMI bridge connector\n");
> -		goto err_put_node;
> -	}
> +	if (IS_ERR(meson_encoder_hdmi->connector))
> +		return dev_err_probe(priv->dev,
> +				     PTR_ERR(meson_encoder_hdmi->connector),
> +				     "Unable to create HDMI bridge connector\n");
>  
>  	/*
>  	 * We should have now in place:
> @@ -437,32 +409,11 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>  	/* Handle this here until handled by drm_bridge_connector_init() */
>  	meson_encoder_hdmi->connector->ycbcr_420_allowed = true;
>  
> -	pdev = of_find_device_by_node(remote);
> -	of_node_put(remote);
> -	if (pdev) {
> -		struct cec_connector_info conn_info;
> -		struct cec_notifier *notifier;
> -
> -		cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
> -
> -		notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
> -		if (!notifier) {
> -			put_device(&pdev->dev);
> -			return -ENOMEM;
> -		}
> -
> -		meson_encoder_hdmi->cec_notifier = notifier;
> -	}
> -
>  	priv->encoders[MESON_ENC_HDMI] = meson_encoder_hdmi;
>  
>  	dev_dbg(priv->dev, "HDMI encoder initialized\n");
>  
>  	return 0;
> -
> -err_put_node:
> -	of_node_put(remote);
> -	return ret;
>  }
>  
>  void meson_encoder_hdmi_remove(struct meson_drm *priv)


