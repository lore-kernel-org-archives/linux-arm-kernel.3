Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F7DE6749D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 11:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eA9FmNXHGiOZZGgTL6Sla6Y2umwnwt6FXz/Hs6qRHm4=; b=GwMaDaog5g5dv/zaAIhYGXhbqB
	wWkZAwXrs6QfjtJYcJ/OrDBefkZxdVKuiGRRojlHd2xv8BFl0N7VGPiV7JGPyeInZSmFdJnc1Tzq0
	KF/mqjiQw3Tt9EhdLSGiMYOIyEXa5VJ4HNe8sRHicYz2Gul9AMBs+KO4ql5zEvyVHeP6Ujn5nJ2cN
	BnAyhT/5rHtTDp9mkAT2RlWVOU+MIhwtD9eDT3Hb9wsq4HWpAHNbqpo9GtekpGohCJ0aAI2y8uAi3
	iLth0d6U/HCYOOTPvflKcgHtpYgihbVwUPWyE2gYmQbrlDpox2zOgVGrh+H2wUGiKf1zLpVAdU/4J
	RaRKdMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXePB-0000000Dgi5-2WOp;
	Mon, 22 Dec 2025 11:48:49 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeOi-0000000DgT1-3ieK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 11:48:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eA9FmNXHGiOZZGgTL6Sla6Y2umwnwt6FXz/Hs6qRHm4=;
	b=H07+Cca2xuxeNQpzvbRVmh8CyvEBwrt6UIo902ma750PFu24SIMd5UR52h0063FIyECjxm0Qt
	6O0Y7f3whHfpdAAHfOC/G8ZJ9d2sd3Tnz199rOns6TCik7R/Ojo+FTGTmx8iDnF/17f8pkZgbRe
	mlSK4OHEbDVRcQm2aRzBTgw=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dZbtr6fL6z1T4GL;
	Mon, 22 Dec 2025 19:45:56 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E50240562;
	Mon, 22 Dec 2025 19:48:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 22 Dec
 2025 19:48:14 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<ruanjinjie@huawei.com>, <kevin.brodsky@arm.com>, <macro@orcam.me.uk>,
	<charlie@rivosinc.com>, <akpm@linux-foundation.org>, <ldv@strace.io>,
	<anshuman.khandual@arm.com>, <mark.rutland@arm.com>, <thuth@redhat.com>,
	<song@kernel.org>, <ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<broonie@kernel.org>, <liqiang01@kylinos.cn>, <pengcan@kylinos.cn>,
	<kmal@cock.li>, <dvyukov@google.com>, <richard.weiyang@gmail.com>,
	<reddybalavignesh9979@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [PATCH v10 03/16] arm64/ptrace: Return early for ptrace_report_syscall_entry() error
Date: Mon, 22 Dec 2025 19:47:24 +0800
Message-ID: <20251222114737.1334364-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222114737.1334364-1-ruanjinjie@huawei.com>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_034821_364830_ADB722BB 
X-CRM114-Status: GOOD (  10.91  )
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


