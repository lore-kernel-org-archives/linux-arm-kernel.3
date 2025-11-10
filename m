Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9552CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Zw8sr0ISH1dRiMGQj9HLflPlzDRgwo4UijnYBgiNU8=; b=hn2GwfpOMMTxXIDivEAslHx43F
	bLGRxDbWF/a4hI0oEoPdxP4ljhXbnwfjShZP2V4+QvdkkbEDCLW3D7s7XhzCsPxyb/jx763roiceL
	jOoDVQuwGM28UWH8sBnvdOLFKczXAfBH0URio6CdY8jrVjg3QDfGhrCvOyhNi31ZOg3U4QA2ZKaPl
	3QNA0/32GWJLWqHOoU43lioc54GJoBCPP/YbQNu1AwcB3ZudO3F4xuojYXbF0NwbnB0Q44pw2nfij
	3ReDZRtCmoucQfMHEOV608LYIQWTQUlan+6deW43WKnboQLVipbrR/+kyW+oU0jMu6qv8dHSLJ9jB
	z93shnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITQN-00000005eB5-2lNV;
	Mon, 10 Nov 2025 15:03:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITQH-00000005eAb-069Q;
	Mon, 10 Nov 2025 15:03:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C78E543A0D;
	Mon, 10 Nov 2025 15:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A06C4CEF5;
	Mon, 10 Nov 2025 15:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762786990;
	bh=PGVjyNwZo45ZtDA9pDb5Hj7UUNqVxTVZ/YFcQGSojTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZShMrxCgzncx/j0Eb64AiWxYjenENvTq9Mx8U3xbRFOcDtKq/bNfA0x1UHXU0t1s6
	 svBn50q58WNISZkpLZqf4Bwk6lGsZg8JSRt47IB1HRPhFU8txcF+jUDycNBBYdLOLn
	 cMvQEbf6NrRRJtxI8v6DSiNuU4kp1LuTOD6ClchIGyy6ConTsporu3TDCIoImwn4gh
	 H+BRa3IqlB9EII1UOH39yL5jdzHd6XXNn9H2ycV3/SoiM3TRCZq2JiFqzSniFXeM5I
	 WzVqT3L0+OyCo8PafeDIhHQCIEI55gQXUJcVTw+yyGsZJbawHTy1M7fF3SJI+XiTGk
	 UOLrm1akYevRg==
Date: Mon, 10 Nov 2025 09:07:16 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Vinod Koul <vkoul@kernel.org>, 
	Thomas Andreatta <thomasandreatta2000@gmail.com>, Caleb Sander Mateos <csander@purestorage.com>, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Olivier Dautricourt <olivierdautricourt@gmail.com>, 
	Stefan Roese <sr@denx.de>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 09/13] dmaengine: qcom: adm: use sg_nents_for_dma()
 helper
Message-ID: <6h44m3aoqaitosivcbnuz2ynhon2de3vpxk6egz54vgfqxnsgi@ykhk73irtfcv>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
 <20251110103805.3562136-10-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110103805.3562136-10-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_070313_080089_8A98D153 
X-CRM114-Status: GOOD (  16.61  )
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

On Mon, Nov 10, 2025 at 11:23:36AM +0100, Andy Shevchenko wrote:
> Instead of open coded variant let's use recently introduced helper.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/dma/qcom/qcom_adm.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
> index 6be54fddcee1..490edad20ae6 100644
> --- a/drivers/dma/qcom/qcom_adm.c
> +++ b/drivers/dma/qcom/qcom_adm.c
> @@ -390,16 +390,15 @@ static struct dma_async_tx_descriptor *adm_prep_slave_sg(struct dma_chan *chan,
>  	}
>  
>  	/* iterate through sgs and compute allocation size of structures */
> -	for_each_sg(sgl, sg, sg_len, i) {
> -		if (achan->slave.device_fc) {
> +	if (achan->slave.device_fc) {
> +		for_each_sg(sgl, sg, sg_len, i) {
>  			box_count += DIV_ROUND_UP(sg_dma_len(sg) / burst,
>  						  ADM_MAX_ROWS);
>  			if (sg_dma_len(sg) % burst)
>  				single_count++;
> -		} else {
> -			single_count += DIV_ROUND_UP(sg_dma_len(sg),
> -						     ADM_MAX_XFER);
>  		}
> +	} else {
> +		single_count = sg_nents_for_dma(sgl, sg_len, ADM_MAX_XFER);
>  	}
>  
>  	async_desc = kzalloc(sizeof(*async_desc), GFP_NOWAIT);
> -- 
> 2.50.1
> 
> 

