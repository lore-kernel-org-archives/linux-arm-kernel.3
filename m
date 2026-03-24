Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC167FEC0FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVFMG1CKScyObD6y2MPJr2URxJ6OHjIjchy5iZ48LGI=; b=apN2DRIC0f6BB7dTg1N4TcTstH
	JsYKCnGzgz9bn63VbJKzu8Er8rmXi2Bij2dY23kFRofOLCjXnk0EPkW1TKlqRsqtZXU7UESx8nKAR
	2NhXVLm4m8DIKvMYUTrg/wUnxKcmS+Z8P5dnOcD5Hek2U4BrUFW/gsSJsorID0Dm0z/E1qr4+1oAi
	4FDYHigg5DLs11GR0V+rmxoQwfzkgnhuYBK3Aad0T1EMdzehNJwmVTP21dCOrwa6zln/KXLr3soHa
	9AZA7cSAxgguLXFYez1HGfWgypPoML0n987nljp++oj6/xYNUFM8cEKCKgPiVdKAfbJJ5vEWbnqfj
	5NDOE1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57p1-00000002Awv-1Aoo;
	Tue, 24 Mar 2026 19:53:51 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57oz-00000002AwW-1dO9;
	Tue, 24 Mar 2026 19:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774382030; x=1805918030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=42rT3SIGPmyvbyvEqlNTF5uxxcBXVhvc5i/A4d+Id/U=;
  b=QJeKXn3JR3uxdfZuEp7k5Op+Ydae7B6ebXCSGF5zD1QDp24/1HN7U3NI
   YdLjW5+61A2dPGK+njg/j8xIEMX+eJQ/6wvkzI27lJ7wn2g1OyjdVAsGn
   Xh3BjyjvWQ3nqX4omiQ46L290OM9+C8sOnmNXXu/SRfaJvAnfGmAx2NMb
   mbvSH5MN3Dbd0YzGOGCGc+HICTS+Ttq7sNYkht+PILszWeN4JHzivD9gv
   YJwtT2+3rFxCiaf7j4vAfiWPbB1tvRKGlGdVoa8oc/vxVxAvay0PywQ+v
   We5H5MUgSh5QYttCP3PTAu2lG/WIPM/8CaJofNJaBJq5MSn8K1uWSd7mu
   w==;
X-CSE-ConnectionGUID: zBBLyg82Ta6eKPw2tvXxlg==
X-CSE-MsgGUID: FxuC0/RsQyqV/V/fAOOUdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79269911"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="79269911"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 12:53:48 -0700
X-CSE-ConnectionGUID: bv/SM0XXQLOd1k3yTDy84Q==
X-CSE-MsgGUID: hZyr5j3TSKi1jqU5SfUZgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228502299"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.220])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 12:53:38 -0700
Date: Tue, 24 Mar 2026 21:53:35 +0200
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
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>,
	Andri Yngvason <andri@yngvason.is>,
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
Message-ID: <acLrv5hLyNss-Px5@intel.com>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com>
 <acLDPYuaVI2-12JX@intel.com>
 <23910073.EfDdHjke4D@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23910073.EfDdHjke4D@workhorse>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_125349_481367_28B549DC 
X-CRM114-Status: GOOD (  24.89  )
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

On Tue, Mar 24, 2026 at 08:10:11PM +0100, Nicolas Frattaroli wrote:
> On Tuesday, 24 March 2026 18:00:45 Central European Standard Time Ville Syrjälä wrote:
> > On Tue, Mar 24, 2026 at 05:01:07PM +0100, Nicolas Frattaroli wrote:
> > > +enum drm_connector_color_format {
> > > +	/**
> > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display protocol
> > > +	 * helpers should pick a suitable color format. All implementations of a
> > > +	 * specific display protocol must behave the same way with "AUTO", but
> > > +	 * different display protocols do not necessarily have the same "AUTO"
> > > +	 * semantics.
> > > +	 *
> > > +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if the
> > > +	 * bandwidth required for full-scale RGB is not available, or the mode
> > > +	 * is YCbCr 4:2:0-only, as long as the mode and output both support
> > > +	 * YCbCr 4:2:0.
> > > +	 *
> > > +	 * For display protocols other than HDMI, the recursive bridge chain
> > > +	 * format selection picks the first chain of bridge formats that works,
> > > +	 * as has already been the case before the introduction of the "color
> > > +	 * format" property. Non-HDMI bridges should therefore either sort their
> > > +	 * bus output formats by preference, or agree on a unified auto format
> > > +	 * selection logic that's implemented in a common state helper (like
> > > +	 * how HDMI does it).
> > > +	 */
> > > +	DRM_CONNECTOR_COLOR_FORMAT_AUTO = 0,
> > > +
> > > +	/**
> > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> > > +	 */
> > > +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> > > +
> > > +	/**
> > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output format (ie.
> > > +	 * not subsampled)
> > > +	 */
> > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> > > +
> > > +	/**
> > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output format (ie.
> > > +	 * with horizontal subsampling)
> > > +	 */
> > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> > > +
> > > +	/**
> > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output format (ie.
> > > +	 * with horizontal and vertical subsampling)
> > > +	 */
> > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
> > 
> > Seems like this should document what the quantization range
> > should be for each format.
> > 
> 
> I don't think so? If you want per-component bit depth values,
> DRM_FORMAT_* defines would be the appropriate values to use. This
> enum is more abstract than that, and is there to communicate
> YUV vs. RGB and chroma subsampling, with bit depth being handled
> by other properties.
> 
> If you mean the factor used for subsampling, then that'd only be
> relevant if YCBCR410 was supported where one chroma plane isn't
> halved but quartered in resolution. I suspect 4:1:0 will never
> be added; no digital display protocol standard supports it to my
> knowledge, and hopefully none ever will.

No, I mean the quantization range (16-235 vs. 0-255 etc).

The i915 behaviour is that YCbCr is always limited range,
RGB can either be full or limited range depending on the 
"Broadcast RGB" property and other related factors.

-- 
Ville Syrjälä
Intel

