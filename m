Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B374DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skPRCDE1HCBbSqTOkyCl3BOrkZpG5vD9RyOgjzCyY2w=; b=npkRFLi8z1pn7xRCBx0nk+tQ+A
	Ec60Iy/UaiJ7jWAabV1x9+BVx3Ljb3JBEsdGyTt1cxEPDvV4NVUXxg1/ONdTzsxXzpFRG4ixV1t/d
	702DyedZ2TeELKzpXDtDcJnic89jYZT+1FmEwec60PyBZ+pGRj4X9a9NbSmLUYkSJ/Atx0WwjMJ5o
	ogSg/QnhBNSTRMgFkGwMwJINtEBITTbpOdiqd+C5THDN3TF++2+pays49rk8h8JyLR6GthjpKUMfF
	9PGmNl3fj84ntLcEVlNVO3yG6OFeI0EDkqyxbXy09IbIBeFB7301wVYWukUYfgr9uXgJYtKcRkZic
	aChMQ6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnk0-00000001NLW-1CsQ;
	Thu, 12 Dec 2024 18:16:48 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYg-00000001Jbm-2YKt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:07 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361f371908so8305865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026705; x=1734631505; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=skPRCDE1HCBbSqTOkyCl3BOrkZpG5vD9RyOgjzCyY2w=;
        b=x18AvgGQN+25W3xmDkKKJEQVUti/ihaxw6Y1VI/98dKp1D6HWSGrqUFJZgnLNApU+Q
         Yxx99zi9q754FtlJxEAsr/PG1hkySctI9ie2Ep+siWLIq5p0N4rlreIJauMls7CYSr6e
         kayQv9tIEBCQbQeBtnep6KVCWNwlpe+HuMf+k17BdWM9F4XotSE7HMu+VGj8LZUNCI0R
         +o1S/G+2rkd7ESLEM6WMw+E58C72lugcRpG6GKabQ3C5JAFJKVwiWEufNQst9IjSqygm
         tlLTPUfnbviLYFjuE1mQbb9aqywhpDldXN2g+vg0HqPq7JOa7kqe80Wp+35CZ6avldbs
         mi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026705; x=1734631505;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skPRCDE1HCBbSqTOkyCl3BOrkZpG5vD9RyOgjzCyY2w=;
        b=mvSyZKZ925aOi7fER05qNnYtw6NxE6UJPLbFt2iorisWuSmZ52WKaPoEtmWMWf/D82
         45r92gFDwGvQ/SQoj4eDSxgg+jCJaVVvZeKz8k3EQUr5MZyCBchYxLDo8WqVKsSehmh4
         p5ApvtjF3YKK2QgKyxiKm00FQKAQdpdtuMM9CkCQ4uRgQ3CP14TvVEWIzlDWRVIwCN6J
         Ng9mt03Pt6ZhkkNeS8ovrO/GGihxF6V0Y2fNPBwJnA8ZfPGCzSuTxPeSwzOX4J0rM6bW
         MqHMabzhxbqU0jnak7enN5b7UDvf4jr3uXsaqHOiOZMSU8AZxTju+ND13mMVoerxFzyB
         ePzg==
X-Forwarded-Encrypted: i=1; AJvYcCU/i50NqrnUhQ3TtXsjU3y1czpS7HmcJ/NLplby7uR8z6fmF4ku6Th2T4iaCF8XUGN/RxaULhIzozU2CP5MV+Yk@lists.infradead.org
X-Gm-Message-State: AOJu0YxHMlMCwbnAbRamU5/SxfJqygqhS8LEvjkKN564ZF6NuG9olct/
	coES/f1LctN6VYpYJYdqn3z9P1bid8qI6bCeyJHB/D0g9+Yxv216D7Lom5m4HfvoUqXeu72+y2b
	a7/ARx+7k2A==
X-Google-Smtp-Source: AGHT+IE1C6qxQTfe+8cdh04qfTCyJPaxhloF3037zF0ykibXAs6bBxJ7FZWGjc9khBTHmnYTXd7662kyVwWhvA==
X-Received: from wmc3.prod.google.com ([2002:a05:600c:6003:b0:435:dde5:2c3b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c12:b0:435:23c:e23e with SMTP id 5b1f17b1804b1-43622833454mr41606225e9.12.1734026704729;
 Thu, 12 Dec 2024 10:05:04 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:34 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-11-smostafa@google.com>
Subject: [RFC PATCH v2 10/58] iommu/arm-smmu-v3: Move common irq code to
 common file
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100506_656872_9AE3B770 
X-CRM114-Status: GOOD (  25.30  )
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

Soon, KVM SMMUv3 driver will support irqs, instead of re-implementing
the architectural bits and the firmware bindings, move this code to
the common file shared with KVM.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-common.c      | 150 +++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 297 +-----------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 159 ++++++++++
 3 files changed, 313 insertions(+), 293 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
index b7bcac51cc7d..d842e592b351 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/acpi.h>
 #include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -22,6 +23,24 @@ static struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ 0, NULL},
 };
 
+static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
+	[EVTQ_MSI_INDEX] = {
+		ARM_SMMU_EVTQ_IRQ_CFG0,
+		ARM_SMMU_EVTQ_IRQ_CFG1,
+		ARM_SMMU_EVTQ_IRQ_CFG2,
+	},
+	[GERROR_MSI_INDEX] = {
+		ARM_SMMU_GERROR_IRQ_CFG0,
+		ARM_SMMU_GERROR_IRQ_CFG1,
+		ARM_SMMU_GERROR_IRQ_CFG2,
+	},
+	[PRIQ_MSI_INDEX] = {
+		ARM_SMMU_PRIQ_IRQ_CFG0,
+		ARM_SMMU_PRIQ_IRQ_CFG1,
+		ARM_SMMU_PRIQ_IRQ_CFG2,
+	},
+};
+
 static void parse_driver_options(struct arm_smmu_device *smmu)
 {
 	int i = 0;
@@ -646,6 +665,137 @@ void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 	writel_relaxed(reg, smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
 }
 
+static void arm_smmu_free_msis(void *data)
+{
+	struct device *dev = data;
+
+	platform_device_msi_free_irqs_all(dev);
+}
+
+static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
+{
+	phys_addr_t doorbell;
+	struct device *dev = msi_desc_to_dev(desc);
+	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
+	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->msi_index];
+
+	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
+	doorbell &= MSI_CFG0_ADDR_MASK;
+
+	writeq_relaxed(doorbell, smmu->base + cfg[0]);
+	writel_relaxed(msg->data, smmu->base + cfg[1]);
+	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
+}
+
+static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
+{
+	int ret, nvec = ARM_SMMU_MAX_MSIS;
+	struct device *dev = smmu->dev;
+
+	/* Clear the MSI address regs */
+	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
+	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
+	else
+		nvec--;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
+		return;
+
+	if (!dev->msi.domain) {
+		dev_info(smmu->dev, "msi_domain absent - falling back to wired irqs\n");
+		return;
+	}
+
+	/* Allocate MSIs for evtq, gerror and priq. Ignore cmdq */
+	ret = platform_device_msi_init_and_alloc_irqs(dev, nvec, arm_smmu_write_msi_msg);
+	if (ret) {
+		dev_warn(dev, "failed to allocate MSIs - falling back to wired irqs\n");
+		return;
+	}
+
+	smmu->evtq.q.irq = msi_get_virq(dev, EVTQ_MSI_INDEX);
+	smmu->gerr_irq = msi_get_virq(dev, GERROR_MSI_INDEX);
+	smmu->priq.q.irq = msi_get_virq(dev, PRIQ_MSI_INDEX);
+
+	/* Add callback to free MSIs on teardown */
+	devm_add_action_or_reset(dev, arm_smmu_free_msis, dev);
+}
+
+void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu,
+				irqreturn_t evtqirq(int irq, void *dev),
+				irqreturn_t gerrorirq(int irq, void *dev),
+				irqreturn_t priirq(int irq, void *dev))
+{
+	int irq, ret;
+
+	arm_smmu_setup_msis(smmu);
+
+	/* Request interrupt lines */
+	irq = smmu->evtq.q.irq;
+	if (irq) {
+		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
+						evtqirq,
+						IRQF_ONESHOT,
+						"arm-smmu-v3-evtq", smmu);
+		if (ret < 0)
+			dev_warn(smmu->dev, "failed to enable evtq irq\n");
+	} else {
+		dev_warn(smmu->dev, "no evtq irq - events will not be reported!\n");
+	}
+
+	irq = smmu->gerr_irq;
+	if (irq) {
+		ret = devm_request_irq(smmu->dev, irq, gerrorirq,
+				       0, "arm-smmu-v3-gerror", smmu);
+		if (ret < 0)
+			dev_warn(smmu->dev, "failed to enable gerror irq\n");
+	} else {
+		dev_warn(smmu->dev, "no gerr irq - errors will not be reported!\n");
+	}
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI) {
+		irq = smmu->priq.q.irq;
+		if (irq) {
+			ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
+							priirq,
+							IRQF_ONESHOT,
+							"arm-smmu-v3-priq",
+							smmu);
+			if (ret < 0)
+				dev_warn(smmu->dev,
+					 "failed to enable priq irq\n");
+		} else {
+			dev_warn(smmu->dev, "no priq irq - PRI will be broken\n");
+		}
+	}
+}
+
+void arm_smmu_probe_irq(struct platform_device *pdev,
+			struct arm_smmu_device *smmu)
+{
+	int irq;
+
+	irq = platform_get_irq_byname_optional(pdev, "combined");
+	if (irq > 0)
+		smmu->combined_irq = irq;
+	else {
+		irq = platform_get_irq_byname_optional(pdev, "eventq");
+		if (irq > 0)
+			smmu->evtq.q.irq = irq;
+
+		irq = platform_get_irq_byname_optional(pdev, "priq");
+		if (irq > 0)
+			smmu->priq.q.irq = irq;
+
+		irq = platform_get_irq_byname_optional(pdev, "gerror");
+		if (irq > 0)
+			smmu->gerr_irq = irq;
+	}
+}
+
 int arm_smmu_register_iommu(struct arm_smmu_device *smmu,
 			    struct iommu_ops *ops, phys_addr_t ioaddr)
 {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index bcefa361f3d3..8234a9754a04 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -12,7 +12,6 @@
 #include <linux/acpi_iort.h>
 #include <linux/bitops.h>
 #include <linux/crash_dump.h>
-#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io-pgtable.h>
@@ -34,35 +33,10 @@ MODULE_PARM_DESC(disable_msipolling,
 static struct iommu_ops arm_smmu_ops;
 static struct iommu_dirty_ops arm_smmu_dirty_ops;
 
-enum arm_smmu_msi_index {
-	EVTQ_MSI_INDEX,
-	GERROR_MSI_INDEX,
-	PRIQ_MSI_INDEX,
-	ARM_SMMU_MAX_MSIS,
-};
-
 #define NUM_ENTRY_QWORDS 8
 static_assert(sizeof(struct arm_smmu_ste) == NUM_ENTRY_QWORDS * sizeof(u64));
 static_assert(sizeof(struct arm_smmu_cd) == NUM_ENTRY_QWORDS * sizeof(u64));
 
-static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
-	[EVTQ_MSI_INDEX] = {
-		ARM_SMMU_EVTQ_IRQ_CFG0,
-		ARM_SMMU_EVTQ_IRQ_CFG1,
-		ARM_SMMU_EVTQ_IRQ_CFG2,
-	},
-	[GERROR_MSI_INDEX] = {
-		ARM_SMMU_GERROR_IRQ_CFG0,
-		ARM_SMMU_GERROR_IRQ_CFG1,
-		ARM_SMMU_GERROR_IRQ_CFG2,
-	},
-	[PRIQ_MSI_INDEX] = {
-		ARM_SMMU_PRIQ_IRQ_CFG0,
-		ARM_SMMU_PRIQ_IRQ_CFG1,
-		ARM_SMMU_PRIQ_IRQ_CFG2,
-	},
-};
-
 DEFINE_XARRAY_ALLOC1(arm_smmu_asid_xa);
 DEFINE_MUTEX(arm_smmu_asid_lock);
 
@@ -70,149 +44,6 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
 				    struct arm_smmu_device *smmu, u32 flags);
 static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master);
 
-/* Low-level queue manipulation functions */
-static bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
-{
-	u32 space, prod, cons;
-
-	prod = Q_IDX(q, q->prod);
-	cons = Q_IDX(q, q->cons);
-
-	if (Q_WRP(q, q->prod) == Q_WRP(q, q->cons))
-		space = (1 << q->max_n_shift) - (prod - cons);
-	else
-		space = cons - prod;
-
-	return space >= n;
-}
-
-static bool queue_full(struct arm_smmu_ll_queue *q)
-{
-	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
-	       Q_WRP(q, q->prod) != Q_WRP(q, q->cons);
-}
-
-static bool queue_empty(struct arm_smmu_ll_queue *q)
-{
-	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
-	       Q_WRP(q, q->prod) == Q_WRP(q, q->cons);
-}
-
-static bool queue_consumed(struct arm_smmu_ll_queue *q, u32 prod)
-{
-	return ((Q_WRP(q, q->cons) == Q_WRP(q, prod)) &&
-		(Q_IDX(q, q->cons) > Q_IDX(q, prod))) ||
-	       ((Q_WRP(q, q->cons) != Q_WRP(q, prod)) &&
-		(Q_IDX(q, q->cons) <= Q_IDX(q, prod)));
-}
-
-static void queue_sync_cons_out(struct arm_smmu_queue *q)
-{
-	/*
-	 * Ensure that all CPU accesses (reads and writes) to the queue
-	 * are complete before we update the cons pointer.
-	 */
-	__iomb();
-	writel_relaxed(q->llq.cons, q->cons_reg);
-}
-
-static void queue_inc_cons(struct arm_smmu_ll_queue *q)
-{
-	u32 cons = (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
-	q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
-}
-
-static void queue_sync_cons_ovf(struct arm_smmu_queue *q)
-{
-	struct arm_smmu_ll_queue *llq = &q->llq;
-
-	if (likely(Q_OVF(llq->prod) == Q_OVF(llq->cons)))
-		return;
-
-	llq->cons = Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
-		      Q_IDX(llq, llq->cons);
-	queue_sync_cons_out(q);
-}
-
-static int queue_sync_prod_in(struct arm_smmu_queue *q)
-{
-	u32 prod;
-	int ret = 0;
-
-	/*
-	 * We can't use the _relaxed() variant here, as we must prevent
-	 * speculative reads of the queue before we have determined that
-	 * prod has indeed moved.
-	 */
-	prod = readl(q->prod_reg);
-
-	if (Q_OVF(prod) != Q_OVF(q->llq.prod))
-		ret = -EOVERFLOW;
-
-	q->llq.prod = prod;
-	return ret;
-}
-
-static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
-{
-	u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
-	return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
-}
-
-static void queue_poll_init(struct arm_smmu_device *smmu,
-			    struct arm_smmu_queue_poll *qp)
-{
-	qp->delay = 1;
-	qp->spin_cnt = 0;
-	qp->wfe = !!(smmu->features & ARM_SMMU_FEAT_SEV);
-	qp->timeout = ktime_add_us(ktime_get(), ARM_SMMU_POLL_TIMEOUT_US);
-}
-
-static int queue_poll(struct arm_smmu_queue_poll *qp)
-{
-	if (ktime_compare(ktime_get(), qp->timeout) > 0)
-		return -ETIMEDOUT;
-
-	if (qp->wfe) {
-		wfe();
-	} else if (++qp->spin_cnt < ARM_SMMU_POLL_SPIN_COUNT) {
-		cpu_relax();
-	} else {
-		udelay(qp->delay);
-		qp->delay *= 2;
-		qp->spin_cnt = 0;
-	}
-
-	return 0;
-}
-
-static void queue_write(__le64 *dst, u64 *src, size_t n_dwords)
-{
-	int i;
-
-	for (i = 0; i < n_dwords; ++i)
-		*dst++ = cpu_to_le64(*src++);
-}
-
-static void queue_read(u64 *dst, __le64 *src, size_t n_dwords)
-{
-	int i;
-
-	for (i = 0; i < n_dwords; ++i)
-		*dst++ = le64_to_cpu(*src++);
-}
-
-static int queue_remove_raw(struct arm_smmu_queue *q, u64 *ent)
-{
-	if (queue_empty(&q->llq))
-		return -EAGAIN;
-
-	queue_read(ent, Q_ENT(q, q->llq.cons), q->ent_dwords);
-	queue_inc_cons(&q->llq);
-	queue_sync_cons_out(q);
-	return 0;
-}
-
 /* High-level queue accessors */
 static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
 {
@@ -3520,111 +3351,6 @@ static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static void arm_smmu_free_msis(void *data)
-{
-	struct device *dev = data;
-
-	platform_device_msi_free_irqs_all(dev);
-}
-
-static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
-{
-	phys_addr_t doorbell;
-	struct device *dev = msi_desc_to_dev(desc);
-	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
-	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->msi_index];
-
-	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
-	doorbell &= MSI_CFG0_ADDR_MASK;
-
-	writeq_relaxed(doorbell, smmu->base + cfg[0]);
-	writel_relaxed(msg->data, smmu->base + cfg[1]);
-	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
-}
-
-static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
-{
-	int ret, nvec = ARM_SMMU_MAX_MSIS;
-	struct device *dev = smmu->dev;
-
-	/* Clear the MSI address regs */
-	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
-	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
-
-	if (smmu->features & ARM_SMMU_FEAT_PRI)
-		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
-	else
-		nvec--;
-
-	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
-		return;
-
-	if (!dev->msi.domain) {
-		dev_info(smmu->dev, "msi_domain absent - falling back to wired irqs\n");
-		return;
-	}
-
-	/* Allocate MSIs for evtq, gerror and priq. Ignore cmdq */
-	ret = platform_device_msi_init_and_alloc_irqs(dev, nvec, arm_smmu_write_msi_msg);
-	if (ret) {
-		dev_warn(dev, "failed to allocate MSIs - falling back to wired irqs\n");
-		return;
-	}
-
-	smmu->evtq.q.irq = msi_get_virq(dev, EVTQ_MSI_INDEX);
-	smmu->gerr_irq = msi_get_virq(dev, GERROR_MSI_INDEX);
-	smmu->priq.q.irq = msi_get_virq(dev, PRIQ_MSI_INDEX);
-
-	/* Add callback to free MSIs on teardown */
-	devm_add_action_or_reset(dev, arm_smmu_free_msis, dev);
-}
-
-static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
-{
-	int irq, ret;
-
-	arm_smmu_setup_msis(smmu);
-
-	/* Request interrupt lines */
-	irq = smmu->evtq.q.irq;
-	if (irq) {
-		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
-						arm_smmu_evtq_thread,
-						IRQF_ONESHOT,
-						"arm-smmu-v3-evtq", smmu);
-		if (ret < 0)
-			dev_warn(smmu->dev, "failed to enable evtq irq\n");
-	} else {
-		dev_warn(smmu->dev, "no evtq irq - events will not be reported!\n");
-	}
-
-	irq = smmu->gerr_irq;
-	if (irq) {
-		ret = devm_request_irq(smmu->dev, irq, arm_smmu_gerror_handler,
-				       0, "arm-smmu-v3-gerror", smmu);
-		if (ret < 0)
-			dev_warn(smmu->dev, "failed to enable gerror irq\n");
-	} else {
-		dev_warn(smmu->dev, "no gerr irq - errors will not be reported!\n");
-	}
-
-	if (smmu->features & ARM_SMMU_FEAT_PRI) {
-		irq = smmu->priq.q.irq;
-		if (irq) {
-			ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
-							arm_smmu_priq_thread,
-							IRQF_ONESHOT,
-							"arm-smmu-v3-priq",
-							smmu);
-			if (ret < 0)
-				dev_warn(smmu->dev,
-					 "failed to enable priq irq\n");
-		} else {
-			dev_warn(smmu->dev, "no priq irq - PRI will be broken\n");
-		}
-	}
-}
-
 static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
@@ -3652,7 +3378,8 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 		if (ret < 0)
 			dev_warn(smmu->dev, "failed to enable combined irq\n");
 	} else
-		arm_smmu_setup_unique_irqs(smmu);
+		arm_smmu_setup_unique_irqs(smmu, arm_smmu_evtq_thread,
+					   arm_smmu_gerror_handler, arm_smmu_priq_thread);
 
 	if (smmu->features & ARM_SMMU_FEAT_PRI)
 		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
@@ -3883,7 +3610,7 @@ static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
 
 static int arm_smmu_device_probe(struct platform_device *pdev)
 {
-	int irq, ret;
+	int ret;
 	struct resource *res;
 	resource_size_t ioaddr;
 	struct arm_smmu_device *smmu;
@@ -3929,24 +3656,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		smmu->page1 = smmu->base;
 	}
 
-	/* Interrupt lines */
-
-	irq = platform_get_irq_byname_optional(pdev, "combined");
-	if (irq > 0)
-		smmu->combined_irq = irq;
-	else {
-		irq = platform_get_irq_byname_optional(pdev, "eventq");
-		if (irq > 0)
-			smmu->evtq.q.irq = irq;
+	arm_smmu_probe_irq(pdev, smmu);
 
-		irq = platform_get_irq_byname_optional(pdev, "priq");
-		if (irq > 0)
-			smmu->priq.q.irq = irq;
-
-		irq = platform_get_irq_byname_optional(pdev, "gerror");
-		if (irq > 0)
-			smmu->gerr_irq = irq;
-	}
 	/* Probe the h/w */
 	ret = arm_smmu_device_hw_probe(smmu);
 	if (ret)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 63545fdf55f9..d91dfe55835d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -8,6 +8,7 @@
 #ifndef _ARM_SMMU_V3_H
 #define _ARM_SMMU_V3_H
 
+#include <linux/delay.h>
 #include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/mmzone.h>
@@ -349,6 +350,13 @@ void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
 				   dma_addr_t l2ptr_dma);
 void arm_smmu_write_strtab(struct arm_smmu_device *smmu);
 
+void arm_smmu_probe_irq(struct platform_device *pdev,
+			struct arm_smmu_device *smmu);
+void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu,
+				irqreturn_t evtqirq(int irq, void *dev),
+				irqreturn_t gerrorirq(int irq, void *dev),
+				irqreturn_t priirq(int irq, void *dev));
+
 int arm_smmu_register_iommu(struct arm_smmu_device *smmu,
 			    struct iommu_ops *ops, phys_addr_t ioaddr);
 void arm_smmu_unregister_iommu(struct arm_smmu_device *smmu);
@@ -425,4 +433,155 @@ tegra241_cmdqv_probe(struct arm_smmu_device *smmu)
 	return ERR_PTR(-ENODEV);
 }
 #endif /* CONFIG_TEGRA241_CMDQV */
+
+/* Queue functions shared with common and kernel drivers */
+static bool __maybe_unused queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
+{
+	u32 space, prod, cons;
+
+	prod = Q_IDX(q, q->prod);
+	cons = Q_IDX(q, q->cons);
+
+	if (Q_WRP(q, q->prod) == Q_WRP(q, q->cons))
+		space = (1 << q->max_n_shift) - (prod - cons);
+	else
+		space = cons - prod;
+
+	return space >= n;
+}
+
+static bool __maybe_unused queue_full(struct arm_smmu_ll_queue *q)
+{
+	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
+	       Q_WRP(q, q->prod) != Q_WRP(q, q->cons);
+}
+
+static bool __maybe_unused queue_empty(struct arm_smmu_ll_queue *q)
+{
+	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
+	       Q_WRP(q, q->prod) == Q_WRP(q, q->cons);
+}
+
+static bool __maybe_unused queue_consumed(struct arm_smmu_ll_queue *q, u32 prod)
+{
+	return ((Q_WRP(q, q->cons) == Q_WRP(q, prod)) &&
+		(Q_IDX(q, q->cons) > Q_IDX(q, prod))) ||
+	       ((Q_WRP(q, q->cons) != Q_WRP(q, prod)) &&
+		(Q_IDX(q, q->cons) <= Q_IDX(q, prod)));
+}
+
+static void __maybe_unused queue_sync_cons_out(struct arm_smmu_queue *q)
+{
+	/*
+	 * Ensure that all CPU accesses (reads and writes) to the queue
+	 * are complete before we update the cons pointer.
+	 */
+	__iomb();
+	writel_relaxed(q->llq.cons, q->cons_reg);
+}
+
+static void __maybe_unused queue_inc_cons(struct arm_smmu_ll_queue *q)
+{
+	u32 cons = (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
+	q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
+}
+
+static void __maybe_unused queue_sync_cons_ovf(struct arm_smmu_queue *q)
+{
+	struct arm_smmu_ll_queue *llq = &q->llq;
+
+	if (likely(Q_OVF(llq->prod) == Q_OVF(llq->cons)))
+		return;
+
+	llq->cons = Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
+		    Q_IDX(llq, llq->cons);
+	queue_sync_cons_out(q);
+}
+
+static int __maybe_unused queue_sync_prod_in(struct arm_smmu_queue *q)
+{
+	u32 prod;
+	int ret = 0;
+
+	/*
+	 * We can't use the _relaxed() variant here, as we must prevent
+	 * speculative reads of the queue before we have determined that
+	 * prod has indeed moved.
+	 */
+	prod = readl(q->prod_reg);
+
+	if (Q_OVF(prod) != Q_OVF(q->llq.prod))
+		ret = -EOVERFLOW;
+
+	q->llq.prod = prod;
+	return ret;
+}
+
+static u32 __maybe_unused queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
+{
+	u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
+	return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
+}
+
+static void __maybe_unused queue_poll_init(struct arm_smmu_device *smmu,
+					   struct arm_smmu_queue_poll *qp)
+{
+	qp->delay = 1;
+	qp->spin_cnt = 0;
+	qp->wfe = !!(smmu->features & ARM_SMMU_FEAT_SEV);
+	qp->timeout = ktime_add_us(ktime_get(), ARM_SMMU_POLL_TIMEOUT_US);
+}
+
+static int __maybe_unused queue_poll(struct arm_smmu_queue_poll *qp)
+{
+	if (ktime_compare(ktime_get(), qp->timeout) > 0)
+		return -ETIMEDOUT;
+
+	if (qp->wfe) {
+		wfe();
+	} else if (++qp->spin_cnt < ARM_SMMU_POLL_SPIN_COUNT) {
+		cpu_relax();
+	} else {
+		udelay(qp->delay);
+		qp->delay *= 2;
+		qp->spin_cnt = 0;
+	}
+
+	return 0;
+}
+
+static void __maybe_unused queue_write(__le64 *dst, u64 *src, size_t n_dwords)
+{
+	int i;
+
+	for (i = 0; i < n_dwords; ++i)
+		*dst++ = cpu_to_le64(*src++);
+}
+
+static void __maybe_unused queue_read(u64 *dst, __le64 *src, size_t n_dwords)
+{
+	int i;
+
+	for (i = 0; i < n_dwords; ++i)
+		*dst++ = le64_to_cpu(*src++);
+}
+
+static int __maybe_unused queue_remove_raw(struct arm_smmu_queue *q, u64 *ent)
+{
+	if (queue_empty(&q->llq))
+		return -EAGAIN;
+
+	queue_read(ent, Q_ENT(q, q->llq.cons), q->ent_dwords);
+	queue_inc_cons(&q->llq);
+	queue_sync_cons_out(q);
+	return 0;
+}
+
+enum arm_smmu_msi_index {
+	EVTQ_MSI_INDEX,
+	GERROR_MSI_INDEX,
+	PRIQ_MSI_INDEX,
+	ARM_SMMU_MAX_MSIS,
+};
+
 #endif /* _ARM_SMMU_V3_H */
-- 
2.47.0.338.g60cca15819-goog


