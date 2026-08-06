Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA37C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pe3dMhTxHcMO5WHLu6ZWh0gIatxAtHBns4hOtE8mPIU=; b=xgDG8+TrKZQGiY5/iXGFVKVMgq
	Iwf4Dz53J/LlvVhNWwwnlrx2fz/V0qwageL/B6KJXO3EHXUcQhUZPYYpK6V5JA5O4L/36ookfpAek
	22M/AeNXfPewU8MWUvFuGfrhvf1i/DIS2RiYGySeYKwnKIhGnjPziPB4M/YxTgKzgt+yk4EvkjEef
	2oUeq44NSuJ9cgQdXBMOtSJBNmGmsc6x3qQE3MQOW2cSYPckWxoEwhxLQ/Sz7hglTvXTyWJCTAAPu
	rNC8gvELWKO67Swh5/dmZGRsDulszgK+Y7XufKocSDaW6XoIOgkjUfpignHa0qoSgKfEqNMu6SMSu
	cMF29ptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzPv-000000061vT-1AwB;
	Thu, 06 Aug 2026 14:49:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzPs-000000061ux-2LWf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 14:49:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA4CC153B;
	Thu,  6 Aug 2026 07:49:44 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FFAF3F9A2;
	Thu,  6 Aug 2026 07:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786027788; bh=whU/Y/37THjNQy2P9DoinwMd2gLyTKHPVo7+cZedDj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I51RI839TCVmePxxyZg7wIRaJYT55sVfFl9wSIgieSb8gBJ5PJFqE8hFmS8A7k9ZT
	 pUB1WgOpUi+iFc+VdCS/OwGQ/u1mFlKF4/aoY12/i21B9dkQU3ZZi6y1q8g97CQQ0P
	 3w8/4wo7tYMoK9JDYxdl9rFPiNXp9+7DEdFajInc=
Date: Thu, 6 Aug 2026 15:49:35 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Karl Mehltretter <kmehltretter@gmail.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, grayhat@foxmail.com
Subject: Re: [PATCH v2] KVM: arm64: nv: Keep the shadow S2 MMUs at fixed
 addresses
Message-ID: <vhpuadbpqligv2pfol6wsxtwpdkdeorlq2k5ifurwgry5pbh5x@jdm5jqm57sp3>
References: <20260806062352.93489-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806062352.93489-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_074952_694930_C1C59EA6 
X-CRM114-Status: GOOD (  38.70  )
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

Just some nits:

On Thu, Aug 06, 2026 at 08:23:52AM +0200, Karl Mehltretter wrote:
> vcpu->arch.hw_mmu caches the S2 MMU the vCPU currently runs on; outside
> of a hyp context, that is one of the shadow S2 MMUs.
> kvm_vcpu_init_nested() can grow kvm->arch.nested_mmus while initialising
> another vCPU: it copies the MMUs, publishes the new allocation, and frees
> the old one.  It updates pgt->mmu back-pointers, but not hw_mmu, leaving
> already-running vCPUs with pointers to freed memory.  hw_mmu cannot be
> fixed up the same way: a running vCPU reads it without holding mmu_lock.
> 
> The reallocation similarly leaves the nested S2 ptdump file's debugfs
> private data pointing into the freed array, and the copied refcounts stay
> elevated forever as running vCPUs drop their references to the old entries.
> 
> KASAN reports the cached hw_mmu access as a slab-use-after-free in
> kvm_handle_guest_abort().
> 
> Turn nested_mmus into a pointer table allocated once for the maximum
> number of vCPUs during VM creation.  Allocate the MMUs separately as
> vCPUs are initialised and append their pointers to that table.  The MMU
> objects never move, so cached hw_mmu pointers, pgt->mmu back-pointers,
> ptdump private data, and refcounts remain valid.
> 
> Operations that inspect nested_mmus on a live VM hold mmu_lock and
> iterate only up to nested_mmus_size, so entries above it are invisible
> and updating nested_mmus_size under the lock is the only publication
> that needs ordering.
> 
> The old failure path passed uninitialised entries to kvm_free_stage2_pgd(),
> which derives the kvm pointer from mmu->arch; free only the MMUs that were
> fully initialised.

I felt the commit message needs to be tightened a bit, so I restructured
it slightly and removed some information I found unneeded. Here is my
attempt, feel free to use it if you find it better or further improve it:

kvm_vcpu_init_nested() can grow kvm->arch.nested_mmus while initialising
another vCPU: it copies the MMUs, publishes the new allocation, and frees
the old one.  It updates pgt->mmu back-pointers, but not hw_mmu, leaving
already-running vCPUs with pointers to freed memory.  hw_mmu cannot be
fixed up the same way: a running vCPU reads it without holding mmu_lock.
The nested S2 ptdump file's debugfs private data is also affected as it
points to the freed array.

KASAN reports a freed hw_mmu access as a slab-use-after-free in
kvm_handle_guest_abort().

Turn nested_mmus into a pointer table allocated once for the maximum
number of vCPUs during VM creation.  Allocate the MMUs separately as
vCPUs are initialised and append their pointers to that table.  The MMU
objects never move, so cached hw_mmu pointers, pgt->mmu back-pointers,
ptdump private data.

Two issues in the old implementation are also fixed:
 - The old failure path passed uninitialised mmus to
   kvm_free_stage2_pgd(), which doesn't expect it, leading to NULL
   dereferences. Here we only call kvm_free_stage2_pgd() with initialised
   mmus.
 - Previously the initialization of the new mmus were not ordered
   before the publication of the new nested_mmus_size. Fix this by
   taking the mmu_lock when increasing nested_mmus_size.

> 
> Fixes: 4f128f8e1aaa ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
> Cc: stable@vger.kernel.org
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  arch/arm64/include/asm/kvm_host.h   |  6 +-
>  arch/arm64/include/asm/kvm_nested.h |  2 +-
>  arch/arm64/kvm/arm.c                |  7 ++-
>  arch/arm64/kvm/nested.c             | 90 +++++++++++++++++------------
>  4 files changed, 61 insertions(+), 44 deletions(-)
> 
> Changes in v2:
> - Allocate the fixed pointer table during VM creation, as suggested by Marc.
> - Allocate the MMUs individually and simplify the error and teardown paths.
> - Drop the selftest patch that triggered KASAN.
>   It is not a good fit for the existing suite.
> 
> v1: https://lore.kernel.org/r/20260803224405.41468-1-kmehltretter@gmail.com/
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index bae2c4f92ef5..59d1d77ee116 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -319,10 +319,10 @@ struct kvm_arch {
>  	u64 fgu[__NR_FGT_GROUP_IDS__];
>  
>  	/*
> -	 * Stage 2 paging state for VMs with nested S2 using a virtual
> -	 * VMID.
> +	 * Stage 2 paging state for VMs with nested S2 using a virtual VMID.
> +	 * MMUs are allocated separately to keep their addresses stable.
>  	 */
> -	struct kvm_s2_mmu *nested_mmus;
> +	struct kvm_s2_mmu **nested_mmus;
>  	size_t nested_mmus_size;
>  	int nested_mmus_next;
>  
> diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
> index 012d711034d1..d21be647ac57 100644
> --- a/arch/arm64/include/asm/kvm_nested.h
> +++ b/arch/arm64/include/asm/kvm_nested.h
> @@ -66,7 +66,7 @@ static inline u64 translate_ttbr0_el2_to_ttbr0_el1(u64 ttbr0)
>  
>  extern bool forward_smc_trap(struct kvm_vcpu *vcpu);
>  extern bool forward_debug_exception(struct kvm_vcpu *vcpu);
> -extern void kvm_init_nested(struct kvm *kvm);
> +extern int kvm_init_nested(struct kvm *kvm);
>  extern int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu);
>  extern void kvm_init_nested_s2_mmu(struct kvm_s2_mmu *mmu);
>  extern struct kvm_s2_mmu *lookup_s2_mmu(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 50adfff75be8..e883e45382fb 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -223,8 +223,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  	mutex_unlock(&kvm->lock);
>  #endif
>  
> -	kvm_init_nested(kvm);
> -
>  	ret = kvm_share_hyp(kvm, kvm + 1);
>  	if (ret)
>  		return ret;
> @@ -239,6 +237,10 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  	if (ret)
>  		goto err_free_cpumask;
>  
> +	ret = kvm_init_nested(kvm);
> +	if (ret)
> +		goto err_uninit_mmu;
> +
>  	if (is_protected_kvm_enabled()) {
>  		/*
>  		 * If any failures occur after this is successful, make sure to
> @@ -267,6 +269,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  
>  err_uninit_mmu:
>  	kvm_uninit_stage2_mmu(kvm);
> +	kvfree(kvm->arch.nested_mmus);
>  err_free_cpumask:
>  	free_cpumask_var(kvm->arch.supported_cpus);
>  err_unshare_kvm:
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index dfb96edbdc43..90bb17a819a1 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -44,11 +44,19 @@ struct vncr_tlb {
>   */
>  #define S2_MMU_PER_VCPU		2
>  
> -void kvm_init_nested(struct kvm *kvm)
> +int kvm_init_nested(struct kvm *kvm)
>  {
> -	kvm->arch.nested_mmus = NULL;
> +	/* Allocate the fixed-size pointer table once per VM. */

This comment seems a bit redundant.

> +	kvm->arch.nested_mmus = kvcalloc(KVM_MAX_VCPUS * S2_MMU_PER_VCPU,
> +					 sizeof(*kvm->arch.nested_mmus),
> +					 GFP_KERNEL_ACCOUNT);
> +	if (!kvm->arch.nested_mmus)
> +		return -ENOMEM;
> +
>  	kvm->arch.nested_mmus_size = 0;
>  	atomic_set(&kvm->arch.vncr_map_count, 0);
> +
> +	return 0;
>  }
>  
>  static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
> @@ -66,11 +74,17 @@ static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
>  	return kvm_init_stage2_mmu(kvm, mmu, kvm_get_pa_bits(kvm));
>  }
>  
> +static void free_nested_s2_mmu(struct kvm_s2_mmu *mmu)
> +{
> +	kvm_free_stage2_pgd(mmu);
> +	kfree(mmu);
> +}
> +
>  int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm *kvm = vcpu->kvm;
> -	struct kvm_s2_mmu *tmp;
> -	int num_mmus, ret = 0;
> +	struct kvm_s2_mmu *mmu;
> +	int num_mmus, ret, i;
>  
>  	if (test_bit(KVM_ARM_VCPU_HAS_EL2_E2H0, kvm->arch.vcpu_features) &&
>  	    !cpus_have_final_cap(ARM64_HAS_HCR_NV1))
> @@ -91,44 +105,44 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
>  	 */
>  	num_mmus = atomic_read(&kvm->online_vcpus) * S2_MMU_PER_VCPU;
>  
> -	if (num_mmus > kvm->arch.nested_mmus_size) {
> -		tmp = kvcalloc(num_mmus, sizeof(*tmp), GFP_KERNEL_ACCOUNT);
> -		if (!tmp)
> -			return -ENOMEM;
> -
> -		write_lock(&kvm->mmu_lock);
> +	if (num_mmus <= kvm->arch.nested_mmus_size)
> +		return 0;
>  
> -		if (kvm->arch.nested_mmus_size) {
> -			memcpy(tmp, kvm->arch.nested_mmus,
> -			       size_mul(sizeof(*tmp), kvm->arch.nested_mmus_size));
> +	lockdep_assert_held(&kvm->arch.config_lock);
>  
> -			for (int i = 0; i < kvm->arch.nested_mmus_size; i++)
> -				tmp[i].pgt->mmu = &tmp[i];
> +	for (i = 0; i < S2_MMU_PER_VCPU; i++) {
> +		mmu = kzalloc_obj(*mmu, GFP_KERNEL_ACCOUNT);
> +		if (!mmu) {
> +			ret = -ENOMEM;
> +			goto err_free_mmus;
>  		}
>  
> -		swap(kvm->arch.nested_mmus, tmp);
> -
> -		write_unlock(&kvm->mmu_lock);
> +		ret = init_nested_s2_mmu(kvm, mmu);
> +		if (ret) {
> +			kfree(mmu);
> +			goto err_free_vncr;
> +		}
>  
> -		kvfree(tmp);
> +		kvm->arch.nested_mmus[kvm->arch.nested_mmus_size + i] = mmu;
>  	}
>  
> -	for (int i = kvm->arch.nested_mmus_size; !ret && i < num_mmus; i++)
> -		ret = init_nested_s2_mmu(kvm, &kvm->arch.nested_mmus[i]);
> +	write_lock(&kvm->mmu_lock);

Opportunity to use guard() or scoped_guard() here.

Thanks,
Wei-Lin Chang

>  
> -	if (ret) {
> -		for (int i = kvm->arch.nested_mmus_size; i < num_mmus; i++)
> -			kvm_free_stage2_pgd(&kvm->arch.nested_mmus[i]);
> +	kvm->arch.nested_mmus_size += S2_MMU_PER_VCPU;
>  
> -		free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
> -		vcpu->arch.ctxt.vncr_array = NULL;
> +	write_unlock(&kvm->mmu_lock);
>  
> -		return ret;
> -	}
> +	return 0;
>  
> -	kvm->arch.nested_mmus_size = num_mmus;
> +err_free_vncr:
> +	free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
> +	vcpu->arch.ctxt.vncr_array = NULL;
>  
> -	return 0;
> +err_free_mmus:
> +	while (i--)
> +		free_nested_s2_mmu(kvm->arch.nested_mmus[kvm->arch.nested_mmus_size + i]);
> +
> +	return ret;
>  }
>  
>  struct s2_walk_info {
> @@ -725,7 +739,7 @@ void kvm_s2_mmu_iterate_by_vmid(struct kvm *kvm, u16 vmid,
>  	write_lock(&kvm->mmu_lock);
>  
>  	for (int i = 0; i < kvm->arch.nested_mmus_size; i++) {
> -		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
> +		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
>  
>  		if (!kvm_s2_mmu_valid(mmu))
>  			continue;
> @@ -767,7 +781,7 @@ struct kvm_s2_mmu *lookup_s2_mmu(struct kvm_vcpu *vcpu)
>  	 *   if S2 translation is disabled.
>  	 */
>  	for (int i = 0; i < kvm->arch.nested_mmus_size; i++) {
> -		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
> +		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
>  
>  		if (!kvm_s2_mmu_valid(mmu))
>  			continue;
> @@ -806,7 +820,7 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
>  	for (i = kvm->arch.nested_mmus_next;
>  	     i < (kvm->arch.nested_mmus_size + kvm->arch.nested_mmus_next);
>  	     i++) {
> -		s2_mmu = &kvm->arch.nested_mmus[i % kvm->arch.nested_mmus_size];
> +		s2_mmu = kvm->arch.nested_mmus[i % kvm->arch.nested_mmus_size];
>  
>  		if (atomic_read(&s2_mmu->refcnt) == 0)
>  			break;
> @@ -1223,7 +1237,7 @@ void kvm_nested_s2_wp(struct kvm *kvm)
>  		return;
>  
>  	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
> -		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
> +		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
>  
>  		if (kvm_s2_mmu_valid(mmu))
>  			kvm_stage2_wp_range(mmu, 0, kvm_phys_size(mmu));
> @@ -1242,7 +1256,7 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
>  		return;
>  
>  	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
> -		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
> +		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
>  
>  		if (kvm_s2_mmu_valid(mmu))
>  			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
> @@ -1261,7 +1275,7 @@ void kvm_nested_s2_flush(struct kvm *kvm)
>  		return;
>  
>  	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
> -		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
> +		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
>  
>  		if (kvm_s2_mmu_valid(mmu))
>  			kvm_stage2_flush_range(mmu, 0, kvm_phys_size(mmu));
> @@ -1273,10 +1287,10 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
>  	int i;
>  
>  	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
> -		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
> +		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
>  
>  		if (!WARN_ON(atomic_read(&mmu->refcnt)))
> -			kvm_free_stage2_pgd(mmu);
> +			free_nested_s2_mmu(mmu);
>  	}
>  	kvfree(kvm->arch.nested_mmus);
>  	kvm->arch.nested_mmus = NULL;
> -- 
> 2.39.5 (Apple Git-154)
> 

