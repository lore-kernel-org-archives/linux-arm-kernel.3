Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A51CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHp8LbQ3tfu/qCEov/2MXBKiUQ8r4pjaRCCvGAVeiew=; b=xHmFeY28cucUmiVr3B7OFlizwt
	negeKk4kzz/ZuDho8dN4eL85KcJPLhK2H03UgjD6/V45M55jS59yen4vQ4pRL1oesP+SBmkrTZ4Id
	0Ki8OGDW7uFwTCZj3c4e9OI2tIn9KLj9MZOmxQ4PUm4Ncpg/YGSKtttrPKju9CxhoSoAxIjxUODtB
	8TSg6Q3aKulPGEur+9BFGEzJN2oaQ6FHzuDSxwltaGBaCImf2jaVmPeFf+lov89HQ/3oC9irHNHMC
	4cTvW4gePnjwkzWr2VsRc5CA0gbORQpehQguosuaH+ilWepUzEG38etohtn0k6GjYSXxnnTn7kv22
	ZK97gBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITQv-00000005eEt-2vWU;
	Mon, 10 Nov 2025 15:03:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITQu-00000005eEd-1pWv;
	Mon, 10 Nov 2025 15:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C0C560145;
	Mon, 10 Nov 2025 15:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9B3C19425;
	Mon, 10 Nov 2025 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762787031;
	bh=sbDuCxiH4BWmq1jNsQnpgU8AKhximrB4rxK/Jdna2kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8PXbnaQMWmMJIx1higvqx2H6vt9K1FdO5kEhsnasDcPZtMs5a6sbExVxrxIcq5TK
	 wTJPJZOAjz7lAWe8alVoFxMIFMZP04jkyvZizkiF9kaatFcwS5ZO4+bvM+TtvlKOvC
	 I11LXqM8yr56kRauiBRBO9ynO/qF9VIaI9/7mgfm36ydUYt9s4qinZ7qROKHAMWogc
	 iRio20p8f9Bs2x3TTycyByUCIlhh/EdayCDnE6+9FaIyj/1kXDK6oOyFM+oVt7aQgw
	 G8lnvqumVp8Bur7sr0HTcWyn8L/ZBiiD7wAGyp02AZkBEOfCbWe/czoS7jxTgNsZ61
	 shRuRsgMwLZgA==
Date: Mon, 10 Nov 2025 09:07:56 -0600
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
Subject: Re: [PATCH v2 10/13] dmaengine: qcom: bam_dma: use
 sg_nents_for_dma() helper
Message-ID: <ibcqximr6bt7ed7eizuyhhsaqadgvuomy7qpefito26fjpiqwf@ptsxovmyt3le>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
 <20251110103805.3562136-11-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110103805.3562136-11-andriy.shevchenko@linux.intel.com>
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

On Mon, Nov 10, 2025 at 11:23:37AM +0100, Andy Shevchenko wrote:
> Instead of open coded variant let's use recently introduced helper.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/dma/qcom/bam_dma.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 2cf060174795..62b3921f0d11 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -655,22 +655,17 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
>  	struct scatterlist *sg;
>  	u32 i;
>  	struct bam_desc_hw *desc;
> -	unsigned int num_alloc = 0;
> -
> +	unsigned int num_alloc;
>  
>  	if (!is_slave_direction(direction)) {
>  		dev_err(bdev->dev, "invalid dma direction\n");
>  		return NULL;
>  	}
>  
> -	/* calculate number of required entries */
> -	for_each_sg(sgl, sg, sg_len, i)
> -		num_alloc += DIV_ROUND_UP(sg_dma_len(sg), BAM_FIFO_SIZE);
> -
>  	/* allocate enough room to accommodate the number of entries */
> +	num_alloc = sg_nents_for_dma(sgl, sg_len, BAM_FIFO_SIZE);
>  	async_desc = kzalloc(struct_size(async_desc, desc, num_alloc),
>  			     GFP_NOWAIT);
> -
>  	if (!async_desc)
>  		return NULL;
>  
> -- 
> 2.50.1
> 
> 

