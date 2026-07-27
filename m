Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE9AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rGL8jKvOymSvf1g6/fiZ7BjgGQYUcrnNZdv+lRythc=; b=tsPEgR0UuVRrRrTt1m/YnQwPTs
	lkep/ciArc0dJIa0J2qMfgtu4WlsryjKfOtL6enuCZKpeNYAEwqY68q7Zib5fNlcph+e3dih9UOYQ
	2B0V2b9AFXSkVNVPETUzF7y+7Y6PHUbhR2dR9pmFaTq+RCQU1SQkur8PohYcA7R9qWZyTgcxqEswh
	3vaC0ze06lapHi+2eNp7w5iUJ6J6TnVN55gfKqNcq3JJadutg60fs6F5zODMpRMCoR22ufgMIofih
	dnyn6X4VfqXxoppimkX5Dlpori3TRsCqZ8Q8k9G4s53A8hyGbHiDa9sUFNVNqrOxhf2ZQH+FO2eO+
	v+B/EqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIw-00000003MlR-1Dkg;
	Mon, 27 Jul 2026 16:35:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIc-00000003MRO-1uTM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DC071713;
	Mon, 27 Jul 2026 09:35:25 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 794CD3F86F;
	Mon, 27 Jul 2026 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170129; bh=2Ei31GQ2tLMYjB/rlI3Hjvz+eNLKX3+ZlztRWAe7zUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MgZwA0GPjlx3Oh22KDzgTFfyXo4WiqaMnrLPCkbX4CZU7yDb7UEaKSkdrH83zmuci
	 PW6VZqh0qTATsJLbq9wa9/AegbJ+zZE1gtASzkmakOtIESSfu8WH0dm5wZh0S3GrjN
	 l3YQQoGy7w37N5igh7m1m9m2XLKwG2Lgv2TE9lbA=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 07/45] arm64: entry: mask DAIF before returning from C EL1 handlers
Date: Mon, 27 Jul 2026 17:34:15 +0100
Message-Id: <20260727163453.7969-8-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093530_536683_BEACA383 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Most EL1 exceptions already call local_daif_mask() before returning,
with the exception of debug exception handlers which do not change
DAIF, and the IRQ/FIQ/Error handlers.

However, DAIF get masked in kernel_exit() in all cases when returning
from EL1 C handlers anyway.

Move this masking from assembly to C by calling local_daif_mask()
before irqentry_nmi_exit(). Unlike the raw DAIF masking helper,
local_daif_mask() invokes trace_hardirqs_off(), so it must execute
while RCU is still watching.

Remove the disable_daif assembly macro, as this was its only use.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/assembler.h | 4 ----
 arch/arm64/kernel/entry-common.c   | 2 ++
 arch/arm64/kernel/entry.S          | 4 ----
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index effae53e9739..0b58b550e8dc 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -34,10 +34,6 @@
 	wx\n	.req	w\n
 	.endr
 
-	.macro disable_daif
-	msr	daifset, #0xf
-	.endm
-
 /*
  * Save/restore interrupts.
  */
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index ceb4eb11232a..2be42d7f4eaa 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -495,6 +495,7 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
 
 	state = irqentry_nmi_enter(regs);
 	do_interrupt_handler(regs, handler);
+	local_daif_mask();
 	irqentry_nmi_exit(regs, state);
 }
 
@@ -540,6 +541,7 @@ asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
 	local_daif_restore(DAIF_ERRCTX);
 	state = irqentry_nmi_enter(regs);
 	do_serror(regs, esr);
+	local_daif_mask();
 	irqentry_nmi_exit(regs, state);
 }
 
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index e0db14e9c843..f63049ac32dc 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -333,10 +333,6 @@ alternative_else_nop_endif
 	.endm
 
 	.macro	kernel_exit, el
-	.if	\el != 0
-	disable_daif
-	.endif
-
 #ifdef CONFIG_ARM64_PSEUDO_NMI
 alternative_if_not ARM64_HAS_GIC_PRIO_MASKING
 	b	.Lskip_pmr_restore\@
-- 
2.34.1


