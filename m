Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6D5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 21:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zgT3y8/vZZ3odswpfbic0nXbvtY8AfaThCsjETbWGK8=; b=mOOvj2l8Fu7v9Y
	ExWZ+UJVurUTjwd8i0yKDqJho6nPw/UOWBYlF5m6rVI4oXUaQjTLEaJ2+HeREY6aaJhXVIvHqwUde
	rZMY1+Tk72Nku4l/ycmTi15B1QflKtXYKsDKbD+zEd5W6OTMUNqKzEfQfY/nZvtWysSTFMwjVerjX
	UDv9UsQrWA0RoUnZwbbEKrNToQcjm6r2CGgbgVB1FKs6eTfL3BNkfg4vKcPp47sCOCiQMxkN8TK4I
	Dxt8Hdidg2Kxqf/cKBvOeC7yrGGvixF+OmZsC4ZBqTYcXOdytqSocteYg+0Hrvqrs9JITWtBymdEQ
	SgXejgMNz0Izepm6fQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSj4O-0000000Gb4s-0jRM;
	Fri, 20 Jun 2025 21:14:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSj28-0000000GaxS-1QjR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 21:12:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79657169C;
	Fri, 20 Jun 2025 14:12:01 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.50.192])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D8CB3F673;
	Fri, 20 Jun 2025 14:12:18 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 00/13] arm64: debug: remove hook registration, split exception entry
Date: Fri, 20 Jun 2025 22:11:54 +0100
Message-ID: <20250620211207.773980-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_141224_469741_5AAAEABC 
X-CRM114-Status: GOOD (  32.16  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, "Luis Claudio R . Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

This series simplifies the debug exception entry path by removing handler
registration mechanisms for the debug exception handlers, a holdover from
the arm kernel, as well as the break and stepping handlers.
This moves much of the code related to debug exceptions outside of
`mm/fault.c` where it didn't make much sense.
This allows us to split the debug exception entries: going from one common
path per EL for all debug exceptions to a unique one per exception and EL.

The result is a much simpler and fully static exception entry path, which
we tailor to the different exceptions and their constraints.

The series is structured as such :
1 : related clean-up in the signle step handler
2 : related refactor of `aarch32_break_handler()`
3-5 : software breakpoints and single step handlers registration removal
6: preparatory function move that is made internal in patch 13
8: preparatory refactor of `reinstall_suspended_bps()`
7, 9-13 : debug exception splitting and handler registration removal

* Patch 3 copies and extends the `early_brk64` break handling for the
normal path, byassing the dynamic registration.
* Patch 4 does something similar for the single stepping handlers.
* Patches 7, and 9 through 13 split each individual debug exception from
the unified path by creating specific handlers, adapting them to
their constraints and calling into them, bypassing the dynamically
registered handlers used before.
* Patch 8 refactors `reinstall_suspended_bps()` in preparation for the
single-step exception entry split, as it is moved out of the handler.
This could be squashed in patch 9 (the single-step exception split), but
I opted to separate it for clarity (and because the commit message
for patch 9 is already 45 lines long !).
* Patches 5 and 13 are clean-ups removing the code that has been replaced
and made redundant by the preceding patches.

PREEMPT_RT
===

Of note, this allows us to make the single exception handling mostly
preemptible coming from EL0 in patch 9, fixing an issue with PREEMPT_RT[0].
The commit message details the reasoning on why this should be safe.
It is *definitely* not preemptible at EL1 in the current state, given
that the EL1 software step exception is handled by KGDB.

We can do the same for the software break exception coming from EL0,
which works in a very similar way.

However, the hardware breakpoint and watchpoint exceptions also have
a sleeping while non-preemptible issue with PREEMPT_RT, but this is
much trickier to fix, so this won't be fixed in this series.
A bit more details in [1].

Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
(I don't really know what is the best thing to do if a tag is added
on the cover, so I added it here as well as for the whole series.)

As the EL0 and EL1 code paths are now split for the BRK64 and single-step
handlers, I added a comment to the EL0 paths to highlight that they
are preemptible with interrupts unmasked, and to be wary when changing them.
Happy for it to be dropped if it is not considered relevant or useful !

Testing
===

Testing EL1 debug exceptions can only be properly done with perf.
A simple test of hardware breakpoints, watchpoints, and software stepping
can be achieved by using `perf stat sleep 0.01` and adding hardware events
for `jiffies` and `hrtimer_nanosleep`, which guarantees a
hardware watchpoint and breakpoint.
Inserting a `WARN()` at a convenient place will allow testing both early
and late software breakpoints at EL1, or using KGDB to test without
changing code.

For EL0 debug exceptions, the easiest is to setup a basic program and use
GDB with a list of pre-programmed commands setting hardware and software
breakpoints as well as watchpoints. Setpping will occur naturally when
encountering breakpoints.

All tests maintained behaviour after the patches.

I also tested with KASAN on, with no apparent impact.

See below for some testing examples.

Regarding [0], I tested a PREEMPT_RT kernel with the patches, running
`ssdd` on loop as well as some spammy GDB stepping, and some
hardware watchpoints on a tight loop without any issues.

Note: `ssdd`[2], the test that highlighted the original bug, forks pairs
of tracer/tracee children. The tracer has a timeout waiting
for confirmation that its tracee process has been single stepped.
Given that the single step is now mostly preemptible, the step can be
delayed : possibly much more than what was usual previously.
Under heavy system load and by requesting the test to fork much more
children than its default, the test will start to fail unpredictably.
On a 4-core AMD Seattle board, I was able to see some inconsistent
failures with 32 (default 10) forks, becoming much more consistent
when the system load was above 16 (one or two failures per run).
Raising the timeout made the failures completely disappear, even with
a system load above 40, confirming that it is indeed a timeout issue.
Given that running `ssdd` with its default values does not seem to fail,
even with a system load of 21, so I do not feel like something
needs to be done to address this.


Based on v6.16-rc2.
Thanks,
Ada
v4 :
- Split `do_{softstep,brk}()` by EL : `do_el0_XX()` and `do_el1_XX()` (Mark)
- Remove now unused arch_init_uprobes (Anshuman)
- Reword patch 3 summary (Anshuman)
- Rename `XX_singlestep_handler()` handlers to `XX_single_step_handler()`
  (Anshuman, Mark)
- Drop `NOKRPOBE_SYMBOL()` for EL0 paths where relevant (Mark)
- Call `die()` directly in `do_el1_brk64()` instead of `pr_warn()`
  and `arm64_notify_die()`. (Mark)
- Add comments to `do_el0_{softstep,brk}()` handlers highlighting
  that they are called with unmasked interrupts and preemption enabled,
  in cases changes need to be made in the future.
- Added tags from v3.
- Rebased on v6.16-rc2
v3 : https://lore.kernel.org/linux-arm-kernel/20250609173413.132168-1-ada.coupriediaz@arm.com
- Refactor `aarch32_break_handler()` to be consistent with other
  `el0_undef()` tentative handlers and the refactored
  `reinstall_suspended_bps()` later in the series.
- Drop the intermediate handlers for hardware breakpoint and watchpoint
  exceptions, as they both only return 0 and never end up calling
  `arm64_notify_die()`. Make the real handlers return void, rename them
  `do_{break,watch}point()` so that they can be called directly from
  `entry-common.c`. This is similar to what was done for the single-step
  handler. 
- Add static inline stand-ins for disabled stepping handlers. (Will)
- Don't duplicate `debug_exception_enter()` and `debug_exception_exit()`
  in patch 06 (Will)
  - Move them to `kernel/entry-common.c` and make them externally visible
    while `do_debug_exception()` in `mm/fault.c` needs them
  - Make them static again when cleaning up in patch 11.
- Refactor `reinstall_suspended_bps()` to make the logic cleaner and easier
  to understand (Will, Mark).
- Be more explicit in the commit messages about the goal and safety of
  moving `arm64_apply_bp_hardening()` to `kernel/entry-common.c` and
  calling it before `enter_from_user_mode` in patches 07 and 09 (Will)
- Enable preemption and unmask interrupts early for the brk64 handler,
  fixing a PREEMPT_RT sleeping while non-preemptible issue (Luis)
- Mention in patch 13 commit message that `bug_brk_handler()` is
  not called as a fall-through anymore in early boot, but that it doesn't
  change the actual behaviour (Will)
- Scope FAR_EL1 comment (Will)
- Fix typos (Will)
- Rebase on v6.16-rc1
  - Update the UBSAN BRK ESR check to `esr_is_ubsan_brk(esr)`.
v2 : https://lore.kernel.org/linux-arm-kernel/20250512174326.133905-1-ada.coupriediaz@arm.com
- Move the BP hardening call outside of the handlers to `entry-common`,
  as they are not needed coming from EL1.
- Make the EL0 software stepping exception mostly preemptible
  - Move `reinstall_hw_bps()` call to `entry-common`
  - Don't disable preemption in `el0_softstp()`
  - Unmask DAIF before `do_softstep()` in `el0_softstp()`
  - Update comments to make sense with the changes
- Simplify the single step handler, as it always returns 0 and could not
  trigger the `arm64_notify_die()` call.
- Fix some commit messages
v1 : https://lore.kernel.org/linux-arm-kernel/20250425153647.438508-1-ada.coupriediaz@arm.com

[0]: https://lore.kernel.org/linux-arm-kernel/Z6YW_Kx4S2tmj2BP@uudg.org/
[1]: https://lore.kernel.org/linux-arm-kernel/e86c5c3a-6666-46a7-b7ec-e803212a81a1@arm.com/
[2]: https://man.archlinux.org/man/ssdd.8.en

Testing examples
===

Perf (for EL1):
~~~
Assuming that `perf` is on your $PATH and building with `kallsyms`

  #!/bin/bash
  
  watch_addr=$(sudo cat /proc/kallsyms | grep "D jiffies$" | cut -f1 -d\  )
  break_addr=$(sudo cat /proc/kallsyms | grep "clock_nanosleep$" | cut -f1 -d\  )
  
  cmd="sleep 0.01"
  
  sudo perf stat -a -e mem:0x${watch_addr}/8:w -e mem:0x${break_addr}:x ${cmd}

NB: This does /not/ test EL1 BRKs.


GDB commands (for EL0):
~~~
The following C example, compiled with `-g -O0`

  int main() {
          int add = 0xAA;
          int target = 0;

          target += add;

  #ifdef COMPAT
      __asm__("BKPT");
  #else
      __asm__("BRK 1");
  #endif
  
          return target;
  }

Combined with the following GDB command-list

  start
  hbreak 3
  watch target
  commands 2
  continue
  end
  commands 3
  continue
  end
  continue
  jump 11
  continue
  quit

Executed as such : `gdb -x ${COMMAND_LIST_FILE} ./a.out`
should go through the whole program, return 0252/170/0xAA, and
exercise all EL0 debug exception entries.
By using a cross-compiler and passing and additional `-DCOMPAT` argument
during compilation, the `BKPT32` path can also be tested.
NOTE: `BKPT` *will* make GDB loop infinitely, that is expected. Sending
SIGINT to GDB will break the loop and the execution should complete.

Ada Couprie Diaz (13):
  arm64: debug: clean up single_step_handler logic
  arm64: refactor aarch32_break_handler()
  arm64: debug: call software breakpoint handlers statically
  arm64: debug: call step handlers statically
  arm64: debug: remove break/step handler registration infrastructure
  arm64: entry: Add entry and exit functions for debug exceptions
  arm64: debug: split hardware breakpoint exception entry
  arm64: debug: refactor reinstall_suspended_bps()
  arm64: debug: split single stepping exception entry
  arm64: debug: split hardware watchpoint exception entry
  arm64: debug: split brk64 exception entry
  arm64: debug: split bkpt32 exception entry
  arm64: debug: remove debug exception registration infrastructure

 arch/arm64/include/asm/debug-monitors.h       |  34 +--
 arch/arm64/include/asm/exception.h            |   8 +-
 arch/arm64/include/asm/kgdb.h                 |  12 +
 arch/arm64/include/asm/kprobes.h              |   8 +
 arch/arm64/include/asm/system_misc.h          |   4 -
 arch/arm64/include/asm/traps.h                |   6 +
 arch/arm64/include/asm/uprobes.h              |  11 +
 arch/arm64/kernel/debug-monitors.c            | 255 +++++++-----------
 arch/arm64/kernel/entry-common.c              | 146 +++++++++-
 arch/arm64/kernel/hw_breakpoint.c             |  60 ++---
 arch/arm64/kernel/kgdb.c                      |  39 +--
 arch/arm64/kernel/probes/kprobes.c            |  31 +--
 arch/arm64/kernel/probes/kprobes_trampoline.S |   2 +-
 arch/arm64/kernel/probes/uprobes.c            |  24 +-
 arch/arm64/kernel/traps.c                     |  79 +-----
 arch/arm64/mm/fault.c                         |  75 ------
 16 files changed, 327 insertions(+), 467 deletions(-)


base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
-- 
2.43.0


