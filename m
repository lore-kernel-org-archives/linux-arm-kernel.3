Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4118CC5DF6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 04:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvm1Wke/S0GmURkJ31/52raMZhorVEqB9/iGa0DqSA4=; b=u/vUsUTMq+y6THmGAHh3T4JyrI
	EkTTG7mP+TuhiBLyfn1kFl6EtEENus2kyZ3NLpZ7HDhW+SIYSsJszenXtFocFhglbccf24NmsCdXl
	URL/l2mPNS1WSYm7oboooDLN9tYW6pgu9rk4YEhluFCq951z+6iXa+eQATer/QhXJ4I/XzAILt0FW
	gBTmLLqDqS6y4BtzYLCKd2Q1+gCWxdb1D8JpFqnkNjGau28p65cp+g+RcWGVNSgTUZrsbSZieJB8K
	Ln0IdBmrOVL8qspQoHuo5Y8u9QZr4oDEycioLr18cdU/IW6/fcrhx5v83PKX77fW2UypXLXQuo/nY
	gGOpNyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujyL-00000001wx8-3Mg6;
	Fri, 14 Aug 2026 04:56:49 +0000
Received: from mail-centralusazon11010066.outbound.protection.outlook.com ([52.101.61.66] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujyE-00000001wuF-2P0q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 04:56:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwfZM3xCKy6DgCxDOgNf63yeuU9ihjc4RZrdTNu6E/fANvDos9YxWV9Hvd1TVauu40WvD3ur223aLVGbb8khSaGLaqH94wZqeotVJ8OTdGZ+F9wtEXpY+7ZNyUCLwGvehOVZKnvaqM7JgR+z8ZiiHxig+q74Fg0tB1o0Cbcl8ioz5v2b7jfZJttueMzaf4CvI+sYBff8G9RejznYOSIXwzwxicFXD44Xv/z7fDy13/P7CKFouAM+0ihvy9qRtL+0b2ZaZrLEu++zIdB7kl96wDte8VsYNS5x11DkuJxcAKCPnCV2XE1KVKJcpkP+EKixyyAx3T6tJSEejlgSavW/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvm1Wke/S0GmURkJ31/52raMZhorVEqB9/iGa0DqSA4=;
 b=W3BnHcTvj7SHWUrtGdr0Iz9zN0gbYNGE9Nqj8lALkB93E5wmZZLFFTGxTVgR6StQwnBmtHiPiLKgvJbCgYdvr/+tEes8XOSS8wXe+VWoFcKYKQnNQpco5X5xYuJpMrGy/MPjMh42R+5pyQ29ipybEIAAIDCrTC3oGcNYfvklJi/WpTrCNs6HXFwODCX+NqEtpW01XOyPXPfm3btjrTN5ytoeCM0zL8tBMf9kPUYmanYS7K2Jwyq6OLqhbhAkDwEGGZ4AFVE2ALWxwzcsgNSOJYsTBz84gE/sxxRLYVCo1YHA/5vv07vk+80o0k0im6ZtgUUNOA473OQNJRLKRylIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvm1Wke/S0GmURkJ31/52raMZhorVEqB9/iGa0DqSA4=;
 b=m6mHrvjPVc6LzbCR8oIej/1ElFVE4/aBIoUKvBIwFSQ67neiC0TJsjPMWpyVDrZykmDz2Nw7mCVhWYgoFNFmTJssx0TxB5gIh/aoVHeHrLpeJZbfm+hvpRad4YqXzGVig7gns2dL+JEDi0j2ogqs3wLwrhvcD44pPQ/dpDJwNsQ=
Received: from CH3P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::32)
 by LV3PR12MB9165.namprd12.prod.outlook.com (2603:10b6:408:19f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 04:56:36 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:1e8:cafe::67) by CH3P220CA0012.outlook.office365.com
 (2603:10b6:610:1e8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 04:56:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 04:56:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:36 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:35 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:32 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 4/8] dmaengine: zynqmp_dma: Fix stale kerneldoc comments
Date: Fri, 14 Aug 2026 10:26:12 +0530
Message-ID: <20260814045616.1661199-5-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260814045616.1661199-1-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|LV3PR12MB9165:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0213ab-490c-4f21-adf0-08def9c06b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|22082099003|18002099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: S6A8/RjudkN+Wjzp43XglBpDQVTfeooCtoq0FzJfUtnQCkz4Xfb4UgxEajsPnnl2yoM5tnvT8zGa0DVDQ5/ITXefXfOA8Jj2p2NB6l9B/tEtn2VRKgrVLBquApMYjAIH3ewgm/a4vgjM/NkKgx1KmykYwarZaqa3z2gog2ZZLpya72ctIegH3hUfvgYUBk+fQvUPws5wsSmjht8KtBlwNWDK4asPTp7jkJ2VWcoeBX/u4+crE5HrZiuC2G9c4qtbsxMtcq6oRhuIFGXolSETMQTJ1z0xs2lpe0SQvmtM93Jqn9KZLFOa+uxWMkLXEHHdvzuM93SADxiyKd0dPA74g/WhUXAwDOuqnY8oQ0CPf2HZoaiAAIj10JYPxxdgNjLQ78ruen3VG5sFk+4DOfwmMV9Bhhq8tjunuLxk8Z0H83HZvAW8ANhOmd/+pt9ZQAf2cPD3PWc8TcX+DmEnHDC/PhVps/ANRimFPRy9C3FpqPMuCGRg4CVRtoVt6wWIxfiraE/CWfzt8vyfH63xht7Aqq6CaAo7OmCtuFK4vgxxDsH1OKY7/K2xr2otpDCddhdWwvm8OKwlOCpVdP4Lh+n6bEDcq2RnuepvtN+SJuPzZar00Kq4elQz0x84r3YKRmfhf34tWUZ47tgHGLhzxIGT5hFq9GUM50XxcnO8IY5yuaxuIav7pHpZwiYZcwJJBpEkpImys6s2BD18GRjfnlrOCw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rql0xvFaOn4R3rIlpkzqkmE4g2+re6X9VtAd/49E8rzbIDHRP9pjp3uIprjOVs84FxGwrpmsT4XHmm16d04SSd8Emi8IYi5lUyGKg08DMNSzCPHdUPvrkePQAtZUzkVF1ieHL6/yAUrkonLFg0bd4bz58QV1b/bO3hCCWnYMUX05ewpSGEX2ysg6ancswtLsvzHc0m8kIDHEDTx3PsRWLD2X47Do7Z78mrPzzd9eQQIT8xZ3vQq7KUkCNdMfTdMHICqwoKJ25ftECLKAbntJpcSkm20RLk9Rkw57azUGUx8Kw6Hpywe21KrY7qhpGSei2zh415M+nXrjQVNFx56qkv0ZLiUPlA2c1ZAbr/8SNR+ws7T26TOqQWfB1274f9KKjInZTz34WF4sNx39jSFbK7HIM0udEs1VqNLNPLR3OHHZq+QcIVtH4oIcIeurODJy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:36.4475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0213ab-490c-4f21-adf0-08def9c06b74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_215645_524773_DE5A9645 
X-CRM114-Status: GOOD (  13.40  )
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

Correct kerneldoc comments that no longer matched the code.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in V2:
- No Change
---
 drivers/dma/xilinx/zynqmp_dma.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 22b517c57003..a2fbefbb43b6 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -208,7 +208,7 @@ struct zynqmp_dma_desc_sw {
  * @irq: Linux IRQ number, or -1 when not registered
  * @is_dmacoherent: Tells whether dma operations are coherent or not
  * @tasklet: Cleanup work after irq
- * @idle : Channel status;
+ * @idle: Channel status
  * @desc_size: Size of the low level descriptor
  * @err: Channel has errors
  * @bus_width: Bus width
@@ -435,7 +435,7 @@ zynqmp_dma_get_descriptor(struct zynqmp_dma_chan *chan)
 }
 
 /**
- * zynqmp_dma_free_descriptor - Issue pending transactions
+ * zynqmp_dma_free_descriptor - Return a descriptor to the free pool
  * @chan: ZynqMP DMA channel pointer
  * @sdesc: Transaction descriptor pointer
  */
@@ -617,7 +617,6 @@ static void zynqmp_dma_start_transfer(struct zynqmp_dma_chan *chan)
 	zynqmp_dma_start(chan);
 }
 
-
 /**
  * zynqmp_dma_chan_desc_cleanup - Cleanup the completed descriptors
  * @chan: ZynqMP DMA channel
@@ -908,7 +907,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
  * @zdev: Driver specific device structure
  * @pdev: Pointer to the platform_device structure
  *
- * Return: '0' on success and failure value on error
+ * Return: 0 on success and negative error code on failure
  */
 static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 			   struct platform_device *pdev)
@@ -1042,11 +1041,11 @@ static int __maybe_unused zynqmp_dma_runtime_suspend(struct device *dev)
 }
 
 /**
- * zynqmp_dma_runtime_resume - Runtime suspend method for the driver
+ * zynqmp_dma_runtime_resume - Runtime resume method for the driver
  * @dev:	Address of the device structure
  *
- * Put the driver into low power mode.
- * Return: 0 always
+ * Enable device clocks.
+ * Return: 0 on success and failure value on error
  */
 static int __maybe_unused zynqmp_dma_runtime_resume(struct device *dev)
 {
-- 
2.44.4


