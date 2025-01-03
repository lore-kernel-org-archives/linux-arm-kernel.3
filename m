Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF4EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owksryRUWHVUTKc9EwdqafuNcbtKA7Z/YWtyFiy6EL4=; b=dp/2CfqUaVOfBv6hxR+5YG0pC4
	L032NL3rLiLmNBdLhs8yfofosv/VJC/LFAhp58GlxGx4cTCvutGCRsQ2evjfs4/GJTecw5jaO9vmZ
	GpE1Cgj2MCUZTtOnB3lpgQmioRRBnj+II5g3lffpSTLLasNxdSse4A2Sj01cfBgm7/I8dT/hKpdsh
	iBq23Ojhdv89V8I0UfnuMhJFTknl1zmT6KQtluDWfbsK7LOjkV1+jWawBjaiLKkcZZ/1NO4fKDO7+
	6f66HyfsMILhUcDkiLn40PSK+e02jk874EAEE4n/Kpf4R8AebTp/xEebJ61KH9VYGZwCw1xx6w00D
	atdVXaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnkG-0000000Dspt-1dOE;
	Fri, 03 Jan 2025 19:54:08 +0000
Received: from mail-dm3nam02on20613.outbound.protection.outlook.com ([2a01:111:f403:2405::613] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnbE-0000000Dqa9-417J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 19:44:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXlG2YU4BBeEmSVJxRK/6h0QVC0Q+hO785WTI/zU5Pvf/WNzeKColp2Tu6P4yZvoNHGvgAclT8dfCwhtk6QUorbCtSNv17rLBmNm3ZYnJ7FeGVDDIJOmBRsBzyhjByrRYtC5Kj/Idbe1+YWvD+VYX+gtz2o6ULX7JewVCGyJjgSEI33zUt1AuqPo9bXIiP47vHZ/cJtLNI2kRAgj0i9uM/4kQzO/6ATMV5EEOpNkULdik9d+YYFoaGEGX/vEWwbkPjuMiJXqG7DcvW9uuyGjCXgamn2vqBPmpOHZBDblyU4xscqgjJWuHHTKHNA0gwk7jH29QYHBEcC+JNPv21XhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owksryRUWHVUTKc9EwdqafuNcbtKA7Z/YWtyFiy6EL4=;
 b=zGvquuxxoJjFesvvx2FqkJu5LyMK9SKhzhBT4RLl62GrrkZxfF4jwLg+XMzUp+b8COhjeyA2jAPd6/BMdiyzIIKCX5ZDdSq15YCr2FVIvdOcKpZZsmJLzLyxrRPKZmrw5T584jVk4AdYeX04PO69B5iWMusXgfSkrnGlZ+ILz63HK9dVsvN+uBLM8/Kwt5zkjAP+ZKCVY9Ik+AGAaai+Xnak+DkWN4O7CgQEUO8WHMNcjgpRefJ8oD+C+7Oe4BdqsLRT3/Vuon7yKsesl4kGrSoin7X6davPb2dtqQ1ZnhTqAiDr9ekLARHqOtCIGyk2UmPyCxjUMVselG8xET/9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owksryRUWHVUTKc9EwdqafuNcbtKA7Z/YWtyFiy6EL4=;
 b=t+XnqttYdALSWCrzHsjfBbDHbKOBhFpehZo5pCB7Icsj8S4NFOR6RlYV1A61SU0hKL2/ohj9vlfr0FscNgT59BDN9dqfboPot4IoK8lr+lCpI0qmTj4aW9a+1UY0hr/WJhjzXcuIDE0fed21Hw6vILqTd7yIcgwr/VQlE3hdEL3VesNMqJme581DJlVAHCpcbJU+W6i6T8+vfdf4kT277wF65gG972fxhXdVNT78v4jNX4pbsYTIXKz+1opp/M9lqpFlzmWOJ8p7/rtgjtCzfKr/IQty5KgNznyBuHNP4JQTC0KRVnxZGRgtxVzm3LYwzgSym1najD/Rge8cJwWqiw==
Received: from CH0P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::10)
 by DM4PR12MB6111.namprd12.prod.outlook.com (2603:10b6:8:ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Fri, 3 Jan
 2025 19:44:39 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::7e) by CH0P221CA0002.outlook.office365.com
 (2603:10b6:610:11c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.14 via Frontend Transport; Fri,
 3 Jan 2025 19:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 3 Jan 2025 19:44:38 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 3 Jan 2025
 11:44:27 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 3 Jan 2025
 11:44:27 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 3 Jan 2025 11:44:25 -0800
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
Subject: [PATCH v4 11/14] iommufd/selftest: Add IOMMU_VEVENTQ_ALLOC test coverage
Date: Fri, 3 Jan 2025 11:43:34 -0800
Message-ID: <4ce5fe8c59a40fff27b27d7e81fd5d80941f2909.1735933254.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735933254.git.nicolinc@nvidia.com>
References: <cover.1735933254.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DM4PR12MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b49972-e3f6-4ffd-42ae-08dd2c2f0f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BXEj2iDSGj4PyBzDAAsUoEOk7MzP8pSTDrMNyNm1PhY9dvIGqW8/kS3NDZ0F?=
 =?us-ascii?Q?+Ym2hJCZIqK+sdXa97sphZQhm7TCc3MDSv2LycBZ0PIyrFkPEtVpjnqmwlLE?=
 =?us-ascii?Q?JXpWooCJh1MQ3qLTUq/2Ohd08YmgUB/6KDggU8Vb/hdZreHYCD+RFSAGD8k8?=
 =?us-ascii?Q?NDljq56m+7Trxeo69D5Dd3WjZNPGfq/sAfsaxyNyqf18RV1f1GMu4O2m+5zk?=
 =?us-ascii?Q?qsTRjaIRmSRhmn64hf0OgeH4KclVVoZwhuQipgGlIn82t1PNUFnSARvORUcB?=
 =?us-ascii?Q?1cV5hpOeIs+2zLZD71/oHbMYdGbYE4JFY0LdcXGndCE1a4MDasGslEAf4R14?=
 =?us-ascii?Q?cDrnYajdhM4KcGzPPfTmNbj2ZCcYOnAtOlYbJv5WK6xa+LsIitvEeo/VrmHf?=
 =?us-ascii?Q?yX+Cy2t+w7/Xpm/I3GH2piF+IULdoHOdEXQZJFIthQ9N1nJuYg2MFyeFxLpm?=
 =?us-ascii?Q?iZJZZH3dvd3nUFC9C8vNU+CTxaEjvmrJf7eIrXcVVc+THSJFwe09F3aipZjT?=
 =?us-ascii?Q?qoEGuD9nclxRH2pbsfsN70kOloe17wt7Js6J9JplKa5/9CRnM/C4PCfwjH1z?=
 =?us-ascii?Q?jRoaBGxrPXkyHObGyDOQI7wSzf4y3R4eWAWUrYSywfKVsaOqTXIFCfBmY4On?=
 =?us-ascii?Q?MoHLjWFD7v+v6hC9U2TWTcWmO2SxGVrIojEXrEpmZfijL1oeDPIvdi/Oae+V?=
 =?us-ascii?Q?vBRzGRsbNkaLZba3Z6jKy/z1HWA9xSg90YSpS7IEsYuvPe3oxcBRlOaoJO50?=
 =?us-ascii?Q?+X30RZcuxtLVzTEJrklu9j22zh5rLHp/uudeZb+JmXuIIWEOYwcPt7fhNLML?=
 =?us-ascii?Q?bif2bwq9sWNSB5DxjXuIjKcXd6DOupqxA/cMZKw6z4xSHHjSnlktyto8piRw?=
 =?us-ascii?Q?1eiVDSYR3B+Q5HlRrxDMDNi9hPN0JftcvqfCRjoaXfFLOnVyZzEa7tg3RL/D?=
 =?us-ascii?Q?FDlR0/7HqbJYTt/Pc3QYhvz7bMIf9T4acRVSv7nHTP6iGz6GNXYgfHvDPboB?=
 =?us-ascii?Q?SpDfPhnNs52yaP6zfCcEMCEFcahTMEOLfCvvnXSx7JliHdvna7m2dHak4QaC?=
 =?us-ascii?Q?YrwZ7HNShVwwspZTklc+qw30i9RtQaqcWKFTwWgmXmXDKAvklsimXqxZH8mi?=
 =?us-ascii?Q?/erLEeYKC9W0KQXzZcZkWlqYQdmeEBJjK2VT4Xt8IAYFbedB4R4ElMzPL8om?=
 =?us-ascii?Q?gc0uyBVt+SQq6otB35GHDh8xpy+EAAd1o9GlLexDla987PbnGvxnaSfJsET6?=
 =?us-ascii?Q?7ao47/IGrbZ23hToDqD3irpJFIyRaGJEAjYSpp42Cf3swaccXFTmNpyiSibB?=
 =?us-ascii?Q?Yv7diIXXLnTj0nuzHVfztD5Rnp1VHKvIEEgwP9eCcVQF18Uw/V05Xiz/ywLL?=
 =?us-ascii?Q?WMRSYul9cjR5JxEJt4eU5LSu8Qe4j0qEG93z7eK5L9TlmvT+ZACGe2c1vNPl?=
 =?us-ascii?Q?UsssLoQwuOWGLmuoq7n/3LHhkRn99EjHOz2d5TClQXw7H30OH0BJJ6wue4bs?=
 =?us-ascii?Q?oPtvy9qvNDBN6Mg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 19:44:38.8360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b49972-e3f6-4ffd-42ae-08dd2c2f0f66
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_114448_993540_402DADE7 
X-CRM114-Status: GOOD (  14.48  )
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

Trigger a vEVENT by feeding an idev ID and validating the returned output
virt_id whether it equals to the value that was set to the vDEVICE.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 tools/testing/selftests/iommu/iommufd_utils.h | 65 +++++++++++++++++++
 tools/testing/selftests/iommu/iommufd.c       | 22 +++++++
 .../selftests/iommu/iommufd_fail_nth.c        |  7 ++
 3 files changed, 94 insertions(+)

diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
index d979f5b0efe8..15cf28b88332 100644
--- a/tools/testing/selftests/iommu/iommufd_utils.h
+++ b/tools/testing/selftests/iommu/iommufd_utils.h
@@ -9,6 +9,7 @@
 #include <sys/ioctl.h>
 #include <stdint.h>
 #include <assert.h>
+#include <poll.h>
 
 #include "../kselftest_harness.h"
 #include "../../../../drivers/iommu/iommufd/iommufd_test.h"
@@ -936,3 +937,67 @@ static int _test_cmd_vdevice_alloc(int fd, __u32 viommu_id, __u32 idev_id,
 	EXPECT_ERRNO(_errno,                                                 \
 		     _test_cmd_vdevice_alloc(self->fd, viommu_id, idev_id,   \
 					     virt_id, vdev_id))
+
+static int _test_cmd_veventq_alloc(int fd, __u32 viommu_id, __u32 type,
+				   __u32 *veventq_id, __u32 *veventq_fd)
+{
+	struct iommu_veventq_alloc cmd = {
+		.size = sizeof(cmd),
+		.type = type,
+		.viommu_id = viommu_id,
+	};
+	int ret;
+
+	ret = ioctl(fd, IOMMU_VEVENTQ_ALLOC, &cmd);
+	if (ret)
+		return ret;
+	if (veventq_id)
+		*veventq_id = cmd.out_veventq_id;
+	if (veventq_fd)
+		*veventq_fd = cmd.out_veventq_fd;
+	return 0;
+}
+
+#define test_cmd_veventq_alloc(viommu_id, type, veventq_id, veventq_fd) \
+	ASSERT_EQ(0, _test_cmd_veventq_alloc(self->fd, viommu_id, type, \
+					     veventq_id, veventq_fd))
+#define test_err_veventq_alloc(_errno, viommu_id, type, veventq_id,     \
+			       veventq_fd)                              \
+	EXPECT_ERRNO(_errno,                                            \
+		     _test_cmd_veventq_alloc(self->fd, viommu_id, type, \
+					     veventq_id, veventq_fd))
+
+static int _test_cmd_trigger_vevent(int fd, __u32 dev_id, __u32 event_fd,
+				    __u32 virt_id)
+{
+	struct iommu_test_cmd trigger_vevent_cmd = {
+		.size = sizeof(trigger_vevent_cmd),
+		.op = IOMMU_TEST_OP_TRIGGER_VEVENT,
+		.trigger_vevent = {
+			.dev_id = dev_id,
+		},
+	};
+	struct pollfd pollfd = { .fd = event_fd, .events = POLLIN };
+	struct iommu_viommu_event_selftest event;
+	ssize_t bytes;
+	int ret;
+
+	ret = ioctl(fd, _IOMMU_TEST_CMD(IOMMU_TEST_OP_TRIGGER_VEVENT),
+		    &trigger_vevent_cmd);
+	if (ret)
+		return ret;
+
+	ret = poll(&pollfd, 1, 1000);
+	if (ret < 0)
+		return ret;
+
+	bytes = read(event_fd, &event, sizeof(event));
+	if (bytes <= 0)
+		return -EIO;
+
+	return event.virt_id == virt_id ? 0 : -EINVAL;
+}
+
+#define test_cmd_trigger_vevent(dev_id, event_fd, virt_id)                \
+	ASSERT_EQ(0, _test_cmd_trigger_vevent(self->fd, dev_id, event_fd, \
+					      virt_id))
diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index 212e5d62e13d..c225f6e5108d 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -2774,15 +2774,37 @@ TEST_F(iommufd_viommu, vdevice_alloc)
 	uint32_t viommu_id = self->viommu_id;
 	uint32_t dev_id = self->device_id;
 	uint32_t vdev_id = 0;
+	uint32_t veventq_id;
+	uint32_t veventq_fd;
 
 	if (dev_id) {
+		/* Must allocate vdevice before attaching to a nested hwpt */
+		test_err_mock_domain_replace(ENOENT, self->stdev_id,
+					     self->nested_hwpt_id);
+
+		test_cmd_veventq_alloc(viommu_id, IOMMU_VEVENTQ_TYPE_SELFTEST,
+				       &veventq_id, &veventq_fd);
+		test_err_veventq_alloc(EEXIST, viommu_id,
+				       IOMMU_VEVENTQ_TYPE_SELFTEST, NULL, NULL);
 		/* Set vdev_id to 0x99, unset it, and set to 0x88 */
 		test_cmd_vdevice_alloc(viommu_id, dev_id, 0x99, &vdev_id);
+		test_cmd_mock_domain_replace(self->stdev_id,
+					     self->nested_hwpt_id);
+		test_cmd_trigger_vevent(dev_id, veventq_fd, 0x99);
 		test_err_vdevice_alloc(EEXIST, viommu_id, dev_id, 0x99,
 				       &vdev_id);
+		test_cmd_mock_domain_replace(self->stdev_id, self->ioas_id);
 		test_ioctl_destroy(vdev_id);
+
+		/* Try again with 0x88 */
 		test_cmd_vdevice_alloc(viommu_id, dev_id, 0x88, &vdev_id);
+		test_cmd_mock_domain_replace(self->stdev_id,
+					     self->nested_hwpt_id);
+		test_cmd_trigger_vevent(dev_id, veventq_fd, 0x88);
+		close(veventq_fd);
+		test_cmd_mock_domain_replace(self->stdev_id, self->ioas_id);
 		test_ioctl_destroy(vdev_id);
+		test_ioctl_destroy(veventq_id);
 	} else {
 		test_err_vdevice_alloc(ENOENT, viommu_id, dev_id, 0x99, NULL);
 	}
diff --git a/tools/testing/selftests/iommu/iommufd_fail_nth.c b/tools/testing/selftests/iommu/iommufd_fail_nth.c
index 64b1f8e1b0cf..99a7f7897bb2 100644
--- a/tools/testing/selftests/iommu/iommufd_fail_nth.c
+++ b/tools/testing/selftests/iommu/iommufd_fail_nth.c
@@ -620,6 +620,7 @@ TEST_FAIL_NTH(basic_fail_nth, device)
 	};
 	struct iommu_test_hw_info info;
 	uint32_t fault_id, fault_fd;
+	uint32_t veventq_id, veventq_fd;
 	uint32_t fault_hwpt_id;
 	uint32_t ioas_id;
 	uint32_t ioas_id2;
@@ -692,6 +693,12 @@ TEST_FAIL_NTH(basic_fail_nth, device)
 				 IOMMU_HWPT_DATA_SELFTEST, &data, sizeof(data)))
 		return -1;
 
+	if (_test_cmd_veventq_alloc(self->fd, viommu_id,
+				    IOMMU_VEVENTQ_TYPE_SELFTEST, &veventq_id,
+				    &veventq_fd))
+		return -1;
+	close(veventq_fd);
+
 	return 0;
 }
 
-- 
2.43.0


