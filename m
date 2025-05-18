Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F08C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 04:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4HojS49TgLrFyjn+pm6N47+T5bs5nD8oqRSAI25hXE=; b=H02HEN2QeMb19p56MudwMmxzoq
	2OLYmmtt63J4nyLWc5OQfZEPXu3ndzhn/8fH2jYSJC6EqbrNJSDx9OkxJOKxbLPPGUenuRUHBFfNo
	KX4tKD+eJzHB3266gblt4o3hNotF6kkVtVtEpPkstAkuLDlxR/gNXliLu6V1HSLQm2ailmy7hfwaW
	UTKgZjkfmeDam1j0FgneXlyoaM1otPYE8uOsZP3CPHB3nFxpkl18yhO8QJIWerYgqBdKdjPEyLP0i
	Jm0t5GGXJjnJ88mhZvQTY1vaL3HY1SYB2PPnpGpG5+DGfyFOoUbIoIWFaijeWoY7sOCSV2Ob5tw7y
	5vLn7sWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGVL5-00000006hGS-46Q5;
	Sun, 18 May 2025 04:09:27 +0000
Received: from mail-bn8nam12on20629.outbound.protection.outlook.com ([2a01:111:f403:2418::629] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGUc3-00000006bl3-3U2B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 03:22:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOG+g1q8pi3EFMx5ANnpuwFSe/zQdfaPkkBRH1txcisVuJVsS5WB6z3QTKNKtVsEKXzKtBnrgRfimmslFXWY+olPo425KSXOdcPyl+9hZaxF5IGcDt9EsqXcjgE+sW144Nkm3oYiMm2olOFbBCBHtokIx10b1u1mkC9cGPzJ92oGBiUcJ3Pbzec+EC/QxWH6uBoaC1vwOsFE0sDpuiAdBzxx4UH38rzOXqUJ8Zd9desGdcs32ckI4j+ipc/2BpmnNIv42xM/qEIUnf1vhkXjFXe839Ez38m4ZyyuxYY/6b829E4LedzszO088UbQ4Tg76J5n1Bw0FHAKsqPpbTUjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4HojS49TgLrFyjn+pm6N47+T5bs5nD8oqRSAI25hXE=;
 b=gIQrQwbytmg0hwnnuc8rSi6AB4WxOwMMO/2rBtOVOCNXqQft1Hqb/9a4HJa2PZ9oqXBRqW2BZr4CiT3V9DrI+q/0A13EIKD5g0DFo0eLWavnYAdleyQz2/htdfxxgdJJ3CYUtOGhwvApqi7OICarh0ItZV/WiXq3DeXfC6YYE5wQi2H+P50gtEFPvqi/YcizMd1nnWOffmxtL7P0cvysUF7vJbatiJ5uCO3rAfuT2Y36kSY8RQ4RtbF/Upgc425uO7NdXF8pmjWx8ueoKS9qlzT48t06Z6GTOlCQ26G2wDPAZPCfSBqIMDIgbbh9IYNqOUs8Y++jDCVxxHALhtSJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4HojS49TgLrFyjn+pm6N47+T5bs5nD8oqRSAI25hXE=;
 b=CJGz8QEL9xPHTcwRvgAfb+SvPQBDx299SgoyziBvLscMXLlicGIS0c9CQqcn4znxxPfLAhL/xtd8LVbjgaoSAtpwHWprr7eJWhTqw2SVA5fhh9H458skx+ji20lDaAI6y+plHEnhmwQXcIIJ9EBQ3a6ANyxuCq0sl8nmab/uULy/Az3Y6yGXfnVzOW3B3mqQAu2p+z/ImFMJcv0PV1Czd3QQRbU8lISRgOTiCapG72Fx41VGYkGVE0wsspChDn3JXkpysuecOCf4G9fiCgkoNkxzweAmDmehtvKBKGJzuYp/V+n7566OIyMXNm6FTqo7hrWU0EsVLojl+GbdHheyNw==
Received: from DM6PR12CA0021.namprd12.prod.outlook.com (2603:10b6:5:1c0::34)
 by BY5PR12MB4161.namprd12.prod.outlook.com (2603:10b6:a03:209::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Sun, 18 May
 2025 03:22:47 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:1c0:cafe::a8) by DM6PR12CA0021.outlook.office365.com
 (2603:10b6:5:1c0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.25 via Frontend Transport; Sun,
 18 May 2025 03:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sun, 18 May 2025 03:22:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 17 May
 2025 20:22:37 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sat, 17 May
 2025 20:22:37 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sat, 17 May 2025 20:22:35 -0700
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
Subject: [PATCH v5 22/29] iommufd/selftest: Update hw_info coverage for an input data_type
Date: Sat, 17 May 2025 20:21:39 -0700
Message-ID: <523aaea4faf9b91a54aeaecdb721c68ea3a675c3.1747537752.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747537752.git.nicolinc@nvidia.com>
References: <cover.1747537752.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|BY5PR12MB4161:EE_
X-MS-Office365-Filtering-Correlation-Id: 155f0b52-f0b6-49fb-9061-08dd95bb42f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8nzXGQw9JH+Tf+W2pC0I31M33UpmHCG4/1AYtnR3nftNc0HjPQ4dfNMjcjF2?=
 =?us-ascii?Q?dBJa30Lr/hp9ymQwvp1Vd1esPyoAwu2PLhS5bPLx51HUfwrWakwEwgjSq4JR?=
 =?us-ascii?Q?OPuV1BY90uT6fLh/TMYXncZGhY/ZwLaqhNZOKyDySQ6NgLe8BrGCGLLjhOfz?=
 =?us-ascii?Q?9hlEfZ5OFlxrdR0SO28ycClRdCRCa+BBxtF7PTLe3jWGbjsK7cihiXIn8XR7?=
 =?us-ascii?Q?A6HFcG1ForpGkYp2iVT76HWu+tdmxjuKh6i1G6LK+dGSj9TOnXm9XHE+IGi8?=
 =?us-ascii?Q?aXz0bZOTRfb5O524le0B3+XZk6W5cpOXaxQY3DZh+VXKzyPsviMSVhG48K4a?=
 =?us-ascii?Q?k9Rj8M7Y0uERIuuVbgIbs6qnjyBmdCqR4tYT9N48gYpy9bK2fq4s10+/i94y?=
 =?us-ascii?Q?2rkQPTkhhfJls6LWTX+KG1x8wM+h+qEebCtRlO0vuTYscx1N9vtnbLmsag1b?=
 =?us-ascii?Q?JfqX25+lkrxC3Go+KFGM6ldT2Tj432IIVPcTHrc9m1EO1np31ZEwqozhXeWb?=
 =?us-ascii?Q?CGIB94iMyAsnasPQgvEnLx7jAtgL2+LhyaDamfDccMYnQbTh3Hm8jE1yCSVc?=
 =?us-ascii?Q?G559mGL7ulXlK8yu3i6AY6Qohw6Py2+e3xMPYVeL6jn8UAYHMt7LZIu0hd5T?=
 =?us-ascii?Q?s3NDd6z3pBJh66HOkGnaWVz6uUbz2y7xAyrmBWdeB+1uU8Q4lgAe0fAQ9rgl?=
 =?us-ascii?Q?BOgw3WRDmvOXsQrtOBA3jffT9ss8ZFZnI2HArTnhwVe2WVx/TcZYotf7qQeX?=
 =?us-ascii?Q?ynObSMPOCCHc+Ju5y/e4NusWbwTj0xy05U7NFAdenOBszBj675qOYHHG52Rp?=
 =?us-ascii?Q?9D1cGn09VA6WvSPoSdBN9iYCCNoMy2jq+72/l+n1/Gnk2AriNnVi3jUf64S8?=
 =?us-ascii?Q?6EGCp6Bjt273g1gwHt4O7NN6nB+zVI5ChIIiRmCQ8vhmpo8sBfxHTFhGun7J?=
 =?us-ascii?Q?pWMNC18YArHPCa9hAvvB5BhWGb2FQBV1TUR5w6aGEneyc2YHiIKoPXVjtK/8?=
 =?us-ascii?Q?LSdLpZLUgDf/IlQn1YL7X0D45aPjoaKWMTMUvObKC40dsUYWSb2xAoVszOiL?=
 =?us-ascii?Q?HvXf2dnOvizFmAM4aCIAT8QdA1ywIhcOeVIib9pKzkFVj0CThI6SrCVzrX73?=
 =?us-ascii?Q?3P06gU05AAMyHjxZMbFGsUYCUWX4a02A0pnT04J7dJo/1heue+h6CJo7qD1w?=
 =?us-ascii?Q?HkFFX65giyxdwPldITwu1ymO2n03dACJYp62hqpp9DAmFVRswTZyY5F/5b4U?=
 =?us-ascii?Q?B4GEN+nJmum6uT9SKKTGZmWnnCN30ZX20CqAE6YVNfJsFiaHW1Jj2s+QcJa8?=
 =?us-ascii?Q?PJ++NzAP5rlQ/rixrXJQvoBQTGN1xcH19yiAY/ubT6mY0dHhJdJ/ZmiqsJvt?=
 =?us-ascii?Q?p49wfDJbjMtdPNAJc926bTsyEh8pOmsoEBve459Cg8BYaToG0tCu5kN3ubAE?=
 =?us-ascii?Q?lvbvYhTp1P/IEAWvT5w0K42nRVaEvIYHagU81cPeWU0Jxj6U39/Hr98y0YNE?=
 =?us-ascii?Q?bjcbIazMWSRR9vBU+xw0MQB9OjR4ykcCFcMR?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 03:22:47.0125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 155f0b52-f0b6-49fb-9061-08dd95bb42f5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_202255_958129_E9AFD099 
X-CRM114-Status: GOOD (  14.79  )
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

Test both IOMMU_HW_INFO_TYPE_DEFAULT and IOMMU_HW_INFO_TYPE_SELFTEST, and
add a negative test for an unsupported type.

Also drop the unused mask in test_cmd_get_hw_capabilities() as checkpatch
is complaining.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 tools/testing/selftests/iommu/iommufd_utils.h | 35 +++++++++++--------
 tools/testing/selftests/iommu/iommufd.c       | 32 ++++++++++++-----
 .../selftests/iommu/iommufd_fail_nth.c        |  4 +--
 3 files changed, 47 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
index 4a1b2bade018..399d0dd18daf 100644
--- a/tools/testing/selftests/iommu/iommufd_utils.h
+++ b/tools/testing/selftests/iommu/iommufd_utils.h
@@ -761,25 +761,29 @@ static void teardown_iommufd(int fd, struct __test_metadata *_metadata)
 #endif
 
 /* @data can be NULL */
-static int _test_cmd_get_hw_info(int fd, __u32 device_id, void *data,
-				 size_t data_len, uint32_t *capabilities,
-				 uint8_t *max_pasid)
+static int _test_cmd_get_hw_info(int fd, __u32 device_id, __u32 data_type,
+				 void *data, size_t data_len,
+				 uint32_t *capabilities, uint8_t *max_pasid)
 {
 	struct iommu_test_hw_info *info = (struct iommu_test_hw_info *)data;
 	struct iommu_hw_info cmd = {
 		.size = sizeof(cmd),
 		.dev_id = device_id,
 		.data_len = data_len,
+		.data_type = data_type,
 		.data_uptr = (uint64_t)data,
 		.out_capabilities = 0,
 	};
 	int ret;
 
+	if (data_type != IOMMU_HW_INFO_TYPE_DEFAULT)
+		cmd.flags |= IOMMU_HW_INFO_FLAG_INPUT_TYPE;
+
 	ret = ioctl(fd, IOMMU_GET_HW_INFO, &cmd);
 	if (ret)
 		return ret;
 
-	assert(cmd.out_data_type == IOMMU_HW_INFO_TYPE_SELFTEST);
+	assert(cmd.data_type == IOMMU_HW_INFO_TYPE_SELFTEST);
 
 	/*
 	 * The struct iommu_test_hw_info should be the one defined
@@ -817,20 +821,23 @@ static int _test_cmd_get_hw_info(int fd, __u32 device_id, void *data,
 	return 0;
 }
 
-#define test_cmd_get_hw_info(device_id, data, data_len)               \
-	ASSERT_EQ(0, _test_cmd_get_hw_info(self->fd, device_id, data, \
-					   data_len, NULL, NULL))
+#define test_cmd_get_hw_info(device_id, data_type, data, data_len)         \
+	ASSERT_EQ(0, _test_cmd_get_hw_info(self->fd, device_id, data_type, \
+					   data, data_len, NULL, NULL))
 
-#define test_err_get_hw_info(_errno, device_id, data, data_len)               \
-	EXPECT_ERRNO(_errno, _test_cmd_get_hw_info(self->fd, device_id, data, \
-						   data_len, NULL, NULL))
+#define test_err_get_hw_info(_errno, device_id, data_type, data, data_len) \
+	EXPECT_ERRNO(_errno,                                               \
+		     _test_cmd_get_hw_info(self->fd, device_id, data_type, \
+					   data, data_len, NULL, NULL))
 
-#define test_cmd_get_hw_capabilities(device_id, caps, mask) \
-	ASSERT_EQ(0, _test_cmd_get_hw_info(self->fd, device_id, NULL, \
+#define test_cmd_get_hw_capabilities(device_id, caps)                        \
+	ASSERT_EQ(0, _test_cmd_get_hw_info(self->fd, device_id,              \
+					   IOMMU_HW_INFO_TYPE_DEFAULT, NULL, \
 					   0, &caps, NULL))
 
-#define test_cmd_get_hw_info_pasid(device_id, max_pasid)              \
-	ASSERT_EQ(0, _test_cmd_get_hw_info(self->fd, device_id, NULL, \
+#define test_cmd_get_hw_info_pasid(device_id, max_pasid)                     \
+	ASSERT_EQ(0, _test_cmd_get_hw_info(self->fd, device_id,              \
+					   IOMMU_HW_INFO_TYPE_DEFAULT, NULL, \
 					   0, NULL, max_pasid))
 
 static int _test_ioctl_fault_alloc(int fd, __u32 *fault_id, __u32 *fault_fd)
diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index 2b3274015832..eb5b0adb16a5 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -764,19 +764,34 @@ TEST_F(iommufd_ioas, get_hw_info)
 		uint8_t max_pasid = 0;
 
 		/* Provide a zero-size user_buffer */
-		test_cmd_get_hw_info(self->device_id, NULL, 0);
+		test_cmd_get_hw_info(self->device_id,
+				     IOMMU_HW_INFO_TYPE_DEFAULT, NULL, 0);
 		/* Provide a user_buffer with exact size */
-		test_cmd_get_hw_info(self->device_id, &buffer_exact, sizeof(buffer_exact));
+		test_cmd_get_hw_info(self->device_id,
+				     IOMMU_HW_INFO_TYPE_DEFAULT, &buffer_exact,
+				     sizeof(buffer_exact));
+
+		/* Request for a wrong data_type, and a correct one */
+		test_err_get_hw_info(EOPNOTSUPP, self->device_id,
+				     IOMMU_HW_INFO_TYPE_SELFTEST + 1,
+				     &buffer_exact, sizeof(buffer_exact));
+		test_cmd_get_hw_info(self->device_id,
+				     IOMMU_HW_INFO_TYPE_SELFTEST, &buffer_exact,
+				     sizeof(buffer_exact));
 		/*
 		 * Provide a user_buffer with size larger than the exact size to check if
 		 * kernel zero the trailing bytes.
 		 */
-		test_cmd_get_hw_info(self->device_id, &buffer_larger, sizeof(buffer_larger));
+		test_cmd_get_hw_info(self->device_id,
+				     IOMMU_HW_INFO_TYPE_DEFAULT, &buffer_larger,
+				     sizeof(buffer_larger));
 		/*
 		 * Provide a user_buffer with size smaller than the exact size to check if
 		 * the fields within the size range still gets updated.
 		 */
-		test_cmd_get_hw_info(self->device_id, &buffer_smaller, sizeof(buffer_smaller));
+		test_cmd_get_hw_info(self->device_id,
+				     IOMMU_HW_INFO_TYPE_DEFAULT,
+				     &buffer_smaller, sizeof(buffer_smaller));
 		test_cmd_get_hw_info_pasid(self->device_id, &max_pasid);
 		ASSERT_EQ(0, max_pasid);
 		if (variant->pasid_capable) {
@@ -786,9 +801,11 @@ TEST_F(iommufd_ioas, get_hw_info)
 		}
 	} else {
 		test_err_get_hw_info(ENOENT, self->device_id,
-				     &buffer_exact, sizeof(buffer_exact));
+				     IOMMU_HW_INFO_TYPE_DEFAULT, &buffer_exact,
+				     sizeof(buffer_exact));
 		test_err_get_hw_info(ENOENT, self->device_id,
-				     &buffer_larger, sizeof(buffer_larger));
+				     IOMMU_HW_INFO_TYPE_DEFAULT, &buffer_larger,
+				     sizeof(buffer_larger));
 	}
 }
 
@@ -2175,8 +2192,7 @@ TEST_F(iommufd_dirty_tracking, device_dirty_capability)
 
 	test_cmd_hwpt_alloc(self->idev_id, self->ioas_id, 0, &hwpt_id);
 	test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
-	test_cmd_get_hw_capabilities(self->idev_id, caps,
-				     IOMMU_HW_CAP_DIRTY_TRACKING);
+	test_cmd_get_hw_capabilities(self->idev_id, caps);
 	ASSERT_EQ(IOMMU_HW_CAP_DIRTY_TRACKING,
 		  caps & IOMMU_HW_CAP_DIRTY_TRACKING);
 
diff --git a/tools/testing/selftests/iommu/iommufd_fail_nth.c b/tools/testing/selftests/iommu/iommufd_fail_nth.c
index 41c685bbd252..651fc9f13c08 100644
--- a/tools/testing/selftests/iommu/iommufd_fail_nth.c
+++ b/tools/testing/selftests/iommu/iommufd_fail_nth.c
@@ -667,8 +667,8 @@ TEST_FAIL_NTH(basic_fail_nth, device)
 					&self->stdev_id, NULL, &idev_id))
 		return -1;
 
-	if (_test_cmd_get_hw_info(self->fd, idev_id, &info,
-				  sizeof(info), NULL, NULL))
+	if (_test_cmd_get_hw_info(self->fd, idev_id, IOMMU_HW_INFO_TYPE_DEFAULT,
+				  &info, sizeof(info), NULL, NULL))
 		return -1;
 
 	if (_test_cmd_hwpt_alloc(self->fd, idev_id, ioas_id, 0,
-- 
2.43.0


