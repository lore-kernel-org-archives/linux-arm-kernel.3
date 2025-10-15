Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FB7CCD19E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 19:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyp2uxdJSaWI/GLKYnSpX8UVcm+Vvxd+5Dyzn0Jm0eA=; b=uHUl6tF+Xfv2q9qhoq12RDjeZ0
	7lbEHdSwlbH5UN/rVHBTn/pil5Ykpl6tixY1ya+4zOQJ8+Gl2YsALEwq1fKh7JZmvpnsVBIZqISsc
	YrjyinMVpf1drBNUVs3Q/u0sE/ES8WsawtAppCXGu7fBXOcyMIn1zRbQhWDjIdIiEaAJ/OLnicSry
	q90v7wYQwzfhX0eyxbWZ4dcy+SvMorobA7EESk4Qdg2o/YY0t/qoMSLKjkBcUGqA1BirMKo8y5wpo
	iveC15KBmUQ+m6wAGKClN7wvBDYOjYZjU3CaA3RwEL/yf0Cbln/PMMbCTdIptJhMcW2Kctli27xSC
	3cr1kWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97PU-00000002lME-1NWy;
	Wed, 15 Oct 2025 19:43:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97PT-00000002lKo-0jNf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 19:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wyp2uxdJSaWI/GLKYnSpX8UVcm+Vvxd+5Dyzn0Jm0eA=; b=Ge47Xu1MtLK6r8FC0hYtumXrCy
	cefutz1i1tvTI+Dc2nAP/XYDNip7fplk0gzKfNS6B+U41nupLeKck4jHiF2WGpbJA8gdU8b7i1Ffv
	KEVmYsa7U5Sf3d+jxyQ9D9RfXM/7xkYCugHJbaLNlbtEYuZhQq0HnJ9HGeJpvr1fmXTidn8ZMBGat
	pa4rM3QGA6yoXiL4b9Jhy2sgMK8zrXO7xsW4PkNKY4lBHmxMgnVs/zJNbNVXA97I82cO1Zyb2Iuf7
	/JxWuesKDBe2fBftACNKhyYJMoh4VchMv4UsNao+b8kE99S7x5W2jlV3ZlYW/PPTbvg6ciakcygqX
	9TSvvGGw==;
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97PJ-00000006CHq-2dWI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 19:43:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRybnZhTSY8VidBkBk8tLXtVQXw1TtJm8GAFuKFgEcYbqsSAkux+tbyHjzMV1u4QJ6ScLrFkwJUraTbApq05XdSZvBz0tmDjkeq5OV8W3YJR9Cs5MJv22XQrNA3rRaXNmbc44TSvF8lbxCBW6HKKsdoOcmBVAxwdGOPP+nhAGq0vgHR9yJ4P0IJIdUyGnMSxDUkTYAMm9SFU1UlixVTw1IsP05kAAXv8DXP19dZGcLEUivi996RwlxEVmdUElymF2oePXbzSkx5Q4rGLAvj197q3X3YnepgCe8DEsXBwew6vEQsowAHDCsLfrdGDvOjCossLsafobnn91avS1SRFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyp2uxdJSaWI/GLKYnSpX8UVcm+Vvxd+5Dyzn0Jm0eA=;
 b=hxkHDQJTTJUJBir4ILcLdtRGo8uueZ1RNfqGE74deSLuaXnULgTP1M//eIJqPFjRs3UVY4Isidqr64KhBQfVFv5Y4WlPx8Hogcxv5YXOaHf/7cQEjL2uYofzbEgrd9W2a//mheBAZJyGnQEg2RZKABO4SjWqe9bKZ2UjpCgMMOdPmq6U/D0HWieRgZZGAQ3ETKFGYUXXhxaU7X0QG2SsbXNNbsNIi27bBX9Guh1Ag+E/WPwnQ9rwLL651dqn99WLgI1c2cv8/sRMZpZcxeykxNN7eWfmzWPLmmRehKCyOBZU5xCou5MfhMSHfr4wbWqxxHbPlZehE1DVoRjrWfpd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyp2uxdJSaWI/GLKYnSpX8UVcm+Vvxd+5Dyzn0Jm0eA=;
 b=e6KzIyk/hm3L7UvR/xtOiQjU4cpWaSx+zAr6iOq3TTK7MEyNv92LT+wn4FgGDHjGccR4bhKhhkwFnLdVpoRFsqDxeda149Kcv92fP+nf0xurfX1I5az1bxRd/UbMy0YpnC1rV+NdobECLuhOWAIzJnBPO9VpHW3xTygcJ/nDVht+AjVFBqUCHdkMCFLJ9leochJuHqKcc/VovL9CmJjFIVSgYnvvQPEuJORKuJfsEIgPnTPKSlLjJVaeYWDCXzcxMwaP4KdtxERm2G5IZFGfuu9XC90zxKlucUuMKzpb/OykEu+RAo30QJBBHrzWbtjFzdsUuE5a1ndc0yQMBf3hsw==
Received: from SJ0PR13CA0018.namprd13.prod.outlook.com (2603:10b6:a03:2c0::23)
 by PH0PR12MB7093.namprd12.prod.outlook.com (2603:10b6:510:21d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 19:43:19 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::f8) by SJ0PR13CA0018.outlook.office365.com
 (2603:10b6:a03:2c0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Wed,
 15 Oct 2025 19:43:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 19:43:18 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 15 Oct
 2025 12:43:02 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 12:43:02 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 12:43:01 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<balbirs@nvidia.com>, <miko.lenczewski@arm.com>, <peterz@infradead.org>,
	<kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/7] iommu/arm-smmu-v3: Explicitly set smmu_domain->stage for SVA
Date: Wed, 15 Oct 2025 12:42:46 -0700
Message-ID: <b543555be99dc6afa4a9dd61c211f42862b46ac2.1760555863.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760555863.git.nicolinc@nvidia.com>
References: <cover.1760555863.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|PH0PR12MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: a3422b21-ed98-469f-5aeb-08de0c231756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4gxgW6eAduGuNITHPjpXnOnSXYnUPQuqxo+IeFDr0c6szpTW/21rSN2iQfvM?=
 =?us-ascii?Q?NzI9Me5HS/pdyXqHj8WarEz5HssUquGP9TOS8yhfaUomJe+3ndVZulkWYOCe?=
 =?us-ascii?Q?jlXyiSLUwYHXzlsP2Vnq4CeMj+nfy4b5hjlHn5Bn479YHvhBgcYCZKhdSRV6?=
 =?us-ascii?Q?Ep1XO37KWgOjtKo/FbFs2MBuIfony8ZUTpW9b/cv3cU7OP+d6C2X8m+eLFDS?=
 =?us-ascii?Q?UrR6UHvyfoT8DNbRR7YTeN4ci3MPmF+v6zuz5KHJwEULNFCCJ4O9sJEppNz2?=
 =?us-ascii?Q?9mVwk4ou0oRr5z+kPXy1yW4M7Dk+lVjjyMdx4Y8XgKuQYTv6bLfnVNOu78MZ?=
 =?us-ascii?Q?CmXF11NNfSxMJPilWbvW2IuCdEnx2B/Xr5/0ZjhI85wACQeZyE0q6GDLlTnM?=
 =?us-ascii?Q?4Kl/eCeXDk41xAX+lI8sDXyOnnAGjh9cSMnDhLoOrTzRmSnDqjQtF5JJB8Ha?=
 =?us-ascii?Q?c0qlznx+mQzJn9hKIj/z5CTnju/jrmJ1rxMXmbmT+3uZNO6hQ0VXrM4I9ee+?=
 =?us-ascii?Q?0tFCXxkx+TE1tQCTusVc6mDcD/sXlMxLG8qRxg8MuuoEIn4UXrMPiKFC+Ytc?=
 =?us-ascii?Q?yVhbbePe9vZjawbamL/gaKwkW3RQyX+/UoHlFItDAHterMr1N8aqPuG0zIxW?=
 =?us-ascii?Q?zIqA+hdb+xgz+CD0tijLXJmU/UcX1agSGSXW4KLiSTfvqZRTjRNe1JdnV13v?=
 =?us-ascii?Q?aR4yfJpXbUBR2+qlxTo+5EKNcMAi9pTrVISWe1VJN13RliVEewGB9D514/Sq?=
 =?us-ascii?Q?6Gs08IBy74izoTQ+n+WIxGlbMUUt+RzuUd/IzHt6NoqwgI3bjXRw0XgWEjIR?=
 =?us-ascii?Q?cgo70IriExC7SgdALczYSc+P9SCveSiUPyYarGi73RGlhRqq5YLpIizBl9X+?=
 =?us-ascii?Q?3xnfIscjog5u8i7gtjo1SDP0Srz8TlI7wZ/ZGSNsK/5UVDHORsx29qCR4bUQ?=
 =?us-ascii?Q?lktQk4K85qJMuEqtsfnNd+buL4hBoGGQ24HoNAsccGChEx0wqz4SwGlULpEI?=
 =?us-ascii?Q?yMgoUdnjzX2eGTK6se7rc8o8/MgXc1ONDgkhGZgbVPHo5e84T8J6fEfEC93r?=
 =?us-ascii?Q?BePgrFqFl1Vj7ZitG453xRVFX51Jwo8XkIMuwoTWKRVLwTllr35fyX1bLjjo?=
 =?us-ascii?Q?VpeDS+D/GVBuKaOz+ffIxUuDBMGIgxLyTeuLbeOi4aIVx7PskTtxaoYoPxIE?=
 =?us-ascii?Q?rqGb6Y1C2tJU2/rzTVHieXsj5YglrO74h/9idXC8G2jdrGXAEvFsV4Bp6045?=
 =?us-ascii?Q?9HPjcgLD1YfgQHbU6vwVP/Pe0u/dckoZLGFNAF3LcyTvFaClEgOqTQzuzThw?=
 =?us-ascii?Q?lnJ2w7qiD5UcbkqsHB0lbTmmsbNnBspG/oeaosmFlCFe3vkF6zbVCSFtQOWF?=
 =?us-ascii?Q?gJdJ4H6S6+bbbXuCyS5NU8fNPg9Vr/BcG3ZWB8ZzVhzDRvXjd2ehBD3TuxsU?=
 =?us-ascii?Q?l5NJQtMQaQSNnNwZoqHkRXBzKSysREwridMpFAL/fycTMGer8ds5G5oLC6eC?=
 =?us-ascii?Q?RHajVFp+IJstUV9OQqQcQMtBB8IsxfOVXzbu8pcXuYu8QpLoJypkG2kn7xpn?=
 =?us-ascii?Q?K0sFXNprzKxVmyo7/50=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 19:43:18.6613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3422b21-ed98-469f-5aeb-08de0c231756
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_204335_954227_541E179C 
X-CRM114-Status: GOOD (  11.04  )
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

Both the ARM_SMMU_DOMAIN_S1 case and the SVA case use ASID, requiring ASID
based invalidation commands to flush the TLB.

Define an ARM_SMMU_DOMAIN_SVA to make the SVA case clear to share the same
path with the ARM_SMMU_DOMAIN_S1 case, which will be a part of the routine
to build a new per-domain invalidation array.

There is no function change.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Acked-by: Balbir Singh <balbirs@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index ae23aacc38402..5c0b38595d209 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -858,6 +858,7 @@ struct arm_smmu_master {
 enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_S1 = 0,
 	ARM_SMMU_DOMAIN_S2,
+	ARM_SMMU_DOMAIN_SVA,
 };
 
 struct arm_smmu_domain {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 59a480974d80f..6097f1f540d87 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -346,6 +346,7 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
 	 * ARM_SMMU_FEAT_RANGE_INV is present
 	 */
 	smmu_domain->domain.pgsize_bitmap = PAGE_SIZE;
+	smmu_domain->stage = ARM_SMMU_DOMAIN_SVA;
 	smmu_domain->smmu = smmu;
 
 	ret = xa_alloc(&arm_smmu_asid_xa, &asid, smmu_domain,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2a8b46b948f05..0312bb79f1247 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3064,6 +3064,9 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		arm_smmu_install_ste_for_dev(master, &target);
 		arm_smmu_clear_cd(master, IOMMU_NO_PASID);
 		break;
+	default:
+		WARN_ON(true);
+		break;
 	}
 
 	arm_smmu_attach_commit(&state);
-- 
2.43.0


