Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514C4D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLb7lu6k1dl1c8hC4JILF0bEB9OOGY9XCBW6C8+pPO4=; b=ma2NX9tFlC9x6U5b9Gx2yXEN0b
	NPsCaL/rsB8JUwL78UgiD49VQWgmJr1WeAHoYdhoK1ooDmgpLy2nf+g4EV4StTfpI2YAXrdIUYP2j
	t0ttxP7rV2Fya/aHICUy6bwBe5t3BEBHmj+fSOjDdkUbePJy9QaNKCdP1JbyhQAKT4nZxVmHf+2Uk
	z5RjfFStNca0buCvu+c+GDg83UTAaH9mYyr28SQaLepiQFDdmEl8LztLCzzD0HHtmHbnqmIPcmD+f
	5YRq9+eC/HMd1WnIroBt08mjPy23ubbuHtD7jTla828IP2o4r9h3x4yCXMsoXB0Ht3x2w5oWL4J50
	n3qMCIwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6yw-00000003Xqy-33eB;
	Mon, 15 Dec 2025 11:43:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6yt-00000003XqT-2L5z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 11:43:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4775ae77516so40154665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 03:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765798989; x=1766403789; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLb7lu6k1dl1c8hC4JILF0bEB9OOGY9XCBW6C8+pPO4=;
        b=IiQOoI24LmkkrEV3xYnHkz1CdKMbv2ZKt3d7o4ybwGzwsIRyIOsLbkPkY45JGT1RrE
         RMk0RhZLaOk0rSiTiUpfLnMAZSyiSLi3Oy7ndctm96L29TXLisi9Kj8pLIXtI3bIkC8W
         kGOhCNMoOdgNA+e+Fp5FQr/at0UrwyfIHCuK0JlOnPeVs7DFDIjw0Jn0LWBKG1sMyVs5
         rrR4gygXnUAeYvHz7iH2QPZGxRo4tHwU8lFY2nmxlkrGjCXu54UwHnR16gZ2/c+r4yb9
         RNcedJugOXCRug0E0UhHjzMHv8P4xH3WLKKG4SgaRli10itquf2enpptSKgIPpzuZj2E
         bCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765798989; x=1766403789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLb7lu6k1dl1c8hC4JILF0bEB9OOGY9XCBW6C8+pPO4=;
        b=xSP5rCyDq6DbrfVTEcnYWlyHqhkRNbHMPdNxCySUWSCG+kQXZXXYMXPaQWNypaDPii
         gklJLHC5M2dasoZlRaFyViW5r5FNYbTBBftJ19Ko0MbymjSbdPLLzo4WOzdPWLNvUk43
         EAvTkexodlVRuhvWh3w8AOa1FARi+lZm+T/NJRJQYa9i2WKhhA8e/aGA7VCBokfBQAyu
         iol48PrMQ/uTwoophlzouFN497FwpyaRe6soMUOtD9AxCM3qWjfwnmhG9VLp9ul/3NET
         JuK666mgKp2Kpax5HKFKFi4qAXzwJK/b9WbBarQKf2Lp6n4xzdn+vwKd4okHFyETLaTi
         dIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9QAeRxj9Ba4V+OZMpvOei1YZrYcE0H+P1JXmcIsk5f/fAUan3hcZJhZ/Y1yQTZo6Cetp/q9iiqgbuoWaSOllx@lists.infradead.org
X-Gm-Message-State: AOJu0YxHo+5iyeuWgvEyx8yJQhSXOL6MQbN/ucSaq6HGFZEumXL5EccR
	gYm38Nxyot0oz7HINXSpJvjT5D9OgbJkRYKGzDMV9eiPg7qZkAE2O2OS
X-Gm-Gg: AY/fxX57b0xke9QgFwhx9MNt5BAtJLJ5DO857KCbbwNAQ0vc6VjhHoP+Fwy/AtnHKwh
	E9apyb+sb6aBpYVKRzvjkvWs49KaozOfdIHM9bHAJICn3Cyyp3wBloIM2nUYGgIIY9NinCnBBsA
	PcoTkALjdPqvNjnQnNqzrKswiG0ipqdnNJPnY766OwANqWJAFnKnJ6cYhwUpkC0MBOF5y/dGSoi
	JHQLgq+NrHN3wDph3mQjjrKP48BT7BwEvi806u3RpfwP4HKsw36eiBuYeiroET5lO6c+N9uJ1LG
	pERN3XCVxNYrpSADHImSco9cIfR4rvLb9utibggLKedDcv2ZF6DmXxuD/StC0hbR/FFZyoHXoJx
	UP/3l1YaEPAFBuOa6ieMfkzObmVrU/5skjkcK7HkPU6DJHW4seu928ZkrYKQLbqcFEmFDF3x2g9
	Gpp0alJ/BBkBodBmpKVebVPk/zYqr5VLQ=
X-Google-Smtp-Source: AGHT+IEeDQpvobbuwupfGiM5uFsRvzqhSqqhXPwsogSR24Yld7AT9v3CQqs0OrKCGgHyBRAjSgk9dw==
X-Received: by 2002:a05:6000:22c1:b0:431:104:6db2 with SMTP id ffacd0b85a97d-4310104705fmr1298336f8f.3.1765798988051;
        Mon, 15 Dec 2025 03:43:08 -0800 (PST)
Received: from [10.24.67.48] ([15.248.3.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fb0fc8d5fsm21235995f8f.2.2025.12.15.03.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 03:43:07 -0800 (PST)
Message-ID: <bc93c396-78b1-491c-8857-41114aa585d7@gmail.com>
Date: Mon, 15 Dec 2025 11:43:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] KVM: arm64: Add pre_fault_memory implementation
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, pbonzini@redhat.com, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, shuah@kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, isaku.yamahata@intel.com,
 xmarcalx@amazon.co.uk, kalyazin@amazon.co.uk, jackabt@amazon.com
References: <20251119154910.97716-1-jackabt.amazon@gmail.com>
 <20251119154910.97716-2-jackabt.amazon@gmail.com>
 <86see3r7e9.wl-maz@kernel.org>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <86see3r7e9.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_034311_645743_4A1FEF0B 
X-CRM114-Status: GOOD (  36.08  )
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



On 24/11/2025 11:34 am, Marc Zyngier wrote:
> On Wed, 19 Nov 2025 15:49:08 +0000,
> Jack Thomson <jackabt.amazon@gmail.com> wrote:
>>
>> From: Jack Thomson <jackabt@amazon.com>
>>
>> Add kvm_arch_vcpu_pre_fault_memory() for arm64. The implementation hands
>> off the stage-2 faulting logic to either gmem_abort() or
>> user_mem_abort().
>>
>> Add an optional page_size output parameter to user_mem_abort() to
>> return the VMA page size, which is needed when pre-faulting.
>>
>> Update the documentation to clarify x86 specific behaviour.
>>
>> Signed-off-by: Jack Thomson <jackabt@amazon.com>
>> ---
>>   Documentation/virt/kvm/api.rst |  3 +-
>>   arch/arm64/kvm/Kconfig         |  1 +
>>   arch/arm64/kvm/arm.c           |  1 +
>>   arch/arm64/kvm/mmu.c           | 73 ++++++++++++++++++++++++++++++++--
>>   4 files changed, 73 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 57061fa29e6a..30872d080511 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -6493,7 +6493,8 @@ Errors:
>>   KVM_PRE_FAULT_MEMORY populates KVM's stage-2 page tables used to map memory
>>   for the current vCPU state.  KVM maps memory as if the vCPU generated a
>>   stage-2 read page fault, e.g. faults in memory as needed, but doesn't break
>> -CoW.  However, KVM does not mark any newly created stage-2 PTE as Accessed.
>> +CoW.  However, on x86, KVM does not mark any newly created stage-2 PTE as
>> +Accessed.
>>   
>>   In the case of confidential VM types where there is an initial set up of
>>   private guest memory before the guest is 'finalized'/measured, this ioctl
>> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
>> index 4f803fd1c99a..6872aaabe16c 100644
>> --- a/arch/arm64/kvm/Kconfig
>> +++ b/arch/arm64/kvm/Kconfig
>> @@ -25,6 +25,7 @@ menuconfig KVM
>>   	select HAVE_KVM_CPU_RELAX_INTERCEPT
>>   	select KVM_MMIO
>>   	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>> +	select KVM_GENERIC_PRE_FAULT_MEMORY
>>   	select VIRT_XFER_TO_GUEST_WORK
>>   	select KVM_VFIO
>>   	select HAVE_KVM_DIRTY_RING_ACQ_REL
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 870953b4a8a7..88c5dc2b4ee8 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -327,6 +327,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>   	case KVM_CAP_IRQFD_RESAMPLE:
>>   	case KVM_CAP_COUNTER_OFFSET:
>>   	case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
>> +	case KVM_CAP_PRE_FAULT_MEMORY:
>>   		r = 1;
> 
> How does with pKVM, where the host is not in charge of dealing with
> stage-2?
For the pKVM case would
     if (vcpu_is_protected(vcpu))
         return -EPERM;
be the appropriate way to handle this?
>>   		break;
>>   	case KVM_CAP_SET_GUEST_DEBUG2:
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 7cc964af8d30..cba09168fc6d 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1599,8 +1599,8 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>   
>>   static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>   			  struct kvm_s2_trans *nested,
>> -			  struct kvm_memory_slot *memslot, unsigned long hva,
>> -			  bool fault_is_perm)
>> +			  struct kvm_memory_slot *memslot, long *page_size,
> 
> Why is page_size a signed type? A page size is never negative.
> 
>> +			  unsigned long hva, bool fault_is_perm)
> 
> I really wish we'd stop adding parameters to this function, as it has
> long stopped being readable. It would make a lot more sense if we
> passed a descriptor for the fault, containing the ipa, hva, memslot
> and fault type.
I found a patch series which looks to address this [1]. Would you like
this fixed for this series?

[1] 
https://lore.kernel.org/linux-arm-kernel/20250821210042.3451147-1-seanjc@google.com/
>>   {
>>   	int ret = 0;
>>   	bool topup_memcache;
>> @@ -1878,6 +1878,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>   	kvm_release_faultin_page(kvm, page, !!ret, writable);
>>   	kvm_fault_unlock(kvm);
>>   
>> +	if (page_size)
>> +		*page_size = vma_pagesize;
>> +
>>   	/* Mark the page dirty only if the fault is handled successfully */
>>   	if (writable && !ret)
>>   		mark_page_dirty_in_slot(kvm, memslot, gfn);
>> @@ -2080,8 +2083,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>   		ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
>>   				 esr_fsc_is_permission_fault(esr));
>>   	else
>> -		ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
>> -				     esr_fsc_is_permission_fault(esr));
>> +		ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, NULL,
>> +				     hva, esr_fsc_is_permission_fault(esr));
>>   	if (ret == 0)
>>   		ret = 1;
>>   out:
>> @@ -2457,3 +2460,65 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
>>   
>>   	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
>>   }
>> +
>> +long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>> +				    struct kvm_pre_fault_memory *range)
>> +{
>> +	int ret, idx;
>> +	hva_t hva;
>> +	phys_addr_t end;
>> +	struct kvm_memory_slot *memslot;
>> +	struct kvm_vcpu_fault_info stored_fault, *fault_info;
>> +
>> +	long page_size = PAGE_SIZE;
>> +	phys_addr_t ipa = range->gpa;
>> +	gfn_t gfn = gpa_to_gfn(range->gpa);
> 
> nit: Please order this in a more readable way, preferably with long
> line first.
> 
>> +
>> +	idx = srcu_read_lock(&vcpu->kvm->srcu);
> 
> ??? Aren't we already guaranteed to be under the SRCU read lock?
> 
>> +
>> +	if (ipa >= kvm_phys_size(vcpu->arch.hw_mmu)) {
>> +		ret = -ENOENT;
>> +		goto out_unlock;
>> +	}
>> +
>> +	memslot = gfn_to_memslot(vcpu->kvm, gfn);
>> +	if (!memslot) {
>> +		ret = -ENOENT;
>> +		goto out_unlock;
>> +	}
>> +
>> +	fault_info = &vcpu->arch.fault;
>> +	stored_fault = *fault_info;
> 
> If this is a vcpu ioctl, can the fault information be actually valid
> while userspace is issuing an ioctl? Wouldn't that mean that we are
> exiting to userspace in the middle of handling an exception?
> 
>> +
>> +	/* Generate a synthetic abort for the pre-fault address */
>> +	fault_info->esr_el2 = ESR_ELx_EC_DABT_LOW;
>> +	fault_info->esr_el2 &= ~ESR_ELx_ISV;
> 
> You are constructing this from scratch. How can ISV be set?
> 
>> +	fault_info->esr_el2 |= ESR_ELx_FSC_FAULT_L(KVM_PGTABLE_LAST_LEVEL);
>> +
>> +	fault_info->hpfar_el2 = HPFAR_EL2_NS |
>> +		FIELD_PREP(HPFAR_EL2_FIPA, ipa >> 12);
>> +
>> +	if (kvm_slot_has_gmem(memslot)) {
>> +		ret = gmem_abort(vcpu, ipa, NULL, memslot, false);
>> +	} else {
>> +		hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
>> +		if (kvm_is_error_hva(hva)) {
>> +			ret = -EFAULT;
>> +			goto out;
>> +		}
>> +		ret = user_mem_abort(vcpu, ipa, NULL, memslot, &page_size, hva,
>> +				     false);
>> +	}
>> +
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	end = (range->gpa & ~(page_size - 1)) + page_size;
> 
> This suspiciously looks like one of the __ALIGN_KERNEL* macros.
> 
>> +	ret = min(range->size, end - range->gpa);
>> +
>> +out:
>> +	*fault_info = stored_fault;
>> +out_unlock:
>> +	srcu_read_unlock(&vcpu->kvm->srcu, idx);
>> +	return ret;
>> +}
> 
> Thanks,
> 
> 	M.
> 

-- 
Thanks,
Jack

