Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EA4C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTfWEJOp1yfMB8KxhhXX5SeoscSKH4AHfHePN1/spg8=; b=jn5ZJSA0O56ipWwWLoeT5tQpVx
	ogyY/QsODVc0kG48facm5avL5vxMipgBwgBSdsAAM9mZynG/8DSd4IonzLZ2Zb8rztQ6i4WPhmidb
	fSSaj2im/o3LSzUNNPcyokE+To+LTXxyPL2YPoKymd4Ud3QrPa6E9ax9fm4RvAt5xMUWRenXbSQQd
	twqG+9Vi10O2Crs4Vt+JsgAIIAl0xdlxGCGNR5gMjxFhrCIVmuBIynb5jO2bssSo0iOzNNXqZSBPd
	nb8dyLfV4y+tv2VEY5LEY2CXAzzUquOLc4ye04kiuFmbA2oL/Mf8R9b150+wyHulMQMDFrTaGNipP
	2Mni5VHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mcP-0000000F3IM-08zk;
	Wed, 02 Sep 2026 15:11:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mcM-0000000F3Hv-06sO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:11:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0629C165C;
	Wed,  2 Sep 2026 08:11:06 -0700 (PDT)
Received: from [10.57.49.102] (unknown [10.57.49.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42A293F673;
	Wed,  2 Sep 2026 08:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788361869; bh=xDKen3ziMe6r4IuSkrGSaftPq7eWsPGLzBSMeTCjIrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OqJVhxBR1uinXpVDwYKANBKGzsgsy9AFQvsJql59FqOqd0AIrL0idUDnKD1bFyfl1
	 gLnKdQ+Y6GjdBWdCL4Q/w1cNTSwjAo7ovtUJqY9ucXrWGhInPKiX/kSQwcJRFoGdBc
	 RfVpsaFgz8YrRBP3n1HdY9olX23gAwHMNVFAkjhY=
Message-ID: <56aa7422-ded5-449c-ba62-e7e56d229587@arm.com>
Date: Wed, 2 Sep 2026 16:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 14/45] KVM: arm64: CCA: Add basic infrastructure for
 creating a realm
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, Steven Price <steven.price@arm.com>,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-15-steven.price@arm.com>
 <c9608c82-d4ff-4c0f-8f7b-1793ed205566@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <c9608c82-d4ff-4c0f-8f7b-1793ed205566@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_081114_147097_5B44D668 
X-CRM114-Status: GOOD (  38.90  )
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

On 01/09/2026 05:07, Gavin Shan wrote:
> Hi Steve,
> 
> On 8/3/26 11:43 PM, Steven Price wrote:
>> Introduce the skeleton functions for creating and destroying a realm.
>> The IPA size requested is checked against what the RMM supports.
>>
>> The actual work of constructing the realm will be added in future
>> patches.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v15:
>>   * Remove realm->params and only temporarily allocate the page when the
>>     realm is being created.
> 
> [...]
> 
>> ---
>>   arch/arm64/include/asm/kvm_emulate.h | 24 +++++++++++
>>   arch/arm64/include/asm/kvm_rmi.h     | 63 ++++++++++++++++++++++++++++
>>   arch/arm64/kvm/arm.c                 | 12 ++++++
>>   arch/arm64/kvm/mmu.c                 | 18 +++++++-
>>   arch/arm64/kvm/rmi.c                 | 56 +++++++++++++++++++++++++
>>   5 files changed, 171 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/ 
>> include/asm/kvm_emulate.h
>> index 5bf3d7e1d92c..e26d6755279f 100644
>> --- a/arch/arm64/include/asm/kvm_emulate.h
>> +++ b/arch/arm64/include/asm/kvm_emulate.h
>> @@ -688,4 +688,28 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu 
>> *vcpu)
>>               vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
>>       }
>>   }
>> +
>> +static inline bool kvm_is_realm(struct kvm *kvm)
>> +{
>> +    if (static_branch_unlikely(&kvm_rmi_is_available))
>> +        return kvm->arch.is_realm;
>> +    return false;
>> +}
>> +
>> +static inline enum realm_state kvm_realm_state(struct kvm *kvm)
>> +{
>> +    return READ_ONCE(kvm->arch.realm.state);
>> +}
>> +
>> +static inline void kvm_set_realm_state(struct kvm *kvm,
>> +                       enum realm_state new_state)
>> +{
>> +    WRITE_ONCE(kvm->arch.realm.state, new_state);
>> +}
>> +
>> +static inline bool kvm_realm_is_created(struct kvm *kvm)
>> +{
>> +    return kvm_is_realm(kvm) && kvm_realm_state(kvm) != 
>> REALM_STATE_NONE;
>> +}
>> +
>>   #endif /* __ARM64_KVM_EMULATE_H__ */
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/ 
>> asm/kvm_rmi.h
>> index 57d24b244c95..cefd00b76806 100644
>> --- a/arch/arm64/include/asm/kvm_rmi.h
>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>> @@ -6,12 +6,75 @@
>>   #ifndef __ASM_KVM_RMI_H
>>   #define __ASM_KVM_RMI_H
>> +#include <linux/arm-smccc-rmi.h>
>> +
>> +/**
>> + * enum realm_state - State of a Realm
>> + *
>> + * Mirrors the RMM's Realm lifecycle states where they are meaningful 
>> to KVM,
>> + * with REALM_STATE_DYING being a KVM-internal state used to prevent 
>> further
>> + * requests while teardown is in progress. KVM does not track 
>> REALM_SYSTEM_OFF
>> + * or REALM_ZOMBIE separately as they naturally lead to teardown.
>> + */
>> +enum realm_state {
>> +    /**
>> +     * @REALM_STATE_NONE:
>> +     *      Realm has not yet been created. rmi_realm_create() has not
>> +     *      yet been called.
>> +     */
>> +    REALM_STATE_NONE,
>> +    /**
>> +     * @REALM_STATE_NEW:
>> +     *      Realm is under construction, rmi_realm_create() has been
>> +     *      called, but it is not yet activated. Pages may be populated.
>> +     */
>> +    REALM_STATE_NEW,
>> +    /**
>> +     * @REALM_STATE_ACTIVE:
>> +     *      Realm has been created and is eligible for execution with
>> +     *      rmi_rec_enter(). Pages may no longer be populated with
>> +     *      rmi_data_create().
>> +     */
>> +    REALM_STATE_ACTIVE,
>> +    /**
>> +     * @REALM_STATE_DYING:
>> +     *      Realm is in the process of being destroyed or has already 
>> been
>> +     *      destroyed.
>> +     */
>> +    REALM_STATE_DYING,
>> +    /**
>> +     * @REALM_STATE_DEAD:
>> +     *      Realm has been destroyed.
>> +     */
>> +    REALM_STATE_DEAD
>> +};
>> +
>>   /**
>>    * struct realm - Additional per VM data for a Realm
>> + *
>> + * @rd: Kernel mapping of the RMM-managed Realm Descriptor (RD) granule
>> + * @sro: Preallocated SRO state context for Realm MMU operations
>> + * @state: The lifetime state machine for the realm
>> + * @ia_bits: Number of valid Input Address bits in the IPA
>>    */
>>   struct realm {
>> +    void *rd;
>> +    /*
>> +     * Reused by RTT map/unmap SRO commands. Those commands are only
>> +     * issued from Realm stage-2 map/unmap paths while kvm->mmu_lock is
>> +     * held for write, including Realm fault handling where
>> +     * kvm_fault_lock() takes the write side, so concurrent use is
>> +     * serialized.
>> +     */
>> +    struct rmi_sro_state *sro;
>> +    enum realm_state state;
>> +    unsigned int ia_bits;
>>   };
>>   void kvm_init_rmi(void);
>> +u32 kvm_rmm_ipa_limit(void);
>> +
>> +int kvm_init_realm(struct kvm *kvm);
>> +void kvm_destroy_realm(struct kvm *kvm);
>>   #endif /* __ASM_KVM_RMI_H */
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index b961c22fce3d..c4d906861736 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -266,6 +266,13 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned 
>> long type)
>>       bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
>> +    /* Initialise the realm bits after the generic bits are enabled */
>> +    if (kvm_is_realm(kvm)) {
>> +        ret = kvm_init_realm(kvm);
>> +        if (ret)
>> +            goto err_uninit_mmu;
>> +    }
>> +
>>       return 0;
>>   err_uninit_mmu:
>> @@ -328,6 +335,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
>>       kvm_unshare_hyp(kvm, kvm + 1);
>>       kvm_arm_teardown_hypercalls(kvm);
>> +    if (kvm_is_realm(kvm))
>> +        kvm_destroy_realm(kvm);
>>   }
>>   static bool kvm_has_full_ptr_auth(void)
>> @@ -488,6 +497,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, 
>> long ext)
>>           else
>>               r = kvm_supports_cacheable_pfnmap();
>>           break;
>> +    case KVM_CAP_ARM_RMI:
>> +        r = static_key_enabled(&kvm_rmi_is_available);
>> +        break;
>>       default:
>>           r = 0;
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 6c941aaa10c6..8b9efa8a3539 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -904,10 +904,14 @@ static struct kvm_pgtable_mm_ops kvm_s2_mm_ops = {
>>   static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long 
>> type)
>>   {
>> +    struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>>       u32 kvm_ipa_limit = get_kvm_ipa_limit();
>>       u64 mmfr0, mmfr1;
>>       u32 phys_shift;
>> +    if (kvm_is_realm(kvm))
>> +        kvm_ipa_limit = kvm_rmm_ipa_limit();
>> +
>>       phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
>>       if (is_protected_kvm_enabled()) {
>>           phys_shift = kvm_ipa_limit;
> 
> get_kvm_ipa_limit() and variable 'kvm_ipa_limit' have been exposed through
> KVM_CAP_ARM_VM_IPA_SIZE for both normal and realm VMs in this series. 
> However,
> the IPA limit determined by the feature-register-0 in TF-RMM, which is 
> returned
> by kvm_rmm_ipa_limit(), can be different from 'kvm_ipa_limit'.
> 
> This brings confusion to VMM like qemu, where the request to create a 
> realm VM is
> rejected if the requested IPA size exceeds the limit, exposed by the 
> host through
> KVM_CAP_ARM_VM_IPA_SIZE. So the host needs to return correct IPA limit 
> through
> KVM_CAP_ARM_VM_IPA_SIZE for realm VM somewhere in this series?

You're right that the limit exposed by the KVM_CAP_ARM_VM_IPA_SIZE
doesn't tell the VMM about the limit imposed by the RMM. The only way
to expose this is via an ioctl() on the KVM VM fd. But the VM fd is
created with an argument (type), which on arm64 unfortunately specifies
the IPA Size. So, this is kind of a chicken and egg problem. Or the
VMM can create a dummy Realm VM (with default IPA size of 0) and then
run the cap.

On the other hand, given the Realm creation is measured, if the Realm
can't be created with the "IPA Size" requested by the user, then there
is no point in creating the Realm VM.

So, we decided that this failure condition was alright.

This was mentioned in one of the versions of the series, but got lost
in the revisions.

If there is interest in getting this exposed, we could do something
like the above. Or, the other option is limit the IPA size of the VM
that can be created to RMM IPA limit, when we explicitly choose the
KVM mode to be CCA (this is something that is coming in the next
version)

Cheers
Suzuki


> 
> Thanks,
> Gavin
> 
>> @@ -957,9 +961,18 @@ static void stage2_destroy_range(struct 
>> kvm_pgtable *pgt, phys_addr_t addr,
>>   static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
>>   {
>> +    struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>>       unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
>> -    stage2_destroy_range(pgt, 0, BIT(ia_bits));
>> +    /*
>> +     * Realm RTTs are inaccessible to the host and may contain stale 
>> data
>> +     * after the RMM has released them. The non-root RTTs are explicitly
>> +     * destroyed through RMI before the RD is destroyed; only the 
>> root PGD
>> +     * pages remain to be freed here.
>> +     */
>> +    if (!kvm_is_realm(kvm))
>> +        stage2_destroy_range(pgt, 0, BIT(ia_bits));
>> +
>>       KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
>>   }
>> @@ -1001,6 +1014,8 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct 
>> kvm_s2_mmu *mmu, unsigned long t
>>           return -EINVAL;
>>       }
>> +    mmu->arch = &kvm->arch;
>> +
>>       err = kvm_init_ipa_range(mmu, type);
>>       if (err)
>>           return err;
>> @@ -1009,7 +1024,6 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct 
>> kvm_s2_mmu *mmu, unsigned long t
>>       if (!pgt)
>>           return -ENOMEM;
>> -    mmu->arch = &kvm->arch;
>>       err = KVM_PGT_FN(kvm_pgtable_stage2_init)(pgt, mmu, 
>> &kvm_s2_mm_ops);
>>       if (err)
>>           goto out_free_pgtable;
>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>> index 247c4f033945..528b01d5d71d 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -5,6 +5,8 @@
>>   #include <linux/kvm_host.h>
>> +#include <asm/kvm_emulate.h>
>> +#include <asm/kvm_mmu.h>
>>   #include <asm/kvm_pgtable.h>
>>   #include <asm/rmi_cmds.h>
>>   #include <asm/virt.h>
>> @@ -14,6 +16,60 @@ static bool rmi_has_feature(int reg, unsigned long 
>> feature)
>>       return !!u64_get_bits(rmi_feat_reg(reg), feature);
>>   }
>> +u32 kvm_rmm_ipa_limit(void)
>> +{
>> +    return u64_get_bits(rmi_feat_reg(0), RMI_FEATURE_REGISTER_0_S2SZ);
>> +}
>> +
>> +void kvm_destroy_realm(struct kvm *kvm)
>> +{
>> +    struct realm *realm = &kvm->arch.realm;
>> +    size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
>> +
>> +    if (!kvm_realm_is_created(kvm)) {
>> +        kfree(realm->sro);
>> +        realm->sro = NULL;
>> +        return;
>> +    }
>> +
>> +    kvm_set_realm_state(kvm, REALM_STATE_DYING);
>> +
>> +    if (realm->rd) {
>> +        phys_addr_t rd_phys = virt_to_phys(realm->rd);
>> +
>> +        if (WARN_ON(rmi_realm_terminate(rd_phys, realm->sro)))
>> +            return;
>> +
>> +        if (WARN_ON(rmi_realm_destroy(rd_phys, realm->sro)))
>> +            return;
>> +        free_delegated_page(rd_phys);
>> +        realm->rd = NULL;
>> +    }
>> +
>> +    if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys,
>> +                     pgd_size)))
>> +        return;
>> +
>> +    kvm_set_realm_state(kvm, REALM_STATE_DEAD);
>> +
>> +    /* Now that the realm is destroyed, free the entry-level RTTs. */
>> +    kvm_free_stage2_pgd(&kvm->arch.mmu);
>> +
>> +    kfree(realm->sro);
>> +    realm->sro = NULL;
>> +}
>> +
>> +int kvm_init_realm(struct kvm *kvm)
>> +{
>> +    struct realm *realm = &kvm->arch.realm;
>> +
>> +    realm->sro = kmalloc_obj(*realm->sro);
>> +    if (!realm->sro)
>> +        return -ENOMEM;
>> +
>> +    return 0;
>> +}
>> +
>>   static int rmm_check_features(void)
>>   {
>>       if (kvm_lpa2_is_enabled() &&
> 


