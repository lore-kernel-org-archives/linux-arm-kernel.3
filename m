Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B41BC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 01:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acW0S5k5hHt+4NfoiCK3qvkmVvwOp9eUk47jacOLW/s=; b=yvG7CtX/CPCcysIXrosXqQf8yO
	WMiNDHpbpQuq6vB0oIQBlfdS01yUXHxriUUFfy8r9UCA0o8m8C4QXwl9tMKGU22fY00k5Q0ruhsOG
	WHFhTUIVo2ziraef1BhRqI9qqynSVXpbwiMA6JLL7Fd0+hVNvfH+bE2cva+l/k9UpvV6h5FaR5Vjh
	eUcHfl9MML8Izl5zxjVRIhLGyN9rN0bv9E/8mXFR1Jf3JFEv3JsCyAqaA5R23sAVSaDuJE1usSc7g
	yUt+jcBBeEcVCedZeOB2zr8xqvvcuoTf/UI/21hMtcZ61uRsgtjbpxaeMMv0SYpA8IY3pVZNw6ZfO
	dsC/hKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXrtP-0000000FpJC-3pgw;
	Sat, 05 Jul 2025 01:40:39 +0000
Received: from mail-mw2nam10on20630.outbound.protection.outlook.com ([2a01:111:f403:2412::630] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXrU2-0000000FlXT-3lLN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 01:14:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uiry5ev3GjkwQsYxFBDT/GZ2AWv2BcEL3i9SGdFyPLATiS2u6WMDYY9QMXluSbm+VGMeOD0eGN7bI2tn/Q+LJlCRYlEp6R7enTTsW5GlTokFd76pYCtxqPqWNIMEIBZkv+HrBjmVx289sVzyjFYQvjMwkbihHNa1H2YU0/lV8EVYlmbzYSeHPx2VaF18dOJ0YoCz4FY/adsaYaiIeccncJjs+tA4NTAVDbFDZB7QfYfrNWkycYdTDC42QM+sD13e90GrvfClgB5MIUelW4EQXq5v7IQKefZcf9OFcuddlDBAef5Z3XnRhK7vlbM6s9fFgBr5D46F61rE1EXLo/cJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acW0S5k5hHt+4NfoiCK3qvkmVvwOp9eUk47jacOLW/s=;
 b=NNPku82Q40uZqsqUt9mn+AD2cZB4CPAYgTUEw6DArrSmLLA2gL/vLkLK6ebQILGM8jQsJ8IWkkPN8ZGFNklKyc6wD4YE+aWxJBS8eCtU6VCGJaU+SLCZ4l8rDJd5gtML9Gd6MkZVFKAuogGZBLuKr8j0W6WwJqW/Pu6cTC76Nda+gK6uMCceTnuvqG0oWMkwMtv8oHUSXPIFYP86AgAhABqJmwQgadpOgKYEvGcdLLfHWwRyvzQUR/bvrBp9pqHaLVebWpddl/Bo+u+NlQI+zoeQV1f+qo+x2EOST5zk+VnjZq/LJcFdUuvG+rQfzoCjCcYBwWltlgt2I3HoHIvbFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acW0S5k5hHt+4NfoiCK3qvkmVvwOp9eUk47jacOLW/s=;
 b=H2SNlkGwS63aOm8F+Pc6h2fD84vAhWHjZX6+hS/7G7h1UIuLie9wzvYhB1QiSxwej9CoyKm3fKrnlE5SyarZ1LYULNpPG9YtAOWPu0+6QEjoAWmW8kPW6k0NCHSUhQatdjRHOu+qi85MR/w19OrnMEmaJh3SVi9ZB6sBjViBjfljqthIKnY5h4rcN/iuuLz8+yN7Z/8VGFCDsuHB4zV48fCPLuPLnWeeAzp6ITtDmcrZEC36vy/OFrFPBriWxbLdUD9fq/jt8kJBGslJ4Rlr3SwwT6LOFP6DpS8qygcjM/YhyKSHCHY1Clcrt2xREPvEcDwve8Re3+nHGwRxwUuwTQ==
Received: from SJ0PR05CA0149.namprd05.prod.outlook.com (2603:10b6:a03:33d::34)
 by CY3PR12MB9701.namprd12.prod.outlook.com (2603:10b6:930:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Sat, 5 Jul
 2025 01:14:22 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::88) by SJ0PR05CA0149.outlook.office365.com
 (2603:10b6:a03:33d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.12 via Frontend Transport; Sat,
 5 Jul 2025 01:14:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Sat, 5 Jul 2025 01:14:22 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 4 Jul 2025
 18:14:14 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 4 Jul 2025 18:14:13 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 4 Jul 2025 18:14:12 -0700
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
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: [PATCH v8 12/29] iommufd/viommu: Add driver-defined vDEVICE support
Date: Fri, 4 Jul 2025 18:13:28 -0700
Message-ID: <d6fa98ad18a44d3df2ad9c9320f364affa9c03f5.1751677708.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751677708.git.nicolinc@nvidia.com>
References: <cover.1751677708.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|CY3PR12MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: a763af50-e5d2-4312-4b1e-08ddbb614649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MTBInuOHZWxec3XM4yJ3arxo2rJtJZlWYHjXetAPaFXZ87SQCLVCSeXw7WtU?=
 =?us-ascii?Q?oje0FVhch1KjB/9+Kl2vb2GNgTU6F+ZT/HyiyDOQR92Oqd2Trp/aGtsNLdE6?=
 =?us-ascii?Q?ABy2MMqgnb3dInEq9heTfQYlG9PtU3TLN2p0t7XrMS89jG0GUYIazo9nWZYF?=
 =?us-ascii?Q?AwKKBfkpY7pk8Subd1mXadAOlLSn372DDB4yBt7r0rcMRP4edMzXgbiLxUdk?=
 =?us-ascii?Q?ydwroAQi6Gu50wrlkRiFwY/x0Hce6KE6FTaDsS3wU3fzDGbyqljXdNQKJlLl?=
 =?us-ascii?Q?hEuMbyjN4hzF9cxu3CZUTfAwwa0e3w53sIhTRqGu1qieGnNVzw697qruhOC1?=
 =?us-ascii?Q?z1aTQhW+Kn+rirI2SHR85syj/EgvVg9YtHE6tcXUalf6/Wn4P03J7eobB5Co?=
 =?us-ascii?Q?grVn2U6x2UrYQ5IvCvWNCtek0xGIifWJFolM9DyavX3JMuii6eeBPbZcdQUO?=
 =?us-ascii?Q?K/v0A6X7vbbK5wikySSncfjWc6xCwtKtkTD3Vw/0/tTrFFz47wNQAErx8ga7?=
 =?us-ascii?Q?i8JO1ZNiomm4Lb0YMKSERD0AX/d2hnntS8PY33wbau2zSksEj4FACxyAuCP3?=
 =?us-ascii?Q?sJGr+YUYHXnsDf+5NuCYNrgrDZMNnapxLabFzY2GV1qCeHDJUaLVliWH7eig?=
 =?us-ascii?Q?HsJes/so6ESprNNSHO4zSPrOtonhwKwZ9CIbRtBYKuaLQY00lFsMY8+tYH3X?=
 =?us-ascii?Q?EP6rUSieQB9CP6XbUJzNLAw8RhTRq6ypkjKbdM3M9/KcIWwBEGSK39/GYoyN?=
 =?us-ascii?Q?f+wTlTwCETD6g4JZYXp6U5OB/q/gDBxTXJGk83qo0UocxckfDEfonNuwyMgL?=
 =?us-ascii?Q?PTPxmrLgfnyUn+04PVALAo1bhpcE3jLrHXzWaSCGWdOYSty1pQ4fAGT8Avbv?=
 =?us-ascii?Q?YxOm33myM3tkSxeUPXpZbW4M69JlUK0SngffneB/JZUlc7vjcVFJzoR0K/Xj?=
 =?us-ascii?Q?imomitmuBrxodu0xznnj6RLHy55r6Ej5jb2gmO0zok7CH46InB+stGZm59E9?=
 =?us-ascii?Q?/F5hMFufuPcvADF/HJyLD+okM5fmFrr//feM69tAi31cDEiYFbeY7YBK1WAE?=
 =?us-ascii?Q?0adwqKjY0wf8rnQ4XFmUmmcUfyB08TiKTHAEiEv/73Cq72REf/nbV32Df+yY?=
 =?us-ascii?Q?K44BW0jYOpYGvXU+h0jAfRKge5NfRAgN32BiAIzjvUVOJZl1VNs/VotuGo/I?=
 =?us-ascii?Q?2g5ShqhFm/CDVAwUgRmmu4qrslopR8iMjowwGXKmo61Tr0ia3OadsNJOGvsW?=
 =?us-ascii?Q?e8dHFpi+42lEqvza8EOwbcpYFtBIezZ0O+ULPoI8C1AcbPw9R96zsMIpChe6?=
 =?us-ascii?Q?20Bjccqx/TuIVBZzjV/TJHiqL8ld/WK1/QfT1GCT4bk2NEtMywHtpC2EEScQ?=
 =?us-ascii?Q?grMaUjnwU6qLzucESaAxZuCosinG2SCPW3IT4ZfTgKmznLV/QzdPQJ4UO80+?=
 =?us-ascii?Q?Eikv59wG/imwOmzTomGQaMjYOWHxIXyBsRB2vMA78NU9LUMFfy2ixM/fR7bT?=
 =?us-ascii?Q?krDYsSxIvuvDIseVgBoRZbX5tnfrvi6Gevg7?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 01:14:22.0883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a763af50-e5d2-4312-4b1e-08ddbb614649
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_181426_963839_551C9EFA 
X-CRM114-Status: GOOD (  23.79  )
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

NVIDIA VCMDQ driver will have a driver-defined vDEVICE structure and do
some HW configurations with that.

To allow IOMMU drivers to define their own vDEVICE structures, move the
struct iommufd_vdevice to the public header and provide a pair of viommu
ops, similar to get_viommu_size and viommu_init.

Doing this, however, creates a new window between the vDEVICE allocation
and its driver-level initialization, during which an abort could happen
but it can't invoke a driver destroy function from the struct viommu_ops
since the driver structure isn't initialized yet. vIOMMU object doesn't
have this problem, since its destroy op is set via the viommu_ops by the
driver viommu_init function. Thus, vDEVICE should do something similar:
add a destroy function pointer inside the struct iommufd_vdevice instead
of the struct iommufd_viommu_ops.

Note that there is unlikely a use case for a type dependent vDEVICE, so
a static vdevice_size is probably enough for the near term instead of a
get_vdevice_size function op.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h | 12 ----------
 include/linux/iommufd.h                 | 31 +++++++++++++++++++++++++
 drivers/iommu/iommufd/viommu.c          | 26 ++++++++++++++++++++-
 3 files changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 9fdbf5f21f2e..06b8c2e2d9e6 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -653,18 +653,6 @@ void iommufd_viommu_destroy(struct iommufd_object *obj);
 int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd);
 void iommufd_vdevice_destroy(struct iommufd_object *obj);
 
-struct iommufd_vdevice {
-	struct iommufd_object obj;
-	struct iommufd_viommu *viommu;
-	struct device *dev;
-
-	/*
-	 * Virtual device ID per vIOMMU, e.g. vSID of ARM SMMUv3, vDeviceID of
-	 * AMD IOMMU, and vRID of Intel VT-d
-	 */
-	u64 virt_id;
-};
-
 #ifdef CONFIG_IOMMUFD_TEST
 int iommufd_test(struct iommufd_ucmd *ucmd);
 void iommufd_selftest_destroy(struct iommufd_object *obj);
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 2d1bf2f97ee3..bdd10a85eeef 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -104,6 +104,21 @@ struct iommufd_viommu {
 	enum iommu_viommu_type type;
 };
 
+struct iommufd_vdevice {
+	struct iommufd_object obj;
+	struct iommufd_viommu *viommu;
+	struct device *dev;
+
+	/*
+	 * Virtual device ID per vIOMMU, e.g. vSID of ARM SMMUv3, vDeviceID of
+	 * AMD IOMMU, and vRID of Intel VT-d
+	 */
+	u64 virt_id;
+
+	/* Clean up all driver-specific parts of an iommufd_vdevice */
+	void (*destroy)(struct iommufd_vdevice *vdev);
+};
+
 /**
  * struct iommufd_viommu_ops - vIOMMU specific operations
  * @destroy: Clean up all driver-specific parts of an iommufd_viommu. The memory
@@ -120,6 +135,14 @@ struct iommufd_viommu {
  *                    array->entry_num to report the number of handled requests.
  *                    The data structure of the array entry must be defined in
  *                    include/uapi/linux/iommufd.h
+ * @vdevice_size: Size of the driver-defined vDEVICE structure per this vIOMMU
+ * @vdevice_init: Initialize the driver-level structure of a vDEVICE object, or
+ *                related HW procedure. @vdev is already initialized by iommufd
+ *                core: vdev->dev and vdev->viommu pointers; vdev->id carries a
+ *                per-vIOMMU virtual ID (refer to struct iommu_vdevice_alloc in
+ *                include/uapi/linux/iommufd.h)
+ *                If driver has a deinit function to revert what vdevice_init op
+ *                does, it should set it to the @vdev->destroy function pointer
  */
 struct iommufd_viommu_ops {
 	void (*destroy)(struct iommufd_viommu *viommu);
@@ -128,6 +151,8 @@ struct iommufd_viommu_ops {
 		const struct iommu_user_data *user_data);
 	int (*cache_invalidate)(struct iommufd_viommu *viommu,
 				struct iommu_user_data_array *array);
+	const size_t vdevice_size;
+	int (*vdevice_init)(struct iommufd_vdevice *vdev);
 };
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
@@ -224,4 +249,10 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 	 BUILD_BUG_ON_ZERO(offsetof(drv_struct, member)) +                     \
 	 BUILD_BUG_ON_ZERO(!__same_type(struct iommufd_viommu,                 \
 					((drv_struct *)NULL)->member)))
+
+#define VDEVICE_STRUCT_SIZE(drv_struct, member)                                \
+	(sizeof(drv_struct) +                                                  \
+	 BUILD_BUG_ON_ZERO(offsetof(drv_struct, member)) +                     \
+	 BUILD_BUG_ON_ZERO(!__same_type(struct iommufd_vdevice,                \
+					((drv_struct *)NULL)->member)))
 #endif
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index c0365849f849..081ee6697a11 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -116,6 +116,8 @@ void iommufd_vdevice_destroy(struct iommufd_object *obj)
 		container_of(obj, struct iommufd_vdevice, obj);
 	struct iommufd_viommu *viommu = vdev->viommu;
 
+	if (vdev->destroy)
+		vdev->destroy(vdev);
 	/* xa_cmpxchg is okay to fail if alloc failed xa_cmpxchg previously */
 	xa_cmpxchg(&viommu->vdevs, vdev->virt_id, vdev, NULL, GFP_KERNEL);
 	refcount_dec(&viommu->obj.users);
@@ -126,6 +128,7 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
 {
 	struct iommu_vdevice_alloc *cmd = ucmd->cmd;
 	struct iommufd_vdevice *vdev, *curr;
+	size_t vdev_size = sizeof(*vdev);
 	struct iommufd_viommu *viommu;
 	struct iommufd_device *idev;
 	u64 virt_id = cmd->virt_id;
@@ -150,7 +153,22 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_idev;
 	}
 
-	vdev = iommufd_object_alloc_ucmd(ucmd, vdev, IOMMUFD_OBJ_VDEVICE);
+	if (viommu->ops && viommu->ops->vdevice_size) {
+		/*
+		 * It is a driver bug for:
+		 * - ops->vdevice_size smaller than the core structure size
+		 * - not implementing a pairing ops->vdevice_init op
+		 */
+		if (WARN_ON_ONCE(viommu->ops->vdevice_size < vdev_size ||
+				 !viommu->ops->vdevice_init)) {
+			rc = -EOPNOTSUPP;
+			goto out_put_idev;
+		}
+		vdev_size = viommu->ops->vdevice_size;
+	}
+
+	vdev = (struct iommufd_vdevice *)_iommufd_object_alloc_ucmd(
+		ucmd, vdev_size, IOMMUFD_OBJ_VDEVICE);
 	if (IS_ERR(vdev)) {
 		rc = PTR_ERR(vdev);
 		goto out_put_idev;
@@ -168,6 +186,12 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_idev;
 	}
 
+	if (viommu->ops && viommu->ops->vdevice_init) {
+		rc = viommu->ops->vdevice_init(vdev);
+		if (rc)
+			goto out_put_idev;
+	}
+
 	cmd->out_vdevice_id = vdev->obj.id;
 	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
 
-- 
2.43.0


