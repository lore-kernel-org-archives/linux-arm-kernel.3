Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636F9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bym8bwfSB2xw4r+JXwIrtwHeQG9Cn49xBnJ0ejlTSHM=; b=b+6sXoZn7s55DIANoXfzEJOARo
	s+lahZhB5yUy2LDt4+MWnwg60HpsZZrAryYzEimw7MnVpXU318LF5DW6/gpFAVWD3mvQuAx4nTxYt
	aIVbRU//glCy8HieJS8Xljj3FzWIvYxl7DkZpnfcfq7/PfQ+Oa5PqeB4LzV+2PUIoImENOiv/5DyI
	X8R00RlpVC5meusKqBv5hxIVDeq1hNkIstzm7B74e5MfSYyoisAhk5ENEopJz/Z/5JV+Cz6HYlyL/
	fNJc59NaQBFYxhaeEL5C0mC1QwRLfK5uFu2gNac/YScXyDjdr3ZxuZAZp8nJBNiTWbp8gP280RVrc
	fH/pMNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtq6-0000000HAz0-43ca;
	Tue, 25 Feb 2025 12:15:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmt4O-0000000H1jk-3xp3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 11:25:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 120C71516;
	Tue, 25 Feb 2025 03:26:03 -0800 (PST)
Received: from [10.57.38.173] (unknown [10.57.38.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17EBD3F673;
	Tue, 25 Feb 2025 03:25:44 -0800 (PST)
Message-ID: <68405608-564c-4e79-9cbc-545626e736f1@arm.com>
Date: Tue, 25 Feb 2025 11:25:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dma: Fix encryption bit clearing for dma_to_phys
To: Suzuki K Poulose <suzuki.poulose@arm.com>, will@kernel.org,
 catalin.marinas@arm.com
Cc: maz@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 aneesh.kumar@kernel.org, steven.price@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Tom Lendacky <thomas.lendacky@amd.com>
References: <20250219220751.1276854-1-suzuki.poulose@arm.com>
 <20250219220751.1276854-2-suzuki.poulose@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250219220751.1276854-2-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_032549_039832_10DFFAA3 
X-CRM114-Status: GOOD (  17.46  )
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

On 2025-02-19 10:07 pm, Suzuki K Poulose wrote:
> phys_to_dma() sets the encryption bit on the translated DMA address. But
> dma_to_phys() clears the encryption bit after it has been translated back
> to the physical address, which could fail if the device uses DMA ranges.
> 
> Hopefully, AMD SME doesn't use it.

...by which you mean we don't think any AMD systems are using the ACPI 
_DMA method to constrain physical DMA ranges, otherwise SME with 
dma-direct would presumably already be broken by this lookup going wrong.

> Anyways, let us fix it, before cleanup
> the infrastructure for supporting other architectures.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Reported-by: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Link: https://lkml.kernel.org/r/yq5amsen9stc.fsf@kernel.org
> Cc: Will Deacon <will@kernel.org>
> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   include/linux/dma-direct.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index d7e30d4f7503..d20ecc24cb0f 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -101,12 +101,13 @@ static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
>   {
>   	phys_addr_t paddr;
>   
> +	dma_addr = __sme_clr(dma_addr);
>   	if (dev->dma_range_map)
>   		paddr = translate_dma_to_phys(dev, dma_addr);
>   	else
>   		paddr = dma_addr;
>   
> -	return __sme_clr(paddr);
> +	return paddr;
>   }
>   #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
>   


