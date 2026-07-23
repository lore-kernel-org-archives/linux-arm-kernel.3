Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D04C531D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsO3hcSuuNu/QgPAhn48Rt/vw0yw1Ot1mi7uVB7yxlk=; b=fMUZQDMDCQobmY4qiV7Ae/Vb8P
	6giq2V3A/qQTiRsZOQiTEtox7mjTNyQbPl6W1PVQFlEb7mZDRE1KxLu/P6FNdVhU5mxNWtJwsE29O
	gp1d9V0K2yucHzi6qARa4SRvolMXCjsoA/unEUWhsnu6gC4Uomark0hqgo382JeyhIf+rI4JBrujM
	HHE16ljqjPmwZm3o+fzc0UU8EUZMlmHV5bltyOj2a7AC4g42+hwsoNQ+F6vfPbIOolqCPm4dNBZ9l
	IYzPhpFieaMWv+daRnoUADYBATpMztnHNhseQUqylLaHMjKYEb24LnFhrNGXPwa7tw/0r7Quge0mM
	IgUpz9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmssq-0000000EGx7-0UPk;
	Thu, 23 Jul 2026 12:50:40 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmssl-0000000EGtz-2kjA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Csn904zzCSVhxzSHAqYcdMamxdXvU6R0Dc0t03+FNPyHDUJZT7Hc/nJJAuMeDb3T8ZypUvdjt23lVY1pZTVaHSND22EIK7VoqiXmn0bv7717604CkEsFWv0zDhugVAuP0ddRyNJA47VvhpUodVNerbQCoOERyJz32YbwLk6KADunQbatlHUur1v2KumxJx7fLI4tFnsDGKx7jTkxritbCnNEF+B0j2KiRoGw2N5TYaaKN+kja856r/PYK8TQoR0AU5rt9+K4t5zTee6bZ4wdjudr+j5kzmPZEm0fNq49IQ4KOXCGgn0HWVZevb5bupz3ZQSudwIrqtl7G6R8RCQs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsO3hcSuuNu/QgPAhn48Rt/vw0yw1Ot1mi7uVB7yxlk=;
 b=CVucJ5x/mgJ5nU9e280R8SBBEEwPphKqm92Jl+CP4ffA41j1qmkvIQ9pyyffx0HgvEgV8KGdcf9T2xGnbqVsHIltQi7NLIQUYzftrChXxqodsgQnDEhEj2L/1KEcpOgaB2wH6Dly/VsFEKhhxSzyA8VKV1G08fn02+gjRGzakKk73kLsBwyehpTO8kyJC9yHFCH3Q6OXXy6aV82j+Q8de6ybXG0O6j7EvT1JXYOVdfCqPGaJohzYZGv+XjW6i0xjjbO4tp/FYM3LGUaiWS+fys5eRgJtvcgX4AQLfgZihf26jSn7EK4y2Rw9dHkLC5o9RUHOEAFRZo1R+EbGLrOrlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsO3hcSuuNu/QgPAhn48Rt/vw0yw1Ot1mi7uVB7yxlk=;
 b=s56a2v+kIKJMV1A1tD8w43n0QUxOIvyNucdBmnwtcrT+okeQTbP7Cr/C+nN0YG+V2aouw73P/j7jbm0UjpXepd6KR2edlLj5rVx3qP3xC0DZKhmh9iF+c/FZJpo3bbm7IvxOunohF31sI5etCJR0DJFmRJAwlYwZvnjeDe1YjKI=
Received: from IA4P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::9)
 by CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 12:50:27 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:559:cafe::5c) by IA4P221CA0006.outlook.office365.com
 (2603:10b6:208:559::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 12:50:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 12:50:27 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 07:50:14 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <git@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 3/4] firmware: xilinx: Clear firmware notifiers across kexec transitions
Date: Thu, 23 Jul 2026 05:48:40 -0700
Message-ID: <20260723124841.2567827-4-jay.buddhabhatti@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: a64db9b9-b437-44b7-2fa9-08dee8b8f8b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DIhCL823rZAI3LgEJoA8EMmf/hc7ZUi0sjywvXfQJqQga8lWUNKa4gH7EWeKFUUGLuS5gdJVunMxkQU4cPePxf0/oisWjduB9H0LtFJKdXSWryTAsTlnx5nNjFJkH7BLCykI17VIvAKZvPBLy65uizDciiUPMnv9ddfCnNlZb2L5mD7vjw2Hi0P67HYqjixfEXZfGM88VGJGB59FqYOATU7dDnPRogTaGYRFpuGH85bhh5wTttwT758F86M9ljgBmRORveNwOQKTtKesibFi3WM32ZhN1obXvdrRXxkFwBV6VmObSJLtP4At0puPQvtA6XmSszOl+8xv9fY6X5bsAXD4MwuS57FIfiy4km5cD6jHplNMrOvCfjx+8Dyv6PWfYsmyQkEs5MsWIA9dY5L2dlPg1ppx2seiLIyXd3z8X1dnjCbj/O6kfwO64sc9jX6ffRmC1b0/3jEUacP7sjhqWvLDkaJMU6kWdbmOLMhYrQ2UwUVkOzVq/77+CWxiakC1jX9+95rbcOYJvWDmo0AhSw63vP/TpNs/1LUN7B9p9Fzz8E1FS57wYM5Q4ebIETaxNcOP0/xPpKcrrrS42B85RoDYnYMYAGYzhf+CcP3sgHfcSp/zqjnChaXJ9myomkl+gRTIT5qxMhHmukN2FNU1VaHmaU5F7LR45wBHcW0EUrLejw7H/vU7T0+Ka6TM04b481ormE9ip61nCiAIcb5UDw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8A86NplGMZ6fEcETh8nUwRL0HkIdx64ncFHwdIbE09If1lqLYTZW9GjKHZo6whTJ34gf3y36teQqEi+WN297BnGG4dI+vYMh1PsRjqNeKwVwBGJPXQA3G7dkVl18N2qWcYVoSr8I2PieGXKiU4lh7NTlR6473h3+I9/i+ZV9jTN3zR+qjInPE1siy0jLEoGLlnk+7mCgOdSorx/dxXNEfzH+vsFjZxC1aRr1NrgcI7okSsCYvRZg0yHc2l0vrdcbszuIVGL9yypy0OotryY0fBY8XN7d9Jt5pBZBwYHv0WdIclbXzOj95GVMgxXBmaug7x9NWDPKs/Re+E8bG3wtb67XVJMbs5khPd6SeF+WIuOj/sXIkVPFwBEI9/GqwvPE0MsjkoYf8IfhRaj9RncofMbyXrJnMgV0vi0r2KuumNTYZtQhsW3GS9NbPtRb87/E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:50:27.6539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a64db9b9-b437-44b7-2fa9-08dee8b8f8b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055035_701637_1107DE52 
X-CRM114-Status: GOOD (  17.80  )
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

During a kexec restart, only the kernel is reloaded but notifier callbacks
in firmware persist, causing state mismatches between kernel and firmware.

To address this, introduce PM_ALL_NOTIFIERS node ID to unregister all
notifier callbacks during kexec. On a graceful kexec restart, this occurs
in zynqmp_firmware_shutdown(). On a crash kernel restart, it happens in
zynqmp_firmware_probe() in the reloaded kernel.

Unregistering all notifiers depends on firmware support for the
PM_ALL_NOTIFIERS node ID. On firmware that does not implement it (the
feature check reports a version below PM_API_VERSION_3) the step is
skipped and a warning such as "Firmware doesn't support unregister all
notifiers at once" is logged, e.g. on Versal NET firmware that predates
this API.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 14 ++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 64d2109eefd2..fc7212f554ee 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2110,6 +2110,20 @@ static int zynqmp_clear_pm_state(struct device *dev)
 				 "Bulk device release is not supported by firmware: %d\n", ret);
 			ret = 0;
 		}
+
+		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */
+		ret = do_feature_check_call(PM_REGISTER_NOTIFIER);
+		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
+			/* Attempt to unregister all notifier callbacks via firmware */
+			ret = zynqmp_pm_register_notifier(PM_ALL_NOTIFIERS, 0, 0, 0);
+			if (ret)
+				dev_err(dev, "Failed to unregister all notifiers: %d\n", ret);
+		} else {
+			dev_warn(dev,
+				 "Firmware doesn't support unregister all notifiers at once: %d\n",
+				 ret);
+			ret = 0;
+		}
 	}
 
 	return ret;
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index ac39e5492961..69a2f74269f3 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -149,6 +149,9 @@
 /* Node ID for all peripheral devices */
 #define PM_DEV_ALL_PERIPH	0x18224FFFU
 
+/* Node ID for all notifier callbacks */
+#define PM_ALL_NOTIFIERS	0xFFFFFFFFU
+
 enum pm_module_id {
 	PM_MODULE_ID = 0x0,
 	XPM_MODULE_ID = 0x2,
-- 
2.34.1


