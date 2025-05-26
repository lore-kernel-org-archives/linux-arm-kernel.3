Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152A5C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 12:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W746JvUSq4iasP+OkGjHempY+T4g3cnoRkY+BDYGg7I=; b=QG6PQ+wQlchON0SrwM45cM4O9X
	Vadc2/ecrdDY11lLVkZQe3QxR5ygAIeJo2neNTHBBjW/hFdKnlSbQEDGKz7c5JVA44u+wFebxinQ9
	jtR5oOitnQHe2DUeFWMt9cdwWneA8vVUFrg5DA65UWgs80BlAj2B8bvQgV0k/Evp2mo97uT6Uz2Km
	gRjT9bFy6cAYXK1RQ9leNDkbPnDSPUzIGFKEsEl018QgGLHB5NP8ZP4FHK06J+/OUSHM/i7K52rp5
	sMC6KeqXefOxuDlZoEmsiNwRKsKdJ+nx44+X8UmUkRcNZ1/DRBeHUj0pXOsXQl1DfuIsI8FmJ7o1l
	/F8RXp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWhM-00000008lUO-0YdQ;
	Mon, 26 May 2025 12:12:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWfE-00000008lF0-3Fes
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 12:10:45 +0000
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9D3B7E6;
	Mon, 26 May 2025 14:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748261415;
	bh=cZQpOYhiY2Gn7/YYsV3N5uVt4FURCVYh5mGWhtCL+dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icVOdcLW8i1i0wDcy19eXcnfv6YEu3DHgAfNLOKlC3hyigEDdazkaPkzSBFXhgze2
	 XJ2JRgIN7skMdrXTKNbiW6UF+l0M1HZqYIce1ff8yJwrD3hc233QSCREr0u2muS2Yr
	 VzA+A4yX7/8bDXOjQJo1PHCjL+WUxOpA6WE0/jhM=
Date: Mon, 26 May 2025 14:10:34 +0200
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
Subject: Re: [PATCH v6 4/7] media: mt9m114: Apply horizontal / vertical flip
 while streaming
Message-ID: <20250526121034.GF17743@pendragon.ideasonboard.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
 <20250522143512.112043-5-mathis.foerst@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522143512.112043-5-mathis.foerst@mt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_051044_946553_8471E53D 
X-CRM114-Status: GOOD (  24.82  )
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

On Thu, May 22, 2025 at 04:35:08PM +0200, Mathis Foerst wrote:
> The current implementation does not apply changes to the V4L2 controls
> HFLIP & VFLIP of the sensor immediately if the sensor is in streaming
> state. The user has to stop and restart the stream for the changes to be
> applied.

This is by design. Changing horizontal or vertical flip will cause a
shift in the bayer pattern, which would require reconfiguring the
downstream devices in the pipeline atomically. This affects raw data
capture.

> Issue a CONFIG_CHANGE when the V4L2 controls HFLIP or VFLIP are set if the
> sensor is in streaming state to apply the change immediately.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  drivers/media/i2c/mt9m114.c | 43 +++++++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 6c80c6926aef..7d39978835fe 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -399,6 +399,11 @@ struct mt9m114 {
>  		struct v4l2_ctrl *gain;
>  		struct v4l2_ctrl *hblank;
>  		struct v4l2_ctrl *vblank;
> +		struct {
> +			/* horizonal / vertical flip cluster */
> +			struct v4l2_ctrl *hflip;
> +			struct v4l2_ctrl *vflip;
> +		};
>  	} pa;
>  
>  	/* Image Flow Processor */
> @@ -1059,6 +1064,7 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
>  	struct v4l2_subdev_state *state;
>  	int ret = 0;
>  	u64 mask;
> +	u64 val;
>  
>  	/* V4L2 controls values are applied only when power is up. */
>  	if (!pm_runtime_get_if_in_use(&sensor->client->dev))
> @@ -1095,17 +1101,25 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  
>  	case V4L2_CID_HFLIP:
> -		mask = MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN;
> +		mask = MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN |
> +		       MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
> +		val = (sensor->pa.hflip->val ?
> +		       MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN : 0) &
> +		      (sensor->pa.vflip->val ?
> +		       MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN : 0);
>  		ret = cci_update_bits(sensor->regmap,
>  				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> -				      mask, ctrl->val ? mask : 0, NULL);
> -		break;
> +				      mask, val, NULL);
> +		/*
> +		 * A Config-Change needs to be issued for the change to take
> +		 * effect. If we're not streaming ignore this, the change will
> +		 * be applied when the stream is started.
> +		 */
> +		if (ret || !sensor->streaming)
> +			break;
>  
> -	case V4L2_CID_VFLIP:
> -		mask = MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
> -		ret = cci_update_bits(sensor->regmap,
> -				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> -				      mask, ctrl->val ? mask : 0, NULL);
> +		ret = mt9m114_set_state(sensor,
> +					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
>  		break;
>  
>  	default:
> @@ -1406,12 +1420,13 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
>  			  sensor->pixrate, sensor->pixrate, 1,
>  			  sensor->pixrate);
>  
> -	v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> -			  V4L2_CID_HFLIP,
> -			  0, 1, 1, 0);
> -	v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> -			  V4L2_CID_VFLIP,
> -			  0, 1, 1, 0);
> +	sensor->pa.hflip = v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> +					     V4L2_CID_HFLIP,
> +					     0, 1, 1, 0);
> +	sensor->pa.vflip = v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> +					     V4L2_CID_VFLIP,
> +					     0, 1, 1, 0);
> +	v4l2_ctrl_cluster(2, &sensor->pa.hflip);
>  
>  	if (hdl->error) {
>  		ret = hdl->error;

-- 
Regards,

Laurent Pinchart

