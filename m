Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E165DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZoDS1HCU/p3bkcDlDk3QGo0E0Pg/gxTjkO2jhIKrd0=; b=TxnQD3SZNbxBRpoHpaZTYXpO+y
	LX7x1kmBmWy3obwkF23BMRRmNHxWGbGrRq3i4wfFSn+ZQkCZqm4QT4GFDYTNXBOTF3l8KVXLQpWd2
	4k0EzdPmgEHyRLeP5YXjFs/TdcH+o0wGQKMG131L+wVjkCOjTHci3UpBNP/tISHAttrBtFE97dPsu
	rMTRHuSMLjFn9meHriLjKQl24u+JiTbNgsbzJLnp5/G2mb+SH9qzCy2kYPMA14UKCuaFb4KD1TFQO
	zbVjUkKjRymFReLWUsVijbZt0ebBOuWlpnQxliny7ZxZqLGMpVgr2Pe86NUUWqCPk2AThuDCwPtv7
	PJPqsOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEruV-0000000CqZX-0XEm;
	Tue, 13 May 2025 15:51:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErir-0000000Coh2-3SPY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 15:39:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 887881E4D;
	Tue, 13 May 2025 08:39:02 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A61D3F63F;
	Tue, 13 May 2025 08:39:12 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com
Subject: [PATCH 3/3] perf/arm-ni: Support sharing IRQs within an NI instance
Date: Tue, 13 May 2025 16:39:00 +0100
Message-Id: <c7ac53d0f608d92d96e4e2827e253a9cb2a337bb.1747149165.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1747149165.git.robin.murphy@arm.com>
References: <cover.1747149165.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_083913_955941_D03D5077 
X-CRM114-Status: GOOD (  17.25  )
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
 drivers/perf/arm-ni.c | 78 ++++++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 27 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 168750e78fc4..ca033c8785ff 100644
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
@@ -593,6 +589,30 @@ static void arm_ni_probe_domain(void __iomem *base, struct arm_ni_node *node)
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
+				goto enable_irq;
+			}
+		}
+		err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
+				       IRQF_NOBALANCING | IRQF_NO_THREAD,
+				       dev_name(ni->dev), cd);
+		if (err)
+			return err;
+
+		irq_set_affinity(cd->irq, cpumask_of(ni->cpu));
+enable_irq:
+		writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENSET);
+	}
+	return 0;
+}
+
 static int arm_ni_probe(struct platform_device *pdev)
 {
 	struct arm_ni_node cfg, vd, pd, cd;
@@ -677,7 +697,11 @@ static int arm_ni_probe(struct platform_device *pdev)
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


