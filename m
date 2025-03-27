Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DCCC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHxOynJpxoPfVkqP7TVV63pe+Ei1pU8YbUtrMKAl9Xw=; b=il6fqSk22BL1yOA51MyX/TTnjT
	4Iwe1WonKo3jYo3kf4/H26sIMaSVp42NsLGeggfMimZfnmci1iZDZiUWOkIppPYeAKFyzdbV3Lyg2
	oV606zED6woeBHKGdGJI4a5gwgx2JH6jJVZHQT1JuyuRpc5jbiYuzGxAhb6TBiiUbBCTCCw1w0Tol
	5ooqyNute6zZstjgtkGxK3ga7KDJqaj7BSHA/XOVZiKA9InoSRYkjnSbm1ynrJL8LVZxJirOPrNpS
	epuY7nrmHOrGKXkaehUpJ/XcHOZO17GZaw0/mU6Uvp37eaWJ0jNdZxuJg4ggsVcNVquPicDRkn0LB
	qtGoak/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtia-0000000Bx6f-0qd3;
	Thu, 27 Mar 2025 20:20:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtKK-0000000Bu6J-2emQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:55:45 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85C1F446;
	Thu, 27 Mar 2025 20:53:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743105234;
	bh=2WNWM9kf9hPjB2M8fdeez0uvpVDEQQZTBElzx+pQr2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btDuSomFB2B+2MnMXMOVOR1LJ4pat4LuKmecXbaVDZxhFE3Zr5pFZYj0f/M21ze8P
	 R3K7Z9ek9b7+qKS+V0iA4qz0LXIrSD96M/RISaKnyBPndmJedXF/DOXr6qj9q5lSOF
	 tmG8NM80yzbsNJraioK9EE/NuUaEWaVZw/6Oe2Ys=
Date: Thu, 27 Mar 2025 21:55:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 04/12] media: nxp: imx8-isi: Allow num_sources to be
 greater than num_sink
Message-ID: <20250327195520.GH4861@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_125544_815645_DFD45624 
X-CRM114-Status: GOOD (  21.53  )
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

On Mon, Feb 10, 2025 at 03:59:23PM -0500, Frank Li wrote:
> Allow num_sources (drvdata: num_channels) to be greater than num_sink
> (drvdata: num_ports + 1).
> 
> ISI support stream multiplexing, such as differentiates multiple cameras
> from a single 2-lane MIPI input, or duplicates input stream into multiple
> outputs. So num_channels may be greater than num_ports at some platform.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v3
> - none
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 93a55c97cd173..ba5b2d3617a23 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -188,11 +188,11 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
>  	 * Create a 1:1 mapping between pixel link inputs and outputs to
>  	 * pipelines by default.
>  	 */

Move

	routing.num_routes = xbar->num_sinks - 1;

here, and use routing.num_routes below to replace xbar->num_sinks - 1.

This assumes that there will always be as many or more pipelines than
pixel links. It's true for all the currently supported SoCs and the ones
you add in this series, but maybe we could make it safer with

	routing.num_routes = min(xbar->num_sinks - 1, xbar->num_sources);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -	routes = kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL);
> +	routes = kcalloc(xbar->num_sinks - 1, sizeof(*routes), GFP_KERNEL);
>  	if (!routes)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < xbar->num_sources; ++i) {
> +	for (i = 0; i < xbar->num_sinks - 1; ++i) {
>  		struct v4l2_subdev_route *route = &routes[i];
>  
>  		route->sink_pad = i;
> @@ -200,7 +200,7 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
>  		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>  	}
>  
> -	routing.num_routes = xbar->num_sources;
> +	routing.num_routes = xbar->num_sinks - 1;
>  	routing.routes = routes;
>  
>  	ret = __mxc_isi_crossbar_set_routing(sd, state, &routing);
> @@ -453,7 +453,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>  	 * the memory input.
>  	 */
>  	xbar->num_sinks = isi->pdata->num_ports + 1;
> -	xbar->num_sources = isi->pdata->num_ports;
> +	xbar->num_sources = isi->pdata->num_channels;
>  	num_pads = xbar->num_sinks + xbar->num_sources;
>  
>  	xbar->pads = kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL);

-- 
Regards,

Laurent Pinchart

