Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FC6C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1MRlh6AE092pgDrBOK7zH37nTa3jlHIh7copY4WYSo=; b=xxgAfRKMFnx5GFeIsPvKv/RqWC
	P9vXC8VKCjbw1F4WULBWn1SekVUFO8t9E58NbUa/Foq9kYM/+Z4X7V2B+McVTLZK8oKnLZ6jmz4ED
	kot6McRVqyTDS8zYvKaI3jzBrJH78/yVMETYXHe7UlvvM3WdCTrMdUVmbho4P79Z23+uiUNNpvQ4S
	DTHXiBPqd2BNoDWj6etp/GXf0JrO5pydxivtL7Ip8H19VSRrskUYhsn/vddbLbN1Mc/HKHVUgTcdv
	qPWClz2qgoXHs3oaYlxNfwZwOe+/jCvFeVsm82F2+1MAUeT6bSCjbL2/5K18ZALSnVbh5npF31RF3
	NAuob4tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60QY-00000002T45-2eHH;
	Mon, 14 Sep 2026 06:44:30 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60QS-00000002Sz3-1HAv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789368257; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=R1MRlh6AE092pgDrBOK7zH37nTa3jlHIh7copY4WYSo=;
	b=UHhgVyfl/lrgx0RaZ5SrQ+rkICOx0jSrMqVwzU0J8YKeWaP/aihUhF7CgBlA1QJFpaF9JZvzy762pNZLarDGyH+00tcKcRVKuSZLsYoH7MtmfLR8NrmgZgPPL0yu5VX5gOCXdxrVViGMN7c3wf3YTDRV7zv8gvOxdo371ChbD7Y=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XArjucF_1789368256;
Received: from 30.246.177.179(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XArjucF_1789368256 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Sep 2026 14:44:16 +0800
Message-ID: <8bf3f266-06fd-49e0-8de8-33c7a044e997@linux.alibaba.com>
Date: Mon, 14 Sep 2026 14:44:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] KVM: arm64: Reduce overhead of full S2 teardown
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: Wei-Lin Chang <weilin.chang@arm.com>, Wang Han
 <wanghan@linux.alibaba.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20260912104834.3093878-1-maz@kernel.org>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260912104834.3093878-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_234425_267194_E30CB377 
X-CRM114-Status: GOOD (  21.51  )
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



On 9/12/26 6:48 PM, Marc Zyngier wrote:
> Tearing down a full S2 is a pretty involved process, resulting in a
> lot of TLB invalidation. These TLBIs are either on a per leaf basis if
> the HW doesn't support range invalidation, or by top-level range if it
> does. Amusingly, the latter occurs even when nothing has been
> unmapped.
> 
> Things are made worse with NV, as we have a bucket-load of shadow S2s,
> and the need to invalidate them all on the back of an MMU notifier.
> The latter will eventually be solved by the reverse-map tracking that
> Wei-Lin is working on, but we need to be better at full-S2 teardown.
> 
> This small series adds a "no TLBI" unmapping primitive, which allows
> the caller to then whack the TLBs using a VMID-wide invalidation. This
> results in far fewer TLBIs, and a better recursive virtualisation as
> we get far fewer traps as a consequence.
> 
> This applies on top of my shadow-s2 lifetime fixes, and is expected to
> be a prefix to Wei-Lin's series.
> 
> Marc Zyngier (4):
>    KVM: arm64: pgtable: Add Stage-2 unmap without TLBI primitive
>    KVM: arm64: MMU: Add kvm_stage2_unmap_all() helper
>    KVM: arm64: nv: Move full s2_mmu unmap over to kvm_stage2_unmap_all()
>    KVM: arm64: nv: Move TLBI VMALLS12E1* emulation over to
>      kvm_stage2_unmap_all()
> 
>   arch/arm64/include/asm/kvm_mmu.h     |  1 +
>   arch/arm64/include/asm/kvm_pgtable.h | 17 +++++++++++++
>   arch/arm64/include/asm/kvm_pkvm.h    |  1 +
>   arch/arm64/kvm/hyp/pgtable.c         | 38 +++++++++++++++++++++-------
>   arch/arm64/kvm/mmu.c                 | 15 +++++++++++
>   arch/arm64/kvm/nested.c              |  4 +--
>   arch/arm64/kvm/pkvm.c                |  2 ++
>   arch/arm64/kvm/sys_regs.c            | 18 ++++++-------
>   8 files changed, 75 insertions(+), 21 deletions(-)
> 


Hi Marc,

Thanks for putting this series together. I reviewed the four patches
and revisited the traces from my earlier Marc-only tests.

I have a correctness concern about child page-table reclamation.

1. Child page-table reclamation before the final TLBI

In patch 1, SKIP_S2_TLBI suppresses invalidation for both leaf and table
descriptors, while stage2_unmap_walker() still immediately releases
empty child tables.

For a child table with page_count(childp) == 1, the sequence is:

   stage2_unmap_walker()
     stage2_unmap_put_pte()
       clear the parent table descriptor
       skip its TLBI
     mm_ops->put_page(childp)
       kvm_s2_put_page()
         put_page()              /* drop the child's last reference */

   ... process the remaining address ranges ...

   __kvm_tlb_flush_vmid()         /* final invalidation in patch 2 */

This path does not use the free_unlinked_table()/call_rcu() deferred
reclamation mechanism. The existing deferred-range-TLBI path still
invalidates table descriptors immediately; the new flag skips that
invalidation too.

Patch 4 provides a caller operating on active shadow MMUs:
kvm_s2_mmu_iterate_by_vmid() holds mmu_lock for write and visits valid
matching shadow MMUs, but does not require refcnt == 0 or wait for
other vCPUs using the MMU to exit.

Another vCPU can therefore still use that shadow S2. The write lock
excludes software page-table updates, not hardware table walks.
The following interleaving is allowed:

   vCPU B / hardware walker        vCPU A
   ------------------------        ----------------------------
   Holds an old reference to T
                                   Clears parent, skips TLBI
                                   Drops T's last reference
                                   T is reused by the allocator
   Accesses T via the old reference
                                   Performs final VMID-wide TLBI

The final flush barriers cannot retroactively protect a table that
has already been freed and reused.

Is there a lifetime guarantee for these active-MMU callers that I
have missed? Otherwise, the corresponding invalidation needs to
complete before the child table's memory can be reused.

Retaining table-descriptor TLBI looks like a smaller correction
that would still remove empty-range TLBI amplification. Batching
those invalidations as well would require deferred child-table
reclamation, accounting for the lock drop/reacquisition boundaries
in the may_block path.

Thanks.
Shuai

