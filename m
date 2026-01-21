Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C310D262AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veQIiUgPnBOxLUQ5eX3bVugKXxIORdvRDnaf3Ws3zvQ=; b=oRUCFT0n3ctmrwHuL/JfZyKyZd
	fbVsMD1ovKqVyLW0SO9UcOgQkwMY4AeYRtgOCIdpk6DS5ea6QUWUCEXvEKbnK1CxP+7+yEbL5jGWM
	b4ZWsy4irWdP2Mw7Rlc25Gpm4dvn7QGLOQ1SsWbiWNpe9vpq5gXMLFlEZg7yxJxk2wgSLBEe+tGHm
	b4NMXnN/guTuJd0DaPhY62ExC8bz005grPYWhIQ4xWXOuQJTlUbwzHSgPuWBc8CzsGXCVnf3i0Zfp
	KToOxdWJuj/GAWX5Gv+aO8W+2jz0MNyELzJJ2kO6RPIFrlUG6M1qi04sxVELvtlrauHaLowOoRjbK
	2TvHCv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNHX-00000004j7L-0E98;
	Wed, 21 Jan 2026 01:45:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNHU-00000004j6q-1PeG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 01:45:13 +0000
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9510E2D7;
	Wed, 21 Jan 2026 02:44:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768959878;
	bh=nmAfG/XlG9vHuJu/mIOfcC99iytyWXrNE1aifn7DYyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r42NAdXjWHWSoz2tIjwMAOAli4jSLCb6ERMj6Bwab4lICVrrquFsSKtXWueO4ZxgT
	 Fxd8cfcG5soV+98MWe+LusCV8gZYUMqMe/pD/Jxg1LDDDfx1V1dph93aQrHs/2RJcT
	 GSaFWDVh+H96GHP6g3IFKBV0qaTK6M+ZFB6nk+ow=
Date: Wed, 21 Jan 2026 03:45:08 +0200
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
Subject: Re: [PATCH v4 3/4] media: nxp: use cleanup __free(fwnode_handle)
 simplify code
Message-ID: <20260121014508.GB403250@killaraus>
References: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
 <20260116-cam_cleanup-v4-3-29ce01640443@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-cam_cleanup-v4-3-29ce01640443@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_174512_520886_5D42494D 
X-CRM114-Status: GOOD (  23.17  )
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

On Fri, Jan 16, 2026 at 11:29:21AM -0500, Frank Li wrote:
> Use cleanup __free(fwnode_handle) simplify code. No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> change in v3
> - Rollback to v1 version to align guide at cleanup.h.
> - Ref similar link
> 
>     Link: https://lore.kernel.org/r/20240904044825.1048256-1-dmitry.torokhov@gmail.com
>     Link: https://patch.msgid.link/20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com
> 
> 452e0adff2618 Input: iqs7222 - use cleanup facility for fwnodes
> 52776177d8b7e Input: iqs626a - use cleanup facility for fwnodes
> 9a540b67a9c26 Input: iqs269a - use cleanup facility for fwnodes
> cc3b18f9fedec i3c: master: Fix confusing cleanup.h syntax
> 
> change in v2.
> - move variable define to top.
> - remove dev_err_probe() change
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c    | 25 ++++++++-----------------
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 25 ++++++++-----------------
>  2 files changed, 16 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index ce93d868746f002c22e2f86b1e0aa84ec1a76061..9a43fd1eb0bcee7ac0c47f28ad89012de45a70d9 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -12,6 +12,7 @@
>   *
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> @@ -1349,27 +1350,26 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  		.bus_type = V4L2_MBUS_CSI2_DPHY,
>  	};
>  	struct v4l2_async_connection *asd;
> -	struct fwnode_handle *ep;
>  	unsigned int i;
>  	int ret;
>  
>  	v4l2_async_subdev_nf_init(&csis->notifier, &csis->sd);
>  
> -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
> -					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	struct fwnode_handle *ep __free(fwnode_handle) =
> +		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
> +						FWNODE_GRAPH_ENDPOINT_NEXT);
>  	if (!ep)
>  		return -ENOTCONN;
>  
>  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  	if (ret)
> -		goto err_parse;
> +		return ret;
>  
>  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
>  		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
>  			dev_err(csis->dev,
>  				"data lanes reordering is not supported");
> -			ret = -EINVAL;
> -			goto err_parse;
> +			return -EINVAL;
>  		}
>  	}
>  
> @@ -1381,12 +1381,8 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
>  					      struct v4l2_async_connection);
> -	if (IS_ERR(asd)) {
> -		ret = PTR_ERR(asd);
> -		goto err_parse;
> -	}
> -
> -	fwnode_handle_put(ep);
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
>  
>  	csis->notifier.ops = &mipi_csis_notify_ops;
>  
> @@ -1395,11 +1391,6 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  		return ret;
>  
>  	return v4l2_async_register_subdev(&csis->sd);
> -
> -err_parse:
> -	fwnode_handle_put(ep);
> -
> -	return ret;
>  }
>  
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 83da050a1dcbad1d41c94de0e352dcafe3f25e62..9d946b68cf59d9f4fb3413fc90219efd380d9d95 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/delay.h>
> @@ -717,27 +718,26 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  		.bus_type = V4L2_MBUS_CSI2_DPHY,
>  	};
>  	struct v4l2_async_connection *asd;
> -	struct fwnode_handle *ep;
>  	unsigned int i;
>  	int ret;
>  
>  	v4l2_async_subdev_nf_init(&state->notifier, &state->sd);
>  
> -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
> -					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	struct fwnode_handle *ep __free(fwnode_handle) =
> +		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
> +						FWNODE_GRAPH_ENDPOINT_NEXT);
>  	if (!ep)
>  		return -ENOTCONN;
>  
>  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  	if (ret)
> -		goto err_parse;
> +		return ret;
>  
>  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
>  		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
>  			dev_err(state->dev,
>  				"data lanes reordering is not supported");
> -			ret = -EINVAL;
> -			goto err_parse;
> +			return -EINVAL;
>  		}
>  	}
>  
> @@ -749,12 +749,8 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
>  					      struct v4l2_async_connection);
> -	if (IS_ERR(asd)) {
> -		ret = PTR_ERR(asd);
> -		goto err_parse;
> -	}
> -
> -	fwnode_handle_put(ep);
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
>  
>  	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
>  
> @@ -763,11 +759,6 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  		return ret;
>  
>  	return v4l2_async_register_subdev(&state->sd);
> -
> -err_parse:
> -	fwnode_handle_put(ep);
> -
> -	return ret;
>  }
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

