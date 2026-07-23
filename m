Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA1EC531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMRdgXe/qJEGOYG505Ukz+Vi08z38Rlv5XV1qDbXkuQ=; b=rgkqjDsTv6s3hM0latDhMtMTS6
	NcO9NIc3JjIyMYIeHHDpWv9apRyW3WAz9OV0QGcMA39UDEtXJbK3qdYREn2WfymwBDkWpOZyPUYWQ
	aFmZeujBIA1BglSm7boNbLXn75NFhIkJOXqrwprp3aqq9ejuqoVPw7IDi0v1eyCg5AK2LTgFz5Pqr
	xaOZkig8CAWxuj727wUeURiBCN3sy4X1K7C2X/1sBQmKAGVHUvBFgPTh5PLydVFopl0Y4iqrw+E/t
	vy4StrgXTbzR8yg+lydljWWg3STw8fcj71IROi6EbwX0y8bvoOMx00kUcIzfIGjDqHRc/2KkYFavn
	Nu5V/Z5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmst6-0000000EH5w-1WDh;
	Thu, 23 Jul 2026 12:50:56 +0000
Received: from mail-northcentralusazon11010060.outbound.protection.outlook.com ([52.101.193.60] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmssq-0000000EGwM-2czc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vmvs9TV0FqEZR+m7ZhLodZQV/DsE5TlJhEDLJ1E8spQ6U09IzThh7BoqPcKAeqjsi/irMTsKxCO5LCwgVsWxNTdKO1U6MWOITVxezdHnfxnlp6AQpSTzwCCf89NJTSEo821aEsNVfPYSvpkqNmOa4ox91rXkr/gYHb3EmzcG0bbNmYFQd3HqlftHOQghhQm2Oxa7vmhmL+3AnbYUupTbGw4EMxWJEA2c/mbuD3whV4nvsk6RQYFXCUscORLHqL+yF5Kcixvu6AgG5R74kWa+8DKBGTtapy48nmtQ0UD9K9z90pENnoIwhXllXj72aPs8WKBpcTPE91GpYB6ecGOXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMRdgXe/qJEGOYG505Ukz+Vi08z38Rlv5XV1qDbXkuQ=;
 b=o0zSrYYQWK2EjJg7LCcdk57zdocuNQxqp3v5l7OcuBh52GdHkVf+JVHlhRetEBV+W4HQAuZ3EOIGSsZulF3xf8+bBb3QvdEUhz7WD/rph8zAw189gzf9ixaXBKB9GooYhYwiqvAGpOCV9TCyEH4vLkJ9Sw2GXspQEs8JWKfFcC2xpMgma3EbDq9HnGB1KS46phaBn4AdQNE8G5i5XU6gryEMonDfmGN57TKvw/Pp6PwF4HcMx2Y1epq3Cgmw3TJwbvFQdjUZlzSUIIyBMVS6jp1lvHZMTz4YcB9ggJKv9ETzTCdbXZL/UGeHw++0lmtdkSop76s+MhuCBA+oWsMUFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMRdgXe/qJEGOYG505Ukz+Vi08z38Rlv5XV1qDbXkuQ=;
 b=rTbASrflmAF4CswOyJ63EqOrH/80GbRRoK7eOjuXm4euy3YR3/XnDSxM/8vfw+zJtRJlkI20MsOAf4iE9rs5Dp9YsjDAK5nSEcO1Kg6CQPXuDE+mMDQUOGp5sfSmCmdZkopfmHWBX/K1/oxJRQaVSCqfWS4LkiK3WO2IFmDNoRM=
Received: from IA4P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::10)
 by MW4PR12MB7440.namprd12.prod.outlook.com (2603:10b6:303:223::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 12:50:26 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:559:cafe::54) by IA4P221CA0005.outlook.office365.com
 (2603:10b6:208:559::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 12:50:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 12:50:25 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 07:50:13 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <git@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 2/4] firmware: xilinx: Release all peripheral devices from firmware
Date: Thu, 23 Jul 2026 05:48:39 -0700
Message-ID: <20260723124841.2567827-3-jay.buddhabhatti@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MW4PR12MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c2282cf-b4f0-4cf3-1b91-08dee8b8f77b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 70GZaxBnc9IOHe0DOzb9WJwuOvl3H1z2GdVde5a44fhpMkzSwLAEKlwnAIG/j0eFY9x3OIPR8Y+1lYFyaMflsd3IAArLtQCpBpxfw3jU+nfNwjT9ZbOKl7nuoRcAxgYyFqmnqvFLr3RF1rrhrQVNGRHTSVF4/HuVOlYr0kHPBUtolks1X7ud7x/TNzxn9bSo7iYeEh5uk9x1TWFHncSNoQXTVDQRwpDvZdgEIKUKVIL+/Mzc4mDTE0isunwmBIHUj8LjS/uFxsURSxiR6e2CCDjvLRNMl7IJ+7xQpcI+EWpn8gVuLbgEihuqBpQ9yvPv9S3SMtO/hgDAtrLS4x2tgPRWXlCb0Scx++Mx3PTgs5hibS58uTkjKsosgLyCMuPqy9Qwfz++fpXj1xWqTmShRprB8A7RmiFZih1K/EdMurc7kW+2R/6ERDxAbRDNCpNJt7/wQv6uXOJbgTOJWm0KEQOD8c/DiMAQfnbhOmompnxF32EK5VLoWR3rQyiop/I54Y+wAD9szOStDcxajSo9n8KrBtTtx4C+3e8WqjHxeSQ77ATp3X/5vf+H7VlRO0gHFNUONnzdKoE9z5ZUSkxiYfej5oYGSGb3rA+S9gH7077YWJaCemAA/wfwlTlOMmRPrv5ytlx/imF5OB0VrhYXOYf7a19hDvt3tNxhrC9MfTlgAeyMa8UFuxy1B1rkLaxjDJ8i4NuY8b5c0vyu5qxAeA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QEIAuGaP+b0x1JY232PRiG7dDhJFucbHUfM01mAvHOGh3ol+GFeDrqhQOXTMnGhMF3cQ4AlD3TQtWJC428sF9HitouRELei2V9Ilap7xX/XMdI2KOSw/iREHflKB1xIYUz781gVja8QI5cou9xYXuoObfmsc+KjkNzI5h1gURvqNpKWRAYInYxnzdC8lDHiGAAHsFOB8qTsmCHq6D6dZ6u2JjFioTU1pIE4FDjj7Inq1kfvtU5Tbg4gfJVqHbiQx46etyhXX/i7Nb2tUrQShY8+LJWiWXXh7erRAbZJn3KU1SU9iOEwiVRntx2nXtY/b0UdVRK3Cw634z1Fwh3Oib94Ik5tfGwXeNDSj5/oupyTui5e4K+I4VGhF15NuDPbSRSCtsHovZQJY3vwEkF3OKxIFUnDQdMwy0Dm6kfDdB691xhNpZLbnIGN+UTNCJVoQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:50:25.6364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2282cf-b4f0-4cf3-1b91-08dee8b8f77b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055040_675601_02725BFB 
X-CRM114-Status: GOOD (  19.37  )
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
---
 drivers/firmware/xilinx/zynqmp.c     | 15 ++++++++++++++-
 include/linux/firmware/xlnx-zynqmp.h |  4 ++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 95ffd8f33ce9..64d2109eefd2 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2070,7 +2070,7 @@ ATTRIBUTE_GROUPS(zynqmp_firmware);
  * zynqmp_clear_pm_state() - Clear subsystem state
  * @dev: Device pointer used for logging
  *
- * Clears PM specific data in TF-A.
+ * Clears PM specific data in TF-A and firmware.
  *
  * Return: Returns status, either success or error
  */
@@ -2097,6 +2097,19 @@ static int zynqmp_clear_pm_state(struct device *dev)
 			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported in TF-A: %d\n", ret);
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


