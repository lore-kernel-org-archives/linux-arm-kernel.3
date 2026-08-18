Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52745C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 17:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cbeBPilujGV86oPM61ciNxlpRFgLZx2KdxNzXXvx6JU=; b=KVh1iX9q+CVSLpYWGD7iIdUGDE
	42xnmhE5a49aiZptH0Ifr+PpgVqhLKbLCKjTjq+iR+Y0pc4QUI3+uURmWBYLnP3T/NKqIGGN7+clu
	gylf8u2brbx6cjDiTsFri2USHtdxkNEUfFgtCdhP+/odi0Nj+h6RdbLBf1r0AiYUQvLWds6EA82LN
	MtVmK1ct9guO32dsmkiUlmSCGrjvc9l9FiH90R6VcVLf7p/he5/jwDpuQJJJY+5gYINUo0Sd0nsV2
	SGrJS8elum8hup+OpDaTwgW5OjGFqiu7LPC2GwmWvfrm2kjscPa9oqd1xG4eqD/3IpSqLry19WxhW
	HMt1ZXEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNtn-00000008SlE-3xVX;
	Tue, 18 Aug 2026 17:46:55 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNti-00000008Sip-17Mf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 17:46:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjvZSbUQzSHKvho17LKr/BXPhJ4P/KKNok0rpKVzQCXJDSeuKZASdFnakx2PGFshdsBfzfPMZiy/2BtNyQxh/eFF+Pa0r1LOh6JKkrDEdj+v9gV10ppb22kv8rMz7lLZdVWVPyy3d4uZaPeMCl6alBvxDPpRvrDDWqMXdH+i/SRBDVi6yMrfCP94jEvdpVpRMhU58OwdJjKa0H9Q25COQWoOA/znYBjmI4Xwp2ubWlvzYDmFwcXgo4pOpcPveaxy57I0iihwNUF1vVOloe4a46nHk4Yn6nrI/MeJAYDjTukSPiBp1Bl68xGlNEO/4lSJWnFokCBZNFD/OXmovti4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbeBPilujGV86oPM61ciNxlpRFgLZx2KdxNzXXvx6JU=;
 b=SfiL1iCtbt5+rsGeoE+219puWRaaIqd6wgU9S2B5dKbeNSofgL+YjvoLVd2XO5lk2tXDOTXW8cfKihI7b5CTrOD/lKwrt5VqzmvMNK0JZyD81R+k9Tw+GCqmTZDSmzYNNCevYQoC8kEolDGFJZJKZlJ/OIcnbOJcfi9k17/IExn/nDCtA660xxYN2kV9UrMXVXdO8dZLW4u1FXKaA3ho6YXL2e227CNUkzO6ZJEpjQQfCXIH/Vy0QvsFhxOVCtxhQgr56AM5bIDNEU31MGAJS/9SlYN8IUtBzost/z/LrO3Uk1pB7M8N/wXwFggJOgE8b+9jUE25e+P20mVl5Mvnbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbeBPilujGV86oPM61ciNxlpRFgLZx2KdxNzXXvx6JU=;
 b=la4quuiitqeaotOijUDHEGwkaeYr6yYETWNePt3R/uyOt/dDE+uI3mgjjqJJ0hCHWF2NwuZ+GfkT1a/0Ob2vcE0ZcNMBlEO1i2oGb96WE/KftvNbNg8g2gIXmrtjiX+Kg/UqBn+ZIluNvLhZ+RvEnUHzCe2WEsBdVYdLI9nyJKU=
Received: from BL1PR13CA0255.namprd13.prod.outlook.com (2603:10b6:208:2ba::20)
 by IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 17:46:39 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::50) by BL1PR13CA0255.outlook.office365.com
 (2603:10b6:208:2ba::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 17:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 17:46:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 12:46:15 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 12:41:57 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 12:41:52 -0500
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
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <srinivas.neeli@amd.com>
Subject: [PATCH V6 0/4] dmaengine: xilinx_dma: MCDMA descriptor and metadata handling improvements
Date: Tue, 18 Aug 2026 23:11:47 +0530
Message-ID: <20260818174151.1608971-1-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|IA1PR12MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: e93694fd-243e-4548-a3b8-08defd50a815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|82310400026|36860700016|18002099003|56012099006|13003099007|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: GSpBWsQeY67mwimlSYOulSAnauEPOLnimkfrTicxjeTWk/5ge1t4rqyEEz8PXIBZXQz7d7++ims+OLo7fjAyVLjzDzgMM4QcTYbDiuXygRakAyKAXXNeblsSNTC1EMtX6Mk2xB4zxBZhYQYv0mKsbjdXe342HOTK1gIA5yN00OcB5c+ahk44yt4WyjTtrvHyJ/BHf6A33Sf42NoD99NTxnD8l41gyRkIjg/6OYCvBm8HbAeRksSI3E5wUEKVRo5CSQUZsIkxCgU8saInp9iDHDABREP7HlI0+pQRgvK3B/rTYjxytOn6UZg5ikbz4dc1SLoe/FNT2RuQGOMzxfQO3Z7FSfdn68e9jjhRqOKZXPg8ZNcFgqoXukoFwhBZDVudQh97AkauDu0r6ARDgtGE3szytD7USh5H8DYrl0NGUL0B6Y3ofX/COij4u/AgDFfo3lr1wDcbIC2Ow1itOJnpcVVG7X9kfJTj1eftkGYl/pABLUIx8Ewfs6D4JG9qoF2gHR+KDRQi6ZGjmtBTaDN5+tBPR3U7ozWIqMlldGhSIUpjMz8WMWCTnu1gffOb8TZxaGKRC5M/FGRyjWAmpejWGTcDM51F/FdkTsm2Tem6li+D7Q7owukVuZuWyZ2QedCvRVko5RzqgEXUfJ/ILcgqiqQ65iSTACuB/Ps5d5GCrKKuYm1Tb3gMyziWeruYFqGrM0dzHWJickTR1TvrmX2YXg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099006)(13003099007)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qbn7fPBigjMX90ws8bQUc2eDVW+Nn7Jvb3NYUAF56jYzS0QY/udJKdmLMRLKEzcBQBVNejt92njWl3RRbuz5tFTlyhB/sgDyb2PnDFqy5dE4EeHQf1QiAZsVhsXoI9aqDZOcSEh40qZ606BFmamEfdZ2IUBVGNsqOAfTjV9UNvPEe7peLkKX/8GD3p0s5HGu0//8Wc1x0INTb/YnMaht9oNDp7JkZj7fE5b/k2t8q0AvSlURHAo+o5lDPf/KCfRtj6K8sk4RznAaJyRGw2+55GdMIIyX9y86ztsEG5M50VWd/owA2sxm5OKrz62wktEXDSGirJ994gax9vsF/EnETbje534u5AsgVk/1sms6FL7wpUMl1UWFVIMmAggfJAQ1cMguZKob9rwmvq0e8a2LUemuz6HJiwHU/dl4CKZUZx8CldnIv8JPKCztxnO/MD3F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 17:46:39.1950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e93694fd-243e-4548-a3b8-08defd50a815
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_104650_312617_28EE8F30 
X-CRM114-Status: GOOD (  10.97  )
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

Changes in V6:
- Patch4: Added Reviewed-by: Radhey Shyam Pandey

Changes in V5:
 - Patch 4: Take the metadata pointer from the SOP descriptor for TX and
   the EOF descriptor for RX, matching where the hardware reads and writes
   the fields (TX previously used the EOF descriptor). AXI DMA now exposes
   only the APP words (20 bytes) in both directions. AXI MCDMA exposes the
   control sideband, status and APP fields (28 bytes), with the sideband
   position differing between MM2S and S2MM. Reworked the kernel-doc index
   table and commit message accordingly.
 - Patches 1-3: No functional change.

Changes in V4:
 - Patch 1: Added Reviewed-by: Radhey Shyam Pandey.
 - Patch 2: Reworded commit message to reference the AXIDMA fix it mirrors;
   added Reviewed-by: Radhey Shyam Pandey.
 - Patch 3: Renamed subject to "...from residue in dmaengine path";
   condensed commit message; dropped Fixes tag.
 - Patch 4: Restructured get_metadata_ptr() so AXIDMA is the fall-through
   path (no WARN_ON_ONCE); rewrote the kernel-doc as an index table
   covering AXI DMA, MCDMA S2MM and MCDMA MM2S; condensed commit message.

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
  net: xilinx: axienet: Derive RX frame length from residue in dmaengine
    path

Suraj Gupta (1):
  dmaengine: xilinx_dma: Extend metadata handling for AXI DMA and MCDMA

 drivers/dma/xilinx/xilinx_dma.c               | 85 ++++++++++++++++---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 14 ++-
 2 files changed, 78 insertions(+), 21 deletions(-)

-- 
2.43.0


