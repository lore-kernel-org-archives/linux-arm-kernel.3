Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3395CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Us6slqFZMvrI2Nptg/1xCtJnBrabIr5GOy7OQvL4D1s=; b=xAT6e06Awb6iTUTFHduFI5HGLF
	IcvoOvhvWthrCITonbAcEGlShmgv/JiIB/u8rWPVqlFh4FQBDFf5phsQ8PouteD7CHyQbRiVGXfc3
	mVnTTS6X7NaNLSj4EMO376MrcYLlJ1eZ1ckkpmzIIRTu16QHwD8YksuPIgfJP4gnIiaiHHJb6GBZs
	zsmlJdYI50mOmPkrIAFbnbVCd4XzNXakc7+BYS0Nqv036l8c/5/KS04MHRAmqgRM2d03E9sn974Np
	iA68ajeH6bAmeuKGfwmM3tuVlft24OruJToIZ9eOSLHDqrkRjF0iYVmZ9n6SQnDsoD4ORERd7d7M2
	NSSWJ1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFZW-00000004KA3-319c;
	Wed, 27 May 2026 14:49:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFZU-00000004K9Z-032P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 14:49:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D84827DC;
	Wed, 27 May 2026 07:49:17 -0700 (PDT)
Received: from [10.1.38.169] (e121487-lin.cambridge.arm.com [10.1.38.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE98B3F905;
	Wed, 27 May 2026 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779893362; bh=C38syTCSjjdSlrbnwDdWqfihxKKcTQGrDUikmMHKDDU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gfiy0djEibdXZm0BtmMGMoRzZ9/scXS0R7/AXoH5ie653Nue9RmnJ+NoUzTxkkmrX
	 H8sK+4Gqpt7TbYHgBLd4Onglv/vL66Sv76MYtTdbTMKr+4nROUANvJNfGVtTxUu4k1
	 9KMoXwsqPyDmAjdw44hq4VZKynO7lk487nwOGvC4=
Message-ID: <c5ba3af9-08b2-4be2-b9f5-58a925f0b050@arm.com>
Date: Wed, 27 May 2026 15:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] arm64: fpsimd: Move fpsimd save/restore inline
To: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
 maz@kernel.org, oupton@kernel.org, tabba@google.com, will@kernel.org
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-13-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260521132556.584676-13-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_074924_145925_F839777F 
X-CRM114-Status: GOOD (  26.96  )
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

Hi Mark,

On 5/21/26 14:25, Mark Rutland wrote:
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
> Note that I've used the SVE sequence for restoring FPCR, which uses an
> unconditional write to FPCR. The plain FPSIMD assembly sequence used a
> conditional write to FPCR since 2014 in commit:
> 
>   5959e25729a5 ("arm64: fpsimd: avoid restoring fpcr if the contents haven't change")
> 
> ... but this was not followed for the SVE assembly implemented in 2017
> in commit:
> 
>   1fc5dce78ad1 ("arm64/sve: Low-level SVE architectural state manipulation functions")
> 
> ... so I've assumed that this doesn't actually matter in practice, and
> I've erred in favour of the simpler sequence.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
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

Missing "memory" clobber here?

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

Missing "memory" clobber here?


> +	);
> +}
> +

[snip]

Cheers
Vladimir

