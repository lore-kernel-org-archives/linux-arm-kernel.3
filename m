Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6787CE6B243
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5lmyVqAcscCP959nNU9KmldWtLT8p6H1eSCuTcg634=; b=QVeCWBiTQRtoyNkdVIXR6Pot33
	HfeX2phmJZXn+LY1WnJJjUv70837K7Hb0nlC4vi47ScJqcOQa6ZQxjjoKvtgev4oV6aj2HeSkTO5m
	d67cvZddygDoY84245peL7EuwOEVVCE/vPnPXltmUsWjMG3vZU5EJCv2TAT3TarC752pQaqo4Pljs
	j6mTogzcya0xlA3mBmda8iYxLeqOvLbTy1XwqdwceXxPRgmDF6ctl2d8kbrYJQUbXJ96GZePPnUG2
	tBvPV/SmdWBqvL68nlR+JXxqpCuyz+SDzRcioTyxgT2/ev+d+VFM6wWyc8w3HzHncD7ml+M0tEE9j
	UyxFMSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6pSr-00000006guM-1TTj;
	Fri, 01 Nov 2024 11:05:13 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6pNl-00000006g9O-0SP6;
	Fri, 01 Nov 2024 11:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730458797; x=1761994797;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ue70Ww36EcBDEZaGYurD6rsjfoEbrn4L9zEF9CmzN+A=;
  b=i36YJ/g/DPokbln/biWoGR5GmFjzc3VSWZCF9wLyHOMOZeC1tg0DpiPB
   VWjtOvMp5sBNc8/Y5Ki0Eim9js4BM0+zhU18LoxFPyOHUhR/GqAcsSNO6
   XZL7QsE8tfVAgMfyUVCi7t9r4h66vtczRFvgMMjZuGlHSJEZZYllcijnU
   4PZ3IQw51d7xnt+VODRpl7P3rRRLtYfCpDRnqlS0hbY/tuLDW4R51vupK
   YNZoZPAvaIU+rRkSRhwBQkL0a2HAPdJt1Dkr/iAzlAnCwYrYe4gREHRJV
   dyywK1xIjfluTkCwaGUBEhhN5mxi14bUqZuz/otNmf7ljsSsKGcmZUNJT
   g==;
X-CSE-ConnectionGUID: L6xzE2FMREeDHD5cWe11Fw==
X-CSE-MsgGUID: gCGJbBOJRDehWkrpMYp5Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29651798"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="29651798"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:59:53 -0700
X-CSE-ConnectionGUID: 6ur4aUqYSmO1fR4NBhLZlw==
X-CSE-MsgGUID: tT97F7GiSFm1AAgVezXLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83365995"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.234])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:59:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Phong LE <ple@baylibre.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King
 <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy
 Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH RFC v2 6/7] drm/display/hdmi: implement connector update
 functions
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-6-739ef9addf9e@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
 <20241101-drm-bridge-hdmi-connector-v2-6-739ef9addf9e@linaro.org>
Date: Fri, 01 Nov 2024 12:59:38 +0200
Message-ID: <871pzvjk2t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_035957_216389_A381EEA0 
X-CRM114-Status: GOOD (  25.28  )
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

On Fri, 01 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The HDMI Connectors need to perform a variety of tasks when the HDMI
> connector state changes. Such tasks include setting or invalidating CEC
> address, notifying HDMI codec driver, updating scrambler data, etc.
>
> Implementing such tasks in a driver-specific callbacks is error prone.
> Start implementing the generic helper function (currently handling only
> the HDMI Codec framework) to be used by driver utilizing HDMI Connector
> framework.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 56 +++++++++++++++++++++++++
>  include/drm/display/drm_hdmi_state_helper.h     |  4 ++
>  2 files changed, 60 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index feb7a3a759811aed70c679be8704072093e2a79b..dc9d0cc162b2197dcbadda26686a9c5652e74107 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -748,3 +748,59 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
> +
> +/**
> + * __drm_atomic_helper_connector_hdmi_update_edid - Update the HDMI Connector basing on passed EDID
> + * @connector: A pointer to the HDMI connector
> + * @drm_edid: EDID to process
> + *
> + * This function should be called as a part of the .detect() / .detect_ctx()
> + * and .force() callbacks, updating the HDMI-specific connector's data. The
> + * function consumes passed EDID, there is no need to free it afterwards. Most
> + * of the drivers should be able to use
> + * @drm_atomic_helper_connector_hdmi_update() instead.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int
> +__drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
> +					       const struct drm_edid *drm_edid)
> +{
> +	drm_edid_connector_update(connector, drm_edid);
> +	drm_edid_free(drm_edid);

Not fond of splitting resource management responsibilities
asymmetrically like this.

> +
> +	if (!drm_edid) {
> +		drm_connector_hdmi_codec_plugged_notify(connector, false);

Is it a good idea to tie connection status to EDID presence at the
helper level? Nearly the same, but still orthogonal.

> +
> +		// TODO: also handle CEC and scramber, HDMI sink disconnected.
> +
> +		return 0;
> +	}
> +
> +	drm_connector_hdmi_codec_plugged_notify(connector, true);
> +
> +	// TODO: also handle CEC and scramber, HDMI sink is now connected.
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_update_edid);

Feels wrong to export and document double underscored functions to
actually be used.

> +
> +/**
> + * drm_atomic_helper_connector_hdmi_update - Update the HDMI Connector after reading the EDID
> + * @connector: A pointer to the HDMI connector
> + *
> + * This function should be called as a part of the .detect() / .detect_ctx()
> + * and .force() callbacks, updating the HDMI-specific connector's data.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int
> +drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector)
> +{
> +	const struct drm_edid *drm_edid = drm_edid_read(connector);
> +
> +	return __drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update);
> diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
> index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..ea0980aa25cbbfdd36f44201888c139b0ee943da 100644
> --- a/include/drm/display/drm_hdmi_state_helper.h
> +++ b/include/drm/display/drm_hdmi_state_helper.h
> @@ -20,4 +20,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
>  int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
>  						       struct drm_atomic_state *state);
>  
> +int __drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
> +						   const struct drm_edid *drm_edid);
> +int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
> +
>  #endif // DRM_HDMI_STATE_HELPER_H_

-- 
Jani Nikula, Intel

