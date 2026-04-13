Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD71F34C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 13:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfJiWGe2kIkQWAkTYxmpkGmmO/Joz+O6eiGHv6/CZUA=; b=x+IlHvNzYEUkFVqV3VMfpGRqXM
	Z/SAG/pU1P6dky6DBryT+Y7PwHNTb1RpgsIxuwJbNXGqHZ401SYVtploV1WEHrkYCN4dd27+JzGGD
	1ZJKqvUcQB5p7SVBH+3FRvpjElunzZpIYDqJOexOv/rzq4MHqrlK/fCzjJDAkCnMA+d7djfhxKwlD
	rh2lh/tAUTOZV9EZy2BCAM0X3WexEE9zcIpSW/k6PyJ/pF//SkCGjDrRvp4wEdVkBwtvlo0ej+sgo
	aztiCvgk35hH4CyT4i5Ch5Tl3x08hwJVn1W0N283dezG18z6V6yY1V2JnJ7x1JrMLuj7WcmZh+kfT
	9Xqa/3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHat-0000000Fllh-0TR8;
	Mon, 13 Apr 2026 13:44:51 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHap-0000000FlkC-3uci;
	Mon, 13 Apr 2026 13:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776087888; x=1807623888;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=bwYzFLwNI/6vkN2Gr87qcyFT2sZ3FS9khYUkjNw8l7w=;
  b=Sd2W0/9GzNM9sF1H3Y2nG9zZE7BeYwpKiPzsOpDMXlrwogB5KIQZnmHV
   A3Gc76uu6FcozQAbk7fCW+g7eJlyvIk6Fw/JsNiDw7t+y2ANFStZzBP3B
   MAT3HDT0SPg9OIq6e0aNeVvpr4UpoZwaD1ynYGxDjPSXpVqX4R+0vNW56
   SRvIli2rk6Sz/oP6cDju1UZzCgI4LgTGYax1ZEeHCBHQ0+gR/JpMPIBxG
   f7B6NACMlwg2CSYEy2ZLnNSs8OvsQf3ob74Y7+sX/Jg+921oFNMwxTeSr
   Nn9eNIe7lcDAriPJmA3G97rIN0btpPCA1kgrQ3HBAZ5CtK815d/dOB24+
   w==;
X-CSE-ConnectionGUID: gSLXqgdWT52uNoya41N6cg==
X-CSE-MsgGUID: K+cdpwpVRq2v5fsWaPB+yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76054059"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="76054059"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 06:44:47 -0700
X-CSE-ConnectionGUID: VahvDtdgSLm7wLxRfMucwg==
X-CSE-MsgGUID: Wxk30IYOQ8aSMIfHnlgd9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="260228725"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.182])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 06:44:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave
 Airlie <airlied@redhat.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Eric
 Anholt <eric@anholt.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Mark Yacoub <markyacoub@google.com>, Sean
 Paul <seanpaul@google.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH RFC 10/12] drm/i915/display/dp: Adopt dp_connector
 helpers to expose link training state
In-Reply-To: <20260413153436.2a08be28@kmaincent-XPS-13-7390>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <20260409-feat_link_cap-v1-10-7069e8199ce2@bootlin.com>
 <e253ca4fa0b493032a7b35a0a20689b9d9e0c4e7@intel.com>
 <20260413143402.76f5c3c9@kmaincent-XPS-13-7390>
 <9f4bb4501c4885f432cbe9b6a10b7d27e40b0876@intel.com>
 <20260413153436.2a08be28@kmaincent-XPS-13-7390>
Date: Mon, 13 Apr 2026 16:44:34 +0300
Message-ID: <d2ac83145ffda0c77692b44dc3b34e9d90252efc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_064447_987060_06CC451C 
X-CRM114-Status: GOOD (  32.46  )
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

On Mon, 13 Apr 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:
> On Mon, 13 Apr 2026 16:05:53 +0300
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> On Mon, 13 Apr 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:
>> > On Fri, 10 Apr 2026 19:26:53 +0300
>> > Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> >  
>> >> On Thu, 09 Apr 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:  
>> >> > Switch the i915 DP connector initialization from drmm_connector_init()
>> >> > to drmm_connector_dp_init(), providing the source link capabilities
>> >> > (supported lane counts, link rates, DSC support, voltage swing and
>> >> > pre-emphasis levels).
>> >> >
>> >> > Add intel_dp_report_link_train() to collect the negotiated link
>> >> > parameters (rate, lane count, DSC enable, per-lane voltage swing and
>> >> > pre-emphasis) and report them via
>> >> > drm_connector_dp_set_link_train_properties() once link training completes
>> >> > successfully.
>> >> >
>> >> > Reset the link training properties via
>> >> > drm_connector_dp_reset_link_train_properties() when the connector is
>> >> > reported as disconnected or when the display device is disabled, so
>> >> > the exposed state always reflects the current link status.
>> >> >
>> >> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>> >> > ---
>> >> >  drivers/gpu/drm/i915/display/intel_dp.c            | 31
>> >> > +++++++++++++++++++--- .../gpu/drm/i915/display/intel_dp_link_training.c
>> >> >  | 25 +++++++++++++++++ 2 files changed, 52 insertions(+), 4 deletions(-)
>> >> >
>> >> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> >> > b/drivers/gpu/drm/i915/display/intel_dp.c index
>> >> > 2af64de9c81de..641406bdc0cc9 100644 ---
>> >> > a/drivers/gpu/drm/i915/display/intel_dp.c +++
>> >> > b/drivers/gpu/drm/i915/display/intel_dp.c @@ -45,6 +45,7 @@
>> >> >  #include <drm/display/drm_hdmi_helper.h>
>> >> >  #include <drm/drm_atomic_helper.h>
>> >> >  #include <drm/drm_crtc.h>
>> >> > +#include <drm/drm_dp_connector.h>
>> >> >  #include <drm/drm_edid.h>
>> >> >  #include <drm/drm_fixed.h>
>> >> >  #include <drm/drm_managed.h>
>> >> > @@ -6337,8 +6338,10 @@ intel_dp_detect(struct drm_connector *_connector,
>> >> >  	drm_WARN_ON(display->drm,
>> >> >  		    !drm_modeset_is_locked(&display->drm->mode_config.connection_mutex));
>> >> >  
>> >> > -	if (!intel_display_device_enabled(display))
>> >> > +	if (!intel_display_device_enabled(display)) {
>> >> > +
>> >> > drm_connector_dp_reset_link_train_properties(_connector); return
>> >> > connector_status_disconnected;
>> >> > +	}
>> >> >  
>> >> >  	if (!intel_display_driver_check_access(display))
>> >> >  		return connector->base.status;
>> >> > @@ -6388,6 +6391,8 @@ intel_dp_detect(struct drm_connector *_connector,
>> >> >  
>> >> >  		intel_dp_tunnel_disconnect(intel_dp);
>> >> >  
>> >> > +
>> >> > drm_connector_dp_reset_link_train_properties(_connector); +
>> >> >  		goto out_unset_edid;
>> >> >  	}
>> >> >  
>> >> > @@ -7162,10 +7167,12 @@ intel_dp_init_connector(struct intel_digital_port
>> >> > *dig_port, struct intel_connector *connector)
>> >> >  {
>> >> >  	struct intel_display *display = to_intel_display(dig_port);
>> >> > +	struct drm_connector_dp_link_train_caps link_caps;
>> >> >  	struct intel_dp *intel_dp = &dig_port->dp;
>> >> >  	struct intel_encoder *encoder = &dig_port->base;
>> >> >  	struct drm_device *dev = encoder->base.dev;
>> >> >  	enum port port = encoder->port;
>> >> > +	u32 *rates;
>> >> >  	int type;
>> >> >  
>> >> >  	if (drm_WARN(dev, dig_port->max_lanes < 1,
>> >> > @@ -7213,8 +7220,25 @@ intel_dp_init_connector(struct intel_digital_port
>> >> > *dig_port, type == DRM_MODE_CONNECTOR_eDP ? "eDP" : "DP",
>> >> >  		    encoder->base.base.id, encoder->base.name);
>> >> >  
>> >> > -	drmm_connector_init(dev, &connector->base,
>> >> > &intel_dp_connector_funcs,
>> >> > -			    type, &intel_dp->aux.ddc);
>> >> > +	intel_dp_set_source_rates(intel_dp);
>> >> > +	link_caps.nlanes = DRM_DP_1LANE | DRM_DP_2LANE | DRM_DP_4LANE;
>> >> > +	link_caps.nrates = intel_dp->num_source_rates;
>> >> > +	rates = kzalloc_objs(*rates, intel_dp->num_source_rates);
>> >> > +	if (!rates)
>> >> > +		goto fail;
>> >> > +
>> >> > +	for (int i = 0; i < intel_dp->num_source_rates; i++)
>> >> > +		rates[i] = intel_dp->source_rates[i];
>> >> > +
>> >> > +	link_caps.rates = rates;
>> >> > +	link_caps.dsc = true;    
>> >> 
>> >> You have a source, you have a sink, and you have a link between the two.
>> >> 
>> >> Source rates do not reflect the link rates common between source and
>> >> sink.
>> >> 
>> >> DSC depends on source and sink, and it's not statically "true" for
>> >> either, and depends on a bunch of things.  
>> >
>> > At init, we are reporting the capabilities of the source. So we list every
>> > link rates that the source can achieve and we report that the source is DSC
>> > capable which it is IIUC the code. Or maybe I am missing something?  
>> 
>> IMO link caps is the intersection of the source and sink caps. If the
>> sink is unknown, i.e. its caps are the empty set, then the link caps
>> should also be the empty set.
>
> Ok thanks, I am rather new to the DiplayPort world so thank you for sharing
> your knowledge.
>
> IIUC currently the drivers are not testing all the capabilities of the link,
> they try the more "powerful" link and decrease the link parameters until it
> works right? So there is currently no way to now the full capabilities between a
> sink and a source.

It's at the discretion of the driver, and e.g. for i915 it depends on
whether it's eDP or regular DP, and whether you plug in an SST sink or
an MST branch device. At least that's how it was the last I checked,
there's been changes. ;)

>> If you need to know the source caps, then they need to be presented
>> separately.
>
> With DRM properties we can see possible values and the value set. 
> My though was that the possible value are matching the source capabilities and
> value set was the one negotiated between the source and the sink.
> This was straightforward to me but it indeed can confuse between source
> capabilities and link capabilities. Have you a better idea?

Ah, in that sense the property might work, indicating the possible
values for the source.

But do see my other reply elsewhere in the thread. The chosen values
might not be as helpful as you may think.

BR,
Jani.


>
>> Moreover, the source does not unconditionally support DSC. See
>> intel_dp_has_dsc().
>
> Indeed thanks, I need to investigate that function.
>
> Regards,

-- 
Jani Nikula, Intel

