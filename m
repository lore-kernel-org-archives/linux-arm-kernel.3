Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BB3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07fjk4okce04G2lK1vLBZK4H5aSeTLpYRU17MwIojbM=; b=2WxuMfQ3LrSvI6ld69j5vDREU3
	4ZeJJubcTMNdPqWUP69/jJSqF2O1vgTNmST+tlJdX6E3ZNCJn5oJYmn0tjY5uHkWsRs4WHvk0pieL
	HifB67g2w2oN/9bVfnVCHgrC/vm0hcCzlKl4pS+ESODWOCSGjQdcQE9jaHjzfu2LZnTdu29Xw9KKD
	jCYhA278ONI0AQXRFVfZsfGyd0N6rhjmAiu4s0Ub83mHf3kTaNdTvPB0yfeOd8YYkoMVLiBLS8C//
	YNSYCxFx0z5rmwR2YhtAONY7NhdcSPLPlLO6VQK26CX1MVqH7Whc52bp0nVHV8WSNx+Tobq5kFSKI
	Fhd/4Abg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysKk-0000000BkvV-3rc2;
	Wed, 17 Sep 2025 13:36:30 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysKi-0000000BksC-0te6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 13:36:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vj4qxsSC+9gPK3rv+z1DqdDFe1bk6hXW9IYiZ86NFf2OJN54c1le29NDAsCwkOsnWQQctK1ugWVy25r9+xLkvvwkiC6ebsoLkCNPv8q2Gi/FbL8FZJ6rY8fm+nlK+NMlqluL8ZY1MVtoNKLevoinMJVlIpONt9xjYsUiOZrKS6zceoAo5QmUaqmDEU19lBOrDzTYmbrrC1tONPmJhxU1PCJf+siWMO0+xMnDk1FBtcnuZRdEUwzekIHQj2pUbFXCb/Ke+goRD2+nbj52MDpyLoR8roMpkPECuVyPDnWmV3jDrDRFJ8Smqd/gKl6oUZNRRVOjeFhUY8t3mWJ0HszObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07fjk4okce04G2lK1vLBZK4H5aSeTLpYRU17MwIojbM=;
 b=MNt2ho+f3xWdwaDSam/K5EZkyFpxKGj4IqlVcOe2hHRGqK7VWVhczwcxo8QIhVexY8eEXb38b4TtnFnw0LorkV7Nz5jXgfuSyDZGpzNfpWxBzIcignSOUCh8DLEY2J8vMVC6nK3wAtniNfpyTQp/n1JI1hK7Ok18dW0nYFvng9sQRjLQwvtiNeEyNqMkUYK6YVYpBypj2IS8aOv+whzSgvEz5to4qim6CVagAY6TEhnCMM290p6k0ewbbdLsSaS6C4f6O7A3GKwxm8Tl0fRg9JRG79/qiTD5uNNaSTfWkiRDC/XxPK49v4CEI3UOq+IhnXCMFSw19ZrhU/xawzXTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07fjk4okce04G2lK1vLBZK4H5aSeTLpYRU17MwIojbM=;
 b=iZfSN1afahXVyNgIsAZGwpwszjtmNWyEzFKWulw0lLSLCz7lBX7mGeR8+TBDu77g+gn4W0cZPDoVLYU3AVkaNhuZHv22j1JxsV7k/HRiYw+krv7TIW3DazkYt7fI/EQLp/nsgrygrkkr2mfRlU/V81oNy0zOWtL9j+nnhSfQKxw=
Received: from BN9PR03CA0508.namprd03.prod.outlook.com (2603:10b6:408:130::33)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 13:36:19 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::c6) by BN9PR03CA0508.outlook.office365.com
 (2603:10b6:408:130::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Wed,
 17 Sep 2025 13:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 13:36:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 17 Sep
 2025 06:36:18 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Sep
 2025 08:36:18 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Sep 2025 06:36:15 -0700
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] dmaengine: xilinx_dma: Enable transfer chaining by removing idle restriction
Date: Wed, 17 Sep 2025 19:06:08 +0530
Message-ID: <20250917133609.231316-3-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250917133609.231316-1-suraj.gupta2@amd.com>
References: <20250917133609.231316-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|DM4PR12MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: f547864f-0dc7-43d2-4461-08ddf5ef2f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hM9Q9rmCysEprjZqXlFPRu0r4QpztWnvlriy3XYLGVjBk3a7PzinL1P9ZtVY?=
 =?us-ascii?Q?lBW0zizySKShqagN3Y1RIbYvbjg3WfMRvGnARKV8WCLteigN8DS1DevyFz3/?=
 =?us-ascii?Q?f8T7QlLQxlYvgakHtPddFSkEHVwCHcURTZmItP0HiuNw3nzmtJHdKVkMiuDA?=
 =?us-ascii?Q?lv4rCLu+M/XgdxzXbk+5KWR0UvUDbzY++5jrbJf0B3dT0Fh5iP8yVaDN2OFh?=
 =?us-ascii?Q?0Sor9ajASUzY8+RESvDZpEH3O+Uo5Q9p/9dk43zZQZXhoz5gzAufWZjBjthM?=
 =?us-ascii?Q?FyPMuwi8aIH5vxwKAfb0JTTCUNdxZvnKnIzaB0DHAFaz3bsTCqE421ROUNkN?=
 =?us-ascii?Q?1eNiQJKm99XY5g8jIpoma0SomD2rYJ6e1H6H85HzforQxOjWnfOCYoc90PCy?=
 =?us-ascii?Q?9NLTJOjYD9lTUhQvrRHLCQAoIl8LjNaL4JDYlfuJhaEIwUo72J8OI4yhXwNe?=
 =?us-ascii?Q?W0LlNuoJ+tGg08U560Gl03SgVjECTMmI/DS6/BPLTpmA9g4ZuF/igTDah0Sc?=
 =?us-ascii?Q?0OoM9bHRgOkjG/i8p+i8sw54Qc2v9d1+BTJ7cIrebb7m1/Y+6ZmqqamkuEEW?=
 =?us-ascii?Q?NFVP41wrI/NzhBqQqdyqeFqzOxJ3ceNPzngwmP0zNIaJNSsLH/Vgqa1ufGIW?=
 =?us-ascii?Q?dqw4eewxLpQRFn3qAv2bGRbbCWdCKMPyOe1iy1wrRat+8dJGPnOHDvxrk76q?=
 =?us-ascii?Q?+tQ3MoHm6cii0j3Kt6JGeRVoJAMBIwhNmLWqqKQgV2dGAmSsAQslgOszMK+g?=
 =?us-ascii?Q?ECs+CApT4NUUjGoqtYL+LUIYlIo0KPHTHI8ZlTbJKRLUqwzi6noSxcv56g/h?=
 =?us-ascii?Q?vvWjiZtKZbi76XgJtIbLqebyKO/sv09XGhYr8KMVyMiLHwwG4zK/7n7KTm8E?=
 =?us-ascii?Q?k8Mz2YYF2b45pdzztK9bED1oFhwhj1/SX5r6rpvn5lkoSnu5mTR21iuALImD?=
 =?us-ascii?Q?JVh6x30Xwf5OBwqgf/fmt/Pe0CizpbK9edpOMYLi4Iiffhu86bIb/k1fmgRr?=
 =?us-ascii?Q?7K427t1T92lnupTu9/AVp2uYRnhJ29IBerAhCN5naT+3t1VOFQMBE3Zv/tq6?=
 =?us-ascii?Q?2A/2E/iUxksoarBSt1ybcKOdWP5p0MEYv/VPXYe+9Ulodbt0r1Xt48P/S+WS?=
 =?us-ascii?Q?i1S4NyrhQ6GAalq4HFculVSSKvRTCGGu22dqYXXWtgy1nELDqcAImICOC36B?=
 =?us-ascii?Q?ut6M0RtYP504N6RlmM7mhhaDTSKfOIp7H/CrtaToNShqHflxVIlObsiCP87p?=
 =?us-ascii?Q?m/oVcGT8TQQbMJYqIP6q3ULMK8P+RXeJzCTOewS6UcqjCx/hdPfKNWoleKxJ?=
 =?us-ascii?Q?+jENYH4vG003l1bJVFVQXLQIBhZRBu32+pPtR2vK3km/otT3xJY1OwwFXTgJ?=
 =?us-ascii?Q?mFg0Ii1acc7SZhcoWUSPrf5HgTEuwo+SKyAceiOU6AGGF4/0HC+PetutDqyL?=
 =?us-ascii?Q?B6Y5h0X5Gcwbu6XX0Z5X+isg9ri7LFsiOHUQVL4JBpll0ACvmrEinZYWZOHw?=
 =?us-ascii?Q?pRGxVTZnR8YPKnAN58+tYz5zUIhQc5ctvHvh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:36:19.3324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f547864f-0dc7-43d2-4461-08ddf5ef2f2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_063628_260294_C9ACCE59 
X-CRM114-Status: GOOD (  13.00  )
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

Remove the restrictive idle check in xilinx_dma_start_transfer() that
prevented new transfers from being queued when the channel was busy.
Additionally, only update the CURDESC register when the active list
is empty to avoid interfering with transfers already in progress.
When the active list contains transfers, the hardware tail pointer
extension mechanism handles chaining automatically.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 9f416eae33d0..7211c394cdca 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1548,9 +1548,6 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 	if (list_empty(&chan->pending_list))
 		return;
 
-	if (!chan->idle)
-		return;
-
 	head_desc = list_first_entry(&chan->pending_list,
 				     struct xilinx_dma_tx_descriptor, node);
 	tail_desc = list_last_entry(&chan->pending_list,
@@ -1567,7 +1564,7 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
 	}
 
-	if (chan->has_sg)
+	if (chan->has_sg && list_empty(&chan->active_list))
 		xilinx_write(chan, XILINX_DMA_REG_CURDESC,
 			     head_desc->async_tx.phys);
 	reg  &= ~XILINX_DMA_CR_DELAY_MAX;
-- 
2.25.1


