Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F6DC88E71
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6D6rw7/GwRT6DD21YvXGlpw51qKY26V/g21oDx8+BM=; b=j9mtZWrxJq3Px6ZNCP0zdreLWq
	V+rbc9NY4zo/LM7ly1vHW7ugNAEyxPsgSjDZqPGZ7vxeMejwFu31oyqUmSwBCIV9zqOA2wFueEBgW
	W+Ki7zRIBl26swR8HIpotltkOdKlR3rTG3lE+Axhad4fnT7bn7BGcJ99Ku9suiuhMGWnGMtjo36eX
	9IVqA9P9pKGfse5M0OeUzO1ZivFweZuDmgIR0kypBPgzqT09DcC4cyqCSe5MJb+9oT2paDVcpDnJk
	Jz9DKy9MqgF7YWBUTFHFYV+SRez1rpgCiWh5tV+seoZWfOEapPyfC+DQjsmDFEytGjQtfGxRMcRcr
	lzjuZOzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63qp-000000037kr-3mAv;
	Mon, 14 Sep 2026 10:23:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pK-000000035z6-1wzT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E0DF1CC4;
	Mon, 14 Sep 2026 03:22:14 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC4AA3F7B4;
	Mon, 14 Sep 2026 03:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381338; bh=k+mzLmsDUJkgUoMJFxRkOozDPJHQG9jifHDKvpJSvu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DR2j373OH+rNchG+6KJWckqcAxCIbWileL9OQlu/heej8FmayDhBuIc60uUPpCQLz
	 j1uK3AmQVID2rY5L77c+hxeJd1XT4qgvH9PaPMs/x1JI1IwlIbO+SMQlh7bXJXDnsh
	 9bSpBQ9/FQ+PJUB/b/3FlcReoe62OVHdhmBeB/VM=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 35/38] arm64: smp: Add NMI support for LPI-backed IPIs
Date: Mon, 14 Sep 2026 11:20:59 +0100
Message-Id: <20260914102102.68597-36-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032218_567812_FD8D1539 
X-CRM114-Status: GOOD (  13.85  )
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

LPI-backed IPIs are currently always requested and managed as regular
IRQs. Allow IPIs selected by ipi_should_be_nmi() to be requested as
NMIs, falling back to regular IRQs when the NMI request fails.

Track which IPIs were successfully requested as NMIs so that the
per-CPU enable and disable paths use the appropriate NMI helpers.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/smp.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index dec075bfbf3b..151cc326dad9 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1177,16 +1177,28 @@ static const struct ipi_irq_ops ipi_sgi_ops = {
 
 static void ipi_lpi_enable(int cpu, int ipi)
 {
-	enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+	int irq = irq_desc_get_irq(get_ipi_desc(cpu, ipi));
+
+	if (ipi_is_nmi(cpu, ipi))
+		enable_nmi(irq);
+	else
+		enable_irq(irq);
 }
 
 static void ipi_lpi_disable(int cpu, int ipi)
 {
-	disable_irq_nosync(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+	int irq = irq_desc_get_irq(get_ipi_desc(cpu, ipi));
+
+	if (ipi_is_nmi(cpu, ipi))
+		disable_nmi_nosync(irq);
+	else
+		disable_irq_nosync(irq);
 }
 
 static void ipi_lpi_setup(int ipi, int ncpus)
 {
+	bool is_nmi = ipi_should_be_nmi(ipi);
+
 	for (int cpu = 0; cpu < ncpus; cpu++) {
 		int err, irq;
 
@@ -1195,13 +1207,29 @@ static void ipi_lpi_setup(int ipi, int ncpus)
 		err = irq_force_affinity(irq, cpumask_of(cpu));
 		WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
 
-		err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
-				  NULL);
-		WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
+		/*
+		 * Try to request NMI if it should be
+		 */
+		if (is_nmi && request_nmi(irq, ipi_handler, IRQF_PERCPU | IRQF_NO_AUTOEN, "IPI", NULL)) {
+			/*
+			 * Fallback to regular IRQ
+			 */
+			is_nmi = false;
+		}
+		/*
+		 * Otherwise regular IRQ
+		 */
+		if (!is_nmi) {
+			err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI", NULL);
+			WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
+		}
 
 		irq_set_status_flags(irq, (IRQ_HIDDEN | IRQ_NO_BALANCING_MASK));
 
 		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
+
+		if (is_nmi)
+			set_bit(ipi, get_ipi_nmi_bitmap(cpu));
 	}
 }
 
-- 
2.34.1


