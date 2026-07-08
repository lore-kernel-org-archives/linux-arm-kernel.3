Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B33C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QB+2f11Eb6q1uI7xdNKusMScdNEpoFlqkrdnKNkPhK0=; b=FpRbVgxzY6CzJWz+Wqnk+a49a4
	6aCOvHnNRTKu6pcLEkYz3uVejDoDYnzf2v2D7d00GfWOypcEGIe6HhOrcJxrgrjhlD7mldbUMeLSz
	ArV41+z5eEvY71GXvq/t4cRBlUuo/KcdS4xn59pDEcsFOgxQ4mcnIo6l34HaC5u+6T8V3WkizlFny
	jBGF9ASJ2+iaR2P1M4y60QOCIhum0i2bEsWtsR5ZQk7tKT2XfrtU+KdHW6XLafR8nQkjAQ5Rwonv+
	KWUMOrDRAaDlaDW/941K1cUAg2Ge6y/S3VwNECDdEKw38JOwtvzehmQh1XE4mAT3umvVT7MLeIi+0
	EvUujVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPDb-0000000GoTo-1Lq3;
	Wed, 08 Jul 2026 10:09:27 +0000
Received: from mail-eastusazon11012060.outbound.protection.outlook.com ([52.101.53.60] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPDX-0000000GoTE-30Co
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:09:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UT1VZpOKGVnTOPKUcuSXwiQVcmP0c9mnEv5A0vSHJFrr9ACdaruxHbiQjCanxR9YIjefaWvAOJeAcGynnNMlgPYf66/wJwi7io6CU4o6vPfUAP+4aBb0L7n2CljAzBSf0wuEYlCUc4mf75Sv5LsPQ5u1gaXKgzlB+k4GVsbk8V4PFJPQSQrepnHIoFjPa0ngMWStVVcQ1wV7vYicCXzLZwa3x08CA4VgrzLNJc+2ey9SZADVBPvQIgs++uRwfRc2rc/6tC00Zj/k9lFxfV6aFWyIGnEr0sYsPtKQZ+4IKczhb4Va0P53ilZSNm4EBv7tUQegJddWOxlvWyySo16EPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB+2f11Eb6q1uI7xdNKusMScdNEpoFlqkrdnKNkPhK0=;
 b=yfPfLFIlrAp5NTgQh79djESlEePqOnPs5I4K2RIqfENkjTf+ai6bMjjaEEV0GtW2I0nfcV+o1yVXIIo3AP9ujE34ajWSL2INbcjgP1JEj0rspV2nRObiPmfNlcSkat0KwLaTkfg8Vqx4sXs5eA+HFyOqU/1w9voF8lFEYbkx6TZTRWNunNjSl2vHu+RyS/fMNFIO+Ag+qLHDjE3hQnXi61vrv2Dk+SOqJ+5lZJliDbb+trN8WqKf/SyjGB4yVxW1K5TEqqI516fSGrVk7Z6UVot4G8ANfQmhYFhmXfyMQ+DJfYqrz7czqFOACYJZpm4LsiETEHydsP7aRTVvb403aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB+2f11Eb6q1uI7xdNKusMScdNEpoFlqkrdnKNkPhK0=;
 b=zv0G3aUszqmWTntxAcsGeAyb1aLVko9LSQVVTThp26GexTbpnaUUuAfYlrwMXLyZayZQQOGkMXLpri6ZbLT2MsXLfxcpcqL6qeQ6mmmrq5yQQVLKt2mm4mmRNNnI5SXVFSoregM+ZYav6rGpIYPPbJOux7X53mv19/JSjfyJxkk=
Received: from BLAPR03CA0046.namprd03.prod.outlook.com (2603:10b6:208:32d::21)
 by DM4PR12MB6135.namprd12.prod.outlook.com (2603:10b6:8:ac::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.10; Wed, 8 Jul 2026 10:09:14 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::a3) by BLAPR03CA0046.outlook.office365.com
 (2603:10b6:208:32d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 8
 Jul 2026 10:09:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 10:09:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 05:09:13 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 03:09:12 -0700
Received: from xhdsneeli41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 05:09:08 -0500
From: Srinivas Neeli <srinivas.neeli@amd.com>
To: Vinod Koul <vkoul@kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
CC: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Suraj Gupta
	<suraj.gupta2@amd.com>, Marek Vasut <marex@nabladev.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Alex Bereza <alex@bereza.email>, "Folker
 Schwesinger" <dev@folker-schwesinger.de>, <dmaengine@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>
Subject: [PATCH V3 0/4] dmaengine: xilinx_dma: MCDMA descriptor and metadata handling improvements
Date: Wed, 8 Jul 2026 15:36:48 +0530
Message-ID: <20260708100652.603074-1-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|DM4PR12MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a5747d-3828-4476-8726-08dedcd8f69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|7416014|376014|36860700016|6133799003|13003099007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Rxl5xCXdNgqKS6wx8+LAcwQL2WKuZ3B0/6xVDkIHkZDRf6sI560lF4J/eyDwn2qjvFQbKVqtqhosb6jSIhqy434ecOWWDnA1l8ngk8R/1ahupb0NqyjovqG3hTLuIEiisjrEbhit6U0slWHBnI2XoGaG4uQ5vkcnwzCjH9WH8yih7pMgcnWB7l9G+iHJ5LY2i5jMgjBiQl950ZfIZ3vDhl8/YRSgHJ64x40mwzhjs/wmst0cFKGhvjCg9FtpGu9tgKknwXCw6PS8cwXDZIJEnkgHYfBEa80hZ1BdP06sEFKn7b2dv5SQK696mUrNUO2VKvqIbN6OdA+XwAdx4fwn+wRPD3RsejyXmp7tBhubQrL7V6iMT0s7gTAbI8BnlrtIQVycmbqmfscd94P0pz/VTG+rhEF+rIG9jwDIShqw8t7bYHv6NdnfUapdTgjhnHTZ5lNjWSFchxBkzsGAic3cswOjHGkWyGwoIHN330KO7j2wt5LLJ52BHmM82qRi336oeTkggd5YZJNTc1OfP8fh0/Cchcv5h4RU/jXfmyzXkTRM5v0fv3IUM1/Lgvuqc4i3LR4to/vhqIzKTmwkvxNaKf7LM5SwPSrxuJRg+qEiIFgauTJcPbGN06XeV+zE+euER40Ipqpu9kBahb1yph1AhrhcbQqQw+aCZa85STtNW7N1Bcud9okBKR5utRdOoQMADbxZVAejp1KICZBnYdB4xA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(7416014)(376014)(36860700016)(6133799003)(13003099007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Jp/w6coiQMjlsBaL6mp66/V0CE9694wKF52zzgIcFH73Vxecg5vAFhM7+G7iHjSdswnGPwk1F9CdmbOiamHAeL75Z+MQrPRGTIB07W8GcOrccu2vhd83KK9+T5tPAxLLljjSX/hJ1B6xszdAFZNdgBKNtv7H4nS3jE+C5uUFYqcblTLWlCXhrEv27MDi7nCA5gH6p9bFahk6jBHEz4g8HAohaxKH3pTeHIW9VWQgwqNDzRzHYen3yzsVSJnpyZQxCwrJXCqPn4TRuPwQEL0v8of6wFJ8eNg/EE4scHbqBRD0/jeseBZHAgqcHTg5u7FIyNwZxSYhJ5jOYFj94qOruTmSTwrKJVWKSTrhy72UkYi+1Ch4qxv5KZJxW6XaSNJpOPUxbhqvKPeIdpDCW7eNy6OWX9V7IaEUGm4QEg9M84B3lVkTn6Y8gBjQoa9cT1gi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:09:14.1386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a5747d-3828-4476-8726-08dedcd8f69e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_030924_035678_685854FF 
X-CRM114-Status: GOOD (  10.04  )
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

This series improves the Xilinx AXI DMA and MCDMA driver's descriptor
handling and metadata reporting. It fixes direction-specific descriptor
field usage, ensures completion is based on the hardware completion bit
(important with interrupt coalescing), and extends metadata handling to
expose status and sideband fields alongside APP fields.

The axienet driver is updated to derive RX frame length from the standard
dmaengine residue mechanism rather than descriptor APP fields, making it
work on designs where the AXI4-Stream status/control interface is not
present.

Changes in V3:
 - Patch 1: Renamed subject, added static_assert for descriptor size,
   refactored residue calculation for clarity.
 - Patch 2: Added Fixes tag, expanded commit message explaining interrupt
   coalescing scenario, simplified completion check logic.
 - Patch 3: New patch - axienet now uses result->residue for RX length
   instead of APP metadata, removing dependency on status/control stream.
 - Patch 4: Complete rewrite - metadata pointer now starts at status field
   (index 0) exposing status/sideband to clients; uses EOF descriptor;
   removed 'chan' field from descriptor struct.
 - Dropped V2 patches 4/5 (dt-bindings) and 5/5 (xferred_bytes) as the
   approach changed to use standard residue mechanism.

Changes in V2:
 - Rebased on the AXI DMA binding YAML conversion.
 - Added xlnx,include-stscntrl-strm in the YAML binding.
 - Clarified cover letter to reflect metadata behavior with and without
   APP fields.
https://lore.kernel.org/all/20260309033444.3472359-1-abin.joseph@amd.com/

Srinivas Neeli (3):
  dmaengine: xilinx_dma: Fix MCDMA descriptor fields based on DMA
    direction
  dmaengine: xilinx_dma: Move descriptors to done list based on
    completion bit
  net: xilinx: axienet: Derive RX frame length from DMA residue

Suraj Gupta (1):
  dmaengine: xilinx_dma: Extend metadata handling for AXI DMA and MCDMA

 drivers/dma/xilinx/xilinx_dma.c               | 85 ++++++++++++++++---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 14 ++-
 2 files changed, 76 insertions(+), 23 deletions(-)

--
2.25.1


