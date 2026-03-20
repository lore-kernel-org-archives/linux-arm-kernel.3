Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274B7108B8ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsnJwxDH1OVmUAzK4nIGQC6PdlLqRJGthZs9h3TRf9s=; b=YmZMiPDURBKFsRUTb5JzHz7wIX
	jT4WmFUtNh1dQfeFF01DOHAk9pqaW49Nj0id+SfZingp9GimcWMWq83DliaOmC90eDI2W65zD3j5V
	2i5m9iGluxnEgTt1wyC/W02zfJffOrrFW6xm0M0A+3+31LFK1Zw4Y3xg8uEUTnCezu3QB3eUviIP0
	bFHJxXLcMJECZnhX2ZlS4O8ITVW7YCVioIOSPD/rovvYVXbqvRtk8z9uiEtgzjEgCDucIqCEVmWHL
	5PY4sX/qq31yULMlLRJQZe8D3C8F98oxJPudjcRFbRNcbMKgCFcLp2//4dXKAKZBKB5omGNlmngxp
	E1MXyqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2t-0000000CaFr-0tBL;
	Fri, 20 Mar 2026 10:25:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2r-0000000CaEi-1boZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 10:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=LsnJwxDH1OVmUAzK4nIGQC6PdlLqRJGthZs9h3TRf9s=; b=Xw/mSmhRVfL3OisNdjG3M7ql2q
	a84HQsUv0KmZC/RnVdCMjUvmRjv8z0eGeuqICt63lN3rWI26kdeUSmK89Yl1ST4Rq7fPF6e9aa188
	xaQMstI7yKD9bfRk+UMoz5GCZ/sh0gh0ur4IFz9zQh8oQLm3+XJhvr4id/8ZyB8kWchbk097bha4i
	4pGPAnKQlz+fjcByOiFMpz1iabhfdTFlELDm+RMbXBnCGYVaoM2lCspHGEY7N/pvcJvZckssPGfEM
	9l7og3X0vQkiFPzGR1oUA3Wdb20VS1dAIFza9683zaGEw/eZwdVGswL44Jeq1URKsNXuQk3JCsikn
	K/GHrDTw==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2l-0000000FJjO-3KHH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:25:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LsnJwxDH1OVmUAzK4nIGQC6PdlLqRJGthZs9h3TRf9s=;
	b=mNgfuROka33rBifvYBnIa4JBwtSJQmHbLhAEY/IAd+LsZEtJwaJumdehWi0vRCCRnYUZroRgB
	ilVmpZJChuVBkBy4smFySui2OfRsGpjyfdQdBK9/El6liNVBvsDXnBSkAWIMfTCjM0y2cFSSLSX
	8zd026TCk0gUbHxm5Dhr1FE=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fcdpj1scqzcZyn;
	Fri, 20 Mar 2026 18:19:41 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 13C994056B;
	Fri, 20 Mar 2026 18:25:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 20 Mar
 2026 18:25:22 +0800
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
Subject: [PATCH v14 03/10] arm64/ptrace: Expand secure_computing() in place
Date: Fri, 20 Mar 2026 18:26:13 +0800
Message-ID: <20260320102620.1336796-4-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260320_102528_458456_A7EF570C 
X-CRM114-Status: GOOD (  13.28  )
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

Refactor syscall_trace_enter() by open-coding the seccomp check
to align with the generic entry framework.

[Background]
The generic entry implementation expands the seccomp check in-place
instead of using the secure_computing() wrapper. It directly tests
SYSCALL_WORK_SECCOMP and calls the underlying __secure_computing()
function to handle syscall filtering.

[Changes]
1. Open-code seccomp check:
   - Instead of calling the secure_computing() wrapper, explicitly check
     the 'flags' parameter for _TIF_SECCOMP.
   - Call __secure_computing() directly if the flag is set.

2. Refine return value handling:
   - Use 'return ret ? : syscall' to propagate the return value.
   - Ensures any unexpected non-zero return from __secure_computing()
     is properly propagated is properly propagated.
   - This matches the logic in the generic entry code.

[Why this matters]
- Aligns the arm64 syscall path with the generic entry implementation,
  simplifying future migration to the generic entry framework.
- No functional changes are intended; seccomp behavior remains identical.

Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 8d296a07fbf7..85b597cac14b 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2411,7 +2411,7 @@ static void report_syscall_exit(struct pt_regs *regs)
 int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
 	long syscall;
-	int ret;
+	int ret = 0;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
 		ret = report_syscall_entry(regs);
@@ -2420,8 +2420,11 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	}
 
 	/* Do the secure computing after ptrace; failures should be fast. */
-	if (secure_computing() == -1)
-		return NO_SYSCALL;
+	if (flags & _TIF_SECCOMP) {
+		ret = __secure_computing();
+		if (ret == -1)
+			return NO_SYSCALL;
+	}
 
 	/* Either of the above might have changed the syscall number */
 	syscall = syscall_get_nr(current, regs);
@@ -2439,7 +2442,7 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	audit_syscall_entry(syscall, regs->orig_x0, regs->regs[1],
 			    regs->regs[2], regs->regs[3]);
 
-	return syscall;
+	return ret ? : syscall;
 }
 
 void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
-- 
2.34.1


