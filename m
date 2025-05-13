Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07ECC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6ULvENJF3RGne8V2bQQtnlL3YafBC67ZRJPHPigIec=; b=mAlqFdIrUU2tK8dg8flInQYv19
	5+ljNYXYsC3DwcUUZx6A0CWdz63LTe1S9aiDK2kCbWtzUwDsWf2bXh49uS89ImpNS1TXlfaci6/14
	zLBecGbuX9voEztj/p8OSWUCTXIte+CD3ToIGTBlWFePrH2sxaAmcIrMpV1cA/SaE3rGrdEox+Op+
	S9PSEmsTfcfJSfTCOtTHgSZI7kLpVjwSRDrYOwTKJ1DkuEI3xU2eWc/XlRbCj3nrp4gN9bRqHRVyl
	6bSFOIm3BBvhu2EgcNHu34IlqVH6VtNd8JUGshhREgh0jHVUED1x35QPyg6N/9ZHl9vqJ3nvieg1G
	1B09xy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtkf-0000000D9DO-2oh1;
	Tue, 13 May 2025 17:49:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtQd-0000000D5cF-2IyE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:28:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3A20A4DAB9;
	Tue, 13 May 2025 17:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60828C4CEF2;
	Tue, 13 May 2025 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747157310;
	bh=hJnEDdlO2yAeWjJZLwOK8T9TN8bPwhBcclQiZAl/tvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m3NXXBMEOno7S4l41KbEzkbwBRE0r32Lrlik96A7hRHsMUPQDujQ4f1z01V0wv5Lr
	 nPmmGQAXsxOlzy58uQc78D9aWMkpIWkKXjgBrQFUDFf2w4fjWNwcADhcRQLfPW3/IU
	 hJlq3tAZh8SulU07V3e+b5rZmlphQ9B+nhALsGlTBga75KJfCC8ijE5+XQdPI1SfBv
	 Xffhs97gS0jM0Af3k/vvzahGfHfdX9feZpBE6Tf7Pce7w1lzVHb296s+pBUteGKZYn
	 lqvpBmhMEP7K34siTFutWivrPR/tVQKJqQJeyaHcJBf5nskooCUgP8Y2vvNt2WTFHh
	 kpmLq3bq7t+yw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEtQa-00EbRz-HN;
	Tue, 13 May 2025 18:28:28 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 3/9] irqchip/gic: Convert to msi_create_parent_irq_domain() helper
Date: Tue, 13 May 2025 18:28:13 +0100
Message-Id: <20250513172819.2216709-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513172819.2216709-1-maz@kernel.org>
References: <20250513172819.2216709-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, tglx@linutronix.de, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io, thierry.reding@gmail.com, jonathanh@nvidia.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_102831_761157_A5C67858 
X-CRM114-Status: GOOD (  13.89  )
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

Now that we have a concise helper to create an MSI parent domain,
switch the GIC family over to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v2m.c    | 12 +++++++-----
 drivers/irqchip/irq-gic-v3-its.c | 19 +++++++++----------
 drivers/irqchip/irq-gic-v3-mbi.c | 11 ++++++-----
 3 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index 62676994d0695..9050792e3242f 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -268,16 +268,18 @@ static __init int gicv2m_allocate_domains(struct irq_domain *parent)
 	if (!v2m)
 		return 0;
 
-	inner_domain = irq_domain_create_hierarchy(parent, 0, 0, v2m->fwnode,
-						   &gicv2m_domain_ops, v2m);
+	inner_domain = msi_create_parent_irq_domain(&(struct irq_domain_info){
+			.fwnode		= v2m->fwnode,
+			.ops		= &gicv2m_domain_ops,
+			.host_data	= v2m,
+			.parent		= parent,
+		}, &gicv2m_msi_parent_ops);
+
 	if (!inner_domain) {
 		pr_err("Failed to create GICv2m domain\n");
 		return -ENOMEM;
 	}
 
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_NEXUS);
-	inner_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	inner_domain->msi_parent_ops = &gicv2m_msi_parent_ops;
 	return 0;
 }
 
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 9e6380f597488..9ea3a6723263c 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5128,20 +5128,19 @@ static int its_init_domain(struct its_node *its)
 	info->ops = &its_msi_domain_ops;
 	info->data = its;
 
-	inner_domain = irq_domain_create_hierarchy(its_parent,
-						   its->msi_domain_flags, 0,
-						   its->fwnode_handle, &its_domain_ops,
-						   info);
+	inner_domain = msi_create_parent_irq_domain(&(struct irq_domain_info){
+			.fwnode		= its->fwnode_handle,
+			.ops		= &its_domain_ops,
+			.host_data	= info,
+			.domain_flags	= its->msi_domain_flags,
+			.parent		= its_parent,
+		}, &gic_v3_its_msi_parent_ops);
+
 	if (!inner_domain) {
 		kfree(info);
 		return -ENOMEM;
 	}
 
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_NEXUS);
-
-	inner_domain->msi_parent_ops = &gic_v3_its_msi_parent_ops;
-	inner_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT | IRQ_DOMAIN_FLAG_MSI_IMMUTABLE;
-
 	return 0;
 }
 
@@ -5518,7 +5517,7 @@ static struct its_node __init *its_node_init(struct resource *res,
 	its->base = its_base;
 	its->phys_base = res->start;
 	its->get_msi_base = its_irq_get_msi_base;
-	its->msi_domain_flags = IRQ_DOMAIN_FLAG_ISOLATED_MSI;
+	its->msi_domain_flags = IRQ_DOMAIN_FLAG_ISOLATED_MSI | IRQ_DOMAIN_FLAG_MSI_IMMUTABLE;
 
 	its->numa_node = numa_node;
 	its->fwnode_handle = handle;
diff --git a/drivers/irqchip/irq-gic-v3-mbi.c b/drivers/irqchip/irq-gic-v3-mbi.c
index e562b57923229..11fa5df9da8c7 100644
--- a/drivers/irqchip/irq-gic-v3-mbi.c
+++ b/drivers/irqchip/irq-gic-v3-mbi.c
@@ -208,14 +208,15 @@ static int mbi_allocate_domain(struct irq_domain *parent)
 {
 	struct irq_domain *nexus_domain;
 
-	nexus_domain = irq_domain_create_hierarchy(parent, 0, 0, parent->fwnode,
-						   &mbi_domain_ops, NULL);
+	nexus_domain = msi_create_parent_irq_domain(&(struct irq_domain_info){
+			.fwnode		= parent->fwnode,
+			.ops		= &mbi_domain_ops,
+			.parent		= parent,
+		}, &gic_v3_mbi_msi_parent_ops);
+
 	if (!nexus_domain)
 		return -ENOMEM;
 
-	irq_domain_update_bus_token(nexus_domain, DOMAIN_BUS_NEXUS);
-	nexus_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	nexus_domain->msi_parent_ops = &gic_v3_mbi_msi_parent_ops;
 	return 0;
 }
 
-- 
2.39.2


