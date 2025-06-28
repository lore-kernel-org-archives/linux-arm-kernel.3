Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20405C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 17:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSF+BAWExLaga50a4p3A9KTHz6gdxHI+8pN/dL9VBGE=; b=Giah9mxfYHxf/Vit9mmOeNNu8a
	v9sypaOxijTdbZ2Yhz5SQVnIaO4GQBDT0HvQx3OWPT6U0QWculEm41LnQKlfOW2rObwFTyWA3+EGf
	Q2QHt9AssBMlNue05jEU9baPSXqsVHN1B9bYLylMgOfAn8C1MjN+HUnCg9WFagRqiJ+Ghj/Fp9Zla
	ilJD33VfeQJto8q6BBJESwr4bpMdHKU+lfq5kLOaQbPb8chCxT8hOQ0ZubkZihDeObn+JF4NlqMaV
	QnCm7IyWeMc0i9pRaHTNTS8oweBTo9JH3HOxK9qnbujWZe7C603zJNLfy418qiJeaRHA69IoPCzKm
	vt1kIKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZbc-0000000H9XO-29Bi;
	Sat, 28 Jun 2025 17:44:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZNl-0000000H7UM-2MRb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 17:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30F80463EE;
	Sat, 28 Jun 2025 17:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1060AC4CEEA;
	Sat, 28 Jun 2025 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751131829;
	bh=JZyJGXIu/4I+riiflFUcQzbvQss2UZj5eTHZTtcmb0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LO9h/GJi2Ir33taGZccJ/ya3WyPfw3E0QPo2kAy/N58uMiARZCXYxj+35Jsu0zvOV
	 8ReuFVXfP3eQxrBmNvIxe0PwjwCx/OFjjNN1Gc0/n7pyXP+Cd5COgAJzJFDd7fWOGl
	 vA/FVG/OytThgFLMC9LqWitbUTkbWRYCbm4tv7pci7FlCrX+3grl8vhygo6nhCdvo/
	 eOE0Tz5JHJCrvCLFGY5U11ZEqEi2YBNclLmINOZY4n6JQT111b4c66JMTQmZC14pTb
	 qENINSVmIEI9zJI+ptMIMzrqJNx8L/VSXu0sE8+X4uHMUH+8jxdFwxpAyps7FtycTK
	 7exj2AVFw0vJw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uVZNj-00AqZC-8P;
	Sat, 28 Jun 2025 18:30:27 +0100
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
Subject: [PATCH 07/12] PCI: xgene-msi: Use device-managed memory allocations
Date: Sat, 28 Jun 2025 18:30:00 +0100
Message-Id: <20250628173005.445013-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250628173005.445013-1-maz@kernel.org>
References: <20250628173005.445013-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_103029_646738_6CD569F9 
X-CRM114-Status: GOOD (  17.13  )
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

Since the MSI driver is probed as a platform device, there is no
reason to not use device-managed allocations. That's including
the top-level bookkeeping structure, which is better dynamically
alocated than being static.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene-msi.c | 37 +++++++++++++-------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index 3ca9a13cf38d3..b3ac0125b3b40 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -40,7 +40,7 @@ struct xgene_msi {
 };
 
 /* Global data */
-static struct xgene_msi xgene_msi_ctrl;
+static struct xgene_msi *xgene_msi_ctrl;
 
 /*
  * X-Gene v1 has 16 groups of MSI termination registers MSInIRx, where
@@ -253,18 +253,18 @@ static void xgene_free_domains(struct xgene_msi *msi)
 		irq_domain_remove(msi->inner_domain);
 }
 
-static int xgene_msi_init_allocator(struct xgene_msi *xgene_msi)
+static int xgene_msi_init_allocator(struct device *dev)
 {
-	xgene_msi->bitmap = bitmap_zalloc(NR_MSI_VEC, GFP_KERNEL);
-	if (!xgene_msi->bitmap)
+	xgene_msi_ctrl->bitmap = devm_bitmap_zalloc(dev, NR_MSI_VEC, GFP_KERNEL);
+	if (!xgene_msi_ctrl->bitmap)
 		return -ENOMEM;
 
-	mutex_init(&xgene_msi->bitmap_lock);
+	mutex_init(&xgene_msi_ctrl->bitmap_lock);
 
-	xgene_msi->msi_groups = kcalloc(NR_HW_IRQS,
-					sizeof(struct xgene_msi_group),
-					GFP_KERNEL);
-	if (!xgene_msi->msi_groups)
+	xgene_msi_ctrl->msi_groups = devm_kcalloc(dev, NR_HW_IRQS,
+						  sizeof(struct xgene_msi_group),
+						  GFP_KERNEL);
+	if (!xgene_msi_ctrl->msi_groups)
 		return -ENOMEM;
 
 	return 0;
@@ -273,15 +273,14 @@ static int xgene_msi_init_allocator(struct xgene_msi *xgene_msi)
 static void xgene_msi_isr(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct xgene_msi *xgene_msi = xgene_msi_ctrl;
 	struct xgene_msi_group *msi_groups;
-	struct xgene_msi *xgene_msi;
 	int msir_index, msir_val, hw_irq, ret;
 	u32 intr_index, grp_select, msi_grp;
 
 	chained_irq_enter(chip, desc);
 
 	msi_groups = irq_desc_get_handler_data(desc);
-	xgene_msi = msi_groups->msi;
 	msi_grp = msi_groups->msi_grp;
 
 	/*
@@ -344,15 +343,12 @@ static void xgene_msi_remove(struct platform_device *pdev)
 
 	kfree(msi->msi_groups);
 
-	bitmap_free(msi->bitmap);
-	msi->bitmap = NULL;
-
 	xgene_free_domains(msi);
 }
 
 static int xgene_msi_hwirq_alloc(unsigned int cpu)
 {
-	struct xgene_msi *msi = &xgene_msi_ctrl;
+	struct xgene_msi *msi = xgene_msi_ctrl;
 	struct xgene_msi_group *msi_group;
 	int i;
 	int err;
@@ -381,7 +377,7 @@ static int xgene_msi_hwirq_alloc(unsigned int cpu)
 
 static int xgene_msi_hwirq_free(unsigned int cpu)
 {
-	struct xgene_msi *msi = &xgene_msi_ctrl;
+	struct xgene_msi *msi = xgene_msi_ctrl;
 	struct xgene_msi_group *msi_group;
 	int i;
 
@@ -408,7 +404,12 @@ static int xgene_msi_probe(struct platform_device *pdev)
 	int virt_msir;
 	u32 msi_val, msi_idx;
 
-	xgene_msi = &xgene_msi_ctrl;
+	xgene_msi_ctrl = devm_kzalloc(&pdev->dev, sizeof(*xgene_msi_ctrl),
+				      GFP_KERNEL);
+	if (!xgene_msi_ctrl)
+		return -ENOMEM;
+
+	xgene_msi = xgene_msi_ctrl;
 
 	platform_set_drvdata(pdev, xgene_msi);
 
@@ -419,7 +420,7 @@ static int xgene_msi_probe(struct platform_device *pdev)
 	}
 	xgene_msi->msi_addr = res->start;
 
-	rc = xgene_msi_init_allocator(xgene_msi);
+	rc = xgene_msi_init_allocator(&pdev->dev);
 	if (rc) {
 		dev_err(&pdev->dev, "Error allocating MSI bitmap\n");
 		goto error;
-- 
2.39.2


