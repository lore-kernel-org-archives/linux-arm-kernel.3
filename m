Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA0D606D81C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tJC0NMIo;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NTzqHn6U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=21vYI0bQVUl3hCiSLmuD6Wo76ikPKRN+C6h2vCMSb/E=; b=tJC0NMIopN7YsFZehV7eqW3dAK
	l8Jg7mA9BI/HsNqW8MO3o1j0jIrFi3mj1TdgRZZ2OYeN10IKlPZ9Y3BtvRLgeM5Pa517rYl297cPh
	1loIKnKqRurKZga1lNaY9x5CkyQXdxDus+VJjCgD/4nyUxP+YvTuelCtWbSTd/KVJ6MXCDqcf513N
	tPPP+9vFWsv+47FhrENpDGVLT1GhQDXkl2eAbL2Tgf9/JY9MSas1IpMGEbB+qHHLJcKCzBzLCpHDS
	dBAqCkhTkCmnjAQR8C5ZtirolzZG2/HfQ9cQ3yyT8tBZPTZIcg3DwY5+oyy+x9152irZqnaULVgqj
	Geb/0KWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD1n-00000002HFO-0bs3;
	Tue, 03 Nov 2026 11:50:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD1l-00000002HEs-0pX0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:50:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC3FF43DA9;
	Tue,  3 Nov 2026 11:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF13B1F00A1E;
	Tue,  3 Nov 2026 11:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706608;
	bh=21vYI0bQVUl3hCiSLmuD6Wo76ikPKRN+C6h2vCMSb/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NTzqHn6UV0XlvZnKXNpull1pI9vC844ALQF1QB7ewEHwqFQiUxyCsX1vR+MKE0t3r
	 y935niEs67SECOk8icBrppwNaHDapOCSo4lYsI9LV+Jh3Jjn1Fwlw5SFMDjEPHbzYp
	 fallXfTmScstELEyPZU/q8ctAZXnUDFYs9sHj8qV+GqrKukjw+ot07vYiWCmgQ0bde
	 /zKZbJeHE3MHwOiOqL7ug13nzBn6nMhZdERc3wzWDlDmpxqSjOakD4fg1zI7oqzmYQ
	 1DNre6XTfOXizmQ9gtggy3llNS+vRrnNSB9eSeoUwNO/nU0cXwmqZ45F445dV1Ead6
	 28Saxt+cZEROA==
Date: Tue, 3 Nov 2026 11:50:03 +0000
From: Will Deacon <will@kernel.org>
To: Wei Wang <wvw@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	wei.vince.wang@gmail.com
Subject: Re: [PATCH] arm64: suspend: Save and restore TPIDR2_EL0 across CPU
 suspend
Message-ID: <aunKa8uBZJTCzVjd@willie-the-truck>
References: <20261102234813.1069156-1-wvw@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102234813.1069156-1-wvw@google.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 11:48:13PM +0000, Wei Wang wrote:
> On systems with FEAT_SME, TPIDR2_EL0 is part of userspace thread state:
> the AAPCS64 SME ABI uses it as the ZA lazy-save pointer, and the kernel
> context-switches it eagerly in tls_thread_switch(). While a task is
> running, the live register is the only copy of its value.
> 
> The architecture defines TPIDR2_EL0 as UNKNOWN after a warm reset, so
> a CPU power-down through PSCI CPU_SUSPEND or SYSTEM_SUSPEND can lose it.
> cpu_do_suspend() and cpu_do_resume() already preserve TPIDR_EL0 and
> TPIDRRO_EL0, but not TPIDR2_EL0.
> 
> For CPU idle this is harmless: current is the idle task, and the next
> context switch reloads TPIDR2_EL0 from next->thread.tpidr2_el0. For
> suspend-to-RAM and hibernation, however, cpu_suspend() runs in the
> context of the userspace task that wrote /sys/power/state, and that
> task returns to EL0 with an UNKNOWN TPIDR2_EL0. On hardware where the
> reset value is non-zero, the next SME ABI lazy-save check in that
> thread faults. For example, bionic's fork() -> clone() ->
> __arm_za_disable() -> __arm_tpidr2_save() loads from the garbage
> pointer:
> 
>   # echo mem > /sys/power/state; true
>   signal 11 (SIGSEGV), code 1 (SEGV_MAPERR), fault addr 0xa3bad11bcaf72e93
>       x16 a3bad11bcaf72e89
>   #00 pc ... libc.so (__arm_tpidr2_save+24)
>   #01 pc ... libc.so (__arm_za_disable+32)
>   #02 pc ... libc.so (clone+480)
>   #03 pc ... libc.so (fork+60)
> 
> Having firmware zero TPIDR2_EL0 on warm reset avoids the crash. It is
> not enough on its own, though: a thread that enters the kernel with a
> lazy save pending (TPIDR2_EL0 pointing at a valid TPIDR2 block) would
> see TPIDR2_EL0 == 0 on return. It would then wrongly conclude that ZA
> had been committed and restore stale data from its save buffer. The
> kernel owns this state and must preserve it.

There's a lot of unnecessary (AI-generated?) detail in here. Please can
you trim this down a bit? I don't think we care about the firmware part,
the stuff about idle or the bionic crash. The bottom line is that we're
not saving/restoring a live EL0 register across suspend/resume.

> Save TPIDR2_EL0 in cpu_do_suspend() and restore it in cpu_do_resume()
> when SME is present. Placing this in proc.S covers both cpu_suspend()
> and hibernation. The new slot uses ctx_regs[14]; sp moves into what was
> previously tail padding, so sizeof(struct cpu_suspend_ctx) stays 128
> bytes. sp is only accessed through the CPU_CTX_SP asm-offset.
> 
> Fixes: a9d691585950 ("arm64/sme: Implement support for TPIDR2")
> Signed-off-by: Wei Wang <wvw@google.com>
> ---
>  arch/arm64/include/asm/suspend.h | 2 +-
>  arch/arm64/mm/proc.S             | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
> index eb60c9735553..2cc5fb405769 100644
> --- a/arch/arm64/include/asm/suspend.h
> +++ b/arch/arm64/include/asm/suspend.h
> @@ -2,7 +2,7 @@
>  #ifndef __ASM_SUSPEND_H
>  #define __ASM_SUSPEND_H
>  
> -#define NR_CTX_REGS 14
> +#define NR_CTX_REGS 15
>  #define NR_CALLEE_SAVED_REGS 12
>  
>  /*
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 7afbece885a3..c7b7fa6491c3 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -103,6 +103,10 @@ SYM_FUNC_START(cpu_do_suspend)
>  alternative_if ARM64_HAS_TCR2
>  	mrs	x2, REG_TCR2_EL1
>  	str	x2, [x0, #104]
> +alternative_else_nop_endif
> +alternative_if ARM64_SME
> +	mrs_s	x2, SYS_TPIDR2_EL0
> +	str	x2, [x0, #112]
>  alternative_else_nop_endif
>  	ret
>  SYM_FUNC_END(cpu_do_suspend)
> @@ -142,6 +146,10 @@ alternative_if ARM64_HAS_TCR2
>  	ldr	x2, [x0, #104]
>  	msr	REG_TCR2_EL1, x2
>  alternative_else_nop_endif
> +alternative_if ARM64_SME
> +	ldr	x2, [x0, #112]
> +	msr_s	SYS_TPIDR2_EL0, x2
> +alternative_else_nop_endif

nit: We use msr and REG_* for TCR2, so it would be more consistent to do
the same for TPIDR2_EL0 if the assembler is happy with it.

Otherwise, looks ok to me:

Acked-by: Will Deacon <will@kernel.org>

Will

