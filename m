Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89185CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDcNDSFmCOyx06ZZpUGifydkVbsZSNh9OVBsH28aFOk=; b=pp42bjLUFL8C8aiWjqMCX/t12l
	EqioKatok2Rq9MmWe72fKtrr7c9eEIPPF+dHJ52zIfUzkqBYrSdCXiig/z/3eMRPkl7jc7GPnK/Mz
	4YUP0vJqi/ofWh29J9wSyvjushMVLXjel2Bh/fDITVdM1lPIjoc2WWMz9+PEHhwKs4m4QcV4EYvO6
	IBSv6H0Cy4uJlERvw7Sp5NFSMr0MK/zlwvxPRaOsE3VSVfqGrrAWzRWnVIvSPJMK7OUUwan+hDm7t
	AWuYe2jCvyRBu6b8UlwxPXcoPZ5+Z1hZx057Jovao84R84s3bRA1UBLh+3XJPtC8ptjrgR5tQ2AhZ
	S7fbn3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOttc-0000000Ew96-110c;
	Mon, 18 May 2026 09:04:20 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOttY-0000000EvjS-1f0v;
	Mon, 18 May 2026 09:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779095057; x=1810631057;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=aTG40c4Y+EMGK+d4CAZ/N98jpaLAu/y5lJ167xYZW2Y=;
  b=aFutsDU2akDFa4rMy+y7MeppF+oPbSoWx/8l9WTHfOQm+b+BIJzQEdYn
   DN0QWqp6MgpfB/zLQkR6Zmg7H0kRpaQ055m9FEMBxPDUvVe3UvZVpRjMe
   fKvZje4r/g2rjq2EqE/gl+5ZYEq16Qrpsf3N3EqKi9BPy9MmpJ2roPKf1
   9IGCYDxAw9jteKnehVtXBtPIQ/OA6qbzlh/0LOaE6r9t5fiNuKNgSMIB5
   KbRVqQctipwzBuJmmDFmTyiqX2B235p3aNiCi0Z3S0uReZQN3PiID4shR
   xbq1G8lvJWWuTc0BFX13G4sV1wXPDdTPlEYCAdatULe1Vj7LhAS3RyV0f
   g==;
X-CSE-ConnectionGUID: WtZNn//eRFigbmkCo3To+Q==
X-CSE-MsgGUID: /qx6e5yfTiu9hzvc+vMslA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="80115907"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="80115907"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 02:02:15 -0700
X-CSE-ConnectionGUID: rgiK3bF5SQqLbFzGvOQIYA==
X-CSE-MsgGUID: YVgfR5HuRPGOTbE6/t83LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239627066"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.1])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 02:02:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>, Sandy Huang <hjc@rock-chips.com>, Andy
 Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@kernel.org>, Christian
 Hewitt <christianshewitt@gmail.com>, Diederik de Haas
 <diederik@cknow-tech.com>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 16/22] drm: bridge: dw_hdmi: Use display_info is_hdmi
 and has_audio
In-Reply-To: <20260516183838.2024991-17-jonas@kwiboo.se>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260516183838.2024991-1-jonas@kwiboo.se>
 <20260516183838.2024991-17-jonas@kwiboo.se>
Date: Mon, 18 May 2026 12:02:03 +0300
Message-ID: <937d97789b78c4ad463c7e17f48f044837402537@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_020416_522109_5424E09F 
X-CRM114-Status: UNSURE (   7.23  )
X-CRM114-Notice: Please train this message.
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

On Sat, 16 May 2026, Jonas Karlman <jonas@kwiboo.se> wrote:
> -	/*
> -	 * FIXME: This should use connector->display_info.is_hdmi and
> -	 * connector->display_info.has_audio from a path that has read the EDID
> -	 * and called drm_edid_connector_update().
> -	 */
> -	edid = drm_edid_raw(drm_edid);
> -
> -	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
> -		edid->width_cm, edid->height_cm);
> -
> -	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
> -	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);

Yay! \o/


>  
>  	return drm_edid;
>  }

-- 
Jani Nikula, Intel

