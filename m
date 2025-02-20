Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEECC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 01:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V79YXQUDt2te26Vc3LMUuAqdZMIpljd8QCLljpfl0Ow=; b=ilhjuq1WEhU7zDxyJMcH3uxamb
	ViS5RdknWx5d7+DcNsuw4OZT+6YSIRWrVl8BpXeKe91uvWw9cy0hUtGE9GcdGYOfrPylPoZ+lx5zE
	owbg6W+limgqvA7UUcW4hvuWeUSzP1EhkmlVLdSoqdxuNeYmn53uUrD4G9xjzz5MNOHMWG4w+eMXB
	7BGGcKgVtj2MpXlqYYthBFz3exqjmnsjaICTnJURRImXgAEoY8Mh9VgXKZrBtofleGjOSFAlVuHYh
	62ZxTRSNxudozMD48pMCIB2OkYMtVQu77AUSHP6Wo3sc3AvJ3c+bybOXQUaYbTjS35UaQ6uLseOJU
	W4dfi0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvct-0000000GBSB-2fNx;
	Thu, 20 Feb 2025 01:45:19 +0000
Received: from mail-bn1nam02on20613.outbound.protection.outlook.com ([2a01:111:f403:2407::613] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvQs-0000000G8Id-0hZO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 01:32:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1v+PhRWHh3MIxp1usSyKYfWVqI6h8UqxE9At9C2stB8bkaN7W9Tv9vLxzKl4hlqrcsJwJwR+JLjP118RocHGMB2N3MRsCwzrUmNy9x3T0IbBJR0LtfnyvlKFLaEWI9yaG5RqBStGd7cz27y6CqUsStiBErTVS0XiSQhpTNdkBp8rZCw4ihCsj4HHvmVfWqPRntsLxc61cARUNE6CucvLV78OmGe5bmTAbRHRD9AIaTzteavR4ZQppZxERAwX7T5czUsXBSDhFK/dAhRoS5X9cmk1E1/SyKlIl+2KugEIg+vEeDuBtS3QK27oJHMSjxVj5/g8nKy3XA+ShMugQMbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V79YXQUDt2te26Vc3LMUuAqdZMIpljd8QCLljpfl0Ow=;
 b=NitKIrl0W+/4TpMRlRSBqucaEGKSJEtm6ZIf+gPD6r9jPB3qc3mOJ7YbNGrnb09KUbsafaBCFMdjJc9Kr+qVS+QLm/53X4hMdYSGFDFgNsSALLqiHlk6+FSkSrbtqAzFRWp/W985N+lDWgEypZn/1BFNtLiOprfSfoMRGBRjpNZGa+8UrtPXvFs8FA/80wRYiQBrZQdEokpsTbKRYSsFNH6a+NRBSrpYLYoZfdkhega6E86K0GtwUyD+rXCsuovWt4jY7w4HAop1fAGLqrTebzheeMunnPh+BJgc+dPRgGe5XdPjuZqNJze4qCJBK1WD22RKKMYSUmVL8kRiE+f1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V79YXQUDt2te26Vc3LMUuAqdZMIpljd8QCLljpfl0Ow=;
 b=GzllJ/Cpnk1dDnJ7gmjhSPMwz4a1CLAhD3AgOFD0OjO/qqOueB4vAlkLFjy8HyODJDRRE8U2ioQ6mCJ3LOnruwEVwSKsdKjzRqorsFYSfwiOg6Yy+obTHvkoFG2gH1lgYfbJxpPQwXkz27TGvcv57gjGZq9jqVKsOUQt9zjwpcFrfDqVKPoRjX2xw9/jyIZwHH1GCyngJU5Wq2GI/CCiR6zj+CiBV739Y8XV56pG9aT/2f8yBvcen0FYBEyOoVrtLVbCZkAxJGAn3zCJnI1LZGGY/nxVDufk9sWUZMf62NZslvHy/gXz/dKCoqfHBjl7018HmCgE2sJyeCizH2bJgg==
Received: from BN9P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::6)
 by BL1PR12MB5876.namprd12.prod.outlook.com (2603:10b6:208:398::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Thu, 20 Feb
 2025 01:32:43 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:408:13e:cafe::df) by BN9P220CA0001.outlook.office365.com
 (2603:10b6:408:13e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Thu,
 20 Feb 2025 01:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 01:32:42 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 19 Feb
 2025 17:32:30 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 19 Feb
 2025 17:32:30 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 19 Feb 2025 17:32:29 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <tglx@linutronix.de>,
	<maz@kernel.org>
CC: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
	<shuah@kernel.org>, <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<eric.auger@redhat.com>, <baolu.lu@linux.intel.com>, <yi.l.liu@intel.com>,
	<yury.norov@gmail.com>, <jacob.pan@linux.microsoft.com>,
	<patches@lists.linux.dev>
Subject: [PATCH v2 4/7] irqchip: Have CONFIG_IRQ_MSI_IOMMU be selected by irqchips that need it
Date: Wed, 19 Feb 2025 17:31:39 -0800
Message-ID: <a2620f67002c5cdf974e89ca3bf905f5c0817be6.1740014950.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740014950.git.nicolinc@nvidia.com>
References: <cover.1740014950.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|BL1PR12MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f82c24-1be5-4307-fe12-08dd514e78a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K+GLvRKEcDGzxxN/lFcTzhRe1aYJ5iQz72JnzRZnDY0uiDPs20qT51cTJ+L5?=
 =?us-ascii?Q?q4N5EJiekjZE2StQAghF8vrY3viTeLQaEbTEr8lAB6bXgrQ7NMxyWXbfMWGo?=
 =?us-ascii?Q?ESZtqHCq2hXnUw78RQaJ8YRpjbKXoOAXrcW+TEfT+j9OF23/k9ZTwRC4gFnI?=
 =?us-ascii?Q?A25cneitFfvZYhRzs3MrMwJgs+mmBs+rvdQFBkxCswYpqWhvVoIaqjwCR3nZ?=
 =?us-ascii?Q?M9cCJwxz46iBo3gQ6TfqnnddU/pIS2P+dTbc8fCGw/6D1JBpJgnrKLZ10dpQ?=
 =?us-ascii?Q?D7RLSfO30G9nwWrqdPQoNzwluwmI26mMV5A9QHP9w2146FMAZclp3DE3zrIA?=
 =?us-ascii?Q?UGFXTFGubuRR8oikFRjXE2WOx92m/qR8OPhwNBSrQZwwGhc3aDeRECKdFdmW?=
 =?us-ascii?Q?2PYYXkwrtJJPNppDsP7iZ4OpmFxVVYs40JDVEzAbdMfUjW9xQE2j7ipcn98r?=
 =?us-ascii?Q?C/3GxNDXiW3pWhfKfWjZaZQCKePTtO8zkkK+GJXYIum5LMpB7C46KVLcGIjt?=
 =?us-ascii?Q?7bckGvHZDReGBPp6Jh00whPHd5tFbqqv/5o2XjaLmIKUi2YX6avMrQaY4iLR?=
 =?us-ascii?Q?XypCOMdXnm7keQFpni7HZsE7f9L3HjVHAn6prc8o8IwQa+ru5XJeRacW7mXQ?=
 =?us-ascii?Q?GKtcM45vYCPoW8VtnIFILkQnq0TJzk834qxmD1Z01x+JSkU0g232uxh76KeS?=
 =?us-ascii?Q?9e6Vi2v+8wVUekAtivjnPPa5xaUstv0D4/LsQx+t+D4Y7FYHrcz+3JOjVXrP?=
 =?us-ascii?Q?czWxkoKdL78V77Azi+ek5gC9Ti7JZr6PP0XiYKSz/yZ91F0somBSL0hPOhTt?=
 =?us-ascii?Q?pDPsZ28czzAUmPhMPdCrzF9E6b5kctjIs+wxsLRGPLWJ7cViHz1Wu6xs/8u/?=
 =?us-ascii?Q?mhtjn5mnNK27gZ3Yv+E+tVzOMTzC4wb6TOlO9zmgp81c3BtP9DXZIjHRpMww?=
 =?us-ascii?Q?5IJloK/H6m9gSojPJvvRBHDYEHk+8+ajb583RFFfsY8Rey6WMzimZn5awJvK?=
 =?us-ascii?Q?xqvs4G0Tm9B/spxJGygUUH2SNBqVW7YzSTQ4HgRWLucREkt6uYN4nBDyfetH?=
 =?us-ascii?Q?reEV9Am/kpu2kTvxjDlrKq36355/WtEhJyRHzFHHKVHI2ZWQ2XVqrEwPxhCF?=
 =?us-ascii?Q?PO4Vq/dPJwlRsaCWZRERWYyGn4/Gse4POT9/hze8Q8SfbhmwOCe0CafGlJN2?=
 =?us-ascii?Q?2T5+91Qw/vs1Ewqn0Y89nrnj/8GT60XIiUJqj14KU1oWYiqGUTSswD61eabb?=
 =?us-ascii?Q?lIjdKkEv5uQfJFvLilKLgYhjbRLjpPLl5rcel3nnHwmDQ9R+K1Bm9ahVVk5K?=
 =?us-ascii?Q?nfX5u2gj1ZYFPQ77642Dm9+alR0dRQQnboMsFZuL89aPNjd8mtDio2oYWynQ?=
 =?us-ascii?Q?nMBPFZIFf137LWY8Akjw4FmIV+oLb/Qk0W6RzDL9JE6NmJ5WeMUPoHVoWGB/?=
 =?us-ascii?Q?nF2UkpS0H8WeRELo3ilbcPBfu9Z4yD9qFgQv8npP7JajRrNrmMt8Pg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 01:32:42.7381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f82c24-1be5-4307-fe12-08dd514e78a2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5876
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_173254_207255_F0E73652 
X-CRM114-Status: GOOD (  12.89  )
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

Currently, IRQ_MSI_IOMMU is selected if DMA_IOMMU is available to provide
an implementation for iommu_dma_prepare/compose_msi_msg(). However, it'll
make more sense for irqchips that call prepare/compose to select it, and
that will trigger all the additional code and data to be compiled into
the kernel.

If IRQ_MSI_IOMMU is selected with no IOMMU side implementation, then the
prepare/compose() will be NOP stubs.

If IRQ_MSI_IOMMU is not selected by an irqchip, then the related code on
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
index c11b9965c4ad..64658a1c3aa1 100644
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
@@ -408,6 +411,7 @@ config LS_EXTIRQ
 
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


