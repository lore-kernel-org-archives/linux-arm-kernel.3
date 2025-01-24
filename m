Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21548C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 07:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Y05hHKnAbWD86OxkY9PMUh5lXuaMQxidsnJLbUWA8E=; b=O3nYI4DyL47ZYAUNF7bKE1ryc5
	oPva/7QXveMCL6pRN9u7TaU2+XHgVRcVPO6iJezAPytJx9GV106rKGRa9fM0EJvuZ53dzxOALuLm0
	M5+vGvpwMBSKcG0LOHrwJS4av7qSp6bO41yxaasTOHRG7lF/B9ckRJMShkKwK2FCCT8kbjG1TD5El
	4SnkzZfpB2qNllZK3ELSX+ZewVMqX6Xy6ip+MzXEDxkXrGV0QBeY9igEJcwPUKN3fv8oIEolitmo/
	WoMNzJKnqGXlOXMUdy/40ZqSa67xjAEjneTjivTZgjFGloU2qNfXOTrwV4bJ+3AcXdQvr1IcFns21
	ARGVHzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbELa-0000000E9lj-0kF1;
	Fri, 24 Jan 2025 07:43:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEKB-0000000E9cr-0sMI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 07:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 17A36A40D1F;
	Fri, 24 Jan 2025 07:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A40C4CED2;
	Fri, 24 Jan 2025 07:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737704514;
	bh=LtGQ9GcNCChAuCNN8eFZIdvn5KWY2sYQU1DJBy1zg8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IobD++/kJMHhE4BEWOcV0oTBgxhJE9JMVGJHCK+3qARoBDFr3qSYJORtpGSeql49g
	 peGjHQsJ7el/raIFAAcJzggnye8Nc65BIT7bRQT1O/dqSmS3cmiudzmRmmXPQ6h+HE
	 x5DLaD13QlPAWgbpNI0gNI2+cpinWM6Fr1rNXl/0YWfRH5TTSwMArj/bCdjFbrOtVP
	 SqM7JCcdkps27loG94kMnokBOh6acXhFla7jA6CnoLPF7gDMfakKXfU0uMHrBP/4Q+
	 UuPf+fmo3CaNgbulAlZLGjEcK4jyxaWerl8jgXLJ+EFy9h1VCMuVcyJV32KrhXdfyR
	 gyxT+ZCttLfsw==
Date: Fri, 24 Jan 2025 13:11:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/2] dmaengine: Use str_enable_disable-like helpers
Message-ID: <20250124074139.oa3zvdehgi5366nn@thinkpad>
References: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_234155_389849_E438C90C 
X-CRM114-Status: GOOD (  21.71  )
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

On Tue, Jan 14, 2025 at 08:10:20PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> #dw-edma

- Mani

> 
> ---
> 
> Changes in v2:
> 1. Also drivers/dma/dw-edma/dw-edma-core.c and drivers/dma/sun6i-dma.c
> ---
>  drivers/dma/dw-edma/dw-edma-core.c | 6 ++++--
>  drivers/dma/imx-dma.c              | 3 ++-
>  drivers/dma/pxa_dma.c              | 4 ++--
>  drivers/dma/sun6i-dma.c            | 3 ++-
>  drivers/dma/ti/edma.c              | 3 ++-
>  drivers/dma/xilinx/xilinx_dma.c    | 3 ++-
>  6 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 68236247059d..c2b88cc99e5d 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -15,6 +15,7 @@
>  #include <linux/irq.h>
>  #include <linux/dma/edma.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/string_choices.h>
>  
>  #include "dw-edma-core.h"
>  #include "dw-edma-v0-core.h"
> @@ -746,7 +747,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
>  		chan->ll_max -= 1;
>  
>  		dev_vdbg(dev, "L. List:\tChannel %s[%u] max_cnt=%u\n",
> -			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
> +			 str_write_read(chan->dir == EDMA_DIR_WRITE),
>  			 chan->id, chan->ll_max);
>  
>  		if (dw->nr_irqs == 1)
> @@ -767,7 +768,8 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
>  		memcpy(&chan->msi, &irq->msi, sizeof(chan->msi));
>  
>  		dev_vdbg(dev, "MSI:\t\tChannel %s[%u] addr=0x%.8x%.8x, data=0x%.8x\n",
> -			 chan->dir == EDMA_DIR_WRITE  ? "write" : "read", chan->id,
> +			 str_write_read(chan->dir == EDMA_DIR_WRITE),
> +			 chan->id,
>  			 chan->msi.address_hi, chan->msi.address_lo,
>  			 chan->msi.data);
>  
> diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
> index a651e0995ce8..de8d7070904e 100644
> --- a/drivers/dma/imx-dma.c
> +++ b/drivers/dma/imx-dma.c
> @@ -17,6 +17,7 @@
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk.h>
>  #include <linux/dmaengine.h>
> @@ -942,7 +943,7 @@ static struct dma_async_tx_descriptor *imxdma_prep_dma_interleaved(
>  		"   src_sgl=%s dst_sgl=%s numf=%zu frame_size=%zu\n", __func__,
>  		imxdmac->channel, (unsigned long long)xt->src_start,
>  		(unsigned long long) xt->dst_start,
> -		xt->src_sgl ? "true" : "false", xt->dst_sgl ? "true" : "false",
> +		str_true_false(xt->src_sgl), str_true_false(xt->dst_sgl),
>  		xt->numf, xt->frame_size);
>  
>  	if (list_empty(&imxdmac->ld_free) ||
> diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
> index e50cf3357e5e..249296389771 100644
> --- a/drivers/dma/pxa_dma.c
> +++ b/drivers/dma/pxa_dma.c
> @@ -10,6 +10,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/dmaengine.h>
>  #include <linux/platform_device.h>
>  #include <linux/device.h>
> @@ -277,8 +278,7 @@ static int chan_state_show(struct seq_file *s, void *p)
>  	seq_printf(s, "\tPriority : %s\n",
>  			  str_prio[(phy->idx & 0xf) / 4]);
>  	seq_printf(s, "\tUnaligned transfer bit: %s\n",
> -			  _phy_readl_relaxed(phy, DALGN) & BIT(phy->idx) ?
> -			  "yes" : "no");
> +			  str_yes_no(_phy_readl_relaxed(phy, DALGN) & BIT(phy->idx)));
>  	seq_printf(s, "\tDCSR  = %08x (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)\n",
>  		   dcsr, PXA_DCSR_STR(RUN), PXA_DCSR_STR(NODESC),
>  		   PXA_DCSR_STR(STOPIRQEN), PXA_DCSR_STR(EORIRQEN),
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 95ecb12caaa5..2215ff877bf7 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -19,6 +19,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/types.h>
>  
>  #include "virt-dma.h"
> @@ -553,7 +554,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  			continue;
>  
>  		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
> -			i ? "high" : "low", status);
> +			str_high_low(i), status);
>  
>  		writel(status, sdev->base + DMA_IRQ_STAT(i));
>  
> diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
> index 4ece125b2ae7..b1a54655e6ce 100644
> --- a/drivers/dma/ti/edma.c
> +++ b/drivers/dma/ti/edma.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/string_choices.h>
>  #include <linux/of.h>
>  #include <linux/of_dma.h>
>  #include <linux/of_irq.h>
> @@ -2047,7 +2048,7 @@ static int edma_setup_from_hw(struct device *dev, struct edma_soc_info *pdata,
>  	dev_dbg(dev, "num_qchannels: %u\n", ecc->num_qchannels);
>  	dev_dbg(dev, "num_slots: %u\n", ecc->num_slots);
>  	dev_dbg(dev, "num_tc: %u\n", ecc->num_tc);
> -	dev_dbg(dev, "chmap_exist: %s\n", ecc->chmap_exist ? "yes" : "no");
> +	dev_dbg(dev, "chmap_exist: %s\n", str_yes_no(ecc->chmap_exist));
>  
>  	/* Nothing need to be done if queue priority is provided */
>  	if (pdata->queue_priority_mapping)
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 108a7287f4cd..3ad44afd0e74 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -46,6 +46,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/clk.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  
> @@ -2940,7 +2941,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
>  			    XILINX_DMA_DMASR_SG_MASK)
>  			chan->has_sg = true;
>  		dev_dbg(chan->dev, "ch %d: SG %s\n", chan->id,
> -			chan->has_sg ? "enabled" : "disabled");
> +			str_enabled_disabled(chan->has_sg));
>  	}
>  
>  	/* Initialize the tasklet */
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

