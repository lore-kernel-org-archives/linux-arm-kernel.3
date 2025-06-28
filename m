Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBB3C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 17:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gn9GefP+qNLThIzM0POqbSXwodmMpyG9e0idq1NUCE=; b=M9G6SpGFD3pEAXmT4nosz/3JV9
	EBFHdwbfvl9te8qnypLYBgTfDbeB2Z4sP0voGIAKPJ/xNUzFZE4x713gPqwqGvGj79AVQVhC4EKal
	N2lmp66eL7xMCj6fuKS0hVcT/6CulCcdn+1RIQEMHPNaem9EZefWouMPUF893TpWAbOTdG/FNngl3
	bZrOi1aBzrgNQO6rMnKvetxGA7oe35WLLjEqk/agZnnG1CRZt6t49NO8mQKbRt0y8gY11lrSZ4HkA
	q9Ws3c1kqEExAm2Q1VvYdgmWFjull65uL28CGlDLWEHXMasIu/1U9AS/+B51JQO+u4hk20DEdO60/
	lLNYzx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZdu-0000000H9gd-1CyR;
	Sat, 28 Jun 2025 17:47:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZNl-0000000H7Ti-25oN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 17:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9561463FD;
	Sat, 28 Jun 2025 17:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A4BC4AF0B;
	Sat, 28 Jun 2025 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751131828;
	bh=sLHbDjMOHIJK5FmjK2GBYLynXvuhrJcJu9u/Pnuu0t4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UBUd/rwbkcwGj5oOKCjOnDc9IgcnMsAY4+78S/j83PoJA0drmiifTAZmie46L9sve
	 TVtvum5fmrJBq2JukTpUK2Nxs2PaoE4gb4rVig4COzT4niYnlb5VUw8Nv3bCgmGWtW
	 wJFe1AkOBpGnxUYXdphSzijlgXK8AUlFoxU8QPDExqscFE7mvIjvpr5hM5jwHwi2Dj
	 FxXPi3DhI4ngIf5UQxJRAbfRFJabxae+5pCjVfUdkXdQoEFOH0VMtFYbavb2MUbBor
	 FKanDCFZDNnDdGS6yfN2zx8TecQOEKCLP1HFniAxUsHGLQQEUIIReg/Xb6px5dxMl2
	 wd4udbWxBy5Aw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uVZNi-00AqZC-OS;
	Sat, 28 Jun 2025 18:30:26 +0100
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
Subject: [PATCH 05/12] PCI: xgene-msi: Make per-CPU interrupt setup robust
Date: Sat, 28 Jun 2025 18:29:58 +0100
Message-Id: <20250628173005.445013-6-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250628_103029_611393_5E0F6350 
X-CRM114-Status: GOOD (  14.41  )
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
 drivers/pci/controller/pci-xgene-msi.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index b05ec8b0bb93f..25cb4119bab07 100644
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
-- 
2.39.2


