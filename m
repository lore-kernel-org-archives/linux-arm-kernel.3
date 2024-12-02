Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631A1D78337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53HRny2OPbiIDCn5g9MEYNkmUxD0U5pObycMcQTgjLc=; b=fJpU5N5S+3ZmnpntGezQd0ZORf
	QYiZR6Yaq4kAwzBXLOUqYtnjdkKLSWJyerMt5ui8qR0zfeIr7eGRkiEAWrF9mbqiGUpnzj4gC+Lz0
	s2JicfueqKI4nhvrrb6XfRXV8lgJsmqZ/nHG4tR6BFDzNNVI4LsmBCbiX/wik8hzIzIh3YrdIzDXi
	YHMZlhViF8D3Q/MdK7xzQsGWlS5lqCs9lX/q+93wMPlTVLGnzbSdeJty7U8TR2RN24lixtZYgKZgW
	nYCH8TxC3EBVA35Jai7htgpF5Lx+jo4C9muqZfVd8kxFdPPXU6ugxfRNWQT3Qq3hsk6Djx5ndZtwF
	pxsggiOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9Xw-00000006uXu-119J;
	Mon, 02 Dec 2024 16:45:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9GK-00000006qPj-2KHA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6122CA40F8A;
	Mon,  2 Dec 2024 16:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3500C4CED6;
	Mon,  2 Dec 2024 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733156823;
	bh=nPtb1zSByJeaDM0DUV8mbGmOuC3IvCO7oLz660454R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tqDFWYx7tpuPs3199TfcyJNFHIKuE9dIV29mA/Za4FBuKVG04CgyqNFfqVNTXOkGE
	 j5u+kEm6H5NIy4FvI/Jo5lXhzQcMhvrPpRtT8TWqTy7jrTDrJcy08aqMoaDKDlnm04
	 7uEsw71bbPEAa8jiTRrjUn58w39Tc5IKSbLrELF05NTtzs5FfsAOG2S8Dna5J0Adcl
	 UVmAVfjsJy/+ZFFf2p7UB0mixrpNIiVPGsC88kxq88WslnlWxI22tRcX6Sxnw1wEle
	 v9Y2UOyFEOOcY/Xs9QtBR/R3fae/o17hjvAfF/yhxhjKHJkbkQhJ54Fa9/2nhy8cgN
	 pr9+jf6ygE3zQ==
Date: Mon, 2 Dec 2024 21:56:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: apple-admac: Avoid accessing registers in
 probe
Message-ID: <Z03f08Os/csGbMap@vaman>
References: <20241124-admac-power-v1-1-58f2165a4d55@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241124-admac-power-v1-1-58f2165a4d55@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_082704_654129_4E7BB424 
X-CRM114-Status: GOOD (  19.81  )
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

On 24-11-24, 16:48, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> The ADMAC attached to the AOP has complex power sequencing, and is
> power gated when the probe callback runs. Move the register reads
> to other functions, where we can guarantee that the hardware is
> switched on.

So looking at the driver, there is code to turn power, so what ensures
that power is up while we are in alloc callback

> 
> Fixes: 568aa6dd641f ("dmaengine: apple-admac: Allocate cache SRAM to channels")
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/dma/apple-admac.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 9588773dd2eb670a2f6115fdaef39a0e88248015..037ec38730cf980eee11ebb8ec17be7623879cf8 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -153,6 +153,8 @@ static int admac_alloc_sram_carveout(struct admac_data *ad,
>  {
>  	struct admac_sram *sram;
>  	int i, ret = 0, nblocks;

Empty line before this please

> +	ad->txcache.size = readl_relaxed(ad->base + REG_TX_SRAM_SIZE);
> +	ad->rxcache.size = readl_relaxed(ad->base + REG_RX_SRAM_SIZE);
>  
>  	if (dir == DMA_MEM_TO_DEV)
>  		sram = &ad->txcache;
> @@ -912,12 +914,7 @@ static int admac_probe(struct platform_device *pdev)
>  		goto free_irq;
>  	}
>  
> -	ad->txcache.size = readl_relaxed(ad->base + REG_TX_SRAM_SIZE);
> -	ad->rxcache.size = readl_relaxed(ad->base + REG_RX_SRAM_SIZE);
> -
>  	dev_info(&pdev->dev, "Audio DMA Controller\n");
> -	dev_info(&pdev->dev, "imprint %x TX cache %u RX cache %u\n",
> -		 readl_relaxed(ad->base + REG_IMPRINT), ad->txcache.size, ad->rxcache.size);
>  
>  	return 0;
>  
> 
> ---
> base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
> change-id: 20241124-admac-power-7f32c2a1850a
> 

-- 
~Vinod

