Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917A8CCF2F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=67hnDNwvDX8B/2tXCUggwhT6OD9rv7+EguygGGZJ3LQ=; b=4nt0HfbJeb7dCDJGgdMeNibuiN
	6hufGJqe3fWRHu4kXvsGdj8qBYV/3og+tniq9RcpaXMPhkw3EfX0bKoyblbtKILToml11alkz+kfd
	g0K9vavL5z353J3usrnzbSTFBdeEHCHGKfq0Zp5tqZF8F8yfGyE9WWeQgne5vyxiIJZ3RdBxcbFif
	UC/HXR4cc9RssBe7vFOERJryLUFT1RUeHzGRAOWzdDQD8inRAO2rXtm4jsfXP15iWS+Hmr+sh/cRp
	TU2/NMpkx/yPyzLpsm6UlvPeINwDjDZb9gqV1C5J0MKTAh+vx9djy1e3eJb5oK8XMqbuFL3TRyxWJ
	pzeCa0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqrD-0000000C1r0-3PW6;
	Mon, 05 Jan 2026 20:07:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqrC-0000000C1qe-0jOL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:07:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AABA3339;
	Mon,  5 Jan 2026 12:07:04 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A54353F6A8;
	Mon,  5 Jan 2026 12:07:09 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rafael@kernel.org,
	pavel@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	yang@os.amperecomputing.com,
	joey.gouly@arm.com,
	kevin.brodsky@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH] arm64: fix cleared E0POE bit after cpu_suspend()/resume()
Date: Mon,  5 Jan 2026 20:07:07 +0000
Message-Id: <20260105200707.2071169-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_120714_260528_3340F846 
X-CRM114-Status: UNSURE (   9.39  )
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

TCR2_ELx.E0POE is set during smp_init().
However, this bit is not reprogrammed when the CPU enters suspension and
later resumes via cpu_resume(), as __cpu_setup() does not re-enable E0POE
and there is no save/restore logic for the TCR2_ELx system register.

As a result, the E0POE feature no longer works after cpu_resume().

To address this, save and restore TCR2_EL1 in the cpu_suspend()/cpu_resume()
path, rather than adding related logic to __cpu_setup(), taking into account
possible future extensions of the TCR2_ELx feature.

Fixes: bf83dae90fbc ("arm64: enable the Permission Overlay Extension for EL0")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
NOTE:
  This patch based on v6.19-rc4
---
 arch/arm64/include/asm/suspend.h |  2 +-
 arch/arm64/mm/proc.S             | 22 ++++++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
index e65f33edf9d6..e9ce68d50ba4 100644
--- a/arch/arm64/include/asm/suspend.h
+++ b/arch/arm64/include/asm/suspend.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_SUSPEND_H
 #define __ASM_SUSPEND_H

-#define NR_CTX_REGS 13
+#define NR_CTX_REGS 14
 #define NR_CALLEE_SAVED_REGS 12

 /*
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 01e868116448..3888f2ca43fb 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -97,8 +97,11 @@ SYM_FUNC_START(cpu_do_suspend)
 	mrs	x9, mdscr_el1
 	mrs	x10, oslsr_el1
 	mrs	x11, sctlr_el1
-	get_this_cpu_offset x12
-	mrs	x13, sp_el0
+alternative_if ARM64_HAS_TCR2
+	mrs	x12, REG_TCR2_EL1
+alternative_else_nop_endif
+	get_this_cpu_offset x13
+	mrs	x14, sp_el0
 	stp	x2, x3, [x0]
 	stp	x4, x5, [x0, #16]
 	stp	x6, x7, [x0, #32]
@@ -109,7 +112,7 @@ SYM_FUNC_START(cpu_do_suspend)
 	 * Save x18 as it may be used as a platform register, e.g. by shadow
 	 * call stack.
 	 */
-	str	x18, [x0, #96]
+	stp	x14, x18, [x0, #96]
 	ret
 SYM_FUNC_END(cpu_do_suspend)

@@ -130,8 +133,8 @@ SYM_FUNC_START(cpu_do_resume)
 	 * the buffer to minimize the risk of exposure when used for shadow
 	 * call stack.
 	 */
-	ldr	x18, [x0, #96]
-	str	xzr, [x0, #96]
+	ldp	x15, x18, [x0, #96]
+	str	xzr, [x0, #104]
 	msr	tpidr_el0, x2
 	msr	tpidrro_el0, x3
 	msr	contextidr_el1, x4
@@ -144,10 +147,13 @@ SYM_FUNC_START(cpu_do_resume)
 	msr	tcr_el1, x8
 	msr	vbar_el1, x9
 	msr	mdscr_el1, x10
+alternative_if ARM64_HAS_TCR2
+	msr	REG_TCR2_EL1, x13
+alternative_else_nop_endif

 	msr	sctlr_el1, x12
-	set_this_cpu_offset x13
-	msr	sp_el0, x14
+	set_this_cpu_offset x14
+	msr	sp_el0, x15
 	/*
 	 * Restore oslsr_el1 by writing oslar_el1
 	 */
@@ -161,7 +167,7 @@ alternative_if ARM64_HAS_RAS_EXTN
 	msr_s	SYS_DISR_EL1, xzr
 alternative_else_nop_endif

-	ptrauth_keys_install_kernel_nosync x14, x1, x2, x3
+	ptrauth_keys_install_kernel_nosync x15, x1, x2, x3
 	isb
 	ret
 SYM_FUNC_END(cpu_do_resume)
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


