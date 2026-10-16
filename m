Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A364CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 02:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:To:
	Content-Transfer-Encoding:Date:Content-Type:Subject:From:Cc:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EHWYhLDF9KZVqmcXGvPXYbi3zpzyWgW4t7XAlVQffwA=; b=fbOpbJAv4iSidfXKXMs97JkkVL
	gj1sLdOsYN2z/+GyrOFgNQXAQPLbJjY0sGFVovhMbkcMIMTGPfjuolPcOWyma7YgSxqgg595xyimU
	Wj1ZeuBZ4+cwHiw022LbTc3JGK6AoGyF9mB/hd8aBLdfpOUevYv267JKinW1XBv6bR+yblauFeBVm
	2NhFkneT2vnFdw6JAdlPzFC5sXHBd8FBftPovjh4AvnWaeIl4r3vRHRljd0/Dnqvi6EJru7MLfBwr
	0BH8lDVm35tUixcGzZ0+9ISSwYtaXEZ7JIdwSsaSVJvdLNS3HX5viNZhbcFwJfmuo7R//pYvzESRw
	Rxi0VUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHXxS-00000001la5-1XsS;
	Fri, 16 Oct 2026 02:46:10 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHXxO-00000001lZF-1qOZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 02:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792118757; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=EHWYhLDF9KZVqmcXGvPXYbi3zpzyWgW4t7XAlVQffwA=;
 b=LuJFmvRXI/5dxGOd6zoj6GWvpG6Ih8qTQ1170a/zLRP+9BodrI+6jcfc5+H4d/656l5xnN
 iFw8fRHcMzXMnoDiYOUmnqH+DFgkVgkMVCFtKntUTsB6Sq0Upx9a9EQpVEFDQyZ+i9fGM2
 uPPfKF11MthlSVbqc1cqn/7rxA/KbERp6HE9M00QN5BeUdS8B+n+QSaqKSqFBOSbuQj49r
 OCfOHwfnAF3faC1cNxWXOWRDq0TL/VkaEfUMrhEyroIoMkgIwmErT6KyTXk6hZaOMPS9kh
 YjWMzI0VJzJmq9SezCOv0SGNHm4xfk44k6evTP9aaUwCITMXQ1bgF05yBUlPVw==
Cc: <mark.rutland@arm.com>, <oleg@redhat.com>, <ruanjinjie@huawei.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Zhao Gongyi" <zhaogongyi@bytedance.com>, <stable@vger.kernel.org>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Subject: [PATCH] arm64: ptrace: don't warn on missing siginfo in a group-stop
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 10:45:36 +0800
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: 7bit
To: <catalin.marinas@arm.com>, <will@kernel.org>
Message-Id: <20261016024536.18938-1-zhaogongyi@bytedance.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ad18fe3+a3280b+lists.infradead.org+zhaogongyi@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_194606_750136_563D1FB2 
X-CRM114-Status: GOOD (  12.04  )
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

PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
which calls ptrace_stop() without siginfo. PTRACE_GETSIGINFO then
returns -EINVAL, as expected. If the tracer writes NT_ARM_SYSTEM_CALL,
system_call_set() stores the new syscallno before calling
update_syscall_orig_x0_after_ptrace(). Its NO_SYSCALL guard no longer
applies, so WARN_ON_ONCE(!info) fires. A tracer can trigger this on its
own child.

do_jobctl_trap() omits siginfo only for non-seized group-stops. Seized,
syscall-entry and seccomp stops supply it. Skip orig_x0 synchronization
for the non-seized group-stop: el0_svc_common() sets orig_x0 on the next
system call. Keep the warning if a seized stop unexpectedly lacks
siginfo.

Fixes: 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
Tested on arm64 KVM at af32da41b032. The unpatched kernel reproduced
the WARN. An initial fix that returned on every missing siginfo ran
without warnings.

The final fix was built on the same test baseline. At a group-stop,
PTRACE_GETSIGINFO returned -EINVAL and an NT_ARM_SYSTEM_CALL write
succeeded without a warning. An ordinary PTRACE_SYSCALL entry/exit
round trip completed normally. Changing x0 at syscall-entry and seccomp
stops produced the expected exit status. No kernel warnings occurred.

 arch/arm64/kernel/ptrace.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f743cbec1..e12b04b8f 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -573,9 +573,11 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
 	if (regs->syscallno == NO_SYSCALL)
 		return;
 
-	/* We should only be called when target is in a ptrace stop */
-	if (WARN_ON_ONCE(!info))
+	/* Only non-seized group-stops lack siginfo (see do_jobctl_trap()). */
+	if (!info) {
+		WARN_ON_ONCE(target->ptrace & PT_SEIZED);
 		return;
+	}
 
 	/*
 	 * For compat tasks, orig_r0 is provided directly through GPR index

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.39.5 (Apple Git-154)

