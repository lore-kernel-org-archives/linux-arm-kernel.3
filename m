Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE9BC982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMNZ7OdPuYM35n8rPVeWHdovI4cbgMA9DInSj4SiCmM=; b=Ezh6smmfkiR1ASq6czYNNjqOMP
	SEkwk8i+9UULT5/L6jfrl9i3Umzg+GLZYhkK8V7L9NX+Ts7zA/3/f6ep1E8qZ99ZMgx/Y3u8qCtyE
	lNpOZdeh1qro0ZGU8zIVTLfl9B7rOFu7R6ZPmE236uot+vATdduFij15qBH0szGZYMm5idMkjAjIL
	kU8T9TvGQcm1khib5B/4XCIiOsHgaeEc2ssA8gzlru0OtZzVqA5U3poHbE5hdzD8VcJkF/EUPgRQb
	hpMLRWZ5UfjaG1RP2TSAWmfol4LW4SNFfjEDaM6AM9OYAG4pW9zB6kMqpnu3LNt9dMwYlE71OtYtw
	hcjnlbzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BC2-0000000BHw0-38OS;
	Thu, 17 Sep 2026 12:26:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BC0-0000000BHv3-0kf4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:26:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F31271476;
	Thu, 17 Sep 2026 05:26:12 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E77DD3F882;
	Thu, 17 Sep 2026 05:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789647976; bh=KTvzpDajoQanAPMVGFBiFv6UFdpjASaQeZFJX+AOJCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IzmV5R9LQ7MHsnRS+1Ri7UMd1jvHuPjhaLYoglkxbVPGJevCKQA0iuQOhOAghp3iy
	 cKu28vzzikY4CwPJe6er0m+W06gJDxk3VZJ9D+xn0WCzsRrQKzBDpyjytHYvveumCU
	 imDfkghPDRZ/Cwe9wF7fNlUucys8ivij5rBRnIeQ=
Message-ID: <a2b4186d-b3b0-4543-9f77-505e8ae67ae8@arm.com>
Date: Thu, 17 Sep 2026 13:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Fix pfn_is_map_memory() misreporting mapped
 memory
To: Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 liulhong617 <liulhong617@gmail.com>, Mike Rapoport <rppt@kernel.org>
References: <20260908162033.74509-1-vladimir.murzin@arm.com>
 <947a1506-dfe4-4906-9673-6a7227946433@app.fastmail.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <947a1506-dfe4-4906-9673-6a7227946433@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_052620_379648_8C159E3A 
X-CRM114-Status: GOOD (  24.50  )
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

On 9/16/26 11:13, Ard Biesheuvel wrote:
> (cc Mike)
> 
> On Tue, 8 Sep 2026, at 18:20, Vladimir Murzin wrote:
>> Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping of
>> no-map reserved memory") removed sub-page no-map regions from the
>> linear mapping. However, pfn_is_map_memory() can still report that
>> such a region is mapped.
>>
>> For instance, with 64K pages, say we have
>>
>> normal:        ...–0xa2007fff
>> no-map: 0xa2008000–0xa200ffff
>> normal: 0xa2010000–...
>>
>> The range 0xa2000000–0xa200ffff is not linearly mapped, but
>> pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the address to
>> page granularity and passes 0xa2000000 to memblock_is_map_memory().
>> That address belongs to the preceding normal memblock region, so the
>> no-map region is ignored and the function returns true.
>>
>> Fix that by checking if entire page is subset of memory block.
>>
>> Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping of 
>> no-map reserved memory")
>> Assisted-by: LLM
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/mm/init.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> index fbf215ecc7d0..5da80e1e1727 100644
>> --- a/arch/arm64/mm/init.c
>> +++ b/arch/arm64/mm/init.c
>> @@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
>>  	if (PHYS_PFN(addr) != pfn)
>>  		return 0;
>>
>> -	return memblock_is_map_memory(addr);
>> +	return memblock_is_region_memory(addr, PAGE_SIZE) &&
>> +		memblock_is_map_memory(addr);
>>  }
>>  EXPORT_SYMBOL(pfn_is_map_memory);
>>
> memblock_is_region_memory() only tells you whether the range in
> question is covered by a single entry in memblock.memory.regions[].
> 
> memblock has other flags, which may or may not be set on sub-page
> regions too. So I don't think this is the right solution in the
> general case, even if it fixes your example.
> 

Ack.

> Given that the no-map attribute fundamentally only applies to page
> granular regions, it would make sense to round those outwards
> whenever they are created.
> 
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -1119,6 +1119,10 @@
>  int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_t size)
>  {
> +       phys_addr_t end = PAGE_ALIGN(base + size);
> +
> +       base &= PAGE_MASK;
> +       size = end - base;
>         return memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_NOMAP);
>  }
>  
> 

Should the same be applied to memblock_clear_nomap()?

This is indeed much nicer way to fix the problem! Now, when no-map is
rounded outwards, do we still need 7ace06a01efa?

Thanks
Vladimir

> Note that I recently removed the frivolous use of MEMBLOCK_NOMAP in
> __map_mem() so the remaining calls should mostly be true reservations
> originating from the boot environment.
> 
> 
> 
> 
> 


