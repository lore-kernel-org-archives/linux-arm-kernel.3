Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E0BC7113E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 05:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LYF/wHzRmgaLetYhboXgsoMYJrjaMFUjVejnwhLRnRo=; b=fLEMCkBIRodbJdJymKVR21+/1F
	WlVvd0bQ0SN9unMeFC6YB2U14J+JQegMnEl75dG9m5wuDMX0zw7uZCscuVEteM01pCUl2ssmKk86t
	0pE9/byR2WsCrrXnOLtsW4WkOLsYTvchCczVF+u9DueTSTvMPomNcZQ5G8SYxe0Q4kH50Cgm7KVn2
	jR2zHDJ+xMvn7Ev8GFHmcKAvNJ3sBp1LCNUvXvpSEeIwl/CXy33ifRe/va1xRJXYqaQ0JOpDns9As
	XqbHerzOZSJbM/B5TmuTOOMk5JIQ2TDhrpafiKuulDEiyxD4EN0DvcoSBQfh4kuxw8M55vEPpsJft
	DnjMF4BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPajF-0000000CFGR-0G36;
	Thu, 12 Jun 2025 05:43:57 +0000
Received: from mail-co1nam11on20626.outbound.protection.outlook.com ([2a01:111:f403:2416::626] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPah8-0000000CF6B-0OTL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 05:41:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rloXOpQ8VnGAJB7on4DBbfvK8W25MbQ6KxEG1NWQgwn6/DHZKP7phrF/SB6Ns5CCfQHBwQd55bhqJzTCSB2XZGFJGawcbTuuIvP/isLHYoE2QqF9yk09ulxafLzHcwdz5iyEjpJ4mGLHIf3eGFxUGTH55F9bucYwsFCUOGCUjd9H4p2R7u32601qJfntZx+xbuoKwWDx2FHtBq3H6MDxZ0QigEHR0n4ucq5zRCMoTG0BnBAR3Gt0EyPB+prC8wYby3xOC5nj7CDIa3LqIVTXSV3TucCKW6/PMYjpHlrwOLhiVHfxQtP6qCT+6k13eiywurW/6O4gP6UwQ+ALXW8hhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYF/wHzRmgaLetYhboXgsoMYJrjaMFUjVejnwhLRnRo=;
 b=pYhs8IEEF3YEtRrZlQHSB4VnYP276cn4uRdYvyzS0UX5FOUdeygu29aXKpU+7eX3Hx71m4hDKdsHRPJw0J/lrgB2k8vUqNQ0J0959/AHVoF/jq2LVQqZOQO8mvRRQd0h/pE424nfQC2ChwvL0ORlY4eJtXf6P8+ovQ6tlc3zpq43S/tbWSOZ5n2d0zxJKeTBGkTvWzNy4m3v0T4WstN4Lpd6brP4TGB5Tb29/5NPbbnMtyixHZ3r4D/a77micgooJrjN4TAznHvqFUTH0R1754EW+66+rk2UC2/m3D3mrqqJfW/f/7nLjUe4jFq8QCBKIokJGnMxUNJoPaD4pz2Chw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYF/wHzRmgaLetYhboXgsoMYJrjaMFUjVejnwhLRnRo=;
 b=0N+QHoKZcY/1fsd2axx6nnOyyqy9kLoL39BOsO1xDpXbLuu++eLhOKNKV93tKa5U+/ELdvsukA0Wx57C8LzezXDUOs1E0qYNEVCahd6KQjBBax9tJBGLeMluLJ+i3MhMN84+G/F4zEd4KXje2d7cOHmKVYvLckevdvbcw9B9kDg=
Received: from MN0P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::11)
 by MN0PR12MB6078.namprd12.prod.outlook.com (2603:10b6:208:3ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 12 Jun
 2025 05:41:41 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::da) by MN0P220CA0021.outlook.office365.com
 (2603:10b6:208:52e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 12 Jun 2025 05:41:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 05:41:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 00:41:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 00:41:39 -0500
Received: from xhdharinik40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Jun 2025 00:41:36 -0500
From: Paul Alvin <alvin.paulp@amd.com>
To: <michal.simek@amd.com>, <adrian.hunter@intel.com>,
	<ulf.hansson@linaro.org>
CC: <git@amd.com>, <alvin.paulp@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3] mmc: sdhci-of-arasan: Add shutdown callback
Date: Thu, 12 Jun 2025 11:11:36 +0530
Message-ID: <20250612054136.5860-1-alvin.paulp@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|MN0PR12MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 2702db0d-2b14-4d7f-dd3a-08dda973ce98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Abs8N4fFtBwoifWXUERBtNNl3bwAVsbcTITVugzTQ63ZqCKLRTSHaAlOXAGb?=
 =?us-ascii?Q?L3Cq33OQUW23tut7/AQv2jtmL9D200+VCNyN9OVWHu5PthqLDcCqUs9tYbrx?=
 =?us-ascii?Q?RhZdh8ONjYMu++dMv7T8E2mQD+om6OhSYZ302AywqWalGu/Cd/pHYihbcPQC?=
 =?us-ascii?Q?yw/TIMNqqZ2Atmy5uwGDdgbdHjdFQjjCSTFxQSvklOu+uubfLP2m5gzv8d+v?=
 =?us-ascii?Q?FJeviCY58+nXdBwRBxw66wHkGzpzVxvKtdqpxyxCLakinYeed+UjIUcJgyUb?=
 =?us-ascii?Q?Ih7Yq8IiN3VUCbfx5Jy0Vx4pSPkkgenwRkRv+cySF4tHS6OhCrdekLPaNpIc?=
 =?us-ascii?Q?44fvEoKkW0yCBgJBI9pjxQi6m+uHDx56U8aWon25aggsDoH8m/KUXIRp0Mzg?=
 =?us-ascii?Q?JT4yaJ6qRP35tmodPwJR3ubYfRA7cPELDnYTS8WWRqCbSunPguHI7RxnwG/g?=
 =?us-ascii?Q?/Dr3UlC52xwBBi4CoKhminyruGyRr3nXltt7IMY4DBUKD/wYbNewG24oGLaw?=
 =?us-ascii?Q?qANXXiDjgeunLFkgBwSLV7abSO+lD23SSmZH3X/q2Je2AE8iC+/TVCli+yGB?=
 =?us-ascii?Q?LZ7oJyT60p/LGwLWyn3Mr1Ubdct0JbWh99UsDc8QqQqgo4Dh1ByRRKB1f0GG?=
 =?us-ascii?Q?j+id4ZsAOQOeGt0tpIM7aSCKU0QsXr8l30MayJlsk0xhLHyZndxi5D/0shFq?=
 =?us-ascii?Q?FfftOwtyUSJQPGMmwm3roLw95cX81P755bBOr5fQDSTC5Z7oKqMuZZ8Tbyz2?=
 =?us-ascii?Q?rkGQmYYTMyHcse+DVQElnngDx6SEdgBPvibbBk/FhVE6HiYS6AEgRJP1qBvW?=
 =?us-ascii?Q?3aIB0GcFkK4EJdtkxbPUN/BwDeSY/J47UqrTy37FGJh30CTF7i4xJUYQ+UeY?=
 =?us-ascii?Q?cLr/Cw4Rg3Pfnpzl8SJ4Xzj3Mxhd8umpdq4/6LTdFW7hIK9cBs4NC3mXIZ5B?=
 =?us-ascii?Q?itceGILiq3hzTRlWM35EkYXVgGfP2IphYbx0lqIAjtYoAsLobPnr3d1eK84d?=
 =?us-ascii?Q?QnnOkhQ5rEChL5XUcl2034M/X5jwMDMVVcgWeyW/5jGx4V/0B3ICCBjD2JP8?=
 =?us-ascii?Q?Od7SqssU1VmdkkCRC9LJk4rdC1538xUyDlOs13ttz6MNPHL50EXhO0QNn7Ft?=
 =?us-ascii?Q?zJuIcHiJ9D2vR+7dXVCve2+I9eCdkNMEB8a3hyvqD3ju6go9oaztd2SLwBHV?=
 =?us-ascii?Q?4w46kz1av0QFqYe+mGpfYfWU3IDuHo1zc3OD61rVeTmknh9q+G1eVYFGCGW4?=
 =?us-ascii?Q?AoiAb7JX/zPZLhyXojvpTnVeIGHbe8PETSCvSnYgE7c4fh4IzBuWMDPR3O2p?=
 =?us-ascii?Q?apN9ncHAMYNRKvm8PeJqjPS3vFLck5Kod4z2OnZ3xKDrobzPYoAa6zpPqFCM?=
 =?us-ascii?Q?f3zHc0gbmh/C+emp0h/f/isdZwycy+uLrBa31THvO/tYXb3GLlN10byBbtrb?=
 =?us-ascii?Q?vrN4fMTk3XeIxlTSezskufTwzyB/QmJeVIIkyRJyXmFOVuiZlOvHPEHtj+o9?=
 =?us-ascii?Q?lg48YMQLQEapWC7gxASEhHC+fsgx6x8pVNr4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 05:41:40.8500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2702db0d-2b14-4d7f-dd3a-08dda973ce98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_224146_133335_F63D9A6B 
X-CRM114-Status: GOOD (  13.38  )
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

Implement shutdown hook to ensure proper host shutdown by using sdhci
platform suspend. This ensure a safe transition when the Kexec utility
calls the shutdown hook, facilitating seamless loading and booting of
a new kernel from the currently running one.

Signed-off-by: Paul Alvin <alvin.paulp@amd.com>
---

Changes in v3:
- Updated commit description.

Changes in v2:
- Make use of platform suspend instead of driver suspend as driver
  suspend will only get defined if PMC_SLEEP is configured which
  results in build failure if it is not configured.
- Updated commit description.

 drivers/mmc/host/sdhci-of-arasan.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index 8c29676ab662..4abdad3c4e5b 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -2056,6 +2056,11 @@ static void sdhci_arasan_remove(struct platform_device *pdev)
 	clk_disable_unprepare(clk_ahb);
 }
 
+static void sdhci_arasan_shutdown(struct platform_device *pdev)
+{
+	sdhci_pltfm_suspend(&pdev->dev);
+}
+
 static struct platform_driver sdhci_arasan_driver = {
 	.driver = {
 		.name = "sdhci-arasan",
@@ -2065,6 +2070,7 @@ static struct platform_driver sdhci_arasan_driver = {
 	},
 	.probe = sdhci_arasan_probe,
 	.remove = sdhci_arasan_remove,
+	.shutdown = sdhci_arasan_shutdown,
 };
 
 module_platform_driver(sdhci_arasan_driver);
-- 
2.17.1


