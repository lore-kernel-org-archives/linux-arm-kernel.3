Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11908106B529
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWVGdaROJEe59syGTJd027THFEoFG9QuDQ9XIoXDqcI=; b=zu8yoYozJJYsKbFU5qBoYa1lt0
	mHGOiQUYhwURbM65+0ktOzKF21iAuD44SK/0KLA34DYk3NtnwdowItWwhEGsda0kmvKIJB1TlkY7+
	1f6U8cuDnwpXjWoqzdM3i1lFJqV+tg4CIXKob2JNYqyGpuunnlorY1Ix5JGv3yCFruoHoxFxh07WN
	w2bUgNxvGy0MxaxnreRpSr8cGuyG0reOxQoNnLos3GQ8RBjnHGSZgQL6bJPKnFx3Gz8GcrTvy4UN3
	tYW+xZIBSAx1A52WszzS+hO3Wn/OHM3whUd5xxuNtWGXsQc/i5UOWaNizpqFtkVk9qxsASuY0xWmy
	JqbM9BKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ng6-00000003PGl-3VjU;
	Wed, 25 Mar 2026 12:49:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ng5-00000003PGC-135K
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Mar 2026 12:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VWVGdaROJEe59syGTJd027THFEoFG9QuDQ9XIoXDqcI=; b=UwsZW9bEkI/7n+v2HPBKbLB6Ob
	JJRWh3D3WJQpmgNRHNGcZSE8vqDrNmkOeLW1g/5ZL+Rz45bh67zoDr5E0wyVzWBwFfZqkwcFZxZa9
	bEVtrQ1GYu8YIGFJzaPGPFJOIpYZnV2UZfmmqSGgWj6JadkKEdvIq5gTMytHILlawxxWGTyOI3MCV
	rc9kMLcT+1/lEIbTMfeRnlGEhLfpvQ8ZlKcO2tDXkO9ooXlC4Ud8PTYQue4fk1zs6vnutnfAiZAw+
	R04d5yGGN56lzErOIMJVaiIGXuChWQw3fB36jRaKnjaS2wZV7msBgdl6S9tKUDSmSTilnbuPY3qf8
	Cj016oKw==;
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ng2-000000069ip-1WnT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:49:40 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-79a46ebe2beso59324727b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774442976; cv=none;
        d=google.com; s=arc-20240605;
        b=fqFLPHvLG1GTiAr0/imE7Fsf8vV3Di9nnKaa1A7hO16It8m+38Hvmul43XP0O45IQk
         Tj7bAYdN9F9KGGL+ZVu2K31EpUmHimpJYqaZDdMKQ+noVJ5AYgFWA/OTNGWTnZ4H+C2S
         IJyEbkh3kFiDeTc286AdbpSbWnm3ENA/hGPPRmV+UgbTHOdlAXdLB9othxU54EAyK9Jr
         x2aB169X/Yl3tN0dQwHrRTZdByFIgFLnxTAtkEk6NGvesgz3Zcskd6UcGlYTu8JZpXU4
         EbR/CUqd3/p4T91h3QGAPCFR2lB/77gHo1Kd7/wJ7jnIe/ZFv9xV/GY6EwrQ+QDBaPuY
         U9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VWVGdaROJEe59syGTJd027THFEoFG9QuDQ9XIoXDqcI=;
        fh=c48a/1JPyaBsRgGMwiR96bRDvrezLDlGHv+HJ+W+4h4=;
        b=YkqQjL4pCwPBPJWVuJTlmLUfBpYOwkW39biZ4cZUmmVFal0bOcgWopjSks4+1Pysxa
         QQYYZHnfUNUmC8Kmsdu7V7m1LnLmyikC5+qAgs+E8nCTP0BTbn+piE00AG99YzV1lbm1
         n0VuzwJUN3VBhZSCu7LGMsAI5DtA0OB2Lyxrsogg5FkvdIvxdGFibBGPvJf4yDqjLcL2
         48CzMHSHKCNQekktd8Kb7FAtVRj3iNs8eOn7w3Vi8moECD/1GNF04wZ396VDRhq5JMs0
         /LnxmOY4jrBtqKfMMOUnto5R/7CpYBYFfmcwbJTep4sSRZC1QNqmII9RSrr6F46EKIo7
         T8jQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1774442976; x=1775047776; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VWVGdaROJEe59syGTJd027THFEoFG9QuDQ9XIoXDqcI=;
        b=NKQQRUJNUBRhhWHn71cOzICalWi/ObdO6gqiNOMWrd91BlMhvZal9hSoobPOlzNIxQ
         p2rVH5+mwxOiDDSrM7QfAg3Ao5pkIXrB+Hk82SJoY/7z1O7xWnUalsZcyu0Mfiv0G2Pk
         OCNhA8pGhMEf6pRilSC5UoeLSghQA0yz1FXWpowEOksLbgqfcp1CYJ42DTFotWw8jN5e
         iZYWuDg8kyYc3nxAMccXfJAhn0+EjrwycwPOMqtZuDZQcXmdhZh1heXZT4TJUSiVgkRn
         zeRGgP4211OE801FRl4YlANzzF79AoJeSmr6eNsWsddRY9dx48sFvGREBdO4PShRUp6S
         0S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442976; x=1775047776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWVGdaROJEe59syGTJd027THFEoFG9QuDQ9XIoXDqcI=;
        b=Xmzx2nmfKomYzIWZyurB8Nwni4OSySExI5KUIeVI/CpqwAW4PO1+QcDpOpCOVq/iFK
         bJ4D9Nx8gO4vlsmoo+7vimrnJfhzwI7bDBmAM8sMJTWiUAafbw1o+YCETbMYiXHBIpeI
         GKDt/8AzFY5Yao0J6aBChVxS7M7i7eIJ9MxHNrzvZI8ga+3F5q25PW26NJppXqUJpwoG
         04nKyfSWpGWuQh3wXPb0kszZqsGvxavcr0nUaHUdpc77Qy3l2dNiAqPlmB7SOFWC/lL9
         Jg800htNWPn93+fEtS1Unnlsygm65LWsQVdHo3Mmw0aC0yvNskrpS8zKLhhbC+9eYz69
         TYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSqkPqFn3GxY2HsBZqJsj2grk0g5ze7qXBudxSWsB27n7dWR1+svWj/F5IAJHOf9B+IyE9CK5FTQ0/wR8JF9WT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq6zBJSUMZFaD+VCBHEaCRSkbFLqzko3uebpQEWdkrCHX5p8+9
	fpiwrmdmnGGF2UCVSNTIFiJojNK10sE9r3hnvMi6uIZHajvWVi3MYg073yszrtilj6R2CN8kenQ
	wvXFbvqSDMyvw1q7Yzmt4X29kT2y6BfhiB65w9n7OOA==
X-Gm-Gg: ATEYQzwG9DueSQYREtoNbv6aGdPjMPzAm3UuLIqPO88KjDFkq31uywKOW62wckJn1Gy
	cuifVzKF4V9kAxaE3RPrgr9SQamw3PIwLEYk6xfH7rSnehnRCE1s+FOyQxqMXQObNuwL+1NRXjO
	tbiMV4MbCqbYR585EhvzWmHdc3Ef544H/qio3h/OjQMivzxxCPdJKvdDhvZTq6R9gQqb4/f4i/8
	VwltgmRraxs/IMl4M7PCws/+ALEub/0Yo/cNJnqWUzq8TKctdrKewlT3OOdG0uUfREkSWFdzFLC
	5iEzl35Qk5xLcqtFp210+1Dqew9CIquvxkftyA==
X-Received: by 2002:a05:690c:e3cf:b0:79a:b71c:9c18 with SMTP id
 00721157ae682-79acf6d3fafmr34648757b3.54.1774442975702; Wed, 25 Mar 2026
 05:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com> <20260324-color-format-v11-3-605559af4fb4@collabora.com>
In-Reply-To: <20260324-color-format-v11-3-605559af4fb4@collabora.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 25 Mar 2026 12:49:19 +0000
X-Gm-Features: AaiRm50VNDDjWfwK37zgUxzAmL4en6__7Zy6-AnLTnIOsCvoTh1nsZLCZm3Xzfc
Message-ID: <CAPY8ntB9f_=f5kru=8w9BpTuqQR+93maGpT61EKU28Uay2vq8Q@mail.gmail.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Werner Sembach <wse@tuxedocomputers.com>, Andri Yngvason <andri@yngvason.is>, 
	Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_124938_595375_021FB231 
X-CRM114-Status: GOOD (  31.93  )
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

On Tue, 24 Mar 2026 at 16:02, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Add a new general DRM property named "color format" which can be used by
> userspace to request the display driver to output a particular color
> format.
>
> Possible options are:
>     - auto (setup by default, driver internally picks the color format)
>     - rgb
>     - ycbcr444
>     - ycbcr422
>     - ycbcr420
>
> Drivers should advertise from this list which formats they support.
> Together with this list and EDID data from the sink we should be able
> to relay a list of usable color formats to users to pick from.
>
> Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Co-developed-by: Andri Yngvason <andri@yngvason.is>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |   5 ++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  11 ++++
>  drivers/gpu/drm/drm_connector.c     | 108 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h         | 104 ++++++++++++++++++++++++++++++++++
>  4 files changed, 228 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 26953ed6b53e..b7753454b777 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -737,6 +737,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>                         if (old_connector_state->max_requested_bpc !=
>                             new_connector_state->max_requested_bpc)
>                                 new_crtc_state->connectors_changed = true;
> +
> +                       if (old_connector_state->color_format !=
> +                           new_connector_state->color_format)
> +                               new_crtc_state->connectors_changed = true;
> +
>                 }
>
>                 if (funcs->atomic_check)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 5bd5bf6661df..dee510c85e59 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -935,6 +935,15 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>                 state->privacy_screen_sw_state = val;
>         } else if (property == connector->broadcast_rgb_property) {
>                 state->hdmi.broadcast_rgb = val;
> +       } else if (property == connector->color_format_property) {
> +               if (val > INT_MAX || !drm_connector_color_format_valid(val)) {
> +                       drm_dbg_atomic(connector->dev,
> +                                      "[CONNECTOR:%d:%s] unknown color format %llu\n",
> +                                      connector->base.id, connector->name, val);
> +                       return -EINVAL;
> +               }
> +
> +               state->color_format = val;
>         } else if (connector->funcs->atomic_set_property) {
>                 return connector->funcs->atomic_set_property(connector,
>                                 state, property, val);
> @@ -1020,6 +1029,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>                 *val = state->privacy_screen_sw_state;
>         } else if (property == connector->broadcast_rgb_property) {
>                 *val = state->hdmi.broadcast_rgb;
> +       } else if (property == connector->color_format_property) {
> +               *val = state->color_format;
>         } else if (connector->funcs->atomic_get_property) {
>                 return connector->funcs->atomic_get_property(connector,
>                                 state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 47dc53c4a738..e848374dee0b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1388,6 +1388,18 @@ static const u32 hdmi_colorspaces =
>         BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
>         BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
>
> +static const u32 hdmi_colorformats =
> +       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
> +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
> +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
> +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
> +
> +static const u32 dp_colorformats =
> +       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
> +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
> +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
> +       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
> +
>  /*
>   * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding/Colorimetry
>   * Format Table 2-120
> @@ -2940,6 +2952,102 @@ int drm_connector_attach_colorspace_property(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_connector_attach_colorspace_property);
>
> +/**
> + * drm_connector_attach_color_format_property - create and attach color format property
> + * @connector: connector to create the color format property on
> + * @supported_color_formats: bitmask of bit-shifted &enum drm_output_color_format
> + *                           values the connector supports
> + *
> + * Called by a driver to create a color format property. The property is
> + * attached to the connector automatically on success.
> + *
> + * @supported_color_formats should only include color formats the connector
> + * type can actually support.
> + *
> + * Returns:
> + * 0 on success, negative errno on error
> + */
> +int drm_connector_attach_color_format_property(struct drm_connector *connector,
> +                                              unsigned long supported_color_formats)
> +{
> +       struct drm_device *dev = connector->dev;
> +       struct drm_prop_enum_list enum_list[DRM_CONNECTOR_COLOR_FORMAT_COUNT];
> +       unsigned int i = 0;
> +       unsigned long fmt;
> +
> +       if (connector->color_format_property)
> +               return 0;
> +
> +       if (!supported_color_formats) {
> +               drm_err(dev, "No supported color formats provided on [CONNECTOR:%d:%s]\n",
> +                       connector->base.id, connector->name);
> +               return -EINVAL;
> +       }
> +
> +       if (supported_color_formats & ~GENMASK(DRM_OUTPUT_COLOR_FORMAT_COUNT - 1, 0)) {
> +               drm_err(dev, "Unknown color formats provided on [CONNECTOR:%d:%s]\n",
> +                       connector->base.id, connector->name);
> +               return -EINVAL;
> +       }
> +
> +       switch (connector->connector_type) {
> +       case DRM_MODE_CONNECTOR_HDMIA:
> +       case DRM_MODE_CONNECTOR_HDMIB:
> +               if (supported_color_formats & ~hdmi_colorformats) {
> +                       drm_err(dev, "Color formats not allowed for HDMI on [CONNECTOR:%d:%s]\n",
> +                               connector->base.id, connector->name);
> +                       return -EINVAL;
> +               }
> +               break;
> +       case DRM_MODE_CONNECTOR_DisplayPort:
> +       case DRM_MODE_CONNECTOR_eDP:
> +               if (supported_color_formats & ~dp_colorformats) {
> +                       drm_err(dev, "Color formats not allowed for DP on [CONNECTOR:%d:%s]\n",
> +                               connector->base.id, connector->name);
> +                       return -EINVAL;
> +               }
> +               break;
> +       }
> +
> +       enum_list[0].name = "AUTO";
> +       enum_list[0].type = DRM_CONNECTOR_COLOR_FORMAT_AUTO;
> +
> +       for_each_set_bit(fmt, &supported_color_formats, DRM_OUTPUT_COLOR_FORMAT_COUNT) {
> +               switch (fmt) {
> +               case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> +                       enum_list[++i].type = DRM_CONNECTOR_COLOR_FORMAT_RGB444;
> +                       break;
> +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
> +                       enum_list[++i].type = DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
> +                       break;
> +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
> +                       enum_list[++i].type = DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
> +                       break;
> +               case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> +                       enum_list[++i].type = DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
> +                       break;
> +               default:
> +                       drm_warn(dev, "Unknown supported format %ld on [CONNECTOR:%d:%s]\n",
> +                                fmt, connector->base.id, connector->name);
> +                       continue;
> +               }
> +               enum_list[i].name = drm_hdmi_connector_get_output_format_name(fmt);
> +       }
> +
> +       connector->color_format_property =
> +               drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "color format",
> +                                        enum_list, i + 1);
> +
> +       if (!connector->color_format_property)
> +               return -ENOMEM;
> +
> +       drm_object_attach_property(&connector->base, connector->color_format_property,
> +                                  DRM_CONNECTOR_COLOR_FORMAT_AUTO);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_color_format_property);
> +
>  /**
>   * drm_connector_atomic_hdr_metadata_equal - checks if the hdr metadata changed
>   * @old_state: old connector state to compare
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index af8b92d2d5b7..bd549f912b76 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -571,14 +571,102 @@ enum drm_colorspace {
>   *   YCbCr 4:2:2 output format (ie. with horizontal subsampling)
>   * @DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
>   *   YCbCr 4:2:0 output format (ie. with horizontal and vertical subsampling)
> + * @DRM_OUTPUT_COLOR_FORMAT_COUNT:
> + *   Number of valid output color format values in this enum
>   */
>  enum drm_output_color_format {
>         DRM_OUTPUT_COLOR_FORMAT_RGB444 = 0,
>         DRM_OUTPUT_COLOR_FORMAT_YCBCR444,
>         DRM_OUTPUT_COLOR_FORMAT_YCBCR422,
>         DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
> +       DRM_OUTPUT_COLOR_FORMAT_COUNT,
>  };
>
> +/**
> + * enum drm_connector_color_format - Connector Color Format Request
> + *
> + * This enum, unlike &enum drm_output_color_format, is used to specify requests
> + * for a specific color format on a connector through the DRM "color format"
> + * property. The difference is that it has an "AUTO" value to specify that
> + * no specific choice has been made.
> + */
> +enum drm_connector_color_format {
> +       /**
> +        * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display protocol
> +        * helpers should pick a suitable color format. All implementations of a
> +        * specific display protocol must behave the same way with "AUTO", but
> +        * different display protocols do not necessarily have the same "AUTO"
> +        * semantics.
> +        *
> +        * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if the
> +        * bandwidth required for full-scale RGB is not available, or the mode
> +        * is YCbCr 4:2:0-only, as long as the mode and output both support
> +        * YCbCr 4:2:0.

Is there a reason you propose dropping back to YCbCr 4:2:0 without
trying YCbCr 4:2:2 first? Minimising the subsampling is surely
beneficial, and vc4 for one can do 4:2:2 but not 4:2:0.

  Dave

> +        *
> +        * For display protocols other than HDMI, the recursive bridge chain
> +        * format selection picks the first chain of bridge formats that works,
> +        * as has already been the case before the introduction of the "color
> +        * format" property. Non-HDMI bridges should therefore either sort their
> +        * bus output formats by preference, or agree on a unified auto format
> +        * selection logic that's implemented in a common state helper (like
> +        * how HDMI does it).
> +        */
> +       DRM_CONNECTOR_COLOR_FORMAT_AUTO = 0,
> +
> +       /**
> +        * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> +        */
> +       DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> +
> +       /**
> +        * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output format (ie.
> +        * not subsampled)
> +        */
> +       DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> +
> +       /**
> +        * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output format (ie.
> +        * with horizontal subsampling)
> +        */
> +       DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> +
> +       /**
> +        * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output format (ie.
> +        * with horizontal and vertical subsampling)
> +        */
> +       DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
> +
> +       /**
> +        * @DRM_CONNECTOR_COLOR_FORMAT_COUNT: Number of valid connector color
> +        * format values in this enum
> +        */
> +       DRM_CONNECTOR_COLOR_FORMAT_COUNT,
> +};
> +
> +/**
> + * drm_connector_color_format_valid - Validate drm_connector_color_format value
> + * @fmt: value to check against all values of &enum drm_connector_color_format
> + *
> + * Checks whether the passed in value of @fmt is one of the allowable values in
> + * &enum drm_connector_color_format.
> + *
> + * Returns: %true if it's a valid value for the enum, %false otherwise.
> + */
> +static inline bool __pure
> +drm_connector_color_format_valid(enum drm_connector_color_format fmt)
> +{
> +       switch (fmt) {
> +       case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
> +       case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
> +       case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
> +       case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
> +       case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}
> +
>  const char *
>  drm_hdmi_connector_get_output_format_name(enum drm_output_color_format fmt);
>
> @@ -1129,6 +1217,13 @@ struct drm_connector_state {
>          */
>         enum drm_colorspace colorspace;
>
> +       /**
> +        * @color_format: State variable for Connector property to request
> +        * color format change on Sink. This is most commonly used to switch
> +        * between RGB to YUV and vice-versa.
> +        */
> +       enum drm_connector_color_format color_format;
> +
>         /**
>          * @writeback_job: Writeback job for writeback connectors
>          *
> @@ -2127,6 +2222,12 @@ struct drm_connector {
>          */
>         struct drm_property *colorspace_property;
>
> +       /**
> +        * @color_format_property: Connector property to set the suitable
> +        * color format supported by the sink.
> +        */
> +       struct drm_property *color_format_property;
> +
>         /**
>          * @path_blob_ptr:
>          *
> @@ -2610,6 +2711,9 @@ bool drm_connector_has_possible_encoder(struct drm_connector *connector,
>                                         struct drm_encoder *encoder);
>  const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
>
> +int drm_connector_attach_color_format_property(struct drm_connector *connector,
> +                                              unsigned long supported_color_formats);
> +
>  /**
>   * drm_for_each_connector_iter - connector_list iterator macro
>   * @connector: &struct drm_connector pointer used as cursor
>
> --
> 2.53.0
>

