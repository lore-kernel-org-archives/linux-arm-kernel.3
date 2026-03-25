Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A1DFEA83E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fd0EmGhpSxMp8kwD+dnrvOswkSLZYizXxT5OtE0+Ra8=; b=opv6KCPoTe7zE7OINuGLbYtY6A
	X9hMEeUJVAU7GNGw3mUpvuZ40JzCwE9aAavA+2NrVAcci0wicz/FWIUtW0aauTTCRxFN8Au+E36xs
	5UqoNn+8YicSU/ziucQLwgxTafiqlAmo52/pgLSoJEKzJh1qhb38wOCibfyVi+Uc5GVtncrBeQ7Hw
	t0VCJe9zzkoT8l/QUKaF8SYIpTk6z6yzO9U2xzPAWcpg04hvDFoB+BFdP/ZjcyM0uUR/izQQdL4/Z
	3k2X9OyS3zP62GJA/M+pEP5FEZuSvEmMTjGZF0DPBU+ri1jApc+/gMkCPmqOTPvSqs1usQXCZ58Pz
	Su0xwn7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MFK-00000003EuB-2b6C;
	Wed, 25 Mar 2026 11:17:58 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MFI-00000003Etm-1Dqs;
	Wed, 25 Mar 2026 11:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774437476; x=1805973476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kzuhQRAn6uUGiXGPYc75BqKQ9p/wHs0wNpdD+t4UBMY=;
  b=Yla9zdcWWHX1HkPgnE4+zQ3gN8PgLC0VclsRBbjBrK3ws5ArBfDQgDJu
   FEq4DHHY68Ssc53ISiV12/F6VMXu+vBSf0oB0puecZdZTKWdk2S033P3b
   ECkXc9rGc2P7IothmtlgNs0uUSC3rtffgUPXLiYHMM7cjtuCXbOCqSaYG
   3qrdJtFccLb46wNNVi1jP3GsvVdyKGSjl3N//+qNAn9sl/kSZ0aBAHS0d
   v/11PUzia1NJxVzyTk0HP/wolLsZJcP6i1qz256eYQI4XFiT5uHo+xSJM
   JnIudgRGzfiFzH3gne6Vbnav8ZzUAAWi70qnaQQ8RffuD2o/W0TmaKX7m
   A==;
X-CSE-ConnectionGUID: dPnnB/BDRderZpm2E87p1Q==
X-CSE-MsgGUID: kkvSLDgORSKu8m+IzMtKpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78069106"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="78069106"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:17:55 -0700
X-CSE-ConnectionGUID: +or7FRj0Qpuy3B/PzeXj8w==
X-CSE-MsgGUID: zCxjcdGPTlafOHFSmBgCsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="226293924"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.117])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:17:46 -0700
Date: Wed, 25 Mar 2026 13:17:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>,
	Andri Yngvason <andri@yngvason.is>,
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
Message-ID: <acPEWCZ2nvatVh08@intel.com>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com>
 <acLDPYuaVI2-12JX@intel.com>
 <23910073.EfDdHjke4D@workhorse>
 <acLrv5hLyNss-Px5@intel.com>
 <20260325-neat-elegant-raven-ebc9ab@houat>
 <acPA60Ci3n_t__xF@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acPA60Ci3n_t__xF@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_041756_349352_41A98072 
X-CRM114-Status: GOOD (  42.08  )
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

On Wed, Mar 25, 2026 at 01:03:07PM +0200, Ville Syrjälä wrote:
> On Wed, Mar 25, 2026 at 09:24:27AM +0100, Maxime Ripard wrote:
> > On Tue, Mar 24, 2026 at 09:53:35PM +0200, Ville Syrjälä wrote:
> > > On Tue, Mar 24, 2026 at 08:10:11PM +0100, Nicolas Frattaroli wrote:
> > > > On Tuesday, 24 March 2026 18:00:45 Central European Standard Time Ville Syrjälä wrote:
> > > > > On Tue, Mar 24, 2026 at 05:01:07PM +0100, Nicolas Frattaroli wrote:
> > > > > > +enum drm_connector_color_format {
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display protocol
> > > > > > +	 * helpers should pick a suitable color format. All implementations of a
> > > > > > +	 * specific display protocol must behave the same way with "AUTO", but
> > > > > > +	 * different display protocols do not necessarily have the same "AUTO"
> > > > > > +	 * semantics.
> > > > > > +	 *
> > > > > > +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if the
> > > > > > +	 * bandwidth required for full-scale RGB is not available, or the mode
> > > > > > +	 * is YCbCr 4:2:0-only, as long as the mode and output both support
> > > > > > +	 * YCbCr 4:2:0.
> > > > > > +	 *
> > > > > > +	 * For display protocols other than HDMI, the recursive bridge chain
> > > > > > +	 * format selection picks the first chain of bridge formats that works,
> > > > > > +	 * as has already been the case before the introduction of the "color
> > > > > > +	 * format" property. Non-HDMI bridges should therefore either sort their
> > > > > > +	 * bus output formats by preference, or agree on a unified auto format
> > > > > > +	 * selection logic that's implemented in a common state helper (like
> > > > > > +	 * how HDMI does it).
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_AUTO = 0,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output format (ie.
> > > > > > +	 * not subsampled)
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output format (ie.
> > > > > > +	 * with horizontal subsampling)
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output format (ie.
> > > > > > +	 * with horizontal and vertical subsampling)
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
> > > > > 
> > > > > Seems like this should document what the quantization range
> > > > > should be for each format.
> > > > > 
> > > > 
> > > > I don't think so? If you want per-component bit depth values,
> > > > DRM_FORMAT_* defines would be the appropriate values to use. This
> > > > enum is more abstract than that, and is there to communicate
> > > > YUV vs. RGB and chroma subsampling, with bit depth being handled
> > > > by other properties.
> > > > 
> > > > If you mean the factor used for subsampling, then that'd only be
> > > > relevant if YCBCR410 was supported where one chroma plane isn't
> > > > halved but quartered in resolution. I suspect 4:1:0 will never
> > > > be added; no digital display protocol standard supports it to my
> > > > knowledge, and hopefully none ever will.
> > > 
> > > No, I mean the quantization range (16-235 vs. 0-255 etc).
> > > 
> > > The i915 behaviour is that YCbCr is always limited range,
> > > RGB can either be full or limited range depending on the 
> > > "Broadcast RGB" property and other related factors.
> > 
> > So far the HDMI state has both the format and quantization range as
> > different fields. I'm not sure we need to document the range in the
> > format field, maybe only mention it's not part of the format but has a
> > field of its own?
> 
> I think we only have it for RGB (on some drivers only?). For YCbCr
> I think the assumption is limited range everywhere.
> 
> But I'm not really concerned about documenting struct members.
> What I'm talking about is the *uapi* docs. Surely userspace
> will want to know what the new property actually does so the
> uapi needs to be documented properly. And down the line some
> new driver might also implement the wrong behaviour if there
> is no clear specification.
> 
> So I'm thinking (or perhaps hoping) the rule might be something like:
> - YCbCr limited range 
> - RGB full range if "Broadcast RGB" property is not present
> - RGB full or limited range based on the "Broadcast RGB" property
>   if it's present
> 
> I think the "Broadcast RGB" property itself might also be lacking
> proper uapi docs, so that may need to be remedied as well.

Oh, and I think a bunch of infoframe code still needs changes to 
set up the quantization range properly for YCbCr. i915 does handle
that part correctly, but eg. hdmi_generate_avi_infoframe() does not.
I didn't spot any changes to that in the series.

-- 
Ville Syrjälä
Intel

