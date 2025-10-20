Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F22CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWcGorfyu8BFPpNF1TXarUrFExMLU03UmUPtO3UsN1w=; b=0RYjETfXJWRfkICWL2F3AzvMlW
	MDYuQgcS/BSWvozNIqk5juY0LAMCeDGVwPXf4YeNVYVtNw9gY2Mwqzp79f+snsHPsjjfxVzlow0kb
	Xv64wSYwM76FuseFmSa2o8SCKCt4MxdpYiBcvcf95+s3y97BwG9B+HUOtrga25t1X2FXUOkNhgQh0
	TTlmAzJ2Ol12YMcTW8p5l6ukQ9n9M63ttalK7EFD+Dpb168govRY2BCKTgZ0qBDKfGjytMKj1P5rR
	wRTXIYWHitBfTnZMohpKUbhI55tzlKY5YSASQ6Q0bS9cP9bbuetlU67GvrL2O6OaV7Vj8WKeTmCMy
	kDvGb4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2n-0000000DSUr-3LVA;
	Mon, 20 Oct 2025 12:31:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp1v-0000000DRHe-2rbl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 008E448AC2;
	Mon, 20 Oct 2025 12:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0AEC19422;
	Mon, 20 Oct 2025 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963410;
	bh=Qt273pw+MN6rE7hFzvmJUPrGSE98e5wVy5jP/E+uQbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RO5U1IzObhruD9T6sWbYuFAYXCscBY7XUlCDtXK2X95pC9dewhOnpk00RkVlPpWdw
	 atZyGTomiErROMwylQVPI7+GdXKSsyQqxJmxaM73Ap3zEsLpDWIcMzbV1R7ZhBTSCh
	 9URLWAAhRc88HIDLQfJmtfsnaz3v4Umshs3Du+IyDo+XLhImcTtnrMrBO6w4krxUZp
	 05pk2KSX9KUqeE85Aib4QMbKEVOdenF29/CE+Wjfy7JZ+ZolyUtNCT2LClckK1eVUv
	 Tmp2MYkCNEJ5RDQdJXllezB59N9bVoPukOgbcTNw2QX9yAHo3ns2YDN83FFr7yyU6D
	 83Je3CekjyEsA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1c-0000000FUu2-494k;
	Mon, 20 Oct 2025 12:30:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 06/26] irqchip/apple-aic: Add FW info retrieval support
Date: Mon, 20 Oct 2025 13:29:23 +0100
Message-ID: <20251020122944.3074811-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_053027_871097_A34402A4 
X-CRM114-Status: GOOD (  15.02  )
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

Plug the new .get_fwspec_info() callback into the Apple AIC driver,
using some of the existing FIQ affinity handling infrastructure.

Acked-by: Sven Peter <sven@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-apple-aic.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 032d66dceb8ec..cb8b6f40ce8d3 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -651,6 +651,33 @@ static int aic_irq_domain_map(struct irq_domain *id, unsigned int irq,
 	return 0;
 }
 
+static int aic_irq_get_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_info *info)
+{
+	const struct cpumask *mask;
+	u32 intid;
+
+	info->flags = 0;
+	info->affinity = NULL;
+
+	if (fwspec->param[0] != AIC_FIQ)
+		return 0;
+
+	if (fwspec->param_count == 3)
+		intid = fwspec->param[1];
+	else
+		intid = fwspec->param[2];
+
+	if (aic_irqc->fiq_aff[intid])
+		mask = &aic_irqc->fiq_aff[intid]->aff;
+	else
+		mask = cpu_possible_mask;
+
+	info->affinity = mask;
+	info->flags = IRQ_FWSPEC_INFO_AFFINITY_VALID;
+
+	return 0;
+}
+
 static int aic_irq_domain_translate(struct irq_domain *id,
 				    struct irq_fwspec *fwspec,
 				    unsigned long *hwirq,
@@ -753,6 +780,7 @@ static const struct irq_domain_ops aic_irq_domain_ops = {
 	.translate	= aic_irq_domain_translate,
 	.alloc		= aic_irq_domain_alloc,
 	.free		= aic_irq_domain_free,
+	.get_fwspec_info = aic_irq_get_fwspec_info,
 };
 
 /*
-- 
2.47.3


