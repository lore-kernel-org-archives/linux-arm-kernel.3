Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBC6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 11:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+Aa6jyG0fEkgQTKo5R2R5BGjkiXEItVdvI1P9GpXYo=; b=X0ZXJHEgteto5WJmcvmTLMSGhv
	1ANG2Ocx8+dKMVFvsh+r4vi3id8WJyXt5CuBov+S1YMeMR9fWkFUiSFdOy08NWIA85CFxfutw1St1
	lbBDFSwV9PryL3SrSPRo7pnlG+iOIL5rlf9L3aT1uRkov4/6MCNJHbs/V3AdiVNXSYFcQN6U/YMtn
	50xEWgF6UqGkvZYbx/AJnTN4qYsiu+ELrafe5xLQe+w7wnexwaR4WNXtAIniD/6f862zjaCm08iMa
	s+RCfhqmgvy9K2x2h8O4NHc6Mp7wCQKqPhnK/boflyi9eU+o1HRzRx67cx52L2K3XGR6LHWRQKDG8
	Rm3qqmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisSB-00000007PTF-2Vkd;
	Sun, 12 Jul 2026 11:34:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisS8-00000007PSj-0AkA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 11:34:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52D411688;
	Sun, 12 Jul 2026 04:34:26 -0700 (PDT)
Received: from [10.163.128.224] (unknown [10.163.128.224])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63FAC3F85F;
	Sun, 12 Jul 2026 04:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783856070; bh=iQApNrWkND8FDy5QIKIhPDy1QVXCWDK+2ahXRVfNZeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AiUG0i6HoybQfWvQD5k8wcZYBMuYiE+/LWz2ZFFXWT9FwNzEd3pme6sZ2tyvAD2fw
	 d2MaY9HG0Ok/VneoWcP0mYNnwIOITPtTxKPHsvan+cxcefm5KWJegnHiv5dkmRsfMX
	 gSqRoC92a+ZQDjFzLZ2SbgpzR+ZTYy41929BQt4o=
Message-ID: <8d109bba-4a8b-4d2e-9b3b-7c79441f7a39@arm.com>
Date: Sun, 12 Jul 2026 17:04:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm: fix UAF caused by race between ptdump and vmap
 pgtable freeing
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 David Carlier <devnexen@gmail.com>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <8e320b30-9658-4e9f-ac4c-f99dcf855944@arm.com> <alNQccqtx5-QApup@lucifer>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <alNQccqtx5-QApup@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_043432_162824_FBA92DF1 
X-CRM114-Status: GOOD (  30.85  )
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



On 12/07/26 2:16 pm, Lorenzo Stoakes wrote:
> On Sun, Jul 12, 2026 at 12:50:08PM +0530, Dev Jain wrote:
>> Will Deacon had pushed back on a similar approach:
>> https://lore.kernel.org/all/20250530123527.GA30463@willie-the-truck/
>>
>> Although now when I read back that thread, it feels more so like my
>> incompetency to convince :) because:
> 
> No haha not so, I think more like this stuff is fiddly.
> 
>>
>> 1. I don't think this pmd_free_pte_page() path is a hot path at all
> 
> Right, and we don't actually alter that path anyway
> 
>>
>> 2. We are doing a try lock which is almost guaranteed to succeed,
>>    so it's not like we are losing out on block mappings
> 
> Also it's specifically only on when vmap tries to make a mapping huge, and
> this path is being inconsistent with a convention that already existed - if
> you manipulate kernel page table mappings that can interact with other page
> table walkers, you have to take the init_mm mmap lock.
> 
>>
>> 3. Any overhead from the try lock will get dominated by the pgtable
>>    page free/TLB flush
> 
> Yup.
> 
>>
>> I guess you did not take the RCU approach because that would put code
>> into the generic kernel pgtable freeing path.
> 
> Well a number of reasons:
> 
> * firstly yes it makes the code path always RCU only to suit a specific
>   debug user as you say :)
> 
> * Importantly - we risk genuine RCU stall issues, because the ptdump then
>   has to be RCU too over vast ranges.
> 
>   To work around that you have to shard the ptdump walk, make an assumption
>   all callbacks are RCU-safe, and that the sharding suffices to avoid these
>   stalls.
> 
>   It's a ton of complexity and assumptions to account for... vmalloc doing
>   the wrong thing.
> 
> * It is an established precedent that we mmap lock init_mm for kernel page
>   table walking as per mm/pagewalk.c. It'd require significant rework there
>   and would disallow any future walkers like this if we were to require
>   RCU.
> 
> * The mmap lock approach is simple, safe, and as you say is only actually
>   required in code paths that manipulate page tables and thus are already
>   not hotpaths.
> 
> * If there's future work to free vmalloc page tables upon vunmap()
>   (currently it does not), we have a stable, established basis for doing so
>   that again puts the weight of the work on the operation being performed
>   rather than anything else.
> 
>>
>> I liked the RCU approach because I hate the fact that ptdump takes
>> an mmap_write_lock when it is literally only reading the pgtables.
> 
> Well you have to do that for the userland side, because there could be a
> concurrent downgraded mmap read lock during an munmap, and the same goes
> for non-VMA kernel ranges too, so it would have to keep doing that
> regardless.

Oh right, I didn't know x86 was using ptdump for user tables too.


> 
>> But your approach is simpler and fixes the problem at the particular spot
>> and not hammers the fix into a generic path. So overall, ACK.
> 
> Thanks!
> 
>>
>>
>>> Lorenzo Stoakes (2):
>>>       mm/vmalloc: acquire init_mm read lock on huge vmap promotion
>>>       Revert "arm64: Enable vmalloc-huge with ptdump"
>>>
>>>  arch/arm64/include/asm/ptdump.h |  2 --
>>>  arch/arm64/mm/mmu.c             | 43 ++++-------------------------------------
>>>  arch/arm64/mm/ptdump.c          | 11 ++---------
>>>  include/linux/mmap_lock.h       |  1 +
>>>  mm/pagewalk.c                   | 22 +++++++++++----------
>>>  mm/vmalloc.c                    | 41 ++++++++++++++++++++++++++++++---------
>>>  6 files changed, 51 insertions(+), 69 deletions(-)
>>> ---
>>> base-commit: a635d6748234582ea287c5ffeae28b9b23f91c7e
>>> change-id: 20260710-series-vmap-race-fix-2a4cac988938
>>>
>>> Cheers,
>>
> 
> Cheers, Lorenzo


