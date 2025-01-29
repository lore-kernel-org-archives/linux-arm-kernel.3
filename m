Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82388C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 00:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZLW+3NIr/s7ih/WKO6/T4F6BysmWN0XR1cLwJr9BBA=; b=sGLySOpi5MiIkuLMkEpby7fYrE
	BjL6Pru7cjAVLazc2ZKbeoEq/cHyBigYipieaBzj7nGCdLXEfr86vnAZ9IdbeWJ0CYIP7hAp/J+5w
	fdz+RkxzJ74hE/Oofok9HlFEjapO2ynCoAyJlILUSn4hCgUnUwt145SwNbqtuP5XR4yCIHcDU2VNi
	wh93O3pWes9Pv7KYp4Oj9EzoNnhZAJTjfs2woU4SOMKArMavVGKkt94MsRwCfUQaXUp8lhfvrgZQa
	3leW3xLFHNtbIN6SNrVElG2tlxXRFtDQ2QyeYWpT2cnSy5sGFFBjQ38GM0/Ct+p43mQlHtmRQGeqs
	WjL3qMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcwCE-000000066fC-3Hfo;
	Wed, 29 Jan 2025 00:44:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcwAr-000000066V5-3lnY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 00:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738111400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZLW+3NIr/s7ih/WKO6/T4F6BysmWN0XR1cLwJr9BBA=;
	b=Q6drFeIXn43fPsUb7InHVHziL33DeYhXBl0C6bSL4cyxptnluu1FsxlTBH4EZQbg1lm2+a
	puSLIaWCzXZ0u2ENySf2UwIC685LdrTq/Y4r3HsQUcGlVgqRKiQP7voqQ4s63GBqhqRB1n
	Ix3P2mGHoO9DeSNrrfq+bPapcRsVtoI=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-UJ6VlNHkNqesx0j5KOlLSw-1; Tue, 28 Jan 2025 19:43:19 -0500
X-MC-Unique: UJ6VlNHkNqesx0j5KOlLSw-1
X-Mimecast-MFC-AGG-ID: UJ6VlNHkNqesx0j5KOlLSw
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so17461787a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 16:43:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738111396; x=1738716196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZLW+3NIr/s7ih/WKO6/T4F6BysmWN0XR1cLwJr9BBA=;
        b=c4lrSFEQnM33GN5hAq9KZV8v/UEU+3i0MCjT1EJd89reTbf/jOA3tKwe3oavGk4f59
         Elcb4N4WTwKDQoNNodgYPRKORcJ6fwhfOLlWe8/INoV8e2oLza7iJ4sB43cUyds/uvBd
         vIq8SvaFH2m6g3hLA+aIuh9Z2RGXp2mtg2Dh7PzROeQxplzBK5AqyZl2dstifzBvgOP1
         zar9ghlFIQvfVGXLgdXZb77V/Qtrb0JgRn0K9rOlJTkr5pwedFDW2mAyPNVdH6oE7JYz
         s2mtC6JNI22u83s45Ab3jGZ35JiV3uVBeBceQ/ImOCC20tB+JU03BckVuBfkrYfG20OU
         wYaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZRasfnYb6MbN1zBHAJAPlW+XgLc2W+/ms4pcdPlh6KciY6Q81IMb1RzXawjYnWu0UAEQuuQgpqUCKRIgNSwnZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwFqZRDh5+4Q84dbx1zkgaWDzAc8qipp+Te7kJpmaaW51KZa5zf
	6hVp9HqlGTCgOaGra/9YwwJ5vJeHzezKxmXYjrZ65elsYWRUBkZ6a4br7sjcgEYITxqzkfVLFTP
	UhMAx0LokArLjK8pKGutoGFpMMEbSNb0sogtV7+hUj7Gy6JCWOXrtZtpthtvFVNA9N0FYeq1RQz
	thiZTq
X-Gm-Gg: ASbGncsTslxjWPpthWIlWvryY98Dula9fJthbO76HEeLkDb+Z877AXTnc51lVdd0Py1
	VgI7SDo5ezwTfJOzLoyKVoZ7QO5ncUlgDP0zGq/gMvTYAGSJu1wR+fciKPyi0Z3tDK+FflLqDjZ
	aysmSMrEV73jW+HXN/6FY2r3O88p8UXYgP9Dy1f/zA5ngjt5ZmYHZ6QG6I2o8ZMMsod1qUIfZ/O
	1ujy0IIqNsRyNuxXX4ljUyJUy9fsedVmO/NZXmTAcZVhpiOGaE4yaWzHUlZreZseQC5AQNNEK7j
	MYl+hQ==
X-Received: by 2002:a17:90b:2743:b0:2ee:48bf:7dc9 with SMTP id 98e67ed59e1d1-2f83ac0068cmr1779974a91.15.1738111395985;
        Tue, 28 Jan 2025 16:43:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJjpgjrIHY7a3JC5Ez/0L8BHt6NxNYaYvhYnSyLULVqB3+oTe+OzhpQ9OQ+eLwfEAg4S+Arw==
X-Received: by 2002:a17:90b:2743:b0:2ee:48bf:7dc9 with SMTP id 98e67ed59e1d1-2f83ac0068cmr1779946a91.15.1738111395620;
        Tue, 28 Jan 2025 16:43:15 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfbf166sm218188a91.43.2025.01.28.16.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 16:43:15 -0800 (PST)
Message-ID: <691a2f0a-0f04-4bf6-a11a-ea7ee753cf88@redhat.com>
Date: Wed, 29 Jan 2025 10:43:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/43] arm64: RME: ioctls to create and configure
 realms
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
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
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-9-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-9-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M_CMpw8GeyJqX6cz9BNmuLBHA4nNVMq6xtSVdMxjYRY_1738111398
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_164322_099838_CC9768CA 
X-CRM114-Status: GOOD (  46.22  )
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

On 12/13/24 1:55 AM, Steven Price wrote:
> Add the KVM_CAP_ARM_RME_CREATE_RD ioctl to create a realm. This involves
> delegating pages to the RMM to hold the Realm Descriptor (RD) and for
> the base level of the Realm Translation Tables (RTT). A VMID also need
> to be picked, since the RMM has a separate VMID address space a
> dedicated allocator is added for this purpose.
> 
> KVM_CAP_ARM_RME_CONFIG_REALM is provided to allow configuring the realm
> before it is created. Configuration options can be classified as:
> 
>   1. Parameters specific to the Realm stage2 (e.g. IPA Size, vmid, stage2
>      entry level, entry level RTTs, number of RTTs in start level, LPA2)
>      Most of these are not measured by RMM and comes from KVM book
>      keeping.
> 
>   2. Parameters controlling "Arm Architecture features for the VM". (e.g.
>      SVE VL, PMU counters, number of HW BRPs/WPs), configured by the VMM
>      using the "user ID register write" mechanism. These will be
>      supported in the later patches.
> 
>   3. Parameters are not part of the core Arm architecture but defined
>      by the RMM spec (e.g. Hash algorithm for measurement,
>      Personalisation value). These are programmed via
>      KVM_CAP_ARM_RME_CONFIG_REALM.
> 
> For the IPA size there is the possibility that the RMM supports a
> different size to the IPA size supported by KVM for normal guests. At
> the moment the 'normal limit' is exposed by KVM_CAP_ARM_VM_IPA_SIZE and
> the IPA size is configured by the bottom bits of vm_type in
> KVM_CREATE_VM. This means that it isn't easy for the VMM to discover
> what IPA sizes are supported for Realm guests. Since the IPA is part of
> the measurement of the realm guest the current expectation is that the
> VMM will be required to pick the IPA size demanded by attestation and
> therefore simply failing if this isn't available is fine. An option
> would be to expose a new capability ioctl to obtain the RMM's maximum
> IPA size if this is needed in the future.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Introduce free_delegated_granule() to replace many
>     undelegate/free_page() instances and centralise the comment on
>     leaking when the undelegate fails.
>   * Several other minor improvements suggested by reviews - thanks for
>     the feedback!
> Changes since v2:
>   * Improved commit description.
>   * Improved return failures for rmi_check_version().
>   * Clear contents of PGD after it has been undelegated in case the RMM
>     left stale data.
>   * Minor changes to reflect changes in previous patches.
> ---
>   arch/arm64/include/asm/kvm_emulate.h |   5 +
>   arch/arm64/include/asm/kvm_rme.h     |  19 ++
>   arch/arm64/kvm/arm.c                 |  18 ++
>   arch/arm64/kvm/mmu.c                 |  22 +-
>   arch/arm64/kvm/rme.c                 | 296 +++++++++++++++++++++++++++
>   5 files changed, 358 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 4d417e39763e..27f54a7778aa 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -715,6 +715,11 @@ static inline enum realm_state kvm_realm_state(struct kvm *kvm)
>   	return READ_ONCE(kvm->arch.realm.state);
>   }
>   
> +static inline bool kvm_realm_is_created(struct kvm *kvm)
> +{
> +	return kvm_is_realm(kvm) && kvm_realm_state(kvm) != REALM_STATE_NONE;
> +}
> +
>   static inline bool vcpu_is_rec(struct kvm_vcpu *vcpu)
>   {
>   	return false;
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 69af5c3a1e44..209cd99f03dd 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -6,6 +6,8 @@
>   #ifndef __ASM_KVM_RME_H
>   #define __ASM_KVM_RME_H
>   
> +#include <uapi/linux/kvm.h>
> +
>   /**
>    * enum realm_state - State of a Realm
>    */
> @@ -46,11 +48,28 @@ enum realm_state {
>    * struct realm - Additional per VM data for a Realm
>    *
>    * @state: The lifetime state machine for the realm
> + * @rd: Kernel mapping of the Realm Descriptor (RD)
> + * @params: Parameters for the RMI_REALM_CREATE command
> + * @num_aux: The number of auxiliary pages required by the RMM
> + * @vmid: VMID to be used by the RMM for the realm
> + * @ia_bits: Number of valid Input Address bits in the IPA
>    */
>   struct realm {
>   	enum realm_state state;
> +
> +	void *rd;
> +	struct realm_params *params;
> +
> +	unsigned long num_aux;
> +	unsigned int vmid;
> +	unsigned int ia_bits;
>   };
>   
>   void kvm_init_rme(void);
> +u32 kvm_realm_ipa_limit(void);
> +
> +int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
> +int kvm_init_realm_vm(struct kvm *kvm);
> +void kvm_destroy_realm(struct kvm *kvm);
>   
>   #endif
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 93087eca9c51..2bbf30d66424 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -153,6 +153,13 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>   		}
>   		mutex_unlock(&kvm->slots_lock);
>   		break;
> +	case KVM_CAP_ARM_RME:
> +		if (!kvm_is_realm(kvm))
> +			return -EINVAL;
> +		mutex_lock(&kvm->lock);
> +		r = kvm_realm_enable_cap(kvm, cap);
> +		mutex_unlock(&kvm->lock);
> +		break;
>   	default:
>   		break;
>   	}

The check of !kvm_is_realm() seems unnecessary because the same check will be
done in kvm_realm_enable_cap().

> @@ -215,6 +222,13 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>   
>   	bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
>   
> +	/* Initialise the realm bits after the generic bits are enabled */
> +	if (kvm_is_realm(kvm)) {
> +		ret = kvm_init_realm_vm(kvm);
> +		if (ret)
> +			goto err_free_cpumask;
> +	}
> +
>   	return 0;
>   
>   err_free_cpumask:
> @@ -274,6 +288,7 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
>   	kvm_unshare_hyp(kvm, kvm + 1);
>   
>   	kvm_arm_teardown_hypercalls(kvm);
> +	kvm_destroy_realm(kvm);
>   }
>   
>   static bool kvm_has_full_ptr_auth(void)
> @@ -421,6 +436,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES:
>   		r = BIT(0);
>   		break;
> +	case KVM_CAP_ARM_RME:
> +		r = static_key_enabled(&kvm_rme_is_available);
> +		break;
>   	default:
>   		r = 0;
>   	}
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index c9d46ad57e52..f09d580c12ad 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -863,12 +863,16 @@ static struct kvm_pgtable_mm_ops kvm_s2_mm_ops = {
>   	.icache_inval_pou	= invalidate_icache_guest_page,
>   };
>   
> -static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
> +static int kvm_init_ipa_range(struct kvm *kvm,
> +			      struct kvm_s2_mmu *mmu, unsigned long type)
>   {
>   	u32 kvm_ipa_limit = get_kvm_ipa_limit();
>   	u64 mmfr0, mmfr1;
>   	u32 phys_shift;
>   
> +	if (kvm_is_realm(kvm))
> +		kvm_ipa_limit = kvm_realm_ipa_limit();
> +
>   	if (type & ~KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
>   		return -EINVAL;
>   
> @@ -933,7 +937,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>   		return -EINVAL;
>   	}
>   
> -	err = kvm_init_ipa_range(mmu, type);
> +	err = kvm_init_ipa_range(kvm, mmu, type);
>   	if (err)
>   		return err;
>   
> @@ -1056,6 +1060,20 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>   	struct kvm_pgtable *pgt = NULL;
>   
>   	write_lock(&kvm->mmu_lock);
> +	if (kvm_is_realm(kvm) &&
> +	    (kvm_realm_state(kvm) != REALM_STATE_DEAD &&
> +	     kvm_realm_state(kvm) != REALM_STATE_NONE)) {
> +		/* Tearing down RTTs will be added in a later patch */
> +		write_unlock(&kvm->mmu_lock);
> +
> +		/*
> +		 * The physical PGD pages are delegated to the RMM, so cannot
> +		 * be freed at this point. This function will be called again
> +		 * from kvm_destroy_realm() after the physical pages have been
> +		 * returned at which point the memory can be freed.
> +		 */
> +		return;
> +	}
>   	pgt = mmu->pgt;
>   	if (pgt) {
>   		mmu->pgd_phys = 0;
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index b88269b80c11..5530ec2653b7 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -5,9 +5,20 @@
>   
>   #include <linux/kvm_host.h>
>   
> +#include <asm/kvm_emulate.h>
> +#include <asm/kvm_mmu.h>
>   #include <asm/rmi_cmds.h>
>   #include <asm/virt.h>
>   
> +#include <asm/kvm_pgtable.h>
> +
> +static unsigned long rmm_feat_reg0;
> +
> +static bool rme_supports(unsigned long feature)
> +{
> +	return !!u64_get_bits(rmm_feat_reg0, feature);
> +}
> +

I don't have strong sense, but the name would be rme_has_feature() since the
source is the RMM feature register-0.

>   static int rmi_check_version(void)
>   {
>   	struct arm_smccc_res res;
> @@ -36,6 +47,285 @@ static int rmi_check_version(void)
>   	return 0;
>   }
>   
> +u32 kvm_realm_ipa_limit(void)
> +{
> +	return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_S2SZ);
> +}
> +
> +static int get_start_level(struct realm *realm)
> +{
> +	return 4 - stage2_pgtable_levels(realm->ia_bits);
> +}
> +
> +static void free_delegated_granule(phys_addr_t phys)
> +{
> +	if (WARN_ON(rmi_granule_undelegate(phys))) {
> +		/* Undelegate failed: leak the page */
> +		return;
> +	}
> +
> +	free_page((unsigned long)phys_to_virt(phys));
> +}
> +
> +static int realm_create_rd(struct kvm *kvm)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	struct realm_params *params = realm->params;
> +	void *rd = NULL;
> +	phys_addr_t rd_phys, params_phys;
> +	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
> +	int i, r;
> +
> +	if (WARN_ON(realm->rd) || WARN_ON(!realm->params))
> +		return -EEXIST;
> +
> +	rd = (void *)__get_free_page(GFP_KERNEL);
> +	if (!rd)
> +		return -ENOMEM;
> +
> +	rd_phys = virt_to_phys(rd);
> +	if (rmi_granule_delegate(rd_phys)) {
> +		r = -ENXIO;
> +		goto free_rd;
> +	}
> +
> +	for (i = 0; i < pgd_size; i += PAGE_SIZE) {
> +		phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i;
> +
> +		if (rmi_granule_delegate(pgd_phys)) {
> +			r = -ENXIO;
> +			goto out_undelegate_tables;
> +		}
> +	}
> +

The step of 'i' is PAGE_SIZE, inconsistent with what has been done in the tag
'out_undelegate_tables' where the step is expected to be 1.

> +	realm->ia_bits = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +
> +	params->s2sz = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +	params->rtt_level_start = get_start_level(realm);
> +	params->rtt_num_start = pgd_size / PAGE_SIZE;
> +	params->rtt_base = kvm->arch.mmu.pgd_phys;
> +	params->vmid = realm->vmid;
> +
> +	params_phys = virt_to_phys(params);
> +
> +	if (rmi_realm_create(rd_phys, params_phys)) {
> +		r = -ENXIO;
> +		goto out_undelegate_tables;
> +	}
> +
> +	if (WARN_ON(rmi_rec_aux_count(rd_phys, &realm->num_aux))) {
> +		WARN_ON(rmi_realm_destroy(rd_phys));
> +		goto out_undelegate_tables;
> +	}
> +
> +	realm->rd = rd;
> +
> +	return 0;
> +
> +out_undelegate_tables:
> +	while (--i >= 0) {
> +		phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i * PAGE_SIZE;
> +
> +		if (WARN_ON(rmi_granule_undelegate(pgd_phys))) {
> +			/* Leak the pages if they cannot be returned */
> +			kvm->arch.mmu.pgt = NULL;
> +			break;
> +		}
> +	}
> +	if (WARN_ON(rmi_granule_undelegate(rd_phys))) {
> +		/* Leak the page if it isn't returned */
> +		return r;
> +	}
> +free_rd:
> +	free_page((unsigned long)rd);
> +	return r;
> +}
> +
> +/* Protects access to rme_vmid_bitmap */
> +static DEFINE_SPINLOCK(rme_vmid_lock);
> +static unsigned long *rme_vmid_bitmap;
> +
> +static int rme_vmid_init(void)
> +{
> +	unsigned int vmid_count = 1 << kvm_get_vmid_bits();
> +
> +	rme_vmid_bitmap = bitmap_zalloc(vmid_count, GFP_KERNEL);
> +	if (!rme_vmid_bitmap) {
> +		kvm_err("%s: Couldn't allocate rme vmid bitmap\n", __func__);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rme_vmid_reserve(void)
> +{
> +	int ret;
> +	unsigned int vmid_count = 1 << kvm_get_vmid_bits();
> +
> +	spin_lock(&rme_vmid_lock);
> +	ret = bitmap_find_free_region(rme_vmid_bitmap, vmid_count, 0);
> +	spin_unlock(&rme_vmid_lock);
> +
> +	return ret;
> +}
> +
> +static void rme_vmid_release(unsigned int vmid)
> +{
> +	spin_lock(&rme_vmid_lock);
> +	bitmap_release_region(rme_vmid_bitmap, vmid, 0);
> +	spin_unlock(&rme_vmid_lock);
> +}
> +
> +static int kvm_create_realm(struct kvm *kvm)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	int ret;
> +
> +	if (!kvm_is_realm(kvm))
> +		return -EINVAL;

The duplicated check has been done in kvm_realm_enable_cap(). So it can be
dropped safely.

> +	if (kvm_realm_is_created(kvm))
> +		return -EEXIST;
> +
> +	ret = rme_vmid_reserve();
> +	if (ret < 0)
> +		return ret;
> +	realm->vmid = ret;
> +
> +	ret = realm_create_rd(kvm);
> +	if (ret) {
> +		rme_vmid_release(realm->vmid);
> +		return ret;
> +	}
> +
> +	WRITE_ONCE(realm->state, REALM_STATE_NEW);
> +
> +	/* The realm is up, free the parameters.  */
> +	free_page((unsigned long)realm->params);
> +	realm->params = NULL;
> +
> +	return 0;
> +}
> +
> +static int config_realm_hash_algo(struct realm *realm,
> +				  struct kvm_cap_arm_rme_config_item *cfg)
> +{
> +	switch (cfg->hash_algo) {
> +	case KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA256:
> +		if (!rme_supports(RMI_FEATURE_REGISTER_0_HASH_SHA_256))
> +			return -EINVAL;
> +		break;
> +	case KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA512:
> +		if (!rme_supports(RMI_FEATURE_REGISTER_0_HASH_SHA_512))
> +			return -EINVAL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	realm->params->hash_algo = cfg->hash_algo;
> +	return 0;
> +}
> +
> +static int kvm_rme_config_realm(struct kvm *kvm, struct kvm_enable_cap *cap)
> +{
> +	struct kvm_cap_arm_rme_config_item cfg;
> +	struct realm *realm = &kvm->arch.realm;
> +	int r = 0;
> +
> +	if (kvm_realm_is_created(kvm))
> +		return -EBUSY;
> +
> +	if (copy_from_user(&cfg, (void __user *)cap->args[1], sizeof(cfg)))
> +		return -EFAULT;
> +
> +	switch (cfg.cfg) {
> +	case KVM_CAP_ARM_RME_CFG_RPV:
> +		memcpy(&realm->params->rpv, &cfg.rpv, sizeof(cfg.rpv));
> +		break;
> +	case KVM_CAP_ARM_RME_CFG_HASH_ALGO:
> +		r = config_realm_hash_algo(realm, &cfg);
> +		break;
> +	default:
> +		r = -EINVAL;
> +	}
> +
> +	return r;
> +}
> +
> +int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
> +{
> +	int r = 0;
> +
> +	if (!kvm_is_realm(kvm))
> +		return -EINVAL;
> +
> +	switch (cap->args[0]) {
> +	case KVM_CAP_ARM_RME_CONFIG_REALM:
> +		r = kvm_rme_config_realm(kvm, cap);
> +		break;
> +	case KVM_CAP_ARM_RME_CREATE_RD:
> +		r = kvm_create_realm(kvm);
> +		break;
> +	default:
> +		r = -EINVAL;
> +		break;
> +	}
> +
> +	return r;
> +}
> +
> +void kvm_destroy_realm(struct kvm *kvm)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
> +	int i;
> +
> +	if (realm->params) {
> +		free_page((unsigned long)realm->params);
> +		realm->params = NULL;
> +	}
> +
> +	if (!kvm_realm_is_created(kvm))
> +		return;
> +
> +	WRITE_ONCE(realm->state, REALM_STATE_DYING);
> +
> +	if (realm->rd) {
> +		phys_addr_t rd_phys = virt_to_phys(realm->rd);
> +
> +		if (WARN_ON(rmi_realm_destroy(rd_phys)))
> +			return;
> +		free_delegated_granule(rd_phys);
> +		realm->rd = NULL;
> +	}
> +
> +	rme_vmid_release(realm->vmid);
> +
> +	for (i = 0; i < pgd_size; i += PAGE_SIZE) {
> +		phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i;
> +
> +		if (WARN_ON(rmi_granule_undelegate(pgd_phys)))
> +			return;
> +	}
> +
> +	WRITE_ONCE(realm->state, REALM_STATE_DEAD);
> +
> +	/* Now that the Realm is destroyed, free the entry level RTTs */
> +	kvm_free_stage2_pgd(&kvm->arch.mmu);
> +}
> +
> +int kvm_init_realm_vm(struct kvm *kvm)
> +{
> +	struct realm_params *params;
> +
> +	params = (struct realm_params *)get_zeroed_page(GFP_KERNEL);
> +	if (!params)
> +		return -ENOMEM;
> +
> +	kvm->arch.realm.params = params;
> +	return 0;
> +}
> +
>   void kvm_init_rme(void)
>   {
>   	if (PAGE_SIZE != SZ_4K)
> @@ -46,5 +336,11 @@ void kvm_init_rme(void)
>   		/* Continue without realm support */
>   		return;
>   
> +	if (WARN_ON(rmi_features(0, &rmm_feat_reg0)))
> +		return;
> +
> +	if (rme_vmid_init())
> +		return;
> +
>   	/* Future patch will enable static branch kvm_rme_is_available */
>   }

Thanks,
Gavin


