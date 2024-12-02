Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AF2D78302
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yrhb3VLmcJaBqbF5syqW+AbNdyp9mgkEQ5sUw98zwq4=; b=0GByFOnuRi/sg3VmHENmQQ4UID
	0r4SjSrcE35TcYJ3Ktlv9yCS+l2G36aC8oUXoeNfDj1wzWYTvqL0q+KA9v2sXdsZ1giW7twWsyL9W
	eaSO87wbgwh3Ux5Nv4naN2X25LAoYFFVCH9Gmf/3xMNVJBfsnZ5kd/U/MJC+1y7++uRxiZ4Rcrkjq
	idB4APXKZ7xmAKIPMmqorlRXqv+yt216PLkEUs5Udz3SlBIFVVUy74J19el37Ljuq058bQc9IPEBe
	8WzOlangKFmf54TJxIdMaBBCbjx1espf58ozrB/AkVq3tLj4ur9mYaKFPqWLCJQ2NcP6IBps8sGDk
	DUW3zP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3bt-00000005ifN-2vJh;
	Mon, 02 Dec 2024 10:24:57 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3at-00000005iMd-2BOv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 10:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733135036; x=1764671036;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=LoFYJIJMK9Q6i+Gw0XK8Wb/1ESu9maODEfjoY8fwwDs=;
  b=ivw7S8rLUTtW2omYrkc5AC4JRmeSFRKrO7URE0tZb8NMmk2aGeoEtwvM
   XnvZb8ZrcEwsWJ8Ofmu0CGXJIMjnKjh1kVOJjwk5eDGujEKbBbWuZpYOG
   2gxxi7m4kQ1mKnY41Mxn/lKDjLPYO2EZKr/8UstY2jcy+RQV1xSq3tOjb
   XFbHuQsrRdLn+TsZqkf32qhtQEiBuy4UkI0tvaw9atqeW75UoHiUv6V/+
   GMiJTluTmG7fitxWKoK+Xtx4+ztWnG/wpAEyebrAUaVwirrnTQTCK08/m
   lzoadEx6XN/WpjWanYBS4p3/DpJAP9ZwV8Mh4g//gqRwFj3ZzF1HBYbgu
   w==;
X-CSE-ConnectionGUID: UUG5UatNTWCpLG/a7pXEtg==
X-CSE-MsgGUID: xZpDghKDQUeumZn7gaWrxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="58686707"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="58686707"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 02:23:54 -0800
X-CSE-ConnectionGUID: UHu/FGD7RLStnnYdm2d4Lg==
X-CSE-MsgGUID: M4511x8/R/qE4ZFNnmbAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="97836221"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.77])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 02:23:41 -0800
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
Subject: Re: [PATCH 01/10] drm/connector: add mutex to protect ELD from
 concurrent access
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-1-ba56a6545c03@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <20241201-drm-connector-eld-mutex-v1-1-ba56a6545c03@linaro.org>
Date: Mon, 02 Dec 2024 12:23:29 +0200
Message-ID: <87r06q5qou.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_022355_576376_2963142E 
X-CRM114-Status: GOOD (  21.02  )
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
> The connector->eld is accessed by the .get_eld() callback. This access
> can collide with the drm_edid_to_eld() updating the data at the same
> time. Add drm_connector.eld_mutex to protect the data from concurrenct
> access. Individual drivers are not updated (to reduce possible issues
> while applying the patch), maintainers are to find a best suitable way
> to lock that mutex while accessing the ELD data.

Missed clear_eld().

BR,
Jani.

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 1 +
>  drivers/gpu/drm/drm_edid.c      | 4 ++++
>  include/drm/drm_connector.h     | 5 ++++-
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index fc35f47e2849ed6786d6223ac9c69e1c359fc648..bbdaaf7022b62d84594a29f1b60144920903a99a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -277,6 +277,7 @@ static int __drm_connector_init(struct drm_device *dev,
>  	INIT_LIST_HEAD(&connector->probed_modes);
>  	INIT_LIST_HEAD(&connector->modes);
>  	mutex_init(&connector->mutex);
> +	mutex_init(&connector->eld_mutex);
>  	mutex_init(&connector->edid_override_mutex);
>  	mutex_init(&connector->hdmi.infoframes.lock);
>  	connector->edid_blob_ptr = NULL;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 855beafb76ffbecf5c08d58e2f54bfb76f30b930..f0ca77bd42fd518d505d0db78557e0c8d83efb29 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5657,6 +5657,8 @@ static void drm_edid_to_eld(struct drm_connector *connector,
>  	if (!drm_edid)
>  		return;
>  
> +	mutex_lock(&connector->eld_mutex);
> +
>  	mnl = get_monitor_name(drm_edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
>  	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD monitor %s\n",
>  		    connector->base.id, connector->name,
> @@ -5717,6 +5719,8 @@ static void drm_edid_to_eld(struct drm_connector *connector,
>  	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD size %d, SAD count %d\n",
>  		    connector->base.id, connector->name,
>  		    drm_eld_size(eld), total_sad_count);
> +
> +	mutex_unlock(&connector->eld_mutex);
>  }
>  
>  static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index e3fa43291f449d70f3b92a00985336c4f2237bc6..1e2b25e204cb523d61d30f5409faa059bf2b86eb 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2001,8 +2001,11 @@ struct drm_connector {
>  	struct drm_encoder *encoder;
>  
>  #define MAX_ELD_BYTES	128
> -	/** @eld: EDID-like data, if present */
> +	/** @eld: EDID-like data, if present, protected by @eld_mutex */
>  	uint8_t eld[MAX_ELD_BYTES];
> +	/** @eld_mutex: protection for concurrenct access to @eld */
> +	struct mutex eld_mutex;
> +
>  	/** @latency_present: AV delay info from ELD, if found */
>  	bool latency_present[2];
>  	/**

-- 
Jani Nikula, Intel

