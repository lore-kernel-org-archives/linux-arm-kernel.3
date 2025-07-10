Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268EBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 06:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2urNujoCbfVjgh75rFz4HYYLC4oj/nztPYBRPw44wY=; b=tiU7X+MHjXEY+xMfNRc/X2LJV/
	ByHvxvK0Dq4qtSSS6GCy7QnCKu0j0aIDjGoCiO96VPbXhxvFE+p6/SvVmxPH2BuFJkjmMGmyil7jI
	3hgdhqV+kgIin4w4EugsJp0g/kZQ9cvIQ7JneczYkQNtHGIW8JSNgEMSx/+7RAiQl8i4i4NX1yqnf
	XOCVXXXCs8ejKl/ifM0i7XaRIVZArbIhvbBzjJWdVMQGdxpW6VZaL2wdQCblrsf6wx/2nt/3LvVzm
	gZQQlOF1gdMiezi2zIekWDoriASb5jQ2p81sUnsoZNitqG4XKFjd9IMXMnItq9mRVS5T3kRlID0K0
	gb//troA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkYg-0000000ApsL-0qOv;
	Thu, 10 Jul 2025 06:15:02 +0000
Received: from mail-dm3nam02on2062f.outbound.protection.outlook.com ([2a01:111:f403:2405::62f] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkKO-0000000Alr8-0Iys
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:00:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cxo2wGmTTDlQ4lKXXCz4AS4jyEy4cQO8yGK7+KPf/QFH1Qk377Xs1di8Nx1oN5d4i6lHVsr9iyg3MsPuDBmsEw4gW6wVgOR0aJsKeN03z7lTBT5/qdQGPvgc+CRCeUWNOFvETzy1HBhxD5H1P5+o30IbKFHMbDGof1OrLWlurZbforFc/j/XuyOjhC597lzVnfl54Qr6ta1B/ICHjCyojQdAj0Ne+dwpc9Ndoi8LXxqBy4aGrI8meTEKOpdsBIFwq1CfMSCC3r7GVfYFXAJ0pvT4u6qvWu6AmmnDOhBcJs03e8ihvUXHLPm6IIoiVPYNrcqSFK78QNbYtX/9l3EC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2urNujoCbfVjgh75rFz4HYYLC4oj/nztPYBRPw44wY=;
 b=lA9FxtuKKOspWcs7WWiLM/IDJXMipZ2d0vJhBJqW3GsZPu7TjYVHT3TZq/Ltlhj8dg+0O2kN+r5YpjmwJ6nmpXzreyKqiZeC+JWdL+rB7WMalXUviYe3vOeJICH8ah1tHZJ0JpbUox9ZU3Dt5k2u0RcFOHPsxuOZx+6sR2wSngUBv8P10IxWQ6m/bRdjR0FlPn0sz3OrKvTZ27xymjHqQ29Dow7rMMuBmcG3yUwFTIGl8KVlPsF1FvEZrkqoc7RMUK18dmkberU5D1FNuFH3oOa5i5/EGTvcCCumPOAkNddI5mNSfMxMGo2naY0ZHCcEFycFxxIIoC6ny11RMPmS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2urNujoCbfVjgh75rFz4HYYLC4oj/nztPYBRPw44wY=;
 b=U19MV9AdF63fjyeF0PFO9Bar/V6ymMV6w5YrkVTP5pwVrhNirll3YUz//zlCclDssybzUrcwkijmuetKzr51d2U+YifWL+wb/3Y/vrumdFN1wUJ5t6TqWGChvpAgB+aM2SCzHPSLLzLvYrTZy0b3CWaQ1kOE/Fz7gIIlUAB4xdeKFSr3o74ecdLizHEYTzNMMcBin1YFUufZWDfj4/H6l6T8X6kPpY/nsJXqEqFOgxHecF1sO2lHXHMlPXiH4AWFcRlLeeWFeHVB9nUdTI/CKjjOFeMHfUY8Z3JtkmahfT9L5BJILtZzcH3V4I9kiQF9JlLcbk70JnFphsaObuKllA==
Received: from BN0PR03CA0007.namprd03.prod.outlook.com (2603:10b6:408:e6::12)
 by DS0PR12MB7655.namprd12.prod.outlook.com (2603:10b6:8:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 06:00:09 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::4a) by BN0PR03CA0007.outlook.office365.com
 (2603:10b6:408:e6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 06:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:00:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 9 Jul 2025
 22:59:55 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 9 Jul
 2025 22:59:55 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 9 Jul 2025 22:59:53 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <bagasdotme@gmail.com>,
	<will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: [PATCH v9 05/29] iommu: Add iommu_copy_struct_to_user helper
Date: Wed, 9 Jul 2025 22:58:57 -0700
Message-ID: <fa292c2a730aadd77085ec3a8272360c96eabb9c.1752126748.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752126748.git.nicolinc@nvidia.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|DS0PR12MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7c266b-874f-4da1-eb47-08ddbf7706e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O4MHz9016xsOPRvSHtVpSGbNsh8uelkJEvmUkZFwjS2VvD+6Hu2qk5RvUodN?=
 =?us-ascii?Q?OZePM+P50rnplJF1HumZClGPisVenaJLptlqfe06paEa9ICV0Y3J/V4AsE3D?=
 =?us-ascii?Q?pO07SSPpQKadp7XZgUJBiFeg0umDCtVitRiTWJwf8AaIE3pJWvZCfeLLx2Dd?=
 =?us-ascii?Q?V3H+ISXP5V3KgaevuIOIMbHRf+audzyiqpX3yPc1bCa+SVOBGWBFnMoZ/Z2P?=
 =?us-ascii?Q?SwdX5FFrvGyx2hGWa8wr27Z6xmAHb5trHaekCb7kbUKwbki39gEiG5Ass6gD?=
 =?us-ascii?Q?Gw7S4ZdYG56LwiREih7nZHDA4TDSgaGsL4cvmqLoPxH09Wu0WPkaaxr3wBLc?=
 =?us-ascii?Q?yc2pKXyGvsYCTd7/0cup/eNiENROzqwgBOMrgT+4iKALt9ui29YPPnbIW2h0?=
 =?us-ascii?Q?qKL2JdXRs9aK+bT+SlDeZMeH1JX8ekOF0XnConRjQPOBWTydlUrlOeJA+XvA?=
 =?us-ascii?Q?iL0bRWb8IdCJjh5u2jFehdwLSbhQSJhZwjq/T/o4PxfD8T/B1mu24s/SZg1r?=
 =?us-ascii?Q?nl9i2gR6EpkJkP9cn4BZxLbbu+dmFFoc2zsHUgsZ3FPd+7TaMHf5E7sV4duy?=
 =?us-ascii?Q?tsHgkmHnouhvqaJZxSlcHuQ81PEBxeugcLRo5H79TtATBp1K7TIIyjqXlW/e?=
 =?us-ascii?Q?ePTrNKmfTPq2GN/nGF84UXSK6BX05vBAdlC4coiEErCMytCGDpBSZB6aJfCj?=
 =?us-ascii?Q?6p/kgF2bqj1WNgqNU24xXuq8NIYSNvqe5LPG6h+V6Vh9ob5nU4j1ZHNWHrSa?=
 =?us-ascii?Q?dHkU/J7UP0WeYcoNpNcOdgLdeBIJt0PCIVWjmX28FhDEYrk7BwZLb/nPCmvC?=
 =?us-ascii?Q?39K7SVkSg1ESI+EZ+wlOnAhHm3aLGoP7xuGkCZ1SQHLq5lUmRKL6h0AA9ih/?=
 =?us-ascii?Q?XSPf0HTW5ripT4C5PCG10G/sxKMv0h1oPUsPI0YzS7nNVvOWuVyl7CD+nyCt?=
 =?us-ascii?Q?nzq++uF6+9nzzWxlpA/pOXwfhBLLb+3HmD9YZsCKQ3j+3boAw5+fbjskYYxk?=
 =?us-ascii?Q?SmyTDqJ26wk3b6JlqeciewRHGfvoxkRLKyuqJw0tWQzryN2caJiZiqVVGclA?=
 =?us-ascii?Q?ZUsk26ELb5pROiXPgQLgpC2Eb3sos9f902at6L9sbI0d4+vm5TIMi1sZD0Ds?=
 =?us-ascii?Q?7QOJvxlYB7W/LGPrQPf1G2aN3+WYg53b1E6ps7itLclQsQmvy2Co2u4vfiXG?=
 =?us-ascii?Q?pxmV1oSNsZl3HlPTbPRUVr/92FsYAtWtsQV9eVTjwSLibN0rL9NPiXbvq2av?=
 =?us-ascii?Q?OZpaJReQ06cUM9qN8JWO1iiYthFWfQFHVImKACWOwOtXtCgFGfOIC23I9Xnq?=
 =?us-ascii?Q?wwlo4/Yyq4OW+PY5Y4Ww8H6BB7RGWV5Py3MFQ0c2E1z+ACQMQgq7BmUZt1HQ?=
 =?us-ascii?Q?oU3zB3i05W1IpDyt0g4a+gTIAVdrc3JTweZ/fS/Dy9uOXru4zEdxyDq5Exeu?=
 =?us-ascii?Q?7Vz13RPQtsOJfmI85bniFWA9ktUw2h3BzGcPc5FQtUJpgqV+XDNxDSiPkQme?=
 =?us-ascii?Q?iuba0SrTxYDQXSI0DCP0h+3PoH8MI3A7rptD?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:00:09.2261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7c266b-874f-4da1-eb47-08ddbf7706e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_230016_106334_4A5BAFA8 
X-CRM114-Status: GOOD (  13.35  )
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

Similar to the iommu_copy_struct_from_user helper receiving data from the
user space, add an iommu_copy_struct_to_user helper to report output data
back to the user space data pointer.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommu.h | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b87c2841e6bc..fd7319706684 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -558,6 +558,46 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
 	return 0;
 }
 
+/**
+ * __iommu_copy_struct_to_user - Report iommu driver specific user space data
+ * @dst_data: Pointer to a struct iommu_user_data for user space data location
+ * @src_data: Pointer to an iommu driver specific user data that is defined in
+ *            include/uapi/linux/iommufd.h
+ * @data_type: The data type of the @src_data. Must match with @dst_data.type
+ * @data_len: Length of current user data structure, i.e. sizeof(struct _src)
+ * @min_len: Initial length of user data structure for backward compatibility.
+ *           This should be offsetofend using the last member in the user data
+ *           struct that was initially added to include/uapi/linux/iommufd.h
+ */
+static inline int
+__iommu_copy_struct_to_user(const struct iommu_user_data *dst_data,
+			    void *src_data, unsigned int data_type,
+			    size_t data_len, size_t min_len)
+{
+	if (WARN_ON(!dst_data || !src_data))
+		return -EINVAL;
+	if (dst_data->type != data_type)
+		return -EINVAL;
+	if (dst_data->len < min_len || data_len < dst_data->len)
+		return -EINVAL;
+	return copy_struct_to_user(dst_data->uptr, dst_data->len, src_data,
+				   data_len, NULL);
+}
+
+/**
+ * iommu_copy_struct_to_user - Report iommu driver specific user space data
+ * @user_data: Pointer to a struct iommu_user_data for user space data location
+ * @ksrc: Pointer to an iommu driver specific user data that is defined in
+ *        include/uapi/linux/iommufd.h
+ * @data_type: The data type of the @ksrc. Must match with @user_data->type
+ * @min_last: The last member of the data structure @ksrc points in the initial
+ *            version.
+ * Return 0 for success, otherwise -error.
+ */
+#define iommu_copy_struct_to_user(user_data, ksrc, data_type, min_last)        \
+	__iommu_copy_struct_to_user(user_data, ksrc, data_type, sizeof(*ksrc), \
+				    offsetofend(typeof(*ksrc), min_last))
+
 /**
  * struct iommu_ops - iommu ops and capabilities
  * @capable: check capability
-- 
2.43.0


