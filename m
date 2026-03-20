Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CA5108B8EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yh/BNv5Yu5PUWFFUGGunDyV3I608rF4MRf1e8x/oS40=; b=f+uzqsvCb/Pvn4kb2ks+WVaKWG
	Asq6QEAJmKYgBHYB1tt6L6WipnurX5HB3HpHJP8dJ9936UOMLGBl/OtAn9lcVcbn/cKHf9EyXEW8K
	I5rSqjVe+o3bzECFgYWJ0W7ZOqFTOJGEm5KuMFHr1um1b8BQThzSCwfjVqKdqnEXxzKb8HZbr3Fej
	biL2g6hpLwzDX1K9cGlqpW7iKEF4lPqQDWerLgbXi2v/eNtv7rM297nAyNflP+dfRB5NPcK47yx20
	q+kyPaMEFZ9EnSDeOVXJx2Zne8LxpgydbGMDix9MhfIBg/m9Hbhh7gj5kKTkV0N/rlpXiC/s964QL
	tnHUcvZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2t-0000000CaGC-26VG;
	Fri, 20 Mar 2026 10:25:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2r-0000000CaEo-3II6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 10:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=Yh/BNv5Yu5PUWFFUGGunDyV3I608rF4MRf1e8x/oS40=; b=WiAn7sPQRnyFxCAnCJ8UxSe77E
	0r0sujFLMYtBH3tclMpiN/84mvWQrUsGBGxY6F6pcLzCZLTeOEjL6GngNpqhmejDIPxJ9qes7U9JO
	x6MpG5vKyhqz8HLh5+cM2dSSxFbU63mmy6FuhFLg5RM/U1q/rZI8dsbddTCc2h1l2oFG60BwxCoZq
	MILNgOkuVoM4G9r75Gm7RDEb42lcuAhMk/SUtpiIotRFwPgEHUnjzr5C6VbTR5/JeAjDWw6QyO0fw
	om/+VTf5ubMgO9skp8uEPN/X/H9bwb9BrWcgW+XRFsi6U0wcsundqvJuvL7XWXWB8AeYNm9oCLVmL
	N7ZedrKQ==;
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2l-0000000FJjR-3UMF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:25:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Yh/BNv5Yu5PUWFFUGGunDyV3I608rF4MRf1e8x/oS40=;
	b=HIABsYNh37etraAaYITM7cqHS/c1y+HS9p/+c9DJNmK4VlGKPdhIGiofHTc6UrkOSCcooN6iP
	b1DEA423BA2RIaLlVYX40Y2JFMM8OsR7k8p9moBjBOTlyWPmQyz7GfnEb4nWkV8C3lW/CRvgpZd
	B/ZX4Mzp4wwz5byRdBn4BaQ=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fcdpv1bTdz12LDX;
	Fri, 20 Mar 2026 18:19:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 69F4E40567;
	Fri, 20 Mar 2026 18:25:21 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 20 Mar
 2026 18:25:20 +0800
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
Subject: [PATCH v14 01/10] arm64/ptrace: Refactor syscall_trace_enter/exit() to accept flags parameter
Date: Fri, 20 Mar 2026 18:26:11 +0800
Message-ID: <20260320102620.1336796-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260320102620.1336796-1-ruanjinjie@huawei.com>
References: <20260320102620.1336796-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_102528_421247_6C9F8191 
X-CRM114-Status: GOOD (  10.50  )
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

Refactor syscall_trace_enter() and syscall_trace_exit() to move thread
flag reading to the caller. This aligns arm64's syscall trace enter/exit
function signature with generic entry framework.

[Changes]
1. Function signature changes:
   - syscall_trace_enter(regs) → syscall_trace_enter(regs, flags)
   - syscall_trace_exit(regs) → syscall_trace_exit(regs, flags)

2. Move flags reading to caller:
   - Previously: read_thread_flags() called inside each function.
   - Now: caller (like el0_svc_common) passes flags as parameter.

3. Update syscall.c:
   - el0_svc_common() now passes flags to tracing functions and
     re-fetches flags before exit to handle potential TIF updates.

[Why this matters]
- Aligns arm64 with the generic entry interface.
- Makes future migration to generic entry framework.

No functional changes intended.

Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 4 ++--
 arch/arm64/kernel/ptrace.c       | 7 ++-----
 arch/arm64/kernel/syscall.c      | 5 +++--
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 5e4c7fc44f73..30b203ef156b 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -120,7 +120,7 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-int syscall_trace_enter(struct pt_regs *regs);
-void syscall_trace_exit(struct pt_regs *regs);
+int syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
+void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index ba5eab23fd90..e4d524ccbc7b 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2408,9 +2408,8 @@ static void report_syscall_exit(struct pt_regs *regs)
 	}
 }
 
-int syscall_trace_enter(struct pt_regs *regs)
+int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
-	unsigned long flags = read_thread_flags();
 	int ret;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
@@ -2432,10 +2431,8 @@ int syscall_trace_enter(struct pt_regs *regs)
 	return regs->syscallno;
 }
 
-void syscall_trace_exit(struct pt_regs *regs)
+void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
 {
-	unsigned long flags = read_thread_flags();
-
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index c062badd1a56..e8fd0d60ab09 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -124,7 +124,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 */
 		if (scno == NO_SYSCALL)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		scno = syscall_trace_enter(regs);
+		scno = syscall_trace_enter(regs, flags);
 		if (scno == NO_SYSCALL)
 			goto trace_exit;
 	}
@@ -143,7 +143,8 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	}
 
 trace_exit:
-	syscall_trace_exit(regs);
+	flags = read_thread_flags();
+	syscall_trace_exit(regs, flags);
 }
 
 void do_el0_svc(struct pt_regs *regs)
-- 
2.34.1


