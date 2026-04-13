Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42598F531C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 19:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGJNTqTpWqTIYQ5/oBa0Qvlwsc/D9DZnqJmajGtr2Cc=; b=Ie/09Gae8tXUJhXwxH3Uzt3NTT
	w9K7YEbPQkj6TXaFFGf8bNfAeeKAUZEJp2I5PYAKZMK/WqwNmKIMAwNs1etRrh9JA6PfvLAi9y7N3
	WHJIcofiEkNRjD2O3y41xwVhawZkmrPKPVvm0YZKzxuzBlnxdr3ApTTvEtSmoCmSTiNePnxqpG3b9
	CzSQ1GZQbZr/sLAHyEGsjdtehRyjcSPdV7ImhUBt5OA3WIM3gR1lLZXoYRm0wyMpnMTh8Xs+vZ5Fh
	Z7RpzBZ4HZ3BrMa2592vV8Q8BnoN1MInSlQ6scESynUMDCmzpbYF2Mb/SRdDtaTy+x0IeDnv+1oJt
	m/KWJFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMa9-0000000GGPf-0CEv;
	Mon, 13 Apr 2026 19:04:25 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMa6-0000000GGPG-3pZU;
	Mon, 13 Apr 2026 19:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776107063; x=1807643063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=J6Oy2Os5lNI/CAxu9YtA3xPK4u5JL/xZobEDTIfkwz0=;
  b=OicepsB6UWypV3H80otaP7LXXry6ZFZijnTJyk84AOWGIOXAsjkS4PMW
   e3cfeMxE9vGNrl4+OvRbcpOBy0Xbi2pbpcc1cKuiGT6nqTvutK4h9tU5k
   Gt53SeuUrtDeZx2f5k7sbzSGsaK5JyT2xPA8zq93bXIAM86TmNud9nK88
   oHx/U4jFCPouKfnOgTzcAhyhhH4L2rpe2QsOYs2ITY/gR2u/DB1BnV1Or
   M9MWWRlwboaKqKV2/czRiJFHnsuDGKNNHuwXoQb+/FNZLu0XKmDZOw/RA
   jYdlgrYsTNM/ceEse3Zu/rax93LREOEYdWx53BJmcTxkztxaN0XSTEX1i
   w==;
X-CSE-ConnectionGUID: iUbHrimxT26UtrrjNtv8xg==
X-CSE-MsgGUID: NIThkndjRWOYDfG5aKw9eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="99698031"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="99698031"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:04:21 -0700
X-CSE-ConnectionGUID: s581NXHCRZmMfO6wEfwB2g==
X-CSE-MsgGUID: SbIpZcUdT/a1/749YLYoDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="234275702"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:04:11 -0700
Date: Mon, 13 Apr 2026 22:04:07 +0300
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
Message-ID: <ad0-J35F1kcyZjoG@intel.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
 <20260413-color-format-v13-11-ab37d4dfba48@collabora.com>
 <ad08zqpKbyF--Br3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad08zqpKbyF--Br3@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_120422_992264_A951D720 
X-CRM114-Status: GOOD (  22.99  )
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

On Mon, Apr 13, 2026 at 09:58:22PM +0300, Ville Syrjälä wrote:
> On Mon, Apr 13, 2026 at 12:07:25PM +0200, Nicolas Frattaroli wrote:
> > In anticipation of userspace being able to explicitly select supported
> > sink formats, add handling of the YCBCR444 sink format. The AUTO path
> > does not choose this format, but with explicit format selection added to
> > the driver, it becomes a possibility.
> > 
> > Check for YCBCR444 support on the sink in both sink_bpc_possible, and
> > sink_format_valid.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdmi.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > index 874076a29da4..5ab5b5f85cde 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > @@ -1966,6 +1966,8 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *_connector,
> >  
> >  		if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
> >  			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_36;
> > +		else if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR444)
> > +			return info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36;
> >  		else
> >  			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36;
> >  	case 10:
> > @@ -1974,6 +1976,8 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *_connector,
> >  
> >  		if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
> >  			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_30;
> > +		else if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR444)
> > +			return info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30;
> >  		else
> >  			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30;
> >  	case 8:
> > @@ -2038,6 +2042,11 @@ intel_hdmi_sink_format_valid(struct intel_connector *connector,
> >  
> >  		return MODE_OK;
> >  	case INTEL_OUTPUT_FORMAT_RGB:
> > +		return MODE_OK;
> > +	case INTEL_OUTPUT_FORMAT_YCBCR444:
> 
> We'll also want the !has_hdmi_sink check here like for 4:2:0.
> 
> And I think we also want something to mirror the ycbcr_420_allowed
> flag. I guess you could just make it something like:
> 
> intel_hdmi_ycbcr_444_allowed(display)
> {
> 	return DISPLAY_VER(display) >= 5 && !HAS_GMCH(display);

Actually the display version check is redundant there.
!HAS_GMCH alone is sufficient.

> }
> 
> That can also be reused when setting up the allowed property values.
> 
> > +		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)))
> > +			return MODE_BAD;
> > +
> >  		return MODE_OK;
> >  	default:
> >  		MISSING_CASE(sink_format);
> > 
> > -- 
> > 2.53.0
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Ville Syrjälä
Intel

