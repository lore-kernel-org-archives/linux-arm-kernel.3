Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3C0C98306
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpZL2Yu7GriEl1/fc68kkVg/n8TJBHRv1iFl32R39RA=; b=bTxd5V14eR2SDks3DKgNCuZ5tx
	ND5KC+2c5uHuHXE+EVIRnyiKSj9NiGSpy8+kFodyhgW8ONk/zd+shaeVtKa3SeFXalaZgCPiaokEh
	gt63ssvXO2ANq/AZwwere1uOup8v0dSH0ati8j7EOkVvXM23AkYqFm4HOo/4YRu5z4orCCTpQdoX+
	YW5rm5976iEQgdQM+YPRRnTqE7n/Hzs7hA1YCfdKt2zMK4Y2bW3wdlnwscwuK1FTWY81GUqz6ZGqx
	ejf+tMfdOdjlgZ0r2IwzBO1Dk8MViJvuK5AQ/mfQnsqCTCoAE/RXvraS+jcnnaNvJQCrq6CQSqHRL
	xTJyB17g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rcI-000000048Pw-3jfp;
	Tue, 22 Sep 2026 03:56:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rc3-000000048GU-498Y
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 03:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jpZL2Yu7GriEl1/fc68kkVg/n8TJBHRv1iFl32R39RA=; b=O5T+iQCGi00nfdljTS+JDS6xUp
	9hqQvWFcqfUyB0vSVHeUaXW4HHPkam+iEuJrp8mKhaq6AN5aDu+7O54VeNoQDzdsZdmtOEuSvgh2r
	zSFKXrE7zJJYgdfHqf2cudhQEBFW4VDBA/scF12Vw2WemrAYV88Myio6UwrCt0DRPhaw4oNyb4FPu
	Z+wlmkbKb/QPbZXbmdEUjE6AjZnb49PrPtpOvQZxHsCJQVQauwXcn8B16+kI04NiX89uzskthmu4M
	HoF+Y4fSMAqhRNWALHAGbPszOHkozmhTj1oF0x0Zqefhr46PxvlQLenqBhiLWOxq/1UkHbvhB5Pnk
	1o94n1lw==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8rbJ-0000000D4bw-3tdC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:56:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jpZL2Yu7GriEl1/fc68kkVg/n8TJBHRv1iFl32R39RA=;
	b=rlJXIxHNybXKI1ei7SfdSLU7VPGYrwiorsYuQ/sXnhYN2KioTodHT7x6+y62UDoXbU3HaOCYN
	GtM8zPFfHxrGeEx6z0BBKmBFI7CNqE17Taa6APtxRbBZhLlsRMxEyERBmEy/9mTN1e5kVICbJv6
	HLf/ZtGNxyTiZYQrgXmRm2E=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hpmCz1KW6zcb3P;
	Tue, 22 Sep 2026 11:43:43 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 36D274057F;
	Tue, 22 Sep 2026 11:55:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:55:04 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <peterz@infradead.org>, <ada.coupriediaz@arm.com>,
	<linusw@kernel.org>, <yeoreum.yun@arm.com>, <kevin.brodsky@arm.com>,
	<anshuman.khandual@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<vladimir.murzin@arm.com>, <tglx@kernel.org>, <broonie@kernel.org>,
	<liqiang01@kylinos.cn>, <ryan.roberts@arm.com>, <pengcan@kylinos.cn>,
	<kmehltretter@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v19 07/14] arm64: ptrace: Pass thread flags to trace enter/exit
Date: Tue, 22 Sep 2026 11:55:03 +0800
Message-ID: <20260922035510.1090299-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922035510.1090299-1-ruanjinjie@huawei.com>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_045547_653496_7F8C0234 
X-CRM114-Status: GOOD (  11.68  )
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

Move the reading of thread flags from inside arm64_syscall_trace_enter()
and syscall_trace_exit() to their callers.  This aligns the function
signatures with the generic entry framework, where the caller
is responsible for supplying the flags.

In el0_svc_common(), the flags are now passed directly to the tracing
functions, and re-read before the enter/exit path to reflect any updates.

No functional change intended; this is a preparatory step for
converting arm64 to the generic entry infrastructure.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Can Peng <pengcan@kylinos.cn>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Li Qiang <liqiang01@kylinos.cn>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h |  4 ++--
 arch/arm64/kernel/ptrace.c       |  6 ++----
 arch/arm64/kernel/syscall.c      | 11 +++++++----
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index d1dabdcde41c..696739f5a250 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -120,7 +120,7 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-int arm64_syscall_trace_enter(struct pt_regs *regs);
-void syscall_trace_exit(struct pt_regs *regs);
+int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
+void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 72df4b84ec9a..ac90b05dbd11 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2471,9 +2471,8 @@ static inline void syscall_enter_audit(struct pt_regs *regs)
 static inline void syscall_enter_audit(struct pt_regs *regs) { }
 #endif
 
-int arm64_syscall_trace_enter(struct pt_regs *regs)
+int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
-	unsigned long flags = read_thread_flags();
 	int ret;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
@@ -2508,9 +2507,8 @@ static inline bool report_single_step(unsigned long flags)
 	return flags & _TIF_SINGLESTEP;
 }
 
-void syscall_trace_exit(struct pt_regs *regs)
+void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
 {
-	unsigned long flags = read_thread_flags();
 	bool step;
 
 	rseq_syscall(regs);
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index b8d7d29a431b..e778aac6fab9 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -113,7 +113,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 */
 		if (scno == NO_SYSCALL)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		scno = arm64_syscall_trace_enter(regs);
+		scno = arm64_syscall_trace_enter(regs, read_thread_flags());
 		if (scno == NO_SYSCALL)
 			goto trace_exit;
 	}
@@ -127,13 +127,16 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
-			syscall_trace_exit(regs);
+		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP) {
+			flags = read_thread_flags();
+			syscall_trace_exit(regs, flags);
+		}
 		return;
 	}
 
 trace_exit:
-	syscall_trace_exit(regs);
+	flags = read_thread_flags();
+	syscall_trace_exit(regs, flags);
 }
 
 void do_el0_svc(struct pt_regs *regs)
-- 
2.34.1


