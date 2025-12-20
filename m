Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB19E668B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 16:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6/CE5aLAXjOOynLWqr1rqMCEK4D4neFWbtbDW4FVr0=; b=UsLOGLQ35PtcbV59L7N1GJzUot
	3gt9o6Rv9DjfdIOTuruf5L3E1QeaADCC/3d4F8maYs9MkLO5WP98lpArtCa1+ofESL1dxON9KYQtm
	F6/PadifDm+QrS4vrONp1U7zNK4NMfn+8ioZ7VbxclSK9CsAAzs50uby5WaJo5VkiD+85btz+1nKA
	49m3b3tWYPARlKNICe25OvcvgH3s8X30+78NpTyylQLkCoPTgqtawRxWpPN2EDzlZ19Z6vHbPYg5o
	sFqDMXlfiFojfa/Wdb/URrKH8H5dikMXepGrhdVUp40PRZdOZkvQkrsUBxzGo2cV5PTckfbLYc/Ac
	ytti38tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzNn-0000000Biur-2OPP;
	Sat, 20 Dec 2025 16:00:39 +0000
Received: from mail-westus2azon11010044.outbound.protection.outlook.com ([52.101.46.44] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzNL-0000000BiSO-0pxP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 16:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpPg7HCFB1yDCqclVJr1l7/GprlJ2AD/CosyD7kZqHJvusmrZXEiZ7anl09zZCs0hPDoEBfpYtf4BBjdzUUWXkw+sX74IbLjaQZwSwOvAhRuwxP4KkWpUOZDXnTuJJJLCf28Tu8JiXzM0WKSEad2niB6UZ+Js3RpesBTcZoUm+3BkuRQYOcRKqB/lU4RdjOX2/eUFPom0adJQDPBTCVyq96ykDS5HpL/AnVujk8Z+KxO1I5NrIb4O/odlQjkGqmxXu2KGNIWjldvaVQVYCV2Md9sso/xTECKyYENOxQRrlyqpJ0EbL0oz3/tvfKabaHfh/PEMFTWT47gx/YPP/Rlrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6/CE5aLAXjOOynLWqr1rqMCEK4D4neFWbtbDW4FVr0=;
 b=C5czcLoAAu/SeF3cA9rPCUvlzHma9fq44G3L74XAlKQkk8y9dxN5oUhKKxt/QmsJ6I4a7ozRgLMH9MtvC8hVwAxr4ohowKr3sVpNHlvVXdDOTLW2kNfLXkFL7p01v6F2t0QV74kR5HXXRx+tFwd8hAhRu1+c1qFgODmcFPaxc4G23KqjAbZP30O3KTcpc7mpE0QN0nVSyxgF/Lj60kFB6gARxgFm6xt1/GU4+HxpS2ccoG2+3q0RpPjtHimpR6xhNfhYx3xs6wDr30IJDlidATMvdNc75Gv/VH3RiP9BdfffiCCuPkI9ExPrgMsCQy/GoDJ3Ha4hPGiNgw6VqVxU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6/CE5aLAXjOOynLWqr1rqMCEK4D4neFWbtbDW4FVr0=;
 b=qkTX9B/AZrD7BvS3KRaEYI+bFyBNetf3xhIRewFrpvHAi4HbxNCxEmxEBKlVuDIZTXAAtC0EIKeJmrMaE0lLnRHhPzgxO2GpGToGxtlOQeHeZHNU0D0SWURtN3at6SNQKOmB4BWgKtyUVN/rd+xYQfwvzQBBf+Cpw7z5D1INvJU=
Received: from PH3PEPF0000409F.namprd05.prod.outlook.com (2603:10b6:518:1::4f)
 by MW6PR12MB8897.namprd12.prod.outlook.com (2603:10b6:303:24a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Sat, 20 Dec
 2025 16:00:05 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH3PEPF0000409F.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.8 via Frontend Transport; Sat,
 20 Dec 2025 16:00:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Sat, 20 Dec 2025 16:00:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 20 Dec
 2025 10:00:04 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 20 Dec
 2025 10:00:04 -0600
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 20 Dec 2025 08:00:01 -0800
From: Harsh Jain <h.jain@amd.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<mounika.botcha@amd.com>, <sarat.chand.savitala@amd.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<jay.buddhabhatti@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH v2 13/14] crypto: xilinx: cleanup: Remove un-necessary typecast operation
Date: Sat, 20 Dec 2025 21:29:04 +0530
Message-ID: <20251220155905.346790-14-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251220155905.346790-1-h.jain@amd.com>
References: <20251220155905.346790-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|MW6PR12MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: bf44583a-a371-4688-ff93-08de3fe0d74a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jBguYHEo3gW95gPBCQfAOTausYGsh7nBmjs+4IRnWugtY8BSIzHG3MGDye5g?=
 =?us-ascii?Q?W23q69iXRUnM2CX9IywPoxZBy+mA97cq+uULQSBQtLGNQSui9IKggyi/UG+7?=
 =?us-ascii?Q?MdBrHYgdM1Jee8iaoCl1i6EkU7Q0j6R4fR0HzIx06o8sDPtib563lFr22RKt?=
 =?us-ascii?Q?4/qc5n8alvomI9yZrNSk4uHJQXlF6GIEzwsSRp/UNnO2HtK8VUTCE0OqiIuQ?=
 =?us-ascii?Q?cx5cy6GlZeYSHsQFZ87aRdR9QqylrKfvZDYexV5XAXnbPCMlkV3IdVzEoUhV?=
 =?us-ascii?Q?H3EubFyxWcbJ1fBIvK8ZJ7mZXPzwn3QkGnedt3q+2unkbxBJIhrQosnR+bvK?=
 =?us-ascii?Q?DwW2uXFBOGYXMdCELjDWut6uxrKnWrleUsTpU9P8TxzQukIpUgOxtzB4EZkc?=
 =?us-ascii?Q?dh1Txle7pBm4mVaWmBnrcBbCMpZPwkHRQKCXmvnpkppir0iZrSL29TLIwcg5?=
 =?us-ascii?Q?6n69wM/VIyhlr5D6PPPyNsHTAY5XQICREZ8rj3qJCKCUPSLBHvSqXBefXNTB?=
 =?us-ascii?Q?eTNTF+/Ej671UMQ3UVLVxjZoN0ZrLZckzjVvHYW5PPRyweGO+s2/zNULwcoz?=
 =?us-ascii?Q?qyxWUbjP+davK3drZFMYBmhhws5wE7utwHPyatVKPYvmw9egXnKio+pZz1t7?=
 =?us-ascii?Q?CnZ6HK/6j6loCQPayccOuhW0qtlSG1lGCBBYQwg29uvWUjZ8L10CUDfhlCPt?=
 =?us-ascii?Q?/C6c3u9ML3FKirNT2jJB0/5d6dMJE45XJMuI5tzMPGCDDx6nV/QCxinv5p4/?=
 =?us-ascii?Q?CoHl+QrrdXCTy76FWwRZVT0+xvdXO2jNMvlFZ8eyrFddsBLniTUTBi/UPEMX?=
 =?us-ascii?Q?gBsIjp1n6skjF6jliQGA4kVpotZONYAzSwzTNffWAXmFZEjexQnfmkkGa7sK?=
 =?us-ascii?Q?BJbY4NOT65zcN/0phITRPiarg2Gj8uiO+oRxQUAI3cehTd7BIikF2mWe+8gS?=
 =?us-ascii?Q?4Q0kyo1KdjL4MkFmxlCpz1XUnU6mcjjoKZmC1q0ehHrThh9qk9kXLYBO+uTN?=
 =?us-ascii?Q?YxoaIntck1ISwEI69mGdu08piZJ52nTID/jWzYHXRN1G0gQgT/UnawjLgL0p?=
 =?us-ascii?Q?4biBtgW7RiZu0qhNLXrJAmrG0GHKPV5Zge56dPbO1hmOJcu+Nc3sVwowjCXL?=
 =?us-ascii?Q?vLHx/237bAaPnNhHr3e71CTrjzgxq5fn80/VUCJCecU0V1UDz9kQlTx+ZTAC?=
 =?us-ascii?Q?/Q3rCw6Uu/VuOvBd6inkvopM1JcigDgudDK6f5SSgZFPIU9sxpKnrzMgJjZ6?=
 =?us-ascii?Q?Q19jShiKpfgLy7NVDwu0yyvzsvwTKcPxESLLCTV+Ds2Ni5CayhuiE35Ssln1?=
 =?us-ascii?Q?l/jeAX6HxM9WbXlRk92snQCO58zR2KzKv5hY9XU/QAS/xuTuoqLPI1Du4w4O?=
 =?us-ascii?Q?70xTVgaCljeakpSqIe/RZzJfaswRnqyV+cd1VQzH6q6vLlT3hGv6sy5OvnzH?=
 =?us-ascii?Q?UbhFqDtLgt3Y4H2CDOvf4glw9qIRf4vfOU/EzEGBkD6uBvkydOUzZaQ0Ac+Q?=
 =?us-ascii?Q?dikwmLcq3lo9JGk7SxWmItTI7RFweV/AQcrae38osYKOKkAux6ycghse73a8?=
 =?us-ascii?Q?hHWgl997QlTXNMKqaoGNGIM1PWHe5ZrNCvrLkQUp?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 16:00:04.9534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf44583a-a371-4688-ff93-08de3fe0d74a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_080012_112244_D3CFF64D 
X-CRM114-Status: GOOD (  10.49  )
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

Return type of crypto_tfm_ctx() is void *. Remove explicit type cast.

Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/crypto/xilinx/zynqmp-aes-gcm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/xilinx/zynqmp-aes-gcm.c b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
index c2563c6837e4..80b0ace7b5ca 100644
--- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
+++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
@@ -282,8 +282,7 @@ static int xilinx_aes_aead_setauthsize(struct crypto_aead *aead,
 				       unsigned int authsize)
 {
 	struct crypto_tfm *tfm = crypto_aead_tfm(aead);
-	struct xilinx_aead_tfm_ctx *tfm_ctx =
-			(struct xilinx_aead_tfm_ctx *)crypto_tfm_ctx(tfm);
+	struct xilinx_aead_tfm_ctx *tfm_ctx = crypto_tfm_ctx(tfm);
 
 	tfm_ctx->authsize = authsize;
 	return tfm_ctx->fbk_cipher ? crypto_aead_setauthsize(tfm_ctx->fbk_cipher, authsize) : 0;
@@ -372,8 +371,7 @@ static int xilinx_paes_aead_init(struct crypto_aead *aead)
 static int xilinx_aes_aead_init(struct crypto_aead *aead)
 {
 	struct crypto_tfm *tfm = crypto_aead_tfm(aead);
-	struct xilinx_aead_tfm_ctx *tfm_ctx =
-		(struct xilinx_aead_tfm_ctx *)crypto_tfm_ctx(tfm);
+	struct xilinx_aead_tfm_ctx *tfm_ctx = crypto_tfm_ctx(tfm);
 	struct xilinx_aead_alg *drv_ctx;
 	struct aead_alg *alg = crypto_aead_alg(aead);
 
@@ -422,8 +420,7 @@ static void xilinx_paes_aead_exit(struct crypto_aead *aead)
 static void xilinx_aes_aead_exit(struct crypto_aead *aead)
 {
 	struct crypto_tfm *tfm = crypto_aead_tfm(aead);
-	struct xilinx_aead_tfm_ctx *tfm_ctx =
-			(struct xilinx_aead_tfm_ctx *)crypto_tfm_ctx(tfm);
+	struct xilinx_aead_tfm_ctx *tfm_ctx = crypto_tfm_ctx(tfm);
 
 	dma_unmap_single(tfm_ctx->dev, tfm_ctx->key_dma_addr, AES_KEYSIZE_256, DMA_TO_DEVICE);
 	kfree(tfm_ctx->key);
-- 
2.49.1


