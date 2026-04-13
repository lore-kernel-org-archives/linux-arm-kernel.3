Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0143F531C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MaTCH4UAzBLtav7IwhrqYDPxTENuRUi8lQLCR9KHqw=; b=guHo+GBJxp+uCcb0hsDoNbFD/x
	KgKxFrdOEBtp3GH+SV5t/n7RkFTbWhwapJfs/gtgvmrdPml/Qx1fGisS9ADCAoCIzMOnxeHSTn8mL
	kVSaY3OQi2e0ZtsRdbxyjuYaykJDu61qrkstcPO4MDqxxju+/4B5awM+LzOVYV2MaU79CZEcNqMzv
	olhyDNdQhjl916tFNfj/bgL6xEOQASE1ZC08W0bb0TlKme6p+iG1q5a6jXh3E6LlLHAeHbbT28LEK
	vzb3ZqN+eR4cUoGaGVaZpa7EcCplLlSnGIstwRnZmRCkX4cdGW1mt9WJiVtFHD9hv+pZ0qivcB7Wz
	sU1MXKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMUd-0000000GFIT-17nA;
	Mon, 13 Apr 2026 18:58:43 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMUb-0000000GFH9-02Yz;
	Mon, 13 Apr 2026 18:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776106721; x=1807642721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=G2euJdDLSGI1AgeMMOPf+n8HzOsAs0MY5JsKd9Nn1y0=;
  b=VgnalwkeSG9DlttEphbKkhu5HqC30Y6WrBlobRi0y76IUvcc474f93Ot
   EaH4AOEnhY6vbHpcHIGMWcNF8wG0T3EWQh2pE+S9hLaHYT/ZnZCP4iXGK
   pknPtfRr6nCJIuAGE/YqEYLdE6MUvGHhlw6J8fksyS9qQKZgzcw6XaU95
   NiSX8Bu5YQVNlIw9VmBFITn0OOGwnaVFKGuRoXIyRZleD4staMhcZ5lot
   XKPrKdvPD48EAFZSmKsKM4HySspax+cITavyAMylad1IgLDyEhEpOsL/2
   ajH8RbLqLa3x757OL51rvUwXrM1rkqRslyyB+bWPh4SfUr4QgWYiowzGp
   A==;
X-CSE-ConnectionGUID: 3SB4dqGyT7eU0w2sXRPB8A==
X-CSE-MsgGUID: 1HR66iySShW3CgcNWTzmHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="99697373"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="99697373"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 11:58:37 -0700
X-CSE-ConnectionGUID: lgk8/XHyQTiEOVbWVCgYAg==
X-CSE-MsgGUID: FSL3yA18QpKQaJN/d5mFiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="228829346"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 11:58:26 -0700
Date: Mon, 13 Apr 2026 21:58:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v13 11/27] drm/i915/hdmi: Add YCBCR444 handling for sink
 formats
Message-ID: <ad08zqpKbyF--Br3@intel.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
 <20260413-color-format-v13-11-ab37d4dfba48@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413-color-format-v13-11-ab37d4dfba48@collabora.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_115841_104197_D1F325E6 
X-CRM114-Status: GOOD (  19.22  )
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

On Mon, Apr 13, 2026 at 12:07:25PM +0200, Nicolas Frattaroli wrote:
> In anticipation of userspace being able to explicitly select supported
> sink formats, add handling of the YCBCR444 sink format. The AUTO path
> does not choose this format, but with explicit format selection added to
> the driver, it becomes a possibility.
> 
> Check for YCBCR444 support on the sink in both sink_bpc_possible, and
> sink_format_valid.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 874076a29da4..5ab5b5f85cde 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1966,6 +1966,8 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *_connector,
>  
>  		if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
>  			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_36;
> +		else if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR444)
> +			return info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36;
>  		else
>  			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36;
>  	case 10:
> @@ -1974,6 +1976,8 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *_connector,
>  
>  		if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
>  			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_30;
> +		else if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR444)
> +			return info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30;
>  		else
>  			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30;
>  	case 8:
> @@ -2038,6 +2042,11 @@ intel_hdmi_sink_format_valid(struct intel_connector *connector,
>  
>  		return MODE_OK;
>  	case INTEL_OUTPUT_FORMAT_RGB:
> +		return MODE_OK;
> +	case INTEL_OUTPUT_FORMAT_YCBCR444:

We'll also want the !has_hdmi_sink check here like for 4:2:0.

And I think we also want something to mirror the ycbcr_420_allowed
flag. I guess you could just make it something like:

intel_hdmi_ycbcr_444_allowed(display)
{
	return DISPLAY_VER(display) >= 5 && !HAS_GMCH(display);
}

That can also be reused when setting up the allowed property values.

> +		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)))
> +			return MODE_BAD;
> +
>  		return MODE_OK;
>  	default:
>  		MISSING_CASE(sink_format);
> 
> -- 
> 2.53.0

-- 
Ville Syrjälä
Intel

