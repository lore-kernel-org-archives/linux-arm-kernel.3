Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442A3C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 09:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoI1sraNn1QtgUyY5YxVLEE/KvAwSlgQcF2bwSxIYEo=; b=q3IXyumwdIU+k1q0WkyMTALDuf
	yyJR1eOREfxFyNx6miHLKDM+IctFs/hScorXQDF1nm1KTJ3XDyvQVmMqkCvXp77mfiABHCl2ZUHS4
	Kze2MscArT/cHUoC5isxC9N0rbNadBCApsyTNBF1o7k8fsTiafNwrmlfKkXd/CBTDg77PuRZRE1Yt
	puFQLqqDzq+MGJ95kKEvbcSs3EJeto2kZEDsWUHgH6vzEpEGGJ3ryQWAZwi4Up9JKP4nDAeIQXjTK
	PO/e0qxNltggGa/jSVO7PNeA94rVVB7yHrjA9v40ns+sWumgnnWc1zXKosFufzoXay/rj9KnkYhM1
	/UPhK7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hge-0000000EHPf-3cHi;
	Wed, 02 Sep 2026 09:55:20 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hgW-0000000EHBu-35wj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 09:55:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FoI1sraNn1QtgUyY5YxVLEE/KvAwSlgQcF2bwSxIYEo=;
	b=1j4u8TZQMf60kmx3fG2CyJhZ7O8gLyM6g8RTCKpEgY8TlVYHN9G4jAgilb1cNlK8pbQZ5ujKc
	nUxmzolF/yrZah8kZNyd0f3ZtqGbFE2qdimpmQ4Vtt1Dhz2eYOA6PHCOyTMWyT/JKfgW4lSNDhR
	u0vBk3yLLuf5ABGd0gAM1no=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hZd9K1zdnz1cyVf;
	Wed,  2 Sep 2026 17:44:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E4A240565;
	Wed,  2 Sep 2026 17:55:10 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 2 Sep
 2026 17:55:09 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <peterz@infradead.org>, <ada.coupriediaz@arm.com>,
	<linusw@kernel.org>, <kevin.brodsky@arm.com>, <yeoreum.yun@arm.com>,
	<thuth@redhat.com>, <james.morse@arm.com>, <vladimir.murzin@arm.com>,
	<broonie@kernel.org>, <pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<ryan.roberts@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v18 12/14] arm64: ptrace: Make return type of arm64_syscall_trace_enter() bool
Date: Wed, 2 Sep 2026 17:55:35 +0800
Message-ID: <20260902095537.602517-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902095537.602517-1-ruanjinjie@huawei.com>
References: <20260902095537.602517-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_025513_101307_7FA88D15 
X-CRM114-Status: GOOD (  15.46  )
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

In preparation for migrating arm64 to the generic entry infrastructure,
decouple the decision to execute the syscall from the syscall number
itself. The ptrace and seccomp now returns a boolean flag rather than
overloading NO_SYSCALL (-1).

Changes:
- arm64_syscall_trace_enter() returns bool:
  - false: abort syscall execution
  - true: proceed, with syscall number reread from regs
- If we decide to execute the syscall, reread the syscall number
  and check if it is NO_SYSCALL again. Because when a tracer sets
  the syscall number to -1 and provides a custom return value in x0,
  this avoids calling invoke_syscall() which would overwrite the custom
  value with -ENOSYS by sys_ni_syscall().

Behavioral impact (unchanged):
- User-issued syscall(-1): unchanged, returns -ENOSYS.
- Tracer skip with custom x0: unchanged, returns custom x0
- Tracer skip without setting x0: unchanged, returns original
  argument (garbage)
- Normal syscalls and seccomp rejects: unaffected

No functional changes.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 2 +-
 arch/arm64/kernel/ptrace.c       | 8 ++++----
 arch/arm64/kernel/syscall.c      | 6 +++++-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 7cc872fde019..f19d4a8824ba 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -121,7 +121,7 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
+bool arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
 void arm64_syscall_exit_work(struct pt_regs *regs, unsigned long flags);
 
 static __always_inline void arm64_syscall_exit_to_user_mode_work(struct pt_regs *regs)
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 08d2c39ae2ba..9825f4aff187 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2468,14 +2468,14 @@ static inline void syscall_enter_audit(struct pt_regs *regs)
 }
 #endif
 
-int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
+bool arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
 	int ret;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
 		ret = report_syscall_entry(regs);
 		if (ret || (flags & _TIF_SYSCALL_EMU))
-			return NO_SYSCALL;
+			return false;
 
 		/* ptrace might have changed thread flags */
 		flags = read_thread_flags();
@@ -2484,7 +2484,7 @@ int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	/* Do the secure computing after ptrace; failures should be fast. */
 	if (unlikely(flags & _TIF_SECCOMP)) {
 		if (!__seccomp_permit_syscall())
-			return NO_SYSCALL;
+			return false;
 	}
 
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
@@ -2493,7 +2493,7 @@ int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	if (unlikely(audit_context()))
 		syscall_enter_audit(regs);
 
-	return syscall_get_nr(current, regs);
+	return true;
 }
 
 static inline bool report_single_step(unsigned long flags)
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 3488afd45d20..72c6e8b7ab21 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -108,7 +108,11 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 */
 		if (scno == NO_SYSCALL)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		scno = arm64_syscall_trace_enter(regs, read_thread_flags());
+		if (!arm64_syscall_trace_enter(regs, read_thread_flags()))
+			goto trace_exit;
+
+		/* Reread the syscall number as it might have been modified */
+		scno = syscall_get_nr(current, regs);
 		if (scno == NO_SYSCALL)
 			goto trace_exit;
 	}
-- 
2.34.1


