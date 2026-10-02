Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39ECCA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZCNA5hXD8rEJ+ya1t/91nO9EvU/rN6ZxDBsiQB0+iQ=; b=S7ZG8FYbUvv132KkCi8CgpsIyT
	cdvTLEW2dgt7DKuf9Ciu/4hNg4TNkU1q3TSpKg8hsCufo0D2GD8dwMF5GN3TTtgSwfsoKveqIYtwj
	cfvLgFREbZa8dbePGPFDnhW1dZLeDkh84SdW9zEpYYV5XBzjnF57FQWpr+zFYhDh9WHUNuWL1sTxg
	pvjyd1vxxLVrsvDqMMYHa16XIQnD9HP8smVaNDzkUeU6rVA55cutiX2BaUyQb6p4Hi5ecxBGJ0dsi
	Wp9qTw/yCi5VwYJ1qEo2UaBWHEj+60yeZ/+0zXZkSczIcLgz04PW9nqWobN6JIphRfK2K+mY1JzMb
	O/NEo50A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf38-0000000BteW-2OW6;
	Fri, 02 Oct 2026 15:19:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf37-0000000BtdF-1Hcw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 15:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=CZCNA5hXD8rEJ+ya1t/91nO9EvU/rN6ZxDBsiQB0+iQ=; b=nlH3Kq+QzPvsI1oA+vl2nN3uyT
	3u5p/GrqaroCuDn+P4sZjdlIOA6HYXnhzMgDHlKwDefMEpDN/M0kJndxd/bGDuSkDzDsT52bPhPWG
	s3CG+usSdd1vQENVLjrEtHcgMw9bu0F187mOKOmg50U6BYJGSeMvLVRpv6NvMeQSnUrxO40WmLzMp
	G59gia6yrat1rEfGuF61+RDi8bKdtmYQBqi7KKPmrODagq0xnvTxXu5wKQ4EOCZBLxYc5jyGUWZTB
	HvSTnKvEDYULu9SyEDzW4WAaJXyEe6zNk7K8vf7jI2AsGiCA29gScJiTvjvbZeJQ9MykGtqsWtBQw
	gAxHjRwQ==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCf34-000000064CR-2zi2;
	Fri, 02 Oct 2026 15:19:47 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xCf31-00000000IAu-3lqx;
	Fri, 02 Oct 2026 16:19:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Rodolfo Giometti <giometti@enneenne.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 1/2] arm64: Support inlined clocksource reads for the arch counter
Date: Fri,  2 Oct 2026 16:19:37 +0100
Message-ID: <20261002151938.69857-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002151938.69857-1-dwmw2@infradead.org>
References: <20261002151938.69857-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

From: David Woodhouse <dwmw@amazon.co.uk>

Commit 2e27beeb66e43 ("timekeeping: Allow inlining clocksource::read()")
allows an architecture's clocksource::read() to be inlined, and was only
wired up for x86_64 thus far in commit b27801189f7fc ("x86: Inline TSC
reads in timekeeping").

Add the corresponding ARCH_WANTS_CLOCKSOURCE_READ_INLINE support for the
arm64 arch counter, allowing the indirect clock->read() call in the fast
paths to be replaced with a direct sysreg read. A static key selects
CNTPCT vs CNTVCT as appropriate, and the inline support is only
advertised for the plain (no erratum workaround) read paths.

Measured on a Cortex-A53 at 1.35GHz (12.5MHz arch counter): the
interval from a raw counter read in the caller to the counter read
inside ktime_get_real_ts64() drops from 30.2ns to 23.4ns, mean of 1M
iterations. Every ktime_get*() user of tk_clock_read() benefits
similarly. Except ktime_get_snapshot_id(), which I shall get to shortly.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: LLM
---
 arch/arm64/Kconfig                     |  1 +
 arch/arm64/include/asm/clock_inlined.h | 26 ++++++++++++++++++++++++++
 drivers/clocksource/arm_arch_timer.c   | 21 +++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 arch/arm64/include/asm/clock_inlined.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..25795b87cd41 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -94,6 +94,7 @@ config ARM64
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANTS_CLOCKSOURCE_READ_INLINE
 	select ARCH_WANTS_EXECMEM_LATE
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
diff --git a/arch/arm64/include/asm/clock_inlined.h b/arch/arm64/include/asm/clock_inlined.h
new file mode 100644
index 000000000000..fe997412bc7d
--- /dev/null
+++ b/arch/arm64/include/asm/clock_inlined.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_CLOCK_INLINED_H
+#define _ASM_ARM64_CLOCK_INLINED_H
+
+#include <linux/jump_label.h>
+#include <asm/arch_timer.h>
+
+struct clocksource;
+
+/*
+ * Set by the arch timer driver when it selects the physical counter
+ * (kernel booted at EL2); otherwise the virtual counter is used. The
+ * driver only advertises CLOCK_SOURCE_CAN_INLINE_READ when it selected
+ * a plain (no erratum workaround) sysreg read matching this function.
+ */
+DECLARE_STATIC_KEY_FALSE(arch_timer_inline_read_pct);
+
+static __always_inline u64 arch_inlined_clocksource_read(struct clocksource *cs)
+{
+	if (static_branch_likely(&arch_timer_inline_read_pct))
+		return __arch_counter_get_cntpct();
+
+	return __arch_counter_get_cntvct();
+}
+
+#endif
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index cc9a8b399004..1c3d503d881a 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -133,6 +133,13 @@ static noinstr u64 arch_counter_get_cntvct(void)
 u64 (*arch_timer_read_counter)(void) __ro_after_init = arch_counter_get_cntvct;
 EXPORT_SYMBOL_GPL(arch_timer_read_counter);
 
+#ifdef CONFIG_ARM64
+#include <asm/clock_inlined.h>
+
+/* Selects CNTPCT in arch_inlined_clocksource_read() */
+DEFINE_STATIC_KEY_FALSE(arch_timer_inline_read_pct);
+#endif
+
 static u64 arch_counter_read(struct clocksource *cs)
 {
 	return arch_timer_read_counter();
@@ -917,6 +924,15 @@ static void __init arch_counter_register(void)
 		} else {
 			rd = arch_counter_get_cntvct;
 			scr = arch_counter_get_cntvct;
+			/*
+			 * A plain sysreg read with no erratum workaround
+			 * matches arch_inlined_clocksource_read(); allow the
+			 * core timekeeping code to bypass the indirect call.
+			 */
+#ifdef CONFIG_ARM64
+			clocksource_counter.flags |=
+				CLOCK_SOURCE_CAN_INLINE_READ;
+#endif
 		}
 	} else {
 		if (arch_timer_counter_has_wa()) {
@@ -925,6 +941,11 @@ static void __init arch_counter_register(void)
 		} else {
 			rd = arch_counter_get_cntpct;
 			scr = arch_counter_get_cntpct;
+#ifdef CONFIG_ARM64
+			static_branch_enable(&arch_timer_inline_read_pct);
+			clocksource_counter.flags |=
+				CLOCK_SOURCE_CAN_INLINE_READ;
+#endif
 		}
 	}
 
-- 
2.43.0


