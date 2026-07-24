Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EE1C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 17:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56OhdFbtrGPbtnvjaKblmMkf7gy1oQwkzyglwnt8pWQ=; b=bOUnZdqyut4BfNuJCHsZP0fYG+
	I1fFTPftxJHFAVGTdn3zrYXyXZdq/aFrSMuL1NookesUJNRuJfOEe47HreJFIRx4dn+5LR+sH0ZPg
	8+sDhBzDr6Il4Mr5AQVLU2cXrpUhdjCQ69rfbYoFBg6KAonPOViO92Vx/5KtkQnuF1Mv8H/Nqe7So
	pohzQf0KmS8DCw4eb5JPcixTDwDRQETvHg5jeXGyDJBd4qPQljFmKjUFn9DePobaOn9lusIvVYHp/
	oEVt0rScms87za8TQ0FLNq9DNIsuXQ0tIZXY8iGjCL3oPMWrQ5i4AsRVqUVnj3tBe01XJVLdf6Muh
	fSci19lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK1U-0000000GzGk-2GCV;
	Fri, 24 Jul 2026 17:49:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK1H-0000000GzCK-08XL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 17:49:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50D011477;
	Fri, 24 Jul 2026 10:49:05 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C72753F59E;
	Fri, 24 Jul 2026 10:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784915349; bh=sOAtknE64kQUTNFMOaw9rocG6UI46Z9yt36Xikm2sjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r/c8jNgZK9yGxo8gUKll3bilnz+tcGgq5bMKHsPlb8IPMmupVH79rQoHAaAy4nTKO
	 UOflVuLiQzEzBEfOZucQNnFSVpdW5auAmQNbj3M9SXF585DKZzY9WPWxnVYJgGk8Oq
	 JtGZm3WY/zYzwlhPxlmUzTgZBbyIvHx12wCfjC/s=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] perf/arm-cmn: Switch to generic cpumask
Date: Fri, 24 Jul 2026 18:48:59 +0100
Message-ID: <d1303fcc36f937075cde22d28d17cb4d033149ac.1784911757.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1784911757.git.robin.murphy@arm.com>
References: <cover.1784911757.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_104911_181224_44784C06 
X-CRM114-Status: GOOD (  19.31  )
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

With perf core now providing appropriately-sequenced hotplug callbacks
via the new PMU scope, all the state management boilerplate can go,
while the cpumask also takes care of enforcing event affinity.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: No change.

 drivers/perf/arm-cmn.c | 96 ++++++++++--------------------------------
 1 file changed, 23 insertions(+), 73 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 6e5cc4086a9e..10243ac6217d 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -358,17 +358,12 @@ struct arm_cmn {
 	struct arm_cmn_dtc *dtc;
 	unsigned int num_dtcs;
 
-	int cpu;
-	struct hlist_node cpuhp_node;
-
 	struct pmu pmu;
 	struct dentry *debug;
 };
 
 #define to_cmn(p)	container_of(p, struct arm_cmn, pmu)
 
-static int arm_cmn_hp_state;
-
 struct arm_cmn_nodeid {
 	u8 port;
 	u8 dev;
@@ -1322,17 +1317,6 @@ static const struct attribute_group arm_cmn_format_attrs_group = {
 	.attrs = arm_cmn_format_attrs,
 };
 
-static ssize_t arm_cmn_cpumask_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
-{
-	struct arm_cmn *cmn = to_cmn(dev_get_drvdata(dev));
-
-	return cpumap_print_to_pagebuf(true, buf, cpumask_of(cmn->cpu));
-}
-
-static struct device_attribute arm_cmn_cpumask_attr =
-		__ATTR(cpumask, 0444, arm_cmn_cpumask_show, NULL);
-
 static ssize_t arm_cmn_identifier_show(struct device *dev,
 				       struct device_attribute *attr, char *buf)
 {
@@ -1345,7 +1329,6 @@ static struct device_attribute arm_cmn_identifier_attr =
 		__ATTR(identifier, 0444, arm_cmn_identifier_show, NULL);
 
 static struct attribute *arm_cmn_other_attrs[] = {
-	&arm_cmn_cpumask_attr.attr,
 	&arm_cmn_identifier_attr.attr,
 	NULL,
 };
@@ -1779,10 +1762,6 @@ static int arm_cmn_event_init(struct perf_event *event)
 	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
 		return -EINVAL;
 
-	event->cpu = cmn->cpu;
-	if (event->cpu < 0)
-		return -EINVAL;
-
 	type = CMN_EVENT_TYPE(event);
 	/* DTC events (i.e. cycles) already have everything they need */
 	if (type == CMN_TYPE_DTC)
@@ -2008,48 +1987,38 @@ static int arm_cmn_commit_txn(struct pmu *pmu)
 	return 0;
 }
 
-static void arm_cmn_migrate(struct arm_cmn *cmn, unsigned int cpu)
+static bool arm_cmn_migrate(struct arm_cmn *cmn, unsigned int cpu)
 {
-	unsigned int i;
-
-	perf_pmu_migrate_context(&cmn->pmu, cmn->cpu, cpu);
-	for (i = 0; i < cmn->num_dtcs; i++)
-		irq_set_affinity(cmn->dtc[i].irq, cpumask_of(cpu));
-	cmn->cpu = cpu;
+	cmn->pmu.cpumask = cpumask_of(cpu);
+	for (int i = 0; i < cmn->num_dtcs; i++)
+		irq_set_affinity(cmn->dtc[i].irq, cmn->pmu.cpumask);
+	return true;
 }
 
-static int arm_cmn_pmu_online_cpu(unsigned int cpu, struct hlist_node *cpuhp_node)
+static bool arm_cmn_init_cpu(struct pmu *pmu, int cpu)
 {
-	struct arm_cmn *cmn;
-	int node;
+	struct arm_cmn *cmn = to_cmn(pmu);
+	int node = dev_to_node(cmn->dev);
 
-	cmn = hlist_entry_safe(cpuhp_node, struct arm_cmn, cpuhp_node);
-	node = dev_to_node(cmn->dev);
-	if (cpu_to_node(cmn->cpu) != node && cpu_to_node(cpu) == node)
-		arm_cmn_migrate(cmn, cpu);
-	return 0;
+	if (!cpumask_intersects(pmu->cpumask, cpumask_of_node(node)) &&
+	    (cpu_to_node(cpu) == node || cpumask_empty(pmu->cpumask)))
+		return arm_cmn_migrate(cmn, cpu);
+	return false;
 }
 
-static int arm_cmn_pmu_offline_cpu(unsigned int cpu, struct hlist_node *cpuhp_node)
+static bool arm_cmn_exit_cpu(struct pmu *pmu, int cpu)
 {
-	struct arm_cmn *cmn;
+	struct arm_cmn *cmn = to_cmn(pmu);
+	int node = dev_to_node(cmn->dev);
 	unsigned int target;
-	int node;
-
-	cmn = hlist_entry_safe(cpuhp_node, struct arm_cmn, cpuhp_node);
-	if (cpu != cmn->cpu)
-		return 0;
-
-	node = dev_to_node(cmn->dev);
 
 	target = cpumask_any_and_but(cpumask_of_node(node), cpu_online_mask, cpu);
 	if (target >= nr_cpu_ids)
 		target = cpumask_any_but(cpu_online_mask, cpu);
 
 	if (target < nr_cpu_ids)
-		arm_cmn_migrate(cmn, target);
-
-	return 0;
+		return arm_cmn_migrate(cmn, target);
+	return false;
 }
 
 static irqreturn_t arm_cmn_handle_irq(int irq, void *dev_id)
@@ -2101,15 +2070,12 @@ static int arm_cmn_init_irqs(struct arm_cmn *cmn)
 				goto next;
 			}
 		}
+		/* Affinity will get set during PMU registration */
 		err = devm_request_irq(cmn->dev, irq, arm_cmn_handle_irq,
 				       IRQF_NOBALANCING | IRQF_NO_THREAD,
 				       dev_name(cmn->dev), &cmn->dtc[i]);
 		if (err)
 			return err;
-
-		err = irq_set_affinity(irq, cpumask_of(cmn->cpu));
-		if (err)
-			return err;
 	next:
 		; /* isn't C great? */
 	}
@@ -2565,7 +2531,6 @@ static int arm_cmn_probe(struct platform_device *pdev)
 
 	cmn->dev = &pdev->dev;
 	cmn->part = (unsigned long)device_get_match_data(cmn->dev);
-	cmn->cpu = cpumask_local_spread(0, dev_to_node(cmn->dev));
 	platform_set_drvdata(pdev, cmn);
 
 	cfg = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -2610,6 +2575,9 @@ static int arm_cmn_probe(struct platform_device *pdev)
 		.start_txn = arm_cmn_start_txn,
 		.commit_txn = arm_cmn_commit_txn,
 		.cancel_txn = arm_cmn_end_txn,
+		.scope = PERF_PMU_SCOPE_CPUMASK,
+		.init_cpu = arm_cmn_init_cpu,
+		.exit_cpu = arm_cmn_exit_cpu,
 	};
 
 	this_id = atomic_fetch_inc(&id);
@@ -2617,14 +2585,8 @@ static int arm_cmn_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
 
-	err = cpuhp_state_add_instance(arm_cmn_hp_state, &cmn->cpuhp_node);
-	if (err)
-		return err;
-
 	err = perf_pmu_register(&cmn->pmu, name, -1);
-	if (err)
-		cpuhp_state_remove_instance_nocalls(arm_cmn_hp_state, &cmn->cpuhp_node);
-	else
+	if (!err)
 		arm_cmn_debugfs_init(cmn, this_id);
 
 	return err;
@@ -2637,7 +2599,6 @@ static void arm_cmn_remove(struct platform_device *pdev)
 	writel_relaxed(0, cmn->dtc[0].base + CMN_DT_DTC_CTL);
 
 	perf_pmu_unregister(&cmn->pmu);
-	cpuhp_state_remove_instance_nocalls(arm_cmn_hp_state, &cmn->cpuhp_node);
 	debugfs_remove(cmn->debug);
 }
 
@@ -2679,28 +2640,17 @@ static int __init arm_cmn_init(void)
 {
 	int ret;
 
-	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
-				      "perf/arm/cmn:online",
-				      arm_cmn_pmu_online_cpu,
-				      arm_cmn_pmu_offline_cpu);
-	if (ret < 0)
-		return ret;
-
-	arm_cmn_hp_state = ret;
 	arm_cmn_debugfs = debugfs_create_dir("arm-cmn", NULL);
 
 	ret = platform_driver_register(&arm_cmn_driver);
-	if (ret) {
-		cpuhp_remove_multi_state(arm_cmn_hp_state);
+	if (ret)
 		debugfs_remove(arm_cmn_debugfs);
-	}
 	return ret;
 }
 
 static void __exit arm_cmn_exit(void)
 {
 	platform_driver_unregister(&arm_cmn_driver);
-	cpuhp_remove_multi_state(arm_cmn_hp_state);
 	debugfs_remove(arm_cmn_debugfs);
 }
 
-- 
2.54.0.dirty


