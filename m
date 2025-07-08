Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F795C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdLmF5lIVGKSuO5vwz/AxMhY4p2NibhEDLPou6WvF6U=; b=ePoCQLXWWcFiL4bj7stuQG+xrK
	WpyssfA2o0vUVXbHNiQvTfI7KGYKwpsaIGgRWcrT4I812XlHLBp+hcy6klAs/M2w8KDNEuOs4cSJa
	cnbH+EXN7Vmztp4ufDD1hCB8M+XAmRSOXcpHWkp7cAqlXeNZwADoNh7Cymkzep6eazs4VjkYjl3Av
	t14XE3mhg1UtALbOmgRREiLXrP3LQHBueWxYALETFkNo+IGyH+ruVq0D8Al7mq8OzZq873ak1o/NM
	6mNj8nanaKFNoBt+LMh8XO+5Nwod7iTWesIRQAEBccOYPMzFqKL8/Q2l565Ye2mqaksILy4QaResm
	m2OjO6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAA-00000006MiZ-1Cq2;
	Tue, 08 Jul 2025 19:39:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCD0-000000067tH-0tmu
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Jul 2025 17:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LdLmF5lIVGKSuO5vwz/AxMhY4p2NibhEDLPou6WvF6U=; b=l2ragZSwepG5ZZh8I1wSHja1aF
	SqrmfJVTUkhV292nOiA6l368LwzqH1YgkhM2dbGfJX/2G3sCJjE6ADiiWFZygv67zCdZPXc75yWUE
	6dvviy26YCxMWZnKsUmxXZDcVmNdGMkxruTCFU7j5dEueUgAiJUvmfKdOkrOIYZGOwEviRxAFRONE
	plsaLuiQ2ZWVb2xcyTn7ZjccnpKC7NYCpIY35XQFZ0jiGLLbXxYMsXX/33UuDIt/NbQPRtAXw0sEa
	tzdg/sZJuFIvrld7kS53G13UcjF25vC/2/wWl7viVs2TU9r/S61pKKat5QOvTSruYud+SlQfdBgnh
	C6J256Aw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCu-00000008lVC-40yH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC7BB46956;
	Tue,  8 Jul 2025 17:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDABEC4CEFA;
	Tue,  8 Jul 2025 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996052;
	bh=6fDBnG3B0k3eKz3zYgAFbJfo6asA8fjCKgUn7vcapoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KKbc7g5t1AmOB88oViPL9AWf3FUX951LqtBCuuGW9YwBwTVcFS5cNGFhNREE/Ah/c
	 64pOfEuSgfR0/rRjCL2DG5Z8vDZ3jrvCvXkxJtJK4G7+Ek7KUlhtn3fmb5wyUaJu/2
	 gMNJvjQZftiHHjYPqwva8+aBVyQN2gEfTze94VeUCHUL+6Dg9yuiai54U2C0yJH+bY
	 LntshdHhG5QNqxwIP8g/FQ9AT8hN7IgZbb+RQ8y1K9UW1Eo/nle+4hMYIS4s5PVkH5
	 h+5wNQGmvEmZ4tqVTa47U6aqs566Ngzf58FPt0QmsxVUmlymykKvs4aG3FF1rBChpG
	 0s5xH8bfdpfMg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCo-00Dqhw-W4;
	Tue, 08 Jul 2025 18:34:11 +0100
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
Subject: [PATCH v2 12/13] PCI: xgene-msi: Restructure handler setup/teardown
Date: Tue,  8 Jul 2025 18:34:03 +0100
Message-Id: <20250708173404.1278635-13-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250708_183417_357188_E177BC86 
X-CRM114-Status: GOOD (  24.70  )
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

Another utterly pointless aspect of the xgene-msi driver is that
it is built around CPU hotplug. Which is quite amusing since this
is one of the few arm64 platforms that, by construction, cannot
do CPU hotplug in a supported way (no EL3, no PSCI, no luck).

Drop the CPU hotplug nonsense and just setup the IRQs and handlers
in a less overdesigned way, grouping things more logically in the
process.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene-msi.c | 107 +++++++++----------------
 1 file changed, 37 insertions(+), 70 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index 243c7721c8799..dd8b119ab90e0 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -231,12 +231,6 @@ static int xgene_allocate_domains(struct device_node *node,
 	return msi->inner_domain ? 0 : -ENOMEM;
 }
 
-static void xgene_free_domains(struct xgene_msi *msi)
-{
-	if (msi->inner_domain)
-		irq_domain_remove(msi->inner_domain);
-}
-
 static int xgene_msi_init_allocator(struct device *dev)
 {
 	xgene_msi_ctrl->bitmap = devm_bitmap_zalloc(dev, NR_MSI_VEC, GFP_KERNEL);
@@ -283,26 +277,48 @@ static void xgene_msi_isr(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static enum cpuhp_state pci_xgene_online;
-
 static void xgene_msi_remove(struct platform_device *pdev)
 {
-	struct xgene_msi *msi = platform_get_drvdata(pdev);
-
-	if (pci_xgene_online)
-		cpuhp_remove_state(pci_xgene_online);
-	cpuhp_remove_state(CPUHP_PCI_XGENE_DEAD);
+	for (int i = 0; i < NR_HW_IRQS; i++) {
+		unsigned int irq = xgene_msi_ctrl->gic_irq[i];
+		if (!irq)
+			continue;
+		irq_set_chained_handler_and_data(irq, NULL, NULL);
+	}
 
-	xgene_free_domains(msi);
+	if (xgene_msi_ctrl->inner_domain)
+		irq_domain_remove(xgene_msi_ctrl->inner_domain);
 }
 
-static int xgene_msi_hwirq_alloc(unsigned int cpu)
+static int xgene_msi_handler_setup(struct platform_device *pdev)
 {
+	struct xgene_msi *xgene_msi = xgene_msi_ctrl;
 	int i;
-	int err;
 
-	for (i = cpu; i < NR_HW_IRQS; i += num_possible_cpus()) {
-		unsigned int irq = xgene_msi_ctrl->gic_irq[i];
+	for (i = 0; i < NR_HW_IRQS; i++) {
+		u32 msi_val;
+		int irq, err;
+
+		/*
+		 * MSInIRx registers are read-to-clear; before registering
+		 * interrupt handlers, read all of them to clear spurious
+		 * interrupts that may occur before the driver is probed.
+		 */
+		for (int msi_idx = 0; msi_idx < IDX_PER_GROUP; msi_idx++)
+			xgene_msi_ir_read(xgene_msi, i, msi_idx);
+
+		/* Read MSIINTn to confirm */
+		msi_val = xgene_msi_int_read(xgene_msi, i);
+		if (msi_val) {
+			dev_err(&pdev->dev, "Failed to clear spurious IRQ\n");
+			return EINVAL;
+		}
+
+		irq = platform_get_irq(pdev, i);
+		if (irq < 0)
+			return irq;
+
+		xgene_msi->gic_irq[i] = irq;
 
 		/*
 		 * Statically allocate MSI GIC IRQs to each CPU core.
@@ -310,7 +326,7 @@ static int xgene_msi_hwirq_alloc(unsigned int cpu)
 		 * to each core.
 		 */
 		irq_set_status_flags(irq, IRQ_NO_BALANCING);
-		err = irq_set_affinity(irq, cpumask_of(cpu));
+		err = irq_set_affinity(irq, cpumask_of(i % num_possible_cpus()));
 		if (err) {
 			pr_err("failed to set affinity for GIC IRQ");
 			return err;
@@ -323,17 +339,6 @@ static int xgene_msi_hwirq_alloc(unsigned int cpu)
 	return 0;
 }
 
-static int xgene_msi_hwirq_free(unsigned int cpu)
-{
-	struct xgene_msi *msi = xgene_msi_ctrl;
-	int i;
-
-	for (i = cpu; i < NR_HW_IRQS; i += num_possible_cpus())
-		irq_set_chained_handler_and_data(msi->gic_irq[i], NULL, NULL);
-
-	return 0;
-}
-
 static const struct of_device_id xgene_msi_match_table[] = {
 	{.compatible = "apm,xgene1-msi"},
 	{},
@@ -343,7 +348,6 @@ static int xgene_msi_probe(struct platform_device *pdev)
 {
 	struct resource *res;
 	struct xgene_msi *xgene_msi;
-	u32 msi_val, msi_idx;
 	int rc;
 
 	xgene_msi_ctrl = devm_kzalloc(&pdev->dev, sizeof(*xgene_msi_ctrl),
@@ -353,8 +357,6 @@ static int xgene_msi_probe(struct platform_device *pdev)
 
 	xgene_msi = xgene_msi_ctrl;
 
-	platform_set_drvdata(pdev, xgene_msi);
-
 	xgene_msi->msi_regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(xgene_msi->msi_regs)) {
 		rc = PTR_ERR(xgene_msi->msi_regs);
@@ -374,48 +376,13 @@ static int xgene_msi_probe(struct platform_device *pdev)
 		goto error;
 	}
 
-	for (int irq_index = 0; irq_index < NR_HW_IRQS; irq_index++) {
-		rc = platform_get_irq(pdev, irq_index);
-		if (rc < 0)
-			goto error;
-
-		xgene_msi->gic_irq[irq_index] = rc;
-	}
-
-	/*
-	 * MSInIRx registers are read-to-clear; before registering
-	 * interrupt handlers, read all of them to clear spurious
-	 * interrupts that may occur before the driver is probed.
-	 */
-	for (int irq_index = 0; irq_index < NR_HW_IRQS; irq_index++) {
-		for (msi_idx = 0; msi_idx < IDX_PER_GROUP; msi_idx++)
-			xgene_msi_ir_read(xgene_msi, irq_index, msi_idx);
-
-		/* Read MSIINTn to confirm */
-		msi_val = xgene_msi_int_read(xgene_msi, irq_index);
-		if (msi_val) {
-			dev_err(&pdev->dev, "Failed to clear spurious IRQ\n");
-			rc = -EINVAL;
-			goto error;
-		}
-	}
-
-	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "pci/xgene:online",
-			       xgene_msi_hwirq_alloc, NULL);
-	if (rc < 0)
-		goto err_cpuhp;
-	pci_xgene_online = rc;
-	rc = cpuhp_setup_state(CPUHP_PCI_XGENE_DEAD, "pci/xgene:dead", NULL,
-			       xgene_msi_hwirq_free);
+	rc = xgene_msi_handler_setup(pdev);
 	if (rc)
-		goto err_cpuhp;
+		goto error;
 
 	dev_info(&pdev->dev, "APM X-Gene PCIe MSI driver loaded\n");
 
 	return 0;
-
-err_cpuhp:
-	dev_err(&pdev->dev, "failed to add CPU MSI notifier\n");
 error:
 	xgene_msi_remove(pdev);
 	return rc;
-- 
2.39.2


