Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DA0C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 22:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p4F5NqirVzWNgGL0YS5h3K2vY8ebnnKfieN+4fWEzoQ=; b=3sK3vfZYIlF/95
	hUrV2TUIE2OFDT7jeku3UO44DEKcr/P/cSv77n21iiMcJbjJvze93ak92aVYjdn/yQbPlXcpbudkR
	G51wTZAww9DgWhTTv0gtVeMdn1dbsGhh2i14jKS+/cnQps0I+PoWCGqYK1KOznCFBbGGVWEH/XRPd
	CJ+zht/fmw1BaWpzsCmv2FWLMp6dpIbfYLu/7DA2OcORDXIZTfJgNYUBQWJC2cdPTD5VnmBJdak3P
	71JI85qarZ2pvsSaOQV649gn/RydFNqzvNTJCvXqDtAexnCZ3R2WhhjZfyCGs2fPKJG2gTEIljYKw
	ORaywseJ+0MoYFoQ3yIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gov-00000001tDM-1kUb;
	Sat, 19 Apr 2025 22:37:57 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gn1-00000001sfu-2hfv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:01 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-549967c72bcso3176038e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102157; x=1745706957; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4F5NqirVzWNgGL0YS5h3K2vY8ebnnKfieN+4fWEzoQ=;
        b=xkaTrLvmb17Tk0RTUR/Zso+XWBTVAecgvxjOSaG+PpFf9n2d8InEiwcH3l6Chq5Ytq
         6pew6iQmJhMJN+XNq3uxlhba67X60lSQfbGqb9Bkfi/q8RDITzerSLFz2d3FK/49/oTx
         XC57dMzxnIhMLl+cg9rUlEIRL5OB2+FBpM0J06A/96yjmwcqeFNKXR4DQRmz+9Cqztkj
         YYo0DXIKN4scT9S9NM/D1/u0QUUtUf2rEjGuKIeMHJFcjL33A31YSU5WcC9NSVUKpdZc
         CBUEwzTFzPC5CtpeR4brI5rrVs9Nqv1beaULvTvEKhIz4byv9WHG8XrYAlES+n9yRbfh
         x/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102157; x=1745706957;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4F5NqirVzWNgGL0YS5h3K2vY8ebnnKfieN+4fWEzoQ=;
        b=Fz6JHM4Z3YlbgaMZO0gZv20HSNcZ5HVvkdkN2tYM+mVsyHiyf9x22LU9EMY+jwjXFq
         dyavOpO0m/3oti+/H7yEjFJpTaCPfmnbuQibeU6wnZGfREhXPWWukjE4HDfvR61vVIQB
         R/1DRfyUCeSIEiR9XX7dn+1I6PR1NfZVev4ZD5U0TsCzPn8l0IYak2Ikr5Gq/5JhD76l
         v5ITOdwpQK0/ZhEQwgF9fKAw9zRfiudzOPWMZ9LhYZqDLPNLKJG3YMq8yZyllAKAaZm+
         ipb5CEn/dUaeA5BFKAKFeJcLm6ct0EKL75MsVkVVNJ6oDHOYI8q/TNz6RKEeJZICuiKm
         Hi2w==
X-Gm-Message-State: AOJu0Yy2GW4nJ7HVahxSpK+nYGAEh183/I/wHIRL1hxlHASXj0HF/5EW
	lOlF/11FQl7aDfiuLRJnkls0zNnfJsw3/DTPfUeq9rait2awC8XwAStrUqYVAss=
X-Gm-Gg: ASbGncsV/vV9xDp+MKUev5GDWiGg8E11TbpOn1rq/YmuA/ZjMZaIN9bkBJ9MgG2qeTG
	Ijxa3FgzxIctqC0XDWUz0h9tNQSKIP+Olbqut67V6tZXWKZcSAw2G3SzZ7ZtDb7tY2mtLaKkPzn
	RE5+Xj01CEWtbK/3g0Kkkfz3Bq3mHvswVOuEmveAlJZJapbI94/LA88BWzC8bi9Dm5lq4lfReiQ
	zZgT/IHdCLxJbDtDZNIi+lJJaCC9mAUaOV5F+jcV/OcUbvCC6xunw5o3g4Jj/sXu7V033fYhDl3
	/K6xXvMU0qEP00t8hmG++eLcaCre0hTM2D5nRqNgFCvMZkvGbwc=
X-Google-Smtp-Source: AGHT+IH7JZnEuuFCZqGPbAcX/BsjXVlOFDCexWqqUFAUko8nxqoL1CBgVAmOlK+Zf1xkZVblhZa4CA==
X-Received: by 2002:a05:6512:3d0d:b0:549:39b1:65c2 with SMTP id 2adb3069b0e04-54d6e66d873mr1824747e87.48.1745102156556;
        Sat, 19 Apr 2025 15:35:56 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:35:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v6 00/31] ARM: Switch to generic entry
Date: Sun, 20 Apr 2025 00:35:47 +0200
Message-Id: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMlBGgC/23O0WrEIBAF0F9ZfK7FGZ2Y9Kn/UfqgccwKrSlmC
 V2W/HvdQOmW+HgH7rlzEwuXxIt4Od1E4TUtac41dE8nMZ5dnlimULNAhUYNSktXPuXEubZGyfl
 SrtIFB4a07b1nUXtfhWP63s2395rPabnM5bpPrHC/7hooUA1tBamkH0w0BEH11r9+pOzK/DyXS
 dy5FR8IHFoEVoKsJhic56j7A6F/CapP2BahK2GYoh6BgsdwIMwfgYAtwlTCGbIxKtdB6A4EPRB
 ILYIqgVGhBt2RZvpHbNv2A80qCNC/AQAA
X-Change-ID: 20240903-arm-generic-entry-ada145378bbe
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_153559_713785_63E129C5 
X-CRM114-Status: GOOD (  47.00  )
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
then switches ARM over to the generic entry code.

This was inspired by Jinjie Ruans similar work for ARM64.

The low-level assembly calls into arch/arm/kernel/syscall.c
to invoke syscalls from userspace, and to the functions listed
in arch/arm/kernel/entry.c for any other transitions to
and from userspace. Looking at these functions and the
call sites in the assembly on the final result should give
a pretty good idea about how this works, and what the
generic entry expects from an architecture.

This was successfully booted on ARMv7m as well: the v7m
avoids the interrupt path in the generic entry, because it
never called the context tracker to begin with. It uses
the common path for syscalls however and this works just
fine. Adding proper context tracking to the ARMv7m IRQs is
probably a good idea but a separate issue altogether.

There is a git branch you can pull in and test (v6.15-rc1
based):
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/log/?h=b4/arm-generic-entry-v6.15-rc1

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

- The "superfast return to userspace" using just very
  small assembly snippets to get back to userspace on
  e.g. IRQs if and only if no instrumentation was compiled
  in, is no longer possible, since we unconditionally
  call into code written in C. I *think* this accounts
  for the majority of the ~6% performance impact (see
  measurements below).

This more or less an unavoidable side effect if we just
want to use the non-deprecated context tracking,
as that involves calling into C from every exception,
without exceptions.

Testing:

- Booted into Versatile Express QEMU (ARMv7), Ux500 full
  graphic UI (PostmarketOS Phosh, ARMv7 on hardware,
  Gemini ARMv4 on hardware. No special issues.

- Tested some ptrace/strace obviously, such as issuing
  several instances of "ptrace find /" and let this scroll
  by in the terminal over some 10 minutes or so. Then
  I ran the strace test suite and the results are the same
  before and after the patch set.

- Ran the strace test suite (and that was a good thing
  because it found regressions).

- Turned on RCU torture tests and ran for a while. Seems
  stable and the test outputs look normal.

- Ran stress-ng, works fine.

- Booted with "lockdep" (CONFIG_PROVE_LOCKING). The ARM32
  mainline produce 3 warnings at boot and those go away
  after these patches. I haven't looked closer at what
  it was that I inadvertedly fixed here, but I suspect the
  current context tracking has issues with interrupts being
  interrupted by paging exceptions, and these are solved
  in this patch series.

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

v6.14-rc1 vexpress_defconfig, best invocation:

     Total time: 146.546 [sec]
      14.654698 usecs/op
         68,237 ops/sec

v6.14-rc1 vexpress_defconfig, and this patch set, worst invocation:

     Total time: 156.263 [sec]
      15.626398 usecs/op
         63,994 ops/sec

Here we see a performance degradation of around 6-7% operations/sec
for a vexpress dualcore defconfig in the best vs worst case. (This
isn't statistically correct, the effect is likely smaller.)

Debians stock kernel was noticably faster, so I investigated what
causes this. It turns out that the big performance hog for syscalls
is actually PAN which cause an order of magnitude syscall performance
decrease, and I think Debian armhf simply turns this off. Consistent
tests with PAN disabled also see around 6-7% on that performance
figure.

To conclude if any of this was due to the new context tracking,
at one point I tested to patch back the old context tracking on top
of generic entry. This is hardly something that can be recommended,
and anyway showed no noticeable overhead difference.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v6:
- Rebased on v6.15-rc1
- Link to v5: https://lore.kernel.org/r/20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org

Changes in v5:
- Reimplement local syscall restart after the strace test
  suite showed me that this is strictly required. The strace
  test suite results are now the same before and after the
  patch set.
- Tested on an OABI rootfs (Footbridge RedHat!) it works
  fine after dropping the last patch, which was just an
  optimization anyway. That can wait for later.
- Link to v4: https://lore.kernel.org/r/20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org

Changes in v4:
- Rebased on v6.14-rc1, marked non-RFC.
- Tested on ARMv7m, it works.
- Fixed a bug where I missed to handle syscall "-1" which
  when tracing means "skip syscall". This took some time to
  find, taking up much of my debug time despite being so
  obvious :/
- Added stubs for PTRACE_SYSEMU and PTRACE_SYSEMU_SINGLESTEP.
- No feedback on the "fast syscall restart" so I conclude
  that this is some ARM oddity, if it is needed for
  performance (i.e. a workload constantly restarting syscalls)
  we should look at recreating it inside the generic entry
  code.
- After discussing with Ard about the IRQ stacks, altered
  the irqstack handling to just assume IRQ stack or overflow
  stack is in use if we are not on the main thread stack.
- Unmark the patch to block IRQs in early IRQ context as
  "RFC": when doing proper context tracking this is likely
  plain necessary. Block IRQs in the early assembly entry
  directly in CPSR instead of later in the exception handler.
- New cleanup patch in the tail of the patch series.
- Link to v3: https://lore.kernel.org/r/20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org

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
Linus Walleij (31):
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
      ARM: irq: Add irqstack helper
      ARM: entry: Convert to generic entry
      ARM: entry: Handle dabt, pabt, and und as interrupts
      ARM: entry: Block IRQs in early IRQ context
      ARM: entry: Reimplement local restart in C

 arch/arm/Kconfig                    |   1 +
 arch/arm/include/asm/entry-common.h |  66 ++++++++++++
 arch/arm/include/asm/entry.h        |  14 +++
 arch/arm/include/asm/ptrace.h       |   8 +-
 arch/arm/include/asm/signal.h       |   4 -
 arch/arm/include/asm/stacktrace.h   |   2 +-
 arch/arm/include/asm/switch_to.h    |   4 +
 arch/arm/include/asm/syscall.h      |   7 ++
 arch/arm/include/asm/thread_info.h  |  22 ++--
 arch/arm/include/asm/traps.h        |   5 +-
 arch/arm/include/uapi/asm/ptrace.h  |   2 +
 arch/arm/kernel/Makefile            |   5 +-
 arch/arm/kernel/asm-offsets.c       |   1 +
 arch/arm/kernel/entry-armv.S        |  82 ++++-----------
 arch/arm/kernel/entry-common.S      | 198 +++++++++++++-----------------------
 arch/arm/kernel/entry-header.S      | 100 ++----------------
 arch/arm/kernel/entry.c             | 120 ++++++++++++++++++++++
 arch/arm/kernel/irq.c               |   6 ++
 arch/arm/kernel/irq.h               |   2 +
 arch/arm/kernel/process.c           |  25 ++++-
 arch/arm/kernel/ptrace.c            |  81 +--------------
 arch/arm/kernel/signal.c            |  68 +++----------
 arch/arm/kernel/syscall.c           |  59 +++++++++++
 arch/arm/kernel/traps.c             |  30 +-----
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
 38 files changed, 484 insertions(+), 504 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20240903-arm-generic-entry-ada145378bbe

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


