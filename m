Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C43FEA806
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 06:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+UTBTZt33+7ULoR+lit/7+CO2xuD9fW4t3BdgZY8xc=; b=SdeZx4Gr69wqaCUl7flxkiD7kv
	DdBv3kT8ezsRfYeqefWy+PoknnN5nyuprhDMSAPNOaXCl2ohjl6zxLalNIuwRaJ5qnUOR9SJuMykd
	YWORlv7uMVvxREe9A4JCReVSB9Dvd1gV70eJ3yP7rBLt5LAhHVk2jkbKudIWRmSZM2M0wshOP7BTK
	2YBktG36VWbXd8En5UhqRlsmnw9V99lAQ99XP7L5PAjilgnpnQfhlMO8w5vJVC0bbVh39X0WGo2px
	xCfscd6eNMryNnVEkOcRJ6txjPfBdMNeFWcwS2bqWjF995Qgw1vsiwsevXx9oenPisiI/wVcU8pzn
	aqIz2tkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Hea-00000002mat-2HRb;
	Wed, 25 Mar 2026 06:23:44 +0000
Received: from esa5.hc1455-7.c3s2.iphmx.com ([68.232.139.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5HeY-00000002maE-165w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 06:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774419823; x=1805955823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ER7hwgtmSEl8odoeppruuLVkunZbR0e0ZLa87rBiCy4=;
  b=jAo72Dinfgvdfoo+iwAjSZQnOOJ1lQCboz9v0Flj/LNbszY+D3uebdw+
   Zqg62PULorVXe5RQZy7JKZQs8ibXBvhLIOV95zv94/7bVSbPYxpFAbjL3
   O9GaQUNrJ0xjB4OAuZAF1O2l46j1p8UMI8m/0dV4NOUzN3U2SJ7LVmfWF
   iUBz+9cNcOH8cXDTerN8patXAwZfZ9ASsyQ8MilyTT7uRoV8ZITKwzTIB
   dMw9WcSL0iDIfQWbDzddQOk/IvvrX82nqxc9G5LKokzlnRUXU27mTw9z7
   9OnYxq4fiJ7aJwMSEQTUWwQmAGKKRI/zjntesQx090gixyLoaKWgfnOms
   g==;
X-CSE-ConnectionGUID: rAviEDhzTRWsDN+F+J5ACA==
X-CSE-MsgGUID: Rm/H1FPFQ8yho+NMIi9bYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="233969097"
X-IronPort-AV: E=Sophos;i="6.23,139,1770562800"; 
   d="scan'208";a="233969097"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 15:23:39 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 29221C0040B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 06:23:38 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D7878180ABF0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 06:23:37 +0000 (UTC)
Received: from sm-arm-grace07 (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 665F21800BA3;
	Wed, 25 Mar 2026 06:23:32 +0000 (UTC)
Date: Wed, 25 Mar 2026 15:23:28 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 3/3] KVM: arm64: selftests: Enable stage-2 in NV
 preparation functions
Message-ID: <acN_YIzr6JZmYhZ8@sm-arm-grace07>
References: <20260325003620.2214766-1-weilin.chang@arm.com>
 <20260325003620.2214766-4-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325003620.2214766-4-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_232342_789174_BFF86EF8 
X-CRM114-Status: GOOD (  26.95  )
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

Hi Wei Lin,
On Wed, Mar 25, 2026 at 12:36:20AM +0000, Wei-Lin Chang wrote:
> Introduce library functions for setting up guest stage-2 page tables,
> then use that to give L2 an identity mapped stage-2 and enable it.
> 
> The translation and stage-2 page table built is simple, start level 0,
> 4 levels, 4KB granules, normal cachable, 48-bit IA, 40-bit OA.
> 
> The nested page table code is adapted from lib/x86/vmx.c.
> 
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  .../selftests/kvm/include/arm64/nested.h      |  7 ++
>  .../selftests/kvm/include/arm64/processor.h   |  9 ++
>  .../testing/selftests/kvm/lib/arm64/nested.c  | 97 ++++++++++++++++++-
>  3 files changed, 111 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/arm64/nested.h b/tools/testing/selftests/kvm/include/arm64/nested.h
> index 739ff2ee0161..0be10a775e48 100644
> --- a/tools/testing/selftests/kvm/include/arm64/nested.h
> +++ b/tools/testing/selftests/kvm/include/arm64/nested.h
> @@ -6,6 +6,13 @@
>  #ifndef SELFTEST_KVM_NESTED_H
>  #define SELFTEST_KVM_NESTED_H
>  
> +uint64_t get_l1_vtcr(void);

Using a type u64 is simpler? And I think you configure guest
hypervisor's stage 2 translation table, I felt this gives us
an impression somewhere the configuration IA and OA sizes etc 
are stored.

> +
> +void nested_map(struct kvm_vm *vm, vm_paddr_t guest_pgd,
> +		uint64_t nested_paddr, uint64_t paddr, uint64_t size);
> +void nested_map_memslot(struct kvm_vm *vm, vm_paddr_t guest_pgd,
> +			uint32_t memslot);
> +
>  void prepare_l2_stack(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
>  void prepare_hyp_state(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
>  void prepare_eret_destination(struct kvm_vm *vm, struct kvm_vcpu *vcpu, void *l2_pc);
> diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
> index ac97a1c436fc..5de2e932d95a 100644
> --- a/tools/testing/selftests/kvm/include/arm64/processor.h
> +++ b/tools/testing/selftests/kvm/include/arm64/processor.h
> @@ -104,6 +104,15 @@
>  #define TCR_HA			(UL(1) << 39)
>  #define TCR_DS			(UL(1) << 59)
>  
> +/* VTCR_EL2 specific flags */
> +#define VTCR_EL2_T0SZ_BITS(x)	((UL(64) - (x)) << VTCR_EL2_T0SZ_SHIFT)
> +
> +#define VTCR_EL2_SL0_LV0_4K	(UL(2) << VTCR_EL2_SL0_SHIFT)
> +#define VTCR_EL2_SL0_LV1_4K	(UL(1) << VTCR_EL2_SL0_SHIFT)
> +#define VTCR_EL2_SL0_LV2_4K	(UL(0) << VTCR_EL2_SL0_SHIFT)
> +
> +#define VTCR_EL2_PS_40_BITS	(UL(2) << VTCR_EL2_PS_SHIFT)
> +
>  /*
>   * AttrIndx[2:0] encoding (mapping attributes defined in the MAIR* registers).
>   */
> diff --git a/tools/testing/selftests/kvm/lib/arm64/nested.c b/tools/testing/selftests/kvm/lib/arm64/nested.c
> index 111d02f44cfe..910f8cd30f96 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/nested.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/nested.c
> @@ -1,8 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * ARM64 Nested virtualization helpers
> + * ARM64 Nested virtualization helpers, nested page table code adapted from
> + * ../x86/vmx.c.
>   */
>  
> +#include <linux/sizes.h>
> +
>  #include "kvm_util.h"
>  #include "nested.h"
>  #include "processor.h"
> @@ -18,6 +21,87 @@ static void hvc_handler(struct ex_regs *regs)
>  	regs->pc = (u64)after_hvc;
>  }
>  
> +uint64_t get_l1_vtcr(void)
> +{
> +	return VTCR_EL2_PS_40_BITS | VTCR_EL2_TG0_4K | VTCR_EL2_ORGN0_WBWA |
> +	       VTCR_EL2_IRGN0_WBWA | VTCR_EL2_SL0_LV0_4K | VTCR_EL2_T0SZ_BITS(48);
> +}
> +
> +static void __nested_pg_map(struct kvm_vm *vm, uint64_t guest_pgd,
> +		     uint64_t nested_paddr, uint64_t paddr, uint64_t flags)
> +{
> +	uint8_t attr_idx = flags & (PTE_ATTRINDX_MASK >> PTE_ATTRINDX_SHIFT);
> +	uint64_t pg_attr;
> +	uint64_t *ptep;
> +
> +	TEST_ASSERT((nested_paddr % vm->page_size) == 0,
> +		"L2 IPA not on page boundary,\n"
> +		"  nested_paddr: 0x%lx vm->page_size: 0x%x", nested_paddr, vm->page_size);
> +	TEST_ASSERT((paddr % vm->page_size) == 0,
> +		"Guest physical address not on page boundary,\n"
> +		"  paddr: 0x%lx vm->page_size: 0x%x", paddr, vm->page_size);
> +	TEST_ASSERT((paddr >> vm->page_shift) <= vm->max_gfn,
> +		"Physical address beyond maximum supported,\n"
> +		"  paddr: 0x%lx vm->max_gfn: 0x%lx vm->page_size: 0x%x",
> +		paddr, vm->max_gfn, vm->page_size);
> +
> +	ptep = addr_gpa2hva(vm, guest_pgd) + ((nested_paddr >> 39) & 0x1ffu) * 8;
> +	if (!*ptep)
> +		*ptep = (vm_alloc_page_table(vm) & GENMASK(47, 12)) | PGD_TYPE_TABLE | PTE_VALID;

Same but given this is stage 2 translation tables, KVM_PTE_VALID?

Thanks,
Itaru.
> +	ptep = addr_gpa2hva(vm, *ptep & GENMASK(47, 12)) + ((nested_paddr >> 30) & 0x1ffu) * 8;
> +	if (!*ptep)
> +		*ptep = (vm_alloc_page_table(vm) & GENMASK(47, 12)) | PUD_TYPE_TABLE | PTE_VALID;
> +	ptep = addr_gpa2hva(vm, *ptep & GENMASK(47, 12)) + ((nested_paddr >> 21) & 0x1ffu) * 8;
> +	if (!*ptep)
> +		*ptep = (vm_alloc_page_table(vm) & GENMASK(47, 12)) | PMD_TYPE_TABLE | PTE_VALID;
> +	ptep = addr_gpa2hva(vm, *ptep & GENMASK(47, 12)) + ((nested_paddr >> 12) & 0x1ffu) * 8;
> +
> +	pg_attr = PTE_AF | PTE_ATTRINDX(attr_idx) | PTE_TYPE_PAGE | PTE_VALID;
> +	pg_attr |= PTE_SHARED;
> +
> +	*ptep = (paddr & GENMASK(47, 12)) | pg_attr;
> +}
> +
> +void nested_map(struct kvm_vm *vm, vm_paddr_t guest_pgd,
> +		uint64_t nested_paddr, uint64_t paddr, uint64_t size)
> +{
> +	size_t npages = size / SZ_4K;
> +
> +	TEST_ASSERT(nested_paddr + size > nested_paddr, "Vaddr overflow");
> +	TEST_ASSERT(paddr + size > paddr, "Paddr overflow");
> +
> +	while (npages--) {
> +		__nested_pg_map(vm, guest_pgd, nested_paddr, paddr, MT_NORMAL);
> +		nested_paddr += SZ_4K;
> +		paddr += SZ_4K;
> +	}
> +}
> +
> +/*
> + * Prepare an identity shadow page table that maps all the
> + * physical pages in VM.
> + */
> +void nested_map_memslot(struct kvm_vm *vm, vm_paddr_t guest_pgd,
> +			uint32_t memslot)
> +{
> +	sparsebit_idx_t i, last;
> +	struct userspace_mem_region *region =
> +		memslot2region(vm, memslot);
> +
> +	i = (region->region.guest_phys_addr >> vm->page_shift) - 1;
> +	last = i + (region->region.memory_size >> vm->page_shift);
> +	for (;;) {
> +		i = sparsebit_next_clear(region->unused_phy_pages, i);
> +		if (i > last)
> +			break;
> +
> +		nested_map(vm, guest_pgd,
> +			   (uint64_t)i << vm->page_shift,
> +			   (uint64_t)i << vm->page_shift,
> +			   1 << vm->page_shift);
> +	}
> +}
> +
>  void prepare_l2_stack(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  {
>  	size_t l2_stack_size;
> @@ -32,7 +116,16 @@ void prepare_l2_stack(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  
>  void prepare_hyp_state(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  {
> -	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2), HCR_EL2_RW);
> +	vm_paddr_t guest_pgd;
> +
> +	guest_pgd = vm_phy_pages_alloc(vm, 1,
> +				       KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> +				       vm->memslots[MEM_REGION_PT]);
> +	nested_map_memslot(vm, guest_pgd, 0);
> +
> +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2), HCR_EL2_RW | HCR_EL2_VM);
> +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VTTBR_EL2), guest_pgd);
> +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VTCR_EL2), get_l1_vtcr());
>  }
>  
>  void prepare_eret_destination(struct kvm_vm *vm, struct kvm_vcpu *vcpu, void *l2_pc)
> -- 
> 2.43.0
> 

