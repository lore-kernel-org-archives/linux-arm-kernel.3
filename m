Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27764C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvCIbJ5CI2RlmqcGyBujeOEh7qm2e2p25gtIw9PDmD4=; b=AEJLmJMbylvK5P
	s1UAQ+evCdbZ4DY9mi/iMO/3OsT/IHJHx4GZBewUVM0ULkIKzbNQf5jXSbR5kZOBl6/m84H/d9ry6
	BQ2j976sNpYL1RxxZqi9pWxxjneUaxCSZK99CfnNS7fwg0RcJMLNfG6rYjoUzJ7kTWufkvVIndwaw
	1Fl201oDQuUzv2/5H5aQL7Y9am1RvwdAjV1VxPYYmhCbplwvrOTA+Eh5XCvBi0eUOGSZ1c0qHOo0r
	8MlbhOCTnbTl+YkEJFyCyQM62hJO6qvG7k2gG0/GxcemYi4J1NwKA9pVByQdEHCpTudp059yQQBCE
	o0KTKl9E30gJwhflL5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndo-00000002KS9-0V4v;
	Thu, 09 Jul 2026 12:14:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndj-00000002KOh-3m1R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C18CC339;
	Thu,  9 Jul 2026 05:13:58 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC8953F66F;
	Thu,  9 Jul 2026 05:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599243; bh=Xaf6IZDUdPdSxcQ5b0276Y6NWbO0ZDO/zF63cY2ZGAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HapgniG/nNh5HGPuB/zpQ9lsdV7aAoDvaXQUBj+2S3CCNqkz8PwSOrKyE/F1WKyKi
	 jr9sIghiVTFi5uZfcjdL+iXN70NkMQpek8lLG+Kzr72UUby6/VZAhcAnqXAAFePyIN
	 CUVlbe2WfMo0JgdR5allGFcheMLbl6VkE7Nd4Lcg=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 06/36] arm64: irq: introduce a helper for GIC priority initialization
Date: Thu,  9 Jul 2026 13:13:03 +0100
Message-Id: <20260709121333.23507-7-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051404_010463_7788F0EB 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, catalin.marinas@arm.com, will@kernel.org
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
 arch/arm64/include/asm/daifflags.h | 15 +++++++++++++++
 arch/arm64/kernel/irq.c            |  7 +++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
index 795b35128467..56341578e7e3 100644
--- a/arch/arm64/include/asm/daifflags.h
+++ b/arch/arm64/include/asm/daifflags.h
@@ -141,4 +141,19 @@ static __always_inline void local_daif_inherit(struct pt_regs *regs)
 	 */
 	write_sysreg(flags, daif);
 }
+
+/*
+ * During early boot, we unmask PSR.DA before the GIC has been set up.
+ * If we use IRQ priority masking, the PMR and PSR will be out of sync
+ * after the GIC is enabled : sync them up.
+ */
+static inline void local_interrupt_priority_init(void)
+{
+	WARN_ON(read_sysreg(daif) & PSR_A_BIT);
+	lockdep_assert_irqs_disabled();
+
+	gic_write_pmr(GIC_PRIO_IRQOFF);
+	write_sysreg(DAIF_PROCCTX, daif);
+}
+
 #endif
diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index 9fafd826002b..c73faa30268d 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -126,10 +126,9 @@ void __init init_IRQ(void)
 
 	if (system_uses_irq_prio_masking()) {
 		/*
-		 * Now that we have a stack for our IRQ handler, set
-		 * the PMR/PSR pair to a consistent state.
+		 * Now that we have a stack for our IRQ handler,
+		 * let's mask interrupts via the PMR.
 		 */
-		WARN_ON(read_sysreg(daif) & PSR_A_BIT);
-		local_daif_restore(DAIF_PROCCTX_NOIRQ);
+		local_interrupt_priority_init();
 	}
 }
-- 
2.34.1


