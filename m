Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FDDFEDA17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 01:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xoH794872OOyFq01xqhggvd+hqwGGLWmSAPwLLP/Fw=; b=E5ZdQALqKD03wxRVTRPptJ9tff
	Jk/5PdgjAi2Z+54SgxIVN+zEt/yhJ09uL74kpzoxy9tmnuceLPHh8JKCi8SmPpdyZL56CemjNFBmL
	O7hgFB+bWNAkjmKOjp6l1DVOh1JwTzAyvW5/HvWJw8Gcw1+CQ5qB7a9UPbd07vzA0nv0Fm0fYDMca
	b4NMVr31x2pGnButdaDnA/RMYUUe/iBJ37QHe1Lwh10+cthK634H1UDrfUzqgMehWVI25kYVLYR1o
	E1lK+mY2DMjVAgvCAdBXJTK6WhiOaaeqofO+y+DGqgn5K5NkAdYv5Gf3He6+LoHybKT0w4+qx0src
	VI0wBPsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2fqg-00000007ZND-3Ucb;
	Wed, 18 Mar 2026 01:37:26 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2fqd-00000007ZMJ-1OHp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 01:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773797837; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=3xoH794872OOyFq01xqhggvd+hqwGGLWmSAPwLLP/Fw=;
	b=nUHDiT6Rrk7tRrXOiTu6V+rlW36xPaGRiL+3rM+agD+PchwMIINKDE1cEEc13B/Wuz4fJCtzD0B/wJ0a/QvuHTiy89YDQBMRibNbN3TGn9Fd7nADlwjchVOEA9AXS4qkS/99BvY6d3Hi30L4lgZWDcnlyQvXZW/00/u13rS//Ko=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R961e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X.CcSSy_1773797832;
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.CcSSy_1773797832 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 18 Mar 2026 09:37:14 +0800
Message-ID: <6bdc4b03-9631-4717-a3fa-2785a7930aba@linux.alibaba.com>
Date: Wed, 18 Mar 2026 09:37:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the references
 for large folios
To: Barry Song <21cnbao@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 dev.jain@arm.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
 <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4yEWn3kVZPQZatOJX7NLLv-OK9pAqUDuWz25XxG5hpV=w@mail.gmail.com>
 <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com>
 <CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
 <d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com>
 <43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
 <e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
 <CAGsJ_4wZq7ZvMzMq513a89=VYs7gGkeVwSnAczxs_yYCHGFDQA@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4wZq7ZvMzMq513a89=VYs7gGkeVwSnAczxs_yYCHGFDQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_183724_044844_3886A42B 
X-CRM114-Status: GOOD (  17.08  )
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



On 3/17/26 3:30 PM, Barry Song wrote:
> On Mon, Mar 16, 2026 at 2:25 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>>
>>
>> On 3/10/26 4:17 PM, David Hildenbrand (Arm) wrote:
>>> On 3/10/26 02:37, Baolin Wang wrote:
>>>>
>>>>
>>>> On 3/7/26 4:02 PM, Barry Song wrote:
>>>>> On Sat, Mar 7, 2026 at 10:22 AM Baolin Wang
>>>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>>
>>>>>> Yes. In addition, this will involve many architectures’ implementations
>>>>>> and their differing TLB flush mechanisms, so it’s difficult to make a
>>>>>> reasonable per-architecture measurement. If any architecture has a more
>>>>>> efficient flush method, I’d prefer to implement an architecture‑specific
>>>>>> clear_flush_young_ptes().
>>>>>
>>>>> Right! Since TLBI is usually quite expensive, I wonder if a generic
>>>>> implementation for architectures lacking clear_flush_young_ptes()
>>>>> might benefit from something like the below (just a very rough idea):
>>>>>
>>>>> int clear_flush_young_ptes(struct vm_area_struct *vma,
>>>>>                    unsigned long addr, pte_t *ptep, unsigned int nr)
>>>>> {
>>>>>            unsigned long curr_addr = addr;
>>>>>            int young = 0;
>>>>>
>>>>>            while (nr--) {
>>>>>                    young |= ptep_test_and_clear_young(vma, curr_addr,
>>>>> ptep);
>>>>>                    ptep++;
>>>>>                    curr_addr += PAGE_SIZE;
>>>>>            }
>>>>>
>>>>>            if (young)
>>>>>                    flush_tlb_range(vma, addr, curr_addr);
>>>>>            return young;
>>>>> }
>>>>
>>>> I understand your point. I’m concerned that I can’t test this patch on
>>>> every architecture to validate the benefits. Anyway, let me try this on
>>>> my X86 machine first.
>>>
>>> In any case, please make that a follow-up patch :)
>>
>> Sure. However, after investigating RISC‑V and x86, I found that
>> ptep_clear_flush_young() does not flush the TLB on these architectures:
>>
>> int ptep_clear_flush_young(struct vm_area_struct *vma,
>>                             unsigned long address, pte_t *ptep)
>> {
>>          /*
>>           * On x86 CPUs, clearing the accessed bit without a TLB flush
>>           * doesn't cause data corruption. [ It could cause incorrect
>>           * page aging and the (mistaken) reclaim of hot pages, but the
>>           * chance of that should be relatively low. ]
>>           *
>>           * So as a performance optimization don't flush the TLB when
>>           * clearing the accessed bit, it will eventually be flushed by
>>           * a context switch or a VM operation anyway. [ In the rare
>>           * event of it not getting flushed for a long time the delay
>>           * shouldn't really matter because there's no real memory
>>           * pressure for swapout to react to. ]
>>           */
>>          return ptep_test_and_clear_young(vma, address, ptep);
>> }
>>
>> I don't have access to other architectures, so I think we can postpone
>> this optimization unless someone is interested in optimizing the TLB flush.
> 
> The comment is interesting. I think it likely applies to most
> architectures, including ARM64. The main reason ARM64 doesn’t use
> this approach is probably that it can issue tlbi_nosync and then
> rely on a final dsb to ensure all invalidations are completed—
> and tlbi_nosync itself is relatively cheap.

Actually, we both tried this a few years ago, but neither succeeded :).

My patch: https://lkml.org/lkml/2023/10/24/533

Your patch: 
https://lore.kernel.org/lkml/20220617070555.344368-1-21cnbao@gmail.com/

Now I’m more inclined toward your approach, to align with MGLRU. It’s 
time to restart the discussion on this patch? :)

