Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E319CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGqFOWx7mD08E1HkzI2qz/sgk8trrPqNJcJBCPiKl3E=; b=YWjN7Axi4UJTS6Pm9SjX1kONW3
	h9/zfuv6ZWFRGfL+ngCNABJlPEKFBQ9MJq5nJiq6pZ+z6a7yhFrsJe34vN0E5Rjzcd78sC98F24vw
	M1BLpLxsYLeKeRfC29v8xr3I7GeiQ+KGgSzzvcL2Xd0NY0XWh7pSSDMSGDBsZqAjcotBVwZGwzScc
	i9mWuE+z+p01NFn9DbYOj+I43CwoaNZBbSqIw2ikThMPTfIfYsgn0MvHywVvtT998cFz5NRWJCXlD
	GOtjjElbY1DnRVuyC8mcuIOUqWAWjSslij92g0wkU/bh3l0Xf+4BFGSh0Ju3MZLfZPKZS/9CHaN08
	A/o4OtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIozu-00000007HRM-43uK;
	Fri, 01 May 2026 14:37:42 +0000
Received: from mail-northcentralusazon11013068.outbound.protection.outlook.com ([40.107.201.68] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIozs-00000007HQJ-3QZY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 14:37:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DREqox0g7Meg0Mk2tWFoobCp3AKmP2NKczz0P/erLCDTan8LbfUPlQ6nf2SvSLT4d86dKu5YZ0qUDltCe/fD5cxkqzUoc3wPWnVq2rT5F/pNJNrq9ZvggC2+2xPaKyC8sI7d2GOvnaN15wmaZDyeKO0C10OQUn6yWUP4KqqTGUNW2c08iWjyU3yrD0YVR+AlofaMYMLvKiHDwtn2O9osoubUD2gqEbMLUm/FGX0FY7Faa/dI4pf69t53ZwLwYDXY4vqmgetdeS3sdXMXJ0gHRNmgU4e6pJ3MDv6Gk6I44wO9uqSGbWnTTk9nfr6ZG5rqlp5ZvVd/rWgRIb7DTA36ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGqFOWx7mD08E1HkzI2qz/sgk8trrPqNJcJBCPiKl3E=;
 b=xXIOYPUkpilw9MqZCFpXHy2/mAoW98mPeEjS8n8vu3ShhA3wJ+jzt/G29cUyCMA2DwnaNBPvn4CwfUwDc9247MtFXZdxDYFu2YD8SbuVjdvuDD2B3Cx3V0qVSNJ7DcDdzB3ipyPoaRBdejd/58e+1cFjQsRJd+EwziSisz8nj2zBvCI17jnp2T3FaE98jXMctRKIfWF1znGs5JsSvV6faxL/fGe5HrQdCYrXGHFlxU0OA2yBN0rSgtFxkdrJ2GRG5736T9doy4Y1Wl7JF6ba1x+Cr27k1XYHm7c/aLZVegFxLI3x6XBw72Egm3Xj7u5irH2zkzctcbP74lpNZ1bMfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGqFOWx7mD08E1HkzI2qz/sgk8trrPqNJcJBCPiKl3E=;
 b=CaZHlZ4LpL8VnDYUZ4Z5rVCiE/r1xDSmOWiZ/vgpVz5wRVZ33gFUxkhoB+REi97IeGu8SHhU/SnoJXza9TjGOZUakQBSwvkPgG9aytw/+S9KUzCIERWSHATjww3pcYQsi58ex1yEvAY4bFfMQXI46SPXK57K6D05ZOzicvXJ4r4=
Received: from BN9PR03CA0134.namprd03.prod.outlook.com (2603:10b6:408:fe::19)
 by DS7PR12MB6120.namprd12.prod.outlook.com (2603:10b6:8:98::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22; Fri, 1 May 2026 14:37:30 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:fe:cafe::9f) by BN9PR03CA0134.outlook.office365.com
 (2603:10b6:408:fe::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.23 via Frontend Transport; Fri,
 1 May 2026 14:37:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 14:37:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 1 May
 2026 09:37:28 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 May
 2026 09:37:28 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 1 May 2026 09:37:27 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] remoteproc: xlnx: enable auto boot feature
Date: Fri, 1 May 2026 07:37:07 -0700
Message-ID: <20260501143707.1591110-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501143707.1591110-1-tanmay.shah@amd.com>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|DS7PR12MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 2714104a-0b30-4cd5-88e9-08dea78f2bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YsHmCveyUhB+QSQ/hllzm+ZZy1IUVzkeHdvvh2nufwUemjJmx0YRaZr6hZssSc1pmu5/ScC5fmTt/2IKS6B4Tlthv8HmPHqM+j0qoEsKD0SVRYOEVj2hwm3pS8QTWiPtXI0WGTqt4BzH8EF0a63mWyFrihtsPYSTdiwmXXfTki5K4ryyf4DUKAjFJrkEDZ8avTu9wxpxV1RrKBT4Ee31JDPUa4EhL/uJx5hyKIujyTqxGVHeZmfhnQWLJhWU+JS+KriLpqev9wNRa8GZn/O7mo3xA0ccdGVaNwIun45eUCkzaWm0LdNMXESclthBI6rWZ4gdb72nBbyturmHTmKEH5gkxGCqApGTXNTkqcEAnUGKYf49Km/EyBJYUFSPAIm410Hb/9cqfb0P2ZzT+7eWQ9eO64s4XHkYODY+jqxVyngofWZJdeOdJb9rMTJhODkKMqhVjqzHkHc8+TDECXDUvJgViaV0/oevxyBSkBf3ZGbGLn4X2Y9px3iuOzI/NY+OukzYw5EymCAA1VxOO7IsyMzg0V4R3CzlttU+wPuEZqp6PZ15o5joznwgK9hJGmxKPXGbVajfKAclTLIzl3r+k20G74Xm1zpwpA8yracyKf0JoX5PHyLV8PrTsINBk0ShodnYKCCWcz9iCkYA63EmiyLWK4bwgxy8U2wvFpAl9XG40SSz9e34TYwdqr1+fbUFTyr5Y7eTtUFs+So1BcNBBaHXxu3E8YWPDIqxpuP2iy4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F0gtEUiQcWtP5PvZCLjiKDLdoHOGWb4U62WNFI1HpAx99Twjy/BEg9iPnYHkt+ns3QcRbYIseHyBXgZn/13Ipf6p0eGaqjMa3DhbupipMOXwSnQQToMtRi/efafGuDzXv9cAMba8HFiRYKyXfQQRCpj70aFqv+z2i3AI4clNNEOwLTRmZV8sCl5p+13Mi3MsB4MxAzkkXa0Vp0QdDbKBr78LUkuwHQeC7XhJQ5n+glE26w4TXVtDoznfJlKMN9P17hquc+LQjyoa1pNGvgJBGEZYTf0Wop+K0hPCWiLdSEGz4ifRX9tJEr+c1QjfmDrdWq28wufo4AwvYMzT0PxzW+8h3TXJNYI3iMxe+QOWa8yCnSJocdFGppjCLPL4V0K0i4E3iPmtVmVCKFpray5YrAUYNK64kSgCpSoPwtKpajwTg9GhL8eohfIiqACczwWr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 14:37:28.9403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2714104a-0b30-4cd5-88e9-08dea78f2bc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_073740_860143_3A22C8E9 
X-CRM114-Status: GOOD (  22.96  )
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

remoteproc framework has capability to start (or attach to) the remote
processor automatically if auto boot flag is set by the driver during
probe. If remote core is not started before the Linux boot, and linux is
expected to start the remote core then it uses "firmware-name" property
to load default firmware during auto boot.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 48 +++++++++++++++++--------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 45a62cb98072..652030f9cea2 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 };
 
 /**
- * zynqmp_r5_add_rproc_core() - Add core data to framework.
- * Allocate and add struct rproc object for each r5f core
+ * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
+ * Allocate struct rproc object for each r5f core
  * This is called for each individual r5f core
  *
  * @cdev: Device node of each r5 core
  *
  * Return: zynqmp_r5_core object for success else error code pointer
  */
-static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
+static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
 {
 	struct zynqmp_r5_core *r5_core;
+	const char *fw_name = NULL;
 	struct rproc *r5_rproc;
 	int ret;
 
@@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ERR_PTR(dev_err_probe(cdev, ret,
+					     "failed to parse firmware-name\n"));
+
 	/* Allocate remoteproc instance */
 	r5_rproc = rproc_alloc(cdev, dev_name(cdev),
 			       &zynqmp_r5_rproc_ops,
-			       NULL, sizeof(struct zynqmp_r5_core));
+			       fw_name, sizeof(struct zynqmp_r5_core));
 	if (!r5_rproc) {
 		dev_err(cdev, "failed to allocate memory for rproc instance\n");
 		return ERR_PTR(-ENOMEM);
@@ -932,6 +938,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 	r5_rproc->recovery_disabled = true;
 	r5_rproc->has_iommu = false;
 	r5_rproc->auto_boot = false;
+
+	/* attempt to boot automatically if the firmware-name is provided */
+	if (fw_name)
+		r5_rproc->auto_boot = true;
+
 	r5_core = r5_rproc->priv;
 	r5_core->dev = cdev;
 	r5_core->np = dev_of_node(cdev);
@@ -941,13 +952,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 		goto free_rproc;
 	}
 
-	/* Add R5 remoteproc core */
-	ret = rproc_add(r5_rproc);
-	if (ret) {
-		dev_err(cdev, "failed to add r5 remoteproc\n");
-		goto free_rproc;
-	}
-
 	r5_core->rproc = r5_rproc;
 	return r5_core;
 
@@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 			if (zynqmp_r5_get_rsc_table_va(r5_core))
 				dev_dbg(r5_core->dev, "rsc tbl not found\n");
 			r5_core->rproc->state = RPROC_DETACHED;
+			r5_core->rproc->auto_boot = true;
 		}
 	}
 
@@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 	enum rpu_oper_mode fw_reg_val;
 	struct device **child_devs;
 	enum rpu_tcm_comb tcm_mode;
-	int core_count, ret, i;
+	int core_count, ret, i, j;
 	struct mbox_info *ipi;
 
 	ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
@@ -1390,7 +1395,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		child_devs[i] = &child_pdev->dev;
 
 		/* create and add remoteproc instance of type struct rproc */
-		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
+		r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
 		if (IS_ERR(r5_cores[i])) {
 			ret = PTR_ERR(r5_cores[i]);
 			r5_cores[i] = NULL;
@@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		goto release_r5_cores;
 	}
 
+	for (j = 0; j < cluster->core_count; j++) {
+		/* Add R5 remoteproc core */
+		ret = rproc_add(r5_cores[j]->rproc);
+		if (ret) {
+			dev_err_probe(r5_cores[j]->dev, ret,
+				      "failed to add remoteproc\n");
+			goto delete_r5_cores;
+		}
+	}
+
 	kfree(child_devs);
 	return 0;
 
+delete_r5_cores:
+	i = core_count - 1;
+	/* delete previous added rproc */
+	while (--j >= 0)
+		rproc_del(r5_cores[j]->rproc);
+
 release_r5_cores:
 	while (i >= 0) {
 		put_device(child_devs[i]);
 		if (r5_cores[i]) {
 			zynqmp_r5_free_mbox(r5_cores[i]->ipi);
 			of_reserved_mem_device_release(r5_cores[i]->dev);
-			rproc_del(r5_cores[i]->rproc);
 			rproc_free(r5_cores[i]->rproc);
 		}
 		i--;
-- 
2.34.1


