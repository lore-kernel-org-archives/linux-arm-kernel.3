Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ECBC624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0AqwHA4KBPISqYUXaBI7KsS8Jx16vEs3ep12Vts8NA=; b=KGrMQOBYizUKfIS4JwVavO05eH
	5V2MmYtp+9j//XoR65dOzLJbjcc7J/74nwZ7vo7k9quhOurltv1ITZNG8nPWxWMfrMBk+wssEXVdD
	bg0nh55wJW6ZPMQ08gPN1OVqFTvMb6HzNoRqMstRktShZlR52OqRIntlV8kbd1Ua7+8VFGMFHsRDY
	zGLHhhCB/FRKZahqkv3HLfsR0hjZ9GxrB8pW1iRKysXjpbSgz7BEwybeAbIxkET5ZF3yY4HsIya8q
	75qRN4cQ412PyTebj8gFQPx2U29ydlrdai9cnt5zSLWTswxElpUJjE0aczSVjQMhusadbYx3Nkk0o
	fopI4bmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24MN-0000000H2Ro-3vd0;
	Thu, 03 Sep 2026 10:07:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24ML-0000000H2Qg-0Hep
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:07:54 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9F39C36;
	Thu,  3 Sep 2026 12:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788429977;
	bh=RvysufoL/j8UuHfJ6vysrlkcWB6T2CcmZl4Cm5gGEtQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jdk+/xzvswyZLB0VE80yHyUjcNSKPdO5a+VOXTn4phvvb1eOG2dztcYe6oy6L7ybp
	 Xc/mQaBHDqFSwIAecWQ677/+SOeralmdyFyydnogJ1x1FNwaBHiBFlJKWp0V/LMBCF
	 Vn3a4x0F6x58iLpBhGAy4jjV7DdU3JXCfNwThdRs=
Message-ID: <bfdf98d4-e3f3-42ff-a0b4-55c67790e4d0@ideasonboard.com>
Date: Thu, 3 Sep 2026 13:07:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: xilinx: vtc: Dynamically calculate pixel clock
To: Rajesh Gugulothu <rajesh.gugulothu@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_030753_255172_8878848E 
X-CRM114-Status: GOOD (  21.97  )
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

Hi,

On 29/07/2026 13:18, Rajesh Gugulothu wrote:
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
>   drivers/media/platform/xilinx/xilinx-vtc.c | 19 +++++++++++++++++++
>   drivers/media/platform/xilinx/xilinx-vtc.h |  1 +
>   2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c b/drivers/media/platform/xilinx/xilinx-vtc.c
> index 92fec7bb4..695eb2a46 100644
> --- a/drivers/media/platform/xilinx/xilinx-vtc.c
> +++ b/drivers/media/platform/xilinx/xilinx-vtc.c
> @@ -141,6 +141,9 @@
>   
>   #define XVTC_GENERATOR_GLOBAL_DELAY		0x0104
>   
> +/* Value of 1 = .01% */
> +#define XVTC_CLK_MAX_PCT_ERR			1
> +
>   /**
>    * struct xvtc_device - Xilinx Video Timing Controller device structure
>    * @xvip: Xilinx Video IP device
> @@ -175,10 +178,26 @@ int xvtc_generator_start(struct xvtc_device *xvtc,
>   			 const struct xvtc_config *config)
>   {
>   	int ret;
> +	unsigned long s_rate;
> +	unsigned long g_rate;
> +	unsigned long clk_err;
>   
>   	if (!xvtc->has_generator)
>   		return -ENXIO;
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
>   	ret = clk_prepare_enable(xvtc->xvip.clk);
>   	if (ret < 0)
>   		return ret;
> diff --git a/drivers/media/platform/xilinx/xilinx-vtc.h b/drivers/media/platform/xilinx/xilinx-vtc.h
> index 855845911..0f360ed55 100644
> --- a/drivers/media/platform/xilinx/xilinx-vtc.h
> +++ b/drivers/media/platform/xilinx/xilinx-vtc.h
> @@ -27,6 +27,7 @@ struct xvtc_config {
>   	unsigned int vsync_start;
>   	unsigned int vsync_end;
>   	unsigned int vsize;
> +	unsigned int fps;
>   };
>   
>   struct xvtc_device *xvtc_of_get(struct device_node *np);

In upstream there's a single user for the VTC: the TPG driver. It 
doesn't set the fps field, so the above code would always try to set the 
rate to 0, wouldn't it?

What is "reasonable tolerance", why did you arrive to .01%? Also, the 
actual result is not visible to the user.

I think this is a slightly bigger topic than a single VTC patch. There 
should be a userspace API to set the FPS, and the user should see what 
was the actual rate he got via the API (instead of a dev_warn when the 
rate is off more than an arbitrary tolerance).

  Tomi


