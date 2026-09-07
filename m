Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9400EC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4B7ig5JOoqM/sFSoDwiMA77B2+r7GUXRB2lSds3AJ1E=; b=iFe+uqYtkWsTU9
	0B/Z9FnTahytDmlP/Lu4QDbMHpMbRAzExAVj47R9x34ySlUTdBkeBuOaaXrGF5yxe236DvZt+0YKX
	9NjnrOvzFbeItuCq+8qq6VFAWlkQcfngEiZttlBJf5enyk8iXv9KTdAcKwUfc/f+ba2Qt0LbI44Wq
	EZwsWNT2YHGzmIyv0V32jgFhedvqRfupjuKghf/xrC3SpXsITrmwcl8oM8lmPjuS1vidP9UBqRABv
	wpa7d9zYDbsB3g6B9hhxYlf1GMtDEZXPDtlfyD7BQBUR98J27070b8uiPeOTMv5a2I6EYY1f09K3P
	o8XFI/fPdbJLnfJ/ou5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRq-00000007Nh0-3ewH;
	Mon, 07 Sep 2026 16:43:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRn-00000007Ncr-0ncl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E973A43940;
	Mon,  7 Sep 2026 16:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014211F00ACA;
	Mon,  7 Sep 2026 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799434;
	bh=4B7ig5JOoqM/sFSoDwiMA77B2+r7GUXRB2lSds3AJ1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZoqkleTPnHZFWHuFBC5xHFyP3BP9O1hjKw2d5rYkM2MLLe3ztBAyg38Gruwde31aS
	 jWJRkAiHsf7M7fxkT743JrzWBtbXc7avZ6a3lIOMUjP+4MUWi/DF+pYEn87+RJxXTR
	 CbmjaGIyGsemrCX2J59wRJx953ODDyyNCEvjMNyYdCBvbQztdnNuzYh1AEnN8cuzbI
	 XZluHaDSekTuobMXbIG7FeQkQUliobvqTwa8p49dDI2DkKbphNiqxzhHMudrp6w1Dd
	 lwTb+jrLO3mkW7qape3i59DZkmdj5UVmLv50Mp27xt6I8D9KttLFsOBPcEmpnD1dAZ
	 3+xisjdqBFSuA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 16/21] arm64: entry: Implement EL1t exception handlers for overflow stack
Date: Mon,  7 Sep 2026 17:42:41 +0100
Message-ID: <20260907164247.17223-17-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

In preparation for using EL1t to handle exceptions taken whilst running
on the overflow stack, implement some simple wrappers around the EL1h
handlers which perform a best-effort stack overflow check before
proceeding.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry-common.c | 43 +++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 72c03ccea59f..9738142780df 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -327,10 +327,45 @@ static void debug_exception_exit(struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(debug_exception_exit);
 
-UNHANDLED(el1t, 64, sync)
-UNHANDLED(el1t, 64, irq)
-UNHANDLED(el1t, 64, fiq)
-UNHANDLED(el1t, 64, error)
+static void noinstr el1t_64_check_overflow_stack(struct pt_regs *regs)
+{
+	unsigned long sp = kernel_stack_pointer(regs) - sizeof(*regs);
+	unsigned long ovf_stack = (unsigned long)this_cpu_ptr(overflow_stack);
+
+	/*
+	 * We're in big trouble if we've overflowed the overflow stack
+	 * so perform a best-effort check before we proceed. If our SP
+	 * is outside of the overflow stack for this CPU then presumably
+	 * we're already corrupting memory, so park ourselves here in an
+	 * attempt to contain the damage.
+	 */
+	if (sp < ovf_stack || sp > ovf_stack + OVERFLOW_STACK_SIZE)
+		cpu_park_loop();
+}
+
+asmlinkage void noinstr el1t_64_sync_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_sync_handler(regs);
+}
+
+asmlinkage void noinstr el1t_64_irq_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_irq_handler(regs);
+}
+
+asmlinkage void noinstr el1t_64_fiq_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_fiq_handler(regs);
+}
+
+asmlinkage void noinstr el1t_64_error_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_error_handler(regs);
+}
 
 static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
 {
-- 
2.55.0.979.g7e5102b832-goog


