Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BD3D77883
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjXDnF0NqD8HY+b6UafRiX3hs4ISC6ZeswAHEhbznt0=; b=OOqdaoxsMH5yYHgylWpOaeN1H1
	NjxUUVg0IAq63jYhYviX4mC44gxgctpGYCrUWHvMJJ9ubmLtQU9R6JbCxzaG00VWUol2Jy8pUfj3Y
	Z7vM0l7RS2zCCfwE3849lvVt8rbeEIOlLZcpDZFZn8wPqtYBYIXvVLcdjeYy1tBDL596fppvQFxVr
	LTIpdNoWD3uot73OqQCz4OPADnZdYcQRmbk2Hw9sYGqy3kn45Rf0aruYtARTw1eLJivtng1/AOjFO
	Ngh9LiaZhKy/szbv+O0mxYPke4octi2gnE5hE7//+eU0t58nf45ElZozHDr9To3npVWb7lfAaMcOw
	CoILu5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNU-00000009E6m-2I1O;
	Fri, 23 Jan 2026 16:51:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNP-00000009E2y-3iPI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:51:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C397C168F;
	Fri, 23 Jan 2026 08:51:07 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE96B3F694;
	Fri, 23 Jan 2026 08:51:12 -0800 (PST)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	andrew.jones@linux.dev,
	eric.auger@redhat.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvm-unit-tests PATCH v6 07/14] arm64: micro-bench: fix timer IRQ
Date: Fri, 23 Jan 2026 16:50:46 +0000
Message-Id: <20260123165053.2250754-8-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123165053.2250754-1-joey.gouly@arm.com>
References: <20260123165053.2250754-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085116_024111_B1CCCAA8 
X-CRM114-Status: UNSURE (   9.46  )
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

Enable the correct (hvtimer) IRQ when at EL2.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 arm/micro-bench.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arm/micro-bench.c b/arm/micro-bench.c
index 22408955..f47c5fc1 100644
--- a/arm/micro-bench.c
+++ b/arm/micro-bench.c
@@ -42,7 +42,7 @@ static void gic_irq_handler(struct pt_regs *regs)
 	irq_received = true;
 	gic_write_eoir(irqstat);
 
-	if (irqstat == TIMER_VTIMER_IRQ) {
+	if (irqstat == TIMER_VTIMER_IRQ || irqstat == TIMER_HVTIMER_IRQ) {
 		write_sysreg((ARCH_TIMER_CTL_IMASK | ARCH_TIMER_CTL_ENABLE),
 			     cntv_ctl_el0);
 		isb();
@@ -215,7 +215,11 @@ static bool timer_prep(void)
 	install_irq_handler(EL1H_IRQ, gic_irq_handler);
 	local_irq_enable();
 
-	gic_enable_irq(TIMER_VTIMER_IRQ);
+	if (current_level() == CurrentEL_EL1)
+		gic_enable_irq(TIMER_VTIMER_IRQ);
+	else
+		gic_enable_irq(TIMER_HVTIMER_IRQ);
+
 	write_sysreg(ARCH_TIMER_CTL_IMASK | ARCH_TIMER_CTL_ENABLE, cntv_ctl_el0);
 	isb();
 
-- 
2.25.1


