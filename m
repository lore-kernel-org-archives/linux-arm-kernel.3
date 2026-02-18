Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F6DE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2bIk2SZE0v6BlkSCPG/4zOqhTWUbSzk5lHezTF0ymE=; b=DCg2xUDumjtVUZZblWRRDREl7E
	BvdMSfjldxGsPMJtge+8Mo+62VpuaDT2p6b3KffXlU1iFWnFWhcoZ0qrkEGHC7MWYgrrd3BTPF2yY
	RHvMS1mPypf76DHfWg7b0G3tRBi2Owmuwj/Cu7urDpqYK/Chn3KLDg5Z9VfOmXdX/80kG9Tx7lCAW
	fDW7+ySmPEDII7nS1pNptzyVOqgsqvVFYtrPX+42LDQTatxlMsiUq109/wJKFIukuMoShY77cu+Kv
	D3yzOgK5C2tADUoZZskfYV7aCgPzSlauaViPBF0MofxDeUCVmWY3cpDAyouO6/SAwFot90/s20PUe
	ff61K4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseFQ-00000009ZuA-2Ldq;
	Wed, 18 Feb 2026 09:53:32 +0000
Received: from mail-northcentralusazon11010031.outbound.protection.outlook.com ([52.101.193.31] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseFM-00000009ZqO-1Ji2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:53:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfFX0ujX0Vsf2hPSECxDFYc2uq1VBX02rKqVCiuvhAKHmwbFf/20lP+BjSh899F4MYrXTEcGCCzHjOnwmARKSIcFwxokogyta8S5CF90LAL7f8iscKJv7sMZjxL5mLN20ADV4k9dsaXnzBbHpQw8vBGRYpmRcplOLbBbGDGlejOFpZTBiqQ0+mj8+puLb9HMmFPEY8tS83yp+NVHVINUjMCZh54VNsaqG/upS2h0TXWyO+fOZDByg1kZaNPeG97EPcUZ9Q5xjqxUuttdW6vKUbUTOOBReN3Ru265ekqYwZMFA7/0833nr5diGGWDXRmt6cQSa4jWOAR+DZs3AaTdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2bIk2SZE0v6BlkSCPG/4zOqhTWUbSzk5lHezTF0ymE=;
 b=HslDyygo3INRY3EJi4PuqmyzPi1mX5o7jX/DvSiGJF+BHI9/U2YhX9gnVpZSyCkVqWlBGJayPFYOrz+OQMxg9tK8JLa658iC+vaGe+JEGcGzSW9PyPLFRU2sQdu3peojoIszzWeX2Xh2+ZzxhChh1uKJzz0E8MwiKZkR7QIZvW/tuc61jIr3ClXBh1yEluuuTrPgejFv0Cs6l/9l2yiAKgpT9EExtvliLh1r6KL7OcANcsrPUmMOZJOnrc9jeKv1RUgUc7FpmOTiZhDPNyobi7a7gm3gfenMKNwIiC3CiuJ5x9bsHIr6QGCSQApLqXdzWxNrjGwGAyIGFSwpRtlKAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2bIk2SZE0v6BlkSCPG/4zOqhTWUbSzk5lHezTF0ymE=;
 b=HhmAK5WoS1fn9OAxyU0rZp+5KGwT5H+AvwFYSpd4U9ZCVUV6K4vSiUojb1+whP7wrkYCMOf22qSw0FjvUITAsPBp/oUm0b3bJNamW3NZiPagppnI9DDsPRa2ZxAR2Z+WqZiJ0EOFQZJVs4sgFy3k++RGp28l2KJ2060gBLTfU8c=
Received: from DS0PR17CA0024.namprd17.prod.outlook.com (2603:10b6:8:191::29)
 by BY5PR10MB4130.namprd10.prod.outlook.com (2603:10b6:a03:201::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 09:53:23 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::88) by DS0PR17CA0024.outlook.office365.com
 (2603:10b6:8:191::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 09:53:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 09:53:21 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:53:21 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:53:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 03:53:20 -0600
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I9qpIC200561;
	Wed, 18 Feb 2026 03:53:16 -0600
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
	<ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
	<Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v5 05/18] dmaengine: ti: k3-udma: move ring management functions to k3-udma-common.c
Date: Wed, 18 Feb 2026 15:22:30 +0530
Message-ID: <20260218095243.2832115-6-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218095243.2832115-1-s-adivi@ti.com>
References: <20260218095243.2832115-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|BY5PR10MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: 31de0fb4-7f0d-45cb-b7ce-08de6ed38d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ci9ht3aS7wWNwSO3nTy5ec8AQl38KKJT2ODsEDYWWAUeAObH+SaTJYtYMloU?=
 =?us-ascii?Q?kf1Zv81LgBw+YUzPwBMpoZLZEWx71/uAptjGMXYhilyQc86Sz09DNu6vVthP?=
 =?us-ascii?Q?o+dyFRxn8DJnAXG1BzxfgQJENVojPaY5DJtv3Eni/3TJ03NbR9VZ5naicDDK?=
 =?us-ascii?Q?og8mr+RF61c0xQoTxbW/fL6J0+Yr6WU1+lhaTP2ip8r8PdHHfbUINqqMDGwT?=
 =?us-ascii?Q?u2KR6LLEgRzt+fISBBoV1ll82/T18vsVPd3fEDr2yVwY1fDErgE3TEypP6SG?=
 =?us-ascii?Q?wrC5e8LlmPQxxRdKERyX2KJhQ7ofNjnPaunoZ/isSEyrN5v4WC9kVX2BKYKO?=
 =?us-ascii?Q?RP/gW4C6dXnOuh1JtqheJJHrpsBfeodOmL60CwHKRmbPpJAdzzK3ocgZXlCQ?=
 =?us-ascii?Q?p4HHg8u0nhkkyq++39gvXmWvW5Kh4/dBcLNroDIWG4ed5UeknjBoF3twgL98?=
 =?us-ascii?Q?RG4Fd+HEMB7LR9PJX4vqD0GED4uRNGzDpt5SFPByyF8s+6TBy13fzv/qRifp?=
 =?us-ascii?Q?IKzm7mSzTHMHe8pBVpyZVYxkfp2NOqGKu+utN2Dr4AhNr1mg3XevwrAL+yTc?=
 =?us-ascii?Q?XXjK/WZwbBKi3VjQxnv7NvWlIhagLq3OLv16LFPnCd4AJnsYZUzJAI2XBp7O?=
 =?us-ascii?Q?reVfFQ0LyhY3yH4117y6pNATRlz3+Qqb+ckt+YnIbN07Fg/setV7X5QNbq0N?=
 =?us-ascii?Q?WNnqUmeKNgIQEW0HU61LeT+PohPd3zhKz6uJLn/dchaLqvbVNdAdeqi+m5ai?=
 =?us-ascii?Q?raTZrhUd1ryaDlmwL6D+uRLn+xB29iFGO8p+m163E952gu8vnxV8vW6eY0pg?=
 =?us-ascii?Q?tfsGJVPwLPlOgbEU/zt2X1Ba7PaGmYJZ7gpWqHKh1SfZ7tObkPDqKyPRoZdq?=
 =?us-ascii?Q?dACjQWZc3kmDI4964PT72NOkm6bhrE8IEz544tLKR1QN3SJ44vSv7LEDBcC/?=
 =?us-ascii?Q?x6ZzKBWBm7cXcPEHhvm5wNDwpiyBAIQ6pojZW35aorh38YNR6GnfbXZzwDPk?=
 =?us-ascii?Q?9RfkSuwsmFzU6i+TgVBWall3W8OLvodDdDrVvikDazifbAt0AdMM4De7BuJs?=
 =?us-ascii?Q?NR6NCkJsofBsQ9O7M7yFREixwbZOdOaZINjuXY2k0yJoOIzKZvYdCLcdKGlX?=
 =?us-ascii?Q?fEn4IlGIFa4LnAXtSsQK9CA3ZwVXHTUwpz1+w+OpyAHT2/y9MJqQR6UDRrAi?=
 =?us-ascii?Q?O2seoBHdmEEVtUjKHbQP9NvNmhtbU3crj1zFGIHpSS975RgfJ6oxGVtUXYtE?=
 =?us-ascii?Q?4bvsfKqVsvUcWh4SZIxAJmVCj2URVFlt2K7QJ1hG8fJqjtKPBArM5I+2rQka?=
 =?us-ascii?Q?KAzj50JkMW9L1r56gOsGOq/piq69F7zoyuhQlJjsX3UUR23J99NOk4t6u+94?=
 =?us-ascii?Q?mD6nbZ3PeGkLRRBAa7U82jdMHuTrIctZ+EoOXTPQvSeeqSYcMeb4n/WoM9Ps?=
 =?us-ascii?Q?wFonsCkOGtpagnL9IY7hGBtNxQ/35waRoVvN1y0UNnmSVSrA15xjBI19JkI2?=
 =?us-ascii?Q?Q0Y94q/MLZXhXyU1evlJPg3Qgz609fREVsITfqhulamzFk/Rcvmc8gWKyzT5?=
 =?us-ascii?Q?l4eawgvl5NbnIMGEAF/hW92x05t7ACzjzBmDbPxNx2Qo5g3/JXDJ1J3yAd0h?=
 =?us-ascii?Q?3bKPNRnIMgHMGoiPuiuoj9CTIuBaWJlCqIoQ9/PfMRlLMWoMRfG8mGfZUrdP?=
 =?us-ascii?Q?m4Ola29J1lCVv7IZ8t9z1qFjse8=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jRhnQdIp+dcm8LLsz1CFPwgOOnIm/n55wU7iUYwI4MmfAs8MgfFPlyBC/FhU3+PSQbnY2lfYlXl4UU1d55sLvnP6rZ04/pBucdIzhIESfcZ3b9VtmPQM5NjxZpjiJOQ5rU0SiH/uxiG2gLqAjmlBSl7QR/lzHOC+hY6JgMB8uHbBrIIEkaRTZjBKz4fs88R8J3eaR4vabJioXTckIEY2tYkSd3c0uhCO5sE/uJagTKVC2Gg9FZ/pn8YjeVXmrjWw5S4++hP2vW2bWeyFwNUocjxRbXEo286NGNoRVvetMnvTphYXCSfQGHueaOG/i1nIj6cIA1nPc7ipTPvpZAf6ZzmOd8XH6wNN0BVlIbI8ckI49aiP5qpgi38JrkT6XhY55dC36wO6LYT+E1B3JNfF7lMjmk+AUCJpQ8b9cdVOKFof6zhqErlIe8QkZuy4S8Dy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:53:21.6834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31de0fb4-7f0d-45cb-b7ce-08de6ed38d1d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_015328_377412_663BD294 
X-CRM114-Status: GOOD (  15.93  )
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

Relocate the ring management functions such as push, pop, and reset
from k3-udma.c to k3-udma-common.c file. These operations are
common across multiple K3 UDMA variants and will be reused by
future implementations like K3 UDMA v2.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 103 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 100 -------------------------------
 drivers/dma/ti/k3-udma.h        |   4 ++
 3 files changed, 107 insertions(+), 100 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 9cb35759c70bb..4dcf986f84d87 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -1239,5 +1239,108 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 }
 EXPORT_SYMBOL_GPL(udma_desc_pre_callback);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx)
+{
+	struct udma_desc *d = uc->desc;
+	struct k3_ring *ring = NULL;
+	dma_addr_t paddr;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->fd_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->t_ring;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
+	if (idx == -1) {
+		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
+	} else {
+		paddr = udma_curr_cppi5_desc_paddr(d, idx);
+
+		wmb(); /* Ensure that writes are not moved over this point */
+	}
+
+	return k3_ringacc_ring_push(ring, &paddr);
+}
+EXPORT_SYMBOL_GPL(udma_push_to_ring);
+
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
+{
+	struct k3_ring *ring = NULL;
+	int ret;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->r_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->tc_ring;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	ret = k3_ringacc_ring_pop(ring, addr);
+	if (ret)
+		return ret;
+
+	rmb(); /* Ensure that reads are not moved before this point */
+
+	/* Teardown completion */
+	if (cppi5_desc_is_tdcm(*addr))
+		return 0;
+
+	/* Check for flush descriptor */
+	if (udma_desc_is_rx_flush(uc, *addr))
+		return -ENOENT;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_pop_from_ring);
+
+void udma_reset_rings(struct udma_chan *uc)
+{
+	struct k3_ring *ring1 = NULL;
+	struct k3_ring *ring2 = NULL;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		if (uc->rchan) {
+			ring1 = uc->rflow->fd_ring;
+			ring2 = uc->rflow->r_ring;
+		}
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		if (uc->tchan) {
+			ring1 = uc->tchan->t_ring;
+			ring2 = uc->tchan->tc_ring;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (ring1)
+		k3_ringacc_ring_reset_dma(ring1,
+					  k3_ringacc_ring_get_occ(ring1));
+	if (ring2)
+		k3_ringacc_ring_reset(ring2);
+
+	/* make sure we are not leaking memory by stalled descriptor */
+	if (uc->terminated_desc) {
+		udma_desc_free(&uc->terminated_desc->vd);
+		uc->terminated_desc = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_reset_rings);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 0a1291829611f..214a1ca1e1776 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -174,106 +174,6 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
 	return false;
 }
 
-static int udma_push_to_ring(struct udma_chan *uc, int idx)
-{
-	struct udma_desc *d = uc->desc;
-	struct k3_ring *ring = NULL;
-	dma_addr_t paddr;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->fd_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->t_ring;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
-	if (idx == -1) {
-		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
-	} else {
-		paddr = udma_curr_cppi5_desc_paddr(d, idx);
-
-		wmb(); /* Ensure that writes are not moved over this point */
-	}
-
-	return k3_ringacc_ring_push(ring, &paddr);
-}
-
-static int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
-{
-	struct k3_ring *ring = NULL;
-	int ret;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->r_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->tc_ring;
-		break;
-	default:
-		return -ENOENT;
-	}
-
-	ret = k3_ringacc_ring_pop(ring, addr);
-	if (ret)
-		return ret;
-
-	rmb(); /* Ensure that reads are not moved before this point */
-
-	/* Teardown completion */
-	if (cppi5_desc_is_tdcm(*addr))
-		return 0;
-
-	/* Check for flush descriptor */
-	if (udma_desc_is_rx_flush(uc, *addr))
-		return -ENOENT;
-
-	return 0;
-}
-
-static void udma_reset_rings(struct udma_chan *uc)
-{
-	struct k3_ring *ring1 = NULL;
-	struct k3_ring *ring2 = NULL;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		if (uc->rchan) {
-			ring1 = uc->rflow->fd_ring;
-			ring2 = uc->rflow->r_ring;
-		}
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		if (uc->tchan) {
-			ring1 = uc->tchan->t_ring;
-			ring2 = uc->tchan->tc_ring;
-		}
-		break;
-	default:
-		break;
-	}
-
-	if (ring1)
-		k3_ringacc_ring_reset_dma(ring1,
-					  k3_ringacc_ring_get_occ(ring1));
-	if (ring2)
-		k3_ringacc_ring_reset(ring2);
-
-	/* make sure we are not leaking memory by stalled descriptor */
-	if (uc->terminated_desc) {
-		udma_desc_free(&uc->terminated_desc->vd);
-		uc->terminated_desc = NULL;
-	}
-}
-
 static void udma_decrement_byte_counters(struct udma_chan *uc, u32 val)
 {
 	if (uc->desc->dir == DMA_DEV_TO_MEM) {
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 7c807bd9e178b..4c6e5b946d5cf 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -610,6 +610,10 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 			    struct virt_dma_desc *vd,
 			    struct dmaengine_result *result);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx);
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
+void udma_reset_rings(struct udma_chan *uc);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.34.1


