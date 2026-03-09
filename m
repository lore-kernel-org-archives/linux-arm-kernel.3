Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1B9EFCD7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RHpK30neIqepetp2RT3PY2ULXSypvSofoCSWiwPbz0=; b=U4eEOrPXqxVNQtaHf51EnifyyX
	beZfdozZ+qN85dQhLah7aQD1YsreftuG+zDkYNTst1xfThMq6Vkjbo/zXoSWAdU3yw6AF2+nnna3O
	RndkVdiiHcyVxvE0WfxFAGB3QNh6YhjPOq+be2XGdGCeAaIDrW3dFrCitFXvbuER3wt6Z+kSIv0KS
	DBbO5izMAR4wtBqgbjJbJcxLjCBMbPnAoxDyPva1P6DZlaC7OmkcZx/ipWCP/1KvHZHzTCTpjEcGB
	/8gRSVjSpMztPVrBihbCqE96IeNRyAa/6vpCDbYr5xX0qwifIbofLEPyCySLlR0v/O/jWEZ9fUkqY
	A9OIWlvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXcA-000000073yy-40sM;
	Mon, 09 Mar 2026 10:13:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXc8-000000073yC-4BL4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:13:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E8231570;
	Mon,  9 Mar 2026 03:13:18 -0700 (PDT)
Received: from [10.1.30.140] (e121487-lin.cambridge.arm.com [10.1.30.140])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBD2A3F7BD;
	Mon,  9 Mar 2026 03:13:22 -0700 (PDT)
Message-ID: <c4a302df-511b-40b2-97f2-06576748c999@arm.com>
Date: Mon, 9 Mar 2026 10:13:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: errata: Work around early CME DVMSync
 acknowledgement
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, James Morse <james.morse@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>,
 kvmarm@lists.linux.dev
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-4-catalin.marinas@arm.com>
 <aamT6-Mvr9nI1unq@willie-the-truck> <aarB3iv8963UDn5E@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <aarB3iv8963UDn5E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_031329_193629_A448964B 
X-CRM114-Status: GOOD (  16.90  )
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

Hi All,

On 3/6/26 12:00, Catalin Marinas wrote:
>>> @@ -1358,6 +1360,85 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
>>>  	put_cpu_fpsimd_context();
>>>  }
>>>  
>>> +#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
>>> +
>>> +/*
>>> + * SME/CME erratum handling
>>> + */
>>> +static cpumask_var_t sme_dvmsync_cpus;
>>> +static cpumask_var_t sme_active_cpus;
>>> +
>>> +void sme_set_active(unsigned int cpu)
>>> +{
>>> +	if (!cpus_have_final_cap(ARM64_WORKAROUND_SME_DVMSYNC))
>>> +		return;
>>> +	if (!cpumask_test_cpu(cpu, sme_dvmsync_cpus))
>>> +		return;
>>> +
>>> +	if (!test_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags))
>>> +		set_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags);
>>> +
>>> +	cpumask_set_cpu(cpu, sme_active_cpus);
>>> +
>>> +	/*
>>> +	 * Ensure subsequent (SME) memory accesses are observed after the
>>> +	 * cpumask and the MMCF_SME_DVMSYNC flag setting.
>>> +	 */
>>> +	smp_mb();
>> I can't convince myself that a DMB is enough here, as the whole issue
>> is that the SME memory accesses can be observed _after_ the TLB
>> invalidation. I'd have thought we'd need a DSB to ensure that the flag
>> updates are visible before the exception return.
> This is only to ensure that the sme_active_cpus mask is observed before
> any SME accesses. The mask is later used to decide whether to send the
> IPI. We have something like this:
> 
> P0
> 	STSET	[sme_active_cpus]
> 	DMB
> 	SME access to [addr]
> 
> P1
> 	TLBI	[addr]
> 	DSB
> 	LDR	[sme_active_cpus]
> 	CBZ	out
> 	Do IPI
> out:
> 
> If P1 did not observe the STSET to [sme_active_cpus], P0 should have
> received and acknowledged the DVMSync before the STSET. Is your concern
> that P1 can observe the subsequent SME access but not the STSET?
> 
> No idea whether herd can model this (I only put this in TLA+ for the
> main logic check but it doesn't do subtle memory ordering).

JFYI, herd support for SME is still work-in-progress (specifically it misses
updates in cat), yet it can model VMSA.

IIUC, expectation here is that either
- P1 observes sme_active_cpus, so we have to do_IPI or
- P0 observes TLBI (say shutdown, so it must fault)

anything else is unexpected/forbidden.

AArch64 A
variant=vmsa
{
 int x=0;
 int active=0;

 0:X1=active;
 0:X3=x;

 1:X0=(valid:0);
 1:X1=PTE(x);
 1:X2=x;
 1:X3=active;
 
}
 P0                                 | P1                                            ;
 MOV W0,#1                          | STR X0,[X1]                                   ;
 STR W0,[X1] (* sme_active_cpus  *) | DSB ISH                                       ;
 DMB SY                             | LSR X9,X2,#12                                 ;
 LDR W2,[X3] (* access to [addr] *) | TLBI VAAE1IS,X9 (* [addr] *)                  ;
                                    | DSB ISH                                       ;
                                    | LDR W4,[X3]     (* sme_active_cpus *)         ;

exists ~(1:X4=1 \/ fault(P0,x))

Is that correct understanding? Have I missed anything?

Cheers
Vladimir

