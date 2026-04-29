Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC08FFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVJtGfrjYURovUdCmG6byDFHRVqxjIXUlQS6MxC0AZA=; b=ODa/bGyE2MZm8vhBgMe9LITpf7
	FG9muvBAbEqNYAt5bbz1ENMjh5pVcN9+mTx8xAw+HDQqwJ2gWpug5ZuuEWMH8rlAWpu4V5R/ik3Lq
	h4zFu9SlWa/i8qru24is85o17EzSAGftiiubAJ4fYj/EAVG9U4aA69LmLDcQqW8nTcUgMt5wOqKLK
	dp0F6GQ7nL9PybdQII7UQ2eqAcFaLYZCdoI3IU6pkuov25fGusF87DUG3EybDnNSCLqlxGEOht+CV
	QhEy1cP1WdT/Nyh8+9qCx/6pkoLW84p/ItEkeIBYwBMXpaGj6wYfyWEyodzVY6DXr6W/eKzARMA35
	wDUHuHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8YQ-00000003xtj-3dT6;
	Wed, 29 Apr 2026 17:18:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8YO-00000003xtL-0Upi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:18:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CBE416A3;
	Wed, 29 Apr 2026 10:18:20 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 795CD3F7B4;
	Wed, 29 Apr 2026 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777483106; bh=WCiGNRn2qwDtYs/NqzSwakKuBgzsRsKcTs+ZB/aD1y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivW6JqD+y0MACxJ+86+b4GWNjMjTyMHjNp9492Vnp74Gq26CLTzxWIN3HdQBj6vzx
	 CMmDkojPEVmcj29TCrxFtWuyskDix1pyV8PclfJYJOnyeDxTNcWZ/UCha04Jv+pqvr
	 HgBDtAw/uBiWnDpGg/6+BcTd8JQDzAXTp4vr/EOk=
Date: Wed, 29 Apr 2026 18:18:19 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Indu Bhagat <ibhagatgnu@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
	joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <afI9W5gj6Eo-bYi3@J2N7QTR9R3.cambridge.arm.com>
References: <20260428183643.3796063-1-dylanbhatch@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428183643.3796063-1-dylanbhatch@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_101828_259937_60B44512 
X-CRM114-Status: GOOD (  32.43  )
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

Hi Dylan,

On Tue, Apr 28, 2026 at 06:36:35PM +0000, Dylan Hatch wrote:
> Implement a generic kernel sframe-based [1] unwinder. The main goal is
> to improve reliable stacktrace on arm64 by unwinding across exception
> boundaries.

Thanks for this!

Just as a holding reply: I'm going over the series now, and I have some
partially-written comments that I'll try to finish up and get out
tomorrow.

Mark.

> On x86, the ORC unwinder provides reliable stacktrace through similar
> methodology, but arm64 lacks the necessary support from objtool to
> create ORC unwind tables.
> 
> Currently, there's already a sframe unwinder proposed for userspace: [2].
> To maintain common definitions and algorithms for sframe lookup, a
> substantial portion of this patch series aims to refactor the sframe
> lookup code to support both kernel and userspace sframe sections.
> 
> Currently, only GNU Binutils support sframe. This series relies on the
> Sframe V3 format, which is supported in binutils 2.46.
> 
> These patches are based on Steven Rostedt's sframe/core branch [3],
> which is and aggregation of existing work done for x86 sframe userspace
> unwind, and contains [2]. This branch is, in turn, based on Linux
> v7.0-rc3. This full series (applied to the sframe/core branch) is
> available on github: [4].
> 
> Ref:
> [1]: https://sourceware.org/binutils/docs/sframe-spec.html
> [2]: https://lore.kernel.org/lkml/20260127150554.2760964-1-jremus@linux.ibm.com/
> [3]: https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/log/?h=sframe/core
> [4]: https://github.com/dylanbhatch/linux/tree/sframe-v5
> 
> Changes since v4:
>   - (Jens) Fix some minor nits.
>   - Handle .init.text and .exit.text in function address validation.
> 
> Changes since v3:
> 
>   - (Jens) Clean up patch summaries.
>   - (Jens) Rename SFRAME_LOOKUP -> UNWIND_SFRAME_LOOKUP to fit existing
>     naming convention.
>   - (Randy) Correct typo errors in new config options.
>   - (Jens) Move unwind types to a new unwind_types.h to match their
>     usage.
>   - (Jens) Update KERNEL_[COPY|GET] to use label-based error handling
>     like their userspace counterparts.
>   - (Jens) Rename SFRAME_UNWINDER -> HAVE_UNWIND_KERNEL_SFRAME and
>     ARCH_SUPPORTS_SFRAME_UNWINDER -> ARCH_SUPPORTS_UNWIND_KERNEL_SFRAME
>     to match existing naming convention.
>   - (Jens) Move HAVE_UNWIND_KERNEL_SFRAME config option to arch/Kconfig.
>   - (Jens) Rename/move extern definitions of __[start|end]_sframe into
>     include/asm-generic/sections.h.
>   - (Jens) Fix up CFI annotations at kernel entry.
>   - (Jens) Fix error path for unsorted FDE lookup.
>   - (Jens) Zero-out module sframe_section before init.
>   - (Jens) For SFRAME_VALIDATION, use an arch-specific function-address
>     validation helper so that .rodata.text can be correctly handled on
>     arm64 vmlinux.
>   - (Jens) Fixup and better comment kernel stacktrace code.
> 
> Changes since v2:
> 
> The biggest change from v2 is the switch from adding a dedicated,
> in-kernel sframe-lookup library, to refactoring/using the existing
> library developed by Josh, Jens, and Steve. Consequently, this series
> now depends on Sframe V3, though this upgrade would likely have been
> necessary anyway. Below is a full accounting of the changes since v2.
> 
>   - (Josh) Add stricter reliability checks during unwind.
>   - (Puranjay, Indu, Jens) Update to use a common sframe library with
>     userpace unwind, thus resolving the need to support
>     SFRAME_F_FDE_FUNC_START_PCREL, added in binutils 2.45.
>   - (Jens) Add check for sframe V3, thus resolving the prior need for V2
>     and SFRAME_F_FDE_FUNC_START_PCREL support.
>   - (Will) Add ARCH_SUPPORTS_SFRAME_UNWINDER, remove SFRAME_UNWIND_TABLE
>   - (Indu) add support for unsorted FDE tables, allowing for module
>     sframe lookups.
>   - (Mark) Prefer frame-pointer unwind when possible, for better
>     performance.
>   - Simplify compile-time logic, adding stubbs when necessary.
>   - Add support for in-kernel SFRAME_VALIDATION.
>   - Rebase onto core/sframe (with v7.0-rc3 base)
> 
> Dylan Hatch (7):
>   sframe: Allow kernelspace sframe sections
>   arm64, unwind: build kernel with sframe V3 info
>   sframe: Provide PC lookup for vmlinux .sframe section
>   sframe: Allow unsorted FDEs
>   arm64/module, sframe: Add sframe support for modules
>   sframe: Introduce in-kernel SFRAME_VALIDATION
>   unwind: arm64: Use sframe to unwind interrupt frames
> 
> Weinan Liu (1):
>   arm64: entry: add unwind info for various kernel entries
> 
>  MAINTAINERS                                   |   3 +-
>  Makefile                                      |   8 +
>  arch/Kconfig                                  |  27 +-
>  arch/arm64/Kconfig                            |   1 +
>  arch/arm64/include/asm/module.h               |   6 +
>  arch/arm64/include/asm/sections.h             |   1 +
>  arch/arm64/include/asm/stacktrace/common.h    |   6 +
>  arch/arm64/include/asm/unwind_sframe.h        |  55 +++
>  arch/arm64/kernel/entry.S                     |  23 +
>  arch/arm64/kernel/module.c                    |   8 +
>  arch/arm64/kernel/setup.c                     |   2 +
>  arch/arm64/kernel/stacktrace.c                | 246 ++++++++++-
>  arch/arm64/kernel/vdso/Makefile               |   2 +-
>  arch/arm64/kernel/vmlinux.lds.S               |   2 +
>  .../{unwind_user_sframe.h => unwind_sframe.h} |   6 +-
>  arch/x86/include/asm/unwind_user.h            |  12 +-
>  include/asm-generic/sections.h                |   4 +
>  include/asm-generic/vmlinux.lds.h             |  15 +
>  include/linux/sframe.h                        |  67 ++-
>  include/linux/unwind_types.h                  |  46 ++
>  include/linux/unwind_user_types.h             |  41 --
>  kernel/unwind/Makefile                        |   2 +-
>  kernel/unwind/sframe.c                        | 410 ++++++++++++++----
>  kernel/unwind/user.c                          |  41 +-
>  24 files changed, 827 insertions(+), 207 deletions(-)
>  create mode 100644 arch/arm64/include/asm/unwind_sframe.h
>  rename arch/x86/include/asm/{unwind_user_sframe.h => unwind_sframe.h} (50%)
>  create mode 100644 include/linux/unwind_types.h
> 
> -- 
> 2.54.0.545.g6539524ca2-goog
> 

