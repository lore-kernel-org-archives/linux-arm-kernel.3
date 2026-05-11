Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B78CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/WRmpKmk9Twp2kERMJ4oyrCR8gGRW2SPU8/Sgnc8BQ=; b=fuu8OBIzJThh5ZiyYqKv/IgbUM
	RhJPNsFJ3TMCCBInpiGZgJMY7q4+Ts7JqADNi1wgFjmE1agat+Y51wtiJXMKLhEnPTwh+prJ8QpfO
	68D9J7RG440LuEQA3CHsjZTbOgroAzLTH7DUTm3Ao3JQr1kf0QGAFGEzT9IfITB6MyTKkovIMryeF
	tih5g541q15igTJjChgw3pG/H9e2h7xMNlzApXU03+x0BCUJRzm9iRJTa6G4m7Ds5X97Kg+qjYRB5
	xA2cfCA+tH0WHkvYEjzae16sVu0Ae/qScsv9iJ0HVMyE60trEHUs0ObSOpiNUxnaTfnSQwJPqAg9E
	vkQ6yL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMqD-0000000CtAo-0RPh;
	Mon, 11 May 2026 09:22:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMq1-0000000CsyT-0Tpx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 09:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=i/WRmpKmk9Twp2kERMJ4oyrCR8gGRW2SPU8/Sgnc8BQ=; b=LeNJaxf8Snh1DaJmVzRO7fKD1G
	hejdm6J/HcSWqhrZ3qeGd8kQZ9i3IuQoJk7MODEumG/CRzsjiSZNvXTVU0R2fgkJCYVFbWYFjVTUj
	ENcuyqGP1QM8nfNnC3sQwYYkuWiX0J9jndAj/mtFUZ4ra+1lB349DeXavAF+ocmJKrQBJrd6wAR4R
	qhsQu0YXc2UEfgfG9sX/LGtrOKDir6jCto5W0pH/Brdu6JGXNVnPnzDEh5ceUY2ahfXw0u2smj8nG
	gG8zkp/Dgj6AxS5kmD54uZqb2Km6lC6ODwHmcgvQUb0CPROzfLA5LK2M0q8Y0mdxaB4xp7ipSLOvy
	mlaIv+cg==;
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMpx-0000000BA5S-06E2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:22:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=i/WRmpKmk9Twp2kERMJ4oyrCR8gGRW2SPU8/Sgnc8BQ=;
	b=MhUiDQb/aARm4DiKxRNFnTn5wFQCH2q5gZqdllMdBOvolooAiS1eUcgWSsIyq4dhfG5Gb0EFM
	XxqwkZvW4rHNGYvVdKbrQw9O8+3wVkzZW91LWUjkl8/Y1KZVf1r5ZvsnostRY4Bm/R7FLRz+lYM
	YKIRo5o6jtQpZd48i9mOUwI=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gDYvN3NsYzKm8x;
	Mon, 11 May 2026 17:14:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id BC6E240562;
	Mon, 11 May 2026 17:22:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 May
 2026 17:22:01 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <ruanjinjie@huawei.com>,
	<mark.rutland@arm.com>, <yeoreum.yun@arm.com>, <linusw@kernel.org>,
	<kevin.brodsky@arm.com>, <ldv@strace.io>, <thuth@redhat.com>,
	<james.morse@arm.com>, <song@kernel.org>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <ryan.roberts@arm.com>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v15 08/11] arm64/ptrace: Define and use _TIF_SYSCALL_EXIT_WORK
Date: Mon, 11 May 2026 17:21:00 +0800
Message-ID: <20260511092103.1974980-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511092103.1974980-1-ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_102206_040013_9D16EFEE 
X-CRM114-Status: GOOD (  14.42  )
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

Introduce _TIF_SYSCALL_EXIT_WORK to filter out entry-only flags
during the syscall exit path. This aligns arm64 with the generic
entry framework's SYSCALL_WORK_EXIT semantics.

[Rationale]
The current syscall exit path uses _TIF_SYSCALL_WORK to decide whether
to invoke syscall_exit_work(). However, _TIF_SYSCALL_WORK includes
flags that are only relevant during syscall entry:

1. _TIF_SECCOMP: Seccomp filtering (__secure_computing) only runs
  on entry. There is no seccomp callback for syscall exit.

2. _TIF_SYSCALL_EMU: In PTRACE_SYSEMU mode, the syscall is
  intercepted and skipped on entry. Since the syscall is never
  executed, reporting a syscall exit stop is unnecessary.

[Changes]
- Define _TIF_SYSCALL_EXIT_WORK: A new mask containing only flags
  requiring exit processing: _TIF_SYSCALL_TRACE, _TIF_SYSCALL_AUDIT,
  and _TIF_SYSCALL_TRACEPOINT.

- Update exit path: Use _TIF_SYSCALL_EXIT_WORK in
  syscall_exit_to_user_mode_work() to avoid redundant calls to
  audit and ptrace reporting when only entry-flags are set.

- Cleanup: Remove the has_syscall_work() helper as it is no longer
  needed. Direct flag comparison is now used to distinguish between
  entry and exit work requirements.

[Impact]
audit_syscall_exit() and report_syscall_exit() will no longer be
triggered for seccomp-only or emu-only syscalls. This matches the
generic entry behavior and improves efficiency by skipping unnecessary
exit processing.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h     | 7 +------
 arch/arm64/include/asm/thread_info.h | 3 +++
 arch/arm64/kernel/syscall.c          | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index b331e09b937f..b982398f8765 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -124,18 +124,13 @@ static inline int syscall_get_arch(struct task_struct *task)
 int syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
 void syscall_exit_work(struct pt_regs *regs, unsigned long flags);
 
-static inline bool has_syscall_work(unsigned long flags)
-{
-	return unlikely(flags & _TIF_SYSCALL_WORK);
-}
-
 static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
 
 	rseq_syscall(regs);
 
-	if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+	if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
 		syscall_exit_work(regs, flags);
 }
 
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 5d7fe3e153c8..56a2c9426a32 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -112,6 +112,9 @@ void arch_setup_new_exec(void);
 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
 				 _TIF_SYSCALL_EMU)
 
+#define _TIF_SYSCALL_EXIT_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
+				 _TIF_SYSCALL_TRACEPOINT)
+
 #ifdef CONFIG_SHADOW_CALL_STACK
 #define INIT_SCS							\
 	.scs_base	= init_shadow_call_stack,			\
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index dac7bcc4bbdf..6ac71a0282d5 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -90,7 +90,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		return;
 	}
 
-	if (has_syscall_work(flags)) {
+	if (unlikely(flags & _TIF_SYSCALL_WORK)) {
 		/*
 		 * The de-facto standard way to skip a system call using ptrace
 		 * is to set the system call to -1 (NO_SYSCALL) and set x0 to a
-- 
2.34.1


