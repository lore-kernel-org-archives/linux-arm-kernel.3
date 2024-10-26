Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC0CD10BE5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 07:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPrtc8isfn0+RcqQO+4p7nQN0UdB4IMDJEGkk6gQBfA=; b=vvNMW7uzac3fsWqPCsKdGKZQT9
	LskktfbQb8TgKACig0pgaF2KWeDnPmCORbiVoUDou6IyAPj+kbD789uPLmZRQh/7NJelCobcydqZ3
	CkRilpWDRGfb5O7HjIbiGVB6XzTzV1ReYfLRSFP2/+FhZbIIa6lqi58rUz4exi5Q4C5ttZsDToL5A
	CT6x/tTYjrSLbcyjjDUqJYWqT19SqsEJe0/HEAeQ3FVEGJdulf4gi1/VhIpvTcYoilitnUmlWMpus
	yMFv3QjknBeNvSuQPOIud/W9rVA9TUomxg/NzVPdjNrQV1EuMA4xaqsk+7Cur8oErgj4Aq0pA4Jw7
	oPFYzOSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bDg-000000067bu-37JE;
	Sat, 26 Oct 2024 07:28:20 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bAT-000000066sb-3Egx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 07:25:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XbB1x4r5Rz1T90l;
	Sat, 26 Oct 2024 15:22:45 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 1012A140F9C;
	Sat, 26 Oct 2024 15:24:51 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 26 Oct 2024 15:24:50 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v3 3/8] drivers/perf: hisi: Extract topology information to a separate structure
Date: Sat, 26 Oct 2024 15:24:19 +0800
Message-ID: <20241026072424.29887-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241026072424.29887-1-yangyicong@huawei.com>
References: <20241026072424.29887-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_002502_261408_54EEEA52 
X-CRM114-Status: GOOD (  23.90  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

HiSilicon Uncore PMUs are identified by the IDs of the topology element
on which the PMUs are located. Add a new separate struct hisi_pmu_toplogy
to encapsulate this information. Add additional documentation on the
meaning of each ID.

- make sccl_id and sicl_id into a union since they're exclusive. It can
  also be accessed by scl_id if the SICL/SCCL distinction is not
  relevant
- make index_id and sub_id signed so -1 may be used to indicate the PMU
  doesn't have this topology element or it could not be retrieved.

This patch should have no functional changes.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  | 12 +++---
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 18 ++++-----
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  | 12 +++---
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  |  8 ++--
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   | 14 +++----
 drivers/perf/hisilicon/hisi_uncore_pmu.c      |  7 ++--
 drivers/perf/hisilicon/hisi_uncore_pmu.h      | 38 +++++++++++++++----
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 10 ++---
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c   | 11 +++---
 9 files changed, 78 insertions(+), 52 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
index 710c1f92fef6..d0b250fe0619 100644
--- a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
@@ -181,19 +181,19 @@ static int hisi_cpa_pmu_init_data(struct platform_device *pdev,
 				  struct hisi_pmu *cpa_pmu)
 {
 	if (device_property_read_u32(&pdev->dev, "hisilicon,scl-id",
-				     &cpa_pmu->sicl_id)) {
+				     &cpa_pmu->topo.sicl_id)) {
 		dev_err(&pdev->dev, "Can not read sicl-id\n");
 		return -EINVAL;
 	}
 
 	if (device_property_read_u32(&pdev->dev, "hisilicon,idx-id",
-				     &cpa_pmu->index_id)) {
+				     &cpa_pmu->topo.index_id)) {
 		dev_err(&pdev->dev, "Cannot read idx-id\n");
 		return -EINVAL;
 	}
 
-	cpa_pmu->ccl_id = -1;
-	cpa_pmu->sccl_id = -1;
+	cpa_pmu->topo.ccl_id = -1;
+	cpa_pmu->topo.sccl_id = -1;
 	cpa_pmu->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(cpa_pmu->base))
 		return PTR_ERR(cpa_pmu->base);
@@ -311,8 +311,8 @@ static int hisi_cpa_pmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sicl%d_cpa%u",
-			      cpa_pmu->sicl_id, cpa_pmu->index_id);
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sicl%d_cpa%d",
+			      cpa_pmu->topo.sicl_id, cpa_pmu->topo.index_id);
 	if (!name)
 		return -ENOMEM;
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index 56f15e9775bd..190a10ae2af6 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -302,18 +302,18 @@ static int hisi_ddrc_pmu_init_data(struct platform_device *pdev,
 	 * DDRC PMU, while SCCL_ID is in MPIDR[aff2].
 	 */
 	if (device_property_read_u32(&pdev->dev, "hisilicon,ch-id",
-				     &ddrc_pmu->index_id)) {
+				     &ddrc_pmu->topo.index_id)) {
 		dev_err(&pdev->dev, "Can not read ddrc channel-id!\n");
 		return -EINVAL;
 	}
 
 	if (device_property_read_u32(&pdev->dev, "hisilicon,scl-id",
-				     &ddrc_pmu->sccl_id)) {
+				     &ddrc_pmu->topo.sccl_id)) {
 		dev_err(&pdev->dev, "Can not read ddrc sccl-id!\n");
 		return -EINVAL;
 	}
 	/* DDRC PMUs only share the same SCCL */
-	ddrc_pmu->ccl_id = -1;
+	ddrc_pmu->topo.ccl_id = -1;
 
 	ddrc_pmu->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ddrc_pmu->base)) {
@@ -324,7 +324,7 @@ static int hisi_ddrc_pmu_init_data(struct platform_device *pdev,
 	ddrc_pmu->identifier = readl(ddrc_pmu->base + DDRC_VERSION);
 	if (ddrc_pmu->identifier >= HISI_PMU_V2) {
 		if (device_property_read_u32(&pdev->dev, "hisilicon,sub-id",
-					     &ddrc_pmu->sub_id)) {
+					     &ddrc_pmu->topo.sub_id)) {
 			dev_err(&pdev->dev, "Can not read sub-id!\n");
 			return -EINVAL;
 		}
@@ -501,13 +501,13 @@ static int hisi_ddrc_pmu_probe(struct platform_device *pdev)
 
 	if (ddrc_pmu->identifier >= HISI_PMU_V2)
 		name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
-				      "hisi_sccl%u_ddrc%u_%u",
-				      ddrc_pmu->sccl_id, ddrc_pmu->index_id,
-				      ddrc_pmu->sub_id);
+				      "hisi_sccl%d_ddrc%d_%d",
+				      ddrc_pmu->topo.sccl_id, ddrc_pmu->topo.index_id,
+				      ddrc_pmu->topo.sub_id);
 	else
 		name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
-				      "hisi_sccl%u_ddrc%u", ddrc_pmu->sccl_id,
-				      ddrc_pmu->index_id);
+				      "hisi_sccl%d_ddrc%d", ddrc_pmu->topo.sccl_id,
+				      ddrc_pmu->topo.index_id);
 
 	if (!name)
 		return -ENOMEM;
diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
index 81804fe873bf..b3535101d5f6 100644
--- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
@@ -300,7 +300,7 @@ static int hisi_hha_pmu_init_data(struct platform_device *pdev,
 	 * SCCL_ID is in MPIDR[aff2].
 	 */
 	if (device_property_read_u32(&pdev->dev, "hisilicon,scl-id",
-				     &hha_pmu->sccl_id)) {
+				     &hha_pmu->topo.sccl_id)) {
 		dev_err(&pdev->dev, "Can not read hha sccl-id!\n");
 		return -EINVAL;
 	}
@@ -310,7 +310,7 @@ static int hisi_hha_pmu_init_data(struct platform_device *pdev,
 	 * both "hisilicon, idx-id" as preference, if available.
 	 */
 	if (device_property_read_u32(&pdev->dev, "hisilicon,idx-id",
-				     &hha_pmu->index_id)) {
+				     &hha_pmu->topo.index_id)) {
 		status = acpi_evaluate_integer(ACPI_HANDLE(&pdev->dev),
 					       "_UID", NULL, &id);
 		if (ACPI_FAILURE(status)) {
@@ -318,10 +318,10 @@ static int hisi_hha_pmu_init_data(struct platform_device *pdev,
 			return -EINVAL;
 		}
 
-		hha_pmu->index_id = id;
+		hha_pmu->topo.index_id = id;
 	}
 	/* HHA PMUs only share the same SCCL */
-	hha_pmu->ccl_id = -1;
+	hha_pmu->topo.ccl_id = -1;
 
 	hha_pmu->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hha_pmu->base)) {
@@ -510,8 +510,8 @@ static int hisi_hha_pmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sccl%u_hha%u",
-			      hha_pmu->sccl_id, hha_pmu->index_id);
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sccl%d_hha%d",
+			      hha_pmu->topo.sccl_id, hha_pmu->topo.index_id);
 	if (!name)
 		return -ENOMEM;
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index cb559789861a..2a873a5e66a1 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -360,13 +360,13 @@ static int hisi_l3c_pmu_init_data(struct platform_device *pdev,
 	 * SCCL_ID is in MPIDR[aff2] and CCL_ID is in MPIDR[aff1].
 	 */
 	if (device_property_read_u32(&pdev->dev, "hisilicon,scl-id",
-				     &l3c_pmu->sccl_id)) {
+				     &l3c_pmu->topo.sccl_id)) {
 		dev_err(&pdev->dev, "Can not read l3c sccl-id!\n");
 		return -EINVAL;
 	}
 
 	if (device_property_read_u32(&pdev->dev, "hisilicon,ccl-id",
-				     &l3c_pmu->ccl_id)) {
+				     &l3c_pmu->topo.ccl_id)) {
 		dev_err(&pdev->dev, "Can not read l3c ccl-id!\n");
 		return -EINVAL;
 	}
@@ -544,8 +544,8 @@ static int hisi_l3c_pmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sccl%u_l3c%u",
-			      l3c_pmu->sccl_id, l3c_pmu->ccl_id);
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sccl%d_l3c%d",
+			      l3c_pmu->topo.sccl_id, l3c_pmu->topo.ccl_id);
 	if (!name)
 		return -ENOMEM;
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
index 8d29c87980e4..a23b012398a1 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
@@ -274,19 +274,19 @@ static int hisi_pa_pmu_init_data(struct platform_device *pdev,
 	 * to identify the PA PMU.
 	 */
 	if (device_property_read_u32(&pdev->dev, "hisilicon,scl-id",
-				     &pa_pmu->sicl_id)) {
+				     &pa_pmu->topo.sicl_id)) {
 		dev_err(&pdev->dev, "Cannot read sicl-id!\n");
 		return -EINVAL;
 	}
 
 	if (device_property_read_u32(&pdev->dev, "hisilicon,idx-id",
-				     &pa_pmu->index_id)) {
+				     &pa_pmu->topo.index_id)) {
 		dev_err(&pdev->dev, "Cannot read idx-id!\n");
 		return -EINVAL;
 	}
 
-	pa_pmu->ccl_id = -1;
-	pa_pmu->sccl_id = -1;
+	pa_pmu->topo.ccl_id = -1;
+	pa_pmu->topo.sccl_id = -1;
 
 	pa_pmu->dev_info = device_get_match_data(&pdev->dev);
 	if (!pa_pmu->dev_info)
@@ -488,9 +488,9 @@ static int hisi_pa_pmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sicl%d_%s%u",
-			      pa_pmu->sicl_id, pa_pmu->dev_info->name,
-			      pa_pmu->index_id);
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sicl%d_%s%d",
+			      pa_pmu->topo.sicl_id, pa_pmu->dev_info->name,
+			      pa_pmu->topo.index_id);
 	if (!name)
 		return -ENOMEM;
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index c3549e16e0c3..e48365bb7c48 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -465,18 +465,19 @@ static void hisi_read_sccl_and_ccl_id(int *scclp, int *cclp)
  */
 static bool hisi_pmu_cpu_is_associated_pmu(struct hisi_pmu *hisi_pmu)
 {
+	struct hisi_pmu_topology *topo = &hisi_pmu->topo;
 	int sccl_id, ccl_id;
 
-	if (hisi_pmu->ccl_id == -1) {
+	if (topo->ccl_id == -1) {
 		/* If CCL_ID is -1, the PMU only shares the same SCCL */
 		hisi_read_sccl_and_ccl_id(&sccl_id, NULL);
 
-		return sccl_id == hisi_pmu->sccl_id;
+		return sccl_id == topo->sccl_id;
 	}
 
 	hisi_read_sccl_and_ccl_id(&sccl_id, &ccl_id);
 
-	return sccl_id == hisi_pmu->sccl_id && ccl_id == hisi_pmu->ccl_id;
+	return sccl_id == topo->sccl_id && ccl_id == topo->ccl_id;
 }
 
 int hisi_uncore_pmu_online_cpu(unsigned int cpu, struct hlist_node *node)
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
index 0e2f844b5fd9..286c19bb14eb 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
@@ -81,12 +81,43 @@ struct hisi_pmu_hwevents {
 	const struct attribute_group **attr_groups;
 };
 
+/**
+ * struct hisi_pmu_topology - Describe the topology hierarchy on which the PMU
+ *                            is located.
+ * @sccl_id: ID of the SCCL on which the PMU locate is located.
+ * @sicl_id: ID of the SICL on which the PMU locate is located.
+ * @scl_id:  ID used by the core which is unaware of the SCCL/SICL.
+ * @ccl_id: ID of the CCL (CPU cluster) on which the PMU is located.
+ * @index_id: the ID of the PMU module if there're several PMUs at a
+ *            particularly location in the topology.
+ * @sub_id: submodule ID of the PMU. For example we use this for DDRC PMU v2
+ *          since each DDRC has more than one DMC
+ *
+ * The ID will be -1 if the PMU isn't located on a certain topology.
+ */
+struct hisi_pmu_topology {
+	/*
+	 * SCCL (Super CPU CLuster) and SICL (Super I/O Cluster) are parallel
+	 * so a PMU cannot locate on a SCCL and a SICL. If the SCCL/SICL
+	 * distinction is not relevant, use scl_id instead.
+	 */
+	union {
+		int sccl_id;
+		int sicl_id;
+		int scl_id;
+	};
+	int ccl_id;
+	int index_id;
+	int sub_id;
+};
+
 /* Generic pmu struct for different pmu types */
 struct hisi_pmu {
 	struct pmu pmu;
 	const struct hisi_uncore_ops *ops;
 	const struct hisi_pmu_dev_info *dev_info;
 	struct hisi_pmu_hwevents pmu_events;
+	struct hisi_pmu_topology topo;
 	/* associated_cpus: All CPUs associated with the PMU */
 	cpumask_t associated_cpus;
 	/*
@@ -99,14 +130,7 @@ struct hisi_pmu {
 	int irq;
 	struct device *dev;
 	struct hlist_node node;
-	int sccl_id;
-	int sicl_id;
-	int ccl_id;
 	void __iomem *base;
-	/* the ID of the PMU modules */
-	u32 index_id;
-	/* For DDRC PMU v2: each DDRC has more than one DMC */
-	u32 sub_id;
 	int num_counters;
 	int counter_bits;
 	/* check event code range */
diff --git a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
index d0c2e86c558e..ed1b4d6f0ed5 100644
--- a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
@@ -293,19 +293,19 @@ static int hisi_sllc_pmu_init_data(struct platform_device *pdev,
 	 * while SCCL_ID is from MPIDR_EL1 by CPU.
 	 */
 	if (device_property_read_u32(&pdev->dev, "hisilicon,scl-id",
-				     &sllc_pmu->sccl_id)) {
+				     &sllc_pmu->topo.sccl_id)) {
 		dev_err(&pdev->dev, "Cannot read sccl-id!\n");
 		return -EINVAL;
 	}
 
 	if (device_property_read_u32(&pdev->dev, "hisilicon,idx-id",
-				     &sllc_pmu->index_id)) {
+				     &sllc_pmu->topo.index_id)) {
 		dev_err(&pdev->dev, "Cannot read idx-id!\n");
 		return -EINVAL;
 	}
 
 	/* SLLC PMUs only share the same SCCL */
-	sllc_pmu->ccl_id = -1;
+	sllc_pmu->topo.ccl_id = -1;
 
 	sllc_pmu->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sllc_pmu->base)) {
@@ -433,8 +433,8 @@ static int hisi_sllc_pmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sccl%u_sllc%u",
-			      sllc_pmu->sccl_id, sllc_pmu->index_id);
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sccl%d_sllc%d",
+			      sllc_pmu->topo.sccl_id, sllc_pmu->topo.index_id);
 	if (!name)
 		return -ENOMEM;
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
index 9c724dab6b64..19a44498758f 100644
--- a/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
@@ -372,19 +372,19 @@ static int hisi_uc_pmu_init_data(struct platform_device *pdev,
 	 * They have some CCLs per SCCL and then 4 UC PMU per CCL.
 	 */
 	if (device_property_read_u32(&pdev->dev, "hisilicon,scl-id",
-				     &uc_pmu->sccl_id)) {
+				     &uc_pmu->topo.sccl_id)) {
 		dev_err(&pdev->dev, "Can not read uc sccl-id!\n");
 		return -EINVAL;
 	}
 
 	if (device_property_read_u32(&pdev->dev, "hisilicon,ccl-id",
-				     &uc_pmu->ccl_id)) {
+				     &uc_pmu->topo.ccl_id)) {
 		dev_err(&pdev->dev, "Can not read uc ccl-id!\n");
 		return -EINVAL;
 	}
 
 	if (device_property_read_u32(&pdev->dev, "hisilicon,sub-id",
-				     &uc_pmu->sub_id)) {
+				     &uc_pmu->topo.sub_id)) {
 		dev_err(&pdev->dev, "Can not read sub-id!\n");
 		return -EINVAL;
 	}
@@ -538,8 +538,9 @@ static int hisi_uc_pmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sccl%d_uc%d_%u",
-			      uc_pmu->sccl_id, uc_pmu->ccl_id, uc_pmu->sub_id);
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "hisi_sccl%d_uc%d_%d",
+			      uc_pmu->topo.sccl_id, uc_pmu->topo.ccl_id,
+			      uc_pmu->topo.sub_id);
 	if (!name)
 		return -ENOMEM;
 
-- 
2.24.0


