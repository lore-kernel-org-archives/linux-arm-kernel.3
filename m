Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7424DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SBi+V035V67L28j9L9/Qffh6FNGjAoUGWAamYkDbJU=; b=J6TeZIlALDq6nTdaJ5dpeEY1Wf
	xGL5HJK+MnD7f2SrUOHSY78nlOof9cJ4iPQgf17eRyAJCQC9/YMwr7kwDXBVzXYX/nimMmtDM2ZYY
	kpLyP5t0kToBzowxjXDvZ2kd6lYvqd666g/QO0iC7bfEUQ70gnHFzrmAWHnQ2k6Gv1xjXWIYxVpsO
	WAE506h+BKDvhtZUwfFqtkKfRwOUfLRhmvwtbM50T4M/TuWHqE4qyQJieZ51r18ZeeDZa9e2n8Tg3
	Dc8Rlkfxk6+WF66PKGtWnb/BSE6kpHhDBLYzxBRLPLH993z68kP1L71bYPuHP3J7m8Is9mL//k5WI
	zd8uFj8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJ0-00000003Mus-2wGt;
	Mon, 27 Jul 2026 16:35:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIo-00000003Mea-2c2w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99A931688;
	Mon, 27 Jul 2026 09:35:37 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C38893F86F;
	Mon, 27 Jul 2026 09:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170141; bh=qoZnv1IH2QZl/kc9znypXnQHH+TzQbK6YVmC98SM6WI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzWBoqHYUJ5/aUpUbvjL4ry3HV/HVKH2MlEdt9BJXfhxFnMXGTuyxoxdEn6ulnLVl
	 QxT4EIvYWuhi9W8YrGarYgZ1Hcnrg/lIJalDeBHgRFiYohX7uPzdImaEUlmMUkMFwj
	 eozLWwf7zYAScWYezJkxM9X4k3CaDwgno3+f3FhU=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 17/45] arm64: interrupts: introduce a helper for GIC priority initialization
Date: Mon, 27 Jul 2026 17:34:25 +0100
Message-Id: <20260727163453.7969-18-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093542_768083_0DC7C518 
X-CRM114-Status: GOOD (  15.42  )
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

Arm64's `init_IRQ()` calls `local_daif_restore()` to synchronize
interrupt masking via DAIF and switch to masking via PMR.  This
depends on a very specific behaviour of `local_daif_restore()` which
will clear DAIF if masking interrupts via PMR, which will get removed
in the future.

As `setup_arch()` cleared DA only earlier, introduce a dedicated
helper that explicitly initializes the PMR to mask interrupts and
clears DAIF, switching to IRQ priority masking.

Given it is a dedicated helper, add a lockdep assertion as
`setup_arch()` should always have called `trace_hardirqs_off()` when
clearing DA, otherwise something bad happened.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/interrupts/masking.h | 19 +++++++++++++++++++
 arch/arm64/kernel/irq.c                     | 13 +++++--------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
index fd4fb5497c7e..193089fda252 100644
--- a/arch/arm64/include/asm/interrupts/masking.h
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -5,6 +5,8 @@
 #ifndef __ASM_INTERRUPTS_MASKING_H
 #define __ASM_INTERRUPTS_MASKING_H
 
+#include <linux/lockdep.h>
+
 #include <asm/arch_gicv3.h>
 #include <asm/bug.h>
 #include <asm/cpufeature.h>
@@ -86,4 +88,21 @@ static inline void local_exceptions_final_mask(void)
 	__local_exceptions_final_mask();
 }
 #endif /* CONFIG_DEBUG_IRQFLAGS */
+
+/*
+ * During early boot, we unmask PSR.DA before the GIC has been set up.
+ * If we use IRQ priority masking, the PMR and PSR will be out of sync
+ * after the GIC is enabled : sync them up.
+ */
+static inline void local_interrupt_priority_init(void)
+{
+	if (!system_uses_irq_prio_masking())
+		return;
+
+	WARN_ON(read_sysreg(daif) & PSR_A_BIT);
+	lockdep_assert_irqs_disabled();
+
+	arm64_update_exc_context(NOIRQ_CONTEXT);
+}
+
 #endif /* __ASM_INTERRUPTS_MASKING_H */
diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index ca98db345f92..a3d9128ba195 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -130,14 +130,11 @@ void __init init_IRQ(void)
 
 	irqchip_init();
 
-	if (system_uses_irq_prio_masking()) {
-		/*
-		 * Now that we have a stack for our IRQ handler, set
-		 * the PMR/PSR pair to a consistent state.
-		 */
-		WARN_ON(read_sysreg(daif) & PSR_A_BIT);
-		local_daif_restore(DAIF_PROCCTX_NOIRQ);
-	}
+	/*
+	 * Now that we have a stack for our IRQ handler,
+	 * let's mask interrupts via the PMR.
+	 */
+	local_interrupt_priority_init();
 }
 
 #ifdef CONFIG_DEBUG_IRQFLAGS
-- 
2.34.1


