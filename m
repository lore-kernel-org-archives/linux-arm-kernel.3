Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1F5CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlXK/G8Cuw0mLf6f4UHL+RTO0u0J0ylbIiUnxWGvwRM=; b=uBz0d9EqokrYPEIsikC+95qvmH
	T/krQzqeDmsZo442IE1taRdm4Yvo+TDrCW6h/nsbzmu+E5+VR3FcezzXRMRJg2nLcaUiHr5gtl16w
	AL4muDTzMN8ZDTQJslj8Ics2ZEFgS7RhjQ0suDtj2fpusmRKcbxHA75ZEHe4WfMPtkyQrLzBkUZsd
	xW1lSVj8eweINw+ODj28nt2xPULqW47ycXsjBCkoMCOwihIBBWCJ/dGfvzcOnTJLtrATdv4EHFUUN
	vzdnYSxL7RsD7jCoAGRzDbyBz+fs8CBvlcMYQX+WixQsb7bpDSH1H1Ul2jEOcdF4CfdQUexywqysY
	FFpFzHYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdMY-00000004C3Z-400l;
	Wed, 20 May 2026 09:37:14 +0000
Received: from mail-southcentralusazon11013001.outbound.protection.outlook.com ([40.93.196.1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdMW-00000004C26-1ovy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:37:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWsBofw7pPVhJ14u3PrUPrUqmvds56rI23toIai8MmQiawAadrv2Xv/uovquhFvUKGA9JRsOPNVnLLi6wzU1fAIntmev0QTKTGJ4wCAoWdt7v2iGjff8HEtqGAtmJbnVGlxxJT1f1tmhJ3XE/MROLW+OfDgX9MHTwfRlJ+Xzs5y3ymCUAGAWQEcfAhz6Tnbd3F1xGeKtTFMDXHuwngXhyKJXmbfJ+xLrVaNHW3iGdaOkIaV7pGMmxXkuc+819yYrYLZMCl7UwUDVLnfuctxHDxidzYKtn0FWMR5au1pcM/R0HYj/gu6CEqU1i5tPFKbJ/1LUrEOrE65YONSftW4EJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlXK/G8Cuw0mLf6f4UHL+RTO0u0J0ylbIiUnxWGvwRM=;
 b=Vrxa+DlbKADYpDLyuccqODK+v8Xzwwmbvhik1SAr2JGuXIFN4AYm+BnK81neFz/JgHUEeklWWMyUr2OrIiGa57sZTJDaGVWbYi+Q3sQso6DQJr4eCl32PLRkkzx2dvRhUvU7hHk76ZO5QB4n9EUStrOy8CjB1Z2XA/Chlrpxn+tLAMRg7FeVnqYloJGzSlC2d9N0eQFXCbPhBcI2pXZJxtquPdAz7qL90bmynmZ4+PJLS4VxZQGzDXHDZG69quMN8r6LrHjirKfJ+PeMyjbTFyM2h/H1h8a3hHu09HMfgcbH1rUZ046CVbjIQj3hsmxQRTPQis575QO+1bn1w8Tb6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlXK/G8Cuw0mLf6f4UHL+RTO0u0J0ylbIiUnxWGvwRM=;
 b=ofc0cg3BFe1pF6By4+49gWw9uUSOIIjKIFTMovMgTOjlgI3aZSd7MjdOAFjBaUkkbWGYq6ruJeWDI39cPrU/JBzoYtgqQkB306NwxfThpTOqSjgJuCrchvB1LRoBS/O7tUVJgc08IYUQWPvHWadudGf/kKhTQzSxqtk/48jYWwE=
Received: from SJ0PR05CA0068.namprd05.prod.outlook.com (2603:10b6:a03:332::13)
 by PH7PR12MB8054.namprd12.prod.outlook.com (2603:10b6:510:27f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 09:37:06 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::39) by SJ0PR05CA0068.outlook.office365.com
 (2603:10b6:a03:332::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.13 via Frontend Transport; Wed, 20
 May 2026 09:37:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 09:37:04 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 04:37:01 -0500
Received: from xsjarunbala52.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 20 May 2026 04:37:00 -0500
From: Ronak Jain <ronak.jain@amd.com>
To: <michal.simek@amd.com>, <senthilnathan.thangaraj@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ronak.jain@amd.com>
Subject: [PATCH v2 2/2] firmware: zynqmp: Add dynamic CSU register discovery and sysfs interface
Date: Wed, 20 May 2026 02:36:54 -0700
Message-ID: <20260520093654.3303917-3-ronak.jain@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520093654.3303917-1-ronak.jain@amd.com>
References: <20260520093654.3303917-1-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|PH7PR12MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: da0205b4-52b4-47d8-d0a4-08deb6535a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|18002099003|22082099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: cdxKKP6Rn0xUdZBpZhMO80/Ul0yp20fbiKxAujqhu8dbEAArYFFT40jXTLqhKUZ1wr8pafEcvsrulpmplDfi8TT5Mgr7uP0pAvUxceLRAyJzaT4NqxZuwtcNW4blWY0AXdSoBcMrJZJMSX3mEwTrBrMUldNirywuV+aqeeEnqyhe4LLTbYzzNZe8P6njSdOFEwiEqApoaNXip1lY8yvN48auxt8TLId/vd70j/cEa3GZs5a8KMGspZtwYiBlSB304Ja08RO0rAJA54riliC4yWRfs7HpZgrSiBSsxPP4U6P6ohEUX00NdsSiXST22s4at8Z68QFHRWNBp2rOCNsuy1QDNQdf/RQFCoBzMwYmSaRGctTRnkD1IcooYH+wDDznpYq6J0LJcoDzCzw3jaiYiagjqTlS9H1WrrZrSl9iyriebExghpTVDaxFIeO6CXVujrGp/+6pmqK/B1rYyd+kP5RVLHbpmLiXy0AzBIFgFTeHuHN6SgrAP7G5Zrlz6GbvIHT9YVdnzoRZQTRGbPHcw/EuPL5QRDRrFLBxr6FoxifSJMow3BeFbBUrv0GBSAGtxL3UQ0JXFfp3f5U3h7LKBszDOBS83bOUxlCwQJ7J2wuZdJfCJpGCxIXXVhL5sKZEiT7SyV5ZrTQM5wCDUyJqndjEkshBYKUds/j+3zyHA8NoFl/EduPctdz7rrhPunxQjyxn5EtwGrLWQOHtGaLUHMwmvwawAgkZiWmLNpxU8kg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: S8DUnKdf0wiRxQCAFIlTm+VTvjA2/10wtj1PP0jWiPNj96wQWbXEMCYiDX6jmMKevBzc84MJNdYGAYf92w5bBRHUmytl4zqDef80DqqbcKBd1UR2wtDKG5M3E9dVYMEt2J2kNwOUYRy6ykP4l4fMk3P3eXcbPXRH61V45Rdi0LpPZ/SCqoq/2rCtxiVKOPwjL+dAJjepOds692+DgN1rwX3AE/uURKmGZfqbmD+P/o/Lc/OHKPwWEJtfeLSl5kxS3GNZ2YFouqLD/LcfRKCh6xt8W56oM3cI/YwfB4/rYAoIO0BmOfVd+suM3LY7LQOOIn7cMsoyJH121LgJpTs992J7oxdfFYikYhra9wi5fbSHH4XbCzfSFJxL/MDbguzLhZ+opF2bW2aNs5J/O1EwHSefx61ddITb9s7Q4v/3+JDS/G32ecdR4lRy0jxCPnrT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 09:37:04.2617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da0205b4-52b4-47d8-d0a4-08deb6535a22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_023712_522816_637FDA87 
X-CRM114-Status: GOOD (  32.39  )
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

The sysfs interface is created at:
  /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/

Currently supported registers include:
  - multiboot (CSU_MULTI_BOOT)
  - idcode (CSU_IDCODE, read-only)
  - pcap-status (CSU_PCAP_STATUS, read-only)

The dynamic discovery approach allows firmware to control which
registers are exposed without requiring kernel changes, improving
maintainability and security.

The firmware does not currently expose per-register access mode
information, so the kernel cannot distinguish read-only registers
from read-write ones at discovery time. All discovered registers are
therefore created with sysfs mode 0644, and the firmware is
responsible for rejecting writes to registers it treats as read-only
(for example idcode and pcap-status); that error is propagated back
to userspace from the store callback. If a per-register access-mode
query is added to the firmware in the future, sysfs permissions can
be tightened to match.

CSU register discovery is an optional feature: on firmware that lacks
support for PM_QID_GET_NODE_COUNT or PM_QID_GET_NODE_NAME, the probe
returns gracefully without exposing any sysfs entries. To keep the
memory footprint minimal on that path, partial devm allocations made
during discovery are explicitly released on failure so that no memory
lingers until device unbind when the feature is unavailable.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
---
 MAINTAINERS                              |  10 +
 drivers/firmware/xilinx/Makefile         |   2 +-
 drivers/firmware/xilinx/zynqmp-csu-reg.c | 258 +++++++++++++++++++++++
 drivers/firmware/xilinx/zynqmp-csu-reg.h |  18 ++
 drivers/firmware/xilinx/zynqmp.c         |   6 +
 include/linux/firmware/xlnx-zynqmp.h     |   4 +-
 6 files changed, 296 insertions(+), 2 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.c
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b3e05a3186aa..f1b42935b40d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29490,6 +29490,16 @@ F:	drivers/dma/xilinx/xdma.c
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
index 000000000000..6e11a9b019f7
--- /dev/null
+++ b/drivers/firmware/xilinx/zynqmp-csu-reg.c
@@ -0,0 +1,258 @@
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
+ * @csu_attr_group: Attribute group for sysfs
+ */
+struct zynqmp_csu_data {
+	struct zynqmp_csu_reg *csu_regs;
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
+	ret = zynqmp_pm_is_function_supported(PM_QUERY_DATA, PM_QID_GET_NODE_NAME);
+	if (ret) {
+		dev_dbg(&pdev->dev, "CSU register name query not supported by current firmware\n");
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
+		/*
+		 * The firmware does not expose per-register access mode via
+		 * PM_QUERY_DATA today, so the kernel cannot tell read-only
+		 * registers from read-write ones at discovery time. Expose
+		 * every register as 0644 and rely on the firmware to reject
+		 * IOCTL_MASK_WRITE_REG on read-only registers; the error is
+		 * propagated back to userspace from the store callback.
+		 */
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
index af838b2dc327..155a7a9b3777 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -27,6 +27,7 @@
 
 #include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/firmware/xlnx-event-manager.h>
+#include "zynqmp-csu-reg.h"
 #include "zynqmp-debug.h"
 
 /* Max HashMap Order for PM API feature check (1<<7 = 128) */
@@ -2148,6 +2149,11 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
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
index 7e27b0f7bf7e..a956e315be82 100644
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


