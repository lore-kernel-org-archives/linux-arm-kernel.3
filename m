Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8B2C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 02:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+cVGKFbmlUpUZheELnmpV7HV5ulQT0c0H3v3uXBPBk=; b=3Pgj8M8X5LjnIUsVtUMgN4vzsX
	YR0Ko9qVzC+ktRdGtd6hKVJlLJ04cXKbkzj2NkM3KdlwxjuKRJ7yPxCAPVdUrQafhlb9d3Mq1FoZT
	vjhOCPR7kkzt8S3MGSb5KP562mCD3L8PWb3I7oATfQ6Oo3lOmYXPcPQqfBqZBXnBd7Z0jlI5VEQFX
	YwI6b8rrTsFShOmzWBWjSH9lS6SOgQ5ccF/ytxfefcDPv9uMNte84NnzHWKGrA/exwWKFEr6MejCf
	WfduXn5yfie33ump7qlXYeZ+lw4NcP63rMdB4xOQ7baoC+MdITPUJseW5SvNJKO+WV4pCphVc0Ljb
	dTr/F+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71uI-0000000AT18-3wht;
	Thu, 17 Sep 2026 02:31:26 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71uA-0000000ASyX-18wm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 02:31:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=A+cVGKFbmlUpUZheELnmpV7HV5ulQT0c0H3v3uXBPBk=;
	b=gQj6xI51RmZoGLNEYJ7vMhwOHnAgTqkM+sQNWWUD87zAFB13If8HZHg9WIhG0z1gIUzG/tYKC
	jrhwRExI0jL5sO+kPA4aLXe1FZX7758J7otrcGwmyfy1JBwDzoWDUPPgVKtBhttWp8cfxk8vef5
	/bYuzE8wCPXEytwCR1LSQ70=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hlfc06fJkz1K99r;
	Thu, 17 Sep 2026 10:20:16 +0800 (CST)
Received: from kwepemk300012.china.huawei.com (unknown [7.202.194.175])
	by mail.maildlp.com (Postfix) with ESMTPS id 3204A402AB;
	Thu, 17 Sep 2026 10:31:16 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemk300012.china.huawei.com (7.202.194.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 17 Sep 2026 10:31:15 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <sashal@kernel.org>, <gregkh@linuxfoundation.org>,
	<linux@armlinux.org.uk>, <bigeasy@linutronix.de>, <clrkwllms@kernel.org>,
	<rostedt@goodmis.org>, <rmk+kernel@armlinux.org.uk>, <linusw@kernel.org>,
	<kuninori.morimoto.gx@renesas.com>, <arnd@arndb.de>, <xiqi2@huawei.com>,
	<ljs@kernel.org>, <wozizhi@huaweicloud.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-rt-devel@lists.linux.dev>, <stable@vger.kernel.org>,
	<patches@lists.linux.dev>, <lisongze2@huawei.com>, <wangbing6@huawei.com>,
	Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: [PATCH v2 5.10.y/5.15.y 2/3] ARM: fix branch predictor hardening
Date: Thu, 17 Sep 2026 10:30:55 +0800
Message-ID: <20260917023056.2280-3-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917023056.2280-1-xieyuanbin1@huawei.com>
References: <20260917023056.2280-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk300012.china.huawei.com (7.202.194.175)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_193119_386022_FBEF56F4 
X-CRM114-Status: GOOD (  28.85  )
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

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

[ Upstream commit fd2dee1c6e2256f726ba33fd3083a7be0efc80d3 ]

__do_user_fault() may be called with indeterminent interrupt enable
state, which means we may be preemptive at this point. This causes
problems when calling harden_branch_predictor(). For example, when
called from a data abort, do_alignment_fault()->do_bad_area().

Move harden_branch_predictor() out of __do_user_fault() and into the
calling contexts.

Moving it into do_kernel_address_page_fault(), we can be sure that
interrupts will be disabled here.

Converting do_translation_fault() to use do_kernel_address_page_fault()
rather than do_bad_area() means that we keep branch predictor handling
for translation faults. Interrupts will also be disabled at this call
site.

do_sect_fault() needs special handling, so detect user mode accesses
to kernel-addresses, and add an explicit call to branch predictor
hardening.

Finally, add branch predictor hardening to do_alignment() for the
faulting case (user mode accessing kernel addresses) before interrupts
are enabled.

This should cover all cases where harden_branch_predictor() is called,
ensuring that it is always has interrupts disabled, also ensuring that
it is called early in each call path.

[ Xie Yuanbin: At the upstream, the following patches are a patch set:
  1. commit dea20281ac8822661576 ("ARM: group is_permission_fault() with
     is_translation_fault()")
  2. commit 40b466db1dffb41f0529 ("ARM: allow __do_kernel_fault() to
     report execution of memory faults")
  3. commit 7733bc7d299d682f2723 ("ARM: fix hash_name() fault")
  4. commit fd2dee1c6e2256f726ba ("ARM: fix branch predictor hardening")
  patch 1. and 2. is unneeded for 5.10.y and 5.15.y . This patch backports
  patch 4. and simply adapts to the context differences. ]

Reviewed-by: Xie Yuanbin <xieyuanbin1@huawei.com>
Tested-by: Xie Yuanbin <xieyuanbin1@huawei.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 arch/arm/mm/alignment.c |  4 ++++
 arch/arm/mm/fault.c     | 39 ++++++++++++++++++++++++++-------------
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mm/alignment.c b/arch/arm/mm/alignment.c
index bcefe3f51744..758504a28c13 100644
--- a/arch/arm/mm/alignment.c
+++ b/arch/arm/mm/alignment.c
@@ -23,6 +23,7 @@
 #include <asm/cp15.h>
 #include <asm/system_info.h>
 #include <asm/unaligned.h>
+#include <asm/system_misc.h>
 #include <asm/opcodes.h>
 
 #include "fault.h"
@@ -809,6 +810,9 @@ do_alignment(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	int thumb2_32b = 0;
 	int fault;
 
+	if (addr >= TASK_SIZE && user_mode(regs))
+		harden_branch_predictor();
+
 	if (interrupts_enabled(regs))
 		local_irq_enable();
 
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 094137cd29c8..4afb076383a8 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -145,9 +145,6 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 {
 	struct task_struct *tsk = current;
 
-	if (addr > TASK_SIZE)
-		harden_branch_predictor();
-
 #ifdef CONFIG_DEBUG_USER
 	if (((user_debug & UDBG_SEGV) && (sig == SIGSEGV)) ||
 	    ((user_debug & UDBG_BUS)  && (sig == SIGBUS))) {
@@ -255,8 +252,10 @@ do_kernel_address_page_fault(struct mm_struct *mm, unsigned long addr,
 		/*
 		 * Fault from user mode for a kernel space address. User mode
 		 * should not be faulting in kernel space, which includes the
-		 * vector/khelper page. Send a SIGSEGV.
+		 * vector/khelper page. Handle the branch predictor hardening
+		 * while interrupts are still disabled, then send a SIGSEGV.
 		 */
+		harden_branch_predictor();
 		__do_user_fault(addr, fsr, SIGSEGV, SEGV_MAPERR, regs);
 	} else {
 		/*
@@ -421,16 +420,20 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
  * We enter here because the first level page table doesn't contain
  * a valid entry for the address.
  *
- * If the address is in kernel space (>= TASK_SIZE), then we are
- * probably faulting in the vmalloc() area.
+ * If this is a user address (addr < TASK_SIZE), we handle this as a
+ * normal page fault. This leaves the remainder of the function to handle
+ * kernel address translation faults.
  *
- * If the init_task's first level page tables contains the relevant
- * entry, we copy the it to this task.  If not, we send the process
- * a signal, fixup the exception, or oops the kernel.
+ * Since user mode is not permitted to access kernel addresses, pass these
+ * directly to do_kernel_address_page_fault() to handle.
  *
- * NOTE! We MUST NOT take any locks for this case. We may be in an
- * interrupt or a critical region, and should only copy the information
- * from the master page table, nothing more.
+ * Otherwise, we're probably faulting in the vmalloc() area, so try to fix
+ * that up. Note that we must not take any locks or enable interrupts in
+ * this case.
+ *
+ * If vmalloc() fixup fails, that means the non-leaf page tables did not
+ * contain an entry for this address, so handle this via
+ * do_kernel_address_page_fault().
  */
 #ifdef CONFIG_MMU
 static int __kprobes
@@ -496,7 +499,8 @@ do_translation_fault(unsigned long addr, unsigned int fsr,
 	return 0;
 
 bad_area:
-	do_bad_area(addr, fsr, regs);
+	do_kernel_address_page_fault(current->mm, addr, fsr, regs);
+
 	return 0;
 }
 #else					/* CONFIG_MMU */
@@ -516,7 +520,16 @@ do_translation_fault(unsigned long addr, unsigned int fsr,
 static int
 do_sect_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 {
+	/*
+	 * If this is a kernel address, but from user mode, then userspace
+	 * is trying bad stuff. Invoke the branch predictor handling.
+	 * Interrupts are disabled here.
+	 */
+	if (addr >= TASK_SIZE && user_mode(regs))
+		harden_branch_predictor();
+
 	do_bad_area(addr, fsr, regs);
+
 	return 0;
 }
 #endif /* CONFIG_ARM_LPAE */
-- 
2.55.0


