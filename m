Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9883C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 04:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3P7NpmOmk2ABCw8iJwdV/KiXhnMi3Qc07wbIF+3iCtE=; b=Rb0oBD72QAcPcv04Z9PlSHWWxY
	2s3/WzdoxUb+uVxuycba9qCc4H9DjtQ82jr3xb3LnRpsFCbH1aOBQdph5VqPOS3T3tFDq84g7NOz1
	0csvHWjQ1Y3y0osnnlbfO3QzovH50/aODkz6cD4FBgEmBbHjTwxu791Gv4XLs5NAx6eouvCal7JrD
	GeSxBjvb8VhmE/1e35jKNIGUkLwxahzTkD4Z3T8s6/Y97jmm2+WZZskf6zUtlDeiGVDANhe7iHXey
	kO5Ioyi4awjQtVzsBtGPzB2Rt4Ssmg0r+gVrqctURJn92Zf/9PQxZOSNF/kAR7H03VrF2TeqIePwX
	qpApKJQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1yw7-0000000GKLx-0Exc;
	Thu, 03 Sep 2026 04:20:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1yw3-0000000GKLc-2TGB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 04:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788409219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3P7NpmOmk2ABCw8iJwdV/KiXhnMi3Qc07wbIF+3iCtE=;
	b=bOxjTYaDHZWqBpu7TtwLXU2a9r0YSapRkixzb1IvYvRYnE72RmR8B73rAWLUcNkR6zeOI9
	2GQPtK/RCVwQB5Pxb6+cw9s180v52NdlhkOE7lmjLoQt2DVYnPTL+fxPb4loVVrlKwBHxk
	uyAq0lrj3qeru4iCgetE6CL9sprKQLw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-DHScJKMiPfe-IJBBjNm5dg-1; Thu, 03 Sep 2026 00:20:18 -0400
X-MC-Unique: DHScJKMiPfe-IJBBjNm5dg-1
X-Mimecast-MFC-AGG-ID: DHScJKMiPfe-IJBBjNm5dg_1788409217
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968dfff779so922975a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 21:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788409217; x=1789014017;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3P7NpmOmk2ABCw8iJwdV/KiXhnMi3Qc07wbIF+3iCtE=;
        b=PHj/mhbuhrOv8Z6vWMFMsuR8IJPqeVCX3+xxMJubWatVVHR3n61o8Ymc27IS1CV0+M
         XZFb20XPQE7bd9n+3d0YMPzsBg1x8BpZL2TY2D5BCjYBUMbP2wSVYSw8QHdEiyNlRYpj
         vPHgVC5iWXe6iDrGqsOmkHoubmCzAeB2q4Zl4rrI2VLD7mksoc/1Z6p2DurnOpGtsbyX
         5Kx7bKQ6S0HZnwimQ2289PUKgnLszcTYqDVQPS3IEdMSGoMQr3vqKkX4YkkC6ovG48ZA
         FjhB9ikozhvDHX0KF/afkvC0KEfSWPltTVGeLOwuqdSUl5zBZfUyx4Polf0o9KYkXdEB
         aT6A==
X-Forwarded-Encrypted: i=1; AKwUvByHrLc5gIesxqBJhE8BMmWtz5U1w1ALuD5mk9wfZdX9/ftcDhav9UEMaCpcp5v42TNpHRTTb3CoPZG/opy+Qzyd@lists.infradead.org
X-Gm-Message-State: AFuF++nKKOQHT35UtomWWsN/9K6DitQ3tZyEmoNZ2gkn4HiaRCMvXmBl
	29xn51gMi/saiHKM/trVCdmjKwr8Y5xF8p9hwH9meTJ8KgRY4eIot+/681fAFt0XEUNOlJaLJdD
	o+/zluRiZk6vPCSnCXa4o5fJ9i+7M7gOthRRf1nDc2sPdpFyjKj7bGgtA9v+t4LyT1K5dsADgU5
	us
X-Gm-Gg: AYBFou3YyQsR4CmgWI2D234lFEla0sQRhV4fXn8lnWz2WVYYJlfrLyEHr8Tpp5D4swU
	6ebB7kXQDfOQT69qQEbRWQvB8HkuCdhmmaDxj//XekJJsddbZexcOh9b/GvVo/Bzi4CCHKWpQbA
	NsoFpyMD0nCSdWl97PCTGZI2Vmj0S0o5PdDUKQmzi+Qjven82w/kud4SeKvwLTgL7/gks9gbT29
	x0Q68wc4Fq4feh4bqqRBx78nq9zvfeyCQgbKR+CvXOO6L5FlYQ0yy7E2kw9yN1JjORqHoxMfUIM
	t2/APsNEfTERxFdBVbn0twbTCXcBEndj3L/DnesGX5DKNbtJKQeK6Q+WFPEdkaqbxRqK5N182xG
	wxcU06Xygv29e6eFmWO6MvyY91oSFMiCscs/H0N4MlQ==
X-Received: by 2002:a17:90b:5242:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39b08046aaamr3997769a91.14.1788409216783;
        Wed, 02 Sep 2026 21:20:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5242:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39b08046aaamr3997701a91.14.1788409216155;
        Wed, 02 Sep 2026 21:20:16 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33253672941sm2617105eec.3.2026.09.02.21.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 21:20:15 -0700 (PDT)
Message-ID: <551014ec-eafc-4a63-92f1-6efcf1ca4db1@redhat.com>
Date: Thu, 3 Sep 2026 14:20:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 14/45] KVM: arm64: CCA: Add basic infrastructure for
 creating a realm
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
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
 <56aa7422-ded5-449c-ba62-e7e56d229587@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <56aa7422-ded5-449c-ba62-e7e56d229587@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3p4GJE-yTrT-l1VbBGMB9o014SVHJ7s66ZpiLVW--Rg_1788409217
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_212023_777487_23F94BB6 
X-CRM114-Status: GOOD (  40.06  )
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

On 9/3/26 1:11 AM, Suzuki K Poulose wrote:
> On 01/09/2026 05:07, Gavin Shan wrote:
>> Hi Steve,
>>
>> On 8/3/26 11:43 PM, Steven Price wrote:
>>> Introduce the skeleton functions for creating and destroying a realm.
>>> The IPA size requested is checked against what the RMM supports.
>>>
>>> The actual work of constructing the realm will be added in future
>>> patches.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v15:
>>>   * Remove realm->params and only temporarily allocate the page when the
>>>     realm is being created.
>>
>> [...]
>>
>>> ---
>>>   arch/arm64/include/asm/kvm_emulate.h | 24 +++++++++++
>>>   arch/arm64/include/asm/kvm_rmi.h     | 63 ++++++++++++++++++++++++++++
>>>   arch/arm64/kvm/arm.c                 | 12 ++++++
>>>   arch/arm64/kvm/mmu.c                 | 18 +++++++-
>>>   arch/arm64/kvm/rmi.c                 | 56 +++++++++++++++++++++++++
>>>   5 files changed, 171 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/ include/asm/kvm_emulate.h
>>> index 5bf3d7e1d92c..e26d6755279f 100644
>>> --- a/arch/arm64/include/asm/kvm_emulate.h
>>> +++ b/arch/arm64/include/asm/kvm_emulate.h
>>> @@ -688,4 +688,28 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
>>>               vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
>>>       }
>>>   }
>>> +
>>> +static inline bool kvm_is_realm(struct kvm *kvm)
>>> +{
>>> +    if (static_branch_unlikely(&kvm_rmi_is_available))
>>> +        return kvm->arch.is_realm;
>>> +    return false;
>>> +}
>>> +
>>> +static inline enum realm_state kvm_realm_state(struct kvm *kvm)
>>> +{
>>> +    return READ_ONCE(kvm->arch.realm.state);
>>> +}
>>> +
>>> +static inline void kvm_set_realm_state(struct kvm *kvm,
>>> +                       enum realm_state new_state)
>>> +{
>>> +    WRITE_ONCE(kvm->arch.realm.state, new_state);
>>> +}
>>> +
>>> +static inline bool kvm_realm_is_created(struct kvm *kvm)
>>> +{
>>> +    return kvm_is_realm(kvm) && kvm_realm_state(kvm) != REALM_STATE_NONE;
>>> +}
>>> +
>>>   #endif /* __ARM64_KVM_EMULATE_H__ */
>>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/ asm/kvm_rmi.h
>>> index 57d24b244c95..cefd00b76806 100644
>>> --- a/arch/arm64/include/asm/kvm_rmi.h
>>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>>> @@ -6,12 +6,75 @@
>>>   #ifndef __ASM_KVM_RMI_H
>>>   #define __ASM_KVM_RMI_H
>>> +#include <linux/arm-smccc-rmi.h>
>>> +
>>> +/**
>>> + * enum realm_state - State of a Realm
>>> + *
>>> + * Mirrors the RMM's Realm lifecycle states where they are meaningful to KVM,
>>> + * with REALM_STATE_DYING being a KVM-internal state used to prevent further
>>> + * requests while teardown is in progress. KVM does not track REALM_SYSTEM_OFF
>>> + * or REALM_ZOMBIE separately as they naturally lead to teardown.
>>> + */
>>> +enum realm_state {
>>> +    /**
>>> +     * @REALM_STATE_NONE:
>>> +     *      Realm has not yet been created. rmi_realm_create() has not
>>> +     *      yet been called.
>>> +     */
>>> +    REALM_STATE_NONE,
>>> +    /**
>>> +     * @REALM_STATE_NEW:
>>> +     *      Realm is under construction, rmi_realm_create() has been
>>> +     *      called, but it is not yet activated. Pages may be populated.
>>> +     */
>>> +    REALM_STATE_NEW,
>>> +    /**
>>> +     * @REALM_STATE_ACTIVE:
>>> +     *      Realm has been created and is eligible for execution with
>>> +     *      rmi_rec_enter(). Pages may no longer be populated with
>>> +     *      rmi_data_create().
>>> +     */
>>> +    REALM_STATE_ACTIVE,
>>> +    /**
>>> +     * @REALM_STATE_DYING:
>>> +     *      Realm is in the process of being destroyed or has already been
>>> +     *      destroyed.
>>> +     */
>>> +    REALM_STATE_DYING,
>>> +    /**
>>> +     * @REALM_STATE_DEAD:
>>> +     *      Realm has been destroyed.
>>> +     */
>>> +    REALM_STATE_DEAD
>>> +};
>>> +
>>>   /**
>>>    * struct realm - Additional per VM data for a Realm
>>> + *
>>> + * @rd: Kernel mapping of the RMM-managed Realm Descriptor (RD) granule
>>> + * @sro: Preallocated SRO state context for Realm MMU operations
>>> + * @state: The lifetime state machine for the realm
>>> + * @ia_bits: Number of valid Input Address bits in the IPA
>>>    */
>>>   struct realm {
>>> +    void *rd;
>>> +    /*
>>> +     * Reused by RTT map/unmap SRO commands. Those commands are only
>>> +     * issued from Realm stage-2 map/unmap paths while kvm->mmu_lock is
>>> +     * held for write, including Realm fault handling where
>>> +     * kvm_fault_lock() takes the write side, so concurrent use is
>>> +     * serialized.
>>> +     */
>>> +    struct rmi_sro_state *sro;
>>> +    enum realm_state state;
>>> +    unsigned int ia_bits;
>>>   };
>>>   void kvm_init_rmi(void);
>>> +u32 kvm_rmm_ipa_limit(void);
>>> +
>>> +int kvm_init_realm(struct kvm *kvm);
>>> +void kvm_destroy_realm(struct kvm *kvm);
>>>   #endif /* __ASM_KVM_RMI_H */
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>> index b961c22fce3d..c4d906861736 100644
>>> --- a/arch/arm64/kvm/arm.c
>>> +++ b/arch/arm64/kvm/arm.c
>>> @@ -266,6 +266,13 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>>>       bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
>>> +    /* Initialise the realm bits after the generic bits are enabled */
>>> +    if (kvm_is_realm(kvm)) {
>>> +        ret = kvm_init_realm(kvm);
>>> +        if (ret)
>>> +            goto err_uninit_mmu;
>>> +    }
>>> +
>>>       return 0;
>>>   err_uninit_mmu:
>>> @@ -328,6 +335,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
>>>       kvm_unshare_hyp(kvm, kvm + 1);
>>>       kvm_arm_teardown_hypercalls(kvm);
>>> +    if (kvm_is_realm(kvm))
>>> +        kvm_destroy_realm(kvm);
>>>   }
>>>   static bool kvm_has_full_ptr_auth(void)
>>> @@ -488,6 +497,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>>           else
>>>               r = kvm_supports_cacheable_pfnmap();
>>>           break;
>>> +    case KVM_CAP_ARM_RMI:
>>> +        r = static_key_enabled(&kvm_rmi_is_available);
>>> +        break;
>>>       default:
>>>           r = 0;
>>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>>> index 6c941aaa10c6..8b9efa8a3539 100644
>>> --- a/arch/arm64/kvm/mmu.c
>>> +++ b/arch/arm64/kvm/mmu.c
>>> @@ -904,10 +904,14 @@ static struct kvm_pgtable_mm_ops kvm_s2_mm_ops = {
>>>   static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
>>>   {
>>> +    struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>>>       u32 kvm_ipa_limit = get_kvm_ipa_limit();
>>>       u64 mmfr0, mmfr1;
>>>       u32 phys_shift;
>>> +    if (kvm_is_realm(kvm))
>>> +        kvm_ipa_limit = kvm_rmm_ipa_limit();
>>> +
>>>       phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
>>>       if (is_protected_kvm_enabled()) {
>>>           phys_shift = kvm_ipa_limit;
>>
>> get_kvm_ipa_limit() and variable 'kvm_ipa_limit' have been exposed through
>> KVM_CAP_ARM_VM_IPA_SIZE for both normal and realm VMs in this series. However,
>> the IPA limit determined by the feature-register-0 in TF-RMM, which is returned
>> by kvm_rmm_ipa_limit(), can be different from 'kvm_ipa_limit'.
>>
>> This brings confusion to VMM like qemu, where the request to create a realm VM is
>> rejected if the requested IPA size exceeds the limit, exposed by the host through
>> KVM_CAP_ARM_VM_IPA_SIZE. So the host needs to return correct IPA limit through
>> KVM_CAP_ARM_VM_IPA_SIZE for realm VM somewhere in this series?
> 
> You're right that the limit exposed by the KVM_CAP_ARM_VM_IPA_SIZE
> doesn't tell the VMM about the limit imposed by the RMM. The only way
> to expose this is via an ioctl() on the KVM VM fd. But the VM fd is
> created with an argument (type), which on arm64 unfortunately specifies
> the IPA Size. So, this is kind of a chicken and egg problem. Or the
> VMM can create a dummy Realm VM (with default IPA size of 0) and then
> run the cap.
> 
> On the other hand, given the Realm creation is measured, if the Realm
> can't be created with the "IPA Size" requested by the user, then there
> is no point in creating the Realm VM.
> 
> So, we decided that this failure condition was alright.
> 
> This was mentioned in one of the versions of the series, but got lost
> in the revisions.
> 
> If there is interest in getting this exposed, we could do something
> like the above. Or, the other option is limit the IPA size of the VM
> that can be created to RMM IPA limit, when we explicitly choose the
> KVM mode to be CCA (this is something that is coming in the next
> version)
> 

I was even wandering if KVM_CAP_ARM_RMI can be extended to return the limit.
For example, KVM_CAP_ARM_RMI is renamed to KVM_CAP_ARM_REALM_IPA_SIZE. 0 is
returned if Realm VM isn't supported. Otherwise, the IPA size enforced by
TF-RMM through the feature-register-0 is returned.

With above extension, the existing KVM_CAP_ARM_VM_IPA_SIZE is dedicated to
query the IPA size for the regular (or normal) VM, while KVM_CAP_ARM_REALM_IPA_SIZE
is used to get the IPA size for the Realm VM. VMM needs to decide which one
is to be used.

Another option could be splitting @arg in kvm_vm_ioctl_check_extension() into
two parts: (a) Indicator of the scope; (b) Specific capability. For (a), it
could be categorized into: (1) 0, global and not specific to any types of VMs;
(2) 1, indicating the capability is associated with a regular (normal) VM; (3)
2, indicating the capability is associated with a Realm VM. With this extension,
VMM uses ioctl(kvm_fd, KVM_CHECK_EXTENSION, (2UL << 48) | KVM_CAP_ARM_VM_IPA_SIZE)
to retrieve the IPA size of Realm VM that is enforced by TF-RMM. Besides, I'm not
sure if pKVM can be benefited from this splitting in long term.

Thanks,
Gavin
>>> @@ -957,9 +961,18 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
>>>   static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
>>>   {
>>> +    struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>>>       unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
>>> -    stage2_destroy_range(pgt, 0, BIT(ia_bits));
>>> +    /*
>>> +     * Realm RTTs are inaccessible to the host and may contain stale data
>>> +     * after the RMM has released them. The non-root RTTs are explicitly
>>> +     * destroyed through RMI before the RD is destroyed; only the root PGD
>>> +     * pages remain to be freed here.
>>> +     */
>>> +    if (!kvm_is_realm(kvm))
>>> +        stage2_destroy_range(pgt, 0, BIT(ia_bits));
>>> +
>>>       KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
>>>   }
>>> @@ -1001,6 +1014,8 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>>>           return -EINVAL;
>>>       }
>>> +    mmu->arch = &kvm->arch;
>>> +
>>>       err = kvm_init_ipa_range(mmu, type);
>>>       if (err)
>>>           return err;
>>> @@ -1009,7 +1024,6 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>>>       if (!pgt)
>>>           return -ENOMEM;
>>> -    mmu->arch = &kvm->arch;
>>>       err = KVM_PGT_FN(kvm_pgtable_stage2_init)(pgt, mmu, &kvm_s2_mm_ops);
>>>       if (err)
>>>           goto out_free_pgtable;
>>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>>> index 247c4f033945..528b01d5d71d 100644
>>> --- a/arch/arm64/kvm/rmi.c
>>> +++ b/arch/arm64/kvm/rmi.c
>>> @@ -5,6 +5,8 @@
>>>   #include <linux/kvm_host.h>
>>> +#include <asm/kvm_emulate.h>
>>> +#include <asm/kvm_mmu.h>
>>>   #include <asm/kvm_pgtable.h>
>>>   #include <asm/rmi_cmds.h>
>>>   #include <asm/virt.h>
>>> @@ -14,6 +16,60 @@ static bool rmi_has_feature(int reg, unsigned long feature)
>>>       return !!u64_get_bits(rmi_feat_reg(reg), feature);
>>>   }
>>> +u32 kvm_rmm_ipa_limit(void)
>>> +{
>>> +    return u64_get_bits(rmi_feat_reg(0), RMI_FEATURE_REGISTER_0_S2SZ);
>>> +}
>>> +
>>> +void kvm_destroy_realm(struct kvm *kvm)
>>> +{
>>> +    struct realm *realm = &kvm->arch.realm;
>>> +    size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
>>> +
>>> +    if (!kvm_realm_is_created(kvm)) {
>>> +        kfree(realm->sro);
>>> +        realm->sro = NULL;
>>> +        return;
>>> +    }
>>> +
>>> +    kvm_set_realm_state(kvm, REALM_STATE_DYING);
>>> +
>>> +    if (realm->rd) {
>>> +        phys_addr_t rd_phys = virt_to_phys(realm->rd);
>>> +
>>> +        if (WARN_ON(rmi_realm_terminate(rd_phys, realm->sro)))
>>> +            return;
>>> +
>>> +        if (WARN_ON(rmi_realm_destroy(rd_phys, realm->sro)))
>>> +            return;
>>> +        free_delegated_page(rd_phys);
>>> +        realm->rd = NULL;
>>> +    }
>>> +
>>> +    if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys,
>>> +                     pgd_size)))
>>> +        return;
>>> +
>>> +    kvm_set_realm_state(kvm, REALM_STATE_DEAD);
>>> +
>>> +    /* Now that the realm is destroyed, free the entry-level RTTs. */
>>> +    kvm_free_stage2_pgd(&kvm->arch.mmu);
>>> +
>>> +    kfree(realm->sro);
>>> +    realm->sro = NULL;
>>> +}
>>> +
>>> +int kvm_init_realm(struct kvm *kvm)
>>> +{
>>> +    struct realm *realm = &kvm->arch.realm;
>>> +
>>> +    realm->sro = kmalloc_obj(*realm->sro);
>>> +    if (!realm->sro)
>>> +        return -ENOMEM;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static int rmm_check_features(void)
>>>   {
>>>       if (kvm_lpa2_is_enabled() &&
>>
> 


