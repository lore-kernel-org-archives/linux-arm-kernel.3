Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90084C83F15
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJMM4gK22aDv3MFFXNf/+A9iHfGbg3ILgUYZpd1e1GU=; b=0U/WqSa91iErRFn1Wc2riQcw6J
	IoBuPg70m6/eRgTTqMacT7Dg6c8RbIs2R+YTD2nkHEjR22XX6rvb6oR3QMHCA9o9KDkOmuABahF5L
	HcumC/zkLiCG+1j9ydXiOwT/uU76aYp3UNlPMs0yxXDWnnhp7ajII9gvIhmPdiC7GsbVGZfrY01bJ
	hTXWkBPZlCMaWDAQPK6w+DWhHX+2TNTPGWbzKaYTGBvQxhHVIvy4YRfqVxFbC8HbLlH2LQ97e2JYF
	287fVXVA4pHLPLsJDBG2u9cFMVR2hKSr7f4VmBx6aoG6nyGx6pAc+DI9I1YbLlRJs+DxQgoylXH4M
	CggPSNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA6-00000006Mf0-253S;
	Tue, 08 Jul 2025 19:39:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCx-000000067rF-10xx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Jul 2025 17:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eJMM4gK22aDv3MFFXNf/+A9iHfGbg3ILgUYZpd1e1GU=; b=ng2huc8tlie/xDJOvfz6ML3VZw
	7h06Ya4Y3rZHKQQE9zqxDdhSIQHfQcGN22moYq3u2LYGI68qR3k8IuqmKpPrfh3GF2gezSotC/7Nd
	9nLbebUR+azEo3UHqYg+u4bSBKNd1wK6uFXllze7VzJThpcZpjtMU1z9sCzYHAtI2dcOU4A3OnoD8
	dwtGPtzTza07u8Fx1VROXrTuyjj5NuO1Je1Da0+Pf9SDLd8UbmleUqBVoqcgBPvSGoH154V6SmAcN
	NbxEaSYlJpBm9j3Z+Tab8kpJ+W3fwe1MZCkgveOxzmeg9LaM4WuZBOH625kfi5FoAXS2RwYX42Fyr
	v4oEIiKA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCt-00000008lV6-3rPI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA1264690F;
	Tue,  8 Jul 2025 17:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966E5C4CEF7;
	Tue,  8 Jul 2025 17:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996051;
	bh=qWYeb6MF8JBZHzsUTq1buPEorDJbsZ0f2u6J/KVs+2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F2Ez36Kw3qv2a/OFVg6YYk3aw0iaY6ZcOd5VUiZpj55VmM5KtXu7+61Ov0zu7y3e7
	 mHRvAIlq+fZIpnvTMK5WCPl+wY2qW+4+7Awr3vKCZ+bkqhy7dDeq7/oa6In2EHP7ks
	 JS9FmrPjpQw5T7Fy2yR6DpK8NvZJCJd+u7c6GJg24+njISAH8cwZx00PPE431/Utc8
	 wIJP1jElqsBs9zEnJY5ib+xoBTT2VHWB/Rg2v6MdrJmGgP0KM6BHagzCq4PSyepKlB
	 0fNxng2IsrW75KQipYinkBBUCYYmS25crZSSPnuhIdnrjo47XV38+RjnwsRl8OeKFF
	 1jrx/hu7ZI/vA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCn-00Dqhw-Oz;
	Tue, 08 Jul 2025 18:34:09 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 06/13] PCI: xgene-msi: Drop superfluous fields from xgene_msi structure
Date: Tue,  8 Jul 2025 18:33:57 +0100
Message-Id: <20250708173404.1278635-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250708173404.1278635-1-maz@kernel.org>
References: <20250708173404.1278635-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_183416_410229_D70B984D 
X-CRM114-Status: GOOD (  17.97  )
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

The xgene_msi structure remembers both the of_node of the device
and the number of CPUs. All of which are perfectly useless.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene-msi.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index 5b69286689177..50a817920cfd9 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -31,14 +31,12 @@ struct xgene_msi_group {
 };
 
 struct xgene_msi {
-	struct device_node	*node;
 	struct irq_domain	*inner_domain;
 	u64			msi_addr;
 	void __iomem		*msi_regs;
 	unsigned long		*bitmap;
 	struct mutex		bitmap_lock;
 	struct xgene_msi_group	*msi_groups;
-	int			num_cpus;
 };
 
 /* Global data */
@@ -147,7 +145,7 @@ static void xgene_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
  */
 static int hwirq_to_cpu(unsigned long hwirq)
 {
-	return (hwirq % xgene_msi_ctrl.num_cpus);
+	return (hwirq % num_possible_cpus());
 }
 
 static unsigned long hwirq_to_canonical_hwirq(unsigned long hwirq)
@@ -186,9 +184,9 @@ static int xgene_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	mutex_lock(&msi->bitmap_lock);
 
 	msi_irq = bitmap_find_next_zero_area(msi->bitmap, NR_MSI_VEC, 0,
-					     msi->num_cpus, 0);
+					     num_possible_cpus(), 0);
 	if (msi_irq < NR_MSI_VEC)
-		bitmap_set(msi->bitmap, msi_irq, msi->num_cpus);
+		bitmap_set(msi->bitmap, msi_irq, num_possible_cpus());
 	else
 		msi_irq = -ENOSPC;
 
@@ -214,7 +212,7 @@ static void xgene_irq_domain_free(struct irq_domain *domain,
 	mutex_lock(&msi->bitmap_lock);
 
 	hwirq = hwirq_to_canonical_hwirq(d->hwirq);
-	bitmap_clear(msi->bitmap, hwirq, msi->num_cpus);
+	bitmap_clear(msi->bitmap, hwirq, num_possible_cpus());
 
 	mutex_unlock(&msi->bitmap_lock);
 
@@ -235,10 +233,11 @@ static const struct msi_parent_ops xgene_msi_parent_ops = {
 	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
-static int xgene_allocate_domains(struct xgene_msi *msi)
+static int xgene_allocate_domains(struct device_node *node,
+				  struct xgene_msi *msi)
 {
 	struct irq_domain_info info = {
-		.fwnode		= of_fwnode_handle(msi->node),
+		.fwnode		= of_fwnode_handle(node),
 		.ops		= &xgene_msi_domain_ops,
 		.size		= NR_MSI_VEC,
 		.host_data	= msi,
@@ -358,7 +357,7 @@ static int xgene_msi_hwirq_alloc(unsigned int cpu)
 	int i;
 	int err;
 
-	for (i = cpu; i < NR_HW_IRQS; i += msi->num_cpus) {
+	for (i = cpu; i < NR_HW_IRQS; i += num_possible_cpus()) {
 		msi_group = &msi->msi_groups[i];
 
 		/*
@@ -386,7 +385,7 @@ static int xgene_msi_hwirq_free(unsigned int cpu)
 	struct xgene_msi_group *msi_group;
 	int i;
 
-	for (i = cpu; i < NR_HW_IRQS; i += msi->num_cpus) {
+	for (i = cpu; i < NR_HW_IRQS; i += num_possible_cpus()) {
 		msi_group = &msi->msi_groups[i];
 		irq_set_chained_handler_and_data(msi_group->gic_irq, NULL,
 						 NULL);
@@ -417,8 +416,6 @@ static int xgene_msi_probe(struct platform_device *pdev)
 		goto error;
 	}
 	xgene_msi->msi_addr = res->start;
-	xgene_msi->node = pdev->dev.of_node;
-	xgene_msi->num_cpus = num_possible_cpus();
 
 	rc = xgene_msi_init_allocator(xgene_msi);
 	if (rc) {
@@ -426,7 +423,7 @@ static int xgene_msi_probe(struct platform_device *pdev)
 		goto error;
 	}
 
-	rc = xgene_allocate_domains(xgene_msi);
+	rc = xgene_allocate_domains(dev_of_node(&pdev->dev), xgene_msi);
 	if (rc) {
 		dev_err(&pdev->dev, "Failed to allocate MSI domain\n");
 		goto error;
-- 
2.39.2


