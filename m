Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51C9CCF9F7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkNAgWcDloiSRF+8UfLBI228BfVc1z38APkTnr0gjCM=; b=0/nBDlPbaQKXns/Hk4OqNNNvWn
	UHUGXYrfsq/Qt5qVxn1PQIxTMrKRNf/xefeYy/1gsqEYrOVC9CHvKGquIpYPZpeZdwCzM+958KDEq
	OY9u6PJkn1HnD2Zn39LxHaFn7eNxNrCxkr6PNgjjQllnwnmWLVh1CwDXC5Vvb/aOSjF4YsJnudP9x
	IK8vdxYF60ppYWL24Gdyd3edL9qE1g2lVmfU/PYMsqkw5A/NsMGvfP/wS2edIxazBNFp3XVAo5L8Y
	Bm8Bn3cxcwcs3s2yorpCAs5Q5FliKaBRJNAjHiLQZLVu72+x3bWEtefM1LPjg8E5mlsKzLYCS+kqe
	zw0n0m2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Ks-00000000jDd-1hOe;
	Wed, 29 Oct 2025 10:23:22 +0000
Received: from mail-westus2azon11012030.outbound.protection.outlook.com ([52.101.48.30] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Kl-00000000j5q-3dGl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:23:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kauT6I6obMhKKCRLaqtlc6GxU0jgHd8lnWMAxcqbokMQ4ZI85Ik+FOW9h/Hr3YOy4aYp0wUwyLJ/hOKb/fkhwg0zUvU7p88hCTtDtvUIcPUPIK0HRBJCiB9jc91ZQP12Tiushdj3WZorEQ0vbBU3+D6ZJ2UHL2E9+/5L6YQ2Q6BPjJWK8SQgYalC9n78UVSiqqMbqG2RVwkXH9UvItT9UHtmCGG9AnWmh8/pbnmj9Kdn6DI6agLoO5f1SurmUxE1nud9pHrzdRef3BFc67VI0YCibhEcMpdqC6sKBu0yaO4TPD7i0GYFwond3zsW+Rd9Mg/x9jYEZMXkVIN9YKZYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkNAgWcDloiSRF+8UfLBI228BfVc1z38APkTnr0gjCM=;
 b=eVDpD2xoCvHVQyFUAf3Mgybx3yAW2nEHpVs7aXw7WpSxur+BwqYivhhTazh5aAD2dP09jDzfqf7hMLpLesNJVxT9OVu9MguGY/YF0qSi63wfz+AAAbQZmNYxyA2RAMJo9/9WrPNHitnsxGCbOYFv4jlCskkTHhocrY4EYvJ8vriABfiARBRSC25TmYY5+I/oO1xGGxY4GZoD/MwJrN7vlMU+JcTDwT/dgWgzIYQmmk3jhIIe50FVF/Kgf7Yv5h+9StvcvP6iZOl5nreB2x9WsYz/zD8O82Q6psY2yVgOxCP4B0tJ84YoCAOOV792J1HHl1QRWeGL45k+N8KGpVr7KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkNAgWcDloiSRF+8UfLBI228BfVc1z38APkTnr0gjCM=;
 b=swTp4wrkBkB4BjmSaPc4u1aHrn1Tv4KJWXrbgxm1ROxeK0XWLzeJ0GEzAt7ZYD5LvgUtP3A00Dn11B+3FAjxgy5MjUGE1hz3Hu1ZDGE6Gr442v+czJbcQ1vXAXLgc6NZlH9aMkjioDDBH4fmi2deLnMpcQfDQXEh1WwdRGjI0qs=
Received: from MN0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:208:52f::9)
 by BN7PPFD3499E3E3.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 10:23:12 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::29) by MN0PR03CA0025.outlook.office365.com
 (2603:10b6:208:52f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Wed,
 29 Oct 2025 10:23:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 10:23:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 03:22:59 -0700
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 03:22:56 -0700
From: Harsh Jain <h.jain@amd.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<mounika.botcha@amd.com>, <sarat.chand.savitala@amd.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<jay.buddhabhatti@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH 13/15] crypto: xilinx: cleanup: Remove un-necessary typecast operation
Date: Wed, 29 Oct 2025 15:51:56 +0530
Message-ID: <20251029102158.3190743-14-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251029102158.3190743-1-h.jain@amd.com>
References: <20251029102158.3190743-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|BN7PPFD3499E3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 25da9646-d1d6-41f9-cd10-08de16d52a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vnll5qc1zojLBe/HU9WjusUZ4a7b3Ysi3U3EDC0a/xNxgbw9AfaBeZ05jAGl?=
 =?us-ascii?Q?JVWxVFNawFIijl43qYC5B8q/iRFvVYe1OXLkgvtSd5SYvuf2qlcRZFfpZP/g?=
 =?us-ascii?Q?bEX0iM8644swjNEmesGJGijVJ0WZB6HVYERVKRMdl14b0hv774DyRMraBtdJ?=
 =?us-ascii?Q?yAZCxMWR+h1B4Rkjp3+fUtVx8n+RWI43kk6TTXQa1Sqk+Ir93H/9uL9I/enE?=
 =?us-ascii?Q?GWhLUx8VaCX7ZiThXBexrp1of4USG9CugGtlU6+LnNsL5ug/vZUGnY5ogdr9?=
 =?us-ascii?Q?HsxpBesm/XKFhrKtXsQwDZoGGa2iZ2HG5HPv928CkS1S9jX9ifdYQHxUYGDW?=
 =?us-ascii?Q?PNQMXeateYTYsQQYvn3tR2IweRFsJPRI6M9koiOz+ApMcgj+eGvJL41UeUDj?=
 =?us-ascii?Q?SF7dg3f/19+J0PtOZ6aAQPnx28k4TLcXzAV9qtM71EojG27euB7+6HWyamOY?=
 =?us-ascii?Q?aEnP+OsxzDwmxehFfRfCetTXE1wHGX0uXejKkz2hEgXslh8243/XQjh+7s+/?=
 =?us-ascii?Q?PvZOWnVlKj9w10dPwKEOwQqEsvbVXvC1l+2CCuLZL4BBqvHIHsDY70bpBU1x?=
 =?us-ascii?Q?eTwbAW0FVbksjpbbcm0a2IipiZSHhKbbrd1oO0My79CSzIOiLm88gCSFJfPs?=
 =?us-ascii?Q?RY2wBBQLd0nQrVgQu9U48CUn2DR7XJACWC72Jwkqr9a3wiu77jiyFaBQ534M?=
 =?us-ascii?Q?ox9Ozvkes/fo/Or3jQKGBmmcw2tEgxi8M3cOdNUI9SsXcRpQbpjfc7VL+510?=
 =?us-ascii?Q?STkt/ampCx24aAc9YqkOfyXEZGogco6sA6cYKJLuj0RgG2benTFSFtCo5SC9?=
 =?us-ascii?Q?3mfOXBdBYGNPrtEkPYhyziVO0ffiKl/ZDn0M79rVygxtiJCBD2nonc5ArCa0?=
 =?us-ascii?Q?q5rW2EtIspK6ty3oSY/e1STRfmW08u8DexG0Gnr7bJiZTMa4g4YBHdRIQA4l?=
 =?us-ascii?Q?dV2/ACD+qm08XnLPHB5E2tWvG0vkzAeZKEZTiK6Gz5nkA/03pIKq9+xVLTTr?=
 =?us-ascii?Q?9JUeOtC6HwvmZn9pWokJ/L/dEAAqLbOZwkSNa/AZ73KDr4iviFTpFI1I+IQq?=
 =?us-ascii?Q?P4RCxaxJVQTONYBOJU59wza/Afrk6ifq+yC1NFal5LXS8MC2KB8nAtzMQs8J?=
 =?us-ascii?Q?kET8ENERt0+8ZD4Fpd5+I7KhI1dvddlXhsPouk+VJvTyqEr27Sw8uXg1kH14?=
 =?us-ascii?Q?2Xi4w5xEtqMZhLPxHNS6vf1zA0jihW2n4YhwW3mKQoNK/A7gVqOe2xUa1YLU?=
 =?us-ascii?Q?RxVGiTiasotg8irRQ2i0ZANBe3VRebY4Ck5Gu49h1/oQ0H2bHHk9W+StN7b2?=
 =?us-ascii?Q?oIgibm/nUh5DPyvJS23gmFWj49cDQtT4qRHb7Ps4t/FP+GYXWLepJeVIwlbl?=
 =?us-ascii?Q?2qb2JvinpUt+/isbwR6VOFUXdOAVV5k+dC0IxYqAnnAjQxpiGI/1q5M9HTCQ?=
 =?us-ascii?Q?BGlIfmCHTeLBd+Jv6YO6mZ3TzFBDVLre9FpMuHa5qg9/27cB4V4rdSrphAHV?=
 =?us-ascii?Q?vaB6Q+ZRb92hqJoKyYVCODouRzqOT7Crk8zrWCEOHaUtnCzpRZiGdcj36hpE?=
 =?us-ascii?Q?VhSqgcKBmU2y1N4prcLOpLkKcdBUqUBdzpVUbnSN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 10:23:12.3519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25da9646-d1d6-41f9-cd10-08de16d52a22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD3499E3E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_032315_918745_C0C178EA 
X-CRM114-Status: GOOD (  11.61  )
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
index b0ebb4971608..6bc5dec94884 100644
--- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
+++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
@@ -267,8 +267,7 @@ static int xilinx_aes_aead_setauthsize(struct crypto_aead *aead,
 				       unsigned int authsize)
 {
 	struct crypto_tfm *tfm = crypto_aead_tfm(aead);
-	struct xilinx_aead_tfm_ctx *tfm_ctx =
-			(struct xilinx_aead_tfm_ctx *)crypto_tfm_ctx(tfm);
+	struct xilinx_aead_tfm_ctx *tfm_ctx = crypto_tfm_ctx(tfm);
 
 	tfm_ctx->authsize = authsize;
 	return crypto_aead_setauthsize(tfm_ctx->fbk_cipher, authsize);
@@ -345,8 +344,7 @@ static int zynqmp_aes_aead_decrypt(struct aead_request *req)
 static int xilinx_aes_aead_init(struct crypto_aead *aead)
 {
 	struct crypto_tfm *tfm = crypto_aead_tfm(aead);
-	struct xilinx_aead_tfm_ctx *tfm_ctx =
-		(struct xilinx_aead_tfm_ctx *)crypto_tfm_ctx(tfm);
+	struct xilinx_aead_tfm_ctx *tfm_ctx = crypto_tfm_ctx(tfm);
 	struct xilinx_aead_drv_ctx *drv_ctx;
 	struct aead_alg *alg = crypto_aead_alg(aead);
 
@@ -388,8 +386,7 @@ static int xilinx_aes_aead_init(struct crypto_aead *aead)
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


