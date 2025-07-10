Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E6DC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 06:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOW7WhxvGzxeS052guEjBECCH6jxjGiDpOWUhZ5qMqo=; b=P37/6ZWEfLEYT398I/t2hZmZhg
	qCiTzdTRTeKlyZuWPAoskrWLUnYRq7u2IWFB5GbynMUapW8Qxbx1QUKQZZQ+bJkY7TAnORGmTtldc
	rbw5zyiK/Di0hdb8Q3mjsCvzajJ9owZzQ9t7uwgrFvwFfD3nIrCfZl/0HQ/Tntf3G/t96m7yPVPUB
	wPE7Noi+92ZVYNmBr71T8tcDwjfwaRrScTOqze7oq/zplRc8+clncq83gAotY33sSKSsdH6niVlUQ
	ldm9TgGUvGtKlGI97gRJpTOZsKYAMyS9C6Z8LFXYn6MkHbvOoFlGRc7AUgWchRlp1RG7I7JRyBAv8
	QFIuxRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkhz-0000000Arbb-1N4t;
	Thu, 10 Jul 2025 06:24:39 +0000
Received: from mail-dm6nam10on20620.outbound.protection.outlook.com ([2a01:111:f403:2413::620] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkKS-0000000Alvi-0JAe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:00:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DS8VK2PnJbhjr9kOXOg+d5P9kSsYG3IQW5I0EgTViWFaPUnkvBty3ydibMizBLupR69Q14noX7Ls69+CG8ATZaN4M+t0X4BC9kZ6R5a7oUxcWE8mw9YQ/uBTbmxhvbF+Udk44GJyDjEF1So3dIHwAHbtMb+A3HgGaw3FK7gchqht0POlZckH7OTI6V1VEy86lYj6552IhhKsnjcW+UhgKyqdbVf5Wp1s8fV7yIOX7m0gkKKre+WcSyAkEjtC6Xm+iPhoofEgKyk58mY7jVY9pNCmMGZBQF/mztizJw4u6DWnMEBptGEiWijCJrDvod8I9dSo2zute+zYLCoLv8chSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOW7WhxvGzxeS052guEjBECCH6jxjGiDpOWUhZ5qMqo=;
 b=SGgvqbHw6F8GaMmHWaBT7H2SUDHXmsSCMcNnxl7iPW55NdkAlS/O9KJJ1CIvyAkOGdSDDYUxgPDugafm58EvT6lQLPtAQ5v5RyVb2LFeB2rY3uStERqxzefElZQCKhC+XDynE2dpsPjQeOLp4YmQCH92LO7OQO1xTb5J57UxG9C64DjcaGmwFyaylXkd1CsWNRPR/Cg8TeS8327K0KZw4srkvCuIJxzHGc927vbdwyueLsalTUhJ8YyACDoW6LxArFiMKZhPw4aKYP035OAp4Qzp1iA2OIzLAha9Ac+kP+Z3fVgaIikq5iolyt0EIr4r2iBvbMCw8+E68CvBZWGnwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOW7WhxvGzxeS052guEjBECCH6jxjGiDpOWUhZ5qMqo=;
 b=qcHuadVlI92NmpKEmP96J3atECIgA0RETCMi3yXfbEiICuH+eauJCR9rQBIqya55smsrxePxk91g7h1JPAEtsDkV+67hyB4d8z3StNm99Lctx+fjueHj62LixsTWj/in9hrxjFwbwVEwDk2bw7HEpZtVwBMYIMBvhuEtwp3kapYeqE/77EFtEvsaQa0KmErWIpsgCmIZ/iLdUj10MCUseHeT7v8l6d5hajXv51JJxSs00adowR74jG585jx2+y2sjyJ5Zh25jEdRucwoT6imC/K83qkT9s27r5GKKUq0Aoht5+qAbbZn18tozAHg9KEapRJLfGn3ga9iN2vX0qaBOQ==
Received: from CH0PR03CA0409.namprd03.prod.outlook.com (2603:10b6:610:11b::17)
 by SA3PR12MB7805.namprd12.prod.outlook.com (2603:10b6:806:319::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Thu, 10 Jul
 2025 06:00:14 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::e4) by CH0PR03CA0409.outlook.office365.com
 (2603:10b6:610:11b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 06:00:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:00:14 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 9 Jul 2025
 23:00:03 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 9 Jul
 2025 23:00:02 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 9 Jul 2025 23:00:01 -0700
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
Subject: [PATCH v9 09/29] iommufd/selftest: Add coverage for viommu data
Date: Wed, 9 Jul 2025 22:59:01 -0700
Message-ID: <8ceb64d30e9953f29270a7d341032ca439317271.1752126748.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752126748.git.nicolinc@nvidia.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|SA3PR12MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3e89d3-cda0-47e4-9c03-08ddbf7709e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cEtpw/owhGyofslZaEIXxtyjuolp2egFUmVX0craA0+jBgH+2WMCoJEPRQNP?=
 =?us-ascii?Q?vf5poxbCT3/WIM//47JpEMN89QIE25WSwSIhRNHnPAI3QcP25iLJBkV5e0rO?=
 =?us-ascii?Q?OVGxVSXdBRiTY074fzibhYF00zUxuIuhmIuGoLoxoOjxPwM35gkN4rwpUblx?=
 =?us-ascii?Q?6aTQ3jClZ9pqTVgMmXYSR9zThrQkwlf2yb/l+duBCqRnzPWLjaNPri7wqkfw?=
 =?us-ascii?Q?dxTxbzJ15PSBYfOviNxcalJATNWLAnNAeMfpqXRO2QNaCrEpqX9I0zUprERj?=
 =?us-ascii?Q?20+NoychBaa0iOPjqwwL7CBZaCAc5l+45N8KF31MWinanAj0CC634LmrcNse?=
 =?us-ascii?Q?LUprERd+y67EbtPicXjqyZTy4NsINAn18ApNGZ+ZFahqCosreeqnpYsfUpmY?=
 =?us-ascii?Q?DSt6KSha4r7Pw5geIoKNG4dZ9sw62pylWVhTjqjY5ztL/qpL5N/iFAzlxvyk?=
 =?us-ascii?Q?F+HCkXS1creq0SdSv2agPICqx2ONzAvGnoEoJgpb5MHtiQto4bUZZvS2djQK?=
 =?us-ascii?Q?BkHyMDj6mI1JQXO+UpP+45eZ2T9BM0zyBzAlOOWhRGJHtAnMigsf/R5pWn0a?=
 =?us-ascii?Q?bLR+PImnosnvMVSsvdN6/vqk4ww6FkrnhFCJ2zSPPgmYq0qGSbsUotKyZHrI?=
 =?us-ascii?Q?zoAYcy6wihfKoKXbggGqlGuMqcJT05dGYZW28QEQndC1p95sR2govn7H7fca?=
 =?us-ascii?Q?QcnIDYso/2RWRvyp0DNDgWwqQIMK7zKqSEwCjeILRugbI+4nOJT5GQnIZY5r?=
 =?us-ascii?Q?u1JdPptUya/8d36jQc2i0OpLpgIbt885YTduMPALM+v4TSGus9c3xz5vfpkt?=
 =?us-ascii?Q?xJC9iELaWjvxZu0Mvr4jTqQWF2pI5fIXtbL9yPvbZ7PsVwdTvKC9VZHN0AyT?=
 =?us-ascii?Q?safF3dv8E+miEHhvDxV7o0BESgJRUnQCrw3seAOwhq8UNLNcd4KAO4dsln49?=
 =?us-ascii?Q?r8cZ4R9vd2UdiyOYadEUPA8qT3yrF4xUAOhuwDP1E7kqmBC3+VOs4mZo4Ked?=
 =?us-ascii?Q?9tzKblad7qaQlcGm1yR/i+sT3RO/y3Fauis3wnG17klVW0Ab+eF9N0HlZ3eP?=
 =?us-ascii?Q?hCPw0HTHJL7cl2Z732o+kES8XO8rNByGl3nMUFpnhmQ12nwpImrbSVyF/BM4?=
 =?us-ascii?Q?k/PKTzF1WLxZ+1eT44s4rFayiNNET2RW6Rs64HomRW/SmqsWabl7V8CUibEP?=
 =?us-ascii?Q?+41PYhddoHoNqAGQ0T20vzhbnE0eJPUqfAeqQLowOyTQQ+y1NjVAwgaGaxvZ?=
 =?us-ascii?Q?sK9UwMDqdzG9048Q3c6xwwaNr8z/WQRESErsdX67nYBB0mcXgjlGDoV/M8Rb?=
 =?us-ascii?Q?OBUwilZ22QSUxAPEk5RwyZyWX8RLoo2rF5JcfFAmYehmSZlEI63LEcH5sLJ5?=
 =?us-ascii?Q?mFdlNAEaykDPi5IRMsgydZpMK0obw3N13doiSzTA+H6zGlYnlnq3ereoPZD+?=
 =?us-ascii?Q?Bl7gwtDh0ZxsxXNRQHcunV4cQUIuVzpYlPwt3CXXzc91Ilq5OC2vM2QhA0OV?=
 =?us-ascii?Q?5b5vUDr4JriWqwurUb6nSCF9WqBlZS/Uho1H?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:00:14.2810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3e89d3-cda0-47e4-9c03-08ddbf7709e1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_230020_120910_F7858DE8 
X-CRM114-Status: GOOD (  13.88  )
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

Extend the existing test_cmd/err_viommu_alloc helpers to accept optional
user data. And add a TEST_F for a loopback test.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 tools/testing/selftests/iommu/iommufd_utils.h | 21 ++++++++-----
 tools/testing/selftests/iommu/iommufd.c       | 31 ++++++++++++++-----
 .../selftests/iommu/iommufd_fail_nth.c        |  5 +--
 3 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
index 72f6636e5d90..a5d4cbd089ba 100644
--- a/tools/testing/selftests/iommu/iommufd_utils.h
+++ b/tools/testing/selftests/iommu/iommufd_utils.h
@@ -897,7 +897,8 @@ static int _test_cmd_trigger_iopf(int fd, __u32 device_id, __u32 pasid,
 					    pasid, fault_fd))
 
 static int _test_cmd_viommu_alloc(int fd, __u32 device_id, __u32 hwpt_id,
-				  __u32 type, __u32 flags, __u32 *viommu_id)
+				  __u32 flags, __u32 type, void *data,
+				  __u32 data_len, __u32 *viommu_id)
 {
 	struct iommu_viommu_alloc cmd = {
 		.size = sizeof(cmd),
@@ -905,6 +906,8 @@ static int _test_cmd_viommu_alloc(int fd, __u32 device_id, __u32 hwpt_id,
 		.type = type,
 		.dev_id = device_id,
 		.hwpt_id = hwpt_id,
+		.data_uptr = (uint64_t)data,
+		.data_len = data_len,
 	};
 	int ret;
 
@@ -916,13 +919,15 @@ static int _test_cmd_viommu_alloc(int fd, __u32 device_id, __u32 hwpt_id,
 	return 0;
 }
 
-#define test_cmd_viommu_alloc(device_id, hwpt_id, type, viommu_id)        \
-	ASSERT_EQ(0, _test_cmd_viommu_alloc(self->fd, device_id, hwpt_id, \
-					    type, 0, viommu_id))
-#define test_err_viommu_alloc(_errno, device_id, hwpt_id, type, viommu_id) \
-	EXPECT_ERRNO(_errno,                                               \
-		     _test_cmd_viommu_alloc(self->fd, device_id, hwpt_id,  \
-					    type, 0, viommu_id))
+#define test_cmd_viommu_alloc(device_id, hwpt_id, type, data, data_len,      \
+			      viommu_id)                                     \
+	ASSERT_EQ(0, _test_cmd_viommu_alloc(self->fd, device_id, hwpt_id, 0, \
+					    type, data, data_len, viommu_id))
+#define test_err_viommu_alloc(_errno, device_id, hwpt_id, type, data,        \
+			      data_len, viommu_id)                           \
+	EXPECT_ERRNO(_errno,                                                 \
+		     _test_cmd_viommu_alloc(self->fd, device_id, hwpt_id, 0, \
+					    type, data, data_len, viommu_id))
 
 static int _test_cmd_vdevice_alloc(int fd, __u32 viommu_id, __u32 idev_id,
 				   __u64 virt_id, __u32 *vdev_id)
diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index 1a8e85afe9aa..a9dfcce5e1b2 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -2688,7 +2688,7 @@ FIXTURE_SETUP(iommufd_viommu)
 
 		/* Allocate a vIOMMU taking refcount of the parent hwpt */
 		test_cmd_viommu_alloc(self->device_id, self->hwpt_id,
-				      IOMMU_VIOMMU_TYPE_SELFTEST,
+				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0,
 				      &self->viommu_id);
 
 		/* Allocate a regular nested hwpt */
@@ -2727,24 +2727,27 @@ TEST_F(iommufd_viommu, viommu_negative_tests)
 	if (self->device_id) {
 		/* Negative test -- invalid hwpt (hwpt_id=0) */
 		test_err_viommu_alloc(ENOENT, device_id, 0,
-				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL);
+				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0,
+				      NULL);
 
 		/* Negative test -- not a nesting parent hwpt */
 		test_cmd_hwpt_alloc(device_id, ioas_id, 0, &hwpt_id);
 		test_err_viommu_alloc(EINVAL, device_id, hwpt_id,
-				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL);
+				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0,
+				      NULL);
 		test_ioctl_destroy(hwpt_id);
 
 		/* Negative test -- unsupported viommu type */
 		test_err_viommu_alloc(EOPNOTSUPP, device_id, self->hwpt_id,
-				      0xdead, NULL);
+				      0xdead, NULL, 0, NULL);
 		EXPECT_ERRNO(EBUSY,
 			     _test_ioctl_destroy(self->fd, self->hwpt_id));
 		EXPECT_ERRNO(EBUSY,
 			     _test_ioctl_destroy(self->fd, self->viommu_id));
 	} else {
 		test_err_viommu_alloc(ENOENT, self->device_id, self->hwpt_id,
-				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL);
+				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0,
+				      NULL);
 	}
 }
 
@@ -2791,6 +2794,21 @@ TEST_F(iommufd_viommu, viommu_alloc_nested_iopf)
 	}
 }
 
+TEST_F(iommufd_viommu, viommu_alloc_with_data)
+{
+	struct iommu_viommu_selftest data = {
+		.in_data = 0xbeef,
+	};
+
+	if (!self->device_id)
+		SKIP(return, "Skipping test for variant no_viommu");
+
+	test_cmd_viommu_alloc(self->device_id, self->hwpt_id,
+			      IOMMU_VIOMMU_TYPE_SELFTEST, &data, sizeof(data),
+			      &self->viommu_id);
+	ASSERT_EQ(data.out_data, data.in_data);
+}
+
 TEST_F(iommufd_viommu, vdevice_alloc)
 {
 	uint32_t viommu_id = self->viommu_id;
@@ -3105,8 +3123,7 @@ TEST_F(iommufd_device_pasid, pasid_attach)
 
 	/* Allocate a regular nested hwpt based on viommu */
 	test_cmd_viommu_alloc(self->device_id, parent_hwpt_id,
-			      IOMMU_VIOMMU_TYPE_SELFTEST,
-			      &viommu_id);
+			      IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0, &viommu_id);
 	test_cmd_hwpt_alloc_nested(self->device_id, viommu_id,
 				   IOMMU_HWPT_ALLOC_PASID,
 				   &nested_hwpt_id[2],
diff --git a/tools/testing/selftests/iommu/iommufd_fail_nth.c b/tools/testing/selftests/iommu/iommufd_fail_nth.c
index e11ec4b121fc..f7ccf1822108 100644
--- a/tools/testing/selftests/iommu/iommufd_fail_nth.c
+++ b/tools/testing/selftests/iommu/iommufd_fail_nth.c
@@ -688,8 +688,9 @@ TEST_FAIL_NTH(basic_fail_nth, device)
 				 IOMMU_HWPT_DATA_NONE, 0, 0))
 		return -1;
 
-	if (_test_cmd_viommu_alloc(self->fd, idev_id, hwpt_id,
-				   IOMMU_VIOMMU_TYPE_SELFTEST, 0, &viommu_id))
+	if (_test_cmd_viommu_alloc(self->fd, idev_id, hwpt_id, 0,
+				   IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0,
+				   &viommu_id))
 		return -1;
 
 	if (_test_cmd_vdevice_alloc(self->fd, viommu_id, idev_id, 0, &vdev_id))
-- 
2.43.0


