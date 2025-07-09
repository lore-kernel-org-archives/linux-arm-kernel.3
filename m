Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006B6C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbGbyNRvI6qxVv/ELPoffyMsraRCSrLgIadvEoVkNHg=; b=Z/S7gqMSjDmq2pDo6Mw32gP36/
	JAnVh5KaK35UuCM7wB+8DT9A/W4mMainmNLMBBykKKrUQ6ndCNWgsVjEb4Zp6lh5ZUkYvev9hVgyZ
	nSOL/DefiwHQABbt1f3bbQ7qAzosPxnkmeDYVscoFwVo63fAE1RoCz0x6Cfs3oe41pOfjkOt/1jYo
	c9t9dZUNSivMZ49nwfhit4NiAx+3WnyCZPZ4pJVqZyWzQQD2gP8KHCMOF1cDJ94L6MKpEbeA/soJW
	qgnAUu6YQ8zFJUo6fxkMs4FvcWgmGCDyVivCkbdo9FPGapHmNJpfMVL7RuBISNbFjggyZvcwcH+qu
	aSKCUTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZYFb-00000009OFE-1qdo;
	Wed, 09 Jul 2025 17:06:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZW0o-000000091JU-11cv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:43:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7963C152B;
	Wed,  9 Jul 2025 07:42:51 -0700 (PDT)
Received: from [10.57.86.38] (unknown [10.57.86.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DAF63F694;
	Wed,  9 Jul 2025 07:42:59 -0700 (PDT)
Message-ID: <c7d5b038-70b3-4e55-a6bc-a74b77a04d3d@arm.com>
Date: Wed, 9 Jul 2025 15:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/43] arm64: RME: Support for the VGIC in realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
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
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-14-steven.price@arm.com>
 <45ae476d-a557-40a5-81d2-99841fda4941@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <45ae476d-a557-40a5-81d2-99841fda4941@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_074306_371776_4487B371 
X-CRM114-Status: GOOD (  17.88  )
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

On 03/07/2025 14:22, Suzuki K Poulose wrote:
> On 11/06/2025 11:48, Steven Price wrote:
>> The RMM provides emulation of a VGIC to the realm guest but delegates
>> much of the handling to the host. Implement support in KVM for
>> saving/restoring state to/from the REC structure.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes from v8:
>>   * Propagate gicv3_hcr to from the RMM.
>> Changes from v5:
>>   * Handle RMM providing fewer GIC LRs than the hardware supports.
>> ---
>>   arch/arm64/include/asm/kvm_rme.h |  1 +
>>   arch/arm64/kvm/arm.c             | 16 +++++++++--
>>   arch/arm64/kvm/rme.c             |  5 ++++
>>   arch/arm64/kvm/vgic/vgic-init.c  |  2 +-
>>   arch/arm64/kvm/vgic/vgic-v3.c    |  6 +++-
>>   arch/arm64/kvm/vgic/vgic.c       | 49 ++++++++++++++++++++++++++++++--
>>   6 files changed, 72 insertions(+), 7 deletions(-)
>>
> 
> ...
> 
>> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/
>> vgic-init.c
>> index eb1205654ac8..77b4962ebfb6 100644
>> --- a/arch/arm64/kvm/vgic/vgic-init.c
>> +++ b/arch/arm64/kvm/vgic/vgic-init.c
>> @@ -81,7 +81,7 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>>        * the proper checks already.
>>        */
>>       if (type == KVM_DEV_TYPE_ARM_VGIC_V2 &&
>> -        !kvm_vgic_global_state.can_emulate_gicv2)
>> +        (!kvm_vgic_global_state.can_emulate_gicv2 || kvm_is_realm(kvm)))
>>           return -ENODEV;
>>         /*
>> diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-
>> v3.c
>> index b9ad7c42c5b0..c10ad817030d 100644
>> --- a/arch/arm64/kvm/vgic/vgic-v3.c
>> +++ b/arch/arm64/kvm/vgic/vgic-v3.c
>> @@ -8,9 +8,11 @@
>>   #include <linux/kvm_host.h>
>>   #include <linux/string_choices.h>
>>   #include <kvm/arm_vgic.h>
>> +#include <asm/kvm_emulate.h>
>>   #include <asm/kvm_hyp.h>
>>   #include <asm/kvm_mmu.h>
>>   #include <asm/kvm_asm.h>
>> +#include <asm/rmi_smc.h>
>>     #include "vgic.h"
>>   @@ -758,7 +760,9 @@ void vgic_v3_put(struct kvm_vcpu *vcpu)
>>           return;
>>       }
>>   -    if (likely(!is_protected_kvm_enabled()))
>> +    if (vcpu_is_rec(vcpu))
>> +        cpu_if->vgic_vmcr = vcpu->arch.rec.run->exit.gicv3_vmcr;
>> +    else if (likely(!is_protected_kvm_enabled()))
> 
> This function is never reached for Realms, this should be folded in
> vgic_rmm_save_state(). See below.

Good catch - I can drop the changes in this file and handle VMCR in
vgic_rmm_save_state().

Thanks,
Steve

> 
>>           kvm_call_hyp(__vgic_v3_save_vmcr_aprs, cpu_if);
>>       WARN_ON(vgic_v4_put(vcpu));
>>   diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
>> index c7aed48c5668..2908b4610c4e 100644
>> --- a/arch/arm64/kvm/vgic/vgic.c
>> +++ b/arch/arm64/kvm/vgic/vgic.c
> 
> ...
> 
>>   void kvm_vgic_put(struct kvm_vcpu *vcpu)
>>   {
>> -    if (unlikely(!irqchip_in_kernel(vcpu->kvm) || !
>> vgic_initialized(vcpu->kvm))) {
>> +    if (unlikely(vcpu_is_rec(vcpu)))
>> +        return;
> 
> ^^^
> 
>> +    if (unlikely(!irqchip_in_kernel(vcpu->kvm) ||
>> +             !vgic_initialized(vcpu->kvm))) {
>>           if (has_vhe() &&
>> static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
>>               __vgic_v3_deactivate_traps(&vcpu->arch.vgic_cpu.vgic_v3);
>>           return;
> 
> Suzuki


