Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F35C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igBDrPgeF7zw7cysjaIjY2opgQPtN9f1PRK9cX/bWGk=; b=jeKxwkRJHYYP2gpndPY/nHpUYx
	ir/ErQ2pSpNZkyl7wv3RpYDWN74hr9b2qafSmFzBc1YX6V4kAEnhczZ2N22MN9p9hOfoE1lCM4YqA
	cJ6dFeVvEKh8q48Dvodwcd1AWkPQLHU2m3pYvdhqg7o0qsDtWutLNpaADiwmp1vbuPhB2NZ1B8JaD
	ktHQ7FfwNzSWcI64WcsvBDJni6Glu2/ETb3M7vFWq644ihcNq4a3JrZM4HvpLYEdHtT9MEvQYLPHm
	sE3CTV+q/Gp7/Sf5+tnyMLqhtcxiQBJp4sfJQAPkYLzW7ShQ5voMWOX8/8X7INrMwzmDj/nSynRhs
	eRMHeMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIRB-0000000FVFy-3G1U;
	Fri, 11 Jul 2025 18:25:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIHX-0000000FUBU-1fXp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:15:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C2BB16F8;
	Fri, 11 Jul 2025 11:15:24 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C07BD3F6A8;
	Fri, 11 Jul 2025 11:15:33 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com
Subject: [PATCH v2 2/2] perf/arm-ni: Support sharing IRQs within an NI instance
Date: Fri, 11 Jul 2025 19:15:17 +0100
Message-Id: <f62db639d3b54c959ec477db7b8ccecbef1ca310.1752256072.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1752256072.git.robin.murphy@arm.com>
References: <cover.1752256072.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_111535_529244_F963A27A 
X-CRM114-Status: GOOD (  18.00  )
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

From: Shouping Wang <allen.wang@hj-micro.com>

NI-700 has a distinct PMU interrupt output for each Clock Domain,
however some integrations may still combine these together externally.
The initial driver didn't attempt to support this, in anticipation of a
more general solution for IRQ sharing between system PMU instances, but
that's still a way off, so let's make this intermediate step for now to
at least allow sharing IRQs within an individual NI instance.

Now that CPU affinity and migration are cleaned up, it's fairly
straightforward to adopt similar logic to arm-cmn, to identify CDs with
a common interrupt and loop over them directly in the handler.

Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
[ rm: Rework for affinity handling, cosmetics, new commit message ]
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: Delay enabling IRQs for the sake of reasoning

 drivers/perf/arm-ni.c | 82 +++++++++++++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 27 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 168750e78fc4..3c505352e302 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -102,6 +102,7 @@ struct arm_ni_unit {
 struct arm_ni_cd {
 	void __iomem *pmu_base;
 	u16 id;
+	s8 irq_friend;
 	int num_units;
 	int irq;
 	struct pmu pmu;
@@ -448,33 +449,37 @@ static irqreturn_t arm_ni_handle_irq(int irq, void *dev_id)
 {
 	struct arm_ni_cd *cd = dev_id;
 	irqreturn_t ret = IRQ_NONE;
-	u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
 
-	if (reg & (1U << NI_CCNT_IDX)) {
-		ret = IRQ_HANDLED;
-		if (!(WARN_ON(!cd->ccnt))) {
-			arm_ni_event_read(cd->ccnt);
-			arm_ni_init_ccnt(cd);
+	for (;;) {
+		u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
+
+		if (reg & (1U << NI_CCNT_IDX)) {
+			ret = IRQ_HANDLED;
+			if (!(WARN_ON(!cd->ccnt))) {
+				arm_ni_event_read(cd->ccnt);
+				arm_ni_init_ccnt(cd);
+			}
 		}
-	}
-	for (int i = 0; i < NI_NUM_COUNTERS; i++) {
-		if (!(reg & (1U << i)))
-			continue;
-		ret = IRQ_HANDLED;
-		if (!(WARN_ON(!cd->evcnt[i]))) {
-			arm_ni_event_read(cd->evcnt[i]);
-			arm_ni_init_evcnt(cd, i);
+		for (int i = 0; i < NI_NUM_COUNTERS; i++) {
+			if (!(reg & (1U << i)))
+				continue;
+			ret = IRQ_HANDLED;
+			if (!(WARN_ON(!cd->evcnt[i]))) {
+				arm_ni_event_read(cd->evcnt[i]);
+				arm_ni_init_evcnt(cd, i);
+			}
 		}
+		writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
+		if (!cd->irq_friend)
+			return ret;
+		cd += cd->irq_friend;
 	}
-	writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
-	return ret;
 }
 
 static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_start)
 {
 	struct arm_ni_cd *cd = ni->cds + node->id;
 	const char *name;
-	int err;
 
 	cd->id = node->id;
 	cd->num_units = node->num_components;
@@ -534,20 +539,11 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 		       cd->pmu_base + NI_PMCR);
 	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMCNTENCLR);
 	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMOVSCLR);
-	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENSET);
 
 	cd->irq = platform_get_irq(to_platform_device(ni->dev), cd->id);
 	if (cd->irq < 0)
 		return cd->irq;
 
-	err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
-			       IRQF_NOBALANCING | IRQF_NO_THREAD,
-			       dev_name(ni->dev), cd);
-	if (err)
-		return err;
-
-	irq_set_affinity(cd->irq, cpumask_of(ni->cpu));
-
 	cd->pmu = (struct pmu) {
 		.module = THIS_MODULE,
 		.parent = ni->dev,
@@ -593,6 +589,34 @@ static void arm_ni_probe_domain(void __iomem *base, struct arm_ni_node *node)
 	node->num_components = readl_relaxed(base + NI_CHILD_NODE_INFO);
 }
 
+static int arm_ni_init_irqs(struct arm_ni *ni)
+{
+	int err;
+
+	ni_for_each_cd(ni, cd) {
+		for (struct arm_ni_cd *prev = cd; prev-- > ni->cds; ) {
+			if (prev->irq == cd->irq) {
+				prev->irq_friend = cd - prev;
+				goto set_inten;
+			}
+		}
+		err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
+				       IRQF_NOBALANCING | IRQF_NO_THREAD | IRQF_NO_AUTOEN,
+				       dev_name(ni->dev), cd);
+		if (err)
+			return err;
+
+		irq_set_affinity(cd->irq, cpumask_of(ni->cpu));
+set_inten:
+		writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENSET);
+	}
+	/* Look Ma, no absurdly theoretical race conditions! */
+	ni_for_each_cd(ni, cd)
+		if (!cd->irq_friend)
+			enable_irq(cd->irq);
+	return 0;
+}
+
 static int arm_ni_probe(struct platform_device *pdev)
 {
 	struct arm_ni_node cfg, vd, pd, cd;
@@ -677,7 +701,11 @@ static int arm_ni_probe(struct platform_device *pdev)
 		}
 	}
 
-	return 0;
+	ret = arm_ni_init_irqs(ni);
+	if (ret)
+		arm_ni_remove(pdev);
+
+	return ret;
 }
 
 #ifdef CONFIG_OF
-- 
2.39.2.101.g768bb238c484.dirty


