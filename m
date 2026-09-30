Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AA4CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RafClpc2VjVNI0OQ8qPqpW5bmNLrbwfDm0/bYkGFEiM=; b=eYs7G3B9gBOY0N
	9qVcg9AOefxXTbT1e58Uwofzz/GHLSQ/uunrHpgYxdZ3hxsHhLQYuj6IxPrYd7+HXT3sO0Pgm0dhK
	mSagOSh03UPojnzGReSttiisdRJQh2HlCeOIY6OYQHTMZjl0qHx5v/Pu3Tel/umUHnnDRDi7trbrF
	Rk0Vyqfcr4qYfZnfts8zY7TKXOHbbv23XGFb6P/sT82WMCbeqLmnbpt0GP+ME1JtrSJcGqQlbLasi
	vdSMwGrXXoUy02EMFH1pARyfC+Nn4fLW5V5kIo0geXKh8GwhgGVQLFi1rBAeNt1vLqjdEvKTSNt+f
	4SkbjSpVzv7McF5aAflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo9y-00000005CLY-3dEX;
	Wed, 30 Sep 2026 06:51:22 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo9v-00000005CL6-3Q3B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 06:51:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RafClpc2VjVNI0OQ8qPqpW5bmNLrbwfDm0/bYkGFEiM=;
	b=gwG/0/0Pbj/8xAOV9cTAXs/Bwrmonqf+bx3gQ19YHF/NiiC2tiKianNKXO0uYRH5B+3m3ptzZ
	vzm0v7BsJNX4eWOVv+aCxke/MsHaQ0qdskaVBX/gLZa2sJxV/7sYY6NHMwko1zE40bwZGZSoA6A
	v/dwl4OjrT2h5gjvB0OLDpg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hvlkW5S3DzRhQs;
	Wed, 30 Sep 2026 14:38:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BAD3540561;
	Wed, 30 Sep 2026 14:51:05 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 30 Sep 2026 14:51:04 +0800
Message-ID: <87bb977b-6096-40f2-83c8-f70ad7c6e3f0@huawei.com>
Date: Wed, 30 Sep 2026 14:51:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 00/14] arm64: entry: Convert to Generic Entry
To: Kees Cook <kees@kernel.org>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
 <202609221129.B5E13A7@keescook>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <202609221129.B5E13A7@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_235120_246108_247E7D05 
X-CRM114-Status: GOOD (  43.13  )
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



在 2026/9/23 2:29, Kees Cook 写道:
> On Tue, Sep 22, 2026 at 11:54:56AM +0800, Jinjie Ruan wrote:
>> This series converts arm64 to the generic entry infrastructure.
> 
> With my trusty LLM driving a bunch of orchestration, I gave this
> a fairly wide before/after run under qemu-system-aarch64, trying
> to cover things beyond the ptrace/breakpoints/abi/fp/vDSO list in
> the cover letter. But since this is all emulated, it's mainly basic
> correctness coverage, without any meaningful concurrency coverage. I
> just wanted to find stuff that maybe hadn't been exercised yet.

Hi Kees,

Thank you very much for adding the detailed tests.

> 
> tl;dr: the only behavioral difference I could find anywhere is what
> patch 1 fixed, and I found no meaningful regressions.
> 
> Setup: the series applies cleanly to v7.3-rc2 (I only noticed later
> the series was actually based on -rc4), so "base" is v7.3-rc2 and
> "patched" is the same tree plus the 14 patches, with each pair built
> from the same config with GCC 16.1.0. The guest was QEMU 11.1.0:
> 
>   -M virt,gic-version=max,mte=on -cpu max,pauth-impdef=on -smp 4
> 
> I used four kernel configs, each built for both base and patched:
> 
>   plain    defconfig + SECCOMP, USER_NS, AUDITSYSCALL, KUNIT_ALL_TESTS
>   lockdep  plain + PROVE_LOCKING, TRACE_IRQFLAGS, PROVE_RCU,
>              DEBUG_ATOMIC_SLEEP, DEBUG_PREEMPT
>   hooks    lockdep + the options that add work to syscall entry/exit:
>              FTRACE_SYSCALLS, KSTACK_ERASE, LKDTM, NO_HZ_FULL,
>              CONTEXT_TRACKING_USER (booted nohz_full=2-3)
>   rt       hooks + PREEMPT_RT
> 
> and ran userspace tests from both an AArch64 and an AArch32 (armhf)
> userspace, since the latter takes the is_compat_task() side of
> ptrace_save_reg() and the cover letter didn't mentioned COMPAT.

Good catch!

> 
> Results were identical on base and patched (pass/fail/skip):
> 
>   seccomp_bpf                   98/1/12 (AArch64), 94/2/15 (AArch32)
>   ptrace selftests              get/set_syscall_info, peeksiginfo,
>                                 vmaccess: no change
>   breakpoint_test_arm64         213/0/0
>   rseq basic, percpu_ops        pass
>   KUnit (KUNIT_ALL_TESTS)       ~1500 results, no change
>   MTE selftests                 117/0/0 (but see below)
>   strace 6.18 test suite        81/6/0 (ptrace/seccomp tests)
>   audit (a0 filter)             pass
>   syscall tracepoints           pass (argument recorded correctly)
>   lkdtm KSTACK_ERASE            pass
>   lkdtm stack-entropy.sh        7 bits
>   lockdep/RCU                   0 splats in lockdep, hooks, and rt
> 
> The only delta I could find was the expected one:
> 
>   sysemu_singlestep (new test)  FAIL on base, pass on patched
> 
> So patch 1 fixes the described bug, but it had no in-tree test, so I
> wrote one. I'll send that separately.

As I commented in the patch, I think we need to distinguish between
syscall exit stop and pseudo single-step, and I will also add a test
case to verify the problems that may arise from arm64’s own missing
pseudo single-step.

> 
> Various things I noticed along the way:
> 
> - The set of traceable symbols on the syscall path changes:
> 
>     removed: syscall_trace_enter, syscall_trace_exit,
>              el0_svc_common.constprop.0
>     added:   trace_syscall_enter, trace_syscall_exit,
>              syscall_enter_audit
> 
>   These aren't ABI, and the new names are the same ones x86,
>   riscv, loongarch, and s390 already expose, so this is really an
>   improvement. But it might be worth a sentence in the cover letter,
>   since patch 13's "[Compatibility]" note could be read as "nothing
>   observable changes", which isn't _strictly_ true. :)

Thanks, this content will be added.

> 
> - Syscall-path stack use grows by 48 bytes. Base do_el0_svc() has a
>   16-byte frame and calls el0_svc_common() with a 48-byte frame; with
>   patch 14 inlining it (plus the __always_inline generic enter/exit
>   helpers), do_el0_svc() grows from 48 to 808 bytes and 1 to 13 calls,
>   with a single 112-byte frame: 112 - 64 = 48. lkdtm KSTACK_ERASE with
>   randomize_kstack_offset=off confirms exactly that at runtime (2288 vs
>   2336 bytes, ten samples, no variance), on both userspaces and in
>   both the hooks and rt configs. It's small, but it's not mentioned as
>   a (minor) trade-off for patch 14's ~1% speedup. Other size deltas:
>   .text +12K, ptrace.o -3.6K, and +3.1K of shared
>   kernel/entry/syscall-common.o (all seems expected/unremarkable).

Thanks, will be supplemented for patch 14.

> 
> - Patch 14 also moves that inlined code into .noinstr.text (+896
>   bytes). Since arm64 doesn't have objtool noinstr validation like x86,
>   I checked the images directly: no calls from .noinstr.text to
>   instrumentation outside the noinstr range, and no __mcount_loc entry
>   falls inside it, on either kernel. But we don't seem to have anything
>   that will continue to enforce this?

I think so, the following patch also mentioned this problem.

Link:
https://lore.kernel.org/all/cover.1786603168.git.hongyan.xia@transsion.com/

> 
> - CONFIG_DEBUG_RSEQ "depends on ... && !GENERIC_ENTRY", so patch 13
>   makes it unselectable on arm64 and rseq_syscall() becomes the no-op
>   stub. Patches 5 and 9 carefully reposition that call, and then patch
>   13 removes its effect. Not a bug (generic entry does the equivalent
>   via rseq_debug_enabled, and I can see __rseq_debug_syscall_return()
>   called from the new do_el0_svc()), but patch 5 reads like a
>   standalone fix that disappears eight patches later, so a note in the
>   cover letter might help make sense of this?

Thanks, will be supplemented.

> 
> - The cover letter includes the gvisor SUD numbers, but SUD needs
>   ARCH_SUPPORTS_SYSCALL_USER_DISPATCH (as well as GENERIC_ENTRY),
>   and with the SUD patch dropped in v18, arm64 doesn't select it,
>   so CONFIG_SYSCALL_USER_DISPATCH can't be enabled yet. (rseq slice
>   extension is similarly blocked on HAVE_GENERIC_TIF_BITS.) A reader
>   could take those numbers as something this series delivers.

Thanks, will mention that.

> 
> - arm64 defconfig has FTRACE_SYSCALLS=n, which means
>   SYSCALL_WORK_SYSCALL_TRACEPOINT can never be set and the tracepoint
>   paths touched by patches 2, 3, and 9 aren't even built. So anyone
>   testing with defconfig isn't exercising those; you may want to test
>   with it enabled. (Also, compat tasks never hit syscall tracepoints

Good catch!

>   on arm64 at all, due to ARCH_TRACE_IGNORE_COMPAT_SYSCALLS, so that
>   path can only be covered by native tasks, but that's unchanged by
>   the series.)
> 
> - I verified that the entry work ordering is unchanged. It looks
>   correct to me: arm64 did ptrace, seccomp, tracepoint, audit; generic
>   entry does the same. (It also checks SUD and rseq-slice before those,
>   but neither can be enabled on arm64 yet.)
> 
> Suggestions:
> 
> - rr: Since you have real hardware, could you also run the rr test
>   suite? rr has been the most sensitive ptrace user I've encountered,
>   and it depends on exactly the syscall-stop and single-step behavior
>   this series touches. I couldn't run it: QEMU's TCG PMU exposes PMUv3
>   but only counts CPU_CYCLES (BR_RETIRED always reads 0, on every
>   CPU model I tried), so rr aborts in check_working_counters(). If
>   you do, note that you'll need "proc_mem.force_override=always" (or
>   CONFIG_PROC_MEM_ALWAYS_FORCE=y), or three rr tests fail for unrelated
>   reasons (rr-debugger/rr#4093). Build and test instructions are here:
>   https://github.com/rr-debugger/rr/wiki/Building-And-Installing#tests
> 
> - MTE: I didn't see MTE in the cover letter's test list, and it seems
>   relevant since patch 13 puts _TIF_MTE_ASYNC_FAULT into
>   ARCH_EXIT_TO_USER_MODE_WORK, so an async tag check fault lands
>   on the reworked exit path. The MTE selftests showed no differences,
>   but a third of them don't actually run for me under QEMU, so they'd
>   be worth running on your hardware. (Testing MTE under QEMU saw
>   check_mmap_options hang at test 5, the first test with tag checking
>   on, and check_child_memory never produces output, on both base and
>   patched, so only 117 of the 183 planned MTE tests ran. But this is,
>   of course, a QEMU/selftest issue unrelated to the generic entry.)
> 
> So, for the series:
> 
> Tested-by: Kees Cook <kees@kernel.org>
> 
> -Kees
> 

-- 
Best regards,
Jinjie


