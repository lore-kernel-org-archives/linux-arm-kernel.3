Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8FDC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhueN38Adv5CfsVEW8JtCZc6GpRxwOpf5J796yTp53s=; b=Mg5iMlkQFBlzSzFoV3jAvyeTMC
	dAr4Q26arW/Ti6Oe1pe1wwr8g0u3i+v2stLVmyzEUr5jI/Onq0vxGzxL327I17Y1aE/Q01lfaEKXj
	cubO2LbBd7/P/MZZr37sD3fICas/arIW6DR0+rJJrsgosjqXuifndXEg2WX2wgqm4Z3F+QyItfFIv
	3kAN1u0O1VD0hgt+Ii/tVEHVZARMDjJr4r5fZy9FCg+qxmBCb1org672ictP5NrqVcbthoiqpNhd2
	s+TkrjyS3g9szthGBACwUMy+9FAH8Py++xiNe0hE0VHgFuHXXtlEmERskQEKGll7wgIHTO4kdByAc
	PQaj1EjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtn4-0000000HAKz-2jLn;
	Tue, 25 Feb 2025 12:11:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsyC-0000000H0Zo-2OBh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 11:19:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D131152B;
	Tue, 25 Feb 2025 03:19:40 -0800 (PST)
Received: from [10.57.84.186] (unknown [10.57.84.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41C873F673;
	Tue, 25 Feb 2025 03:19:22 -0800 (PST)
Message-ID: <929f0475-4801-4f30-869b-a15e93ca662b@arm.com>
Date: Tue, 25 Feb 2025 11:19:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel BUG at arch/arm64/mm/mmu.c:185!
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>
Cc: Luiz Capitulino <luizcap@redhat.com>, LKML
 <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, ardb@kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <will@kernel.org>
References: <a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com>
 <fe95f4c8-4b09-4d8e-99c9-987ddc2761e3@arm.com>
 <9f5600b3-6525-4045-ad1f-4408dfc9ce0f@redhat.com>
 <cf2b32a4-2217-4a31-b6d7-e60a9f4ef7dd@arm.com>
 <789c17e6-5ebc-4e37-93cd-19d24f148fd8@redhat.com>
 <dee18de8-7938-4df1-badb-c00832d6995f@redhat.com>
 <b39a37c8-c9b5-406d-a97a-24fa67622b49@arm.com> <Z72lNoOdZp5_kiT7@J2N7QTR9R3>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z72lNoOdZp5_kiT7@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_031924_702269_E260A41C 
X-CRM114-Status: GOOD (  31.76  )
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

Hi Mark,


On 25/02/2025 11:10, Mark Rutland wrote:
> On Tue, Feb 25, 2025 at 09:47:30AM +0000, Ryan Roberts wrote:
>> (Adding arm folks for visibility)
>>
>> See original report here for context:
>> https://lore.kernel.org/all/a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com/
>>
>> TL;DR is that 6.14 doesn't boot on Ampere Altra when kaslr is enabled.
>>
>>
>> On 20/02/2025 20:08, Luiz Capitulino wrote:
>>> On 2025-02-19 09:40, Luiz Capitulino wrote:
>>>
>>>>>> Btw, I'll try to bisect again and will also try to update the system's firmware
>>>>>> just in case.
>>>
>>> I tried to bisect it and again, got nowhere.
>>>
>>> Git bisect says the first bad commit is 8883957b3c9de2087fb6cf9691c1188cccf1ac9c .
>>> But I'm able to boot that tree...
>>>
>>
>> OK, think I've found the dodgy commit:
>>
>> Commit 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and use it consistently")
>>
>> Based on the changes it certainly looks like it could be the issue, but I
>> haven't spotted exactly what the problem is yet. Ard, could you take a look?
>>
>> I managed to hack multi ram bank support into kvmtool, so I can now repro the
>> issue in virtualization. Then was able to bisect to get to the above commit.
> 
> If you're able to repro this, could you please say the configuration of
> memory banks you're using, and could you hack the BUG() to dump more
> info, e.g. something lihke the below, UNTESTED patch.

I believe the root cause is due to the above commit switching from using
read_cpuid() to using read_sanitised_ftr_reg() in arm64_memblock_init(). This
function runs prior to the registers being sanitized, so the change means that
parange is calculated as 32 bit, instead of 48 bit and we screw up the
randomization of memstart_addr.

I'm just putting a patch together and will send it out for testing shortly.

Although, with defconfig, I get a slightly different panic to the originally
reported one. I suspect they are both sympptoms of the same root cause though.

I'll send out my fix then hopefully Luiz will be able to test it to confirm his
original problem has gone away.

> 
> Knowing the VA will tell us whether we're spilling out of the expected VA
> region otherwise going wildly wrong with addressing, and the values in the PTEs
> will tell us what's specifically triggering the warning.
> 
> Also, if you're able to test with CONFIG_DEBUG_VIRTUAL, that might spot if we
> have a dodgy VA->PA conversion somewhere, which can 
> 
> Mark.
> 
> ---->8----
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index b4df5bc5b1b8b..d04719919de33 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -171,19 +171,22 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>  {
>         do {
>                 pte_t old_pte = __ptep_get(ptep);
> +               pte_t new_pte =  pfn_pte(__phys_to_pfn(phys), prot);
>  
>                 /*
> -                * Required barriers to make this visible to the table walker
> -                * are deferred to the end of alloc_init_cont_pte().
> +                * After the PTE entry has been populated once, we
> +                * only allow updates to the permission attributes.
>                  */
> -               __set_pte_nosync(ptep, pfn_pte(__phys_to_pfn(phys), prot));
> +               if (!pgattr_change_is_safe(pte_val(old_pte), pte_val(new_pte))) {
> +                       panic("Unsafe PTE change @ VA:0x%016lx PA:%pa::0x%016llx -> 0x%016llx\n",
> +                              addr, &phys, pte_val(old_pte), pte_val(new_pte));
> +               }
>  
>                 /*
> -                * After the PTE entry has been populated once, we
> -                * only allow updates to the permission attributes.
> +                * Required barriers to make this visible to the table walker
> +                * are deferred to the end of alloc_init_cont_pte().
>                  */
> -               BUG_ON(!pgattr_change_is_safe(pte_val(old_pte),
> -                                             pte_val(__ptep_get(ptep))));
> +               __set_pte_nosync(ptep, pfn_pte(__phys_to_pfn(phys), prot));
>  
>                 phys += PAGE_SIZE;
>         } while (ptep++, addr += PAGE_SIZE, addr != end);
>  


