Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669A1CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 18:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tcEi94+HJkJmAuOl8YquuCHg5PsNZb8Yp9/clB4oVNE=; b=k2qQH+YyfgaFO4TwxGvJoeaTON
	Bgq2j3MgEMkFiEg9wSKPjV7xFgb62bWumEbXalmXJw4YrWXzhuUB12AHGJ4jTgcAQRmaemK9yr/Hi
	IYoxlfUTPIpVzYWpQT/kcGgYjli57ym5M5+ehDBu/gHbR/4irdrs/1H+b9mmozt3r8uf98tl25nTy
	HjNcE3mSDaHd1VuFNL5/1ryk6yMYaYYlTH18ei4WSAtspsrKWoqebyIBWiBzYVfORExpywoyDjedF
	DdHDxuJx0eoSVWfl60l77xRq3F6uWFpy3I2VZFjv+Sej/SOhLD77dkFjpVPs4/ARmi5rc1Z/oEnjD
	pqfF0Pbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqy6F-0000000CqKx-2xmD;
	Tue, 26 Aug 2025 18:08:51 +0000
Received: from mail-co1nam11on2062f.outbound.protection.outlook.com ([2a01:111:f403:2416::62f] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqy3W-0000000Cq7n-2uvO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 18:06:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYQlpKuuVpOp0dj/RuEjcP+o9YoimMwAmFWyPw0Wf1R7iWmBwdh865O8skMYn3FjCE2bCHh3s3pjGE3gbShYBu1RFBrCH5ghDKvRgYEhIGDrGOJ+1lI6P6Ciob/+4DAUZT3X8WzjeXe4galsqbykqyudO+2//5fFAn9YUbY1yvy0Qq+6+FeGnzPn35H+jsSzWM032dgLS18Rv64uDh1AV+g2MxpO6OdmU8WwVtANly1rxhelNZac4TJwKEb6/zBTbtmBeIEN9/VULOSsdz7heRCqBAzCqqWzMcbIsw11dd09v38Zl2s8hC+Osq21CKIBthFtwZkurH/cKACN4KOmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcEi94+HJkJmAuOl8YquuCHg5PsNZb8Yp9/clB4oVNE=;
 b=Mzvf3KhepfvJosUkxxaktPkPtJMpf1Dcrmu8SJfWjT+g26O1C/WQS4qgnSGQBScbc3XP/dXAXKKItbmGTW5OgcVSlLC69SEVF0vZIHCYGyvK5roRpuA20qwfuQYHLaOrp62N6UeAtU6+l5mPUGnfWLiNKvjuXyVJT/R713Qz39L4v8w1ccSZpSRypd0fIb9wiI+uXoVDbJa+/r58upHovEX5HiUgJ9Y+kJBnEcjoWlCG84V5gixLXVX4T43n8/Evz72wux+Fs8GZCnzO6hVUHCJ7FpR0YWyqZGK/wZPMMrzPrbi1dN0Q6dCMZI5chvXXHhX0SCSgbl3ggYqK3aJkEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcEi94+HJkJmAuOl8YquuCHg5PsNZb8Yp9/clB4oVNE=;
 b=Eu++oM1mIsHN6pHsbhIMj/zOKbsPTYLLvD3ATaJcBwtwl/aJMysKov1Ez+jT+66FDYcxn+Z2iKA0LkpOH/Ous2WNZEgbhY8j2TTn0l4ul3wDE+dEagMCRIqwvWIKRf2GLKrUr7vGJkEBcISJ4xy8yA93e1xCIxPxf7U/2Oc6sFo=
Received: from BYAPR06CA0070.namprd06.prod.outlook.com (2603:10b6:a03:14b::47)
 by SJ5PPFC41ACEE7B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Tue, 26 Aug
 2025 18:05:55 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::b1) by BYAPR06CA0070.outlook.office365.com
 (2603:10b6:a03:14b::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 18:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 18:05:54 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 13:05:54 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 11:05:53 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 13:05:49 -0500
From: Abin Joseph <abin.joseph@amd.com>
To: <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>
CC: <git@amd.com>, <abin.joseph@amd.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH net-next] net: xilinx: axienet: Add error handling for RX metadata pointer retrieval
Date: Tue, 26 Aug 2025 23:35:49 +0530
Message-ID: <20250826180549.2178147-1-abin.joseph@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|SJ5PPFC41ACEE7B:EE_
X-MS-Office365-Filtering-Correlation-Id: ed517006-7de1-47c9-6fe0-08dde4cb335e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a7qKuOdfocFiOPK69Uaf2xS2qx1uUjlpVmNJbu5c+Ljcc02Ndyw4zY3wz9eQ?=
 =?us-ascii?Q?H7mViYghOHN/MQSE2c3N0/n9pBdiYbxiiruCGSqIBqIknXbVXG7E4Nyo6Taz?=
 =?us-ascii?Q?0O2CnPluzViTENYc/HCe4Fds7KXvh/LWyYGlXyY2tQ7ipKUVskA3kVAbfPWJ?=
 =?us-ascii?Q?yGgPTt38aLapFQBQ5oLNEHNAm3nfApcjhsFnF4kK3OAEAte3ag/cbqdLrzwo?=
 =?us-ascii?Q?BA58tJYdGxtBecqDUkLp8r1TJyTqnAR+vmq8F8xrRU7se8AdH5rwSC2tkgwr?=
 =?us-ascii?Q?VQEglI8PbQMAjfDKiIv4mWSkuGnN1+cBMkLRFc9m94Rsp6fitwTuG7bAC4OJ?=
 =?us-ascii?Q?XgNvSCaR7BziwN/y7eNgCY6R401vVhA2EgvgNfsPTUOUqq/kgRlwrsGAgPeU?=
 =?us-ascii?Q?YFsJJFqRx2ZLDExTwFY3O8kro08oUelkhp0QJAS85AWgJ/5ltvhoS7fXhi0k?=
 =?us-ascii?Q?mQkPQiMds5QmpIjXjionKqe4FXNs2a9r1ZhQKsNMUfpO/fe3DPAx5i6G/XNL?=
 =?us-ascii?Q?gyx9PfOHijG7CJr14vXHf5eBhrTm+0uzOWF2zn6+ySGcOsVSbLdU1jLBhYM3?=
 =?us-ascii?Q?hwXZVFGcT0qfaVQWZgF8i/kW135CW46IKmVHsT3xbEEZh77wrs+wpen67tGQ?=
 =?us-ascii?Q?l30xogbXWaavGOOoEwIY3vMjyu6jv+6QdFy4EnObF3K4Mn3DmqBpo6/cyQst?=
 =?us-ascii?Q?XVcpPmwWqZbh97Z60vcVfxMwEYjqtK+06tqlqkxyjnvBHcSUYUqBS8Symy+a?=
 =?us-ascii?Q?KLYqfSi+5A05w8EJJpA+4i8xWLjAYmBk+Yqn7MDVLD8lkyi+wGUR1v7Zl5qP?=
 =?us-ascii?Q?B4dZ6fK+HtMuilcduPJW+35hYHO8vlwcgDFfkfA1/tuFHo3x8i8XTlxBpmim?=
 =?us-ascii?Q?bfyhxsj71E2z/fqmRj9gniSlPSv7Sq4TlOMgoqItjtX3CIF6RGFvgzdB7c1t?=
 =?us-ascii?Q?SLQl5+xxVEpI9+SXc0umwuNAPDEH4hSEE9AQxGOrz0+8pd1pIw/ofy660KzL?=
 =?us-ascii?Q?AHrwwDtLiAoyxbeDxfn97hgIik6GdcqTluwhzm85kGkymzmXb7EXbyfA3kgD?=
 =?us-ascii?Q?qG1R1bsvbjL3xj9IfsxErEmUmocH7WgC1ucDARa1xpdjulz7FVMF70u1df/e?=
 =?us-ascii?Q?fcdBt/LmF729zU53qzYVnI2Ofulf2cgF9rh9izTKO+DZkSzlRYhT5eR97cZ+?=
 =?us-ascii?Q?ow0dmTHgCas2rMldgPYcc0eOp4x/2HjB6mUFuPsZQGC2aqdrQ8dw0F0dv39U?=
 =?us-ascii?Q?bzPXA9B75856cr4Nk3/sbru7i5ApFXXF1MQIVqMJiSGgK3qXOJisNFirsAZt?=
 =?us-ascii?Q?FV0MRkvGDTmhvQ5d0ftx5huXneVBvtutKnSpq/GTsa1uesc5sQGwGKT11Kmx?=
 =?us-ascii?Q?34Wc4QlydLgW9TZYbJWlvZmzGCriPtN8h+swykPpFu2avZ3ZeIjtW9SHMpCz?=
 =?us-ascii?Q?Fxi+6wILnW5M9e+HPgLR9v640HNgQQL5W6vilHBOywUO/5igV8MtQuzoaaQp?=
 =?us-ascii?Q?3OzAbewuHJm9+/ZUCYZf6Z/356dkXC+eM31X?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 18:05:54.6446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed517006-7de1-47c9-6fe0-08dde4cb335e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC41ACEE7B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_110602_739322_2C739DBA 
X-CRM114-Status: GOOD (  12.90  )
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

Add proper error checking for dmaengine_desc_get_metadata_ptr() which
can return an error pointer and lead to potential crashes or undefined
behaviour if the pointer retrieval fails.

Properly handle the error by unmapping DMA buffer, freeing the skb and
returning early to prevent further processing with invalid data.

Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
Signed-off-by: Abin Joseph <abin.joseph@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 0d8a05fe541a..1729fd21d83b 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1166,8 +1166,17 @@ static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
 	skb = skbuf_dma->skb;
 	app_metadata = dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_len,
 						       &meta_max_len);
-	dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size,
-			 DMA_FROM_DEVICE);
+
+	dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size, DMA_FROM_DEVICE);
+
+	if (IS_ERR(app_metadata)) {
+		if (net_ratelimit())
+			netdev_err(lp->ndev, "Failed to get RX metadata pointer\n");
+		dev_kfree_skb_any(skb);
+		lp->ndev->stats.rx_dropped++;
+		goto rx_submit;
+	}
+
 	/* TODO: Derive app word index programmatically */
 	rx_len = (app_metadata[LEN_APP] & 0xFFFF);
 	skb_put(skb, rx_len);
@@ -1180,6 +1189,7 @@ static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
 	u64_stats_add(&lp->rx_bytes, rx_len);
 	u64_stats_update_end(&lp->rx_stat_sync);
 
+rx_submit:
 	for (i = 0; i < CIRC_SPACE(lp->rx_ring_head, lp->rx_ring_tail,
 				   RX_BUF_NUM_DEFAULT); i++)
 		axienet_rx_submit_desc(lp->ndev);
-- 
2.34.1


