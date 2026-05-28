Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0149CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YyTH/jZ3nb20n4lCAat/Fkstz7mTnvTpgfbyFXKTPns=; b=cM0kc5iDTEvZyBN0KU2Ls13Kpg
	R+/XGXUz7S2Gr0ospu+w2vJsjdHDc/6xhatx4VuXHuWR3vIjJajJlLdt5aQjE11sMxpCLc2nReXXs
	IBx9wZwQp5O4Y0NCUj0mzeujwOVWcGxw8ND3L5Rf3pyXiIRlslJZuBl1c2LzRC07CzGAOTI2VmUQk
	eLRtMvI3mcz98vuX+S1SPvrF1yB28p7ygSgowU1HI3id41z4k76wlDqilY9S+okkSKzBBZmXexxR3
	wp5bIyD/S58Q07/Z+VpkV9OyjbQ9gCq9ttFI55TxDINHP/teicIpPUWn3Ysx/R0B58f03ViSKtQnK
	XpLZZayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVfK-00000005Jmm-3CwE;
	Thu, 28 May 2026 08:00:30 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVfH-00000005JkU-3zIF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:00:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hj6ZUeuK2e0BrnPz7ZAbtw9N9Lva+2MsXHk8tRziYHCqoSmdFnfE8iT6N4+QQYEQV0qoJUf/LEclvdaD9QTuQ2yAHMFbmLafibKjlj6SyRd7wJNC681eiKO2pJVQPs+nDtHsshH2goigZPdcZAYQbCeJjnH9ttwSafYQRhfGomwWMbu8ttpnbFeFUt6cuzq0LVG5GIoX2yCH/+BR4ZBmLek4R7gmnrkGVhZkLhD3VbdctIIJrBY31C8W5T6Rf1jyp7vEdLDmWyg5D4XBTJekixsIR4RfEsoXlBl0HVueQAT5/8R6vu9d/QRARtEnJdLbt1mF+6Fv1J/Ad34qmF2llQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyTH/jZ3nb20n4lCAat/Fkstz7mTnvTpgfbyFXKTPns=;
 b=CU2hPri3A5UxvypH49agDCaxcArZnlIfuvhMwXhn6twswONowF4qmHrkVXAcgP6zpNABpGcre6n61q1bzZIOqvt/JwH6TgGjcaqWxCwsXj5sj12ZEoGT2MSc0o9ZT5EibAjp3o4ydvOpuZc8NLmcfmFWveFqG80FiUaMoKjAE4ARYRYT8g1NTzhLCIRu6zu5CwF0Zm1V4EmJgHt7KT1reNgL5fKQpxoJTOBh9XqmoF5wXXjYIToxDb74swPtz3A8dh8qRi2x8w2RhxNCVrXBAmUwW7Gg0+c2DPEn/o5EDfHEsAYi8P+Ik1KzMRTpeV6poWvRQy/zAEaT/K/J+XsksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyTH/jZ3nb20n4lCAat/Fkstz7mTnvTpgfbyFXKTPns=;
 b=BnD1YcdVZDgZ53LbOvdBzwKH8BpZd/G0On06qXULBL0As6rxS1sjsw/saSap/et9FmuRUrhtdpVPtN70PvmTzlvSPT3453jpTvKCAsXdFDdFU2veBFmiMWSMwvfsa/kkysgNeQ5Pfz6jV2DB9t0K9uezqE+ys0qsBI3EQkyZ2A8bEPbMsQB9yd/STrn9JxR0BrFmL3miI9KFbGkB/jgJW7/WhOiG+8Z/ANbcTTxhneK4P9UvNeXgAWPXQMXmm4EZL6pPWAS/fa1fxwixQF1rDJ6mMxxgF2fwbni0byNjHbYp2V4jX8yQAgN3X41228n7B0M244n8xoyqQOzFs2DPsw==
Received: from PH3PEPF000040A2.namprd05.prod.outlook.com (2603:10b6:518:1::56)
 by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.12; Thu, 28 May 2026 08:00:14 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2a01:111:f403:f90e::3) by PH3PEPF000040A2.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Thu, 28
 May 2026 08:00:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 08:00:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 00:59:57 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 00:59:56 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 28 May 2026 00:59:55 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>
Subject: [PATCH v2 00/11] iommu/arm-smmu-v3: Add PRI support
Date: Thu, 28 May 2026 00:59:28 -0700
Message-ID: <cover.1779944354.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|DM4PR12MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a92002-8e61-486b-15ad-08debc8f268d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|11063799006|18002099003|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info: /ZKLA+n+MfkYsLv/euthKn5cO1FEajrZi05kfQfwQeonzLyKqB+zOUEu4EJbblLqQBemgUwberpsgyiT+wQGCKjxqC9oZnkiVCDVo3zmk1FUjzNXKqITz2PX9I35e35cP3Sxq9QKO5TmNKqYk3UM56xDVclFFVI5e02tRrFeNDMSM8M7bpFWsyqvE9J0cecXNL3HHWEAGmvmxb0JDekhkcDwEt4jpyBs/IfEbUr2WeapV8lJEV//4lEBjGoT70pQ/jkB9bLkFo0wYu69+wvJN7b5bJwMiZjhngEDw68NtiaO3Vcm7pWQPoHiSo2YtXdawnSvKbnjpjOsqYXoaRPXfDxrjQK/qoCcv954PBSHbBTwd4pJCPazaJ7zDGTZUH567FPR3luYiptKMbEc0Vk0jbmCXk2osTfv2OUWNJi0XXHO3kwdC7Gx/t4H8wV+PP1vLVXkKxX05fjUDtQNsCzHv0z8jDkKoilVtKIySEml5MxwZhw9eHXYLXi1Bj+zJ6vnRA6WtI/g+opH6DqN1/X3ceZHc3xtHJnRg2LJCSZfYXC5HwWTHIQM50Ukwp4ODPKTVrY+iD/VFjDM5kY2ChtEliK9sgwNoXj5mg1/Q4KVbnrjw5JvRgxDb6jxR9o3wZb2/ddtT4zPkXWcnrrFYF01FKZmTLtulajc6YGzjZaGU0/SI9gavuX/I8zwHbsyfnp4Hv4MpnGLQNS9Bad/4ltbDFgFnleNQ0lb8kmmepeIk3M=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(11063799006)(18002099003)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EcjosJ2k6T2Gm2c3z1AfTdaiFEX5R9IpHUVhx8EB/6/3Zbtdzi6UqmeHO5t/jdhbdTbX9XXGQwaDy30Sl96KaEIOMtBcY7GsBhZbdOnFG9UkzDh02acCV9nG1DDdZm8puiEGLtQAQk6zqUib5sUOIPvQcuHLR1+URf5H+RZ5R/Ve3v/8PuLH/H/PBdchMXlynUcK6M3UnL9PYyT6xOPprZZ5SSOoVhfsx14ZK2KSEHsQw/5dUItkQ3yqXZfhXrYTm1Dj0oAWb/ncQZVFByjU044vpjhAyPKWmr/0MpPBj8v1gvfQ8t3lgbO6y4zy29tFsE2HIPyXw7g84nssfnjceFD97EEbhPZ2JchFNyIvXxx6TNfZoeteg5a9fvmXbUYYBgANlMzN0s6wg5HnsZXRFEdzODS3bMguWPG9aErJpdoeVvogdZ2bBaJc/JhEk/Vj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 08:00:14.4723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a92002-8e61-486b-15ad-08debc8f268d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_010027_999808_451340F1 
X-CRM114-Status: GOOD (  11.03  )
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

The SMMUv3 driver doesn't handle events on the PRI queue or respond to IOPF
faults. This series adds the missing pieces, using the IOPF infrastructure,
to convert PRI page requests into iopf_faults and issue CMDQ_OP_PRI_RESP.

The iopf_queue_flush_dev() contract requires the driver to first drain the
hardware PRI queue and synchronize using a threaded IRQ handler before the
IOPF software flush. This drove the additional commits compared to v1:
 - arm_smmu_drain_queue_for_iopf() drains the hardware queue to the PROD
   snapshot
 - arm_smmu_attach_release() moves the teardown outside the global lock
 - synchronize_irq() closes the gap before the final flush

This is on Github:
https://github.com/nicolinc/iommufd/commits/smmuv3_pri-v2

FWIW, engineers on the NVIDIA side have managed to verify the PRI feature.

Changelog
v2:
 * Allocate evtq.iopf for ARM_SMMU_FEAT_PRI
 * Pick up Jean's PRI stubs and PRI export patches
 * Enable PRI for PCI devices in arm_smmu_probe_device()
 * Add arm_smmu_drain_queue_for_iopf() for EVTQ and PRIQ
 * Add arm_smmu_attach_release() to rework the IOPF drain
 * Add IOMMU_FAULT_PAGE_REQUEST_STALLS_TRANS for STALL mode
 * Gate pci_enable_pri() on FEAT_PRI plus a non-NULL evtq.iopf
 * Deny unrecognised-StreamID PRG_LAST in arm_smmu_handle_ppr()
 * Disable PRI when no IRQ handler is registered (unique or combined IRQ)
v1:
 https://lore.kernel.org/all/cover.1772568590.git.nicolinc@nvidia.com/

Jean-Philippe Brucker (2):
  PCI/ATS: Add PRI stubs
  PCI/ATS: Export pci_enable_pri() and pci_reset_pri()

Malak Marrid (1):
  iommu/arm-smmu-v3: Submit CMDQ_OP_PRI_RESP for IOPF event

Nicolin Chen (8):
  iommu/arm-smmu-v3: Add arm_smmu_attach_release()
  iommu/arm-smmu-v3: Factor out __queue_empty() and __queue_consumed()
  iommu/arm-smmu-v3: Add arm_smmu_drain_queue_for_iopf() helper
  iommu/arm-smmu-v3: Drain in-flight fault handlers
  iommu/arm-smmu-v3: Support PRI Page Request in arm_smmu_handle_ppr()
  iommu/arm-smmu-v3: Disable PRI when no IRQ handler is registered
  iommu/arm-smmu-v3: Allocate IOPF queue for ARM_SMMU_FEAT_PRI
  iommu/arm-smmu-v3: Enable PRI for PCI device in
    arm_smmu_probe_device()

 drivers/iommu/arm/Kconfig                     |   1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   3 +
 include/linux/iommu.h                         |   1 +
 include/linux/pci-ats.h                       |   5 +
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |   1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 244 +++++++++++++++---
 drivers/pci/ats.c                             |   2 +
 7 files changed, 221 insertions(+), 36 deletions(-)


base-commit: 74fa4c177ad09800b007cba043370c887bb1b4e3
-- 
2.43.0


