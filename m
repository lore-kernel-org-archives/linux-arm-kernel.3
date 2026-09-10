Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F287C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXBSAOGIh6jCZvCkv9yCum8ZJroML+LqgNj3BgTtpxI=; b=dzwZjl2QKeRHA7M0xdt34Rrj9R
	v2TFGUu7wZJlHeTzs1kQv7voeaJfRtprgGG3a0byh20O86IYuO3N7HAV+2C91U28V67VLIYY8drWe
	2Q8gLhQN8+wqTEMmUJSNyBPJyuXPl08ZiXI0wEMuHpsckI2Pi3MmhOqSxK9I+0/ZBc4D1C40u/lwM
	dLzburKGG33aGCucjvvPr00UrG/TIXlsrBchRxcPYCwETJyGrIYDGWM0GbNFxsxx11xAcXdvGH/bh
	1E70Y42dHxRi9+YDq9iG7H9CJkuM+v3S1PcFXJQUGUZbBz8Jcpu+SyqM2ZqNNtXRwOIlXpDinEwzG
	OZQq/y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eyp-0000000EW17-06Qg;
	Thu, 10 Sep 2026 13:38:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eym-0000000EW10-3ycg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:38:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6626A43DDD;
	Thu, 10 Sep 2026 13:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24CB1F000FF;
	Thu, 10 Sep 2026 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789047496;
	bh=IXBSAOGIh6jCZvCkv9yCum8ZJroML+LqgNj3BgTtpxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xsNrvoCs9Ftw5+cXXa+IjekEtsA6YzktE0MZJSCvJtXliyEzc6/DT/+fV33QVUdc2
	 W7UGTKGoHLg1MucSEEoonFQOfEExOoSj6h4fbOGOzlJG4Ip2WbRgir5VW++FBCcHDG
	 L13Wj+On8GsdLvIp+T7d8A4WHlexX2oUAitBXOmU=
Date: Thu, 10 Sep 2026 15:38:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: phucduc.bui@gmail.com
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling
 when creating IRQ name
Message-ID: <2026091054-preflight-capacity-e7e2@gregkh>
References: <20260810093112.47807-1-phucduc.bui@gmail.com>
 <20260810093112.47807-2-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810093112.47807-2-phucduc.bui@gmail.com>
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

On Mon, Aug 10, 2026 at 04:31:12PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> devm_kasprintf() can fail when allocating the wakeup IRQ name. The error
> was logged with dev_err_probe(), but its return value was ignored and
> probe could continue with a successful return value.
> 
> Store the error returned by dev_err_probe() in ret and jump to the error
> path to propagate the failure.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Link v2: 
> https://lore.kernel.org/all/20260807065619.30604-2-phucduc.bui@gmail.com/
> Changes in v3:
>  - Use the phy_shutdown label instead of err_clk as suggested by 
>    Sashiko's review. 
>  - Add Peter Chen's Acked-by tag.
>  - Add Frank Li's Reviewed-by tag.
> 
>  drivers/usb/chipidea/ci_hdrc_imx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 9e529398c607..edbf9df9b8f2 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -532,8 +532,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (data->wakeup_irq > 0) {
>  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
> -			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> -			goto err_clk;
> +			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +			goto phy_shutdown;
>  		}
>  
>  		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> @@ -541,7 +541,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  						IRQF_ONESHOT | IRQF_NO_AUTOEN,
>  						irq_name, data);
>  		if (ret)
> -			goto err_clk;
> +			goto phy_shutdown;
>  	}
>  
>  	ret = imx_usbmisc_init(data->usbmisc_data);
> -- 
> 2.43.0
>

This patch did not apply, please rebase and resend.

thanks,
greg k-h

