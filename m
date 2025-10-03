Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AEBCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=am+hsUgErgd200kjivB3NO7RzaMGrjBedtoBauAbvPQ=; b=WSbDoNnukmY+2yXJBaNAWmiSJA
	ydGKhs20pACopsdiFu/IEs1FQwLCvHiZilmeBzKnsKijdUv7THhxJKN9pHz7CSJ7jbBvwAJJn/EQB
	mQca4IDAptfJoU8GW0zY5Bj5hIuqrXkAzNxDuCVqRui0KDMeqVvOt5M1xAohyuhAYlypsfC8KH/3K
	Xj8a1m8wwgMotFdxJLXq5yOmC6qb4Pjrz0ZD3OLIUKyK7EZynIzGFUfMv/OR4QzCyIQvRSjTMgVze
	g8l2mcYw0Wn9gXNwlquaaibNc+sprSJE25Chfs8dupZO4m/hSbnlDtbP25ec9taQflVNlz+MSETMl
	RgF0ui2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Z8d-0000000BjDF-18mF;
	Fri, 03 Oct 2025 06:19:31 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Z8b-0000000BjBc-0Bg9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 06:19:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlxE/dfwKbA8kTiimaxs+DCsxbBNZtT+mCdAoIY4uLmEXCQOIA6YecgeuJb2ZuZpfc1bPmiG6OdIuNCgHCEkN/v/00hBktXx9uQr3XPO2DzXSNkS1AFgLxJMNeuGcqhUVb0tJ3ozJmoigrAQML/YsyoRK9mDVJJmlAp/vnG2BT6GnBzTArzY49TTyEev6ob9tQDGXfL+YygI8uIxuSYLvKr3nvytliQb7cVsy7n5PWKjediBl+zQEpq87FlBLzIAL6wivs0ckpTGmmeorLu+qZAz2Y660O3iMdpjN4tTDkC6pGLL8fakCp3Y6ZzdZLpJeBR8EAqkSKnnmLvlUgTtCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=am+hsUgErgd200kjivB3NO7RzaMGrjBedtoBauAbvPQ=;
 b=MJ3EbVsBqYTGInWHnsYnKGKbEFqqKcpj1wQpZkv+7Hezgor/zYhLQCZE1T4pwsqwNJGsDoNmw2lB3yw9A9nkAU3JV8UUJB2MLx1IuPBQPb3dCw6wGbvOSgEEBRUXjrx+RZGvACmk0MEM7qWVaayF8PiWFUI9FQhVMs+jVsnhmMOuOy/zD6m6mjhgm1K/F+PC7TzmUmWIF8xb/YMpQt4Xv8kIRXVrXFZzztol7HPiLaxdqs/YDmWe3nO0KKEpitFrJGzuvtkwshZC/jh5h9gJGVASfpn/C3AoHE9+b9xV97co5yQVRysvy+tRMm2UFPQCP66oDERDm3EKeyL38xjrCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=am+hsUgErgd200kjivB3NO7RzaMGrjBedtoBauAbvPQ=;
 b=YiHOr0ZXrdQU7YkJNFZzt8xkpxn+lLIkabsxT4a0lxNsJkIHrJ96rUsWDxPW88A2033wpzJKM48s0IgNY7KsvEvxIt2l1wWiayVuXIhgKa0ra7xym5GSPJKHqRKzg3OIGODufOESfUwPxcSZh3WyN/oB7WvvyKZd+gz0iOKrPMc=
Received: from BN9PR03CA0599.namprd03.prod.outlook.com (2603:10b6:408:10d::34)
 by DM4PR12MB7599.namprd12.prod.outlook.com (2603:10b6:8:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 06:19:21 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::92) by BN9PR03CA0599.outlook.office365.com
 (2603:10b6:408:10d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Fri,
 3 Oct 2025 06:19:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Fri, 3 Oct 2025 06:19:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 2 Oct
 2025 23:19:20 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 3 Oct
 2025 01:19:19 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Oct 2025 23:19:18 -0700
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2 3/3] dmaengine: xilinx_dma: Optimize control register write and channel start logic for AXIDMA and MCDMA in corresponding start_transfer()
Date: Fri, 3 Oct 2025 11:49:10 +0530
Message-ID: <20251003061910.471575-4-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251003061910.471575-1-suraj.gupta2@amd.com>
References: <20251003061910.471575-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: suraj.gupta2@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|DM4PR12MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c50b7f-4f00-4f80-6f40-08de0244ca2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/2s6BgnzxOE9VM7SlAe2pT/Ky19MFurVi9bJbARSHRM8Wmob6t5xBoLZ2Muv?=
 =?us-ascii?Q?Dns7RulRtqLYXbf0Jkn1HSLtPxVbiz3ZT8dpMzKD4r+vTcUgNwC19wuO1uIT?=
 =?us-ascii?Q?DO0BPPnZQusMkeibHNt1xoz/TzjbtPdX0J+d1Uo0HuQmTpfI6+H2FDLCEatd?=
 =?us-ascii?Q?pkWAqhMs+g72X3qVGzVxLg260+lE5kJdb4FFpkdkDWr/i7tH2PflypCKSlC2?=
 =?us-ascii?Q?Rr9QvhA88+nmAlno+7B6iwZsEb3ukSlXWI3nMKb3yNoZQH55ImyBxxCsqc62?=
 =?us-ascii?Q?R7mCC23NYl4kEx0bL7lJIQy8aydaNWWynSKzMgkjQI38KFJFUh8xz8+XJmvs?=
 =?us-ascii?Q?iNJmQDMIQQyQ89b5nRekhlTaDVsn7kQpx5emyHXD79/U5WNUD3SGB0jKdMl3?=
 =?us-ascii?Q?G5kMgEuSR1pLaXD3yVMeeYMyXM+NNTQEB3hFXXNtd5QhHQso5Bu9UlDRRiLS?=
 =?us-ascii?Q?qxM228RetmSF4PF1/xk4+gQi+rLcXa1i1DWOH4ZW8ONQfsqMGb3di18bURLa?=
 =?us-ascii?Q?zsTo/R2rKoBf2suqv/hXgKupNeUqGUTHJ76Rx0xRt62x/GqCwCMSTKGRQ3tG?=
 =?us-ascii?Q?NFVHLTCHb4tYoM1VeYmjW+MVBLSfbdfHFVAMf4KUoKq+xqnWgKyfgXYoLQIi?=
 =?us-ascii?Q?ZGYJmZHOEnVUL00glKc2F5SzbvXCvQIb4p/LbN8stGP8Qx7rYfpJNY6vFrE0?=
 =?us-ascii?Q?IP5pIQaLWcLh5nS2+m7HeqEUfKbBA/NO1fXMVjI1douWPwz93V9BqPmj7xF3?=
 =?us-ascii?Q?xbKzGUkHCWhlVBbrSN2P9rS0z7+WaMiTV6CWLOibJG1pTZwLNt7Q0tuCCTrZ?=
 =?us-ascii?Q?OhXj2CBnIPpazAnuHpH9uUWj0FDT8sZNdrQXPpV+H+pWTf767t/tIE0hwoRv?=
 =?us-ascii?Q?qpMczCKGl0/ja5VqMSyVmq+wc6EEMSf22Uez41diNuJ30Gp9ItA1OhxQ67I4?=
 =?us-ascii?Q?+EKHYXg3+pimC3ASucd0tUw/hZNzhB8PTBMrzjtS3Y0HuR2YeyUdKzaSkq0b?=
 =?us-ascii?Q?zFHm5tCCYvVANaex+aTx8EGtT3QVBpPHfVB8Ok2JS5SS/XRcIeGJtcZPPtwI?=
 =?us-ascii?Q?Ejo+v7nK/evO8LunJEWPGpFqPigD+imeQqYxlwPYvO05tmJFVcZFtvcA35AL?=
 =?us-ascii?Q?ybKbLy0Eq0nGP2c/YU8w1qsBqzSZBx7kIZYzKmXwuoiSARmPt+pZOcVPtQRU?=
 =?us-ascii?Q?kQXwA1SieiR0xJslBgzNum3qLFnt/4vZglw/wt49FLR6uOJ4TvnxBLKcFbn+?=
 =?us-ascii?Q?XVt9BBA8EKyBTX1d4uA8sJHfA0PAM6Cq/P58Z+lAzQ9U79RMio54Y+VNN9UE?=
 =?us-ascii?Q?6Fs6/JOKj+zvxwawgQmLEbhnKgOyzClwUY3pypDBWLWnLjva412YB4s59Fcv?=
 =?us-ascii?Q?ksXEcEP4o9l+POeXuD0y749psYMroeUihWQY7aemx0gFfqSl8M1y8bmmlVnG?=
 =?us-ascii?Q?OzKdoOJnhuNTt1Z6iTTEIalouCRh1SrVKfBPMQ5u+rtEW2joLSJjREFnw/en?=
 =?us-ascii?Q?r8/X1JbA9dfwY9yraevP2G96pgny4VVF+6W61U/35TsX3fzp7eGMo2mj7zod?=
 =?us-ascii?Q?1igU5cteVQ3EEPrP5oA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 06:19:20.5825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c50b7f-4f00-4f80-6f40-08de0244ca2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_231929_084484_637331AB 
X-CRM114-Status: GOOD (  11.49  )
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

Optimize AXI DMA control register programming by consolidating
coalesce count and delay configuration into a single register write.
Previously, the coalesce count was written separately from the delay
configuration, resulting in two register writes. Combine these into
one write operation to reduce bus overhead.
Additionally, avoid redundant channel starts in xilinx_dma_start_transfer()
and xilinx_mcdma_start_transfer() by only calling xilinx_dma_start() when
the channel is actually idle.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index aa6589e88c5c..a050b06e3b8d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1561,7 +1561,6 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 		reg &= ~XILINX_DMA_CR_COALESCE_MAX;
 		reg |= chan->desc_pendingcount <<
 				  XILINX_DMA_CR_COALESCE_SHIFT;
-		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
 	}
 
 	if (chan->has_sg && list_empty(&chan->active_list))
@@ -1571,7 +1570,8 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 	reg  |= chan->irq_delay << XILINX_DMA_CR_DELAY_SHIFT;
 	dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
 
-	xilinx_dma_start(chan);
+	if (chan->idle)
+		xilinx_dma_start(chan);
 
 	if (chan->err)
 		return;
@@ -1660,7 +1660,8 @@ static void xilinx_mcdma_start_transfer(struct xilinx_dma_chan *chan)
 	reg |= XILINX_MCDMA_CR_RUNSTOP_MASK;
 	dma_ctrl_write(chan, XILINX_MCDMA_CHAN_CR_OFFSET(chan->tdest), reg);
 
-	xilinx_dma_start(chan);
+	if (chan->idle)
+		xilinx_dma_start(chan);
 
 	if (chan->err)
 		return;
-- 
2.25.1


