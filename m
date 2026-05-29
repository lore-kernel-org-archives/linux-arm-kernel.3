Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3FACD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZ+2BriGcUoQCB9R5Nhhl9kS0v/pUWUNaGjr2e1gbZ8=; b=IFnKlqBM9kEv6jppG4UN1zjDhA
	IOmJkzxVFMJvu2Ygk+T/gOTv7H07anMcIrsfP2ci4YTx+wSKW8x5jq49x/7Mg6q1xuSJbiQFrjVo3
	EbmVSmMge07BmyJX94lxaZCFc45NwkleOM74s6o129XLLvO0M6AeT4b/KNbZo/NE2SE+GSqymDWlv
	5QlicPV8cWTx6BqWUfSRALSBUnbcTn6ZNf3QOYXxv4QIXkcydCiVX8MkjsXKnlj4Jd6QEyB999fZh
	QFPCnXJFpNjqfPPcnm5BbhRW8uygWPbkum7PFSbFINzaaJCq/JOX3CkieNRjK+NdVXd0JSbI9t2C3
	jwAUOCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsof-00000006yVN-1SOg;
	Fri, 29 May 2026 08:43:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsod-00000006yV0-1DL1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:43:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AA30204C;
	Fri, 29 May 2026 01:43:33 -0700 (PDT)
Received: from [10.1.26.144] (unknown [10.1.26.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2F0A3F632;
	Fri, 29 May 2026 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780044218; bh=KygjM3ZykWxWbDxiC7hupI7dfqvP38H79ifxVucLd7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UV5BGLRtOl91Z/MsKlJEM8AgO+Hjwx9Pz3JUe/rapOjbl+lAXUcD5/WdCF6BfqPeI
	 Hn20VBP5lyOleWQTbkBG4zZCZzujOG+LzfyxDhj649uCXrBMnENKFayBiDZxjQIruV
	 yinajPGXuAyMI3ur7p44dwIDrs1vfMpTy6R5d1GE=
Message-ID: <eb4544ff-c2f0-407c-8449-8a423cdeab09@arm.com>
Date: Fri, 29 May 2026 09:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/18] arm64: fpsimd: Move fpsimd save/restore inline
To: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
 maz@kernel.org, oupton@kernel.org, tabba@google.com, will@kernel.org
References: <20260528165446.701944-1-mark.rutland@arm.com>
 <20260528165446.701944-13-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260528165446.701944-13-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014339_430786_B56F8638 
X-CRM114-Status: GOOD (  34.38  )
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

On 5/28/26 17:54, Mark Rutland wrote:
> Currently the FPSIMD register save/restore sequences are written in
> out-of-line assembly routines. While this works, it's somewhat painful:
> 
> * As KVM needs to be able to use the sequences in hyp code, separate
>   assembly files are used for the regular kernel and KVM code. While the
>   common logic is shared in assembly macros, this still requires some
>   duplication, and has lead to some trivial divergence.
> 
> * For historical reasons, the assembly macros take some register
>   arguments as numerical indices (e.g. "fpsimd_save x0, 8" uses x0 and
>   x8), which is simply confusing.
> 
> * For historical reasons, the SVE save/restore code and FPSIMD
>   save/restore code have distinct sequences for FPSR and FPCR. Ideally
>   this logic would be shared.
> 
> * The assembly sequences can't be instrumented, and so it's harder than
>   necessary to catch memory safety issues.
> 
> To handle the above, move the FPSIMD register save/restore sequences to
> inline assembly, and share the FPSR+FPCR save/restore with SVE.
> 
> Neither GCC nor LLVM instrument memory arguments to inline assembly, so
> explicit instrumentation is added in the same manner as other assembly
> routines. This instrumentation is implicitly disabled by Kbuild for nVHE
> hyp code.
> 
> I've used the SVE sequence for restoring FPCR, which uses an
> unconditional write to FPCR, rather than the conditional write used by
> the FPSIMD assembly sequence. I believe that in practice, this doesn't
> matter to a real workload, and given it's possible for the mis-predicted
> branch to cost more than the necessary micro-architectural
> synchronization, I strongly suspect any performance impact is within the
> noise.
> 
> Looking at the history, the FPSIMD assembly sequence was changed to use
> a conditional write to FPCR since 2014 in commit:
> 
>   5959e25729a5 ("arm64: fpsimd: avoid restoring fpcr if the contents haven't change")
> 
> ... as described in the commit message, this was based on an expectation
> of implementation style, and was not based on benchmarking.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/fpsimd.h         | 68 ++++++++++++++++++++++++-
>  arch/arm64/include/asm/fpsimdmacros.h   | 59 ---------------------
>  arch/arm64/include/asm/kvm_hyp.h        |  2 -
>  arch/arm64/kernel/entry-fpsimd.S        | 20 --------
>  arch/arm64/kvm/hyp/fpsimd.S             | 10 ----
>  arch/arm64/kvm/hyp/include/hyp/switch.h |  4 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  4 +-
>  7 files changed, 70 insertions(+), 97 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
> index 6fd5cdf5e5f17..19b373ad0ebf7 100644
> --- a/arch/arm64/include/asm/fpsimd.h
> +++ b/arch/arm64/include/asm/fpsimd.h
> @@ -22,6 +22,8 @@
>  #include <linux/stddef.h>
>  #include <linux/types.h>
>  
> +#define __FPSIMD_PREAMBLE	".arch_extension fp\n" \
> +				".arch_extension simd\n"
>  #define __SVE_PREAMBLE		".arch_extension sve\n"
>  #define __SME_PREAMBLE		".arch_extension sme\n"
>  
> @@ -86,8 +88,70 @@ static inline void fpsimd_load_common(const struct user_fpsimd_state *state)
>  	write_sysreg_s(state->fpcr, SYS_FPCR);
>  }
>  
> -extern void fpsimd_save_state(struct user_fpsimd_state *state);
> -extern void fpsimd_load_state(struct user_fpsimd_state *state);
> +static inline void fpsimd_save_vregs(struct user_fpsimd_state *state)
> +{
> +	instrument_write(state->vregs, sizeof(state->vregs));
> +	asm volatile(
> +	__FPSIMD_PREAMBLE
> +	"	stp	q0,  q1,  [%[vregs], #16 * 0]\n"
> +	"	stp	q2,  q3,  [%[vregs], #16 * 2]\n"
> +	"	stp	q4,  q5,  [%[vregs], #16 * 4]\n"
> +	"	stp	q6,  q7,  [%[vregs], #16 * 6]\n"
> +	"	stp	q8,  q9,  [%[vregs], #16 * 8]\n"
> +	"	stp	q10, q11, [%[vregs], #16 * 10]\n"
> +	"	stp	q12, q13, [%[vregs], #16 * 12]\n"
> +	"	stp	q14, q15, [%[vregs], #16 * 14]\n"
> +	"	stp	q16, q17, [%[vregs], #16 * 16]\n"
> +	"	stp	q18, q19, [%[vregs], #16 * 18]\n"
> +	"	stp	q20, q21, [%[vregs], #16 * 20]\n"
> +	"	stp	q22, q23, [%[vregs], #16 * 22]\n"
> +	"	stp	q24, q25, [%[vregs], #16 * 24]\n"
> +	"	stp	q26, q27, [%[vregs], #16 * 26]\n"
> +	"	stp	q28, q29, [%[vregs], #16 * 28]\n"
> +	"	stp	q30, q31, [%[vregs], #16 * 30]\n"
> +	: "=Q" (state->vregs)
> +	: [vregs] "r" (state->vregs)
> +	);
> +}
> +
> +static inline void fpsimd_load_vregs(const struct user_fpsimd_state *state)
> +{
> +	instrument_read(state->vregs, sizeof(state->vregs));
> +	asm volatile(
> +	__FPSIMD_PREAMBLE
> +	"	ldp	q0,  q1,  [%[vregs], #16 * 0]\n"
> +	"	ldp	q2,  q3,  [%[vregs], #16 * 2]\n"
> +	"	ldp	q4,  q5,  [%[vregs], #16 * 4]\n"
> +	"	ldp	q6,  q7,  [%[vregs], #16 * 6]\n"
> +	"	ldp	q8,  q9,  [%[vregs], #16 * 8]\n"
> +	"	ldp	q10, q11, [%[vregs], #16 * 10]\n"
> +	"	ldp	q12, q13, [%[vregs], #16 * 12]\n"
> +	"	ldp	q14, q15, [%[vregs], #16 * 14]\n"
> +	"	ldp	q16, q17, [%[vregs], #16 * 16]\n"
> +	"	ldp	q18, q19, [%[vregs], #16 * 18]\n"
> +	"	ldp	q20, q21, [%[vregs], #16 * 20]\n"
> +	"	ldp	q22, q23, [%[vregs], #16 * 22]\n"
> +	"	ldp	q24, q25, [%[vregs], #16 * 24]\n"
> +	"	ldp	q26, q27, [%[vregs], #16 * 26]\n"
> +	"	ldp	q28, q29, [%[vregs], #16 * 28]\n"
> +	"	ldp	q30, q31, [%[vregs], #16 * 30]\n"
> +	:
> +	: "Q" (state->vregs),
> +	  [vregs] "r" (state->vregs)
> +	);
> +}
> +
> +static inline void fpsimd_save_state(struct user_fpsimd_state *state)
> +{
> +	fpsimd_save_vregs(state);
> +	fpsimd_save_common(state);
> +}
> +
> +static inline void fpsimd_load_state(const struct user_fpsimd_state *state)
> +{
> +	fpsimd_load_vregs(state);
> +	fpsimd_load_common(state);
> +}
>  
>  extern void fpsimd_thread_switch(struct task_struct *next);
>  extern void fpsimd_flush_thread(void);
> diff --git a/arch/arm64/include/asm/fpsimdmacros.h b/arch/arm64/include/asm/fpsimdmacros.h
> index 1f32e0967dcd3..b486c6399bb4e 100644
> --- a/arch/arm64/include/asm/fpsimdmacros.h
> +++ b/arch/arm64/include/asm/fpsimdmacros.h
> @@ -8,65 +8,6 @@
>  
>  #include <asm/assembler.h>
>  
> -.macro fpsimd_save state, tmpnr
> -	stp	q0, q1, [\state, #16 * 0]
> -	stp	q2, q3, [\state, #16 * 2]
> -	stp	q4, q5, [\state, #16 * 4]
> -	stp	q6, q7, [\state, #16 * 6]
> -	stp	q8, q9, [\state, #16 * 8]
> -	stp	q10, q11, [\state, #16 * 10]
> -	stp	q12, q13, [\state, #16 * 12]
> -	stp	q14, q15, [\state, #16 * 14]
> -	stp	q16, q17, [\state, #16 * 16]
> -	stp	q18, q19, [\state, #16 * 18]
> -	stp	q20, q21, [\state, #16 * 20]
> -	stp	q22, q23, [\state, #16 * 22]
> -	stp	q24, q25, [\state, #16 * 24]
> -	stp	q26, q27, [\state, #16 * 26]
> -	stp	q28, q29, [\state, #16 * 28]
> -	stp	q30, q31, [\state, #16 * 30]!
> -	mrs	x\tmpnr, fpsr
> -	str	w\tmpnr, [\state, #16 * 2]
> -	mrs	x\tmpnr, fpcr
> -	str	w\tmpnr, [\state, #16 * 2 + 4]
> -.endm
> -
> -.macro fpsimd_restore_fpcr state, tmp
> -	/*
> -	 * Writes to fpcr may be self-synchronising, so avoid restoring
> -	 * the register if it hasn't changed.
> -	 */
> -	mrs	\tmp, fpcr
> -	cmp	\tmp, \state
> -	b.eq	9999f
> -	msr	fpcr, \state
> -9999:
> -.endm
> -
> -/* Clobbers \state */
> -.macro fpsimd_restore state, tmpnr
> -	ldp	q0, q1, [\state, #16 * 0]
> -	ldp	q2, q3, [\state, #16 * 2]
> -	ldp	q4, q5, [\state, #16 * 4]
> -	ldp	q6, q7, [\state, #16 * 6]
> -	ldp	q8, q9, [\state, #16 * 8]
> -	ldp	q10, q11, [\state, #16 * 10]
> -	ldp	q12, q13, [\state, #16 * 12]
> -	ldp	q14, q15, [\state, #16 * 14]
> -	ldp	q16, q17, [\state, #16 * 16]
> -	ldp	q18, q19, [\state, #16 * 18]
> -	ldp	q20, q21, [\state, #16 * 20]
> -	ldp	q22, q23, [\state, #16 * 22]
> -	ldp	q24, q25, [\state, #16 * 24]
> -	ldp	q26, q27, [\state, #16 * 26]
> -	ldp	q28, q29, [\state, #16 * 28]
> -	ldp	q30, q31, [\state, #16 * 30]!
> -	ldr	w\tmpnr, [\state, #16 * 2]
> -	msr	fpsr, x\tmpnr
> -	ldr	w\tmpnr, [\state, #16 * 2 + 4]
> -	fpsimd_restore_fpcr x\tmpnr, \state
> -.endm
> -
>  /* Sanity-check macros to help avoid encoding garbage instructions */
>  
>  .macro _check_general_reg nr
> diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
> index 0030cc1b52197..8c4602c8f4356 100644
> --- a/arch/arm64/include/asm/kvm_hyp.h
> +++ b/arch/arm64/include/asm/kvm_hyp.h
> @@ -121,8 +121,6 @@ void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu);
>  void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu);
>  #endif
>  
> -void __fpsimd_save_state(struct user_fpsimd_state *fp_regs);
> -void __fpsimd_restore_state(struct user_fpsimd_state *fp_regs);
>  void __sve_save_state(void *sve, int save_ffr);
>  void __sve_restore_state(void *sve, int restore_ffr);
>  
> diff --git a/arch/arm64/kernel/entry-fpsimd.S b/arch/arm64/kernel/entry-fpsimd.S
> index 83fe9c32bbd1c..4fa00c94f28b7 100644
> --- a/arch/arm64/kernel/entry-fpsimd.S
> +++ b/arch/arm64/kernel/entry-fpsimd.S
> @@ -11,26 +11,6 @@
>  #include <asm/assembler.h>
>  #include <asm/fpsimdmacros.h>
>  
> -/*
> - * Save the FP registers.
> - *
> - * x0 - pointer to struct fpsimd_state
> - */
> -SYM_FUNC_START(fpsimd_save_state)
> -	fpsimd_save x0, 8
> -	ret
> -SYM_FUNC_END(fpsimd_save_state)
> -
> -/*
> - * Load the FP registers.
> - *
> - * x0 - pointer to struct fpsimd_state
> - */
> -SYM_FUNC_START(fpsimd_load_state)
> -	fpsimd_restore x0, 8
> -	ret
> -SYM_FUNC_END(fpsimd_load_state)
> -
>  #ifdef CONFIG_ARM64_SVE
>  
>  /*
> diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
> index 8575e32977d19..beacec33b2541 100644
> --- a/arch/arm64/kvm/hyp/fpsimd.S
> +++ b/arch/arm64/kvm/hyp/fpsimd.S
> @@ -10,16 +10,6 @@
>  
>  	.text
>  
> -SYM_FUNC_START(__fpsimd_save_state)
> -	fpsimd_save	x0, 1
> -	ret
> -SYM_FUNC_END(__fpsimd_save_state)
> -
> -SYM_FUNC_START(__fpsimd_restore_state)
> -	fpsimd_restore	x0, 1
> -	ret
> -SYM_FUNC_END(__fpsimd_restore_state)
> -
>  SYM_FUNC_START(__sve_restore_state)
>  	sve_load 0, x1
>  	ret
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index eb76a863ebb84..aaa43554fd8e6 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -565,7 +565,7 @@ static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
>  	if (system_supports_sve()) {
>  		__hyp_sve_save_host();
>  	} else {
> -		__fpsimd_save_state(&hctxt->fp_regs);
> +		fpsimd_save_state(&hctxt->fp_regs);
>  	}
>  
>  	if (kvm_has_fpmr(kern_hyp_va(vcpu->kvm)))
> @@ -625,7 +625,7 @@ static inline bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	if (sve_guest)
>  		__hyp_sve_restore_guest(vcpu);
>  	else
> -		__fpsimd_restore_state(&vcpu->arch.ctxt.fp_regs);
> +		fpsimd_load_state(&vcpu->arch.ctxt.fp_regs);
>  
>  	if (kvm_has_fpmr(kern_hyp_va(vcpu->kvm)))
>  		write_sysreg_s(__vcpu_sys_reg(vcpu, FPMR), SYS_FPMR);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 0be4577a67e7b..627762ed7327f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -83,7 +83,7 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
>  	if (vcpu_has_sve(vcpu))
>  		__hyp_sve_save_guest(vcpu);
>  	else
> -		__fpsimd_save_state(&vcpu->arch.ctxt.fp_regs);
> +		fpsimd_save_state(&vcpu->arch.ctxt.fp_regs);
>  
>  	has_fpmr = kvm_has_fpmr(kern_hyp_va(vcpu->kvm));
>  	if (has_fpmr)
> @@ -92,7 +92,7 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
>  	if (system_supports_sve())
>  		__hyp_sve_restore_host();
>  	else
> -		__fpsimd_restore_state(&hctxt->fp_regs);
> +		fpsimd_load_state(&hctxt->fp_regs);
>  
>  	if (has_fpmr)
>  		write_sysreg_s(ctxt_sys_reg(hctxt, FPMR), SYS_FPMR);
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


