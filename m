Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC518C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVyCmZ4r+rqbvXzZZK7xMj8GLtchauV0sc+rm/XQOyk=; b=OPVrjbLpKudhYz6kuhhL3oe+NB
	AcsMpspTenAmaPji5ue2fjCXWk3fihiGoZTGi8LUKxdsLdgdcm/VCDuGDkLCNfVdVLnYqQX4/goZo
	IZ2iVkSokfIU/JC9QoFszGnvoZa6NZJ8zZYdp2Z/KUHIk0ENZ1Ql2jVrVPU/8D27EI3fPB/XTsar7
	xK7ll5jzrd1WJjPTnHBmr696hBBKYiPBwr6AzgOy4l2pyjFNnWRxSZTudBxv4VQxXO0R1q4yL4rjM
	4KTObiJaj5kxDrNxABBCWTQDVWtBGj+dWmeouZeiPTu0DwKBlGUAJyEWmJ8tFxMUA+CkTf2zWckop
	DIOGESUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62eA-00000002rhG-03y3;
	Mon, 14 Sep 2026 09:06:42 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62e6-00000002rgT-23In
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789376795; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=eVyCmZ4r+rqbvXzZZK7xMj8GLtchauV0sc+rm/XQOyk=;
	b=PvY6uk4DengypDV8e+p6T7ZiHKzUmyza7wI0Rbw00+UJi3+zlhJhKxFI/rdVtVDxv0wgMCcaNCxLSHyvGfut075udpHosUXkgXPbEoEqNTBXdP8ZyDCyEaAQkErVRA8b0hB9M3EAcyNNrqLUA8q3gt7rJ6xsJkTcnEzUvpnNGHY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R421e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XAu2h1O_1789376793;
Received: from 30.246.177.179(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XAu2h1O_1789376793 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Sep 2026 17:06:34 +0800
Message-ID: <dd1ab8d0-24bc-43fd-8129-69019e136244@linux.alibaba.com>
Date: Mon, 14 Sep 2026 17:06:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] KVM: arm64: Reduce overhead of full S2 teardown
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Wei-Lin Chang <weilin.chang@arm.com>, Wang Han <wanghan@linux.alibaba.com>,
 Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>
References: <20260912104834.3093878-1-maz@kernel.org>
 <8bf3f266-06fd-49e0-8de8-33c7a044e997@linux.alibaba.com>
 <865x086yhr.wl-maz@kernel.org>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <865x086yhr.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_020639_233301_226E0B27 
X-CRM114-Status: GOOD (  32.60  )
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



On 9/14/26 4:14 PM, Marc Zyngier wrote:
> On Mon, 14 Sep 2026 07:44:15 +0100,
> Shuai Xue <xueshuai@linux.alibaba.com> wrote:
>>
>>
>>
>> On 9/12/26 6:48 PM, Marc Zyngier wrote:
>>> Tearing down a full S2 is a pretty involved process, resulting in a
>>> lot of TLB invalidation. These TLBIs are either on a per leaf basis if
>>> the HW doesn't support range invalidation, or by top-level range if it
>>> does. Amusingly, the latter occurs even when nothing has been
>>> unmapped.
>>>
>>> Things are made worse with NV, as we have a bucket-load of shadow S2s,
>>> and the need to invalidate them all on the back of an MMU notifier.
>>> The latter will eventually be solved by the reverse-map tracking that
>>> Wei-Lin is working on, but we need to be better at full-S2 teardown.
>>>
>>> This small series adds a "no TLBI" unmapping primitive, which allows
>>> the caller to then whack the TLBs using a VMID-wide invalidation. This
>>> results in far fewer TLBIs, and a better recursive virtualisation as
>>> we get far fewer traps as a consequence.
>>>
>>> This applies on top of my shadow-s2 lifetime fixes, and is expected to
>>> be a prefix to Wei-Lin's series.
>>>
>>> Marc Zyngier (4):
>>>     KVM: arm64: pgtable: Add Stage-2 unmap without TLBI primitive
>>>     KVM: arm64: MMU: Add kvm_stage2_unmap_all() helper
>>>     KVM: arm64: nv: Move full s2_mmu unmap over to kvm_stage2_unmap_all()
>>>     KVM: arm64: nv: Move TLBI VMALLS12E1* emulation over to
>>>       kvm_stage2_unmap_all()
>>>
>>>    arch/arm64/include/asm/kvm_mmu.h     |  1 +
>>>    arch/arm64/include/asm/kvm_pgtable.h | 17 +++++++++++++
>>>    arch/arm64/include/asm/kvm_pkvm.h    |  1 +
>>>    arch/arm64/kvm/hyp/pgtable.c         | 38 +++++++++++++++++++++-------
>>>    arch/arm64/kvm/mmu.c                 | 15 +++++++++++
>>>    arch/arm64/kvm/nested.c              |  4 +--
>>>    arch/arm64/kvm/pkvm.c                |  2 ++
>>>    arch/arm64/kvm/sys_regs.c            | 18 ++++++-------
>>>    8 files changed, 75 insertions(+), 21 deletions(-)
>>>
>>
>>
>> Hi Marc,
>>
>> Thanks for putting this series together. I reviewed the four patches
>> and revisited the traces from my earlier Marc-only tests.
>>
>> I have a correctness concern about child page-table reclamation.
>>
> 
> You? Or your AI model? I'd really expect you to explain *your*
> perception of the problem rather than dumping the result of your AI in
> an email.

Hi Marc,

You're right. I used AI assistance (GPT-6 Astra) for the analysis.
Let me clarify the technical points.


> 
>> 1. Child page-table reclamation before the final TLBI
>>
>> In patch 1, SKIP_S2_TLBI suppresses invalidation for both leaf and table
>> descriptors, while stage2_unmap_walker() still immediately releases
>> empty child tables.
> 
> What is a "child" table?

I meant the next-level shadow S2 table obtained here in
stage2_unmap_walker():

         if (kvm_pte_table(ctx->old, ctx->level)) {
                 childp = kvm_pte_follow(ctx->old, mm_ops);

For example, if ctx->old is an L2 table descriptor, childp points
to the L3 table that it describes. This is a host-allocated shadow
page-table page, not a guest data page.

> 
>>
>> For a child table with page_count(childp) == 1, the sequence is:
>>
>>    stage2_unmap_walker()
>>      stage2_unmap_put_pte()
>>        clear the parent table descriptor
>>        skip its TLBI
>>      mm_ops->put_page(childp)
>>        kvm_s2_put_page()
>>          put_page()              /* drop the child's last reference */
>>
>>    ... process the remaining address ranges ...
>>
>>    __kvm_tlb_flush_vmid()         /* final invalidation in patch 2 */
>>
>> This path does not use the free_unlinked_table()/call_rcu() deferred
>> reclamation mechanism. The existing deferred-range-TLBI path still
>> invalidates table descriptors immediately; the new flag skips that
>> invalidation too.
> 
> And? What is the actual problem here?

The concern is that this page becomes available for reuse before
the corresponding invalidation completes.

With page_count(childp) == 1, the walker clears the parent descriptor
through stage2_unmap_put_pte(), then releases the next-level table
with mm_ops->put_page(childp). SKIP_S2_TLBI suppresses the table-
descriptor TLBI that previously happened before this release.
The final VMID-wide TLBI happens after the full walk.

If hardware can still walk through that page using old intermediate
translation state, it could interpret contents written by a new
owner as S2 descriptors. That is the failure scenario I intended
to describe.


> 
>>
>> Patch 4 provides a caller operating on active shadow MMUs:
>> kvm_s2_mmu_iterate_by_vmid() holds mmu_lock for write and visits valid
>> matching shadow MMUs, but does not require refcnt == 0 or wait for
>> other vCPUs using the MMU to exit.
> 
> Of course it doesn't, since this is simply emulating an instruction
> local to that vcpu. How would the actual HW "wait" for another CPU to
> stop using a set of translation?

Agreed. I should not have presented the absence of a vCPU-stop
mechanism as a problem. Stopping another vCPU and waiting for
invalidation to complete are different things.

My concern is the lifetime of the host shadow page-table memory:
whether it can be reclaimed before the final TLBI completes.

> 
>>
>> Another vCPU can therefore still use that shadow S2. The write lock
>> excludes software page-table updates, not hardware table walks.
>> The following interleaving is allowed:
>>
>>    vCPU B / hardware walker        vCPU A
>>    ------------------------        ----------------------------
>>    Holds an old reference to T
>>                                    Clears parent, skips TLBI
>>                                    Drops T's last reference
>>                                    T is reused by the allocator
>>    Accesses T via the old reference
>>                                    Performs final VMID-wide TLBI
>>
>> The final flush barriers cannot retroactively protect a table that
>> has already been freed and reused.
> 
> T is a shadow page-table page on the host. How can vcpu B hold a
> reference on that page? It isn't even in the same address space.

Sorry for the misleading. I meant a hardware table walk
on the PE running B going through T, not a software reference held
by B or a guest mapping of T.

> 
> Now, I can see that B could have a VA that *translate through* T, and
> that's rather annoying.
> 
> I'll have a think.
> 
> 	M.

Yes, translating through T is what I meant.

Would retaining the table-descriptor TLBI be a reasonable minimal
fix? That would preserve invalidation before releasing the next-level
table, while still avoiding the per-range flushes for empty chunks.

Thanks for looking into it.

Shuai

