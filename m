Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9033606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XQrVJsho;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=OwLxvOop
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:Content-Type:Message-Id:Subject:From:To:Mime-Version:Cc:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zymeiVDTaUbGUlbbf+xNjeEXqeiZrg115S/5RHw+xnk=; b=XQrVJshouGbV5C49aulwKN/P1Q
	Jmuh6aDbEwqXz0lb1ySkS2z+sZuEg5ZAiCeGlVZlgmfsUmiJdh7R8D9lS+HMAK4VqMhWoPyZ2mWeI
	xhq0e76U01e+8TS3iiRhFAHIA+ww3k6RMvrthIo64S7wntPN01LiMJhfS38fUXbjI+Nm5epjtv+2Q
	rXpoEWuKkdYyJpdKZgzDEc9VxKFloeqe3+KfoylO/nv3LrO7yAS4oJE3Ph8x/8y9vY48cBM9vzOe6
	hsBboNgl+69+J/bsNyU5VAt+wtjVqmNJ9MInWVZOLQn4YbtiDuFJhQwV5SaIyeOLfnh8tbOogI6Ih
	GzDiXl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvgo-00000008ety-42zn;
	Thu, 05 Nov 2026 11:31:33 +0000
Received: from va-1-114.ptr.blmpb.com ([209.127.230.114])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvga-00000008epF-0qCj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793878270; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=zymeiVDTaUbGUlbbf+xNjeEXqeiZrg115S/5RHw+xnk=;
 b=OwLxvOopyZ2MHz1nN7fThc31W2ovFn5j2sFnYyK9VDUdLNca2M+l2kljmPrxgcrD6HpsbL
 aTXlLoo4cJMOyGr+7X+a0NISrwXeNDsKZD50MkJB5/XV70dj1aSObRKcrVP57OW0du21St
 +4tdlxRvUslJU7ePcAS7Uc7Xerq3r6m6c9sqHPi/l4TwkRZERSjb6Y2SCvTCsjk4b8EpBM
 DenqL0PDcfROblA96ZA4OHb1GjhWFaOWm2egCKk9p1aZ/6/v4T9nPrvyUKRQ0t3g1D+D2x
 DfJTbMt/mohr1W4mO+gnrlVi2TwA7ZM55KJoqHglyQsZb/3Z8x8STqUAfAWr8Q==
Cc: <mark.rutland@arm.com>, <oleg@redhat.com>, <ruanjinjie@huawei.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
To: <catalin.marinas@arm.com>, <will@kernel.org>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Subject: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a group-stop
Message-Id: <20261105113051.97810-1-zhaogongyi@bytedance.com>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Date: Thu,  5 Nov 2026 19:30:51 +0800
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26aec68fc+7fce50+lists.infradead.org+zhaogongyi@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_033121_341110_9CAC5FD3 
X-CRM114-Status: GOOD (  12.44  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
which calls ptrace_stop() without siginfo. If the tracer writes
NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
NO_SYSCALL before update_syscall_orig_x0_after_ptrace() checks
last_siginfo. WARN_ON_ONCE(!info) then fires for a valid ptrace stop.

Keep the early return when siginfo is absent, but remove the warning.
This leaves orig_x0 untouched at a non-seized group-stop and preserves
the existing syscall-exit-stop handling.

Fixes: 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
Changes since v2:
- Keep the early return on missing siginfo, as requested by Will.
- Remove v2's NULL guard on the syscall-exit-stop check, which is no
  longer needed after the early return.
- Update the comment to describe the non-seized group-stop case.

v2: https://lore.kernel.org/r/20261023110710.10145-1-zhaogongyi@bytedance.com

A local early-return variant was exercised on arm64 KVM with a non-seized
PTRACE_ATTACH group-stop and an NT_ARM_SYSTEM_CALL write. The write
succeeded without a kernel warning. Additional signal-handling probes
compared this behavior with v2; neither kernel reported a warning,
BUG, KASAN issue, or panic.
 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f743cbe..ecaa09b 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -573,8 +573,8 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
 	if (regs->syscallno == NO_SYSCALL)
 		return;
 
-	/* We should only be called when target is in a ptrace stop */
-	if (WARN_ON_ONCE(!info))
+	/* Non-seized group-stops do not provide siginfo (see do_jobctl_trap()). */
+	if (!info)
 		return;
 
 	/*

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.39.5 (Apple Git-154)

