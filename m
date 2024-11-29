Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924BDD729F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 18:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRLBNjLCI/jD40eiCATO+xFagIst4IBCLdsKalg4Kl0=; b=YPtBnFTv2HlYq9F9o4CVDLQGKM
	TP4FTS6OBJsqQVIxOjGMe2Av3u4y6xjDUUQxHtox+Q53FHYIABqZwOl5o6F81QkeAOEXiUutUrOGX
	EsAPFESVYKJcoMPBFnkpxXbNT+DlbEHhx2n7qNiTnt+yDoDIWAL3tCw1mKQS26wJMq2eevchshQ2a
	Frt6QLU+FO3n2dhcmPlYw3xYITs9VzD4Hb6mQM67RJhtLEl+PRheg84L6kgKG5Y5v+Zt89czwxd8r
	UEivtyVLUDpD7U+HPpJUNsnplSv7OjYqGU2rmi4bKJMvBESQG7TxigAe068PsmiKFJ8ggr3u9g360
	uFqzPWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH5PI-00000000kad-0EDK;
	Fri, 29 Nov 2024 18:07:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH5OJ-00000000kWJ-2Hgt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 18:06:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 898C6FEC;
	Fri, 29 Nov 2024 10:07:23 -0800 (PST)
Received: from [10.57.90.216] (unknown [10.57.90.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 498B73F66E;
	Fri, 29 Nov 2024 10:06:52 -0800 (PST)
Message-ID: <7720d275-bc52-49c3-949a-6a6a32157418@arm.com>
Date: Fri, 29 Nov 2024 18:06:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: fix zone_dma_limit calculation
To: Catalin Marinas <catalin.marinas@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>
Cc: Baruch Siach <baruch@tkos.co.il>, will@kernel.org, ptesarik@suse.com,
 hch@lst.de, jiangyutang@os.amperecomputing.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241125171650.77424-1-yang@os.amperecomputing.com>
 <87ttbu8q7s.fsf@tarshish>
 <98583682-a95e-440e-bd89-03828998b48e@os.amperecomputing.com>
 <Z0dbsRCsWT3hiVds@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z0dbsRCsWT3hiVds@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_100655_670567_454C5DBB 
X-CRM114-Status: GOOD (  40.31  )
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

On 2024-11-27 5:49 pm, Catalin Marinas wrote:
> + Robin
> 
> On Tue, Nov 26, 2024 at 09:38:22AM -0800, Yang Shi wrote:
>> On 11/25/24 10:27 PM, Baruch Siach wrote:
>>> On Mon, Nov 25 2024, Yang Shi wrote:
>>>> The commit ba0fb44aed47 ("dma-mapping: replace zone_dma_bits by
>>>> zone_dma_limit") changed how zone_dma_limit was calculated.  Now it
>>>> returns the memsize limit in IORT or device tree instead of U32_MAX if
>>>> the memsize limit is greater than U32_MAX.
>>>
>>> Can you give a concrete example of memory layout and dma-ranges that
>>> demonstrates this issue?
>>
>> Our 2 sockets system has physical memory starts at 0x0 on node 0 and
>> 0x200000000000 on node 1. The memory size limit defined in IORT is 0x30 (48
>> bits).
>>
>> The DMA zone is:
>>
>> pages free     887722
>>          boost    0
>>          min      229
>>          low      1108
>>          high     1987
>>          promo    2866
>>          spanned  983040
>>          present  982034
>>          managed  903238
>>          cma      16384
>>          protection: (0, 0, 124824, 0, 0)
>>   start_pfn:           65536
>>
>> When allocating DMA buffer, dma_direct_optimal_gfp_mask() is called to
>> determine the proper zone constraints. If the phys_limit is less than
>> zone_dma_limit, it will use GFP_DMA. But zone_dma_limit is 0xffffffffffff on
>> v6.12 instead of 4G prior v6.12, it means all DMA buffer allocation will go
>> to DMA zone even though the devices don't require it.
>>
>> DMA zone is on node 0, so we saw excessive remote access on 2 sockets
>> system.
> [...]
>> The physical addr range for DMA zone is correct, the problem is wrong
>> zone_dma_limit. Before commit ba0fb44aed47 zone_dma_limit was 4G, after it
>> it is the whole memory even though DMA zone just covers low 4G.
> 
> Thanks for the details. I agree that zone_dma_limit shouldn't be higher
> than the ZONE_DMA upper boundary, otherwise it gets confusing for
> functions like dma_direct_optimal_gfp_mask() and we may force
> allocations to a specific range unnecessarily.

Oof, indeed the original min3() logic did also result in the 
32-bit-clamped value being written back to zone_dma_bits itself, so 
that's another subtlety overlooked in ba0fb44aed47 *and* the subsequent 
fixes reinstating that clamping (conditionally) within max_zone_phys().
  > If IORT or DT indicate a large mask covering the whole RAM (i.e. no
> restrictions), in an ideal world, we should normally extend ZONE_DMA to
> the same.

That's not right, ZONE_DMA should still be relatively limited in size 
(unless we really do only have a tiny amount of RAM) - just because a DT 
dma-ranges property says the system interconnect can carry >32 address 
bits in general doesn't mean that individual device DMA masks can't 
still be 32-bit or smaller. IIRC we're still implicitly assuming that if 
DT does describe an offset range into "high" RAM, it must represent a 
suitable lowest common denominator for all relevant devices already, and 
therefore we can get away with sizing ZONE_DMA off it blindly. I'm yet 
to hear of any platform having a general offset with no significant 
upper limit, but if we did want to support such a thing then we would 
need to revisit the previously-discussed notion of an accurate 
of_dma_get_min_cpu_address() rather than the assumption based on 
memblock_start_of_DRAM().

After staring at it for long enough, I think $SUBJECT patch is actually 
correct as it is. In fact I'm now wondering why the fix was put inside 
max_zone_phys() in the first place, since it's clearly pointless to 
clamp DMA_BIT_MASK(32) to U32_MAX in the dma32_phys_limit case...
However the commit message is perhaps not as clear as it could be - 
technically we are correctly *calculating* the appropriate effective 
zone_dma_limt value within the scope of zone_sizes_init(), we're just 
failing to properly update the actual zone_dma_limit variable for the 
benefit of other users.

Thanks,
Robin.

> One problem is ZONE_DMA32 (and GFP_DMA32) and the fact that
> ZONE_DMA sits below it. Until we hear otherwise, we assume a DMA offset
> of 0 for such 32-bit devices and therefore define ZONE_DMA32 in the
> lower 4GB if RAM starts below this limit (and an empty ZONE_DMA32 if RAM
> starts above).
> 
> Another aspect to consider is that we don't always have DT or IORT
> information or some devices need a smaller limit than what's advertised
> in the firmware tables (typically 32-bit masks). This code went through
> a couple of fixes already:
> 
> 833bd284a454 ("arm64: mm: fix DMA zone when dma-ranges is missing")
> 122c234ef4e1 ("arm64: mm: keep low RAM dma zone")
> 
> Since our current assumption is to assume ZONE_DMA within 32-bit if RAM
> below 4GB, I'm happy to make this conditional on CONFIG_ZONE_DMA32 also
> being enabled. So, from your patch below:
> 
>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> index d21f67d67cf5..ccdef53872a0 100644
>> --- a/arch/arm64/mm/init.c
>> +++ b/arch/arm64/mm/init.c
>> @@ -117,15 +117,6 @@ static void __init arch_reserve_crashkernel(void)
>>    static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
>>    {
>> -	/**
>> -	 * Information we get from firmware (e.g. DT dma-ranges) describe DMA
>> -	 * bus constraints. Devices using DMA might have their own limitations.
>> -	 * Some of them rely on DMA zone in low 32-bit memory. Keep low RAM
>> -	 * DMA zone on platforms that have RAM there.
>> -	 */
>> -	if (memblock_start_of_DRAM() < U32_MAX)
>> -		zone_limit = min(zone_limit, U32_MAX);
>> -
>>    	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
>>    }
> 
> This part is fine.
> 
>> @@ -141,6 +132,14 @@ static void __init zone_sizes_init(void)
>>    	acpi_zone_dma_limit = acpi_iort_dma_get_max_cpu_address();
>>    	dt_zone_dma_limit = of_dma_get_max_cpu_address(NULL);
>>    	zone_dma_limit = min(dt_zone_dma_limit, acpi_zone_dma_limit);
>> +	/*
>> +	 * Information we get from firmware (e.g. DT dma-ranges) describe DMA
>> +	 * bus constraints. Devices using DMA might have their own limitations.
>> +	 * Some of them rely on DMA zone in low 32-bit memory. Keep low RAM
>> +	 * DMA zone on platforms that have RAM there.
>> +	 */
>> +	if (memblock_start_of_DRAM() < U32_MAX)
>> +		zone_dma_limit = min(zone_dma_limit, U32_MAX);
>>    	arm64_dma_phys_limit = max_zone_phys(zone_dma_limit);
>>    	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
>>    #endif
> 
> But I'd move the zone_dma_limit update further down in the
> CONFIG_ZONE_DMA32 block. I think we only need to limit it to
> dma32_phys_limit and ignore the U32_MAX check. The former is already
> capped to 32-bit. For the second hunk, something like below (untested):
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index d21f67d67cf5..ffaf5bd8d0a1 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -146,8 +146,10 @@ static void __init zone_sizes_init(void)
>   #endif
>   #ifdef CONFIG_ZONE_DMA32
>   	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
> -	if (!arm64_dma_phys_limit)
> +	if (!arm64_dma_phys_limit || arm64_dma_phys_limit > dma32_phys_limit) {
>   		arm64_dma_phys_limit = dma32_phys_limit;
> +		zone_dma_limit = arm64_dma_phys_limit - 1;
> +	}
>   #endif
>   	if (!arm64_dma_phys_limit)
>   		arm64_dma_phys_limit = PHYS_MASK + 1;
> 
> With some comment on why we do this but most likely not the current
> comment in max_zone_phys() (more like keep ZONE_DMA below ZONE_DMA32).
> 


