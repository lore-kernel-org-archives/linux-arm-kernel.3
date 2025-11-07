Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4C1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 11:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkaLRxCs4IfF11xLh8Kr6XRWkf85dZ/76XTGQeaWAw4=; b=vvTCHCjyxnWpFvW1eo+lLytzdQ
	BQBDx0ycOpQivNIMk10YJsnJpNZsKDOILd8MHlPHv4huT7ZVj6FObt8rDACeK+58KLUPjG49JEHPF
	LI2EiWtXwTAAD0nF8VvvMOxj99CrP2g9Bsqm7EKdF/J/1P6YRqv0Z4b3TW/c8xWdlyNpD3nZRV7m0
	61pDK0lPgZsD/IA981SxEcXmv9QrWNx43WhNH0bW8hOuftDUL8ShkCQvEeyFSM2kOO/wqu4Dcaw2o
	MLxOSjUNEWB/zCRZ0tKMDU5M9lWO3fU93eHz8Fx2FnNumJfG/C3GKra9oB22iXPdJAImMW8w1N+wf
	l2VNAHIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKy1-0000000HFKR-092D;
	Fri, 07 Nov 2025 11:49:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKxw-0000000HFJ6-2EYj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:49:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55A9C1007;
	Fri,  7 Nov 2025 03:49:07 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C8D33F63F;
	Fri,  7 Nov 2025 03:49:13 -0800 (PST)
Message-ID: <75c46cdc-1843-4716-8f45-92c6c0b89248@arm.com>
Date: Fri, 7 Nov 2025 11:49:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] KVM: arm64: Add exit to userspace on {LD,ST}64B*
 outside of memslots
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Zhou Wang <wangzhou1@hisilicon.com>, catalin.marinas@arm.com,
 will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 yuzenghui@huawei.com, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 yangyccccc@gmail.com, prime.zeng@hisilicon.com, xuwei5@huawei.com
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
 <20251107072127.448953-2-wangzhou1@hisilicon.com>
 <1f0d24ae-c20c-4067-aa0c-b5bbeba367db@arm.com>
Content-Language: en-US
In-Reply-To: <1f0d24ae-c20c-4067-aa0c-b5bbeba367db@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_034916_980323_5B836BF7 
X-CRM114-Status: GOOD (  25.65  )
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

On 07/11/2025 11:48, Suzuki K Poulose wrote:
> On 07/11/2025 07:21, Zhou Wang wrote:
>> From: Marc Zyngier <maz@kernel.org>
>>
>> The main use of {LD,ST}64B* is to talk to a device, which is hopefully
>> directly assigned to the guest and requires no additional handling.
>>
>> However, this does not preclude a VMM from exposing a virtual device
>> to the guest, and to allow 64 byte accesses as part of the programming
>> interface. A direct consequence of this is that we need to be able
>> to forward such access to userspace.
>>
>> Given that such a contraption is very unlikely to ever exist, we choose
>> to offer a limited service: userspace gets (as part of a new exit reason)
>> the ESR, the IPA, and that's it. It is fully expected to handle the full
>> semantics of the instructions, deal with ACCDATA, the return values and
>> increment PC. Much fun.
>>
>> A canonical implementation can also simply inject an abort and be done
>> with it. Frankly, don't try to do anything else unless you have time
>> to waste.
>>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> 
> We also need to document this new EXIT reason here :
> 
> Documentation/virt/kvm/api.rst

Well, spoke too soon. Please ignore this part ;-)

> 
> 
>> ---
>>   arch/arm64/kvm/mmio.c    | 27 ++++++++++++++++++++++++++-
>>   include/uapi/linux/kvm.h |  3 ++-
>>   2 files changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
>> index 54f9358c9e0e..2a6261abb647 100644
>> --- a/arch/arm64/kvm/mmio.c
>> +++ b/arch/arm64/kvm/mmio.c
>> @@ -159,6 +159,9 @@ int io_mem_abort(struct kvm_vcpu *vcpu, 
>> phys_addr_t fault_ipa)
>>       bool is_write;
>>       int len;
>>       u8 data_buf[8];
>> +    u64 esr;
>> +
>> +    esr = kvm_vcpu_get_esr(vcpu);
>>       /*
>>        * No valid syndrome? Ask userspace for help if it has
>> @@ -168,7 +171,7 @@ int io_mem_abort(struct kvm_vcpu *vcpu, 
>> phys_addr_t fault_ipa)
>>        * though, so directly deliver an exception to the guest.
>>        */
>>       if (!kvm_vcpu_dabt_isvalid(vcpu)) {
>> -        trace_kvm_mmio_nisv(*vcpu_pc(vcpu), kvm_vcpu_get_esr(vcpu),
>> +        trace_kvm_mmio_nisv(*vcpu_pc(vcpu), esr,
>>                       kvm_vcpu_get_hfar(vcpu), fault_ipa);
>>           if (vcpu_is_protected(vcpu))
>> @@ -185,6 +188,28 @@ int io_mem_abort(struct kvm_vcpu *vcpu, 
>> phys_addr_t fault_ipa)
>>           return -ENOSYS;
>>       }
>> +    /*
>> +     * When (DFSC == 0b00xxxx || DFSC == 0b10101x) && DFSC != 0b0000xx
>> +     * ESR_EL2[12:11] describe the Load/Store Type. This allows us to
>> +     * punt the LD64B/ST64B/ST64BV/ST64BV0 instructions to luserspace,
> 
> minor nit: typo: s/luserspace/userspace/                       ^^^
> 
>> +     * which will have to provide a full emulation of these 4
>> +     * instructions.  No, we don't expect this do be fast.
>> +     *
>> +     * We rely on traps being set if the corresponding features are not
>> +     * enabled, so if we get here, userspace has promised us to handle
>> +     * it already.
>> +     */
>> +    switch (kvm_vcpu_trap_get_fault(vcpu)) {
>> +    case 0b000100 ... 0b001111:
>> +    case 0b101010 ... 0b101011:
> 
> Matches Arm ARM.
> 
>> +        if (FIELD_GET(GENMASK(12, 11), esr)) {
>> +            run->exit_reason = KVM_EXIT_ARM_LDST64B;
>> +            run->arm_nisv.esr_iss = esr & ~(u64)ESR_ELx_FSC;
> 
> Any particular reason why we diverge from the NISV case, where the FSC 
> is provided, but not here ? May be this needs to be documented too.
> 
> Suzuki
> 
> 
>> +            run->arm_nisv.fault_ipa = fault_ipa;
>> +            return 0;
>> +        }
>> +    }
>> +
>>       /*
>>        * Prepare MMIO operation. First decode the syndrome data we get
>>        * from the CPU. Then try if some in-kernel emulation feels
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index 52f6000ab020..d219946b96be 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -179,6 +179,7 @@ struct kvm_xen_exit {
>>   #define KVM_EXIT_LOONGARCH_IOCSR  38
>>   #define KVM_EXIT_MEMORY_FAULT     39
>>   #define KVM_EXIT_TDX              40
>> +#define KVM_EXIT_ARM_LDST64B      41
>>   /* For KVM_EXIT_INTERNAL_ERROR */
>>   /* Emulate instruction failed. */
>> @@ -401,7 +402,7 @@ struct kvm_run {
>>           } eoi;
>>           /* KVM_EXIT_HYPERV */
>>           struct kvm_hyperv_exit hyperv;
>> -        /* KVM_EXIT_ARM_NISV */
>> +        /* KVM_EXIT_ARM_NISV / KVM_EXIT_ARM_LDST64B */
>>           struct {
>>               __u64 esr_iss;
>>               __u64 fault_ipa;
> 
> 
> 


