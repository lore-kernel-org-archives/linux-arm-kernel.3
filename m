Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC23C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 19:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ghnXTUujMwe7QunMYY2cqp0o8bkLw94Sl4tRZOFUJQ=; b=rD3xfQ7Ih+BMcNR6HrOHxzhY1V
	vteKU+guiPxqqBVBoXUkWlWVYYdRvdjgjehMK2YcoiSZcwSf+ddpk9G+BcO4hm4GmDNy7jabQ9fc0
	Nd8d/GLpM00k4k9VGv6HMLQNiOuTDegCObElanh0ugb7DIzU076cijq2auA7xPNUFGzNsX5SRB9Gg
	AQLIIaf7k5rFsO7k1C4XEqbmAwl1Gb3GpM2NlNRV5SG2GFfjK2iU+3Dsh1u0vhzU5iK+on9bpzbhh
	wypaK9o+RQfzRtboqvyaCnEXVshR0asl1j67plU4Rww+bcTl/enhgdHJmOXIGohq+hVWWvZPXSPB3
	I+ew9Htg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNFc-0000000Df9k-0sYX;
	Tue, 05 Aug 2025 19:23:08 +0000
Received: from mail-dm6nam11on20611.outbound.protection.outlook.com ([2a01:111:f403:2415::611] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujND0-0000000DemM-0n8y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 19:20:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SY/byqbDyzcBrinQcy21QNAARWlLbZquXlALHL7v39uIexGYbHrfOUcOLFxKQ0kxdREIcHmqWclO2Xncp37vtlt8wohGHSEBp7+hzcXqMr+0a3IF85a9S1D8UVVyxYLSjo8NhKC8vjeh2fb7Ih+0jM5KuoUcy8mBNhTLlGXpmBR0D/jLkIw2YosfOAl11OcaNAwmRo7SfK7qJFsWLUnfej3MtZ0NVH1wPsWEAv4QvVFtBVeF6a2cTyFOObmrI/4eR8/xW2ZZ7HbMP27Q4eCFGKvAxLcJyqVuzKrLDRm1GxyLd5fKO9IxdMloA6zx1JekzwzIdjfMiArstbPkPLDtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ghnXTUujMwe7QunMYY2cqp0o8bkLw94Sl4tRZOFUJQ=;
 b=IM9BsgrFvo3NHhr1cXUzlGJWB0476FQUTESZfqsfrhSqj4j30nVoXDNw9iNsIkxBp7A+ayGFZiaqCxHyAa5q/TY48HE3Zk+XCNNZ7T7sQr6KloT25zAyqrMJN7lyQ6uNFLtAl8OmlQuRQ2lL5T6b13XIOkRAPrD8vXsWJp52YSQktAlJCVQJh9XbgXQKMeaLteQlTfusPC7rAKfN1TbvTBY2VM9I3Msv38OHppxnOUZMwtcIpGpSto+jUEvy9kVzXqoDNVyupRDxuJrUll4r6Mwo+9s2jVfPCtoMllJY4ODNml/4Fh7NCi4C8ykjn3Q0p28KbkClE3bOwr6mnU7DAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ghnXTUujMwe7QunMYY2cqp0o8bkLw94Sl4tRZOFUJQ=;
 b=ap8hZIuI+6raltjYEQ67aYFDH3DgG+9E832Nhq6i19tobVn3NAyGbZ52pGyIh+9quiZAEQLmAGahmav7sjez5+F4sb47iTLImNSTXm4cWp9PI0XhKp/cgZBJbzUGtiex7czJkUmAQgfQTjM0uTpIP5KPOjP3OmMNsA0Q3VaSm0k=
Received: from BLAPR03CA0180.namprd03.prod.outlook.com (2603:10b6:208:32f::10)
 by CH0PR12MB8551.namprd12.prod.outlook.com (2603:10b6:610:186::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 19:20:08 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::95) by BLAPR03CA0180.outlook.office365.com
 (2603:10b6:208:32f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.13 via Frontend Transport; Tue,
 5 Aug 2025 19:20:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 19:20:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 14:20:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 14:20:07 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 5 Aug 2025 14:20:04 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <michal.simek@amd.com>,
	<sean.anderson@linux.dev>, <radhey.shyam.pandey@amd.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
Subject: [PATCH net] net: xilinx: axienet: Increment Rx skb ring head pointer after BD is successfully allocated in dmaengine flow
Date: Wed, 6 Aug 2025 00:49:58 +0530
Message-ID: <20250805191958.412220-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|CH0PR12MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: e5118afd-ec5b-48d6-0abe-08ddd4551718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ANtDVkKiw8+o34Yqsz++fZ+6+fi7DpurWGTrUkQhy1sAbABw85BOfG5lvtrN?=
 =?us-ascii?Q?cSOlR9+3I8jafR0u7/2peAuGJyYuBC5TNCfym4VpWLfsHrH7i0emZTe01fCQ?=
 =?us-ascii?Q?sJtP03Dgx6Msx2YsfAHFgrDVEb+URyeQ4DV8K1327/eW0miiUurEoTBddliq?=
 =?us-ascii?Q?LXLVxYv1ApqnuiSMK20wcQmn8PDvIZqUfYlrqYlz8vI0LFpqJy5Mu+UIVSjh?=
 =?us-ascii?Q?X60juCdDpaz/CO1qbT77SngHGLCHGK1UxEfkJckxxulUJ5Xb3W300HkhFSZg?=
 =?us-ascii?Q?xxxM+nSJNZ0VdrLS+sO1LxVa5g6BXgpJJB6b8zpvXzRkLirG9+bvOBQbUi5W?=
 =?us-ascii?Q?jMTgc3SGDBQglxXK8tC2aMMk1RtJu5QXiuqEi6998YLqUp6EwjMioWIVaFOY?=
 =?us-ascii?Q?5nW7vo0xbNI1DcUtEVblwPjinxKPRm+9Qyllhm/bU1/0Q0qPZryFBgt5ft/8?=
 =?us-ascii?Q?VIXzX+vEdhPgR6zyzH14L0uaNXC5Aux0+hZW7UHlbWJYxqDciTHwMSi3fgHe?=
 =?us-ascii?Q?npOcpg43kkAQBsUMsxhw5LkS2d92+AsQYGbh9q3xMNKvrBrZhz/wr/YH1Bfu?=
 =?us-ascii?Q?Gr14NPx4XgyEQiRgNMgmhYfdZhqRn3PCI4IW6n/eng+SzxrN9ofR27lJBA3p?=
 =?us-ascii?Q?2Ikcp2CfiXFQwKIjvaoeJ5kJEgSTCveXjTBc5x20K0id/HX2vvwhwJ9qtlHI?=
 =?us-ascii?Q?HyME/PcSy/16u7Ivx+OoCNjIWESs7U/4G+QWcv2TrppxWpZpYmR4H+C0MtsV?=
 =?us-ascii?Q?1w57rpKyn9gBkcIuJEBSFvt5cdZ96nMm4tYe2GnHl14eJo0/u3flszR7p2ax?=
 =?us-ascii?Q?b4Vk4RsQ87cNJvZTO0eqSIsu7ownmk4NMfyQhAdy/XH4iDiDtEVIvkJI2tuN?=
 =?us-ascii?Q?BC9N4LiWHm9Z21UqT9C0oQ7eKZOW74CNeAusmgZysETO9OYmDfkLhDhA41v7?=
 =?us-ascii?Q?s+VyceMQwf4Qz5XbM2ti2klICTkgQSoFNjuKD/v5kntSMwLtzs/IOZRM9ZF1?=
 =?us-ascii?Q?lBGBj0el0ENuGzALNduT3JbUSaRrZHL5tMCCniP+EL8SknP2rAMAN/Aia7FV?=
 =?us-ascii?Q?pCozLliUQyQ27OL/E3dEgQdpG1W63cwPjj9cwP4Z1//Dhn1vL/wx3PISadId?=
 =?us-ascii?Q?HjS77o41HVHF6cp8ueYpBeAKJVzZmaqWdRle+WbYUdwmbYxpiRWrJRM8ZmVi?=
 =?us-ascii?Q?olcXr1+aFtRo1hwtUrBhv0/HS6Zw6CBYPUF9hpcvcGLrif8ufBid3nbOh9Fu?=
 =?us-ascii?Q?69y0pzZ5/todPOv01IX3KM3l2wEq7fedorHYsyO4tmnT5FxOcBJTqZc2NNyk?=
 =?us-ascii?Q?7kRmyMNL03smrDVnfYyexoL8Ot2c2vEO78RdmF9R+taNKl2gf9L+A1PDoLsN?=
 =?us-ascii?Q?MhseCKtjfY+JsWG/ykUK+fORA4xaO1GQ6NXxuHmhXo8CYdDRre0A1gOaN7Nz?=
 =?us-ascii?Q?tDgRWm5fslDDZ+4LGyExJA4rHs7AhX4uLBKAnHRkETBrhCGOep8c9HxvBOz5?=
 =?us-ascii?Q?W0xb3yZONFcHwLeQItw9vvAn7ZFAnwsn908P?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 19:20:08.0821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5118afd-ec5b-48d6-0abe-08ddd4551718
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_122026_223447_808F1A30 
X-CRM114-Status: GOOD (  12.06  )
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

In DMAengine flow, AXI DMA driver invokes callback before freeing BD in
irq handling path.
In Rx callback (axienet_dma_rx_cb()), axienet driver tries to allocate
new BD after processing skb.
This will be problematic if both AXI-DMA and AXI ethernet have same
BD count as all Rx BDs will be allocated initially and it won't be
able to allocate new one after Rx irq. Incrementing head pointer w/o
checking for BD allocation will result in garbage values in skb BD and
cause the below kernel crash:

Unable to handle kernel paging request at virtual address fffffffffffffffa
<snip>
Internal error: Oops: 0000000096000006 [#1]  SMP
pc : axienet_dma_rx_cb+0x78/0x150
lr : axienet_dma_rx_cb+0x78/0x150
 Call trace:
  axienet_dma_rx_cb+0x78/0x150 (P)
  xilinx_dma_do_tasklet+0xdc/0x290
  tasklet_action_common+0x12c/0x178
  tasklet_action+0x30/0x3c
  handle_softirqs+0xf8/0x230
<snip>

Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 6011d7eae0c7..acd5be60afec 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1457,7 +1457,6 @@ static void axienet_rx_submit_desc(struct net_device *ndev)
 	if (!skbuf_dma)
 		return;
 
-	lp->rx_ring_head++;
 	skb = netdev_alloc_skb(ndev, lp->max_frm_size);
 	if (!skb)
 		return;
@@ -1482,6 +1481,7 @@ static void axienet_rx_submit_desc(struct net_device *ndev)
 	skbuf_dma->desc = dma_rx_desc;
 	dma_rx_desc->callback_param = lp;
 	dma_rx_desc->callback_result = axienet_dma_rx_cb;
+	lp->rx_ring_head++;
 	dmaengine_submit(dma_rx_desc);
 
 	return;
-- 
2.25.1


