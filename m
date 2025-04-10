Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078CDC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXnN/jSE0qRy72K/iNpWMtM5JNQccqWAQlrX93rjQJI=; b=AyBBjnumHMlxucP6+ozQVtbzS7
	Cfv5t4e2XhiEpVdkC2DvCYZBh6EmQtNXGZxcReQLFNK1k7GhbqIxAJjc1MlEaKH54jB9yzrYNHrf+
	xSAQ2FrtJuehM7hFZ7R0nn5Gxl/Jm6qtOzoC6KEXesQkYrrhktv4DX6bYhrpibP2TowLxt/wESo3/
	Pq6S428zzwluXu61gSdq/x0l9K0fnfVmA2QEAl/IjkefjNFbETvyEhe+HV6Wv5GXKpzIT+i0OBWEC
	gjIiwbL3HlHcSPBae5Owpm7V1pYowbGhEYTaSE36X9n9BpYsad9YXzAJD/CFeZe95zLIN4eWcyhua
	u9GGLCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2riL-0000000AceY-0jh9;
	Thu, 10 Apr 2025 13:13:05 +0000
Received: from mail-m15589.qiye.163.com ([101.71.155.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qXF-0000000AOqt-2Fuq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 11:57:34 +0000
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11665dc58;
	Thu, 10 Apr 2025 19:42:29 +0800 (GMT+08:00)
From: Shouping Wang <allen.wang@hj-micro.com>
To: will@kernel.org
Cc: robin.murphy@arm.com,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com
Subject: [PATCH 2/2] perf:arm-ni: support PMUs to share IRQs for different clock domains
Date: Thu, 10 Apr 2025 19:42:14 +0800
Message-ID: <20250410114214.1599777-3-allen.wang@hj-micro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410114214.1599777-1-allen.wang@hj-micro.com>
References: <20250410114214.1599777-1-allen.wang@hj-micro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0xLVk9CH0kYSRlKTktNGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a961f8235f009d9kunm11665dc58
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MAg6EBw4IjIDSzcPEE4aTDY2
	IjkKFDZVSlVKTE9PSUNOSE5LSE9JVTMWGhIXVRoXFx4VVQwaFRw7ExFWFhIYCRRVGBQWRVlXWRIL
	WUFZSklJVUlJT1VKT0xVSk5DWVdZCAFZQU9CQk43Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_045733_778776_F689FF8F 
X-CRM114-Status: GOOD (  17.85  )
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

The ARM NI700 contains multiple clock domains, each with a PMU.
In some hardware implementations, these PMUs under the same device
share a common interrupt line. The current codes implementation
only supports requesting a separate IRQ for each clock domain's PMU.

Here, a single interrupt handler is registered for shared interrupt.
Within this handler, the interrupt status of all PMUs sharing the
interrupt is checked.

Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
---
 drivers/perf/arm-ni.c | 77 +++++++++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 24 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 3f3d2e0f91fa..611085e89436 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -104,6 +104,7 @@ struct arm_ni_cd {
 	u16 id;
 	int num_units;
 	int irq;
+	s8 irq_friend;
 	int cpu;
 	struct hlist_node cpuhp_node;
 	struct pmu pmu;
@@ -446,26 +447,31 @@ static irqreturn_t arm_ni_handle_irq(int irq, void *dev_id)
 {
 	struct arm_ni_cd *cd = dev_id;
 	irqreturn_t ret = IRQ_NONE;
-	u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
+	u32 reg;
 
-	if (reg & (1U << NI_CCNT_IDX)) {
-		ret = IRQ_HANDLED;
-		if (!(WARN_ON(!cd->ccnt))) {
-			arm_ni_event_read(cd->ccnt);
-			arm_ni_init_ccnt(cd);
+	for (;;) {
+		reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
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
@@ -538,12 +544,6 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 	if (cd->irq < 0)
 		return cd->irq;
 
-	err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
-			       IRQF_NOBALANCING | IRQF_NO_THREAD,
-			       dev_name(ni->dev), cd);
-	if (err)
-		return err;
-
 	cd->cpu = cpumask_local_spread(0, dev_to_node(ni->dev));
 	cd->pmu = (struct pmu) {
 		.module = THIS_MODULE,
@@ -603,6 +603,30 @@ static void arm_ni_probe_domain(void __iomem *base, struct arm_ni_node *node)
 	node->num_components = readl_relaxed(base + NI_CHILD_NODE_INFO);
 }
 
+static int arm_ni_irq_init(struct arm_ni *ni)
+{
+	int irq;
+	int err = 0;
+
+	for (int i = 0; i < ni->num_cds; i++) {
+		irq = ni->cds[i].irq;
+		for (int j = i; j--; ) {
+			if (ni->cds[j].irq == irq) {
+				ni->cds[j].irq_friend = i-j;
+				goto next;
+			}
+		}
+		err =  devm_request_irq(ni->dev, irq, arm_ni_handle_irq,
+					IRQF_NOBALANCING | IRQF_NO_THREAD,
+					 dev_name(ni->dev), &ni->cds[i]);
+		if (err)
+			return err;
+next:
+		;
+	}
+	return 0;
+}
+
 static int arm_ni_probe(struct platform_device *pdev)
 {
 	struct arm_ni_node cfg, vd, pd, cd;
@@ -611,6 +635,7 @@ static int arm_ni_probe(struct platform_device *pdev)
 	void __iomem *base;
 	static atomic_t id;
 	int num_cds;
+	int ret;
 	u32 reg, part;
 
 	/*
@@ -669,8 +694,6 @@ static int arm_ni_probe(struct platform_device *pdev)
 			reg = readl_relaxed(vd.base + NI_CHILD_PTR(p));
 			arm_ni_probe_domain(base + reg, &pd);
 			for (int c = 0; c < pd.num_components; c++) {
-				int ret;
-
 				reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
 				arm_ni_probe_domain(base + reg, &cd);
 				ret = arm_ni_init_cd(ni, &cd, res->start);
@@ -683,6 +706,12 @@ static int arm_ni_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = arm_ni_irq_init(ni);
+	if (ret) {
+		arm_ni_remove(pdev);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


