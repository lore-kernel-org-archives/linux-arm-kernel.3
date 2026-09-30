Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3B0CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayTW7xrxEmoDaDHrDoW2f9Tni7T5XTnUSk+ItOt6MDY=; b=o/wTYkH+eORWuLzOQG0j8m/G72
	yONlV+7ubkZUX0TZRORsiLu3eOSC06A8rRS1PmqMJ4bnbXWKlrHtT0UhpA3TVCmjbMvfI0tJMbajV
	TBamgX/DsnCXj2P6xpLenHReIwr/DBnOeuZJF9OZUyE6YyWDXtwb/reqUzwCMyGwPi3Ig5AuAsd8x
	5KN0TFQqsPRqKelv9B925FzUFgzkj0aJ6DpD3mRD5EMknL9FRn4KPdsQJippC/ulmYZbFp3bWLqGj
	bMiVEUTdSZpLvUeeJJBinXPE9gweFetPsZBr0RTXsxV1CN0j2wAgZdDZwLboADV2XymkrPh+2pagL
	bDrvBvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrNN-00000005iSk-1vpI;
	Wed, 30 Sep 2026 10:17:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrNA-00000005iMW-0stV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 10:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ayTW7xrxEmoDaDHrDoW2f9Tni7T5XTnUSk+ItOt6MDY=; b=mnEEB2qOdV9HBdEtx4CZQ5Yn54
	IlhVuilqpfgGk7+1Vw8eszXApGZXFjPCIYy2jCbF0F+bISTyOFdD232J/mqAojSB+DBqsZlcmz3B0
	e756N7glaN1P0QemjjVBImn9cI+QmJJM21z+gOHYMkhQ+JgCR6RbFp3pZrfmZZcb38iWaU+mm86Em
	eatfZ6SX6rFH5E0xjQcsN7aQ9iFnWIDAZUdQdSW+IPJ6Mmn8q1G9JuFW5EZ/7I6v9kFE9lpj5A4p+
	3HzCqeFdgI796dRQL/ecPtgGJBcBo17Z4gU8n2E6OiL1kcminSI/TfAGD0xlaMHG5GYH7EVgLyd9+
	LIr2AxDQ==;
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrN3-00000003dSy-06da
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:17:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ayTW7xrxEmoDaDHrDoW2f9Tni7T5XTnUSk+ItOt6MDY=;
	b=umPEVjQOGISIXOF6JiELpMiVZBOAmqqRE1hjXx32ygUu+avj8qVS0gY8QzOoDKz6gm+OmskkJ
	ek+jG2ckuTwmbiMfDZQ4cvoPz8GwGdwvXlIMFtt2Ymvp22PNreJefhKSpNL82DRC9ChLIwGZeOW
	UXJuInj7rbLvk00bBTW2KU0=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hvrHy0lhzz1prN4;
	Wed, 30 Sep 2026 18:04:46 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 77C9240538;
	Wed, 30 Sep 2026 18:16:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:16:56 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<tglx@kernel.org>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v20 02/15] arm64: ptrace: Rework audit_syscall_entry()
Date: Wed, 30 Sep 2026 18:17:52 +0800
Message-ID: <20260930101805.1770358-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930101805.1770358-1-ruanjinjie@huawei.com>
References: <20260930101805.1770358-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_111706_356646_DBE059E1 
X-CRM114-Status: GOOD (  12.28  )
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


