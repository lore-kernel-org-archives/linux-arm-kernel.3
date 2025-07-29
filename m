Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D959BC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 01:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBW6ILh0uidHbgVNDAQ6laHDvSMhNg5GFk+b3sEr1gU=; b=DWVrDUwcXT9Ss+42huvuotUuA7
	rVa7MBzZvqy8ZGglKJIi41G/53h44G+EtLBSrQOvGtO4MnOi4vsMxJTte6LGGfLxhRk60p+n/rKAp
	mL7wCKE6Bwn8h0HQ9BJpYn3XuwR8Tb2sjPhZBmZnlzga1e3aSFHcefxLUiA7AwNvVHYc/ScWF97bp
	AVeA7xx5ieaXVqrnMP0PajBYMO2myPLzgQUanVluUFtn5t9cNIRKU4MtHaV3ikzGpOcqSDhL1XgHu
	j31l9von1Ld+z1iR9L/gJyowXd2mz310HEkLPKA3Id+L6TD0vPl59cdOXTsWXl4/svsdQNzAQ7f/1
	CysFj4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZcu-0000000FjjH-03ZP;
	Tue, 29 Jul 2025 01:59:36 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZaO-0000000FjDd-0y1l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 01:57:02 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4brdlj4scVz27j59;
	Tue, 29 Jul 2025 09:57:53 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 644FE180044;
	Tue, 29 Jul 2025 09:56:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 29 Jul
 2025 09:56:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <puranjay@kernel.org>,
	<broonie@kernel.org>, <mbenes@suse.cz>, <ryan.roberts@arm.com>,
	<akpm@linux-foundation.org>, <chenl311@chinatelecom.cn>,
	<ada.coupriediaz@arm.com>, <anshuman.khandual@arm.com>,
	<kristina.martsenko@arm.com>, <liaochang1@huawei.com>, <ardb@kernel.org>,
	<leitao@debian.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v7 4/7] arm64: entry: Use preempt_count() and need_resched() helper
Date: Tue, 29 Jul 2025 09:54:53 +0800
Message-ID: <20250729015456.3411143-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250729015456.3411143-1-ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_185700_426910_5D8CC45E 
X-CRM114-Status: GOOD (  12.56  )
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

The generic entry code uses preempt_count() and need_resched() helpers to
check if it should do preempt_schedule_irq(). Currently, arm64 use its own
check logic, that is "READ_ONCE(current_thread_info()->preempt_count == 0",
which is equivalent to "preempt_count() == 0 && need_resched()".

In preparation for moving arm64 over to the generic entry code, use
these helpers to replace arm64's own code and move it ahead.

No functional changes.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/entry-common.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 21a7d8bea814..7c2299c1ba79 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -298,14 +298,6 @@ static inline bool arm64_preempt_schedule_irq(void)
 	if (!need_irq_preemption())
 		return false;
 
-	/*
-	 * Note: thread_info::preempt_count includes both thread_info::count
-	 * and thread_info::need_resched, and is not equivalent to
-	 * preempt_count().
-	 */
-	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
-		return false;
-
 	/*
 	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
 	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
@@ -689,8 +681,10 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	if (arm64_preempt_schedule_irq())
-		preempt_schedule_irq();
+	if (!preempt_count() && need_resched()) {
+		if (arm64_preempt_schedule_irq())
+			preempt_schedule_irq();
+	}
 
 	exit_to_kernel_mode(regs, state);
 }
-- 
2.34.1


