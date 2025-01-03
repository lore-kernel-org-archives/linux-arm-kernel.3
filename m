Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C85E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIS+saEdL9KmV30PuFRRR9YLXw4Q/rgjK+XCzIzIlpk=; b=e9mUR0rrb74ChwXuV4Kps9/8RQ
	dcMIPLlV5ypeMyKgOKyfbMUw0/sjUAPrwEhVyWeMXgqxcnygll7uBzV3ZN3Jl1Ue1XTn1C7rnNj5s
	WWH1AUjSlV4iOO+q83ZbEbtC/8bKWlrzMfVnN6XUwCjyPcHmCO/M0JfX6Qcmmk9On4qd++yhtppRH
	Nc/MXEymDOhyZHWSYI1/iUdDmnRmPCB16ukh20VUfa7Y/2RxW/zkpwT7z9MpUk6lyrmydtJr1zT59
	BcKjkp4OHM/WQ4Py7EF39gVqF2Za6X8fQpQw3+LIv5tBW6eWCiiobXZ5z8YsHG9R0ph+O1J1t9Np4
	jAmJSO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnj6-0000000Dsho-3IJI;
	Fri, 03 Jan 2025 19:52:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnbG-0000000Dqas-0iau
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Jan 2025 19:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KIS+saEdL9KmV30PuFRRR9YLXw4Q/rgjK+XCzIzIlpk=; b=GRjiFaRb0jioeWZQQVuZnJoluM
	ZNUdHfLMvSDFQMRQV7c+MuCv+0HujuqFSbLdqtgeeNZjpv4nJqVE1Q1GS2SclvFkAZFUEaS/ZCvJG
	Pq5wRGDRxZLnCiMz24bEi7dXQNxCQOkquH3fGSw95zohlKtw/jk+WIe/YWizCuqq90ZJ0KxaoSY92
	BhdTQrzKDVpvf8e4V9ONgObrhCmLNRgNjhA1p9TptinVweCgeNrL2XFIh2zb/wefmrqcQewnqyRLV
	nK/DDNvgd0cubjbns07YwutVSqR0/GmS56jC8P3CpZo5mHamKcqR+uIsA4KFPiThBhTaeU/D5L2Gg
	fB+Fgr4A==;
Received: from mail-bn8nam12on20620.outbound.protection.outlook.com ([2a01:111:f403:2418::620] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnbB-00000008RFA-1n5P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 19:44:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9wiHWIBeTuZdGtE5ROq3OWExRbEqvJABo1x4f/wLtNj1f/f6nM86j/Za35sArIk76/QS8QiH1e4MtBXOOaiqYF/MZKlq9uEBQ0GVweT7wa54JaHpRLzPLkU2IokaxT6mOIY0sVZhmKSbZMZsd4YMnNqho++wGCTrpPK3SJFvy/51c1uw0eVP17Fx9utGGxeGSGaXJSWbA0Ok5fDg36qckepbPKxEoDjuLXbCcA7hB0BavUuc3m3UjXhliFATqNSNqo2DKUbrKEjoA1D5opb3ezoT9vwWJ7+PePmYFwi4VCIId6L9YGthZP5Kp+eAyu/ZHzySOTD2qqqUNUuS5uufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIS+saEdL9KmV30PuFRRR9YLXw4Q/rgjK+XCzIzIlpk=;
 b=nB8S/ncfZEEnEoDfK8LS/Wy5SIyCxAiAxqJNaRGZmCi1comfcINwge8WEYIvBYsMxjwEqp1BrUwzSvOqHTuNQa/rQBp7ESd8Z+A4wIedZeWrof7JbJGPxjtVNsjxkfleTBmU8PL4X6gTHjL6NVVNN96W35B9wRW2LqHFFlbaHhJdigI7Lkbn8QK3SUQEScvc4xGriU2K+CcXiPo4UW9RNMRc9av9tOb9IsSbhGC44NBm65SXUspSOJi1ed5/ghDEFyHrzga7qRTXYQTSR6kBWYILal/hA2FZ22ZPjXwYtH5DC9QxgvkVJp4CM6n1TzUAx1RmjbABdWPKDjrwNnU89w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIS+saEdL9KmV30PuFRRR9YLXw4Q/rgjK+XCzIzIlpk=;
 b=R+0Fa6tbAPqd1OpuOyw9tjEQwiYCjzOhJlfmMZvSHZ5WrxEYhzYQwituq4j34T3UdfSo+/LQeCpPwAcBgipeLf5mwb5HzgIiArl/r5MSHr+WCgyeWKOdikcn9FLd3qZar5bCufhYWWFDUKOwEdqzNR5Vk+yRtwCwyLxth8IOgUrVoc2fpauXbuuQP5OjbAoHh/WXikq0c0zlxBD8HfaogcyWdYoIglDei+4BWmLbRdVoIURlfjiFJVd0ETibMY2ocTSxajCN6qUd6F+rjFoZh7OkbKZIJWgUaJaupvTDm/LNsfTCbGaQ6pL7xrBORlLl7J1QM+QDX4d9B/NlwF+ZJQ==
Received: from CH0P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::12)
 by SJ2PR12MB8738.namprd12.prod.outlook.com (2603:10b6:a03:548::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Fri, 3 Jan
 2025 19:44:29 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::b3) by CH0P221CA0014.outlook.office365.com
 (2603:10b6:610:11c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.14 via Frontend Transport; Fri,
 3 Jan 2025 19:44:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 3 Jan 2025 19:44:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 3 Jan 2025
 11:44:17 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 3 Jan 2025
 11:44:17 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 3 Jan 2025 11:44:14 -0800
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
Subject: [PATCH v4 07/14] iommufd/viommu: Add iommufd_viommu_get_vdev_id helper
Date: Fri, 3 Jan 2025 11:43:30 -0800
Message-ID: <e29a931521365e7953cb993a61dadc72a53b66d9.1735933254.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735933254.git.nicolinc@nvidia.com>
References: <cover.1735933254.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|SJ2PR12MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ba63ae-b728-4e53-0edd-08dd2c2f0981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p0wbRaqMzYzNtPJcqUopw+5T1XIOtjsjMq8Tzeu/ZLyn6sQw6qTj1MdDYQEZ?=
 =?us-ascii?Q?luoh7quuc+B0UQNbX7Dlgh2f1jLzuXrGmiSQ5YFWcvFrRg+g/kvaDFAsCntV?=
 =?us-ascii?Q?j5wy6F1KYqZdHMWWUKtyo39PL7GuTkPKx8dI+KO+SPlML9gxGeKnZtr0+YEd?=
 =?us-ascii?Q?Dx03La/4NI91L0TsuLcgHpzmr1GWkW6hb5CdMDxhQBP5DacJEO2r0+E/8YQp?=
 =?us-ascii?Q?GCZQ99S0Lyq9Ez8Yu89fh9xVqvdwi+6IZMGyiFjsMz/cUDpEtRaTYsqdXEeK?=
 =?us-ascii?Q?WzNBVp52Q3Bg9Nk84Jw2itqO4oeyqIQa0Lmm1Ia406+wZAYuRDwqZ6B22iGv?=
 =?us-ascii?Q?aFSFGSD+xOBnxoc8ibYrKWX3rP/qvxKw2N/+FMz3d8BhXV7GmztEwnHqPGfL?=
 =?us-ascii?Q?hr9gg6NlJtVHkELMEJCXA0lTpfP3U/6Jder3NxQSEJXXaVziElr+hzugjq/K?=
 =?us-ascii?Q?rY/DnQbAUkh5F5bIc+gDzUES+s0PBRgqsvu9ZPDoW9U3QtsCL40/2tjM8oAw?=
 =?us-ascii?Q?h+wlPJNkQTJcEq5nydrsnaZiuj9p30+s+e8VWOTgxBw4VLV+PNHc+NL7BV77?=
 =?us-ascii?Q?3Rope36IAMOjG2fusIhKaohIEW0Tm6fPRp+vbY/IlWuLi4ejg6VYNzNN6WNK?=
 =?us-ascii?Q?2o4wPArSPBDZXSr++Xvr2VWWWzd8eS74uHn9sSx6DApKfgHZRDRh1p7FYAbP?=
 =?us-ascii?Q?jRMQ3EAjuD3vJP0xjiiavfxGi+RsVi759AP2KS354IKk0JLbRwa5wzV3eIL/?=
 =?us-ascii?Q?HlgBGXDrPU1sm3MQ7FpYopiE+dFYZTQmDD+X1PSDv8qCmESTDmfy6IZ+wScx?=
 =?us-ascii?Q?8MjPAq7JZc+XN74PvQr33X+FVAFUfeMmcrz9rVu2oxOTWoPBLVklALMGMtGc?=
 =?us-ascii?Q?dQTKtiRCa/exADeKCmFFXSfOpAds3LVu0ZZFfKSf2rlOJizlXYIW8CK+hxu8?=
 =?us-ascii?Q?u1lbyXaszNcRUrfPY+tc8D9+6Hq66Rt+GlpglCBuGN4akYHXJHZnhGJzMGiC?=
 =?us-ascii?Q?zZmmieGUtLipmvtHdtKz8GCu2fDgAGP7OZ77PY943zjlRdpKMIPG2j3IBmBX?=
 =?us-ascii?Q?g2TIFNBpbzPU5y8BC88UyvERHL3pY+CBiPaz9MVh59SRaN1TKDCDhcA7L241?=
 =?us-ascii?Q?u+hL6Ti+bWFkwB1fYyZGUbsWdmN2zQ6kwpX3zeQR9mzDc8mviX66xMiPiz3m?=
 =?us-ascii?Q?dCLgT62K+S9E2ctc0GKFeT4G/ybmJ60EDMu6/HKFBvK6j4GquPcHSJjtSAyJ?=
 =?us-ascii?Q?z6thXdr5iIeUZMN4XpD5OoW+EEhxbnplo+lfiY3Wx0k2KIRAmSuuJAR4wOcm?=
 =?us-ascii?Q?gZPIAqU6UI5RSCw8aXypSjfX1y26tNmNbZKuNo1UlP0c954sTLfF3bHBRlXn?=
 =?us-ascii?Q?VVAGE6Z7OV1IN7Xk6aghQe7FJvIY9S/Cw85q0jt2Pb/RwoDE29hDvNuE92+N?=
 =?us-ascii?Q?glhhXQNNHW0Q6r9+bVdcSVXC2S1tLES95Breu4/ZC585E62dVzPk8bYkrf3B?=
 =?us-ascii?Q?b233Ohx+ifkCyro=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 19:44:28.9453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ba63ae-b728-4e53-0edd-08dd2c2f0981
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_194446_883106_02C66289 
X-CRM114-Status: GOOD (  12.35  )
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

This is a reverse search v.s. iommufd_viommu_find_dev, as drivers may want
to convert a struct device pointer (physical) to its virtual device ID for
an event injection to the user space VM.

Again, this avoids exposing more core structures to the drivers, than the
iommufd_viommu alone.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommufd.h        |  8 ++++++++
 drivers/iommu/iommufd/driver.c | 20 ++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 8948b1836940..9c6ba7df3994 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -190,6 +190,8 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 					     enum iommufd_object_type type);
 struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id);
+unsigned long iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
+					 struct device *dev);
 #else /* !CONFIG_IOMMUFD_DRIVER_CORE */
 static inline struct iommufd_object *
 _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
@@ -203,6 +205,12 @@ iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
 {
 	return NULL;
 }
+
+static inline unsigned long
+iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu, struct device *dev)
+{
+	return 0;
+}
 #endif /* CONFIG_IOMMUFD_DRIVER_CORE */
 
 /*
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 2d98b04ff1cb..e5d7397c0a6c 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -49,5 +49,25 @@ struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_viommu_find_dev, "IOMMUFD");
 
+/* Return 0 if device is not associated to the vIOMMU */
+unsigned long iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
+					 struct device *dev)
+{
+	struct iommufd_vdevice *vdev;
+	unsigned long vdev_id = 0;
+	unsigned long index;
+
+	xa_lock(&viommu->vdevs);
+	xa_for_each(&viommu->vdevs, index, vdev) {
+		if (vdev && vdev->dev == dev) {
+			vdev_id = (unsigned long)vdev->id;
+			break;
+		}
+	}
+	xa_unlock(&viommu->vdevs);
+	return vdev_id;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_viommu_get_vdev_id, "IOMMUFD");
+
 MODULE_DESCRIPTION("iommufd code shared with builtin modules");
 MODULE_LICENSE("GPL");
-- 
2.43.0


