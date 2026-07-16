Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE7CC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYbyHcYOcEU66dX3D3KOV5pATwI9+gLgVcyyJmFscAw=; b=ELLpC1l35HbDIqO1U8ip7mE170
	yyMP1ulRjwQ6k6zyfpiM/2ueVWTkbvwzoe1ZgVS1JlZPOYvl2lrN9BbNjIgXFkl1pWGYXuCELBmUy
	yTxUOB1Bk82qZDc980TzsNCnT7mUFjp2HtdJ5P3M2gw6WE4vbENnvXLN4folAJIMsWa8ivpFttMvw
	SOR4NZl922qgPTl3FVxBEcIlCM3pklfumiF5InIRDrm88pjeSlvvAcQJLoJGVJXmihMEBC+odPb8V
	5wdLvkahuNM/tL8531jUE0FPnsHDM7BoZiuHkP+bZntRFj1xyfbyUuBhZkYj63gO3E6CSITPdll35
	o2mqWOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJHd-0000000H0Xe-0G62;
	Thu, 16 Jul 2026 10:25:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJHa-0000000H0We-3wKt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:25:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4FF7339;
	Thu, 16 Jul 2026 03:25:29 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A19343F7B4;
	Thu, 16 Jul 2026 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784197533; bh=x4kSnQlAgSYESyx9NTRUemd971Q4tXKjHfRBi5wLmcE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ugV6FvcEc/FYjqbDOiHKc2tk7abFU+2mIHkHx0gYYvAepIRtjAagEhuhyjLz+/bKJ
	 dfjrntRzrd2GQXrp3HDJbFa9rFs20uE2B/NSCcuwVniqX7GO2XKkAHtUqAAJsgNDHm
	 Ua3jezZGuS6XODMsGSxX3ix3GrTohLCQF0kJbYUM=
Message-ID: <0a72c33d-0eb7-4cf2-b2c2-86e256740a63@arm.com>
Date: Thu, 16 Jul 2026 11:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 17/37] KVM: arm64: Expose support for private memory
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
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
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-18-steven.price@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260715142841.80544-18-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_032535_058003_1D6489A1 
X-CRM114-Status: GOOD (  15.63  )
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

On 15/07/2026 15:28, Steven Price wrote:
> Select KVM_GENERIC_MEMORY_ATTRIBUTES and provide the necessary support
> functions.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---

minor nit:

Changes since v14:
   * Switch to guest_memfd in-place memory conversion and drop support
     for KVM_VM_MEMORY_ATTRIBUTES.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> Changes since v13:
>   * Also update documentation to show that KVM_CAP_MEMORY_ATTRIBUTES is
>     used on arm64.
> Changes since v12:
>   * Only define kvm_arch_has_private_mem() when
>     CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES is set to avoid build issues
>     when KVM is disabled.
> Changes since v10:
>   * KVM_GENERIC_PRIVATE_MEM replacd with KVM_GENERIC_MEMORY_ATTRIBUTES.
> Changes since v9:
>   * Drop the #ifdef CONFIG_KVM_PRIVATE_MEM guard from the definition of
>     kvm_arch_has_private_mem()
> Changes since v2:
>   * Switch kvm_arch_has_private_mem() to a macro to avoid overhead of a
>     function call.
>   * Guard definitions of kvm_arch_{pre,post}_set_memory_attributes() with
>     #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.
>   * Early out in kvm_arch_post_set_memory_attributes() if the WARN_ON
>     should trigger.
> ---
>   arch/arm64/include/asm/kvm_host.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 9b46b39ed11e..993ead6e6449 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1509,6 +1509,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>   
>   #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
>   
> +#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
> +
>   int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>   bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
>   


