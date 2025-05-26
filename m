Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEECC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTYAs/ZrJhh4N454KXP37H3uRb4FwHmAmnOWMUBiB7k=; b=hcAbn1UMMS8HfmmeRERI0Vz68a
	Qm8DOay3J7T8liWCc9nFSdFBCzvFpaL3KZGYvr5uUfENFCesYuxeFe07P3EZWOWnjX5pq2jzVzr50
	Dt2Zr3dTPs9S9vg87wP21pSjSGJc9Gppp3diJKEJ7Y+xtWuTTuxjNc/KLkbTQfFL/hlUd73tLzxkD
	IvIz7cyNhB075ernGPbvFquAXQViZnxL8jbFuRqJvAnHqYtyIZPoqQ4j858hlMK1Nlk+bGfwhULpT
	SJqrLDEA8W10JwXI7/6eGmCrjl9HAO5rtEWvzjstK11deMSyvknkSqbFAXKtdBVcHIZScO/2Ne1LB
	Nv2q8m+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWkX-00000008lwH-2iFt;
	Mon, 26 May 2025 12:16:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWiP-00000008ldi-073Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 12:14:02 +0000
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D79627E6;
	Mon, 26 May 2025 14:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748261615;
	bh=f+xq8YG0asKr+yzADyfPtfiglKdK/kQYPtTCJ4mDz/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKCETNB5JI46Ujgv3ggecBeD19hX8cMkpefuQKbexm4+Z+RUxwPCfy9vheRgHj9h8
	 W9Riw11PSCyfJcZWi9ytnRZzyMU4LllEmue6EM1S416f9hx2oIOfyRxzeKhLbrwhhx
	 fVqDau7GeCini5W+zIxHyrvLkZC6YzYLOaq3dnFE=
Date: Mon, 26 May 2025 14:13:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
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
Message-ID: <20250526121353.GG17743@pendragon.ideasonboard.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
 <20250522143512.112043-6-mathis.foerst@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522143512.112043-6-mathis.foerst@mt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_051401_209457_74CAAE9B 
X-CRM114-Status: GOOD (  26.22  )
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

Thank you for the patch.

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

Changing the width or height of the active crop rectangle should be
disallowed completely during streaming. mt9m114_pa_set_selection().
should return -EBUSY in that case.

> +		ret = mt9m114_configure_pa(sensor, state);
> +		if (ret)
> +			return ret;
> +		// Changing the cropping config requires a CONFIG_CHANGE
> +		ret = mt9m114_set_state(sensor,	MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> +	}
> +
> +	return ret;
>  }
>  
>  static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {

-- 
Regards,

Laurent Pinchart

