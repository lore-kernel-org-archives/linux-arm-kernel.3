Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C9BCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 06:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=mgMRcmeIRwFSqj4uXq1QIcOzpHdQbgGdUSQRhqwyrqc=; b=qUhT7VgzxD8Gby76Vma+ViGyoR
	DGra8RbjV6BoCY+lCvFSOSDGpkA901xrETk4qclmynPoS5NZNRQF14fH2ZqAdmAk4UBnT7VwpxVQG
	UVUGYJ0YKJrA4brJBUVCQfUA+ydFg30LobI59biDPkcQvfEvXHRAkHZ8pr9DLbFh5UuaiipIcPdcX
	zA3fTFx6+m4oySb4V7dO+jjvG0JYCr3/c7mb0CmPGyJ9PwwaMs507u1fS/zFRnLdai7hmPinFUrk0
	efERBQ7cdPCwuCh8WC4r16PJShpG9M/J1i6UMUWKWuczfdkhzYOCxNvoFS3q7R6SENyNhsyB4tSZK
	HfZGDHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJ5p-00000009w4A-0pZ9;
	Fri, 22 May 2026 06:10:45 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJ5i-00000009w30-2DVf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 06:10:43 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260522061032euoutp018dfd81793195ffadbc6469d2bcb61a8b~xzl5IHeuf1893518935euoutp014
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:10:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260522061032euoutp018dfd81793195ffadbc6469d2bcb61a8b~xzl5IHeuf1893518935euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779430232;
	bh=mgMRcmeIRwFSqj4uXq1QIcOzpHdQbgGdUSQRhqwyrqc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=g87zDeykvYGDyTRMSqGrpZTtNG1CHEV/XA3BHojGCDSJrpArYbIXmr/f0n5CorO5D
	 FnvXTQonKrfD+NMd0bPRN/Vi+B9IxCcncDBAsDuvjBYKlHshAtkZC8Ik3kqp5ijM1V
	 AprBvn3xZ6LynBJMFtgkQRDIvzNu/HjP6Ui/Jm9Y=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662~xzl36eYGT0967209672eucas1p1m;
	Fri, 22 May 2026 06:10:30 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260522061030eusmtip2f8e15fe821297adff05efc074b9a5601~xzl3ZonYs1866518665eusmtip22;
	Fri, 22 May 2026 06:10:30 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Thomas Gleixner
	<tglx@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
	Rostedt <rostedt@goodmis.org>
Subject: [PATCH] irqchip/exynos-combiner: remove useless spinlock
Date: Fri, 22 May 2026 08:10:12 +0200
Message-Id: <20260522061012.2687122-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662
X-EPHeader: CA
X-CMS-RootMailID: 20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662
References: <CGME20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_231039_284051_F8A84CC4 
X-CRM114-Status: GOOD (  11.93  )
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

irq_controller_lock doesn't protect anything, it must be some leftover
from early development or copy/paste. Remove it completely.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/all/20260520220422.3522908-1-m.szyprowski@samsung.com/
Fixes: 96031b31a4b3 ("irqchip/exynos-combiner: Switch to raw_spinlock")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/irqchip/exynos-combiner.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index 03cafcc5c835..d9d408cb4711 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -24,8 +24,6 @@
 
 #define IRQ_IN_COMBINER		8
 
-static DEFINE_RAW_SPINLOCK(irq_controller_lock);
-
 struct combiner_chip_data {
 	unsigned int hwirq_offset;
 	unsigned int irq_mask;
@@ -72,9 +70,7 @@ static void combiner_handle_cascade_irq(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	raw_spin_lock(&irq_controller_lock);
 	status = readl_relaxed(chip_data->base + COMBINER_INT_STATUS);
-	raw_spin_unlock(&irq_controller_lock);
 	status &= chip_data->irq_mask;
 
 	if (status == 0)
-- 
2.34.1


