Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCFBCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZirratZSLwqjd7Z7XkFFGNMRPlb9xTZ79O3shhiE0IA=; b=X9cJCZWSKPVVKZJ5Ue5OtK0taK
	e94ypXxzRztGDVd7OJSAm1J8KZx4Xeed5xVTVG1Jlp74o2cPIo7EVhSjBV5QqySK95ppUx5APnujN
	9nO+qofbFzEwzmpne40bF9Qjt39BQun1MXOWZA3BC2qMRyI9jnI64nf0XvIzXvcw1irkViWJz1rvo
	h4EIbAjmT4/5+7ftHGQ38+j4lYl8RwXiiI01wrrgE/IAiTbPiVDzEjey79mFgP9Z2GFOlrNUz1W2N
	zT5qTJ/ERFU8UCIPktYekfzKyTjou8FBumWFqA1Ch37jRwNVFKAvG2ppyztWPTHM0dRorerw9sJw2
	2ytT1MBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6iv-0000000AiND-19Ap;
	Thu, 04 Sep 2025 09:57:45 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5aV-0000000AKJJ-1acP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 08:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756975499; x=1788511499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gzetGRXPPEFaGfqJAQ6Chzwhs2gIrlbRduBmetQTYrY=;
  b=m6bvvW3Rom+DeuhxAKuIGPrKc89UY7KAXA3I7vWy1nyug+yc5r4v78ZD
   DPxZAYGVJr3bT2h1WN1DNGCySAFMrf8mHg+8Pg1jBvDoQlJ1213IXOq6M
   00j3uUWMMxh5xA/QkNLmi+Laj2WquRC4GIidlCmG9UVtakPm4olsKhGxT
   777dCUeIGpx8nkMMPLyChN3KuDLj1MgTAUUqtYw6nI6QOWe5xhNKbyJCg
   EQIVQ7we70bB1bF1Nu6rMaE+nIKZgwzu8ePzNYMucGedCZrQMCwlCrAPV
   bbbyBVmk+qIYkqcXf8cfhFrxX1T3i+ZTRKBYFFAP4qMF5RRb1U5gqLBT+
   A==;
X-CSE-ConnectionGUID: S3MayUpBRJC/qyHcljk47Q==
X-CSE-MsgGUID: FV3nWe/nQjWsoOv+VKpOyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="58520283"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="58520283"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 01:44:59 -0700
X-CSE-ConnectionGUID: N3TxRB0xQP6c9RbJ1GcVrg==
X-CSE-MsgGUID: aYx3EAAlQhmx5apJZHzVyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="177096940"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.92])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 01:44:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EBE7611FCC7;
	Thu, 04 Sep 2025 11:44:49 +0300 (EEST)
Date: Thu, 4 Sep 2025 11:44:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	hverkuil@kernel.org, nicolas.dufresne@collabora.com,
	tomi.valkeinen@ideasonboard.com, jonas@kwiboo.se,
	dan.scally+renesas@ideasonboard.com, m.szyprowski@samsung.com,
	mehdi.djait@linux.intel.com, niklas.soderlund+renesas@ragnatech.se
Subject: Re: [PATCH v2 1/3] media: v4l: Add helper to get number of active
 lanes via a pad
Message-ID: <aLlRgRBztMEicEgM@kekkonen.localdomain>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
 <20250903102243.1563527-2-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903102243.1563527-2-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_014459_429324_782CF618 
X-CRM114-Status: GOOD (  25.68  )
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

Thanks for the update.

On Wed, Sep 03, 2025 at 11:22:40AM +0100, Isaac Scott wrote:
> Sometimes, users will not use all of the MIPI CSI 2 lanes available when
> connecting to the MIPI CSI receiver of their device. Add a helper
> function that checks the mbus_config for the device driver to allow
> users to define the number of active data lanes through the
> get_mbus_config op.
> 
> If the driver does not implement this op, fall back to using the number
> of data lanes specified in device tree.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 25 +++++++++++++++++++++++++
>  include/media/v4l2-common.h           |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 6e585bc76367..8683107b3704 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -571,6 +571,31 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> +
> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes)

This line would benefit from being wrapped.

> +{
> +	struct v4l2_mbus_config mbus_config = {};
> +	struct v4l2_subdev *sd;
> +	unsigned int lanes;
> +	int ret;
> +
> +	sd = media_entity_to_v4l2_subdev(pad->entity);
> +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> +			       &mbus_config);
> +	if (ret < 0 && ret != -ENOIOCTLCMD)
> +		return ret;
> +
> +	if (!mbus_config.bus.mipi_csi2.num_data_lanes)
> +		return dt_lanes;
> +
> +	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> +
> +	if (lanes < 0 || lanes > dt_lanes)

lanes is unsigned int so no need to check for less than 0.

I might just not use a local variable for this, up to you.

> +		return -EINVAL;
> +
> +	return lanes;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
>  /*
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 0a43f56578bc..3f8937260c76 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -584,6 +584,7 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  	(pad, mul, div)
>  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  			     unsigned int div);

Some kernel-doc documentation would be nice.

> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes);

Please wrap this, too.

>  #else
>  #define v4l2_get_link_freq(handler, mul, div)		\
>  	__v4l2_get_link_freq_ctrl(handler, mul, div)

-- 
Kind regards,

Sakari Ailus

