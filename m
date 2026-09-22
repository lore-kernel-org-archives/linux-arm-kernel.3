Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26B4C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58GAlSXrZmsy8fdewmLz6iTUjyWgElBvKbAVwCbtG2Y=; b=Gj24qyR03wvZDmI2ub+VRXaS7L
	PIl/gfZu6TgJCHO5wAKUghn8geQt9GWT5MgTQF6LkT5yfYBUYVvC4zqKuywRPbBgTmALXBy+5+iA2
	htkXOD/mxkzmCiZ5iYV68Ded1oXZs6kW8f3L/lfpluHX3YbBB/5JBzvIogDeiILNnhL/+TYJTcWoT
	0nnb7OzQUHPG7p2wSNwBdCs9ah2JgljSwtFA2c1W9bUDso9XbqHHCgujv+666MboPBeemWwX2hJbE
	NOJkw8iO8OespkPNUsYC7Z1Xzx7sYmGcCm4Z50UQClFoTAf2avMRuNaIy6XrDb7j5LDjBk1pmx7Ja
	93GMB6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rb6-000000047i6-2azn;
	Tue, 22 Sep 2026 03:55:12 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rb2-000000047fr-249j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:55:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=58GAlSXrZmsy8fdewmLz6iTUjyWgElBvKbAVwCbtG2Y=;
	b=nKhTd97ccmDwKVhkOZQi9v1I0WWMy/RuRXcL3Ts99dDSqWxCrgdbmQuzTJv2VS1MHnu0REGiZ
	0mNwzEkreHblGi/4WFLVX4ZWQztiqsTKwewReB2O4n/MT4XsIcP83Q52ZAW7y1DA6FM76lZchTu
	ghd/qCnvyxroF8CPUXpad08=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hpmC60nwZzmV8g;
	Tue, 22 Sep 2026 11:42:58 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E330940563;
	Tue, 22 Sep 2026 11:55:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:55:01 +0800
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
Subject: [PATCH v19 02/14] arm64: ptrace: Rework audit_syscall_entry()
Date: Tue, 22 Sep 2026 11:54:58 +0800
Message-ID: <20260922035510.1090299-3-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260921_205509_162626_2959D182 
X-CRM114-Status: GOOD (  10.83  )
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

Extract syscall_enter_audit() helper and switch to generic helpers to
get syscall number and syscall arguments, matching the generic entry
implementation.

The new code:
- Checks audit_context() first to avoid unnecessary work when audit
  is not active.
- Use syscall_get_arguments() helper instead of directly accessing
  regs fields.
- Use syscall_get_nr() helper to get syscall number instead of directly
  accessing regs->syscallno.
- Now exactly equivalent to generic entry's syscall_enter_audit().

This is a preparation step for converting arm64 to the generic entry
infrastructure. No functional changes intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 96462de75d4b..573b5770698f 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2458,6 +2458,19 @@ static void report_syscall_exit(struct pt_regs *regs)
 	}
 }
 
+#ifdef CONFIG_AUDITSYSCALL
+static inline void syscall_enter_audit(struct pt_regs *regs)
+{
+	long syscall = syscall_get_nr(current, regs);
+	unsigned long args[6];
+
+	syscall_get_arguments(current, regs, args);
+	__audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
+}
+#else
+static inline void syscall_enter_audit(struct pt_regs *regs) { }
+#endif
+
 int syscall_trace_enter(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
@@ -2476,8 +2489,8 @@ int syscall_trace_enter(struct pt_regs *regs)
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, regs->syscallno);
 
-	audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1],
-			    regs->regs[2], regs->regs[3]);
+	if (unlikely(audit_context()))
+		syscall_enter_audit(regs);
 
 	return regs->syscallno;
 }
-- 
2.34.1


