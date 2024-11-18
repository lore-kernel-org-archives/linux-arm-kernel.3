Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D8FD49211
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 12:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wsFjAMVldNn/v1v49LvqvAIhTRoXi8nGjKhi2/7/JCA=; b=ZCf5A5GXqjpWhdt31DweuI+uBJ
	n/yXG97n6ZSir1uoGVWpAYy5CfLBDzOVFGuz/h3MNmGiYElaedlWilz0eVDkmHI3ZGQKMJ45boptU
	kbMJOkfB3RntCEHVimvtiySt/rCS2CgSHiyH9iVfRA5NY7m6/FFBmDBi5rNM+kQPgP1RyM5gxjp31
	OTtZY3g96baWAkLPNsj5CwbtilSucLU6KEbD7GCoCSu5cdYHU5fZo3cik/d2aJXE/pxidoj0TRWup
	nGoHVuMWetY4kX3ZkWH00+qg0K8zrRS0a41F4zRHRiJP16Mmb8Pn8cqtCojrR78NbV1VKF85frthr
	58OpY7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0TN-00000009LXO-2H1z;
	Mon, 18 Nov 2024 12:03:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0SR-00000009LP9-1tpu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 12:02:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AB201682;
	Mon, 18 Nov 2024 04:02:48 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D3F0F3F6A8;
	Mon, 18 Nov 2024 04:02:15 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	jpoimboe@kernel.org,
	kaleshsingh@google.com,
	kristina.martsenko@arm.com,
	linux-kernel@vger.kernel.org,
	madvenka@linux.microsoft.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	mbenes@suse.cz,
	mhiramat@kernel.org,
	puranjay12@gmail.com,
	rostedt@goodmis.org,
	will@kernel.org
Subject: [PATCH] arm64: disable ARCH_CORRECT_STACKTRACE_ON_KRETPROBE tests
Date: Mon, 18 Nov 2024 12:02:04 +0000
Message-Id: <20241118120204.3961548-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_040219_575236_9FB6C3B3 
X-CRM114-Status: GOOD (  15.62  )
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

The kprobes_test suite's test_stacktrace_on_nested_kretprobe() test
currently fails on arm64, e.g.

| KTAP version 1
| 1..1
|     KTAP version 1
|     # Subtest: kprobes_test
|     # module: test_kprobes
|     1..7
|     ok 1 test_kprobe
|     ok 2 test_kprobes
|     ok 3 test_kprobe_missed
|     ok 4 test_kretprobe
|     ok 5 test_kretprobes
|     ok 6 test_stacktrace_on_kretprobe
|     # test_stacktrace_on_nested_kretprobe: EXPECTATION FAILED at lib/test_kprobes.c:327
|     Expected stack_buf[i + 1] == target_return_address[1], but
|         stack_buf[i + 1] == -96519936577004 (0xffffa83733777214)
|         target_return_address[1] == -96519936577136 (0xffffa83733777190)
|     # test_stacktrace_on_nested_kretprobe: EXPECTATION FAILED at lib/test_kprobes.c:338
|     Expected stack_buf[1] == target_return_address[1], but
|         stack_buf[1] == -96519936577004 (0xffffa83733777214)
|         target_return_address[1] == -96519936577136 (0xffffa83733777190)
|     not ok 7 test_stacktrace_on_nested_kretprobe
| # kprobes_test: pass:6 fail:1 skip:0 total:7
| # Totals: pass:6 fail:1 skip:0 total:7
| not ok 1 kprobes_test

The test assumes that when a stacktrace straddles an exception boundary,
no necessary entries will be omitted and no extraneous entries will be
reported, and when unwinding from a kretprobed callee, the next entry in
the trace will be its immediate caller (whether kretprobed or not).

Recently the arm64 stacktrace code was changed to always report the LR
at an exception boundary, where we don't know whether the LR is live.
In the case of the kretprobe trampoline the LR is not live at the time
the stacktrace is performed, and so the entry in the trace for the LR is
extraneous. This can be seen if a call to show_stack() is added to
stacktrace_internal_return_handler():

| Call trace:
|  show_stack+0x18/0x30 (C)
|  stacktrace_internal_return_handler+0x130/0x43c
|  __kretprobe_trampoline_handler+0xa0/0x130
|  kretprobe_breakpoint_handler+0x50/0x70
|  call_break_hook+0x74/0x8c
|  brk_handler+0x1c/0x60
|  do_debug_exception+0x68/0x114
|  el1_dbg+0x70/0x94
|  el1h_64_sync_handler+0xc4/0xe4
|  el1h_64_sync+0x6c/0x70
|  kprobe_stacktrace_target+0x34/0x48 (P)
|  kprobe_stacktrace_target+0x34/0x48 (LK) <-------- extra entry here
|  kprobe_stacktrace_driver+0x24/0x40 (K)
|  test_stacktrace_on_nested_kretprobe+0x84/0x160
|  kunit_try_run_case+0x6c/0x160
|  kunit_generic_run_threadfn_adapter+0x28/0x4c
|  kthread+0x110/0x114
|  ret_from_fork+0x10/0x20

This breaks test_stacktrace_on_nested_kretprobe() because while the
caller (kprobe_stacktrace_driver()) appears in the trace, it doesn't
occur *immediately* after the first instance of callee
(kprobe_stacktrace_target()).

While this behaviour is unfortunate for the kretprobes tests, the
behaviour is desirable elsewhere (e.g. anywhere a human will read the
trace), and is otherwise not harmful.

For the moment, deselect ARCH_CORRECT_STACKTRACE_ON_KRETPROBE on arm64
to disable the tests which depend on this behaviour. With
ARCH_CORRECT_STACKTRACE_ON_KRETPROBE deselected, the remaining tests
work as expected, e.g.

| KTAP version 1
| 1..1
|     KTAP version 1
|     # Subtest: kprobes_test
|     # module: test_kprobes
|     1..5
|     ok 1 test_kprobe
|     ok 2 test_kprobes
|     ok 3 test_kprobe_missed
|     ok 4 test_kretprobe
|     ok 5 test_kretprobes
| # kprobes_test: pass:5 fail:0 skip:0 total:5
| # Totals: pass:5 fail:0 skip:0 total:5
| ok 1 kprobes_test

In future we have several options to improve matters, e.g.

* Add metadata and update arm64's unwinder to skip the LR in this case.
  This is likely to happen as part of work for RELIABLE_STACKTRACE for
  other reasons, and might solve this case by coincidence.

* Modify the kretprobes tests to only require that the caller appears in
  the trace after the callee, rather than requiring that it is
  *immediately* after the callee. We might want separate
  strict/not-strict options for this.

* Use reliable stacktrace for these tests, so that architectures which
  cannot unwind across exception boundaries can explicitly handle this
  by returning an error.

Fixes: c2c6b27b5aa1 ("arm64: stacktrace: unwind exception boundaries")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reported-by: Kristina Martsenko <kristina.martsenko@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Kalesh Singh <kaleshsingh@google.com>
Cc: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Miroslav Benes <mbenes@suse.cz>
Cc: Puranjay Mohan <puranjay12@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 3e29b44d2d7bd..234d926290731 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -14,7 +14,6 @@ config ARM64
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_BINFMT_ELF_EXTRA_PHDRS
 	select ARCH_BINFMT_ELF_STATE
-	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
-- 
2.30.2


