Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BADBE9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FI4iBPbexT5/+OX3ab+TBF6Dku2WJR7GpM9DDHrwsPk=; b=bVsXpYe2QtiiS/je281J/4j5YB
	uoAFQ/DWVNy3uI4Kz8jfHIwXVj73Vo3Ys1A+VCN7DK5IPiHOvIoSHjf8oKt/gxL7Se1wmjgyuJIag
	N/EHafhqams6pIzVUU7wyv7tM0AiiiwG9FlEpb/VZ2RmDYqQHZTwVfSA2DLds8tuf5DIoBhUb/Aq6
	9T2EgV8euQVmz0GzhuN7yLCVPtPkrJ/WVO4qKytGmohctfpa7+wgUSXDijcQN+w45cWnpO/jtGnYo
	pJjZ5ChEaeTwyOcO38Zfnk0YXjmw7RMOl4jojJt5IodMHj2eZytlhPOmZRHCksciKAIjErpsGGYFV
	d291BVfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2f0-0000000D1UY-0MSy;
	Mon, 02 Mar 2026 12:46:06 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2ey-0000000D1Tz-0BN1;
	Mon, 02 Mar 2026 12:46:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772455528; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gfFgLK0NcN+DF027ztokmuJzLGgp/Kn1kKJQXerb1I9GNL7TP2viyfn7ZsNRBylkQp9ZArN5yoUDZfVQOnHcS1VKyjbKIm7l2ZUlnIeeG1TJTgHXFS5fWyJyERvIGWVbAurIivEeblG+hhFtl+csYmU0AdSVhboLMsxNpoMEsyo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772455528; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FI4iBPbexT5/+OX3ab+TBF6Dku2WJR7GpM9DDHrwsPk=; 
	b=A9R2BAzoJPj4uCGn9AR23la5ihbXVAeayO35kYB7Lj+Cz3KNcjeDodl1UTwoDH+AW3GSjW1QkNS1C1m02AjDdU3RwgkT9kG0X8KMdsUfhaRBbxAbhLFJHbtSylmO9zO0uGCDSrtzs488v983GA/u911rzbevHSGHSLIOiGjj4IE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772455527;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=FI4iBPbexT5/+OX3ab+TBF6Dku2WJR7GpM9DDHrwsPk=;
	b=NklJGRmL7Ht1vVNs25ImFGldSXVhHZfLcvTkHo1UkVwxo+YmvptU5KSwoBLaKwcI
	8F/C/rYOF7LL5uRL3SWft23e8XNCzhZJlF4aT9q/cjC4NR+INLbrCfP48F4ndn/KZ+9
	c0F3vSfOqOkMW+KNDdJL7PAjYQ4ep4meusaEj670=
Received: by mx.zohomail.com with SMTPS id 177245552678992.73586677524838;
	Mon, 2 Mar 2026 04:45:26 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 03/19] drm/bridge: Act on the DRM color format property
Date: Mon, 02 Mar 2026 13:45:18 +0100
Message-ID: <2254957.irdbgypaU6@workhorse>
In-Reply-To: <unfsi4t4t4wl74zudkq3oeiryvm2xgyiplugcaxhyvjmtn7s2l@72xhl5vrtyt3>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-3-658c3b9db7ef@collabora.com>
 <unfsi4t4t4wl74zudkq3oeiryvm2xgyiplugcaxhyvjmtn7s2l@72xhl5vrtyt3>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_044604_130741_434B9BB2 
X-CRM114-Status: GOOD (  36.08  )
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

On Sunday, 1 March 2026 17:56:08 Central European Standard Time Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 08:20:08PM +0100, Nicolas Frattaroli wrote:
> > The new DRM color format property allows userspace to request a specific
> > color format on a connector. In turn, this fills the connector state's
> > color_format member to switch color formats.
> > 
> > Make drm_bridges consider the color_format set in the connector state
> > during the atomic bridge check. For bridges that represent HDMI bridges,
> > rely on whatever format the HDMI logic set. Reject any output bus
> > formats that do not correspond to the requested color format.
> > 
> > Non-HDMI last bridges with DRM_CONNECTOR_COLOR_FORMAT_AUTO set will end
> > up choosing the first output format that functions to make a whole
> > recursive bridge chain format selection succeed.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 89 +++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 88 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 6d8947419940..5938fba0a983 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -1117,6 +1117,47 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
> >  	return ret;
> >  }
> >  
> > +static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_connector_color_format fmt)
> > +{
> > +	if (fmt == DRM_CONNECTOR_COLOR_FORMAT_AUTO)
> > +		return true;
> > +
> > +	switch (bus_fmt) {
> > +	case MEDIA_BUS_FMT_FIXED:
> > +		return true;
> > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > +	case MEDIA_BUS_FMT_RGB101010_1X30:
> > +	case MEDIA_BUS_FMT_RGB121212_1X36:
> > +	case MEDIA_BUS_FMT_RGB161616_1X48:
> > +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_RGB444;
> > +	case MEDIA_BUS_FMT_YUV8_1X24:
> > +	case MEDIA_BUS_FMT_YUV10_1X30:
> > +	case MEDIA_BUS_FMT_YUV12_1X36:
> > +	case MEDIA_BUS_FMT_YUV16_1X48:
> > +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
> > +	case MEDIA_BUS_FMT_UYVY8_1X16:
> > +	case MEDIA_BUS_FMT_VYUY8_1X16:
> > +	case MEDIA_BUS_FMT_YUYV8_1X16:
> > +	case MEDIA_BUS_FMT_YVYU8_1X16:
> > +	case MEDIA_BUS_FMT_UYVY10_1X20:
> > +	case MEDIA_BUS_FMT_YUYV10_1X20:
> > +	case MEDIA_BUS_FMT_VYUY10_1X20:
> > +	case MEDIA_BUS_FMT_YVYU10_1X20:
> > +	case MEDIA_BUS_FMT_UYVY12_1X24:
> > +	case MEDIA_BUS_FMT_VYUY12_1X24:
> > +	case MEDIA_BUS_FMT_YUYV12_1X24:
> > +	case MEDIA_BUS_FMT_YVYU12_1X24:
> > +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
> > +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> > +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> > +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> > +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> > +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> >  /*
> >   * This function is called by &drm_atomic_bridge_chain_check() just before
> >   * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
> > @@ -1160,6 +1201,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
> >  	struct drm_encoder *encoder = bridge->encoder;
> >  	struct drm_bridge_state *last_bridge_state;
> >  	unsigned int i, num_out_bus_fmts = 0;
> > +	enum drm_connector_color_format fmt;
> >  	u32 *out_bus_fmts;
> >  	int ret = 0;
> >  
> > @@ -1201,13 +1243,58 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
> >  			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
> >  	}
> >  
> > +	/*
> > +	 * On HDMI connectors, use the output format chosen by whatever does the
> > +	 * HDMI logic. For everyone else, just trust that the bridge out_bus_fmts
> > +	 * are sorted by preference for %DRM_CONNECTOR_COLOR_FORMAT_AUTO, as
> > +	 * bus_format_is_color_fmt() always returns true for AUTO.
> > +	 */
> > +	if (last_bridge->ops & DRM_BRIDGE_OP_HDMI) {
> 
> This will break the logic if there is anything after the HDMI bridge.
> For example, if the board has hdmi-connector (yep, it's a bridge without
> DRM_BRIDGE_OP_HDMI, because HDMI connectors don't implement any of the
> HDMI functionality), then the function will go to the second clause.
> 
> This probably needs to be moved to drm_bridge_connector. There is is
> natural to check for bridge_connector->bridge_hdmi.

A few questions:
1. are all HDMI connectors drm_bridge_connectors? Or does the code need
   to handle two HDMI cases?
2. If by "This probably needs to be moved to drm_bridge_connector", do
   you mean the entire recursive bus format selection, or just a check
   for whether it's an HDMI connector that sets some flag on the
   drm_bridge?
3. I don't see any KUnit tests for drm_bridge_connector. Is adding those
   part of the requirements for getting this upstreamed?

Kind regards,
Nicolas Frattaroli

> 
> > +		drm_dbg_kms(last_bridge->dev,
> > +			    "HDMI bridge requests format %s\n",
> > +			    drm_hdmi_connector_get_output_format_name(
> > +				    conn_state->hdmi.output_format));
> > +		switch (conn_state->hdmi.output_format) {
> > +		case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> > +			fmt = DRM_CONNECTOR_COLOR_FORMAT_RGB444;
> > +			break;
> > +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
> > +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
> > +			break;
> > +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
> > +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
> > +			break;
> > +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> > +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
> > +			break;
> > +		default:
> > +			ret = -EINVAL;
> > +			goto out_free_bus_fmts;
> > +		}
> > +	} else {
> > +		fmt = conn_state->color_format;
> > +		drm_dbg_kms(last_bridge->dev, "Non-HDMI bridge requests format %d\n", fmt);
> > +	}
> > +
> >  	for (i = 0; i < num_out_bus_fmts; i++) {
> > +		if (!bus_format_is_color_fmt(out_bus_fmts[i], fmt)) {
> > +			drm_dbg_kms(last_bridge->dev,
> > +				    "Skipping bus format 0x%04x as it doesn't match format %d\n",
> > +				    out_bus_fmts[i], fmt);
> > +			ret = -ENOTSUPP;
> > +			continue;
> > +		}
> >  		ret = select_bus_fmt_recursive(bridge, last_bridge, crtc_state,
> >  					       conn_state, out_bus_fmts[i]);
> > -		if (ret != -ENOTSUPP)
> > +		if (ret != -ENOTSUPP) {
> > +			drm_dbg_kms(last_bridge->dev,
> > +				    "Found bridge chain ending with bus format 0x%04x\n",
> > +				    out_bus_fmts[i]);
> >  			break;
> > +		}
> >  	}
> >  
> > +out_free_bus_fmts:
> >  	kfree(out_bus_fmts);
> >  
> >  	return ret;
> > 
> 
> 





