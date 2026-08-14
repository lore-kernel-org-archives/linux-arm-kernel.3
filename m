Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2883EC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 04:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBQk1MA5V172eRwjlwGrAmqOYoUmM+y8gGMOO5nXIgE=; b=Wzxr0Jcod3DWmE3zVhpm0HX8e4
	CfdNQE3DOaWbGvyoO8HjySgjnhexNvfDr05ow9H1gY0/3IzZ0SVTvFYhxtXY6CjkL2Etxsa4vzLBk
	EX9qojyy7U8JYvABykj9+SGDTeIw4PjdINcED28jVN9xj2BS+8UKPRVjodCx9OLDywDCak0Drf5l6
	nbhMdz/W+vnjqEuugELqMJT1kO5XtBwXL64SJhNrjoPCs9X+NIQkiifQ0SrBeNE4Aj5EbmH9SzKRj
	R4o+Z5hPqy6FVoyf4f5vqlsTkroB8MIbRlcCSB0zrIyyX1ppWtw9O/r9/oBXmQ4X4+n+vsnXW2ctJ
	52XUku4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujyZ-00000001x5R-3VBJ;
	Fri, 14 Aug 2026 04:57:03 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujyR-00000001x0Q-19Wf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 04:56:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay9Ir+QTI/Tgk6flhuUqLs1VkQslKRnv/uB1pgmjruy4ir4VZKfMyHwxVkMR8mJ06BEnmo7wwJa/n3KYgiWTLxaq37v+c6K5XcytoHvFd+m6Ht34ebm78u75zKMzE4plbYVwEwGlO+hVJHTuCrpCF9BJvjJFivScCj6I4TGD+dP9NwdclrLwC8EdAIq1RPgFQfyJyhjA/0sQGb3mu0lTZ2LscPcaPAl2HzFoKX8jYgOljiLnRpjuN6U5eDUuonKc9E1gPrZxqMlhD2GcmJbRhgbsD19Wsd9QeLweYds4iKHIaHpcinUPHU3bCjBhPuW3Fj2jEDgXfKIdLekohB1ShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBQk1MA5V172eRwjlwGrAmqOYoUmM+y8gGMOO5nXIgE=;
 b=RGzn8N5nLWIp8sH59m+f0pG0v62Debn+uNRTS6X8xRrTUQB3orZpnXW4YgwaMkQQ+hT2PDOtoaJO8BfuF4o53nDY7VveAUIgYWRLSkULGpE5Kdgt3+n9j/RYIodphE9q8tqUcJLB88+uj51nmL5XUhscruNiTltmuyP/sDM2WJQzlSaBtslVzC+L5Og6JkHrpUsb3czcijzSCe1chJl471FoOLYBTTDoamK0enwUyajisE1qsSwcyWmHa7F0BkTSjvRzWfW+WVTkHbGh70R8CvzTlFmGzER6uAFBOsF6Y4iXFvnaVSukZ6G8Obq+OZDvMASypQhSYarRGiD9XJYuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBQk1MA5V172eRwjlwGrAmqOYoUmM+y8gGMOO5nXIgE=;
 b=yjzIDSNj6cHhkrVRzt0LthcCUvU94YQLP/WgvBo7ZRy5QZN2VYMroy4Adsu43xiHziXp/52fepU60CowzIswDb+R9qdQgLrktIQXcd2CQ52XbAZQP499HgVIy5pk0YD/NUp+ffcrSTX2dX9BvioaH9GDL4T5HYE8pAtQ8ZzpnlY=
Received: from CH3P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::11)
 by CY5PR12MB6106.namprd12.prod.outlook.com (2603:10b6:930:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 04:56:46 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:1e8:cafe::94) by CH3P220CA0029.outlook.office365.com
 (2603:10b6:610:1e8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 04:56:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:45 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:43 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 8/8] dmaengine: zynqmp_dma: Remove unused define and duplicate IRQ bit
Date: Fri, 14 Aug 2026 10:26:16 +0530
Message-ID: <20260814045616.1661199-9-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260814045616.1661199-1-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|CY5PR12MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 495fae45-76b2-4ddf-8d3d-08def9c0718a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: iWwhjuDgWmSFDpHme1uVcLvLoT1X64DxSqUx6RfPfJWW1Xp8DJaik5oRDLCiV7ktKKmOGyoAhdHH2yI+7tve0LzezecOqrcZPUmmuIMoYr4opzodky4DMjckaVjMMt1saKFh/IZRcVN1CVhsY4JDEhFz19d6HnlzflGWCzT7KPYVKDSyWRRavpc2sZHCKbbpweLVwWaPdf0tZi1v+WcBB5TmRrzqfnFYJth9T9MYYVL2WZarvz9tlq6dayHD4TZ7LttKMuTHCWHdXdoX8ueIHYldsExXAQN23BGDK3dgtn07SpDeEoCatgMiQ/tVCU3R2xSo5NmolZoVVHbh8A2F3mpb/jtBc8eMKpJUI+Butm2G9FGPylCPfjPBonZXrei0fsu723BHaquVtx0og58QtA+zGO4qc1KOjo+M6b5QrhTk7XuLhidDcUbqo+ZXF7ZoeH90paawE0rEE7HdmwWtGbr1J39eapijWhYnIqZhLpLlGz6w5/pOTUVhCMrxU7dvVsw2zlJLSZGOmmGtQvvyfxOxG3UUx+5Ex0WoNAKyn68iA7hfyd1UvkRc+9sNN8zuNnFXnf2REY/FfPJ9+SU/RR8cHQ246U9Q5LOnVQaIw5OsUH0Je8IydoFEt4AtwY6t6DkOCPw3cbsj/S9OHft3DbyBOYONz1lWWUqVHgf/qbUcIPK97D58Wq+v+31Qrtj0I++Jym+WLUcVOTxwre/s5g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CG04vl13V81VD6SqNKAE8BndWjzAFwaU1vzGir+0sSA758pVrdlbqKEh5rcUTmxidGMMpiHfNZu24SoZnk3jWHbaJPUm9idk0hP6WWIoV1JAYwBE0SxHYkZbxZn0G1hvrYWzJ3rTbGFOYRyjBbpUgwUPV3l5KX97npfqe29AWY+ah+cIoeMT5mYp/XJYzYDv0rODPeE6fXVyx+Vdqlu9rS4VJiEXr6gnK6eHKXLoOr7oO6oSpE3erjykExYWvp0Xn+dE5wHRwEM8Evra/oA6SAcSi7/7sbp22/jARa1Py500NjX70nTtxAuYbSNCa+Ye3Ucln3mgnZty/IwN0bv98kGa29lFfznZo5YDfKOEGY+Z3D0s6rsA8qNd27IKAgN0zzMESilXC/5CNmfU2L+v5qshvSbMQzm34dkcV82QsA4PxvXSR68UKucicZE8bLdB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:46.6524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 495fae45-76b2-4ddf-8d3d-08def9c0718a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_215655_327732_8D554E25 
X-CRM114-Status: GOOD (  11.16  )
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

Remove the unused ZYNQMP_DMA_SRC_ISSUE_RST_VAL define.
ZYNQMP_DMA_DST_DSCR_DONE was also set twice in the default interrupt enable
mask; remove the duplicate bit.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changesin V2:
- No Change
---
 drivers/dma/xilinx/zynqmp_dma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 921d3d9f6ed6..b2a9b60f3052 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -113,8 +113,7 @@
 #define ZYNQMP_DMA_INT_DONE	(ZYNQMP_DMA_DONE | ZYNQMP_DMA_DST_DSCR_DONE)
 #define ZYNQMP_DMA_INT_EN_DEFAULT_MASK	(ZYNQMP_DMA_INT_DONE | \
 					ZYNQMP_DMA_INT_ERR | \
-					ZYNQMP_DMA_INT_OVRFL | \
-					ZYNQMP_DMA_DST_DSCR_DONE)
+					ZYNQMP_DMA_INT_OVRFL)
 
 /* Max number of descriptors per channel */
 #define ZYNQMP_DMA_NUM_DESCS	32
@@ -129,8 +128,6 @@
 /* Reset values for data attributes */
 #define ZYNQMP_DMA_AXCACHE_VAL		0xF
 
-#define ZYNQMP_DMA_SRC_ISSUE_RST_VAL	0x1F
-
 #define ZYNQMP_DMA_IDS_DEFAULT_MASK	0xFFF
 
 /* Bus width in bits */
-- 
2.44.4


