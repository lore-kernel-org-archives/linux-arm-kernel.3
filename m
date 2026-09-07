Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B22FC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NFOZ9UXWL03ntqDDevZKuvrtl/Qqe7ilVWxlEVBa2w=; b=AwFLZhmsvRwybD
	sMmWwH4l6oqu93zEcpagLZTxX5DGbqBNYWzvHZmK6+mpMH5ABv/SpHVjZ6jFUczu+B43rFZELv6el
	S08KgqmAmfzQ3xk4uJ7MlJOEJNYdoGiAT//cux8SxhRYESfUfmRtognNXFEEEijGUNsVIaWt9LqkO
	/G5LC+LxBV7dM07QqrZHg6zA0oABcMM5u3v9RhWOgNuJyGkQs6I/Z2vyEUcWSsqkP0eBNd5LfeWL+
	TjBPJ5R097nZoKZl6gmhYy82WTk5LdkFftu7oaiUKkrOxk9o1J26xfPb+pgXnUM9+bGq22CPQhqMS
	LlaZrjJwOK4G1zKEn9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cR0-00000007Msq-1Biv;
	Mon, 07 Sep 2026 16:43:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cQy-00000007Ms6-28pS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F03016025B;
	Mon,  7 Sep 2026 16:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99671F00A3D;
	Mon,  7 Sep 2026 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799383;
	bh=8NFOZ9UXWL03ntqDDevZKuvrtl/Qqe7ilVWxlEVBa2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lHO2uhEzqxy4qgVWSWiELGcjhlyFvnigsnAxNJdFGqeZNGSSnZVSKG29p3NzqlCgq
	 waLjheb0rScLKCAA/bCGNXIe6rDjZlcpun8YWywmQvqY/p1tHFliAVWK/RoNjkKyUO
	 o880ohsYd9e3xXMe/jwmu3x/jzOuSUUwwLVgRKrHBFTgljI313KIZ+tPDyL7dYIXTa
	 VYs6iknT9XWfIdNRgbgvs/xdpfLTTyChjkSag4LwlrJh389qgxy7pOvzAz/YarEkmJ
	 SaH4NzPkUdwH0eNn5JTOsBsxorXVNwwRatXHfF+DdYXg2H+/QYLmPr7gP/vE8l0dPd
	 ombtgEd85X3rg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/21] arm64: entry: Defer setting of TPIDRRO_EL0 until exit to userspace
Date: Mon,  7 Sep 2026 17:42:26 +0100
Message-ID: <20260907164247.17223-2-will@kernel.org>
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

In preparation for using TPIDRRO_EL0 to point at 'current' while running
inside the kernel, defer its userspace initialisation from the
context-switch patch to exception return. This has the added benefit of
not having to worry about keeping the in-memory value and the register
value in-sync during preemptible sections.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/asm-offsets.c |  1 +
 arch/arm64/kernel/entry.S       |  4 +++-
 arch/arm64/kernel/process.c     | 16 +---------------
 arch/arm64/kernel/sys_compat.c  |  7 -------
 4 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 9c853ed3ceab..6038ab3beb25 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -42,6 +42,7 @@ int main(void)
 #endif
   BLANK();
   DEFINE(THREAD_CPU_CONTEXT,	offsetof(struct task_struct, thread.cpu_context));
+  DEFINE(THREAD_TP_VALUE,	offsetof(struct task_struct, thread.uw.tp_value));
   DEFINE(THREAD_SCTLR_USER,	offsetof(struct task_struct, thread.sctlr_user));
 #ifdef CONFIG_ARM64_PTR_AUTH
   DEFINE(THREAD_KEYS_USER,	offsetof(struct task_struct, thread.keys_user));
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f63049ac32dc..59f045e496ec 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -47,7 +47,6 @@
 	b	.Lskip_tramp_vectors_cleanup\@
 	.if	\regsize == 64
 	mrs	x30, tpidrro_el0
-	msr	tpidrro_el0, xzr
 	.else
 	mov	x30, xzr
 	.endif
@@ -360,9 +359,12 @@ alternative_else_nop_endif
 	.if	\el == 0
 	ldr	x23, [sp, #S_SP]		// load return stack pointer
 	msr	sp_el0, x23
+	msr	tpidrro_el0, xzr
 	tst	x22, #PSR_MODE32_BIT		// native task?
 	b.eq	3f
 
+	ldr	x0, [tsk, #THREAD_TP_VALUE]
+	msr	tpidrro_el0, x0
 #ifdef CONFIG_ARM64_ERRATUM_845719
 alternative_if ARM64_WORKAROUND_845719
 #ifdef CONFIG_PID_IN_CONTEXTIDR
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..bfdc12166895 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -256,17 +256,8 @@ static void tls_thread_flush(void)
 	if (system_supports_tpidr2())
 		write_sysreg_s(0, SYS_TPIDR2_EL0);
 
-	if (is_compat_task()) {
+	if (is_compat_task())
 		current->thread.uw.tp_value = 0;
-
-		/*
-		 * We need to ensure ordering between the shadow state and the
-		 * hardware state, so that we don't corrupt the hardware state
-		 * with a stale shadow state during context switch.
-		 */
-		barrier();
-		write_sysreg(0, tpidrro_el0);
-	}
 }
 
 static void flush_tagged_addr_state(void)
@@ -531,11 +522,6 @@ static void tls_thread_switch(struct task_struct *next)
 {
 	tls_preserve_current_state();
 
-	if (is_compat_thread(task_thread_info(next)))
-		write_sysreg(next->thread.uw.tp_value, tpidrro_el0);
-	else
-		write_sysreg(0, tpidrro_el0);
-
 	write_sysreg(*task_user_tls(next), tpidr_el0);
 	if (system_supports_tpidr2())
 		write_sysreg_s(next->thread.tpidr2_el0, SYS_TPIDR2_EL0);
diff --git a/arch/arm64/kernel/sys_compat.c b/arch/arm64/kernel/sys_compat.c
index 0451f96c2c3f..59eee301c6f4 100644
--- a/arch/arm64/kernel/sys_compat.c
+++ b/arch/arm64/kernel/sys_compat.c
@@ -89,13 +89,6 @@ long compat_arm_syscall(struct pt_regs *regs, int scno)
 
 	case __ARM_NR_compat_set_tls:
 		current->thread.uw.tp_value = regs->regs[0];
-
-		/*
-		 * Protect against register corruption from context switch.
-		 * See comment in tls_thread_flush.
-		 */
-		barrier();
-		write_sysreg(regs->regs[0], tpidrro_el0);
 		return 0;
 
 	default:
-- 
2.55.0.979.g7e5102b832-goog


