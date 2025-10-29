Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFDECCF9F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrei039AUBETUyX84AfpBi0mypHZRdv3DeQmHiz22Fg=; b=Iu+FzYO862d/HkL65FLI9ZMut3
	sDHvTP2cCyF48eQpnUcW3+k22gfGvn34P39pcy10onPkLtPtRhCPcyTkLfOeUFqPzHzF8AzMWt1lZ
	1rXecs+zfm9tXEr0YHk+M3fs/kPShfjT9xJX56/7PXm3Y5dKinUhopKf3RLLjevAmJAq0UQSKR0ed
	MBiwlABKcdVdL+ehf+7VvF2thV1RkF/1GS3Yyv3cOofkadeaplZkJT4PthiKEzQzpeLYvFwWnkIQ2
	Fb3X0DVuchUEovAhqc8dt0y6P+lIWBHo12OTgk9oOW8bVLm2BkI2eIUQYOL3xD3AonSwfqMyOsQZK
	BpONzLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Ka-00000000iwl-1lxk;
	Wed, 29 Oct 2025 10:23:04 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3KX-00000000isC-0oCI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:23:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7w0mj33jn+ZinwZKOKsBVDvU+LOv8e4PRM9iG9aS0PJ85cxlJwH3yVQEKjpMTWHkj5Xz2TEenjamU6apdYsnDHawK8xjqsPoEjxSSoEkolwVdvCAmcc5s72O+2qkbyFvcUgPeA0f3YYdu4cR4vjSKw5sukAou/ZW/6CAgIkLR+MGT0uIeTMS4OIGoaDJGQ2YKH1oElNJYwn4Ikk1jsPzB8YnCDZOliqjYKAx2awGF0eXJgYj/b8oZXbAVF2PBmisB/6KBPMuwKYHHfJhuqwqhhtOeYJt5+E0YahnCqUOM7DBt41LrRhDueMnDkXAAs/VBr1PDu9eMNhovAEeFbSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrei039AUBETUyX84AfpBi0mypHZRdv3DeQmHiz22Fg=;
 b=XM5lFFudZGN+3Kd9jUhzsMGAaXUDZSmAf18ajjmlBvZAvQKz75phblM/tiqV9KMrcu4k0kXIlrtFe4QVNCXvK3pJ3ll9KvADiYa8QhLJpXl+/y+mniBHeBLNaeg6dbs76asgIPryWdpOEJr/DWclRCgkpfZ8/jrDOImqqvToXMPrNfIdtvBBLvJaAZrOjWYXruKtfHWwmSTTSbV6Sd48fQqkgPxl4ib5raHRLXuxVMIcLkUNHMKQM6emSo2icA+b4zpR1REqzw68Db0ol4+1oJwiJMmGNX6x/FE40jSbns8XFvbRzVAY60Gp56QH3yz+aJ7UlRa3y0XgqZczc+Nccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrei039AUBETUyX84AfpBi0mypHZRdv3DeQmHiz22Fg=;
 b=pGVm3DogflGdCo+YcIlRXzL3q2HJSheCwRn32ZZ8a11Ewg2NFuLavx+1rnk2NtzQs998OAejJae8B/2CEpEzaniHJciAbV20fV53Ol+PmQx7TJUb7ZB+6MWwNG69W9RsITj10pjMuv9NED1QmdCVyt9saLE6ZXnDTrRM2bFFkb8=
Received: from BLAPR05CA0035.namprd05.prod.outlook.com (2603:10b6:208:335::16)
 by CH3PR12MB8536.namprd12.prod.outlook.com (2603:10b6:610:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 10:22:52 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::40) by BLAPR05CA0035.outlook.office365.com
 (2603:10b6:208:335::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.4 via Frontend Transport; Wed,
 29 Oct 2025 10:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 10:22:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 03:22:16 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 03:22:16 -0700
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 03:22:13 -0700
From: Harsh Jain <h.jain@amd.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<mounika.botcha@amd.com>, <sarat.chand.savitala@amd.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<jay.buddhabhatti@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH 01/15] firmware: zynqmp: Move crypto API's to separate file
Date: Wed, 29 Oct 2025 15:51:44 +0530
Message-ID: <20251029102158.3190743-2-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251029102158.3190743-1-h.jain@amd.com>
References: <20251029102158.3190743-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|CH3PR12MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d927fa-1fa8-4404-3837-08de16d51d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pvq+8ToYcLGZx9qXIJLIZQOmbxFYYjzusRYVaZv1tkTsW21xeh2dYSt0V6/Z?=
 =?us-ascii?Q?VNkWRb8550s/0RJwT361kLPtGuGPoOeccsWv48sRNhpB3EsYv6LBSDLQoQm/?=
 =?us-ascii?Q?mFIYAj+a6642ebKq53FKrPFV825FBnnMFoWaVzaxbTtb9ZPM0Mu7QKmAa0VH?=
 =?us-ascii?Q?V17ZMX9l/8KZ3bl0GIc9wrB/nNBz+zbdh9yLwVMjHc7UKOlirt70gaGEXpwQ?=
 =?us-ascii?Q?x7muuRlt7dk/Jr7iQc+9MAE3dYjoZx4XUWyajBwiDaIgZseumV3qPBL3HXC6?=
 =?us-ascii?Q?caDUa1eXntDbxXKsLUNlhoDy94vZjPTiL6ZZkztOhORMnoULICa+24UGaNiK?=
 =?us-ascii?Q?4/kdX1l0OjRo8b9G33zt2+4CnFC5kOUJMZt0w+QgVkVUyPDkDSgEcnehEiO4?=
 =?us-ascii?Q?Bl8dxUA33hhY9XtcnaO6pBwZsVSQeRzX4pSe/EUB9erPFrMAFvjHdTND2lcJ?=
 =?us-ascii?Q?kgu3kZ3hupkVEAg604zFTf0wHZ96Vk14gBr7MQetjVEO80PG+HM9gJ+ImqOk?=
 =?us-ascii?Q?iSkkOovN50ahubSe6RMWp4TFVZxbHvFktHHUB+7lUxZQoCRDezh5hjuSRMc8?=
 =?us-ascii?Q?1tLlzDmljHr1bcy8EUr8XkuoUF+q4klMNMCPNvgSIKtoowy93k5KVBPHZX7u?=
 =?us-ascii?Q?n6ty2nLao3yoYv27wdFJzEWe+xOgHz8msF5FdPcvz7LvIQntMjomP1+qB2za?=
 =?us-ascii?Q?jLa+Ml2bCQL5PQBQP3V0YwdS8it1oelqLcmhTal17ijHAUtTFNeCdmPDP++W?=
 =?us-ascii?Q?YK6VAO4SVF+uocntsVBn0xlodonbOeNaOKdi63D0EeSrR76CzD/AEMz+wjpX?=
 =?us-ascii?Q?V82LmO5ylsomDAt6rjF1sQNAaI/TGGktSIJLW6uLhJ4Aw08jD+e44LRu3UFc?=
 =?us-ascii?Q?qIP8VQiWRapE3AUjckvGGHDm5vg5kOPvT2YkR2jemQNb490CIkGv5p09mbke?=
 =?us-ascii?Q?6nOWS+yut5bq7Ra1G6wTQoemAyahA+EWDSRXfzImq80XCiSMJWLn3XKR3FBq?=
 =?us-ascii?Q?3zqGPNKQmFcB+mWOBnc/l1vr8b8qYk3isJ43PR8mGLk4eqYNb9Gm4UYvIBc1?=
 =?us-ascii?Q?mUbv97+b3H7UbYYlQtDIHOMtdVlb9v3d8ar6nso2USmdpRtsKzqvf1/DyFx+?=
 =?us-ascii?Q?hgAaEsKU+UBDiOVbDcoGItmc8rVV6bJ+wU3AX60rjlsMsIK7fuKmtGLVQrgG?=
 =?us-ascii?Q?gGadUG2Z9dcxPp06rJauzBF6TxQMpTdYPTtVwwCDE2hx7dqPH6oZsaPj8SFP?=
 =?us-ascii?Q?fdvSOE2LHbKPDLkxWV18PRUY2cHoDG21tArOAzWTzY091+OooZhCOrX+GED/?=
 =?us-ascii?Q?NYtxB/Lu/2dmEmnqtBjqT4XKpyTk6pihmCjf0kLPerBwgcwJDbiIZ4QsNWjU?=
 =?us-ascii?Q?mnzX+jgGVu9ZvZm5Z629A3mOLi6Ydvbg502q/KD8ltEnEt5CeZcaoQraxclf?=
 =?us-ascii?Q?kUcBxVe+kUbEoUX4GaxBiKLqICmFdZ8ZvjyOW+EQKXXXY9hiRCoyfQlqSBsu?=
 =?us-ascii?Q?ZtFlhQefk7tQG+xRf4aGaZ8Glw0HrsErTDAM7HFI9UE1M5+L3pDTJbqlus1H?=
 =?us-ascii?Q?feW72rVbSdc2VSeSpfc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 10:22:50.8783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d927fa-1fa8-4404-3837-08de16d51d56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8536
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_032301_316904_5C933EA6 
X-CRM114-Status: GOOD (  20.71  )
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

For better maintainability move crypto related API's to
new zynqmp-crypto.c file.

Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/firmware/xilinx/Makefile            |  2 +-
 drivers/firmware/xilinx/zynqmp-crypto.c     | 59 +++++++++++++++++++++
 drivers/firmware/xilinx/zynqmp.c            | 49 -----------------
 include/linux/firmware/xlnx-zynqmp-crypto.h | 28 ++++++++++
 include/linux/firmware/xlnx-zynqmp.h        | 14 +----
 5 files changed, 89 insertions(+), 63 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-crypto.c
 create mode 100644 include/linux/firmware/xlnx-zynqmp-crypto.h

diff --git a/drivers/firmware/xilinx/Makefile b/drivers/firmware/xilinx/Makefile
index 875a53703c82..65bf9572c781 100644
--- a/drivers/firmware/xilinx/Makefile
+++ b/drivers/firmware/xilinx/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Xilinx firmwares
 
-obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o
+obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-crypto.o
 obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) += zynqmp-debug.o
diff --git a/drivers/firmware/xilinx/zynqmp-crypto.c b/drivers/firmware/xilinx/zynqmp-crypto.c
new file mode 100644
index 000000000000..ea9cac6a1052
--- /dev/null
+++ b/drivers/firmware/xilinx/zynqmp-crypto.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Firmware layer for XilSecure APIs.
+ *
+ * Copyright (C) 2014-2022 Xilinx, Inc.
+ * Copyright (C) 2022-2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/module.h>
+
+/**
+ * zynqmp_pm_aes_engine - Access AES hardware to encrypt/decrypt the data using
+ * AES-GCM core.
+ * @address:	Address of the AesParams structure.
+ * @out:	Returned output value
+ *
+ * Return:	Returns status, either success or error code.
+ */
+int zynqmp_pm_aes_engine(const u64 address, u32 *out)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	if (!out)
+		return -EINVAL;
+
+	ret = zynqmp_pm_invoke_fn(PM_SECURE_AES, ret_payload, 2, upper_32_bits(address),
+				  lower_32_bits(address));
+	*out = ret_payload[1];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_aes_engine);
+
+/**
+ * zynqmp_pm_sha_hash - Access the SHA engine to calculate the hash
+ * @address:	Address of the data/ Address of output buffer where
+ *		hash should be stored.
+ * @size:	Size of the data.
+ * @flags:
+ *		BIT(0) - for initializing csudma driver and SHA3(Here address
+ *		and size inputs can be NULL).
+ *		BIT(1) - to call Sha3_Update API which can be called multiple
+ *		times when data is not contiguous.
+ *		BIT(2) - to get final hash of the whole updated data.
+ *		Hash will be overwritten at provided address with
+ *		48 bytes.
+ *
+ * Return:	Returns status, either success or error code.
+ */
+int zynqmp_pm_sha_hash(const u64 address, const u32 size, const u32 flags)
+{
+	u32 lower_addr = lower_32_bits(address);
+	u32 upper_addr = upper_32_bits(address);
+
+	return zynqmp_pm_invoke_fn(PM_SECURE_SHA, NULL, 4, upper_addr, lower_addr, size, flags);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_sha_hash);
diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 835a50c5af46..d82075cfdf26 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1521,30 +1521,6 @@ int zynqmp_pm_load_pdi(const u32 src, const u64 address)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_load_pdi);
 
-/**
- * zynqmp_pm_aes_engine - Access AES hardware to encrypt/decrypt the data using
- * AES-GCM core.
- * @address:	Address of the AesParams structure.
- * @out:	Returned output value
- *
- * Return:	Returns status, either success or error code.
- */
-int zynqmp_pm_aes_engine(const u64 address, u32 *out)
-{
-	u32 ret_payload[PAYLOAD_ARG_CNT];
-	int ret;
-
-	if (!out)
-		return -EINVAL;
-
-	ret = zynqmp_pm_invoke_fn(PM_SECURE_AES, ret_payload, 2, upper_32_bits(address),
-				  lower_32_bits(address));
-	*out = ret_payload[1];
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(zynqmp_pm_aes_engine);
-
 /**
  * zynqmp_pm_efuse_access - Provides access to efuse memory.
  * @address:	Address of the efuse params structure
@@ -1569,31 +1545,6 @@ int zynqmp_pm_efuse_access(const u64 address, u32 *out)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_efuse_access);
 
-/**
- * zynqmp_pm_sha_hash - Access the SHA engine to calculate the hash
- * @address:	Address of the data/ Address of output buffer where
- *		hash should be stored.
- * @size:	Size of the data.
- * @flags:
- *	BIT(0) - for initializing csudma driver and SHA3(Here address
- *		 and size inputs can be NULL).
- *	BIT(1) - to call Sha3_Update API which can be called multiple
- *		 times when data is not contiguous.
- *	BIT(2) - to get final hash of the whole updated data.
- *		 Hash will be overwritten at provided address with
- *		 48 bytes.
- *
- * Return:	Returns status, either success or error code.
- */
-int zynqmp_pm_sha_hash(const u64 address, const u32 size, const u32 flags)
-{
-	u32 lower_addr = lower_32_bits(address);
-	u32 upper_addr = upper_32_bits(address);
-
-	return zynqmp_pm_invoke_fn(PM_SECURE_SHA, NULL, 4, upper_addr, lower_addr, size, flags);
-}
-EXPORT_SYMBOL_GPL(zynqmp_pm_sha_hash);
-
 /**
  * zynqmp_pm_register_notifier() - PM API for register a subsystem
  *                                to be notified about specific
diff --git a/include/linux/firmware/xlnx-zynqmp-crypto.h b/include/linux/firmware/xlnx-zynqmp-crypto.h
new file mode 100644
index 000000000000..f9eb523ba6a0
--- /dev/null
+++ b/include/linux/firmware/xlnx-zynqmp-crypto.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Firmware layer for XilSECURE APIs.
+ *
+ *  Copyright (C) 2014-2022 Xilinx, Inc.
+ *  Copyright (C) 2022-2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __FIRMWARE_XLNX_ZYNQMP_CRYPTO_H__
+#define __FIRMWARE_XLNX_ZYNQMP_CRYPTO_H__
+
+#if IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)
+int zynqmp_pm_aes_engine(const u64 address, u32 *out);
+int zynqmp_pm_sha_hash(const u64 address, const u32 size, const u32 flags);
+#else
+static inline int zynqmp_pm_aes_engine(const u64 address, u32 *out)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_sha_hash(const u64 address, const u32 size,
+				     const u32 flags)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* __FIRMWARE_XLNX_ZYNQMP_CRYPTO_H__ */
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index be6817ac5120..b5f21da80747 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -16,6 +16,7 @@
 #include <linux/types.h>
 
 #include <linux/err.h>
+#include <linux/firmware/xlnx-zynqmp-crypto.h>
 
 #define ZYNQMP_PM_VERSION_MAJOR	1
 #define ZYNQMP_PM_VERSION_MINOR	0
@@ -587,9 +588,7 @@ int zynqmp_pm_release_node(const u32 node);
 int zynqmp_pm_set_requirement(const u32 node, const u32 capabilities,
 			      const u32 qos,
 			      const enum zynqmp_pm_request_ack ack);
-int zynqmp_pm_aes_engine(const u64 address, u32 *out);
 int zynqmp_pm_efuse_access(const u64 address, u32 *out);
-int zynqmp_pm_sha_hash(const u64 address, const u32 size, const u32 flags);
 int zynqmp_pm_fpga_load(const u64 address, const u32 size, const u32 flags);
 int zynqmp_pm_fpga_get_status(u32 *value);
 int zynqmp_pm_fpga_get_config_status(u32 *value);
@@ -767,22 +766,11 @@ static inline int zynqmp_pm_set_requirement(const u32 node,
 	return -ENODEV;
 }
 
-static inline int zynqmp_pm_aes_engine(const u64 address, u32 *out)
-{
-	return -ENODEV;
-}
-
 static inline int zynqmp_pm_efuse_access(const u64 address, u32 *out)
 {
 	return -ENODEV;
 }
 
-static inline int zynqmp_pm_sha_hash(const u64 address, const u32 size,
-				     const u32 flags)
-{
-	return -ENODEV;
-}
-
 static inline int zynqmp_pm_fpga_load(const u64 address, const u32 size,
 				      const u32 flags)
 {
-- 
2.49.1


