Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A014FC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y9wyG40A6X3o7u59yCn+i4uUB/drIoRNt9cZ2dDX84=; b=XefaMHfhTXBl/5EqlbWE+dXkQ+
	UTSw1Jnmz779y0O1dnOWXSBxyZ8xcV3TTRT2aNVHuJRpSHe8DnpoWJkENOZKP2pqSwM9pHNZiM7+I
	4rf4a8XJEKw5fUV9WwLWGMIBZflyjOzOMp/TtZhJtxN6VSOFUZ3nRKo1qhInmGpfmP8KSM6hFcUzu
	a3ItW9lrccBMSHBssUUxuSLWd3GgKHMjON5aLJ1pJx9S6rVZCSk/HFRHoq3HhjGgem/Nn+HvPzuU9
	hkSAHehqfcozQB6xuiI47wf8olASUec60EcCyrGuQ9srhqCGaKL6/lcNWn8Z3W7AyeOgbCpF7eF4i
	r7C3rEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmssp-0000000EGwL-1xHj;
	Thu, 23 Jul 2026 12:50:39 +0000
Received: from mail-centralusazon11011050.outbound.protection.outlook.com ([52.101.62.50] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmssj-0000000EGtC-1pAC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:50:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1KqM0xhhR/FJm88HbuUl/8Ji9ebfIZhgNQsqPCenILNZbX7bzUAaXHrktd8Ow3TnuwKy2pX7KjV31caRAiPMTGK/B+Jx5i2uw8jLe8arW4C+FwTIY5CcdR/aQD6Zops58doz1YJSNFr+s33IziJF+Qg9ccH9g6bARkGYo8BhzPaa2LU43QOT8CdAgweecYW+Zj8Lm96KiVH7X6zkVKI8M8sIFDeVGe9yHnWevm7fzb0tBMjU6g3Xl3Tk5GM+/rjeB5qZcAhbWEBxKzdgxNLNgULtsEbpWUX+TRScePEcymtRX+xmuti0/ISDMimlRbGBL97kCPGAtIGSCCXNvVLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Y9wyG40A6X3o7u59yCn+i4uUB/drIoRNt9cZ2dDX84=;
 b=AaCsq5UTAs+HOP/lHfLEhSqF8DO884CBj4F23ZbTuluMoyc0uPPZkhWCea9yhBTOrCjIE7LuBVAmWZn2zj+F3+vC8SZx7NDqytZzuizaa0NVXAXGCAlziLDiNsMjcj9TRxQmkB16e0zDSB6vIjp7o3/cQ/M6D5lkI9SCfO9tZ5IfB6fI5UBC3m1DioKAUFaBJXwU/20h/B4ynbpAuhosTTAOf6tQyjKgkyGRP0vHSSZkCYrWnjC9KoYl2VvpG78UfI1v8U8Tn6JLAZ1aCHTDjCFW7opMPUWsp9C4XcaUhw4U8V/hg4Skqbi1ErO+3kliPoE5HybMjvhTpV3eyeOG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y9wyG40A6X3o7u59yCn+i4uUB/drIoRNt9cZ2dDX84=;
 b=KO6kkFSlGSYyRQG1y/3uw99dAF+d1U38F/AVLh/cmmXE6x1MN/EJwXY7m32NNRbs94EV/gbYdf5x90mtKOOwEGh8DCeMeqdMJ8wtYTRGahrAW6aQCpmW1WkonVPH7WfpGWsFe6ldk+ZOGybhvbsjg3Lf1dtAIPgZ6EOdxD0UPEk=
Received: from SJ0PR05CA0117.namprd05.prod.outlook.com (2603:10b6:a03:334::32)
 by BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 12:50:25 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::2a) by SJ0PR05CA0117.outlook.office365.com
 (2603:10b6:a03:334::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.4 via Frontend Transport; Thu, 23
 Jul 2026 12:50:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 12:50:24 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 07:50:13 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <git@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 1/4] firmware: xilinx: Add support to clear TF-A PM state
Date: Thu, 23 Jul 2026 05:48:38 -0700
Message-ID: <20260723124841.2567827-2-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|BL1PR12MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a64faa-67c8-4ccf-e041-08dee8b8f69c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|5023799004|11063799006|3023799007|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: YzT7rE1yu6gz5TtFXCA7Sau7k9BW+DNbB8T5s1uJlQGSPWNdbA8cKUkldoGFryLYSQZK5bjSWC5e33EmNnt1ofUkt3a1Z7wS7AuSfmLy9nPsI3SQtv0Iz1Gft57CK4P3JvfqsUeKAvURF5gF4zhBB0dpScomVIdJ/74SR4gl8+ZA3P5NzRTHw6X/Ec+tF+vbpnfV7esCjWec3JlFLGyAnXPez8ifAiIH0ydCJ4d+5vYU79Lx8lQvLeaDYaSVrVXO/Mqg2SSKByQuhbfD/WR1VgD+VLuVGOVAQo5SrO+veULh8ISSL6okWzSo5wmAMr8iZy4JdXJ3quEe6TFKKv1vjIqEakHNw7nEk0cCD/8KWpo48/zBQCqqX13ZZBeSC9c63T9dqHoKZwoOD3vqEzN6fT5KEqpFbi/G+unWcrZ28WrciE/osARg2tlzwYLRHY6Zptn65zeuI2WodbJZWJZw1yguAFwxUjHVi2OkS5suhZG/2PWPmnFDZrCHkzXNIiKI8GRZJmULf6/t50hgeqzHaduF6YeuvzMaKmdSdv5BmHmvrLH0+HlC3Cu9YIRTfUuLYaHXUc1t9/lzps6BUrd870U7rFmf0/uMJBCjvgxli5B0AW4AX956nK7cjsOzrrUoprhp8hgj7iu1LLVZLaEkr6TgctDBuG9z1JWsWpnpcw7kfLEhvWXbsCtWlL21QhNjsOLHLs+e8gwPFIO6nTZbrw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(5023799004)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dQbIJUmxPYPWzGxgOxuYXUEQUSYJp9mLV8vAtCPes0Au1f0I5z97V3JJypY6fiVGnvGLhSLt1KCFicucCmv5cCz3pzTNuXZ8bfWo2NgMa5Qp1JOJWtDXw+RrShdKjr75BZqDYpLygO8mIcgyX10Qeek6t9JkP0wvBMDVZSRU6PzztuDMgbb6bIeSIpDa1tXfq2VS/AzAmG638cHOvnuTOfSKddW99Xu3i2L9Rfufn6krR/gr3aLNjSRTYKsDJFylO7U+t7ALP4kS/pNXPu1Iseo8DY/I9fiaUzs6XNU6pZhpJKUCAd6Bq4cB3nulf+N/7vZe8SyunaWE16gAGKvdg8ydJLzJTuxuW0dUBGfqSiMrDVvD4z1l4pn02x1l4Yl0Uq4WsixWtexLygelf2txQvQeoB1qpGpq96Le+tEQraOB/JV5LdLVm4ijIhhminlz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:50:24.1024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a64faa-67c8-4ccf-e041-08dee8b8f69c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055033_481089_9BBF343C 
X-CRM114-Status: GOOD (  26.77  )
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

Currently, during a kexec restart, only the kernel is reloaded, while the
TF-A specific data remain unchanged. This leads to a mismatch between the
kernel state and the TF-A firmware state like SGI number and shutdown
scope variable.

For example, the kernel registers an SGI number with TF-A so that TF-A can
notify the kernel of events via that SGI. TF-A stores this SGI number in
its internal state. After a kexec, the newly loaded kernel re-registers
and may request a different SGI number, but the stale value programmed in
TF-A remains, so event notifications are delivered on the old SGI and are
missed by the new kernel. The shutdown scope variable has a similar stale
state problem.

To resolve this, the TF_A_CLEAR_PM_STATE PM API is introduced to clear
TF-A-specific state during kexec. On a graceful reboot, this API is
triggered by zynqmp_firmware_shutdown(), while in a crash kernel scenario,
it is invoked by zynqmp_firmware_probe() in the reloaded kernel.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 48 +++++++++++++++++++++++++++-
 include/linux/firmware/xlnx-zynqmp.h |  3 +-
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index af838b2dc327..95ffd8f33ce9 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -3,7 +3,7 @@
  * Xilinx Zynq MPSoC Firmware layer
  *
  *  Copyright (C) 2014-2022 Xilinx, Inc.
- *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
+ *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
  *
  *  Michal Simek <michal.simek@amd.com>
  *  Davorin Mista <davorin.mista@aggios.com>
@@ -13,6 +13,7 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/compiler.h>
+#include <linux/crash_dump.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/mfd/core.h>
@@ -2065,6 +2066,42 @@ static struct attribute *zynqmp_firmware_attrs[] = {
 
 ATTRIBUTE_GROUPS(zynqmp_firmware);
 
+/**
+ * zynqmp_clear_pm_state() - Clear subsystem state
+ * @dev: Device pointer used for logging
+ *
+ * Clears PM specific data in TF-A.
+ *
+ * Return: Returns status, either success or error
+ */
+static int zynqmp_clear_pm_state(struct device *dev)
+{
+	u32 pm_family_code;
+	int ret;
+
+	/* Get the Family code of platform */
+	ret = zynqmp_pm_get_family_info(&pm_family_code);
+	if (ret < 0)
+		return ret;
+
+	if (pm_family_code != PM_ZYNQMP_FAMILY_CODE) {
+		/* Check if the TF-A supports the TF_A_CLEAR_PM_STATE */
+		ret = do_feature_check_call(TF_A_CLEAR_PM_STATE);
+		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_1)) {
+			/* Clear PM specific data in TF-A */
+			ret = zynqmp_pm_invoke_fn(TF_A_CLEAR_PM_STATE, NULL, 0);
+			if (ret)
+				dev_err(dev,
+					"Failed to clear TF-A specific subsystem state: %d\n", ret);
+		} else {
+			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported in TF-A: %d\n", ret);
+			ret = 0;
+		}
+	}
+
+	return ret;
+}
+
 static int zynqmp_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2118,6 +2155,9 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	if (is_kdump_kernel())
+		zynqmp_clear_pm_state(dev);
+
 	/* Check trustzone version number */
 	ret = zynqmp_pm_get_trustzone_version(&pm_tz_version);
 	if (ret)
@@ -2151,6 +2191,11 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 	return of_platform_populate(dev->of_node, NULL, NULL, dev);
 }
 
+static void zynqmp_firmware_shutdown(struct platform_device *pdev)
+{
+	zynqmp_clear_pm_state(&pdev->dev);
+}
+
 static void zynqmp_firmware_remove(struct platform_device *pdev)
 {
 	struct pm_api_feature_data *feature_data;
@@ -2210,5 +2255,6 @@ static struct platform_driver zynqmp_firmware_driver = {
 	},
 	.probe = zynqmp_firmware_probe,
 	.remove = zynqmp_firmware_remove,
+	.shutdown = zynqmp_firmware_shutdown,
 };
 module_platform_driver(zynqmp_firmware_driver);
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 7e27b0f7bf7e..baaa88b0b197 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -3,7 +3,7 @@
  * Xilinx Zynq MPSoC Firmware layer
  *
  *  Copyright (C) 2014-2021 Xilinx
- *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
+ *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
  *
  *  Michal Simek <michal.simek@amd.com>
  *  Davorin Mista <davorin.mista@aggios.com>
@@ -66,6 +66,7 @@
 #define FIRMWARE_VERSION_MASK		0xFFFFU
 
 /* ATF only commands */
+#define TF_A_CLEAR_PM_STATE		0xa05
 #define TF_A_PM_REGISTER_SGI		0xa04
 #define PM_GET_TRUSTZONE_VERSION	0xa03
 #define PM_SET_SUSPEND_MODE		0xa02
-- 
2.34.1


