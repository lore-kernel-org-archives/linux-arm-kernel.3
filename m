Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61610C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXETjYqFYBxs0d7dihmNCFpOpTQecHc6Dw3oJ43TOwQ=; b=MxFIccS6aEPKmiGDfFkcww/asD
	z+sQ+vCD3zz3PMNupAlXu2MDOtuWsq+u5HNnVveysAxLOtl9+7fBU1cvtajM7spfYGLRiwEtlWez3
	mkBZmWu7bV/Tr6kKk6X/HJcHDW58d8Ki3UZl9WmTHvEa4wQ3dBdy8+Jim6XfFei7hCE9Y8bLkcsPT
	APgGHsU/RyvdSxKdg9x4d/onXNzebFViRU1IV0p5Ffb9ESmCAjd+aC/UzxXgXirRpfIcEpz0Z0TAX
	Zv/OId4m29pgqMgy4B1JKvyWOSwqAG4HIhojuqo5sbw26DPOLg0gD7bk8LS/3AcFQFufeeuuZP5JG
	4crKwyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHoL-00000008XDJ-3LLr;
	Wed, 12 Feb 2025 18:50:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHmv-00000008Wrb-0NkA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 18:48:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6BFA113E;
	Wed, 12 Feb 2025 10:49:04 -0800 (PST)
Received: from [10.57.36.240] (unknown [10.57.36.240])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 083613F58B;
	Wed, 12 Feb 2025 10:48:41 -0800 (PST)
Message-ID: <55743353-60fb-4ad2-a0c2-6d5a3a2f8ac0@arm.com>
Date: Wed, 12 Feb 2025 18:48:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: realm: Use aliased addresses for device DMA to
 shared buffers
Content-Language: en-GB
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org, maz@kernel.org,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, aneesh.kumar@kernel.org, steven.price@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Tom Lendacky <thomas.lendacky@amd.com>
References: <20250212171411.951874-1-suzuki.poulose@arm.com>
 <20250212171411.951874-2-suzuki.poulose@arm.com>
 <7ebe959b-132e-468a-bad5-5273427b6928@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <7ebe959b-132e-468a-bad5-5273427b6928@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_104845_172327_6C8C6796 
X-CRM114-Status: GOOD (  25.43  )
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

Hi Robin

On 12/02/2025 18:18, Robin Murphy wrote:
> On 2025-02-12 5:14 pm, Suzuki K Poulose wrote:
>> When a device performs DMA to a shared buffer using physical addresses,
>> (without Stage1 translation), the device must use the "{I}PA address" 
>> with the
>> top bit set in Realm. This is to make sure that a trusted device will 
>> be able
>> to write to shared buffers as well as the protected buffers. Thus, a 
>> Realm must
>> always program the full address including the "protection" bit, like 
>> AMD SME
>> encryption bits.
>>
>> Add the support for this by providing arm64 version of the 
>> phys_to_dma(). We
>> cannot use the __sme_mask as it assumes the "encryption" always "sets 
>> a bit",
>> which is the opposite for CCA. i.e., "set a bit" for "decrypted" 
>> address. So,
>> move the common code that can be reused by all - i.e., add 
>> __phys_to_dma() and
>> __dma_to_phys() - and do the arch specific processing.
>>
>> Please note that the VMM needs to similarly make sure that the SMMU 
>> Stage2 in
>> the Non-secure world is setup accordingly to map IPA at the 
>> unprotected alias.
>>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Steven Price <steven.price@arm.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Tom Lendacky <thomas.lendacky@amd.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/Kconfig                  |  1 +
>>   arch/arm64/include/asm/dma-direct.h | 38 +++++++++++++++++++++++++++++
>>   include/linux/dma-direct.h          | 35 +++++++++++++++++---------
>>   3 files changed, 62 insertions(+), 12 deletions(-)
>>   create mode 100644 arch/arm64/include/asm/dma-direct.h
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index fcdd0ed3eca8..7befe04106de 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -41,6 +41,7 @@ config ARM64
>>       select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>>       select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>>       select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
>> +    select ARCH_HAS_PHYS_TO_DMA
>>       select ARCH_HAS_PTE_DEVMAP
>>       select ARCH_HAS_PTE_SPECIAL
>>       select ARCH_HAS_HW_PTE_YOUNG
>> diff --git a/arch/arm64/include/asm/dma-direct.h b/arch/arm64/include/ 
>> asm/dma-direct.h
>> new file mode 100644
>> index 000000000000..37c3270542b8
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/dma-direct.h
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ASM_DMA_DIRECT_H
>> +#define __ASM_DMA_DIRECT_H
>> +
>> +#include <asm/pgtable-prot.h>
>> +
>> +static inline unsigned long addr_to_shared(unsigned long addr)
>> +{
>> +    if (is_realm_world())
>> +        addr |= prot_ns_shared;
>> +    return addr;
>> +}
>> +
>> +static inline unsigned long addr_to_private(unsigned long addr)
>> +{
>> +    if (is_realm_world())
>> +        addr &= prot_ns_shared - 1;
>> +    return addr;
>> +}
>> +
>> +static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t 
>> paddr)
>> +{
>> +    return __phys_to_dma(dev, paddr);
>> +}
>> +
>> +static inline dma_addr_t phys_to_dma_unencrypted(struct device *dev,
>> +                         phys_addr_t paddr)
>> +{
>> +    return addr_to_shared(__phys_to_dma(dev, paddr));
>> +}
>> +#define phys_to_dma_unencrypted phys_to_dma_unencrypted
>> +
>> +static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t 
>> dma_addr)
>> +{
>> +    return addr_to_private(__dma_to_phys(dev, dma_addr));
>> +}
>> +
>> +#endif    /* __ASM_DMA_DIRECT_H */
>> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
>> index d7e30d4f7503..3e9bf6ca640e 100644
>> --- a/include/linux/dma-direct.h
>> +++ b/include/linux/dma-direct.h
>> @@ -72,18 +72,36 @@ static inline dma_addr_t dma_range_map_max(const 
>> struct bus_dma_region *map)
>>       return ret;
>>   }
>> +static inline dma_addr_t __phys_to_dma(struct device *dev, 
>> phys_addr_t paddr)
>> +{
>> +    if (dev->dma_range_map)
>> +        return translate_phys_to_dma(dev, paddr);
>> +    return paddr;
>> +}
>> +
>> +static inline phys_addr_t __dma_to_phys(struct device *dev, 
>> dma_addr_t dma_addr)
>> +{
>> +    phys_addr_t paddr;
>> +
>> +    if (dev->dma_range_map)
>> +        paddr = translate_dma_to_phys(dev, dma_addr);
>> +    else
>> +        paddr = dma_addr;
>> +
>> +    return paddr;
>> +}
>> +
>>   #ifdef CONFIG_ARCH_HAS_PHYS_TO_DMA
>>   #include <asm/dma-direct.h>
>>   #ifndef phys_to_dma_unencrypted
>>   #define phys_to_dma_unencrypted        phys_to_dma
>>   #endif
>>   #else
>> +
>>   static inline dma_addr_t phys_to_dma_unencrypted(struct device *dev,
>>           phys_addr_t paddr)
>>   {
>> -    if (dev->dma_range_map)
>> -        return translate_phys_to_dma(dev, paddr);
>> -    return paddr;
>> +    return __phys_to_dma(dev, paddr);
>>   }
>>   /*
>> @@ -94,19 +112,12 @@ static inline dma_addr_t 
>> phys_to_dma_unencrypted(struct device *dev,
>>    */
>>   static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t 
>> paddr)
>>   {
>> -    return __sme_set(phys_to_dma_unencrypted(dev, paddr));
>> +    return __sme_set(__phys_to_dma(dev, paddr));
> 
> Hmm, it really feels like we should generalise __sme_{set,clr} at this 
> level, rather than drag in the entire ARCH_HAS_PHYS_TO_DMA override for 
> the purposes of setting/clearing an address bit just because the 
> "generic" mechanism for doing that is unashamedly AMD-specific.

I was planning to convert that to use ARCH_HAS_PHYS_TO_DMA ;-) too, in a
separate patch, to get rid of this "one approach" works for all hook.

> 
> Maybe something like:
> 
> #define dma_shared(x)  sme_clr(x)
> #define dma_private(x) sme_set(x)
> 
> for x86, then go from there?

But this looks sensible too, can switch to this approach.
Thanks for the feedback.

Suzuki


> 
> Thanks,
> Robin.
> 
>>   }
>>   static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t 
>> dma_addr)
>>   {
>> -    phys_addr_t paddr;
>> -
>> -    if (dev->dma_range_map)
>> -        paddr = translate_dma_to_phys(dev, dma_addr);
>> -    else
>> -        paddr = dma_addr;
>> -
>> -    return __sme_clr(paddr);
>> +    return __sme_clr(__dma_to_phys(dev, dma_addr));
>>   }
>>   #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
> 


