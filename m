Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BF4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfAd7JGcYYXraVT81RfrblS6cTDRzH0CwctA27M0khU=; b=rbN10NxYEUj3W70AVVMSwaIKV5
	Dw6U7XffSAIrm3NeWk/yvCKjJ2J/B3ntAwQzVWfRNyrSQSKMTXn4kSulBnOTR5whbANuTP+Sdi25M
	BGaBX0G0EB0JzEqDnbGw7SrbMjb61I+dpswbNx+cEjBs1hThSGj0jcjGqB9GAYciwRLRUnQz0EYuY
	ZNFMav7xDEjtRJDjHN4ubliXazyr4ymQllI4CknXYehvAsZZGxCpgRX1PC9TsNNYfgF2DzfjIZIDd
	j1ZNdwUYyRj0mvTPzdbrcf4uJiQD1b0brDRZ/MwayGKKvwmo0Bh1TKvkSaSVbk7eve5XVl+M3KGvR
	L8N17q9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjafh-0000000BbYy-0ugr;
	Tue, 14 Jul 2026 10:47:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjafe-0000000BbYb-0tVS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:47:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D9E0497;
	Tue, 14 Jul 2026 03:47:20 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 683253F7B4;
	Tue, 14 Jul 2026 03:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784026044; bh=TvHKgQ5HWvVsrB8U4vuNpf9278CkieOEhDGkfuTAmuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ey6zan9CktIWFZuePbBBXdgaE4gbiW14x9KPGfFwkgKfqdvg4dHQvdBbVrIK2kboB
	 Vk4VOEvn/Lm0hCWj86OUmil4ZtyHlT9rxC0EeptSdmcwCluQIiTSYHVJxwOePVNESH
	 8tZJP2xayRkp9mDZDRtaxysUdydiSWFVUezveBw0=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v4 4/6] KVM: arm64: Add HDBSS per-vCPU buffer management
Date: Tue, 14 Jul 2026 11:47:19 +0100
Message-ID: <alYTt-fG5rJ9D6Dm@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <df479edc-cca0-4b54-aed0-4d8c6fd4ffc7@huawei.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com> <20260709104026.2612599-5-zhengtian10@huawei.com> <alTqqxEZLuYN-gY6@LeoBrasDK> <df479edc-cca0-4b54-aed0-4d8c6fd4ffc7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_034726_429697_C556D238 
X-CRM114-Status: GOOD (  63.03  )
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

On Tue, Jul 14, 2026 at 03:15:03PM +0800, Tian Zheng wrote:
> 
> On 7/13/2026 9:39 PM, Leonardo Bras wrote:
> > On Thu, Jul 09, 2026 at 06:40:24PM +0800, Tian Zheng wrote:
> > > From: eillon <yezhenyu2@huawei.com>
> > > 
> > > Add HDBSS (Hardware Dirty Bit State Structure) per-vCPU buffer
> > > management including allocation, freeing, and loading of HDBSS
> > > registers during vCPU load.
> > > 
> > > This patch creates the foundational infrastructure:
> > > - struct vcpu_hdbss_state and enable_hdbss/hdbss_order in kvm_arch
> > > - kvm_dirty_bit.h header with alloc/free declarations
> > > - dirty_bit.c with alloc/free helpers
> > > - __load_hdbss() in VHE switch for register loading
> > > - vCPU create/destroy hooks for buffer lifecycle
> > > - sysreg definitions for HDBSS register manipulation
> > > - Makefile update for dirty_bit.o
> > > 
> > > Signed-off-by: Eillon <yezhenyu2@huawei.com>
> > > Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> > > ---
> > >   arch/arm64/include/asm/kvm_dirty_bit.h | 16 ++++++++
> > >   arch/arm64/include/asm/kvm_host.h      | 13 +++++++
> > >   arch/arm64/include/asm/sysreg.h        | 11 ++++++
> > >   arch/arm64/kvm/Makefile                |  1 +
> > >   arch/arm64/kvm/arm.c                   |  7 ++++
> > >   arch/arm64/kvm/dirty_bit.c             | 52 ++++++++++++++++++++++++++
> > >   arch/arm64/kvm/hyp/vhe/switch.c        | 15 ++++++++
> > >   arch/arm64/kvm/mmu.c                   |  1 +
> > >   arch/arm64/kvm/reset.c                 |  4 ++
> > >   9 files changed, 120 insertions(+)
> > >   create mode 100644 arch/arm64/include/asm/kvm_dirty_bit.h
> > >   create mode 100644 arch/arm64/kvm/dirty_bit.c
> > > 
> > > diff --git a/arch/arm64/include/asm/kvm_dirty_bit.h b/arch/arm64/include/asm/kvm_dirty_bit.h
> > > new file mode 100644
> > > index 000000000000..84b12f0a10af
> > > --- /dev/null
> > > +++ b/arch/arm64/include/asm/kvm_dirty_bit.h
> > > @@ -0,0 +1,16 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (C) 2026 ARM Ltd.
> > > + * Author: Leonardo Bras <leo.bras@arm.com>
> > You are adding the file, so the copyright note should be yours, then?
> 
> 
> I originally thought your earlier patchset had already created this file, so
> I
> 
> kept your copyright and author info. I'll update it to mine in the next
> version.
> 
> 
> Thanks for pointing that out!

:)

> 
> 
> > 
> > > + */
> > > +
> > > +#ifndef __ARM64_KVM_DIRTY_BIT_H__
> > > +#define __ARM64_KVM_DIRTY_BIT_H__
> > > +
> > > +#include <asm/kvm_pgtable.h>
> > > +#include <asm/sysreg.h>
> > > +
> > > +int kvm_arm_vcpu_alloc_hdbss(struct kvm_vcpu *vcpu, unsigned int order);
> > > +void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu);
> > > +
> > > +#endif /* __ARM64_KVM_DIRTY_BIT_H__ */
> > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > > index bae2c4f92ef5..c41ec6d9c45a 100644
> > > --- a/arch/arm64/include/asm/kvm_host.h
> > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > @@ -420,6 +420,10 @@ struct kvm_arch {
> > >   	 */
> > >   	struct kvm_protected_vm pkvm;
> > > 
> > > +	/* HDBSS: per-VM dirty tracking state */
> > > +	bool enable_hdbss;
> > Is there not a way of checking hdbss without adding this new member on the
> > struct? Would not checking the vcpu_hdbss_state from current vcpu should be
> > enough?
> 
> 
> HDBSS is a VM-wide property, so I currently use a VM-level flag
> (kvm->arch.enable_hdbss)
> 
> to track whether it's enabled. Paths like kvm_arch_commit_memory_region()
> and VM teardown
> 
> don't have a vCPU context to query, so per-vCPU state wouldn't work there.
> 
> 
> But you're right, maybe we don't need a value to store it — we could remove
> this flag and instead
> 
> check the VTCR_EL2_HDBSS bit directly from kvm->arch.mmu.vtcr:
> 
> 
> ```
> static inline bool kvm_hdbss_enabled(const struct kvm *kvm)
> {
>     return kvm->arch.mmu.vtcr & VTCR_EL2_HDBSS;
> }
> 
> if (kvm_hdbss_enabled(kvm))
>     ...
> ```

That looks better :)

> 
> 
> > 
> > > +	unsigned int hdbss_order;
> > Is that the order for hdbss buffer size?
> > Haven't finished reading the series, but would that be bad if this was also
> > in the per-vcpu state struct, instead?
> > 
> > Also, here I suggest that we save a number, instead of the encoding for
> > HDBSSBR_ELS_SZ, and convert it on hdbss setup. It could be either a
> > shift, or size.
> > 
> > Reason being that you used this to compare with HDBSS_MAX_ORDER at some
> > point, and there is no guarantee that the encoding will always be in
> > crescent form.
> > 
> > Also, it's not clear where you set this value.
> 
> 
> Yes, this is the HDBSS buffer order (2^order bytes per vCPU).
> 
> I put it in kvm->arch *to make sure all vCPUs in a VM have the same order*.
>

Right, but do we need to retrieve this value at any context that is not 
per-vcpu later? If all allocations happen at the same time, and the vcpus 
can get the size of their arrays (even by the register itself), maybe there 
is no need to add this member in the kvm_arch structure.

> 
> 
> I agree we should store a plain order number rather than the raw SZ
> encoding.
> 

I would recommend we always save the value in the way its most convenient 
to use. In this case, I only recall it to be used as bounds to read the 
HDBSS array, so it would be better if we save it as plain size.

> 
> The assignment should happen in kvm_arm_enable_hdbss_global(), which I
> missed in v4 and will add in v5.
> 

Okay

> 
> > > +
> > >   #ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
> > >   	/* Nested virtualization info */
> > >   	struct dentry *debugfs_nv_dentry;
> > > @@ -838,6 +842,12 @@ struct vcpu_reset_state {
> > >   	bool		reset;
> > >   };
> > > 
> > > +struct vcpu_hdbss_state {
> > > +	phys_addr_t base_phys;   /* for memory free */
> > > +	u64 hdbssbr_el2;         /* load directly */
> > > +	u64 hdbssprod_el2;       /* save directly */
> > > +};
> > > +
> > >   struct vncr_tlb;
> > > 
> > >   struct kvm_vcpu_arch {
> > > @@ -945,6 +955,9 @@ struct kvm_vcpu_arch {
> > > 
> > >   	/* Hyp-readable copy of kvm_vcpu::pid */
> > >   	pid_t pid;
> > > +
> > > +	/* HDBSS registers info */
> > > +	struct vcpu_hdbss_state hdbss;/
> > >   };
> > > 
> > >   /*
> > > diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> > > index 7aa08d59d494..1354a58c3316 100644
> > > --- a/arch/arm64/include/asm/sysreg.h
> > > +++ b/arch/arm64/include/asm/sysreg.h
> > > @@ -1039,6 +1039,17 @@
> > > 
> > >   #define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
> > >   					       GCS_CAP_VALID_TOKEN)
> > > +
> > > +/*
> > > + * Definitions for the HDBSS feature
> > > + */
> > > +#define HDBSS_MAX_ORDER		HDBSSBR_EL2_SZ_2MB
> > > +
> > See above comment on using the encoding instead of an actual size/shift
> > number.
> 
> 
> You're right — I will fix this in the next version as follows:
> 
> First, HDBSS_MAX_ORDER will be defined as a plain order number. In v4 I only
> considered the 4KB page

Maybe consider a plain size number, instead.

> 
> case and hard-coded it to 9. To make it work for any PAGE_SIZE configuration
> (4KB, 16KB, or 64KB), I'll derive
> 
> it from HDBSSBR_EL2_SZ_2MB:
> 
> ```
> #define HDBSS_MAX_ORDER    (12 + HDBSSBR_EL2_SZ_2MB - PAGE_SHIFT)
> ```
> 
> This evaluates to 9 on 4KB pages, and the correct value on 16KB/64KB pages
> as well.

Wait, I don't see what you are trying to achieve here with this. 
This order is related to the size of a HDBSS buffer, which is defined 
independently of the page size being used. In 2MB example, it does hold 
256K HDBSS entries, disregarding on the page size, IIRC. 


> 
> Second, I will add two conversion helpers in sysreg.h to bridge between
> kernel semantics (alloc_pages order)
> 
> and hardware encoding (HDBSSBR_EL2.SZ):
> 
> ```
> /* Convert alloc_pages order to HDBSSBR_EL2.SZ encoding */
> #define hdbss_order_to_sz(order)  (PAGE_SHIFT + (order) - 12)
> ```

(would be *_to_shift() no?)

In any case, see above.

> 
> These helpers work for any PAGE_SIZE configuration (4KB, 16KB, or 64KB)
> because they use PAGE_SHIFT directly.
> 
> Third, I will update the HDBSSBR_EL2 register construction in
> kvm_arm_vcpu_alloc_hdbss()：
> 
> ```
> /* before */
> .hdbssbr_el2 = HDBSSBR_EL2(page_to_phys(hdbss_pg), order),
> 
> /* after */
> .hdbssbr_el2 = HDBSSBR_EL2(page_to_phys(hdbss_pg),
>                             hdbss_order_to_sz(order)),
> ```
> 

That would be the other way around, right? I mean, here you would want the 
order encoded in HDBSSBR_SZ from the page shift, not the other way around.

In any case, see above.


> And I will also update the __free_pages() call to use
> vcpu->kvm->arch.hdbss_order directly, since that field
> 
> stores the plain order number and avoids decoding the SZ encoding at free
> time:
> 
> 
> ```
> /* before */
> __free_pages(hdbss_pg,
>      FIELD_GET(HDBSSBR_EL2_SZ_MASK,
>                vcpu->arch.hdbss.hdbssbr_el2));
> 
> /* after */
> __free_pages(hdbss_pg,
>      vcpu->kvm->arch.hdbss_order);
> ```
> 

Ah, you use the 'order' to free the buffers as well, ok.
But those are per-vcpu buffers as well, right? 

Again, the HDBSSBR_EL2.SZ AFAIK is not related to page size. 

Thanks!
Leo

