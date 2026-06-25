Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FF2CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a7qUU0b9Vgs/bQRiRfTqXiRPAMtXXzREh+h5RRAzXI=; b=PAZH+BtlSmgEXDRAf22fQ3Ue26
	nzDNm/xqVBZdnKv/mnfeLdjJwQHPa0T1/ZR7rD/DHEpy0qS+EH+7d4hjg1Ynpb7o/qT65RW16YCbF
	qTH2Ex213yMmnJ83TjeVrQqZGMnqG+S26b1c49RRHiho4Yov5Pmm0KE9JJPxxYsm/dTFnhokDoyKF
	eRAGnj2PFpX1nTYNzOuVmMG9/9w9h3Wg6H0doCATEzL1l/Sa5fYxO7NApEUnUuSexM9DXdD0lP3RV
	4QfTyl9DlRn/j258aQO4etaYhl/2K0lp+KTOUNvK+jKApI9DcvMTU0kuIRhAC4oy0cAiPNUxm6uxE
	SgDrs1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchaA-000000090mX-0GQM;
	Thu, 25 Jun 2026 10:45:18 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcha7-000000090lz-43OT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:45:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-37dece114acso108022a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 03:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384315; x=1782989115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a7qUU0b9Vgs/bQRiRfTqXiRPAMtXXzREh+h5RRAzXI=;
        b=Q+i/WuXsyIAWph4hXMrsIN5IAxPzYVP72UhTmF1zDJzklMuCOatL/uMai2jN+S2CYF
         qyR9Lnx3POEEVAxqqgNAADJoyjr9tThA5SSX8w603QeThuCuYbbF9LBkEj1+PXTEScg5
         yIqMndkBQJj6ecwzgTjbHi5YaVK2sNsKfYpQBiZul8KEzKku+IswZBpKT1Q37YYFtw2E
         Yj2RiImKa3D+McsReP068Qm0t+1flnv1mIS64Z86z2cip/60/zClvJi70p7b+7nJtwyB
         PU92L+UutY212IdA0ruILc2Gzdn1dKd6vj8u0eLefqbn/mNQ8623ShFeBAkjIqYF5NeK
         Xq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384315; x=1782989115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0a7qUU0b9Vgs/bQRiRfTqXiRPAMtXXzREh+h5RRAzXI=;
        b=JmVngxVhA1cSbI5V3eAAGdUEaeYgy2g4gVXIfAd78BrXM6SxE5arFCbzuqGXUHUIGo
         169OK0C2ZnWw7XNL3b0ZPCZL/SjTq06BSoyAySSsUKlQ/mbb3QB9ozMBmGt9h2wbTAVj
         DykLvl/XYRdBa3yu+jQxeXdh3by3EZsyLIifN5FCt78FmfcQoarZvMzY+JYeC/VWdsk7
         DqxQLzh/aaDzRKxV+Xd9WxNe6yzYMv52aFgljT+tT4vsXa92N0nKXi9uqeX5P83YW+xI
         g5MP/vCoVXZcjYjzbc2fIW5+CUKzcEhq5UXoUxngRa4U16vamFprE3GR2xm1XjGq2LKm
         lAMw==
X-Forwarded-Encrypted: i=1; AFNElJ+IkiUi172syViYwa8+zpUAy9ukeaYpKg0s0Zv+UOOlQjGyYGIqnqUpXsQ/iyru4Ie3GzArK73RjYKqrtXIzIqP@lists.infradead.org
X-Gm-Message-State: AOJu0YzcTZs42Pw0BAXqvv4L8V836hzRSrLJgKtQrHFc7UoF+8P8QRwe
	KAt/DmaBn9GevcjdIv/HuYHt4EMqFfZo9agehjcmlZ9vPr3pj4Vp5SsZ
X-Gm-Gg: AfdE7cmipEZR3PH/JsN1UNWyAvdiS8LZSqrJ8rDk2rp/YQ1ZUfs1Hjt/dw/Ko7lTHXE
	ABGZ95Yk/cLWaKQrcWzhaAa76GMA6NCe8F7eORMYn+PmgYQft7CVvHp5eZutoHpypawiBvLZB+L
	cBphRYnNmwRZSrI43cwaly2Ga6GUOAtcKmxgzqkfK3ckmy3lrE/0d2Ycck4Rp0/kjc0uQVhrB6J
	PXYCuMTsVl3LraqHhhusC3eyUeksvGCEVIfwNgV1Pp3MP0M+kAkjN7Me4NGEn2r9asCBCk5dQAF
	A+x2dpBTaB3w9MoI+qJT+rMxdHK2mB1zk2uXI7IbPWDFf1QPAuK6aGddZY4I/Ori1MfIb4AaHx1
	HFQ2ZlJOx77ctiinAImqQkrhS39p/+E+mOs9Dk7kFwmasFg/Gc45O/lrjBnxNanPB1+32oiON0n
	c5ush9IDNG0EpwZQsz0U5JJQ==
X-Received: by 2002:a05:6a21:b98:b0:3b4:895f:6abf with SMTP id adf61e73a8af0-3bd4b39b200mr1148613637.3.1782384314585;
        Thu, 25 Jun 2026 03:45:14 -0700 (PDT)
Received: from localhost.localdomain ([189.1.242.96])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0d10sm1408853a12.21.2026.06.25.03.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:45:14 -0700 (PDT)
From: Yiqi Sun <sunyiqixm@gmail.com>
To: catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	rmk+kernel@armlinux.org.uk,
	ruanjinjie@huawei.com,
	will@kernel.org,
	Yiqi Sun <sunyiqixm@gmail.com>
Subject: [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit after ptrace
Date: Thu, 25 Jun 2026 18:45:02 +0800
Message-Id: <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529065444.1336608-1-sunyiqixm@gmail.com>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034516_012091_439D7EEF 
X-CRM114-Status: GOOD (  15.84  )
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

On arm64, seccomp obtains syscall arguments via
syscall_get_arguments(), where arg0 is currently read from
regs->orig_x0. audit_syscall_entry() in syscall_trace_enter() also
takes arg0 from regs->orig_x0. However, the syscall wrapper consumes
live arguments from regs->regs[0..5].

A ptracer can modify x0 on syscall-enter stop before seccomp and audit
run, but cannot update orig_x0 through the native syscall-stop
interface. This can leave seccomp and audit checking stale arg0 while
the syscall executes with updated live x0.

Make both paths read arg0 from regs->regs[0], matching the actual
dispatch arguments and keeping seccomp and audit aligned after ptrace
updates.

Fixes: f27bb139c387 ("arm64: Miscellaneous library functions")
Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
---
Changes in v2:
- Also switch the arm64 audit entry path to use live x0
- Clarify the orig_x0 synchronization comment in syscall_set_arguments()
---
 arch/arm64/include/asm/syscall.h | 7 +++----
 arch/arm64/kernel/ptrace.c       | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 5e4c7fc44f73..0a44db425522 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -81,7 +81,7 @@ static inline void syscall_get_arguments(struct task_struct *task,
 					 struct pt_regs *regs,
 					 unsigned long *args)
 {
-	args[0] = regs->orig_x0;
+	args[0] = regs->regs[0];
 	args[1] = regs->regs[1];
 	args[2] = regs->regs[2];
 	args[3] = regs->regs[3];
@@ -101,9 +101,8 @@ static inline void syscall_set_arguments(struct task_struct *task,
 	regs->regs[5] = args[5];
 
 	/*
-	 * Also copy the first argument into orig_x0
-	 * so that syscall_get_arguments() would return it
-	 * instead of the previous value.
+	 * Keep orig_x0 in sync so syscall_rollback() and compat
+	 * register views see the updated first argument.
 	 */
 	regs->orig_x0 = regs->regs[0];
 }
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4d08598e2891..35dd86f9e87a 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2426,7 +2426,7 @@ int syscall_trace_enter(struct pt_regs *regs)
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, regs->syscallno);
 
-	audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1],
+	audit_syscall_entry(regs->syscallno, regs->regs[0], regs->regs[1],
 			    regs->regs[2], regs->regs[3]);
 
 	return regs->syscallno;
-- 
2.34.1


