Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F14C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gUruAPcRZAhxhAwGjL+JGfL3vjD5e9aEDv9VHQhAvM=; b=jrNFaVx1Wribzjm3r9uhwjoCpA
	y9tePxH7O968KCb1XloooXKB06/emaneWQAlGUkvIQMkYDAgyAyNpirCKheTgWMHCn05AdNpLR7YF
	VTvrX74BaGo5fKiZBuS4D5U3a/dV6gYA6WVZ50ZDcCbSR/Hqm2KHO4CNSFcQ+q0gBNJ5hfoV8zggN
	3GwwB+UZHaAxOOW5yRQ9mVOCW62lc5q4FJ8g049AtVAYAHeWRib1CW1g6p6HI2bHdaIed2Ra5RIQ0
	coxvc3oMTvaYqTCuEoJyhH2ONDOflYbGz/KE3Djm6gojPE43l0r3ZAt7/is+6+6N7QH+eFcHTluU0
	HKpH2mew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIt-00000003Mic-1Qzs;
	Mon, 27 Jul 2026 16:35:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIa-00000003MRO-0kO4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7AF01758;
	Mon, 27 Jul 2026 09:35:22 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F3C73F86F;
	Mon, 27 Jul 2026 09:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170127; bh=6IULUx9XL7XNs4Q02vjPVYMXaHji21PkaNJfeYmTqec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DK5ktIRLQ2klKQhJoW052ZL4CBbaHmnRpDUr/7mAHXR8ddOTtO6oNyaHp6c9866Nn
	 lItsC+40fBy7W0YBcZNabX6SaTVsmyR3D26nqVtpOEHAbcLvCnmOuqvziHuU9BTqsq
	 cs+Zo63Ru4em6TqTiD+/ppEARdfpikmBbhGy6M+g=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 05/45] arm64: suspend: rely on daif helpers to handle PMR
Date: Mon, 27 Jul 2026 17:34:13 +0100
Message-Id: <20260727163453.7969-6-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093528_313303_A8BCD305 
X-CRM114-Status: GOOD (  17.24  )
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

Commit 77345ef70445 ("arm64: suspend: Use cpuidle context helpers
in cpu_suspend()") added cpuidle helpers to handle PMR manipulation
and restoration to ensure that the CPU receives interrupts when suspended
and pseudo-NMIs are enabled.

However, those helpers are called in between a pair of `local_daif_save()`
and `local_daif_restore()`, which already configure the PMR as expected.
Effectively, `arm_cpuidle_save_irq_context()` is a no-op here,
even when using pseudo-NMIs, and `arm_cpuidle_restore_irq_context()`
would not restore proper interrupt masking configuration early enough
if there were unexpected changes during suspend or resume.
(This can be observed with Trusted Firmware A (TF-A) at EL3 handling
suspend through PSCI. Even though it should not be the case, TF-A can
reset `ICC_PMR_EL1` during CPU_SUSPEND, thus resuming the kernel
with an inconsistent priority mask value on hardware implementing
more than the minimum number of priority levels, such as Morello.)

Thus : remove the cpuidle context helpers as they do not do anything,
but keep the comment mentioning the need for interrupts to reach the CPU
if we are using pseudo-NMIs.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/suspend.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
index eaaff94329cd..c41724a40b75 100644
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@ -99,7 +99,6 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 	int ret = 0;
 	unsigned long flags;
 	struct sleep_stack_data state;
-	struct arm_cpuidle_irq_context context;
 
 	/*
 	 * Some portions of CPU state (e.g. PSTATE.{PAN,DIT}) are initialized
@@ -121,6 +120,9 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 	 * Strictly speaking the trace_hardirqs_off() here is superfluous,
 	 * hardirqs should be firmly off by now. This really ought to use
 	 * something like raw_local_daif_save().
+	 *
+	 * This also unmasks interrupts in PMR in order to reliably
+	 * resume if we're using pseudo-NMIs.
 	 */
 	flags = local_daif_save();
 
@@ -131,12 +133,6 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 	 */
 	pause_graph_tracing();
 
-	/*
-	 * Switch to using DAIF.IF instead of PMR in order to reliably
-	 * resume if we're using pseudo-NMIs.
-	 */
-	arm_cpuidle_save_irq_context(&context);
-
 	ct_cpuidle_enter();
 
 	if (__cpu_suspend_enter(&state)) {
@@ -159,8 +155,6 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 		__cpu_suspend_exit();
 	}
 
-	arm_cpuidle_restore_irq_context(&context);
-
 	unpause_graph_tracing();
 
 	/*
-- 
2.34.1


