Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C192AC98308
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBIP+G64F5OiMSJQGN5nNWKW32IgtbGQCt9PYXqIS7Y=; b=lMdmxp32Bz6i1JUsmtXND1kun9
	/1D+fu4qAauywd0AqQwlJTN95IympfQ1xnQxCPyH1tVZhXP0kadFF/TPzl1KGq6VtGB9QDFkjzBDs
	0Epb1dmqfo3DL2EZTZVk+pez2x2mjMDzAV6Rv3Rtfc6aOGXpbe59PZO13wTSTh7AXBenmTJgxQ66H
	ZRtgcvCCGS4aJm3JzZqvqkRW+XZjijt2AGyiliZOXTnkQFlDXcNqu0IbTqWBLKt2gHMSO7/fJzSHV
	A0KhDpuEpXX/B32pkQF4Jbni7oFNAyoDl0c4UVBcr1FpANo75qSilJnQ3sHCEy7fo/9OFIgqDf6pE
	6KdynV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95FW-00000006Ikn-1pH4;
	Tue, 22 Sep 2026 18:29:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95FV-00000006IkJ-363Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:29:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB2F4600E2;
	Tue, 22 Sep 2026 18:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F761F0089D;
	Tue, 22 Sep 2026 18:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790101788;
	bh=oBIP+G64F5OiMSJQGN5nNWKW32IgtbGQCt9PYXqIS7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=feZOstNiuNlWphAJLMUycquPL0TsTFl2x6jc5F5Pwaap7BAIB0JCR/d/ij11UI5q0
	 eYYzQXofciOnfc/bxtJv84X1ppqt3yUhd4Isse8vHRsyylysQcNR4j7Qz5RPPffY99
	 DYBu9APvh6r8PA51C3mPexRv3m8OGIj3+WHheqBVEemBKS2cPJhb/4JCMF0IyopqpX
	 Q4R6KQIfxXCsYJyJIdNkwcZDk80EambzOA8KsCGsjHVAEWmbepNprhHs41Zz2rSbGf
	 ODgjmf+6ih27KvMZXhlSW8ZOxOcPthGUroZo4aoapC7kYY1GpfBO2huCHUcSx+3Fgn
	 Xf6p+N8aXEieg==
Date: Tue, 22 Sep 2026 11:29:48 -0700
From: Kees Cook <kees@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v19 00/14] arm64: entry: Convert to Generic Entry
Message-ID: <202609221129.B5E13A7@keescook>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922035510.1090299-1-ruanjinjie@huawei.com>
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, will@kernel.org, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, kmehltretter@gmail.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linusw@kernel.org, oleg@redhat.com, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Sep 22, 2026 at 11:54:56AM +0800, Jinjie Ruan wrote:
> This series converts arm64 to the generic entry infrastructure.

With my trusty LLM driving a bunch of orchestration, I gave this
a fairly wide before/after run under qemu-system-aarch64, trying
to cover things beyond the ptrace/breakpoints/abi/fp/vDSO list in
the cover letter. But since this is all emulated, it's mainly basic
correctness coverage, without any meaningful concurrency coverage. I
just wanted to find stuff that maybe hadn't been exercised yet.

tl;dr: the only behavioral difference I could find anywhere is what
patch 1 fixed, and I found no meaningful regressions.

Setup: the series applies cleanly to v7.3-rc2 (I only noticed later
the series was actually based on -rc4), so "base" is v7.3-rc2 and
"patched" is the same tree plus the 14 patches, with each pair built
from the same config with GCC 16.1.0. The guest was QEMU 11.1.0:

  -M virt,gic-version=max,mte=on -cpu max,pauth-impdef=on -smp 4

I used four kernel configs, each built for both base and patched:

  plain    defconfig + SECCOMP, USER_NS, AUDITSYSCALL, KUNIT_ALL_TESTS
  lockdep  plain + PROVE_LOCKING, TRACE_IRQFLAGS, PROVE_RCU,
             DEBUG_ATOMIC_SLEEP, DEBUG_PREEMPT
  hooks    lockdep + the options that add work to syscall entry/exit:
             FTRACE_SYSCALLS, KSTACK_ERASE, LKDTM, NO_HZ_FULL,
             CONTEXT_TRACKING_USER (booted nohz_full=2-3)
  rt       hooks + PREEMPT_RT

and ran userspace tests from both an AArch64 and an AArch32 (armhf)
userspace, since the latter takes the is_compat_task() side of
ptrace_save_reg() and the cover letter didn't mentioned COMPAT.

Results were identical on base and patched (pass/fail/skip):

  seccomp_bpf                   98/1/12 (AArch64), 94/2/15 (AArch32)
  ptrace selftests              get/set_syscall_info, peeksiginfo,
                                vmaccess: no change
  breakpoint_test_arm64         213/0/0
  rseq basic, percpu_ops        pass
  KUnit (KUNIT_ALL_TESTS)       ~1500 results, no change
  MTE selftests                 117/0/0 (but see below)
  strace 6.18 test suite        81/6/0 (ptrace/seccomp tests)
  audit (a0 filter)             pass
  syscall tracepoints           pass (argument recorded correctly)
  lkdtm KSTACK_ERASE            pass
  lkdtm stack-entropy.sh        7 bits
  lockdep/RCU                   0 splats in lockdep, hooks, and rt

The only delta I could find was the expected one:

  sysemu_singlestep (new test)  FAIL on base, pass on patched

So patch 1 fixes the described bug, but it had no in-tree test, so I
wrote one. I'll send that separately.

Various things I noticed along the way:

- The set of traceable symbols on the syscall path changes:

    removed: syscall_trace_enter, syscall_trace_exit,
             el0_svc_common.constprop.0
    added:   trace_syscall_enter, trace_syscall_exit,
             syscall_enter_audit

  These aren't ABI, and the new names are the same ones x86,
  riscv, loongarch, and s390 already expose, so this is really an
  improvement. But it might be worth a sentence in the cover letter,
  since patch 13's "[Compatibility]" note could be read as "nothing
  observable changes", which isn't _strictly_ true. :)

- Syscall-path stack use grows by 48 bytes. Base do_el0_svc() has a
  16-byte frame and calls el0_svc_common() with a 48-byte frame; with
  patch 14 inlining it (plus the __always_inline generic enter/exit
  helpers), do_el0_svc() grows from 48 to 808 bytes and 1 to 13 calls,
  with a single 112-byte frame: 112 - 64 = 48. lkdtm KSTACK_ERASE with
  randomize_kstack_offset=off confirms exactly that at runtime (2288 vs
  2336 bytes, ten samples, no variance), on both userspaces and in
  both the hooks and rt configs. It's small, but it's not mentioned as
  a (minor) trade-off for patch 14's ~1% speedup. Other size deltas:
  .text +12K, ptrace.o -3.6K, and +3.1K of shared
  kernel/entry/syscall-common.o (all seems expected/unremarkable).

- Patch 14 also moves that inlined code into .noinstr.text (+896
  bytes). Since arm64 doesn't have objtool noinstr validation like x86,
  I checked the images directly: no calls from .noinstr.text to
  instrumentation outside the noinstr range, and no __mcount_loc entry
  falls inside it, on either kernel. But we don't seem to have anything
  that will continue to enforce this?

- CONFIG_DEBUG_RSEQ "depends on ... && !GENERIC_ENTRY", so patch 13
  makes it unselectable on arm64 and rseq_syscall() becomes the no-op
  stub. Patches 5 and 9 carefully reposition that call, and then patch
  13 removes its effect. Not a bug (generic entry does the equivalent
  via rseq_debug_enabled, and I can see __rseq_debug_syscall_return()
  called from the new do_el0_svc()), but patch 5 reads like a
  standalone fix that disappears eight patches later, so a note in the
  cover letter might help make sense of this?

- The cover letter includes the gvisor SUD numbers, but SUD needs
  ARCH_SUPPORTS_SYSCALL_USER_DISPATCH (as well as GENERIC_ENTRY),
  and with the SUD patch dropped in v18, arm64 doesn't select it,
  so CONFIG_SYSCALL_USER_DISPATCH can't be enabled yet. (rseq slice
  extension is similarly blocked on HAVE_GENERIC_TIF_BITS.) A reader
  could take those numbers as something this series delivers.

- arm64 defconfig has FTRACE_SYSCALLS=n, which means
  SYSCALL_WORK_SYSCALL_TRACEPOINT can never be set and the tracepoint
  paths touched by patches 2, 3, and 9 aren't even built. So anyone
  testing with defconfig isn't exercising those; you may want to test
  with it enabled. (Also, compat tasks never hit syscall tracepoints
  on arm64 at all, due to ARCH_TRACE_IGNORE_COMPAT_SYSCALLS, so that
  path can only be covered by native tasks, but that's unchanged by
  the series.)

- I verified that the entry work ordering is unchanged. It looks
  correct to me: arm64 did ptrace, seccomp, tracepoint, audit; generic
  entry does the same. (It also checks SUD and rseq-slice before those,
  but neither can be enabled on arm64 yet.)

Suggestions:

- rr: Since you have real hardware, could you also run the rr test
  suite? rr has been the most sensitive ptrace user I've encountered,
  and it depends on exactly the syscall-stop and single-step behavior
  this series touches. I couldn't run it: QEMU's TCG PMU exposes PMUv3
  but only counts CPU_CYCLES (BR_RETIRED always reads 0, on every
  CPU model I tried), so rr aborts in check_working_counters(). If
  you do, note that you'll need "proc_mem.force_override=always" (or
  CONFIG_PROC_MEM_ALWAYS_FORCE=y), or three rr tests fail for unrelated
  reasons (rr-debugger/rr#4093). Build and test instructions are here:
  https://github.com/rr-debugger/rr/wiki/Building-And-Installing#tests

- MTE: I didn't see MTE in the cover letter's test list, and it seems
  relevant since patch 13 puts _TIF_MTE_ASYNC_FAULT into
  ARCH_EXIT_TO_USER_MODE_WORK, so an async tag check fault lands
  on the reworked exit path. The MTE selftests showed no differences,
  but a third of them don't actually run for me under QEMU, so they'd
  be worth running on your hardware. (Testing MTE under QEMU saw
  check_mmap_options hang at test 5, the first test with tag checking
  on, and check_child_memory never produces output, on both base and
  patched, so only 117 of the 183 planned MTE tests ran. But this is,
  of course, a QEMU/selftest issue unrelated to the generic entry.)

So, for the series:

Tested-by: Kees Cook <kees@kernel.org>

-Kees

-- 
Kees Cook

