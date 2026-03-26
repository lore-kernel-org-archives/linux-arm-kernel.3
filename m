Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7162110AB829
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDenTbf8o1eRuhVlh46ZHzs2WPWimdsYJNuTt153VAc=; b=awULkGb1rWYVCZAkFeKNOdDzTS
	+2n9OhJEA9hr+DLE+fcU4Ww+LAskjufftSwcrGcgLsjoM45WIUVu9aYIQCPvIRxn16LssMtwM1lDH
	CkJ9lbDSZtXDZxzw69MMYhrNP21p8jMJw3nrj15BMItkslQhVOrpUMBSlYQimWRJEmWjIUDRwyOg6
	shcXGcm+jgoj45Qq3FPwX1mcuvdxMZPShGxsklSNudJ8OS01gAAivpRubblg9NR/Erx6h92c0+vqS
	mNU9aa9Nd81AjfLwly+FnuPgRyhz/DJk5/LUNjGTNMf5Xc6Jm2lgw8mQkAGZqB7pV1nQpXA00E2Yy
	qwsORDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s40-00000006Eh2-0eSP;
	Thu, 26 Mar 2026 21:16:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s3w-00000006Ege-2GBo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 21:16:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 246C82BC0;
	Thu, 26 Mar 2026 14:16:11 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB1CA3F905;
	Thu, 26 Mar 2026 14:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774559777; bh=c+mJTClcUcrdmuit2k+9X3HYT3cHU10p3egwMFS7/v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r39wWu6dqOWJPENHgQsBGzW4+ocqFqyBXBXCDNkzHc1HfZ+ubRxUq2jZdRO6WGhd0
	 2zHMTaLHrehYeL1CNq/MXVFBrldUtwo4JIshPo45JaWLIQjQTQr0DAYqzcMjGmF+yI
	 dcLMW4w5CbuKGwX65UdeYfm+kzYcMwiZqYLPoTy4=
Date: Thu, 26 Mar 2026 21:16:06 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 3/3] KVM: arm64: selftests: Enable stage-2 in NV
 preparation functions
Message-ID: <3b6cppbfja7bczelm7kgxut6tdyvtiulbbfjyfvwhvthpaigu4@pybgo4yzhrus>
References: <20260325003620.2214766-1-weilin.chang@arm.com>
 <20260325003620.2214766-4-weilin.chang@arm.com>
 <86mrzw468z.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86mrzw468z.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_141620_677910_3ADB8845 
X-CRM114-Status: GOOD (  28.27  )
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

On Wed, Mar 25, 2026 at 09:18:20AM +0000, Marc Zyngier wrote:
> On Wed, 25 Mar 2026 00:36:20 +0000,
> Wei-Lin Chang <weilin.chang@arm.com> wrote:
> > 
> > Introduce library functions for setting up guest stage-2 page tables,
> > then use that to give L2 an identity mapped stage-2 and enable it.
> > 
> > The translation and stage-2 page table built is simple, start level 0,
> > 4 levels, 4KB granules, normal cachable, 48-bit IA, 40-bit OA.
> 
> That's a no go. The most common NV-capable out there can realistically
> only do 16kB at S2, and is limited to 36bit IPA. We can't really
> afford to say "too bad" and leave the main development platform behind.

Interesting, I didn't know that! I didn't consider the guest stage-2
granule size < host stage-2 granule size case either.

> 
> > 
> > The nested page table code is adapted from lib/x86/vmx.c.
> 
> I guess this starting point is the main issue.
> 
> > 
> > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > ---
> >  .../selftests/kvm/include/arm64/nested.h      |  7 ++
> >  .../selftests/kvm/include/arm64/processor.h   |  9 ++
> >  .../testing/selftests/kvm/lib/arm64/nested.c  | 97 ++++++++++++++++++-
> >  3 files changed, 111 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/include/arm64/nested.h b/tools/testing/selftests/kvm/include/arm64/nested.h
> > index 739ff2ee0161..0be10a775e48 100644
> > --- a/tools/testing/selftests/kvm/include/arm64/nested.h
> > +++ b/tools/testing/selftests/kvm/include/arm64/nested.h
> > @@ -6,6 +6,13 @@
> >  #ifndef SELFTEST_KVM_NESTED_H
> >  #define SELFTEST_KVM_NESTED_H
> >  
> > +uint64_t get_l1_vtcr(void);
> > +
> > +void nested_map(struct kvm_vm *vm, vm_paddr_t guest_pgd,
> > +		uint64_t nested_paddr, uint64_t paddr, uint64_t size);
> > +void nested_map_memslot(struct kvm_vm *vm, vm_paddr_t guest_pgd,
> > +			uint32_t memslot);
> > +
> >  void prepare_l2_stack(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
> >  void prepare_hyp_state(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
> >  void prepare_eret_destination(struct kvm_vm *vm, struct kvm_vcpu *vcpu, void *l2_pc);
> > diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
> > index ac97a1c436fc..5de2e932d95a 100644
> > --- a/tools/testing/selftests/kvm/include/arm64/processor.h
> > +++ b/tools/testing/selftests/kvm/include/arm64/processor.h
> > @@ -104,6 +104,15 @@
> >  #define TCR_HA			(UL(1) << 39)
> >  #define TCR_DS			(UL(1) << 59)
> >  
> > +/* VTCR_EL2 specific flags */
> > +#define VTCR_EL2_T0SZ_BITS(x)	((UL(64) - (x)) << VTCR_EL2_T0SZ_SHIFT)
> > +
> > +#define VTCR_EL2_SL0_LV0_4K	(UL(2) << VTCR_EL2_SL0_SHIFT)
> > +#define VTCR_EL2_SL0_LV1_4K	(UL(1) << VTCR_EL2_SL0_SHIFT)
> > +#define VTCR_EL2_SL0_LV2_4K	(UL(0) << VTCR_EL2_SL0_SHIFT)
> > +
> > +#define VTCR_EL2_PS_40_BITS	(UL(2) << VTCR_EL2_PS_SHIFT)
> > +
> >  /*
> >   * AttrIndx[2:0] encoding (mapping attributes defined in the MAIR* registers).
> >   */
> > diff --git a/tools/testing/selftests/kvm/lib/arm64/nested.c b/tools/testing/selftests/kvm/lib/arm64/nested.c
> > index 111d02f44cfe..910f8cd30f96 100644
> > --- a/tools/testing/selftests/kvm/lib/arm64/nested.c
> > +++ b/tools/testing/selftests/kvm/lib/arm64/nested.c
> > @@ -1,8 +1,11 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  /*
> > - * ARM64 Nested virtualization helpers
> > + * ARM64 Nested virtualization helpers, nested page table code adapted from
> > + * ../x86/vmx.c.
> >   */
> >  
> > +#include <linux/sizes.h>
> > +
> >  #include "kvm_util.h"
> >  #include "nested.h"
> >  #include "processor.h"
> > @@ -18,6 +21,87 @@ static void hvc_handler(struct ex_regs *regs)
> >  	regs->pc = (u64)after_hvc;
> >  }
> >  
> > +uint64_t get_l1_vtcr(void)
> > +{
> > +	return VTCR_EL2_PS_40_BITS | VTCR_EL2_TG0_4K | VTCR_EL2_ORGN0_WBWA |
> > +	       VTCR_EL2_IRGN0_WBWA | VTCR_EL2_SL0_LV0_4K | VTCR_EL2_T0SZ_BITS(48);
> 
> Irk. See above.
> 
> > +}
> > +
> > +static void __nested_pg_map(struct kvm_vm *vm, uint64_t guest_pgd,
> > +		     uint64_t nested_paddr, uint64_t paddr, uint64_t flags)
> > +{
> > +	uint8_t attr_idx = flags & (PTE_ATTRINDX_MASK >> PTE_ATTRINDX_SHIFT);
> > +	uint64_t pg_attr;
> > +	uint64_t *ptep;
> > +
> > +	TEST_ASSERT((nested_paddr % vm->page_size) == 0,
> > +		"L2 IPA not on page boundary,\n"
> > +		"  nested_paddr: 0x%lx vm->page_size: 0x%x", nested_paddr, vm->page_size);
> > +	TEST_ASSERT((paddr % vm->page_size) == 0,
> > +		"Guest physical address not on page boundary,\n"
> > +		"  paddr: 0x%lx vm->page_size: 0x%x", paddr, vm->page_size);
> > +	TEST_ASSERT((paddr >> vm->page_shift) <= vm->max_gfn,
> > +		"Physical address beyond maximum supported,\n"
> > +		"  paddr: 0x%lx vm->max_gfn: 0x%lx vm->page_size: 0x%x",
> > +		paddr, vm->max_gfn, vm->page_size);
> > +
> > +	ptep = addr_gpa2hva(vm, guest_pgd) + ((nested_paddr >> 39) & 0x1ffu) * 8;
> > +	if (!*ptep)
> > +		*ptep = (vm_alloc_page_table(vm) & GENMASK(47, 12)) | PGD_TYPE_TABLE | PTE_VALID;
> > +	ptep = addr_gpa2hva(vm, *ptep & GENMASK(47, 12)) + ((nested_paddr >> 30) & 0x1ffu) * 8;
> > +	if (!*ptep)
> > +		*ptep = (vm_alloc_page_table(vm) & GENMASK(47, 12)) | PUD_TYPE_TABLE | PTE_VALID;
> > +	ptep = addr_gpa2hva(vm, *ptep & GENMASK(47, 12)) + ((nested_paddr >> 21) & 0x1ffu) * 8;
> > +	if (!*ptep)
> > +		*ptep = (vm_alloc_page_table(vm) & GENMASK(47, 12)) | PMD_TYPE_TABLE | PTE_VALID;
> > +	ptep = addr_gpa2hva(vm, *ptep & GENMASK(47, 12)) + ((nested_paddr >> 12) & 0x1ffu) * 8;
> > +
> > +	pg_attr = PTE_AF | PTE_ATTRINDX(attr_idx) | PTE_TYPE_PAGE | PTE_VALID;
> > +	pg_attr |= PTE_SHARED;
> > +
> > +	*ptep = (paddr & GENMASK(47, 12)) | pg_attr;
> 
> Please use named constants, and write a page table generator that is
> independent of page, IA and OA sizes, as advertised to the guest.

Ack, and yes, I should absolutely consider what is advertised to the
guest...

Thanks,
Wei-Lin Chang

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

