Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBA8CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJDevIpkWTZk3YsOfIFvj9Y4Y8PtDHVseS1UQHZlKYk=; b=ISIpI5HQEFWmhjbUSupUqW0rtl
	qolnJtGfZeWLwIiltpAJ2R5cV2JwGoMuAQUND4eE1tOEKPcSiSdmOY/7zd6niAP5kqxfbVwSbwxzw
	ommowezpF7Dj3ZXEGV+pWKpFbmiD7EAGTRDmsF6IwCycDf5oIsjRHkcZe4+mfBOJ4xd29rmwa/uu6
	AIfYWxKPKL48mV1kIL++zn8cvGcFjdOHztk8ZkSYy30PilZxi2nqhYYQvYuPofsfxICV3R4kvMJtV
	pl2GXWpw7llHBVYRFzZTZtVNTL/7eyWnj5owEIX0dJdRMqS09TBO02XkSqS7waOuh6ZEzsTP+vNAh
	mx9wo5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3KT-00000000ipu-3KDR;
	Wed, 29 Oct 2025 10:22:57 +0000
Received: from mail-westus2azon11012008.outbound.protection.outlook.com ([52.101.48.8] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3KN-00000000ikX-46vj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:22:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5QDvDTQJn9iunLw+N1Ql3P0WeoQC4dOAe0Gq5ZBoupIBRIoWsgt/1VQbht1ZcF29W5eJ8s/FqNt2iESedQA3DIpOiSSXdSqeJx5G0kmx+Ul3fIEtsqiMBGzDk5nJtZEj38wrDsGYcXx/h/1iZaLSllf8hu9mCB8J/BXYa+/qjlPsFLxrdeP1JoKNxIiZZs/C5P8KytF+2gK/zMC/GyOQ/1hYMX7G9hyS6MT/AaQXXT/zDZ9GThMIY17RV2mPZybaLHjrEwDX8tpwyxMSHcA/afTnl40anMOv26tr6wM+m+GP/WEZmpp14jSUA4Khd31JTKCfWhhYl2oYYDZJdC7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJDevIpkWTZk3YsOfIFvj9Y4Y8PtDHVseS1UQHZlKYk=;
 b=wWa0SlssI6FCn876vSdtxJ1fpetbWdNzfybn83aSpuu6cJFQaRob2fskI4rjLBYv7lUkjlXlGmG7gbn2iNBtgIDj54azmU3ZG7FdjXCAH7cChXM5dg2I6ay3k5ZDEgy+uHrCVz1KQnkwPPqkbU7d87FHru0czHEZ2tISNJznCw8zWmUMv7GACElQlRDNsxR8/mLrieSjvkkICdvBfQniYAKC+UI/enMJT3133JEL6kMXW5/tpJT5yZ6FyDFG2gB54FwHC2nQjJNltHLFFm0K42Oy7EAaSY02hiZ8ygFjHwljpCx2pcjhwk+FpoNaX5icl4eeO6iysshQ2rnXuP7D5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJDevIpkWTZk3YsOfIFvj9Y4Y8PtDHVseS1UQHZlKYk=;
 b=yYlcpYvm5NWpMLDsSkdDuPOORhD2WWeMnK5cWmf8wzJ3jIwiwBYU6vCHTyYkyp2dz3B7GjiFCkvzj3NhY3/s8K59ZsqwkU40V56WxzKEtXEyzq3et3lFxIcW8RhtPY7LfMBKr80hXa8X19ESJChlyaLb5aY6wNZoQd7cnhj/eFg=
Received: from SN6PR04CA0082.namprd04.prod.outlook.com (2603:10b6:805:f2::23)
 by DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Wed, 29 Oct 2025 10:22:43 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:805:f2:cafe::53) by SN6PR04CA0082.outlook.office365.com
 (2603:10b6:805:f2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Wed,
 29 Oct 2025 10:22:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 10:22:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 03:22:38 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 03:22:38 -0700
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 03:22:34 -0700
From: Harsh Jain <h.jain@amd.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<mounika.botcha@amd.com>, <sarat.chand.savitala@amd.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<jay.buddhabhatti@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH 07/15] crypto: zynqmp-aes-gcm: Avoid Encrypt request to fallback for authsize < 16
Date: Wed, 29 Oct 2025 15:51:50 +0530
Message-ID: <20251029102158.3190743-8-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251029102158.3190743-1-h.jain@amd.com>
References: <20251029102158.3190743-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|DS0PR12MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f05fb21-0b94-47cf-cc3b-08de16d518f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O70c93tZ4cGZPDHd2RyswFs7MAVdILiXzWSU09+jiONI/EHT7uEKw93681jN?=
 =?us-ascii?Q?p4tVEeiXfT/ooZDXaUoBBQCSh2bhua2CyRQsCx5lXN0ntflm5kunMxwnkUKE?=
 =?us-ascii?Q?1iD+vYbcGnwALJvDauklz4SbjW7HZS9B/ID2IQDkuuTRC0KsFetlLSr7Hfy6?=
 =?us-ascii?Q?PRHWNmz3Grbxjdb4hT9JSp9bpG6FmLFzwpIHpxTKbShBYSY74eFk4j3Ah1ZW?=
 =?us-ascii?Q?z5tC36b+dJ2MvKJVQK8DZNbA8npAFHnXzUwf8X9m1E92nMM+LspJWgDbQpjt?=
 =?us-ascii?Q?5lJy3MUCa+CVMFpz6mAhD74ESXnkyyLYFUhmnsmQhDsBnv56qnKgdbETjkQE?=
 =?us-ascii?Q?zMWhOxDvJJ1S3mCXxeGmPvcBUujg64ML+dfxCO4d6f+9Ve6J2vHeq3RAZgQh?=
 =?us-ascii?Q?dR/U+nnmf6u0ROAajtomGEg2rYQkkQ0oZC3QUxW5zZzkSa7eE/fe0flP6MyP?=
 =?us-ascii?Q?QwT2NQfb5c3tL6PXdC/i7IFFMM5ZHqZVgXI30llKMpgzzBssi3ugF0/R7zo4?=
 =?us-ascii?Q?D6ALqmDqV/BdsmSDMljO9CKizqz/FFGNFr4GF1EdG57StmwIhJqg7VQIcXTJ?=
 =?us-ascii?Q?bPqw47LQZlEAXmFFWRwmObGFkz3AA80IGsu349v6Q/y30/4FjAqeRtNO1h3x?=
 =?us-ascii?Q?2WKezgh6WV4TpgUZY6/wCVszY5HcykMNHL8Hj4fUZmRRK95ZWZLThGClpc0K?=
 =?us-ascii?Q?RDy7liZV+z9LPRcCNAB5pHxPQvGbCqpZ46gKbO0J1Me1RStQkP3ZU6Mbhh1Z?=
 =?us-ascii?Q?MBvquD/5GO07vf0Bg3EX2VNwxwQvsMSDeXN9Qs/rPoTtLnSlK9tA9QKP7WPS?=
 =?us-ascii?Q?+oXeg8b4JIrhLSEPVZrLpSYVEJ9xh2EkOhCepZgH/eBNk7rbBzCjeR9Xfx+s?=
 =?us-ascii?Q?GPd+55PDwh3FMnpKervSZnhVtDesdbzP5IArU/U78sR9VjjL0Kc92ru6HPYK?=
 =?us-ascii?Q?Ytv9ufgsLZHaMvhPkBhdt7AIGAnBFjCHeeDKiHzQLFWvGuA+JwRpuKWqjHMV?=
 =?us-ascii?Q?GFJ7bzc1vNHtoy4MNRTUxmX2Rn5DaSEF23U0g/3QD2pnVjpuBjG9SDyZO4VU?=
 =?us-ascii?Q?N927/Iu2TxrM8NP4R7DiQMDnJiHum3tK/xODE5ysO3WcYEb4OniVFUGC10fX?=
 =?us-ascii?Q?5kITfpCRPBoXiffV1MCxVuWOu/6DQ/HjnyvRizIWiLhXGtum2JnZSsRz72EZ?=
 =?us-ascii?Q?Z+CYwIS57H8OHjbpFbTno1GQP5KKAkYGPYuhsTLDmbGYfzj8ujowCxLPyj0B?=
 =?us-ascii?Q?1eTUk09h/CayW/r/TushjgrXh4YfPMJUOP7Gdr4W9IIgoW3aowxtNlRiBxjm?=
 =?us-ascii?Q?VNbHV6TphSi0dwEz27mEo1aRhgg4cWU+GT+e2SqrqJrSS9n8H6aIgzR1tThg?=
 =?us-ascii?Q?V1dXjr5m3dLcgNW8C413p0Z+pikE7qxq7RK7/ZSm3+CKLnGjinTtoTybckhR?=
 =?us-ascii?Q?JpHs3RD4P+KaeZJutETJmt3YABW4bqtk3r4q0ag9iz9+I1UDpJFB5lQkucbl?=
 =?us-ascii?Q?1wHUL+oWlV8O7IAzAeH1s53B2VI7vxqWe6a6yHx4v6wzOkU5xEUmr/vaMqFR?=
 =?us-ascii?Q?HGN4IWHSM6KeVAdtGAxyWScapM5YQ2/5Y5q5JfQs?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 10:22:43.5243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f05fb21-0b94-47cf-cc3b-08de16d518f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_032252_031256_7A8ABF5A 
X-CRM114-Status: GOOD (  14.50  )
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

Encrypt requests can be handled by driver when authsize is less than 16.

Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/crypto/xilinx/zynqmp-aes-gcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/xilinx/zynqmp-aes-gcm.c b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
index e64316d9cabf..3b346a1c9f7e 100644
--- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
+++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
@@ -150,7 +150,7 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 		}
 	} else {
 		if (hwreq->op == ZYNQMP_AES_ENCRYPT)
-			data_size = data_size + ZYNQMP_AES_AUTH_SIZE;
+			data_size = data_size + crypto_aead_authsize(aead);
 		else
 			data_size = data_size - ZYNQMP_AES_AUTH_SIZE;
 
@@ -178,8 +178,8 @@ static int zynqmp_fallback_check(struct zynqmp_aead_tfm_ctx *tfm_ctx,
 	int need_fallback = 0;
 	struct zynqmp_aead_req_ctx *rq_ctx = aead_request_ctx(req);
 
-	if (tfm_ctx->authsize != ZYNQMP_AES_AUTH_SIZE)
-		need_fallback = 1;
+	if (tfm_ctx->authsize != ZYNQMP_AES_AUTH_SIZE && rq_ctx->op == ZYNQMP_AES_DECRYPT)
+		return 1;
 
 	if (tfm_ctx->keysrc == ZYNQMP_AES_KUP_KEY &&
 	    tfm_ctx->keylen != ZYNQMP_AES_KEY_SIZE) {
-- 
2.49.1


