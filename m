Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D319CC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pMyIKtaYztxDrH/xg88SmryBUsGU8Bdo9poK4THcbA=; b=fKePewgB4sr8sD3Yiwt0gKdoTn
	5lKKnagRjvKXQrYZZlH6Q47BBGJl8GaSGjPGLtdP0ufpXRMaojE7jEC1nMdEAVC45oGw0B5nkMtHA
	zpfQ4Xka11CQ5hTOKrurZ4QxfImzfjCyZ3zEjNszk/8vmA5zHUuURgu4HHXQwH1ZVLlnQ1HIkfUTM
	5Kv00c6KkYY8Z+LLZq0kmJY1PYuoIc76ZzZqiOSbfs33VFkDRy37d68F3JcXCZlKo3btZBXY7hiJy
	iyLd351xugcbev0OX1uuFDVHB5YVOB5VdUaTg2iZ1z7vLXHg2aunK8JizOs/D2IXK/NTPHLT43GY+
	ujtfWuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD1Z-0000000G4L1-2Ypf;
	Fri, 24 Jul 2026 10:21:01 +0000
Received: from mail-westus2azon11010008.outbound.protection.outlook.com ([52.101.46.8] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD1H-0000000G48g-3BM0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:20:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgexLmqzOQv6VNF+RMYEFYQj3YA2YrGbOi6KSy61+xqAhgfo3+uzmp+V1ApMl9VD3uJ5RV1vNhYxPn+SS0GCo6f+U3JInw4ukCue801rbQwjTzYnwhPERLpDltL5ahnxOnuD4WP/MF4a0L/wDNHfBpjLnbNUzOyCIDVUFRZCooio04IiwK9QadEkPxtTbhB0XEV8jLWlhXiFX9ZheJ44vWZR2jPnNo8WCw7rN9pwZfjsMVNxp8usK5nAqcd6ZqgvM5ZpP2RYmL6JUAsOuZEWHuokH+5dVdR5Tv1c+XG0WtNnmW5vJaPhvdW+gxfZH/BSSxdV9nccNg3bWmpKKakHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pMyIKtaYztxDrH/xg88SmryBUsGU8Bdo9poK4THcbA=;
 b=F2VZgt+7tCRtwIJTdMuDWQyWSXQJeCAUnVzac/tsdlUQWUcTVrQseGQtLNqnxnRO8w1HO9eo37Xb3aXeuciZIWcIze4SBKOhezUaiTOyc/OFEeQlxykpcRSSykWTfg4E6k9KtQTd1ctumcL1tCvv+zvv2LIFn18qbV1OzXi90kLz98Ivk3qyEfS4QHwJUY9PAlcN4njBEiocuvYA0L05W8MaVegPygLZrohAPVB9ZumUZKRpiR7kHSJKGTrHn3gKkSnwV9+lKzj9Y8zi+pZuCIckMnO1qumiUYTZUhfw6vWVVZTi2TIA6e9AGKoUKPvB9Z8Sjt3HdeqE15x7x4I+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pMyIKtaYztxDrH/xg88SmryBUsGU8Bdo9poK4THcbA=;
 b=oGZIai8eAm1xhdyYEIR+pjeonoxhf/+z1yK0BLMnahbTr3l6PK3NcoBPXQNimQ8xfBnml+qCzHnLeqRehs1D+qUvS4ZrntdDWNh4aU1wJP5o/0huMn7gXwPuejXXsSkyONbKCQqwLJLrr7jbU/Rq7gFODej0k7TTDDHwhrKsA1c=
Received: from SJ2P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::11)
 by SA3PR12MB7976.namprd12.prod.outlook.com (2603:10b6:806:312::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:20:33 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:5da:cafe::1c) by SJ2P220CA0004.outlook.office365.com
 (2603:10b6:a03:5da::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 10:20:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:20:32 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 05:20:32 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ptsm@linux.microsoft.com>, <radhey.shyam.pandey@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH v3 1/3] firmware: xilinx: Add support to clear TF-A PM state
Date: Fri, 24 Jul 2026 03:19:46 -0700
Message-ID: <20260724101948.2895263-2-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
References: <20260724095301.2890001-1-jay.buddhabhatti@amd.com>
 <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|SA3PR12MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: d1185be3-0566-49ae-1baf-08dee96d31cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|6133799003|5023799004|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: sjMKTm6vFOva4zEY48xrZ9dXDORZXrIZO76ZhZtNIFv0mHgM+sYnH0RKcLa1zsFYEAoLXb6Y5FzR79tkTnNIQ1lQ+mHfLISw+u2Jj70YkL2/G9GRLtKlqf03vSiZDx0db0Xqkmm4U0ICQ+Bw68lZz/glT8HFyoEchhMT438bjQrB8Y6+/fXCHGHACbGJ1Ol7YqLN/tZVPHtbnkei2YTCYoHxrqzJHkTH90PhHQTsdnuHsfzvEuGmv+7DLzt8/QnMHbQzkK/Zatgv3iGoeR7gBj/qi8VSCZucwMET3RRPTnAyC0UCHEA4rWFVpjVDbvkRWFwiOCsEIXTyx3lM36FJFF5KA6CRdrZEzDH8qdF+faSn/yqyieUlY0noppS1dgoztBjv/c8gAj9uwn9ywzUutXOVZKekFrH8D9/daw75T4x0UioY4mT+W2/EBQ+j4dorhXAiqS/IpBoW3QIz/9Oinb0/SvBiVPlRR9grWmJK2kbxUEKj42YbZFqUeE2ToeUN+n4wr1HWTy2zl8qq19TozXEUENUuAmOf94xOCyAcfcv2MWAgiOnmeymDoS30lDMZNz9RmPZ+wj3FgWKwLvL+sJEm6EzdcVqRjofETBVDEZkFJAulbS8PnWolppD4fmOyeA6xDLNtZHtmMYuPfWdY+MKQ9Tq+A3Q9/3tldsDWiWCS7DcO1sGJ99uJmDjepKyYKBafiKtNqNGX40aTmoMj0Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(6133799003)(5023799004)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oy4VBcvE/BFXguNhHhMATNkCexF76QCa2gyInuvuFq2XkM6irJGfUV2wNP9KsxsNCdzyvv6cG9iMyl/Mqmw8FJIQsDUytwF+pAhFypRrgrbbempiNwUkVL7RxGoULilCnl10XfDIMSJx1g2uwa6h/FoTU2Ni6o65SvRbb9L9jJbVjXH/XXQoa/1a/AUgE8Jb+99Cuh+D0/F+0MfxkflmhzkWHFFe/P0yt/WIFzTeKPxzlYYGxn4dpJzzfFxsKzJsQ62jodxjE2QHzJ+H8dN4Ivs7Y+56e99oRZecrUqzFZ6QzYj8PtM5UQQd0bewfH+qE+ixMy9rg4gRV2TDrOOQ9n8mCZ5bzc5Lx9tBXPje8S1cimpoZdAIrR1XBvbACk63ZsVFxnx1y1u0mi7DaEpoi4siJ07J9ChbH/eEFIhRTRjWk2cMjHgfX7bPYW/pUJJ/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:20:32.8205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1185be3-0566-49ae-1baf-08dee96d31cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_032043_809890_B98569CA 
X-CRM114-Status: GOOD (  27.03  )
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
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
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


