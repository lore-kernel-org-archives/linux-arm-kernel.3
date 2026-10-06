Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8B1CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 05:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOuQgu+oj36W8QWPHzIIopMaKPs4InkT99fDXQJw+1E=; b=wWHm2Xg/T2fWkTpCLgVUcl4VDi
	JNqFoNYLabemMu8GdlGghiMWweYuAfGFjGu2Ho/NlhJLZfkeqUw9eIrIwBMJB97cL2KbG49nPumX3
	OopCByJEQABrUxECjZKgl3ur2ElNuiGvSjsdEsysTw81gb/yjMWusqksoQ+AcJKNtnie3DPEDyzP7
	PWlZsqvCXXut5HUxNiYmN/nHrnbsdmNq4UN8aYuulNTOTUaV7EbiWKrcvDaXmupb0+iskUvGWdD0o
	wH1QD7xKb0Y1DVB7d7o3GpIZRIfn9IlLOdayAqKNVLUZDh4qCvfgHaLThrliPB91q3N42brYEr5os
	WQR1oLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxSE-000000003GR-0M2H;
	Tue, 06 Oct 2026 05:11:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxS8-000000003G3-1mjW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 05:11:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E68C1595;
	Mon,  5 Oct 2026 22:10:55 -0700 (PDT)
Received: from [10.57.10.233] (unknown [10.57.10.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23C9E3F763;
	Mon,  5 Oct 2026 22:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791263458; bh=7sWLZyvocBVUSF6JTvcAYmYuD+V3OBaqBlyyA8q87dM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cr88Q/26bT5Gh0PWAt9WHvtulW0F+N5GaLp/2i8swPFTfns4uo4cGLiUjssbfagej
	 eYbOgFbtChwzqnpd+EF4c8+hxKZPy4G2eQut0NNFdH/kuMN93NB2hZWotCH5dFrZmk
	 coZi9q3WXVFj5qIkj3MDPjMZdf/yW0wqyg8tPPys=
Message-ID: <05dbdd69-411f-40e2-a7fa-8651ce2a2556@arm.com>
Date: Tue, 6 Oct 2026 07:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 18/23] KVM: arm64: CCA: Introduce Realms
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-19-suzuki.poulose@arm.com>
 <9bbb3b3c-522f-4deb-9f32-0fcf731dd0bb@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <9bbb3b3c-522f-4deb-9f32-0fcf731dd0bb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_221100_920170_E8F1C2A7 
X-CRM114-Status: GOOD (  31.19  )
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

On 06/10/2026 04:42, Gavin Shan wrote:
> On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
>> From: Steven Price <steven.price@arm.com>
>>
>> Add foundational work for supporting Realms.
>>   - Add a new VM flavor.
>>   - At KVM init, check if the KVM can support Realms (though not 
>> functional
>>     yet) and will be advertised by static key kvm_rmi_is_available. This
>>     will be turned on in a later patches, once we have all the bits and
>>     pieces ready. For now check if we are blessed with KVM_MODE_RMM.
>>   - Add realm specific tracking in kvm_arch. Since Realm and protected 
>> pKVM
>>     states are mutually exclusive, move them into a union.
>>
>> Please note that we cannot create Realm VMs yet. This requires further
>> changes to the UABI and core RMI driver support, which will come later.
>>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/include/asm/kvm_emulate.h | 16 ++++++++
>>   arch/arm64/include/asm/kvm_host.h    | 19 ++++++---
>>   arch/arm64/include/asm/kvm_rmi.h     | 61 ++++++++++++++++++++++++++++
>>   arch/arm64/include/asm/virt.h        |  1 +
>>   arch/arm64/kvm/Makefile              |  2 +-
>>   arch/arm64/kvm/arm.c                 |  6 +++
>>   arch/arm64/kvm/mmu.c                 |  1 +
>>   arch/arm64/kvm/rmi.c                 | 18 ++++++++
>>   8 files changed, 118 insertions(+), 6 deletions(-)
>>   create mode 100644 arch/arm64/include/asm/kvm_rmi.h
>>   create mode 100644 arch/arm64/kvm/rmi.c
>>
>> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/ 
>> include/asm/kvm_emulate.h
>> index a3c1928bdf743..d360a8b05b8bf 100644
>> --- a/arch/arm64/include/asm/kvm_emulate.h
>> +++ b/arch/arm64/include/asm/kvm_emulate.h
>> @@ -793,4 +793,20 @@ static inline void kvm_reset_vcpu_psci(struct 
>> kvm_vcpu *vcpu,
>>       vcpu_set_reg(vcpu, 0, reset_state->r0);
>>   }
>> +static inline enum realm_state kvm_realm_state(struct kvm *kvm)
>> +{
>> +    return READ_ONCE(kvm->arch.realm.state);
>> +}
>> +
>> +static inline void kvm_set_realm_state(struct kvm *kvm,
>> +                       enum realm_state new_state)
>> +{
>> +    WRITE_ONCE(kvm->arch.realm.state, new_state);
>> +}
>> +
>> +static inline bool kvm_realm_is_created(struct kvm *kvm)
>> +{
>> +    return kvm_vm_is_realm(kvm) && kvm_realm_state(kvm) != 
>> REALM_STATE_NONE;
>> +}
>> +
>>   #endif /* __ARM64_KVM_EMULATE_H__ */
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/ 
>> asm/kvm_host.h
>> index dfa9d4ec61a76..3debffef638a4 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -27,6 +27,7 @@
>>   #include <asm/fpsimd.h>
>>   #include <asm/kvm.h>
>>   #include <asm/kvm_asm.h>
>> +#include <asm/kvm_rmi.h>
>>   #include <asm/vncr_mapping.h>
>>   #define __KVM_HAVE_ARCH_INTC_INITIALIZED
>> @@ -334,6 +335,7 @@ enum kvm_arm_vm_flavor {
>>       VM_PKVM,        /* Normal guests on pKVM */
>>       MARKER(__VM_PROTECTED),
>>       VM_PROTECTED_PKVM,    /* Protected VM */
>> +    VM_REALM,        /* CCA */
>>       VM_FLAVOR_MAX
>>   };
>> @@ -450,11 +452,14 @@ struct kvm_arch {
>>       /* Count the number of VNCR_EL2 TLBs */
>>       atomic_t vncr_tlb_count;
>> -    /*
>> -     * For an untrusted host VM, 'pkvm.handle' is used to lookup
>> -     * the associated pKVM instance in the hypervisor.
>> -     */
>> -    struct kvm_protected_vm pkvm;
>> +    union {
>> +        /*
>> +         * For an untrusted host VM, 'pkvm.handle' is used to lookup
>> +         * the associated pKVM instance in the hypervisor.
>> +         */
>> +        struct kvm_protected_vm pkvm;
>> +        struct realm realm;
>> +    };
>>   #ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
>>       /* Nested virtualization info */
>> @@ -1565,6 +1570,10 @@ struct kvm *kvm_arch_alloc_vm(void);
>>           (__kvm && kvm_vm_is_protected_pkvm(__kvm));        \
>>       })
>> +
>> +#define kvm_vm_is_realm(kvm)        ((kvm)->arch.vm_flavor == VM_REALM)
>> +#define vcpu_is_rec(vcpu)        kvm_vm_is_realm((vcpu)->kvm)
>> +
> 
> vcpu_is_rec() isn't safely called in nVHE hyp stub. So do we need add 
> something
> similiar to what we had for vcpu_is_protected(vcpu) in PATCH[05]?
> 
> #ifdef __KVM_NVHE_HYPERVISOR__
> /* vcpu_is_rec() isn't expected to called in nVHE hyp stub */
> #define vcpu_is_rec(vcpu)    BUILD_BUG_ON(1)
> #else
> #define vcpu_is_rec(vcpu)    kvm_vm_is_realm((vcpu)->kvm)
> #endif
> 
> 
>>   #define kvm_vm_hyp_is_distrusting(kvm)    ((kvm)->arch.vm_flavor >= 
>> __VM_DISTRUSTING_HYP)
>>   int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/ 
>> asm/kvm_rmi.h
>> new file mode 100644
>> index 0000000000000..44f5c75a27b5b
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>> @@ -0,0 +1,61 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2023-2026 ARM Ltd.
>> + */
>> +
>> +#ifndef __ASM_KVM_RMI_H
>> +#define __ASM_KVM_RMI_H
>> +
>> +/**
>> + * enum realm_state - State of a Realm
>> + *
>> + * Mirrors the RMM's Realm lifecycle states where they are meaningful 
>> to KVM,
>> + * with REALM_STATE_DYING being a KVM-internal state used to prevent 
>> further
>> + * requests while teardown is in progress. KVM does not track 
>> REALM_SYSTEM_OFF
>> + * or REALM_ZOMBIE separately as they naturally lead to teardown.
>> + */
>> +enum realm_state {
>> +    /**
>> +     * @REALM_STATE_NONE:
>> +     *      Realm has not yet been created. rmi_realm_create() has not
>> +     *      yet been called.
>> +     */
>> +    REALM_STATE_NONE,
>> +    /**
>> +     * @REALM_STATE_NEW:
>> +     *      Realm is under construction, rmi_realm_create() has been
>> +     *      called, but it is not yet activated. Pages may be populated.
>                                                       ^^^^^
> Granule instead of page is the term applicable to RMM. Lets use a generic
> term 'memory' here. Also, lets mention the name of the function used to
> populate the memory (granules), which is consistent to the comments for
> REALM_STATE_ACTIVE.
> 
>      Memory may be populated by rmi_rtt_data_map_init().
> 
> 
>> +     */
>> +    REALM_STATE_NEW,
>> +    /**
>> +     * @REALM_STATE_ACTIVE:
>> +     *      Realm has been created and is eligible for execution with
>> +     *      rmi_rec_enter(). Pages may no longer be populated with
>> +     *      rmi_data_create().
>> +     */
>> +    REALM_STATE_ACTIVE,
> 
> rmi_data_create() is an invalid function name.
> 
>      Memory can't longer be populated using rmi_rtt_data_map_init().

Ack, thanks for spotting, I will fix them.


Cheers
Suzuki

