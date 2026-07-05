Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A59C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 10:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pDEKBMzxtfd1t81QTTS0mKCc2r/kk0TOgUYvyF3Wozc=; b=RWmsjcvTmDlySedkzMYl1YDejf
	c8hqeG7Updiufq4OoMLCbSmO/HvkGDFwaMNaxEdAqTuHXUnLzW8Uw7nhDNbY28Z+A/KgTRb9Pyo8G
	TsVyqzMdrELxoyD86P+JxpBnOEXn20D2OAPcQXQ+T5C+Hgx21ZKjH6qiN4tXxqsbFZ5DEo0PBVPOo
	1sb45hGA033h1MY4EgED58yT/EwBkOZFD7ODnM/iIK5lV8CdJRkUa0tfVS8vdEvrW9ye18KAibE0s
	C1MnIsTqISROwZswIiPsZK96XCv4/8mHarxISgThKizcuosNWEwVQInmyZ1Kitb9LCQBGafeZ4nU4
	SP6ax7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJgl-00000009DcD-3Diy;
	Sun, 05 Jul 2026 10:03:03 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJgj-00000009Dbj-0nn1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 10:03:02 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783245778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pDEKBMzxtfd1t81QTTS0mKCc2r/kk0TOgUYvyF3Wozc=;
	b=LousD6wRMzVFqXUzpSNpjGwmxGow/0r4SwEOGd89WzTH7MEVTiqY6CctryUwoTb1n10xdB
	PcZC4s9mXiw0eLEAZ/JTzl6u34OWqrqgF542TaB8yx3M0kfCJTtdTdD/eTfllx4kq4HkvS
	z0UzMgrnqkRbIcshgWq6rmrzpWzCkd0=
Date: Sun, 05 Jul 2026 12:02:36 +0200
Subject: [PATCH] arch: arm64: add early_param idle=<wfi|yield|nop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIALsrSmoC/yXMUQqDMBCE4avIPjewDdVAr1L6sE1HXalWNlYE8
 e6m+vgNzL9SgikS3YuVDLMm/Q4Z10tBsZWhgdN3Nnn2FQcunVhf3fL4gRvFpHfRhzoyAoRLyrf
 RUOtyJB/P0+n36hCnf4e2bQe9JnZCdAAAAA==
X-Change-ID: 20260705-arm64-idle-param-c27fc0e7ea05
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_030301_502111_0B4FDBD5 
X-CRM114-Status: GOOD (  20.47  )
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

Overriding the idle mechanism might be useful for debugging, performance
testing and on platforms where the WFI instruction misbehaves, such as
Apple Silicon SoCs.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Thanks to Will Daecon for suggesting this path, since, when treating the WFI
misbehavior as an erratum, we had difficulties telling when the alternatives
should be applied. This solution is more flexible and leaves it up to
bootloader to add the appropriate idle= parameter as a workaround.
---
 Documentation/admin-guide/kernel-parameters.txt | 23 ++++++++++++++++++
 arch/arm64/kernel/idle.c                        | 31 +++++++++++++++++++++++--
 arch/arm64/kernel/idle.h                        | 11 +++++++++
 arch/arm64/lib/delay.c                          |  7 +++++-
 4 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b2d7d3540ded..d7f5471edf8f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2239,6 +2239,29 @@ Kernel parameters
 
 			idle=nomwait: Disable mwait for CPU C-states
 
+			[ARM64,EARLY]
+			Format: idle=wfi, idle=yield, idle=nop
+
+			idle=wfi: Use the WFI (Wait For Interrupt) hint
+			instruction in the idle loop. This is the default and
+			allows the CPU to enter a low-power state until an
+			interrupt arrives.
+
+			idle=yield: Use the YIELD hint instruction instead of
+			WFI. CPUs supporting simultaneous multi-threading (SMT),
+			can continue executing another thread when the current
+			thread reaches the idle loop. This will make the CPUs
+			eat more power, but may be useful to get slightly better
+			performance in some applications, since the CPUs will
+			not enter a low-power state.
+
+			idle=nop: Do not execute any idle instruction in the
+			idle loop. This is useful on platforms where WFI
+			misbehaves, leading to system instability or loss of CPU
+			state. This will make the CPUs eat more power, but may
+			give slightly better performance in some applications,
+			since the CPUs will not enter a low-power state.
+
 	idxd.sva=	[HW]
 			Format: <bool>
 			Allow force disabling of Shared Virtual Memory (SVA)
diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
index 05cfb347ec26..018bcc812d45 100644
--- a/arch/arm64/kernel/idle.c
+++ b/arch/arm64/kernel/idle.c
@@ -11,6 +11,28 @@
 #include <asm/cpufeature.h>
 #include <asm/sysreg.h>
 
+#include "idle.h"
+
+enum idle_mode idle = WFI;
+
+/* User can over-ride above with "idle=<wfi|yield|nop>" in cmdline */
+static int __init setup_idle(char *s)
+{
+	if (!s)
+		return -1;
+	else if (!strcmp(s, "wfi"))
+		idle = WFI;
+	else if (!strcmp(s, "yield"))
+		idle = YIELD;
+	else if (!strcmp(s, "nop"))
+		idle = NOP;
+	else
+		return -1;
+
+	return 0;
+}
+early_param("idle", setup_idle);
+
 /*
  *	cpu_do_idle()
  *
@@ -26,8 +48,13 @@ void __cpuidle cpu_do_idle(void)
 
 	arm_cpuidle_save_irq_context(&context);
 
-	dsb(sy);
-	wfi();
+	if (likely(idle == WFI)) {
+		dsb(sy);
+		wfi();
+	} else if (idle == YIELD) {
+		dsb(sy);
+		asm volatile("yield" ::: "memory");
+	}
 
 	arm_cpuidle_restore_irq_context(&context);
 }
diff --git a/arch/arm64/kernel/idle.h b/arch/arm64/kernel/idle.h
new file mode 100644
index 000000000000..350b758ea215
--- /dev/null
+++ b/arch/arm64/kernel/idle.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARM64_KERNEL_IDLE_H
+#define __ARM64_KERNEL_IDLE_H
+
+enum idle_mode {
+	WFI,
+	YIELD,
+	NOP,
+};
+
+#endif
diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a..d6fd09466abc 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -15,9 +15,13 @@
 
 #include <clocksource/arm_arch_timer.h>
 
+#include "../kernel/idle.h"
+
 #define USECS_TO_CYCLES(time_usecs)			\
 	xloops_to_cycles((time_usecs) * 0x10C7UL)
 
+extern enum idle_mode idle;
+
 static inline unsigned long xloops_to_cycles(unsigned long xloops)
 {
 	return (xloops * loops_per_jiffy * HZ) >> 32;
@@ -49,7 +53,8 @@ void __delay(unsigned long cycles)
 		 * Start with WFIT. If an interrupt makes us resume
 		 * early, use a WFET loop to complete the delay.
 		 */
-		wfit(end);
+		if (likely(idle == WFI))
+			wfit(end);
 		while ((__delay_cycles() - start) < cycles)
 			wfet(end);
 	} else 	if (arch_timer_evtstrm_available()) {

---
base-commit: 96cb07bd64bf4d3c8c9159636314c6fbdd9b9881
change-id: 20260705-arm64-idle-param-c27fc0e7ea05

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


