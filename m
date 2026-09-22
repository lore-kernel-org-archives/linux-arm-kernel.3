Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACB5C98304
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx0+6bmJUwYchjwyel5xwCampYzacYXb3fZxDXktPCY=; b=kB4WHNYm3vIC+QJd8dLgMGr0wQ
	M0G3mbZyEtJ2jzolvT+KmnFmC9e7LPGYQ5WZpnbid6pY7mq6keoOq0RnY0PavP6fxr1JKt/Y8q/G6
	io9Fh6ZuNyymWM5Y0/IXZd4wV99tpmk1sdTYxvxnkw9FdjUfwamTb5t1PabvW9yxQvCukPkey8Hmv
	N0NhOi/a523ToLflg6Zo3ReEvBaxX3mP3OJZMn8HHUXQ8+wuYWkTJyBII/8XbU5TvHivFMlZMdTes
	9rk7WCGCBZN/1ql6RJazJn4Sjvv9ELuxJP1vnKGrTlHm07omEXkrOIaI+nodBIpp86/8oK3wsGTsN
	sxjC5zNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rbj-000000047zY-3GAc;
	Tue, 22 Sep 2026 03:55:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rbT-000000047qq-3p0W
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 03:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=yx0+6bmJUwYchjwyel5xwCampYzacYXb3fZxDXktPCY=; b=DBc+FUjc1lOXQ+7j88a7EWAvyM
	os5/i6SzLwH0eGxkbwESEow8B3d6hGcMEbfO5zFvV2/84o5cJsMoQ74N6BbiPIhG5WPF2AIfmQfBl
	oUIdPh+NA+ob6wONFDPSBC5B9b+ZDxatv8uvcsUFkKeVBQ09BrPOhTbdl6wJ72Ma+WhMNUnVnbaEe
	fmIMC89qAPU7rHbwd38iNADhZe6jmsnHZXknOGWXJxk5rQ+jB1Bgbk2cckgMdNasgeHFL0BrRDqtd
	go6b9G9hetjPlc/Qf34oQZARXBtqlGcTizanP66oL/aLNeBnc/miBJv+lXMabGVUExXYWmhRprnwN
	wGEqi/CA==;
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rbQ-00000006oBU-0oUA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:55:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yx0+6bmJUwYchjwyel5xwCampYzacYXb3fZxDXktPCY=;
	b=V5fFGiQNvfoyA6jIihnj5whhfzFuCQHZEBGCfng0X8glq7yEdqkqsufRbgKu+mgxuWtjpAz0/
	YlBotJyGSz6WEqIG2nGsJkTbZ22/3T7cjzSN0BbgZWA6EU7J5KPGXvs7HnTxLUjf6rfSLuSnQkN
	EOdVmidjsMiU8J93Bub7TZ0=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hpmDQ2Mr2z1cyPY;
	Tue, 22 Sep 2026 11:44:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E448B40565;
	Tue, 22 Sep 2026 11:55:07 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:55:07 +0800
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
Subject: [PATCH v19 11/14] arm64: syscall: Simplify el0_svc_common() syscall exit path
Date: Tue, 22 Sep 2026 11:55:07 +0800
Message-ID: <20260922035510.1090299-12-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260922_045532_885302_5461970D 
X-CRM114-Status: GOOD (  14.53  )
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

Remove the redundant nested conditional check within the system call
exit path of el0_svc_common() to streamline the exit sequence.

The fast-path block is guarded by `!IS_ENABLED(CONFIG_DEBUG_RSEQ)`,
so CONFIG_DEBUG_RSEQ is guaranteed to be disabled and the call of
rseq_syscall() is a no-op. Under this constraint, the code logic
inside the block becomes completely identical to what
the arm64_syscall_exit_to_user_mode_work() helper already does.
Replace that nested logic with a direct invocation of the helper,
eliminating redundant code.

Before:

| if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
| 	flags = read_thread_flags();
| 	if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
| 		arm64_syscall_exit_to_user_mode_work(regs);
| 	return;
| }
| trace_exit:
|	arm64_syscall_exit_to_user_mode_work(regs);

After simplify:

| if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
|	arm64_syscall_exit_to_user_mode_work(regs);
|	return;
| }
| trace_exit:
|	arm64_syscall_exit_to_user_mode_work(regs);

Furthermore, Since both the conditional fast-path and the fallback
slow-path now uniformly invoke arm64_syscall_exit_to_user_mode_work(),
this explicit conditional branch is entirely redundant regardless of
whether the evaluation is true or false. Removing it collapses
the duplicated logic into a single, unconditional path.

Also remove has_syscall_work().

No functional changes.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Can Peng <pengcan@kylinos.cn>
Cc: Li Qiang <liqiang01@kylinos.cn>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index f1f0b6f3e32b..3488afd45d20 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -54,11 +54,6 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 	syscall_set_return_value(current, regs, 0, ret);
 }
 
-static inline bool has_syscall_work(unsigned long flags)
-{
-	return unlikely(flags & _TIF_SYSCALL_WORK);
-}
-
 static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 			   const syscall_fn_t syscall_table[])
 {
@@ -95,7 +90,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		return;
 	}
 
-	if (has_syscall_work(flags)) {
+	if (unlikely(flags & _TIF_SYSCALL_WORK)) {
 		/*
 		 * The de-facto standard way to skip a system call using ptrace
 		 * is to set the system call to -1 (NO_SYSCALL) and set x0 to a
@@ -119,19 +114,6 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	}
 
 	invoke_syscall(regs, scno, sc_nr, syscall_table);
-
-	/*
-	 * The tracing status may have changed under our feet, so we have to
-	 * check again. However, if we were tracing entry, then we always trace
-	 * exit regardless, as the old entry assembly did.
-	 */
-	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
-		flags = read_thread_flags();
-		if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
-			arm64_syscall_exit_to_user_mode_work(regs);
-		return;
-	}
-
 trace_exit:
 	arm64_syscall_exit_to_user_mode_work(regs);
 }
-- 
2.34.1


