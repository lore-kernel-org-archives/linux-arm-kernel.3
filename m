Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4A6C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 23:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Go/jWFpocC2K2bdCnFmnA3ZVJNNKON5wYpgoktyFejg=; b=HEsnFZGrT735NmGl/p0RFVADoe
	DiaJNY2QT8j1Ty5akLUFAqaf5xfTEEPhms7L7oBleOO6Kwm1Pjp4P5lP0HcSkp4AJc2koTxeqgbLW
	VRsfPTAsWYN+DgQPxYS0fc5Fqd+rdde1OgngpCofnugy2qlr+izkdTW18KsL1kG+w54RiJ76uu/5T
	EqY0TMw4uFC8dVnYKXdXb2rzEpx9P1jcageBeTAHYYwuAA/X6cmOaZyxjTYBllrYd7g9zlxGeadP0
	y9ACgA3gM+bjWkLbE7baxRMsM8cW1iDX+fUOloTiyxnTn4OtYSD2r3oYpjPWa1Asd9yvEHpJYv6aX
	5AL1eFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9A41-00000006kDv-3hkf;
	Tue, 22 Sep 2026 23:38:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9A3z-00000006kDW-28Vz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 23:38:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 528721576;
	Tue, 22 Sep 2026 16:38:10 -0700 (PDT)
Received: from [10.57.9.113] (unknown [10.57.9.113])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC8583F86C;
	Tue, 22 Sep 2026 16:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790120293; bh=Vp57X95Fk0aMix9oOoIvdNpS8L+cBiuf1SveFkrXClA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=halJVZJULr7JY7CEvIFT//j2bv2nqQT6X3o1V9LDwSkgL6/JIzlvX9R+gJkvg+2Fb
	 dI7uC1/f4STe573EZeAFUFyvB+VpSw5BMoraX1wGMoySSm9uzLFO+Pr6CGkr5NFWV1
	 wubIkq6ypSPFGK9246v1H/JYbtqzRidVcEAwQL3A=
Message-ID: <f72a26bf-a64f-4053-b7a6-4b33faeb9b58@arm.com>
Date: Wed, 23 Sep 2026 00:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/20] KVM: arm64: Mandate VGIC v3 for for VMs running
 on hyp that don't trust the host
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-12-suzuki.poulose@arm.com>
 <20260922154219.00000999@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260922154219.00000999@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_163815_632580_6D0DF526 
X-CRM114-Status: GOOD (  18.80  )
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

On 22/09/2026 23:42, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 22:28:36 +0100
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> 
>> pKVM and RMM, both do not trust the host. Add a helper to detect the VMs
> 
> Maybe don't mention RMM yet, or make it clear that isn't here in this
> patch.

Ack.

> 
>> that have "distrusting" hyp. Use this for blocking ioremap of vgic-v2 into
>> stage2 and prevent creation of VGIC other than v3.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Thanks

> 
> Other than minor comments, it feels to me like these first 11
> patches are good cleanup even without the RMM stuff that follows.
> Perhaps can get these upstream faster than the rest?
> 
> Jonathan
> 
>> ---
>> Changes since v18:
>>   - Cover pKVM guests for VGIC v3 mandate.
>>   - Merge the VGIC mandate check in here.
>> ---
>>   arch/arm64/include/asm/kvm_host.h | 3 +++
>>   arch/arm64/kvm/mmu.c              | 2 +-
>>   arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
>>   3 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 3211543a85b38..bb156a633ab75 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -328,6 +328,8 @@ enum fgt_group_id {
>>   enum kvm_arm_vm_flavor {
>>   	VM_NVHE,
>>   	VM_VHE,
>> +	/* VMs running on a hyp that doesn't trust */
>> +	MARKER(__VM_DISTRUSTING_HYP),
>>   	VM_PKVM,		/* Normal guests on pKVM */
>>   	MARKER(__VM_PROTECTED),
>>   	VM_PROTECTED_PKVM,	/* Protected VM */
>> @@ -1546,6 +1548,7 @@ struct kvm *kvm_arch_alloc_vm(void);
>>   #define kvm_vm_is_unprotected_pkvm(kvm)		\
>>   	(is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PKVM))
>>   
>> +#define kvm_vm_hyp_is_distrusting(kvm)	((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
>>   
>>   int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>>   bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index cf293d09e940a..413c4b114d75d 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1251,7 +1251,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>>   				     KVM_PGTABLE_PROT_R |
>>   				     (writable ? KVM_PGTABLE_PROT_W : 0);
>>   
>> -	if (is_protected_kvm_enabled())
>> +	if (kvm_vm_hyp_is_distrusting(kvm))
>>   		return -EPERM;
>>   
>>   	size += offset_in_page(guest_ipa);
>> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
>> index 4012df6002ea6..874025513afcc 100644
>> --- a/arch/arm64/kvm/vgic/vgic-init.c
>> +++ b/arch/arm64/kvm/vgic/vgic-init.c
>> @@ -84,6 +84,8 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>>   		!kvm_vgic_global_state.can_emulate_gicv2)
>>   		return -ENODEV;
>>   
>> +	if (kvm_vm_hyp_is_distrusting(kvm) && type != KVM_DEV_TYPE_ARM_VGIC_V3)
>> +		return -ENODEV;
>>   	/*
>>   	 * Ensure mutual exclusion with vCPU creation and any vCPU ioctls by:
>>   	 *
> 


