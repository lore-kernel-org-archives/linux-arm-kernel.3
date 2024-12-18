Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EA7E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li5R6vevjRE5OxFtPQE9fmsMNAZdQaHm6Xwf/akR3CM=; b=FWFa8wRKyuuWKUzLZFPEx5TSgv
	JTRrZstmp9MJKhd8E8DP7G4/1atfWa3BZaahDokp0f9yuQciq+v+FOq4gfvizBV49ktiJe8gXLY5T
	9HM5/vXdDTF9zAedyTpGaLpXv1ITpWylYNvjdshK2u4c1Sj5z0NGkKKFCKisSTLfe14BUeGFq9hm3
	qWEOw0dyE4qVikQJGzqIc/Ce79hXjMJsvtCRvPZE2dYJe9f7CPt1ldH4xkkg4FKXvT9xy0aR4+pE9
	DyyHkK/6M89QdjLz/tkDg/tvPbm0kD3Vwb/NL5db3rG3cexEMkktJ2hGsygBniiV9eI/8ASf2ZX1+
	TrrDmEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrRr-0000000GHwT-2j1J;
	Wed, 18 Dec 2024 10:38:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrQl-0000000GHhf-1UOQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:37:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53D26FEC;
	Wed, 18 Dec 2024 02:37:54 -0800 (PST)
Received: from [10.163.50.37] (unknown [10.163.50.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4226E3F720;
	Wed, 18 Dec 2024 02:37:23 -0800 (PST)
Message-ID: <ca5d8db3-b980-464f-8069-86bf769128e0@arm.com>
Date: Wed, 18 Dec 2024 16:07:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V2 46/46] KVM: arm64: nv: Add trap forwarding for
 FEAT_FGT2 described registers
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-47-anshuman.khandual@arm.com>
 <87frmvsya0.wl-maz@kernel.org>
Content-Language: en-US
In-Reply-To: <87frmvsya0.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_023727_483851_721AC965 
X-CRM114-Status: GOOD (  25.16  )
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

On 12/10/24 14:35, Marc Zyngier wrote:
> On Tue, 10 Dec 2024 05:53:11 +0000,
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>
>> Describe remaining MDCR_EL2 register, and associate that with all FEAT_FGT2
>> exposed system registers it allows to trap.
> 
> MDCR_EL2 register *bits*? How is that related to FGT2 at all?
> 
>>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Oliver Upton <oliver.upton@linux.dev>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: kvmarm@lists.linux.dev
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> Changes in V2:
>>
>> - Dropped check_cntr_accessible_N and CGT_CNTR_ACCESSIBLE_N constructs
>> - SYS_PMEVCNTSVR_EL1(N) access traps have been forwarded to CGT_MDCR_HPMN
>> - Updated check_mdcr_hpmn() to handle SYS_PMEVCNTSVR_EL1(N) registers
>> - Changed behaviour as BEHAVE_FORWARD_RW for CGT_MDCR_EnSPM
>>
>>  arch/arm64/include/asm/kvm_host.h |   2 +
>>  arch/arm64/kvm/emulate-nested.c   | 158 ++++++++++++++++++++++++++++++
>>  2 files changed, 160 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index c80c07be3358..4cdce62642d1 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -441,6 +441,7 @@ enum vcpu_sysreg {
>>  	PMINTENSET_EL1,	/* Interrupt Enable Set Register */
>>  	PMOVSSET_EL0,	/* Overflow Flag Status Set Register */
>>  	PMUSERENR_EL0,	/* User Enable Register */
>> +	SPMSELR_EL0,	/* System PMU Select Register */
> 
> How could a system PMU be relevant to a VM?  What is the point of
> bloating the vcpu for something that we will hopefully *never* make
> visible to guests?
> 
>>  
>>  	/* Pointer Authentication Registers in a strict increasing order. */
>>  	APIAKEYLO_EL1,
>> @@ -501,6 +502,7 @@ enum vcpu_sysreg {
>>  	CNTHP_CVAL_EL2,
>>  	CNTHV_CTL_EL2,
>>  	CNTHV_CVAL_EL2,
>> +	SPMACCESSR_EL2, /* System PMU Access Register */
> 
> Same here. It is pretty striking that these registers are never
> saved/restored or handled as traps, which is a good indication that
> this is pretty pointless.
> 
>>  
>>  	/* Anything from this can be RES0/RES1 sanitised */
>>  	MARKER(__SANITISED_REG_START__),
>> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
>> index 6c63cbfc11ea..c7d6d2034f27 100644
>> --- a/arch/arm64/kvm/emulate-nested.c
>> +++ b/arch/arm64/kvm/emulate-nested.c
>> @@ -79,6 +79,7 @@ enum cgt_group_id {
>>  	CGT_MDCR_TDRA,
>>  	CGT_MDCR_E2PB,
>>  	CGT_MDCR_TPMS,
>> +	CGT_MDCR_EnSPM,
>>  	CGT_MDCR_TTRF,
>>  	CGT_MDCR_E2TB,
>>  	CGT_MDCR_TDCC,
>> @@ -125,6 +126,7 @@ enum cgt_group_id {
>>  	CGT_CNTHCTL_EL1PCTEN = __COMPLEX_CONDITIONS__,
>>  	CGT_CNTHCTL_EL1PTEN,
>>  
>> +	CGT_SPMSEL_SPMACCESS,
>>  	CGT_CPTR_TTA,
>>  	CGT_MDCR_HPMN,
>>  
>> @@ -351,6 +353,12 @@ static const struct trap_bits coarse_trap_bits[] = {
>>  		.mask		= MDCR_EL2_TPMS,
>>  		.behaviour	= BEHAVE_FORWARD_RW,
>>  	},
>> +	[CGT_MDCR_EnSPM] = {
>> +		.index		= MDCR_EL2,
>> +		.value		= MDCR_EL2_EnSPM,
>> +		.mask		= MDCR_EL2_EnSPM,
>> +		.behaviour	= BEHAVE_FORWARD_RW,
>> +	},
>>  	[CGT_MDCR_TTRF] = {
>>  		.index		= MDCR_EL2,
>>  		.value		= MDCR_EL2_TTRF,
>> @@ -509,6 +517,7 @@ static enum trap_behaviour check_mdcr_hpmn(struct kvm_vcpu *vcpu)
>>  	switch (sysreg) {
>>  	case SYS_PMEVTYPERn_EL0(0) ... SYS_PMEVTYPERn_EL0(30):
>>  	case SYS_PMEVCNTRn_EL0(0) ... SYS_PMEVCNTRn_EL0(30):
>> +	case SYS_PMEVCNTSVR_EL1(0) ... SYS_PMEVCNTSVR_EL1(30):
>>  		idx = (sys_reg_CRm(sysreg) & 0x3) << 3 | sys_reg_Op2(sysreg);
>>  		break;
>>  	case SYS_PMXEVTYPER_EL0:
>> @@ -528,6 +537,22 @@ static enum trap_behaviour check_mdcr_hpmn(struct kvm_vcpu *vcpu)
>>  	return BEHAVE_HANDLE_LOCALLY;
>>  }
>>  
>> +static enum trap_behaviour check_spmsel_spmaccess(struct kvm_vcpu *vcpu)
>> +{
>> +	u64 spmaccessr_el2, spmselr_el2;
>> +	int syspmusel;
>> +
>> +	if (__vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_EnSPM) {
> 
> I don't mind the test, but I don't see any sanitising of MDCR_EL2 to
> make EnSPM as RES0 when FEAT_SPMU is not implemented, which will be
> 100% of the cases.
> 
>> +		spmselr_el2 = __vcpu_sys_reg(vcpu, SPMSELR_EL0);
>> +		spmaccessr_el2 = __vcpu_sys_reg(vcpu, SPMACCESSR_EL2);
> 
> So these two values are *guaranteed* to be zero. At this stage, what
> is the point?
> 
>> +		syspmusel = FIELD_GET(SPMSELR_EL0_SYSPMUSEL_MASK, spmselr_el2);
>> +
>> +		if (((spmaccessr_el2 >> (syspmusel * 2)) & 0x3) == 0x0)
>> +			return BEHAVE_FORWARD_RW;
> 
> What about value 0b01, which causes *writes* to be trapped?
> 
>> +	}
>> +	return BEHAVE_HANDLE_LOCALLY;
> 
> And then what? How do we handle this locally?
> 
> Honestly, short of any additional handling, we would be better off
> just injecting an UNDEF back into the guest.
> 
> 	M.
> 

Hello Marc,

Thanks for your review and apologies for the delayed response. I am still
processing some of your review comments, and need some more time to fully
understand them in the given context. I will get back to you after doing
some more reading.

- Anshuman

