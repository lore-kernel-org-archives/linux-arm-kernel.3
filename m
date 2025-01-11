Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F19E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 03:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rr0DXbv7kb/qvmBC/kAEsXc6kWh8WXNBvDKquAd8r4c=; b=Ferh4wRBFeEyGXL/guXcRZz6sX
	b6LbZGWypmMUKTChzOw3ug/ANJuX69Z40wKoYaNish2VQMCwXqM3aMK7iW9xnFeFWCiJjDTkgyNXx
	Vl//8uaubbKiViGeQS6BG8wr4sH1Dpgie/Y4ryf4vBU6720hd2h4Zswaody82KYVT5ejmgw5v1va+
	F+j/4xvv7mV+cgQ8PoWUV+gQNwazuZO+FQu6yOnNq8EAmpyGYDyPpbTm9Sqmxd2BAEw7r/bbg64KT
	o5kbouU0gR2XbnhZsWOlBGSLaAw4LnSg4GmCjjbSDXACYHlm/wMU8XRxImQ1TVs2yqO94jNkbL2oJ
	hGZKn9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWSRA-000000005W1-3gSk;
	Sat, 11 Jan 2025 03:45:24 +0000
Received: from mail-bn7nam10on2061a.outbound.protection.outlook.com ([2a01:111:f403:2009::61a] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWSFb-0000000036K-3wZ4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 03:33:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecoP1zfp+6z2b/H6nPdIZWEDGlKsNFZpute+kOjijeKatK2NYOXfmsfu2liTu2LDv9ew7KuX9yIwXyYuoxE4Od+7c+gzNqVglmaJ6yWYxgykjai4jp/Hr/sFmIlhvMD078iFafZCVhwkPSa1cFYksE4mSZQjTWPWhu8shCV+KX2qscVNI66qheArIwjrUdugUmIzRLb+YDsArKy/vMeARSaZa8HIrMAWLNv/V93D4Uj8hP4IWMuTfQPZwm0XQ6CZFOpDBm5k4LUvl+gh/cKd3XhZRHPomrv5NKaDyfLptylZgGVsb7MSnzP7UB+leOVsfPJxPpf1A70xQvvW+XA0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rr0DXbv7kb/qvmBC/kAEsXc6kWh8WXNBvDKquAd8r4c=;
 b=rg39f0donZCEt041f+jRv1X16Tso50yhTb8lYmHmJR1EyPu6a2rXCnoi0wLugayi+jnhl9uRBxccFW5zp7PSm+/QT03YGFCw2Dhn1gM+jsYr2i6YtKPwEJhXQ0k3y8KDd3RoGGCRlm3w7XO0jKKa5am7CrUoTqaikzNwrFd7XeyYhygWXK4JJ2q/oNEtMpzxduHQw/e/4Esjqbcm4PsSaG8jVUipEwa8WL+FtXXyP5SNELd1wB2cYQdyQ3SyUW8AgQNpF6s3b5/96betwyPRodYiWINkmwGVUN6Dpo5OQttRsao4rzUEYYkJC1Sz7F68lzPWEjHPk7HQJVEWeau8WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr0DXbv7kb/qvmBC/kAEsXc6kWh8WXNBvDKquAd8r4c=;
 b=oRVH7+xiwtzUKsV7Qmpv/SnwJvtOb0+/T4tr+G/3/r5twOD2oByQeOyzAHycjU8GgEELjmxaEuU5EZi8Dm4yNQyRKJRV5duFvIIDOTRHRovuQlcXXTyLpEeiiN2HSoE0EnuyneEgAIqG2n+T17F5K0UcnGzVRhgAl953Op/ocGZP7eh2njYPx7a56ZbMnhjLtx1rPpe7yWu4vH9B2BJXYTb7wEq51eNgI/CpmXvQlXMoPPeJUW7IoF4spTwqWODgrjUpJmYXrg3aSWsnG7yFaJz3E0MMvZKkBb5uAcABPS3fR7ekamx3m3ODErICcV1qZIeGpQdogSGYQLdaFRDoFw==
Received: from DM5PR08CA0060.namprd08.prod.outlook.com (2603:10b6:4:60::49) by
 DM4PR12MB8498.namprd12.prod.outlook.com (2603:10b6:8:183::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.11; Sat, 11 Jan 2025 03:33:22 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:4:60:cafe::75) by DM5PR08CA0060.outlook.office365.com
 (2603:10b6:4:60::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.15 via Frontend Transport; Sat,
 11 Jan 2025 03:33:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Sat, 11 Jan 2025 03:33:21 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 19:33:09 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 19:33:09 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 10 Jan 2025 19:33:07 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>, <tglx@linutronix.de>, <maz@kernel.org>,
	<alex.williamson@redhat.com>
CC: <joro@8bytes.org>, <shuah@kernel.org>, <reinette.chatre@intel.com>,
	<eric.auger@redhat.com>, <yebin10@huawei.com>, <apatel@ventanamicro.com>,
	<shivamurthy.shastri@linutronix.de>, <bhelgaas@google.com>,
	<anna-maria@linutronix.de>, <yury.norov@gmail.com>, <nipun.gupta@amd.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvm@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>
Subject: [PATCH RFCv2 09/13] iommufd: Add IOMMU_OPTION_SW_MSI_START/SIZE ioctls
Date: Fri, 10 Jan 2025 19:32:25 -0800
Message-ID: <d3cb1694e07be0e214dc44dcb2cb74f014606560.1736550979.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736550979.git.nicolinc@nvidia.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|DM4PR12MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: e468d863-70bb-4b9c-33fd-08dd31f0b2f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7GqBABfTkebMXNS9W1PmCEMSv74bYeDLnHMFzogRQfUZYDA0buWi4ZsuzkzQ?=
 =?us-ascii?Q?ZuTCcKKcQCUVFp52DTmouv8g3ATjLdXJKl7ZaOHVPZk9FDL7ZnN9+uxQivUv?=
 =?us-ascii?Q?gayqRr0yq2/L9UHuW4ZO1rov4DRizQhsymUBEORoEagv+dqi1WDhiwnApu1l?=
 =?us-ascii?Q?t/vfSU8IG7jEZ12dGsjafZ9G1oKw48ufrunJF8wLnJAmu6FbSyOhEfaqxhYq?=
 =?us-ascii?Q?IxLWkwiqFH9FxwtKlcR5jDaxdY3WTpqlXokeCOxzD6YmFe4+1IioXmUrfdDJ?=
 =?us-ascii?Q?oy1tEPzQ41vWSjIS/C0WRqJhz/djPyQ6PGElUeZwC4qWfvUC46tnTzEeAPTG?=
 =?us-ascii?Q?wQSJjDeDzVcy/OWNk13lZCmQLbvtHIdkXVWrmoOsPdcktpff6DP+YZedX3vT?=
 =?us-ascii?Q?WuF8whnlSnnLSoc8RUOA0cpR9eAwTs0i4+B6krycIg3XfTHUSEaKG2+6jvHK?=
 =?us-ascii?Q?zV0Z76VT3bgpsFWCeboz4mIcCm15fiu7toJgj4ZRBWdXORytqJhZLEJZzVKB?=
 =?us-ascii?Q?TACHRWJmftnzu+67AZYQW4T5rwVSqgodcmYYPPNm+4I6lGxy3Jjq9fikAm6k?=
 =?us-ascii?Q?rcYeudeTBunj2vcnysrftsqQmmmnUgI8Ava/C+ftbmJsp0gcEhM1IevVkKVB?=
 =?us-ascii?Q?lAknfkfpp0iP/towmZrn918SRvwcqEJRYrvLwQdVHq3ZKHyO4KG5Ae3UpADF?=
 =?us-ascii?Q?IDY/CUJA0hunjgCZ4Tuh38d4C7rDcQmyMwFthhoLreYaVPI0v2JYNkYZOeAW?=
 =?us-ascii?Q?2sKMS/Z1pePBXr32KUM84FE2YmFoNK48OHXgB+FchgmPOS/BtcFkXVGZRs8Z?=
 =?us-ascii?Q?dzvfvpCWTALjF4qug2XyUUVDUjVwipFcWOPH0ISvRJ0KN0gD2R5Jnox98zv9?=
 =?us-ascii?Q?AFXjerRHHikxKe0wkzzV2ZhGAy3vWV9YCJRPRl1jOdD3FH/Wczv5aOMZKb2c?=
 =?us-ascii?Q?C0C/GfIbKzGV5eRRj9Ih9UZXmvmYYYRrPToA7RziZwpQLfk7MzeLL3iWSs7n?=
 =?us-ascii?Q?MSgMNecTfaQvDLNZtgW7S5zSYGdlPXZWaotnxIPHL6QakAjxSnPy/1I/XZBP?=
 =?us-ascii?Q?YGkJL08quDLlDn5vw4RDjJj+POSe1IMOOChEw1eoJ36O1C39HsGrcFJrCiS2?=
 =?us-ascii?Q?K01OLEJZaeyRdTRdzWy8WP9K17JwBH3z61/eDbV53sBBBIEJUyeyl0MFibrg?=
 =?us-ascii?Q?u4W3lXGhdq2Pa+oGZph3rSwi9eKEf5gZ8KUh0mqw7bCtePUBUtEV9ELIMx01?=
 =?us-ascii?Q?j+TbC+2Ur6Ccsv4nRXUc3MoS02c2yLvSHQ7VBcvqE8J/gXCOcU7S84wV1Cfr?=
 =?us-ascii?Q?P8FFMyv1aOLn6eGs5dsAsyxyIgaEO6TSQUg+e6pUUwnEC2pqunOlicejBoxh?=
 =?us-ascii?Q?liG0wp5ULGwA0uibCLbSInvqILPWJacXknGOpQt8hARsTN1EOyATSmbayTSI?=
 =?us-ascii?Q?33wricVSJxjIPXYapPh9sqoeeYmTtBKNNy190nQtBUWvbz9EQ4sSFec7n4Ng?=
 =?us-ascii?Q?MOdjK2j+kU+DNVo=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2025 03:33:21.9972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e468d863-70bb-4b9c-33fd-08dd31f0b2f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_193328_050858_DE5F5127 
X-CRM114-Status: GOOD (  24.31  )
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

For systems that require MSI pages to be mapped into the IOMMU translation
the IOMMU driver provides an IOMMU_RESV_SW_MSI range, which is the default
recommended IOVA window to place these mappings. However, there is nothing
special about this address. And to support the RMR trick in VMM for nested
translation, the VMM needs to know what sw_msi window the kernel is using.
As there is no particular reason to force VMM to adopt the kernel default,
provide a simple IOMMU_OPTION_SW_MSI_START/SIZE ioctl that the VMM can use
to directly specify the sw_msi window that it wants to use, which replaces
and disables the default IOMMU_RESV_SW_MSI from the driver to avoid having
to build an API to discover the default IOMMU_RESV_SW_MSI.

Since iommufd now has its own sw_msi function, this is easy to implement.

To keep things simple, the parameters are global to the entire iommufd FD,
and will directly replace the IOMMU_RESV_SW_MSI values. The VMM must set
the values before creating any hwpt's to have any effect.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h |  4 +++
 include/uapi/linux/iommufd.h            | 18 ++++++++++++-
 drivers/iommu/iommufd/device.c          |  4 +++
 drivers/iommu/iommufd/io_pagetable.c    |  4 ++-
 drivers/iommu/iommufd/ioas.c            | 34 +++++++++++++++++++++++++
 drivers/iommu/iommufd/main.c            |  6 +++++
 6 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 3e83bbb5912c..9f071609f00b 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -45,6 +45,9 @@ struct iommufd_ctx {
 	struct mutex sw_msi_lock;
 	struct list_head sw_msi_list;
 	unsigned int sw_msi_id;
+	/* User-programmed SW_MSI region, to override igroup->sw_msi_start */
+	phys_addr_t sw_msi_start;
+	size_t sw_msi_size;
 
 	u8 account_mode;
 	/* Compatibility with VFIO no iommu */
@@ -281,6 +284,7 @@ int iommufd_ioas_unmap(struct iommufd_ucmd *ucmd);
 int iommufd_ioas_option(struct iommufd_ucmd *ucmd);
 int iommufd_option_rlimit_mode(struct iommu_option *cmd,
 			       struct iommufd_ctx *ictx);
+int iommufd_option_sw_msi(struct iommu_option *cmd, struct iommufd_ctx *ictx);
 
 int iommufd_vfio_ioas(struct iommufd_ucmd *ucmd);
 int iommufd_check_iova_range(struct io_pagetable *iopt,
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index 34810f6ae2b5..c864a201e502 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -294,7 +294,9 @@ struct iommu_ioas_unmap {
 
 /**
  * enum iommufd_option - ioctl(IOMMU_OPTION_RLIMIT_MODE) and
- *                       ioctl(IOMMU_OPTION_HUGE_PAGES)
+ *                       ioctl(IOMMU_OPTION_HUGE_PAGES) and
+ *                       ioctl(IOMMU_OPTION_SW_MSI_START) and
+ *                       ioctl(IOMMU_OPTION_SW_MSI_SIZE)
  * @IOMMU_OPTION_RLIMIT_MODE:
  *    Change how RLIMIT_MEMLOCK accounting works. The caller must have privilege
  *    to invoke this. Value 0 (default) is user based accounting, 1 uses process
@@ -304,10 +306,24 @@ struct iommu_ioas_unmap {
  *    iommu mappings. Value 0 disables combining, everything is mapped to
  *    PAGE_SIZE. This can be useful for benchmarking.  This is a per-IOAS
  *    option, the object_id must be the IOAS ID.
+ * @IOMMU_OPTION_SW_MSI_START:
+ *    Change the base address of the IOMMU mapping region for MSI doorbell(s).
+ *    It must be set this before attaching a device to an IOAS/HWPT, otherwise
+ *    this option will be not effective on that IOAS/HWPT. User can choose to
+ *    let kernel pick a base address, by simply ignoring this option or setting
+ *    a value 0 to IOMMU_OPTION_SW_MSI_SIZE. Global option, object_id must be 0
+ * @IOMMU_OPTION_SW_MSI_SIZE:
+ *    Change the size of the IOMMU mapping region for MSI doorbell(s). It must
+ *    be set this before attaching a device to an IOAS/HWPT, otherwise it won't
+ *    be effective on that IOAS/HWPT. The value is in MB, and the minimum value
+ *    is 1 MB. A value 0 (default) will invalidate the MSI doorbell base address
+ *    value set to IOMMU_OPTION_SW_MSI_START. Global option, object_id must be 0
  */
 enum iommufd_option {
 	IOMMU_OPTION_RLIMIT_MODE = 0,
 	IOMMU_OPTION_HUGE_PAGES = 1,
+	IOMMU_OPTION_SW_MSI_START = 2,
+	IOMMU_OPTION_SW_MSI_SIZE = 3,
 };
 
 /**
diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index f75b3c23cd41..093a3bd798db 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -445,10 +445,14 @@ static int
 iommufd_device_attach_reserved_iova(struct iommufd_device *idev,
 				    struct iommufd_hwpt_paging *hwpt_paging)
 {
+	struct iommufd_ctx *ictx = idev->ictx;
 	int rc;
 
 	lockdep_assert_held(&idev->igroup->lock);
 
+	/* Override it with a user-programmed SW_MSI region */
+	if (ictx->sw_msi_size && ictx->sw_msi_start != PHYS_ADDR_MAX)
+		idev->igroup->sw_msi_start = ictx->sw_msi_start;
 	rc = iopt_table_enforce_dev_resv_regions(&hwpt_paging->ioas->iopt,
 						 idev->dev,
 						 &idev->igroup->sw_msi_start);
diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
index 8a790e597e12..5d7f5ca1eecf 100644
--- a/drivers/iommu/iommufd/io_pagetable.c
+++ b/drivers/iommu/iommufd/io_pagetable.c
@@ -1446,7 +1446,9 @@ int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
 		if (sw_msi_start && resv->type == IOMMU_RESV_MSI)
 			num_hw_msi++;
 		if (sw_msi_start && resv->type == IOMMU_RESV_SW_MSI) {
-			*sw_msi_start = resv->start;
+			/* Bypass the driver-defined SW_MSI region, if preset */
+			if (*sw_msi_start == PHYS_ADDR_MAX)
+				*sw_msi_start = resv->start;
 			num_sw_msi++;
 		}
 
diff --git a/drivers/iommu/iommufd/ioas.c b/drivers/iommu/iommufd/ioas.c
index 1542c5fd10a8..3f4e25b660f9 100644
--- a/drivers/iommu/iommufd/ioas.c
+++ b/drivers/iommu/iommufd/ioas.c
@@ -620,6 +620,40 @@ int iommufd_option_rlimit_mode(struct iommu_option *cmd,
 	return -EOPNOTSUPP;
 }
 
+int iommufd_option_sw_msi(struct iommu_option *cmd, struct iommufd_ctx *ictx)
+{
+	if (cmd->object_id)
+		return -EOPNOTSUPP;
+
+	if (cmd->op == IOMMU_OPTION_OP_GET) {
+		switch (cmd->option_id) {
+		case IOMMU_OPTION_SW_MSI_START:
+			cmd->val64 = (u64)ictx->sw_msi_start;
+			break;
+		case IOMMU_OPTION_SW_MSI_SIZE:
+			cmd->val64 = (u64)ictx->sw_msi_size;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		return 0;
+	}
+	if (cmd->op == IOMMU_OPTION_OP_SET) {
+		switch (cmd->option_id) {
+		case IOMMU_OPTION_SW_MSI_START:
+			ictx->sw_msi_start = (phys_addr_t)cmd->val64;
+			break;
+		case IOMMU_OPTION_SW_MSI_SIZE:
+			ictx->sw_msi_size = (size_t)cmd->val64;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		return 0;
+	}
+	return -EOPNOTSUPP;
+}
+
 static int iommufd_ioas_option_huge_pages(struct iommu_option *cmd,
 					  struct iommufd_ioas *ioas)
 {
diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 7cc9497b7193..026297265c71 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -229,6 +229,8 @@ static int iommufd_fops_open(struct inode *inode, struct file *filp)
 	init_waitqueue_head(&ictx->destroy_wait);
 	mutex_init(&ictx->sw_msi_lock);
 	INIT_LIST_HEAD(&ictx->sw_msi_list);
+	ictx->sw_msi_start = PHYS_ADDR_MAX;
+	ictx->sw_msi_size = 0;
 	filp->private_data = ictx;
 	return 0;
 }
@@ -287,6 +289,10 @@ static int iommufd_option(struct iommufd_ucmd *ucmd)
 	case IOMMU_OPTION_RLIMIT_MODE:
 		rc = iommufd_option_rlimit_mode(cmd, ucmd->ictx);
 		break;
+	case IOMMU_OPTION_SW_MSI_START:
+	case IOMMU_OPTION_SW_MSI_SIZE:
+		rc = iommufd_option_sw_msi(cmd, ucmd->ictx);
+		break;
 	case IOMMU_OPTION_HUGE_PAGES:
 		rc = iommufd_ioas_option(ucmd);
 		break;
-- 
2.43.0


