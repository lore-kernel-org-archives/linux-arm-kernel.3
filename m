Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB79C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 09:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wryyYAcpCkzLLWcXrlf2EzZ3f63nYwUbElfnMSxfW3I=; b=GxtI2T+QLBzX8BUhVkf+rdzFZo
	EBlpGDTOdVafma8OA3ztXFIw7FzeXajUMeEHalgokKw04SrfSW2VKqcaAinQMWtOQ9UUgHxV7zYrS
	tQEHLlNbrRF/JPP9fJYqFZRECnsIFvCXadjCcTVAijx1yRAQsmccZPOYO18Bp+R5B/H97LnMzI4GU
	XtoAdsR5/DHoTNgSWE4ozlrChE8mbppLjDx8Cfa6CFwthRbUBmBVnd4Ud6UIT55mazYmVgT2t/soU
	jY85TJ0mSTC+00oH8ZQAemS+qkWrg5nmb29+yluLKDJilvZwCWsFAv2FnQaTEpr8P8bwjcIbN245P
	6FjlA5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hge-0000000EHOP-28vG;
	Wed, 02 Sep 2026 09:55:20 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hgW-0000000EHAJ-0Ooc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 09:55:16 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wryyYAcpCkzLLWcXrlf2EzZ3f63nYwUbElfnMSxfW3I=;
	b=Kj/m/9z+0dvQhdyh67U/bsZDVVVhYipgR+iyjVKJhct6HEh9GyEEkRVCgA8xK8aHgZonBwTkC
	dfo3heE+I7pACRSN/eZL5+pU4sb6uIwvZDlmKQx5EDaEWkAl4Hk7lstjZWudPZB6OWGuBppI38S
	vXYs8s+/yHqcNE/TOnWgjoc=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hZd8g3Z3RznV04;
	Wed,  2 Sep 2026 17:43:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AB36740586;
	Wed,  2 Sep 2026 17:55:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 2 Sep
 2026 17:54:59 +0800
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
Subject: [PATCH v18 04/14] arm64: ptrace: Rename and clean up syscall_trace_enter()
Date: Wed, 2 Sep 2026 17:55:27 +0800
Message-ID: <20260902095537.602517-5-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260902_025512_470017_9F5FC3F6 
X-CRM114-Status: GOOD (  12.09  )
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

Rename syscall_trace_enter() to arm64_syscall_trace_enter() to avoid
name collisions and clarify the boundary when arm64 eventually switches
to the generic entry infrastructure.

In addition, replace direct accesses to regs->syscallno with the standard
syscall_get_nr() helper for both trace_sys_enter() and the return value.
This decouples the tracing logic from architecture-specific struct pt_regs
layouts, aligning the implementation with the generic entry pattern.

No functional changes intended; this is a preparation step for
converting arm64 to the generic entry infrastructure.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 2 +-
 arch/arm64/kernel/ptrace.c       | 6 +++---
 arch/arm64/kernel/syscall.c      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 5e4c7fc44f73..d1dabdcde41c 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -120,7 +120,7 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-int syscall_trace_enter(struct pt_regs *regs);
+int arm64_syscall_trace_enter(struct pt_regs *regs);
 void syscall_trace_exit(struct pt_regs *regs);
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index bb1b3261b767..e831b2520052 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2469,7 +2469,7 @@ static inline void syscall_enter_audit(struct pt_regs *regs)
 }
 #endif
 
-int syscall_trace_enter(struct pt_regs *regs)
+int arm64_syscall_trace_enter(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
 	int ret;
@@ -2490,12 +2490,12 @@ int syscall_trace_enter(struct pt_regs *regs)
 	}
 
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
-		trace_sys_enter(regs, regs->syscallno);
+		trace_sys_enter(regs, syscall_get_nr(current, regs));
 
 	if (unlikely(audit_context()))
 		syscall_enter_audit(regs);
 
-	return regs->syscallno;
+	return syscall_get_nr(current, regs);
 }
 
 static inline bool report_single_step(unsigned long flags)
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 358ddfbf1401..3e78e159b2a1 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -113,7 +113,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 */
 		if (scno == NO_SYSCALL)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		scno = syscall_trace_enter(regs);
+		scno = arm64_syscall_trace_enter(regs);
 		if (scno == NO_SYSCALL)
 			goto trace_exit;
 	}
-- 
2.34.1


