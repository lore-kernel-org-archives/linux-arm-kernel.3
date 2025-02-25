Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25875C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 13:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBPR0tj4G7T8YhirA9WYKD6ZaAZq6vzYlCF0NKZxUvk=; b=Ww0qVDISIbJ9X9toW5oSJX72nk
	g4rGW5/6CSwfk0O7jhR1u/Q83olOxH+EhJ2KdY732lo2wVXygYRPMZ2dGKz6NbrZ/N3Ss692fjdD3
	pVrHk9AKwFLdnWtUXlVwqVTzh3XwQVcB0EzCN5D4Cam281EkSui/QFXEWD9iIDdGNZ4CXmiD/nfzC
	cfipvZ6nV8mBj1nbS7wYV1jXys8pEi7K40iD63DnCV5mnLoec2pnYEdgnzvBrU+1YoIfJfZkiNCd6
	afVPoQCaiG/fwhsTXpd0kF13uAGFpSxl7Zgb17XjL/57yjTc8Ji5hns1TGY9XDJP9+Gg3e2+8dDc3
	E93GSuPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuhL-0000000HJYp-1V8O;
	Tue, 25 Feb 2025 13:10:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuNN-0000000HFuV-1V00
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:49:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC02E152B;
	Tue, 25 Feb 2025 04:49:44 -0800 (PST)
Received: from [10.57.38.173] (unknown [10.57.38.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F8673F6A8;
	Tue, 25 Feb 2025 04:49:26 -0800 (PST)
Message-ID: <cdecd882-64ed-426c-98e1-9e8815f1c6ad@arm.com>
Date: Tue, 25 Feb 2025 12:49:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dma: Introduce generic dma_decrypted/dma_encrypted
 helpers
To: Suzuki K Poulose <suzuki.poulose@arm.com>, will@kernel.org,
 catalin.marinas@arm.com
Cc: maz@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 aneesh.kumar@kernel.org, steven.price@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Tom Lendacky <thomas.lendacky@amd.com>
References: <20250219220751.1276854-1-suzuki.poulose@arm.com>
 <20250219220751.1276854-3-suzuki.poulose@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250219220751.1276854-3-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_044929_506942_BAEBDAA8 
X-CRM114-Status: GOOD (  31.74  )
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
> AMD SME added __sme_set/__sme_clr primitives to modify the DMA address for
> encrypted/decrypted traffic. However this doesn't fit in with other models,
> e.g., Arm CCA where the meanings are the opposite. i.e., "decrypted" traffic
> has a bit set and "encrypted" traffic has the top bit cleared.
> 
> In preparation for adding the support for Arm CCA DMA conversions, convert the
> existing primitives to more generic ones that can be provided by the backends.
> i.e., add helpers to
>   1. dma_encrypted - Convert a DMA address to "encrypted" [ == __sme_set() ]
>   2. dma_decrypted - Convert a DMA address to "decrypted" [ None exists today ]
>   3. dma_clear_encryption - Clear any "encryption"/"decryption" bits from DMA
>      address [ SME uses __sme_clr() ]

Nit: I'd still prefer to have as much distinction as possible between 
manipulation of the address representation itself, and any other aspects 
such as the manipulation of underlying pagetable attributes also implied 
by force_dma_unencrypted() on x86. So how about:

dma_addr_encrypted
dma_addr_unencrypted
dma_addr_clear_encryption

?

Note that we intentionally avoided "decrypted" in the existing APIs to 
minimise confusion, the only time any actual decryption is involved is 
for an "encrypted" address.

(Stuff like that being why I personally would prefer to generalise away 
from encryption as an implementation detail at all, but since everyone 
else seems to be accustomed to the existing terminology and not 
complaining, I'm prepared to compromise that far!)

Otherwise, the overall shape looks good to me.

Thanks,
Robin.

> Since the original __sme_xxx helpers come from linux/mem_encrypt.h, use that
> as the home for the new definitions and provide dummy ones when none is provided
> by the architectures.
> 
> With the above, phys_to_dma_unencrypted() uses the newly added dma_decrypted()
> helper and to make it a bit more easier to read and avoid double conversion,
> provide __phys_to_dma().
> 
> No functional changes intended. Compile tested on x86 defconfig with
> CONFIG_AMD_MEM_ENCRYPT.
> 
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   include/linux/dma-direct.h  | 12 ++++++++----
>   include/linux/mem_encrypt.h | 23 +++++++++++++++++++++++
>   2 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index d20ecc24cb0f..9b5cc0ee86d5 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -78,14 +78,18 @@ static inline dma_addr_t dma_range_map_max(const struct bus_dma_region *map)
>   #define phys_to_dma_unencrypted		phys_to_dma
>   #endif
>   #else
> -static inline dma_addr_t phys_to_dma_unencrypted(struct device *dev,
> -		phys_addr_t paddr)
> +static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
>   	if (dev->dma_range_map)
>   		return translate_phys_to_dma(dev, paddr);
>   	return paddr;
>   }
>   
> +static inline dma_addr_t phys_to_dma_unencrypted(struct device *dev,
> +						phys_addr_t paddr)
> +{
> +	return dma_decrypted(__phys_to_dma(dev, paddr));
> +}
>   /*
>    * If memory encryption is supported, phys_to_dma will set the memory encryption
>    * bit in the DMA address, and dma_to_phys will clear it.
> @@ -94,14 +98,14 @@ static inline dma_addr_t phys_to_dma_unencrypted(struct device *dev,
>    */
>   static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
> -	return __sme_set(phys_to_dma_unencrypted(dev, paddr));
> +	return dma_encrypted(__phys_to_dma(dev, paddr));
>   }
>   
>   static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
>   {
>   	phys_addr_t paddr;
>   
> -	dma_addr = __sme_clr(dma_addr);
> +	dma_addr = dma_clear_encryption(dma_addr);
>   	if (dev->dma_range_map)
>   		paddr = translate_dma_to_phys(dev, dma_addr);
>   	else
> diff --git a/include/linux/mem_encrypt.h b/include/linux/mem_encrypt.h
> index ae4526389261..c8dcc1be695a 100644
> --- a/include/linux/mem_encrypt.h
> +++ b/include/linux/mem_encrypt.h
> @@ -26,11 +26,34 @@
>    */
>   #define __sme_set(x)		((x) | sme_me_mask)
>   #define __sme_clr(x)		((x) & ~sme_me_mask)
> +
> +#define dma_encrypted(x)	__sme_set(x)
> +#define dma_clear_encryption(x)	__sme_clr(x)
> +
>   #else
>   #define __sme_set(x)		(x)
>   #define __sme_clr(x)		(x)
>   #endif
>   
> +/*
> + * dma_encrypted() and dma_decrypted() are for converting a given DMA
> + * address to the respective type of addressing.
> + *
> + * dma_clear_encryption() is used to reverse the conversion back to "normal"
> + * DMA address.
> + */
> +#ifndef dma_encrypted
> +#define dma_encrypted(x)	(x)
> +#endif
> +
> +#ifndef dma_decrypted
> +#define dma_decrypted(x)	(x)
> +#endif
> +
> +#ifndef dma_clear_encryption
> +#define dma_clear_encryption(x)	(x)
> +#endif
> +
>   #endif	/* __ASSEMBLY__ */
>   
>   #endif	/* __MEM_ENCRYPT_H__ */


