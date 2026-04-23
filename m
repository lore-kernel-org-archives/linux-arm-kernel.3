Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9AFF589D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/xnNBDAuKI5lGMLmBUZPcxHKmN7CjhYOz8WFSZl0+0=; b=gGSdRDKqLDDZ+l8J+LVkUNP7IG
	azG+ULk6BM0YTxc3serrK7Dieff3rw5ORZds93n89UDXqFlr5h/AfofOLOygY449Wn/zhZCXkOSFE
	gMEY8i3oiIy1OjeZ4s7EWz95DHaU8TOV51CFowqzkq/SE6IYVHj+oMfU6cOzf3BqCYJ5pWs6dNKAK
	Fb3i2LQRbdcAkn9+hM+n2u/D5ysX116RTM0DU+VkF8EsIKr4xhebTpTpwufMFOnBPIrdqw5v//1+5
	z//N1zlmnlrubU/ROLeYJQb4kjwN/loNpIv0uv4wqXIKLdCvTZmjkhycoADPUJFWj6c2KHlS0XORi
	svFBm4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuYB-0000000BmMF-1LyI;
	Thu, 23 Apr 2026 13:57:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuY7-0000000BmLr-0QGh;
	Thu, 23 Apr 2026 13:57:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74CAB1BF7;
	Thu, 23 Apr 2026 06:56:50 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAD5A3F641;
	Thu, 23 Apr 2026 06:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776952615; bh=6LfUy7I1VMNamQxWSciFQf6jdTAWYyv2Ia/cLP4B6X4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBflTTAD1Nx18ZIKce0DB9rGA61RgIzbWsTnQaMaNQevsXWb4YJJhzTVK+mi1B9WL
	 d2rQAEWHeYRvbN0Ht4CDh4jY2GpWlPqjntX33LzvDdGBDahRo8Y4EieF31A8JyVGut
	 4w7a0aEAoP5zijGVD9Bbjnm6gchimq3SzV4phl5Q=
Date: Thu, 23 Apr 2026 14:56:47 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Naman Jain <namjain@linux.microsoft.com>
Cc: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Kelley <mhklinux@outlook.com>,
	Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, vdso@mailbox.org,
	ssengar@linux.microsoft.com
Subject: Re: [PATCH v2 07/15] arm64: hyperv: Add support for
 mshv_vtl_return_call
Message-ID: <aeolHwXHFH4AnX_n@J2N7QTR9R3.cambridge.arm.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
 <20260423124206.2410879-8-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423124206.2410879-8-namjain@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_065659_231526_5CF2CB5F 
X-CRM114-Status: GOOD (  25.34  )
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

On Thu, Apr 23, 2026 at 12:41:57PM +0000, Naman Jain wrote:
> Add the arm64 variant of mshv_vtl_return_call() to support the MSHV_VTL
> driver on arm64. This function enables the transition between Virtual
> Trust Levels (VTLs) in MSHV_VTL when the kernel acts as a paravisor.
> 
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> Reviewed-by: Roman Kisel <vdso@mailbox.org>
> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
> ---
>  arch/arm64/hyperv/Makefile        |   1 +
>  arch/arm64/hyperv/hv_vtl.c        | 158 ++++++++++++++++++++++++++++++
>  arch/arm64/include/asm/mshyperv.h |  13 +++
>  arch/x86/include/asm/mshyperv.h   |   2 -
>  drivers/hv/mshv_vtl.h             |   3 +
>  include/asm-generic/mshyperv.h    |   2 +
>  6 files changed, 177 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/hyperv/hv_vtl.c
> 
> diff --git a/arch/arm64/hyperv/Makefile b/arch/arm64/hyperv/Makefile
> index 87c31c001da9..9701a837a6e1 100644
> --- a/arch/arm64/hyperv/Makefile
> +++ b/arch/arm64/hyperv/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-y		:= hv_core.o mshyperv.o
> +obj-$(CONFIG_HYPERV_VTL_MODE)	+= hv_vtl.o
> diff --git a/arch/arm64/hyperv/hv_vtl.c b/arch/arm64/hyperv/hv_vtl.c
> new file mode 100644
> index 000000000000..59cbeb74e7b9
> --- /dev/null
> +++ b/arch/arm64/hyperv/hv_vtl.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026, Microsoft, Inc.
> + *
> + * Authors:
> + *     Roman Kisel <romank@linux.microsoft.com>
> + *     Naman Jain <namjain@linux.microsoft.com>
> + */
> +
> +#include <asm/mshyperv.h>
> +#include <asm/neon.h>
> +#include <linux/export.h>
> +
> +void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0)
> +{
> +	struct user_fpsimd_state fpsimd_state;
> +	u64 base_ptr = (u64)vtl0->x;
> +
> +	/*
> +	 * Obtain the CPU FPSIMD registers for VTL context switch.
> +	 * This saves the current task's FP/NEON state and allows us to
> +	 * safely load VTL0's FP/NEON context for the hypercall.
> +	 */
> +	kernel_neon_begin(&fpsimd_state);
> +
> +	/*
> +	 * VTL switch for ARM64 platform - managing VTL0's CPU context.
> +	 * We explicitly use the stack to save the base pointer, and use x16
> +	 * as our working register for accessing the context structure.
> +	 *
> +	 * Register Handling:
> +	 * - X0-X17: Saved/restored (general-purpose, shared for VTL communication)
> +	 * - X18: NOT touched - hypervisor-managed per-VTL (platform register)
> +	 * - X19-X30: Saved/restored (part of VTL0's execution context)
> +	 * - Q0-Q31: Saved/restored (128-bit NEON/floating-point registers, shared)
> +	 * - SP: Not in structure, hypervisor-managed per-VTL
> +	 *
> +	 * X29 (FP) and X30 (LR) are in the structure and must be saved/restored
> +	 * as part of VTL0's complete execution state.
> +	 */
> +	asm __volatile__ (
> +		/* Save base pointer to stack explicitly, then load into x16 */
> +		"str %0, [sp, #-16]!\n\t"     /* Push base pointer onto stack */
> +		"mov x16, %0\n\t"             /* Load base pointer into x16 */
> +		/* Volatile registers (Windows ARM64 ABI: x0-x17) */
> +		"ldp x0, x1, [x16]\n\t"
> +		"ldp x2, x3, [x16, #(2*8)]\n\t"
> +		"ldp x4, x5, [x16, #(4*8)]\n\t"
> +		"ldp x6, x7, [x16, #(6*8)]\n\t"
> +		"ldp x8, x9, [x16, #(8*8)]\n\t"
> +		"ldp x10, x11, [x16, #(10*8)]\n\t"
> +		"ldp x12, x13, [x16, #(12*8)]\n\t"
> +		"ldp x14, x15, [x16, #(14*8)]\n\t"
> +		/* x16 will be loaded last, after saving base pointer */
> +		"ldr x17, [x16, #(17*8)]\n\t"
> +		/* x18 is hypervisor-managed per-VTL - DO NOT LOAD */
> +
> +		/* General-purpose registers: x19-x30 */
> +		"ldp x19, x20, [x16, #(19*8)]\n\t"
> +		"ldp x21, x22, [x16, #(21*8)]\n\t"
> +		"ldp x23, x24, [x16, #(23*8)]\n\t"
> +		"ldp x25, x26, [x16, #(25*8)]\n\t"
> +		"ldp x27, x28, [x16, #(27*8)]\n\t"
> +
> +		/* Frame pointer and link register */
> +		"ldp x29, x30, [x16, #(29*8)]\n\t"
> +
> +		/* Shared NEON/FP registers: Q0-Q31 (128-bit) */
> +		"ldp q0, q1, [x16, #(32*8)]\n\t"
> +		"ldp q2, q3, [x16, #(32*8 + 2*16)]\n\t"
> +		"ldp q4, q5, [x16, #(32*8 + 4*16)]\n\t"
> +		"ldp q6, q7, [x16, #(32*8 + 6*16)]\n\t"
> +		"ldp q8, q9, [x16, #(32*8 + 8*16)]\n\t"
> +		"ldp q10, q11, [x16, #(32*8 + 10*16)]\n\t"
> +		"ldp q12, q13, [x16, #(32*8 + 12*16)]\n\t"
> +		"ldp q14, q15, [x16, #(32*8 + 14*16)]\n\t"
> +		"ldp q16, q17, [x16, #(32*8 + 16*16)]\n\t"
> +		"ldp q18, q19, [x16, #(32*8 + 18*16)]\n\t"
> +		"ldp q20, q21, [x16, #(32*8 + 20*16)]\n\t"
> +		"ldp q22, q23, [x16, #(32*8 + 22*16)]\n\t"
> +		"ldp q24, q25, [x16, #(32*8 + 24*16)]\n\t"
> +		"ldp q26, q27, [x16, #(32*8 + 26*16)]\n\t"
> +		"ldp q28, q29, [x16, #(32*8 + 28*16)]\n\t"
> +		"ldp q30, q31, [x16, #(32*8 + 30*16)]\n\t"
> +
> +		/* Now load x16 itself */
> +		"ldr x16, [x16, #(16*8)]\n\t"
> +
> +		/* Return to the lower VTL */
> +		"hvc #3\n\t"

NAK to this.

* This is a non-SMCCC hypercall, which we have NAK'd in general in the
  past for various reasons that I am not going to rehash here.

* It's not clear how this is going to be extended with necessary
  architecture state in future (e.g. SVE, SME). This is not
  future-proof, and I don't believe this is maintainable.

* This breaks general requirements for reliable stacktracing by
  clobbering state (e.g. x29) that we depend upon being valid AT ALL
  TIMES outside of entry code.

* IMO, if this needs to be saved/restored, that should happen in
  whatever you are calling.

Mark.

