Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39721CFD65A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RTuXQyvjtz5yaCHNTRb4qe/+c0eoBUR0RLyThfT0Ttc=; b=EAxBhnpNFeUY8OlP+71a3/ZCzY
	5O7Y+oJquVb4WVa/U5LZqE99m1xg5CXZgsUzdSBQ+xhVWAYLA+C2RbhBq4xsSz4R8q3NsufWsNJ6X
	mzsAMS6NNUKcsEBkqK941IYTzgu1sxj4rgU6/oWUQKol957KqsaxVxxrCEQijBS/gw8UmhyK1EU3i
	BiAaLhX1jI5bIuO4XTxC73HKPOMqIhXs5ty05rU0iYOElf6mWuyQxE2Gs0G8EibTtd36ty+HRM2hZ
	wPLdl9NL09XIfavTbXz2kNsJBVcpvXl12RGl+OYFZ/OfN17yqF0z2JzfzUY1YvA2kZaDwTcCbpdT0
	jwh8lbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWHq-0000000FFtU-2taU;
	Wed, 07 Jan 2026 16:21:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWHj-0000000FFsn-2ZR6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:21:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C007497;
	Wed,  7 Jan 2026 08:21:12 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4329D3F5A1;
	Wed,  7 Jan 2026 08:21:17 -0800 (PST)
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
	Yeoreum Yun <yeoreum.yun@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] arm64: fix cleared E0POE bit after cpu_suspend()/resume()
Date: Wed,  7 Jan 2026 16:21:15 +0000
Message-Id: <20260107162115.3292205-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082123_688111_8B287842 
X-CRM114-Status: UNSURE (   9.98  )
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

Cc: stable@vger.kernel.org
Fixes: bf83dae90fbc ("arm64: enable the Permission Overlay Extension for EL0")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---

Patch History
==============
from v1 to v2:
  - following @Kevin Brodsky suggestion.
  - https://lore.kernel.org/all/20260105200707.2071169-1-yeoreum.yun@arm.com/

NOTE:
  This patch based on v6.19-rc4
---
 arch/arm64/include/asm/suspend.h | 2 +-
 arch/arm64/mm/proc.S             | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

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
index 01e868116448..5d907ce3b6d3 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -110,6 +110,10 @@ SYM_FUNC_START(cpu_do_suspend)
 	 * call stack.
 	 */
 	str	x18, [x0, #96]
+alternative_if ARM64_HAS_TCR2
+	mrs	x2, REG_TCR2_EL1
+	str	x2, [x0, #104]
+alternative_else_nop_endif
 	ret
 SYM_FUNC_END(cpu_do_suspend)

@@ -144,6 +148,10 @@ SYM_FUNC_START(cpu_do_resume)
 	msr	tcr_el1, x8
 	msr	vbar_el1, x9
 	msr	mdscr_el1, x10
+alternative_if ARM64_HAS_TCR2
+	ldr	x2, [x0, #104]
+	msr	REG_TCR2_EL1, x2
+alternative_else_nop_endif

 	msr	sctlr_el1, x12
 	set_this_cpu_offset x13
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


