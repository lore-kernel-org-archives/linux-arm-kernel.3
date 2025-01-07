Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28965E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fTkvWOe4RC1Gy9HBvIUlwxeM5nDVMqcYa3RlhIumIao=; b=ru/Vc4Et1vpxp0
	dtYpIgU+Cwh0OUqVtFKjmdoVi5WE2UZJPxGHtrk1KPe1JbhsIseW0wJw2EomLqkfE+FZEeJvd2XB3
	9H6fdFnJYjNSO627bwnCM60z7MgWhXjqVuzowsMt6YVqXNxBb/scWqMs4p9+iumsPZkYvPoxpqSR5
	cY5ksse+huQccReYcWFoYxBOJX6CnHeGjGWEUkeQRuKT4eDvQIOqYF5SKigTE/gobhBTX6+dAliuJ
	LWbM1xYWqPagCWJfsTmjbLfS2OTC5R4ygLB/TNThjFhHBBfrq9xUQHdYTp0sJrtLperI4pknmAJct
	y2LHeVTGzgLb9PnWfb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV66n-00000004Ap8-0Y3A;
	Tue, 07 Jan 2025 09:42:45 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65X-00000004AJO-4BPQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:31 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so2540090866b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242886; x=1736847686; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTkvWOe4RC1Gy9HBvIUlwxeM5nDVMqcYa3RlhIumIao=;
        b=SeDfOGjuuon7HYy77pfgrEAqrTFZLHx+UTPrkgcE4u/F1+EimogtF7vZNw3YyRy+vJ
         Ze4r+DiiJr4bXC49yQp6GFLHqb9PO7flUm3Xoj7tLvvPcpw9mxhqsB7sqbA2+A+k6uDf
         woTDdTw7aLnhP64znUg1LMjpbJqyQ7G4NuKtSIFu3y3/aR/OBiVaJsxxzHDqdLix8tqZ
         Q+rrP8SYOeoDOZfqRH+QfiWoe1YsfOANDZLE+Prpu4sMWM3AhA0k6ogWw4SrflpJNYqh
         PWfyBjnO5pIxZdJKSgP3Q+RT7I6qLXv41Fc0kAtNbgt/MwTdbiXQ+VK3Lpl0nzBTcVFo
         kO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242886; x=1736847686;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTkvWOe4RC1Gy9HBvIUlwxeM5nDVMqcYa3RlhIumIao=;
        b=assX1AzMYZTuGo6fD3Hh+5pk2qSPTm3aBujMxmPUfbpONK3T0GsibRhWn7oqGfQtTz
         aWVYSHxr58cVywgBOaxorxtQP6QW85M3Hoe2ycUxcjTY/GrsshQVPhr3h/nRLx0ISXKx
         5ORgMNOZhgWV9sNUwEOJwUWANnyZEIl2rEuyXOftH61SGYVw7FdTV02n4YETY+J3Uc4n
         XsbBTWP/OUxGhHvQP4Up2okJa8WGczgxDVXDo91MvGqD6xrF0nLhlE6VWQ6q/x2adP8O
         3ZkTkRKZwGYVLaHHkJiV54HSB9P4JqC1fLK2CyJeCkYZHGKBWr9k4DV4XCFOiU1+f1Sc
         Ogqw==
X-Gm-Message-State: AOJu0YwCvFKqERrU5aWfZyI+/k13BmVBoVV5e+atxjC4wTEVixClYCML
	8mKhGFAHpAr1/XJ+1WRegs21+PzOikw/pITn/0KGvlfQ0Raaix6iEw80777W+/4=
X-Gm-Gg: ASbGncuvliHMW7tyXpS0/Nb62lZBhcVYve6CgrTobX8orZSaldVexdAzAxstKLwF4fy
	A0yG0rfFbjBI/4LcQXYpNom7K0qeGBBKBitiW6uQ6FIpz1Kq68XV6SqfRntSVfvu+1KtSKwxX91
	g4RUGZZ5iT+nVWUa2UsHeCFpokD7qk9AgeXulL8mNkXKmCVYtloXsH3Q91Kum5/5Gbl6Xhd4UJ7
	a2k8yGhjMAtiIhwG9Y4+1BcldOBsJV3j9ZCxSe9hkYNAyE8mK9A73oLiyxKCuJ21Z0=
X-Google-Smtp-Source: AGHT+IFH5SCfQwTXiSm88Kb37eWCb5L2iVqL/7EEtdF7zeLPJ6PvaRVFoIJPW/YkItt7U+YHS7xn+w==
X-Received: by 2002:a17:907:1998:b0:aae:ef24:888d with SMTP id a640c23a62f3a-aaeef248da7mr4327696266b.55.1736242885486;
        Tue, 07 Jan 2025 01:41:25 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:25 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH RFC v3 00/30] ARM: Switch to generic entry
Date: Tue, 07 Jan 2025 10:41:16 +0100
Message-Id: <20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALz2fGcC/23NTQrCMBAF4KtI1kbyS1tXguAB3IqLpJ22AU1kU
 oKl9O7GrBS6fG943ywkAjqI5LhbCEJy0QWfg9zvSDsaPwB1Xc5EMKFYwyQ1+KQD+LxqKfgJZ2o
 6w5WWVW0tkLx7IfTuXcwbuV7O5J7L0cUp4Fz+JF5OX5IzzjbIxCmjtlG90rxjdWVPD+cNhkPAo
 XBJ/BCi2SJEJnQlNW+MhV7Wf8S6rh/0Dai3+wAAAA==
X-Change-ID: 20240903-arm-generic-entry-ada145378bbe
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_014128_059416_567F2048 
X-CRM114-Status: GOOD (  46.81  )
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

This patch series converts a slew of ARM assembly into the
corresponding C code, step by step moving the codebase
closer to the expectations of the generic entry code,
and as a last step switches ARM over to the generic
entry code, and an RFC patch fixes a bunch of warnings
from lockdep and the context tracker.

This was inspired by Jinjie Ruans similar work for ARM64.

The low-level assembly calls into arch/arm/kernel/syscall.c
to invoke syscalls from userspace, and to the functions listed
in arch/arm/kernel/entry.c for any other transitions to
and from userspace. Looking at these functions and the
call sites in the assembly on the final result should give
a pretty good idea about how this works, and what the
generic entry expects from an architecture.

This is still a work in progress but improved a bit since
v2. Main things to be fixed: ARM v7m, some splat on Debian
boot and discussion around the RFC patch.

There is a git branch you can pull in and test (v6.13-rc1
based):
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/log/?h=b4/arm-generic-entry-v6.13-rc1

Upsides:

- Same code paths as x86, S390, RISCV, Loongarch and probably
  soon ARM64 is used for the ARM systems. This includes some
  instrumentation stubs helping out with things we haven't
  even started to look at such as kmsan and live patching (!).

- By introducing the new callbacks to C, we can move away
  from the deprecated (and I think partly unmaintained) context
  tracking mechanism for RCU (user_exit_callable(),
  user_enter_callable()) in favor of what everyone else
  is using, i.e. calling rcu_irq_enter_check_tick() on
  IRQ entry. If we do not go with this patch set we can
  perhaps look into a separate patch just switching ARM32
  to the new context tracking, as tests show the performance
  impact appears negligible for this.

- I think also lockdep is now behaving more according to
  expectations (the lockdep calls in ARM64 and generic entry
  seems different and more fine-granular from the ARM32 code)
  and the three warnings I see on Vexpress boots with mainline
  goes away after this patch set, but I am no expert in lockdep
  so I cannot really tell if this is a real improvement.
  The patches does make ARM lockdep clean.

Downsides:

- I had to remove the "fast syscall restart" from Al Viro.
  I don't know how much it will affect performance, but
  if this is something we must have, let's try to make
  the solution generic, i.e. add fast syscall restart in
  the generic entry code.

- The "superfast return to userspace" using just very
  small assembly snippets to get back to userspace on
  e.g. IRQs if and only if no instrumentation was compiled
  in, is no longer possible, since we unconditionally
  call into code written in C. I *think* this accounts
  for the majority of the ~3-4% performance impact (see
  measurements below).

TODO:

- ARM v7m, I don't even know how to get a system with
  this to start testing.

- Should the abort exceptions also go as "interrupts"?

Testing:

- Booted into Versatile Express QEMU (ARMv7), Ux500 full
  graphic UI (PostmarketOS Phosh, ARMv7 on hardware,
  Gemini ARMv4 on hardware. No special issues.

- Tested some ptrace/strace obviously, such as issuing
  several instances of "ptrace find /" and let this scroll
  by in the terminal over some 10 minutes or so.

- Turned on RCU torture tests and ran for a while. Seems
  stable and the test outputs look normal.

- Ran stress-ng, works fine.

- Booted with "lockdep" (CONFIG_PROVE_LOCKING). The ARM32
  mainline produce 3 warnings at boot and those go away
  after these patches. I haven't looked closer at what
  it was that I inadvertedly fixed here, but I suspect the
  current context tracking has the same issues as what
  I fix in the RFC patch.

Caveat:

- Since we are not nested and not the idle task the following
  was triggered in rcu.c while in __und_usr, __dabt_usr or
  __pabt_usr:

  /*
   * If we're not in an interrupt, we must be in the idle task!
   */
  WARN_ON_ONCE(!nesting && !is_idle_task(current));

  What I think we see is that data/prefetch and undefined instruction
  exceptions on ARM are not really interrupts as they don't disable
  actual IRQs while being handled so we get nesting outside of the
  kernels control.

  The last RFC patch in the patch set illustrates clearly what the
  problem is and provides a possible workaround / best effort.
  But we need to discuss this first.

Performance impact:

The changes were tested using the standard syscall overhead
testing oneliner:

  perf bench syscall all

This executes 10,000,000 getppid() in sequence and measures
the time taken for this to complete. The numbers vary a bit
but they are consistent.

In QEMU I tested with Vexpress and two CPU cores (-M vexpress-a15
-m 2G -smp cpus=2). DRM graphics and framebuffer was activated to
give a bit of background IRQ activity (vsync interrupts).

I ran the perf command three times on each configuration, and
picked the one iteration where the original code performed the
best, and the one where the patches kernel performed the worst, to
get a worst-case comparison.

v6.13-rc1 vexpress_defconfig, best invocation:

     Total time: 149.380 [sec]
      14.938072 usecs/op
         66,943 ops/sec

v6.13-rc1 vexpress_defconfig, and this patch set, worst invocation:

     Total time: 158.312 [sec]
      15.831248 usecs/op
         63,166 ops/sec

Here we see a performance degradation of around 6% operations/sec
for a vexpress dualcore defconfig in the best vs worst case. (This
isn't statistically correct, the effect is likely smaller.)

Debians stock kernel was noticably faster, so I investigated what
causes this. It turns out that the big performance hog for syscalls
is actually PAN, and I think Debian armhf simply turns this off.
So I re-did the tests with CONFIG_ARM_PAN turned off to emulate the
impact on stock Debian:

v6.13-rc1 vexpress_defconfig, !PAN, best invocation:

     Total time: 36.882 [sec]
       3.688294 usecs/op
        271,128 ops/sec

v6.13-rc1 vexpress_defconfig, !PAN and this patch set, worst
invocation:

     Total time: 39.266 [sec]
       3.926700 usecs/op
        254,666 ops/sec

Again we see around 6%.

To conclude if any of this was due to the new context tracking,
at one point I tested to patch back the old context tracking on top
of generic entry. This is hardly something that can be recommended,
and anyway showed no noticeable overhead difference.

Open questions:

- Generic entry requires PTRACE_SYSEMU and PTRACE_SYSEMU_SINGLESTEP
  to be defined. I added them but don't even know what they
  do or if generic entry magically adds support for them
  (probably not) so I need help here.

- I need Al Viro's input on how to deal with the "fast syscall
  restart" that I bluntly deleted, if we need to reincarnate it
  in the generic entry or what we shall do here.

- I need to test with an OABI rootfs.

- I need to fix ARM v7m

- Should I skip the new entry.c and just put all new code into
  the good old trap.c?

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Rewrote the code in entry.c so the IRQ handler saves pt_regs
  calls IRQ handler (including switching to IRQ stack!) and
  restores pt_regs in one function instead of one entry and
  one exit function. This is what every other arch using
  generic entry is doing, and we should do it too.
- The rewrite solved the caveat warnings from the previous patch
  set which was blatantly not SMP safe :/
- Rewrite the data abort and prefetch abort handlers in a
  separate patch which we may squash in the end, but this makes
  the patch set easier to review.
- Drop a pointless patch rewriting the NMI handlers in C, it's
  better to just patch into the end result in the last patch,
  as we're replacing handle_fiq_as_nmi().
- Syscall C invocations have to be tagged __ADDRESSABLE() in order
  not to upset KCFI: the file is only referenced in both ends by
  assembly so we need to point this out to the compiler.
- Link to v2: https://lore.kernel.org/r/20241029-arm-generic-entry-v2-0-573519abef38@linaro.org

Changes in v2:
- Performance impact measurements have been provided.
- Link to v1: https://lore.kernel.org/r/20241010-arm-generic-entry-v1-0-b94f451d087b@linaro.org

---
Linus Walleij (30):
      ARM: Prepare includes for generic entry
      ARM: ptrace: Split report_syscall()
      ARM: entry: Skip ret_slow_syscall label
      ARM: process: Rewrite ret_from_fork i C
      ARM: process: Remove local restart
      ARM: entry: Invoke syscalls using C
      ARM: entry: Rewrite two asm calls in C
      ARM: entry: Move trace entry to C function
      ARM: entry: save the syscall sp in thread_info
      ARM: entry: move all tracing invocation to C
      ARM: entry: Merge the common and trace entry code
      ARM: entry: Rename syscall invocation
      ARM: entry: Create user_mode_enter/exit
      ARM: entry: Drop trace argument from usr_entry macro
      ARM: entry: Separate call path for syscall SWI entry
      ARM: entry: Drop argument to asm_irqentry macros
      ARM: entry: Implement syscall_exit_to_user_mode()
      ARM: entry: Drop the superfast ret_fast_syscall
      ARM: entry: Remove fast and offset register restore
      ARM: entry: Untangle ret_fast_syscall/to_user
      ARM: entry: Do not double-call exit functions
      ARM: entry: Move work processing to C
      ARM: entry: Stop exiting syscalls like IRQs
      ARM: entry: Complete syscall and IRQ transition to C
      ARM: entry: Create irqentry calls from kernel mode
      ARM: entry: Move in-kernel hardirq tracing to C
      ARM: irq: Add irqstack helpers
      ARM: entry: Convert to generic entry
      ARM: entry: Handle prefetch and data aborts as interrupts
      RFC: ARM: entry: Block IRQs in early IRQ context

 arch/arm/Kconfig                    |   1 +
 arch/arm/include/asm/entry-common.h |  66 ++++++++++++
 arch/arm/include/asm/entry.h        |  14 +++
 arch/arm/include/asm/ptrace.h       |   8 +-
 arch/arm/include/asm/signal.h       |   4 -
 arch/arm/include/asm/stacktrace.h   |   2 +-
 arch/arm/include/asm/switch_to.h    |   4 +
 arch/arm/include/asm/syscall.h      |   7 ++
 arch/arm/include/asm/thread_info.h  |  18 +---
 arch/arm/include/asm/traps.h        |   5 +-
 arch/arm/include/uapi/asm/ptrace.h  |   2 +
 arch/arm/kernel/Makefile            |   5 +-
 arch/arm/kernel/asm-offsets.c       |   1 +
 arch/arm/kernel/entry-armv.S        |  83 ++++-----------
 arch/arm/kernel/entry-common.S      | 198 +++++++++++++-----------------------
 arch/arm/kernel/entry-header.S      | 100 ++----------------
 arch/arm/kernel/entry.c             | 115 +++++++++++++++++++++
 arch/arm/kernel/irq.c               |  31 ++++++
 arch/arm/kernel/irq.h               |   3 +
 arch/arm/kernel/process.c           |  25 ++++-
 arch/arm/kernel/ptrace.c            |  76 --------------
 arch/arm/kernel/signal.c            |  57 ++---------
 arch/arm/kernel/syscall.c           |  32 ++++++
 arch/arm/kernel/traps.c             |  29 +-----
 arch/arm/mm/abort-ev4.S             |   2 +-
 arch/arm/mm/abort-ev4t.S            |   2 +-
 arch/arm/mm/abort-ev5t.S            |   4 +-
 arch/arm/mm/abort-ev5tj.S           |   6 +-
 arch/arm/mm/abort-ev6.S             |   2 +-
 arch/arm/mm/abort-ev7.S             |   2 +-
 arch/arm/mm/abort-lv4t.S            |  36 +++----
 arch/arm/mm/abort-macro.S           |   2 +-
 arch/arm/mm/abort-nommu.S           |   2 +-
 arch/arm/mm/fault.c                 |   4 +-
 arch/arm/mm/fault.h                 |   8 +-
 arch/arm/mm/pabort-legacy.S         |   2 +-
 arch/arm/mm/pabort-v6.S             |   2 +-
 arch/arm/mm/pabort-v7.S             |   2 +-
 38 files changed, 460 insertions(+), 502 deletions(-)
---
base-commit: 85d1ad82bc4a5215e54409c85b8d0b5b1f40a289
change-id: 20240903-arm-generic-entry-ada145378bbe

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


