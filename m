Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2513BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FImOli+KmCM0O774LNiUEy6eu+/NS9bNIJdq7jii8WY=; b=he9M1RUbUt+qq1+BaGYsUqZCnj
	Y+CJQeX/kPsnSCNiAutz805FN5mDpDo4G1wAt9M469SqgJ9fiQRDPRmKA/OnZBYwpWzFrfdXq+Dr/
	k7FXroeVcDG8MC7cB2vo0sbN6wY7FO83sluNV13rhacZkJjq8CzN7m6zpX/QqIa0M7mw5U5Z06RvG
	BmKD39bN2oHK1zX4uYiB2b9Ys1NP7FvYS8mgCo3+wSmqOv0PhxHoiC845PN6ujzzI+guFss0Yl8kX
	UFZjo2hDHvdwddntZKpeQhkcpeuRP4R/VFMyCYEWGYNw6oekSGdIobKTntH4wnV7U7d+vtWYEQ4sg
	QOZmgo4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdie-00000000JKx-1sWn;
	Thu, 01 May 2025 23:53:32 +0000
Received: from mail-bn7nam10on20619.outbound.protection.outlook.com ([2a01:111:f403:2009::619] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcv4-00000000A9K-0avl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 23:02:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHP23lT4y08wCrmIrFfoNBHHyZFoV3hKp4kx4TclHZPB8cR/iw93sFLLRfqNC/NDy3aSKP7Uj8Ylo106WGJ0/3W7MQzssVzlHR+Vn/Jyhwk2PeEi8N3TzQ+tOKgauTSUO9+TpOyohPpAP1MeWlhmd0D9yBGuqFZEmS6D7N6kYXxLTCfuE8+RiNxj7qaiKN9qnJpJbULZLCKGaQlHCftg/dYFU4KsLq8FZnod5qua5bBAiN++sJ99xVkHiaaUMAxICH+f4XmBwPMrZ48wNWuLhNrmt8ZrWTLRW/NrfQO2wU86mpSuAAb0VrnmXd3tg9fwBbMG6JbhSorK6hfEDbKqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FImOli+KmCM0O774LNiUEy6eu+/NS9bNIJdq7jii8WY=;
 b=l0CieSK9vD1U2hb/iKn+RdKJ7FgIHofh6lNMA93aWAkRwgY9UpDzYJWYlDUCJJBZWxXb8aIukNlf+cfMq9mu8Ba6XSHot6DVQ4t7fPoOIA64uV9461za9rZ2fhUihCXlr4hrJXFQ2sGpXW0lFIuITijiGNrsLTZ/kPFfHEU5qP523n8gcTnxQVjwOcP5hpkcqaZ4iuZCbvzD9AT2KJ+ap/77UvqhhBAps5dSSJLldQh9yVUmTcUB6b+8hb1nvDD9WOAAZ1mz8H3Y01URB0RZTx3n6t9Ip9+OcA3/yuh3x+vbkYy3FdGRdVRDeEsmaIBiNJNVOM8CO+kGXJGA7HUT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FImOli+KmCM0O774LNiUEy6eu+/NS9bNIJdq7jii8WY=;
 b=AHR5td5ySXX4ZrVeuq7bRdhJ6lbyfq5dXT/TsiuW/biw3VQehj+6np9bAWeWc5LweRkwPt7yZ763jzAdlJLYMGSXeOYcZ/ghKB0IToHceTnmHtQ+HlXd+Eh/fLDV5z+T6+GgR7I+XHMcv3y6IGmz8lXLYvUWjokDcmyA/ZGaIPIPaKVJiaEPRXs7XPbF1XI3i3KjEr5S44T/TRN9Nt08Esva5JJf/D/HH4DWwToqAFnI78xh8NmzTvQ+Xig2bif5QK+nTJJNyPkVfRz3uVa7Qong2QmZ0rbHqUFnXnz2hLELvTNpnEKwIHeQmxPYGT/f6TjPgSBi99JdqJJMdMOZ/w==
Received: from SN7PR04CA0215.namprd04.prod.outlook.com (2603:10b6:806:127::10)
 by DS2PR12MB9614.namprd12.prod.outlook.com (2603:10b6:8:276::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 23:02:10 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::55) by SN7PR04CA0215.outlook.office365.com
 (2603:10b6:806:127::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Thu,
 1 May 2025 23:02:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Thu, 1 May 2025 23:02:10 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 1 May 2025
 16:02:01 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 16:02:01 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 1 May 2025 16:01:59 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: [PATCH v3 11/23] iommufd/viommu: Add IOMMUFD_CMD_VQUEUE_ALLOC ioctl
Date: Thu, 1 May 2025 16:01:17 -0700
Message-ID: <1ef2e242ee1d844f823581a5365823d78c67ec6a.1746139811.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746139811.git.nicolinc@nvidia.com>
References: <cover.1746139811.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|DS2PR12MB9614:EE_
X-MS-Office365-Filtering-Correlation-Id: 72565d4a-d0d9-47c2-f609-08dd8904343b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xKTtyUFE2dLlCgWHCdOc61KI3MgKItRZmSCwy7r+pLH58HNVx6GpZ7yXG5n5?=
 =?us-ascii?Q?HqrblgIN+bUKVIiCU2Le9r1IN6fDYtWS+ckkW2VJ5DNFUpkRzyyZ+PyUJreO?=
 =?us-ascii?Q?0lDLOEO+FjMG0StQZwFnypgwZXfPtKR0UeChIN/6z8c0V1sZ89V1nOq64YeP?=
 =?us-ascii?Q?IcISq5PVvFR0wYPUP5c3vs0IeapisxmrFrV2tjGBNlVZXR8yU2qDydTt4ItW?=
 =?us-ascii?Q?TsAITHbnp9PQziNKn5gj5juHNlE/ZrbgXEQf9DGY70StWjPVv8I7HMmasfwj?=
 =?us-ascii?Q?Cs6mQ0vC6U42ZKW6bdmm26+Zn2kefenFXbNXSzxMWWffIL+4Q0ZdyGC1TQnq?=
 =?us-ascii?Q?+bxRH9MWw+HcmQbID0cEbDFa/RibzreqPISnhDOrnbzzNg5yFKuhRVEeXBhm?=
 =?us-ascii?Q?By2F4i5BFRmw1Os+AEto2jdlUa8MXHDW8M7pGaegzU1p2PkYPRwP2ZXInA2+?=
 =?us-ascii?Q?AxjQ6D3XUGymRWpXtbkCgv16i+OPt0Do0kReTEdmSBy/xzb9OhVAnyrCtckK?=
 =?us-ascii?Q?C8kMC+hP3W0HP0CGQthY0zbmR5NX09Qw+83R6RXFwXkc2Tl0PGNx80yzZ87/?=
 =?us-ascii?Q?9u4mnnXUTKlwJpkpgwgKlWz4bZ9z8sDwkCkjVqW+MEDnq+Inn0EMQKeoEXRq?=
 =?us-ascii?Q?wuRz27hQrabb7wSt7+VWeZAtOnQmPZZCN76rEgYK/X2QfKLNQpq5k/4a7F1b?=
 =?us-ascii?Q?+2/qKgY3zuV69Foy8KPUawVEoagosZcVDDU5NdFCIhgV5UmiRoIOAiozzrM7?=
 =?us-ascii?Q?l6j9ZIbGB8+JxNY1CIdwEF++ejH2eVL8PCPw8Pl4ifsL4ItzGMnpzSaJXrNm?=
 =?us-ascii?Q?KAl6Yy6CWwpUb/gCPD2w4jjg+bnB4sMT407xriK5m6DMQkjMpJgyWObUPze7?=
 =?us-ascii?Q?qt0RpJStbayiYc/+sFkiO5Scq9bo82FkLduzQSlLL0d+WjeMNx+xuA93+6dw?=
 =?us-ascii?Q?/bHS7HVYJq9ja19BkNVa3wvYlwGb/aJL1uLVEKxuLb1VHiGYoxb/qipOi0wZ?=
 =?us-ascii?Q?fbLzh/7FEsg1OsaeT8qrj4k03ULjzAtCPCxvfuDPh//Or9kF9UxArZ2Kibv0?=
 =?us-ascii?Q?m1HeC1VL4lyMP7/zUVhmAU1sKHmE4pYniaaQj7nGlQgcYRTOGa5EJDbKJAkw?=
 =?us-ascii?Q?qZXoSzvCrl+9JkTAF6V+XaI1IZmCFh7zyiaCh7+e987WDdWpUKnRCoj3B4XN?=
 =?us-ascii?Q?1RZSqFfVCHJf1rguPZis6Fgp0tNXY3J3ROTMOLGKoP4IJG8qiiLUR/qmhvlS?=
 =?us-ascii?Q?97APgWbJpr/Jqv/ZcVzDb3Dpid2AUR4jHzVY7Wn7tID7v1n8nq/O8hXyupK0?=
 =?us-ascii?Q?cnTN8S2xiW+vMeFK5o4FIAwYkcRxon+cDscW3w7IpU3TpdOfMH+9wuctPXMp?=
 =?us-ascii?Q?zAmzAOx0Wc/1itMWw3hTfnKs6hJKf8w9IYy5ZFvgjyVb5IhI/Gjh9IDfN6uD?=
 =?us-ascii?Q?xD1lAgIxzWSjpmPMHXhvvOjMfngaz3fgYdWqoAar3bJBiy/mrUepbnIPTrR0?=
 =?us-ascii?Q?67EzlSAxNvYEAeX/SRY6nAj1bYD73Bdpfdaa?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 23:02:10.4323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72565d4a-d0d9-47c2-f609-08dd8904343b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_160218_243575_69ADF4EF 
X-CRM114-Status: GOOD (  21.44  )
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

Introduce a new IOMMUFD_CMD_VQUEUE_ALLOC ioctl for user space to allocate
a vQUEUE object for a vIOMMU specific HW-accelerated virtual queue, e.g.:
 - NVIDIA's Virtual Command Queue
 - AMD vIOMMU's Command Buffer, Event Log Buffer, and PPR Log Buffer

This is a vIOMMU based ioctl. Simply increase the refcount of the vIOMMU.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h |  2 +
 include/uapi/linux/iommufd.h            | 44 +++++++++++
 drivers/iommu/iommufd/main.c            |  6 ++
 drivers/iommu/iommufd/viommu.c          | 99 +++++++++++++++++++++++++
 4 files changed, 151 insertions(+)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 79160b039bc7..595d5e7021c4 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -611,6 +611,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd);
 void iommufd_viommu_destroy(struct iommufd_object *obj);
 int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd);
 void iommufd_vdevice_destroy(struct iommufd_object *obj);
+int iommufd_vqueue_alloc_ioctl(struct iommufd_ucmd *ucmd);
+void iommufd_vqueue_destroy(struct iommufd_object *obj);
 
 #ifdef CONFIG_IOMMUFD_TEST
 int iommufd_test(struct iommufd_ucmd *ucmd);
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index cc90299a08d9..c6742bb00a41 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -56,6 +56,7 @@ enum {
 	IOMMUFD_CMD_VDEVICE_ALLOC = 0x91,
 	IOMMUFD_CMD_IOAS_CHANGE_PROCESS = 0x92,
 	IOMMUFD_CMD_VEVENTQ_ALLOC = 0x93,
+	IOMMUFD_CMD_VQUEUE_ALLOC = 0x94,
 };
 
 /**
@@ -1147,4 +1148,47 @@ struct iommu_veventq_alloc {
 	__u32 __reserved;
 };
 #define IOMMU_VEVENTQ_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VEVENTQ_ALLOC)
+
+/**
+ * enum iommu_vqueue_type - Virtual Queue Type
+ * @IOMMU_VQUEUE_TYPE_DEFAULT: Reserved for future use
+ */
+enum iommu_vqueue_type {
+	IOMMU_VQUEUE_TYPE_DEFAULT = 0,
+};
+
+/**
+ * struct iommu_vqueue_alloc - ioctl(IOMMU_VQUEUE_ALLOC)
+ * @size: sizeof(struct iommu_vqueue_alloc)
+ * @flags: Must be 0
+ * @viommu_id: Virtual IOMMU ID to associate the virtual queue with
+ * @type: One of enum iommu_vqueue_type
+ * @index: The logical index to the virtual queue per virtual IOMMU, for a multi
+ *         queue model
+ * @out_vqueue_id: The ID of the new virtual queue
+ * @addr: Base address of the queue memory in the guest physical address space
+ * @length: Length of the queue memory in the guest physical address space
+ *
+ * Allocate a virtual queue object for a vIOMMU-specific HW-acceleration feature
+ * that allows HW to access a guest queue memory described by @addr and @length.
+ * It's suggested for VMM to back the queue memory using a single huge page with
+ * a proper alignment for its contiguity in the host physical address space. The
+ * call will fail, if the queue memory is not contiguous in the physical address
+ * space. Upon success, its underlying physical pages will be pinned to prevent
+ * VMM from unmapping them in the IOAS, until the virtual queue gets destroyed.
+ *
+ * A vIOMMU can allocate multiple queues, but it must use a different @index to
+ * separate each allocation, e.g. VCMDQ0, VCMDQ1, ...
+ */
+struct iommu_vqueue_alloc {
+	__u32 size;
+	__u32 flags;
+	__u32 viommu_id;
+	__u32 type;
+	__u32 index;
+	__u32 out_vqueue_id;
+	__aligned_u64 addr;
+	__aligned_u64 length;
+};
+#define IOMMU_VQUEUE_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VQUEUE_ALLOC)
 #endif
diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 2b9ee9b4a424..23ed58f1f7b1 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -307,6 +307,7 @@ union ucmd_buffer {
 	struct iommu_veventq_alloc veventq;
 	struct iommu_vfio_ioas vfio_ioas;
 	struct iommu_viommu_alloc viommu;
+	struct iommu_vqueue_alloc vqueue;
 #ifdef CONFIG_IOMMUFD_TEST
 	struct iommu_test_cmd test;
 #endif
@@ -366,6 +367,8 @@ static const struct iommufd_ioctl_op iommufd_ioctl_ops[] = {
 		 __reserved),
 	IOCTL_OP(IOMMU_VIOMMU_ALLOC, iommufd_viommu_alloc_ioctl,
 		 struct iommu_viommu_alloc, out_viommu_id),
+	IOCTL_OP(IOMMU_VQUEUE_ALLOC, iommufd_vqueue_alloc_ioctl,
+		 struct iommu_vqueue_alloc, length),
 #ifdef CONFIG_IOMMUFD_TEST
 	IOCTL_OP(IOMMU_TEST_CMD, iommufd_test, struct iommu_test_cmd, last),
 #endif
@@ -511,6 +514,9 @@ static const struct iommufd_object_ops iommufd_object_ops[] = {
 	[IOMMUFD_OBJ_VIOMMU] = {
 		.destroy = iommufd_viommu_destroy,
 	},
+	[IOMMUFD_OBJ_VQUEUE] = {
+		.destroy = iommufd_vqueue_destroy,
+	},
 #ifdef CONFIG_IOMMUFD_TEST
 	[IOMMUFD_OBJ_SELFTEST] = {
 		.destroy = iommufd_selftest_destroy,
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index a65153458a26..10d985aae9a8 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -170,3 +170,102 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	iommufd_put_object(ucmd->ictx, &viommu->obj);
 	return rc;
 }
+
+void iommufd_vqueue_destroy(struct iommufd_object *obj)
+{
+	struct iommufd_vqueue *vqueue =
+		container_of(obj, struct iommufd_vqueue, obj);
+	struct iommufd_viommu *viommu = vqueue->viommu;
+
+	if (viommu->ops->vqueue_destroy)
+		viommu->ops->vqueue_destroy(vqueue);
+	iopt_unpin_pages(&viommu->hwpt->ioas->iopt, vqueue->addr,
+			 vqueue->length);
+	refcount_dec(&viommu->obj.users);
+}
+
+int iommufd_vqueue_alloc_ioctl(struct iommufd_ucmd *ucmd)
+{
+	struct iommu_vqueue_alloc *cmd = ucmd->cmd;
+	struct iommufd_viommu *viommu;
+	struct iommufd_vqueue *vqueue;
+	struct page **pages;
+	int max_npages, i;
+	dma_addr_t end;
+	int rc;
+
+	if (cmd->flags || cmd->type == IOMMU_VQUEUE_TYPE_DEFAULT)
+		return -EOPNOTSUPP;
+	if (!cmd->addr || !cmd->length)
+		return -EINVAL;
+	if (check_add_overflow(cmd->addr, cmd->length - 1, &end))
+		return -EOVERFLOW;
+
+	max_npages = DIV_ROUND_UP(cmd->length, PAGE_SIZE);
+	pages = kcalloc(max_npages, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	viommu = iommufd_get_viommu(ucmd, cmd->viommu_id);
+	if (IS_ERR(viommu)) {
+		rc = PTR_ERR(viommu);
+		goto out_free;
+	}
+
+	if (!viommu->ops || !viommu->ops->vqueue_alloc) {
+		rc = -EOPNOTSUPP;
+		goto out_put_viommu;
+	}
+
+	/* Quick test on the base address */
+	if (!iommu_iova_to_phys(viommu->hwpt->common.domain, cmd->addr)) {
+		rc = -ENXIO;
+		goto out_put_viommu;
+	}
+
+	/*
+	 * The underlying physical pages must be pinned to prevent them from
+	 * being unmapped (via IOMMUFD_CMD_IOAS_UNMAP) during the life cycle
+	 * of the vCMDQ object.
+	 */
+	rc = iopt_pin_pages(&viommu->hwpt->ioas->iopt, cmd->addr, cmd->length,
+			    pages, 0);
+	if (rc)
+		goto out_put_viommu;
+
+	/* Validate if the underlying physical pages are contiguous */
+	for (i = 1; i < max_npages && pages[i]; i++) {
+		if (page_to_pfn(pages[i]) == page_to_pfn(pages[i - 1]) + 1)
+			continue;
+		rc = -EFAULT;
+		goto out_unpin;
+	}
+
+	vqueue = viommu->ops->vqueue_alloc(viommu, cmd->type, cmd->index,
+					   cmd->addr, cmd->length);
+	if (IS_ERR(vqueue)) {
+		rc = PTR_ERR(vqueue);
+		goto out_unpin;
+	}
+
+	vqueue->viommu = viommu;
+	refcount_inc(&viommu->obj.users);
+	vqueue->addr = cmd->addr;
+	vqueue->ictx = ucmd->ictx;
+	vqueue->length = cmd->length;
+	cmd->out_vqueue_id = vqueue->obj.id;
+	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
+	if (rc)
+		iommufd_object_abort_and_destroy(ucmd->ictx, &vqueue->obj);
+	else
+		iommufd_object_finalize(ucmd->ictx, &vqueue->obj);
+	goto out_put_viommu;
+
+out_unpin:
+	iopt_unpin_pages(&viommu->hwpt->ioas->iopt, cmd->addr, cmd->length);
+out_put_viommu:
+	iommufd_put_object(ucmd->ictx, &viommu->obj);
+out_free:
+	kfree(pages);
+	return rc;
+}
-- 
2.43.0


