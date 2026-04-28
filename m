Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CCAFF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 22:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6t7uo/TzMkOfR28tD/krJv9Ie7Nb4KTR34P364YqD0o=; b=xppImtZjhZZXZ4+5InAz7TjaV5
	vvw+cHDOLm1JvBQ3aWBivpRM2lOYehPcBMjjYi8XIYu50pcmHuYqusk7WF9KcibLh4WeE+I0TPp6X
	hdOWZM2mQEUWnyhaFRWDFPkDnb44j3i3m8eFmBV6BtAmCDeYRgwT2ArBAZmc6wRpjyfJexiBMAdRx
	Acp4oEod6Mji7YN0HMcAYhziwgJw3AJaOItL6ZmTuuobE5aD4Yk3Ct356RUDoc+YP7qPK/4cBF9Im
	jEz/faoEo9HHGyUTzOEYYTsW6i+cfT5rpg/XRpwe48ymn11vBASXr1GhcXXeplljD9lrCeM4TbsdJ
	Ur/a/4Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHqm8-00000002Ylw-1kAO;
	Tue, 28 Apr 2026 22:19:28 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHqm4-00000002YlR-2U7U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 22:19:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9b+c5HnWM/JT5zr6mfrwPa2V6r/qh6W33v0JZbgvy1HKV3iEWfpJ8Q/vFD/rtS+svI2NiZ7aWFI6sDNxeWba0C9mfgAehml/H6JZabRODgUiYVBgx/uPVqSjuuCl4JIRjKJYFGalFvkUBJLqhoQJ3MkIxNZToeaeSMNzbGc7/dGjWWB7QwShb+OdgqhVo7J+l498p3OgYbPRdi+NdWc+dIdpM9bB/TJtk8lphiBRvIHnNC6NvJNAelu/21HsbwqiFKE8c03MTXqOMMwFTC/6CeAS2wiQLeFkx4Do1fCnfwJ8YwOcXvQvOS2nhHAgycXflRky6azTtfpbtvQHS87RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6t7uo/TzMkOfR28tD/krJv9Ie7Nb4KTR34P364YqD0o=;
 b=fbu2BSC1VOJy3nAfQ9TTRUG1JkLa2Us+rF0iMJ4rEAErzuAbZxYWMWt5cdLCtP6PT53JmMsSzNee4VsZTIMoAd8gQKNVH6LDhnmzqalvqAID98pTa1x/NgEEIr0/HolHDQoDOBnuFaMTwg/oi+a7FTWssBmPn27vgYfyK20c+X9QWIEpMSRhDWR1HpdtcIUc3MPUK3oNocf/viqT+or4lr1cC2+qCBK0O7j944Wkfwf0jw3ZQX0iJ2yaYyEOrHFrNOoUPi3ldEojbbMJDz25zNz6+S/2RcLAWgZC3+Q9EcAnh9nhSm0fIPwiWjY6SBavHVISbQiJato+/gGC1p1oIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6t7uo/TzMkOfR28tD/krJv9Ie7Nb4KTR34P364YqD0o=;
 b=4iBiytpHKiiUmVjXMnUPjwDptLYggTx0AKelWwfKjxpuAshkqDWENUQAEwtQjtGIdoTGM6AOTcyvBy0cqoGe+uzJPMrVmxzpSxn4v7wmJaGgrFMqk8gUFfrbZowFR3P4vJ5AR2YOoSldDx7WwieGJIvDs6+MOtRhVlTYKYBYbYw=
Received: from DM6PR03CA0097.namprd03.prod.outlook.com (2603:10b6:5:333::30)
 by DSVPR12MB999126.namprd12.prod.outlook.com (2603:10b6:8:383::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 22:19:17 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:333:cafe::e9) by DM6PR03CA0097.outlook.office365.com
 (2603:10b6:5:333::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Tue,
 28 Apr 2026 22:19:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 22:19:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 17:19:16 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 17:19:16 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <michal.simek@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
Subject: [PATCH v3] remoteproc: xlnx: check remote core state
Date: Tue, 28 Apr 2026 15:18:56 -0700
Message-ID: <20260428221855.313752-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DSVPR12MB999126:EE_
X-MS-Office365-Filtering-Correlation-Id: 300e237f-9f3f-45d1-42e5-08dea574301e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 3MHvjfk20BAbV7H1tFNi66xfJIVDx/OnPcj5MI4D15x/5SoRRLDK5ffD6tqEDjghFBwHDZ/mbryj7LlJogUUIG2G8VSovddT1wl8OLzdcSyUkfkIQJasKSydrRQOrQIscVeTLxCkEh1q6DcZT55BQLol7ye8iYx7EB7iw1t/FnnGgqiq/2ORSn7nB5hk/pkt8ru1QoiJ9VgF1PvT8gU9YUK8S2Gh531wHZkbSNlnD8XsQVALOVsaZ4+kpR9usmaf6NtSoC5fOp231lviSJR0BeEzyOR3RZkv9AJoWum341S6UlOPXMXFfLI3OgHVQnn6xCoLiz6KmL6nBjpOtmBiaWkpLGebKHtv2/yB5Lbp6KS197cvQrdCYA6JhwUr6XPrDxjXWfGTEbpKxJBt9yQXDBiQA0eZL1AQe9aKcUhRom2iJ7kHA3jx0nX8uo2SaR61RjKxXkZcS7Q2XcpY/8Zc05j5RouXzFtp2/czuhLT8bBNoGp6IbDXy4b3dXfp/jertC/hiQpI8pNKRx0uQ9bZwiSB7BIXgVALEbtCSIcpgS5G6WoT284au8VigOPSDdEDDaqlG7s0tiLxk0gZ7osIstYxnU5UtTnWF/SZm5BLPsHNtcQE3lQupei+wf9fLv0WZDd7JtQOBF1U+cm4CTkFmzw/+FZxYFmfhOo0OmPZT8MwWwJmzQm1GknkXSiCHQtpdZMFVrQ4wSohZoezjqW2Zj03gttjAFl7kt4HlQcAt7uts4PH8agHs8qmxT1+qEXCXlXfCFCjSGA1qafp1PO3pA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mfyqzv6rs1de6Sx/Q2Wstv0UoPfQPpYG2ldfaqp2986HznRKqV5zY/r3bPR3WvmKdDnOGOiPyHAKXNDrW++3KJ6s11YXJjrfuAFbqE1buZDYhB3CRX6shPWWRt4fErzNZIeOIsQmbEKU6hBKOyQQALBk3qgbom94EIzjpC5mCg9rlpb8vasUg5C1zh90dp9D/gRTeu6bolXaZcyZnHzES0J/EsF7spKqiNfb/kraZfNbH2bdtmxgUItu9KCAeu43rkB2dDIFnORgP6+kRif0frAmu3UaEH2IY9JSit/6DxnYjCr8UeyEqiojhJUELi2eMXqSIVNtx75MlpiqjeJJSskRJAtPetZt04e7xzgzk4qR7ej8bFOselKeIqU9g/UQuDhK3L3Hnc7vi2vWYKh2quCoKjDomz5ciPZmRDdWN+IqLbcYiYb1eC2J75YNoHsg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 22:19:17.4537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 300e237f-9f3f-45d1-42e5-08dea574301e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_151924_636997_89E83EFA 
X-CRM114-Status: GOOD (  26.26  )
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

The remote state is set to RPROC_DETACHED if the resource table is found
in the memory. However, this can be wrong if the remote is not started,
but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
to the firmware to request the state of the RPU node. If the RPU is
actually out of reset and running, only then move the remote state to
RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.

Fixes: bca4b02ef92e ("remoteproc: xlnx: Add attach detach support")
Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v3:
  - add fixes tag

Changes in v2:
  - fix subject line: %s/node/core/
  - add comment explaining optional resource table availability in the

 drivers/firmware/xilinx/zynqmp.c        | 28 +++++++++++++++
 drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++------
 include/linux/firmware/xlnx-zynqmp.h    | 21 +++++++++++
 3 files changed, 85 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index fbe8510f4927..af838b2dc327 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1450,6 +1450,34 @@ int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
 
+/**
+ * zynqmp_pm_get_rpu_node_status - PM call to request a RPU node's current power state
+ * @node:		ID of the RPU component or sub-system in question
+ * @status:		Current operating state of the requested RPU node.
+ * @requirements:	Current requirements asserted on the RPU node.
+ * @usage:		Usage information, used for RPU slave nodes only:
+ *			PM_USAGE_NO_MASTER	- No master is currently using
+ *						  the node
+ *			PM_USAGE_CURRENT_MASTER	- Only requesting master is
+ *						  currently using the node
+ *			PM_USAGE_OTHER_MASTER	- Only other masters are
+ *						  currently using the node
+ *			PM_USAGE_BOTH_MASTERS	- Both the current and at least
+ *						  one other master is currently
+ *						  using the node
+ *
+ * Return:		Returns status, either success or error+reason
+ */
+int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
+				  u32 *const requirements, u32 *const usage)
+{
+	if (zynqmp_pm_feature(PM_GET_NODE_STATUS) < PM_API_VERSION_2)
+		return -EOPNOTSUPP;
+
+	return zynqmp_pm_get_node_status(node, status, requirements, usage);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_node_status);
+
 /**
  * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
  *             be powered down forcefully
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 50a9974f3202..45a62cb98072 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -948,16 +948,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 		goto free_rproc;
 	}
 
-	/*
-	 * If firmware is already available in the memory then move rproc state
-	 * to DETACHED. Firmware can be preloaded via debugger or by any other
-	 * agent (processors) in the system.
-	 * If firmware isn't available in the memory and resource table isn't
-	 * found, then rproc state remains OFFLINE.
-	 */
-	if (!zynqmp_r5_get_rsc_table_va(r5_core))
-		r5_rproc->state = RPROC_DETACHED;
-
 	r5_core->rproc = r5_rproc;
 	return r5_core;
 
@@ -1210,6 +1200,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 {
 	struct device *dev = cluster->dev;
 	struct zynqmp_r5_core *r5_core;
+	u32 req, usage, status;
 	int ret = -EINVAL, i;
 
 	r5_core = cluster->r5_cores[0];
@@ -1255,6 +1246,41 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 		ret = zynqmp_r5_get_sram_banks(r5_core);
 		if (ret)
 			return ret;
+
+		/*
+		 * It is possible that firmware is loaded into the memory, but
+		 * RPU (remote) is not running. In such case, RPU state will be
+		 * moved to RPROC_DETACHED wrongfully. To avoid it first make
+		 * sure RPU is power-on and out of reset before parsing for the
+		 * resource table.
+		 */
+		ret = zynqmp_pm_get_rpu_node_status(r5_core->pm_domain_id,
+						    &status, &req, &usage);
+		if (ret) {
+			dev_warn(r5_core->dev,
+				 "failed to get rpu node status, err %d\n", ret);
+			continue;
+		}
+
+		/*
+		 * If RPU state is power on and out of reset i.e. running, then
+		 * assign RPROC_DETACHED state. If the RPU is not out of reset
+		 * then do not attempt to attach to the remote processor.
+		 */
+		if (status == PM_NODE_RUNNING) {
+			/*
+			 * Not all the firmware that is running on the remote
+			 * core is expected to have the resource table. The
+			 * firmware might not use RPMsg at all, and in that case
+			 * resource table becomes irrelevant. However, we still
+			 * need to make sure that running core is not reported
+			 * as offline. so do not decide remote core state based
+			 * on the resource table availability
+			 */
+			if (zynqmp_r5_get_rsc_table_va(r5_core))
+				dev_dbg(r5_core->dev, "rsc tbl not found\n");
+			r5_core->rproc->state = RPROC_DETACHED;
+		}
 	}
 
 	return 0;
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index d70dcd462b44..7e27b0f7bf7e 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -542,6 +542,18 @@ enum pm_gem_config_type {
 	GEM_CONFIG_FIXED = 2,
 };
 
+/**
+ * enum pm_node_status - Device node status provided by xilpm fw
+ * @PM_NODE_UNUSED: Device is not used
+ * @PM_NODE_RUNNING: Device is power-on and out of reset
+ * @PM_NODE_HALT: Device is power-on but in the reset state
+ */
+enum pm_node_status {
+	PM_NODE_UNUSED = 0,
+	PM_NODE_RUNNING = 1,
+	PM_NODE_HALT = 12,
+};
+
 /**
  * struct zynqmp_pm_query_data - PM query data
  * @qid:	query ID
@@ -630,6 +642,8 @@ int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode);
 int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
 int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
 			      u32 *const requirements, u32 *const usage);
+int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
+				  u32 *const requirements, u32 *const usage);
 int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
 int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
 			     u32 value);
@@ -939,6 +953,13 @@ static inline int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
 	return -ENODEV;
 }
 
+static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
+						u32 *const requirements,
+						u32 *const usage)
+{
+	return -ENODEV;
+}
+
 static inline int zynqmp_pm_set_sd_config(u32 node,
 					  enum pm_sd_config_type config,
 					  u32 value)

base-commit: fcdf2df56d34a3f04cab0725c5bc3abdaa73c2be
-- 
2.34.1


