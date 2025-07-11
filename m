Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJlNBkuWVdutfVbuSjBJz+KoaFUSj5G+qp8tZ+jXmq0=; b=URrXXqeqa0QXNgVX9aiXke+igR
	e1PXlswk1j2+So87VY1s1hoCfxs/2Dlx981mKP1k2Pr/OKItEZqalMMxbe3/q8dw0EFc9K9O82P9O
	1hik9LERy2308mXY8/rowcAffcKutuy4pOtq1+nsUEQPUi0H4argGBU0ZSOHfSv4LIVf7yyRdl2nA
	sudGElYSPmD65o9LlRx7+joF9IdVquq2jBz+ze+7X7+GaWqGgwSwWexqYVn9mEuJpVh/UjfchfOQV
	QloqdNb+AWoHfrxmNNHWahIoe5DBhOE+VR7fYS5E9aZDJiSkvAR9NiQaqbvCGTp5BGIkk6Gw7Uo7O
	B/Z3VgXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6UO-0000000DlzF-3rOe;
	Fri, 11 Jul 2025 05:40:04 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6NA-0000000Dl5K-1aYP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 05:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:Cc:Subject:
	To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CJlNBkuWVdutfVbuSjBJz+KoaFUSj5G+qp8tZ+jXmq0=; b=VSHEWIr/Q4cpHcFIHJHdzn+y98
	pjzy2Y48KJiQp5RUcaSueaoIMtfYKfd5LohJGE5MllPzmdinbR3rEetsobSI4jNcu0jolOHr7cJtI
	yuU5Dwp3ClaeCMdYczFDhcoOQ363R4K82HswyGr/z0qrPX4LynzVX+TMyjJnW/8sFTwzmnNT7+Oaa
	En92c7kj2yaRxsqDSQMpWUMyhCmyOkxp/oU81Y8yt63RFB7aq09BUzNyf7aS2mt4MsIN0ihhIMUD8
	yfHYvnl/vLfUgaFJXrgBJMTARK7bq8AUZJyxQ52DmFTnMrRpqYTX1HAKOAiPaVJjL99o4fkc7PWDF
	EYUEWJCA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1ua6My-00006M-1w;
	Fri, 11 Jul 2025 07:32:24 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1ua6My-0002Gq-07;
	Fri, 11 Jul 2025 07:32:24 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 05:32:23 +0000
Message-Id: <DB8ZAMDZH15T.2BGP4DG9MBAGU@folker-schwesinger.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Suraj Gupta" <suraj.gupta2@amd.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <michal.simek@amd.com>, <vkoul@kernel.org>, <radhey.shyam.pandey@amd.com>
Subject: Re: [PATCH V2 2/4] dmaengine: xilinx_dma: Fix irq handler and start
 transfer path for AXI DMA
Cc: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <harini.katakam@amd.com>
X-Mailer: aerc 0.20.1-112-gd31995f1e20b
References: <20250710101229.804183-1-suraj.gupta2@amd.com>
 <20250710101229.804183-3-suraj.gupta2@amd.com>
In-Reply-To: <20250710101229.804183-3-suraj.gupta2@amd.com>
X-Virus-Scanned: Clear (ClamAV 1.0.7/27695/Thu Jul 10 11:08:41 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_223236_742335_1FAFEBCF 
X-CRM114-Status: GOOD (  14.51  )
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

On Thu Jul 10, 2025 at 12:12 PM CEST, Suraj Gupta wrote:
> AXI DMA driver incorrectly assumes complete transfer completion upon
> IRQ reception, particularly problematic when IRQ coalescing is active.
> Updating the tail pointer dynamically fixes it.
> Remove existing idle state validation in the beginning of
> xilinx_dma_start_transfer() as it blocks valid transfer initiation on
> busy channels with queued descriptors.
> Additionally, refactor xilinx_dma_start_transfer() to consolidate coalesc=
e
> and delay configurations while conditionally starting channels
> only when idle.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Fixes: Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI =
Direct Memory Access Engine")

This fixes an issue I recently ran into which prevented starting
consecutive transfers. Thanks and:

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index a34d8f0ceed8..187749b7b8a6 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1548,9 +1548,6 @@ static void xilinx_dma_start_transfer(struct xilinx=
_dma_chan *chan)
>  	if (list_empty(&chan->pending_list))
>  		return;
> =20
> -	if (!chan->idle)
> -		return;
> -
>  	head_desc =3D list_first_entry(&chan->pending_list,
>  				     struct xilinx_dma_tx_descriptor, node);
>  	tail_desc =3D list_last_entry(&chan->pending_list,
> @@ -1558,23 +1555,24 @@ static void xilinx_dma_start_transfer(struct xili=
nx_dma_chan *chan)
>  	tail_segment =3D list_last_entry(&tail_desc->segments,
>  				       struct xilinx_axidma_tx_segment, node);
> =20
> +	if (chan->has_sg && list_empty(&chan->active_list))
> +		xilinx_write(chan, XILINX_DMA_REG_CURDESC,
> +			     head_desc->async_tx.phys);
> +
>  	reg =3D dma_ctrl_read(chan, XILINX_DMA_REG_DMACR);
> =20
>  	if (chan->desc_pendingcount <=3D XILINX_DMA_COALESCE_MAX) {
>  		reg &=3D ~XILINX_DMA_CR_COALESCE_MAX;
>  		reg |=3D chan->desc_pendingcount <<
>  				  XILINX_DMA_CR_COALESCE_SHIFT;
> -		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
>  	}
> =20
> -	if (chan->has_sg)
> -		xilinx_write(chan, XILINX_DMA_REG_CURDESC,
> -			     head_desc->async_tx.phys);
>  	reg  &=3D ~XILINX_DMA_CR_DELAY_MAX;
>  	reg  |=3D chan->irq_delay << XILINX_DMA_CR_DELAY_SHIFT;
>  	dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
> =20
> -	xilinx_dma_start(chan);
> +	if (chan->idle)
> +		xilinx_dma_start(chan);
> =20
>  	if (chan->err)
>  		return;
> @@ -1914,8 +1912,10 @@ static irqreturn_t xilinx_dma_irq_handler(int irq,=
 void *data)
>  		      XILINX_DMA_DMASR_DLY_CNT_IRQ)) {
>  		spin_lock(&chan->lock);
>  		xilinx_dma_complete_descriptor(chan);
> -		chan->idle =3D true;
> -		chan->start_transfer(chan);
> +		if (list_empty(&chan->active_list)) {
> +			chan->idle =3D true;
> +			chan->start_transfer(chan);
> +		}
>  		spin_unlock(&chan->lock);
>  	}
> =20


