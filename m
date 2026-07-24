Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAF6C53213
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRG1cSoNz5OrrL7e+Y3IqIMLL35Mv+s1/BZNp2lTdno=; b=Mt7ga6K3+u96qVLNHKoWb3Srk9
	wpWMEGuHms/ZNj9KZILQylkE2QWG4r4YLKaF1H9ST1eESHXfPxdU/w8po+INPYGnASdUE3dcR1Iwe
	mR066RDXa6oLlMmXLXAaIKFgFxLIH5ehMbLT3WktdM2EGUd1UG05AvMvQSnB0kAzc6fKc02/LI4OY
	nr6UjB8+rSgDiRFknvju8asxxC0jS4tmRFQFOx1IYy27qKoRVCHgwdHYRwbwP1pFq/eJazftPgtM7
	X0OpcGzsSxq5L74E0vgxoZzdnJiemDFAdLBOsvZlN4hS2j7bwbs8ZMSKOt0NfUU3Tjn4sGYG+0afC
	uX3KdmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD1Z-0000000G4Km-1x6R;
	Fri, 24 Jul 2026 10:21:01 +0000
Received: from mail-westus3azon11011004.outbound.protection.outlook.com ([40.107.208.4] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD1G-0000000G46f-0OIO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:20:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yf4X6jUAnxTdADgphwjrLDnl7pJeE5mcXvG4/BW80erkXRqtWnaIj9kO/rnffc+lW8D00hzuwEJ6umBjIEB04dLzLctuwAD55VKsQPc6pisAE0D95XORpV9MFFJf6n9bUTyrrhZLXFlZdeiRTnA3t2a1KmiDeSmM5niLaWPo4QSOYfT3gEWwtnXpTrtzJShILTHb2pYdi1zD3RL2/0WiPKBJ6xOtMAZ0jvDGOONiUrSPHMJO9Uey6FfVOmC0QjzFYAs2wr8D5WB59r+xyztsXstvEx+Uid3Oa/Zk2brIXrJRKDXq0g7ZYRAqwH0+x70xj3V0MGiK68+u4nSWar7VSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRG1cSoNz5OrrL7e+Y3IqIMLL35Mv+s1/BZNp2lTdno=;
 b=oCNqOH7TIkXVWibBpzZnVO5VsB8a89O4GGQaMaalJ6WS/e3obVvKE9K2x9W8Ktpuib3iy3HCayVuAl/OiQm6rlC7wA/tJP/W98CXnX/HHHXToXUEETRENQfeB4rjc4xmkD7VdwG+StnaJGlAdSPLC4M57LDGhjegN7P7GDzKUXQv4J26st10IG0ZnyeKMiOWs3CfybGGq8kwgLxgmANthMBXP2Wgtj8Lp1ffvmkEVYEKWfJdmSZF9n1e0UADlcNdCKbDI087HHJi/n4MIFWRafaA9jOz9TaXQouehbtG1TCVYs1a1AJSKMXl7/oo06LXGmgJ0OJPH7wHamIQlzue3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRG1cSoNz5OrrL7e+Y3IqIMLL35Mv+s1/BZNp2lTdno=;
 b=1R1Yq3EHmHLKeqPRTkUOWSVal5OIkrsqYEgkl+anXS/i50HjfM39Hzor5CMFtGa3zYwqr+ukp191OyrHoCqIJRDfiA0MK5d7sgrL8/WFSA/1MLGr5hAzQ2hfqbiYvGeZbTTd/mcpSA/4VOOdN4k4gUy78PeGtLiydE4zr6ffAho=
Received: from SJ2P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::19)
 by DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:20:36 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:5da:cafe::3e) by SJ2P220CA0006.outlook.office365.com
 (2603:10b6:a03:5da::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 10:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:20:36 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 05:20:35 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ptsm@linux.microsoft.com>, <radhey.shyam.pandey@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH v3 2/3] firmware: xilinx: Release all peripheral devices from firmware
Date: Fri, 24 Jul 2026 03:19:47 -0700
Message-ID: <20260724101948.2895263-3-jay.buddhabhatti@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 00726e81-30bd-4a07-03ba-08dee96d33ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: dR8YrUxMk09s1r8hFemAXCFfQ+ikcsJg9R4tKq77moZDTRE80rYSWLSt+Ndr1p62kCcQFQqNXS0sK59dw7GtzPhk1QRKco2v/cLBAmVYNKWRhzRaUzkQ1yuZ+HgMEqfDNR9git2dgojHPWZEaXsKb937oaWYI0OMWuiHKoh2hiQa+6Gir+YVfoPP+F5U9npEbWZgZvJPPj4O2SsulDNsmDBgBrozDrxubwmFXdAfIglVyr8HihAcCMOk/HYjyTHF7UsyDg/lPC1gO/Ni1/bLcu6vfpBYZtdNIV9elIZv+1fjcgqJfs8/CeLS0AhVMVVRL8UQk0OHIr3v2qtKr1ZiW9ha+YmmJw8/ZLh3nUjgkiZkX9AxXFB2Uru1CnB9eXgYKX1y3LjGC6iVMb/HsPusZWa6YvLQ5SBHooRsLgwqLPbz8Aw0Qx+vOAygOccgNzelSZFJPDS4YIJHHy8tgqJPIT93d3ulFjvizYIH9LuDa/vS7Ro1KFuWkrV6J4/BBLHL0kkwIxN/wtoHLi+NRQR/YRy4PU7DQdethcmJc17MrkCy2EqVy1RgxHpDPHZd1nZNdGLpZhWrI3mFfZhIgEbnAI9Bc5nJ0nHqbwLb9OR5i1jVySsy1jwHcEY9oAEGoCg2PZuhLBasaxyZzUNjOf0PCOH7AuyGyHbKL1fvWJm4Vf6dYww5roVlLY4mHpvcUV09dc6gW2LmZ9Ks0ps9vGnN1g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rAWpuKJIDM+9uphXSkRVpF7HSFMuT0L/cGbiG5s3jA3T5M0bq8QKlljOsHUzs/QUFutHgj+CL9/CozVZCCeDIDTWTvTAN+C+SrT3vsQ8JDzbgaT0T0EEtAKVA99FYIN1zWiTVCjYl2C9ouMOFdofsinTPC6BOCN+owQN9EBr4Q36Z+4Z8sCuDP0E9hVZppjgZWiJw2RgcbFgSWd9Y9sEaqinK63tk6baNdCJUlsmI/0b2JbhOiJdjIxi/7dDQbLm7JW4nFqUAEJQx69/cmwCBntlXKYxIpc+Ei9qF3Iksk1dLMvv1+tHR/tZVMni58aRVhlcEu9cY48foLVPe7nUMkc5PqIzrV+OWKiS/gF/fAl1OPc1UHc0MR3oCKiso9nJ2VNjfuqBgVH94MQuaSYAOXzjaljb4LqQqcQiXkOc0lOxDSNoEK/SYPwCHNoPCGv8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:20:36.0640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00726e81-30bd-4a07-03ba-08dee96d33ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_032042_144577_145125A8 
X-CRM114-Status: GOOD (  19.49  )
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


