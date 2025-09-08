Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B46CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCazFPuhW5L/KqlKt9Vg6Yl5L2NNsSE2VZbRusAqs50=; b=BdxKdnZLIIqp32Qc5+Te19XEdK
	947gYHwaXNET1JPSrbNpdC2O8282N5QkV7bvo75hBJ6Kw6R+oQBuzMl1Azac+6j4dXjy47x9k2OZv
	N/0TJ9Ke4F8Cl6GMGMZIJsFdVqT8BzI7GQDvkaawLhnGM3dEliQg4tqUZmiX3+uLdGBW4gHZqpPMp
	SbEVtgYFjBLlM1hDiQ3WUKj0VAGn5hLE7q52pCWTBlS5dHox5SBnPIFu8ebi+lG8Ix6zrjCTF84KX
	FUk1RWSIrSuIZwg/dqf0cm2iPU5kyzBrvjyoLcIRkViGMEwyD55slpRBEYpEX4AUZnkoW09Ksgwsz
	istz8Yiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvY8t-0000000G11F-0NGu;
	Mon, 08 Sep 2025 09:26:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXED-0000000FhUk-0djc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:27:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91E9E601BD;
	Mon,  8 Sep 2025 08:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D98C4CEF5;
	Mon,  8 Sep 2025 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757320076;
	bh=CFvvTrfa1t92F7NxctUBMm3QJnsOF0WWxyPhVXxwhCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LnXTGIP3pULjVEAepJ6qCrd3NuT65KHO7JLgPYCK6GiyxGGYrjnWF6Ox2dxar9Lca
	 i4z/sEg/UtTUZoC9gi488+kRJ3j8liXpyILqPJo69l08TFMSlcZFeVAkWB2lvIZkU6
	 tvLP5ljWIokQmgVfkhfcieOQg0Y0Mc7U/lAgAPOGskryGwdef+naU19kHGFnLf3nFd
	 9W8SIQ26Fa9FeabH022g5Nyq5oftskXyMo4qzCjMfZ2mBIB4B1pHkcagYiAzZIpee2
	 T/cG27wqP1z/4003cPjWGsyJ9Baw3KXaKsFLBAgVdChIdU8B3pOpV9LG+fyaEHtrs2
	 xJe+nThBVRFYg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 RESEND 3/3] irqchip/gic-v5: Fix error handling in gicv5_its_irq_domain_alloc()
Date: Mon,  8 Sep 2025 10:27:45 +0200
Message-ID: <20250908082745.113718-4-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250908082745.113718-1-lpieralisi@kernel.org>
References: <20250908082745.113718-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Dan Carpenter <dan.carpenter@linaro.org>

Code in gicv5_its_irq_domain_alloc() has two issues:

- it checks the wrong return value/variable when calling gicv5_alloc_lpi()
- The cleanup code does not take previous loop iterations into account

Fix both issues at once by adding the right gicv5_alloc_lpi() variable
check and by reworking the function cleanup code to take into account
current and previous iterations.

[lpieralisi: reworded commit log]

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5-its.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 4701ef62b8b2..2fb58d76f521 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -949,15 +949,18 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
 	device_id = its_dev->device_id;
 
 	for (i = 0; i < nr_irqs; i++) {
-		lpi = gicv5_alloc_lpi();
+		ret = gicv5_alloc_lpi();
 		if (ret < 0) {
 			pr_debug("Failed to find free LPI!\n");
-			goto out_eventid;
+			goto out_free_irqs;
 		}
+		lpi = ret;
 
 		ret = irq_domain_alloc_irqs_parent(domain, virq + i, 1, &lpi);
-		if (ret)
-			goto out_free_lpi;
+		if (ret) {
+			gicv5_free_lpi(lpi);
+			goto out_free_irqs;
+		}
 
 		/*
 		 * Store eventid and deviceid into the hwirq for later use.
@@ -977,8 +980,13 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
 
 	return 0;
 
-out_free_lpi:
-	gicv5_free_lpi(lpi);
+out_free_irqs:
+	while (--i >= 0) {
+		irqd = irq_domain_get_irq_data(domain, virq + i);
+		gicv5_free_lpi(irqd->parent_data->hwirq);
+		irq_domain_reset_irq_data(irqd);
+		irq_domain_free_irqs_parent(domain, virq + i, 1);
+	}
 out_eventid:
 	gicv5_its_free_eventid(its_dev, event_id_base, nr_irqs);
 	return ret;
-- 
2.48.0


