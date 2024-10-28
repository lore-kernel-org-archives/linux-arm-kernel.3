Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212DAD1039A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mA33eeTKWaJdjmqBnUD/rhcE1LfNEV77tCYnd/6VoGA=; b=M8H8ivDS7CFIZ6QsHYiUcik8Co
	OPbuaRjm4jU8VuGKlmEnl/6Z9N1/BEicDyqmYbdImb5LfVyNfDU9ElMuwsHFwMGChwCYKlCt57hJ2
	UuHXKVkJ7ok4zaRYYQSu4laRvr7U+pYS18Wj9UVrNDYcc6Vm2eNsbMN5T+Kk1tr2tyupqUZjBLP/X
	yF/CJL9sz7RK18lPh9FAjXJOWD68VLE+ucqyNJUF6GmbXVJv0MMOhhh3SQx5D8yW5FzR6u/OJKekV
	XAXSEl/wyiUg5Nph8mhFlsF9uyuuy3IqjT9NvEBFX6rWKJlu+B1nlbCTuR+DtqBJWcqXhanh3UDl3
	ZlWP7CXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Pqk-0000000AwVP-0rj6;
	Mon, 28 Oct 2024 13:32:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Pne-0000000Avsi-3hGK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 13:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EAC895C066E;
	Mon, 28 Oct 2024 13:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F317C4CEE4;
	Mon, 28 Oct 2024 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730122129;
	bh=hQgBGWR+9gPD1qx+ev/6QCkND1wWB6PAFowow562+SQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FlX3TdqxrTVLdrddwWlCROLyhKZfMq6SpalXB55SVTTCJd+QmCyG+9GeLGu1MCQok
	 OO9IrjzehpJs89vra2YZ0HImU0ESHaK2nnb0GbgjEtUk3VC88S2guCtossk2Yo88ey
	 PY2N2K0rNRqYZaSYcz22TmFGnmhYMhYvevAT7U7K+eZxQu8dZGqVgvyDMFNZ8n76pI
	 pKJjhIm7gY3BFW1anTFw3aa6phbVVzF3kuRskhqXJy6DaWvbsEJMDRdNAr+/VMk+4I
	 x7nq8rkW38fib77Mk9BYQq2Yly08rQbhHLam6Ol1S2pZDvIobIuFWKKJUQSNkyAljT
	 uBiXHGSighodA==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 4/4] arm64: mte: Use stage-2 NoTagAccess memory
 attribute if supported
In-Reply-To: <87o734ts4m.wl-maz@kernel.org>
References: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
 <20241028094014.2596619-5-aneesh.kumar@kernel.org>
 <87o734ts4m.wl-maz@kernel.org>
Date: Mon, 28 Oct 2024 18:58:42 +0530
Message-ID: <yq5ar080cq5x.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_062851_139142_5BA1AD4B 
X-CRM114-Status: GOOD (  46.24  )
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

Marc Zyngier <maz@kernel.org> writes:

> On Mon, 28 Oct 2024 09:40:14 +0000,
> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:
>> 
>> Currently, the kernel won't start a guest if the MTE feature is enabled
>> and the guest RAM is backed by memory which doesn't support access tags.
>> Update this such that the kernel uses the NoTagAccess memory attribute
>> while mapping pages from VMAs for which MTE is not allowed. The fault
>> from accessing the access tags with such pages is forwarded to VMM so
>> that VMM can decide to kill the guest or remap the pages so that
>> access tag storage is allowed.
>
> I only have questions here:
>
> - what is the benefit of such approach? why shouldn't that be the
>   kernel's job to fix it?
>

IMHO leaving that policy decision to VMM makes the kernel changes
simpler. In most cases, VMM will kill the guest, because these
restrictions of MTE_ALLOWED are applied at the memslot/vma.

>
> - where is the documentation for this new userspace ABI?
>

I will add the details if we agree that this should be a separate EXIT
as outlined in this patch.

>
> - are you expecting the VMM to create a new memslot for this?
>

I guess there are examples of configs where some memory regions are
backed by page cache where we don't directly use those memory regions as
allocatable memory in the guest. This change allows us to enable MTE in such
configs.

> - where is the example of a VMM using this?
>

I do have changes to kvmtool which won't do any fixup on receiving that
VM exit. I expect other VMM to do the same by default when they get a
VM exit with an unknown exit_reason. So unless VMM wants to do any
special handling, we don't need any change in the VMM.


diff --git a/arm/kvm-cpu.c b/arm/kvm-cpu.c
index 3b95750ecec7..4760bad07476 100644
--- a/arm/kvm-cpu.c
+++ b/arm/kvm-cpu.c
@@ -239,6 +239,17 @@ static bool handle_memoryfault(struct kvm_cpu *vcpu)
 	return true;
 }
 
+static bool handle_notag_access(struct kvm_cpu *vcpu)
+{
+	u64 gpa = vcpu->kvm_run->memory_fault.gpa;
+	u64 size = vcpu->kvm_run->memory_fault.size;
+
+	/* For now VMM just panic */
+	pr_err("Tag Access to a wrong memory region 0x%lx size 0x%lx\n",
+	       (unsigned long)gpa, (unsigned long)size);
+	return false;
+}
+
 bool kvm_cpu__handle_exit(struct kvm_cpu *vcpu)
 {
 	switch (vcpu->kvm_run->exit_reason) {
@@ -246,6 +257,8 @@ bool kvm_cpu__handle_exit(struct kvm_cpu *vcpu)
 		return handle_hypercall(vcpu);
 	case KVM_EXIT_MEMORY_FAULT:
 		return handle_memoryfault(vcpu);
+	case KVM_EXIT_ARM_NOTAG_ACCESS:
+		return handle_notag_access(vcpu);
 	}
 
 	return false;
diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index 32cff22f0e4d..deef6614f577 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -178,6 +178,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_NOTIFY           37
 #define KVM_EXIT_LOONGARCH_IOCSR  38
 #define KVM_EXIT_MEMORY_FAULT     39
+#define KVM_EXIT_ARM_NOTAG_ACCESS 40
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -429,10 +430,17 @@ struct kvm_run {
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
 #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+#define KVM_MEMORY_EXIT_FLAG_NOTAGACCESS (1ULL << 4)
 			__u64 flags;
 			__u64 gpa;
 			__u64 size;
 		} memory_fault;
+  		/* KVM_EXIT_ARM_NOTAG_ACCESS */
+		struct {
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} notag_access;
 		/* Fix the size of the union. */
 		char padding[256];
 	};

>> 
>> NOTE: We could also use KVM_EXIT_MEMORY_FAULT for this. I chose to
>> add a new EXIT type because this is arm64 specific exit type.
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  arch/arm64/include/asm/kvm_emulate.h |  5 +++++
>>  arch/arm64/include/asm/kvm_pgtable.h |  1 +
>>  arch/arm64/kvm/hyp/pgtable.c         | 16 +++++++++++++---
>>  arch/arm64/kvm/mmu.c                 | 28 ++++++++++++++++++++++------
>>  include/uapi/linux/kvm.h             |  7 +++++++
>>  5 files changed, 48 insertions(+), 9 deletions(-)
>> 
>> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
>> index a601a9305b10..fa0149a0606a 100644
>> --- a/arch/arm64/include/asm/kvm_emulate.h
>> +++ b/arch/arm64/include/asm/kvm_emulate.h
>> @@ -373,6 +373,11 @@ static inline bool kvm_vcpu_trap_is_exec_fault(const struct kvm_vcpu *vcpu)
>>  	return kvm_vcpu_trap_is_iabt(vcpu) && !kvm_vcpu_abt_iss1tw(vcpu);
>>  }
>>  
>> +static inline bool kvm_vcpu_trap_is_tagaccess(const struct kvm_vcpu *vcpu)
>> +{
>> +	return !!(ESR_ELx_ISS2(kvm_vcpu_get_esr(vcpu)) & ESR_ELx_TagAccess);
>> +}
>> +
>>  static __always_inline u8 kvm_vcpu_trap_get_fault(const struct kvm_vcpu *vcpu)
>>  {
>>  	return kvm_vcpu_get_esr(vcpu) & ESR_ELx_FSC;
>> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
>> index 03f4c3d7839c..5657ac1998ad 100644
>> --- a/arch/arm64/include/asm/kvm_pgtable.h
>> +++ b/arch/arm64/include/asm/kvm_pgtable.h
>> @@ -252,6 +252,7 @@ enum kvm_pgtable_prot {
>>  
>>  	KVM_PGTABLE_PROT_DEVICE			= BIT(3),
>>  	KVM_PGTABLE_PROT_NORMAL_NC		= BIT(4),
>> +	KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS	= BIT(5),
>
> This seems wrong. NOTAGACCESS is a *permission*, not a memory type.
>

Are you suggesting the name is wrong? The memory attribute value I
wanted to use is

MemAttr[3:0] = 0b0100 which is Normal, NoTagAccess, writeback cacheable.

I am following the changes similar to KVM_PGTABLE_PROT_NORMAL_NC. 

>
>>  
>>  	KVM_PGTABLE_PROT_SW0			= BIT(55),
>>  	KVM_PGTABLE_PROT_SW1			= BIT(56),
>> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
>> index b11bcebac908..bc0d9f08c49a 100644
>> --- a/arch/arm64/kvm/hyp/pgtable.c
>> +++ b/arch/arm64/kvm/hyp/pgtable.c
>> @@ -677,9 +677,11 @@ static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot p
>>  {
>>  	kvm_pte_t attr;
>>  	u32 sh = KVM_PTE_LEAF_ATTR_LO_S2_SH_IS;
>> +	unsigned long prot_mask = KVM_PGTABLE_PROT_DEVICE |
>> +				  KVM_PGTABLE_PROT_NORMAL_NC |
>> +				  KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS;
>>  
>> -	switch (prot & (KVM_PGTABLE_PROT_DEVICE |
>> -			KVM_PGTABLE_PROT_NORMAL_NC)) {
>> +	switch (prot & prot_mask) {
>>  	case KVM_PGTABLE_PROT_DEVICE | KVM_PGTABLE_PROT_NORMAL_NC:
>>  		return -EINVAL;
>>  	case KVM_PGTABLE_PROT_DEVICE:
>> @@ -692,6 +694,12 @@ static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot p
>>  			return -EINVAL;
>>  		attr = KVM_S2_MEMATTR(pgt, NORMAL_NC);
>>  		break;
>> +	case KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS:
>> +		if (system_supports_notagaccess())
>> +			attr = KVM_S2_MEMATTR(pgt, NORMAL_NOTAGACCESS);
>> +		else
>> +			return -EINVAL;
>> +		break;
>
> How do you see this working when migrating a VM from one host to
> another, one that supports FEAT_MTE_PERM and one that doesn't? The
> current assumptions are that the VMM will replay the *exact same*
> setup on the target host, and this obviously doesn't work.
>

I missed looking at kvm migration. I guess I will have to expose this as
a capability and only allow migration if the target also supports the
same capability? 


>
>>  	default:
>>  		attr = KVM_S2_MEMATTR(pgt, NORMAL);
>>  	}
>> @@ -872,7 +880,9 @@ static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
>>  static bool stage2_pte_cacheable(struct kvm_pgtable *pgt, kvm_pte_t pte)
>>  {
>>  	u64 memattr = pte & KVM_PTE_LEAF_ATTR_LO_S2_MEMATTR;
>> -	return kvm_pte_valid(pte) && memattr == KVM_S2_MEMATTR(pgt, NORMAL);
>> +	return kvm_pte_valid(pte) &&
>> +	       ((memattr == KVM_S2_MEMATTR(pgt, NORMAL)) ||
>> +		(memattr == KVM_S2_MEMATTR(pgt, NORMAL_NOTAGACCESS)));
>>  }
>>  
>>  static bool stage2_pte_executable(kvm_pte_t pte)
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index b5824e93cee0..e56c6996332e 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1647,12 +1647,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>  		 *  not a permission fault implies a translation fault which
>>  		 *  means mapping the page for the first time
>>  		 */
>> -		if (mte_allowed) {
>> +		if (mte_allowed)
>>  			sanitise_mte_tags(kvm, pfn, vma_pagesize);
>> -		} else {
>> -			ret = -EFAULT;
>> -			goto out_unlock;
>> -		}
>> +		else
>> +			prot |= KVM_PGTABLE_PROT_NORMAL_NOTAGACCESS;
>>  	}
>>  
>>  	if (writable)
>> @@ -1721,6 +1719,15 @@ static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>>  		kvm_set_pfn_accessed(kvm_pte_to_pfn(pte));
>>  }
>>  
>> +static inline void kvm_prepare_notagaccess_exit(struct kvm_vcpu *vcpu,
>> +						 gpa_t gpa, gpa_t size)
>> +{
>> +	vcpu->run->exit_reason = KVM_EXIT_ARM_NOTAG_ACCESS;
>> +	vcpu->run->notag_access.flags = 0;
>> +	vcpu->run->notag_access.gpa = gpa;
>> +	vcpu->run->notag_access.size = size;
>
> Why does size matter here? It seems pretty pointless.
>

I agree that since the exit is only generated on fault and size will
always be PAGE_SIZE, size field is not required. I will remove that in
the next update.

>
>> +}
>> +
>>  /**
>>   * kvm_handle_guest_abort - handles all 2nd stage aborts
>>   * @vcpu:	the VCPU pointer
>> @@ -1833,6 +1840,14 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>  
>>  	gfn = ipa >> PAGE_SHIFT;
>>  	memslot = gfn_to_memslot(vcpu->kvm, gfn);
>> +
>> +	if (kvm_vcpu_trap_is_tagaccess(vcpu)) {
>> +		/* exit to host and handle the error */
>> +		kvm_prepare_notagaccess_exit(vcpu, gfn << PAGE_SHIFT, PAGE_SIZE);
>> +		ret = 0;
>> +		goto out;
>> +	}
>> +
>>  	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
>>  	write_fault = kvm_is_write_fault(vcpu);
>>  	if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
>> @@ -2145,7 +2160,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>>  		if (!vma)
>>  			break;
>>  
>> -		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
>> +		if (kvm_has_mte(kvm) && !system_supports_notagaccess() &&
>> +		    !kvm_vma_mte_allowed(vma)) {
>>  			ret = -EINVAL;
>>  			break;
>>  		}
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index 637efc055145..a8268a164c4d 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -178,6 +178,7 @@ struct kvm_xen_exit {
>>  #define KVM_EXIT_NOTIFY           37
>>  #define KVM_EXIT_LOONGARCH_IOCSR  38
>>  #define KVM_EXIT_MEMORY_FAULT     39
>> +#define KVM_EXIT_ARM_NOTAG_ACCESS 40
>>  
>>  /* For KVM_EXIT_INTERNAL_ERROR */
>>  /* Emulate instruction failed. */
>> @@ -446,6 +447,12 @@ struct kvm_run {
>>  			__u64 gpa;
>>  			__u64 size;
>>  		} memory_fault;
>> +		/* KVM_EXIT_ARM_NOTAG_ACCESS */
>> +		struct {
>> +			__u64 flags;
>> +			__u64 gpa;
>> +			__u64 size;
>> +		} notag_access;
>>  		/* Fix the size of the union. */
>>  		char padding[256];
>>  	};
>
> How do you plan to handle the same thing for NV?
>

I will have to admit that I have not looked at nested virtualization. I
will update that as part of the next update.

-aneesh

