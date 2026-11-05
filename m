Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B926606EEA8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=25+bViQE;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hkHHixG5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6i6/L6hP11TjNe6WSkwFv8BJGRSRafQN6TY9DsiH1KM=; b=25+bViQEc0LqM8
	aTcbtX0TAJ+8hrm9JEQoYboxi3mM7bSgbDwaZyoFHJWFUVWb0+aO8kkfHvCmOL/eQjXRRDgCQB1Ae
	Il/8+dU7vRvJbpvgEshNDa1MvpZiEK+mVPdN8HkbX5Ljva/JNXNTIuAfpgpPBjDpifyZ+DH5tsZev
	S1SPHFBdC0d+lbkP2Bs+UwoYMVA5wX5sQSknRnNW3Hy0S/Ug0qfSB/ATmt8sxlXXy0Awzplgqo/MV
	9SS4AO+TWFmIlFsTZ8cT/+4oBVevfAKa+tRfuEyhzcsdmwZ5ahyC2zh2crXwnYodFqsL+4ct6msET
	+Bo+y7pLy3jqLKPLHCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzhn-00000009Rwt-2ic9;
	Thu, 05 Nov 2026 15:48:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzhj-00000009Rvz-21rR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:48:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EEE2168F;
	Thu,  5 Nov 2026 07:48:39 -0800 (PST)
Received: from [10.0.128.250] (e122027.cambridge.arm.com [10.0.128.250])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 474E13F628;
	Thu,  5 Nov 2026 07:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793893722; bh=lB8UsCIAPGMVGaSELcGsGRzGgsq10JYJohcCglxrA0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hkHHixG5PB8dS3mjYoN0IxqQv+yNOs3Q1N6ez4t+U2Be4zD0SsGpCVhzPFeEXXUoR
	 mF4Ahp56TdQH8gn0jTIXe6HyjVP15uONtg0JWq+2lawj7P2Uub4HyOdaiiEiXJUiit
	 ioMcekzxpLZRzsrRtpk/KOLRFmHL1d2pPfb1NFRk=
Message-ID: <18bb1899-c106-447f-80a7-1117040dc378@arm.com>
Date: Thu, 5 Nov 2026 15:48:34 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] KVM: arm64: CCA: Add basic infrastructure for
 creating a realm
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20261102141304.126883-1-steven.price@arm.com>
 <20261102141304.126883-7-steven.price@arm.com>
 <4304d0c7-2220-4add-9c71-e6dc6b4fbc11@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <4304d0c7-2220-4add-9c71-e6dc6b4fbc11@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_074843_614927_12A1717E 
X-CRM114-Status: GOOD (  39.31  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 23:49, Suzuki K Poulose wrote:
> Hi Steven
> 
> On 02/11/2026 14:12, Steven Price wrote:
>> Introduce the skeleton functions for creating and destroying a realm.
>> The IPA size requested is checked against what the RMM supports.
>>
>> The actual work of constructing the realm will be added in future
>> patches.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   arch/arm64/include/asm/kvm_rmi.h | 20 ++++++++++++
>>   arch/arm64/kvm/arm.c             |  9 +++++
>>   arch/arm64/kvm/mmu.c             | 18 ++++++++--
>>   arch/arm64/kvm/rmi.c             | 56 ++++++++++++++++++++++++++++++++
>>   4 files changed, 101 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/
>> asm/kvm_rmi.h
>> index 3194daaacf2b..f1a1ed6b91f5 100644
>> --- a/arch/arm64/include/asm/kvm_rmi.h
>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>> @@ -6,6 +6,9 @@
>>   #ifndef __ASM_KVM_RMI_H
>>   #define __ASM_KVM_RMI_H
>>   +#include <linux/arm-smccc-rmi.h>
>> +#include <linux/kvm.h>
>> +
>>   /**
>>    * enum realm_state - State of a Realm
>>    *
>> @@ -50,12 +53,29 @@ enum realm_state {
>>   /**
>>    * struct realm - Additional per VM data for a Realm
>>    *
>> + * @rd: Kernel mapping of the RMM-managed Realm Descriptor (RD) granule
>> + * @sro: Preallocated SRO state context for Realm MMU operations
>>    * @state: The lifetime state machine for the realm
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
>>       enum realm_state state;
>> +    unsigned int ia_bits;
>>   };
>>     void kvm_init_rmi(void);
>> +u32 kvm_rmm_ipa_limit(void);
>> +
>> +int kvm_init_realm(struct kvm *kvm);
>> +void kvm_destroy_realm(struct kvm *kvm);
>>     #endif /* __ASM_KVM_RMI_H */
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index c8599fed5902..9a7bbfaf9675 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -303,6 +303,13 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned
>> long type)
>>         bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
>>   +    /* Initialise the realm bits after the generic bits are enabled */
>> +    if (kvm_vm_is_realm(kvm)) {
>> +        ret = kvm_init_realm(kvm);
>> +        if (ret)
>> +            goto err_uninit_mmu;
>> +    }
>> +
>>       return 0;
>>     err_uninit_mmu:
>> @@ -367,6 +374,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
>>         kvm_destroy_nested(kvm);
>>       kvm_arm_teardown_hypercalls(kvm);
>> +    if (kvm_vm_is_realm(kvm))
>> +        kvm_destroy_realm(kvm);
>>   }
>>     static bool kvm_has_full_ptr_auth(void)
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 1301c563d705..b049ea67d9af 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -981,10 +981,14 @@ static struct kvm_pgtable_mm_ops kvm_s2_mm_ops = {
>>     static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned
>> long type)
>>   {
>> +    struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>>       u32 kvm_ipa_limit = get_kvm_ipa_limit();
>>       u64 mmfr0, mmfr1;
>>       u32 phys_shift;
>>   +    if (kvm_vm_is_realm(kvm))
>> +        kvm_ipa_limit = kvm_rmm_ipa_limit();
>> +
>>       phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
>>       if (is_protected_kvm_enabled()) {
>>           phys_shift = kvm_ipa_limit;
>> @@ -1034,9 +1038,18 @@ static void stage2_destroy_range(struct
>> kvm_pgtable *pgt, phys_addr_t addr,
>>     static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
>>   {
>> +    struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>>       unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
>>   -    stage2_destroy_range(pgt, 0, BIT(ia_bits));
>> +    /*
>> +     * Realm RTTs are inaccessible to the host and may contain stale
>> data
>> +     * after the RMM has released them. The non-root RTTs are explicitly
>> +     * destroyed through RMI before the RD is destroyed; only the
>> root PGD
>> +     * pages remain to be freed here.
>> +     */
>> +    if (!kvm_vm_is_realm(kvm))
>> +        stage2_destroy_range(pgt, 0, BIT(ia_bits));
>> +
>>       KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
>>   }
> 
> This looks like a good candidate for another callback for vm_s2_ops ?
> Something like (incomplete functionally, but this should work).
> As a bonus, we can remove two instances of KVM_PGT_FN()

Nice, yes that's an improvement. Thanks for the suggestion.

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 5e9c2919c509..96685c52fb6e 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1048,35 +1048,52 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu
> *mmu, unsigned long type)
>   * cond_resched() periodically to prevent hogging the CPU for a long time
>   * and schedule something else, if required.
>   */
> -static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t
> addr,
> -                   phys_addr_t end)
> +static void stage2_destroy_range(struct kvm_pgtable *pgt,
> +                 void (*pgt_destroy_range_fn)(struct kvm_pgtable *pgt,
> +                              u64 addr, u64 size))
>  {
> +    u64 addr = 0;
> +    u64 end = BIT(VTCR_EL2_IPA(pgt->mmu->vtcr));
>      u64 next;
> 
>      do {
>          next = stage2_range_addr_end(addr, end);
> -        KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
> -                                 next - addr);
> +        pgt_destroy_range_fn(pgt, addr, next - addr);
>          if (next != end)
>              cond_resched();
>      } while (addr = next, addr != end);
>  }
> 
> +static void kvm_vm_stage2_destroy(struct kvm_pgtable *pgt)
> +{
> +    stage2_destroy_range(pgt, kvm_pgtable_stage2_destroy_range);
> +    kvm_pgtable_stage2_destroy_pgd(pgt);
> +}
> +
> +static void pkvm_stage2_destroy(struct kvm_pgtable *pgt)
> +{
> +    stage2_destroy_range(pgt, kvm_pgtable_stage2_destroy_range);
> +    pkvm_pgtable_stage2_destroy_pgd(pgt);
> +}
> +
> +/*
> +* Realm RTTs are inaccessible to the host and may contain stale data
> +* after the RMM has released them. The non-root RTTs are explicitly
> +* destroyed through RMI before the RD is destroyed; only the root PGD
> +* pages remain to be freed here.
> +*/
> +static void realm_stage2_destroy(struct kvm_pgtable *pgt,
> +                 u64 start, u64 end)
> +{
> +    kvm_pgtable_destroy_pgd(pgt);
> +}
> +
>  static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
>  {
>      struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>      unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
> 
> -    /*
> -     * Realm RTTs are inaccessible to the host and may contain stale data
> -     * after the RMM has released them. The non-root RTTs are explicitly
> -     * destroyed through RMI before the RD is destroyed; only the root PGD
> -     * pages remain to be freed here.
> -     */
> -    if (!kvm_vm_is_realm(kvm))
> -        stage2_destroy_range(pgt, 0, BIT(ia_bits));
> -
> -    KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
> +    kvm->arch.vm_s2_ops->stage2_destroy(pgt, 0, BIT(ia_bits));
>  }
> 
> 
> 
> 
> 
>> @@ -1084,6 +1097,8 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct
>> kvm_s2_mmu *mmu, unsigned long t
>>           return -EINVAL;
>>       }
>>   +    mmu->arch = &kvm->arch;
>> +
>>       err = kvm_init_ipa_range(mmu, type);
>>       if (err)
>>           return err;
>> @@ -1092,7 +1107,6 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct
>> kvm_s2_mmu *mmu, unsigned long t
>>       if (!pgt)
>>           return -ENOMEM;
>>   -    mmu->arch = &kvm->arch;
>>       err = KVM_PGT_FN(kvm_pgtable_stage2_init)(pgt, mmu,
>> &kvm_s2_mm_ops);
>>       if (err)
>>           goto out_free_pgtable;
>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>> index 5b07beff8bc9..45ecbaa467d1 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -6,6 +6,8 @@
>>   #include <linux/arm-rmi-cmds.h>
>>   #include <linux/kvm_host.h>
>>   +#include <asm/kvm_emulate.h>
>> +#include <asm/kvm_mmu.h>
>>   #include <asm/kvm_pgtable.h>
>>   #include <asm/virt.h>
>>   @@ -14,6 +16,60 @@ static bool rmi_has_feature(int reg, unsigned
>> long feature)
>>       return !!u64_get_bits(rmi_feat_reg(reg), feature);
>>   }
>>   +u32 kvm_rmm_ipa_limit(void)
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
> 
> Do we leak memory of the stage2 PGD if the Realm was never created ?
> Should we have something like on top ?

Sashiko beat you to it - yes I've already got a fix locally for that.

Thanks,
Steve

> @@ -1646,11 +1645,8 @@ void kvm_destroy_realm(struct kvm *kvm)
> 
>         guard(mutex)(&kvm->arch.config_lock);
> 
> -       if (!kvm_realm_is_created(kvm)) {
> -               kfree(realm->sro);
> -               realm->sro = NULL;
> -               return;
> -       }
> +       if (!kvm_realm_is_created(kvm))
> +               goto free_pgd;
> 
>         kvm_set_realm_state(kvm, REALM_STATE_DYING);
> 
> @@ -1684,6 +1680,7 @@ void kvm_destroy_realm(struct kvm *kvm)
> 
>         kvm_set_realm_state(kvm, REALM_STATE_DEAD);
> 
> +free_pgd:
>         /* Now that the realm is destroyed, free the entry-level RTTs. */
>         kvm_free_stage2_pgd(&kvm->arch.mmu);
> 
> 
> Suzuki
> 
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
>> +        rmi_free_delegated_page(rd_phys);
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


