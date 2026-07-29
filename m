Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3B5C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wqTfSnhbOvIaz/TKGaN+eMqddlet2Cb4gm56VY/j9o=; b=FZBoYhICpx5xIEg1LDjNzpbR0Q
	lQMZRjQAuNXrr7JFtF0EekZZWCRG6BK/2T1Ku24EpwZGVoah/c6wHysF8Vpt5nYNbKJhltypzA77t
	+2tx5sHKWwrqi48Ql0aHobA8mYOUp0u/qYjqLQQRH3SJsqvPhRCJfjKWt9cN+jH9G1UJfzjk/G6LP
	ZZPFa1jyoLCK1kIA0CjDa0VYSiySuDz1pyyV4HN4IVKaRXu/Olqr/o+R6pRIV7knx32kkr7yU9zCs
	WqSnM7YEJUHYeetjpYLbd80mO8dOAJUSuvyiHFC6LriYY6XCnKF67J2i+0I+ct6ukGwZvzVMB25/1
	PtrGyQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Mn-00000007u3y-3UVF;
	Wed, 29 Jul 2026 12:26:33 +0000
Received: from mail-westcentralusazon11013000.outbound.protection.outlook.com ([40.93.201.0] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3MV-00000007tng-0D5c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:26:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jP63UmpTQOADhchlXFtriZ5+gp7kf8qn3KkBwUUmnqqpT2zSvkjKkCpRymrrM9LvzCt53gD3w4pKjXH2jlQ/lsOog6i6gfrkSO3iGKU3S2Fs2Jb8MAURbXf0OmPqHhrHyR0hWU92AiHVKgVA9xI8v8KQ5R/m2i+KAzIqB0Se7xUV96nPuff/ycVifLUmQrezl7h6P4fBCbnjC2rTKGqsPK/FRFFyRlFl+OyY4VuRr5JWbOB18rAV/0cfPXeYzfjLhVKpHDW8bIyzrNarOxmWJaihc4r3EEMbplJx/xcEDMLgu8LZNeucEi0UsPYfKhSzdmvd4DxYjv6s+YQrrdQGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wqTfSnhbOvIaz/TKGaN+eMqddlet2Cb4gm56VY/j9o=;
 b=OLCKcQyg8oJe914scXGeF5Knr2vv1PLyT/SwbLA43nPVxzXAmFd1uZqdizcGrx5zTSZxOYI/gcApaJ9VUGl4rRZ+62DEATq0AklH6zaQv1tAaiRTHF6Zk8L94PoVyc+zQZBpBHj4fEaDyaQhl4MCBxJ8o/YYSWSLOghCSnMWrLF45/NhqjLmJRtXwLGAwRrFMoC4bTv5Bh9sUVZqN3Ktf08ABIa/leNWgO6l2RP5jI2XKLpbVDwnazhCRgH/kks4vHRumEzEd554EMRocME+L/RYhfWANoNo8QdavRYzYqN+YKuJX4jWhakQG9yAPsxLAJ3rG92y9pch27fFYfYETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wqTfSnhbOvIaz/TKGaN+eMqddlet2Cb4gm56VY/j9o=;
 b=ZUiO5JwY+aFMcxCweZxGVzLE1LjDrW2s36OSLAK17jmizJUrllz5kQ1n4CXIsBXwKErulP2CIkMUKctYxFCdDmHgDXtEsYTSYCVK9weyF7UBCiyLYEuWf9g/QZshgRQLyUU0xFxwur/YOYtLAOaM6h3qeFX4oZv04BKnpw0+7vA=
Received: from BN9PR03CA0725.namprd03.prod.outlook.com (2603:10b6:408:110::10)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 12:26:04 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:110:cafe::7c) by BN9PR03CA0725.outlook.office365.com
 (2603:10b6:408:110::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 12:26:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 12:26:02 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 07:25:58 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <git@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Prasanna Kumar T S M
	<ptsm@linux.microsoft.com>
Subject: [PATCH v4 1/3] firmware: xilinx: Add support to clear EL3 PM state
Date: Wed, 29 Jul 2026 05:25:20 -0700
Message-ID: <20260729122522.3732875-2-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729122522.3732875-1-jay.buddhabhatti@amd.com>
References: <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
 <20260729122522.3732875-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|SA1PR12MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be54b97-ede8-4dad-aaf0-08deed6c8d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|6133799003|18002099003|22082099003|3023799007|5023799004|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 3rHK7XVEo0oI5CpLtVimvdqxrelZdhm1vA7nkMGcj7L7WG3f/Y8Sl1l7xmSfkn9CfxtK0qSrTIvO0XacUFzzzYcGRBCuVPQC6a65SZbW8fEwgKskX57itUXilXTYIIxPrOmqjsQefHZY9Ijdl5EPfiReyIcy3zUwB4JOvdHKmVj8CKycWx6ks75+pgY5vNjXuvVRNdChSeBJO6Fl7H/+/AObkyCserSRxC0jPTZljAdT3IGOAzpn1naaQmbe/FHl6uzK9hUf8uUJaB9LOzCl7umP1TkaNB6IcNS8i+DvgYOfIcqVRMrDtTFND2dT2CUnADorl0Ys7bWun/sVxXk9c5ihkuhIgd4toBLWGxuLqI6N9wG65vMj5ZKF+y3UN82az3QYFb45/G3yTOb0U3ru9THSX+m8OcCFrAXDV80sCTgOhKBeugaiULt8vdCLJRLhgp1n8VdJ26ZUXpT2pob72ong+GPx667KnYFx7bJkwtUIyhi30ZOwHHcYqyh+gFyuhqGuoXq5p+I5+OVlmJUBzbTdnSDwok3rndkUOfpVIQWnZWhbuzHGcVdJ2FuLl5B7fvtTN+3SkJCORjuYb5DBsE1Q72+4VkZQB6neir+dj10ZSUgpjzdZGjq/KHqF2hO/w4ZLa0EQMYti8dW2uA+fXlJPctkAIBqKBMRY8leUyktLoEz11NBvbOv0QlL7vXsZFzYuaUrSddm3nxtysSfy3g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(6133799003)(18002099003)(22082099003)(3023799007)(5023799004)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +ZZApVIlkW1JLQLmhRs3WL6hIciIS0MolsDvN2XZGXWNgOfb/nbXpYOJl6XAx77oGqDBNXz9WCKvLjavHGfCQ3KilN3vg0jv//aE4Ller9ZuUrZWuYxjabyGHcM8v19EtRFpg01J5f0abM7vwxI8BuvmzVqelCVPqvH2MwhnoVC+1zP6nF8pR/UCY++wD6WHePGcmYozscwkGkagyN3XE84DFxG4If3zAEG1I6NaoGoa1auSXi1EmItxSE9t8RSqLTvjTuqJ+PitSczqhi8YFNKOTNGZHNCE3b3POTti0pv5MvmEs6ENqzmgazrYUpF76BpdEXgljNn/6poef60sXSEjU8MkbAIUyyZKIKwSa8AvRKhG21u1fpuRzWt46fmCUE3zZS5IEqKLTQ3Sl98LvVY8YAhIavFDSaKjxfRZ0S1Hy/KfKyeKyJjLr96bsDdR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 12:26:02.0474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be54b97-ede8-4dad-aaf0-08deed6c8d96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_052615_101164_D0B238E6 
X-CRM114-Status: GOOD (  26.46  )
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

Currently, during a kexec restart, only the kernel is reloaded, while
EL3-specific data remain unchanged. This leads to a mismatch between the
kernel state and secure firmware state like SGI number and shutdown scope
variable.

For example, the kernel registers an SGI number with EL3 firmware so that
secure firmware can notify the kernel of events via that SGI. EL3 stores
this SGI number in its internal state. After a kexec, the newly loaded
kernel re-registers and may request a different SGI number, but the stale
value programmed in EL3 remains, so event notifications are delivered on
the old SGI and are missed by the new kernel. The shutdown scope variable
has a similar stale state problem.

To resolve this, the TF_A_CLEAR_PM_STATE PM API is introduced to clear
EL3 PM subsystem state during kexec. On a graceful reboot, this API is
triggered by zynqmp_firmware_shutdown(), while in a crash kernel scenario,
it is invoked by zynqmp_firmware_probe() in the reloaded kernel.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 50 +++++++++++++++++++++++++++-
 include/linux/firmware/xlnx-zynqmp.h |  3 +-
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index af838b2dc327..b99dca9b8cac 100644
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
@@ -2065,6 +2066,44 @@ static struct attribute *zynqmp_firmware_attrs[] = {
 
 ATTRIBUTE_GROUPS(zynqmp_firmware);
 
+/**
+ * zynqmp_clear_pm_state() - Clear subsystem state
+ * @dev: Device pointer used for logging
+ *
+ * Clears PM specific data in EL3 firmware.
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
+	/* Supporting on Versal and Versal Net platforms only */
+	if (pm_family_code == PM_VERSAL_FAMILY_CODE ||
+	    pm_family_code == PM_VERSAL_NET_FAMILY_CODE) {
+		/* Check if EL3 firmware supports TF_A_CLEAR_PM_STATE */
+		ret = do_feature_check_call(TF_A_CLEAR_PM_STATE);
+		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_1)) {
+			/* Clear PM specific data in EL3 firmware */
+			ret = zynqmp_pm_invoke_fn(TF_A_CLEAR_PM_STATE, NULL, 0);
+			if (ret)
+				dev_err(dev,
+					"Failed to clear EL3 PM subsystem state: %d\n", ret);
+		} else {
+			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported by EL3 firmware: %d\n", ret);
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
@@ -2118,6 +2157,9 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	if (is_kdump_kernel())
+		zynqmp_clear_pm_state(dev);
+
 	/* Check trustzone version number */
 	ret = zynqmp_pm_get_trustzone_version(&pm_tz_version);
 	if (ret)
@@ -2151,6 +2193,11 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
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
@@ -2210,5 +2257,6 @@ static struct platform_driver zynqmp_firmware_driver = {
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


