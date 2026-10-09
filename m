Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F620CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 05:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRorMg/vFN9ljRJuDn4ONEhsWjR1UHc2bgHoMYS49tQ=; b=m9Ov4t+mjZWBrqt6tkYMdOYwAy
	HCNLnkPv0NaEaBlITbA+gVemui1AYnIFEYNV2TnBSXFYnH6Fzqlm0oMlfutJr+STMPDpc5o6cIkiI
	VPGxPO9kNlf0c1u4L1vzfZRoHEDJNm/y/TMBfgKLlwoASVh5vliId6YiALL9yqgpYO4QwoIKDAeBx
	CuMpwyapBvvWAShPj463lBXSocZCKWzacwbVk8NqUeCOkvuR2ShcvYWrGOsHT4DMU5Zj6iuOxhfUR
	ub6g4IK8YBoIzR0bN3VJdn6X04TFsVwn+JZ62GPK+j+NikJzjL1+rANRXvBO9h2buCdbqx3rkXBKB
	CA95terQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF31K-00000005WgM-2VBX;
	Fri, 09 Oct 2026 05:19:50 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF31H-00000005Wcc-103D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 05:19:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjTnpOWYvjPdkWAE5vYAjmVWtNUXwKEh5dx8YXn/9NUv12dmpZ6XTuzwtNOMXyUwms0wAwF/EGxsFT2YpzCOrl+BX8Bn5+uWTqAuz+SiVcGqk0htIHc+rDd3LnzaLBkPfwHmfMdLkZFGdMACKOZGZZWHfoKQVL2YfcqgWktRZxwu7CL/NO+/kyzMWVo5CuqyKh5gHQOLWQA69tOfYo95B9jHT9Z6O0xfHuCJD/nhX+/ChF8RKsT8jWRrdFcyJHrbn3XyLJTRjQpmRX7GTN8cs4YvWLPD07UVH9O7/e8UbZAMvbIC6DdzkHFt564mO/GLCoon4eIXEu33pi/Olu1ruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRorMg/vFN9ljRJuDn4ONEhsWjR1UHc2bgHoMYS49tQ=;
 b=FEr8opv1d7CovxNTHlQrwwpMw3mKfQbL1qabptHtCAZhs4HD2h917u8RoYEiMfOOoVUdiKihDLVOmOV3d/hOeDDDxJdQW5XeyyBdvJtmcnPAiKtiIsdCKqfYLggqhXLArnqjF7YpBdu3pCWwqDLoY2UZfPNfI1vkrieNQqAU084xtEsLcfzjARMxXIJ0EHEtI6uhaJnSyS5JO8Zqj4vYtei7DPQd+hRbjZMUMcaDe140fEDjM5CPE3lXxzxg107XO+qbuKJHfEHbIfi06YJGQyoXMr+YDw9Y5/Ai8xeH8RYSA1BKQ93qsTqU8Fv7lF2uuuVVJk0BIV7JvKs74nJz4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0180.apcprd01.prod.exchangelabs.com
 (2603:1096:990:75::12) by TY1PPF4CBD9505D.apcprd06.prod.outlook.com
 (2603:1096:408::911) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 05:19:22 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:990:75:cafe::74) by JH0PR01CA0180.outlook.office365.com
 (2603:1096:990:75::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 05:19:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 05:19:21 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C6D0643B1083;
	Fri,  9 Oct 2026 13:18:46 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v2 0/6] dmaengine: arm-dma350: Add slave support and CIX Sky1 integration
Date: Fri,  9 Oct 2026 13:18:40 +0800
Message-ID: <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TY1PPF4CBD9505D:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d436d6b6-1e4f-470c-8396-08df25c4e01d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|7416014|6133799003|22082099003|18002099003|10067099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: 9gZiyoFDtwFZLmuMNDlUA/KiTGbm9hsyNdKuLl3ZdCf8jyY/kPZFmj1W4EW94U6WxfUISSnBxJvj3iFaC/nbihEuWbyYVcDFyCMobbwgzDA+dlAM11KY7RrV2aAFXrEYYYrU5vEZDreUtvMLz1mRNI9l7/o3NyKwPoRfDSFvUwIZ2gY5bKymXHk8CjPFLGg4RLw4v7bzaqaCYHMoorf7lwLn+XhHW/xpay7kN9CNM/lpsmCkLyI0UFQ0diBWikNilAaBTgkXAPUChXf+DrPXeZYAB8oM1e+IF/jATNbxBJFkq6Q8TPV5ww63ZDSpKmr3hUzvTmweDPU33dBpf9TXcBuF2VX2uf7qAmrHLy3/FuhSeWReq5i8YDn7PiBAThjpSIaFHcU/4MXwF+cnMdcbHuesm38wN9n/IJAG2M011sgDESHXYHfd6B5dgX3HBYyXjuMe5K7E8st1XLQSIcwfgW9pboZpsXo2cg5YEfIN8VDKfaPAvEJBGFosVOoalBKrTRyUvhWyRcZ42FJ+lDNQcD0zGgmpGVzEiq8tXgbZ7MZOT0ehNRD+LElqdcJ/e65mC1JHHjcqq7N+Q6RYOI8Vh/qxIMXUytrLxiMa9yukG2/uBNo+/R4JOc7rbl9823A7lsW/ywSa1pTaVtoyMjy08Re9OpZS3SrOrxnpSp5FPql/6LxChot3J1oIEWyK87AA
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(7416014)(6133799003)(22082099003)(18002099003)(10067099003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: X9/Zr3ex8/OwTEAnzbBJB3zlFHo0wFI9BsQmmAKd5y2p7qSqvbsoUD7NyyM3q7ehugWr9iGEf0Y+Og06d676K7nP1BMQaCmDbz03W0TRmvqC13Se4IqadQ5QsbF1VgEFOI06Oyw8Ypp6MgObebUav2GNljix1P+G9BnK8KtnmF8sCTGRQ1TM3q1fk0CXKwQfbrhWFiOKnke7uOw1bFLCoVhflrk20I7bj8JAPwpco43Nvtf/7060v05NoT8g+2kH1QpAehlSB1wmmG+30Iy1gv5KLmjeo3wefhsRSdnMRB20LvoeEHojG8615ReeNLtQjceHPScBSIWgyNzK5n1UyrzLChHbFA2pAzllxg2FtVQaEWFYJ9pXbNsHCqfIRiiL+OFCkcjMQboZRoIbfl0g1Wa0mQxILIbL6dRyYYpoplhpo0HLYYmDwtynDrpMn5ui
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 05:19:21.0009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d436d6b6-1e4f-470c-8396-08df25c4e01d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF4CBD9505D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_221947_392936_65A1FA48 
X-CRM114-Status: GOOD (  17.58  )
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

Hello,

This series adds slave transfer support to the Arm DMA-350 driver and
the CIX Sky1 SoC integration around it.

Patch 1 fixes the CH_CTRL_USESRCTRIGIN definition: the source trigger
enable bit is bit 25, not bit 26 (which is the destination trigger
enable bit). Unchanged since v1.

Patch 2 adds slave transfer support to the Arm DMA-350 driver:
scatter-gather and cyclic preparation, command-list allocation,
per-channel resource mapping and residue reporting. Slave transfers are
needed to serve peripheral requests, for example the audio FIFOs of the
CIX Sky1 audio subsystem.

Patch 3 is new in v2: it syncs the slave command list before starting a
transfer. The command list is mapped with dma_map_single(), so without
the sync a non-coherent DMA-350 may read stale command words and the
transfer stalls after the first command.

Patch 4 documents the CIX Sky1 DMA-350 integration in the arm,dma-350
binding: the Sky1 controller keeps the generic compatible and adds a
"cix,sky1-dma350" device compatible, with clocks, resets, interrupt
routing through a syscon phandle and an optional reserved memory pool
described on the controller node.

Patch 5 adds the matching driver support, which manages those resources;
slave resources are mapped with dma_map_resource() and translated by the
DMA API through the parent bus dma-ranges.

Patch 6 adds the two Sky1 instances (FCH and AUDSS) to the SoC
devicetree, each under a simple-bus node describing the bus integration.

Changes since v1:
- The wrapper node is gone. The Sky1 DMA-350 is described by a single
  device node with "cix,sky1-dma350", "arm,dma-350" and its real MMIO
  region, carrying the clock, reset and interrupt routing that v1 kept
  on the wrapper; the separate cix,sky1-dma350 binding and the wrapper
  driver are dropped. The integration and the block are one device, and
  the MMIO is unchanged. Thanks to Krzysztof Kozlowski and Conor Dooley
  for the review.
- The FCH and AUDSS DMA-350 masters sit behind SoC interconnect windows
  in a static DMA address domain, so their DMA view differs from the CPU
  physical view; the windows are fixed before Linux boots, so Linux
  cannot manage them as an interconnect. They are described with a
  generic "simple-bus" address-domain parent carrying the window
  "dma-ranges", not with a CIX DMA wrapper device: the parent has no
  device-specific or vendor wrapper compatible, only the generic
  "simple-bus" compatible, and no reg, clocks, resets or driver of its
  own. The OF DMA core builds dev->dma_range_map from that parent
  property and the DMA API applies it; the driver has no private
  translation. Same shape as the mainline Agilex5 and Marvell AC5 buses;
  patch 6 explains the hardware in detail.
- Patch 2 now allocates the command list with kmalloc()/dma_map_single()
  instead of dma_alloc_coherent(), because it is freed from the virt-dma
  tasklet where dma_free_coherent() may not be called; it picks a free
  trigger-capable channel in .of_xlate(); and it reads the link address
  registers in a retry loop, since the channel can step the link pointer
  between the two reads.
- Patch 3 is new, see above.
- Patch 5 merged the Sky1 integration into arm-dma350.c; slave resources
  are mapped with dma_map_resource() and translated by the DMA API
  through the parent bus dma-ranges.

The series is based on v7.3-rc1.

Testing:
- Built for arm64 with GCC 12.3, no new warnings; sparse clean;
  checkpatch --strict clean.
- dt_binding_check and dtbs_check pass for the new binding and nodes.
- Runtime-tested on a CIX Sky1 (Radxa Orion O6) board: both the FCH and
  the AUDSS DMA-350 instances probe and transfer data, and audio
  playback through the AUDSS DMA-350 runs without underruns.

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Jelly Jia (6):
  dmaengine: arm-dma350: Fix source trigger bit
  dmaengine: arm-dma350: Add slave and cyclic transfer support
  dmaengine: arm-dma350: Sync the slave command list before starting
  dt-bindings: dma: arm,dma-350: Document the CIX Sky1 integration
  dmaengine: arm-dma350: Add CIX Sky1 integration support
  arm64: dts: cix: Describe the Sky1 DMA-350 bus integration

 .../devicetree/bindings/dma/arm,dma-350.yaml  |  33 +-
 arch/arm64/boot/dts/cix/sky1.dtsi             |  66 +-
 drivers/dma/Kconfig                           |   4 +
 drivers/dma/arm-dma350.c                      | 717 +++++++++++++++++-
 4 files changed, 783 insertions(+), 37 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.54.0


