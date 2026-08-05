Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73709C55182
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 08:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RyFHAmnxx0/ymhDekWev9I5Arzzmwq8UaZpl1nESOE=; b=FyeJK/J+7XUGYqm8V47bLdI/lv
	P6XGTDRynBIEDh667KlgaUyraOylvO2s6DEVZOBsivkfC+JFIXXgRJ+tRZVSWR5B6MAiR/6bActmO
	m/fgQWXbz1mCD3VQPOh2rqqNHVbh7Jeejd5BENfeR7/oy/G/qZnGCw6XHIUSADaoc7QG7hLmooMOS
	hfByeeEkyUyivMov+93amWsN06u6aG3O40oPWyJx2DpCOFgzhMGEGcMraCg0TzqReL9O7BxjWEjwx
	Benha51c43UVMb88YGdM54a5mRFKJfkzWPhH9oIj78mb8HTtq0iWMExRv1Y28UGOgdk7WXrEnyVRl
	Ts5Noyyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWeh-00000003USC-02Hj;
	Wed, 05 Aug 2026 08:07:15 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWee-00000003URS-3CnI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 08:07:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785917230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0RyFHAmnxx0/ymhDekWev9I5Arzzmwq8UaZpl1nESOE=;
	b=Ikeaak2vrD3qJf+KaLdPzn2aI3Ty20b03euVkyMxY/zYnbA+2oCWqs3gOR2Uekow9uhsYE
	r1nouToSqwzgbWLZ2luegCLd0MG2F3kO5KG4innHraMepnTRrHiwig/BjBB1Rz9P/bKXtC
	hH6pD6QuxEEH9jVB0GkOG5JZrl/Ak84=
From: Atish Patra <atish.patra@linux.dev>
To: Paul Walmsley <pjw@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v8 05/22] RISC-V: Define indirect CSR access helpers
Date: Wed,  5 Aug 2026 01:07:06 -0700
Message-ID: <20260805080706.2895158-1-atish.patra@linux.dev>
In-Reply-To: <1b20aa77-0f0f-08c7-9439-972983adf709@kernel.org>
References: <1b20aa77-0f0f-08c7-9439-972983adf709@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010712_937909_C1FEC3B6 
X-CRM114-Status: GOOD (  27.07  )
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

On 8/4/26 6:39 PM, Paul Walmsley wrote:

> Thanks.  These macros seem better implemented as static inline functions.
> That also nicely aligns the code with what you write in the patch
> description.

Unfortunately these can't be functions - the conversion doesn't build once
anything calls them.

I applied your version of the header and switched the driver over to the
csr_indirect_* names. drivers/perf/riscv_pmu_sbi.o builds fine before the
change, and after it:

  CC      drivers/perf/riscv_pmu_sbi.o
  ./arch/riscv/include/asm/csr_indirect.h:30: Error: unknown CSR `iregcsr'
  ./arch/riscv/include/asm/csr_indirect.h:18: Error: unknown CSR `iregcsr'
  ./arch/riscv/include/asm/csr_indirect.h:30: Error: unknown CSR `iregcsr'
  ./arch/riscv/include/asm/csr_indirect.h:30: Error: unknown CSR `iregcsr'
  ./arch/riscv/include/asm/csr_indirect.h:30: Error: unknown CSR `iregcsr'
  ./arch/riscv/include/asm/csr_indirect.h:42: Error: unknown CSR `iregcsr'
  ./arch/riscv/include/asm/csr_indirect.h:43: Error: unknown CSR `iregcsr'
  ./arch/riscv/include/asm/csr_indirect.h:44: Error: unknown CSR `iregcsr'
  ./arch/riscv/include/asm/csr_indirect.h:45: Error: unknown CSR `iregcsr'
  make[4]: *** [scripts/Makefile.build:289: drivers/perf/riscv_pmu_sbi.o] Error 1

one error per inlined instantiation: line 18 is csr_indirect_read(), line
30 csr_indirect_write(), lines 42-45 the four accesses in
csr_indirect_warl().

The reason is that csr_read()/csr_write() stringify the CSR argument
straight into the inline asm template:

  #define csr_read(csr)                                         \
  ({                                                            \
        register unsigned long __v;                             \
        __asm__ __volatile__ ("csrr %0, " __ASM_STR(csr)        \
                              : "=r" (__v) :                    \
                              : "memory");                      \
        __v;                                                    \
  })

so the CSR operand has to be a literal token. With iregcsr as a function
parameter the template becomes "csrr %0, iregcsr", which the assembler
has no way to resolve.

This isn't a matter of inlining or of only ever passing constants:
__ASM_STR() expands in the preprocessor, long before inlining or constant
propagation, so __ASM_STR(iregcsr) is "iregcsr" regardless of what the
caller passes or which optimisation level is used. It isn't
toolchain-specific either - gcc 12, gcc 16 and clang 22 all reject it,
clang with the more explicit "operand must be a valid system register
name or an integer in the range [0, 4095]".

The underlying reason is architectural rather than a quirk of the macro:
csrr/csrw encode the CSR as a 12-bit immediate and there is no
register-indirect form. Which is of course why Sscsrind exists in the
first place, but the sireg CSR number itself still has to be an
immediate. That constraint is also why asm/csr.h keeps all seven
accessors (csr_read, csr_write, csr_swap, csr_set, csr_clear,
csr_read_set, csr_read_clear) as macros, with no static inline variant of
any of them.

The reason for-next is green today is that this patch only adds the
header. The callers are in patches 12 and 14, which aren't applied yet,
and an uncalled static inline isn't emitted, so the bad asm never reaches
the assembler. It breaks as soon as the driver patches land.

The only way to keep a function signature would be a switch with a
literal CSR in each arm. The driver uses four of the IREG CSRs - CSR_SIREG
for the counter, CSR_SIREG2 for the hpmevent, and CSR_SIREG4 / CSR_SIREG5
for the rv32 high halves - so that would mean a four-arm switch in each of
the three helpers, which seems clearly worse than the macro.

One clarification on your version, since only part of it is a problem: the
iselbase/iseloff parameters are fine as values - they're data written to
the literal CSR_ISELECT, not a CSR number. It's specifically iregcsr that
can't be a variable.

> That also nicely aligns the code with what you write in the patch
> description.

Fair point, and that mismatch is real - the changelog says "Add a few
helper functions" while the patch defines macros. Since the macros have to
stay, I'll fix it from the other side: reword the body to say helper
macros (matching the subject, which already says "helpers") and add a line
explaining why they can't be functions, so the next reader doesn't have to
rediscover it.

> Also, I renamed this file to change the abbreviation "ind" to "indirect",
> along the lines of this feedback here:
>
>    https://lore.kernel.org/linux-riscv/CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com/
>
> This case is even worse since there are already uses of "csr_index" in
> the codebase, so it's even more unclear what "ind" is supposed to mean.

No objection at all - csr_indirect_* and csr_indirect.h are clearer, and
the collision with the existing csr_index uses is a good argument on its
own. (The driver has its own rvpmu_csr_index(), which is exactly the
confusion you're describing.) I'll use the new names in the driver
patches.

> Updated patch follows.  Please let me know if you have any objections,

So: renames yes, macros-to-functions no. If 6f1ece4a6691 can still be
amended, the fix is to keep your rename and restore the macro bodies.
Happy to send that as a patch if that's easier, or as a fixup on top of
for-next if the branch has already been published - just let me know which
you prefer.

Thanks for picking up the earlier patches.

--
Regards,
Atish

