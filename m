Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726B0CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 08:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGuEKUNSn7CWi98Kiq4Lh5AlkTs85zndxkeVO/EME58=; b=Q3KrCgjfgOePzrh2UGod0ZJFtT
	uYwvgzj1kY96EZ1SZdpBC2DAFtqVvrdncgnBxKZtOcMtFzeA5eVSjfPQNrW1wDwLeFZQSTU7MsY/d
	kFM2Nc+Xx788E0v8ZpeNTg8yO0a7aZPmrux0C8P935W/CXdKzTLWLhpecQyA78gbUnQPeesV+QPa1
	R21xOgUdbHeYuKc6TKSxfGrNXG4DJU1KEjTWb+efSlKVuNjEac3XMiNaCx3u+LapzrHstJwAZWh12
	RkzaRXhuBD2rhkOjFoLODAjWNuG+tKeKWfseVOm99lBkkcBXZ1/a+URxogaD9sPl+UBkuyGQxuiZz
	OxQJQI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0rg-00000000Jhh-1qXl;
	Tue, 06 Oct 2026 08:49:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0rd-00000000JhM-3CZo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 08:49:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8185F1516;
	Tue,  6 Oct 2026 01:49:28 -0700 (PDT)
Received: from [10.57.10.233] (unknown [10.57.10.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B84033F86F;
	Tue,  6 Oct 2026 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791276571; bh=YISavRvpWmdsDYnih8VoBSgUz6ZqTZT9fYgZxccZo24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XprR6FnfcIDTLyhMAIr43Z9gnXww9pKL5fQTlBTcKKUI02uJEdDo7Vl6C9L5aWja6
	 nl5Lk736djKuQAvvXk8cUmuk+AF+M7jY9nMcGiA3HKLcqt4nl3WHMbyC+tP4ppAUWZ
	 EH6jVXFlj2pLUaECROcDKPXLBn1/5GUYqTDWpfwc=
Message-ID: <e2070fdf-a598-468b-a43b-13d56ac79721@arm.com>
Date: Tue, 6 Oct 2026 10:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 05/23] KVM: arm64: Track the type of VM in kvm_arch
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-6-suzuki.poulose@arm.com>
 <87cxtn2pp8.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <87cxtn2pp8.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_014933_963995_8EC1208B 
X-CRM114-Status: GOOD (  29.61  )
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

On 06/10/2026 09:33, Marc Zyngier wrote:
> On Mon, 05 Oct 2026 10:07:36 +0100,
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> KVM arm64 has different types of VMs with all the different modes in which
>> the hypervisor code can be run. e.g., VHE, nVHE, pKVM etc. Then there is
>> protected VM and normal VMs with pKVM. We might soon add other types,
>> e.g., Arm CCA Realm. So in an effort to make the handling of these
>> different types of VMs a bit more friendly to the eyes, add a VM flavor to
>> the kvm_arch and we could then add handlers for different operations based
>> on the VM type.
>>
>> Keep the flavor initialisation at the beginning to allow for the detection
>> early enough and fail out on any unsupported requests.
>>
>> With that, add wrappers for checking the "type" of a VM and replace the
>> existing users with the new wrappers.
>>
>> Given we already have the construct of "kvm_vm_is_protected" in the core
>> KVM code, use that for all confidential compute guests including Realms
>> that we are about to add. Adds __VM_PROTECTED marker vm flavor to draw the
>> boundary for "protected VMs". In later patches, we would add Realm VMs,
>>   which would also be classified as protected.
>>
>> Add a explicit helper to detect if a given VM is a "protected" VM under pKVM.
>> Change the existing users that precisely want to check the VM type. These
>> include :
>>    - kvm_arch_prepare_memory_region - For preventing memslot changes after
>>      pVM creation.
>>
>> All the others are retained as a wider check for confidential guest VMs.
>> These are:
>>   - kvm_vm_ioctl_set_counter_offset - For disallowing timer offset
>>     configuration
>>   - io_mem_abort for dabt handling without valid syndrome information
>>
>> Both of which are true for Realms too.
>>
>> Realms support is restricted to VHE host and thus "kvm_vm_is_protected()"
>> checks in the pkvm hyp specific code doesn't need to change, as the only
>> protected guests it deals with is "protected pKVM" guests. To tighten this
>> init_pkvm_hyp_vm() restricts the hyp copy of the vm_flavor to the ones it
>> supports.
>>
>> vcpu_is_protected() usage from nVHE hyp code is tricky, as we need to
>> convert the vcpu->kvm to the HYP VA before checking the flavor. This
>> involves kern_hyp_va() usage in asm/kvm_host.h. To avoid build breaks,
>> include asm/kvm_mmu.h to arm64/kvm/mmio.c.
>>
>> While at it move the psci_version around to keep the structure packed.
>>
>> Suggested-by: Marc Zyngier <maz@kernel.org>
>> Tested-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> Changes since v21:
>>   - Drop kern_hyp_va() and restrict nvhe code to always use vcpu_is_protected_pkvm()
>>   - Drop kvm_vm_is_unprotected_pkvm() and open code the check
>>   - Move psci_version field in kvm_arch around to keep the structure packed
>> ---
>>   arch/arm64/include/asm/kvm_host.h      | 42 +++++++++++++++++++++++---
>>   arch/arm64/include/asm/kvm_pkvm.h      |  4 +--
>>   arch/arm64/kvm/arm.c                   | 33 ++++++++++++++++----
>>   arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 +-
>>   arch/arm64/kvm/hyp/nvhe/pkvm.c         |  6 +++-
>>   arch/arm64/kvm/hyp/nvhe/switch.c       |  4 +--
>>   arch/arm64/kvm/hyp/nvhe/timer-sr.c     |  2 +-
>>   arch/arm64/kvm/mmio.c                  |  1 +
>>   arch/arm64/kvm/mmu.c                   |  2 +-
>>   arch/arm64/kvm/pkvm.c                  |  6 ++--
>>   10 files changed, 79 insertions(+), 23 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 286489a69dff5..dedb5df15a803 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -257,7 +257,6 @@ struct kvm_protected_vm {
>>   	pkvm_handle_t handle;
>>   	struct kvm_hyp_memcache teardown_mc;
>>   	struct kvm_hyp_memcache stage2_teardown_mc;
>> -	bool is_protected;
>>   	bool is_created;
>>   
>>   	/*
>> @@ -306,9 +305,22 @@ enum fgt_group_id {
>>   	__NR_FGT_GROUP_IDS__
>>   };
>>   
>> +enum kvm_arm_vm_flavor {
>> +	VM_NVHE,
>> +	VM_VHE,
>> +	VM_PKVM,		/* Normal guests on pKVM */
>> +	MARKER(__VM_PROTECTED),
>> +	VM_PROTECTED_PKVM,	/* Protected VM */
>> +	VM_FLAVOR_MAX
>> +};
>> +
>>   struct kvm_arch {
>>   	struct kvm_s2_mmu mmu;
>>   
>> +	enum kvm_arm_vm_flavor vm_flavor;
>> +	/* Mandated version of PSCI */
>> +	u32 psci_version;
>> +
>>   	/*
>>   	 * Fine-Grained UNDEF, mimicking the FGT layout defined by the
>>   	 * architecture. We track them globally, as we present the
>> @@ -332,9 +344,6 @@ struct kvm_arch {
>>   	/* Timers */
>>   	struct arch_timer_vm_data timer_data;
>>   
>> -	/* Mandated version of PSCI */
>> -	u32 psci_version;
>> -
>>   	/* Protects VM-scoped configuration data */
>>   	struct mutex config_lock;
>>   
>> @@ -1504,9 +1513,32 @@ struct kvm *kvm_arch_alloc_vm(void);
>>   
>>   #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>>   
>> -#define kvm_vm_is_protected(kvm)	(is_protected_kvm_enabled() && (kvm)->arch.pkvm.is_protected)
>> +#define kvm_vm_is_protected(kvm)	((kvm)->arch.vm_flavor >= __VM_PROTECTED)
>>   
>> +#ifdef __KVM_NVHE_HYPERVISOR__
>> +/*
>> + * Accessing vcpu->kvm from nVHE hyp stub is tricky, as we need to convert the
>> + * pointer to the hyp VA. With pKVM, the nVHE code runs with the hyp_vcpu,
>> + * which is populated correctly. Always vcpu_is_protected_pkvm(), which is
> 
> Always *use*? 

Ack

> 
>> + * gated on is_protected_kvm_enabled().
>> + */
>> +#define vcpu_is_protected(vcpu)		BUILD_BUG_ON(1)
>> +#else
>>   #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
>> +#endif
>> +
>> +#define kvm_vm_is_protected_pkvm(kvm)					\
>> +	(is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM))
>> +/*
>> + * Rely on is_protected_kvm_enabled() check in kvm_vm_is_protected_pkvm() to
>> + * make sure the vcpu->kvm is always valid VA in the context
>> + */
>> +#define vcpu_is_protected_pkvm(vcpu)					\
>> +	({								\
>> +		struct kvm *__kvm = READ_ONCE((vcpu)->kvm);		\
>> +									\
>> +		(__kvm && kvm_vm_is_protected_pkvm(__kvm));		\
>> +	})
> 
> But why do we have to have this pkvm-specific stuff? I thought we had
> established it is not necessary in [1].

My bad. I need to wear the glasses :-(

> 
> I really want to avoid any backend-specific helper, as it really gets
> in the way of maintainability.

Agreed. I will fix this. Apologies

Cheers
Suzuki

> 
> 	M.
> 
> [1] https://lore.kernel.org/r/86pkxs2npx.wl-maz@kernel.org
> 
> 


