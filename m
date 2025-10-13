Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4268CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jl1maTyuhiJe6X2+dk2lQqxHTVBTrgylMyPt6v84fyo=; b=GoHWzHQwuyIF2WeB2LLTXIXvQ4
	fcPY5psdQXLBxLm46jYsDmIJGfPN+tq2aIbZQ0gYduAY1sR/Uoj8Bbu2oFRxbMIRfXrYZ4E5pnFhy
	fIAwUx3fTHkOPxfakbqYgfOErzF8xjaAoUScHSuZO8LSNFPDDaTC/dXtM2diT3iEwFtIqXqMLZJIT
	YPobYmLqNDQPLVDeSARDvJXvAXatrJ4+B4aynB8hNTqLz4ndI9skylHyoR6YBmaPGn4Vme8bsr46K
	F/7kG1yzckSvSAhbGVRWMuFHpYDzyNgU1qOs48Hjh6sQd8M9jsnLOK0vc+5CVmBmJR/NBe0kpuydA
	48naJCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v866s-0000000Bwhg-0ICU;
	Mon, 13 Oct 2025 00:08:18 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v865D-0000000BtqN-3QX0;
	Mon, 13 Oct 2025 00:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuObUzX1Ap8GAGoI7ETUZxx5NoXZf4poI7XGQPkGxjHM6m43jnjTACNtkqIsFYeFZAwTqrcCkH/1AejRFONbVZFnb184N51pH9x0TLw522kivCtNSN5AOlqDr/gRN0MKhKEHODEOvdsCfg3HwPuiZAINMlHs35wpRh+p+mbdWHDwlbwAZtoE+K7aLbVVmzO2yPq1T3qAe0QKimZA86lKX0qyQwVUAVdPjBEGYHGVqyuBxIqqQUBgzAroLZZEDR6vpJtNJaWJqz0prUyLIb5Nyu9xVM/YNYlhDNfkUQCmQrhwB1yy9nhjQMeN6UVEDMO5LYb8r7HqEK2VoS3NomST/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl1maTyuhiJe6X2+dk2lQqxHTVBTrgylMyPt6v84fyo=;
 b=hdmKX/rTKl5jxkIFFaoA8CTs5hHGebDEENkkQkbQzmF0wh1PZOrjWoRGdnHy1FJAgdeSI8eAHrJCjzfa1ymT0xWVktA5fvjuJUwVl5yOm+AuPz4GC8OXjfcXjMHDUbAdubbD714l3gnYbek4i8Bupdz8qqMjHcRF4LaidRUUqVlVG8x4liZZGIiuNcOhRHJIw44gCm3l2meknnrhkPiE9LoWHVfxnPsDMlOOpb1ZNPWqRFgoUb2tf1HIXjdVDDbATrlvVxc/o+hFynAWv0R4u8FaAItZjBtPWhHkT9NiyQ7TPn9XhDVzuoQAGfixugdbve3gXY/hxq/Yw4P7mExo6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl1maTyuhiJe6X2+dk2lQqxHTVBTrgylMyPt6v84fyo=;
 b=DARN0Kp/lCVMmVNFX1MVZWqe+lmMBGAAyhsKPcn76kR9fncJTYuATc7ZXCxD1jPbCz9dCPllgkGlm66hNmsLrFXfFLiWRt5VPkxLy66eVAUc6dhGRahn9nLY7g7OEoP6Y35MySyxPpETaysBZPeI2ZmiKYTS98kisGhSmM1/2wI0l1aOuivtJA7Zgh0qJb7V7YFNye/XARBvcGV/w5Zs3AxrI2YgmGDnox+ctRT4/+NOM02Et25JNtXaTknpz/+E6gKHTghvzgkSkdwYgY1PRaPdyoVsqBMd6qYoyPnyHtqRQ48Egm0Q+IPCOecrQ6f4I2fZEw8YQJVDm0SSV+1CTw==
Received: from PH8PR15CA0017.namprd15.prod.outlook.com (2603:10b6:510:2d2::7)
 by IA1PR12MB6209.namprd12.prod.outlook.com (2603:10b6:208:3e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 00:06:25 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::ba) by PH8PR15CA0017.outlook.office365.com
 (2603:10b6:510:2d2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:06:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:06:16 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:06:16 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:06:14 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<jean-philippe@linaro.org>, <robin.clark@oss.qualcomm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<tjeznach@rivosinc.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <heiko@sntech.de>, <schnelle@linux.ibm.com>,
	<mjrosato@linux.ibm.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 18/20] iommufd/selftest: Implement mock_domain_nop_test
Date: Sun, 12 Oct 2025 17:05:15 -0700
Message-ID: <cc583ad281e603555f07c6800988982709ffb857.1760312725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312725.git.nicolinc@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|IA1PR12MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c00cf5-9244-42ad-f1e0-08de09ec5978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Atn9+JZqR/gfd5qXRmv/klkk8kfv7tmUJ1yv+EiB+EXqWYManpu14vV4AsRl?=
 =?us-ascii?Q?k6ga4ibYZniwS65xQLWa2jnRBo5DCbnZL6GRtz13r3spIB2kArWP3yFEId3i?=
 =?us-ascii?Q?2BGzXi/XR/YjUAU4905qnlS1TSjrirnu0YEgDsCeC8lTcIntl44DQ3SX7xMy?=
 =?us-ascii?Q?HnSOae/AVxQcWrFmsfbJ/m5KsXUn8n4DHNDZWcOvw/k5dW+U4kMfcrPdFIu6?=
 =?us-ascii?Q?peWoVojv78HjfxdgfUqdihrgmPscDLxsB1ES6TVrk/nN+Y1QAUN1cH21B0j9?=
 =?us-ascii?Q?cJi1wQGl5a8nA0QX5wmb18gafi0qDfWobN0L6X9JB6Ne8nzzyv26qwAxivGu?=
 =?us-ascii?Q?eM2+7IO9ZDrr1+/ULnbyNYu2v9mgbUjTceJ8AySwzH0YOJo9CgMxx7DqvWOE?=
 =?us-ascii?Q?p/sZmaIhbJc74xu27ZV0i0j3k0PvGVwiF8h17roX9KuktW2wL0+unfgzajh4?=
 =?us-ascii?Q?Txp7TVQsSmNlzF1eRi19CFrz4C5+oTlxZloneNzWIet6GS67iQbzzsbA+q+o?=
 =?us-ascii?Q?UdG87gDuGg17eiueD6i+FoMQ5OkCNSszBSmy/Cw85/xacjWhpUsYjQfJV/bJ?=
 =?us-ascii?Q?QDZ4PEq7ZwZ0g3W6fifXiDYdvD9va3Mc2Kx0MTu6vKXNDECPL45AXwfU9HXR?=
 =?us-ascii?Q?4GU2EA7XlMLfVZrzilOQq75UREpqY+Am/LzEq7REi81/BD4i9e2YImD9Avxq?=
 =?us-ascii?Q?R7IehFHwCh6qxGZPjOuqXTIhgoJQKj5HHmSzJwrVAmXaxninQpGxd60JzWRe?=
 =?us-ascii?Q?YLlq8eTsmj1rcvs35g3IUAgifuEo3eILGICIvawR5Gk+Ag5M9q49xpkZwIqd?=
 =?us-ascii?Q?9vxzeRE2xeKjxc2mB1kAJb81WLHo28bdP923rxFSXKZB6uVKxoJVHaAD2dFz?=
 =?us-ascii?Q?ImALr+k+MdnV4x0pcP+JTQNid7XQpBdVVbgQLB/LuLAQprWFvTlFlTdT2LKB?=
 =?us-ascii?Q?Eqa+UKv9CP1eHUU0pFXZlvs8DPDaF98TrRcoEJQzrY/lGtEEIZW80Lpr7uo/?=
 =?us-ascii?Q?nGEs8pzpEb563DNJk55ruU6NCqL1VPbh+pIE3bAUJxMchSpb68g1jYlzlPbU?=
 =?us-ascii?Q?uoDbBa/X0YDqrkBx95kM+MRDUfDu17P1cXaHLOQc9IAyON7WQXodUMnNhURK?=
 =?us-ascii?Q?SCV8k89AXDD9qcC8PHDAHb2qp6LLJyNvikMzGxBteWWH0Juxw7PGjGshuDde?=
 =?us-ascii?Q?WKKn3NEzpJSciS9MGFcAqyjHlI1kIiHpWBsN5WWiRiHnWUkn/Wn8oWXGxzVl?=
 =?us-ascii?Q?m2v3T2tFMSZqWaC++Od4YX0G3XWqOBv7YuzbBvHgvhshgi4DVroAFtKwdSmX?=
 =?us-ascii?Q?v/4tNFgADw5kOx9GdoB4XlVbvpS+hcbF2OKv+mn3SiYLafK19yKFG8Pz+LLf?=
 =?us-ascii?Q?rNoo53DRUUmSRP8ENSy0BpbSYILfoVHy3oLAuWFabYotU84kZASar8OebmXH?=
 =?us-ascii?Q?lVPiB8Cy7/nWWiamIvLQ9M3i0a+s/JJmfNJYiaM87U5B0h+hrdQ4hT8hacVn?=
 =?us-ascii?Q?iRmzs6Yz9krfhr+Nt8AnAwQIKd/gj5wfcnfURkPw4uy5j/hLrO0GLSdT537L?=
 =?us-ascii?Q?1fZ+35iAVLrFgmMX2kw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:25.0482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c00cf5-9244-42ad-f1e0-08de09ec5978
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_170637_104682_111E91CC 
X-CRM114-Status: GOOD (  14.20  )
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

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/selftest.c | 45 +++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 5661d2da2b679..f9c871a280b03 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -58,6 +58,7 @@ enum {
 	MOCK_PFN_HUGE_IOVA = _MOCK_PFN_START << 2,
 };
 
+static struct iopf_queue *mock_iommu_iopf_queue;
 static int mock_dev_enable_iopf(struct device *dev, struct iommu_domain *domain);
 static void mock_dev_disable_iopf(struct device *dev, struct iommu_domain *domain);
 
@@ -215,6 +216,37 @@ static inline struct selftest_obj *to_selftest_obj(struct iommufd_object *obj)
 	return container_of(obj, struct selftest_obj, obj);
 }
 
+static int mock_domain_nop_test(struct iommu_domain *domain, struct device *dev,
+				ioasid_t pasid, struct iommu_domain *old)
+{
+	struct mock_dev *mdev = to_mock_dev(dev);
+
+	if (domain->dirty_ops && (mdev->flags & MOCK_FLAGS_DEVICE_NO_DIRTY))
+		return -EINVAL;
+
+	iommu_group_mutex_assert(dev);
+	if (domain->type == IOMMU_DOMAIN_NESTED) {
+		struct mock_viommu *viommu =
+			to_mock_nested(domain)->mock_viommu;
+		unsigned long vdev_id = 0;
+		int rc;
+
+		if (viommu) {
+			rc = iommufd_viommu_get_vdev_id(&viommu->core, dev,
+							&vdev_id);
+			if (rc)
+				return rc;
+		}
+	}
+
+	if (domain->iopf_handler) {
+		if (!mock_iommu_iopf_queue)
+			return -ENODEV;
+	}
+
+	return 0;
+}
+
 static int mock_domain_nop_attach(struct iommu_domain *domain,
 				  struct device *dev, struct iommu_domain *old)
 {
@@ -223,16 +255,13 @@ static int mock_domain_nop_attach(struct iommu_domain *domain,
 	unsigned long vdev_id = 0;
 	int rc;
 
-	if (domain->dirty_ops && (mdev->flags & MOCK_FLAGS_DEVICE_NO_DIRTY))
-		return -EINVAL;
-
 	iommu_group_mutex_assert(dev);
 	if (domain->type == IOMMU_DOMAIN_NESTED) {
 		new_viommu = to_mock_nested(domain)->mock_viommu;
 		if (new_viommu) {
 			rc = iommufd_viommu_get_vdev_id(&new_viommu->core, dev,
 							&vdev_id);
-			if (rc)
+			if (WARN_ON(rc))
 				return rc;
 		}
 	}
@@ -296,6 +325,7 @@ static int mock_domain_set_dev_pasid_nop(struct iommu_domain *domain,
 }
 
 static const struct iommu_domain_ops mock_blocking_ops = {
+	.test_dev = mock_domain_nop_test,
 	.attach_dev = mock_domain_nop_attach,
 	.set_dev_pasid = mock_domain_set_dev_pasid_nop
 };
@@ -630,8 +660,6 @@ static bool mock_domain_capable(struct device *dev, enum iommu_cap cap)
 	return false;
 }
 
-static struct iopf_queue *mock_iommu_iopf_queue;
-
 static struct mock_iommu_device {
 	struct iommu_device iommu_dev;
 	struct completion complete;
@@ -658,9 +686,6 @@ static int mock_dev_enable_iopf(struct device *dev, struct iommu_domain *domain)
 	if (!domain || !domain->iopf_handler)
 		return 0;
 
-	if (!mock_iommu_iopf_queue)
-		return -ENODEV;
-
 	if (mdev->iopf_refcount) {
 		mdev->iopf_refcount++;
 		return 0;
@@ -958,6 +983,7 @@ static const struct iommu_ops mock_ops = {
 	.default_domain_ops =
 		&(struct iommu_domain_ops){
 			.free = mock_domain_free,
+			.test_dev = mock_domain_nop_test,
 			.attach_dev = mock_domain_nop_attach,
 			.map_pages = mock_domain_map_pages,
 			.unmap_pages = mock_domain_unmap_pages,
@@ -1021,6 +1047,7 @@ mock_domain_cache_invalidate_user(struct iommu_domain *domain,
 
 static struct iommu_domain_ops domain_nested_ops = {
 	.free = mock_domain_free_nested,
+	.test_dev = mock_domain_nop_test,
 	.attach_dev = mock_domain_nop_attach,
 	.cache_invalidate_user = mock_domain_cache_invalidate_user,
 	.set_dev_pasid = mock_domain_set_dev_pasid_nop,
-- 
2.43.0


