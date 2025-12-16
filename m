Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDFCD5E146
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 12:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0A61e71oh5hPnbyzCDbF+a2Sci02ImBvzQAdizlcBdw=; b=CE1N4aJnQ8p9sLlShEUBdmqNMJ
	mDC57kzlPOAwr2eb0KxNCFHu+bzLEhtNOuQOVyiG/rZwzZOw7KPBWc2zovD87kweR1H8DI25iqUhy
	u853AzYWutGcj01wA6HwAE843RWKA/f3/qGQcVg+5Ax1CyakhCn4j6u9NxYyDn91LfYN7qowwjFRc
	oWA9H7qp/Jui6TseVtMmKZBb/P+6/sxiKwk610Gb9bFY/GVxpw06BJTsLJT51tE27a1XoHIgJgnol
	HS28IrMlE42sZKA7zDvV+AIT+Ciwb8V57Jdpfpqkc61tvIMIAOin9bSq5qBOhVnW5FRTCKH7lVvr+
	bCzvbN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUWE-00000005DHH-0zGr;
	Tue, 16 Dec 2025 12:51:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUWC-00000005DGt-0pYu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 12:51:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B9C0FEC;
	Tue, 16 Dec 2025 04:50:59 -0800 (PST)
Received: from [10.57.43.186] (unknown [10.57.43.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B6363F694;
	Tue, 16 Dec 2025 04:51:04 -0800 (PST)
Message-ID: <910e3db2-c4ef-4c21-9336-49469234b8e6@arm.com>
Date: Tue, 16 Dec 2025 12:51:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dma: arm-dma350: add support for shared interrupt
 mode
To: Jun Guo <jun.guo@cixtech.com>, peter.chen@cixtech.com,
 fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org, jelly.jia@cixtech.com
References: <20251216123026.3519923-1-jun.guo@cixtech.com>
 <20251216123026.3519923-3-jun.guo@cixtech.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251216123026.3519923-3-jun.guo@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_045108_335767_67C6C14B 
X-CRM114-Status: GOOD (  30.36  )
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

On 2025-12-16 12:30 pm, Jun Guo wrote:
> The arm dma350 controller's hardware implementation varies: some
> designs dedicate a separate interrupt line for each channel, while
> others have all channels sharing a single interrupt.This patch adds
> support for the hardware design where all DMA channels share a
> single interrupt.
> 
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
> ---
>   drivers/dma/arm-dma350.c | 124 +++++++++++++++++++++++++++++++++++----
>   1 file changed, 114 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 9efe2ca7d5ec..6bea18521edd 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -14,6 +14,7 @@
>   #include "virt-dma.h"
>   
>   #define DMAINFO			0x0f00
> +#define DRIVER_NAME		"arm-dma350"
>   
>   #define DMA_BUILDCFG0		0xb0
>   #define DMA_CFG_DATA_WIDTH	GENMASK(18, 16)
> @@ -142,6 +143,9 @@
>   #define LINK_LINKADDR		BIT(30)
>   #define LINK_LINKADDRHI		BIT(31)
>   
> +/* DMA NONSECURE CONTROL REGISTER */
> +#define DMANSECCTRL		0x20c
> +#define INTREN_ANYCHINTR_EN	BIT(0)
>   
>   enum ch_ctrl_donetype {
>   	CH_CTRL_DONETYPE_NONE = 0,
> @@ -192,11 +196,16 @@ struct d350_chan {
>   
>   struct d350 {
>   	struct dma_device dma;
> +	void __iomem *base;
>   	int nchan;
>   	int nreq;
>   	struct d350_chan channels[] __counted_by(nchan);
>   };
>   
> +struct d350_driver_data {
> +	bool combined_irq;
> +};
> +
>   static inline struct d350_chan *to_d350_chan(struct dma_chan *chan)
>   {
>   	return container_of(chan, struct d350_chan, vc.chan);
> @@ -461,7 +470,61 @@ static void d350_issue_pending(struct dma_chan *chan)
>   	spin_unlock_irqrestore(&dch->vc.lock, flags);
>   }
>   
> -static irqreturn_t d350_irq(int irq, void *data)
> +static irqreturn_t d350_global_irq(int irq, void *data)
> +{
> +	struct d350 *dmac = (struct d350 *)data;
> +	struct device *dev = dmac->dma.dev;
> +	irqreturn_t ret = IRQ_NONE;
> +	int i;
> +
> +	for (i = 0; i < dmac->nchan; i++) {
> +		struct d350_chan *dch = &dmac->channels[i];
> +		u32 ch_status;
> +
> +		ch_status = readl(dch->base + CH_STATUS);
> +		if (!ch_status)
> +			continue;
> +
> +		ret = IRQ_HANDLED;
> +
> +		if (ch_status & CH_STAT_INTR_ERR) {
> +			struct virt_dma_desc *vd = &dch->desc->vd;
> +			u32 errinfo = readl_relaxed(dch->base + CH_ERRINFO);
> +
> +			if (errinfo &
> +			    (CH_ERRINFO_AXIRDPOISERR | CH_ERRINFO_AXIRDRESPERR))
> +				vd->tx_result.result = DMA_TRANS_READ_FAILED;
> +			else if (errinfo & CH_ERRINFO_AXIWRRESPERR)
> +				vd->tx_result.result = DMA_TRANS_WRITE_FAILED;
> +			else
> +				vd->tx_result.result = DMA_TRANS_ABORTED;
> +
> +			vd->tx_result.residue = d350_get_residue(dch);
> +		} else if (!(ch_status & CH_STAT_INTR_DONE)) {
> +			dev_warn(dev, "Channel %d unexpected IRQ: 0x%08x\n", i,
> +				 ch_status);
> +		}
> +
> +		writel_relaxed(ch_status, dch->base + CH_STATUS);
> +
> +		spin_lock(&dch->vc.lock);
> +		if (ch_status & CH_STAT_INTR_DONE) {
> +			vchan_cookie_complete(&dch->desc->vd);
> +			dch->status = DMA_COMPLETE;
> +			dch->residue = 0;
> +			d350_start_next(dch);
> +		} else if (ch_status & CH_STAT_INTR_ERR) {
> +			vchan_cookie_complete(&dch->desc->vd);
> +			dch->status = DMA_ERROR;
> +			dch->residue = dch->desc->vd.tx_result.residue;
> +		}
> +		spin_unlock(&dch->vc.lock);
> +	}
> +
> +	return ret;
> +}
> +
> +static irqreturn_t d350_channel_irq(int irq, void *data)
>   {
>   	struct d350_chan *dch = data;
>   	struct device *dev = dch->vc.chan.device->dev;
> @@ -506,10 +569,18 @@ static irqreturn_t d350_irq(int irq, void *data)
>   static int d350_alloc_chan_resources(struct dma_chan *chan)
>   {
>   	struct d350_chan *dch = to_d350_chan(chan);
> -	int ret = request_irq(dch->irq, d350_irq, IRQF_SHARED,
> -			      dev_name(&dch->vc.chan.dev->device), dch);
> -	if (!ret)
> -		writel_relaxed(CH_INTREN_DONE | CH_INTREN_ERR, dch->base + CH_INTREN);
> +	int ret = 0;
> +
> +	if (dch->irq) {
> +		ret = request_irq(dch->irq, d350_channel_irq, IRQF_SHARED,
> +				  dev_name(&dch->vc.chan.dev->device), dch);
> +		if (ret) {
> +			dev_err(chan->device->dev, "Failed to request IRQ %d\n", dch->irq);
> +			return ret;
> +		}
> +	}
> +
> +	writel_relaxed(CH_INTREN_DONE | CH_INTREN_ERR, dch->base + CH_INTREN);
>   
>   	return ret;
>   }
> @@ -526,7 +597,8 @@ static void d350_free_chan_resources(struct dma_chan *chan)
>   static int d350_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> -	struct d350 *dmac;
> +	struct d350 *dmac = NULL;
> +	const struct d350_driver_data *data;
>   	void __iomem *base;
>   	u32 reg;
>   	int ret, nchan, dw, aw, r, p;
> @@ -556,6 +628,7 @@ static int d350_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	dmac->nchan = nchan;
> +	dmac->base = base;
>   
>   	reg = readl_relaxed(base + DMAINFO + DMA_BUILDCFG1);
>   	dmac->nreq = FIELD_GET(DMA_CFG_NUM_TRIGGER_IN, reg);
> @@ -582,6 +655,27 @@ static int d350_probe(struct platform_device *pdev)
>   	dmac->dma.device_issue_pending = d350_issue_pending;
>   	INIT_LIST_HEAD(&dmac->dma.channels);
>   
> +	data = device_get_match_data(dev);
> +	/* Cix Sky1 has a common host IRQ for all its channels. */
> +	if (data && data->combined_irq) {
> +		int host_irq = platform_get_irq(pdev, 0);
> +
> +		if (host_irq < 0)
> +			return dev_err_probe(dev, host_irq,
> +					     "Failed to get IRQ\n");
> +
> +		ret = devm_request_irq(&pdev->dev, host_irq, d350_global_irq,
> +				       IRQF_SHARED, DRIVER_NAME, dmac);
> +		if (ret)
> +			return dev_err_probe(
> +				dev, ret,
> +				"Failed to request the combined IRQ %d\n",
> +				host_irq);
> +	}
> +
> +	/* Combined Non-Secure Channel Interrupt Enable */
> +	writel_relaxed(INTREN_ANYCHINTR_EN, dmac->base + DMANSECCTRL);

This one line is all that should be needed - all the rest is pointless 
overcomplication and churn. And either way, copy-pasting the entire IRQ 
handler is not OK.

Thanks,
Robin.

> +
>   	/* Would be nice to have per-channel caps for this... */
>   	memset = true;
>   	for (int i = 0; i < nchan; i++) {
> @@ -595,10 +689,15 @@ static int d350_probe(struct platform_device *pdev)
>   			dev_warn(dev, "No command link support on channel %d\n", i);
>   			continue;
>   		}
> -		dch->irq = platform_get_irq(pdev, i);
> -		if (dch->irq < 0)
> -			return dev_err_probe(dev, dch->irq,
> -					     "Failed to get IRQ for channel %d\n", i);
> +
> +		if (!data) {
> +			dch->irq = platform_get_irq(pdev, i);
> +			if (dch->irq < 0)
> +				return dev_err_probe(
> +					dev, dch->irq,
> +					"Failed to get IRQ for channel %d\n",
> +					i);
> +		}
>   
>   		dch->has_wrap = FIELD_GET(CH_CFG_HAS_WRAP, reg);
>   		dch->has_trig = FIELD_GET(CH_CFG_HAS_TRIGIN, reg) &
> @@ -639,7 +738,12 @@ static void d350_remove(struct platform_device *pdev)
>   	dma_async_device_unregister(&dmac->dma);
>   }
>   
> +static const struct d350_driver_data sky1_dma350_data = {
> +	.combined_irq = true,
> +};
> +
>   static const struct of_device_id d350_of_match[] __maybe_unused = {
> +	{ .compatible = "cix,sky1-dma-350", .data = &sky1_dma350_data },
>   	{ .compatible = "arm,dma-350" },
>   	{}
>   };


