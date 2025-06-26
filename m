Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79911C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 19:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2urNujoCbfVjgh75rFz4HYYLC4oj/nztPYBRPw44wY=; b=fXfxSURjreCd3FZ2fGAGJDQBcn
	wuquIfEgECnuFvIL69pVf/4KsqsCzg+t7KB5kzslQ+L2x229CT9kqPJnzcIjJuopxexHmsPFpehc3
	3cv7HhwpF5a2r9OgA2zyIcDYGdd5YmDXBNNqWAJ1wL7OqJRxCp9BWiCTZU9ccHcfIbbeBMq29JafT
	Fu5J6sFTQwCN3tRDSmI4VyGoPaObSwFqloQMnq2vGhDcsT0N/6fqP4s5nExu8YNf94m7vUAfCFHYm
	3dDgW8XDX5lBUUbmPvQUxjG5kVJ947q39VmB6fAhaf1osaojnOVQCdBKvmdipC6Ghvf3X2SmJ+qdg
	B6OnWFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsb4-0000000CdoK-0f7b;
	Thu, 26 Jun 2025 19:49:22 +0000
Received: from mail-sn1nam02on20610.outbound.protection.outlook.com ([2a01:111:f403:2406::610] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsNj-0000000CaCT-1rlI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:35:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLfRFBHI4iWnr0BqqHit85zqw1RAcyM1agStlA4QZm7MynHimJUOxXiCwF06a4O+Ld2P4Df4UI1EhPn8PrVBPJ88gWFtI25ZfvdDMoe9wNSxbfvVvL4IjWAjOjFC3pQMQzAEo95CZFU389LSYDbCPb1fydgYQZBPLjin1A8P9lCNHBOTDksXnwOgh8ITbLAlODKR5Gv0Cm0hTTbFq7jgNKP4NgacFVnzCB5yv3b6yAzMeIYUMBe/JhilTf4mnplMcX6L+vVbEiiUiU936pocMpUp0Z1yKCFOwZeWK+tDyj/2Pu7/gL6JWmzCMS6i4Ti22chndnrRBEZHKoK9hGl/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2urNujoCbfVjgh75rFz4HYYLC4oj/nztPYBRPw44wY=;
 b=N4jHAOb1cmLAHiirck2j3LmptLhbIkOeZw5cm2HDKlDV1UDN3nS9jthaZwIaZBp/Y9NTGW3PQOXjtzk+OFv9FFNO6WWnhXZpbs+tm8MN24RX+VdZaMxO9LujttmLXQ1FBDmT8QrOzxNcwq8VZ+SbCCHMiX+av/1VKv+ygEYExNCmuJt8j33FsDn2yQKoqo1/mPiQ4kkmmvOx3IMvAU2zjDxJR1p0SKIKHa2WueW73T2KO4m4+plGwnUI2YKhkyXIGp//4gmfvHtVzapsj+3uE2vwJpu6xP23SDC3zzoBz1kMkUTR9VI5O1J9A6raXUaGewBe2ymT3oatnqIUJBnUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2urNujoCbfVjgh75rFz4HYYLC4oj/nztPYBRPw44wY=;
 b=fzbA6B0jKIiPnZc8gt42sWdjgamTj0lZRmsf59t9lBHUvKQ7sqkSsWH5fNWGPdCXdnPYlX6bTH8qqpAw0xwOnx2IwcfoA1Hhy/JgssN8Qw0elNs+oVtdAh5RSByFZ1Vd68Vlycl7zSxxU46Foq+E+W11jH8vgn7YZ8s7IvzYz4Z0tdj69yTWdUlVie+Ac990HKTz973to5lrpYY1NGG0yG2dhYOFUXNcqMaHunBUFtcF86+Axthykr6E3vUfnp8HV3Bq4Tk9VJOjXUy+NXnsjwGS/W3FzkoWYn2ag+Klv7c/15v+A9xaWJhQkEtnWPOGu9QxMZyD9VMrTQX40fvyWQ==
Received: from SJ0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:a03:33e::32)
 by MW6PR12MB8952.namprd12.prod.outlook.com (2603:10b6:303:246::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 26 Jun
 2025 19:35:29 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::f) by SJ0PR03CA0057.outlook.office365.com
 (2603:10b6:a03:33e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Thu,
 26 Jun 2025 19:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 19:35:29 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 26 Jun
 2025 12:35:11 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 26 Jun 2025 12:35:11 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 26 Jun 2025 12:35:09 -0700
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
Subject: [PATCH v7 04/28] iommu: Add iommu_copy_struct_to_user helper
Date: Thu, 26 Jun 2025 12:34:35 -0700
Message-ID: <ec0c82b79cb4f3aa90c54c4763e42c7b6d8b5ca7.1750966133.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750966133.git.nicolinc@nvidia.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|MW6PR12MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: a7597bab-e7d0-4801-e764-08ddb4e89baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?apU/BAD/auh8ee4NirNDxLYUXmgQu4JtszXcjAhkAV1so1X3CxJR4UFosP25?=
 =?us-ascii?Q?y7m3c32ikXuAXtI1eEw7Yw6ulCopcdCcstVQxJ9bYTCZT5QWtQvnaws6k+OY?=
 =?us-ascii?Q?QEelixKOud7O+OJznV0VrKmCgD2mxntkKupMmWQG4vBjW9IE0DSZsgPcb7he?=
 =?us-ascii?Q?SeMJDxvh5CTj1zD+1/7E1qaeMlXpw6sBGPe3n5o3KYOSBYlr4aN5gk9cDnZX?=
 =?us-ascii?Q?Zo8UqWkJZFdu5JsH2YuV1lQHPSaxQANc4Yf0VVOGRcEsd07/74pAmoFTVdTW?=
 =?us-ascii?Q?JLuwtxwtWK14j0hrYg012P7AO5mVpE9+p7dJrE9MC1DzmxsVYkNufPzxglO/?=
 =?us-ascii?Q?qFzgJCs1SFNHKJD0MTIewJ/tVgf9OkqFK+6D/2mxLKHi58y252nuikW0BGud?=
 =?us-ascii?Q?wmzZlVLYCVfleKTe3ZCoBMVKBpX/3A6bTpAsSWtKU5QbD0okkR06hMPGUUo8?=
 =?us-ascii?Q?RHmrWpEjSj+ecmGYQUC2w1WMRg4rlY6kzKZKbn9XIIFbQXX4/BOHKk5MjWYk?=
 =?us-ascii?Q?G2sUaVs6tSfM5ru5EYkl2jp2dQq0QlF9ffyzDe5CnA3Gw7IM8TkjmPrEC4XH?=
 =?us-ascii?Q?zU1hGoIqD+ZXjAHTQdqYm+0K8qTm4Vcg6IWA0F6LUAk1KHJWHXzPT44ggn0O?=
 =?us-ascii?Q?+YQAyMjbw0X/aPLbYj82xHXM1kGlLeLVEwh3rKyZeker3MRG48rI3oNE478l?=
 =?us-ascii?Q?4b4zsDPknjRWQPxLTiUX0eespkHqAiwnCx20EkSunX75nRk4CPdti/1yOgFH?=
 =?us-ascii?Q?w/cTPnd1CwgUZcmcxyI7wDUOi1rMr1avY3qTVoUnLIdGcsA1KfqrGW86GGoN?=
 =?us-ascii?Q?MizIfmpIDioi6y5H8O1lVawuWBeH/GcSV8f5iuUKUiIRHi8j5lJU9cTy+6Th?=
 =?us-ascii?Q?9vaXwdty4BBAtQMOiU9fY6iINn25DHnN14xklQw0dBHIj9UtyMTbfXGih23z?=
 =?us-ascii?Q?Le9DxBYF5Hh9BcMpZNCqf+zqwYbrm7FvKwWx6169CETSdWX9lOKD4hpqR1wl?=
 =?us-ascii?Q?nYOTxYrEMQqY6lVlBKPsBlkk4qGVl9tWl+pXaXtbLTXr5BoW1x7Konab3M2Y?=
 =?us-ascii?Q?FANIH/T2HluoDFb+30LJ5bhoYliPwtqYJTs3H/qaVE0ipJjvF/y+wdepHaH4?=
 =?us-ascii?Q?rHSBbT9HhPvSZCcjmb04Ut3yGRPQ0cQG9PZeaNesP2TjH6N0BarbNNsvq2rM?=
 =?us-ascii?Q?inUsUF+blXzVyjsJJBEGIaX0FhlPDYKJJgl7p+ZvGcRAgjnW9Mktwp0gGeoF?=
 =?us-ascii?Q?qxjeII+NToDr6KMwgD2U1e09E7j31Quo3KjSnr5YyEhthUUfo96qC6vHqXQM?=
 =?us-ascii?Q?ObkRyfoDNjO3yvUaA1NDErjEmU/uGbjRbTVr2tQ77WXVUWVJq+fX63N4CNfW?=
 =?us-ascii?Q?0d1/IUcUlf7QB2GXyx8qpeBsraqvTUtc5YgSAHb/yBDzZeaxJ+XNsBZiJYU0?=
 =?us-ascii?Q?RT/INSYmYFkfUg1PrT+uc0L3k/1Ks88vPGvRK/ALEl6k58HbSSBuarxEjN9O?=
 =?us-ascii?Q?0mYIZ9n/qUU51zjRbGviNwz6Z3USSDyxfoFV?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:35:29.2713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7597bab-e7d0-4801-e764-08ddb4e89baa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_123535_517009_6E8EA3CA 
X-CRM114-Status: GOOD (  12.56  )
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


