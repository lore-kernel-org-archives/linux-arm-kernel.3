Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8677CCF9F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5uKOydOILht6ZcwhyuDPkyZYE0qqIc2reCQQL7W7EI=; b=IUn6V84TGKgwTkIwRjAPkIvcLp
	mmbFSdoFysg6vfcdVTeOVa0BOI0Yh5vSQ1NdPILJ58ygQok1hm5alBX6PtE2w/PT7SfFUt7lTWhF+
	HXui+0O9TTnefRR4vEfRU/67tA6hwoH4ItHBjB/evcFMUtGYcepDnHsUQcKCOKqxH9aWcNRtDBr6t
	gtSJy3h2d7F8IXpVtMfw7Uj3oZUZvfRlpkEdLNXrkJ8UNBYWHxfKNS/HA1tSKpz9XqzbNYTSV16xt
	WoYlDTCZmljYj7vfKN2C7HC2VFZkBsE+AG8zHKfmfQW5hW/L0/rV7kEKCZKtCOVEfr6REt/7gLVWd
	Hu7jXyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Kr-00000000jCI-0r7d;
	Wed, 29 Oct 2025 10:23:21 +0000
Received: from mail-westus3azon11010001.outbound.protection.outlook.com ([52.101.201.1] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Kb-00000000ixk-2bGQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:23:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JA7RKYg5QhO4ciFENiBKavpZ2/8WE76dIS6/EqM9Wwy1I1OfxQZOYjTSSL2lJ/f69GmkJWx7bJfr6PnYb4JJ7upg+w5do2KHsB8T+/O136OLHbUH/VI832lFWBwOtOdOhaRmwWmxWooyG8fMD+7bkjba/Ub4s3inEz6Bk2ja7ApWd1nBZ0H1zwFVZo40C3xWZlmuDJZWrYxMFgx1gUV8EXU+BC6uQ2xCK5/+jbtLf+HcjQhcJW5i9VVGsz0HF76iGtLFh9nxdVqXB3cmsyxRzOLnhFDTX5Ej1rOH+ZcT9RUCFwna2EyvpkOwsr8LAX6MpHYaNGgJeX4FtBWnK2mUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5uKOydOILht6ZcwhyuDPkyZYE0qqIc2reCQQL7W7EI=;
 b=M3SxhMZN5ZCOVLIWQiZkhI+yJ4+29Y8u8ncjr4KpNHob3/hou1Sc5jQryPtK5qSZY70zEJUpDrsN4mwDDvdlKSSaM806sCKjG4eaZXPhIGuRtWOLGdF9TpoBJvmcdtrE74PJEcxCEQqKt/lAjRKhFS823N9xa5nIyRMELQrKYohFQlbpsH1Euho+L+w6DnshD8FmQKOdZUrylCKh6oOAOcmahbBCVi1JTrrGwAw4nhtR+KMMXcAojE8MqkYZPXGPYOs96orc9uBgKtAUEzD4tYUfr0CwppAevUEIHCqVujoY2AFjNZwgRRKpqf7RsepfVdlYv2M6zKuRl4razYExzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5uKOydOILht6ZcwhyuDPkyZYE0qqIc2reCQQL7W7EI=;
 b=DLyrYjFceU6vkVsrYkMNZgMs5YX+YuF0DzQKsdX4Gvk+ceRGebqG9PQjvicQQ8EHMLiGQ22yfj8k1xnyewVjqyk+jZQ/0FOhKwF/bSAZEaryCL921yqQKXzASfCdHEls4QaeNk/tbU/WH/zyqKNdkuK5XY/IPgMFLh6tSTTKBf4=
Received: from BL1PR13CA0086.namprd13.prod.outlook.com (2603:10b6:208:2b8::31)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 10:23:01 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::2) by BL1PR13CA0086.outlook.office365.com
 (2603:10b6:208:2b8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 10:23:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 10:23:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 03:22:48 -0700
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 03:22:45 -0700
From: Harsh Jain <h.jain@amd.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<mounika.botcha@amd.com>, <sarat.chand.savitala@amd.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<jay.buddhabhatti@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH 10/15] crypto: zynqmp-aes-gcm: Change coherent DMA to streaming DMA API
Date: Wed, 29 Oct 2025 15:51:53 +0530
Message-ID: <20251029102158.3190743-11-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251029102158.3190743-1-h.jain@amd.com>
References: <20251029102158.3190743-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb6514e-0e59-4389-d509-08de16d5233f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9S7PIH2vg15C5LM/Ow247R9Ikg4StxeC69IvPfH9nIR4tkuc6dpybzn0kuNQ?=
 =?us-ascii?Q?fU1B9OvQhXN7J8Wt/PkImmTAMi3uR5M1ACTibttEb5B0BNAhy+4Ds5hkAJ6N?=
 =?us-ascii?Q?U/w6SE2id4tYOJsuyQkILrywww9cnIRC5ymchJCmY4v0kHd646GrFseNKvaW?=
 =?us-ascii?Q?qPisVf6ds8lNmUBi01WsCeSq42xG55ytaLDTZfuqE8kF3LmkF6MmQZQaiVfq?=
 =?us-ascii?Q?r4zqU9zkf9H3wlWdlsJf9SVmEmQ0tP4V/fkVadb0V30Dj4elO3Y3ZWQBPHNk?=
 =?us-ascii?Q?xk0I/jTUMIuiN5NhK8L5YEdn4rF9lyM7HPUvfQeNeeQ8OScJrB25ejvXuXaG?=
 =?us-ascii?Q?Kvggzahr6MBwujjSY2zCuPLsXEC6NCyXfjyS2vvwhZOy3Igxfp/eBnPEJhSI?=
 =?us-ascii?Q?8aOFTau/edO7mMth3LIvN7IIClwfdUvkahou8vMIZAX+bOHmnFU0ee05/kG1?=
 =?us-ascii?Q?KOuHGvITGxNA3Hf5QoKRkFxI5hhHo9FG92yDPXIc1uPNsQG7Rzz1LMg6iy8s?=
 =?us-ascii?Q?JSjDf1SqqDFj9vc1fOmWCDw5tMMh3e/b7XLsghNiiGuw/Q/qtPebfqmgXUBy?=
 =?us-ascii?Q?uKF9MHX8wvk2Kf/Fe+iGnEufCP7oPU4cXbGHzpHSqGKR8/xZCK7aVuIjmUcG?=
 =?us-ascii?Q?b7JXNjyFS2MWpdj6kyTf8w8M0gHpN0tdC0kSrBOMG55A/AXTGWh1eX4Al5H8?=
 =?us-ascii?Q?BElkOOJ1qS5a8X2qn7Ih/pnlb8R4Ne2Tl58jCo8AX08lVNB24eoyU2sIjj5l?=
 =?us-ascii?Q?nW16w9xuFOAZCFH8Z4vKmalQwEmx7K8pW8IGHSOXwVVBzu6f6s9fJjzNWslz?=
 =?us-ascii?Q?HxFyXrqZXYs62a49T+pplw8d90OQ4nuyZKdjR6CC6BaudKcrsbDMUWkoA4zE?=
 =?us-ascii?Q?wLp9VNCNBijj4rAxgxOiqHHKNzF4PuyI7lzKZLqBX1L1XHpyj80mX8dagtzB?=
 =?us-ascii?Q?cK7jRA+K3wiFDirZm3uAK3ROfSFrsGdBqBt7qJ06pBPhlLlHnW+HOdOsqrmg?=
 =?us-ascii?Q?6zu+Be+yCseMHtuhvgBtzQz7OnYU137ciQoJaGP3sBjmMATzdArMHJfs4Olm?=
 =?us-ascii?Q?1v7J/Ib+YTpb7FLur5SnD0G3Vf849uVLUY6/Z7CuSdhVCE0yy06p2BO/0Yrn?=
 =?us-ascii?Q?3q5gLrU9sNbXLVRR1fP9PUfddWt71brqtMqsD5IV119bQKR1OlZFkLQsN9e7?=
 =?us-ascii?Q?dColIVL/kMDM5C0FC+EDsmTNwqkOOmt8ox8DxaJ7TxXpQPvz5AivyXv2KHga?=
 =?us-ascii?Q?hQgDa1UP+ll4vzRg9M4sZb1koJJAlXyxx55m3gb98aFlQrJcjmeul+z6fpXl?=
 =?us-ascii?Q?A/eIsxki0S8NwEXnGLtqozZbQFPbs5HUIvAdVkWBrUiyv5gCPpf5poD77T4W?=
 =?us-ascii?Q?JHfE++UBKEE/1fE2xtybrYkaaoLIg3qHHkODZknktDK/0dSN9pCP8RaFv+5I?=
 =?us-ascii?Q?5K8n7SqNbhUnz0FxtKcjjwS2HlGm9WgurZN+ZOsB0JLPvsFrv694YgVxtO3D?=
 =?us-ascii?Q?x2wQq03n72b60MetTd9tkXbE1wdDx/ywNm/9AOPRBR+bBH/bPT8Wy9mJ0l9U?=
 =?us-ascii?Q?SXyPEST3FkTJd/6iwoUCUqOtU4eNDfPvMnG/Z/Xf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 10:23:00.7977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb6514e-0e59-4389-d509-08de16d5233f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_032305_706212_11380C70 
X-CRM114-Status: GOOD (  17.85  )
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

Update the driver to use streaming DMA API.

Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/crypto/xilinx/zynqmp-aes-gcm.c | 92 ++++++++++++++++----------
 1 file changed, 57 insertions(+), 35 deletions(-)

diff --git a/drivers/crypto/xilinx/zynqmp-aes-gcm.c b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
index bc12340487be..e3e7aef87571 100644
--- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
+++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
@@ -65,8 +65,8 @@ struct zynqmp_aead_hw_req {
 
 struct zynqmp_aead_tfm_ctx {
 	struct device *dev;
-	u8 key[ZYNQMP_AES_KEY_SIZE];
-	u8 *iv;
+	dma_addr_t key_dma_addr;
+	u8 *key;
 	u32 keylen;
 	u32 authsize;
 	u8 keysrc;
@@ -82,39 +82,38 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 	struct crypto_aead *aead = crypto_aead_reqtfm(req);
 	struct zynqmp_aead_tfm_ctx *tfm_ctx = crypto_aead_ctx(aead);
 	struct zynqmp_aead_req_ctx *rq_ctx = aead_request_ctx(req);
+	dma_addr_t dma_addr_data, dma_addr_hw_req;
 	struct device *dev = tfm_ctx->dev;
 	struct zynqmp_aead_hw_req *hwreq;
-	dma_addr_t dma_addr_data, dma_addr_hw_req;
 	unsigned int data_size;
 	unsigned int status;
 	int ret;
 	size_t dma_size;
+	void *dmabuf;
 	char *kbuf;
 
-	if (tfm_ctx->keysrc == ZYNQMP_AES_KUP_KEY)
-		dma_size = req->cryptlen + ZYNQMP_AES_KEY_SIZE
-			   + GCM_AES_IV_SIZE;
-	else
-		dma_size = req->cryptlen + GCM_AES_IV_SIZE;
-
-	kbuf = dma_alloc_coherent(dev, dma_size, &dma_addr_data, GFP_KERNEL);
+	dma_size = req->cryptlen + ZYNQMP_AES_AUTH_SIZE;
+	kbuf = kmalloc(dma_size, GFP_KERNEL);
 	if (!kbuf)
 		return -ENOMEM;
 
-	hwreq = dma_alloc_coherent(dev, sizeof(struct zynqmp_aead_hw_req),
-				   &dma_addr_hw_req, GFP_KERNEL);
-	if (!hwreq) {
-		dma_free_coherent(dev, dma_size, kbuf, dma_addr_data);
+	dmabuf = kmalloc(sizeof(*hwreq) + GCM_AES_IV_SIZE, GFP_KERNEL);
+	if (!dmabuf) {
+		kfree(kbuf);
 		return -ENOMEM;
 	}
-
+	hwreq = dmabuf;
 	data_size = req->cryptlen;
 	scatterwalk_map_and_copy(kbuf, req->src, 0, req->cryptlen, 0);
-	memcpy(kbuf + data_size, req->iv, GCM_AES_IV_SIZE);
+	memcpy(dmabuf + sizeof(struct zynqmp_aead_hw_req), req->iv, GCM_AES_IV_SIZE);
+	dma_addr_data = dma_map_single(dev, kbuf, dma_size, DMA_BIDIRECTIONAL);
+	if (unlikely(dma_mapping_error(dev, dma_addr_data))) {
+		ret = -ENOMEM;
+		goto freemem;
+	}
 
 	hwreq->src = dma_addr_data;
 	hwreq->dst = dma_addr_data;
-	hwreq->iv = hwreq->src + data_size;
 	hwreq->keysrc = tfm_ctx->keysrc;
 	hwreq->op = rq_ctx->op;
 
@@ -123,17 +122,26 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 	else
 		hwreq->size = data_size - ZYNQMP_AES_AUTH_SIZE;
 
-	if (hwreq->keysrc == ZYNQMP_AES_KUP_KEY) {
-		memcpy(kbuf + data_size + GCM_AES_IV_SIZE,
-		       tfm_ctx->key, ZYNQMP_AES_KEY_SIZE);
-
-		hwreq->key = hwreq->src + data_size + GCM_AES_IV_SIZE;
-	} else {
+	if (hwreq->keysrc == ZYNQMP_AES_KUP_KEY)
+		hwreq->key = tfm_ctx->key_dma_addr;
+	else
 		hwreq->key = 0;
-	}
 
+	dma_addr_hw_req = dma_map_single(dev, dmabuf, sizeof(struct zynqmp_aead_hw_req) +
+					 GCM_AES_IV_SIZE,
+					 DMA_TO_DEVICE);
+	if (unlikely(dma_mapping_error(dev, dma_addr_hw_req))) {
+		ret = -ENOMEM;
+		dma_unmap_single(dev, dma_addr_data, dma_size, DMA_BIDIRECTIONAL);
+		goto freemem;
+	}
+	hwreq->iv = dma_addr_hw_req + sizeof(struct zynqmp_aead_hw_req);
+	dma_sync_single_for_device(dev, dma_addr_hw_req, sizeof(struct zynqmp_aead_hw_req) +
+				   GCM_AES_IV_SIZE, DMA_TO_DEVICE);
 	ret = zynqmp_pm_aes_engine(dma_addr_hw_req, &status);
-
+	dma_unmap_single(dev, dma_addr_hw_req, sizeof(struct zynqmp_aead_hw_req) + GCM_AES_IV_SIZE,
+			 DMA_TO_DEVICE);
+	dma_unmap_single(dev, dma_addr_data, dma_size, DMA_BIDIRECTIONAL);
 	if (ret) {
 		dev_err(dev, "ERROR: AES PM API failed\n");
 	} else if (status) {
@@ -164,15 +172,11 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 		ret = 0;
 	}
 
-	if (kbuf) {
-		memzero_explicit(kbuf, dma_size);
-		dma_free_coherent(dev, dma_size, kbuf, dma_addr_data);
-	}
-	if (hwreq) {
-		memzero_explicit(hwreq, sizeof(struct zynqmp_aead_hw_req));
-		dma_free_coherent(dev, sizeof(struct zynqmp_aead_hw_req),
-				  hwreq, dma_addr_hw_req);
-	}
+freemem:
+	memzero_explicit(kbuf, dma_size);
+	kfree(kbuf);
+	memzero_explicit(dmabuf, sizeof(struct zynqmp_aead_hw_req) + GCM_AES_IV_SIZE);
+	kfree(dmabuf);
 
 	return ret;
 }
@@ -243,6 +247,9 @@ static int zynqmp_aes_aead_setkey(struct crypto_aead *aead, const u8 *key,
 	if (keylen == ZYNQMP_AES_KEY_SIZE && tfm_ctx->keysrc == ZYNQMP_AES_KUP_KEY) {
 		tfm_ctx->keylen = keylen;
 		memcpy(tfm_ctx->key, key, keylen);
+		dma_sync_single_for_device(tfm_ctx->dev, tfm_ctx->key_dma_addr,
+					   ZYNQMP_AES_KEY_SIZE,
+					   DMA_TO_DEVICE);
 	} else if (tfm_ctx->keysrc != ZYNQMP_AES_KUP_KEY) {
 		return -EINVAL;
 	}
@@ -359,7 +366,20 @@ static int zynqmp_aes_aead_init(struct crypto_aead *aead)
 		       __func__, drv_ctx->aead.base.base.cra_name);
 		return PTR_ERR(tfm_ctx->fbk_cipher);
 	}
-
+	tfm_ctx->key = kmalloc(ZYNQMP_AES_KEY_SIZE, GFP_KERNEL);
+	if (!tfm_ctx->key) {
+		crypto_free_aead(tfm_ctx->fbk_cipher);
+		return -ENOMEM;
+	}
+	tfm_ctx->key_dma_addr = dma_map_single(tfm_ctx->dev, tfm_ctx->key,
+					       ZYNQMP_AES_KEY_SIZE,
+					       DMA_TO_DEVICE);
+	if (unlikely(dma_mapping_error(tfm_ctx->dev, tfm_ctx->key_dma_addr))) {
+		kfree(tfm_ctx->key);
+		crypto_free_aead(tfm_ctx->fbk_cipher);
+		tfm_ctx->fbk_cipher = NULL;
+		return -ENOMEM;
+	}
 	crypto_aead_set_reqsize(aead,
 				max(sizeof(struct zynqmp_aead_req_ctx),
 				    sizeof(struct aead_request) +
@@ -373,6 +393,8 @@ static void zynqmp_aes_aead_exit(struct crypto_aead *aead)
 	struct zynqmp_aead_tfm_ctx *tfm_ctx =
 			(struct zynqmp_aead_tfm_ctx *)crypto_tfm_ctx(tfm);
 
+	dma_unmap_single(tfm_ctx->dev, tfm_ctx->key_dma_addr, ZYNQMP_AES_KEY_SIZE, DMA_TO_DEVICE);
+	kfree(tfm_ctx->key);
 	if (tfm_ctx->fbk_cipher) {
 		crypto_free_aead(tfm_ctx->fbk_cipher);
 		tfm_ctx->fbk_cipher = NULL;
-- 
2.49.1


