Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10545C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQqzc5y3FaaUOThMPn18cJBoP7M4KoVucWUhbuyBWRE=; b=MogPXWq9mhMCH2Sp9Ivf/4U+lj
	b12zbFJ/F10/T1kDOdq0IQj/SLpCJmWwt3fsXuqKo9UbC2LO3JuCREg4oggBC8Fod/AN30cI0CjIs
	wg+r/Z+4ae1cWoUeuZamKXq4OujZaFo4ItIkkcHPOvQu7IHlw59M4gnY3ltvtAgE68wvGS89W0Aw0
	yy5LNe34/9CFgCZ+0OGc3VSeYxOMxC/YEvbXl6AKejY4mlIFlPHWg/lGsyKPDFSyFMRedSL5qgjcA
	YMci2WWtt5h/kHZLs8e4YLTpc31ENii8619LLcti46z+544trPHfoUxsC6Ds1QE+ydnMLnSkgcVTk
	Pa95sR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63oo-000000035OC-1jBu;
	Mon, 14 Sep 2026 10:21:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63oi-000000035J1-0osJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2EA51C2B;
	Mon, 14 Sep 2026 03:21:35 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3D32F3F7B4;
	Mon, 14 Sep 2026 03:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381299; bh=4ItjMGSZoFKiNirJ8bS5hRAVvSmHOH+TY/nxHUxZ0oA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hm8O++6lP/xXP8MumejumkJZrOBWcZ8F1FAr153AXSsak8GhEV2PJNZyKxS0bEVC+
	 vcqhDSp7S4/VvojY4F7tvCpwjGzXIHn0nnrplm3yKbrpapgcqY0iJ4THX6a3EOl1+u
	 wYQBgCHSgI8572XxcS+qiVyg7JL/g7oUyst8qb6Q=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 08/38] arm64: interrupts: introduce a helper for GIC priority initialization
Date: Mon, 14 Sep 2026 11:20:32 +0100
Message-Id: <20260914102102.68597-9-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032140_633686_9505F741 
X-CRM114-Status: GOOD (  15.02  )
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
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/interrupts/masking.h | 19 +++++++++++++++++++
 arch/arm64/kernel/irq.c                     | 14 +++++---------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
index db3439853b64..9e589bf11ec8 100644
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
@@ -89,4 +91,21 @@ static inline void local_exceptions_final_mask(void)
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
index 58b778083576..a3d9128ba195 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -21,7 +21,6 @@
 #include <linux/seq_file.h>
 #include <linux/smp.h>
 #include <linux/vmalloc.h>
-#include <asm/daifflags.h>
 #include <asm/interrupts/masking.h>
 #include <asm/exception.h>
 #include <asm/numa.h>
@@ -131,14 +130,11 @@ void __init init_IRQ(void)
 
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


