Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5288CE64AB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8U6IT/JuO4gtWqGNmB8j7fyacrJGeMkE1vPT6JfBfA=; b=U6ushgsj4LFGF19VjsLNtoJo6J
	FvJhHCXXImRCCQy332nwEWImZwz3+cQ3aFz2ofM7ZFLE3fQhNT3V7M8mKFyz4IB6wb8ZLHaSNl9d7
	47VqYOgdew/dL8PzesQy9quGg6anAyEBQ9+BIfMk2DNaocNSHzVvezFI2ngvaqT9QiWtg+I+VmQQD
	TclwnZA48CPdNoRzmeeoJA5MzXFWVmCP55DUL6obZWSiuZWGHur3oRAkSyjZYakHWFG6ZMQnLdIK7
	vEB3XHPMfP+9WCCtPt9pHHf8HW5AcJ2DEJztuX+PrOpUNogcbHjSWYoDWDjMGpE5LYiCoGqZ2hJCO
	+Gfvl3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUL6-00000009qii-3ss8;
	Tue, 03 Dec 2024 14:57:24 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUK6-00000009qYd-2xuO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 14:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733237783; x=1764773783;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=nr9bqAPsYmVIpKYgeN/1T2895DfBpqXXw8ki35XQrNY=;
  b=KprpihPD/jcSOCFwLVv4rLo4MbsWaVqPSJmHUBqQGZ2JUOGzZ6rJd3SX
   aW/MnwDl2heIhez9qA4sG0Cn6CCwzy8n5sVCutrEUHFn60xGV1rD82Kjf
   /BAQWLmpJeAX/bwQLuy99LmgNkwK3dzfkmqRGZs7waT3jaNCogNLy/6l2
   jQhL5CubDwYWyZ9ZD5aNzJhrxnm34ZgN1i7o/R0MwcTBtwjN7QThL0UOt
   kahD/XuOA+jOh5MlBU+zFDWytUherSWgMmAoSEbwzI/f0Zv5EWo37+iI4
   Ivil/nRErtW262opzxQ/2bpcEuQcJm9CWMEb+x41ckXi54Zqk0l//W+BR
   A==;
X-CSE-ConnectionGUID: FVcwl0tRSA6+oexvoeMkPg==
X-CSE-MsgGUID: NPjRJye2Qa+VEOY9LOta0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37391899"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="37391899"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 06:56:20 -0800
X-CSE-ConnectionGUID: Tre4A+gIQ0+OsOTsF+JqxA==
X-CSE-MsgGUID: /jaX+ZgoRZKGdDviMXmvsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93921130"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.135])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 06:56:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 06/10] drm/i915/audio: use eld_mutex to protect access
 to connector->eld
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-6-ba56a6545c03@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <20241201-drm-connector-eld-mutex-v1-6-ba56a6545c03@linaro.org>
Date: Tue, 03 Dec 2024 16:56:04 +0200
Message-ID: <874j3k4xyz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_065622_756908_994F56E4 
X-CRM114-Status: GOOD (  15.16  )
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

On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Reading access to connector->eld can happen at the same time the
> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
> order to protect connector->eld from concurrent access.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

and

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree you find best.



> ---
>  drivers/gpu/drm/i915/display/intel_audio.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index 32aa9ec1a204d2ecde46cad36598aa768a3af671..3902ab8431139c3ff4dc17b841d94b6d3241dec3 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -699,10 +699,12 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
>  	const struct drm_display_mode *adjusted_mode =
>  		&crtc_state->hw.adjusted_mode;
>  
> +	mutex_lock(&connector->eld_mutex);
>  	if (!connector->eld[0]) {
>  		drm_dbg_kms(&i915->drm,
>  			    "Bogus ELD on [CONNECTOR:%d:%s]\n",
>  			    connector->base.id, connector->name);
> +		mutex_unlock(&connector->eld_mutex);
>  		return false;
>  	}
>  
> @@ -710,6 +712,7 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
>  	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
>  
>  	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
> +	mutex_unlock(&connector->eld_mutex);
>  
>  	return true;
>  }

-- 
Jani Nikula, Intel

