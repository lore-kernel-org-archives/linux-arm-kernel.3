Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B79FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 22:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=0tWG3WSaKp6CbPJPdYU6zI+q09ff0s53l/UZLpIo8fU=; b=HqnIoCf6HS2R9s90DhCK2SyLVF
	GDKFggmRZH/4+1p8HRH3UQTEY7AINR6myqICdjCWZwSC5tXNmtuq1SPC40XmRWk0hXVbbQ0rdg3wJ
	as5Rli3juYTKyAS+KfE48o8lAb1v3qZZnXjFKCzzbU10F1BGEWHGeLU/noKMWPnn1C0UzXUJUg3Fr
	31KShRnQKAmIlt2KNb7XHetzHL4F0DMG+SBBNgggVpZijHMG5yaRwshtHfReFyVW/KANyZQ2DfZ5V
	3w3QBC0fxaV74ACYX5/fkCvjcOzncY07sfyvIRycY/tcRfZ43ZZwFjaFU306ieHvTuD8eO5vtTg53
	qCLbX6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPp1u-00000005vct-4441;
	Wed, 20 May 2026 22:04:42 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPp1q-00000005vc8-0lwt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 22:04:41 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260520220432euoutp01ecaf5ea2972686cdff67d1a317725f89~xZUSANCb40197201972euoutp01y
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 22:04:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260520220432euoutp01ecaf5ea2972686cdff67d1a317725f89~xZUSANCb40197201972euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779314672;
	bh=0tWG3WSaKp6CbPJPdYU6zI+q09ff0s53l/UZLpIo8fU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=c3ic/NJI3ICoCdK+pEbTPt6glLl928gJr7GioGwaOh9Cjp0l2gY6KdnpADozDxGV9
	 Ms/GCubk8oUv/CH+k6yA3UFVIIFwbq/1zDXmcePkz+bkDTv09f5bj2e8BVwOcrvL7a
	 RuLN0s99GEpsz1wDtaypiTf+5djE1pYbOWITa9No=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109~xZURYfiNp2592825928eucas1p1H;
	Wed, 20 May 2026 22:04:32 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260520220431eusmtip23c9cbf8151959b8b8ac63d14aabb10b1~xZUQ2jU3V2076420764eusmtip2Y;
	Wed, 20 May 2026 22:04:31 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Thomas Gleixner
	<tglx@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
	Rostedt <rostedt@goodmis.org>
Subject: [PATCH] irqchip/exynos-combiner: switch to raw_spinlock
Date: Thu, 21 May 2026 00:04:22 +0200
Message-Id: <20260520220422.3522908-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109
X-EPHeader: CA
X-CMS-RootMailID: 20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109
References: <CGME20260520220432eucas1p10502ca0f9368bd6de5ce027ad8170109@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_150438_686589_27F8A212 
X-CRM114-Status: GOOD (  15.00  )
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

The exynos-combiner driver uses a regular spinlock to protect access to
the combiner interrupt status register in combiner_handle_cascade_irq(),
which is invoked in hard IRQ context as a chained interrupt handler.

When PREEMPT_RT is enabled on ARM, regular spinlock is converted to a
sleeping lock (mutex-based), which must not be used in atomic context
such as hard interrupt handlers. Switch the irq_controller_lock to
raw_spinlock, which remains a true non-sleeping spinlock even under
PREEMPT_RT.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Fixes: a900e5d99718 ("ARM: exynos: move exynos4210-combiner to drivers/irqchip")
---
 drivers/irqchip/exynos-combiner.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index 11d105457798..03cafcc5c835 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -24,7 +24,7 @@
 
 #define IRQ_IN_COMBINER		8
 
-static DEFINE_SPINLOCK(irq_controller_lock);
+static DEFINE_RAW_SPINLOCK(irq_controller_lock);
 
 struct combiner_chip_data {
 	unsigned int hwirq_offset;
@@ -72,9 +72,9 @@ static void combiner_handle_cascade_irq(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	spin_lock(&irq_controller_lock);
+	raw_spin_lock(&irq_controller_lock);
 	status = readl_relaxed(chip_data->base + COMBINER_INT_STATUS);
-	spin_unlock(&irq_controller_lock);
+	raw_spin_unlock(&irq_controller_lock);
 	status &= chip_data->irq_mask;
 
 	if (status == 0)
-- 
2.34.1


