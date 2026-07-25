Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C054C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jDjufJPxmbAXxmGO9YdD7R16Uwh+1TVhvFBJHfcH/5I=; b=rtxdsOMeK+DV1f++Junz83uvQD
	Li5VrdUBeMIezHC2LsQILQ0J3Bo019OxPSvEMmbub25WyW5wQFjkCFONCzdeiADao0xLNnaAUDvuK
	JZgGcrm+Wzqg5dorNPEkIZORrm/MZQO1/hs/RA+jraQlgJ8abnR7wvcyDnwNsERk8ra89JgBcSYsD
	B6g8XxGMrGwg9VTX3ZaX/3Wrgcpupa3lf7WLSoSqbBTaJqwitmaF83OpVM7kPcEd3iYRaCR0tKQlR
	GrYccc1bD42A275qNmkFZzjd5kKRrE9+zJKXs/3c/gsf0gEajp8RnXFvq0paDcUNchXsSG747jxds
	n4Wi/xKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYUB-00000000Cj2-2RmE;
	Sat, 25 Jul 2026 09:15:59 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYU7-00000000Ci2-3ZJu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 09:15:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jDjufJPxmbAXxmGO9YdD7R16Uwh+1TVhvFBJHfcH/5I=;
	b=UolgZPFWnDiZcMQBfm+AEhOO32iGjXdUFOyLdTxsU7PcQaX8lbP3jexPZ6Di5TVD+lh1dixjY
	u0zNkUd5GBVZu0XnDc2sCN4L1/zjfPvDbd1GjaopSJaK6/KLeRM78FN1UxaXVruc8kftK/fYmzO
	6bl0tKhrHCMIflMNb/t/F4g=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h6f9k0X5jzpSv5;
	Sat, 25 Jul 2026 17:06:34 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 5197A2011D;
	Sat, 25 Jul 2026 17:15:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 25 Jul
 2026 17:15:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <linux@armlinux.org.uk>, <wade_farnsworth@mentor.com>,
	<will@kernel.org>, <stevenrwalter@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] ARM: ptrace: keep ARM_ORIG_r0 consistent with ARM_r0 after ptrace writes
Date: Sat, 25 Jul 2026 17:14:52 +0800
Message-ID: <20260725091452.1875627-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_021556_526645_32728AE6 
X-CRM114-Status: GOOD (  14.16  )
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

When ptrace modifies r0 during a syscall-entry stop via PTRACE_SETREGS or
PTRACE_POKEUSR, ARM_ORIG_r0 is not updated.  This causes seccomp filters
and tracepoints to read stale arguments, which disagree with the actual
value dispatched by the kernel.  This is particularly critical for the
SECCOMP_RET_TRACE re-evaluation path.

Fix it by synchronizing ARM_ORIG_r0 after every arch-level ptrace register
write.  The update safely skips syscall-exit stops (where r0 holds the
return value) and NO_SYSCALL states to avoid corrupting non-syscall
contexts. And use ARM_ORIG_r0 in audit_syscall_entry to fix data
inconsistency with seccomp/tracepoints

Cc: stable@vger.kernel.org
Fixes: bf2c9f986692 ("ARM: 7373/1: add support for the generic syscall.h interface")
Link: https://lore.kernel.org/all/al98jdcleu-6tMDL@willie-the-truck/
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm/kernel/ptrace.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index 7951b2c06fec..99c2d594f81a 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -163,6 +163,25 @@ static inline long get_user_reg(struct task_struct *task, int offset)
 	return task_pt_regs(task)->uregs[offset];
 }
 
+static void update_syscall_orig_r0_after_ptrace(struct task_struct *target)
+{
+	struct pt_regs *regs = task_pt_regs(target);
+	struct kernel_siginfo *info = target->last_siginfo;
+	struct thread_info *ti = task_thread_info(target);
+
+	if (!info)
+		return;
+
+	if (ti->abi_syscall == -1)
+		return;
+
+	if ((info->si_code & ~0x80) == SIGTRAP &&
+	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT)
+		return;
+
+	regs->ARM_ORIG_r0 = regs->ARM_r0;
+}
+
 /*
  * this routine will put a word on the processes privileged stack.
  * the offset is how far from the base addr as stored in the THREAD.
@@ -180,6 +199,8 @@ put_user_reg(struct task_struct *task, int offset, long data)
 
 	if (valid_user_regs(&newregs)) {
 		regs->uregs[offset] = data;
+		if (offset == 0)
+			update_syscall_orig_r0_after_ptrace(task);
 		ret = 0;
 	}
 
@@ -566,6 +587,7 @@ static int gpr_set(struct task_struct *target,
 		return -EINVAL;
 
 	*task_pt_regs(target) = newregs;
+	update_syscall_orig_r0_after_ptrace(target);
 	return 0;
 }
 
@@ -784,6 +806,12 @@ long arch_ptrace(struct task_struct *child, long request,
 			if (data != -1)
 				data &= __NR_SYSCALL_MASK;
 			task_thread_info(child)->abi_syscall = data;
+
+			/*
+			 * Re-sync orig_r0 in case the syscall number has
+			 * been changed from -1.
+			 */
+			update_syscall_orig_r0_after_ptrace(child);
 			ret = 0;
 			break;
 
@@ -868,7 +896,7 @@ asmlinkage int syscall_trace_enter(struct pt_regs *regs)
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, scno);
 
-	audit_syscall_entry(scno, regs->ARM_r0, regs->ARM_r1, regs->ARM_r2,
+	audit_syscall_entry(scno, regs->ARM_ORIG_r0, regs->ARM_r1, regs->ARM_r2,
 			    regs->ARM_r3);
 
 	return scno;
-- 
2.34.1


