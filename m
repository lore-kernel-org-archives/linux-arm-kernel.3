Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24160C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FU1dvFue8oQTK3aBF6A/gGzFXjSlyHzhzEo8txyLQPU=; b=elXMJbiDd5a96pF+dkrSo8jDQc
	KbWHg3SWO6QCCICZyXGL1e29pidwnTagUzwdH3+dx0lyFfnvMHsKJTYvqf+u4FQfrAYn8NDbdb725
	HcFsLkbtQPGlWo/Poue1ECPZTlaapmczWUohVa5PL+xNuF+xCFMjW9iiD2TKvND0ePA4nxUcWWECw
	rvFhCrZl+2uZGO7+U1BaGvuXMqqjLTzoaWlx2DyXauSnbmsJ+2hLb7Nh8yVBdKTREUx6Y/l46qLUh
	BFDqx4PUgs4s6ZHIdmn8/KHuOx7mPwAxu7+mdILziS8IpjmFGyK+7NOafkvK14ZMAOry0k8fhK5ry
	VYgWPiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEE6-0000000BX4s-0TcY;
	Thu, 06 Mar 2025 16:37:38 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEA9-0000000BW7l-343a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 16:33:35 +0000
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Z7w2l38DYzyNC;
	Thu,  6 Mar 2025 18:33:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1741278802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FU1dvFue8oQTK3aBF6A/gGzFXjSlyHzhzEo8txyLQPU=;
	b=krhmM5S23MXIk6gZMykk21LK/zIPu1rqMfjwHioPy9BIQygmc1k1BDThwP0FfLcyP89/x2
	b0aFigklgjtgVIa1fNkCUJicde2yBf1DPrUOOBQqqXte5R9EjZlHBKPi1F5ciVNfgWhxbZ
	ssajOLoE9KXYCbxfbj6bWyiXmGO4Hx8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1741278802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FU1dvFue8oQTK3aBF6A/gGzFXjSlyHzhzEo8txyLQPU=;
	b=fUfFyRsoegM4MnO2Zbhp69jDOLRMFOxbStL/SIzzNirCLgtYDC2Sy8jfpZ8B54ZTQdUlJR
	pXr6Xs+W79Q60zh9PeEfKmcl7h8SK60fKiOSpPsehUU/4U2UJW2KPckIIQqkHYlxtbU0cO
	CGF1ln7BGgAW/N7ZLiNa46bQmi7OVJM=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1741278802; a=rsa-sha256; cv=none;
	b=h1BTf/HNzJqS0lWKnc3Auqvdnegs18T2wlEKyb/i7YrmPWa1aNKDa8UP8TGJ9Re43CCWJT
	zQ+5EQRJRUtf8ogmnHUdgTKLpObuFstm22EUntSsz+sYXKSYmmPYRz9iwiL0YE2FHGZyPX
	BTX6fQCporPXmRCOrgZwqynpzmSCbcs=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CC6CE634C93;
	Thu,  6 Mar 2025 18:33:18 +0200 (EET)
Date: Thu, 6 Mar 2025 16:33:18 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org, Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v1 1/1] media: imx: csi: Parse link configuration from
 fw_node
Message-ID: <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305113802.897087-2-mathis.foerst@mt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_083333_944787_DA7506EE 
X-CRM114-Status: GOOD (  40.79  )
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

Thanks for the patch.

On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> The imx-media-csi driver requires upstream camera drivers to implement
> the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> implement this function are not usable on the i.MX6.
> 
> The docs for get_mbus_config [1] say:
> @get_mbus_config: get the media bus configuration of a remote sub-device.
>             The media bus configuration is usually retrieved from the
>             firmware interface at sub-device probe time, immediately
>             applied to the hardware and eventually adjusted by the
>             driver.
> 
> Currently, the imx-media-csi driver is not incorporating the information
> from the firmware interface and therefore relies on the implementation of
> get_mbus_config by the camera driver.
> 
> To be compatible with camera drivers not implementing get_mbus_config
> (which is the usual case), use the bus information from the fw interface:
> 
> The camera does not necessarily has a direct media bus link to the CSI as
> the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> between them on the media pipeline.
> The CSI driver already implements the functionality to find the connected
> camera sub-device to call get_mbus_config on it.
> 
> At this point the driver is modified as follows:
> In the case that get_mbus_config is not implemented by the upstream
> camera, try to get its endpoint configuration from the firmware interface
> usign v4l2_fwnode_endpoint_parse.
> For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> configuration.
> For all other mbus_types, return an error.
> 
> Note that parsing the mbus_config from the fw interface is not done during
> probing because the camera that's connected to the CSI can change based on
> the selected input of the video-mux at runtime.
> 
> [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> [1] include/media/v4l2-subdev.h - line 814
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 3edbc57be2ca..394a9321a10b 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
>  {
>  	struct v4l2_subdev *sd, *remote_sd;
>  	struct media_pad *remote_pad;
> +	struct fwnode_handle *ep_node;
> +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };

Are there any defaults in DT bindings (other than 0's)? Also initialising a
field to zero this way is redundant, just use {}.

>  	int ret;
>  
>  	if (!priv->src_sd)
> @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
>  
>  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
>  			       remote_pad->index, mbus_cfg);
> -	if (ret == -ENOIOCTLCMD)
> -		v4l2_err(&priv->sd,
> -			 "entity %s does not implement get_mbus_config()\n",
> -			 remote_pad->entity->name);
> +	if (ret == -ENOIOCTLCMD) {

	if (!ret)
		return 0;

And you can unindent the rest.

> +		/*
> +		 * If the upstream sd does not implement get_mbus_config,
> +		 * try to parse the link configuration from its fw_node
> +		 */
> +		ep_node = fwnode_graph_get_endpoint_by_id(dev_fwnode(remote_sd->dev),

Always parse only local, not remote endpoints.

Also: instead of supporting get_mbus_config() in a driver, we would ideally
have a helper that optionally uses it and secondarily gets the endpoint
configuration from a local endpoint. It's better to do that once rather
than have every driver do this differently, including a different set of
bugs.

That being said, V4L2 fwnode endpoint parsing is a somewhat driver specific
task and that should remain with the driver. So I'd think the helper should
take a driver-parsed struct v4l2_fwnode_endpoint as an argument, for that
endpoint.

I'm not saying no to this patch though. But in the long run we'll be better
off with a helper in the framework.

> +							  0, 0,
> +							  FWNODE_GRAPH_ENDPOINT_NEXT);
> +		if (!ep_node)
> +			return -ENOTCONN;
> +
> +		ret = v4l2_fwnode_endpoint_parse(ep_node, &ep);
> +		fwnode_handle_put(ep_node);
> +		if (ret)
> +			return ret;
>  
> +		mbus_cfg->type = ep.bus_type;
> +		switch (ep.bus_type) {
> +		case V4L2_MBUS_PARALLEL:
> +		case V4L2_MBUS_BT656:
> +			mbus_cfg->bus.parallel = ep.bus.parallel;
> +			break;
> +		case V4L2_MBUS_CSI2_DPHY:
> +			mbus_cfg->bus.mipi_csi2 = ep.bus.mipi_csi2;
> +			break;
> +		default:
> +			v4l2_err(&priv->sd, "Unsupported mbus_type: %i\n",
> +				 ep.bus_type);
> +			return -EINVAL;
> +		}
> +	}
>  	return ret;
>  }
>  

-- 
Kind regards,

Sakari Ailus

