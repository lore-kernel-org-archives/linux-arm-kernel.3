Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E13D606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ECadAw9p;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mdiE9o68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q1wzICjfg9pLWF4uQ2Ye2aGYQ7sT5IneayGFNK4OhwI=; b=ECadAw9pag/+70
	XSl5SgH6y673Z2TSM+tpcDn+8oIYqSC+cdZhHukCZ7LB+NDoF09ya+tVWyEYmpDx5QB32SZcXTJ2f
	E80GrFuAZxlP983HE2ZIWpiCNSDwZcD6+0JzUe1xaxllpnsxUsr3iPW2hEHlGHXh32/yWhCgDpoEu
	PCTTM8xArAItSgYzDZl/rFDTk4sv+KLH9VPLOjrbKt95VZK6Y4oMFsolWTLyOHHIDXXkhcv5KKuoi
	gj0J20BC1IcAgmU1s+5KMwUYbr9K7zM0PPfkCA6SxrVCW7ZwdwZXgrQp7HloB1iwW75g6P843/kLu
	aH7tutzbCUei/J8jMH+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Av-00000009Ze6-3FBb;
	Thu, 05 Nov 2026 16:18:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Af-00000009ZQO-3yhv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 16:18:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 669BC60416;
	Thu,  5 Nov 2026 16:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605A81F00A02;
	Thu,  5 Nov 2026 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895517;
	bh=Q1wzICjfg9pLWF4uQ2Ye2aGYQ7sT5IneayGFNK4OhwI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mdiE9o68vZabStM/LcLocNZ6X+zmyequVFrq+B50cKOyxoh2VKSq665BIjcImPyUA
	 qi2YUqiZxCkW/MXas074+KkL1bPiM6UJfmQNKepMp1uMxBAJnBuQsLTvjXlw/mcJcW
	 JVpIzVWR+x4GkHZp37Vxxj5y/ipb1Q7TDVcOv7FOeUiMqBn1qEKdVlEBC6nkvfAwU3
	 cj9k05TxPIFk5WUiZVaGy2SYNAzgw7CYyHhRpyQdtyGUm1WerlrP8f73y1D0S/hBxW
	 bXJfDZlUJHZde7PMWlld1ViZIl9B71Qfh9yN03laSGXSULHu3nn9OXIVwZmIKWpaig
	 C+h/+LgOcFDUA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 16:05:05 +0000
Subject: [PATCH 2/2] arm64: suspend: Save GCS state over suspend
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fix-sysreg-suspend-v1-2-f4d9a99fec46@kernel.org>
References: <20261105-arm64-fix-sysreg-suspend-v1-0-f4d9a99fec46@kernel.org>
In-Reply-To: <20261105-arm64-fix-sysreg-suspend-v1-0-f4d9a99fec46@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2103; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Xja7UvEm5HI0itnYb/prznTdOhOEj4Bh5en96dVICsI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLerAmdLiQY/8zuIIu9yAQ3X825tmtypkxf+PjcL8MJS
 RF9rttEOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRz/KMDJ+X/X+8J2KOqvzS
 uhdizmt+NJ455Lf6ydkrz6ZePmbUtqCFkWGv/Ia/qYn73iQHh/55Ovt9WHXh7LpXIT/Z401/lW2
 9OIcHAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

GCSCRE0_EL1 and GCSPR_EL0 are live registers for EL0 on systems with GCS
but are not saved and restored by cpu_do_suspend()/cpu_do_resume(). This
means that the task that initiated suspend can return to userspace with
UNKNOWN or incorrect values for GCSPR_EL0 and GCSCRE0_EL1 (many fields
in GCSCRE0_EL1 reset to 0).  This will in turn lead to ongoing
corruption, including not restoring mode until a task with a different
GCS mode is run.  Fix this by saving and restoring the values over
suspend.

This increases the size of struct cpu_suspend_ctx by 16 bytes.

Fixes: 5d8b172e7005 ("arm64: Add Kconfig for Guarded Control Stack (GCS)")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/suspend.h |  2 +-
 arch/arm64/mm/proc.S             | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
index eb9ce315f146..8e9c97aab15a 100644
--- a/arch/arm64/include/asm/suspend.h
+++ b/arch/arm64/include/asm/suspend.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_SUSPEND_H
 #define __ASM_SUSPEND_H
 
-#define NR_CTX_REGS 16
+#define NR_CTX_REGS 18
 #define NR_CALLEE_SAVED_REGS 12
 
 /*
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 664ea9e3b9ad..99aacf03367d 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -121,6 +121,12 @@ alternative_else_nop_endif
 alternative_if ARM64_HAS_S1POE
 	mrs	x2, REG_POR_EL0
 	str	x2, [x0, #120]
+alternative_else_nop_endif
+alternative_if ARM64_HAS_GCS
+	mrs	x2, REG_GCSPR_EL0
+	str	x2, [x0, #128]
+	mrs	x2, REG_GCSCRE0_EL1
+	str	x2, [x0, #136]
 alternative_else_nop_endif
 	ret
 SYM_FUNC_END(cpu_do_suspend)
@@ -168,6 +174,12 @@ alternative_if ARM64_HAS_S1POE
 	ldr	x2, [x0, #120]
 	msr	REG_POR_EL0, x2
 alternative_else_nop_endif
+alternative_if ARM64_HAS_GCS
+	ldr	x2, [x0, #128]
+	msr	REG_GCSPR_EL0, x2
+	ldr	x2, [x0, #136]
+	msr	REG_GCSCRE0_EL1, x2
+alternative_else_nop_endif
 
 	msr	sctlr_el1, x12
 	set_this_cpu_offset x13

-- 
2.47.3


