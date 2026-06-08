Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC048CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 11:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B37rjZEV13Ov5otPeDKdfCNcEX12OjYtTPIZ/Vh7NfI=; b=JOUcRmTxRjZBEs6eozV/MFhIFh
	7aUYKbqktQNS0ig1SeW8DgsWkgjNuyIsLpHgTUC/lIhR+LbnJB49vaX0zn9VfYqmFH5cBy/B6/Uk2
	LnkOLpFrHX97i6eQb5UvN4kLiRsf0R/nYLb1HfCooJ5UeTBITpwULno/SNq1RrDfGtN7uc3jQaeV7
	g+n5vRh8Ql1fngJkM76cTnbrF5vVx8k3KtfbqZpjgrLZIl5akyZmBMca24ol+620TPttsxNQ8YbHU
	yGIRHVB2DHe0ByEV8/gnWw4PUccZvre7ZI9HMr41plrUkMhLLDGdpM1Fvoc/KittwlRiQKi8eIYoO
	CTUu1g5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXwn-00000003OuL-1aCI;
	Mon, 08 Jun 2026 11:15:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXwj-00000003Otp-0bmO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 11:15:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EE8E1C01;
	Mon,  8 Jun 2026 04:15:03 -0700 (PDT)
Received: from [10.57.28.93] (unknown [10.57.28.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45A3E3F86F;
	Mon,  8 Jun 2026 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780917307; bh=NT9SjpeSaUaPs6mTzZoOuRZvfOJboQptqNnZ7k1R9SE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MtCboeBzk2dAdFydLOFiNhb5EdBEEhdtHveoclXm8AKsDlHbycpAmJ59UFP3FGlhh
	 Ivseopd9E0d4YjveXKT6AvAyvQLVqub98b68CZwu3SNhMIpz58qZdaOQ1NYTky+TRI
	 uXM0L3c2EL5eG4QbslgeJ0pnOPt/ifx/77lB1ilM=
Message-ID: <a4a9abf8-0691-488a-b54d-4f1d1a2d89ed@arm.com>
Date: Mon, 8 Jun 2026 12:15:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 32/44] KVM: arm64: Handle Realm PSCI requests
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-33-steven.price@arm.com>
 <775a0d29-4d92-4ecc-96dd-5b0eaeff1528@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <775a0d29-4d92-4ecc-96dd-5b0eaeff1528@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_041509_337162_0CD0D795 
X-CRM114-Status: GOOD (  23.87  )
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

On 28/05/2026 07:55, Gavin Shan wrote:
> Hi Steve,
> 
> On 5/13/26 11:17 PM, Steven Price wrote:
>> The RMM needs to be informed of the target REC when a PSCI call is made
>> with an MPIDR argument.
>>
>> This requirement will be removed in a future release of the RMM 2.0
>> specification but is still required for v2.0-bet1.
>>
>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Chanegs since v13:
>>   * The ioctl KVM_ARM_VCPU_RMI_PSCI_COMPLETE has gone. The RMI call is
>>     made automatically just before entering the REC again.
>> Changes since v12:
>>   * Chance return code for non-realms to -ENXIO to better represent that
>>     the ioctl is invalid for non-realms (checkpatch is insistent that
>>     "ENOSYS means 'invalid syscall nr' and nothing else").
>> Changes since v11:
>>   * RMM->RMI renaming.
>> Changes since v6:
>>   * Use vcpu_is_rec() rather than kvm_is_realm(vcpu->kvm).
>>   * Minor renaming/formatting fixes.
>> ---
>>   arch/arm64/include/asm/kvm_rmi.h |  3 ++
>>   arch/arm64/kvm/psci.c            | 15 ++++++++-
>>   arch/arm64/kvm/rmi.c             | 58 ++++++++++++++++++++++++++++++++
>>   3 files changed, 75 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/
>> asm/kvm_rmi.h
>> index b65cfec10dee..eacf82a7467d 100644
>> --- a/arch/arm64/include/asm/kvm_rmi.h
>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>> @@ -109,6 +109,9 @@ int realm_map_non_secure(struct realm *realm,
>>                unsigned long size,
>>                enum kvm_pgtable_prot prot,
>>                struct kvm_mmu_memory_cache *memcache);
>> +int realm_psci_complete(struct kvm_vcpu *source,
>> +            struct kvm_vcpu *target,
>> +            unsigned long status);
>>     static inline bool kvm_realm_is_private_address(struct realm *realm,
>>                           unsigned long addr)
>> diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
>> index 3b5dbe9a0a0e..a2cd55dc7b5b 100644
>> --- a/arch/arm64/kvm/psci.c
>> +++ b/arch/arm64/kvm/psci.c
>> @@ -103,7 +103,6 @@ static unsigned long kvm_psci_vcpu_on(struct
>> kvm_vcpu *source_vcpu)
>>         reset_state->reset = true;
>>       kvm_make_request(KVM_REQ_VCPU_RESET, vcpu);
>> -
> 
> This change isn't supposed to be part of this patch :-)

Whoops - indeed it isn't!

>>       /*
>>        * Make sure the reset request is observed if the RUNNABLE
>> mp_state is
>>        * observed.
>> @@ -142,6 +141,20 @@ static unsigned long
>> kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
>>       /* Ignore other bits of target affinity */
>>       target_affinity &= target_affinity_mask;
>>   +    if (vcpu_is_rec(vcpu)) {
>> +        struct kvm_vcpu *target_vcpu;
>> +
>> +        /* RMM supports only zero affinity level */
>> +        if (lowest_affinity_level != 0)
>> +            return PSCI_RET_INVALID_PARAMS;
>> +
>> +        target_vcpu = kvm_mpidr_to_vcpu(kvm, target_affinity);
>> +        if (!target_vcpu)
>> +            return PSCI_RET_INVALID_PARAMS;
>> +
>> +        return PSCI_RET_SUCCESS;
>> +    }
>> +
>>       /*
>>        * If one or more VCPU matching target affinity are running
>>        * then ON else OFF
>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>> index 761b38a4071c..2b03e962ee41 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -3,6 +3,7 @@
>>    * Copyright (C) 2023-2025 ARM Ltd.
>>    */
>>   +#include <uapi/linux/psci.h>
>>   #include <linux/kvm_host.h>
>>     #include <asm/kvm_emulate.h>
>> @@ -127,6 +128,25 @@ static void free_rtt(phys_addr_t phys)
>>       kvm_account_pgtable_pages(phys_to_virt(phys), -1);
>>   }
>>   +int realm_psci_complete(struct kvm_vcpu *source, struct kvm_vcpu
>> *target,
>> +            unsigned long status)
>> +{
>> +    int ret;
>> +
>> +    /*
>> +     * XXX: RMM-v2.0 doesn't require the target REC address for
>> completing
>> +     * PSCI requests. Temporary hack until RMM implementation catches up
>> +     * to the full spec.
>> +     */
>> +    ret = rmi_psci_complete(virt_to_phys(source->arch.rec.rec_page),
>> +                virt_to_phys(target->arch.rec.rec_page),
>> +                status);
>> +    if (ret)
>> +        return -EINVAL;
> 
>         return -ENXIO;

Ack, although as the comment says this should be going away.

Thanks,
Steve

>> +
>> +    return 0;
>> +}
>> +
>>   static int realm_rtt_create(struct realm *realm,
>>                   unsigned long addr,
>>                   int level,
>> @@ -1004,6 +1024,41 @@ static void kvm_complete_ripas_change(struct
>> kvm_vcpu *vcpu)
>>       rec->run->exit.ripas_base = base;
>>   }
>>   +static void kvm_rec_complete_psci(struct kvm_vcpu *vcpu)
>> +{
>> +    struct rec_run *run = vcpu->arch.rec.run;
>> +    unsigned long status = PSCI_RET_DENIED;
>> +    unsigned long ret = vcpu_get_reg(vcpu, 0);
>> +    struct kvm_vcpu *target;
>> +
>> +    switch (run->exit.gprs[0]) {
>> +    /*
>> +     * XXX: RMM-v2.0 doesn't cause RMI_EXIT_PSCI for AFFINITY_INFO
>> +     * Temporary hack until tf-RMM gets the REC to MPIDR mapping via
>> +     * RD Auxiliary granules.
>> +     * For now always report SUCCESS
>> +     */
>> +    case PSCI_0_2_FN64_AFFINITY_INFO:
>> +        status = PSCI_RET_SUCCESS;
>> +        break;
>> +    case PSCI_0_2_FN64_CPU_ON: {
>> +        if (ret != PSCI_RET_SUCCESS &&
>> +            ret != PSCI_RET_ALREADY_ON)
>> +            status = PSCI_RET_DENIED;
>> +        else
>> +            status = PSCI_RET_SUCCESS;
>> +        break;
>> +    }
>> +    default:
>> +        return;
>> +    }
>> +
>> +    target = kvm_mpidr_to_vcpu(vcpu->kvm, run->exit.gprs[1]);
>> +    /* RMM makes sure that we don't get RMI_EXIT_PSCI for invalid
>> mpidrs */
>> +    if (target)
>> +        realm_psci_complete(vcpu, target, status);
>> +}
>> +
>>   /*
>>    * kvm_rec_pre_enter - Complete operations before entering a REC
>>    *
>> @@ -1028,6 +1083,9 @@ int kvm_rec_pre_enter(struct kvm_vcpu *vcpu)
>>           for (int i = 0; i < REC_RUN_GPRS; i++)
>>               rec->run->enter.gprs[i] = vcpu_get_reg(vcpu, i);
>>           break;
>> +    case RMI_EXIT_PSCI:
>> +        kvm_rec_complete_psci(vcpu);
>> +        break;
>>       case RMI_EXIT_RIPAS_CHANGE:
>>           kvm_complete_ripas_change(vcpu);
>>           break;
> 
> Thanks,
> Gavin
> 


