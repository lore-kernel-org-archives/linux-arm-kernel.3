Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC60C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 03:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Abwf0alfy8lmdT9uf0Uv5Evj+p5aY96/emuc9X9I3es=; b=FUN241cHq56G7jnYwf2U/hXK6u
	QMS5BnDmFnx+v4K6kQ15GT+Vn7yY8pHhHjhm8AbvcrviYQDoS2mlNhH/X30sAHkAr5wP3owbDM1mT
	7YwNqJ0jIgiycpFTy9okRc8a+q9x0URd2W7D0SBHhGnDDx2x3RnhqQKS7qFXG70yyf2ULyiNhv5Mo
	4LIyR4huIYofVMaYPsaJYK/sgoiSVY9eFIns8LxbUyvsJB6C0Rl+ghII7Gc4jrL9ZmGnl+cPq6Oi0
	MBYYtPGoQxIBfXqss70JdCVuU+2ZNjBugJ/RRLC3fLQiz18BJ188D4h8TQRq0c7YqpnAL7SpyVq8l
	Xk7F6jdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vdk-0000000DJUq-3rnU;
	Thu, 10 Sep 2026 03:39:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vdh-0000000DJUT-440q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 03:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789011592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Abwf0alfy8lmdT9uf0Uv5Evj+p5aY96/emuc9X9I3es=;
	b=AC/PJ+RTsAVSm399G92pQuH62oQViBzJ2CaxoLSeGl7w6CcNjg/oIefvQ55G5ZcN0oYHIk
	7kBdSvhiWH3Siu3D5dGjK5GapsOuuca/ILAW/+RtqNWNOrzHu42/0dduNvQnrZw6ubBUMz
	qfdGvMOJGot8sbYx6eiLElkbhnCKN/I=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-AAaDzgWrNYO26LLMdPBwPg-1; Wed, 09 Sep 2026 23:39:50 -0400
X-MC-Unique: AAaDzgWrNYO26LLMdPBwPg-1
X-Mimecast-MFC-AGG-ID: AAaDzgWrNYO26LLMdPBwPg_1789011589
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc39363cc88so6887678a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 20:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011589; x=1789616389;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Abwf0alfy8lmdT9uf0Uv5Evj+p5aY96/emuc9X9I3es=;
        b=Rg19O1k96P0FW16FHYhgeJsc761KJcjj510A5Y6jKXrpOzlDCNWypHaMhMiwvQO3Sm
         3EdA40LPDD7+XFKScw9pFbO2fIUE8CfAzO0Vr3NBPjPD7aK04eMFjqXHs9Y0/7RZ/ytR
         b7VbotXxid8nuuxnoXLntLvNiuVnBGS++OzY2f1NpWStaedpbKmFZKyP7RQSL7+Ph1s7
         VtpKlUAylwRkT2NamIIgGbPmVpm4Emvk5t3SSxVUz/0UwDcyr7i7ufOna+/xlLIamtpU
         2uw8lOnSdk6WA3396Jt5y+j1t/U0bNHEbLRe8+9ukSn/dr3aKyfGSWe8u7/8RpLiblEQ
         YtYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNxr2+tCMstG5yp0Yo02oAgrnV4q7r3jVgWWbIQhcE5UbtDD3K7QFcJzbIIuilG1O7Vj2MZpAnRqGOjNMLnswx@lists.infradead.org
X-Gm-Message-State: AFuF++m9SHG0DRvvaPRcVgRfytx36Cy4prCi3u7772h6XofrocAxmaQP
	cYEPhV0ycbqEbSangLR1NJyvho6h6cu590//6sjZEsmVAsQ7SOvJ+IMuCZWfRm5b/M3c5IKCJpJ
	0/28ZecW4zXkwL+LQ2rL6tLlA6+TH5Wl0YOUx9s2i9Y0D0BWqSW8Ig24vvXBdjUuOeciQBbEUnE
	Mn
X-Gm-Gg: AYBFou1hTj9sRpKq4NaltojTFFUQ8kyUJZXedf9jBwLo09SVKVv85+EE1gZvdcwanjM
	NNFYSo62zlRonIyMDuokNLq0ei7Wbj2WggDqEYPA2+rmUVlpSs2fa1iFPeAvI7cFZBj7a/LM+aU
	YC+sPbtbXoFXh2nTh/p89iCjUlnd+qAfgGhxasJ8aSjy+Z/VMib3BwZ3b2bFl+sQHiQPUZtvtRw
	sIP1WRMOgxw/R81lc9bYUl1c1jc6liMCvcKvHLkZ968AfGuZirkrPnDL850NqNaJAP1rmEQ3SWt
	aEUDbrUDPJk7oK5TP0FMpFWXcv7+6PUEoDwpWkZF1YvGB9uXlxcBhVM/B+DgHdiME9IQ/kOEzwB
	zEW8GnY5gmWXzIbwbuXhFrFSCwrANfsrMtzVUSDva9A==
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr58682597a91.16.1789011588755;
        Wed, 09 Sep 2026 20:39:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr58682526a91.16.1789011588237;
        Wed, 09 Sep 2026 20:39:48 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77498csm1527727a91.3.2026.09.09.20.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 20:39:47 -0700 (PDT)
Message-ID: <3cd34b9c-7500-4993-86ff-c1ee9a86b601@redhat.com>
Date: Thu, 10 Sep 2026 13:39:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 03/20] KVM: arm64: Track the type of VM in kvm_arch
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-4-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260908162223.1683432-4-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vLHjY8I0HpY8jZPSckYQwnvROCetS-4C-n0xFWOK0_E_1789011589
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_203954_090280_74780AED 
X-CRM114-Status: GOOD (  33.21  )
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

Hi Suzuki,

On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
> KVM arm64 has different types of VMs with all the different modes in which the
> hypervisor code can be run. e.g., VHE, nVHE, PKVM etc. Then there is protected
> VM and normal VMs with PKVM. We might soon add other types, e.g., Arm CCA Realm.
> So in an effort to make the handling of these different types of VMs a bit more
> friendlier to the eyes, add a VM flavor to the kvm_arch and we could then add
> handlers for different operations based on the VM type.
> 
> Keep the flavor initialisation at the beginning to allow for the detection
> early enough and fail out on any unsupported requests. (e.g., protected on !PKVM)
> 
> With that, use the vm_flavor to detect if a VM is protected VM on PKVM.
> 
> Based on a patch by Marc Zyngier
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 12 ++++++++++--
>   arch/arm64/kvm/arm.c              | 27 ++++++++++++++++++++++++---
>   arch/arm64/kvm/hyp/nvhe/pkvm.c    |  2 +-
>   arch/arm64/kvm/pkvm.c             |  1 -
>   4 files changed, 35 insertions(+), 7 deletions(-)
> 

Some nitpicks below. In either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 27fe0cd5b2d7a..d0dccc9ad6aa8 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -257,7 +257,6 @@ struct kvm_protected_vm {
>   	pkvm_handle_t handle;
>   	struct kvm_hyp_memcache teardown_mc;
>   	struct kvm_hyp_memcache stage2_teardown_mc;
> -	bool is_protected;
>   	bool is_created;
>   
>   	/*
> @@ -306,9 +305,18 @@ enum fgt_group_id {
>   	__NR_FGT_GROUP_IDS__
>   };
>   
> +enum kvm_arm_vm_flavor {
> +	VM_NVHE,
> +	VM_VHE,
> +	VM_PKVM,		/* Normal guests on PKVM */
> +	VM_PROTECTED_PKVM,	/* Protected VM */
> +	VM_FLAVOR_MAX,
> +};
> +
>   struct kvm_arch {
>   	struct kvm_s2_mmu mmu;
>   
> +	enum kvm_arm_vm_flavor vm_flavor;
>   	/*
>   	 * Fine-Grained UNDEF, mimicking the FGT layout defined by the
>   	 * architecture. We track them globally, as we present the
> @@ -1504,7 +1512,7 @@ struct kvm *kvm_arch_alloc_vm(void);
>   
>   #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>   
> -#define kvm_vm_is_protected(kvm)	(is_protected_kvm_enabled() && (kvm)->arch.pkvm.is_protected)
> +#define kvm_vm_is_protected(kvm)	((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
>   

Here we may introduce one more helper for generic use cases. It's going to
be used in kvm_arch_init_vm().

#define kvm_vm_flavor_eq(kvm, flavor)	((kvm)->arch.vm_flaor == (flavor))
#define kvm_vm_is_protected(kvm)	kvm_vm_flavor_eq(kvm, VM_PROTECTED_PKVM)

>   #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
>   
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8b080804bc90b..67f1ff9bc4fbe 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -214,6 +214,26 @@ static int kvm_arm_default_max_vcpus(void)
>   	return vgic_present ? kvm_vgic_get_max_vcpus() : KVM_MAX_VCPUS;
>   }
>   
> +static int kvm_init_vm_flavor(struct kvm *kvm, unsigned long type)
> +{
> +	bool protected = type & KVM_VM_TYPE_ARM_PROTECTED;
> +
> +	if (is_protected_kvm_enabled()) {
> +		if (protected)
> +			kvm->arch.vm_flavor = VM_PROTECTED_PKVM;
> +		else
> +			kvm->arch.vm_flavor = VM_PKVM;
> +	} else if (protected) {
> +		return -EINVAL;
> +	} else if (has_vhe()) {
> +		kvm->arch.vm_flavor = VM_VHE;
> +	} else {
> +		kvm->arch.vm_flavor = VM_NVHE;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * kvm_arch_init_vm - initializes a VM data structure
>    * @kvm:	pointer to the KVM struct
> @@ -236,6 +256,10 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>   	mutex_unlock(&kvm->lock);
>   #endif
>   
> +	ret = kvm_init_vm_flavor(kvm, type);
> +	if (ret)
> +		return ret;
> +
>   	kvm_init_nested(kvm);
>   
>   	ret = kvm_share_hyp(kvm, kvm + 1);
> @@ -260,9 +284,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>   		ret = pkvm_init_host_vm(kvm, type);
>   		if (ret)
>   			goto err_uninit_mmu;
> -	} else if (type & KVM_VM_TYPE_ARM_PROTECTED) {
> -		ret = -EINVAL;
> -		goto err_uninit_mmu;
>   	}
>   
>   	kvm_vgic_early_init(kvm);

We needn't depend on is_protected_kvm_enabled() to call pkvm_init_host_vm() because
the output of is_protected_kvm_enabled() has been updated to kvm->arch.vm_flavor
by previous call kvm_init_vm_flavor().

	if (kvm_vm_is_protected(kvm) || kvm_vm_flavor_eq(kvm, VM_PKVM)) {
		ret = pkvm_init_host_vm(kvm, type);
		if (ret)
			goto err_unit_mmu;
	}

> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 459bd9eb7e4bc..09961c0056f2b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -432,7 +432,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
>   
>   	hyp_vm->host_kvm = host_kvm;
>   	hyp_vm->kvm.created_vcpus = nr_vcpus;
> -	hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
> +	hyp_vm->kvm.arch.vm_flavor = READ_ONCE(host_kvm->arch.vm_flavor);
>   	hyp_vm->kvm.arch.flags = 0;
>   	pkvm_init_features_from_host(hyp_vm, host_kvm);
>   
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 8e4c6e4bec123..3948fa46f4d75 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -240,7 +240,6 @@ int pkvm_init_host_vm(struct kvm *kvm, unsigned long type)
>   		return ret;
>   
>   	kvm->arch.pkvm.handle = ret;
> -	kvm->arch.pkvm.is_protected = protected;
>   	if (protected) {
>   		pr_warn_once("kvm: protected VMs are experimental and for development only, tainting kernel\n");
>   		add_taint(TAINT_USER, LOCKDEP_STILL_OK);

In pkvm_init_host_vm(), the local variable 'protected' is used for once
and can be removed by:

	if (kvm_vm_is_protected(kvm)) {
		pr_warn_once(...);
		add_taint(...);
	}

Thanks,
Gavin


