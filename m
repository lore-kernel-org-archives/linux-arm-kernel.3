Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B804C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 03:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsAQua4vA8R5n6nAXJhYSX4oJXeaTGe1TFJYJKhyJy8=; b=hVSiEayXN1F7Jxq+I4LoMQUMiu
	VaD42A1fDQ4gJO+d4Tzx/xapGRot3ZXtELy3ZzgEdjaCXBiimv8zSJuEZ4bQw/w2QdPPrrVeYmJEk
	TjmUVZMydCpPYNFPhWMztLgPz3JpsoaQD2mmBZPl6g914e0nKdV0yUQYjbHOJ/u0yj7o5tNa3+ZT/
	oxIgQ9dbNVWRWYWbF2CAB8LCR3NC0jeKXDDWVeN5Fo3QGRW5AlnPXYORcYApWHyNUUGB87jD8YFyZ
	W6Ha0vcOPCnbHAmocTGskbezSg4BzItKbtrHuD+WyBXyXFc/0qZl6I3UmkFdqd3FSRkmXnbBYK2fA
	LRMZ6Ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEeh-00000002OCU-1G2a;
	Fri, 09 May 2025 03:44:11 +0000
Received: from mail-dm6nam11on20613.outbound.protection.outlook.com ([2a01:111:f403:2415::613] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDE1m-00000002Isv-3qYs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 03:04:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPwAomuZFMpY5GeAaFmHLDQ0qePEoO84VyVpyx4bQbr1x+QO+hhsyna3TaFBkccT4I+bfrUYhWRC71oArijX43bVAftdSudVR+j4kUDiwEhs3YcorfzUemofvqiUD274Yco8BIZIdyzv/wHanIyY2vFQz5Vwm95rLRdjZr1c1J3ey1KlckVnIRp0CfLxqNSiN+9b5r2tzUf6u6DolNTkWJq0VjIYtP/RCpcLU8SVuqwKh0uu+G2VwgDyG8wnii9YARFJ5IZLgjaGFwzmACXA25IaOct/RPnPwRNIyCfrUgxIHEFtfwivAT2W9Kw0aqZBQbRKuhIKyKnysZ9dsSkYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsAQua4vA8R5n6nAXJhYSX4oJXeaTGe1TFJYJKhyJy8=;
 b=NWLR2lzmU4GkNVCe9Bn87vLJtIato6LxN1pBll3BEj4ZzrZzGyMMaR1aonGExMymAVfF4+4S6pkkc0yCOLvhQtFk5NlPN29N+dMjjVz1zDNcKM/SiCHayEoe1pgKx8QdKac22mVSuPy1BTRjAGeqrb+b4LqY8vUI5G4VFpvHrh2VBtjoMKs1Yehgs+yns7kaU4XsMPHY+oZw6c7OEpVT/PptzuglaBFQZRHT51Ff4daYmJEc6iyzaiQbDor91lrpgIQnzHx/aehVAkmlw3br0k8lVgi3vynCZufqWFkVCYyvwLaDyzedlq+JKGiIs8nsqHTHxlCdlWBIQiLTZv5XpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsAQua4vA8R5n6nAXJhYSX4oJXeaTGe1TFJYJKhyJy8=;
 b=lZcn9TdY+6s/ZkyomqQUGsU3svqWQk2Cz1iS/2A9MRFRlwFA5l0504PDNt7/WnZM+upZxlZ3Ji4hhPQ2mdxnpjf1GbLrTIle9m3ag+dKvcFoJcP86XdzLCL2paOyPyW+HkyGMxdhKQTokZH1BDmrZWa3D2j/HGRLy4BEuomS4fXUB3Y3Cw6KU9+JsUPCxbR9XS8gLSOKzpdqrTHd2ZqSdlOtWaQUpabAyiO3g+Rz/uZe/J59pdNQGds/kxvMNLYXDy2JVi3wjz6zdHckyZK8Mtt9ugRxrO3bmK4axfdvOWX/vikYh1gSOuRUelrQUjN7gDQumCWIRBqalDeIRn1EkQ==
Received: from MN2PR11CA0015.namprd11.prod.outlook.com (2603:10b6:208:23b::20)
 by SJ2PR12MB8651.namprd12.prod.outlook.com (2603:10b6:a03:541::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 03:03:44 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:23b:cafe::bf) by MN2PR11CA0015.outlook.office365.com
 (2603:10b6:208:23b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Fri,
 9 May 2025 03:03:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 03:03:43 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 8 May 2025
 20:03:33 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 20:03:32 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 8 May 2025 20:03:30 -0700
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
Subject: [PATCH v4 15/23] iommufd/selftest: Add coverage for the new mmap interface
Date: Thu, 8 May 2025 20:02:36 -0700
Message-ID: <ea380d5d4da4e34c7c7830b3a681d046154d8b63.1746757630.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746757630.git.nicolinc@nvidia.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SJ2PR12MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f193799-2ea8-4c2a-3cc9-08dd8ea61b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vjgpq7TaZ68FHAKbYtp+Y5G0TmGVee0iYC3qxgUTc+T7Tkm7QjSXVGBbnbpC?=
 =?us-ascii?Q?AyuPHUgzI7LtWtLpXR3QPUfaPlu6EOzEgreAvhElH4G2uQlayg6lPRhppTyo?=
 =?us-ascii?Q?wHy3xaSk+jD8Mw7tdJvqeCOqZBYx3lx+sqtY03ytfaXyK7jWsecoTzRtxRzu?=
 =?us-ascii?Q?asY50wSyK58BfBReQioE8s58B7GPV7lJShSbW7Ij8cvOsw0M+JmiYM3VL3XS?=
 =?us-ascii?Q?R0xRCXr/PBik9guyiaKx3WhAYkYLjp1C5MCzCEde7sEtT6gPXbl0QPQGtdhD?=
 =?us-ascii?Q?SsB4PISdywfNCYoxydQmDcpu/cJV2sCzlDybVgre7mq5WsiqNDsFAU/uhav/?=
 =?us-ascii?Q?mx/6RFKrA73dtDTEOluRgtnE0TYlxX0kqYxnciQ94uxcRMgWBeU9QQyJmp6s?=
 =?us-ascii?Q?e1MQ2SkvyNlvxU50M216FZyAWzs+BgukbZ2iReQuzOAFSd+TeA4p/+U0x4h+?=
 =?us-ascii?Q?jmuG7SFz+rlQSK4vIeBHdjSdBsa+O44/vAbnevjiQem4ezPWOGXaBK48/JTh?=
 =?us-ascii?Q?QrwPqtHeQllAVj5q9RefAzveUBDUEmeIKIe3G8H+tNZQEHIhZx2tA+A/muy4?=
 =?us-ascii?Q?UtPjPk5oWevSswWses7ZjvvLA+3uERBRlmCD0V2o4JQ9usV0q+19e7U+eY2R?=
 =?us-ascii?Q?h/7EWAJOBWlTGXQMvZyPZWbCulOvZKQy77o/e/ROp5+Y8Od/3D1ZMpKa8xqA?=
 =?us-ascii?Q?TpqO+1IUemLg2uThT6MB1trJ7Ii/zrQ3Rkr8nGeUBNxmhJtpU+LnaukPb/xI?=
 =?us-ascii?Q?PHVEntrq5Rfurxgkt4BPPhh23oKkJ+FpouazBP+ZMe5S4aaYUvCZCk+rrlKM?=
 =?us-ascii?Q?aOB0K4JeHtFi726WpwRgIejl8fq+mPbTysyLtxI7ggoXAiJF4AqwBhveQFVz?=
 =?us-ascii?Q?yvg9Ykv/GXLYXPrBOrRUwozdYGZngQ6Ktgid0pyIubptNeKFGV7Y8ng1tkbz?=
 =?us-ascii?Q?QyBJUSktjEwzmZZ/yJtlhIpQnUzvVCwRpBV/biFQ4NroTZ2eUpfApebm6ipN?=
 =?us-ascii?Q?AgQYK5Fx0zDTCrAkAAnOUCz2KGFQcqbxpz0zrxy1oLMhJidH6uoEezytS84D?=
 =?us-ascii?Q?happZOFTFXnSKPh7Ox+jt7aPGhj3EAqjy5BGGQv/IcVNnHXvgGQ4/QyNzbIn?=
 =?us-ascii?Q?cQHFKfI8nfznbMln1UCxDccbkJBdHTCLu4+Uh0OsS6hL6wh6cSaLVv6fu0/t?=
 =?us-ascii?Q?2khiQNJ2RqKJXdp5U0MO+O4pPz2xOgD397rcQZ81Yi05N8jlagsrRZO79PTv?=
 =?us-ascii?Q?PZDuggJd/tY+h3p/vWZpj8Q9uF8697ruqfuGSa6DSOYT6jme9q7vrmKKhI5g?=
 =?us-ascii?Q?BgKBnKRoZmfFHJ9CWrYy3l4QTE30XxT0g3X0Jhu/Y8RFYVXvFZQ7KtYBEqU5?=
 =?us-ascii?Q?jnsl+jqM5ke5XJj4OTl5//jnZ8VwIZcIBZdK89bGVce6OBTxveVu90YF8n8o?=
 =?us-ascii?Q?L25r6JOO6uuK5GA1LnRm6R02R5rBg0QHYhz+rt5+Mb0F1Hjmquw9rkpAU8X/?=
 =?us-ascii?Q?MaMDiyV5Wg2KZE0odA+YTBVVTqAdwheP1jD7?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 03:03:43.1430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f193799-2ea8-4c2a-3cc9-08dd8ea61b7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_200358_957601_1241DDEE 
X-CRM114-Status: GOOD (  16.45  )
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

Extend the loopback test to a new mmap page.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_test.h    |  4 +++
 drivers/iommu/iommufd/selftest.c        | 41 ++++++++++++++++++++++---
 tools/testing/selftests/iommu/iommufd.c |  7 +++++
 3 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
index 51cd744a354f..8fc618b2bcf9 100644
--- a/drivers/iommu/iommufd/iommufd_test.h
+++ b/drivers/iommu/iommufd/iommufd_test.h
@@ -232,12 +232,16 @@ struct iommu_hwpt_invalidate_selftest {
  *                                (IOMMU_VIOMMU_TYPE_SELFTEST)
  * @in_data: Input random data from user space
  * @out_data: Output data (matching @in_data) to user space
+ * @out_mmap_offset: The offset argument for mmap syscall
+ * @out_mmap_length: The length argument for mmap syscall
  *
  * Simply set @out_data=@in_data for a loopback test
  */
 struct iommu_viommu_selftest {
 	__u32 in_data;
 	__u32 out_data;
+	__aligned_u64 out_mmap_offset;
+	__aligned_u64 out_mmap_length;
 };
 
 /* Should not be equal to any defined value in enum iommu_viommu_invalidate_data_type */
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 692c29ccdc46..36e7fc0059dc 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -149,6 +149,9 @@ struct mock_viommu {
 	struct iommufd_viommu core;
 	struct mock_iommu_domain *s2_parent;
 	struct mock_hw_queue *hw_queue[IOMMU_TEST_HW_QUEUE_MAX];
+
+	unsigned long mmap_offset;
+	u32 *page; /* Mmap page to test u32 type of in_data */
 };
 
 static inline struct mock_viommu *to_mock_viommu(struct iommufd_viommu *viommu)
@@ -647,9 +650,14 @@ static void mock_viommu_destroy(struct iommufd_viommu *viommu)
 {
 	struct mock_iommu_device *mock_iommu = container_of(
 		viommu->iommu_dev, struct mock_iommu_device, iommu_dev);
+	struct mock_viommu *mock_viommu = to_mock_viommu(viommu);
 
 	if (refcount_dec_and_test(&mock_iommu->users))
 		complete(&mock_iommu->complete);
+	if (mock_viommu->mmap_offset)
+		iommufd_viommu_destroy_mmap(mock_viommu, core,
+					    mock_viommu->mmap_offset);
+	free_page((unsigned long)mock_viommu->page);
 
 	/* iommufd core frees mock_viommu and viommu */
 }
@@ -831,17 +839,42 @@ mock_viommu_alloc(struct device *dev, struct iommu_domain *domain,
 		return ERR_CAST(mock_viommu);
 
 	if (user_data) {
+		mock_viommu->page =
+			(u32 *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
+		if (!mock_viommu->page) {
+			rc = -ENOMEM;
+			goto err_destroy_struct;
+		}
+
+		rc = iommufd_viommu_alloc_mmap(mock_viommu, core,
+					       __pa(mock_viommu->page),
+					       PAGE_SIZE,
+					       &mock_viommu->mmap_offset);
+		if (rc)
+			goto err_free_page;
+
+		/* For loopback tests on both the page and out_data */
+		*mock_viommu->page = data.in_data;
 		data.out_data = data.in_data;
+		data.out_mmap_length = PAGE_SIZE;
+		data.out_mmap_offset = mock_viommu->mmap_offset;
 		rc = iommu_copy_struct_to_user(
 			user_data, &data, IOMMU_VIOMMU_TYPE_SELFTEST, out_data);
-		if (rc) {
-			iommufd_struct_destroy(mock_viommu, core);
-			return ERR_PTR(rc);
-		}
+		if (rc)
+			goto err_destroy_mmap;
 	}
 
 	refcount_inc(&mock_iommu->users);
 	return &mock_viommu->core;
+
+err_destroy_mmap:
+	iommufd_viommu_destroy_mmap(mock_viommu, core,
+				    mock_viommu->mmap_offset);
+err_free_page:
+	free_page((unsigned long)mock_viommu->page);
+err_destroy_struct:
+	iommufd_struct_destroy(mock_viommu, core);
+	return ERR_PTR(rc);
 }
 
 static const struct iommu_ops mock_ops = {
diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index bfdb3a3f1d23..38ad71efb338 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -2799,12 +2799,19 @@ TEST_F(iommufd_viommu, viommu_alloc_with_data)
 	struct iommu_viommu_selftest data = {
 		.in_data = 0xbeef,
 	};
+	uint32_t *test;
 
 	if (self->device_id) {
 		test_cmd_viommu_alloc(self->device_id, self->hwpt_id,
 				      IOMMU_VIOMMU_TYPE_SELFTEST, &data,
 				      sizeof(data), &self->viommu_id);
 		assert(data.out_data == data.in_data);
+		test = mmap(NULL, data.out_mmap_length, PROT_READ | PROT_WRITE,
+			    MAP_SHARED, self->fd, data.out_mmap_offset);
+		assert(test && *test == data.in_data);
+		EXPECT_ERRNO(EBUSY,
+			     _test_ioctl_destroy(self->fd, self->viommu_id));
+		munmap(test, data.out_mmap_length);
 	}
 }
 
-- 
2.43.0


