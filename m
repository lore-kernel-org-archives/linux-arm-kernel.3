Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9CEC55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 09:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrBTI8ZRuoAjLI3BLgegoeeD6HnFBUj7pTaWyykTMM4=; b=E7fSD/4biyEEpAjV8e29c5gwuW
	m10aCvrH9bEIKcSE+bT47KMOdXk92wWUuSWxkzwYZgUjS4bQ/ASE5RXr5tAaWl63BPpSnStk6Ly04
	N98DLYqLN13urpTAXC3D2zOgpVQBLY33UkC8U46HVlMMOe23rwZsb5q0ssAjcy4fpXlecMQlBTrls
	7I3hlNpNSazVLEZ5JyjMs68x0+QSO+QS8ot5aQg2aopnDpSt/vDrgFrITeD1Kuf222FCyXzcTIXsC
	JLrUfZZiVpPb73B2PsDWDsIukMJwlivKk5kKdMY6hgqavT4OccRnkD4kJOtUuu6x3X91ZAZNXB4QK
	pYVSRbzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMnv-0000000DVWZ-27fP;
	Fri, 20 Feb 2026 09:28:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMnt-0000000DVUT-2XtN;
	Fri, 20 Feb 2026 09:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 351D1437BE;
	Fri, 20 Feb 2026 09:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62EEC2BC86;
	Fri, 20 Feb 2026 09:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579685;
	bh=htfspmM2c2lNeKPl/xvf7/POAscvMhM4d53l5UdNqHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uYglDSixsNUrAmuwCgveh4mBOgWjV3rCGsvEgcAo2JG6cWg5ST0cMdR+Y5OpzFpRr
	 Xzk4bBmQjUML2gaVx8vx8YaRUHecU26WL5il+lNeN2Hh6b2GYZ+nu6RX1qM691GZx5
	 8U9i9oRaZIhogxn0kbVZAVm3ds+Rpd0EAlL5RaaGjszPlKzu+CHMfrgyT2WrtawJp1
	 806WlvtV4K8r2u3cEReoDaJnSonYmwOB5grfTr8tq16mIhno4jKefmRAhaASEYp8eh
	 U0EuzBHBSFF//URpHX8b1V0N0wBs3FbN3Ie0kGXHF55yVCzS7TmgQtSADxYhpY/aPY
	 noCuvd/dn+UXA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org
Subject: [PATCH 3/3] arm64: use runtime constant to optimize handle_arch_irq access
Date: Fri, 20 Feb 2026 17:09:22 +0800
Message-ID: <20260220090922.1506-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220090922.1506-1-jszhang@kernel.org>
References: <20260220090922.1506-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_012805_693934_E12D83EE 
X-CRM114-Status: GOOD (  11.69  )
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

Currently, on arm64 platforms, the handle_arch_irq is a pointer which
is set during booting, and every irq processing needs to access it,
so it sits in hot code path. We can use the runtime constant mechanism
which was introduced by Linus to speed up its accessing.

Tested on Quad CA55 platform, the perf sched benchmark is improved
by ~6.5%

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/kernel/entry-common.c | 4 +++-
 arch/arm64/kernel/irq.c          | 9 ++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 3625797e9ee8..46a4c012e15f 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -25,6 +25,7 @@
 #include <asm/kprobes.h>
 #include <asm/mmu.h>
 #include <asm/processor.h>
+#include <asm/runtime-const.h>
 #include <asm/sdei.h>
 #include <asm/stacktrace.h>
 #include <asm/sysreg.h>
@@ -139,7 +140,8 @@ static void do_interrupt_handler(struct pt_regs *regs,
 	set_irq_regs(old_regs);
 }
 
-extern void (*handle_arch_irq)(struct pt_regs *);
+extern void (*_handle_arch_irq)(struct pt_regs *);
+#define handle_arch_irq runtime_const_ptr(_handle_arch_irq)
 extern void (*handle_arch_fiq)(struct pt_regs *);
 
 static void noinstr __panic_unhandled(struct pt_regs *regs, const char *vector,
diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index 15dedb385b9e..30629c183606 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -23,6 +23,7 @@
 #include <asm/daifflags.h>
 #include <asm/exception.h>
 #include <asm/numa.h>
+#include <asm/runtime-const.h>
 #include <asm/softirq_stack.h>
 #include <asm/stacktrace.h>
 #include <asm/vmap_stack.h>
@@ -84,15 +85,17 @@ static void default_handle_fiq(struct pt_regs *regs)
 	panic("FIQ taken without a root FIQ handler\n");
 }
 
-void (*handle_arch_irq)(struct pt_regs *) __ro_after_init = default_handle_irq;
+void (*_handle_arch_irq)(struct pt_regs *) __ro_after_init = default_handle_irq;
+#define handle_arch_irq runtime_const_ptr(_handle_arch_irq)
 void (*handle_arch_fiq)(struct pt_regs *) __ro_after_init = default_handle_fiq;
 
 int __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
 {
-	if (handle_arch_irq != default_handle_irq)
+	if (_handle_arch_irq != default_handle_irq)
 		return -EBUSY;
 
-	handle_arch_irq = handle_irq;
+	_handle_arch_irq = handle_irq;
+	runtime_const_init(ptr, _handle_arch_irq);
 	pr_info("Root IRQ handler: %ps\n", handle_irq);
 	return 0;
 }
-- 
2.51.0


