Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46E4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 11:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pDJk+8i3;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=VAu0Tmc2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:To:From:Date:Content-Type:Mime-Version:Cc:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=i+/XEGN5akkFk1oc7cCo+cEyH5qYPWd1RI6IHrGAL3A=; b=pDJk+8i3VFMTh8EEcyjZ6kpVzT
	CN3icSrvruQQHXMmXXuCVvZReJbbrTFtTBo/C86Nd/NWOYJjeEtNinn8XFwM1hw4WA4+dhiDVDq1p
	mO7TtS02yYSk45d7fJur02EOTqwk1n1XhKn9SNuduGAtM3n51SsFzBcovIc8g1ro4KbWxvGR40kxm
	EwAF8BzaG0LHRY5yBGZckXRZINa5b1BB8XMcsWDY5qkxlc8SNqpFEK7nFoOstBN/VzqGxiQEUj9mz
	lsAk7Lw3NiHxIjyoBfLb/8lYLoNhzsRp0zaVF8B1UvPb2AGUdPqtNBSl7u8vMq9JmwHcM8a0AFGUG
	rGFpS8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKD7c-0000000GD0k-1vNF;
	Fri, 23 Oct 2026 11:07:40 +0000
Received: from va-1-115.ptr.blmpb.com ([209.127.230.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKD7Y-0000000GD06-29UO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 11:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792753648; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=i+/XEGN5akkFk1oc7cCo+cEyH5qYPWd1RI6IHrGAL3A=;
 b=VAu0Tmc2yfuEj3hdp1OL2vyB+b//1R/ZQYhfPI0bgP2JIvRWGlZdtzLlOtM6QICJQduqAi
 aUhzIW/HqOC3/fwCsHq1/JwkGE67xr6yj/5MASQOaKIpLs0ISZv9+CkCdCVJbybSfjP9Rc
 tP4/xyVMwU/OqrRhZtEj/a99iNXsW8fCBGhZ6AVabmPHPe0ss3jUd12F1YXAhgIeWZ/o8f
 z/G/I2Y+0FigMdBK25CQutlJcnQDXRgVvJKqiZkMvQqfSzLhlNFWCdnkH5Ii0kSZqf1YQA
 jI4LfZ1zzuUfRWC4ZWHmX7E0MysCRpSfE24Eq0IONOxCXs2cCR6aJPwvoP2eUA==
Message-Id: <20261023110710.10145-1-zhaogongyi@bytedance.com>
Cc: <mark.rutland@arm.com>, <oleg@redhat.com>, <ruanjinjie@huawei.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Lms-Return-Path: <lba+26adb3fee+113a93+lists.infradead.org+zhaogongyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 19:07:10 +0800
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>
Content-Transfer-Encoding: 7bit
Subject: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a group-stop
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_040736_643543_C2C34531 
X-CRM114-Status: GOOD (  11.79  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
which calls ptrace_stop() without siginfo. If the tracer writes
NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
NO_SYSCALL before calling update_syscall_orig_x0_after_ptrace(). The
WARN_ON_ONCE(!info) then fires, although this is a valid ptrace stop.

Remove the warning and guard the syscall-exit-stop check against a
missing siginfo. Keep recognizing both SIGTRAP and SIGTRAP | 0x80:
syscall-exit-stops use either value depending on whether the tracer
enabled PTRACE_O_TRACESYSGOOD. With no siginfo, allow the final
assignment to synchronize orig_x0 from x0.

Fixes: 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
Changes since v1:
- Remove the warning and early return, as suggested by Oleg.
- Keep recognizing syscall-exit-stops with or without PTRACE_O_TRACESYSGOOD.

v1: https://lore.kernel.org/r/20261016024536.18938-1-zhaogongyi@bytedance.com

Tested on arm64 KVM at af32da41b032 with this v2 applied.
At a group-stop, PTRACE_GETSIGINFO returned -EINVAL and an
NT_ARM_SYSTEM_CALL write succeeded. Syscall-entry and seccomp
x0 rewrites worked. At syscall-exit-stops, NT_PRSTATUS writes succeeded
with and without PTRACE_O_TRACESYSGOOD (si_code 133 and 5,
respectively). No kernel warnings occurred.

 arch/arm64/kernel/ptrace.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f743cbec1..22fb9eeed 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
 	if (regs->syscallno == NO_SYSCALL)
 		return;
 
-	/* We should only be called when target is in a ptrace stop */
-	if (WARN_ON_ONCE(!info))
-		return;
-
 	/*
 	 * For compat tasks, orig_r0 is provided directly through GPR index
 	 * 17.
@@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
 	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
 	 * return value of the system call.
 	 */
-	if ((info->si_code & ~0x80) == SIGTRAP &&
+	if (info && (info->si_code & ~0x80) == SIGTRAP &&
 	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
 		return;
 	}

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.39.5 (Apple Git-154)

