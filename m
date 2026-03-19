Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799E1109024C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbuI0ph+aeMOl5Jw2Km5K9bh0oG2SyMqsl0XxU7u8Sk=; b=ifDcS6cBeUqvRUZgdnQd7LuBOQ
	173wb8Eyhq5mW363oV/nZzlKh2YVRFn2qqA8n3g+q5XKaiC7sSeziv0LmLS6/D3GHrusGMPICVNV3
	1CUZSxDhncK9JTmlO7lbci66B5BwPr1FqWAmQJHoNe9rBAXQhKsjv/1dhPVOdGdIqcbe38qeX595X
	WNHn10c6OwIkYcPUI6wclQNyAIlKt+W0naIBN8DivhOjW6/DWpug+N7k9EAY1wl4DgY6Kz8eGJp88
	Oi2/O9O3l77KzVX4oke3WqhgnHMYmqDvhOkW/FO05Y68B2YgoEFVGkRZwuHe3ynbbqtbVl2bcbsMl
	k8KGzk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GBA-0000000B4Ir-0l6O;
	Thu, 19 Mar 2026 16:25:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GB7-0000000B4IR-1pBf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:24:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9A051A25;
	Thu, 19 Mar 2026 09:24:49 -0700 (PDT)
Received: from [10.1.35.24] (e122027.cambridge.arm.com [10.1.35.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DCE03F7BD;
	Thu, 19 Mar 2026 09:24:51 -0700 (PDT)
Message-ID: <f3097415-0042-45dc-960c-d55505af6fb4@arm.com>
Date: Thu, 19 Mar 2026 16:24:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 12/48] arm64: RMI: Basic infrastructure for creating a
 realm.
To: Wei-Lin Chang <weilin.chang@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-13-steven.price@arm.com>
 <lt5yozoeeqld5laooopzjwngqlso2hdpjcwkkyagbcg4vedkd6@potsbanqeb4h>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <lt5yozoeeqld5laooopzjwngqlso2hdpjcwkkyagbcg4vedkd6@potsbanqeb4h>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_092457_571714_1142A646 
X-CRM114-Status: GOOD (  38.75  )
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

On 19/03/2026 16:11, Wei-Lin Chang wrote:
> On Wed, Mar 18, 2026 at 03:53:36PM +0000, Steven Price wrote:
>> Introduce the skeleton functions for creating and destroying a realm.
>> The IPA size requested is checked against what the RMM supports.
>>
>> The actual work of constructing the realm will be added in future
>> patches.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v12:
>>  * Drop the RMM_PAGE_{SHIFT,SIZE} defines - the RMM is now configured to
>>    be the same as the host's page size.
>>  * Rework delegate/undelegate functions to use the new RMI range based
>>    operations.
>> Changes since v11:
>>  * Major rework to drop the realm configuration and make the
>>    construction of realms implicit rather than driven by the VMM
>>    directly.
>>  * The code to create RDs, handle VMIDs etc is moved to later patches.
>> Changes since v10:
>>  * Rename from RME to RMI.
>>  * Move the stage2 cleanup to a later patch.
>> Changes since v9:
>>  * Avoid walking the stage 2 page tables when destroying the realm -
>>    the real ones are not accessible to the non-secure world, and the RMM
>>    may leave junk in the physical pages when returning them.
>>  * Fix an error path in realm_create_rd() to actually return an error value.
>> Changes since v8:
>>  * Fix free_delegated_granule() to not call kvm_account_pgtable_pages();
>>    a separate wrapper will be introduced in a later patch to deal with
>>    RTTs.
>>  * Minor code cleanups following review.
>> Changes since v7:
>>  * Minor code cleanup following Gavin's review.
>> Changes since v6:
>>  * Separate RMM RTT calculations from host PAGE_SIZE. This allows the
>>    host page size to be larger than 4k while still communicating with an
>>    RMM which uses 4k granules.
>> Changes since v5:
>>  * Introduce free_delegated_granule() to replace many
>>    undelegate/free_page() instances and centralise the comment on
>>    leaking when the undelegate fails.
>>  * Several other minor improvements suggested by reviews - thanks for
>>    the feedback!
>> Changes since v2:
>>  * Improved commit description.
>>  * Improved return failures for rmi_check_version().
>>  * Clear contents of PGD after it has been undelegated in case the RMM
>>    left stale data.
>>  * Minor changes to reflect changes in previous patches.
>> ---
>>  arch/arm64/include/asm/kvm_emulate.h |  5 ++
>>  arch/arm64/include/asm/kvm_rmi.h     | 16 +++++
>>  arch/arm64/kvm/arm.c                 | 12 ++++
>>  arch/arm64/kvm/mmu.c                 | 11 +++-
>>  arch/arm64/kvm/rmi.c                 | 88 ++++++++++++++++++++++++++++
>>  5 files changed, 129 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
>> index f38b50151ce8..39310d9b4e16 100644
>> --- a/arch/arm64/include/asm/kvm_emulate.h
>> +++ b/arch/arm64/include/asm/kvm_emulate.h
>> @@ -701,6 +701,11 @@ static inline enum realm_state kvm_realm_state(struct kvm *kvm)
>>  	return READ_ONCE(kvm->arch.realm.state);
>>  }
>>  
>> +static inline bool kvm_realm_is_created(struct kvm *kvm)
>> +{
>> +	return kvm_is_realm(kvm) && kvm_realm_state(kvm) != REALM_STATE_NONE;
>> +}
>> +
>>  static inline bool vcpu_is_rec(struct kvm_vcpu *vcpu)
>>  {
>>  	return false;
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
>> index 3506f50b05cd..0ada525af18f 100644
>> --- a/arch/arm64/include/asm/kvm_rmi.h
>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>> @@ -6,6 +6,8 @@
>>  #ifndef __ASM_KVM_RMI_H
>>  #define __ASM_KVM_RMI_H
>>  
>> +#include <asm/rmi_smc.h>
>> +
>>  /**
>>   * enum realm_state - State of a Realm
>>   */
>> @@ -46,11 +48,25 @@ enum realm_state {
>>   * struct realm - Additional per VM data for a Realm
>>   *
>>   * @state: The lifetime state machine for the realm
>> + * @rd: Kernel mapping of the Realm Descriptor (RD)
>> + * @params: Parameters for the RMI_REALM_CREATE command
>> + * @num_aux: The number of auxiliary pages required by the RMM
>> + * @ia_bits: Number of valid Input Address bits in the IPA
>>   */
>>  struct realm {
>>  	enum realm_state state;
>> +
>> +	void *rd;
>> +	struct realm_params *params;
>> +
>> +	unsigned long num_aux;
>> +	unsigned int ia_bits;
>>  };
>>  
>>  void kvm_init_rmi(void);
>> +u32 kvm_realm_ipa_limit(void);
>> +
>> +int kvm_init_realm_vm(struct kvm *kvm);
>> +void kvm_destroy_realm(struct kvm *kvm);
>>  
>>  #endif /* __ASM_KVM_RMI_H */
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 274d7866efdc..9b17bdfaf0c2 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -253,6 +253,13 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>>  
>>  	bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
>>  
>> +	/* Initialise the realm bits after the generic bits are enabled */
>> +	if (kvm_is_realm(kvm)) {
>> +		ret = kvm_init_realm_vm(kvm);
>> +		if (ret)
>> +			goto err_free_cpumask;
>> +	}
>> +
>>  	return 0;
>>  
>>  err_free_cpumask:
>> @@ -312,6 +319,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
>>  	kvm_unshare_hyp(kvm, kvm + 1);
>>  
>>  	kvm_arm_teardown_hypercalls(kvm);
>> +	if (kvm_is_realm(kvm))
>> +		kvm_destroy_realm(kvm);
>>  }
>>  
>>  static bool kvm_has_full_ptr_auth(void)
>> @@ -473,6 +482,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>  		else
>>  			r = kvm_supports_cacheable_pfnmap();
>>  		break;
>> +	case KVM_CAP_ARM_RMI:
>> +		r = static_key_enabled(&kvm_rmi_is_available);
>> +		break;
>>  
>>  	default:
>>  		r = 0;
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 070a01e53fcb..d6094b60c4ce 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -872,12 +872,16 @@ static struct kvm_pgtable_mm_ops kvm_s2_mm_ops = {
>>  	.icache_inval_pou	= invalidate_icache_guest_page,
>>  };
>>  
>> -static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
>> +static int kvm_init_ipa_range(struct kvm *kvm,
>> +			      struct kvm_s2_mmu *mmu, unsigned long type)
>>  {
>>  	u32 kvm_ipa_limit = get_kvm_ipa_limit();
>>  	u64 mmfr0, mmfr1;
>>  	u32 phys_shift;
>>  
>> +	if (kvm_is_realm(kvm))
>> +		kvm_ipa_limit = kvm_realm_ipa_limit();
>> +
> 
> Hi,
> 
> I believe we can do:
> 
> struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
> 
> to avoid introducing the extra argument.
> But in order for that to work we'll have to initialize mmu->arch
> earlier:
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 8c5d259810b2..e98da7bde9a0 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -974,6 +974,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>  		return -EINVAL;
>  	}
>  
> +	mmu->arch = &kvm->arch;
>  	err = kvm_init_ipa_range(mmu, type);
>  	if (err)
>  		return err;
> @@ -982,7 +983,6 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>  	if (!pgt)
>  		return -ENOMEM;
>  
> -	mmu->arch = &kvm->arch;
>  	err = KVM_PGT_FN(kvm_pgtable_stage2_init)(pgt, mmu, &kvm_s2_mm_ops);
>  	if (err)
>  		goto out_free_pgtable;

Nice - I hadn't noticed that I could just pull the mmu->arch assignment
up and avoid that extra argument.

Thanks,
Steve

> 
> Thanks,
> Wei-Lin Chang
> 
>>  	if (type & ~KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
>>  		return -EINVAL;
>>  
>> @@ -974,7 +978,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>>  		return -EINVAL;
>>  	}
>>  
>> -	err = kvm_init_ipa_range(mmu, type);
>> +	err = kvm_init_ipa_range(kvm, mmu, type);
>>  	if (err)
>>  		return err;
>>  
>> @@ -1113,7 +1117,8 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>>  	write_unlock(&kvm->mmu_lock);
>>  
>>  	if (pgt) {
>> -		kvm_stage2_destroy(pgt);
>> +		if (!kvm_is_realm(kvm))
>> +			kvm_stage2_destroy(pgt);
>>  		kfree(pgt);
>>  	}
>>  }
>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>> index 80aedc85e94a..700b8c935d29 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -6,6 +6,8 @@
>>  #include <linux/kvm_host.h>
>>  #include <linux/memblock.h>
>>  
>> +#include <asm/kvm_emulate.h>
>> +#include <asm/kvm_mmu.h>
>>  #include <asm/kvm_pgtable.h>
>>  #include <asm/rmi_cmds.h>
>>  #include <asm/virt.h>
>> @@ -182,6 +184,92 @@ static int rmi_init_metadata(void)
>>  	return 0;
>>  }
>>  
>> +u32 kvm_realm_ipa_limit(void)
>> +{
>> +	return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_S2SZ);
>> +}
>> +
>> +static int undelegate_range(phys_addr_t phys, unsigned long size)
>> +{
>> +	unsigned long ret;
>> +	unsigned long top = phys + size;
>> +	unsigned long out_top;
>> +
>> +	while (phys < top) {
>> +		ret = rmi_granule_range_undelegate(phys, top, &out_top);
>> +		if (ret == RMI_SUCCESS)
>> +			phys = out_top;
>> +		else if (ret != RMI_BUSY && ret != RMI_BLOCKED)
>> +			return ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int undelegate_page(phys_addr_t phys)
>> +{
>> +	return undelegate_range(phys, PAGE_SIZE);
>> +}
>> +
>> +static int free_delegated_page(phys_addr_t phys)
>> +{
>> +	if (WARN_ON(undelegate_page(phys))) {
>> +		/* Undelegate failed: leak the page */
>> +		return -EBUSY;
>> +	}
>> +
>> +	free_page((unsigned long)phys_to_virt(phys));
>> +
>> +	return 0;
>> +}
>> +
>> +void kvm_destroy_realm(struct kvm *kvm)
>> +{
>> +	struct realm *realm = &kvm->arch.realm;
>> +	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
>> +
>> +	write_lock(&kvm->mmu_lock);
>> +	kvm_stage2_unmap_range(&kvm->arch.mmu, 0,
>> +			       BIT(realm->ia_bits - 1), true);
>> +	write_unlock(&kvm->mmu_lock);
>> +
>> +	if (realm->params) {
>> +		free_page((unsigned long)realm->params);
>> +		realm->params = NULL;
>> +	}
>> +
>> +	if (!kvm_realm_is_created(kvm))
>> +		return;
>> +
>> +	WRITE_ONCE(realm->state, REALM_STATE_DYING);
>> +
>> +	if (realm->rd) {
>> +		phys_addr_t rd_phys = virt_to_phys(realm->rd);
>> +
>> +		if (WARN_ON(rmi_realm_destroy(rd_phys)))
>> +			return;
>> +		free_delegated_page(rd_phys);
>> +		realm->rd = NULL;
>> +	}
>> +
>> +	if (WARN_ON(undelegate_range(kvm->arch.mmu.pgd_phys, pgd_size)))
>> +		return;
>> +
>> +	WRITE_ONCE(realm->state, REALM_STATE_DEAD);
>> +
>> +	/* Now that the Realm is destroyed, free the entry level RTTs */
>> +	kvm_free_stage2_pgd(&kvm->arch.mmu);
>> +}
>> +
>> +int kvm_init_realm_vm(struct kvm *kvm)
>> +{
>> +	kvm->arch.realm.params = (void *)get_zeroed_page(GFP_KERNEL);
>> +
>> +	if (!kvm->arch.realm.params)
>> +		return -ENOMEM;
>> +	return 0;
>> +}
>> +
>>  static int rmm_check_features(void)
>>  {
>>  	if (kvm_lpa2_is_enabled() && !rmi_has_feature(RMI_FEATURE_REGISTER_0_LPA2)) {
>> -- 
>> 2.43.0
>>


