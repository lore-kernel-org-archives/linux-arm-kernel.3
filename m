Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE29C54F4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUjLNfERKtAV1U4j7mrcR9o9H0c4DpQddmqzufkd67s=; b=ChGe56+IZPC2gGjROCv3kswMc/
	1SXZ+FNLmwX1XS0nP9ic6OUsh5o9uNX41dqmxB3jA6pRbsUoQrAf4ezk6t9z96NLc3VoADQvc42O1
	B9RgPX5ExA179az+OcrJZgdqc7WWiZv0EUpMBwcDkdVlkVGjdbgAdLpfTQv3aZ14P0sxOafU4ihid
	39yYlYA4QQmPSWLasbEIQUOj+JrsV+iTUq3S/50Rha0AwhLZlVvYAD12c9x2gDN0f/1eo/5bNaBow
	pJMbCC+JZM2lIcc7fipHeuIrgVAeh+abOh2u1aqJxZ2Wcy6W/L15K3SqaQODBDjeH93kDc6+eH+k2
	Q6/R0wJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIx-00000003MnG-0buy;
	Mon, 27 Jul 2026 16:35:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIf-00000003MRO-1PSX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9FBA16F8;
	Mon, 27 Jul 2026 09:35:27 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E21D23F86F;
	Mon, 27 Jul 2026 09:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170131; bh=bL0SMyu1gaA8hKRIq7oGuTeGAZNZbuOmEs8BQRnJ0mM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ua3EngD+cK6TEMg46eOfAYParS2r4U1H0duxQi6tUKoyDye6ROYcmoIPfe3imn7sl
	 OpRZ+3u1W3rOjqfiz00DofrRSeOfQPyArwfS45ljSTnLgnv5EM9D8Wy2CJoosNwTz/
	 q03Vjuws89GJtAGzgzSvoLiPaLfREU6jqi0xq5oU=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 09/45] arm64: entry: Avoid unnecessary local_irq_disable() on kernel exit
Date: Mon, 27 Jul 2026 17:34:17 +0100
Message-Id: <20260727163453.7969-10-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093533_472336_E41F2F8A 
X-CRM114-Status: GOOD (  12.01  )
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

Currently, when exiting to kernel mode, we attempt involuntary
preemption. The preemption logic expects IRQs to be disabled, which is
why we call local_irq_disable() before attempting preemption.

However, depending on the context, local_irq_disable() may be
unnecessary:

- __el1_irq(), the non-NMI EL1 IRQ path, already has IRQs disabled, so
  local_irq_disable() is redundant.

- irqentry_exit_to_kernel_mode_preempt() immediately returns when
  exiting from an NMI-like context, so calling local_irq_disable()
  beforehand is unnecessary work.

Split arm64_exit_to_kernel_mode() into preempt, non-preempt, and
dispatch parts so that we can avoid this extra work where it is not
needed.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/entry-common.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 2be42d7f4eaa..72c03ccea59f 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -52,16 +52,36 @@ static noinstr irqentry_state_t arm64_enter_from_kernel_mode(struct pt_regs *reg
  * After this function returns it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
  */
-static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
-					      irqentry_state_t state)
+static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
+						irqentry_state_t state)
 {
-	local_irq_disable();
-	irqentry_exit_to_kernel_mode_preempt(regs, state);
 	local_daif_mask();
 	mte_check_tfsr_exit();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
 
+/*
+ * We are returning from the context which allows involuntary kernel preemption
+ */
+static void noinstr arm64_exit_to_kernel_mode_preempt(struct pt_regs *regs,
+						      irqentry_state_t state)
+{
+	irqentry_exit_to_kernel_mode_preempt(regs, state);
+	__arm64_exit_to_kernel_mode(regs, state);
+}
+
+static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
+					      irqentry_state_t state)
+{
+	if (!regs_irqs_disabled(regs)) {
+		local_irq_disable();
+		arm64_exit_to_kernel_mode_preempt(regs, state);
+		return;
+	}
+
+	__arm64_exit_to_kernel_mode(regs, state);
+}
+
 static __always_inline void arm64_syscall_enter_from_user_mode(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);
@@ -510,7 +530,7 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	arm64_exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode_preempt(regs, state);
 }
 static void noinstr el1_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
-- 
2.34.1


