Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847E5CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jh+3tbPamkzvyhD5LbLvvkvi6IC98DymsuWpBXqbvEw=; b=OszhecuNK/OHaWv+Jke/+7Y3xL
	rf16KFCc12UkF2eFtyAj/gRogj3zN7XLy42v8rLR59jXesDRQxCsnGhJSBU6Obt3SG0SR/P3vpiQL
	544/9h+ufrHMdOvmYhii4a3CfnuvvFr2nPCL1kMAMGIJTBPWbLYkYUz1/YSAOe3Z8dyfWwtQp+sAS
	vVN7d/ZOzKK8WNe9EoYbtNbbGsoNcN76h9E2AXVPwae700iHXmkwzMyzgJMNavOZErLOLHlrMPSnB
	FRUxpxMv9+KtUa1oeHiy0ILNaUKSZlGfgCvqX4lTuWnl8UDKGmDwOc3W7SROqGojgxuf8R0cIyVAu
	whDyc35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWmM-00000002bNq-2VOr;
	Wed, 22 Oct 2025 11:13:18 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWmK-00000002bMq-19oB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 11:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761131596; x=1792667596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PDpSlXCddhObHo2V8wLdD/S5r1tvdmsOH6tTH+Y2AJw=;
  b=f/XgeLtodglsjjKppdRWjBDu/XDk06ciuyes6gjPvsWu6zOre8c9yOEK
   WiKadaujUHSd05q+1cizsCc2vzXbxwbd037WbgsbXCzGNYxhD1CDYXPv8
   sdGq/c+Io69tnBOT0VTnbXJDDF6TSOFkb3v78+Zc9O0sGuhQYLkpQN3h7
   klVWbh6h2MCaoS+4UjuEWVhot9cSgHzkcZ4L6AW86Ca2PGmmNsEiB/TS1
   qhIU+6gmpWquZs0nuC/BbHkOxs8QhytzZBPKq/KA6nYDN+dWH4kUJoECv
   QgDursOebetAAGox48i/z5QDKPsLrohlzMxbCSTnCsLQNXTWRnlj2jmCU
   A==;
X-CSE-ConnectionGUID: rnXBxw3yQre1OxkDqtqhWw==
X-CSE-MsgGUID: HoxL8PDUQ9aPA5A1Kt5LUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80711861"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="80711861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 04:13:15 -0700
X-CSE-ConnectionGUID: KwM47LD9R9+u1aTyN/e6Dw==
X-CSE-MsgGUID: zyxQNUL9StuxwNlIU6wZnQ==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 04:13:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8A99C121E5B;
	Wed, 22 Oct 2025 14:13:09 +0300 (EEST)
Date: Wed, 22 Oct 2025 14:13:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, kernel@puri.sm, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com
Subject: Re: [PATCH v5 4/4] media: imx-mipi-csis: Support active data lanes
 differing from maximum
Message-ID: <aPi8RXHVBMB7vHQ2@kekkonen.localdomain>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <20251022102228.275627-5-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022102228.275627-5-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_041316_378998_7918962F 
X-CRM114-Status: GOOD (  19.53  )
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

Hi Isaac,

On Wed, Oct 22, 2025 at 11:22:28AM +0100, Isaac Scott wrote:
> Call on v4l2_get_active_data_lanes() to check if the driver reports that
> the number of lanes actively used by the MIPI CSI transmitter differs to
> the maximum defined in device tree.
> 
> If the number of active data lanes reported by the driver is invalid, or
> the operation is not supported, fall back to the number of allowed data
> lanes.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 838a1ad123b5..637ef6e614fa 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1034,6 +1034,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>  	csis_fmt = find_csis_format(format->code);
>  
> +	ret = v4l2_get_active_data_lanes(csis->source.pad,
> +					 csis->bus.num_data_lanes);
> +	csis->num_data_lanes = ret < 0 ? csis->bus.num_data_lanes : ret;

I guess this works but should we return an error here instead?

Alternatively, the function could always return some number of lanes as
well (with a printed warning on error). I think I'd do the former though.

> +
>  	ret = mipi_csis_calculate_params(csis, csis_fmt);
>  	if (ret < 0)
>  		goto err_unlock;

-- 
Regards,

Sakari Ailus

