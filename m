Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5EDD2AB0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlLCuXhRDLIckFG+1uvlZDttUywThvQZ7Xu2LWa1Rbo=; b=R/ICM1Yut2XPvndpF37Vcpckkl
	eC3E+k92vbukHMK/NF1NlehR4SsaA9f7eZ+sBHXcUqbTY9nhWcsXXpny28xx6Fy3BOtaqlQQyAu0e
	vggG04PQrbuHAFM53VTiSKXYLUUdBz4JU6n86polSjrfWIt9LqVXG/4wOj14LlOvUuYJmLYdUMNFW
	py6Oo1ub/tK2fD9xzshYjslnbHxVDEGo2MPECkMUcV+CooUVm6KaYbOdD86iFGJbyyQOlekFnvT+8
	Qll5bk32gy3xMbimKfGSdBy/oXV2qVAgomMYcLRBMrTKWFWlyr4nv+NholI6O+yaFpaMB7VqYqxPh
	SKPBsm/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ipH-0000000DusQ-2O8Q;
	Tue, 29 Oct 2024 09:47:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ind-0000000Duh4-3jNm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 09:46:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1422497;
	Tue, 29 Oct 2024 02:46:33 -0700 (PDT)
Received: from [10.163.43.192] (unknown [10.163.43.192])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F8283F528;
	Tue, 29 Oct 2024 02:46:00 -0700 (PDT)
Message-ID: <b85dcdc2-d56d-4bf7-9fa9-222a6f057674@arm.com>
Date: Tue, 29 Oct 2024 15:15:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/18] KVM: arm64: nv: Reinject traps that take effect
 in Host EL0
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
 <20241025182354.3364124-9-oliver.upton@linux.dev>
 <87r083th7m.wl-maz@kernel.org> <Zxz-LocgUKuzE3t0@linux.dev>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Zxz-LocgUKuzE3t0@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_024606_057664_65304AFA 
X-CRM114-Status: GOOD (  19.16  )
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



On 10/26/24 20:05, Oliver Upton wrote:
> Hey,
> 
> On Sat, Oct 26, 2024 at 09:13:17AM +0100, Marc Zyngier wrote:
>> On Fri, 25 Oct 2024 19:23:43 +0100,
>> Oliver Upton <oliver.upton@linux.dev> wrote:
>>>
>>> Wire up the other end of traps that affect host EL0 by actually
>>> injecting them into the guest hypervisor. Skip over FGT entirely, as a
>>> cursory glance suggests no FGT is effective in host EL0.
>>
>> Yes, and this (thankfully) is by design! :-)
>>
>>>
>>> Note that kvm_inject_nested() is already equipped for handling
>>> exceptions while the VM is already in a host context.
>>>
>>> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
>>> ---
>>>  arch/arm64/include/asm/kvm_emulate.h |  5 +++++
>>>  arch/arm64/kvm/emulate-nested.c      | 29 ++++++++++++++++++++++++----
>>>  2 files changed, 30 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
>>> index a601a9305b10..bf0c48403f59 100644
>>> --- a/arch/arm64/include/asm/kvm_emulate.h
>>> +++ b/arch/arm64/include/asm/kvm_emulate.h
>>> @@ -225,6 +225,11 @@ static inline bool is_hyp_ctxt(const struct kvm_vcpu *vcpu)
>>>  	return vcpu_has_nv(vcpu) && __is_hyp_ctxt(&vcpu->arch.ctxt);
>>>  }
>>>  
>>> +static inline bool vcpu_is_host_el0(const struct kvm_vcpu *vcpu)
>>> +{
>>> +	return is_hyp_ctxt(vcpu) && !vcpu_is_el2(vcpu);
>>> +}
>>> +
>>>  /*
>>>   * The layout of SPSR for an AArch32 state is different when observed from an
>>>   * AArch64 SPSR_ELx or an AArch32 SPSR_*. This function generates the AArch32
>>> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
>>> index e1a30d1bcd06..db3149379a4d 100644
>>> --- a/arch/arm64/kvm/emulate-nested.c
>>> +++ b/arch/arm64/kvm/emulate-nested.c
>>> @@ -20,6 +20,9 @@ enum trap_behaviour {
>>>  	BEHAVE_FORWARD_READ	= BIT(0),
>>>  	BEHAVE_FORWARD_WRITE	= BIT(1),
>>>  	BEHAVE_FORWARD_RW	= BEHAVE_FORWARD_READ | BEHAVE_FORWARD_WRITE,
>>> +
>>> +	/* Traps that take effect in Host EL0, this is rare! */
>>> +	BEHAVE_IN_HOST_EL0	= BIT(2),
>>
>> nit: BEHAVE_IN_HOST_EL0 lacks an action verb (forward?).
> 
> Thinking I'll squash this in (plus renaming in later patches):

Right, the following additional replacements are required for build.


@@ -307,14 +307,14 @@ static const struct trap_bits coarse_trap_bits[] = {
                .value          = MDCR_EL2_TPMCR,
                .mask           = MDCR_EL2_TPMCR,
                .behaviour      = BEHAVE_FORWARD_RW |
-                                 BEHAVE_IN_HOST_EL0,
+                                 BEHAVE_FORWARD_IN_HOST_EL0,
        },
        [CGT_MDCR_TPM] = {
                .index          = MDCR_EL2,
                .value          = MDCR_EL2_TPM,
                .mask           = MDCR_EL2_TPM,
                .behaviour      = BEHAVE_FORWARD_RW |
-                                 BEHAVE_IN_HOST_EL0,
+                                 BEHAVE_FORWARD_IN_HOST_EL0,
        },
        [CGT_MDCR_TDE] = {
                .index          = MDCR_EL2,
@@ -530,7 +530,7 @@ static enum trap_behaviour check_mdcr_hpmn(struct kvm_vcpu *vcpu)
        }
 
        if (kvm_pmu_counter_is_hyp(vcpu, idx))
-               return BEHAVE_FORWARD_RW | BEHAVE_IN_HOST_EL0;
+               return BEHAVE_FORWARD_RW | BEHAVE_FORWARD_IN_HOST_EL0;
 
        return BEHAVE_HANDLE_LOCALLY;
 }

> 
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index db3149379a4d..b072098ee44e 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -22,7 +22,7 @@ enum trap_behaviour {
>  	BEHAVE_FORWARD_RW	= BEHAVE_FORWARD_READ | BEHAVE_FORWARD_WRITE,
>  
>  	/* Traps that take effect in Host EL0, this is rare! */
> -	BEHAVE_IN_HOST_EL0	= BIT(2),
> +	BEHAVE_FORWARD_IN_HOST_EL0	= BIT(2),
>  };
>  
>  struct trap_bits {
> @@ -2279,7 +2279,7 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
>  
>  	b = compute_trap_behaviour(vcpu, tc);
>  
> -	if (!(b & BEHAVE_IN_HOST_EL0) && vcpu_is_host_el0(vcpu))
> +	if (!(b & BEHAVE_FORWARD_IN_HOST_EL0) && vcpu_is_host_el0(vcpu))
>  		goto local;
>  
>  	if (((b & BEHAVE_FORWARD_READ) && is_read) ||
> 

