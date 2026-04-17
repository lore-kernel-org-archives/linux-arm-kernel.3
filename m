Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD10F43693
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yx+oCy2RrvwibVbhzaDialpVD8XLtsV8o+Cs9deuPXQ=; b=WhdXCEKDSfRSE4sXGf2cI89tt0
	576WcfyIZqJToOZmGjDnO+wVb7mnkep31vcWjdVTn0WCJAPeB0Mxau5FeBEGKinoVq6gf38LLiyYU
	iVNxQYZ8jqotbaNCY6GkdBO+yAX7aQP0V0pnuEu/uPDNPaj441VYqBrWXrgDhNg/T7wk309L63xWA
	hdkX/cqI4z61E0HtjjsfzwQKNSl2gw+fVcmdIIHNpJFxOFB0HXOPDUZq7rHNWsnYr666WX/DZIfCy
	RIsHeiWNA3LzGzJz8eTPtIE1UHC/LPvrN+9/WoRMkrhd+jkrIQ5eC88+ma+Jk2XGN6VsjoyIxYg2q
	uAt0CuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhvY-00000004110-2lpM;
	Fri, 17 Apr 2026 12:04:04 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhvW-0000000410A-16Lo;
	Fri, 17 Apr 2026 12:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776427442; x=1807963442;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=XRnNIrcsMnEVq95YKOZf7K6BMN+ywiHLZr9nGpX1sd0=;
  b=H6src+EWN1nZafuNfCSwz9yJngOopmIVWIw6hKRr0F3tV/M8IeLxdjAH
   Q+/8673Jl1T7lmg/Jcvv0w7r8BHPFHiwJu5asnIeW+qDadj2h9LjuInqQ
   KODB70eaj3Hy+MwnN/lzAT7TISEpMcGPQDyhPMrD2Y8zQqula21yHv7Iv
   IU+g0sCjX7yfmlMy+DsMUdKmURUzUGSjSrHno6Dp7WtrG3eaWczS1+tMa
   +weuR4sRtfsWER66qYWtwWOS+BTE7ckzlz96WjEiXI5hyQFnfQ4S/6CL2
   GmvVaD0qWD6dbYps8OJUCBCHXOk4Z9U90NY7REn3CNiyv6a+wo/XyVG8h
   w==;
X-CSE-ConnectionGUID: VLlwXqeVRCOqN6P31dWnvg==
X-CSE-MsgGUID: /R7TH9DfQ5uV8P/1fmwpUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="80029834"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="80029834"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:04:00 -0700
X-CSE-ConnectionGUID: 02vpZtdORFu3FDE4eA8c8g==
X-CSE-MsgGUID: X6eHqJniQ0qtpFQZ8odHfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="235399324"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:03:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: sai madhu <suryasaimadhu369@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sai madhu
 <suryasaimadhu369@gmail.com>
Subject: Re: [PATCH] drm/mediatek: hdmi: Convert DRM_ERROR() to drm_err()
In-Reply-To: <20260417113310.2903091-1-suryasaimadhu369@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260417113310.2903091-1-suryasaimadhu369@gmail.com>
Date: Fri, 17 Apr 2026 15:03:54 +0300
Message-ID: <6fd252e6c41a1a6a0b57fb381d33f2e0813b5b14@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_050402_314889_84B0A017 
X-CRM114-Status: UNSURE (   9.59  )
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

On Fri, 17 Apr 2026, sai madhu <suryasaimadhu369@gmail.com> wrote:
> The DRM_ERROR() macro is deprecated in favor of drm_err() which
> provides device-specific logging.
>
> Replace DRM_ERROR() with drm_err() in the Mediatek HDMI bridge
> driver and pass the drm_device pointer via bridge->dev.
>
> No functional change intended.
>
> Signed-off-by: sai madhu <suryasaimadhu369@gmail.com>
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 1ea259854780..f431fc9adca5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -981,8 +981,9 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
>  	int ret;
>  
>  	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> -		DRM_ERROR("%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n",
> -			  __func__);
> +		drm_err(bridge->dev,
> +			"%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n",
> +			__func__);

We really shouldn't be logging __func__ either. Errors should be
unambigious anyway, and drm_dbg* logging uses
__builtin_return_address(0) to achieve the same with a much smaller
footprint.

BR,
Jani.

>  		return -EINVAL;
>  	}

-- 
Jani Nikula, Intel

