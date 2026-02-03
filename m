Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D54E8782A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 13:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afh8FvCb9EHKgkE+4+/25vww4aVm2AkzGm6S3B5KCYc=; b=B6xtW2j3dripdISuf4OW+NNgyR
	z1M8E9tW7KKiHPgFcTsHkIJhrVU+dVirHF33R4c42Ay3TzKFdqhB9wr1Sn2RZCeUMMGKmLCLNID+Q
	p+JhfTXIvXooBcQNqHcATr7+EMxt9wRRqD59R3WqbKKXK8VPRce7w19FdlAAHCAvBhebEcR9kTf9d
	Di+AEf5L5zzk3/vikJ71EKdhWVc8cUGHP+X53wDXOH3m5xUPtvsYGwzH7k5K7B5dPJ0171JQCP7b2
	hAdxzG+/YuiE/Qwv7p5aLWyYAQ9kOUR5wkp2m2dUmncQVk7iX0g9AmsmC989cs5yW0DS2xS9zQxUA
	pVwS1EiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGar-00000006g3t-09fp;
	Tue, 03 Feb 2026 13:37:25 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGan-00000006fxg-00Q6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 13:37:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=afh8FvCb9EHKgkE+4+/25vww4aVm2AkzGm6S3B5KCYc=;
	b=1HsPy7IVGWvtySLu6kgJfWHKRZwiFzVZFbT10zodPsiC9sAPlouCKf2Cv82vRYDHpvzHGBOvI
	mF34Io2lM1QzY+QbJkoK8wftipvuBjkT7L3uZJwebReX/BVYcwTMPiHXelzDaFQtgRDREzJEg5J
	LKT9D4K/Hn6x9hfhM/T4nB0=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f54Jf3MDVz1BG4j
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 21:36:34 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=afh8FvCb9EHKgkE+4+/25vww4aVm2AkzGm6S3B5KCYc=;
	b=1HsPy7IVGWvtySLu6kgJfWHKRZwiFzVZFbT10zodPsiC9sAPlouCKf2Cv82vRYDHpvzHGBOvI
	mF34Io2lM1QzY+QbJkoK8wftipvuBjkT7L3uZJwebReX/BVYcwTMPiHXelzDaFQtgRDREzJEg5J
	LKT9D4K/Hn6x9hfhM/T4nB0=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f54DG4JKBz1T4Lx;
	Tue,  3 Feb 2026 21:32:46 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CCD2C4056A;
	Tue,  3 Feb 2026 21:37:07 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Feb
 2026 21:37:05 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<shuah@kernel.org>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <kevin.brodsky@arm.com>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <anshuman.khandual@arm.com>,
	<mark.rutland@arm.com>, <ryan.roberts@arm.com>, <thuth@redhat.com>,
	<song@kernel.org>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<tglx@kernel.org>, <dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 03/13] arm64/ptrace: Return early for ptrace_report_syscall_entry() error
Date: Tue, 3 Feb 2026 21:37:18 +0800
Message-ID: <20260203133728.848283-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203133728.848283-1-ruanjinjie@huawei.com>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_053721_594324_6425001F 
X-CRM114-Status: GOOD (  12.25  )
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

The generic entry abort the syscall_trace_enter() sequence if
ptrace_report_syscall_entry() errors out, but arm64 not.

When ptrace requests interception, it should prevent all subsequent
system-call processing, including audit and seccomp. In preparation for
moving arm64 over to the generic entry code, return early if
ptrace_report_syscall_entry() encounters an error.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 03fe2f8a4d54..f333791ffba6 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2372,15 +2372,18 @@ static __always_inline unsigned long ptrace_save_reg(struct pt_regs *regs,
 	return saved_reg;
 }
 
-static void report_syscall_entry(struct pt_regs *regs)
+static int report_syscall_entry(struct pt_regs *regs)
 {
 	unsigned long saved_reg;
-	int regno;
+	int regno, ret;
 
 	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_ENTER, &regno);
-	if (ptrace_report_syscall_entry(regs))
+	ret = ptrace_report_syscall_entry(regs);
+	if (ret)
 		forget_syscall(regs);
 	regs->regs[regno] = saved_reg;
+
+	return ret;
 }
 
 static void report_syscall_exit(struct pt_regs *regs)
@@ -2407,10 +2410,11 @@ static void report_syscall_exit(struct pt_regs *regs)
 int syscall_trace_enter(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
+	int ret;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
-		report_syscall_entry(regs);
-		if (flags & _TIF_SYSCALL_EMU)
+		ret = report_syscall_entry(regs);
+		if (ret || (flags & _TIF_SYSCALL_EMU))
 			return NO_SYSCALL;
 	}
 
-- 
2.34.1


