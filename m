Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391ABC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 01:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0YLltPeizTaHD27Fn9ffDythfCLu2l1zT8h2w1jiMvo=; b=jS0b2xgRvCCLYnmBhyn56FRZGp
	/5M1TXY+p/5Jqox8oynQMCvl/fGBQXk3zBd/IIFMIZdG4TOvS5MZw+uCZlDpovonWdqqzm1IOeN+3
	nlfih+wiRayCTg3dZKNrb7j/AyjF+V9zXcm6VFSR+EYv+XBzDC64lSRCVcBDI9Sylw9r2844j58c9
	Z2nLJGVcKBmGcRwHUmwJiGLtnNfes83VsM/cWHvhBK96KrGGZvY+pyeXAZQ2MuUxaGuq2cGOvqd8u
	lJ8W7VQRQj/WfbSB6Pw8vTc7S5bVdCry9xf7+Fwv9G2cvrvlm9xu/jdymje/AthniGN5DfgGnF6X+
	YqC/KyXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkB7t-0000000GDMd-2CD9;
	Thu, 16 Jul 2026 01:43:01 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkB7p-0000000GDLW-01at
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 01:42:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0YLltPeizTaHD27Fn9ffDythfCLu2l1zT8h2w1jiMvo=;
	b=ftree1watZKga8gU6wNb3X37dDAZx5DBaRpXyIo8dK0PIG+r09OhTLrWbAP+EFMyiLl/mhOg9
	wvg47lyIbLvIW25CzZlR/ByYnfIQdNM0i837uVWZP+z0naeGcDqad6oLoyLkpVWq/iwXfJUX62J
	QYVKNY6oWx7GuSbjyXwVDFc=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4h0wXv2KqQzLlXT;
	Thu, 16 Jul 2026 09:33:19 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 14F3940572;
	Thu, 16 Jul 2026 09:42:38 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 16 Jul 2026 09:42:37 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <ljs@kernel.org>, <akpm@linux-foundation.org>,
	<xiqi2@huawei.com>, <david@kernel.org>, <linusw@kernel.org>,
	<liam@infradead.org>, <vbabka@kernel.org>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, <sunnanyong@huawei.com>, Xie Yuanbin
	<xieyuanbin1@huawei.com>
Subject: [PATCH v4] ARM: mm: acquire mmap write lock around show_pte() for user faults
Date: Thu, 16 Jul 2026 09:40:22 +0800
Message-ID: <20260716014022.2823-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_184257_675632_3C7B6BCC 
X-CRM114-Status: GOOD (  20.38  )
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

When CONFIG_DEBUG_USER=y, and cmdline "user_debug=31" is set,
a user fault may trigger show_pte() without any lock.
If another thread in the same process concurrently calls munmap(),
the page table pages may be freed while show_pte() is still traversing
them, causing a use-after-free in show_pte().

If CONFIG_ARM_LPAE=y, this may cause a kernel panic if the pages table
of PMD are freed when show_pte() is running.

Acquire mmap_write_lock() around show_pte() for user faults to fix the
contention.

For user faults, additionally restrict that show_pte() is called only
when the addr is a user-space address (addr < TASK_SIZE). This is because
the lock of tsk->mm only protects the virtual memory of user address space,
furthermore, dumping the page tables of a kernel-space address for user
faults is unnecessary and may have security implications.

Keep everything unchanged for kernel faults, because the kernel is
already in the "oops" state, acquiring a lock may risk a deadlock.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: 6d021b724481 ("ARM: dump pgd, pmd and pte states on unhandled data abort faults")
Depends-on: <20260629123349.134224-1-xieyuanbin1@huawei.com>
Depends-on: 59e4f3b45b96 ("ARM: ensure interrupts are enabled in __do_user_fault()")

Cc: Russell King <linux@armlinux.org.uk>
Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Co-developed-by: Qi Xi <xiqi2@huawei.com>
Signed-off-by: Qi Xi <xiqi2@huawei.com>
Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
For __do_user_fault(), it must be a user fault, so the
judgement of user_mode(regs) can be omitted.

For do_DataAbort(), it may be a user fault or a kernel fault. If it is
a kernel fault, it must be a kernel oops, the kernel will die soon.
Also, a user program may be constructed to trigger
do_DataAbort()->show_pte(), as described in this mail:
Link: https://lore.kernel.org/20260625100031.25088-1-xieyuanbin1@huawei.com

For user faults, it is safe to acquire mmap_write_lock(), because
we never return to user with mmap lock held or pagefault disabled.

Note that, due to the lack of ARMv4T for testing, this patch does not
fix the issue in baddataabort()->show_pte().

V3->V4:
  - Keep nothing change for kernel faults.
  - Change mmap read lock to write lock.
  - Restrict that show_pte() is called only when the addr
    is a user-space address (addr < TASK_SIZE).

 arch/arm/mm/fault.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index c68677503532..0a09d4ff7718 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -174,21 +174,25 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 	struct task_struct *tsk = current;
 
 	local_irq_enable();
 
 #ifdef CONFIG_DEBUG_USER
 	if (((user_debug & UDBG_SEGV) && (sig == SIGSEGV)) ||
 	    ((user_debug & UDBG_BUS)  && (sig == SIGBUS))) {
 		pr_err("8<--- cut here ---\n");
 		pr_err("%s: unhandled page fault (%d) at 0x%08lx, code 0x%03x\n",
 		       tsk->comm, sig, addr, fsr);
-		show_pte(KERN_ERR, tsk->mm, addr);
+		if (likely(addr < TASK_SIZE)) {
+			mmap_write_lock(tsk->mm);
+			show_pte(KERN_ERR, tsk->mm, addr);
+			mmap_write_unlock(tsk->mm);
+		}
 		show_regs(regs);
 	}
 #endif
 #ifndef CONFIG_KUSER_HELPERS
 	if ((sig == SIGSEGV) && ((addr & PAGE_MASK) == 0xffff0000))
 		printk_ratelimited(KERN_DEBUG
 				   "%s: CONFIG_KUSER_HELPERS disabled at 0x%08lx\n",
 				   tsk->comm, addr);
 #endif
 
@@ -632,21 +636,29 @@ do_DataAbort(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 
 	if (!inf->fn(addr, fsr & ~FSR_LNX_PF, regs))
 		return;
 
 	if (likely(user_mode(regs)))
 		local_irq_enable();
 
 	pr_alert("8<--- cut here ---\n");
 	pr_alert("Unhandled fault: %s (0x%03x) at 0x%08lx\n",
 		inf->name, fsr, addr);
-	show_pte(KERN_ALERT, current->mm, addr);
+	if (likely(user_mode(regs))) {
+		if (addr < TASK_SIZE) {
+			mmap_write_lock(current->mm);
+			show_pte(KERN_ALERT, current->mm, addr);
+			mmap_write_unlock(current->mm);
+		}
+	} else {
+		show_pte(KERN_ALERT, current->mm, addr);
+	}
 
 	arm_notify_die("", regs, inf->sig, inf->code, (void __user *)addr,
 		       fsr, 0);
 }
 
 void __init
 hook_ifault_code(int nr, int (*fn)(unsigned long, unsigned int, struct pt_regs *),
 		 int sig, int code, const char *name)
 {
 	if (nr < 0 || nr >= ARRAY_SIZE(ifsr_info))
-- 
2.53.0


