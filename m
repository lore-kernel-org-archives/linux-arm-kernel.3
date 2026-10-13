Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7B8CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 18:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19JxaAG8/HI6lbc9IVe7CO4geNuRT0i/vZopAR0ANuU=; b=zQG2cUvKKGdxq01Jwfj4NhFd5j
	G7VRzky3lKQjV5G4/vo0Or3T03OV4m0e+ke+8lFBsWkv6hHf7LqLpwVYf2clXsjEVcvkoCfvTez0R
	4b6Rsaa3HY3QLqR1zTeDON6ExD1Mao9f2w0b391IJHHkLicK1qALK5beoNigrn6yLlQGMgW5KeA0W
	nuzWohP94MEktDmcAbSBBJiz5LCneQQe47a70OLYl1wSDrjRfMjR6yIkZtjXGs97FIEFl87MUv9+V
	53lRunHkMxy+RL6ptf2YKto94rZVZpCIx7iw5peJbFOBTNSdfKFWvPqqD75+a+D5wpwIcc6QMjjf2
	RSe7Togg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhg5-0000000DsJM-0hTp;
	Tue, 13 Oct 2026 18:56:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhg4-0000000DsIm-1pga
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 18:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=19JxaAG8/HI6lbc9IVe7CO4geNuRT0i/vZopAR0ANuU=; b=qcGFk7IrKoL+NJ4DMukJC0iqB8
	wMXsOcZVL8dysy7nMUOPMhrWvCKYBIm2rvoeCLYMPBX1uVaxLAkQh8xhqKQlcVRY/frgJZSYsKm56
	ySYwiVuJ6O1IvPp2wrDgCAQ5ojCnj5KlDeToLcfRl1NcRCznlgB9pld/+hyoNUHroBbFS9gMRfr2B
	I+8LcnK6QgOTutapXOmwUT6udZtzqnXikb9GEGHk7YYPXtPW8arh1/hFJSV+46Im+PYN2QidcVxxt
	F15n1AV5/ED5zlZdlCYRErZ5GF4EFP7VzkpHzP29bPwf5eeBAOGK9/5ksPKTmW9hCCuAf+6YI3cNL
	CPTj1Rjg==;
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGhg0-0000000FxLa-0pea
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 18:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791917800; x=1823453800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=19JxaAG8/HI6lbc9IVe7CO4geNuRT0i/vZopAR0ANuU=;
  b=dBwG8VabHowriG9KSX7JclrBKsxmxbYi78DRz0vT09N4+jHhbpWss+Bu
   zEK1MHX+PuGywQe7DpMmdbox2zlTMtoG+CqGl+q2VSU0lGGrDoknfAwLz
   T1bbstLLNn5BducXBCKtUKnwJPglGbyWv9+9BO1QJeSzSr1B93mUegvu3
   7tTiYFtlWLp77xFmz1B7cybhR2TGBdqYUi4FKMpEFyAT/FcZGkq/txBOT
   0Px/BNTHMcjvNdz9ly8m1CHyeJFVA2j9T0nM3iR+MRQvw9mcrymsG3FJP
   jE70dmmR7h+qaa5m28EwtsBvzhU8jZ1KUNhnh6uoQkORMVRBEWodkrTd3
   g==;
X-CSE-ConnectionGUID: IP7drwJ6TR6VbYrPP3OiCA==
X-CSE-MsgGUID: ITnK4KjjR9m0aQE1cBlYvg==
X-IronPort-AV: E=Sophos;i="6.27,156,1787011200"; 
   d="scan'208";a="30939256"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 18:56:39 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:5287]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.56.108:2525] with esmtp (Farcaster)
 id fe19b1d2-d3af-451c-9f56-1f65b7499215; Tue, 13 Oct 2026 18:56:39 +0000 (UTC)
X-Farcaster-Flow-ID: fe19b1d2-d3af-451c-9f56-1f65b7499215
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 13 Oct 2026 18:56:39 +0000
Received: from u34cccd802f2d52.amazon.com (10.187.170.30) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 13 Oct 2026 18:56:37 +0000
From: Haris Okanovic <harisokn@amazon.com>
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
	<jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
	<adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <harisokn@amazon.com>
Subject: [PATCH 4/4] perf/arm-cmn: Convert to PERF_PMU_SCOPE_DEVICE
Date: Tue, 13 Oct 2026 13:56:03 -0500
Message-ID: <20261013185603.1347265-5-harisokn@amazon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013185603.1347265-1-harisokn@amazon.com>
References: <20261013185603.1347265-1-harisokn@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.187.170.30]
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_195640_824451_76C270EC 
X-CRM114-Status: GOOD (  22.71  )
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

Set pmu::scope to PERF_PMU_SCOPE_DEVICE and remove the driver-tracked cpu,
hotplug hooks, and the 'cpumask' attribute, since perf core does this
for device scope PMUs.

Define a filter_allowed_cpus() callback to keep preference for CPUs local
to the interconnect's NUMA node, and a migrate_cpu() callback to update
DTC interrupt affinity on migration.

Signed-off-by: Haris Okanovic <harisokn@amazon.com>
---
 drivers/perf/arm-cmn.c | 104 +++++++++--------------------------------
 1 file changed, 22 insertions(+), 82 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 5378fba916cf5..997ee5adf3f8e 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -388,17 +388,12 @@ struct arm_cmn {
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
@@ -1511,17 +1506,6 @@ static const struct attribute_group arm_cmn_format_attrs_group = {
 	.attrs = arm_cmn_format_attrs,
 };
 
-static ssize_t arm_cmn_cpumask_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
-{
-	struct arm_cmn *cmn = to_cmn(dev_get_drvdata(dev));
-
-	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpumask_of(cmn->cpu)));
-}
-
-static struct device_attribute arm_cmn_cpumask_attr =
-		__ATTR(cpumask, 0444, arm_cmn_cpumask_show, NULL);
-
 static ssize_t arm_cmn_identifier_show(struct device *dev,
 				       struct device_attribute *attr, char *buf)
 {
@@ -1534,7 +1518,6 @@ static struct device_attribute arm_cmn_identifier_attr =
 		__ATTR(identifier, 0444, arm_cmn_identifier_show, NULL);
 
 static struct attribute *arm_cmn_other_attrs[] = {
-	&arm_cmn_cpumask_attr.attr,
 	&arm_cmn_identifier_attr.attr,
 	NULL,
 };
@@ -1981,11 +1964,7 @@ static int arm_cmn_event_init(struct perf_event *event)
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
 
-	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
-		return -EINVAL;
-
-	event->cpu = cmn->cpu;
-	if (event->cpu < 0)
+	if (is_sampling_event(event))
 		return -EINVAL;
 
 	type = CMN_EVENT_TYPE(event);
@@ -2243,48 +2222,26 @@ static int arm_cmn_commit_txn(struct pmu *pmu)
 	return 0;
 }
 
-static void arm_cmn_migrate(struct arm_cmn *cmn, unsigned int cpu)
+static int arm_cmn_filter_allowed_cpus(struct pmu *pmu, struct cpumask *allowed_cpus)
 {
-	unsigned int i;
+	struct arm_cmn *cmn = to_cmn(pmu);
+	int node = dev_to_node(cmn->dev);
 
-	perf_pmu_migrate_context(&cmn->pmu, cmn->cpu, cpu);
-	for (i = 0; i < cmn->num_dtcs; i++)
-		irq_set_affinity(cmn->dtc[i].irq, cpumask_of(cpu));
-	cmn->cpu = cpu;
-}
+	/* Any CPU can drive the CMN, but prefer local ones */
+	if (node != NUMA_NO_NODE &&
+	    cpumask_intersects(allowed_cpus, cpumask_of_node(node)))
+		cpumask_and(allowed_cpus, allowed_cpus, cpumask_of_node(node));
 
-static int arm_cmn_pmu_online_cpu(unsigned int cpu, struct hlist_node *cpuhp_node)
-{
-	struct arm_cmn *cmn;
-	int node;
-
-	cmn = hlist_entry_safe(cpuhp_node, struct arm_cmn, cpuhp_node);
-	node = dev_to_node(cmn->dev);
-	if (cpu_to_node(cmn->cpu) != node && cpu_to_node(cpu) == node)
-		arm_cmn_migrate(cmn, cpu);
-	return 0;
+	return cpumask_empty(allowed_cpus) ? -ENODEV : 0;
 }
 
-static int arm_cmn_pmu_offline_cpu(unsigned int cpu, struct hlist_node *cpuhp_node)
+static void arm_cmn_migrate_cpu(struct pmu *pmu, unsigned int cpu)
 {
-	struct arm_cmn *cmn;
-	unsigned int target;
-	int node;
-
-	cmn = hlist_entry_safe(cpuhp_node, struct arm_cmn, cpuhp_node);
-	if (cpu != cmn->cpu)
-		return 0;
-
-	node = dev_to_node(cmn->dev);
-
-	target = cpumask_any_and_but(cpumask_of_node(node), cpu_online_mask, cpu);
-	if (target >= nr_cpu_ids)
-		target = cpumask_any_but(cpu_online_mask, cpu);
-
-	if (target < nr_cpu_ids)
-		arm_cmn_migrate(cmn, target);
+	struct arm_cmn *cmn = to_cmn(pmu);
+	unsigned int i;
 
-	return 0;
+	for (i = 0; i < cmn->num_dtcs; i++)
+		WARN_ON_ONCE(irq_set_affinity(cmn->dtc[i].irq, cpumask_of(cpu)));
 }
 
 static irqreturn_t arm_cmn_handle_irq(int irq, void *dev_id)
@@ -2341,10 +2298,6 @@ static int arm_cmn_init_irqs(struct arm_cmn *cmn)
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
@@ -2843,7 +2796,6 @@ static int arm_cmn_probe(struct platform_device *pdev)
 
 	cmn->dev = &pdev->dev;
 	cmn->part = (unsigned long)device_get_match_data(cmn->dev);
-	cmn->cpu = cpumask_local_spread(0, dev_to_node(cmn->dev));
 	platform_set_drvdata(pdev, cmn);
 
 	cfg = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -2877,6 +2829,7 @@ static int arm_cmn_probe(struct platform_device *pdev)
 		.attr_groups = arm_cmn_attr_groups,
 		.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
 		.task_ctx_nr = perf_invalid_context,
+		.scope = PERF_PMU_SCOPE_DEVICE,
 		.pmu_enable = arm_cmn_pmu_enable,
 		.pmu_disable = arm_cmn_pmu_disable,
 		.event_init = arm_cmn_event_init,
@@ -2888,6 +2841,8 @@ static int arm_cmn_probe(struct platform_device *pdev)
 		.start_txn = arm_cmn_start_txn,
 		.commit_txn = arm_cmn_commit_txn,
 		.cancel_txn = arm_cmn_end_txn,
+		.filter_allowed_cpus = arm_cmn_filter_allowed_cpus,
+		.migrate_cpu = arm_cmn_migrate_cpu,
 	};
 
 	this_id = atomic_fetch_inc(&id);
@@ -2895,17 +2850,13 @@ static int arm_cmn_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
 
-	err = cpuhp_state_add_instance(arm_cmn_hp_state, &cmn->cpuhp_node);
+	err = perf_pmu_register(&cmn->pmu, name, -1);
 	if (err)
 		return err;
 
-	err = perf_pmu_register(&cmn->pmu, name, -1);
-	if (err)
-		cpuhp_state_remove_instance_nocalls(arm_cmn_hp_state, &cmn->cpuhp_node);
-	else
-		arm_cmn_debugfs_init(cmn, this_id);
+	arm_cmn_debugfs_init(cmn, this_id);
 
-	return err;
+	return 0;
 }
 
 static void arm_cmn_remove(struct platform_device *pdev)
@@ -2915,7 +2866,6 @@ static void arm_cmn_remove(struct platform_device *pdev)
 	writel_relaxed(0, cmn->dtc[0].base + CMN_DT_DTC_CTL);
 
 	perf_pmu_unregister(&cmn->pmu);
-	cpuhp_state_remove_instance_nocalls(arm_cmn_hp_state, &cmn->cpuhp_node);
 	debugfs_remove(cmn->debug);
 }
 
@@ -2958,28 +2908,18 @@ static int __init arm_cmn_init(void)
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
+
 	return ret;
 }
 
 static void __exit arm_cmn_exit(void)
 {
 	platform_driver_unregister(&arm_cmn_driver);
-	cpuhp_remove_multi_state(arm_cmn_hp_state);
 	debugfs_remove(arm_cmn_debugfs);
 }
 
-- 
Haris Okanovic
AWS Graviton


