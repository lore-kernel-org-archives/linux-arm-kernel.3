Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A36C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 04:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOpndmvGS2CTNAq9sooQow9PnGsS4iRFoQMUou58z7M=; b=pVkYvsqyI1enDD4HRe4KlMmADJ
	f6zthJpf8WNcB06uEpY51RkdA2qrmiCG5ztvtTUxYUYZxSlS8nqUXoBnvEos6fDNekrKyFSWjkI6o
	+u0K3CPZF/A976Bygbx3n5HDU+FSrJk9k/IEkX18Nf3JY7nSwOHY2Knbe0b3FYR2CtxLmFGwqa1cA
	BxzzOJgKniAEqiDJhmQFUH0wPIaBppAC33P3A+GTcQYjha6T/3FsOxNZnVaj5dLSaTjW1YdSgaRCe
	kY3emMyJOpI/JYewfwtGB8z4elXtdIggB3wzP0bx3F+fHALkXfY2+CH9795xX+BlGL7MFAJa2qQPG
	mmb/3eAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxsa-0000000HCU5-1DTV;
	Mon, 03 Mar 2025 04:58:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toxoa-0000000HBoi-2LOE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740977643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOpndmvGS2CTNAq9sooQow9PnGsS4iRFoQMUou58z7M=;
	b=ezpmnO/P2QTI1+HorYM/YHoqCoovjjuwL3YRpSBLFB3RibSrXr6SXYhwhmecqDl9Phw8jU
	gZOpUytkyFxg5BY9NHUahqLL5EVIqrJgptjdqR3IoTbKCYwjft8pwnIEqdddpMsvVKGtNB
	ncIj7fvHlGOmvt4ZRKsPoK5Wdi1/7uU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-JvFdvEkzPdqalmne8SOUBg-1; Sun, 02 Mar 2025 23:53:50 -0500
X-MC-Unique: JvFdvEkzPdqalmne8SOUBg-1
X-Mimecast-MFC-AGG-ID: JvFdvEkzPdqalmne8SOUBg_1740977629
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223863d0d94so21897395ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 20:53:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740977628; x=1741582428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOpndmvGS2CTNAq9sooQow9PnGsS4iRFoQMUou58z7M=;
        b=pgf9cNFdlNg7E2MlOlQFCo6HdLah+zfwWVLddv1SFGqY+DV70wLUXc+vfbDWCpHFhx
         VEZlWbi95KU4wQE9iJ5Yi31XFnwdjone9ItaAn3oi1ODkQLiWPqJBuvzhZ75KiLfK/qv
         +Em0x1b5cUNRrfBXLkk/l+nJsmB02ol5j9POtC4F8yXjkiirLEia8py+kKsj4QEk3SHA
         kFBx6jC9C6tdLHeovBJbVuWz+b3pm73tSvVBoceIYjGOYbBp6nGhGuO+ApUiXEZY/Xjt
         WfYmwrOECLCtNLXn6xNxPXdfuzfUi2FP0x1QxuSQPPmLdl3nMpF3rX2+ludygpRF/iBg
         2+bw==
X-Forwarded-Encrypted: i=1; AJvYcCVhYKeZVRdk6+6VYxj225ydC6dHOvuoMRhSOlPq5u1pi4xzUIqo0D+K7DGOiZSAYDQPzz77XQsE6zV1fW251ufc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0QOhS/W1lKF3ViNTVo/JZsEA5NPOFnii7sU1dgi3NlKNkCb6c
	qz84EQuofjGlGiSn8qYY6DOEINJntHIrSY20ey5+rqWG5pENS6sm7L8UgIbpo897CpaKeQzDUy4
	teaW3lUKSjYg+WdpJxjbWs6t+0r5vRvYHKdRS9BSM8cy4yKDT9cQioxhxHM+ugjEqIIoAuXWy9U
	OY96I7
X-Gm-Gg: ASbGncsi9sUcQ4xqMBvsgCD6pP3bEt0CIf/lRzvuc+HH8f+0rDzB7MYrJgtlbIWUjXM
	Ckr4y8veXJSfXd0hKWEvcSA+4LtP+wL8316MGJUZR9AFxZuwcbP68IgHfP6GhmSOjozaa/p2WBv
	WB4XXt4U1RwXmvO8fdoEY2OD5Q4I/AENgJqDEkjctEg0rZxf/paVcLRCCjV9z+m4OPw67c6zNax
	ODrObtWW8tSz6PVHa2DFSIe5OIVbiGmJHBfFSQ7UXrUB4aZbxYwt6w2LJjuCmJSHNslJpWM2ojW
	TX1EQN5rdBO77X5y4g==
X-Received: by 2002:a17:903:41cb:b0:223:3781:b600 with SMTP id d9443c01a7336-2236920acb2mr202357105ad.45.1740977628211;
        Sun, 02 Mar 2025 20:53:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLRAVnzN70JdT8ECZbLP+/KQdRigH/UQkGxmw0H8i5HF/nVSSmnBIohZTsVrXlcl3ik9AvfQ==
X-Received: by 2002:a17:903:41cb:b0:223:3781:b600 with SMTP id d9443c01a7336-2236920acb2mr202356895ad.45.1740977627908;
        Sun, 02 Mar 2025 20:53:47 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350513dd4sm68505855ad.224.2025.03.02.20.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 20:53:47 -0800 (PST)
Message-ID: <48b68e9c-e550-4fa9-b479-7b2aad4fd538@redhat.com>
Date: Mon, 3 Mar 2025 14:53:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/45] arm64: kvm: Allow passing machine type in KVM
 creation
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
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-11-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-11-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: drwBP9uYD3hFtpnCHA5ob-4nRTvGkAm-erMDrr48-e4_1740977629
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_205404_680100_075EA155 
X-CRM114-Status: GOOD (  24.73  )
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

On 2/14/25 2:13 AM, Steven Price wrote:
> Previously machine type was used purely for specifying the physical
> address size of the guest. Reserve the higher bits to specify an ARM
> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
> used to create a realm guest.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v6:
>   * Make the check for kvm_rme_is_available more visible and report an
>     error code of -EPERM (instead of -EINVAL) to make it explicit that
>     the kernel supports RME, but the platform doesn't.
> ---
>   arch/arm64/kvm/arm.c     | 15 +++++++++++++++
>   arch/arm64/kvm/mmu.c     |  3 ---
>   include/uapi/linux/kvm.h | 19 +++++++++++++++----
>   3 files changed, 30 insertions(+), 7 deletions(-)
> 

Section 4.2 of Documentation/virt/kvm/api.rst needs to be updated. Other
than that, it looks good to me:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index df6eb5e9ca96..917ee7c674f5 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -180,6 +180,21 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>   	mutex_unlock(&kvm->lock);
>   #endif
>   
> +	if (type & ~(KVM_VM_TYPE_ARM_MASK | KVM_VM_TYPE_ARM_IPA_SIZE_MASK))
> +		return -EINVAL;
> +
> +	switch (type & KVM_VM_TYPE_ARM_MASK) {
> +	case KVM_VM_TYPE_ARM_NORMAL:
> +		break;
> +	case KVM_VM_TYPE_ARM_REALM:
> +		if (!static_branch_unlikely(&kvm_rme_is_available))
> +			return -EPERM;
> +		kvm->arch.is_realm = true;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
>   	kvm_init_nested(kvm);
>   
>   	ret = kvm_share_hyp(kvm, kvm + 1);
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 8cda128aafef..f8ad8f88bbb8 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -886,9 +886,6 @@ static int kvm_init_ipa_range(struct kvm *kvm,
>   	if (kvm_is_realm(kvm))
>   		kvm_ipa_limit = kvm_realm_ipa_limit();
>   
> -	if (type & ~KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
> -		return -EINVAL;
> -
>   	phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
>   	if (is_protected_kvm_enabled()) {
>   		phys_shift = kvm_ipa_limit;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index fa8f45029dff..9cabf9b6a9b4 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -644,14 +644,25 @@ struct kvm_enable_cap {
>   #define KVM_S390_SIE_PAGE_OFFSET 1
>   
>   /*
> - * On arm64, machine type can be used to request the physical
> - * address size for the VM. Bits[7-0] are reserved for the guest
> - * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
> - * value 0 implies the default IPA size, 40bits.
> + * On arm64, machine type can be used to request both the machine type and
> + * the physical address size for the VM.
> + *
> + * Bits[11-8] are reserved for the ARM specific machine type.
> + *
> + * Bits[7-0] are reserved for the guest PA size shift (i.e, log2(PA_Size)).
> + * For backward compatibility, value 0 implies the default IPA size, 40bits.
>    */
> +#define KVM_VM_TYPE_ARM_SHIFT		8
> +#define KVM_VM_TYPE_ARM_MASK		(0xfULL << KVM_VM_TYPE_ARM_SHIFT)
> +#define KVM_VM_TYPE_ARM(_type)		\
> +	(((_type) << KVM_VM_TYPE_ARM_SHIFT) & KVM_VM_TYPE_ARM_MASK)
> +#define KVM_VM_TYPE_ARM_NORMAL		KVM_VM_TYPE_ARM(0)
> +#define KVM_VM_TYPE_ARM_REALM		KVM_VM_TYPE_ARM(1)
> +
>   #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
>   #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
>   	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
> +
>   /*
>    * ioctls for /dev/kvm fds:
>    */

Thanks,
Gavin


