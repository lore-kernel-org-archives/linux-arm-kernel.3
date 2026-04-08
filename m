Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3F91073C9E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeeVd8ZqW1ax7ykRMCW/lrIvTE/7BOIK2nVzG8VcnCk=; b=ZYxMKL5iumgs53J+eYlI7Jr993
	FM0nUK0dSc2YoskO1qt4sYvFCc6MU/p3g3M6uf9mjOovRyBsq04oIy3HdfeDJ7tMNN50fcJS6qovF
	3v3OGpIcgyKRuGorf+Xv2gvDdQGjx1b4TZPDS/LbXkS85NooSZWM5Wvg4zo86Px6ZKD5BtBsI9u/p
	ZVhoHqiWXHH5haODHGXpcnkNUGz2wdEL3aAOxEMZuQ81ZiC1gTy3lroRFNAmRfq+YdN2+HoNxe+Mm
	peH7kKLWvrqL4xhOUlaF1QT8jVCFHXRE0ocx7DL95j4ve/kZA0Si4Y4WIxm1nhTWQY3ZotdLD+nOB
	dqGx0nqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARJE-00000008lz5-2Ffj;
	Wed, 08 Apr 2026 11:43:00 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARJ9-00000008lwt-3yBL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:42:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+1erlvsqmsQk3X2E7hLs0gSBCQA83NIRSVUsp2OY23+HfkbcH/TQuQT7NsE485p+KjPUOl1iVltZ4NxdfGv1yO9xJdAK1VGEexx8KZRm8tlIEn35dOaBH3opFsSryyy5FNlXunBopR2V377Af4ZWaN6dHBwLQ+asxJZO7kb0oU4AdwVxIyYj68k47YTJ01bzaMqybUjVFIq/OzuE+7cwVBpDI6OC0TrIYlEym86dbOHr+IK+OuAgTVh/EQOmazLQpWxe1XtQJr6l+nmH9vEj9amIq2DSXWhS0aFlVkRQTOK6fNI1xYxpJyPtj1EctnOq184ngUI/nJhPiiAkziYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeeVd8ZqW1ax7ykRMCW/lrIvTE/7BOIK2nVzG8VcnCk=;
 b=nm4naIWFwzGpay6o7t5eOSo5AfJ5miCy1SFLKfpabv3xJ0S3QXNH9kjmrwu7Y3k1Xl954MO2s1vlYHrehH38ZunTQbSDPSrGkbWGJY2FJXQQQ/+SQgd9u8zLg205oUo9Fn6ypkZKDx3H2Q7em4IBIvFWbPMW8IXOYjP4hmweZHglBz1d/QhPScx9b5e20RFZNBCFDO7npL2uwMdk1ORVcym0FZ7CDgAKJVtpSBMlJ+ZalM9boNZDEz1GbN/qKfkVDo53ozHh6bxVGo/lb76LLOWDXoZ2WjqeIOhMYUYW2vxgmtgZHqHitwyTXSG2fnsm3wS46oa3x7D4j5COJrMAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeeVd8ZqW1ax7ykRMCW/lrIvTE/7BOIK2nVzG8VcnCk=;
 b=D3EUSibNKtvBD0APK+MbkWLnVeADZAMS42PIGyDNGK1SZI9CJJ3K7PfV7BxBi3fvsO8KTsXjLuHO85+G9UMDigM8psFKpNPYOe8gKE1hQ2jK/ZvojW2l4ztUdQejwGP/L2IcMQwPtoX27W1BDX3YLZffF5PJ4wqL+wi299e8hvI=
Received: from CH2PR08CA0020.namprd08.prod.outlook.com (2603:10b6:610:5a::30)
 by CYXPR12MB9385.namprd12.prod.outlook.com (2603:10b6:930:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 11:42:47 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::5e) by CH2PR08CA0020.outlook.office365.com
 (2603:10b6:610:5a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Wed,
 8 Apr 2026 11:42:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 11:42:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Apr
 2026 06:42:47 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Apr
 2026 06:42:46 -0500
Received: from xsjarunbala52.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 8 Apr 2026 06:42:46 -0500
From: Ronak Jain <ronak.jain@amd.com>
To: <michal.simek@amd.com>, <senthilnathan.thangaraj@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ronak.jain@amd.com>
Subject: [PATCH 2/2] firmware: zynqmp: Add dynamic CSU register discovery and sysfs interface
Date: Wed, 8 Apr 2026 04:42:44 -0700
Message-ID: <20260408114244.2852015-3-ronak.jain@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408114244.2852015-1-ronak.jain@amd.com>
References: <20260408114244.2852015-1-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|CYXPR12MB9385:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e5e288-d72d-4db6-230f-08de9563f4ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: yYC49Unl78xwDnjak7CICFTkBmbslbRmWtEPMm8n0UIgm5ix7WwxHC68AE+gZJOQ2WV/ywVjmVc/UMcw1cBTBQbHv0QmsYYDCL18xXb2rhQaumJo8d8NMapoNLjcCbzbOtdPbkFjH6q3AK3y6FYvg0XfevqVKZeSof61ojk8+J9dTzK+G4bDZhUD51KuOLOOHLwK7EUDgJsJfzfHE2VFirqh7iQa1TatsgG/ZZOfbY6k0uIfUROtew6dDyfGuUgDZJG2jN7ZNcDNNcW8yhIqJqUIvR/pfFzFqL7aWWVQd+b/E2Z37ofUTExo9lHsdaNFLHN36PnoItLd3QH4taOI4W/S+LHUyPbiAJP//6CnfUjkczPDA7cRHyqH3+kaeE29IU7sViLb0E4y/2511fjQ7S32qLP035iA1h3SKAbd5zICeP7MqnAPLIfLSrO5WPX6QcRd/ElMoqmNdDLSzCWiSCzrvLIl+yJFt9TWTNW8fxQOMXN38Eea69cObpdp9mI8m544fwuInnf9xc9eo0c09XIHaV5ZS2mfZRHAZMd0qdGGvFAyHHQDC9Gx68kzzjtF63oPDZ1emQ5Ay86Wa779BBlMvHgqsTCiQmnphsCfS7uo8E8uKH8ejKihZNiuC1v9Teyq7wSqyxAL2KmCLeOpTUacKElhM96gI7+yzaTB/109rnJpPIZLSaGA3olpcPLhyEkic/xKUynhLSkOHw7/KuDWAJO62nE8HorfH9xH3+Uyaceou+JT7+xUGJXdximQ8hzIVSYA8vdlGxwNjtrHfA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5D74a2PC9S4jdCXQ0ae/B9t8y08JBDXvn3Y/iakUtTVUfgAGkLvIQQN6oOtcdtrfk0cFydHoE0JYFzZJDt/Z053I0oN3kOdmkCIVq7WnC2esxB5ZWyVPQ5pskWX8zyesPyAi6p1OkE3UJtyFRcizAtFzsCE/6zkAce3m2+fFUOBsnAi9xuV9DQl/sRIAQsj/Ci7hUfWp+KEBZ4aVN9pZvoNJZZaL06z27hYPCIabWsDlYBoykRaa2a26ALpkLX25IdK4+/IhRO/z5mWqI7c0SaHxiolmsj/qWmhiMrO4dmUmQnjG1sH5Brtf5ciBeijb7KAVk0Q3mboxtSN5P+UzykHRpH6yVIH1SL0IdR9zrSo8NPaN2UCjo1yUWB+ksbqkbiGdzhb4LYeL8bQ6r+EvNfD8n68G2KiYNkjVA4z8HUn9Cwx/ntZeBjIsNOpq5sL1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:42:47.3836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e5e288-d72d-4db6-230f-08de9563f4ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9385
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_044256_062938_8581E811 
X-CRM114-Status: GOOD (  29.42  )
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

Add support for dynamically discovering and exposing Configuration
Security Unit (CSU) registers through sysfs. Leverage the existing
PM_QUERY_DATA API to discover available registers at runtime, making
the interface flexible and maintainable.

Key features:
- Dynamic register discovery using PM_QUERY_DATA API
  * PM_QID_GET_NODE_COUNT: Query number of available registers
  * PM_QID_GET_NODE_NAME: Query register names by index
- Automatic sysfs attribute creation under csu_registers/ group
- Read operations via existing IOCTL_READ_REG API
- Write operations via existing IOCTL_MASK_WRITE_REG API
- Firmware-enforced access control (read-only registers reject writes)

The sysfs interface is created at:
  /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/

Currently supported registers include:
  - multiboot (CSU_MULTI_BOOT)
  - idcode (CSU_IDCODE, read-only)
  - pcap-status (CSU_PCAP_STATUS, read-only)

The dynamic discovery approach allows firmware to control which
registers are exposed without requiring kernel changes, improving
maintainability and security.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
---
 MAINTAINERS                              |  10 +
 drivers/firmware/xilinx/Makefile         |   2 +-
 drivers/firmware/xilinx/zynqmp-csu-reg.c | 249 +++++++++++++++++++++++
 drivers/firmware/xilinx/zynqmp-csu-reg.h |  18 ++
 drivers/firmware/xilinx/zynqmp.c         |   6 +
 include/linux/firmware/xlnx-zynqmp.h     |   4 +-
 6 files changed, 287 insertions(+), 2 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.c
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 10d12b51b1f6..37fe2b7e0ccf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29212,6 +29212,16 @@ F:	drivers/dma/xilinx/xdma.c
 F:	include/linux/dma/amd_xdma.h
 F:	include/linux/platform_data/amd_xdma.h
 
+XILINX ZYNQMP CSU REGISTER DRIVER
+M:	Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
+R:	Michal Simek <michal.simek@amd.com>
+R:	Ronak Jain <ronak.jain@amd.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
+F:	drivers/firmware/xilinx/zynqmp-csu-reg.c
+F:	drivers/firmware/xilinx/zynqmp-csu-reg.h
+
 XILINX ZYNQMP DPDMA DRIVER
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	dmaengine@vger.kernel.org
diff --git a/drivers/firmware/xilinx/Makefile b/drivers/firmware/xilinx/Makefile
index 8db0e66b6b7e..6203f41daaa6 100644
--- a/drivers/firmware/xilinx/Makefile
+++ b/drivers/firmware/xilinx/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Xilinx firmwares
 
-obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-ufs.o zynqmp-crypto.o
+obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-ufs.o zynqmp-crypto.o zynqmp-csu-reg.o
 obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) += zynqmp-debug.o
diff --git a/drivers/firmware/xilinx/zynqmp-csu-reg.c b/drivers/firmware/xilinx/zynqmp-csu-reg.c
new file mode 100644
index 000000000000..1f304ce858b1
--- /dev/null
+++ b/drivers/firmware/xilinx/zynqmp-csu-reg.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx Zynq MPSoC CSU Register Access
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ *
+ *  Michal Simek <michal.simek@amd.com>
+ *  Ronak Jain <ronak.jain@amd.com>
+ */
+
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "zynqmp-csu-reg.h"
+
+/* Node ID for CSU module in firmware */
+#define CSU_NODE_ID 0
+
+/* Maximum number of CSU registers supported */
+#define MAX_CSU_REGS 50
+
+/* Size of register name returned by firmware (3 u32 words = 12 bytes) */
+#define CSU_REG_NAME_LEN 12
+
+/**
+ * struct zynqmp_csu_reg - CSU register information
+ * @id: Register index from firmware
+ * @name: Register name
+ * @attr: Device attribute for sysfs
+ */
+struct zynqmp_csu_reg {
+	u32 id;
+	char name[CSU_REG_NAME_LEN];
+	struct device_attribute attr;
+};
+
+/**
+ * struct zynqmp_csu_data - Per-device CSU data
+ * @csu_regs: Array of CSU registers
+ * @csu_reg_count: Number of CSU registers
+ * @csu_attr_group: Attribute group for sysfs
+ */
+struct zynqmp_csu_data {
+	struct zynqmp_csu_reg *csu_regs;
+	int csu_reg_count;
+	struct attribute_group csu_attr_group;
+};
+
+/**
+ * zynqmp_pm_get_node_count() - Get number of supported nodes via QUERY_DATA
+ *
+ * Return: Number of nodes on success, or negative error code
+ */
+static int zynqmp_pm_get_node_count(void)
+{
+	struct zynqmp_pm_query_data qdata = {0};
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	qdata.qid = PM_QID_GET_NODE_COUNT;
+
+	ret = zynqmp_pm_query_data(qdata, ret_payload);
+	if (ret)
+		return ret;
+
+	return ret_payload[1];
+}
+
+/**
+ * zynqmp_pm_get_node_name() - Get node name via QUERY_DATA
+ * @index: Register index
+ * @name: Buffer to store register name
+ *
+ * Return: 0 on success, error code otherwise
+ */
+static int zynqmp_pm_get_node_name(u32 index, char *name)
+{
+	struct zynqmp_pm_query_data qdata = {0};
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	qdata.qid = PM_QID_GET_NODE_NAME;
+	qdata.arg1 = index;
+
+	ret = zynqmp_pm_query_data(qdata, ret_payload);
+	if (ret)
+		return ret;
+
+	memcpy(name, &ret_payload[1], CSU_REG_NAME_LEN);
+	name[CSU_REG_NAME_LEN - 1] = '\0';
+
+	return 0;
+}
+
+/**
+ * zynqmp_csu_reg_show() - Generic show function for all registers
+ * @dev: Device pointer
+ * @attr: Device attribute
+ * @buf: Output buffer
+ *
+ * Return: Number of bytes written to buffer, or error code
+ */
+static ssize_t zynqmp_csu_reg_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct zynqmp_csu_reg *reg;
+	u32 value;
+	int ret;
+
+	/* Use container_of to get register directly */
+	reg = container_of(attr, struct zynqmp_csu_reg, attr);
+
+	ret = zynqmp_pm_sec_read_reg(CSU_NODE_ID, reg->id, &value);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "0x%08x\n", value);
+}
+
+/**
+ * zynqmp_csu_reg_store() - Generic store function for writable registers
+ * @dev: Device pointer
+ * @attr: Device attribute
+ * @buf: Input buffer
+ * @count: Buffer size
+ *
+ * Format: "mask value" - both mask and value required
+ * Example: echo "0xFFFFFFFF 0x12345678" > register
+ *
+ * Return: count on success, error code otherwise
+ */
+static ssize_t zynqmp_csu_reg_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct zynqmp_csu_reg *reg;
+	u32 mask, value;
+	int ret;
+
+	reg = container_of(attr, struct zynqmp_csu_reg, attr);
+
+	if (sscanf(buf, "%x %x", &mask, &value) != 2)
+		return -EINVAL;
+
+	ret = zynqmp_pm_sec_mask_write_reg(CSU_NODE_ID, reg->id, mask, value);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * zynqmp_csu_discover_registers() - Discover CSU registers from firmware
+ * @pdev: Platform device pointer
+ *
+ * This function uses PM_QUERY_DATA to discover all available CSU registers
+ * and creates sysfs group under /sys/devices/platform/firmware:zynqmp-firmware/
+ *
+ * Return: 0 on success, error code otherwise
+ */
+int zynqmp_csu_discover_registers(struct platform_device *pdev)
+{
+	struct zynqmp_csu_data *csu_data;
+	struct attribute **attrs;
+	int count, ret, i;
+
+	ret = zynqmp_pm_is_function_supported(PM_QUERY_DATA, PM_QID_GET_NODE_COUNT);
+	if (ret) {
+		dev_dbg(&pdev->dev, "CSU register discovery not supported by current firmware\n");
+		return 0;
+	}
+
+	count = zynqmp_pm_get_node_count();
+	if (count < 0)
+		return count;
+	if (count == 0) {
+		dev_dbg(&pdev->dev, "No nodes available from firmware\n");
+		return 0;
+	}
+
+	/* Validate count to prevent excessive memory allocation */
+	if (count > MAX_CSU_REGS) {
+		dev_err(&pdev->dev, "Register count %d exceeds maximum %d\n",
+			count, MAX_CSU_REGS);
+		return -EINVAL;
+	}
+
+	dev_dbg(&pdev->dev, "Discovered %d nodes from firmware\n", count);
+
+	csu_data = devm_kzalloc(&pdev->dev, sizeof(*csu_data), GFP_KERNEL);
+	if (!csu_data)
+		return -ENOMEM;
+
+	csu_data->csu_reg_count = count;
+
+	csu_data->csu_regs = devm_kcalloc(&pdev->dev, count, sizeof(*csu_data->csu_regs),
+					  GFP_KERNEL);
+	if (!csu_data->csu_regs) {
+		devm_kfree(&pdev->dev, csu_data);
+		return -ENOMEM;
+	}
+
+	attrs = devm_kcalloc(&pdev->dev, count + 1, sizeof(*attrs), GFP_KERNEL);
+	if (!attrs) {
+		devm_kfree(&pdev->dev, csu_data->csu_regs);
+		devm_kfree(&pdev->dev, csu_data);
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < count; i++) {
+		struct zynqmp_csu_reg *reg = &csu_data->csu_regs[i];
+		struct device_attribute *dev_attr = &reg->attr;
+
+		reg->id = i;
+
+		ret = zynqmp_pm_get_node_name(i, reg->name);
+		if (ret) {
+			dev_warn(&pdev->dev, "Failed to get name for register %d\n", i);
+			snprintf(reg->name, sizeof(reg->name), "csu_reg_%d", i);
+		}
+
+		/* Create sysfs attribute - firmware enforces actual access control */
+		sysfs_attr_init(&dev_attr->attr);
+		dev_attr->attr.name = reg->name;
+		dev_attr->attr.mode = 0644;
+		dev_attr->show = zynqmp_csu_reg_show;
+		dev_attr->store = zynqmp_csu_reg_store;
+
+		attrs[i] = &dev_attr->attr;
+
+		dev_dbg(&pdev->dev, "Register %d: id=%d name=%s\n", i, reg->id, reg->name);
+	}
+
+	csu_data->csu_attr_group.name = "csu_registers";
+	csu_data->csu_attr_group.attrs = attrs;
+
+	ret = devm_device_add_group(&pdev->dev, &csu_data->csu_attr_group);
+	if (ret) {
+		devm_kfree(&pdev->dev, attrs);
+		devm_kfree(&pdev->dev, csu_data->csu_regs);
+		devm_kfree(&pdev->dev, csu_data);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_csu_discover_registers);
diff --git a/drivers/firmware/xilinx/zynqmp-csu-reg.h b/drivers/firmware/xilinx/zynqmp-csu-reg.h
new file mode 100644
index 000000000000..b12415db3496
--- /dev/null
+++ b/drivers/firmware/xilinx/zynqmp-csu-reg.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Xilinx Zynq MPSoC CSU Register Access
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ *
+ *  Michal Simek <michal.simek@amd.com>
+ *  Ronak Jain <ronak.jain@amd.com>
+ */
+
+#ifndef __ZYNQMP_CSU_REG_H__
+#define __ZYNQMP_CSU_REG_H__
+
+#include <linux/platform_device.h>
+
+int zynqmp_csu_discover_registers(struct platform_device *pdev);
+
+#endif /* __ZYNQMP_CSU_REG_H__ */
diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index fbe8510f4927..b549d07f7497 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -27,6 +27,7 @@
 
 #include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/firmware/xlnx-event-manager.h>
+#include "zynqmp-csu-reg.h"
 #include "zynqmp-debug.h"
 
 /* Max HashMap Order for PM API feature check (1<<7 = 128) */
@@ -2120,6 +2121,11 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 			dev_err_probe(&pdev->dev, PTR_ERR(em_dev), "EM register fail with error\n");
 	}
 
+	/* Discover CSU registers dynamically */
+	ret = zynqmp_csu_discover_registers(pdev);
+	if (ret)
+		dev_warn(&pdev->dev, "CSU register discovery failed: %d\n", ret);
+
 	return of_platform_populate(dev->of_node, NULL, NULL, dev);
 }
 
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index d70dcd462b44..a4b293eb96ce 100644
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
@@ -262,6 +262,8 @@ enum pm_query_id {
 	PM_QID_CLOCK_GET_NUM_CLOCKS = 12,
 	PM_QID_CLOCK_GET_MAX_DIVISOR = 13,
 	PM_QID_PINCTRL_GET_ATTRIBUTES = 15,
+	PM_QID_GET_NODE_NAME = 16,
+	PM_QID_GET_NODE_COUNT = 17,
 };
 
 enum rpu_oper_mode {
-- 
2.34.1


