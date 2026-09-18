Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284D1C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eo1Mu3/UqB3iPcOR9znRzzkYsVC8kR8uT7JIdm2G87o=; b=fY3iv6uZOVR7O1
	LLPQtaA1O5CPuShHKnP8+KgCgOqqT74EOmsF77Pfut2BFFGGR21KexTJqXEftWYfcntkwNu1rKEFo
	AGLsk3ehGTCtyprF6gKaDj6zAr1ER1BgDn++5QQrhNyWb547lZ27aYXheF3xRXSjxGqyKMhhcuUBo
	NoFGJtYmbrNbJy1uOlAia4lGsxVfIudwP3DAM1YAUHZac6r/dNqJk00Xh46ZsEJOc/FaQ3ZyAFRbI
	UcKRMXJIs/WGwp219dNaZn7bcnGSZZzk6F8qpXlFjQf6hFrekkrJTL/FYCvDmsZkkT12QMDgt9Mk3
	SiEs0YIaOnYksebBGYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bF7-0000000EzPt-1MTT;
	Fri, 18 Sep 2026 16:15:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEz-0000000EzIY-1Ggq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:15:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC4666022B;
	Fri, 18 Sep 2026 16:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6C51F000FF;
	Fri, 18 Sep 2026 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748108;
	bh=Eo1Mu3/UqB3iPcOR9znRzzkYsVC8kR8uT7JIdm2G87o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i1bL8DTyxaWwPU8TmGAoCePCspJVY5PvZJnYDmNVOGLub5VO4F6tsWTvDd1WS/AkC
	 94V05/JqBZRNJDkHkd5DzYnOdbBcVuLaxspjaPJqk/97qxUHkYs17+qq14oapAeo8P
	 KIcaGIOomO9VflToJe9jdtuve71vCN8mpBlKkOfJemv1zI2uIBjlJUJaRTa5xMWtNo
	 85IMk1+2akR7OhmPUGmVYjj5NB5xVqrwDXqQYlzie/ycIcdcTwoVx+Au08Qj/2AFfw
	 k3bNy9qpww/NLJ+RWZ907wCvj/QquOD3pwDWmRg7M/caCZG2gXNLm0GBtXf4gkTFMb
	 aKX/Tb8Vw1slA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 15/21] arm64: entry: Point SP_EL0 at the overflow stack
Date: Fri, 18 Sep 2026 17:13:59 +0100
Message-ID: <20260918161407.2300-16-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog


