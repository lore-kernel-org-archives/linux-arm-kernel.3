Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E40F531C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cc2JbEaA5t7US0jQ6HYOWlUwNJEbx+NZEgBurtK6AyM=; b=b5LtT31pC2Xr/M6mOyEVCGz95G
	zKkn7HnfsunfCIN8PXLjFINIAeyCDte7/+vdne5ZRefC0kqCywNjQw6i9NDL7t+Ze5IMOKcbXZq38
	cXg6DrjzfORsnHMr+1FjedOV6hswcgyLXkQ+izbRqXgdZiuGxx5uMFELxK10XyAn2rp+3QI7BUmqi
	iXdlCZMVFXdzPuA2lR5q5uFUEW7I1peA2VnLrq6ZibJEy1M3T3jkkEXOHlb+RkK2qvIyrwV+a9p0z
	YyLJJLkkVHEG8/C0ALnxulHltQGdEXxpFkOaIIhWMAEddoP/yPPuFs72uIXDXYbti3zjZwPkGbBOM
	gMPU0YjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMHx-0000000GERz-13Wi;
	Mon, 13 Apr 2026 18:45:37 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMHv-0000000GERb-0OwB;
	Mon, 13 Apr 2026 18:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776105935; x=1807641935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IJgA2Jxj1ewy8Fefwuu7JHOczR6vtdnyBKngXgZ+7V4=;
  b=iVZz+AfbYkbwvSLp8VRtTuf5TKyo1csy56f8nWRfmHH8vesGzh8QaGPS
   x2Ld52ygPVpaoAsjPh1LGpQUSEOezEHPzB8josmLPWBNgGUL9QumX+djX
   rNHH3lhGBp708BFf8U1RuNhVIITAFEA5S5Yzc5qerQWO3ZnL0PMyd4QH0
   9HqvSAbgNw/BPG9Ips7i2paKInwegF4lkVO94zQOtMrs+yB3rBdHr2WxK
   d/QRH/CzuTivpV34tKS6Pn/Ic58CIwohDZzNDkbusEddhbYyB9TMXqmrW
   ka6s7rkTq9hOXyEy1KGQmbsw682MO9/3seYYSmDOeR7SRLC2T9t4VVJhf
   g==;
X-CSE-ConnectionGUID: N87P6z3KRUOudL5RCm9JVw==
X-CSE-MsgGUID: UkU0AhOURJmuGu2g+v5lpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77016443"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="77016443"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 11:45:32 -0700
X-CSE-ConnectionGUID: cL1tUNhMT3inlQpZ4Ig2pg==
X-CSE-MsgGUID: WcpCzJ05QPmiPMAPYrziEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="225565560"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 11:45:22 -0700
Date: Mon, 13 Apr 2026 21:45:19 +0300
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
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Marius Vlad <marius.vlad@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v13 00/27] Add new general DRM property "color format"
Message-ID: <ad05v935wrjn-A5R@intel.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_114535_257102_1267B8BD 
X-CRM114-Status: GOOD (  13.60  )
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

On Mon, Apr 13, 2026 at 12:07:14PM +0200, Nicolas Frattaroli wrote:
> Hello,
> 
> this is a follow-up to
> https://lore.kernel.org/all/20250911130739.4936-1-marius.vlad@collabora.com/
> which in of itself is a follow-up to
> https://lore.kernel.org/dri-devel/20240115160554.720247-1-andri@yngvason.is/ where
> a new DRM connector property has been added allowing users to
> force a particular color format.

Looks like we're still missing the wayland folks in the cc. But I was
told that everyone should just cc wayland-devel@lists.freedesktop.org
on all relevant uapi stuff. So please add that on the next version.

The i915 rework is now merged so you should even get a buildable
series next time.

I'll go read the i915 parts now...

-- 
Ville Syrjälä
Intel

