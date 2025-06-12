Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA77C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 00:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ipZpSU1OIi0oDd/x/DoPNkIfgcJI4bkP3OmudHwwIm0=; b=B6qZ+lfOJKG4VWvqjTcIx+0SgR
	9RdZ/Kz7XmDi3SBmB6Ri3lgiq0eG3zlArOEtZ/XYi5Dz2sFhYjMGOXIr9LMWuaqZIZdN4m51sLj+8
	JuZIvDx6mYQ3jaWeUS5IBtVHD9qfiNn8fKcwqI3EmLjozTtz2MAqWKb9eyL8GEA4ZAzSM9SyCvqxy
	aJIqq3XLNT006VsoqA7TcAKWpTxhvjdFaQDV1DinE2dTGx0aMDKkfiJMf7OUNOJIYuIDiZMAtu1LG
	I27ue7aXZgGEjd3oaoqUePO4UDQ4WiT8B3Xg+/+5m5pCWQ3RAJAZjA//upkD4yP+j3VpSQINNrJuB
	4eO/cpiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsDh-0000000EwoY-0gke;
	Fri, 13 Jun 2025 00:24:33 +0000
Received: from mail-dm3nam02on20608.outbound.protection.outlook.com ([2a01:111:f403:2405::608] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkge-0000000DwJH-1DfB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 16:21:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPMIY4MITGmv3D9r++yV7wwCTRskDfnkeFmuoVsEqALKJ1WAKFkcVg2LaqdMp3VfXSGAXFKjY/XcSXxTF5hf4ZFzoC/Gtxd/KQitkC84W65hCORNp6ibF03sIW/vNWASEHS8siNlt94A6iI1sUTmN4dUB2qxCBlSUXMQfoT25ORxNXdk1vTHOTDMRFwpn1DmE0Osn30bsgcI1OtbUbQcbBXLqYh4rMLXrm/TiHdwMiUBT5sQYOzYIVMJ3kGGNVprOKAaymsegYiAbMFpZXqqtbEF2mrBl7FJ2N/sceFtX7iJc1/hi0hMdWnZf4I/CrQkQONYnLSwDjEP8dff31Sy5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipZpSU1OIi0oDd/x/DoPNkIfgcJI4bkP3OmudHwwIm0=;
 b=o9sFUK0wFOoFwL+mIQRdZnb9OL8IdfCUtd3+RVO1haQUQ+Ebk38IHDN4lozI2NqiHPTUmyocs8DSP52oAjyke2WUj03t+dfdO0+8HRHFccLZz0GADBlPS91zZD55ENcmnFP6MqutUNAesyykIYJSsbpayq5ZRk504i9QpXirtR4I9XQR0hhX8IuEeUOaH/yNeaaMO7eosc0a5X93MI6fSYZpeTqSUnCPUVgSrYUemkqfkgNOSZGY8DRYWIMeXsEvscGjQLmIRzPAZlwdBkTK6jx7a854FnUCLRfClbWK4NetXZfgQtZeEo7jWBzJHjNzxCF2RGtLKEnNdq09x4rkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipZpSU1OIi0oDd/x/DoPNkIfgcJI4bkP3OmudHwwIm0=;
 b=c0scI/15sE+CtaL9mkApACJgQFg+WQxinvNi0I1fAlV/8Cx6q2livc0xEAXPaNSWMgkuz3Scchn/XpkKX3jguvA5ehpLIcToHPRn/aIyeOlJqQF3x650+1nYZefBEU3SRrQZUTzL6X5AqYHXYifAHIVHH7e3rN27Ww1oLFGhPDw=
Received: from MN0P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::9)
 by MW4PR12MB7336.namprd12.prod.outlook.com (2603:10b6:303:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Thu, 12 Jun
 2025 16:21:49 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:52a:cafe::55) by MN0P221CA0023.outlook.office365.com
 (2603:10b6:208:52a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 16:21:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 16:21:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 11:21:47 -0500
Received: from xhdsneeli41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Jun 2025 11:21:45 -0500
From: Abin Joseph <abin.joseph@amd.com>
To: <vkoul@kernel.org>, <michal.simek@amd.com>, <yanzhen@vivo.com>,
	<radhey.shyam.pandey@amd.com>, <palmer@rivosinc.com>,
	<u.kleine-koenig@baylibre.com>
CC: <git@amd.com>, <abin.joseph@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dmaengine: zynqmp_dma: Add shutdown operation support
Date: Thu, 12 Jun 2025 21:51:44 +0530
Message-ID: <20250612162144.3294953-1-abin.joseph@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: abin.joseph@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|MW4PR12MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 282499e1-c73d-40c0-c3b7-08dda9cd3bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vw4x7qT6z5AAAG5Y2TavtldLgcDK/uh0j413RRSg+jilyPjNeB10kwl7Flky?=
 =?us-ascii?Q?RgMA8m3O9uPkkK1+G+8hVyjcVn0BmpxT39W2aXMjC+1+Si2J/DXHM9r6n6W/?=
 =?us-ascii?Q?F03p/+sgX2eIT3U+m6hFTk2IS29hxlLgwjWne2zLuXd3xFCwdnAjzCsfmUsa?=
 =?us-ascii?Q?GPyCckXDciaJZhQyRscpHGbgvYw/qP33YK7FOiqwtPAr2sJcrPVxFzFrLYTw?=
 =?us-ascii?Q?5RMWmB5GyFWoTw6oBZFp9YClMBIdLvXNvlYhiSb6K+ooVT7i2wiVBeDOBcDM?=
 =?us-ascii?Q?P8mOv4DbC5dOfDeDB2KyAL4CuTxYqWggyxGMhGLXk/68J/Rfy0jMAeSARoGo?=
 =?us-ascii?Q?VZqTQ0Rav5SWWqFHRUyQNlSBDWFVi6g9HfLCQ5+ZkT1gjsKKt6g7sOMBX/+C?=
 =?us-ascii?Q?/IEsqBI69PqLiHJYzUc83smcCZAgSfUGxDZr6XgGVyWaemuLGkq1fZ5RJC9U?=
 =?us-ascii?Q?f8DuxHgEbU2vU+xbIPJ+NxddKJU97slxvWy1ejnx0jzveTrr/4BgXuxuhg0H?=
 =?us-ascii?Q?2ZyEpyGtmAWamUMydl7XXMPftKToLD9zQwvhNP4nMbpofe+R1ayHDtJwytJQ?=
 =?us-ascii?Q?aiOFNanogQP4KfH8AaPw0RXxt2EE08ubM/eXugPPok6U1L9zKk8s7tRgJ59q?=
 =?us-ascii?Q?LliNwblu36DKsFeeRTOzlC8iFzEkI2sRGcf4DrrJ4LBB0DG++mIF9lJyJgxm?=
 =?us-ascii?Q?z86yghIVBU87UCmbAYI5tF0OaW6EzTGQFPuRrngHVQyQU5R3J8PWgG54uv4s?=
 =?us-ascii?Q?E4yr2hYq+2rEAivOogH+8sGyxcwB/acGwW5OI0iRND/uwbkHErxMdp3b3ofM?=
 =?us-ascii?Q?hn3Eu+1oc3h2NUjCEeF9gBSjf4M8ran4kUMPVfyJhlJ18S5/uJa0+9uaIipi?=
 =?us-ascii?Q?LuME+PQvpnaaLDz1EK1xvS7MNTI9593V3aQmdTEOtMkv0Ia01pSocJI+JRSl?=
 =?us-ascii?Q?9WwOCckpEtOtI0wSnQtxEhTnM8vp/hA6WDtlyOKiu9J1ZsH+qWC2TyHab+8W?=
 =?us-ascii?Q?fdbcVxO8BscAgzwSdYeEIGjNislu07KnpzmgkpIe2xEeHG9afZ6isK5j7ONX?=
 =?us-ascii?Q?F129YH4LRHn6/iZT/4Q3TvO/4A3xQT7rlzgm6dlEIURpQ8t6Ox1niiZmUvIq?=
 =?us-ascii?Q?S4UcbGB+g4zp7ADal3fr+fJyH21P9zcyoWI9M4oM2Dc3cGoVumx6BBIRkfXZ?=
 =?us-ascii?Q?mW6KMY6IGJ1w15fmNahuJ6EyFbs2EVsf3uS/P04qu5giS0zI+UbHl4gucHku?=
 =?us-ascii?Q?z9h8fEr70iNcTxaZYL9E16ozozDGPDYjsVSuoQyG7YAQCy0JItMVvf57UBe8?=
 =?us-ascii?Q?ttFH4C8jSpe+dDApRQ95Euq/2qFe3qz7Il98TZbPcGMNEsl71HoDf5tin6b2?=
 =?us-ascii?Q?Yv7XG2djUGpxgFrsYC7MYRpBFKC6+XiSiZyYmny8mlzIdH8kvKbgnxiBoATJ?=
 =?us-ascii?Q?Ik7Zek51qZU2LP+WLloqnMIfbaB3WfPMHjloem81NrLCdoIIjsmiDqUfqIk6?=
 =?us-ascii?Q?vSZDAFe4BikKomjlej8jShq+gUS8k5JaWrIL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 16:21:49.1598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 282499e1-c73d-40c0-c3b7-08dda9cd3bbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_092156_327363_29DA7EC3 
X-CRM114-Status: GOOD (  12.84  )
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

Implement shutdown hook to ensure dmaengine could be stopped inorder for
kexec to restart the new kernel.

Signed-off-by: Abin Joseph <abin.joseph@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index d05fc5fcc77d..8f9f1ef4f0bf 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -1178,6 +1178,18 @@ static void zynqmp_dma_remove(struct platform_device *pdev)
 		zynqmp_dma_runtime_suspend(zdev->dev);
 }
 
+/**
+ * zynqmp_dma_shutdown - Driver shutdown function
+ * @pdev: Pointer to the platform_device structure
+ */
+static void zynqmp_dma_shutdown(struct platform_device *pdev)
+{
+	struct zynqmp_dma_device *zdev = platform_get_drvdata(pdev);
+
+	zynqmp_dma_chan_remove(zdev->chan);
+	pm_runtime_disable(zdev->dev);
+}
+
 static const struct of_device_id zynqmp_dma_of_match[] = {
 	{ .compatible = "amd,versal2-dma-1.0", .data = &versal2_dma_config },
 	{ .compatible = "xlnx,zynqmp-dma-1.0", },
@@ -1193,6 +1205,7 @@ static struct platform_driver zynqmp_dma_driver = {
 	},
 	.probe = zynqmp_dma_probe,
 	.remove = zynqmp_dma_remove,
+	.shutdown = zynqmp_dma_shutdown,
 };
 
 module_platform_driver(zynqmp_dma_driver);
-- 
2.34.1


