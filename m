Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D926BCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8zfLp14XNg7OEjiwbePuM7fQkjyheXMnhVTdmXLEdM=; b=Mk7wujUtmH4RWRXKu88lR9nXGC
	ecJR3v0L2VwWTE34WKC2k9cyDk1YLBV8hj3P27yGFFfew0Gu8o6ZXGMEHmhfQ1Dg2oRMqpmpv2Aa5
	WYnE60K5ORUib1SbbuRMWRPAuTypVVOapwBw191qZYnGqX/z1H+wJkFvRVmK4wIlHDHgAe8eEXEHf
	YdCmnPexk+jG5uSMmJqTWEih0TPZBT2Y/zEDjh1uxdZF1kjxiFXqHj1uTRcjTOhXFKMh2A7fz2gLF
	xI7iHRMQdYvjZxkaX77TrgsaxDqNaujt8mprxr7RmP9SlEsX+ByYbUVu+cwBnci/JjFY39gGwCQ9a
	GhZktr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUTO-00000005D9E-2ODH;
	Thu, 28 May 2026 06:44:06 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUTI-00000005D75-0BXt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:44:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4tnwVyQdp4ITiMGJMzpIBsUjmLkCpI+8j4kzEhPZ0MG/vQI8duGYXl+JAU3T2sFkcKlfnVnGT0DvcrURmN0XTPNekcNXI9c77XDaFUZzECYMs6DFggwgSoeBw5qnoCTiJfQYxFM/ToIyjhZvAciA/FmyXscGvT1rbiRZ7CLXerwLieAP99Xf8H9GqmXU7I/J0oeTN5wGQ1OC5RdTsg+JdgfP6vMuCYYKi7BjeM180EzTjtwANk3QWLgeAnxPtBKgiaSB3xWcMp4T3rhHO8gZMsCnGP+TA6+e1Sw4SlkGYkPehIvlG99D2ic6JRRoM8e1q/isDRGhL4X9wG+8GHpQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8zfLp14XNg7OEjiwbePuM7fQkjyheXMnhVTdmXLEdM=;
 b=FALqbZ8rE9rAPzVej6Py93TLf5yrLXDPzHzuxykrQeE+oVWhZJjKRgDf0CUI7QNVAH7cVcZftkkV7/IWZ2QXdkW/ae5yug9oTn1TdFiXJLiBXciiMM5mEgAiVxE0+gJwhbs/9dQpTtysJAfjfRb2PPRcE0ThaAS4DbMejJ6qHfMoX3wm1jUbU76mH8P61WqmtBcU2ZmRB4aZVLwrJpC+moEwreEd9dicm/vS9J0YE2Hax0XG3oKctDt37WgEjTRP/rHapKE6I1QOlqQ/IZcBl6Ei/anu7iV5TEng0o+yN3XiV/cFFAcxxBD+3z8q5X6y8+e5HPvQIXzcPzknqfQQYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8zfLp14XNg7OEjiwbePuM7fQkjyheXMnhVTdmXLEdM=;
 b=my/wyXaimnUEMa9AOyyNghjHsesEaY0UcJICMUYn9XbDrcQLzSvyPdm8FtXhdzPLoX1IiZPpHRjrIFUQMSPQuFPDDeduEKL2XEN8BWTfYkpHcHlPJRjd4/ZH9BOPIraRw6+MdSMnaJuuClbdJIhcnX7G3ORrefapCE5FTVJqnEs=
Received: from CY5PR15CA0145.namprd15.prod.outlook.com (2603:10b6:930:67::13)
 by DM4PR12MB6447.namprd12.prod.outlook.com (2603:10b6:8:bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 06:43:54 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:930:67:cafe::12) by CY5PR15CA0145.outlook.office365.com
 (2603:10b6:930:67::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 06:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 06:43:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 01:43:53 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 01:43:52 -0500
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 28 May 2026 01:43:51 -0500
From: Harsh Jain <h.jain@amd.com>
To: <srini@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<michal.simek@amd.com>, <sarat.chand.savitala@amd.com>,
	<harish.ediga@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH 2/3] nvmem: zynqmp_nvmem: Use streaming DMA with single kmalloc block
Date: Thu, 28 May 2026 12:13:22 +0530
Message-ID: <20260528064323.596195-3-h.jain@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528064323.596195-1-h.jain@amd.com>
References: <20260528064323.596195-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|DM4PR12MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: 608a3839-749b-4a49-94a9-08debc847c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 1bI+vU98WQgG3RSq4BeGeJkOfSrWYLsyqygHDvU7llOS2GDklPUzofHswfUnxaSBqyvwYKRHJB3Y/LXK7pI4p812am2UAfTJcZsDTPDWxuPKCUG6g+bpAcL1GWV9cTcF3PEXUXTDFb1dvOby37oL3CKNJtg2r+/xuDi5PC/ATJHFgdZyxQvc1ftHqBbfTowgyVgYulZ6EuF0nbFXTxMILlhHQgsh9sC2sBogezpd2OW7IYRcOox/B50ij4n2y/p5BWp03IOWt9Je/PekdA6Br90k0UBQPRh7/0RAfAt4kjyfrJ8qSeFjigYl75/3BjD+wW88t/Q8HqNW2B1GhUoiRiZ7uD2fkkGdhJbNYtKLXr/1qfI45LFRw7YrKYZKdUavu4W1X8xRgNfXJEt9Rzy1UnSZe3yiJmY1TyqZSw2DtKsWfEuDjHBNKWefvPtcNxHkGTvzy/P535MSaML7qjYbmyJkhpKfxYZLyYz/ErZTALE6mXdFk52m6t3zCLUXThSawtVgcqhf00r1+r6u2dL4VZeN7wbnGJvrwUr9vUT8rtJjenwbzrclBrC2hSpxC1xjJNmuorlrXbkZ2vIZTceBpXYTZRdShkrbAWfZHnHYtODKZOYIsT5fNl3yABN77hSGZIdKu5ET86SuO/aC+n64mpYGiK2Si2h4GqtiGn9uOqDxsPqT8tTO2keUQFmSFFfgPsqu02SDl+KISH11NlwnENNEdnKTnZFhCyh2HhA5L0g=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y69rAGKdBWczZHETu22FdgqsFcerq3Rv0XqG42uo06ys36MeL+cOQ2QZXfA/SEHBi/Ua0cVi5F5M1JB+HTs5EbaBGv2jrLnGlfhfKJFNznivOHsKbSGerDJgThzCtZDwzDH12ztEgxzbOfR9n3hQR9U2z+qhR4ie6ttmOLqYk9vNgV6QRmJl5yByPWP5xMIQ3aDoUpA+quSiPpSqR+j4HXf70ZqcUUlSrsrS6Aw903GrIW7XFo117U0z3dJm6Qk35xOV7VZW5qrEmVVgj0WIOwgqdkSfQyoir9rLC8NpzUydEezn9x4UAV0dnf8onvRonjIU/fXjiAERk9q83WjnXmgkcRZLW6eVeTZzYpgBG6cvJndtR5nroAng2zfSCypOoSIoMgMGxTfDCMocim+UPDSfjqSgMsXDaBhD+ZNyN9lk3DY5rm5/zcedRNS64iiE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 06:43:53.6416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 608a3839-749b-4a49-94a9-08debc847c16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6447
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_234400_089588_24DE764B 
X-CRM114-Status: GOOD (  16.36  )
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

From: Harish Ediga <harish.ediga@amd.com>

Coherent buffers are required only when the device and host update
memory in parallel, which is not the case here. Replace the coherent
buffer with the streaming DMA API and combine the two allocations
into a single kmalloc block.

Signed-off-by: Harish Ediga <harish.ediga@amd.com>
Co-developed-by: Harsh Jain <h.jain@amd.com>
Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/nvmem/zynqmp_nvmem.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
index 6be00a2be9e4..e8ab4ce23fb9 100644
--- a/drivers/nvmem/zynqmp_nvmem.c
+++ b/drivers/nvmem/zynqmp_nvmem.c
@@ -60,14 +60,13 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 			       void *val, size_t bytes, enum efuse_access flag,
 			       unsigned int pufflag)
 {
+	size_t words = bytes / WORD_INBYTES;
 	struct device *dev = context;
 	struct xilinx_efuse *efuse;
 	dma_addr_t dma_addr;
-	dma_addr_t dma_buf;
-	size_t words = bytes / WORD_INBYTES;
-	int ret;
 	unsigned int value;
 	char *data;
+	int ret;
 
 	if (bytes % WORD_INBYTES != 0) {
 		dev_err(dev, "Bytes requested should be word aligned\n");
@@ -95,18 +94,18 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 		}
 	}
 
-	efuse = dma_alloc_coherent(dev, sizeof(struct xilinx_efuse),
-				   &dma_addr, GFP_KERNEL);
+	efuse = kmalloc(sizeof(*efuse) + bytes, GFP_KERNEL);
 	if (!efuse)
 		return -ENOMEM;
 
-	data = dma_alloc_coherent(dev, bytes,
-				  &dma_buf, GFP_KERNEL);
-	if (!data) {
-		ret = -ENOMEM;
-		goto efuse_data_fail;
+	dma_addr = dma_map_single(dev, efuse, sizeof(*efuse) + bytes,
+				  DMA_BIDIRECTIONAL);
+	if (dma_mapping_error(dev, dma_addr)) {
+		kfree(efuse);
+		return -ENOMEM;
 	}
 
+	data = (char *)efuse + sizeof(*efuse);
 	if (flag == EFUSE_WRITE) {
 		memcpy(data, val, bytes);
 		efuse->flag = EFUSE_WRITE;
@@ -114,12 +113,18 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 		efuse->flag = EFUSE_READ;
 	}
 
-	efuse->src = dma_buf;
+	efuse->src = dma_addr + sizeof(*efuse);
 	efuse->size = words;
 	efuse->offset = offset;
 	efuse->pufuserfuse = pufflag;
 
+	/* Sync DMA address updated after mapping*/
+	dma_sync_single_for_device(dev, dma_addr, sizeof(*efuse) + bytes,
+				   DMA_BIDIRECTIONAL);
 	zynqmp_pm_efuse_access(dma_addr, (u32 *)&ret);
+	dma_unmap_single(dev, dma_addr, sizeof(*efuse) + bytes,
+			 DMA_BIDIRECTIONAL);
+
 	if (ret != 0) {
 		if (ret == EFUSE_NOT_ENABLED) {
 			dev_err(dev, "efuse access is not enabled\n");
@@ -133,12 +138,9 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 
 	if (flag == EFUSE_READ)
 		memcpy(val, data, bytes);
+
 efuse_access_err:
-	dma_free_coherent(dev, bytes,
-			  data, dma_buf);
-efuse_data_fail:
-	dma_free_coherent(dev, sizeof(struct xilinx_efuse),
-			  efuse, dma_addr);
+	kfree(efuse);
 
 	return ret;
 }
-- 
2.34.1


