Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C34C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zLsIyP0KtAkkGu4qxc5aJeTJpaXy+6Cbaxy6MIpywI=; b=YI3GnKT361cg2Sw2Fy4efW8K81
	ApB7NNUiGL/2/bRNDYO4KYysa4ax8RGLN7qKXXFk3uOyYZI32uDFheF2s800AGacR2GWLPzH7SGgO
	HCc6SaF8LrOzyL4xYs5I7k9WoyWp/8u6efR+cl5nEr27CQV2ofZicj/ILTaAqiTsL9roa5uKP7W5u
	8v1lytTkFJ7xs9r/meA4cDwWNciW7ZZ1K85+uN3gkPc/RDjElDnmqoJx6QhW5/PZbwMwI50Y5Elrs
	7UvCBV9opSRCgMw8pYwBsdLZFz/iBop0kr4OrPArLwaJuPCgWEwsyrZjBvaoMQaO7zPzJVjkLrn4o
	CroF8WuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63on-000000035Ms-37Vp;
	Mon, 14 Sep 2026 10:21:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63oc-000000035Gt-03vz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E14A61570;
	Mon, 14 Sep 2026 03:21:29 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6CF393F7B4;
	Mon, 14 Sep 2026 03:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381293; bh=6h+wye8CSEITGG0IR1sTIZhE7mwaS4ZqlAr/d1TRY0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4HoghLazlfyLc7UJtop5WSJ1jEYafl06l1xFFqxLY9Ycw5sJYUZDFQycC3dO3PDg
	 kPRDZjoJdt9+jd8ZtX8pwG0betEZXjWxz9iWvFP6rKY5Y6+ktn7qNuBCkvean0Ap50
	 VE1/tlmpGQbsfz67xDqr3DjJBEPncxCXjvd6iors=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 04/38] arm64: process: Lift check for exception state to generic infrastructure
Date: Mon, 14 Sep 2026 11:20:28 +0100
Message-Id: <20260914102102.68597-5-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032135_422734_C4047BC4 
X-CRM114-Status: GOOD (  11.37  )
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

debug_switch_state() explicitly checks the hardware exception state
for both the pseudo-NMI and non-NMI paths. The expected state matches
the NOIRQ_CONTEXT exception context introduced alongside the exception
masking helpers and state checkers. Such checks are handy outside of
task switch, so turn them into generic helpers available for wider
use. Make debug_switch_state() the first user of newly introduced
helpers.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 .../include/asm/interrupts/common_flags.h     | 30 +++++++++++++++++++
 arch/arm64/kernel/process.c                   | 21 ++-----------
 2 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
index 0de5ba1ae155..03cfde24a530 100644
--- a/arch/arm64/include/asm/interrupts/common_flags.h
+++ b/arch/arm64/include/asm/interrupts/common_flags.h
@@ -118,6 +118,36 @@ arm64_exc_hwstate_t arm64_inherit_exc_hwstate(struct pt_regs *regs)
 	return state;
 }
 
+static __always_inline
+void arm64_debug_exc_hwstate(arm64_exc_hwstate_t expected)
+{
+	arm64_exc_hwstate_t actual;
+
+	if (!IS_ENABLED(CONFIG_DEBUG_IRQFLAGS))
+		return;
+
+	actual.flags = arch_local_save_flags();
+
+	if (expected.flags == actual.flags)
+		return;
+
+	if (system_uses_irq_prio_masking()) {
+		WARN_ONCE(1, "Unexpected DAIF+PMR: 0x%x + 0x%x (expected 0x%x + 0x%x)\n",
+			  actual.daif, actual.pmr, expected.daif, expected.pmr);
+	} else {
+		WARN_ONCE(1, "Unexpected DAIF: 0x%x (expected 0x%x)\n",
+			  actual.daif, expected.daif);
+	}
+}
+
+static __always_inline
+void arm64_debug_exc_context(arm64_exc_context_t context)
+{
+	arm64_exc_hwstate_t expected = arm64_exc_hwstate_of_context(context);
+
+	arm64_debug_exc_hwstate(expected);
+}
+
 static __always_inline
 void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
 {
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..0fd09136d398 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -51,6 +51,7 @@
 #include <asm/exec.h>
 #include <asm/fpsimd.h>
 #include <asm/gcs.h>
+#include <asm/interrupts/common_flags.h>
 #include <asm/mmu_context.h>
 #include <asm/mpam.h>
 #include <asm/mte.h>
@@ -703,25 +704,7 @@ void update_sctlr_el1(u64 sctlr)
 
 static inline void debug_switch_state(void)
 {
-	if (system_uses_irq_prio_masking()) {
-		unsigned long daif_expected = 0;
-		unsigned long daif_actual = read_sysreg(daif);
-		unsigned long pmr_expected = GIC_PRIO_IRQOFF;
-		unsigned long pmr_actual = read_sysreg_s(SYS_ICC_PMR_EL1);
-
-		WARN_ONCE(daif_actual != daif_expected ||
-			  pmr_actual != pmr_expected,
-			  "Unexpected DAIF + PMR: 0x%lx + 0x%lx (expected 0x%lx + 0x%lx)\n",
-			  daif_actual, pmr_actual,
-			  daif_expected, pmr_expected);
-	} else {
-		unsigned long daif_expected = DAIF_PROCCTX_NOIRQ;
-		unsigned long daif_actual = read_sysreg(daif);
-
-		WARN_ONCE(daif_actual != daif_expected,
-			  "Unexpected DAIF value: 0x%lx (expected 0x%lx)\n",
-			  daif_actual, daif_expected);
-	}
+	arm64_debug_exc_context(NOIRQ_CONTEXT);
 }
 
 /*
-- 
2.34.1


