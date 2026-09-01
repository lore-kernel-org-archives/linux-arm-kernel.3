Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609CCC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kf6kq9NVJQskz8qOFF/B15RqUk4RVTTmPcyPWIuKN7w=; b=Xfv2dEgkxjL/iA0xt5EJstJoJp
	nw5vmQj4H6Y8b9AdDClGntdO/GYtSUZ3bJAhmurrwKFHeIpx65qqIZYNcQU6B2xg+L1d0vFaq0ZGl
	wJ9z2KvLOGuPyayLWFFkB2ml+LzAH67stut0FSZwnWxAspOJ9S9atvnetIlnOoKJfbY+R5rOG3u6Z
	3MNxL/A1Mlalo6uQvPcOa9F3n2Z8Nwlyqjxx7qFzbul2B9rtD37osGzhJL1YTv53yQVRTFJCnHOtU
	BXZlxs0E7PeB3O69E7gfH0BG8Djti9963oCzGfOZ/ffLi77Irh5kCri3PzKJSj1Vim98MS/5LN5Ou
	2lGRyt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1N63-0000000BkWg-2fas;
	Tue, 01 Sep 2026 11:56:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1N61-0000000BkVM-0PEZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:56:10 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3343B163;
	Tue,  1 Sep 2026 13:54:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788263673;
	bh=BXGA0AD21kQ+ZYWfNEdiKfsOL+vYN1BV28RWzR/TUOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9V96+aHTk6zTD4DMj0FQ7ihXgAzIhud0AH72Id6ZFFjVuvYK3gFw2HGoh77Twu6D
	 +Ho7A0avbH3wzfIMJh5TR+XYa8G0jHhDXIrriAEBeSHLCm5Vjco5IJYlwzoslpIJVe
	 CHZusvxJIQFFl2WzViQbHGR6/zpP50sjGCwUxr24=
Date: Tue, 1 Sep 2026 14:56:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: xilinx: vtc: Dynamically calculate pixel clock
Message-ID: <20260901115602.GE19683@killaraus.ideasonboard.com>
References: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_045609_288016_E1231A63 
X-CRM114-Status: GOOD (  20.07  )
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

CC'ing Tomi who is working on Xilinx V4L2 drivers.

On Wed, Jul 29, 2026 at 03:48:08PM +0530, Rajesh Gugulothu wrote:
> This update enables the vtc to set the pixel clock based on the
> specified timing parameters. A new fps field is added to struct
> xvtc_config and the pixel rate is computed as fps * hsize * vsize.
> After setting the rate, the actual clock rate is read back and a
> warning is emitted if it deviates beyond a small tolerance.
> 
> The pixel rate is computed in unsigned long arithmetic to avoid a 32-bit
> overflow in the fps * hsize * vsize product.
> 
> Signed-off-by: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
> ---
>  drivers/media/platform/xilinx/xilinx-vtc.c | 19 +++++++++++++++++++
>  drivers/media/platform/xilinx/xilinx-vtc.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c b/drivers/media/platform/xilinx/xilinx-vtc.c
> index 92fec7bb4..695eb2a46 100644
> --- a/drivers/media/platform/xilinx/xilinx-vtc.c
> +++ b/drivers/media/platform/xilinx/xilinx-vtc.c
> @@ -141,6 +141,9 @@
>  
>  #define XVTC_GENERATOR_GLOBAL_DELAY		0x0104
>  
> +/* Value of 1 = .01% */
> +#define XVTC_CLK_MAX_PCT_ERR			1
> +
>  /**
>   * struct xvtc_device - Xilinx Video Timing Controller device structure
>   * @xvip: Xilinx Video IP device
> @@ -175,10 +178,26 @@ int xvtc_generator_start(struct xvtc_device *xvtc,
>  			 const struct xvtc_config *config)
>  {
>  	int ret;
> +	unsigned long s_rate;
> +	unsigned long g_rate;
> +	unsigned long clk_err;
>  
>  	if (!xvtc->has_generator)
>  		return -ENXIO;
>  
> +	s_rate = (unsigned long)config->fps * config->hsize * config->vsize;
> +	ret = clk_set_rate(xvtc->xvip.clk, s_rate);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Verify that the clock is within a reasonable tolerance. */
> +	g_rate = clk_get_rate(xvtc->xvip.clk);
> +	clk_err = (abs(g_rate - s_rate) * 10000) / (s_rate);
> +	if (clk_err > XVTC_CLK_MAX_PCT_ERR)
> +		dev_warn(xvtc->xvip.dev,
> +			 "Failed to set clk rate: %lu, actual rate: %lu\n",
> +			 s_rate, g_rate);
> +
>  	ret = clk_prepare_enable(xvtc->xvip.clk);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/media/platform/xilinx/xilinx-vtc.h b/drivers/media/platform/xilinx/xilinx-vtc.h
> index 855845911..0f360ed55 100644
> --- a/drivers/media/platform/xilinx/xilinx-vtc.h
> +++ b/drivers/media/platform/xilinx/xilinx-vtc.h
> @@ -27,6 +27,7 @@ struct xvtc_config {
>  	unsigned int vsync_start;
>  	unsigned int vsync_end;
>  	unsigned int vsize;
> +	unsigned int fps;
>  };
>  
>  struct xvtc_device *xvtc_of_get(struct device_node *np);

-- 
Regards,

Laurent Pinchart

