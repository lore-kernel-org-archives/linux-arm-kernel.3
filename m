Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1045CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c54KfsI4HptCQLSrRHNLP/BIoKR4dJKvmjofNFS6EPc=; b=AIzqXQBRHZV6T7E3uyafwOWXQA
	+BzgEgENeGEoJGOvSVlY5hd+2Mu1QgYVEmxVpZ5iR9rOI9xy4LA31IsYsyVP0FCn/4CYPz6ClzYJA
	k9vb4LMYm3ozts47o792aY0gYRrJcOK8YmXAWqoa8WdQAmj7TIMOv9zjdtqgXEuulclHm9DaEg2F4
	OXCBjneSsMkRz2+2lsyBXTDD4iInunD/2Bl4CYi13y+caOujNg54Tr1k00+smQXbRxo78TnJWdD86
	e04IPiCwSs3ZtDXZ4qm05gFSJgW/ZDJ4stgpMKwl10nuYzPg1/K0rnFlCWFhEF0rLxOdBte8DKeRn
	5kbenXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aM1-0000000917D-19Fh;
	Mon, 22 Sep 2025 06:48:53 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aLz-0000000916p-0EVQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:48:52 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cVYbr454BzySx;
	Mon, 22 Sep 2025 09:48:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1758523724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c54KfsI4HptCQLSrRHNLP/BIoKR4dJKvmjofNFS6EPc=;
	b=vVDfy2lQjagkvA3af60EKADTdyriSznlKV73hf4JVOoX/TZuMUfLBjaiMLFrP7fPLmqVA3
	sjHSkHtNOQr33qQzzn/ChKilK0YiXSDfnVHTilVwX6eH1NfRryaeLN8ZDSEzdtFbJWAB78
	6h1reBho5da8Kr5sUqDENJOaNj7Qsqc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1758523724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c54KfsI4HptCQLSrRHNLP/BIoKR4dJKvmjofNFS6EPc=;
	b=lzzOw/iUyIuIcE8vKQQTUc6GdwsIGCDBvH/vR8CVyVBzzjk6Kq10jiurbsc9/suXh4ks5q
	6CbEb9suSHT2k6Cla0dSDMppZWu8+sBH1hXp52gEdPxm7ILbjK9GtqOPaCDOCy/VVdasU4
	CnNbB6c/RF3rTciion6y6P6ANl04V64=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1758523724; a=rsa-sha256; cv=none;
	b=M3OqNc5uTmbUDslVQLQe5qkl/wBTqyXYHc3Sn7R/kKSv2WrmAqld7ufyaOoFejSMsWf/qS
	ibPEaYD53GQogiMIFvtzYY57VIksUz23Eq6zSKIfLi5a3lQUvhmO4P+EI6+zZdkVOFWuXZ
	B+91lvnWlX//KGJ4YtkXpl27gEJsbls=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E8CFA634C97;
	Mon, 22 Sep 2025 09:48:39 +0300 (EEST)
Date: Mon, 22 Sep 2025 09:48:39 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/3] media: v4l: Add helper to get number of active
 lanes via a pad
Message-ID: <aNDxR72CmvGofTHy@valkosipuli.retiisi.eu>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
 <20250915-mbus-config-active-lanes-v3-1-97a1282a410b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-mbus-config-active-lanes-v3-1-97a1282a410b@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_234851_278043_B5BEA4D3 
X-CRM114-Status: GOOD (  32.61  )
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

On Mon, Sep 15, 2025 at 02:18:33PM +0100, Isaac Scott wrote:
> Sometimes, users will not use all of the MIPI CSI 2 lanes available when
> connecting to the MIPI CSI receiver of their device. Add a helper
> function that checks the mbus_config for the device driver to allow
> users to define the number of active data lanes through the
> get_mbus_config op.
> 
> If the driver does not implement this op, fall back to using the number
> of data lanes specified in device tree.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 32 ++++++++++++++++++++++++++++++++
>  include/media/v4l2-common.h           | 21 +++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 6e585bc76367..2ce8407f1397 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -571,6 +571,38 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> +
> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
> +					unsigned int max_data_lanes)
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
> +	/*
> +	 * This relies on the mbus_config being zeroed at init time.
> +	 */
> +	if (!mbus_config.bus.mipi_csi2.num_data_lanes)

I'd either use the local variable for this (lanes) either all the time, or
not at all.

> +		return max_data_lanes;
> +
> +	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> +
> +	if (lanes > max_data_lanes) {
> +		dev_dbg(sd->dev, "Active data lanes (%u) exceeds max (%u)\n",
> +			lanes, max_data_lanes);
> +		return -EINVAL;
> +	}
> +
> +	return lanes;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
>  /*
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 0a43f56578bc..6af0695460ab 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -584,6 +584,27 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  	(pad, mul, div)
>  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  			     unsigned int div);

Is your tree up to date?

> +
> +/**
> + * v4l2_get_active_data_lanes - Get number of active data lanes from driver
> + *
> + * @pad: The transmitter's media pad.
> + * @max_data_lanes: The maximum number of active data lanes supported by
> + * 		    the MIPI CSI link in hardware. This can be configured
> + * 		    in device tree.

I'd remove the latter sentence. Alternatively, it needs to be improved:
there are other sources for this information than DT.

> + *
> + * This function is intended for obtaining the number of data lanes that are
> + * actively being used by the driver for a MIPI CSI-2 device on a given media pad.
> + * This information is derived from a mbus_config fetched from a device driver
> + * using the get_mbus_config v4l2_subdev pad op.
> + *
> + * Return:
> + * * >0: Number of active data lanes
> + * * %-EINVAL: Number of active data lanes is invalid, as it exceeds the maximum
> + *	       supported data lanes listed in device tree.
> + */
> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
> +					unsigned int max_data_lanes);
>  #else
>  #define v4l2_get_link_freq(handler, mul, div)		\
>  	__v4l2_get_link_freq_ctrl(handler, mul, div)
> 

-- 
Regards,

Sakari Ailus

