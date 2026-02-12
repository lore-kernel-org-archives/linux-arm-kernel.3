Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331D6EE3685
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AvqPPEvzc5PIqZz5MMZ/QX0gCTz5ckEu1j2cJ4TKJU=; b=s9D/AF7XkCm9XFDYkUfKfyOe8m
	8APK5TUnD8qWyHzrsPRDjEEM0K8RoEwkuPXAE5VFXQvpM7/XYH8L5O7WL12zt6Kxv07QLZ4R9tbCC
	iMaHpOw2JarY17fQzFVXS1+ygau+hpKUjW8gccFSI/yBdeMMWyRjzU6FK98NP+EKiBckYJ0jLx28m
	4+vjiysXtf2y8dEUUHdDmaNdsmUOu/cPRVJ7pwFcoRD119+akEXmtJwbtMQVIZ2v1hM8Y5qIoiV+8
	aXFlbxDEy8/hSBoSh7pgXxoHgOknBqNEaWWr2le5BZGWG5p3JvkQKknvzsFuS9llJjtEwBbWCtxsZ
	he6X41tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqX74-000000029m7-0SmG;
	Thu, 12 Feb 2026 13:52:10 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqX71-000000029kX-2nts
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 13:52:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYpq8StXWkkxiB4BBbPgVfeUwNoPi5k/nXkI922GP5zXir1Oh5AiFCAxmmEfsvX+PVry/G+kLVMuqrOkgLtif0K3m1h1AdOJa6geJuYzTQ7czEedQaoaJD4mKrwTyGGj2U+v/fBtxScjYAECzjwpU+4GMy1YAqKcPfaRYpuP8I/G6dyHgYR5H6LXfi7AT4gzRLfK0qdHDn0p75f9mTOBKPidz3QfNwwNBhMAXh3kvNdF6kjkRVPrwPr4IXwL+9irBtgWNV2AWAJVKzD37TREsKVEHi+ibTs/XDplxv0QA690dmkl0S8pOJOoklAk/qbf/Dy4H3Q8qWc28sOXoF4iSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AvqPPEvzc5PIqZz5MMZ/QX0gCTz5ckEu1j2cJ4TKJU=;
 b=b+gH+Fxx/a8jGlZGvQ2WpBQISfO6orrbNrBxI9TekwF9KUijMLPDYQHbRAyrX00lt2I20d6onKgWB/8hpkYup73XKYeGXhDf3YiPhHmwbZOZHz2Zln9LUT+cuUjlYsBU9yeXiOkYrc1Uq3lcsKQbP4Ch+EtjstI8xlGm8PcvlKuAvZ4hoqGzHty54+UVFToNjslUD7nM1Cm9GmFZHL7VHjFJCnuhFS4C1vs6kfT8VC8pBP8NiloTUZjqhFbTRLBeUbvGejVNQTuES2KeRWHLg/1GtOhjHxRVlh7hUB6s87sxyniN+62ZGaBGYeLSxgg5fkQ8+XRWTvw7BWhqNC8x9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AvqPPEvzc5PIqZz5MMZ/QX0gCTz5ckEu1j2cJ4TKJU=;
 b=xfQ+37Ph3INORTT4LNnFG9JYhgQu41Iq4zOZ/5L2zDC98SVpGrU31MAjk+6HNh7zHjBHqIaeYQuuhN+bmKK82i1EY+hMoZ+hwZ4Y+Pe+ru14+BpN//09Ci2jUeS0rtcFoY1oKsPys44p/JPUhAlXxqGT191eBu+RnhxOxm3IUa8=
Received: from DS7PR05CA0039.namprd05.prod.outlook.com (2603:10b6:8:2f::16) by
 PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 13:51:57 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:8:2f:cafe::43) by DS7PR05CA0039.outlook.office365.com
 (2603:10b6:8:2f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Thu,
 12 Feb 2026 13:51:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Thu, 12 Feb 2026 13:51:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 07:51:56 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 05:51:55 -0800
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 12 Feb 2026 07:51:51 -0600
From: Srinivas Neeli <srinivas.neeli@amd.com>
To: <vkoul@kernel.org>
CC: <michal.simek@amd.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <suraj.gupta2@amd.com>, <abin.joseph@amd.com>,
	<radhey.shyam.pandey@amd.com>, <dev@folker-schwesinger.de>,
	<thomas.gessler@brueckmann-gmbh.de>, <tomi.valkeinen@ideasonboard.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, <srinivas.neeli@amd.com>
Subject: [PATCH 1/7] dmaengine: xilinx_dma: Fix MCDMA descriptor fields for MM2S vs S2MM
Date: Thu, 12 Feb 2026 19:21:40 +0530
Message-ID: <20260212135146.1185416-2-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260212135146.1185416-1-srinivas.neeli@amd.com>
References: <20260212135146.1185416-1-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe3b3d4-c7a3-46a3-7c22-08de6a3de32f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F7DSA+prYOFnGu+3AOJiwSPJADwGTzV/qDrzrb6sbNJodZh9IyQYHzXFcbfh?=
 =?us-ascii?Q?bfeBT3jFj17Q24WGshv/PL0Lagx0K4wNjWQ3G1mQWYuvYeQ5xxSIKoshvSB5?=
 =?us-ascii?Q?J8pmzfk+ldFePB1lBLqKYOTixo2s6SUEdA5iP7gjdyfWHtoijuiZPK1UpdHi?=
 =?us-ascii?Q?JOc7/P1lpdXHWMXzPW1ZOQD9823CefTstJQQ5T46lryb4M52/4KdPf8x8Dks?=
 =?us-ascii?Q?/OaHfcjCeIuw4T4fwug+HFlI9FIM/fp6hmjybgfs1ADgRJHYRMahM6Qad0vs?=
 =?us-ascii?Q?3llO8XXCpoP1WZYl9U+oOqSzcyaLgGmkj6rNWlwtJtEIXkVf86iGn3dJdvXs?=
 =?us-ascii?Q?YqrZOuSXt2QmUsHRBZHBItbPixOq5dJzulq/0f9bW8+J85P1ftWcP+DW40OS?=
 =?us-ascii?Q?avIWMbRnGr2cETVu7h8MOX4TY/sl1RDlzAgDDWYkuTyKlOeHWc8LyNg7wc+p?=
 =?us-ascii?Q?xSWlpt04kI/f1wxv3DFBkVgZh7EX8d0VyKvSmF/telv4v7f4wuhOIiHE/Jda?=
 =?us-ascii?Q?vvBmNPKhvz68pPz9XYgDGoSw6S+nwhxoa5dtwIhMA1Nj3m5eedA956wEtDJL?=
 =?us-ascii?Q?0C+yzPmJEWf10NvHCc3kpb5qkSNALGQIn1Rvg9hqN5NwwV2o6lHUAr0vGRF3?=
 =?us-ascii?Q?hr4hyvnowzRnVE0vOwRBu44uz1PFLevmjkOYo1rt216yh75cEhwrfrgYGxtC?=
 =?us-ascii?Q?MkysMJngfbWf4lvwS5dauPUjdoQl7Lo3Q0fpBb3FVFV0Kbx4xQVtAFlhF4lw?=
 =?us-ascii?Q?1Bj/o5n+FAMHj5uvY2Zqn9Dwp/AOTGLjyYD8pZEYtDJnId5ok/xLcMmEE749?=
 =?us-ascii?Q?TTTeMQpBOKyuUBC+02/r8GZiVPkUWRa8dhEDVAjWAoDuYhFJKDDMQ+skAUTC?=
 =?us-ascii?Q?pi8LJEWYeDHQsxecz+CzZs8z7M28g3/X9I8bV2/V6KWZ+QxT5E0Z81zcPNEy?=
 =?us-ascii?Q?gVHXxe7r8l0O3SHUH3Zo4AT8MJTGkWiDa3DZpDtFKcqTPicbyfCAzXmerHV0?=
 =?us-ascii?Q?F0W/E8tAyMl08b40SdtWO/wDyQjQAKgh6iGsqITGETQjaC8gu/9IwiVRHa+c?=
 =?us-ascii?Q?KcQ+Bi39IgtaUt9CTWjC2avnlMd86epv34wlEby7zyY7zye9/oOQJk2kneHB?=
 =?us-ascii?Q?mYeGEHpntSGxW3GpHrA1s89wx/D9KxXduxu5qs1O2EaHmHFQMUtUwD5AItda?=
 =?us-ascii?Q?ePEPUemBtjvwo5aNMExndZ7D9UlA0MWsZz1biba9SbH3GV0bJXbt5McGvURz?=
 =?us-ascii?Q?hqJHjjn5+ftMyClAr574ni8GcVjWJWQYhFsRVYuwjCY/dP4YHjdWVv7iXRXh?=
 =?us-ascii?Q?YnsKHQrFzEhUC6ftfMLEji0AzTFqB26RBaVX4z17IsTKHrgWDsZdobYMHGwi?=
 =?us-ascii?Q?YKQGBJsNryqOrVDacbc31d/g+xbrdpsQTuishsEwUIFMHT3hr6hauAkpvAX6?=
 =?us-ascii?Q?OafuegFBcaOssqf0tKBbwi3kEY4K9Zuq1v/+iyXxQjeFwacqqcrtn7ydCgbK?=
 =?us-ascii?Q?Oy9T9wAP297a4qmosOz89fzB/SrjDaQNn1NJr2qacBhGHOe+BSwgUpkIpF+e?=
 =?us-ascii?Q?/+UhRDd8uI/WTkWfXcIrRtMB7thqs3eH6GkD/GTlsbxJXQ4plb1wDAWNq1Si?=
 =?us-ascii?Q?Cf6/P+NAnSQG/0wZRrlaFPdsKF/kTCEEmKwO2Z04q2zNq6+f35ECP66soE7A?=
 =?us-ascii?Q?SnyZlA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Cm6mA3b5z+EBLWzN3M3n/WoxSN6y4RLvd463nvLe5I5S/8AVeGEe7ZKJFl44V/qPb8+r8I1sLAdm0n6vlfZPCjJfsasJga+lm1ylCt/Or1gnGMncfv6YHjQeraCCJKDaXBVka/kEqeO8MMfzrKFHXABH0dXANfYyn4RD6mQ7f8BIPYm/CSwUhAWE87i78BjkItwvGAddJWH9ZjSq243jadhnd1pHtkYuHEA5EHeRTCarwAo9gNQceTFC/v8/uekT6R7wDS8I++LyU7ei7IYiVqVjsob9rsdglrD6Q3ON5XfqKp0V9qGDkugZ9HD8a32z04yqjSpyw/nj0IAvP42ByfTF9HYTzGeraZAB/qcguOmM3+qHTPPy3CN/CT0Nk0hEpFhSGxGoazBx2TaQn2fr0Ngtj5p7ZaH+pwaBkbCaPEX8TuRW9VjaxjSwJIcpI7JV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 13:51:56.9747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe3b3d4-c7a3-46a3-7c22-08de6a3de32f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_055207_712029_8AC11413 
X-CRM114-Status: GOOD (  12.09  )
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

The MCDMA BD format differs between MM2S and S2MM directions, but the
driver was using generic 'status' and 'sideband_status' fields for both.
This could lead to incorrect residue calculations when the hardware
updates direction-specific fields.

Refactor the descriptor structure to use unions with direction-specific
field names (mm2s_status/s2mm_status, etc.). This ensures the driver
accesses the correct hardware fields based on channel direction and
matches the hardware documentation.

Fixes: 6ccd692bfb7f ("dmaengine: xilinx_dma: Add Xilinx AXI MCDMA Engine driver support")
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 53229d8ebc52..e09a22721c01 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -275,8 +275,10 @@ struct xilinx_axidma_desc_hw {
  * @buf_addr_msb: MSB of Buffer address @0x0C
  * @rsvd: Reserved field @0x10
  * @control: Control Information field @0x14
- * @status: Status field @0x18
- * @sideband_status: Status of sideband signals @0x1C
+ * @mm2s_ctrl_sideband: Sideband control info for mm2s @0x18
+ * @s2mm_status: Status field for s2mm @0x18
+ * @mm2s_status: Status field for mm2s @0x1C
+ * @s2mm_sideband_status: Sideband status for s2mm @0x1C
  * @app: APP Fields @0x20 - 0x30
  */
 struct xilinx_aximcdma_desc_hw {
@@ -286,8 +288,14 @@ struct xilinx_aximcdma_desc_hw {
 	u32 buf_addr_msb;
 	u32 rsvd;
 	u32 control;
-	u32 status;
-	u32 sideband_status;
+	union {
+		u32 mm2s_ctrl_sideband;
+		u32 s2mm_status;
+	};
+	union {
+		u32 mm2s_status;
+		u32 s2mm_sideband_status;
+	};
 	u32 app[XILINX_DMA_NUM_APP_WORDS];
 } __aligned(64);
 
@@ -1013,9 +1021,16 @@ static u32 xilinx_dma_get_residue(struct xilinx_dma_chan *chan,
 					   struct xilinx_aximcdma_tx_segment,
 					   node);
 			aximcdma_hw = &aximcdma_seg->hw;
-			residue +=
-				(aximcdma_hw->control - aximcdma_hw->status) &
-				chan->xdev->max_buffer_len;
+			if (chan->direction == DMA_DEV_TO_MEM)
+				residue +=
+					(aximcdma_hw->control -
+					 aximcdma_hw->s2mm_status) &
+					chan->xdev->max_buffer_len;
+			else
+				residue +=
+					(aximcdma_hw->control -
+					 aximcdma_hw->mm2s_status) &
+					chan->xdev->max_buffer_len;
 		}
 	}
 
-- 
2.25.1


