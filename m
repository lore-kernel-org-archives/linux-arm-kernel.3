Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E14CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 06:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o5eykm7AJczkLx3JRr5ccH14HSao65jq+HP4JcWtens=; b=EemEwyIkI8JYba+toSl9cPCwky
	YtEgwzLB9In3YqRVK4QQO5yfdrFkoBv7flwA1MWTBff2Ni9LqkKffK1Y1r791/Ju621SmpqTyt2UU
	lzzPMTJRKILu3sR3vVckojzC+aKOEwu0mvGQuONXOahty9yThdLnbP9WT8g5TWHrmt+8Ne7w3wIgC
	Uslcb0z9Qsqk4EmxRoXeV59CFCui8Ko4JIPmdQzsRMD6QcAzNb1IqQ8XY3F4fhuCS7gDXuxnegUWk
	MPI35iaYXnc3kCSKmXMeU4TThXvmvATvBTUMo1sfcto91NgnvHOBNauJ3gsm31/a45iUV+c6GFjDu
	CEnAXYDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEy5-0000000GvoC-3SGc;
	Thu, 15 Oct 2026 06:29:33 +0000
Received: from mail-japaneastazon11023140.outbound.protection.outlook.com ([52.101.127.140] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEy2-0000000Gvmx-3pyZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 06:29:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9a3RnK0k6eivYGJM6TP5cj2qvOWkH+N4ikkK9d9mAaFm9QX+IG09qVdmBGP7qlTDvChxcn8eXZ+suGkj0XVkAtaEErvF3mn1Fj4QECUKuynm3il+PD+7NQLR2pc8vExA9dytHT9e7x+gQqK0SRf2wIvDsi/5iqj4+5O2WqiIbFpbpgg6zvx1af26IEYJPVBXvapkvpX4ZjyXJJJr91JQ7iHTq1HF1urDcG8GKa6rcd5g2IcJMujpRvzd56LCSc26HWgqs2QYG4NVH3gRVdHY7eUo/jlMS1r8BXicwwFaxrM8sRhddhU3fKwI8EhWO0d1bm0Ouc8QSbM/ldO09Rr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5eykm7AJczkLx3JRr5ccH14HSao65jq+HP4JcWtens=;
 b=W1mb9HNEA/PX5Q8G4OsS8NlhFgMWJzgVsS+v74UWm+K4Hso71cGob0S515EAlBqP/HcnTTWNzRPuRz8Dty5xCAKfe0ObToUNB+o2Zj8EMDyw1KKMiokjFn8GzO3B6aAub1AcAQa+PDuvc7RfJkAO3qosaOiRckwW8ifHCMYRr76wB2dy5/uPFslwei6kVbsmt21Nf1AKuQPkq3/nekswC/UmmPrwnhy31Z15rwrBf0KqcnuDylT+vFTjFjURzv1ryVl+aa+oCM4/erDiyn0eQkoaKwzIBLaWrFwSJgpD0U+3IQwhZS91mSzke/Od1hlugpJgiKU05j1T0aS+e7nupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR04CA0012.apcprd04.prod.outlook.com (2603:1096:990:4::15)
 by SI3PR06MB8537.apcprd06.prod.outlook.com (2603:1096:4:2aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 06:29:11 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:990:4:cafe::26) by JH0PR04CA0012.outlook.office365.com
 (2603:1096:990:4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu,
 15 Oct 2026 06:29:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 06:29:09 +0000
Received: from JohnnyFan (unknown [172.21.64.24])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8D4D542C6440;
	Thu, 15 Oct 2026 14:29:08 +0800 (CST)
From: "Johnny.Fan" <johnny.fan@cixtech.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	james.clark@linaro.org,
	leo.yan@arm.com,
	jeremy.linton@arm.com,
	cix-kernel-upstream@cixtech.com,
	bob.zhang@cixtech.com,
	jie.fu@cixtech.com,
	"Johnny.Fan" <Johnny.Fan@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH] perf: arm_spe: Support heterogeneous ACPI systems
Date: Thu, 15 Oct 2026 14:29:08 +0800
Message-ID: <20261015062908.3565761-1-johnny.fan@cixtech.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SI3PR06MB8537:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f7bdc515-4b16-4ab5-220e-08df2a859ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|56012099006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: f6CJ/a7bXz3tRIOopDHn7b6Yc7AZSGMyCeI1eKs07GIhEAPAqpCisMF8bsqINdgDVnGZue1sAsrvjSndWMjGKQlBPl9aDadM6sH/0LQA8GndezuasuQMI3dV1yqsGix8G+MUufzCMlrx80xBLte78gv8FJAbkpUUetb7iwPZu/VNIFShru57E7i0a3DlJ4/3Wl1e9YjvfUleAA4mDq4V9VtAPz88p+axUt/EfkfmHrXIRFljiaUbq0Jc3zHI6JDCIG7fRJXDcTZMscCz4/stN83V52MAPpwo/qrBzHFkBXLez6fIdCUcUJabRbIx91v90ldEitsetDEwIEWcjHHH+7mKUa5zF7SaVawDWVmg5ecOScGXmrwVwZi0eteyp9xr1LzFbQIA7n8TNB/TnMcsSggHoMQ5WhgOmYTEQJLykDdRqQGreHBQUMTsUZHScPldWNjNuSFg7LRSapo4iYF3oIFS6ND7utbuWZE+NCtT65yBziPiDdOKOylg/9HyotK2D1aIkrDhAYFyabRjTveQNWWA+a7w+oXgfnmvODKw2FUsa9vLyF/sHXqTtCFrJJP0T3WUqZVTHIyT/WrALeIShOSVAJlLuAPFVm22ci5VzuWQhHmpr7FkzpbtdXrM6WzmPDJ26MGV8msHiU024iGV3hGKk71jFQx/nyzWh5ZwYzosu1u4WKrfv6M60rCFljVJlfoLrrawtbQayXHnAS9Flg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cWtlzhNK1/Lg30XsUnwSzRlsLREg+l2KXTFin+kjVPB8A3MUrQHC1OF68cKGG6CXfn4V4NM/BTIUrqB/JdttR3DSfyg2VQl814aMgSAwf66PfcS/EiB3g0OpmBpqLoPoDYH8iTUnB4sHRLH+hmD2ErMylIAkP/PesXMTDts34aWWRoCm8poZ3PeuGWDwWUaTTrLqsrpcY6j5wNInKzSIDqmq4ZXvaztCoxsEsUzqiGDeVN76eVScW8gIbA8PnvUkFmk/KS0mbJquwPiobVc/lcCp7LjTSZFcU3a6WvHZ0OiFiRPMRMmLwgvkz2GnedODTDDnlhDN5EpEK5ZWfKrqXoxYTZmIP4YB4bKNVl//GVRt+VTeadRQWzo2K77rHW3qldRu8hlyx65Y1PnRHg1bjOglIX91Cig6s83K1vYDRemFcyswc/vRXUfe5Csvxc72
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 06:29:09.3108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bdc515-4b16-4ab5-220e-08df2a859ef7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_232930_962816_1B4B1CCC 
X-CRM114-Status: GOOD (  23.72  )
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

From: "Johnny.Fan" <Johnny.Fan@cixtech.com>

The ACPI MADT describes the SPE overflow interrupt on a per-CPU basis
in the GICC structure, where a CPU that does not implement SPE simply
reports 0. Heterogeneous systems therefore only report the interrupt
on the CPUs that implement SPE, but arm_pmu_acpi.c rejects this as a
non-homogeneous mapping and never creates the SPE platform device.

Treat the SPE interrupt as optional when walking the MADT: skip the
GICCs that report 0 and only require that the CPUs which do report it
agree on the number.

Note that the CPUs reporting the interrupt must still share a single
GSI, as the platform device only exposes one IRQ resource. A system
that assigns a different PPI per cluster cannot be described by this
single-device model.

The CPUs without SPE are trimmed from the PMU supported CPUs by
probing PMSVer on each CPU, both at probe time (for online CPUs) and
from the hotplug callback (for CPUs that were offline at probe), as
ACPI conveys no affinity information and the PPI otherwise defaults
to all possible CPUs.

Tested on a CIX sky1 SoC with heterogeneous SPE support.

Signed-off-by: Johnny.Fan <Johnny.Fan@cixtech.com>

Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
---
 drivers/perf/arm_pmu_acpi.c | 34 +++++++++++++++++++++++-------
 drivers/perf/arm_spe_pmu.c  | 41 ++++++++++++++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/drivers/perf/arm_pmu_acpi.c b/drivers/perf/arm_pmu_acpi.c
index ca6bf8f86cfe..4ece1070827b 100644
--- a/drivers/perf/arm_pmu_acpi.c
+++ b/drivers/perf/arm_pmu_acpi.c
@@ -70,7 +70,8 @@ static void arm_pmu_acpi_unregister_irq(int cpu)
 
 static int __maybe_unused
 arm_acpi_register_pmu_device(struct platform_device *pdev, u8 len,
-			     u16 (*parse_gsi)(struct acpi_madt_generic_interrupt *))
+			     u16 (*parse_gsi)(struct acpi_madt_generic_interrupt *),
+			     bool optional)
 {
 	int cpu, this_hetid, hetid, irq, ret;
 	u16 this_gsi = 0, gsi = 0;
@@ -87,7 +88,9 @@ arm_acpi_register_pmu_device(struct platform_device *pdev, u8 len,
 
 	/*
 	 * Sanity check all the GICC tables for the same interrupt
-	 * number. For now, only support homogeneous ACPI machines.
+	 * number. For now, only support homogeneous ACPI machines,
+	 * unless the interrupt is optional, in which case a CPU that
+	 * does not implement the feature simply reports 0.
 	 */
 	for_each_possible_cpu(cpu) {
 		struct acpi_madt_generic_interrupt *gicc;
@@ -97,6 +100,20 @@ arm_acpi_register_pmu_device(struct platform_device *pdev, u8 len,
 			return gsi ? -ENXIO : 0;
 
 		this_gsi = parse_gsi(gicc);
+
+		if (optional) {
+			if (!this_gsi)
+				continue;
+
+			if (gsi && gsi != this_gsi) {
+				pr_warn("ACPI: %s: CPU%d: inconsistent interrupt %u/%u\n",
+					pdev->name, cpu, gsi, this_gsi);
+				return -ENXIO;
+			}
+			gsi = this_gsi;
+			continue;
+		}
+
 		this_hetid = find_acpi_cpu_topology_hetero_id(cpu);
 		if (!gsi) {
 			hetid = this_hetid;
@@ -107,7 +124,7 @@ arm_acpi_register_pmu_device(struct platform_device *pdev, u8 len,
 		}
 	}
 
-	if (!this_gsi)
+	if (!gsi)
 		return 0;
 
 	irq = acpi_register_gsi(NULL, gsi, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_HIGH);
@@ -146,13 +163,16 @@ static u16 arm_spe_parse_gsi(struct acpi_madt_generic_interrupt *gicc)
 
 /*
  * For lack of a better place, hook the normal PMU MADT walk
- * and create a SPE device if we detect a recent MADT with
- * a homogeneous PPI mapping.
+ * and create a SPE device if we detect a recent MADT with a PPI
+ * mapping. The SPE overflow interrupt is described per CPU, so a
+ * GICC reporting 0 simply means that the CPU does not implement
+ * SPE; the arm_spe_pmu driver trims such CPUs from its supported
+ * CPUs using PMSVer.
  */
 static void arm_spe_acpi_register_device(void)
 {
 	int ret = arm_acpi_register_pmu_device(&spe_dev, ACPI_MADT_GICC_SPE,
-					       arm_spe_parse_gsi);
+					       arm_spe_parse_gsi, true);
 	if (ret)
 		pr_warn("ACPI: SPE: Unable to register device\n");
 }
@@ -185,7 +205,7 @@ static u16 arm_trbe_parse_gsi(struct acpi_madt_generic_interrupt *gicc)
 static void arm_trbe_acpi_register_device(void)
 {
 	int ret = arm_acpi_register_pmu_device(&trbe_dev, ACPI_MADT_GICC_TRBE,
-					       arm_trbe_parse_gsi);
+					       arm_trbe_parse_gsi, false);
 	if (ret)
 		pr_warn("ACPI: TRBE: Unable to register device\n");
 }
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index b70f3fedf028..6f1bacc78b1c 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1102,6 +1102,21 @@ static void arm_spe_pmu_perf_destroy(struct arm_spe_pmu *spe_pmu)
 	perf_pmu_unregister(&spe_pmu->pmu);
 }
 
+static unsigned int arm_spe_pmu_pmsver(void)
+{
+	return cpuid_feature_extract_unsigned_field(read_cpuid(ID_AA64DFR0_EL1),
+						    ID_AA64DFR0_EL1_PMSVer_SHIFT);
+}
+
+static void __arm_spe_pmu_trim_supported_cpus(void *info)
+{
+	struct arm_spe_pmu *spe_pmu = info;
+
+	if (!arm_spe_pmu_pmsver())
+		cpumask_clear_cpu(smp_processor_id(),
+				  &spe_pmu->supported_cpus);
+}
+
 static void __arm_spe_pmu_dev_probe(void *info)
 {
 	int fld;
@@ -1109,8 +1124,7 @@ static void __arm_spe_pmu_dev_probe(void *info)
 	struct arm_spe_pmu *spe_pmu = info;
 	struct device *dev = &spe_pmu->pdev->dev;
 
-	fld = cpuid_feature_extract_unsigned_field(read_cpuid(ID_AA64DFR0_EL1),
-						   ID_AA64DFR0_EL1_PMSVer_SHIFT);
+	fld = arm_spe_pmu_pmsver();
 	if (!fld) {
 		dev_err(dev,
 			"unsupported ID_AA64DFR0_EL1.PMSVer [%d] on CPU %d\n",
@@ -1275,6 +1289,12 @@ static int arm_spe_pmu_cpu_startup(unsigned int cpu, struct hlist_node *node)
 	if (!cpumask_test_cpu(cpu, &spe_pmu->supported_cpus))
 		return 0;
 
+	/* The CPU was offline during probe; trim it if it lacks SPE */
+	if (!arm_spe_pmu_pmsver()) {
+		cpumask_clear_cpu(cpu, &spe_pmu->supported_cpus);
+		return 0;
+	}
+
 	__arm_spe_pmu_setup_one(spe_pmu);
 	return 0;
 }
@@ -1331,7 +1351,7 @@ static int arm_spe_pmu_irq_probe(struct arm_spe_pmu *spe_pmu)
 {
 	struct platform_device *pdev = spe_pmu->pdev;
 	const struct cpumask *affinity;
-	int irq;
+	int cpu, irq;
 
 	irq = platform_get_irq_affinity(pdev, 0, &affinity);
 	if (irq < 0)
@@ -1344,6 +1364,21 @@ static int arm_spe_pmu_irq_probe(struct arm_spe_pmu *spe_pmu)
 
 	cpumask_copy(&spe_pmu->supported_cpus, affinity);
 
+	/*
+	 * Heterogeneous systems may only implement SPE on a subset of the
+	 * CPUs covered by the interrupt affinity (ACPI in particular has
+	 * no affinity information and falls back to cpu_possible_mask).
+	 * SPE is self-describing through PMSVer, so drop the online CPUs
+	 * that do not implement it. CPUs that are offline at probe time
+	 * are checked when they come up.
+	 */
+	for_each_cpu(cpu, &spe_pmu->supported_cpus) {
+		if (cpu_online(cpu))
+			smp_call_function_single(cpu,
+						 __arm_spe_pmu_trim_supported_cpus,
+						 spe_pmu, 1);
+	}
+
 	spe_pmu->irq = irq;
 	return 0;
 }
-- 
2.55.0


