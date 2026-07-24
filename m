Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA38C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2M6fYO7DExB5eVkj7u3WmZ1oP8edC4HwGD8A/I2sqbU=; b=p3Gpf9so0sPY+S4z5lid0tNKmV
	5aCcs7KwsyfGwxgkF1LY3fSCaDF8J4sKeNHG+8M0gCbC2dLAnFQGtUnppNRtXw2b5pJaNsYbE4nYP
	XrrueC/jPQsm3Hyn4vL+9Y663rM3ZSFdZuWVKWZZ8wXOkePr6StnyBtaqhQBXOu1TDANQ9V/C0UFg
	70A3WyslBIz/AYcRQC4yERgk7uNE+CooaXGV8DplLGAFdx+tOg0G8GOoYK83Ofl+QtMvE4gJyu/IM
	LGwYAnS1KKhfSVUVvGAQ5lTixC4xD4/JAg+J5mObaJPAakU7UqRTnl6MtoqAiFNedGVORbYSQCTLK
	ThjHHtig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCb6-0000000G0gQ-0C6f;
	Fri, 24 Jul 2026 09:53:40 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCax-0000000G0d9-3jyV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:53:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXguPbHoS/JOIUCFdnQotIPuNk/uZ2IJlpS1z0OLGvwoqAkGlgGX7Hcv9cFITHhMh5MusmSfrDvz4xlewZPDnfC3x9sr+n9ZCa86WO7PX8Cyq3kMCZ5MOyZPJeZCfmBBAPv9CkbUPJytlDM1PBqLo46NGo9kjKa8+CZ04EkSYOXD0/YJv1Jt/aifef2vJOnyb77RpWj4zhBj/L06/wUntvwqIRRiqwLBEc/1ShckkuegHKnaEa3nw7M4/HYO6/05k/fLMtCZ5qOJ0iWKvlJhENGs4guAplbGK2J+Svk3SsnUPut1ie41tLgPq/KrCTYi1JKZQMs+YIbf1ydHFdS8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M6fYO7DExB5eVkj7u3WmZ1oP8edC4HwGD8A/I2sqbU=;
 b=vpkW8o28Y4ziHEVEeK48Q94PS1uhER4iNDQGXiuWBGDIa5wV32ZE4aVQ5BjLUd6BRraRq2K9wc7pUrEZCeGimNFqF3+vppJrvp/1iz8TboGKu4z485yp55Aj1QyX0FaneEJ8SyjlYEvrmAcN6rHUoF03dX8KHDU9kxAZ36ruarQ3m37ch0c3Fduwq3IuyeeF7t+x02kX7J39FUcEOj1BRtvBairEhvQfHxzG7UciaLKJOjVIlPYIbjtc0RA9g6MOXcpkE3ANFJ4lv4PK56grq3bgUwqwUz0eY2GCbgl2rTAmgzf60ajDykE84x5AHBxNykwncs+gzxa+bYctw8Xcdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M6fYO7DExB5eVkj7u3WmZ1oP8edC4HwGD8A/I2sqbU=;
 b=IbOs+sb75QszCAxJ2Bp+UiMcV5YZEWsSK8Qspl20coH7sGCedXQHe6vGc6YGvGZMRtcsEmQbNc0/QVJX9mNNbfmQH+iwwAV6Gv8F9cj6q0YPC3361xuC83IETDRypI0mqQ+awAwtQ9/TlAeN4EQg9QWpx/C98sTr2CsZHyOP4ig=
Received: from BN0PR07CA0021.namprd07.prod.outlook.com (2603:10b6:408:141::16)
 by LV1PR12MB999282.namprd12.prod.outlook.com (2603:10b6:408:2cf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 09:53:25 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::6e) by BN0PR07CA0021.outlook.office365.com
 (2603:10b6:408:141::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 09:53:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 09:53:25 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 04:53:24 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ptsm@linux.microsoft.com>, <radhey.shyam.pandey@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH v2 2/4] firmware: xilinx: Release all peripheral devices from firmware
Date: Fri, 24 Jul 2026 02:53:00 -0700
Message-ID: <20260724095301.2890001-3-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724095301.2890001-1-jay.buddhabhatti@amd.com>
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
 <20260724095301.2890001-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|LV1PR12MB999282:EE_
X-MS-Office365-Filtering-Correlation-Id: 442ce9e0-a106-487a-be4e-08dee96967a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: U6810JJiU/jHBTVZafnJzqxGigN4MOEKZVI+59xJAtOzyL2Jdo3D3s/D4eoLW/rEfGsGQSPj+XiDcNDV4mWzRjW8QgFLmTVCQDfxzY71ZZF2VfvlA/elcp7LeuD5SiysoYahNhhFefeB+fl/qKUtw2T2DBwZurkzDuabn0gCwlH63CDYiqnRDuTn06xAd7DJEKChk6wyDd/FewyJ/Q+Iskzh05siXIQ1/Hype5eY0M2S9fPcH32vYOqWGbzMjDTkuufA3g9WQrDviBynfrJRfA7S+I0Vz7QTIV6AsZfkh/jc2dquI1Fa7IwfcMLbpL1ndhGAJb1vcSNuvX9S4Zp7l1fVUp9+SjmizHRTMUuKhsHjMDrbN/MGTmq2yjwq4LQ/L5/447g7NQAAiRlLr1O7ra9Ep98LNUe3ih/vpM5aWleOpM+PX8IIow2tIWTK9WWuDUb/38TBoP4guTx7h1tNzHfuMZIziQfPYlIFiM73zr2W1b8/kLvMF0TpYMRHKA5ANWFYKlm1UJ9ZgmQY2nPhc9fSGI0feoXcl9A6ngUz8FDq0yXu01I91iZrIOj3FF50+7/8tE/LlVYeWu7aMFNWaW4xqwX1IFSFoqF9q6jur4OBY/dI3bVo/hEj76IYLgjKz1gSmr+YGHgPASYxcw5N48/6LfRbEJ2UlGq+19NRDaqyyJ9Toh5D1+JUaJQD3GvSDPco7OzzbA3FuT+VzWn5yA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aQaZsmViy//axtGrHfZ2r3C9olrse/Z65haT9SuuoKkcPmsp1csEuXP+Vfru+DR78atvns3AN5+hSYiEsI2ByzQas0ENlNHriL7sMRH+AFKgcfgkoVgBMUa83GJgEZMzCQ5R2q29rtxJ8p3C+Cw0hXa2l5Ltiz6WQsLHLaRwYCsmgdtSuTf6zWtyHCWxke3lysgIC5f1gi/cZd5C66kqCyk+gojlmSPYxB0zdOm2eXnXDimUDKkywzQtJejJjVO1mbPwI+SbIeSJRBh9OTjvKPeqWW7VCKu2D8XInoOnj3ERBD0ohW7QusX1u1lEPS5/b3kAA0S3k9HWIIZK8uhqFJsP7LA6BcErvaL1x+rXKbro3dszl7GHDVAM69TZTQ7xwtxIfXRi0D7E/fNtCCLCOiAmBVCW3Uit1YwqW7tbD8rjCm3voLHjCaub7XNoNs34
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:53:25.2589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 442ce9e0-a106-487a-be4e-08dee96967a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB999282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_025331_934039_E8C0491A 
X-CRM114-Status: GOOD (  18.65  )
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
 drivers/firmware/xilinx/zynqmp.c     | 14 +++++++++++++-
 include/linux/firmware/xlnx-zynqmp.h |  4 ++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index b5e372190b44..0deb278b2c2d 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2070,7 +2070,7 @@ ATTRIBUTE_GROUPS(zynqmp_firmware);
  * zynqmp_clear_pm_state() - Clear subsystem state.
  * @dev: Device pointer used for logging.
  *
- * Clears PM specific data in TF-A.
+ * Clears PM specific data in TF-A and firmware.
  *
  * Return: Returns status, either success or error
  */
@@ -2095,6 +2095,18 @@ static int zynqmp_clear_pm_state(struct device *dev)
 					"Failed to clear TF-A specific subsystem state: %d\n", ret);
 		} else {
 			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported in TF-A: %d\n", ret);
+		}
+
+		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
+		ret = do_feature_check_call(PM_RELEASE_NODE);
+		if ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3) {
+			/* Attempt to release all peripheral devices via firmware */
+			ret = zynqmp_pm_release_node(PM_DEV_ALL_PERIPH);
+			if (ret)
+				dev_err(dev, "Failed to release all peripheral devices: %d\n", ret);
+		} else {
+			dev_warn(dev,
+				 "Bulk device release is not supported by firmware: %d\n", ret);
 			ret = 0;
 		}
 	}
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


