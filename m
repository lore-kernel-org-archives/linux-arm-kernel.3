Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDD5C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFOP6/lgY5mDIoJX47tBtTyO+JAhWfX6Gspj0vjq/yU=; b=HrK5Ee6zT8O3/1phU41stUQ/J0
	nPAXnn99bVUVaCjq2mfONxnh7LpOQWs7ZFlbPgHBpLFnGBuVN2/hc9AEmvxuWmPy84LZRak0K/rbF
	5X20FEqBlfR8g4Nv6Vpuy2FQttDDIG/2cZZhD8aGf5lQsIwbZSEhWlg0OmmSO95Zbm3IUlW57W/TE
	Efe1POP1p61gn9KbqqQklqVWWpfw86FDvI0q7U97VpkOGSvlprQcHMaK3Ges1LDIdxQMuNoNZBagq
	ll/MoNRzR8zfFY7MGVAtdtAPBym7reug0BO+cFGeUb245uYIGr40JTDRCie1fxu5ioi1tQFSKxulU
	FSc4ltGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUicd-0000000B6Tw-4A0V;
	Thu, 26 Jun 2025 09:10:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiGX-0000000B1sZ-3U0y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:47:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AA101758;
	Thu, 26 Jun 2025 01:47:11 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E19A03F58B;
	Thu, 26 Jun 2025 01:47:25 -0700 (PDT)
Message-ID: <b0ef3756-2cd2-41d7-b757-0518332e1b54@arm.com>
Date: Thu, 26 Jun 2025 09:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, Mike Rapoport <rppt@kernel.org>,
 Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com> <aE53Jp7ZGgTxtxwG@kernel.org>
 <956f6ebe-606f-4575-a0a5-7841c95b5371@arm.com>
 <cab45bd6-8108-4a6f-816a-3f7b70a2902f@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <cab45bd6-8108-4a6f-816a-3f7b70a2902f@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_014729_947913_0A86B7FB 
X-CRM114-Status: GOOD (  37.82  )
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

On 25/06/2025 21:40, Yang Shi wrote:
> 
> 
> On 6/25/25 4:04 AM, Ryan Roberts wrote:
>> On 15/06/2025 08:32, Mike Rapoport wrote:
>>> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
>>>> -/*
>>>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>>>> - */
>>>> -static int __change_memory_common(unsigned long start, unsigned long size,
>>>> +static int ___change_memory_common(unsigned long start, unsigned long size,
>>>>                   pgprot_t set_mask, pgprot_t clear_mask)
>>>>   {
>>>>       struct page_change_data data;
>>>> @@ -61,9 +140,28 @@ static int __change_memory_common(unsigned long start,
>>>> unsigned long size,
>>>>       data.set_mask = set_mask;
>>>>       data.clear_mask = clear_mask;
>>>>   -    ret = apply_to_page_range(&init_mm, start, size, change_page_range,
>>>> -                    &data);
>>>> +    arch_enter_lazy_mmu_mode();
>>>> +
>>>> +    /*
>>>> +     * The caller must ensure that the range we are operating on does not
>>>> +     * partially overlap a block mapping. Any such case should either not
>>>> +     * exist, or must be eliminated by splitting the mapping - which for
>>>> +     * kernel mappings can be done only on BBML2 systems.
>>>> +     *
>>>> +     */
>>>> +    ret = walk_kernel_page_table_range_lockless(start, start + size,
>>>> +                            &pageattr_ops, NULL, &data);
>>> x86 has a cpa_lock for set_memory/set_direct_map to ensure that there's on
>>> concurrency in kernel page table updates. I think arm64 has to have such
>>> lock as well.
>> We don't have a lock today, using apply_to_page_range(); we are expecting that
>> the caller has exclusive ownership of the portion of virtual memory - i.e. the
>> vmalloc region or linear map. So I don't think this patch changes that
>> requirement?
>>
>> Where it does get a bit more hairy is when we introduce the support for
>> splitting. In that case, 2 non-overlapping areas of virtual memory may share a
>> large leaf mapping that needs to be split. But I've been discussing that with
>> Yang Shi at [1] and I think we can handle that locklessly too.
> 
> If the split is serialized by a lock, changing permission can be lockless. But
> if split is lockless, changing permission may be a little bit tricky,
> particularly for CONT mappings. The implementation in my split patch assumes the
> whole range has cont bit cleared if the first PTE in the range has cont bit
> cleared because the lock guarantees two concurrent splits are serialized.
> 
> But lockless split may trigger the below race:
> 
> CPU A is splitting the page table, CPU B is changing the permission for one PTE
> entry in the same table. Clearing cont bit is RMW, changing permission is RMW
> too, but neither of them is atomic.
> 
>                CPU A                                      CPU B
> read the PTE read the PTE
> clear the cont bit for the PTE
>                                    change the PTE permission from RW to RO
>                                    store the new PTE
> 
> store the new PTE <- it will overwrite the PTE value stored by CPU B and result
> in misprogrammed cont PTEs

Ahh yes, good point! I missed that. When I was thinking about this, I had
assumed that *both* CPUs racing to split would (non-atomically) RMW to remove
the cont bit on the whole block. That is safe as long as nothing else in the PTE
changes. But of course you're right that the first one to complete that may then
go on to modify the permissions in their portion of the now-split VA space. So
there is definitely a problem.

> 
> 
> We should need do one the of the follows to avoid the race off the top of my head:
> 1. Serialize the split with a lock

I guess this is certainly the simplest as per your original proposal.

> 2. Make page table RMW atomic in both split and permission change

I don't think we would need atomic RMW for the permission change - we would only
need it for removing the cont bit? My reasoning is that by the time a thread is
doing the permission change it must have already finished splitting the cont
block. The permission change will only be for PTEs that we know we have
exclusive access too. The other CPU may still be "splitting" the cont block, but
since we already won, it will just be reading the PTEs and noticing that cont is
already clear? I guess split_contpte()/split_contpmd() becomes a loop doing
READ_ONCE() to test if the bit is set, followed by atomic bit clear if it was
set (avoid the atomic where we can)?

> 3. Check whether PTE is cont or not for every PTEs in the range instead of the
> first PTE, before clearing cont bit if they are

Ahh perhaps this is what I'm actually describing above?

> 4. Retry if cont bit is not cleared in permission change, but we need
> distinguish this from changing permission for the whole CONT PTE range because
> we keep cont bit for this case

I'd prefer to keep the splitting decoupled from the permission change if we can.


Personally, I'd prefer to take the lockless approach. I think it has the least
chance of contention issues. But if you prefer to use a lock, then I'm ok with
that as a starting point. I'd prefer to use a new separate lock though (like x86
does) rather than risking extra contention with the init_mm PTL.

Thanks,
Ryan


> 
> Thanks,
> Yang
> 
>>
>> Perhaps I'm misunderstanding something?
>>
>> [1] https://lore.kernel.org/all/f036acea-1bd1-48a7-8600-75ddd504b8db@arm.com/
>>
>> Thanks,
>> Ryan
>>
>>>> +    arch_leave_lazy_mmu_mode();
>>>> +
>>>> +    return ret;
>>>> +}
> 


