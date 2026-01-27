Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97684D2FED9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/cAGxIi3lQlZovHYD6wmJzJ2mDiEEoF2dfH6yaVu25s=; b=nuut/sIkOg43WXO62ecvZS3ZyN
	MLtl/gXzTRV9x5LKWRqM80warE2RneBLlKA0+0ofUP9v5JPH67cwn4Q6fx+yehnO8nFvVbKFJA/A0
	fuobWXKPRDvDUAuYAEc8w3IsFHc5/M4y5HLn+N/wwJuVx4FMbIghl6LO3fQDNSz3fzRfNZnJjHKQ4
	KRp9qfsw8XkB60IivqKPgQuqt0DqTYsHu2rkHFoOd7E2r+cDn/UahEQb9wx/CqN1jmPirFdeDNEak
	k7YGIxvMOWobGBSVedmkeB60ZM2M3/TbwSiRsUzQyV08sy9ULHbnOjCgF+fWRjEliKNCBwF/PBaIl
	o9FA2BOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoTH-0000000EtJR-0Hs3;
	Tue, 27 Jan 2026 19:11:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoTF-0000000EtJ3-0Pv4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Jan 2026 19:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/cAGxIi3lQlZovHYD6wmJzJ2mDiEEoF2dfH6yaVu25s=; b=boFu5sYeTqWGrjbGutkD1Whs/K
	PsiLDu9/sgFK57pLuyyuOjwIEsqTaBEHtRYaCIucRr/xmW/WP0xUK97DP5T6dDYfGW5/qOVc3FMtw
	Ld4ctNHdyC1zd7pUVe2Q61JC/EaUZkD9Cax1DxvnbFojLHrB6GmTFNCEgElAL8gIlDSPYn3XwcF9x
	iSKeyU3Th9KqBihRT8/EBeUS197cjLaF3nzYz5JA7HCmlGx70Qij4R0BWsdS4Xnc6ps4C9iU7X4Gc
	BENpzQlJ10Y7Q/5a/UiShx2XbFucBMslFbipqWjenM/j+eJiTJVuQjQa+Kje9XTEwTlgdHPvnGxzY
	eQMbO7bA==;
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoTA-00000007Tpv-3kfW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 19:11:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBJt/Wr+8gZrKUHIwDuJvUQ7wTuTu6763COM43MbuG329rb7xIJpy+Zw5W6elTIHMZSxl/R5EblBLY+Pcc/uZf5qNmAkjCLnqA4tPwhIAQqomzB0y6ysgfwaTOyH9RADVI9lupRzSh0myIuRRCe5HwwQP7IZ2wokT8mSNoNvZZggXwS1dg3CKI0bFKDS6tJTn/GhUhG+rmo+xlC30VE3XXo8PYwzt35NFPvShbPXrUWenb3i6W6BbwDg9yiET9j9wOKmvc43qv8r8ocWbVtx1JzvdLlfopvEU2ujnP3gdHQDCrNhwrvvuI4nKQ/z9ElEpJTS0xj7AH7GdOl5sDjC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cAGxIi3lQlZovHYD6wmJzJ2mDiEEoF2dfH6yaVu25s=;
 b=SvkfflPQeh70wZi/IBobvbNztSaZPG3B6EbeT1afu8qO7P79Weuf944hzm0xdbvdM2mSKmSz2krdSkcFyDsWmuEfabYU8Wv9eGWnC40mEIwUkzClzQbUeDsqryq6ZifTVDR9S9069ZyRLBBY7u/u/Z5pgAZASKenqlIKNa4JOo/4uEE0muW9qAHKpPFH1+1eJwYQOE3Kd4X/2keyvHdtWpEPxDbD0ktdbRUmCiuIuFD0p239wef8dYmrLfFFKbqy4+c1G8EHvzKu/sLmeMh275dZfN+gacv7YIdZ6p6p1mBvZocbhJ0oliZyy/CKo9SFwh1+M8VRP1T7+blWhot+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cAGxIi3lQlZovHYD6wmJzJ2mDiEEoF2dfH6yaVu25s=;
 b=IMZdx4tZ0cMqT/6RkEshasg4YOq/KMKOJaYKBAqSD3qoBJqO7FmGY4hjfLQ+B7KlR6EwfOnmhNdnbRl2V4GWjL0WNAaex3fwGHDWs6Xc41Nd9TlJ+5a+e8FVH6iTXVL7WrRxNyxtwKkbBeFuh2ADY70jbBQcbHaczaPQDuduf/0=
Received: from CH0PR03CA0359.namprd03.prod.outlook.com (2603:10b6:610:11a::19)
 by DS0PR10MB7319.namprd10.prod.outlook.com (2603:10b6:8:fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 19:11:13 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::4f) by CH0PR03CA0359.outlook.office365.com
 (2603:10b6:610:11a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 19:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 19:11:11 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 13:11:11 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 13:11:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 13:11:10 -0600
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RJB8lu1011804;
	Tue, 27 Jan 2026 13:11:08 -0600
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <stable@vger.kernel.org>
CC: <s-vadapalli@ti.com>, <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>,
	<dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>
Subject: [PATCH 6.12.y] dmaengine: ti: k3-udma: Enable second resource range for BCDMA and PKTDMA
Date: Wed, 28 Jan 2026 00:41:05 +0530
Message-ID: <20260127191105.1961020-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|DS0PR10MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 9047ceb4-4760-4970-16e2-08de5dd7d5bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xf9kUDxr+2ixO6xvDFC6D2krb84pgczWRHMw8yZDmvJssUOg5MFpS43WFKpS?=
 =?us-ascii?Q?R/fB6miGVr/omu/Yzs0onsCtumnvlaPEHfXjx75JCEJwXi6zx+YXYH14/U7H?=
 =?us-ascii?Q?Iw7skx6u9duDIDYONTrrWeEkhuoDNZqx4hDvwYqBtjFnn9dZjCjC8Hwfq6WO?=
 =?us-ascii?Q?hjiCpwbINTbTqdWzN0zQAsTmU1FMf/ULLRw+8wniQaADIyQb3rPIqrfRX/BS?=
 =?us-ascii?Q?wBxtwNUFZ+Bp1xQQnEQA/8mitA6rXDEvmW+jDSdjgbrUiXoqutbQxtPG5Lix?=
 =?us-ascii?Q?oT2HetxieH9Jx7x7u3i+XQIIDakAnHT/b2CapvmeAhEMr/4v+ZtlLx6thWT7?=
 =?us-ascii?Q?dOJ9iVjKdA4y65hFIGZu6apZ3/q9Zx9j5nNn5HaCsyklGT+D4Y3WY4x/4jit?=
 =?us-ascii?Q?FnDl1p1UPpgdQJORo1wjb/xvzhhR65nggoEx9EbZJmQIA/j3x2j9t3+2bzPg?=
 =?us-ascii?Q?odEkr+fZdJNPyzVqeM5vlr/mcRZLunFccAUu/QW8pSx2kRSO52OwWbGr4F4x?=
 =?us-ascii?Q?sRu4WGPnlGK5foqbdO/rHwJG0Te5t9A6UHY7QejQfQlZ+Ezjt8B9tbt2AJkG?=
 =?us-ascii?Q?I9e4NHNcArU5N5fgTW8HkqguHjT6u2A1oZSZ9dQjh+q6sQNasD85GJb6ZKBY?=
 =?us-ascii?Q?UenZQZJ8sxayAChziwLIlQIRm3NUCpsDapS1TOs0g+kZ7jJGrkBDNgYJp3d9?=
 =?us-ascii?Q?eCBieEOJg/PVxgRDsE3s6etfzcZzrzXEH2WK6PAtIdKjFRNMqjz4npv3qhD3?=
 =?us-ascii?Q?dG6LXKTqBTG2210OEfjzi7Iu03Z4vR+1nM7W67Y3jsf4xupeNPo/ewBa4FeR?=
 =?us-ascii?Q?bGIAwuziFn+3JZEFzCPATwlUL0xiG8OrzbqhSVADjoHUJ4NPHAKWlQ4g04ws?=
 =?us-ascii?Q?86D0UQUKetbn0BUGl7G7CXSFZ2Soe6kWMkoEfMhvj/+J36z7x2QlzK4OEEpM?=
 =?us-ascii?Q?N1+dKcchOhEsxOORK0ur/1t7y+KxzoX6R7a9aNGqLzIFPsF/GVgJOhQ4wmzX?=
 =?us-ascii?Q?LSA7hfm55/7aht3NujXonmu95pqX9Dx3MyEdxLBWV+39hWxZk9JcHPVZ6sEt?=
 =?us-ascii?Q?iMT0sSHaXU3viy3hQMl2UcUtZKskqxZ7gnYAYHS2M0wNo/qevfytHt+SGesG?=
 =?us-ascii?Q?aQ5Qh1qqYkbbzkPQvcGOqHhvU6psE5327pmHuAPoO0UkAe1tETk8+CoS/p5F?=
 =?us-ascii?Q?9LnNWk3ycWiuptXc4iGuzLl9+TIOxy6ds/TmLbi8wNw+8RqadVZcp1RCy9Kr?=
 =?us-ascii?Q?LIRLWH7P/JIDRtTT4S3J8GmhjZCxl1Acv8RTYYBHXBm/vNsidwDUwKczsiBG?=
 =?us-ascii?Q?PRrpmF5FCAK3l3rhDdmZeOpatL+KecYJ8ocK/ewdJ4st8mhaUeotf1RsNy+I?=
 =?us-ascii?Q?hcv1kdGfpNkAr6pzDXxe7oxOSdPgfLcDBn8CUwkhlnFsq9A5bggiteYP0cBB?=
 =?us-ascii?Q?9Kb27Tnaz/6E2U8CAxbzs2mS/AuA1CLxXrsQ2Mgk7P137M1X8dU50zoJrecG?=
 =?us-ascii?Q?VUM2Fe4eO+SL7rcxBRJ0K0u5Sw7fPrjsGft6URv3ym98912Woi/vRrAaZGDv?=
 =?us-ascii?Q?WIx1Qgj80/E9zaM4KBOWPHDefQGdR9flRD6/ZtymJKHdKGzJDE1ghMc4AAEp?=
 =?us-ascii?Q?f0/9FmHVCBQa1a663oEUG0pCLeVf24J5kLUhC9hDuzEfMMU+JzKZJiOjgYPl?=
 =?us-ascii?Q?GI/KTySSdts7WsbIUv/FzJwjg+I=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:11:11.7481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9047ceb4-4760-4970-16e2-08de5dd7d5bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_191121_314289_A3BB511D 
X-CRM114-Status: GOOD (  11.48  )
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

From: Siddharth Vadapalli <s-vadapalli@ti.com>

commit 566beb347eded7a860511164a7a163bc882dc4d0 upstream.

The SoC DMA resources for UDMA, BCDMA and PKTDMA can be described via a
combination of up to two resource ranges. The first resource range handles
the default partitioning wherein all resources belonging to that range are
allocated to a single entity and form a continuous range. For use-cases
where the resources are shared across multiple entities and require to be
described via discontinuous ranges, a second resource range is required.

Currently, udma_setup_resources() supports handling resources that belong
to the second range. Extend bcdma_setup_resources() and
pktdma_setup_resources() to support the same.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Link: https://lore.kernel.org/r/20250205121805.316792-1-s-vadapalli@ti.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---

Hi,

This patch is upstreamed at [1]. This is required for ethernet to be
functional on TI AM62P SoC.

Thanks,
Kartheek

[1] v6.14-rc1-24-g566beb347ede
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/dma/ti/k3-udma.c?id=566beb347eded7a860511164a7a163bc882dc4d0

 drivers/dma/ti/k3-udma.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 38b54719587cf..e877cd50898bc 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -4876,6 +4876,12 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 				irq_res.desc[i].start = rm_res->desc[i].start +
 							oes->bcdma_bchan_ring;
 				irq_res.desc[i].num = rm_res->desc[i].num;
+
+				if (rm_res->desc[i].num_sec) {
+					irq_res.desc[i].start_sec = rm_res->desc[i].start_sec +
+									oes->bcdma_bchan_ring;
+					irq_res.desc[i].num_sec = rm_res->desc[i].num_sec;
+				}
 			}
 		}
 	} else {
@@ -4899,6 +4905,15 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 				irq_res.desc[i + 1].start = rm_res->desc[j].start +
 							oes->bcdma_tchan_ring;
 				irq_res.desc[i + 1].num = rm_res->desc[j].num;
+
+				if (rm_res->desc[j].num_sec) {
+					irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
+									oes->bcdma_tchan_data;
+					irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
+					irq_res.desc[i + 1].start_sec = rm_res->desc[j].start_sec +
+									oes->bcdma_tchan_ring;
+					irq_res.desc[i + 1].num_sec = rm_res->desc[j].num_sec;
+				}
 			}
 		}
 	}
@@ -4919,6 +4934,15 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 				irq_res.desc[i + 1].start = rm_res->desc[j].start +
 							oes->bcdma_rchan_ring;
 				irq_res.desc[i + 1].num = rm_res->desc[j].num;
+
+				if (rm_res->desc[j].num_sec) {
+					irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
+									oes->bcdma_rchan_data;
+					irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
+					irq_res.desc[i + 1].start_sec = rm_res->desc[j].start_sec +
+									oes->bcdma_rchan_ring;
+					irq_res.desc[i + 1].num_sec = rm_res->desc[j].num_sec;
+				}
 			}
 		}
 	}
@@ -5053,6 +5077,12 @@ static int pktdma_setup_resources(struct udma_dev *ud)
 			irq_res.desc[i].start = rm_res->desc[i].start +
 						oes->pktdma_tchan_flow;
 			irq_res.desc[i].num = rm_res->desc[i].num;
+
+			if (rm_res->desc[i].num_sec) {
+				irq_res.desc[i].start_sec = rm_res->desc[i].start_sec +
+								oes->pktdma_tchan_flow;
+				irq_res.desc[i].num_sec = rm_res->desc[i].num_sec;
+			}
 		}
 	}
 	rm_res = tisci_rm->rm_ranges[RM_RANGE_RFLOW];
@@ -5064,6 +5094,12 @@ static int pktdma_setup_resources(struct udma_dev *ud)
 			irq_res.desc[i].start = rm_res->desc[j].start +
 						oes->pktdma_rchan_flow;
 			irq_res.desc[i].num = rm_res->desc[j].num;
+
+			if (rm_res->desc[j].num_sec) {
+				irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
+								oes->pktdma_rchan_flow;
+				irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
+			}
 		}
 	}
 	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, &irq_res);
-- 
2.34.1


