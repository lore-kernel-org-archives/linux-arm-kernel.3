Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4A1D2E00E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 06:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EIzyzo2QsFvsi0KPK1n7WP2kKZ8STMCdLQJi0YHG8w0=; b=OvYsvFjJI9CIuLkaWVucAFT0VZ
	9x6CPdeWOrN85HbGmlyH7FOzvzbNHsPxi/WDLkW2Py+nLPLM5eNGb92hNsPual2QzIkjgZs+mOH5e
	5kbk0jA97lZQcci6UO1p81Sa14RMUlo6/Uzu4OJB4dJuRfIPRb9gGehKW38nXuSLv0ecb2pIKAyFh
	u78+9AWx5mbjje0pYBNzMwkI74UEGJIdFwA1HY/dq/p9+/9Ob19chRRqAsAkrZOHQIszhIgylzL2d
	WvFToLAMb+9AXbaCOyOqsT7AVVcFoxzOyYbUIGwm5o11SlknnhT+yAbeJclRiwbCEnQ0fGSLPg6h4
	jysbmnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPmc-000000097WZ-1Lra;
	Fri, 05 Dec 2025 06:59:14 +0000
Received: from mail-southcentralusazon11013067.outbound.protection.outlook.com ([40.93.196.67] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPmZ-000000097Vi-03Lh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 06:59:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg0WJ4rFf/6x8tbzFWO66yc8DfZs9oR4C8aI2wRl9XRGbn1HKFI3THHC1GugXfVU4hPjhAAy/ivmk/VWr1mptbyrCRFDI4VPFu3oYCla+54uPQsujvUwRNC44wrr7SJ4qlouk+HH25464s/LzYwlXvr6tasBCT5fV2KZGlVt4J7NQl5PZY3WuJo2cYpGO8PpA50DVY9JoPB0m1LdqQW7DxJNEQavrl6kFVmD/Jxk8gF+GKqYX7Y0DU4IMKMZt0iEduTIjQ4BRMJIEUJKaO4tdz2fg8L3yrGeCYCMecRj8sc9GiQlrnTqp8/YPRh4HTvq9d9Y7LD3JRJ0os7BGRlD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIzyzo2QsFvsi0KPK1n7WP2kKZ8STMCdLQJi0YHG8w0=;
 b=pFOuXuGRJpsZq5QMwBREqxqL8R9f1bzpUMZg+B4EHBhxr9bqr3G3JCIsOXnbYCTLsp4muHM03NHU0CJXX8DEW7G41jj8VOXsjXnEIa7wsNi01SJLZfgTq2I39cOVUh4xuxkqbdDJM/I7SGACrjS+hWKzFFE9PumXACMiOg6bW1FuQzWWvcOwmSeBe3z1Ac0Mv7OB/Bx7XE7zBNcyout23jsNnX6RlzrLRylSF3iFj5SOj5FKsg94lVXmRBqpL6DJvxbpsMpdmcNeuk0PFvzVXWcn/v96Bk/gK+5+WHc8URX9DIqCyFI7aLsvp9QaUdSXJKVC/WvPiwtafk2O423YlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIzyzo2QsFvsi0KPK1n7WP2kKZ8STMCdLQJi0YHG8w0=;
 b=bdcXGlQG8kcHkU/Rc0ludpWhaU/Cpa8MdkoktjM3L8o5+jY1m1BSUQd4ywlx1PU4Xgn0NHMKwFwPItv7scHmdw8QhyKNQxLSsaWDtUObQHweVmfP5QQYoLouxf73wiApqQdzBsSREOQluZlKUwm5S9D/VUQptP+GdklWkP/vn9IpUMzKg+RrDl6QVms9LaiT96vkYpMBJO02sGUQOdNTOv/OJd8lV5X4+n8hNhj99dVD1PFC+/VYWYQ0BlsUP3K2CKRo6cw1BKOHkLZ3DWe6ygIqocRPyirgkR+QTeBnRN4d1DMqBpNgCm710DbmPwJqET8SS+oVPwn9In6IvEfiUg==
Received: from SJ0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:a03:33a::8)
 by CH1PPF6B6BCC42C.namprd12.prod.outlook.com (2603:10b6:61f:fc00::612) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 06:59:02 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::5a) by SJ0PR03CA0003.outlook.office365.com
 (2603:10b6:a03:33a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Fri, 5
 Dec 2025 06:58:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 06:59:01 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 22:58:54 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 22:58:54 -0800
Received: from build-amhetre-focal-20250825.internal (10.127.8.10) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 4 Dec 2025 22:58:54 -0800
From: Ashish Mhetre <amhetre@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolinc@nvidia.com>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <vdumpa@nvidia.com>,
	<jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ashish Mhetre
	<amhetre@nvidia.com>
Subject: [PATCH V4 0/3] Add device tree support for NVIDIA Tegra CMDQV
Date: Fri, 5 Dec 2025 06:58:47 +0000
Message-ID: <20251205065850.3841834-1-amhetre@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|CH1PPF6B6BCC42C:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba534d6-f3ee-4e23-3dc8-08de33cbc572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v3GbTj9x4smfYoiTWdHQq5+AxmrrFnom0sWMByyPX1ElZnkpTVvYhT1IEmRn?=
 =?us-ascii?Q?pKH1b0puhAtmJ0fgUNS2qrrTZkNj0q9w+qoZ3YF0iXuS/B8k8+S+eVwXqIb3?=
 =?us-ascii?Q?ZXS6D0doKYIkV9DdaXVabivJaGnTHM3Mx5FN3NdU/vq5AV4ZpcP4lIpirCGy?=
 =?us-ascii?Q?nLvyo2LbEUSeApV2Zfgjl2anbvnDB7uFVw6baqICVZRHDjIhb4k1gnFf9D2H?=
 =?us-ascii?Q?zaRhy4GcbE83xaY+eAgsMDgp3Wq3hck2fECrzXr0cDg/4/t0EIjmma3eaK54?=
 =?us-ascii?Q?UMFKmZwXIwRn30KFyukyCyPolSuZZHnK4ETQmFEslYUpF6QWVQhvsPZElNLn?=
 =?us-ascii?Q?3xHmFgf9Mvdeu8iZDEKjO8fspsD9RK+y1jMYAz+S/NUtaNijORmzla3TUrbf?=
 =?us-ascii?Q?NXbgHgEUw2K3CT6QqB6tqeF7jY4oEhMsDVn2ZtrKEyHoVm/zi7LkPbR310Ko?=
 =?us-ascii?Q?7DCUEJHsGV3yqhqSLDozEFAPeAjLm5Qe1uwBhtkSceVSRxTDYlBSQpL+1zf0?=
 =?us-ascii?Q?VsBzdauJ96w6WzevKTBjBILjdpWB8jBcNX2UjSbWmrFlT1i2d9PIm2re7yDm?=
 =?us-ascii?Q?ZFDBzdC5aHldOwEGODlpnVgmLVCNRqw9m0VzAAlYclSzeFVB/DZApRdtq27x?=
 =?us-ascii?Q?m/aNRnkmgK5A9ZPJzYtljybvxWMrhyNlX1JpEA17IZCPYPREVAOmFKxee7gJ?=
 =?us-ascii?Q?vswpylkEMAEd/xEu87sSIdXwSfhyOYbLOJCC3JeRW9TpdeUJltjKK93aVE7r?=
 =?us-ascii?Q?mWxWguS7V3Mia9FeMwjaB5hQyzC3fG6TqOoRHwBWZDGr7LXNuzHAjCgm8/Wf?=
 =?us-ascii?Q?YnYxQazEg77Sx3/E5viI4GwUQtQoZ+S7yAipW3496YsKytzO0bB4WAdF8Jfo?=
 =?us-ascii?Q?xvGzTewD9kmxVnaBIfT9Zb/LRzqs3TjQQsicQr7+2yaCPULTt9qZEMriLcP1?=
 =?us-ascii?Q?746pSymKQFKKPMRUxIbH0FlpbXmS18IV0fudxOtq/JuPYcK/B+FNFncvDzDA?=
 =?us-ascii?Q?v/QP+tetoET9GcCrHt/Vh+qD5IX/kmMhSOrf8b95fVmw3mqPi6rymVlzSEo/?=
 =?us-ascii?Q?nXLO9aMa0AOpbMowbvoVxo0w0MSu0x1cX+2mkuoV6z6eyQ+G3iSxmFAvYeCX?=
 =?us-ascii?Q?ytYhQiuyQPLP/BltsNs/2ExmGfACD58TV7K/fCAvLIkcIWpgKcSYdtBvNJuV?=
 =?us-ascii?Q?sMX0ehyHnAlrvwpQPDAEhc51kYnUedZkOm0tP7GX8/EaN0d3zVDvXlZIeLDm?=
 =?us-ascii?Q?orw+apfg4cXl42OkX27+tSaZoYxL/ezFqylT3h26ZnQDyvAGOo3So7C5U90q?=
 =?us-ascii?Q?ndEeGHL8Ihjl/AjNLx5uwZfMPsS4v8w3Eeibauz3XRd0P3Mq7HN7KZBT5Ueq?=
 =?us-ascii?Q?Xoh0b0f1MucQ0+8LbejnccBJzpvA7sSv3fZDcD3q1ixfYRF/5WM48QR25l63?=
 =?us-ascii?Q?yFyVa1UuxWCaJ0rlTJcUo5VbYuVDzPp8DaOrEzymo6DcB1QVQ16dNS6eBOKF?=
 =?us-ascii?Q?9I0DFSdHr6Tmtq1u/IkYsoTdHDhB/IHEqGfmVJVhsNWoXxgVE1p4/KCQhoYE?=
 =?us-ascii?Q?7zKZ8XxKgyc/pYXMQx4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 06:59:01.6867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba534d6-f3ee-4e23-3dc8-08de33cbc572
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF6B6BCC42C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_225911_090755_5241AABB 
X-CRM114-Status: GOOD (  14.30  )
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

This series adds device tree support for the CMDQ-Virtualization (CMDQV)
hardware on NVIDIA Tegra264 SoCs.

CMDQV is a hardware block that works alongside the ARM SMMUv3 to assist in
virtualizing the command queue. It was previously only supported through
ACPI on Tegra241. This series extends the existing driver to support device
tree based initialization, which is required for Tegra264 platforms.

The series is structured as follows:

Patch 1: Extends the tegra241-cmdqv driver to support device tree probing
         alongside the existing ACPI support. The SMMU driver now parses
         the nvidia,cmdqv phandle to associate each SMMU with its
         corresponding CMDQV instance.

Patch 2: Adds device tree binding documentation for nvidia,tegra264-cmdqv
         and extends the arm,smmu-v3 binding with an optional nvidia,cmdqv
         property.

Patch 3: Adds CMDQV device nodes to the Tegra264 device tree and enables
         them on the tegra264-p3834 platform.

The implementation follows the existing ACPI probe path to minimize code
divergence and maintain consistency with Tegra241 support.

Changes in V4:
- Removed platform driver registration from tegra241-cmdqv.c to avoid
  duplicate module init/cleanup symbols
- Fixed the ordering of properties in CMDQV device tree nodes
- Added "Reviewed-by: Rob Herring" for binding documentation patch(2/3)
  carry-forwarding from V3.

Changes in V3:
- Remove the Kconfig dependency for CONFIG_TEGRA241_CMDQV
- Drop the reference on the platform device after getting it from
  of_find_device_by_node()
- Remove the unnecessary "nvidia,tegra264-smmu" compatible string from
  arm-smmu-v3 match table
- Order CMDQV nodes in device tree files according to its address

Changes in V2:
- Updated dependency for CONFIG_TEGRA241_CMDQV on OF || ACPI
- Changed maintainer to Nicolin Chen
- Removed interrupt-names property
- Added nvidia,tegra264-smmu to compatible enum for arm-smmu-v3
- Added allOf constraint to restrict nvidia,cmdqv property to
  nvidia,tegra264-smmu only
- Updated SMMU nodes in device tree to use nvidia,tegra264-smmu compatible
  string

Ashish Mhetre (3):
  iommu/arm-smmu-v3: Add device-tree support for CMDQV driver
  dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
  arm64: dts: nvidia: Add nodes for CMDQV

 .../bindings/iommu/arm,smmu-v3.yaml           | 30 ++++++++++-
 .../bindings/iommu/nvidia,tegra264-cmdqv.yaml | 42 ++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  8 +++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 50 +++++++++++++++++--
 drivers/iommu/arm/Kconfig                     |  1 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 32 ++++++++++++
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 27 +++++++++-
 7 files changed, 181 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/nvidia,tegra264-cmdqv.yaml

-- 
2.25.1


