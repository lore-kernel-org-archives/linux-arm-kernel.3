Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960E3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 09:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuAVRcp0auQx3ZZIamlwFrjYBduj4Uc0fmVc7Uo0S8g=; b=YnXyow2SBrrUIWQhMgUTfwHzJ3
	DV5A4RJ0HDW0KEMllyaQSQbeWxKlsfEPz4G6mJ95Sr5FJRg/SzFeoYGE1QBD7EpBL8p+5Vi36zojL
	I0WecGNPGer3ghhM1BihHCQ0WLJZEGbGsfSa5MSIfceoG+4sHJhCIetAsrMIjB1/Bogc2RjWpt4+0
	sdWoXP+wY7hre0tIazO7QQp4sU9YZl3QjMmw6dcdVT3rOWIfHHcjC2AcaPctjM2q6l00bzovcVFRl
	RR6QJvef48kgUvT5NQ7TrNk+jdUf+siBxVDxs3aIa5vO0Uy5Q+Umzw0PaCmPOYmfO+ueLo7YH6vqQ
	/oAW/XNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tggpk-0000000CZh5-42ai;
	Sat, 08 Feb 2025 09:09:04 +0000
Received: from mail-dm3nam02on2061e.outbound.protection.outlook.com ([2a01:111:f403:2405::61e] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tggkJ-0000000CXrl-2W0Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 09:03:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGFThbxP2rZOaM4wyOIpiQy0TSxEpu6rJA9FWlaWNvaR05ewzPo2O5YqDgpnddGkarxF32j6aXIQ3L51yyo6+By+U6SYtwFJ4ZYaVYryVll7YXCpnWv6uRF23z2x9DNF7h/9iVzO4yqKwSXeyHj5k9OTuReMTwWXdWl6MmgAWV0JXJk/JFMQgJlKkGoUn3/sPNaSUOH8pz+HDDMXmP4UeYwS83gLkksVv8ePuaRXm+V2NhKbUZ+ruHN2cIeV3UW5BQ9U6ERGiCd8fpNeO82o54wzsDdSBVXnxJi5ub2SBwYeImAR3WFGM4T/WuP/ihGZVjvg0wzb5MMF+RmmOWX0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuAVRcp0auQx3ZZIamlwFrjYBduj4Uc0fmVc7Uo0S8g=;
 b=WkziUpoLY6Na+cRumz8bKISK4c/WnM7vUPRlf4jsxUuZ0bcGMczXG1CG8Ux5j3pXS+B/HYC5NeuONT0QlNChIYNKh3UB7tJP9Ii0hY3HsUl2Fw5sofZIaA7DsG4cLEsIyxeicf4NIEBujbP1+5y+YleBRhvq2zmNk/7EvFZ9ZZLQcOxdM1PYMuE1mVbeLAw1dNUUbVfG3xKuz+HLtLAFD7Xn2z911FfFs4a2jBdFL+geY5nPsCFSuCRHUeA8SoNHNk964iV7cb7Hp24/Bg5vnNqrriJuP3tYu69KgBwavgvnv0cYgdt9Z5DjWwy5N7zmIJOmPNBlf8q/8JxUCw0RwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuAVRcp0auQx3ZZIamlwFrjYBduj4Uc0fmVc7Uo0S8g=;
 b=m3QosPRPGTtgoO2zVwQwUrKGmFakb5kLf+mQT+gseKiEifOdqE31CQ11o4IcA3zbxwZ6AweP1M1DFNCL2n6XhsSc7EQgRvS07adczSuc7lHtG+JUld/DS2ln8DX4ZTTWo0xl//CsXjafDufS7BW6qg4ywJk8k2glup4dHNUGTy2ducgZmoyNVFl71N0li6uYVfpFxiF8J3kb1LPJZ+FLK2TNTPVRXJVVTnOnbxUv9Aje7kBFcW43bDDXMGEbT8FM78Lvt67BHuxD+vioj08VOcQiciIHKVj4zwuYZfBjtqpGudimIHR8advTLwtNkjlQlBittWAnncmN/mJqOFD68w==
Received: from DS7PR05CA0009.namprd05.prod.outlook.com (2603:10b6:5:3b9::14)
 by IA1PR12MB7496.namprd12.prod.outlook.com (2603:10b6:208:418::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sat, 8 Feb
 2025 09:03:23 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::93) by DS7PR05CA0009.outlook.office365.com
 (2603:10b6:5:3b9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Sat,
 8 Feb 2025 09:03:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Sat, 8 Feb 2025 09:03:21 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 8 Feb 2025
 01:03:12 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sat, 8 Feb
 2025 01:03:11 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sat, 8 Feb 2025 01:03:10 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <tglx@linutronix.de>,
	<maz@kernel.org>
CC: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
	<shuah@kernel.org>, <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<eric.auger@redhat.com>, <baolu.lu@linux.intel.com>, <yi.l.liu@intel.com>,
	<yury.norov@gmail.com>, <jacob.pan@linux.microsoft.com>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 04/13] irqchip: Have CONFIG_IRQ_MSI_IOMMU be selected by the irqchips that need it
Date: Sat, 8 Feb 2025 01:02:37 -0800
Message-ID: <ee2eb3c07b47b9ccde345852e2842ebe5b6d5eec.1739005085.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739005085.git.nicolinc@nvidia.com>
References: <cover.1739005085.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|IA1PR12MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: af5c9531-7f21-43c3-0f4c-08dd481f6fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qyy3qg75/9Dld3pbdIomKWQUROeeAqWj1oMPRYf+8IHDjubVc46uLRfPo3kg?=
 =?us-ascii?Q?PrshDI3jm3tpK+HaSzF41igPO6gwF0zctMfwneKMR7VxRrLe0/82mw8o1+rw?=
 =?us-ascii?Q?oWyeGgktHSsAqn9mXqSLwnaR0xLSGyTnKauo2ZHZVIsvW8EleC1y/2MQk2/5?=
 =?us-ascii?Q?4n5NX8iN57QpBrq4cesj/Ty466ioWvr5E8VtJe6B8VaBY4M84a55PTzdEDas?=
 =?us-ascii?Q?1+gtxPPKCPGmJecWLmWe1qq13sulAGLtbYQUV66mAn6vPc0epG14ooLdJaHp?=
 =?us-ascii?Q?hKmtVLZCAHXobfQ6wpU9fRxmkwZRsV62g/fChP0ryNzi3vcGlAdWfV2xCnJL?=
 =?us-ascii?Q?wyRMeY8OiBpVTLxYfktjvtFDYYgDEOBP80XT1QOKhjMbXXJ7zgiY3RZV3NhA?=
 =?us-ascii?Q?qXhhTm5CmgHLdpvaSjPnZZu5cA5S5lualGibdNjx1jhQqeKYmv2t8gaP4L3Q?=
 =?us-ascii?Q?cbCknaXBZpYBHHTgNxPa+MuIKk9Zg/b2u7ULQD2ZyQY7+np3B01rz8H0gpz6?=
 =?us-ascii?Q?ZBJvsr0Rr0+nVlkSP5QXTtErJkl5V7bfPkh/J9OReI9bz8hSa70sgZVIugnw?=
 =?us-ascii?Q?aMxm2sKeLXPUNcuCTeFL+BoFwb3H2vMGDB0AssS2ommrW7fFMvPb1ZYKBurr?=
 =?us-ascii?Q?ghPiyEEhjIlqdR8XhzQEvwskh8Gb6tcsOZSY4JbUkISvzZaNjlY97w4S5ZrO?=
 =?us-ascii?Q?OWn9GuTEtx9JhPe1usahGhj/u4wwnDRPF6Ub5xUp33Fi9pBq548zG1aRcgH3?=
 =?us-ascii?Q?C6pS8/FzzsIipVBkc1OpERv+kZh8K7mGhQCgVx88pt7ASveCSRoaPU/EJjI6?=
 =?us-ascii?Q?7DOujxadhbTDUbjesHh82ksEWgmQzcSSK9IBgRRjJLL06BAg64oFSHx1+GE8?=
 =?us-ascii?Q?sNIRHUBbqUSIhaeB69YFuMfle0Eq6SZDZoGaJe6caDZVCJUn+6i1bUt568Qb?=
 =?us-ascii?Q?BvZDFN+T9Gdbx9IilOshCeB+bjXXzlPCy7QZfltb+zVzyT8uJL5xAowHqybZ?=
 =?us-ascii?Q?Bhlc0GVcuJ/D6jNUGqd4aSI70dvyBmIvqOdFCWMzv5qzv3YDdbcCdctmIF/y?=
 =?us-ascii?Q?cbvzfvor6UmmZt2J0V98sFmzkWR1qI6yE6r/a5gpn0h11D5cELIjMGabWXuK?=
 =?us-ascii?Q?tzxdwSJW7IfzbMqRvB9bkb+v1xAA7suebAivab9Q4AsO+U5QqmxxBjG8t/or?=
 =?us-ascii?Q?00Dku+ySxz6Rh9hhYQbRTnhOdisp3wzJKq0xU5/z5kU+IU2wyTZHUkgIOwVR?=
 =?us-ascii?Q?N8c5h2tqWrlZkUlJjVbMH9J/jr8rmj5u7/LVJwUlCUiGuZZP7T04JLH/x/p3?=
 =?us-ascii?Q?PknKUqVQ+Wej7Kse8vTQj9wQLmxRfjTLHAMbwpboXJLuA78hsGjzrU0M6Nr4?=
 =?us-ascii?Q?kibvQ/mbqTGW/PNyeOasSw2PPHg92lM+SN886g7a4HogHMhOh1kft84Iq5ul?=
 =?us-ascii?Q?7CXMH5I6QyCCzwA66le7OeT/fyD9Mqwil8p2ooR/SJMEFbOh/czQUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 09:03:21.4140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af5c9531-7f21-43c3-0f4c-08dd481f6fe7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7496
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_010327_639879_DBEC09DE 
X-CRM114-Status: GOOD (  12.00  )
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

From: Jason Gunthorpe <jgg@nvidia.com>

Currently IRQ_MSI_IOMMU is selected if DMA_IOMMU is available to provide
an implementation for iommu_dma_prepare/compose_msi_msg(). However it
makes more sense for the irqchips that call prepare/compose to select it
and that will trigger all the additional code and data to be compiled into
the kernel.

If IRQ_MSI_IOMMU is selected with no IOMMU side implementation then
prepare/compose will be NOP stubs.

If IRQ_MSI_IOMMU is not selected by an irqchip then the related code on
the iommu side is compiled out.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/Kconfig   | 1 -
 drivers/irqchip/Kconfig | 4 ++++
 kernel/irq/Kconfig      | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index ec1b5e32b972..5124e7431fe3 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -154,7 +154,6 @@ config IOMMU_DMA
 	select DMA_OPS_HELPERS
 	select IOMMU_API
 	select IOMMU_IOVA
-	select IRQ_MSI_IOMMU
 	select NEED_SG_DMA_LENGTH
 	select NEED_SG_DMA_FLAGS if SWIOTLB
 
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index be063bfb50c4..84015decc3a4 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -28,6 +28,7 @@ config ARM_GIC_V2M
 	select ARM_GIC
 	select IRQ_MSI_LIB
 	select PCI_MSI
+	select IRQ_MSI_IOMMU
 
 config GIC_NON_BANKED
 	bool
@@ -38,12 +39,14 @@ config ARM_GIC_V3
 	select PARTITION_PERCPU
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 	select HAVE_ARM_SMCCC_DISCOVERY
+	select IRQ_MSI_IOMMU
 
 config ARM_GIC_V3_ITS
 	bool
 	select GENERIC_MSI_IRQ
 	select IRQ_MSI_LIB
 	default ARM_GIC_V3
+	select IRQ_MSI_IOMMU
 
 config ARM_GIC_V3_ITS_FSL_MC
 	bool
@@ -407,6 +410,7 @@ config LS_EXTIRQ
 
 config LS_SCFG_MSI
 	def_bool y if SOC_LS1021A || ARCH_LAYERSCAPE
+	select IRQ_MSI_IOMMU
 	depends on PCI_MSI
 
 config PARTITION_PERCPU
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 5432418c0fea..9636aed20401 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -100,6 +100,7 @@ config GENERIC_MSI_IRQ
 	bool
 	select IRQ_DOMAIN_HIERARCHY
 
+# irqchip drivers should select this if they call iommu_dma_prepare_msi()
 config IRQ_MSI_IOMMU
 	bool
 
-- 
2.43.0


