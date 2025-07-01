Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7A1C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=walO4ieAjnSlQmIbG0kq1CD94eH2uL4Fpm9aeKyzreI=; b=OZcnquTF18yHftZav5elNCGCOQ
	0xAdv2uPqRnRYTvGLdG4/LKC4U/GbwG5h3wg2agx+U6H7Nfsl5Net/57WmnnV5+rlR0JprWuUC85X
	xxsF2Cl4etUMxCBTMs8T7MoI80o/REJKI+tjzTeU4HMjyLY6rGKb7PyKStL9Ak0oseX7O1UIi1/sO
	xEe1uExQDZ6eomNWqyPSFLILoRQ7fkI7HoiYW9BH8pja5tvZNoqwSyPWeIvhqUkO37V1sdesuC2UR
	QWDU4ETkpWNrFXNvu1rBGBApsCI6QNJZHAXYE9J2bp/ky/lmhfSpBJzzw8HE2vtmr5H4LVIh1c1e1
	/qSwUVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbhH-00000005eG5-0B0p;
	Tue, 01 Jul 2025 14:10:55 +0000
Received: from mail-bn7nam10on20629.outbound.protection.outlook.com ([2a01:111:f403:2009::629] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaHK-00000005M4V-2Fw4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:40:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUnH/4jCHkrAsazSWZ6pDOn3TjSRaG35XTDOKglNdEQopS68EZAnkY2lnqT6Bn6xvrNH2+efzU0j2+tYX1spiK5kiiS0ev3CDW/sER3gtBQOGmqVqHcY62m/rR3vUaSblUfVA0cW7A3kMcGcEtfl6vKqB229BQt+id/XAIviWfNkc23WgBbCIudFag1bkUAIVpZWxc6Rt3wV+UmWgeiR0sKa68+z7EDtJSQzgUD1Xyjx08BGhjqeTjmgWRjzzsFb+w0t59iuM8PiibbtfUUeCYdEEeRhdNN0b3xzIZAj4syZ98bdeRiaOa7f5/c+ZTJZ5eXCrGEjtkd3c0mEfloN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=walO4ieAjnSlQmIbG0kq1CD94eH2uL4Fpm9aeKyzreI=;
 b=bGzX+Wv3J1gKpJ6qCqKizazfw8zqBrjR6vY+oV8YxICuCGvV7k2RdLvtdj3Xa3WQjMfk5HH+ap43j6NxUiWtpNw1JG39pDneUOGQga0Gjq1aa/iz593cN8Wekiji+V6O+dxJArY9HRy4KSMD74t4Fq+9rwv0s8Z1HJlHZT/zhW+7VaVjYBMXqIgpHmnx3q9W+H4w9+zWadSTGm4fsXc5XsHKansV4InoHbPaijqPRMUyfZmRiajfY1LyMOPh35lSJOr8DAE5IHQ+VjEAZ3MNrcp70/u2n1ZSYmGdMqBnNIl/+VnsJQfUjnPFc/7iuqGh1bGXGHwifelujvKiT8F6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=walO4ieAjnSlQmIbG0kq1CD94eH2uL4Fpm9aeKyzreI=;
 b=HVw5phXlvaNhjA2/wMRg4I22Sq57NyXeL2aTHKYhAvAvjOXCyuuIBYNsNt6Djv1O4YaAlhhFkZpCZTAgSImUwp9s0GdPuW/uBn6dlbdMbebvEGSHy+3yoU6Jx9Ux3rp1tR8QjbvkvN7U07ZkstWX2+hsyU42OonMxYfszuXKTNM=
Received: from MW4PR04CA0119.namprd04.prod.outlook.com (2603:10b6:303:83::34)
 by MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 1 Jul
 2025 12:39:54 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::70) by MW4PR04CA0119.outlook.office365.com
 (2603:10b6:303:83::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 12:39:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 12:39:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 07:39:52 -0500
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Jul 2025 07:39:52 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <linus.walleij@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <git@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 1/3] firmware: xilinx: Add Versal NET platform compatible string
Date: Tue, 1 Jul 2025 05:38:49 -0700
Message-ID: <20250701123851.1314531-2-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701123851.1314531-1-jay.buddhabhatti@amd.com>
References: <20250701123851.1314531-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jay.buddhabhatti@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 7763bf50-fa69-48a0-079e-08ddb89c6168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZAexiTncdfcK78SM+vvBJXXD4SkvsmNKPOnWOrmy4HmyJvRWB34LAXWHm/qQ?=
 =?us-ascii?Q?jkmJyJlOuBul0NF88xy2BFinrKX3P6MyWT1yc90dGDsy8SkpLXMnyW4mOrC5?=
 =?us-ascii?Q?UNERBj036X5BEwAVGLN1NCPPCYsFxadm48JxbnzoeyhF41nHRAPgXEfcx+0S?=
 =?us-ascii?Q?JfEjVclKdTg6mu49fadbF6YRjeXL7FHsdoaa4YvHvvRs60ZKRPwmpWFUDWUi?=
 =?us-ascii?Q?DYBomytOiFFmCtaHcyM5RRtGGxAnAamkN+JgVguSgg1n0kVUkKUP+FZsEUr9?=
 =?us-ascii?Q?OHb8fC9/CGLIzn5v3Pw7V5mXjP8J2KOMtSb8YHWgpeo/t4t3aN8AJZ6M1O1a?=
 =?us-ascii?Q?bjteiuKkuTb2jAGDpGgwRgiJ47toXppbfCR9cuIm30HxwPCtYslLkAsvRd5L?=
 =?us-ascii?Q?4CWPq0bIpTKvyyz5cD1+lxKEnO1T6v7n4yyxHwWYpvYEraCAqkGPiZjuaXFu?=
 =?us-ascii?Q?O1wmR9yDSGFBC4fh4f4bSmw5UKWQ4afCYb39cn//xW/del63zZCCqFCGIfa2?=
 =?us-ascii?Q?4Y6M+Sjm7mVRQJi1Me6hkgKwIaAMLN5EQlPOlWImBgR3hu0SDrS52w8Hs/DG?=
 =?us-ascii?Q?kjWwtvwShEFcrc1P3FWnQTQDDDEyJUJNBvYbovArfNPGYuDKGuxI7rjftHjo?=
 =?us-ascii?Q?fj+B9KJsIhQrbZPkIiVDqkt1KlPJgi8/ytCce835KVtXtQgsMT4Jh0mgj0uB?=
 =?us-ascii?Q?0tMkSJutgTELGHuPAZxagf3VQXd1j5I029T9kU88NA9qBbT7Unwk4HpyRAVK?=
 =?us-ascii?Q?jyaa/PMIY23raGMunpAINGsaVqFdNqTwQwUngEOtOqiegIBH3/RUvpZhg8AO?=
 =?us-ascii?Q?+z/PstME4KEDDueLlXcCvq7afPGIymaLfkpmH749U0pmxJ2Q6drRZGxSCU1z?=
 =?us-ascii?Q?7Hzcmk2NcCu3s9X4vyT4kcVcTBjM2sW6SE+0ivyf/MwhZlkjfI4bwEOoPGSD?=
 =?us-ascii?Q?Ou3KnQIG7tBC6hxxg33dH9C1syLLkOxNeGjP8nJmw07DBqm9PkBeRbVInTbN?=
 =?us-ascii?Q?6pkPGFTVFbik0sQOdE1LmPe+YCHiZLRgTZvQFHJId5EoVvkJlhDBfIbuUAax?=
 =?us-ascii?Q?8I/dSkG1Mn+5OnHeILCpEsaZ8KqkOmCA+WSJ4VGYhnJJ5UdDM9x2g7R7R5NT?=
 =?us-ascii?Q?yMDuwdFTRKifoH4BAyO+Y6o7ZTJulLn+NMLB/W/SFVrc6M7oHo67yYhfMNeL?=
 =?us-ascii?Q?d1YL75aableBcR/8Ae8U+N5ob4AdTUOXhb7pF32Ul5H0FkKMe9rLC8yN9CoK?=
 =?us-ascii?Q?/wf/ISvlPJqCaddePHeM6Nqn+oD7Jeg9izCoAgm1YGgQ9DX+WwFRMlT93xEV?=
 =?us-ascii?Q?tiQJ7STWCVlAaXBVkWdr54ngi9Mm5rhk9skCf04qaXQPw42cpxyLyKLVg5QK?=
 =?us-ascii?Q?Yc3NVy0nbCWC5cWcUfslUC/lALBs56hoo2TmozJSVAK68KduVlHrmI91XNeg?=
 =?us-ascii?Q?kRqbGffSqdzrC9p4PTKyUq+QQYykkS2j/tQdKm0+ndso9TkOaH2LwEf1m8QK?=
 =?us-ascii?Q?EDBBtSQbkytz+CMEf928gcUrD86CGSPDY/Wd?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 12:39:54.3158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7763bf50-fa69-48a0-079e-08ddb89c6168
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_054002_574992_407930B0 
X-CRM114-Status: GOOD (  11.12  )
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

Introduce a compatible string for the Versal NET platform which enables
platform identification based on the compatible property for platform
specific configurations.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 7356e860e65c..89e0eef219ff 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2103,6 +2103,7 @@ static void zynqmp_firmware_remove(struct platform_device *pdev)
 static const struct of_device_id zynqmp_firmware_of_match[] = {
 	{.compatible = "xlnx,zynqmp-firmware"},
 	{.compatible = "xlnx,versal-firmware"},
+	{.compatible = "xlnx,versal-net-firmware"},
 	{},
 };
 MODULE_DEVICE_TABLE(of, zynqmp_firmware_of_match);
-- 
2.34.1


