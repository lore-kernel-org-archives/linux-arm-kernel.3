Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913A9CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+Uv0cdR6Pf4fklaZ04Ly+ptfQmm7jQs2VnfdYuLltw=; b=1PsXvzMVMQVWqrRemCoCtpUw3Z
	CiDH0nz+NyrB8XBTf8Ohchp11dINHw88N2iegXh5W5DtMgmP08FFit6a79kPMc6un57xgEiPsQcvc
	yUK+FNZyDMflgBa6n2xYeQlKRfPcNf6BwJ8Xv4TsmFPjmxzHdTwnMkEFAV16rNZnsv9s5FetoRR1Z
	j7tb3vZF2MDiT2AWwhBeLDzIXyF+22Js9MsUcHPCPVf4iMiLKHu0J9uFFxAa+A0xLUZhUI1ZTg8cI
	RQLK9q65SSuxQdMbBCiFMBfLSEIg8Bboy13NqShxK8RJ9Q1byT8wEUyBNZOGANi6ioMRF0xsIKV7M
	1RdGwpOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Fn-0000000AhMF-3HMU;
	Fri, 26 Jun 2026 07:45:35 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Fg-0000000AhIc-0acm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:45:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=I+Uv0cdR6Pf4fklaZ04Ly+ptfQmm7jQs2VnfdYuLltw=;
	b=oGTAdcEICBAksGGu2Fm6Qo5SurU4/2RBMt7AI2cLPRvgVDbNtKXORcrimPfnx8D9YnYz5y/f1
	GyJqQsaJ3s7dccDuWfNBoPCp01A24/c3J9FfsYOAEXQFsAVzophX/uCN/FLPWQU+9g9x9yUixEv
	uYmGi1uVcPsYylvmtvAwPKc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gmnYC1KwjzcZyQ;
	Fri, 26 Jun 2026 15:36:31 +0800 (CST)
Received: from kwepemo200010.china.huawei.com (unknown [7.202.195.178])
	by mail.maildlp.com (Postfix) with ESMTPS id 434CC40538;
	Fri, 26 Jun 2026 15:45:12 +0800 (CST)
Received: from huawei.com (10.44.142.85) by kwepemo200010.china.huawei.com
 (7.202.195.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 26 Jun
 2026 15:45:11 +0800
From: Qi Xi <xiqi2@huawei.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Yuanbin Xie <xieyuanbin1@huawei.com>, Nanyong Sun <sunnanyong@huawei.com>, Qi
 Xi <xiqi2@huawei.com>
Subject: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault() under CONFIG_DEBUG_USER
Date: Fri, 26 Jun 2026 15:30:47 +0800
Message-ID: <20260626073048.3595106-2-xiqi2@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260626073048.3595106-1-xiqi2@huawei.com>
References: <20260626073048.3595106-1-xiqi2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.44.142.85]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo200010.china.huawei.com (7.202.195.178)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004528_485593_8DA4988E 
X-CRM114-Status: GOOD (  10.90  )
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

When CONFIG_DEBUG_USER is enabled with user_debug=31 on 32-bit ARM,
a user page fault triggers show_pte() via __do_user_fault() after
do_page_fault() has already released mmap_read_lock. If another
thread concurrently calls munmap(), the page table pages can be
freed while show_pte() is still reading them, causing a
use-after-free in show_pte().

The race can be reproduced on multi_v7_defconfig with:
    CONFIG_DEBUG_USER=y
    CONFIG_ARM_LPAE=y
    kernel command line: user_debug=31

A delay inserted in show_pte() for testing widens the race window and
makes the UAF reliably reproducible. On LPAE, the race works as
follows:

  CPU 0 (fault path)                       CPU 1 (munmap)
  munmap(page 0) -> clears PTE[0]
  PTE/PMD pages remain

  read page 0 -> page fault
    -> do_DataAbort()
      -> do_page_fault()
        -> lock_mm_and_find_vma() -> no VMA
           (mmap_read_lock released)
        -> __do_user_fault()
          -> show_pte(tsk->mm, addr)
            -> *pgd (valid)
            -> p4d/pud checks pass

            -> [delay]                     munmap(page 1)
                                             -> clears PTE[1]
                                             -> PTE/PMD pages freed
                                             -> PGD cleared

            -> pmd_offset(pud, addr)
              -> *pud=0 -> __va(0)
              -> dereference
              -> secondary data abort (kernel)

Fix by taking mmap_read_lock() around show_pte() in __do_user_fault().
__do_user_fault() is called from process context with interrupts
enabled, so the context can sleep and mmap_read_lock() is safe here.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Tested-by: Yuanbin Xie <xieyuanbin1@huawei.com>
Suggested-by: Yuanbin Xie <xieyuanbin1@huawei.com>
Signed-off-by: Qi Xi <xiqi2@huawei.com>
---
 arch/arm/mm/fault.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index e62cc4be5a..1f2a85e1fa 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -181,7 +181,9 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 		pr_err("8<--- cut here ---\n");
 		pr_err("%s: unhandled page fault (%d) at 0x%08lx, code 0x%03x\n",
 		       tsk->comm, sig, addr, fsr);
+		mmap_read_lock(tsk->mm);
 		show_pte(KERN_ERR, tsk->mm, addr);
+		mmap_read_unlock(tsk->mm);
 		show_regs(regs);
 	}
 #endif
-- 
2.33.0


