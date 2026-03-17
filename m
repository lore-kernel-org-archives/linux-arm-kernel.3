Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A2EFD874D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hU18/Ja44p52iMr0rseAdAFA+MHEydqlPQWXHv6P/k=; b=rVF9KyvHeJHQcP3pwtpux0PoGB
	gFya28jDNucMKnI9D5YbovY0OE3FNBiVQCZ44lT1F6kYhLJACiY4OtmLIZePHkkCcK/RGCgtKGMLe
	pUwxSr1U5VBpd3+nweKtO5wTfZG3GRSydDT2vzS6cIHRLBH1WBVbDV9ss7gjw8da5fWMinAqOvfiL
	rhPJli1sE7Iy8Iz1zCLv+yhMz8GV87syBCaStocY6/79CP3D/RS6OTJQmEImgYXIzym1buELyb3dc
	C1ZdgC6Li9o6xsZxVwfMpJt54C+L1RLWEiGuTbx19WHf4+ELOiC7Qule7ZCE+zOaw0x8cb+ROqkej
	Diz2Payg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TEV-00000006GRO-17T9;
	Tue, 17 Mar 2026 12:09:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TES-00000006GQr-2I4v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:09:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E32AE1477;
	Tue, 17 Mar 2026 05:09:00 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DCC93F7BD;
	Tue, 17 Mar 2026 05:09:05 -0700 (PDT)
Date: Tue, 17 Mar 2026 12:09:03 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/4] arm64: errata: Work around early CME DVMSync
 acknowledgement
Message-ID: <ablEXwhfKyJW1i7l@J2N7QTR9R3>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-4-catalin.marinas@arm.com>
 <aamT6-Mvr9nI1unq@willie-the-truck>
 <aarB3iv8963UDn5E@arm.com>
 <c4a302df-511b-40b2-97f2-06576748c999@arm.com>
 <abA6N6ctPoscIbBe@arm.com>
 <abLT05Nq-9J-uBEY@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abLT05Nq-9J-uBEY@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_050908_860984_5DEC524D 
X-CRM114-Status: GOOD (  39.17  )
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

On Thu, Mar 12, 2026 at 02:55:15PM +0000, Will Deacon wrote:
> On Tue, Mar 10, 2026 at 03:35:19PM +0000, Catalin Marinas wrote:
> > Thanks Vladimir,
> > 
> > On Mon, Mar 09, 2026 at 10:13:20AM +0000, Vladimir Murzin wrote:
> > > On 3/6/26 12:00, Catalin Marinas wrote:
> > > >>> @@ -1358,6 +1360,85 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
> > > >>>  	put_cpu_fpsimd_context();
> > > >>>  }
> > > >>>  
> > > >>> +#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
> > > >>> +
> > > >>> +/*
> > > >>> + * SME/CME erratum handling
> > > >>> + */
> > > >>> +static cpumask_var_t sme_dvmsync_cpus;
> > > >>> +static cpumask_var_t sme_active_cpus;
> > > >>> +
> > > >>> +void sme_set_active(unsigned int cpu)
> > > >>> +{
> > > >>> +	if (!cpus_have_final_cap(ARM64_WORKAROUND_SME_DVMSYNC))
> > > >>> +		return;
> > > >>> +	if (!cpumask_test_cpu(cpu, sme_dvmsync_cpus))
> > > >>> +		return;
> > > >>> +
> > > >>> +	if (!test_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags))
> > > >>> +		set_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags);
> > > >>> +
> > > >>> +	cpumask_set_cpu(cpu, sme_active_cpus);
> > > >>> +
> > > >>> +	/*
> > > >>> +	 * Ensure subsequent (SME) memory accesses are observed after the
> > > >>> +	 * cpumask and the MMCF_SME_DVMSYNC flag setting.
> > > >>> +	 */
> > > >>> +	smp_mb();
> > > >>
> > > >> I can't convince myself that a DMB is enough here, as the whole issue
> > > >> is that the SME memory accesses can be observed _after_ the TLB
> > > >> invalidation. I'd have thought we'd need a DSB to ensure that the flag
> > > >> updates are visible before the exception return.
> > > > 
> > > > This is only to ensure that the sme_active_cpus mask is observed before
> > > > any SME accesses. The mask is later used to decide whether to send the
> > > > IPI. We have something like this:
> > > > 
> > > > P0
> > > > 	STSET	[sme_active_cpus]
> > > > 	DMB
> > > > 	SME access to [addr]
> > > > 
> > > > P1
> > > > 	TLBI	[addr]
> > > > 	DSB
> > > > 	LDR	[sme_active_cpus]
> > > > 	CBZ	out
> > > > 	Do IPI
> > > > out:
> > > > 
> > > > If P1 did not observe the STSET to [sme_active_cpus], P0 should have
> > > > received and acknowledged the DVMSync before the STSET. Is your concern
> > > > that P1 can observe the subsequent SME access but not the STSET?
> > > > 
> > > > No idea whether herd can model this (I only put this in TLA+ for the
> > > > main logic check but it doesn't do subtle memory ordering).
> > > 
> > > JFYI, herd support for SME is still work-in-progress (specifically it misses
> > > updates in cat), yet it can model VMSA.
> > > 
> > > IIUC, expectation here is that either
> > > - P1 observes sme_active_cpus, so we have to do_IPI or
> > > - P0 observes TLBI (say shutdown, so it must fault)
> > > 
> > > anything else is unexpected/forbidden.
> > > 
> > > AArch64 A
> > > variant=vmsa
> > > {
> > >  int x=0;
> > >  int active=0;
> > > 
> > >  0:X1=active;
> > >  0:X3=x;
> > > 
> > >  1:X0=(valid:0);
> > >  1:X1=PTE(x);
> > >  1:X2=x;
> > >  1:X3=active;
> > >  
> > > }
> > >  P0                                 | P1                                            ;
> > >  MOV W0,#1                          | STR X0,[X1]                                   ;
> > >  STR W0,[X1] (* sme_active_cpus  *) | DSB ISH                                       ;
> > >  DMB SY                             | LSR X9,X2,#12                                 ;
> > >  LDR W2,[X3] (* access to [addr] *) | TLBI VAAE1IS,X9 (* [addr] *)                  ;
> > >                                     | DSB ISH                                       ;
> > >                                     | LDR W4,[X3]     (* sme_active_cpus *)         ;
> > > 
> > > exists ~(1:X4=1 \/ fault(P0,x))
> > > 
> > > Is that correct understanding? Have I missed anything?
> > 
> > Yes, I think that's correct. Another tweak specific to this erratum
> > would be for P1 to do a store to x via another mapping after the
> > TLBI+DSB and the P0 load should not see it.
> > 
> > Even with the CPU erratum, if the P1 DVMSync is received/acknowledged by
> > P0 before its STR to sme_active_cpus, I don't see how the subsequent SME
> > load would overtake the STR given the DMB. The erratum messed up the
> > DVMSync acknowledgement, not the barriers.
> 
> I'm still finding this hard to reason about.
> 
> Why can't:
> 
> 1. P0 translates its SME load and puts the valid translation into its TLB
> 2. P1 runs to completion, sees sme_active_cpus as 0 and so doesn't IPI
> 3. P0 writes to sme_active_cpus and then does the SME load using the
>    translation from (1)

The key thing is that for micro-architectural reasons, C1-Pro provides
stronger than architectural properties for TLB invalidation (aside from
*completion* of SME accesses specifically). The DMB is not material to
this example, but could matter if we wanted ordering in the absence of a
TLBI.

Specifically, where C1-Pro receives a broadcast TLBI, and that TLBI
architecturally affects the translation of an explicit memory effect of
some instruction INSN (which may be an SME instruction), C1-Pro will
also complete the explicit memory effects of all earlier (non-SME)
instructions *in program order* before INSN. This happens regardless of
out-of-order execution, etc.

When C1-Pro executes a sequence:

	STR		<1>, [<flag_addr>]
	SME_LDR		<dst>, [<sme_addr>]
	
... if a broadcast TLBI is received which affects sme_addr, either:

(a) The TLBI is received before any of SME_LDR's accesses to sme_addr
    are translated. The SME_LDR instruction WILL NOT use the stale
    translation for sme_addr.

(b) The TLBI is received after any of SME_LDR's accesses to sme_addr are
    translated. The SME_LDR instruction MIGHT use the stale translation
    for sme_addr. Completion of the TLBI WILL ensure that the STR to
    flag_addr has been globally observed. Until completion of the TLBI,
    the STR to flag_addr and the SME_LDR to sme_addr could become
    observed in any order.

... and so IF the SME_LDR consumes a stale translation for sme_addr, the
store to flag_addr WILL be globally observed before completion of the
TLBI.

When the STR and SME_LDR are either side of an ERET, the ERET itself is
immaterial, and the scenario decays to the example above:

	STR	<1>, [<flag_addr>]
	ERET				// immaterial
	SME_LDR	<dst>, [<sme_addr>]

However, when clearing the flag *after* executing SME loads/stores, we
still need to complete those SME loads/stores before clearing the flag.
Either a DSB (or IESB as part of exception entry) are sufficient to
complete those earlier SME accesses.

Mark.

