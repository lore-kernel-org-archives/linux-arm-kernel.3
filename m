Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDFF103E2F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 22:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmXJ8K/BpnLUJNna/3dVzpZzaD71lE2VNfovAjbqI3Y=; b=WlRvVRV6GOF/ON26RG970pibai
	517JxfRb4HFCc4gj9in7TX4CmvxPdCe8W7/MmlWZLx1bszWFtoAoCBaUiaZ6JIhaE3tdua5vJpTV8
	AvqSMiJ5K7uuEECZSMVj4dLaagOoDJHU6w9KhlMgUUm/hcZ5uDAl2bTPS0NKLSZp5F8KNaqHa2Qi7
	U2SiZGqvbjEETSuR5ruVrHgwCwAhmVockJpvTm1SmEKX+Gy1URDfHy8KW1W7IkX0sk4r3SLqt5uEz
	SmsU+w0CVjIruV/VXnAoEgf0s8tKRkRaP0cEKcPp5tm/QmTTy9RLhyEqiGz6DskAsCXKCJSYdzNXa
	GuCDYAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SVv-0000000Cjc0-0aKI;
	Wed, 11 Mar 2026 22:58:51 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SVs-0000000Cjb8-14eR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 22:58:49 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12721cd1a2aso13862607c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 15:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773269925; x=1773874725; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bmXJ8K/BpnLUJNna/3dVzpZzaD71lE2VNfovAjbqI3Y=;
        b=bhX4ih701ID8PMrmvRtSBY0YH/cMVh6S/By9v8lh+gr/NMWXKQQwbfpCaBA+C2PYp5
         xnVjR1ZPV0ZCVSKvoSbiLZApwfry6NrSCE8Hs1Ee0XfKSSfSp7ou3WbU+VBF31m4c/Ds
         idPG6q+vOOGwn5Ejn8SfnJKoQIcNZ0XDpMgKFCuRmOiqFGMcHmD+QGddBWPpMTsEmMyJ
         LoaJo2/p4JpsKErj8qTMPfQyW0raodIsD8bmbF+sflUQTcjL1iNQK/uPNlD48+K18Hdo
         vTMvhw51YzVRIK6L5B/O5oldHgmFSen5chKUZTYo7Cft2Sbw3ELjicp8MUgJztNmJfn3
         TnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773269925; x=1773874725;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmXJ8K/BpnLUJNna/3dVzpZzaD71lE2VNfovAjbqI3Y=;
        b=Kl8u49r4d9uTKyCff13nBYvpXx0uHydA9mtI+dOpkmgVFJ7CPtnK4knqvebqPzGCwk
         MmwK89i+2QfzvmtsFs8OI/oHnesdt8qZNS7FakYT/rUoyQehyBVm47tTo1HvnNh3cf0a
         Nu+3RCIxwZZJ8+DxyOm6eoW17jaiV9gFPeGs9dR+QovMIYXwT125EEXmCIOAFa645zZq
         J/kOYSj3Aa3OlUmhMzQ6gG6LcEGke8khnBBqFT4rtsWJ2Kc9RJgSypADpz1AXEfuXkmm
         2jFZAPvjhAoqc50zYyW4bpN4CiU2H9ZwXQ0j9COPVFOjv/HsrYYkbP8LcEf7Lv0vKyTV
         NTbA==
X-Forwarded-Encrypted: i=1; AJvYcCXLe/IXPP+ppcW8idIi8HuXlCNU1bUKPDfwMqb2EsMjm75CfdrGaIAjhFqWgMhL5CXg5OzRPanHVn3EkUbdIPn3@lists.infradead.org
X-Gm-Message-State: AOJu0YyMekPraPzGw5YZV/Ab+HrcoCTMycP0Oz1BXhw5GP3OidRZG7++
	6vHHyXzfd5TGgzCCcjvE+NtgRa/U3BCjOKuoMiNVBlOekTufDjkFI0AwrxBhczLQ7J5hm2DMZSc
	sb7TV7OaIh1bgyQ==
X-Received: from dlbpt3.prod.google.com ([2002:a05:7022:e803:b0:128:cc09:3c31])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:497:b0:119:e56b:c75c with SMTP id a92af1059eb24-128e783cab1mr2269369c88.33.1773269924866;
 Wed, 11 Mar 2026 15:58:44 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:57:40 +0000
In-Reply-To: <20260309223156.GA73501@google.com>
Mime-Version: 1.0
References: <20260309223156.GA73501@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260311225822.1565895-1-cmllamas@google.com>
Subject: [PATCH] static_call: use CFI-compliant return0 stubs
From: Carlos Llamas <cmllamas@google.com>
To: Sami Tolvanen <samitolvanen@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
	Jens Remus <jremus@linux.ibm.com>, Juergen Gross <jgross@suse.com>, 
	Carlos Llamas <cmllamas@google.com>, Conor Dooley <conor.dooley@microchip.com>, 
	David Kaplan <david.kaplan@amd.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, James Morse <james.morse@arm.com>, 
	Thomas Huth <thuth@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Will McVicker <willmcvicker@google.com>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_155848_326347_E563D744 
X-CRM114-Status: GOOD (  22.08  )
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

Architectures with !HAVE_STATIC_CALL (such as arm64) rely on the generic
static_call implementation via indirect calls. In particular, users of
DEFINE_STATIC_CALL_RET0, default to the generic __static_call_return0
stub to optimize the unset path.

However, __static_call_return0 has a fixed signature of "long (*)(void)"
which may not match the expected prototype at callsites. This triggers
CFI failures when CONFIG_CFI is enabled. A trivial linux-perf command
does it:

  $ perf record -a sleep 1
  CFI failure at perf_prepare_sample+0x98/0x7f8 (target: __static_call_return0+0x0/0x10; expected type: 0x837de525)
  Internal error: Oops - CFI: 00000000f2008228 [#1]  SMP
  Modules linked in:
  CPU: 0 UID: 0 PID: 638 Comm: perf Not tainted 7.0.0-rc3 #25 PREEMPT
  Hardware name: linux,dummy-virt (DT)
  pstate: 900000c5 (NzcV daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : perf_prepare_sample+0x98/0x7f8
  lr : perf_prepare_sample+0x70/0x7f8
  sp : ffff80008289bc20
  x29: ffff80008289bc30 x28: 000000000000001f x27: 0000000000000018
  x26: 0000000000000100 x25: ffffffffffffffff x24: 0000000000000000
  x23: 0000000000010187 x22: ffff8000851eba40 x21: 0000000000010087
  x20: ffff0000098c9ea0 x19: ffff80008289bdc0 x18: 0000000000000000
  x17: 00000000837de525 x16: 0000000072923c8f x15: 7fffffffffffffff
  x14: 00007fffffffffff x13: 00000000ffffffea x12: 0000000000000000
  x11: 0000000000000015 x10: 0000000000000000 x9 : ffff8000822f2240
  x8 : ffff800080276e4c x7 : 0000000000000000 x6 : 0000000000000000
  x5 : 0000000000000000 x4 : ffff8000851eba10 x3 : ffff8000851eba40
  x2 : ffff8000822f2240 x1 : 0000000000000000 x0 : 00000009d377c3a0
  Call trace:
   perf_prepare_sample+0x98/0x7f8 (P)
   perf_event_output_forward+0x5c/0x17c
   __perf_event_overflow+0x2fc/0x460
   perf_event_overflow+0x1c/0x28
   armv8pmu_handle_irq+0x134/0x210
  [...]

To fix this, let architectures provide an ARCH_DEFINE_TYPED_STUB_RET0
implementation that generates individual signature-matching stubs for
users of DEFINE_STATIC_CALL_RET0. This ensures the CFI hash of the
target call matches that of the callsite.

Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will McVicker <willmcvicker@google.com>
Fixes: 87b940a0675e ("perf/core: Use static_call to optimize perf_guest_info_callbacks")
Closes: https://lore.kernel.org/all/YfrQzoIWyv9lNljh@google.com/
Suggested-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 arch/Kconfig                         |  4 ++++
 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/linkage.h     |  3 ++-
 arch/arm64/include/asm/static_call.h | 23 +++++++++++++++++++++++
 include/linux/static_call.h          | 19 ++++++++++++++++++-
 kernel/events/core.c                 | 11 +++++++----
 kernel/sched/core.c                  |  4 ++--
 7 files changed, 57 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/include/asm/static_call.h

diff --git a/arch/Kconfig b/arch/Kconfig
index 102ddbd4298e..7735d548f02e 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1678,6 +1678,10 @@ config HAVE_STATIC_CALL_INLINE
 	depends on HAVE_STATIC_CALL
 	select OBJTOOL
 
+config HAVE_STATIC_CALL_TYPED_STUBS
+	bool
+	depends on !HAVE_STATIC_CALL
+
 config HAVE_PREEMPT_DYNAMIC
 	bool
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..b370c31a23cf 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -252,6 +252,7 @@ config ARM64
 	select HAVE_RSEQ
 	select HAVE_RUST if RUSTC_SUPPORTS_ARM64
 	select HAVE_STACKPROTECTOR
+	select HAVE_STATIC_CALL_TYPED_STUBS if CFI
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
index 40bd17add539..5625ea365d27 100644
--- a/arch/arm64/include/asm/linkage.h
+++ b/arch/arm64/include/asm/linkage.h
@@ -4,9 +4,10 @@
 #ifdef __ASSEMBLER__
 #include <asm/assembler.h>
 #endif
+#include <linux/stringify.h>
 
 #define __ALIGN		.balign CONFIG_FUNCTION_ALIGNMENT
-#define __ALIGN_STR	".balign " #CONFIG_FUNCTION_ALIGNMENT
+#define __ALIGN_STR	__stringify(__ALIGN)
 
 /*
  * When using in-kernel BTI we need to ensure that PCS-conformant
diff --git a/arch/arm64/include/asm/static_call.h b/arch/arm64/include/asm/static_call.h
new file mode 100644
index 000000000000..ef754b58b1c9
--- /dev/null
+++ b/arch/arm64/include/asm/static_call.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_STATIC_CALL_H
+#define _ASM_ARM64_STATIC_CALL_H
+
+#include <linux/compiler.h>
+#include <asm/linkage.h>
+
+/* Generates a CFI-compliant "return 0" stub matching @reffunc signature */
+#define __ARCH_DEFINE_TYPED_STUB_RET0(name, reffunc)	\
+	typeof(reffunc) name;				\
+	__ADDRESSABLE(name);				\
+	asm(						\
+	"	" __ALIGN_STR "                \n"	\
+	"	.4byte	__kcfi_typeid_" #name "\n"	\
+	#name ":                               \n"	\
+	"	bti c                          \n"	\
+	"	mov x0, xzr                    \n"	\
+	"	ret"					\
+	);
+#define ARCH_DEFINE_TYPED_STUB_RET0(name, reffunc)	\
+	__ARCH_DEFINE_TYPED_STUB_RET0(name, reffunc)
+
+#endif /* _ASM_ARM64_STATIC_CALL_H */
diff --git a/include/linux/static_call.h b/include/linux/static_call.h
index 78a77a4ae0ea..6cb44441dfe0 100644
--- a/include/linux/static_call.h
+++ b/include/linux/static_call.h
@@ -184,6 +184,8 @@ extern int static_call_text_reserved(void *start, void *end);
 
 extern long __static_call_return0(void);
 
+#define STATIC_CALL_STUB_RET0(...)	((void *)&__static_call_return0)
+
 #define DEFINE_STATIC_CALL(name, _func)					\
 	DECLARE_STATIC_CALL(name, _func);				\
 	struct static_call_key STATIC_CALL_KEY(name) = {		\
@@ -270,6 +272,8 @@ static inline int static_call_text_reserved(void *start, void *end)
 
 extern long __static_call_return0(void);
 
+#define STATIC_CALL_STUB_RET0(...)	((void *)&__static_call_return0)
+
 #define EXPORT_STATIC_CALL(name)					\
 	EXPORT_SYMBOL(STATIC_CALL_KEY(name));				\
 	EXPORT_SYMBOL(STATIC_CALL_TRAMP(name))
@@ -294,6 +298,18 @@ static inline long __static_call_return0(void)
 	return 0;
 }
 
+#ifdef CONFIG_HAVE_STATIC_CALL_TYPED_STUBS
+#include <asm/static_call.h>
+
+#define STATIC_CALL_STUB_RET0(name)	__static_call_##name
+#define DEFINE_STATIC_CALL_STUB_RET0(name, _func)			\
+	ARCH_DEFINE_TYPED_STUB_RET0(STATIC_CALL_STUB_RET0(name), _func)
+#else
+/* Fall back to the generic __static_call_return0 stub */
+#define STATIC_CALL_STUB_RET0(...)	((void *)&__static_call_return0)
+#define DEFINE_STATIC_CALL_STUB_RET0(...)
+#endif
+
 #define __DEFINE_STATIC_CALL(name, _func, _func_init)			\
 	DECLARE_STATIC_CALL(name, _func);				\
 	struct static_call_key STATIC_CALL_KEY(name) = {		\
@@ -307,7 +323,8 @@ static inline long __static_call_return0(void)
 	__DEFINE_STATIC_CALL(name, _func, NULL)
 
 #define DEFINE_STATIC_CALL_RET0(name, _func)				\
-	__DEFINE_STATIC_CALL(name, _func, __static_call_return0)
+	DEFINE_STATIC_CALL_STUB_RET0(name, _func)			\
+	__DEFINE_STATIC_CALL(name, _func, STATIC_CALL_STUB_RET0(name))
 
 static inline void __static_call_nop(void) { }
 
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 1f5699b339ec..6ac00e89d320 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7695,16 +7695,19 @@ void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
+#define static_call_disable(name) \
+	static_call_update(name, STATIC_CALL_STUB_RET0(name))
+
 void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
 	if (WARN_ON_ONCE(rcu_access_pointer(perf_guest_cbs) != cbs))
 		return;
 
 	rcu_assign_pointer(perf_guest_cbs, NULL);
-	static_call_update(__perf_guest_state, (void *)&__static_call_return0);
-	static_call_update(__perf_guest_get_ip, (void *)&__static_call_return0);
-	static_call_update(__perf_guest_handle_intel_pt_intr, (void *)&__static_call_return0);
-	static_call_update(__perf_guest_handle_mediated_pmi, (void *)&__static_call_return0);
+	static_call_disable(__perf_guest_state);
+	static_call_disable(__perf_guest_get_ip);
+	static_call_disable(__perf_guest_handle_intel_pt_intr);
+	static_call_disable(__perf_guest_handle_mediated_pmi);
 	synchronize_rcu();
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b7f77c165a6e..57c441d01564 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7443,12 +7443,12 @@ EXPORT_SYMBOL(__cond_resched);
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_HAVE_PREEMPT_DYNAMIC_CALL
 #  define cond_resched_dynamic_enabled	__cond_resched
-#  define cond_resched_dynamic_disabled	((void *)&__static_call_return0)
+#  define cond_resched_dynamic_disabled	STATIC_CALL_STUB_RET0(cond_resched)
 DEFINE_STATIC_CALL_RET0(cond_resched, __cond_resched);
 EXPORT_STATIC_CALL_TRAMP(cond_resched);
 
 #  define might_resched_dynamic_enabled	__cond_resched
-#  define might_resched_dynamic_disabled ((void *)&__static_call_return0)
+#  define might_resched_dynamic_disabled STATIC_CALL_STUB_RET0(might_resched)
 DEFINE_STATIC_CALL_RET0(might_resched, __cond_resched);
 EXPORT_STATIC_CALL_TRAMP(might_resched);
 # elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-- 
2.53.0.473.g4a7958ca14-goog


