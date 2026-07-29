Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F700C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+3GPFTWvHDauzcKvrFq6SgDn1YtsRtsDWD/Gek+Srk=; b=1T0Os00Xd3sdp4mBPZz5z1CDw1
	MZ8UHjtY0Utfbt5u1/fULV2ry3yPa1hb1G+ycXWFVvwxvyDlrFXlk3JkMoBDvP2jyFjGaNZi2mUgL
	ozds44uk858x6pYl4FNuZZtxmEQ48CmYIPezi+0dNXykTT0HFa2V37dHYnL+vUl4hjWAAEjlPj681
	MXMDJkG+ZsKcq/3g80MBgMbouZF/zHSp2cZ0F9MLN8qsML+jUj0JojG3tSJJHnR+783jE+2956I0r
	Ywx7ZkWcBdGKGXzfFQUsgtZSLqMTT4dJLNQ35LLwxpO5qHXnZOVrtLT+3qPO4VUW6+O+gFsT6yBkP
	Hcg6R6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Mn-00000007u2k-0745;
	Wed, 29 Jul 2026 12:26:33 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3MS-00000007tkv-0MbL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:26:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRyruqoWQtaLvXSYarZp+B5kHTENz4u5YeMhOmwpAbIpJTlKVL3zczlxRJXQRw/iaPKTrwsHDF4dyIkDkU4B4kVD7la2Y9oe65bFvjB6Xdf/cUjFn5IXjUJW0NOPDztpApG9AeYWK9Oqz+G9N+l9MdbMS+UQUupezs34hKiaevRIJjhUdDVCugh0UwUJ8IbCp2/IyCCAaA6UPRcOwF+fIAg89WPpKovB9kJ1rQ4RrW3bi30KOK/D98vWK0D8vRrAcrWWZpBqTMLPyMjgDwLs0gZndXeUGy8XYgeiD1+cO1FN7bJJPqSOwnHvuJrAdtVVXCvhj6y9oNGDxTtBohTkHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+3GPFTWvHDauzcKvrFq6SgDn1YtsRtsDWD/Gek+Srk=;
 b=rpDnnFdHBXZaFyNUuVPDh33O3ypNIok5z7sKbtal2j8R0n78PBAkRPUdZg48joSVZ+EvVfQUoxfjAIXM4LdCURwMG5IYTquaS3r355KiUxOKIP7rjbK3GMCEHWP4O5oXHT9uRY071zcOfwCii2sEu48rJ7vb/d5v5Sk/L4TNFD2tRX2VAFygbi4cbFQ7iynxFv6BHVWuLzcUwlcgcwLdjBLNXKUsqJ2HRKoj1IOwNlItFYE8HYW0rOngHET9LllNAP7z+Rm7XGGwqI8En6ZE7cRAVckHz8HPqHjPcYPgqkOaRXeWVE5c5OICX3Nb33wlGP4gTiROS1qRXeY0LE6l7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+3GPFTWvHDauzcKvrFq6SgDn1YtsRtsDWD/Gek+Srk=;
 b=qIdRWh9OTsu6tbdApUH8fvWtwUWJgmT96dxvjBtHJMzf/TlH/XstGLHQfwBUEV8V40JBYA0lAP/OAN+AqCygJ9jCjDEbiA8vvoejOZKu8QkZn2VtDR8o7Gxa7AdeEVMFCWL+RBKgB5ep6567hUAlTvnHh23TjKHZ8ro+ZY+ao4g=
Received: from BN9PR03CA0721.namprd03.prod.outlook.com (2603:10b6:408:110::6)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 12:26:04 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:110:cafe::51) by BN9PR03CA0721.outlook.office365.com
 (2603:10b6:408:110::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 12:26:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 12:26:04 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 07:25:59 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <git@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Prasanna Kumar T S M
	<ptsm@linux.microsoft.com>
Subject: [PATCH v4 2/3] firmware: xilinx: Release all peripheral devices from firmware
Date: Wed, 29 Jul 2026 05:25:21 -0700
Message-ID: <20260729122522.3732875-3-jay.buddhabhatti@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 8478a772-571f-466d-7ec7-08deed6c8f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3LAHGVKlFf3aue7V05/UkHLiDVAmIIR1xAmno6ZwrVyWGEmSYp2z2lEU1QO8y8xtg0Vt6O+C9z6B5+F5CUQgE8TDrZ6vyZ8bOvX8IBnc+T8LFxhe91JFFApj/2RkHZdfi03gLGvZIcn1t0PgCt5xLJCtY8aqJ0SjwoloUGmNXNMi9i/Ncx4DtAPn5yrorvbw0EJe/KagMl/K7QHULPfQxsC6cJYCB3bhuNwM1o5e2n4o2fg+QZXOWcwtxHfLOb/HLQENjouiCTWJ/tK2oT3h8qvJmC3kB+5K/4DihIzufUw6FLvEpOMVpGsZu7gwHRAiHfQzrV61ti1d53oTFNjnSh7Sh55crGpuHVH8nJ2TjbgYOXOoSDOUGUMcGnuyOFEsKPNh/Sio1VmhJdo9idlJaswjIMVvfK4V+HBkLdN5ptJZyP2j/k254rM3laS3L+aysC7UtqLYQ6fJ6MlAkcSJ2SUn6iqjVU/ukXiKgFbOl8rDhBWEbVxt8aadNcwBue1q4SkGuQcYr4JJhnih6jrDfMbVez1WB7EKe2KaSHZvPzqjQyHV0nwt0GOJlGotrqsuMrs8pDLj9cj7fcjVVokVJqAU60GAPttOU1hYF72V128+KdlYIg0fX3RzMKGfyRfJeq3rWTZnuKiqEMPAYv85wkuuQx4b467GjdGJI8peuA+f4IB2tYkmxp4y3+Nsj490TMFftAWWbDXa+DYzC7+29g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u8DELu6kXSK/zSIiGtVLTxkUWlf/RyRSDwW7HD9t27VEttZD9mlNHSSNB11c38TlzUVYc6C/u1msMJXmy/ITtk+Ymr38awBbQdZAbTILGZUDL0Iwu/uX1LM2LoIHh2kBVJYYUMU/cSQOCo+6N+B+4YyIpk2R6SD8t1oNDwEAeXjbyccvRBjHr0FQM1WtchQJAEMRWB2FoeiO2bktE29Mcb76vq5FmaMivm5Jbfu5jxflehK7RRVAtfV7wKxIWJ5wPD996iVFETu3Z4PAU9WHS52AZowepua+QHanmCsQcl7rEFSB6F5x7NIhJjjhJJJso+6qqmvyjjwPGaN9YeX6So1f2qYPNdDCOpvNiaXX4sWycD7qbhQZ034l+1YIpKWcP3elIms2sVcZBS/J4bTVvLHuQUc1B5kbx4c7UE0Mst7WE1JW91BMu4OvN7dAH5+5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 12:26:04.6310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8478a772-571f-466d-7ec7-08deed6c8f20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_052612_138309_8B3A0EF0 
X-CRM114-Status: GOOD (  20.07  )
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

During a kexec restart, only the kernel is reloaded while devices
allocated in firmware persist, causing state mismatches between the
kernel and firmware.

Introduce PM_DEV_ALL_PERIPH node ID (0x18224FFFU) to release all
peripheral devices during kexec. On graceful restarts, this happens in
zynqmp_firmware_shutdown(). On crash kernel restarts, it happens in
zynqmp_firmware_probe() of the reloaded kernel.

Releasing all peripherals depends on firmware support for the
PM_DEV_ALL_PERIPH node ID. On firmware that does not implement it (the
feature check reports a version below PM_API_VERSION_3) the release is
skipped and a warning such as "Bulk device release is not supported by
firmware" is logged, e.g. on Versal NET firmware that predates this API.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 15 ++++++++++++++-
 include/linux/firmware/xlnx-zynqmp.h |  4 ++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index b99dca9b8cac..28bcf3a1e6db 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2070,7 +2070,7 @@ ATTRIBUTE_GROUPS(zynqmp_firmware);
  * zynqmp_clear_pm_state() - Clear subsystem state
  * @dev: Device pointer used for logging
  *
- * Clears PM specific data in EL3 firmware.
+ * Clears PM specific data in EL3 and platform firmware.
  *
  * Return: Returns status, either success or error
  */
@@ -2099,6 +2099,19 @@ static int zynqmp_clear_pm_state(struct device *dev)
 			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported by EL3 firmware: %d\n", ret);
 			ret = 0;
 		}
+
+		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
+		ret = do_feature_check_call(PM_RELEASE_NODE);
+		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
+			/* Attempt to release all peripheral devices via firmware */
+			ret = zynqmp_pm_release_node(PM_DEV_ALL_PERIPH);
+			if (ret)
+				dev_err(dev, "Failed to release all peripheral devices: %d\n", ret);
+		} else {
+			dev_warn(dev,
+				 "Bulk device release is not supported by firmware: %d\n", ret);
+			ret = 0;
+		}
 	}
 
 	return ret;
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index baaa88b0b197..ac39e5492961 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -50,6 +50,7 @@
 /* PM API versions */
 #define PM_API_VERSION_1	1
 #define PM_API_VERSION_2	2
+#define PM_API_VERSION_3	3
 
 #define PM_PINCTRL_PARAM_SET_VERSION	2
 
@@ -145,6 +146,9 @@
 #define XPM_EVENT_ERROR_MASK_NOC_NCR		BIT(13)
 #define XPM_EVENT_ERROR_MASK_NOC_CR		BIT(12)
 
+/* Node ID for all peripheral devices */
+#define PM_DEV_ALL_PERIPH	0x18224FFFU
+
 enum pm_module_id {
 	PM_MODULE_ID = 0x0,
 	XPM_MODULE_ID = 0x2,
-- 
2.34.1


