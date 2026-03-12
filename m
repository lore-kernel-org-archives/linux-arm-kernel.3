Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9403D106ACD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 18:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83nz5kFoQpJR7VJnb9yP55CswKtFueIceddf1yuOaDs=; b=CoHLmynweqybhmOveUPF8RlWTK
	N/d+nKOaEN3clnYot8XHOBwZ39jfm0+ACGj2Up2AmbPX+wPh0GxpL3EFfvAP2vw6v2gsHry1fKjoU
	oRUaKZy0k5HHrrodkLSAtthonc/dkPtmW4hqvEc/Vsx8BW8MjScH2Hzk6DCWgIpNvP7/ScdLUZmpT
	GwjXbWKdvWhOxuzTW2u44BJH2g2qGHKPdE15Bv+Qw00UnMCB2PXIDuaVhpbNvaZP44hQB9Gsr1phk
	3br7JTe8u9UvEJTLY27zmMDr81xdkv1iigrb02JWaKPD2kjChod8NPM/Exp0x+iTWFuwj/QlDDxra
	51A+EllA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kMu-0000000EpAf-0G3Q;
	Thu, 12 Mar 2026 18:02:44 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kMr-0000000Ep9i-0O4F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 18:02:42 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-126ea4e9697so1131c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 11:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773338560; x=1773943360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=83nz5kFoQpJR7VJnb9yP55CswKtFueIceddf1yuOaDs=;
        b=wuMOOhqfrw34dCeHw7FG8jb36L5rwacvuZrdbQXlKcu5gfDslELZNsoRYZQXu/Rcd+
         MqZk3IyK+Kmpgm+CBM6ty+ZlM69h/CFrfjGp2avtCwFB4QIMhK5s2VMxlwB1HibEgPT0
         AJbEVJ4s71DsvVR+r6gPOzIzp71UiZ85T6UBQrfzthBXauKzNhPTWXZYFqJ7zWGjgbTU
         sAzAU6Q2nB2aDvRXNTYVJg/mIeoh71Sl6Vr1va74XGA6niWqQzEL2tAIpEkTV7XFVLcc
         STf0Pks6iVGOcp0su1FoRdxzSzPWffQ0/eIcB6Zf2DXL98RbswdKHYyijDC7LGjvpGxW
         +n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773338560; x=1773943360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83nz5kFoQpJR7VJnb9yP55CswKtFueIceddf1yuOaDs=;
        b=BMpaadIGygg5kS4i3zf2G3rT0MoBuXvD9zVaV/TdN5ZvW+c9of95vi1803UIdu6JJ0
         6tms7t3D2154Io3eh3ZOVZaVh8zI5IcP4PpeBzRJzPtb33D/O09GSK/Ue7op4gDDaBCe
         qK6FP6et+5RKOVKzUronlG936bCLdPFDXHM++i1TTkGf75QQlnCzPMSaqSepKuYbs3EI
         mLCnjduchN/BrOUrDhHy8B4BnXTgVso+JeBUvISwWH2GnZPOUAzlGdq0NjchxpJM4CLN
         kPYKtpvCvUm0n1KX5YRQUlJqgZT9tKasr8w4I/9ccG1kB9Zlf88AoBPIRToCBsb1858L
         ZYDw==
X-Gm-Message-State: AOJu0Yyluq5AXbOwvvRZFv4Atj3RKDaxRr3d3atB6k+8vsjhvwsaIEbR
	LngdeyJy6wkqv0BjaaiK/panUJ7biIIMYvLKDW4an4sWOb3Wt+h9v+5h8EvDyteL4Q==
X-Gm-Gg: ATEYQzwc0DBKty9NR5vxqwUkfpQteOCVy5o3XZ5YNy5D4aXz8Rum5WIjHZomfDpzP8Y
	3W0/lwFFUni20THc7Topd6aqHpd4TaMKpCGRB+VsZVUZJCJJMZSL6ugIa9OnN/gZq9uB0taxZhI
	3gVHOTG+VnVgBmFXIS3QxLWy99bxvt9NrtWwHniQ3/N+iz9cp/SukH+ryr9SxgicpO3yqVpsEY5
	XcYe7oE3XKRj00BQkbbjz1QsLB/ebOZbO/1MEu0WnxXEVS7jdgXNDHTFbi4vrugueiD++hzS8NS
	hp584LwlASI6lgHdYqRKgoFCrH1Um6FiKSqjXR4tBaDUBoekE78nryCB9osENDRfO3/eh80w+Lu
	zq3M8SyP7ePl75nQtNXeOwjbJHcrDXK4SEWjFtfJjNjKwd50Zw7EUZMekxfcc4T2hmwSRRg2enZ
	t0JRNYReC/OIKExe0eTCTDgJBihKqFB986rE82usdPT0STifjr5SWGiag4h8OMKA==
X-Received: by 2002:a05:701b:271c:b0:11d:f440:2690 with SMTP id a92af1059eb24-128f4294d5dmr12633c88.0.1773338559084;
        Thu, 12 Mar 2026 11:02:39 -0700 (PDT)
Received: from google.com (154.52.125.34.bc.googleusercontent.com. [34.125.52.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8a833a3asm7349791eec.5.2026.03.12.11.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 11:02:38 -0700 (PDT)
Date: Thu, 12 Mar 2026 18:02:34 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <keescook@chromium.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v6 2/2] arm64: implement support for static call
 trampolines
Message-ID: <abL_ulvlC9JT7Zgw@google.com>
References: <20211105145917.2828911-1-ardb@kernel.org>
 <20211105145917.2828911-3-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105145917.2828911-3-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_110241_139172_DC941C1A 
X-CRM114-Status: GOOD (  47.42  )
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

On Fri, Nov 05, 2021 at 03:59:17PM +0100, Ard Biesheuvel wrote:
> Implement arm64 support for the 'unoptimized' static call variety, which
> routes all calls through a single trampoline that is patched to perform a
> tail call to the selected function.
> 
> It is expected that the direct branch instruction will be able to cover
> the common case. However, given that static call targets may be located
> in modules loaded out of direct branching range, we need a fallback path
> that loads the address into R16 and uses a branch-to-register (BR)
> instruction to perform an indirect call.
> 
> Unlike on x86, there is no pressing need on arm64 to avoid indirect
> calls at all cost, but hiding it from the compiler as is done here does
> have some benefits:
> - the literal is located in .text, which gives us the same robustness
>   advantage that code patching does;
> - no performance hit on CFI enabled Clang builds that decorate compiler
>   emitted indirect calls with branch target validity checks.
> 
> Acked-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---

I'm starting to testing this out on top of 7.0-rc3...


>  arch/arm64/Kconfig                   |  2 +
>  arch/arm64/include/asm/static_call.h | 40 ++++++++++
>  arch/arm64/kernel/patching.c         | 77 +++++++++++++++++++-
>  arch/arm64/kernel/vmlinux.lds.S      |  1 +
>  4 files changed, 117 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 176d6fddc4f2..ccc33b85769c 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -193,6 +193,8 @@ config ARM64
>  	select HAVE_PERF_USER_STACK_DUMP
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
> +	# https://github.com/ClangBuiltLinux/linux/issues/1354
> +	select HAVE_STATIC_CALL if !LTO_CLANG_THIN || CLANG_VERSION >= 130000

I got a circular dependency error on this...

  error: recursive dependency detected!
	symbol GCOV_KERNEL depends on DEBUG_FS
	symbol DEBUG_FS is selected by GPIO_VIRTUSER
	symbol GPIO_VIRTUSER depends on GPIOLIB
	symbol GPIOLIB is selected by CEC_GPIO
	symbol CEC_GPIO depends on PREEMPTION
	symbol PREEMPTION is selected by PREEMPT_BUILD
	symbol PREEMPT_BUILD is selected by PREEMPT_DYNAMIC
	symbol PREEMPT_DYNAMIC depends on HAVE_PREEMPT_DYNAMIC
	symbol HAVE_PREEMPT_DYNAMIC is selected by HAVE_PREEMPT_DYNAMIC_CALL
	symbol HAVE_PREEMPT_DYNAMIC_CALL depends on HAVE_STATIC_CALL
	symbol HAVE_STATIC_CALL is selected by LTO_CLANG_THIN
	symbol LTO_CLANG_THIN is part of choice block at arch/Kconfig:817
	symbol <choice> unknown is visible depending on LTO_CLANG_FULL
	symbol LTO_CLANG_FULL prompt is visible depending on HAS_LTO_CLANG
	symbol HAS_LTO_CLANG depends on GCOV_KERNEL

...so I just dropped the checks altogether for now.


>  	select HAVE_FUNCTION_ARG_ACCESS_API
>  	select HAVE_FUTEX_CMPXCHG if FUTEX
>  	select MMU_GATHER_RCU_TABLE_FREE
> diff --git a/arch/arm64/include/asm/static_call.h b/arch/arm64/include/asm/static_call.h
> new file mode 100644
> index 000000000000..6ee918991510
> --- /dev/null
> +++ b/arch/arm64/include/asm/static_call.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_STATIC_CALL_H
> +#define _ASM_STATIC_CALL_H
> +
> +/*
> + * The sequence below is laid out in a way that guarantees that the literal and
> + * the instruction are always covered by the same cacheline, and can be updated
> + * using a single store-pair instruction (provided that we rewrite the BTI C
> + * instruction as well). This means the literal and the instruction are always
> + * in sync when observed via the D-side.
> + *
> + * However, this does not guarantee that the I-side will catch up immediately
> + * as well: until the I-cache maintenance completes, CPUs may branch to the old
> + * target, or execute a stale NOP or RET. We deal with this by writing the
> + * literal unconditionally, even if it is 0x0 or the branch is in range. That
> + * way, a stale NOP will fall through and call the new target via an indirect
> + * call. Stale RETs or Bs will be taken as before, and branch to the old
> + * target.
> + */
> +#define __ARCH_DEFINE_STATIC_CALL_TRAMP(name, insn)			    \
> +	asm("	.pushsection	.static_call.text, \"ax\"		\n" \
> +	    "	.align		4					\n" \
> +	    "	.globl		" STATIC_CALL_TRAMP_STR(name) "		\n" \
> +	    "0:	.quad		0x0					\n" \
> +	    STATIC_CALL_TRAMP_STR(name) ":				\n" \
> +	    "	hint 		34	/* BTI C */			\n" \
> +		insn "							\n" \
> +	    "	ldr		x16, 0b					\n" \
> +	    "	cbz		x16, 1f					\n" \
> +	    "	br		x16					\n" \
> +	    "1:	ret							\n" \
> +	    "	.popsection						\n")
> +
> +#define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)			\
> +	__ARCH_DEFINE_STATIC_CALL_TRAMP(name, "b " #func)
> +
> +#define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)			\
> +	__ARCH_DEFINE_STATIC_CALL_TRAMP(name, "ret")
> +

Now that we have the RET0 implementation I added:

--- a/arch/arm64/include/asm/static_call.h
+++ b/arch/arm64/include/asm/static_call.h
@@ -37,4 +37,7 @@
 #define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)			\
 	__ARCH_DEFINE_STATIC_CALL_TRAMP(name, "ret")
 
+#define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)			\
+	__ARCH_DEFINE_STATIC_CALL_TRAMP(name, "mov x0, xzr")
+
 #endif /* _ASM_STATIC_CALL_H */


> +#endif /* _ASM_STATIC_CALL_H */
> diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
> index 771f543464e0..a265a87d4d9e 100644
> --- a/arch/arm64/kernel/patching.c
> +++ b/arch/arm64/kernel/patching.c
> @@ -3,6 +3,7 @@
>  #include <linux/mm.h>
>  #include <linux/smp.h>
>  #include <linux/spinlock.h>
> +#include <linux/static_call.h>
>  #include <linux/stop_machine.h>
>  #include <linux/uaccess.h>
>  
> @@ -66,7 +67,7 @@ int __kprobes aarch64_insn_read(void *addr, u32 *insnp)
>  	return ret;
>  }
>  
> -static int __kprobes __aarch64_insn_write(void *addr, __le32 insn)
> +static int __kprobes __aarch64_insn_write(void *addr, void *insn, int size)
>  {
>  	void *waddr = addr;
>  	unsigned long flags = 0;
> @@ -75,7 +76,7 @@ static int __kprobes __aarch64_insn_write(void *addr, __le32 insn)
>  	raw_spin_lock_irqsave(&patch_lock, flags);
>  	waddr = patch_map(addr, FIX_TEXT_POKE0);
>  
> -	ret = copy_to_kernel_nofault(waddr, &insn, AARCH64_INSN_SIZE);
> +	ret = copy_to_kernel_nofault(waddr, insn, size);
>  
>  	patch_unmap(FIX_TEXT_POKE0);
>  	raw_spin_unlock_irqrestore(&patch_lock, flags);
> @@ -85,7 +86,77 @@ static int __kprobes __aarch64_insn_write(void *addr, __le32 insn)
>  
>  int __kprobes aarch64_insn_write(void *addr, u32 insn)
>  {
> -	return __aarch64_insn_write(addr, cpu_to_le32(insn));
> +	__le32 i = cpu_to_le32(insn);
> +
> +	return __aarch64_insn_write(addr, &i, AARCH64_INSN_SIZE);
> +}
> +
> +static void *strip_cfi_jt(void *addr)
> +{
> +	if (IS_ENABLED(CONFIG_CFI_CLANG)) {

I believe this is now just "CONFIG_CFI".

> +		void *p = addr;
> +		u32 insn;
> +
> +		/*
> +		 * Taking the address of a function produces the address of the
> +		 * jump table entry when Clang CFI is enabled. Such entries are
> +		 * ordinary jump instructions, preceded by a BTI C instruction
> +		 * if BTI is enabled for the kernel.
> +		 */
> +		if (IS_ENABLED(CONFIG_ARM64_BTI_KERNEL))
> +			p += 4;
> +
> +		insn = le32_to_cpup(p);
> +		if (aarch64_insn_is_b(insn))
> +			return p + aarch64_get_branch_offset(insn);
> +
> +		WARN_ON(1);
> +	}
> +	return addr;
> +}
> +
> +void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
> +{
> +	/*
> +	 * -0x8	<literal>
> +	 *  0x0	bti c		<--- trampoline entry point
> +	 *  0x4	<branch or nop>
> +	 *  0x8	ldr x16, <literal>
> +	 *  0xc	cbz x16, 20
> +	 * 0x10	br x16
> +	 * 0x14	ret
> +	 */
> +	struct {
> +		u64	literal;
> +		__le32	insn[2];
> +	} insns;
> +	u32 insn;
> +	int ret;
> +
> +	insn = aarch64_insn_gen_hint(AARCH64_INSN_HINT_BTIC);
> +	insns.literal = (u64)func;
> +	insns.insn[0] = cpu_to_le32(insn);
> +
> +	if (!func) {
> +		insn = aarch64_insn_gen_branch_reg(AARCH64_INSN_REG_LR,
> +						   AARCH64_INSN_BRANCH_RETURN);
> +	} else {
> +		insn = aarch64_insn_gen_branch_imm((u64)tramp + 4,
> +						   (u64)strip_cfi_jt(func),
> +						   AARCH64_INSN_BRANCH_NOLINK);
> +
> +		/*
> +		 * Use a NOP if the branch target is out of range, and rely on
> +		 * the indirect call instead.
> +		 */
> +		if (insn == AARCH64_BREAK_FAULT)
> +			insn = aarch64_insn_gen_hint(AARCH64_INSN_HINT_NOP);
> +	}
> +	insns.insn[1] = cpu_to_le32(insn);
> +
> +	ret = __aarch64_insn_write(tramp - 8, &insns, sizeof(insns));
> +	if (!WARN_ON(ret))
> +		caches_clean_inval_pou((u64)tramp - 8, sizeof(insns));
>  }
>  
>  int __kprobes aarch64_insn_patch_text_nosync(void *addr, u32 insn)
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index 50bab186c49b..e16860a14eaf 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -173,6 +173,7 @@ SECTIONS
>  			HIBERNATE_TEXT
>  			KEXEC_TEXT
>  			TRAMP_TEXT
> +			STATIC_CALL_TEXT
>  			*(.gnu.warning)
>  		. = ALIGN(16);
>  		*(.got)			/* Global offset table		*/
> -- 
> 2.30.2
> 

A CFI crash was reported in [1]. Also, I was able to reproduce a CFI
failure with just a simple "linux-perf" command. With this patchset I no
longer see these issues. Awesome!

[1] https://lore.kernel.org/all/YfrQzoIWyv9lNljh@google.com/

--
Carlos Llamas

