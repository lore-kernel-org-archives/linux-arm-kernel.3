Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F202D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5C7BbNbxkCycrp6WS3b6f8CAENtqWpmuc1Dj+Qmq5A=; b=Ih/SuneSJFQqhUCW6OCLPdMHTy
	OCHuzNIrPU8qcBl4zJXtCbttS/f3BJJaxC6/33p/HHvPemxaJh8o72ZRRqUVcdPeZTkOamRWuFcXu
	f7tovHI2lAH2WhJJwJc3U/7eX/ZujUPS84J35iQ9MqpQVBpliC+fiMKRfM7mQgJIzPP2LheMF7HtB
	B6H+Ouscuuamm9EPC1GVoqYp9upiVW3OmahuTOX9+L5EGGwpVBqGPFKQGn8g06ITYiRrHYKwRbVkG
	H7TzCkG7xmcdZkkjq8dAB7bITlSton3R3+GlQXjMpWgTQmBkNwfxh9fhNTzLJNjAn5gMo3097fcTI
	3CO6j6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV2OD-00000003AGw-1Tii;
	Mon, 15 Dec 2025 06:49:01 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV2O1-00000003AF3-0cnb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 06:48:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Du5hLuED4VOq7WYPR+DMgcz8ilk6YAo3Jabfsvawn3MCfS1XvMG+MVmrUmpDgHjG93qdG7mIzCxzHLf1DK9SJVEc9HK4j13n5vhNKYZ3PBLvUFPk4n0EszqHwhjOCuwdOOYRfsE4ZCj2PPp+JjxMmXB2BmbDhtuuZXA5wXysNQDevpAmirOaML5rcTVBjbi3WlFWUWE5IKstD8xpz4djvJ3IhwZ8WE1r8Cvvhfft8T49KjV+AywDF4a6Lzf4IzoMu04fpw22s/BhfVhuzrxwiipQqYO5kp6Hs+37dXx4+zJBI56lJGZkyAEDPd6ydlv6YzdJtuzyEisDs1sCryQwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5C7BbNbxkCycrp6WS3b6f8CAENtqWpmuc1Dj+Qmq5A=;
 b=zSgCWBuv7tDhQG7yEhadKt5lyqO5xCS+4+C9oI1wjK7EIO7k6a+su4WOHAWF8eELi22402VT+4X4CoeaZOfC9tjOt+4pv2SqbwsmJY8u5bvZk7bxVwL/Rk9xQjVNGGRmZh5fr5iv8QTWECghfqRkBmDfsL6r0huMgLfdTRQfokxG+48GbuStAVj8cggdVVMSbZYVBKCnZoiM91mR9a7B49ivcI6Noojnw5ooRJ3QkLrK6DikejbMg4dlJohE0pYe4SiuJI8YJbu8owh9soRD5+eUPt+sLIYpRPhFgJWWntPeeIHMNLJRLNuD4pbCNyPiB4PQNG1EcL9ZjuWMNubFmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5C7BbNbxkCycrp6WS3b6f8CAENtqWpmuc1Dj+Qmq5A=;
 b=tyOOxSMX+sV+tuFnK9aY1hNRFzPj1B+sE0Q09zVpNhVww7pu+gId1a4OdDbk5lYHZpJ+UlfkNYElTwQOjADqYo4dgUfQ38FWc2j5aTRoCV8cQNLOq8GCBhB4Bj9tdoCkzKwbzlHBkhAo9ETNDxCoOlWUeTlo7U8eEi8yIZyRK72oXq76MKI+rVOZI0G3jmbNC5X2eE+Z3xpumjnRu78IujMlBCTSZ1n325VDQ2Rs9xMvv7M/wVcv/Kyi5RdbfC5B6boby51m6hcAn5xrz7Bvdtn6mJ9bEx8eYiF8yZyVLH0jO36kGDfOnf2H+p2l0kTfXhF7ppwTBcn9tPMJd/M8VQ==
Received: from CH0PR03CA0103.namprd03.prod.outlook.com (2603:10b6:610:cd::18)
 by DS7PR12MB5741.namprd12.prod.outlook.com (2603:10b6:8:70::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Mon, 15 Dec 2025 06:48:42 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:cd:cafe::d1) by CH0PR03CA0103.outlook.office365.com
 (2603:10b6:610:cd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 06:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Mon, 15 Dec 2025 06:48:42 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 14 Dec
 2025 22:48:28 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 14 Dec
 2025 22:48:27 -0800
Received: from build-amhetre-focal-20250825.internal (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Sun, 14 Dec 2025 22:48:26 -0800
From: Ashish Mhetre <amhetre@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolinc@nvidia.com>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <vdumpa@nvidia.com>,
	<jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ashish Mhetre
	<amhetre@nvidia.com>
Subject: [PATCH V7 4/4] arm64: dts: nvidia: Add nodes for CMDQV
Date: Mon, 15 Dec 2025 06:48:19 +0000
Message-ID: <20251215064819.3345361-5-amhetre@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251215064819.3345361-1-amhetre@nvidia.com>
References: <20251215064819.3345361-1-amhetre@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|DS7PR12MB5741:EE_
X-MS-Office365-Filtering-Correlation-Id: 217ee11e-4919-4301-327a-08de3ba5fc9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dRMZznH6JKNu1Kjk8Xalvm99GLiSIGTCbT/29ECZLRGYyU7TzOc4/Hg0FRrw?=
 =?us-ascii?Q?fJIwrqWgZUCABKiQxhCgTRGERoN1gOAvi2NRj2tI8WEtzK/7TbVHqhd7LTnb?=
 =?us-ascii?Q?OLtoN7czuk01sUOYC1f4jee8fSirh4TouWDfeQCHvzrY72Jo5ihwrnClIqVV?=
 =?us-ascii?Q?43u/C/G0a42dcc8Mf3dRGgmYcWxaQbbTdgbWG/Z1esM+jqk9LM35275FP9BR?=
 =?us-ascii?Q?XndvV8FEhwC3GKcEQZWYuSmzIpH/PO4vFOeqNO/yKq1kG8sOhm5qDEuTeZ+2?=
 =?us-ascii?Q?IbP01aCQE8I0XJiZwUK8Qip5Tbp1PLNPv2KMVcGrtR1+oI3LdeIIGj9iwzMM?=
 =?us-ascii?Q?rBQhI23Y85LC7yNBAhrLjkZhUoX4iHPXmxrYsXciCKe0NcrxaCCwY0g1z2nY?=
 =?us-ascii?Q?rl+5uHzcPJSUSQU4KlvB1GAqQpD3NnY45ASA3yJVbtKZfUNZQcyf/Gw7LCOh?=
 =?us-ascii?Q?/su3/7KzWFlsJpqO3xYzN5fTDVPfDJt+DDl4hhoTEe7TXNX+hBkHSe6dIsEa?=
 =?us-ascii?Q?BANAlLCPzzTZyTqR27YHX37j85X2da/Jhq7EIApjAV0hSV2pUbRrE8F9vGL7?=
 =?us-ascii?Q?4JHkzvZf1m+MalyrWGr5sAAZOMY+x3WNoD79/MzvYQ8w9vBebxeM55KnDhNT?=
 =?us-ascii?Q?EV/9WVFWWFg9dhNJW/f8LkW0K4nXD3QX4IiR1yQFcERbPb4l74VChxCH/pg0?=
 =?us-ascii?Q?723zqM8AUIWNtreNb1S8wFWbW9f1gPIVOOf8NyiqMviavrvw3KywID95DUQY?=
 =?us-ascii?Q?2OuWb1MOIgU2Dn1hnu31I4kv9ENEmS5jwFapt8nXEWMWfcU+pY2zVNfv4k8n?=
 =?us-ascii?Q?kHs5N0mRBO0NBmRA9qH5uwh+ULhd9JlX5rJ4f7VaiseIv0ks+P27IE2bD18G?=
 =?us-ascii?Q?iYfkgPNjzevB8bfonjDdTi//FYYudUjSd5ulMao4+4T2F6pYYy/AHKHnRsHj?=
 =?us-ascii?Q?ttGQJ+EiM1JEBcrWfPr7DtSR05M96thCmDgd7xFAWjtLmswf60Ny0cvu7qMm?=
 =?us-ascii?Q?CbLrq7gs8ZQ/+igQ/21fvsO2N/GlQZxWhmySdExXUS2kgRGZqfJIUO2tawhG?=
 =?us-ascii?Q?pnr473pE/KIyazOLCRCn2OFy29VLSSvvdo7k0j39YTRIuWpnqnPP8AwS6xfG?=
 =?us-ascii?Q?TQQ7YPVRvjM0IARRSQjmX/Ozx8nqwcC7cSfRPcB7IOyUZHdWe73/jM5h+V7v?=
 =?us-ascii?Q?B3LA1Wgp+TD+K2ZZjpC2bl2hm3r6iphvx+8vh7IzoUKEyR/ZUoVQeeXhdBzm?=
 =?us-ascii?Q?R+/GMOpQt70c3RhjrqtUJ8+GbrEyre/iKoAnTk4VcGnyIcQobUCxAj+SREl+?=
 =?us-ascii?Q?Xj5mCdGR4YBI7wMa4WYorFqJKHIsh4AXlP84aGeFUJp/VM6P79LsQfYR35sl?=
 =?us-ascii?Q?2+hBEv1Ib7E6pT8ldyBTFtGqtgq7o9RjAQTvRjnkdUutM5/GJf0E88jcwCbU?=
 =?us-ascii?Q?el0ioVjPO8yTTW0PUohhVan1YKcO9l5v84GRGJY13JmKq/qQkdIL3VrijaMe?=
 =?us-ascii?Q?Xbmi4nWXFeDCCbTfHhVasqHTuQZH1yZ94MlrcFv65/vW9QWHnVmBFbSFoxEF?=
 =?us-ascii?Q?iR28bu1A0oGtQXrz+X4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 06:48:42.5498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 217ee11e-4919-4301-327a-08de3ba5fc9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_224849_510504_57495833 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

The Command Queue Virtualization (CMDQV) hardware is part of the
SMMUv3 implementation on NVIDIA Tegra SoCs. It assists in
virtualizing the command queue for the SMMU.

Update SMMU compatible strings to use nvidia,tegra264-smmu to enable
CMDQV support. Add device tree nodes for the CMDQV hardware and enable
them on the tegra264-p3834 platform where SMMUs are enabled. Each SMMU
instance is paired with its corresponding CMDQV instance via the
nvidia,cmdqv property.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  8 +++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 50 +++++++++++++++++--
 2 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
index 06795c82427a..7e2c3e66c2ab 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
@@ -23,8 +23,16 @@ iommu@5000000 {
 			status = "okay";
 		};
 
+		cmdqv@5200000 {
+			status = "okay";
+		};
+
 		iommu@6000000 {
 			status = "okay";
 		};
+
+		cmdqv@6200000 {
+			status = "okay";
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index f137565da804..9eb7058e3149 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3361,7 +3361,7 @@ bus@8100000000 {
 			 <0x02 0x00000000 0xd0 0x00000000 0x08 0x80000000>; /* ECAM, prefetchable memory, I/O */
 
 		smmu1: iommu@5000000 {
-			compatible = "arm,smmu-v3";
+			compatible = "nvidia,tegra264-smmu", "arm,smmu-v3";
 			reg = <0x00 0x5000000 0x0 0x200000>;
 			interrupts = <GIC_SPI 12 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 13 IRQ_TYPE_EDGE_RISING>;
@@ -3370,10 +3370,18 @@ smmu1: iommu@5000000 {
 
 			#iommu-cells = <1>;
 			dma-coherent;
+			nvidia,cmdqv = <&cmdqv1>;
+		};
+
+		cmdqv1: cmdqv@5200000 {
+			compatible = "nvidia,tegra264-cmdqv";
+			reg = <0x00 0x5200000 0x0 0x830000>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		smmu2: iommu@6000000 {
-			compatible = "arm,smmu-v3";
+			compatible = "nvidia,tegra264-smmu", "arm,smmu-v3";
 			reg = <0x00 0x6000000 0x0 0x200000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 2 IRQ_TYPE_EDGE_RISING>;
@@ -3382,6 +3390,14 @@ smmu2: iommu@6000000 {
 
 			#iommu-cells = <1>;
 			dma-coherent;
+			nvidia,cmdqv = <&cmdqv2>;
+		};
+
+		cmdqv2: cmdqv@6200000 {
+			compatible = "nvidia,tegra264-cmdqv";
+			reg = <0x00 0x6200000 0x0 0x830000>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		mc: memory-controller@8020000 {
@@ -3437,7 +3453,7 @@ emc: external-memory-controller@8800000 {
 		};
 
 		smmu0: iommu@a000000 {
-			compatible = "arm,smmu-v3";
+			compatible = "nvidia,tegra264-smmu", "arm,smmu-v3";
 			reg = <0x00 0xa000000 0x0 0x200000>;
 			interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
@@ -3446,10 +3462,18 @@ smmu0: iommu@a000000 {
 
 			#iommu-cells = <1>;
 			dma-coherent;
+			nvidia,cmdqv = <&cmdqv0>;
+		};
+
+		cmdqv0: cmdqv@a200000 {
+			compatible = "nvidia,tegra264-cmdqv";
+			reg = <0x00 0xa200000 0x0 0x830000>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		smmu4: iommu@b000000 {
-			compatible = "arm,smmu-v3";
+			compatible = "nvidia,tegra264-smmu", "arm,smmu-v3";
 			reg = <0x00 0xb000000 0x0 0x200000>;
 			interrupts = <GIC_SPI 30 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 31 IRQ_TYPE_EDGE_RISING>;
@@ -3458,6 +3482,14 @@ smmu4: iommu@b000000 {
 
 			#iommu-cells = <1>;
 			dma-coherent;
+			nvidia,cmdqv = <&cmdqv4>;
+		};
+
+		cmdqv4: cmdqv@b200000 {
+			compatible = "nvidia,tegra264-cmdqv";
+			reg = <0x00 0xb200000 0x0 0x830000>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		i2c14: i2c@c410000 {
@@ -3690,7 +3722,7 @@ bus@8800000000 {
 		ranges = <0x00 0x00000000 0x88 0x00000000 0x01 0x00000000>;
 
 		smmu3: iommu@6000000 {
-			compatible = "arm,smmu-v3";
+			compatible = "nvidia,tegra264-smmu", "arm,smmu-v3";
 			reg = <0x00 0x6000000 0x0 0x200000>;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 226 IRQ_TYPE_EDGE_RISING>;
@@ -3699,6 +3731,14 @@ smmu3: iommu@6000000 {
 
 			#iommu-cells = <1>;
 			dma-coherent;
+			nvidia,cmdqv = <&cmdqv3>;
+		};
+
+		cmdqv3: cmdqv@6200000 {
+			compatible = "nvidia,tegra264-cmdqv";
+			reg = <0x00 0x6200000 0x0 0x830000>;
+			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		hda@90b0000 {
-- 
2.25.1


