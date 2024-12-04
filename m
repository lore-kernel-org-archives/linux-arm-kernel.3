Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6C4E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzdzb3S4118IzU61+N0n/KSKi8kZkv9kRU9TJ9ylkY4=; b=yeg5ropburVfn6h/l0grqZbmsA
	m0ayWELlYLSHPXorJtf752JIu1A7VlbxvKWm66LJ/4gz10vkXlnVRcAE0ghTI4RN9xVdIa5evVTkQ
	7QN08356/UUpNQkpI8oPJBWIBDO0NqRC98LToi4lKTNFrm1rf85FfG9kq0uUPJuV8aufuqQox2Gr2
	/YOe9Qf+N6JJdnenp5L6GSPqalpO2F/7/qY2GFLd7iigMJEk1oof7IyH9hmGerH7mAi0oyj0+uP5g
	F/jPrHUDMaR5Qx7JcIn6Mbx47k1oM4WAYMRltKWr9g9VxF1HOjcx8SBSdpPV05aJ+OSqajUsrJ1+r
	tqxVRmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoX8-0000000CWnW-09Id;
	Wed, 04 Dec 2024 12:31:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoUQ-0000000CW8J-2jgK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 12:28:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AFB6BA4140F;
	Wed,  4 Dec 2024 12:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AFAC4CED1;
	Wed,  4 Dec 2024 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733315301;
	bh=0esWkB65X/oo0wpPGn1s8FVihkOj05L6lVwMoKq7XrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yk+pX1eynZsmc8x6Om6FhATvU+rnJ3HzRRDV8nLnRNp3YCikYOz61K8XJJt+j38je
	 izYAQPK6L88Rm4VDrJsbVCrFczn4lu50bTVSEXJmKwcMn/8thHdnGdyP09uUJIJC66
	 9/eBrGJXLqDYUbo5a4Ik/fN/JuDJHOWxmFCxrjaZjoWoRVtNJDQTJAB9LJsPg58BTc
	 ctP1ANau81fwy28kpPuAgFJL0JB41Rnn3SOYPLgQR1xlcDZUH5wl6c4V0jgXFVqfrp
	 b44PTGu9uUFc8NHglcM7xgQIFN5sbD0qJou7kg7lo7kgk5LOop9E3Niq31ujjyhuQs
	 MCJGdrOKE9eag==
Date: Wed, 4 Dec 2024 17:58:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org
Subject: Re: [PATCH V6] dmaengine: bcm2835-dma: add suspend/resume pm support
Message-ID: <Z1BK4rcOvCoA+xdH@vaman>
References: <20241202114627.33401-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202114627.33401-1-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_042822_756566_CAAAE930 
X-CRM114-Status: GOOD (  22.26  )
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

On 02-12-24, 12:46, Stefan Wahren wrote:
> bcm2835-dma provides the service to others, so it should
> suspend late and resume early.

Expecting v7 with updated title and changelog and dropping resume

> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/dma/bcm2835-dma.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
>  Changes in V6:
>  - split out of series because there is no dependency
> 
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 7ba52dee40a9..cf8a01a5b884 100644
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

