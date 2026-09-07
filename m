Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CC2C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=288+HAQJtG5VUtUXqsPB5v/Uwv9sAFZK9ElMT3/ktos=; b=tt/6qiLqIEEYm/
	mq+4wQLjJyZFJnBSMPz9xQrgcLtsbT2fKwWB5khkDzrTnobPI9HISAUG5IDtv6napwk+j3iR0+yWt
	Ndq3oB4gvuvRzw9LamK44k9421HhUUC0bUc92iO9H4KtahM+Lb7zz5X37zMOQFOPi5BLF+7ZTGN84
	/qGSeMp10OpjD2IpS7oylmkLHUyuFe63jocjBUpnTTfW5ZaioW32bhcq9i6k4IUTGnTMdxAkkh6MC
	G4dmBcHCz955nPMUDVfKeoKB/g2MyrRVaMOF9mFFhRo4GZ3g77Ei6OofNZMZUkvVo8YcPfSajml0b
	Ai7qd3Xkxf8n+sXOCKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRm-00000007NcI-32f2;
	Mon, 07 Sep 2026 16:43:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRk-00000007NYr-1Aj5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B43CD601DE;
	Mon,  7 Sep 2026 16:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9795D1F00A3E;
	Mon,  7 Sep 2026 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799431;
	bh=288+HAQJtG5VUtUXqsPB5v/Uwv9sAFZK9ElMT3/ktos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GrxXhU06Oa0TvnY8YBCKujRY7bHLUC/gxIrBnOT95k66+ccDei5lUu2g7a20DIZB8
	 qb0M86tduW0HvBxJkhxlBmb/byxZoaXasJOJ8mh6m0rfZItt35sMlwaOk9/DiJDHvi
	 rLlB5nNiFCBtVHuOWUmhCB92RHNuYFJDt+qFioS0arHQiELQeZ3yQbE3Ah6RX4WR93
	 RHNobZ8/EghVwtJPvnkgR0g3ei7GE1c5Lz01dwTEVUiE6aZtICBV57CZrqUVZjIArY
	 hHlXbPilHMWGK3g9WITSJgcbYWUFddyRQUDY/6d0r9vT8QamNJ/VF4jdVQgGCe4Upu
	 BKuQJ+sE6IzmQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 15/21] arm64: entry: Point SP_EL0 at the overflow stack
Date: Mon,  7 Sep 2026 17:42:40 +0100
Message-ID: <20260907164247.17223-16-will@kernel.org>
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

With SP_EL0 now available for use in the kernel, point it at the
overflow stack so that exception entry from EL1h will later be able to
switch to the overflow stack by writing to SPSel.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry.S |  2 ++
 arch/arm64/kernel/head.S  |  3 +++
 arch/arm64/kernel/smp.c   | 12 ++++++++++--
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index a45be0a837c8..6958ee238649 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -227,6 +227,8 @@ alternative_cb_end
 	mrs	x21, sp_el0
 	ldr_this_cpu	tsk, __entry_task, x20
 	msr	tpidrro_el0, tsk
+	adr_this_cpu	x19, overflow_stack + OVERFLOW_STACK_SIZE, x20
+	msr	sp_el0, x19
 
 	/*
 	 * Ensure MDSCR_EL1.SS is clear, since we can unmask debug exceptions
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index c33551ee6572..27a19e1a0ee6 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -210,6 +210,9 @@ SYM_CODE_END(preserve_boot_args)
 	ldr	w\tmp2, [\tsk, #TSK_TI_CPU]
 	ldr	\tmp1, [\tmp1, \tmp2, lsl #3]
 	set_this_cpu_offset \tmp1
+
+	adr_this_cpu	\tmp1, overflow_stack + OVERFLOW_STACK_SIZE, \tmp2
+	msr	sp_el0, \tmp1
 	.endm
 
 /*
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 702dee8d0db5..4c122d6598de 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -51,6 +51,7 @@
 #include <asm/processor.h>
 #include <asm/smp_plat.h>
 #include <asm/sections.h>
+#include <asm/stacktrace.h>
 #include <asm/tlbflush.h>
 #include <asm/ptrace.h>
 #include <asm/virt.h>
@@ -448,8 +449,15 @@ void __init smp_cpus_done(unsigned int max_cpus)
 
 static void __init set_boot_cpu_offset(void)
 {
-	asm volatile("msr tpidr_el1, %0"
-			:: "r" (per_cpu_offset(0)) : "memory");
+	u64 ovf_sp = (u64)raw_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE;
+
+	asm volatile(
+	"	msr	tpidr_el1, %1\n"
+	"	add	%0, %0, %1\n"
+	"	msr	sp_el0, %0" /* Update the overflow stack pointer */
+	: "+r" (ovf_sp)
+	: "r" (per_cpu_offset(0))
+	: "memory");
 }
 
 void __init smp_prepare_boot_cpu(void)
-- 
2.55.0.979.g7e5102b832-goog


