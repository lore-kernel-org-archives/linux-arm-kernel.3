Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB80C83F18
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5il5xxrXyZQBOw/PX+oGKfAGVetJZvMvJ8OhRctSSP4=; b=vvANEf9CdOmTuiHUv6EtVvOVTa
	67jXEPoXR0bmQE+9wSNi8ATkBRsH1DnH2RD8peCRe5wYmidE9ImhftcfJjyN0qszFGWvkpFqGMAXw
	VMzSpNy4/n/B0zBWPoMHwnjc1Pev0Z9V1KfE28Z+56jBIOF7faq7AolNXZos/h42ms3omU86uNxiP
	+XCVJaVMQojoZ4+mrPL1B9+7sBcK6ZjpAp5QP4sCcnwB1VZyUdxge6kPRfuHAOH0/wbtia4ab87EQ
	DSFr/650QVT2S4E4H8TZAhxMd1lqiCOHCBxvRNydZFTSnCRXIQfOEoSmgL0f8coM090FPqAxqJuWC
	9MZRRObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA8-00000006MhU-4C1N;
	Tue, 08 Jul 2025 19:39:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCy-000000067s1-32P6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Jul 2025 17:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5il5xxrXyZQBOw/PX+oGKfAGVetJZvMvJ8OhRctSSP4=; b=cynRgFxoaueb7Ghr1rXqo8n0ma
	sI8ZIfG9B8dOGHVymnhlD6RcWKNsrpJLovTCF1qBpLlf+R2UtpBysit5HsMnoM5hZzePbqRfEi9H7
	ksu9+zZZpdSgSEWPCGn0jCBoMI/1KF/7lUfsc8f9pKuYvr8+c6nIOBexx0odZukL3nOwuwLfZa0fw
	9LOVgb4ySNNxMYNeZdkZyeUOpEZPid1wCrAbQgDdzX/hC9+WU0HZawgpJWggCxW8/T+ONp+fsAu5+
	s4q06frfCfoWr+nvq1d+MMMlu/7UHFXyBiNOyx8t3GXt74kVZp+Bdrygtf//BrtpU/9T2U23K6OJy
	gRmaqN+w==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCu-00000008lVA-1j7q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B42845C36EB;
	Tue,  8 Jul 2025 17:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB03C4CEF5;
	Tue,  8 Jul 2025 17:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996051;
	bh=GcwbIHtYH5IvK/ZrsZkV+WGzeAfxODsrDBcp9MXIE4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s1Ms+XLBKvaS6OLuasxkeCVmVMNaniPuw3GhOy2cJ3HVI1Rugquyb9GV4YaJ0MCZD
	 3Slu0C668w5WomxBFMOFzNjSfRWETgcuXVgCHVG2blIykmf6cK842u8ZxJoF9UWQ1I
	 mRNknRykoC5zeVFaOFjyz4AUL+eOqP8IdZ4m+C6wYsEuGX3WakAmmf43a7QYnrzt+b
	 gE9AAXRktxyXwCXf+D6oexvGl1cFXL3HBbblrEWD/Pw6tf0GcrXDJL/AxV1XaCyURg
	 52KoHQBxdOTW+i3O1KuYhF+WRZdJYt+ITtNTxqrsFe6bpmG4QcT5cgMScAaffvQaGO
	 0PrXnMGGAgN7Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCn-00Dqhw-Ix;
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
Subject: [PATCH v2 05/13] PCI: xgene-msi: Make per-CPU interrupt setup robust
Date: Tue,  8 Jul 2025 18:33:56 +0100
Message-Id: <20250708173404.1278635-6-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250708_183416_916404_3CB91403 
X-CRM114-Status: GOOD (  15.44  )
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

The way the per-CPU interrupts are dealt with in the XGene MSI
driver isn't great:

- the affinity is set after the interrupt is enabled

- nothing prevents userspace from moving the interrupt around

- the affinity setting code pointlessly allocates memory

- the driver checks for conditions that cannot possibly happen

Address all of this in one go, resulting in slightly simpler setup
code.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene-msi.c | 29 ++++++--------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index b05ec8b0bb93f..5b69286689177 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -355,40 +355,26 @@ static int xgene_msi_hwirq_alloc(unsigned int cpu)
 {
 	struct xgene_msi *msi = &xgene_msi_ctrl;
 	struct xgene_msi_group *msi_group;
-	cpumask_var_t mask;
 	int i;
 	int err;
 
 	for (i = cpu; i < NR_HW_IRQS; i += msi->num_cpus) {
 		msi_group = &msi->msi_groups[i];
-		if (!msi_group->gic_irq)
-			continue;
-
-		irq_set_chained_handler_and_data(msi_group->gic_irq,
-			xgene_msi_isr, msi_group);
 
 		/*
 		 * Statically allocate MSI GIC IRQs to each CPU core.
 		 * With 8-core X-Gene v1, 2 MSI GIC IRQs are allocated
 		 * to each core.
 		 */
-		if (alloc_cpumask_var(&mask, GFP_KERNEL)) {
-			cpumask_clear(mask);
-			cpumask_set_cpu(cpu, mask);
-			err = irq_set_affinity(msi_group->gic_irq, mask);
-			if (err)
-				pr_err("failed to set affinity for GIC IRQ");
-			free_cpumask_var(mask);
-		} else {
-			pr_err("failed to alloc CPU mask for affinity\n");
-			err = -EINVAL;
-		}
-
+		irq_set_status_flags(msi_group->gic_irq, IRQ_NO_BALANCING);
+		err = irq_set_affinity(msi_group->gic_irq, cpumask_of(cpu));
 		if (err) {
-			irq_set_chained_handler_and_data(msi_group->gic_irq,
-							 NULL, NULL);
+			pr_err("failed to set affinity for GIC IRQ");
 			return err;
 		}
+
+		irq_set_chained_handler_and_data(msi_group->gic_irq,
+			xgene_msi_isr, msi_group);
 	}
 
 	return 0;
@@ -402,9 +388,6 @@ static int xgene_msi_hwirq_free(unsigned int cpu)
 
 	for (i = cpu; i < NR_HW_IRQS; i += msi->num_cpus) {
 		msi_group = &msi->msi_groups[i];
-		if (!msi_group->gic_irq)
-			continue;
-
 		irq_set_chained_handler_and_data(msi_group->gic_irq, NULL,
 						 NULL);
 	}
-- 
2.39.2


