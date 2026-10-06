Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4022CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 04:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xmwhtVAOTYHUjmcRz00UOuxKG7KIIGgmFuc28vNIW8=; b=Ct90fVOpi1dIeG2Wx4FgNtdoTv
	mh86l2DpPKhS4XndzOrf/9lu16sVt9tzcHJOFJroulIsjX5yd0NaOHoCB11xE6wQvvcReXMo5HQrO
	dQfcGTj+AeRTFW9/B8qemJs/EC8Flbb+LPsLdLxlLmhFmX4BKRA5oHDQq9JrORkZcEbfhejNS2NUv
	ZfibTuc2MKeDoZudtHXKKQpuosn4ba9DpjRMfJQ+d1/chEVogG80R3gk1NkMirkPv+IFqQUT4THss
	Mds643J4xsVlKsxo4CY7onfzPgTFGT+/+M8rngRReUNn1FDRCBI++dls0hK7aOxFX94dppUXtFr1P
	GLWLB6Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxFt-000000002qh-40Lb;
	Tue, 06 Oct 2026 04:58:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxFr-000000002qI-1Ssi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 04:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791262697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xmwhtVAOTYHUjmcRz00UOuxKG7KIIGgmFuc28vNIW8=;
	b=VQq8jpJfEOzWvQUNrshD2pmtd92ou2oNAxhZFY/n+OfNZ6XJFNBhcxKcWfsVmsssaHXb96
	jyJbavZNu4+eRygGJ97VFOldoN7HK0xP/tuk1MFtRQd1D0OEJMAs868w/qZpS4iC7aktMD
	HAoi39kB3Bol8juMj+vN/4WVvHTH+4Q=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-2rMTu-v6Mnyan_ytzPGUzA-1; Tue, 06 Oct 2026 00:58:16 -0400
X-MC-Unique: 2rMTu-v6Mnyan_ytzPGUzA-1
X-Mimecast-MFC-AGG-ID: 2rMTu-v6Mnyan_ytzPGUzA_1791262695
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so2465727a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 21:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262695; x=1791867495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xmwhtVAOTYHUjmcRz00UOuxKG7KIIGgmFuc28vNIW8=;
        b=xgl6lneaWX0OjKbKM23e6wu43UiLeEv/+NPOfpD/NRagvVfvscDfWqYGWSSZ/GBzDo
         PA7XtxIZrSWsf3erDU/yhzg/m8DQu5lFc6QnbPfDwi4+gv5hreG0hFap6l8VlTXppRY+
         U1RnTYDlTo9uRrim+KLyIZX10qctPQxEnMh9aoalLKPHpyWeGbcgey8ioFhyeCin9+sx
         pfaoyz93MHCKkspMGCAHLtyA4pLzP0+zHBxR2mEsBfGWU34Ypu/V8H4vnNh3LouodVpP
         tH9R5cwCK8yW95QDVtBYYw4ehfGXOEOm5aqp8arIbA2+HFsDKBIzJ+cCMpwlGkidC7rP
         TFpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOASsDTDwadY/kVyLDhV4fnqUKoB8tyjCSXW8q6aPbOmLdhsEHYi8JHCmJMbr+P1j/w8oaeNILMGQ9nMQMDNQC@lists.infradead.org
X-Gm-Message-State: AFq9FYILw4Mmhh9f6TBEWw2lhxL0ikGQFuQWSdBIEZf1NCYPSnlZCJPR
	Sr/0C/VkArpDWH10B4z5NewzlIToBlr+Fm2GqjNfaaRMFiMn0qiFS3Tf1iin2O8Ai0xO4w0SqRf
	BPbtr2Q64y7mpRGn41FMofNz5j6hdehad1M1wS7IELXeLhnY3S6EjTqD3R12NEOZz4o/62O9l5c
	dY
X-Gm-Gg: AYBFou3gw0o01cu2FroRa4BgV4g5Gb/B7t4nOuQyHmToccLRIof1bDlYUWX91OakmQZ
	WOB+FXZmrKcQhuwdq/2VzCLAaLvjIuS6Q8n7RjbttYeHe7/bKJVEFtKK85LYvP/6K/ZlcE4Bf+4
	8BxmMlJ2HqdFY5YcT1cEy/06jMCXIKaCLrvXv1gCWxRzE6ROzEfTnAMhhZLbJttNhmaAi+28vNy
	RB34DmMMNOmGgV25hnKZjqF1d8genSoOpLSS75jq8Jvuu5V/7YmVL4BW0pZ2fs1unLTnXOpNZ8O
	SroLmeDA/eTmR1+K6zGGm14zd3xN/8i3iXgC+XTqVlUqEsGrOfafBjSMUMvJaAik5tyfzw4J0vZ
	E9G/N9ulLzmqK43zB1PyAuqb/SPNxAdHBLbVG11m9Xg==
X-Received: by 2002:a17:90b:288c:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3a87350ab48mr128905a91.13.1791262694829;
        Mon, 05 Oct 2026 21:58:14 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3a87350ab48mr128872a91.13.1791262694226;
        Mon, 05 Oct 2026 21:58:14 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853d0261csm2783924a91.17.2026.10.05.21.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 21:58:13 -0700 (PDT)
Message-ID: <b8c965a4-7b89-4938-ba40-35d06b7c8419@redhat.com>
Date: Tue, 6 Oct 2026 14:58:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 19/23] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-20-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-20-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CPC7loqrzb6lcyVaQHjCnR4yZMuaezs4wIBqb8Arpm0_1791262695
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_215819_498472_118F5074 
X-CRM114-Status: GOOD (  27.96  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Limit the capabilities that are allowed for Realm VMs. Similarly block
> the vm_ioctls backed by the capabilities.
> 
> Repurpose the kvm_pkvm_ioctl_allowed() to support both pKVM and Realm
> ioctls. Rename the helper to kvm_vm_ioctl_allowed() and move it
> into arch/arm64/kvm/arm.c. Also add a generic kvm_vm_ext_allowed()
> to handle pKVM and Realm capability filtering and route them accordingly.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Drop WARN_ON_ONCE() from kvm_vm_ioctl_allowed to synchronise with
>     what is in -rc5 and make the conflict resolution easier.
> ---
>   arch/arm64/include/asm/kvm_pkvm.h | 19 ------------
>   arch/arm64/include/asm/kvm_rmi.h  | 24 +++++++++++++++
>   arch/arm64/kvm/arm.c              | 49 +++++++++++++++++++++++++++++--
>   3 files changed, 70 insertions(+), 22 deletions(-)
> 

One nitpick below. In either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 2addc37c500e1..b833abb1be9c7 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -53,25 +53,6 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
>   	}
>   }
>   
> -/*
> - * Check whether the KVM VM IOCTL is allowed in pKVM.
> - *
> - * Certain features are allowed only for non-protected VMs in pKVM, which is why
> - * this takes the VM (kvm) as a parameter.
> - */
> -static inline bool kvm_pkvm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> -{
> -	long ext;
> -	int r;
> -
> -	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> -
> -	if (WARN_ON_ONCE(r < 0))
> -		return false;
> -
> -	return kvm_pkvm_ext_allowed(kvm, ext);
> -}
> -
>   extern struct memblock_region kvm_nvhe_sym(hyp_memory)[];
>   extern unsigned int kvm_nvhe_sym(hyp_memblock_nr);
>   
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index 44f5c75a27b5b..ea1450e0c8619 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -6,6 +6,8 @@
>   #ifndef __ASM_KVM_RMI_H
>   #define __ASM_KVM_RMI_H
>   
> +#include <linux/kvm.h>
> +
>   /**
>    * enum realm_state - State of a Realm
>    *
> @@ -58,4 +60,26 @@ struct realm {
>   
>   void kvm_init_rmi(void);
>   
> +static inline bool kvm_realm_ext_allowed(long ext)
> +{
> +	switch (ext) {
> +	case KVM_CAP_IRQCHIP:
> +	case KVM_CAP_ARM_PSCI:
> +	case KVM_CAP_ARM_PSCI_0_2:
> +	case KVM_CAP_DEVICE_CTRL:
> +	case KVM_CAP_NR_VCPUS:
> +	case KVM_CAP_MAX_VCPUS:
> +	case KVM_CAP_MAX_VCPU_ID:
> +	case KVM_CAP_MSI_DEVID:
> +	case KVM_CAP_ARM_VM_IPA_SIZE:
> +	case KVM_CAP_ARM_SVE:
> +	case KVM_CAP_ONE_REG:
> +	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
> +	case KVM_CAP_ARM_PTRAUTH_GENERIC:
> +	case KVM_CAP_SYNC_MMU:
> +		return true;
> +	}
> +	return false;
> +}
> +
>   #endif /* __ASM_KVM_RMI_H */
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 37ef2ba4e43e2..fe707a0c47308 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -136,6 +136,49 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>   	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
>   }
>   
> +static inline bool kvm_vm_ext_allowed(struct kvm *kvm, long ext)
> +{
> +	/*
> +	 * We could be called with kvm as NULL, so can't use kvm_vm_* for pKVM
> +	 * flavors
> +	 */
> +	if (is_protected_kvm_enabled())
> +		return kvm_pkvm_ext_allowed(kvm, ext);
> +	else if (kvm && kvm_vm_is_realm(kvm))
> +		return kvm_realm_ext_allowed(ext);
> +	else
> +		return true;
> +}
> +
> +/*
> + * Check whether the KVM VM IOCTL is allowed. For pKVM and Realm VMs, certain
> + * ioctls are not allowed. Further, certain features are allowed only for
> + * non-protected VMs in pKVM.
> + */
> +static inline bool kvm_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> +{
> +	long ext;
> +	int r;

	long ext, r;

	kvm_get_cap_for_kvm_ioctl() returns 'long' instead of 'int' value.

> +
> +	/*
> +	 * We are guaranteed to be called with a valid kvm instance, as the
> +	 * only caller is kvm_arch_vm_ioctl(). Catch any deviations, as we
> +	 * rely on the kvm instance below.
> +	 */
> +	if (WARN_ON_ONCE(!kvm))
> +		return false;
> +
> +	/* Cover both pKVM host and Realm VMs */
> +	if (!kvm_vm_hyp_is_distrusting(kvm))
> +		return true;
> +
> +	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> +	if (r < 0)
> +		return false;
> +
> +	return kvm_vm_ext_allowed(kvm, ext);
> +}
> +
>   int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>   			    struct kvm_enable_cap *cap)
>   {
> @@ -144,7 +187,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>   	if (cap->flags)
>   		return -EINVAL;
>   
> -	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, cap->cap))
> +	if (!kvm_vm_ext_allowed(kvm, cap->cap))
>   		return -EINVAL;
>   
>   	switch (cap->cap) {
> @@ -403,7 +446,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   {
>   	int r;
>   
> -	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, ext))
> +	if (!kvm_vm_ext_allowed(kvm, ext))
>   		return 0;
>   
>   	switch (ext) {
> @@ -2146,7 +2189,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>   	void __user *argp = (void __user *)arg;
>   	struct kvm_device_attr attr;
>   
> -	if (is_protected_kvm_enabled() && !kvm_pkvm_ioctl_allowed(kvm, ioctl))
> +	if (!kvm_vm_ioctl_allowed(kvm, ioctl))
>   		return -EINVAL;
>   
>   	switch (ioctl) {

Thanks,
Gavin


