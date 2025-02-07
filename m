Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ECEC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZER/0bGmKO5+934+OgH33nuVn7+k3Ze3r1AgNT3PSY=; b=Nod58iE6MhihvZoWvy+dMRCSKF
	4gmCURnOCQ5ZAyby40IKhEJVQomsEbQU5iuZ/qE11ME7nRPRBzDufqN57HqdnVerzfbIG/8xILRrm
	A+hcrmVbVMxA7eyL/h4MZK9fPuChjbQK5cBhEBU/T73+wXkv9TmYuFwhGZUHjoPzSTZhum6ORCV19
	2Fg1pMKzFhvpgpUTxViRDzOWXbNXZMrWG7kx/81X42gq4wEWK1yXFQ4oZ/X+8UdtA48X4UNAsN3Rg
	kMBGs9FeORhaH4/jEOBZIUWoig5L6L6e3AagZld+Cl0bypIyBOATkN/oL44xBaRrPnw7RSeS1XQ67
	XBFAKQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSCi-0000000AV9o-2nYr;
	Fri, 07 Feb 2025 17:31:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRmq-0000000APXN-1DtS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:05:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4675113E;
	Fri,  7 Feb 2025 09:05:25 -0800 (PST)
Received: from [10.1.26.24] (e122027.cambridge.arm.com [10.1.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CDBA3F63F;
	Fri,  7 Feb 2025 09:04:58 -0800 (PST)
Message-ID: <26f0f242-2fc1-45cf-a078-8079832bff32@arm.com>
Date: Fri, 7 Feb 2025 17:04:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 22/43] KVM: arm64: Validate register access for a Realm
 VM
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-23-steven.price@arm.com>
 <09f42dc3-9c43-49ef-b4eb-8aeab387f0fd@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <09f42dc3-9c43-49ef-b4eb-8aeab387f0fd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_090504_423735_C5D9EB22 
X-CRM114-Status: GOOD (  21.63  )
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

On 02/02/2025 01:22, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
>> The RMM only allows setting the GPRS (x0-x30) and PC for a realm
>> guest. Check this in kvm_arm_set_reg() so that the VMM can receive a
>> suitable error return if other registers are accessed.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v5:
>>   * Upper GPRS can be set as part of a HOST_CALL return, so fix up the
>>     test to allow them.
>> ---
>>   arch/arm64/kvm/guest.c | 43 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>> index 12dad841f2a5..1ee2fe072f1a 100644
>> --- a/arch/arm64/kvm/guest.c
>> +++ b/arch/arm64/kvm/guest.c
>> @@ -73,6 +73,24 @@ static u64 core_reg_offset_from_id(u64 id)
>>       return id & ~(KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK |
>> KVM_REG_ARM_CORE);
>>   }
>>   +static bool kvm_realm_validate_core_reg(u64 off)
>> +{
>> +    /*
>> +     * Note that GPRs can only sometimes be controlled by the VMM.
>> +     * For PSCI only X0-X6 are used, higher registers are ignored
>> (restored
>> +     * from the REC).
>> +     * For HOST_CALL all of X0-X30 are copied to the RsiHostCall
>> structure.
>> +     * For emulated MMIO X0 is always used.
>> +     */
>> +    switch (off) {
>> +    case KVM_REG_ARM_CORE_REG(regs.regs[0]) ...
>> +         KVM_REG_ARM_CORE_REG(regs.regs[30]):
>> +    case KVM_REG_ARM_CORE_REG(regs.pc):
>> +        return true;
>> +    }
>> +    return false;
>> +}
>> +
>>   static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu,
>> u64 off)
>>   {
>>       int size;
>> @@ -115,6 +133,9 @@ static int core_reg_size_from_offset(const struct
>> kvm_vcpu *vcpu, u64 off)
>>       if (vcpu_has_sve(vcpu) && core_reg_offset_is_vreg(off))
>>           return -EINVAL;
>>   +    if (kvm_is_realm(vcpu->kvm) && !kvm_realm_validate_core_reg(off))
>> +        return -EPERM;
>> +
>>       return size;
>>   }
>>   @@ -783,12 +804,34 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu,
>> const struct kvm_one_reg *reg)
>>       return kvm_arm_sys_reg_get_reg(vcpu, reg);
>>   }
>>   +/*
>> + * The RMI ABI only enables setting some GPRs and PC. The selection
>> of GPRs
>> + * that are available depends on the Realm state and the reason for
>> the last
>> + * exit.  All other registers are reset to architectural or otherwise
>> defined
>> + * reset values by the RMM, except for a few configuration fields that
>> + * correspond to Realm parameters.
>> + */
>> +static bool validate_realm_set_reg(struct kvm_vcpu *vcpu,
>> +                   const struct kvm_one_reg *reg)
>> +{
>> +    if ((reg->id & KVM_REG_ARM_COPROC_MASK) == KVM_REG_ARM_CORE) {
>> +        u64 off = core_reg_offset_from_id(reg->id);
>> +
>> +        return kvm_realm_validate_core_reg(off);
>> +    }
>> +
>> +    return false;
>> +}
>> +
>>   int kvm_arm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg
>> *reg)
>>   {
>>       /* We currently use nothing arch-specific in upper 32 bits */
>>       if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
>>           return -EINVAL;
>>   +    if (kvm_is_realm(vcpu->kvm) && !validate_realm_set_reg(vcpu, reg))
>> +        return -EINVAL;
>> +
>>       switch (reg->id & KVM_REG_ARM_COPROC_MASK) {
>>       case KVM_REG_ARM_CORE:    return set_core_reg(vcpu, reg);
>>       case KVM_REG_ARM_FW:
> 
> It looks the core registers in kvm_arm_set_reg() has been validated for
> twice.
> 
>   ioctl(KVM_SET_ONE_REG)
>     kvm_arm_set_reg
>       validate_realm_set_reg
>         kvm_realm_validate_core_reg        // 1
>       set_core_reg
>         core_reg_offset_from_id
>         core_reg_addr
>           core_reg_offset_from_id
>           core_reg_size_from_offset
>             kvm_realm_validate_core_reg    // 2
>         copy_from_user

Indeed, it looks like the check in core_reg_size_from_offset() is
unnecessary.

> Besides, there are other types of registers that can be accessed by
> KVM_{GET, SET}_ONE_REG:
> firmware and bitmap registers, SVE registers, timer registers, system
> registers. Need we
> to hide any of them from the user space? As I can understand, the SVE
> registers are owned
> by RMM at least and won't be exposed to user space.

validate_realm_set_reg() only allows core registers permitted by
kvm_realm_validate_core_reg() (x0-x30+pc) and the three other
specifically mentioned registers (PMCR_EL0, ID_AA64DFR0_EL1 and the
pseudo register SVE_VLS).

In general most registers are hidden from the host (and user space),
even the general purpose registers are in most contexts stale. The only
real exception is during realm creation and PSCI. The registers are also
(ab)used during MMIO and HOST_CALL. For MMIO we use x0 for the value to
be read/written (even if the guest used a different register). For
HOST_CALL the guest provides a structure containing the values to be
placed in the GPRS (but the actual values of the guest's registers are
not exposed).

Steve


