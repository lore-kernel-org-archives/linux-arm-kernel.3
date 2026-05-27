Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C00CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFENwqY2WWcSVF6m3mC9rMG4olXjMD8w8jFyzQYLLxg=; b=KCJ3R5Nvaf/UVdltlwlTaBuDwB
	LmRTSXosdMYcrHAObCH10tpW6IzJqnlk0rcYagQk0t2tL/UrMSPY04e/5PFsZ/d8JrRL1+8bBGWp1
	D1F9b47OBUd52bmCtYj22jCk4muAMu6unZXhOmExJCxfOTRP9CAtsrJHCfX3AWH9WtzjZQxlJR9Fy
	5UBsZtraZbKRUdu54Xl4KGhVMXtHwFba1pe1DjERi8rVoxGPBqOSmDwRa8AXW0HPqkRu7jk1uh0Xe
	gQQf6SrmN5FqVt8Ea4972gUhsBGNKW4m1tQodDyIoJXBLEP1cDCqMLLSn+SAEWcEWHiRu8HTR1POB
	iBhPHOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBs2-00000003y4O-1ePR;
	Wed, 27 May 2026 10:52:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBs0-00000003y3F-2O77
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:52:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AC482880;
	Wed, 27 May 2026 03:52:08 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2048A3F7D8;
	Wed, 27 May 2026 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779879133; bh=bZ3q7NUxPu/Uy9EvozZtelgm2WWc+8VfFSdGGhRHG8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhTLnJvmmF65boUW+vmDho7GBx7AJLdCghw5GsyJl5KirHzsbS5ATMbP+WfAvvEuj
	 b50xqYAeLis1xbDrNkn922M2Bgb4QPCrF2DhBY578LYskLJGNKO/3Sr0xUWdRWtWJb
	 vVnOCfUDpygkhnVvzHXwnazTXPjHCweaHXIU38jU=
Date: Wed, 27 May 2026 11:52:02 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, Lorenzo.Pieralisi2@arm.com
Subject: Re: [PATCH v14 23/44] arm64: RMI: Handle RMI_EXIT_RIPAS_CHANGE
Message-ID: <aly6g5gd27ceezehporuika5rvqu6kqnm5c5cbs36gh2gdrjws@y7gpy2lhtaaz>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-24-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513131757.116630-24-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_035216_705573_381F469D 
X-CRM114-Status: GOOD (  36.79  )
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

Hi,

On Wed, May 13, 2026 at 02:17:31PM +0100, Steven Price wrote:
> The guest can request that a region of it's protected address space is
> switched between RIPAS_RAM and RIPAS_EMPTY (and back) using
> RSI_IPA_STATE_SET. This causes a guest exit with the
> RMI_EXIT_RIPAS_CHANGE code. We treat this as a request to convert a
> protected region to unprotected (or back), exiting to the VMM to make
> the necessary changes to the guest_memfd and memslot mappings. On the
> next entry the RIPAS changes are committed by making RMI_RTT_SET_RIPAS
> calls.
> 
> The VMM may wish to reject the RIPAS change requested by the guest. For
> now it can only do this by no longer scheduling the VCPU as we don't
> currently have a usecase for returning that rejection to the guest, but
> by postponing the RMI_RTT_SET_RIPAS changes to entry we leave the door
> open for adding a new ioctl in the future for this purpose.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v13:
>  * Switch to the new RMI_RTT_UNPROT_UNMAP range-based API.
>  * Drop ugly hack for RMM bug which errored when the RIPAS was already
>    set to the desired value.
> Changes since v12:
>  * Switch to the new RMM v2.0 RMI_RTT_DATA_UNMAP which can unmap an
>    address range.
> Changes since v11:
>  * Combine the "Allow VMM to set RIPAS" patch into this one to avoid
>    adding functions before they are used.
>  * Drop the CAP for setting RIPAS and adapt to changes from previous
>    patches.
> Changes since v10:
>  * Add comment explaining the assignment of rec->run->exit.ripas_base in
>    kvm_complete_ripas_change().
> Changes since v8:
>  * Make use of ripas_change() from a previous patch to implement
>    realm_set_ipa_state().
>  * Update exit.ripas_base after a RIPAS change so that, if instead of
>    entering the guest we exit to user space, we don't attempt to repeat
>    the RIPAS change (triggering an error from the RMM).
> Changes since v7:
>  * Rework the loop in realm_set_ipa_state() to make it clear when the
>    'next' output value of rmi_rtt_set_ripas() is used.
> New patch for v7: The code was previously split awkwardly between two
> other patches.
> ---
>  arch/arm64/include/asm/kvm_rmi.h |   6 +
>  arch/arm64/kvm/mmu.c             |   8 +-
>  arch/arm64/kvm/rmi.c             | 439 +++++++++++++++++++++++++++++++
>  3 files changed, 450 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index feb534a6678e..007249a13dbc 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -88,6 +88,12 @@ int kvm_rec_enter(struct kvm_vcpu *vcpu);
>  int kvm_rec_pre_enter(struct kvm_vcpu *vcpu);
>  int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_status);
>  
> +void kvm_realm_unmap_range(struct kvm *kvm,
> +			   unsigned long ipa,
> +			   unsigned long size,
> +			   bool unmap_private,
> +			   bool may_block);
> +
>  static inline bool kvm_realm_is_private_address(struct realm *realm,
>  						unsigned long addr)
>  {
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index eb56d4e7f21a..10ca9dbe40a0 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -319,6 +319,7 @@ static void invalidate_icache_guest_page(void *va, size_t size)
>   * @start: The intermediate physical base address of the range to unmap
>   * @size:  The size of the area to unmap
>   * @may_block: Whether or not we are permitted to block
> + * @only_shared: If true then protected mappings should not be unmapped

Do you think it's better if we use enum kvm_gfn_range_filter for this?
Pass KVM_FILTER_{PRIVATE, SHARED} to indicate what to unmap. This way we
don't have the think about booleans. kvm_realm_unmap_range() in patch 23
will have to change too though.

>   *
>   * Clear a range of stage-2 mappings, lowering the various ref-counts.  Must
>   * be called while holding mmu_lock (unless for freeing the stage2 pgd before
> @@ -326,7 +327,7 @@ static void invalidate_icache_guest_page(void *va, size_t size)
>   * with things behind our backs.
>   */
>  static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64 size,
> -				 bool may_block)
> +				 bool may_block, bool only_shared)
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>  	phys_addr_t end = start + size;
> @@ -343,7 +344,7 @@ void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
>  	if (kvm_vm_is_protected(kvm_s2_mmu_to_kvm(mmu)))
>  		return;
>  
> -	__unmap_stage2_range(mmu, start, size, may_block);
> +	__unmap_stage2_range(mmu, start, size, may_block, false);
>  }
>  
>  void kvm_stage2_flush_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end)
> @@ -2418,7 +2419,8 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  
>  	__unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
>  			     (range->end - range->start) << PAGE_SHIFT,
> -			     range->may_block);
> +			     range->may_block,
> +			     !(range->attr_filter & KVM_FILTER_PRIVATE));
>  
>  	kvm_nested_s2_unmap(kvm, range->may_block);
>  	return false;

[...]

Thanks,
Wei-Lin Chang

