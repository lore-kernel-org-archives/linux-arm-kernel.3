Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1101FC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qgGOsLRSny5mKTi2HoGDW1pf/YDOLuQ0yEc3IdQg7SM=; b=Hkb277atuqms8dxYhcQn9GY+IM
	26r/gaSv6ei29rBy2WzyoD7vkDpVq/BZaEz7gHBEc/IHIY6H6T30Ycx+PsVw9N9luYMtqriFh10Qw
	eJL0ZKbxgiTfH3PNs39KicNsisiE1y6rlDh9XS36BtwQ27M1L7wkUFjj0yJGATce/7XB3tUnnf6XO
	xKIGxcGlGbx3++RdqvY2bbcTYVZUU8mDhwEHpimBcG9HumbVneHepB02fQzxc/+9hy8KFRdyStuXz
	K14+bAGRSKNZmneZx5tjgYfJK+njgn9NW3t8WmCDEBTnnVaPOBaB4AEGc5Em0yNpgwI/WCZ8+tv9p
	hbIknQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sp5-0000000Apu1-051V;
	Thu, 10 Apr 2025 14:24:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2smm-0000000ApPv-2Sin
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 14:21:46 +0000
Date: Thu, 10 Apr 2025 16:21:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744294901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qgGOsLRSny5mKTi2HoGDW1pf/YDOLuQ0yEc3IdQg7SM=;
	b=K5bRj0DI46s7Hj9YciNz7p79NgRoiK+VKZfyrYmgeNkkYjW9p03DbT0+vYM6xhBRt+WsgY
	JDapZJ3+wGjR6I/2IPYMW5jAdOWCgbFkI7oG07evYmXdhBYd4/+HBg8NeCJ6Bj/5+d0Gsv
	+/XJVhZ836sw88bEFz3LnSJjepQN2n7eMfLPF4dK5nk2KPaGmeA4h1+rJEfsWYISbU+nBz
	JW2LaqFJOTF2vUVYubwYrkPN0twoJFU4lgESqxtbxYMrrgXYpit4sYqOkjsWfLdjUc3ZPO
	M00YpYdkJZo0FfuJXgMdfdM25pWBg1SjCwshk1YW0/9AMBqRir/cdzPy8N+kzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744294901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qgGOsLRSny5mKTi2HoGDW1pf/YDOLuQ0yEc3IdQg7SM=;
	b=eUIZDpyaNmHI7BKC7kTfcAqjOuqXbl3qk39GrtfBWrDlTihMu/RDdo6A46ss6oLV+VVDg5
	+XlOZWNwKcE3zICQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Mike Galbraith <efault@gmx.de>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Peter Collingbourne <pcc@google.com>,
	Petr Tesarik <ptesarik@suse.com>, Phil Auld <pauld@redhat.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2] arm64: enable PREEMPT_LAZY
Message-ID: <20250410142139.h5iV134E@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_072144_911781_C561EF2E 
X-CRM114-Status: GOOD (  11.59  )
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

=46rom: Mark Rutland <mark.rutland@arm.com>

For an architecture to enable CONFIG_ARCH_HAS_RESCHED_LAZY, two things are
required:
1) Adding a TIF_NEED_RESCHED_LAZY flag definition
2) Checking for TIF_NEED_RESCHED_LAZY in the appropriate locations

2) is handled in a generic manner by CONFIG_GENERIC_ENTRY, which isn't
(yet) implemented for arm64. However, outside of core scheduler code,
TIF_NEED_RESCHED_LAZY only needs to be checked on a kernel exit, meaning:
o return/entry to userspace.
o return/entry to guest.

The return/entry to a guest is all handled by xfer_to_guest_mode_handle_wor=
k()
which already does the right thing, so it can be left as-is.

arm64 doesn't use common entry's exit_to_user_mode_prepare(), so update its
return to user path to check for TIF_NEED_RESCHED_LAZY and call into
schedule() accordingly.

Link: https://lore.kernel.org/linux-rt-users/20241216190451.1c61977c@mordec=
ai.tesarici.cz/
Link: https://lore.kernel.org/all/xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14=
sgen2i.remote.csb/
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
[testdrive, _TIF_WORK_MASK fixlet and changelog.]
Signed-off-by: Mike Galbraith <efault@gmx.de>
[Another round of testing; changelog faff]
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/r/20250305104925.189198-2-vschneid@redhat.com
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 v1=E2=80=A6v2: Repost of https://lore.kernel.org/all/20250305104925.189198=
-1-vschneid@redhat.com

 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/thread_info.h | 16 +++++++++-------
 arch/arm64/kernel/entry-common.c     |  2 +-
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08b..84e3094b00ef2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -42,6 +42,7 @@ config ARM64
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
+	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_DEVMAP
 	select ARCH_HAS_PTE_SPECIAL
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/=
thread_info.h
index 1114c1c3300a1..4443ef2789758 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -59,11 +59,12 @@ void arch_setup_new_exec(void);
=20
 #define TIF_SIGPENDING		0	/* signal pending */
 #define TIF_NEED_RESCHED	1	/* rescheduling necessary */
-#define TIF_NOTIFY_RESUME	2	/* callback before returning to user */
-#define TIF_FOREIGN_FPSTATE	3	/* CPU's FP state is not current's */
-#define TIF_UPROBE		4	/* uprobe breakpoint or singlestep */
-#define TIF_MTE_ASYNC_FAULT	5	/* MTE Asynchronous Tag Check Fault */
-#define TIF_NOTIFY_SIGNAL	6	/* signal notifications exist */
+#define TIF_NEED_RESCHED_LAZY	2	/* Lazy rescheduling needed */
+#define TIF_NOTIFY_RESUME	3	/* callback before returning to user */
+#define TIF_FOREIGN_FPSTATE	4	/* CPU's FP state is not current's */
+#define TIF_UPROBE		5	/* uprobe breakpoint or singlestep */
+#define TIF_MTE_ASYNC_FAULT	6	/* MTE Asynchronous Tag Check Fault */
+#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
 #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
 #define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
 #define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
@@ -85,6 +86,7 @@ void arch_setup_new_exec(void);
=20
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
+#define _TIF_NEED_RESCHED_LAZY	(1 << TIF_NEED_RESCHED_LAZY)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_FOREIGN_FPSTATE	(1 << TIF_FOREIGN_FPSTATE)
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
@@ -100,10 +102,10 @@ void arch_setup_new_exec(void);
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_TSC_SIGSEGV	(1 << TIF_TSC_SIGSEGV)
=20
-#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
+#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY | \
 				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
 				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
-				 _TIF_NOTIFY_SIGNAL)
+				 _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING)
=20
 #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-com=
mon.c
index b260ddc4d3e9a..7993fab0cab4c 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -132,7 +132,7 @@ static void do_notify_resume(struct pt_regs *regs, unsi=
gned long thread_flags)
 	do {
 		local_irq_enable();
=20
-		if (thread_flags & _TIF_NEED_RESCHED)
+		if (thread_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
 			schedule();
=20
 		if (thread_flags & _TIF_UPROBE)
--=20
2.49.0


