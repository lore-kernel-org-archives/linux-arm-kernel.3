Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C6FD78337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4p9L3WynVWS3/9qrfAh6tknbwJMhgvUvCi5+992Cpg=; b=OZXFllmVLgzWd+Qps1JyPpTxNn
	yLam+nT2VfEAQx21EkjIFP5VZ8nF7kKUi2kO8XUbivsW8LNo9GRQvZ7hUSqx79NJx/BgSvHMw7/6v
	zrVKkSl0kPFMkdXC3BlHoaa1bcXECdiPZISC3RoroTVcoX2Acgm28bJAsmmTwmbwjdBziNkyHnsFJ
	KhohoGCsdXzdJR7Glk+HPXkAMbyn05KW4yZZsK8LtlhrXoDKVgCZDOa8wvDBTQ9DKL4tGHELM97uB
	29w13r5LAC6JPMgI7jqGFcZQpUGBULFH4Cb82+x4A01RnF5jAwR/YreJZXtXZV35B4jRzQoquQmO4
	y3vJsFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9ga-00000006vvq-1CBs;
	Mon, 02 Dec 2024 16:54:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9fI-00000006vjb-0qZY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD69F5C5DFE;
	Mon,  2 Dec 2024 16:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0C7C4CED1;
	Mon,  2 Dec 2024 16:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733158371;
	bh=Q4lgsKkUPNBCVPx2h6Wla6/xJs8K53Ur7RI1wCNcloo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i7eCKFg1KXaaddaBtfqvXEQXCx2za65xSHDAg3p8iOSCWY6ytSNVv12kFL7z7CWvq
	 0DMDJHotcWDgEDTMj4PylU1/giO6ZMrur/AUevxXMWfJF2QSKA3PdTnFBuglYs9v1l
	 zCVze3VgoxR4wEK0qEngPtu4l8FdTi7N57nYrhTLhhuUiGnk52yUwNHMtO6TRkLpKD
	 UO1NIPx7IyPzKssU3ntLNZQ0wOGJoLJEbIu5NOn9z91bBvHGpBiuRqU9SfQfDX5wWr
	 2rARLFekFQxrlVxy3Fzeu/aF4tQcZku6YYQMY6hDpWKslOmAWnZO0V9FbFOSRigjCM
	 3xbcYpmeBH+9Q==
Date: Mon, 2 Dec 2024 22:22:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V5 2/9] dmaengine: bcm2835-dma: add suspend/resume pm
 support
Message-ID: <Z03l308ur7xuE1SB@vaman>
References: <20241025103621.4780-1-wahrenst@gmx.net>
 <20241025103621.4780-3-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025103621.4780-3-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_085252_281731_32241153 
X-CRM114-Status: GOOD (  22.19  )
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

On 25-10-24, 12:36, Stefan Wahren wrote:
> bcm2835-dma provides the service to others, so it should
> suspend late and resume early.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/dma/bcm2835-dma.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index e1b92b4d7b05..647dda9f3376 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -875,6 +875,35 @@ static struct dma_chan *bcm2835_dma_xlate(struct of_phandle_args *spec,
>  	return chan;
>  }
> 
> +static int bcm2835_dma_suspend_late(struct device *dev)
> +{
> +	struct bcm2835_dmadev *od = dev_get_drvdata(dev);
> +	struct bcm2835_chan *c, *next;
> +
> +	list_for_each_entry_safe(c, next, &od->ddev.channels,
> +				 vc.chan.device_node) {
> +		void __iomem *chan_base = c->chan_base;
> +
> +		if (readl(chan_base + BCM2835_DMA_ADDR)) {
> +			dev_warn(dev, "Suspend is prevented by chan %d\n",
> +				 c->ch);
> +			return -EBUSY;
> +		}

Can you help understand how this helps by logging... we are not adding
anything except checking this and resume is NOP as well!

> +	}
> +
> +	return 0;
> +}
> +
> +static int bcm2835_dma_resume_early(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops bcm2835_dma_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late,
> +				     bcm2835_dma_resume_early)
> +};
> +
>  static int bcm2835_dma_probe(struct platform_device *pdev)
>  {
>  	struct bcm2835_dmadev *od;
> @@ -1033,6 +1062,7 @@ static struct platform_driver bcm2835_dma_driver = {
>  	.driver = {
>  		.name = "bcm2835-dma",
>  		.of_match_table = of_match_ptr(bcm2835_dma_of_match),
> +		.pm = pm_ptr(&bcm2835_dma_pm_ops),
>  	},
>  };
> 
> --
> 2.34.1

-- 
~Vinod

