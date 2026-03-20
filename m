Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B721B108B8EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOc2fmMnHOmJWsKHkLeBB6cXdDIbogbdN1bTr0iEfBQ=; b=Hj3gLy/pFHNHYViYC/wBh3PgJy
	aQRnPSmHPjzYDoXqbZO1CpVFltXdV8YNgFM1ZMkBF5klG5f2D9SiiiBhy5x92BVa1NJ2TI4A2VCa0
	3SrB4lYjSnbYD8sNzHTKE+yDpwcABZ2lN6hNjBz+17H0JoK4DrbFyXIyBQ7eLes05yOlRJZ6hX36w
	zLD3CH8Jl+kM4mhhkZf4867jJ9KenDU/a3lgjqRnSTOCu/MhOehfEjOf8+nW85ddaEbYDjsSFN4gD
	fekyFNvad3xOZe/Krfb2YZe/Wti9K40pOP+NeFSKhiGlw4jKcYSIQIxINAZDk5gBZf6OhahqsOUg0
	f/5AGx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2u-0000000CaGq-0PUa;
	Fri, 20 Mar 2026 10:25:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2s-0000000CaFC-27ls
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 10:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=AOc2fmMnHOmJWsKHkLeBB6cXdDIbogbdN1bTr0iEfBQ=; b=NbdHBpYTblA1PwY36SIClVg3QJ
	Rvrjtw4jPb/pBr3TnCHsgW+s9mejjQJ2UCpTzdHZmwku84AQxW3J2WnqvJs2CYVWmwl8buUjh/pPk
	GHt2u/sSNP/kuhZsT/bp1i3ppL0bpua+WEHxFM1WOASAeMh2ylHbVYzOYl35ji6Toeg0hF4bxUYkH
	Am5UwKPw/LBIucWwvm641xe5zPiqwuQbaXToXsUIjDMWTdeEXQcE6WhgnG5Xxh5zenUZSptPtSFnd
	Ta5EQBZyK+U/sDrGhsPSDi4iNdVuyadZcgCnZEEGtRrQEZQ8TAqgl8rR02WNSuvAwmL1E0pvtE7oN
	9eEvhN3g==;
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2n-0000000FJjQ-0Ntx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:25:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AOc2fmMnHOmJWsKHkLeBB6cXdDIbogbdN1bTr0iEfBQ=;
	b=BgOa3ZDSj01JjfAZnmMOvhcT5iXcMEcV/IWU1ib4Bi4sikg3LMvt2V5xLe0DjR8QPbXkassn1
	Ban90EYycnQFr1SI9X79kJy8+yf4EeGPUsyHmFkw336mPiSSm5d9IjdSp7p/1q7tPxnpseZdfzU
	e0142G+QwkoraPf9a3HDuzY=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fcdqT26rPzKm4D;
	Fri, 20 Mar 2026 18:20:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B953440565;
	Fri, 20 Mar 2026 18:25:22 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 20 Mar
 2026 18:25:21 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <ruanjinjie@huawei.com>,
	<linusw@kernel.org>, <kevin.brodsky@arm.com>, <yeoreum.yun@arm.com>,
	<ldv@strace.io>, <song@kernel.org>, <thuth@redhat.com>,
	<ryan.roberts@arm.com>, <mark.rutland@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <liqiang01@kylinos.cn>,
	<pengcan@kylinos.cn>, <mathieu.desnoyers@efficios.com>, <mingo@kernel.org>,
	<edumazet@google.com>, <arnd@arndb.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v14 02/10] arm64/ptrace: Use syscall_get_nr() helper for syscall_trace_enter()
Date: Fri, 20 Mar 2026 18:26:12 +0800
Message-ID: <20260320102620.1336796-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260320102620.1336796-1-ruanjinjie@huawei.com>
References: <20260320102620.1336796-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_102529_732789_E0D83A27 
X-CRM114-Status: GOOD (  10.75  )
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

Use syscall_get_nr() to get syscall number for syscall_trace_enter().
This aligns arm64's internal tracing logic with the generic
entry framework.

[Changes]
1. Use syscall_get_nr() helper:
   - Replace direct regs->syscallno access with
     syscall_get_nr(current, regs).
   - This helper is functionally equivalent to direct access on arm64.

2. Re-read syscall number after tracepoint:
  - Re-fetch the syscall number after trace_sys_enter() as it may have
    been modified by BPF or ftrace probes, matching generic entry behavior.

[Why this matters]
- Aligns arm64 with the generic entry interface.
- Makes future migration to generic entry framework.
- Properly handles syscall number modifications by tracers.
- Uses standard architecture-independent helpers.

No functional changes intended.

Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index e4d524ccbc7b..8d296a07fbf7 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2410,6 +2410,7 @@ static void report_syscall_exit(struct pt_regs *regs)
 
 int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
+	long syscall;
 	int ret;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
@@ -2422,13 +2423,23 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	if (secure_computing() == -1)
 		return NO_SYSCALL;
 
-	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
-		trace_sys_enter(regs, regs->syscallno);
+	/* Either of the above might have changed the syscall number */
+	syscall = syscall_get_nr(current, regs);
 
-	audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1],
+	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT)) {
+		trace_sys_enter(regs, syscall);
+
+		/*
+		 * Probes or BPF hooks in the tracepoint may have changed the
+		 * system call number as well.
+		 */
+		 syscall = syscall_get_nr(current, regs);
+	}
+
+	audit_syscall_entry(syscall, regs->orig_x0, regs->regs[1],
 			    regs->regs[2], regs->regs[3]);
 
-	return regs->syscallno;
+	return syscall;
 }
 
 void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
-- 
2.34.1


