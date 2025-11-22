Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280B9CF64B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 09:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RylocnGNTx6wCfwWD+c9gsdqNMpQdAp/43kL+3KvYGI=; b=Od5PWhkATkNG7ciEXV6zBRfaD4
	6E8c98C2GLLNdhxSOSTXqbL5gadScHArt7yOEikiwC1c3TDTFJuxIUxRB6sk4L0R8CmgR+XO71zvY
	tGG3EYV1BNN4GILVOgRO895fD/aKbY2N+D+UKrk8xoQh69UsK0vxMpPRgeECrtfyJQBjv2M/YFDUa
	0JnWF6HMfLX9n+Rse2/kQ+yR+rX9Frpme8PMW38MWDfegfVGeuAaOGCJW15LlGCq9FVuh3hViUOMH
	cQ2tI9w3xr7+HbQAJ6QHJmpZwttlWRiukJQc6flCts7fjd6jI4HYXtIrvOAyvevBdcQEYX8syuNLO
	Q5wikPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjug-00000009PiN-3Mwe;
	Sat, 22 Nov 2025 09:28:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjue-00000009Phv-3mgX;
	Sat, 22 Nov 2025 09:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E44340875;
	Sat, 22 Nov 2025 09:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C475C4CEF5;
	Sat, 22 Nov 2025 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763803689;
	bh=fCIbXX1DxW/p/enlcdbuN2TWu+7bm/aQ64q3BvK3u18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DisgpbN3ZfdHjexeiluYB2gdCO4W8W/Yna3K8wMg3GxXQUCGIr3NDCdE9MmA+IdaH
	 J2T+CeJpRsyxmJK3JzP47v5eJw6Mh7zz2+X+XjlIkZUJkkSTUYvrNBxt8TANeorEzU
	 PuxfeVwakWGXE1NdvP+cWodKsPNu0/Jmo0OLYch4z2nrVBTqtJhP7SUtGiIsEpmeIX
	 RI0xQRejV5zAsp8sEMFgkSqB04mZ7iDCRQrJKozNUtw080FJHRxH8GaJCwszr6YkKa
	 O63PxslQM/ZZBDnko/tYirovuzqmK0HHGKBK0HvytNqtw4kiPsCoTvWPTcR8DSULew
	 wxgBWlioyUmTQ==
Date: Sat, 22 Nov 2025 14:58:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 07/13] dmaengine: lgm: use sg_nents_for_dma() helper
Message-ID: <aSGCJQc152Y9V10E@vaman>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
 <20251110103805.3562136-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251110103805.3562136-8-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_012812_988863_399B80D9 
X-CRM114-Status: GOOD (  14.20  )
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

On 10-11-25, 11:23, Andy Shevchenko wrote:
> Instead of open coded variant let's use recently introduced helper.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/dma/lgm/lgm-dma.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/lgm/lgm-dma.c b/drivers/dma/lgm/lgm-dma.c
> index 8173c3f1075a..7d4d3dde6d88 100644
> --- a/drivers/dma/lgm/lgm-dma.c
> +++ b/drivers/dma/lgm/lgm-dma.c
> @@ -1164,8 +1164,8 @@ ldma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>  	struct dw2_desc *hw_ds;
>  	struct dw2_desc_sw *ds;
>  	struct scatterlist *sg;
> -	int num = sglen, i;
>  	dma_addr_t addr;
> +	int num, i;
>  
>  	if (!sgl)
>  		return NULL;
> @@ -1173,12 +1173,7 @@ ldma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>  	if (d->ver > DMA_VER22)
>  		return ldma_chan_desc_cfg(chan, sgl->dma_address, sglen);
>  
> -	for_each_sg(sgl, sg, sglen, i) {
> -		avail = sg_dma_len(sg);
> -		if (avail > DMA_MAX_SIZE)
> -			num += DIV_ROUND_UP(avail, DMA_MAX_SIZE) - 1;
> -	}
> -
> +	num = sg_nents_for_dma(sgl, sg_len, DMA_MAX_SIZE);

drivers/dma/lgm/lgm-dma.c:1176:37: error: ‘sg_len’ undeclared (first use in this function); did you mean ‘sglen’?
         num = sg_nents_for_dma(sgl, sg_len, DMA_MAX_SIZE);

I am getting the build failure, as well as few unused warning with this,
pls fix

-- 
~Vinod

