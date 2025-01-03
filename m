Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7292EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oc6M4OH8T3svuItgrMAtDs+561KzAXM2M7+KLhCml2M=; b=Rqf04ERzWvopeMUjiFpZQBvnb1
	5IgHNWB0CUjzIkmhjzpvfTDc1Z3Pe8Rgrm/hJVMqe61HyX7JTXtbWum2BXxhACWaygPzFTHcMBq0D
	3TfUc9dgtRSZkubpeQuTFOLSouqxAEoVVcKJHjLYOplFeZqfnP5Q0y+WaFNRwOhtYV17/EavOD133
	JXlG/2Gg78z+ChX0MyhKWDa6wN4gNhsG9hwKPYpFo0Ap5xCswQJfCnrRHkHh13ENLQGGIoUkdZRAF
	N9NqGJ19ld2FpIesOhgf0yILLWO1Q2e4CfTzycFy1CA7pEiexI643H8j99klU7KgBWGZ8IS6pCXiZ
	G03dWlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnmZ-0000000Dt3l-2n5i;
	Fri, 03 Jan 2025 19:56:31 +0000
Received: from mail-bn8nam12on20631.outbound.protection.outlook.com ([2a01:111:f403:2418::631] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnbG-0000000Dqar-1KIb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 19:44:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nffuCoIEId4/HvCr0VtLKqux58fTExXZn1j9yHSAzL0DoY3qqy3bmLYAfL7Fut36KesHH117yXei9FlhBiydgf6i44z2BlRPToMgDABpnnFfaMjg7aiczOAta69tNKaDATMlNtB6FL9u9s698J0IGOAOJvJc2wf4pcaJF/nI+gV4FlBr7synG5bXFZ/YFu87RKFTJ+cC0daX100YL3xm80YoD6rHR/F01DI9lSYsm/zXu2p4fjCcAyCsNvjKD4NeA9nLpbfeMkDKvSBROI7H83vFJM1+ZmxJd5vxAvgy8rMxkyWaCRszQ0gQ0bfM7Lmaj84fu5blj1TSvnYPYqDbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oc6M4OH8T3svuItgrMAtDs+561KzAXM2M7+KLhCml2M=;
 b=Q4vAWuLHdSNBvT9J7M9Ad4ywKbl7O/f7GssJlKa+7SGftTUPINAneSXMkaydGLsn2lZk3Qw59N/hXkbIwOsPsquqLZYYnuC+geybkta6j/2j4+nbKtj885iJ46t56hj1uKDfi6AxWmtqjMPaXzL5K10sml7OH7GZY+hdfb5BjCo5um4vDMNPeNsVhShwmsqG02nAJaEdM4qI+MfIWR8BIX1ba9BMgR3C9D9WBJcY3x2YHpXj+gbjR0sltbu5XUk0QzO8Ym+8oLfm7pJJEArxgSF69E0XPJ1FUxIDwR5b8HFAKZ5G4Q9fnzhmeoxRxxMWWeMModrZoztwJN5ZXNgiRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oc6M4OH8T3svuItgrMAtDs+561KzAXM2M7+KLhCml2M=;
 b=iJJ5NMjdlZqN4KjLT97KhmXIwK8NAjj2tS171HwHO/6RN1+FzzG9BiWxdGpozZk3bpQtVnXLBN2rdcRuXTPoswJudRPfNhGu4bBiAvK69fjpxDLkSBc+x6KDq055xorGW1vTVsfJBAhqgwexY5jRUubAgTTCoqE6eR4FUGX10ch3KEb9o6ER/tISq7I9Q7z8TPv7RMRWTPtrmBpd9ITb5kN4+nwpeaqK4s3Pn2tORVECZFWUYZ7b80A4XMVRcDrjZAE1fL8jWnfJ7bTJf1Y2klCl2HXl3wmqmPEUYxX19jZTM/h+8+AR4RqwyAhQJc4MOwBlaZW66FR+948oZIWfHw==
Received: from BN9PR03CA0735.namprd03.prod.outlook.com (2603:10b6:408:110::20)
 by SN7PR12MB6814.namprd12.prod.outlook.com (2603:10b6:806:266::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Fri, 3 Jan
 2025 19:44:40 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:110:cafe::97) by BN9PR03CA0735.outlook.office365.com
 (2603:10b6:408:110::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.12 via Frontend Transport; Fri,
 3 Jan 2025 19:44:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.0 via Frontend Transport; Fri, 3 Jan 2025 19:44:39 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 3 Jan 2025
 11:44:20 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 3 Jan 2025
 11:44:19 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 3 Jan 2025 11:44:17 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: [PATCH v4 08/14] iommufd/viommu: Add iommufd_viommu_report_event helper
Date: Fri, 3 Jan 2025 11:43:31 -0800
Message-ID: <cbf90c55a1b8fb7c9d0619d0c12362e699d2b642.1735933254.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735933254.git.nicolinc@nvidia.com>
References: <cover.1735933254.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|SN7PR12MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e07d01a-2ea3-402e-178a-08dd2c2f1006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eoLfLs6+VhzvQp5dS56A3zh1ih1ECv+w1lIl73LeSPVlvFiVKjcAmJfC5rs1?=
 =?us-ascii?Q?EJpwKtDTRbd4HW4BISqrdmt6keXRb1c6kTaeRiaohtOdb331OK/bFDKqDvs1?=
 =?us-ascii?Q?NlR1jow5pj38ya83kGaLAdJc67waSOw8WLZQ4pdLUCqXIH1w3UAqAm5SigdN?=
 =?us-ascii?Q?1wIXTLY4uBxQqywD5BCBjljAURm924ae9MLPeyWM2cdTAA1DapEid+YXMOO7?=
 =?us-ascii?Q?DBp2+r3DmJoti7h/FniUKq3l4+LMf1q1Djc80nBgpG/8Un9mK8v31vp4RPtV?=
 =?us-ascii?Q?FW1CmgiuEGrfWEOxXMuJ6SGvI6bwuq8y8z4eI9hcK1XjLFWeKVHePqalM6Vr?=
 =?us-ascii?Q?d+KOB6bf4OoAYmUXuwdSTph7InRn3AIHYCiGqsGf+7NLesm3UhGVH3aW1+HX?=
 =?us-ascii?Q?qzp+Z+YR070lOjVdaQSSNqDnjpTxUExYVLqWYiw99kzA6Kt7glbxuJRYltc3?=
 =?us-ascii?Q?hk8F4uSpwUVYF5b6VAOPnhluGcTcJAHbLZaZge0ksBhnZ0/vOHRxxmT+nHu9?=
 =?us-ascii?Q?qN7tEmuAyz6u+gy5QazYGAg4DvLohjgs0iJYgAgS3tvsqGQLDPD02szvpf4F?=
 =?us-ascii?Q?LACMT05aVkhC7d6al7yqTMcml9Z9wXdwnq+571emLwG44TwCeNgkPd+HtAIM?=
 =?us-ascii?Q?NGWJjALsUaa+p2jc+pZUwJdnM47K0BR3M8qokdl1M+vdg5m+ZLTBctNAzfwo?=
 =?us-ascii?Q?jb3m/MDIUQQ2cckXG3IcXEJQ1o7yjQ2G6qp2L3sDtZAvl6eQvUUu6wTGMGTM?=
 =?us-ascii?Q?kBqB0A3U64HE1DislQ1Vy7Ebcp01VM3JP7aAGUuxX1RkSuB7kcCl5qV0tSSk?=
 =?us-ascii?Q?65r1M/x/9fm0xvPiTlVRWila1/z7YWNwN+cNUR+s3d5f7Axu98gsaOgi2RFn?=
 =?us-ascii?Q?g1h1JbjUuHuaf72uyGyIQzDBfCI9upyCaFd9GXaHnNpKiuGA6xVAdGUDwT0+?=
 =?us-ascii?Q?beV9O5bb6/aSnVKI9NXTZDcGr0Alxm8yejcNH+9YbYr8TZj0LXzfKnKwut1p?=
 =?us-ascii?Q?VropNkijC4vKsR50uqfFAWBZ6xKsLhP6Xj6Omu4leBdhijIdrZ0KnB821uzG?=
 =?us-ascii?Q?QA+/x/lgUFlFYCsigwauyHoxEAku+b45pXlHrTUlTjvanul36/mbNJmoBI0U?=
 =?us-ascii?Q?rg0Sr7Kw54jN0njldJNuhTxQuVxFCjo5Bg/xExL02FzlTK1xTewCjtBptt1S?=
 =?us-ascii?Q?WXOWSPB7ZYcM2O2aBOVZUhlUTBt+y/GYW7zrRKJEqAJud0J+rTwUZK/lnHcO?=
 =?us-ascii?Q?oCaLnHGffrNmw7dbxwmkrdLLrCzWMS31N6lC5yIhzSEu8NSSOZxgfLiEDpp9?=
 =?us-ascii?Q?VsOJxLus2vFgEZoqKfc3/vDeIclsWrYjncDe2GDmneaDoM8gtC7iJX4ljE80?=
 =?us-ascii?Q?YEmNSJKAONiebcNkrd82TFx8ZdcuSeQpfEwMZCAdHIVj5Za6qMr3+eBOC4Ar?=
 =?us-ascii?Q?aHl1vIdhNaGvLw8S6wFK4W80eiGkASqmfGo22429PCeL8oxidJ54Fn5FkXeV?=
 =?us-ascii?Q?qG8AGKFo9gnJkUw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 19:44:39.8210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e07d01a-2ea3-402e-178a-08dd2c2f1006
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6814
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_114450_383082_5B059918 
X-CRM114-Status: GOOD (  12.72  )
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

Similar to iommu_report_device_fault, this allows IOMMU drivers to report
vIOMMU events from threaded IRQ handlers to user space hypervisors.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommufd.h        | 11 ++++++++++
 drivers/iommu/iommufd/driver.c | 40 ++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 9c6ba7df3994..6b3b46e382f8 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -11,6 +11,7 @@
 #include <linux/refcount.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
+#include <uapi/linux/iommufd.h>
 
 struct device;
 struct file;
@@ -192,6 +193,9 @@ struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id);
 unsigned long iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
 					 struct device *dev);
+int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
+				enum iommu_veventq_type type, void *event_data,
+				size_t data_len);
 #else /* !CONFIG_IOMMUFD_DRIVER_CORE */
 static inline struct iommufd_object *
 _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
@@ -211,6 +215,13 @@ iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu, struct device *dev)
 {
 	return 0;
 }
+
+static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
+					      enum iommu_veventq_type type,
+					      void *event_data, size_t data_len)
+{
+	return -EOPNOTSUPP;
+}
 #endif /* CONFIG_IOMMUFD_DRIVER_CORE */
 
 /*
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index e5d7397c0a6c..77c34f8791ef 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -69,5 +69,45 @@ unsigned long iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_viommu_get_vdev_id, "IOMMUFD");
 
+/*
+ * Typically called in driver's threaded IRQ handler.
+ * The @type and @event_data must be defined in include/uapi/linux/iommufd.h
+ */
+int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
+				enum iommu_veventq_type type, void *event_data,
+				size_t data_len)
+{
+	struct iommufd_veventq *veventq;
+	struct iommufd_vevent *vevent;
+	int rc = 0;
+
+	if (!viommu)
+		return -ENODEV;
+	if (WARN_ON_ONCE(!data_len || !event_data))
+		return -EINVAL;
+
+	down_read(&viommu->veventqs_rwsem);
+
+	veventq = iommufd_viommu_find_veventq(viommu, type);
+	if (!veventq) {
+		rc = -EOPNOTSUPP;
+		goto out_unlock_veventqs;
+	}
+
+	vevent = kmalloc(struct_size(vevent, event_data, data_len), GFP_KERNEL);
+	if (!vevent) {
+		rc = -ENOMEM;
+		goto out_unlock_veventqs;
+	}
+	memcpy(vevent->event_data, event_data, data_len);
+	vevent->data_len = data_len;
+
+	iommufd_vevent_handler(veventq, vevent);
+out_unlock_veventqs:
+	up_read(&viommu->veventqs_rwsem);
+	return rc;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_viommu_report_event, "IOMMUFD");
+
 MODULE_DESCRIPTION("iommufd code shared with builtin modules");
 MODULE_LICENSE("GPL");
-- 
2.43.0


