Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1458DC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hmFYryIxoxDoMLw3FLhVzV9AWdWSziaHqHSNF0qkdI=; b=ALtYGI9toxn3cdoVsaUF/qDRjO
	pHz/8fFF08ODVTHfbhQ0K67dV8ZGkIw/B+c6tBkizzd2pFQaC2ko2pxKdZrHxKGJBt/9YGqvkoroO
	ARVAkQ5JBMKv/aTMuPpPHHmbMVuhqXIZYYiQTidCCHKDfgju75v3q/ynyKhjzPf8TMsb4x0kO5ZbT
	yCbCM30dgfJvCM+EFhheOrz+ZcIkUqmlkLUvFrsIiMgnZKn9XwInZ0OKN53ejiYG4GWXhSq9h/pVn
	OE6RMP3m5zUNt7DatVZrT7dqiKFdLMmrluWqYULSDcq3+4qQmhJL0h0JZtKqTdhVm1YrsFjOtKQXm
	/BW4v9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlros-00000007XYT-0mBO;
	Mon, 20 Jul 2026 17:30:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrop-00000007XXn-0NSK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:30:21 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89341289;
	Mon, 20 Jul 2026 19:29:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784568557;
	bh=QGe2zkMIj440LpHSElWITNhDanOcV8/IoDRy49i+JyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ouMjBkc59JtGChjTnDsswVYyEJSyCRbjalQhJdaN34nCXHbFohltcioWP/JMxhsal
	 bePv8o/AjQ4CZoJ65Ls1UN0jHejP206L88hFImIS9cYZz6CcGyu+Rl0eubedn6I6Zh
	 GrDv1gzo+xSap+2UCFQT7cYfnBURLaysr94tGwA4=
Date: Mon, 20 Jul 2026 20:30:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/6] media: nxp: imx8-isi: Fix stream ID validation
 bypass in crossbar routing
Message-ID: <20260720173014.GA50424@killaraus.ideasonboard.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-1-45845bc5d4fa@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-isi-v2-1-45845bc5d4fa@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_103019_280301_8CD6EFFD 
X-CRM114-Status: GOOD (  21.98  )
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

Hi Guoniu,

Thank you for the patch.

On Mon, Jul 20, 2026 at 11:34:03AM +0800, Guoniu Zhou wrote:
> The crossbar routing validation has a critical bug where it validates
> the wrong routing table, allowing userspace to bypass validation entirely.
> 
> The __mxc_isi_crossbar_set_routing() function is called to validate and
> apply a new routing table from userspace. However, the validation loop
> iterates over state->routing (the currently active routing table) instead
> of the routing parameter (the new table being validated):
> 
>     for_each_active_route(&state->routing, route) {
> 
> This means userspace can submit any invalid routing configuration and it
> will pass validation as long as the currently active routing is valid.
> This is a security issue as it allows userspace to configure routes that
> violate hardware constraints, potentially causing undefined hardware
> behavior.
> 
> Fix by validating the routing table that will actually be applied.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> - Split v1 patch 1/5 into two patches: this patch fixes the core
>   for_each_active_route() bug, next patch adds additional stream
>   validation (Frank Li)
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index c580c831972e..84871bceb31d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -107,7 +107,7 @@ static int __mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
>  		return ret;
>  
>  	/* The memory input can be routed to the first pipeline only. */
> -	for_each_active_route(&state->routing, route) {
> +	for_each_active_route(routing, route) {
>  		if (route->sink_pad == xbar->num_sinks - 1 &&
>  		    route->source_pad != xbar->num_sinks) {
>  			dev_dbg(xbar->isi->dev,
> 

-- 
Regards,

Laurent Pinchart

