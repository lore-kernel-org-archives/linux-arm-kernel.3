Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B4EC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1esElnlI/YBdegCoA/o5aRxTK2Mcw7TOHuADsmI3go=; b=vMo3UPtc75ujAwT6rwPfaZQdGr
	n7q6SOJNWg8ES3r1lmbi3H+2x9uV1TS5EXaU5zMnNlP/V4oRotTZAh37Ou+E45ExDQODEXps42Pql
	d35gaOp+yv/baIf8i5i9hdMrXovzFaoqXumqs2iHcHs03EFUKBt2V+JzP85IZy7EegxCIiUT8bmUr
	TMWR/jpJOaUYVRO3Uu2OolsWdlhQevWZTMHy9FjJPue7jRXDPtmbU5EMzjSkluFpE0Av5eg2UC+dV
	UHBrUok5BJKTzyA/unPC2Z85LUPGvTTb0+to9sxpziF4xit0Uf12KRSC1M5E6Qq6WE7d150RaBDnA
	75eXOBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTVq-00000008QVC-1fcA;
	Mon, 26 May 2025 08:48:50 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTTi-00000008QKK-1kaV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 08:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748249198; x=1779785198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9+g3my9JRIFlooxyj8V7sh35hY5IRCQbmUJgQyZCpZA=;
  b=jcIwft5jv0c/Rh59jl/TCW8kcjY/LSfw8nQoXoi8VtJtepdVSHuq4VWS
   UBrTgFXVNdHKqduE/NonNAbDHdEQXZnfVZ/PIoz42B7WA1onI4jtu409F
   cNm/9JebxE4nhF2MOALTomXPSV9UsZLg/3Rd+ve/1dUJzdPtsB04kDQWy
   uICUUd5sfDywupYNz3F/8E5VLoycEKi3FkMxDPTg5YaP/jwi4GvvR7RP5
   uYyjK4RYGQ4pPPB6vdMGkYeHyOLpA1+hEFRIRKaIJiLCjLCq1jvQoEOlC
   YxLAx5sl/+HE3HzfAHQhVIU2vCxBPScDZ40whbQEoIB3L4E9qOrPAwGZe
   A==;
X-CSE-ConnectionGUID: hIq8f/ysTj68Z13LPzRHJA==
X-CSE-MsgGUID: IwyqJyi9QmelPYSsBvNXCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="61271404"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="61271404"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 01:46:37 -0700
X-CSE-ConnectionGUID: 87Q8+/OFQEKou9A59x7HZw==
X-CSE-MsgGUID: K2tL7ZGsTH2TiLuVAaj2fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="142185826"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.125])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 01:46:32 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6EF9D11F738;
	Mon, 26 May 2025 11:46:29 +0300 (EEST)
Date: Mon, 26 May 2025 08:46:29 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v6 5/7] media: mt9m114: Allow set_selection while
 streaming
Message-ID: <aDQqZdf1kZ6n3Fcm@kekkonen.localdomain>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
 <20250522143512.112043-6-mathis.foerst@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522143512.112043-6-mathis.foerst@mt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_014638_500982_56802A7C 
X-CRM114-Status: GOOD (  26.63  )
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

Hi Mathis,

On Thu, May 22, 2025 at 04:35:09PM +0200, Mathis Foerst wrote:
> The current implementation does not apply changes to the crop-
> configuration of the sensor immediately if the sensor is in
> streaming state. The user has to stop and restart the stream for
> the changes to be applied.
> This can be undesirable e.g. in a calibration usecase where the user
> wants to see the impact of his changes in a live video stream.
> Under the condition that the width & height of the cropped image area
> does not change, the changed cropping configuration can be applied to
> the pixel-array immediately without disturbing the IFP.
> 
> Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
> in streaming state and the size of the cropping rectangle didn't change,
> issue a CONFIG_CHANGE to apply the changes immediately.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  drivers/media/i2c/mt9m114.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 7d39978835fe..e909c1227e51 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -1301,11 +1301,14 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
>  	struct mt9m114 *sensor = pa_to_mt9m114(sd);
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
> +	struct v4l2_rect old_crop;
> +	int ret = 0;
>  
>  	if (sel->target != V4L2_SEL_TGT_CROP)
>  		return -EINVAL;
>  
>  	crop = v4l2_subdev_state_get_crop(state, sel->pad);
> +	old_crop = *crop;
>  	format = v4l2_subdev_state_get_format(state, sel->pad);
>  
>  	/*
> @@ -1331,10 +1334,25 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
>  	format->width = crop->width;
>  	format->height = crop->height;
>  
> -	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		mt9m114_pa_ctrl_update_blanking(sensor, format);
> +	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> +		return ret;
>  
> -	return 0;
> +	mt9m114_pa_ctrl_update_blanking(sensor, format);
> +
> +	/*
> +	 * Apply values immediately if streaming and the selection size did not
> +	 * change.
> +	 */
> +	if (sensor->streaming && old_crop.height == crop->height &&
> +	    old_crop.width == crop->width) {
> +		ret = mt9m114_configure_pa(sensor, state);
> +		if (ret)
> +			return ret;
> +		// Changing the cropping config requires a CONFIG_CHANGE

/* C comments, please. */

> +		ret = mt9m114_set_state(sensor,	MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);

Please run:

	$ ./scripts/checkpatch.pl --strict --max-line-length=80

on this.

> +	}
> +
> +	return ret;
>  }
>  
>  static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {

-- 
Regards,

Sakari Ailus

