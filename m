Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BB0D262AF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyFHo+W2mZM/Obb2Q5qLTNp/T4lTCyt6AcGwFx3+uhI=; b=3q/OHdIShRSmohHL69hRhIY02E
	00brJWLdvXulNwqNP8KKayfzeFjXBbYgZzR1uahJ0ulGKlBI9bgen2r46ZQdp8XdE5dl2QOaLGFXZ
	RGw54AVVF0XdSaeB5nGbAolG8MjXKLMu8HveTiWp72RXfGQTkC3j5/ng170GtBwoxJ6jptp0WufGv
	BPIGI6uhPBuP0+hlfMzzpAf9U2D8Ew55Q4Ixoup3U7k8wbV2sSqAlZP+VBZSPz8oPN1AMi8gf49k1
	b1a8iblE9vLoNbztIycBLDm7SpjwbtZOgzWIa3q8DVKgcFFpyGLbsaAgCkIaxwdA7nE79hCWjcXkm
	A/yguKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNNc-00000004jRN-1zjY;
	Wed, 21 Jan 2026 01:51:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNNZ-00000004jR0-4Bdw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 01:51:31 +0000
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BE0A62D7;
	Wed, 21 Jan 2026 02:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768960256;
	bh=uu0TV3T46JBjmZ/Z1O6mRrRy6UkFsA3BqZKe+FAucfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vm1fklwyGGytKhk4N0Axmw4L56BjsGI7RKgeBhzBkID372ar77nKR2XMQ/BTaMvYX
	 xzS14slInMpXfv+JsRz/ioAcHToZYNI5LQrsHa9YUlAlvtow5jRbZkhXyBldTp8zOR
	 1/Ir1ZxHJzWtboL7wKjQ0eQ1Evmrl2QwLxrsh+YM=
Date: Wed, 21 Jan 2026 03:51:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] media: nxp: Add dev_err_probe() to all error
 paths in *async_register() helpers
Message-ID: <20260121015127.GC403250@killaraus>
References: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
 <20260116-cam_cleanup-v4-4-29ce01640443@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-cam_cleanup-v4-4-29ce01640443@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_175130_207308_D5D8CF00 
X-CRM114-Status: GOOD (  25.65  )
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

Hi Frank,

Thank you for the patch.

On Fri, Jan 16, 2026 at 11:29:22AM -0500, Frank Li wrote:
> Add dev_err_probe() to all error branches in the *async_register() helpers
> to provide clearer diagnostic information when device registration fails.
> 
> Drop the explicit error message after returning from
> mipi_csis_async_register(), as the error is already reported by this
> helper.
> 
> No functional change.

That's not quite exact, there are functional changes.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - new patch
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c    | 31 ++++++++++++++++-----------
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 27 ++++++++++++++---------
>  2 files changed, 35 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 9a43fd1eb0bcee7ac0c47f28ad89012de45a70d9..85098824f4917b3cda3aa71c4ed0a41939283e12 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1359,18 +1359,18 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
>  						FWNODE_GRAPH_ENDPOINT_NEXT);
>  	if (!ep)
> -		return -ENOTCONN;
> +		return dev_err_probe(csis->dev, -ENOTCONN,
> +				     "failed to get remote endpoint\n");

It's not the remote endpoint, but the local endpoint.

>  
>  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(csis->dev, ret,
> +				     "failed to parse endpoint\n");
>  
>  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> -		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> -			dev_err(csis->dev,
> -				"data lanes reordering is not supported");
> -			return -EINVAL;
> -		}
> +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
> +			return dev_err_probe(csis->dev, -EINVAL,
> +					     "data lanes reordering is not supported");

Missing \n

>  	}
>  
>  	csis->bus = vep.bus.mipi_csi2;
> @@ -1382,15 +1382,22 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
>  					      struct v4l2_async_connection);
>  	if (IS_ERR(asd))
> -		return PTR_ERR(asd);
> +		return dev_err_probe(csis->dev, PTR_ERR(asd),
> +				     "failed to add remote fwmode to notifier\n");

s/fwmode/fwnode/

>  
>  	csis->notifier.ops = &mipi_csis_notify_ops;
>  
>  	ret = v4l2_async_nf_register(&csis->notifier);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(csis->dev, ret,
> +				     "failed to register notifier\n");
>  
> -	return v4l2_async_register_subdev(&csis->sd);
> +	ret = v4l2_async_register_subdev(&csis->sd);
> +	if (ret)
> +		return dev_err_probe(csis->dev, ret,
> +				     "failed to register subdev\n");
> +
> +	return 0;
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -1549,10 +1556,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, &csis->sd);
>  
>  	ret = mipi_csis_async_register(csis);
> -	if (ret < 0) {
> -		dev_err(dev, "async register failed: %d\n", ret);
> +	if (ret < 0)
>  		goto err_cleanup;
> -	}
>  
>  	/* Initialize debugfs. */
>  	mipi_csis_debugfs_init(csis);
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 9d946b68cf59d9f4fb3413fc90219efd380d9d95..b3b9e9dc8a95c76628d573824c12f9391fb7b4a0 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -727,18 +727,18 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
>  						FWNODE_GRAPH_ENDPOINT_NEXT);
>  	if (!ep)
> -		return -ENOTCONN;
> +		return dev_err_probe(state->dev, -ENOTCONN,
> +				     "failed to get remote endpoint fwnode\n");
>  
>  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(state->dev, ret,
> +				     "failed parse endpoint fwnode\n");

I'd write

+				     "failed to parse endpoint\n");

to match the imx-mipi-csis.c driver.

>  
>  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> -		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> -			dev_err(state->dev,
> -				"data lanes reordering is not supported");
> -			return -EINVAL;
> -		}
> +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
> +			return dev_err_probe(state->dev, -EINVAL,
> +					     "data lanes reordering is not supported");
>  	}
>  
>  	state->bus = vep.bus.mipi_csi2;
> @@ -750,15 +750,22 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
>  					      struct v4l2_async_connection);
>  	if (IS_ERR(asd))
> -		return PTR_ERR(asd);
> +		return dev_err_probe(state->dev, PTR_ERR(asd),
> +				     "failed add fwnode to notifier\n");

s/failed add/failed to add/

>  
>  	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
>  
>  	ret = v4l2_async_nf_register(&state->notifier);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(state->dev, ret,
> +				     "failed to register notifier\n");
>  
> -	return v4l2_async_register_subdev(&state->sd);
> +	ret = v4l2_async_register_subdev(&state->sd);
> +	if (ret)
> +		return dev_err_probe(state->dev, ret,
> +				     "failed to register subdev\n");
> +
> +	return 0;
>  }
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

