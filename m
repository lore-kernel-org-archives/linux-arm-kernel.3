Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A5FC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 04:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=us//KYrtTaCNhoRgyl9hUTq7eDbaoS/cbFSWzNjP4oU=; b=yvHaLGHgUztKegYVszkCVeF1Hz
	dYmmgWFFqkJrXSGbO9TWx7nN5NPgID6vtdmupepmtz8EXJDr5bBUNFeXaE4HJ/tlqLPzXrWc/+ms0
	hmq0nAPW2CvK8Aa0Ae9dW3AuZ6S2Pm3XEVVXHyGqGq89gcdSyBn5FNUEYGcb+6MarqxFxOOv3redb
	F2VG9Yip4aBi3gMAIKbnzxAgT5rRkCiNXCAgedefzddc3UikQ4nONNlXPBLBat4+/VIi5s5HsMthf
	eRLYWyNyDUARWKGmnjlXBI93+7tTej7qzXAAsVoZzEGnR38tHIxszXGYWm3/ezpqr0smr+13NToqo
	H7Vv/GkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujyL-00000001wwu-2tq4;
	Fri, 14 Aug 2026 04:56:49 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujyG-00000001wuY-0kF3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 04:56:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1+3FlU/83jB69+dpO49NhwNva9oqrjmoAd4TzBefe3s9HkdmpWmPacZH0mRdsh0Kf09aQhJ5YSK7lMfOjnSszFLQqgh9z2cdJK2UvqaRsY09cKi+Nns8IuGt/EHm1MYo6WZC+XT4s/DRNPvjaanOguzn9OmEbkwFub7pfWYTTIm/WgEPLzU8dH4KwdXDTNgZyJGLXIwCqCNSCGDMzYNype/QEl4yNyO2004LkFEPaO30+HyR0n0Cy5PbTXqjmSTtOwsLMz+e0C4aCNBwlkOx4NGwCi7qz95/mFaZkva0PWzKF7On4dvygi0MlJuwA5ajZk5NZO6uzjn7ZWCOerkLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=us//KYrtTaCNhoRgyl9hUTq7eDbaoS/cbFSWzNjP4oU=;
 b=xjY1V+PQms8NxzXcwDANuNNx3HTPMPCAIX8Q5xxllkr1F32rOpLUWCDozWM8UtzcOavfYd8lKTeT9H/zSN4fs4TMvowfvsnYHzqzL0/RmQJ5dZPj0kcAW3Y3aENyclU7B82zbCBmFLygs+un00b2DXfqKwFz6ok2SvB8MmKATKRuXxn8cQpzhDHvo+LJtHSorZtBnJJ14i7DZQ1AoCh4FtXGYsSwU1Ye9oQgouAQXYBzT3V7d7ePoVqzd1nmsILcISVIMr7aoZ1ECzMrxFiuhHh1/+OFrS9LfANn2pYNrrtWPCPGraepOiU4HMmQXtc2ivCC6a+U/fPVgawIR+q2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=us//KYrtTaCNhoRgyl9hUTq7eDbaoS/cbFSWzNjP4oU=;
 b=NtZEitYilv5A6b2k+tmdl5NxPsaUiwZ2vcg84okRw6K7Yn95Mp18TufkT0qnQ1v9awq/HDVzv0jBLQABkIrg5Zi4VKcWE/akHnSYhGuMddr29uO3BMsEHW75GZlRt97BG+RyF6sqhmpZPEh4DFEYFtibNTH9O8r37uTRU3ZvD6A=
Received: from BN9PR03CA0302.namprd03.prod.outlook.com (2603:10b6:408:112::7)
 by PH7PR12MB7355.namprd12.prod.outlook.com (2603:10b6:510:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 04:56:31 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:112:cafe::ab) by BN9PR03CA0302.outlook.office365.com
 (2603:10b6:408:112::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:56:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 04:56:31 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:29 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:27 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 2/8] dmaengine: zynqmp_dma: Free sw_desc_pool on desc_pool_v alloc failure
Date: Fri, 14 Aug 2026 10:26:10 +0530
Message-ID: <20260814045616.1661199-3-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260814045616.1661199-1-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|PH7PR12MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: d65c2fed-8bb5-4c4c-dfa0-08def9c0685a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: lBDn8vN3TwsFwlsrPiFY1JxEjZ4CP2dg8odv3WeR3sjSISVUsE0yJQXjKz8KQL/xjGA/1hS1IQxhq3KEz0nKBXu8qlLgGmsuSJ2hG/yiCyelUXB0d1M+DgSbIpI9Swc0/ViTXvUx3aMO456A18Fz8cIPaYXMn9q6ltfVe2oG5UDJKoCHai9BM+PXTkKGLucVz19Dnd8fa8IyseswzNSZtMGGm4v2G4esOo69JZVxs89S5DjiRpH83Gi4KiP3t1dT3ySWEs/MgUVY0xNspq5Z9MhB3A7vaOeXPA4YoVWyXDmAiZRoxdOr/pypcyU1fn5M7VYGptGmUnTQMDO94xrrly2l+9OgORiejWBY9UWf32HVcfGZP5iYwTw56wVxN4YRqHSPIc5kgful2Gcf4Iaadi3TZOUnNYz8KPH+FI1Y734LYzMFLUEyyjkjcnQ/t4YzY2/0cQlvbF0cvK/OyjSdyakwu6z+7RS1w57ZJYhE4ThZ4z0BD1VqnntrjiDGWs6lckpVVCIB78OA+nSt0IRWOsBHgrTkkZQ9MNxTIhgAS3+yXcWG1MtMV9BgiQxdBql2xb1siyoxx9adNJRPWk+NTKOO4ysUkTKnWS75VhUnQNjzYmpFJXV4eNkZ2h64kIABao6LNcAw9gdho+FuDQtoea4wO/e/GVjispbEnWat7yOgak12Z9To84le3x4auG2I3Vkfolsh6mmHd1hldqOcSg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /EYY5xvG0yVWw1K75TL4DzVWy3VsVK5RwdI3w/OPGzDC5VopTIq9vMs/un9va6YVvcDkOMsrJM1y0rAPHQJpiPXXYN09HwAzIZtudhG7M/fJO3NxnRNWHXQqRj9x5hPF7jAcws/KzD4rj/+ugpAn7rjbOjxg7pf8QwbZ+fBtGsr17ILKz2I4Gpfheq9cayWa0x2F0NVSJUX+8fGX8DZD9zgnltO4rXArtqiqNVgFKUFKu94/GZXd19DRovUe+oC194CvIP4zsvhiEkxu8pua7uKSYbCquCjnKfeyPEVj6j4bD32Nlb6edYfsgaCCno6YclYESOpCFNvAE1laZSs5s/Wl1M4+oQ7dPWf+fXLXUwUnrJs5Z+S8+qQJn2JCarxz5aYu5ppmSRcC+tAPnD2zjGz/j58C6JunxRuw6LOCLrU3arxvjinVpOxdBsw5PcKc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:31.2583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d65c2fed-8bb5-4c4c-dfa0-08def9c0685a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_215645_496875_D9D3169B 
X-CRM114-Status: GOOD (  14.56  )
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

In zynqmp_dma_alloc_chan_resources(), sw_desc_pool is allocated before
desc_pool_v. If dma_alloc_coherent() for desc_pool_v fails, the function
currently exits through the runtime PM rollback path but leaves the
already allocated sw_desc_pool behind.

Add a dedicated err_free_sw_desc_pool label for the desc_pool_v failure
path, free sw_desc_pool there, then fall through to err_pm for
pm_runtime_put_autosuspend().

This keeps the error unwind symmetric and avoids leaking the software
descriptor pool on coherent descriptor allocation failure.

Fixes: b0cc417c1637 ("dmaengine: Add Xilinx zynqmp dma engine driver support")
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
changes in v2:
- Split this cleanup from the previous combined alloc_chan_resources patch
- Added err_free_sw_desc_pool label for desc_pool_v allocation failure,
  freeing sw_desc_pool before falling through to err_pm
- Updated commit description to match the exact cleanup path
---
 drivers/dma/xilinx/zynqmp_dma.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 9f1e69700dd0..b7c561280694 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -504,8 +504,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
 					       (2 * ZYNQMP_DMA_DESC_SIZE(chan) *
 					       ZYNQMP_DMA_NUM_DESCS),
 					       &chan->desc_pool_p, GFP_KERNEL);
-	if (!chan->desc_pool_v)
-		return -ENOMEM;
+	if (!chan->desc_pool_v) {
+		ret = -ENOMEM;
+		goto err_free_sw_desc_pool;
+	}
 
 	for (i = 0; i < ZYNQMP_DMA_NUM_DESCS; i++) {
 		desc = chan->sw_desc_pool + i;
@@ -519,6 +521,9 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
 
 	return ZYNQMP_DMA_NUM_DESCS;
 
+err_free_sw_desc_pool:
+	kfree(chan->sw_desc_pool);
+	chan->sw_desc_pool = NULL;
 err_pm:
 	pm_runtime_put_autosuspend(chan->dev);
 	return ret;
-- 
2.44.4


