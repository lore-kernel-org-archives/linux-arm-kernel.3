Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18644CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aD4o17qvx1E5SCsxlqbpRYGrDXPxx4Nan8mqO9dt8j0=; b=00z2ncT/8gc47sSvN1rRKel1Tt
	eNH1J7RF9+hbE/dcj32crt5eZl70CibitTDuvKz1A0ZC8Rl5ghWOVWoYmugr77/T2ap6hMIOdVDc7
	pxxm48sJy/7AapOYJoMRsBmg7E5i1Az+NhgqN0nSLFSRQWpzq6rDrrZD4jYLKXkh6i20H9DRqZPwS
	vrAtWAAM0zI9Jmo1qemrtvPlPnPNXtRPASQBbN06qRPpNHRWM0Tg5OfcMHg2LbWWDIX5SvOhvdNrX
	z0BxTcStiosGVh81GcxA22S97swkDW/BcF/fyTsnVmzO2GL7tSbWPqarBkJ5RaNnRvidZxnmH+BUL
	eAK9AP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvzR-00000002nk6-0huW;
	Fri, 15 Aug 2025 15:05:09 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqap-00000002276-49mc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:19:25 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c3Gl23xpBzyTF;
	Fri, 15 Aug 2025 12:19:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1755249553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aD4o17qvx1E5SCsxlqbpRYGrDXPxx4Nan8mqO9dt8j0=;
	b=j3b6Eb0eXExInSrvffulTJxS4/N5TE3zeKFBNo93DzhbTPQHSOZREzdRyyRfZYVvDKhnfp
	2VMkpoOmc2FytiUHV9dujAwyl8xuXjRIhox+Lep/3ndqH/eCIKk6Xyo16+LWY0XRiEQgtC
	Hec/a8dP7Mfshymy2u7YCS9fdMMAGI0=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1755249553; a=rsa-sha256; cv=none;
	b=jF+rxq3ET9Xhqtw4D+v3xbpInVI+UFjFh5fgT9fkWJTIu0A5aTDqDnQ/kIWYffO+7sp1Tr
	PQArqD6tgG8qq/Q1kEltCpW1YVAOHJHQYHa+bJxxs9LgWv8vkVNBm9mS7N6/yyi/lXF02g
	hn1iWU1jT818AiFWraPcaWgJ6Gb9gSg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1755249553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aD4o17qvx1E5SCsxlqbpRYGrDXPxx4Nan8mqO9dt8j0=;
	b=Gjv7iR31M+ZJ9fECxdx+WbKwwuYGbWwMxrCYpyd+az3+kntNEBCRTP/kd7d7tXRMsH7FmP
	qklCBbZMFJVq0qzLKSutQBFsuM/7viPuCjocSPufhUWeuDGxAXvZIqkVvto6EKeGpqQCux
	8vR0xtXCWQ6bvcH4PftdIoUbBt7LLAQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D834C634C93;
	Fri, 15 Aug 2025 12:18:12 +0300 (EEST)
Date: Fri, 15 Aug 2025 09:18:13 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_021924_207255_8B69E2D3 
X-CRM114-Status: GOOD (  34.29  )
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

Thanks for the patch.

On Thu, Aug 14, 2025 at 12:37:01PM +0100, Isaac Scott wrote:
> Although 4 lanes may be physically available, we may not be using all of
> them. Get the number of configured lanes in the case a driver has
> implemented the get_mbus_config op.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> 
> ---
> 
> Currently, the imx-mipi-csis driver parses the device tree to determine
> the number of configured lanes for the CSI receiver. This may be
> incorrect in the case that the connected device only uses a subset of
> lanes, for example. Allow the drivers for these cameras to create a
> mbus_config to configure the number of lanes that are actually being
> used.
> 
> If the driver does not support the get_mbus_config op, this patch will
> have no functional change.
> 
> Compile tested against media-master (v6.17-rc1)
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 2beb5f43c2c0..efe4e2ad0382 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -939,6 +939,43 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
>  	return container_of(sdev, struct mipi_csis_device, sd);
>  }
>  
> +static int mipi_csis_get_active_lanes(struct v4l2_subdev *sd)
> +{
> +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> +	struct v4l2_mbus_config mbus_config = { 0 };
> +	int ret;
> +
> +	ret = v4l2_subdev_call(csis->source.sd, pad, get_mbus_config,
> +			       0, &mbus_config);
> +	if (ret == -ENOIOCTLCMD) {
> +		dev_dbg(csis->dev, "No remote mbus configuration available\n");
> +		return 0;
> +	}
> +
> +	if (ret) {
> +		dev_err(csis->dev, "Failed to get remote mbus configuration\n");
> +		return ret;
> +	}
> +
> +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(csis->dev, "Unsupported media bus type %u\n",
> +			mbus_config.type);
> +		return -EINVAL;
> +	}
> +
> +	if (mbus_config.bus.mipi_csi2.num_data_lanes > csis->bus.num_data_lanes) {
> +		dev_err(csis->dev,
> +			"Unsupported mbus config: too many data lanes %u\n",
> +			mbus_config.bus.mipi_csi2.num_data_lanes);
> +		return -EINVAL;
> +	}
> +
> +	csis->bus.num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> +	dev_dbg(csis->dev, "Number of lanes: %d\n", csis->bus.num_data_lanes);

None of the above is really specific to this driver. Could you instead
implement a function that parses the information from the fwnode endpoint
and uses mbus configuration on top?

The function could take struct media_pad pointer as an argument, or struct
v4l2_subdev pointer and the pad number.

I wonder if any other parameters could change dynamically but I can't think
of that now, so perhaps just the number of lanes is what the function
should indeed return.

> +
> +	return 0;
> +}
> +
>  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>  	csis_fmt = find_csis_format(format->code);
>  
> +	ret = mipi_csis_get_active_lanes(sd);
> +	if (ret < 0)
> +		dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> +
>  	ret = mipi_csis_calculate_params(csis, csis_fmt);
>  	if (ret < 0)
>  		goto err_unlock;

-- 
Kind regards,

Sakari Ailus

