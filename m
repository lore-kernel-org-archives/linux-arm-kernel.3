Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4C4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 03:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CT6ww6KWIByryhwz9GHkk1sJlapaxo4wfAKXpzGIAVk=; b=2Y6KhWq8Js+JCE2BUAbwN4Oc6V
	9DiJeXsy9+mEA+bsi5hjpVh3v48aAjKZg3/3kNWh25d+2MsjQI6P9vpLV8yrR0sg2nvJ7GDn4HW/K
	qjakArz2etEKwqExaI2u2jABXFm1UWbWYTCSDMxS+Y/lYbHfQc+0j0yPSdRkxc9lzQHGaGDfJtOoT
	rqFnf05uDXtVt/OJ2s/Mf6W5k9ulTQVRRv3kyt7cQuvzbpaQTOcZ95etsIr6Q0t7QGBmftQxZSexY
	KvX7sgTee9k4cEfCRHjxKHdyfbolGLbKUZGYbQXaBkNfZMtm/S/7+6s8I0PsEV9up8d0Y100hYfnI
	+RenbphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEQu-00000002MyA-2ro7;
	Fri, 09 May 2025 03:29:56 +0000
Received: from mail-sn1nam02on2061b.outbound.protection.outlook.com ([2a01:111:f403:2406::61b] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDE1Z-00000002IkP-13Bs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 03:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCA9J5f8n1An/4/5Q3iH5bgY8I5dbMf8+6aEC8UZiopr11hojWO5wKiGzRVabsflzV2FYZtiz8X69BjSNFzXfKFkmtyp9vcnBtWkxKgMmge12JQeW9YvQylv88kw9bBss2x2Ff2PQqVbRYOmiPLfgHM/FaykYuflSZdW+BXTMsPrkXE2Z6TV13BQb/ZAJCt2CDIeR/q4LHpUOqSfw551KdqE5jN67ELnbhkrpJDHP8aNj5WZ4IbHhoT32W74B27a60GG3djmh01X47O8uqLLz1CZJZcoMuEa0cNJkwrRNuROobxbDc2QpGjSHkqBVh/h4HXd47X1FuQxNegKdU0WGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CT6ww6KWIByryhwz9GHkk1sJlapaxo4wfAKXpzGIAVk=;
 b=JP9kU3MjuyduySFnRdQ/z5mQfEiXCxYV/5r6j3KeW1vhC/fhH7sgcRh3lPiPBsirb9pr8tHTESEiJIUL/lkcCTdV5Qhd2qTGpSv6CZxiOuWZQmKPJFn699i1qjwLsu58WBBEfjYjzPnnV8+oZs5APxCWJPMt23mbRSTACztJP8yy40EUSIzVnAVmVGzYu1K05/BSY25KBGWyPvDcJD8+bbPwK5cG9bhIiFHb8kDW+kNXGRr3TmPOQLOCmMZTKx9r+4FKAXN+4NzLexNHIpJl7ukWNDkpETpxAjNd9Mz9gMdkTFhjl/nSIRNhFDYE61WURieCONN6tVrv4VZS0bnoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CT6ww6KWIByryhwz9GHkk1sJlapaxo4wfAKXpzGIAVk=;
 b=op1+KiBoIc0YIRkte4m6GZMZqxyxty1iBe+66Db8Uy6u0XamfvHJRmIt0n/rvEBOsdjQvzV0weAivR8iUwVT5lNo9R0xaAhdn+/TITqeQ6L/ts2WEltw5xs3wL0Dty15lwE7RL8DsYdlFeRlOUfJJ/vsz3sozB92Q+I21Y/j5Uknwef5ldjX2377sIu/cE3Tcp2iHiSTi73bW8EKrRvY8gcNjpxAavuss3KkSkRZqsDlq/ZISQtSdXMlcaEM0VxsbTWciXKfxBAXl77vPvdFDSd1Lg4T0d9JNpzLl4wv55CXnxnslNfjnbcM9RHHLYkXEHcGW3FEBXpVWkOo90HLKw==
Received: from PH7PR02CA0022.namprd02.prod.outlook.com (2603:10b6:510:33d::20)
 by SN7PR12MB6741.namprd12.prod.outlook.com (2603:10b6:806:26f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.38; Fri, 9 May
 2025 03:03:36 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::df) by PH7PR02CA0022.outlook.office365.com
 (2603:10b6:510:33d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Fri,
 9 May 2025 03:03:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 03:03:36 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 8 May 2025
 20:03:28 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 20:03:28 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 8 May 2025 20:03:26 -0700
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
Subject: [PATCH v4 13/23] iommufd/selftest: Add coverage for IOMMUFD_CMD_HW_QUEUE_ALLOC
Date: Thu, 8 May 2025 20:02:34 -0700
Message-ID: <639bbb47885e0fcca30f85e40f702dc18ea71d7b.1746757630.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746757630.git.nicolinc@nvidia.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|SN7PR12MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: f34b4692-91d1-46b2-a9af-08dd8ea6175a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V0j0HGKr2r98FEIBG1cE2863WUi8LS63KSuWhU1cSQgfWGeEH764c3kMseZ8?=
 =?us-ascii?Q?r7j7zXSijFYKkipGxh+BBQqxY+EidWGuxsf/j/vjdmKyLg2ELwNj091nGt0M?=
 =?us-ascii?Q?u7ebQDSneIMzDoFzxeIMLtJRuF/IsYRIgu9Xm10gAovxmbuSxWHmMrbd8x5o?=
 =?us-ascii?Q?16J4Xwp1wkV37YtSBnLhFrDfMz7pKfMCJJPGqnjps2mFbceNUKmSet2HlMSM?=
 =?us-ascii?Q?AZJPn7GssvhQjGntZO2Z15fxcF7N95jZbeiQNH47SUWDWI4U0lZZg2ke0/gk?=
 =?us-ascii?Q?E3+GEPwtGF5lvDbNEqxrUVh9nYY++pyFdXfB1wqqwy4mhosB0KKPogwyCxI7?=
 =?us-ascii?Q?M/HRBBKq5P1uihRNB/vhoI09FVlppBEWxuWyzaMkKUv4yJUZT9FbItx/RAVm?=
 =?us-ascii?Q?bj1NWAvdCFU/2JmQGXTFQTaFgJqjUwsEazZVs4JDL+UC3mwjIZ7R5Zihck3V?=
 =?us-ascii?Q?uarVHIhWa6aSHOMZ8tHmfGi3NMYDATyp/zar+uRu4D397jgs9+WTbUX0BYwO?=
 =?us-ascii?Q?29f7d8Xj5SOz5Ii/PhRfhuuP/gx/qpypqoYytKNLUoQPZ3CWSK7P3DFZwvFh?=
 =?us-ascii?Q?MnWmqUxclDtadpTHsoFXfveWUMg6dnDdlFDmePy1oyUeO/HzF5Raqj2oimA3?=
 =?us-ascii?Q?vuLliVYhj4mtgE3V/SVv3hBre6AWbYsoFjgLXVXhbxIjSOIc4W7q6QdhwTVt?=
 =?us-ascii?Q?8VBLNYz6zLXpk0Pi4PYTJuRfwhOQkovS/VRxkOKTeq7JCDzSbRUmh/pGDFoI?=
 =?us-ascii?Q?rT7X5xvb+5FI1TMjuCFCKgT4CNq36FXjAQfBJmiO9WNdaJHTerupwVjXIy9Q?=
 =?us-ascii?Q?Q+V90k+jX6/Avf7M1fUaw789PFIc/u7Fgu7MnBRLFY9AFEBM7rL4HVqxgc5e?=
 =?us-ascii?Q?31tG4Mln4TO4UYF/5jtA4calcTdLfAT2P4zLQC7ExJwiDD+HvhPU34Vrcxxj?=
 =?us-ascii?Q?OOX/DrxY5/IF8Fe/HaOa5YEdCFZekswAVMBaPu2dvj8jUwiUBNvk1kL+kIAv?=
 =?us-ascii?Q?yU7+J7OIGAwFc8/f/mUvd2jvl0tyhxwurw+nHUfQu34qCgun3238LaIVueeJ?=
 =?us-ascii?Q?EtRNOPrJUwqTLi3fqCMJpY3p0w0AzfKyycg/JfUvTl/kim5BtxTuUUiUeHDk?=
 =?us-ascii?Q?qOBMVW0YfTY7AVK7TJfjxOV+l1PiUKtEuEtSd+wMSr20OZXrD7B44X0Z35ku?=
 =?us-ascii?Q?lEgSfJaGnkx9ZgNbuhK+BLKYY3jpivAyV7lsAERC+uBDBavzxPW1OYE7SEF6?=
 =?us-ascii?Q?yTxg7oayZjnbFbpjoz+tHsCFFliKx04HcpnrXwDfLM7GhoggK9BAW8RjtZDj?=
 =?us-ascii?Q?jumEVlRzfHOPhPm/XMr0DCxLBSJeRRKtfzd4BXmOqfn5nNWY72ElmLWTLwc4?=
 =?us-ascii?Q?6RW67s+AnAUAr7yY+F6N0SxmVc990nBURaKrkDVfi7SAcroBOzfq+i1YbOIK?=
 =?us-ascii?Q?JE88wxcV/rGxw7pnYNIqnbUpVPx9Ad+hFKy6ntDhi8DwxT4ycAWYMj+hjGwp?=
 =?us-ascii?Q?P56WHHKEUoPQVIoHf42gXWLpZm3MhdRS8N4r?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 03:03:36.2844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f34b4692-91d1-46b2-a9af-08dd8ea6175a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_200345_345930_2A3B3561 
X-CRM114-Status: GOOD (  17.84  )
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

Some simple tests for IOMMUFD_CMD_HW_QUEUE_ALLOC infrastructure covering
the new iommufd_hw_queue_depend/undepend() helpers.

Since the iommufd_hw_queue_alloc_ioctl() will call iommu_iova_to_phys(),
for input address validation. It might intentionally pass in a bad input
for a negative test. So drop the WARN_ON() in mock_domain_iova_to_phys().

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_test.h          |  3 +
 tools/testing/selftests/iommu/iommufd_utils.h | 31 ++++++++
 drivers/iommu/iommufd/selftest.c              | 73 ++++++++++++++++++-
 tools/testing/selftests/iommu/iommufd.c       | 60 +++++++++++++++
 .../selftests/iommu/iommufd_fail_nth.c        |  6 ++
 5 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
index fbf9ecb35a13..51cd744a354f 100644
--- a/drivers/iommu/iommufd/iommufd_test.h
+++ b/drivers/iommu/iommufd/iommufd_test.h
@@ -265,4 +265,7 @@ struct iommu_viommu_event_selftest {
 	__u32 virt_id;
 };
 
+#define IOMMU_HW_QUEUE_TYPE_SELFTEST 0xdeadbeef
+#define IOMMU_TEST_HW_QUEUE_MAX 2
+
 #endif
diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
index a5d4cbd089ba..463116fcfa9c 100644
--- a/tools/testing/selftests/iommu/iommufd_utils.h
+++ b/tools/testing/selftests/iommu/iommufd_utils.h
@@ -956,6 +956,37 @@ static int _test_cmd_vdevice_alloc(int fd, __u32 viommu_id, __u32 idev_id,
 		     _test_cmd_vdevice_alloc(self->fd, viommu_id, idev_id,   \
 					     virt_id, vdev_id))
 
+static int _test_cmd_hw_queue_alloc(int fd, __u32 viommu_id, __u32 type,
+				    __u32 idx, __u64 base_addr, __u64 length,
+				    __u32 *hw_queue_id)
+{
+	struct iommu_hw_queue_alloc cmd = {
+		.size = sizeof(cmd),
+		.viommu_id = viommu_id,
+		.type = type,
+		.index = idx,
+		.base_addr = base_addr,
+		.length = length,
+	};
+	int ret;
+
+	ret = ioctl(fd, IOMMU_HW_QUEUE_ALLOC, &cmd);
+	if (ret)
+		return ret;
+	if (hw_queue_id)
+		*hw_queue_id = cmd.out_hw_queue_id;
+	return 0;
+}
+
+#define test_cmd_hw_queue_alloc(viommu_id, type, idx, base_addr, len, out_qid) \
+	ASSERT_EQ(0, _test_cmd_hw_queue_alloc(self->fd, viommu_id, type, idx,  \
+					      base_addr, len, out_qid))
+#define test_err_hw_queue_alloc(_errno, viommu_id, type, idx, base_addr, len, \
+				out_qid)                                      \
+	EXPECT_ERRNO(_errno,                                                  \
+		     _test_cmd_hw_queue_alloc(self->fd, viommu_id, type, idx, \
+					      base_addr, len, out_qid))
+
 static int _test_cmd_veventq_alloc(int fd, __u32 viommu_id, __u32 type,
 				   __u32 *veventq_id, __u32 *veventq_fd)
 {
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 033345f81df9..692c29ccdc46 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -148,6 +148,7 @@ to_mock_nested(struct iommu_domain *domain)
 struct mock_viommu {
 	struct iommufd_viommu core;
 	struct mock_iommu_domain *s2_parent;
+	struct mock_hw_queue *hw_queue[IOMMU_TEST_HW_QUEUE_MAX];
 };
 
 static inline struct mock_viommu *to_mock_viommu(struct iommufd_viommu *viommu)
@@ -155,6 +156,19 @@ static inline struct mock_viommu *to_mock_viommu(struct iommufd_viommu *viommu)
 	return container_of(viommu, struct mock_viommu, core);
 }
 
+struct mock_hw_queue {
+	struct iommufd_hw_queue core;
+	struct mock_viommu *mock_viommu;
+	struct mock_hw_queue *prev;
+	u16 index;
+};
+
+static inline struct mock_hw_queue *
+to_mock_hw_queue(struct iommufd_hw_queue *hw_queue)
+{
+	return container_of(hw_queue, struct mock_hw_queue, core);
+}
+
 enum selftest_obj_type {
 	TYPE_IDEV,
 };
@@ -570,7 +584,8 @@ static phys_addr_t mock_domain_iova_to_phys(struct iommu_domain *domain,
 
 	WARN_ON(iova % MOCK_IO_PAGE_SIZE);
 	ent = xa_load(&mock->pfns, iova / MOCK_IO_PAGE_SIZE);
-	WARN_ON(!ent);
+	if (!ent)
+		return 0;
 	return (xa_to_value(ent) & MOCK_PFN_MASK) * MOCK_IO_PAGE_SIZE;
 }
 
@@ -727,10 +742,66 @@ static int mock_viommu_cache_invalidate(struct iommufd_viommu *viommu,
 	return rc;
 }
 
+/* Test iommufd_hw_queue_depend/undepend() */
+static struct iommufd_hw_queue *
+mock_hw_queue_alloc(struct iommufd_viommu *viommu, unsigned int type, u32 index,
+		    u64 base_addr, size_t length)
+{
+	struct mock_viommu *mock_viommu = to_mock_viommu(viommu);
+	struct mock_hw_queue *mock_hw_queue, *prev = NULL;
+	int rc;
+
+	if (type != IOMMU_HW_QUEUE_TYPE_SELFTEST)
+		return ERR_PTR(-EOPNOTSUPP);
+	if (index >= IOMMU_TEST_HW_QUEUE_MAX)
+		return ERR_PTR(-EINVAL);
+	if (mock_viommu->hw_queue[index])
+		return ERR_PTR(-EEXIST);
+	if (index) {
+		prev = mock_viommu->hw_queue[index - 1];
+		if (!prev)
+			return ERR_PTR(-EIO);
+	}
+
+	mock_hw_queue =
+		iommufd_hw_queue_alloc(viommu, struct mock_hw_queue, core);
+	if (IS_ERR(mock_hw_queue))
+		return ERR_CAST(mock_hw_queue);
+
+	if (prev) {
+		rc = iommufd_hw_queue_depend(mock_hw_queue, prev, core);
+		if (rc)
+			goto free_hw_queue;
+	}
+	mock_hw_queue->prev = prev;
+	mock_hw_queue->mock_viommu = mock_viommu;
+	mock_viommu->hw_queue[index] = mock_hw_queue;
+
+	return &mock_hw_queue->core;
+free_hw_queue:
+	iommufd_struct_destroy(mock_hw_queue, core);
+	return ERR_PTR(rc);
+}
+
+static void mock_hw_queue_destroy(struct iommufd_hw_queue *hw_queue)
+{
+	struct mock_hw_queue *mock_hw_queue = to_mock_hw_queue(hw_queue);
+	struct mock_viommu *mock_viommu = mock_hw_queue->mock_viommu;
+
+	mock_viommu->hw_queue[mock_hw_queue->index] = NULL;
+	if (mock_hw_queue->prev)
+		iommufd_hw_queue_undepend(mock_hw_queue, mock_hw_queue->prev,
+					  core);
+
+	/* iommufd core frees mock_hw_queue and hw_queue */
+}
+
 static struct iommufd_viommu_ops mock_viommu_ops = {
 	.destroy = mock_viommu_destroy,
 	.alloc_domain_nested = mock_viommu_alloc_domain_nested,
 	.cache_invalidate = mock_viommu_cache_invalidate,
+	.hw_queue_alloc = mock_hw_queue_alloc,
+	.hw_queue_destroy = mock_hw_queue_destroy,
 };
 
 static struct iommufd_viommu *
diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index 666a91d53195..bfdb3a3f1d23 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -3031,6 +3031,66 @@ TEST_F(iommufd_viommu, vdevice_cache)
 	}
 }
 
+TEST_F(iommufd_viommu, hw_queue)
+{
+	uint32_t viommu_id = self->viommu_id;
+	__u64 iova = MOCK_APERTURE_START;
+	uint32_t hw_queue_id[2];
+
+	if (viommu_id) {
+		/* Fail IOMMU_HW_QUEUE_TYPE_DEFAULT */
+		test_err_hw_queue_alloc(EOPNOTSUPP, viommu_id,
+					IOMMU_HW_QUEUE_TYPE_DEFAULT, 0, iova,
+					PAGE_SIZE, &hw_queue_id[0]);
+		/* Fail queue addr and length */
+		test_err_hw_queue_alloc(EINVAL, viommu_id,
+					IOMMU_HW_QUEUE_TYPE_SELFTEST, 0, 0,
+					PAGE_SIZE, &hw_queue_id[0]);
+		test_err_hw_queue_alloc(EINVAL, viommu_id,
+					IOMMU_HW_QUEUE_TYPE_SELFTEST, 0, iova,
+					0, &hw_queue_id[0]);
+		test_err_hw_queue_alloc(EOVERFLOW, viommu_id,
+					IOMMU_HW_QUEUE_TYPE_SELFTEST, 0,
+					~(uint64_t)0, PAGE_SIZE,
+					&hw_queue_id[0]);
+		/* Fail missing iova */
+		test_err_hw_queue_alloc(ENXIO, viommu_id,
+					IOMMU_HW_QUEUE_TYPE_SELFTEST, 0, iova,
+					PAGE_SIZE, &hw_queue_id[0]);
+
+		/* Map iova */
+		test_ioctl_ioas_map(buffer, PAGE_SIZE, &iova);
+
+		/* Fail index=1 and =MAX; must start from index=0 */
+		test_err_hw_queue_alloc(EIO, viommu_id,
+					IOMMU_HW_QUEUE_TYPE_SELFTEST, 1, iova,
+					PAGE_SIZE, &hw_queue_id[0]);
+		test_err_hw_queue_alloc(EINVAL, viommu_id,
+					IOMMU_HW_QUEUE_TYPE_SELFTEST,
+					IOMMU_TEST_HW_QUEUE_MAX, iova,
+					PAGE_SIZE, &hw_queue_id[0]);
+
+		/* Allocate index=0 */
+		test_cmd_hw_queue_alloc(viommu_id, IOMMU_HW_QUEUE_TYPE_SELFTEST,
+					0, iova, PAGE_SIZE, &hw_queue_id[0]);
+		/* Fail duplicate */
+		test_err_hw_queue_alloc(EEXIST, viommu_id,
+					IOMMU_HW_QUEUE_TYPE_SELFTEST, 0, iova,
+					PAGE_SIZE, &hw_queue_id[0]);
+
+		/* Allocate index=1 */
+		test_cmd_hw_queue_alloc(viommu_id, IOMMU_HW_QUEUE_TYPE_SELFTEST,
+					1, iova, PAGE_SIZE, &hw_queue_id[1]);
+		/* Fail to destroy, due to dependency */
+		EXPECT_ERRNO(EBUSY,
+			     _test_ioctl_destroy(self->fd, hw_queue_id[0]));
+
+		/* Destroy in descending order */
+		test_ioctl_destroy(hw_queue_id[1]);
+		test_ioctl_destroy(hw_queue_id[0]);
+	}
+}
+
 FIXTURE(iommufd_device_pasid)
 {
 	int fd;
diff --git a/tools/testing/selftests/iommu/iommufd_fail_nth.c b/tools/testing/selftests/iommu/iommufd_fail_nth.c
index f7ccf1822108..41c685bbd252 100644
--- a/tools/testing/selftests/iommu/iommufd_fail_nth.c
+++ b/tools/testing/selftests/iommu/iommufd_fail_nth.c
@@ -634,6 +634,7 @@ TEST_FAIL_NTH(basic_fail_nth, device)
 	uint32_t idev_id;
 	uint32_t hwpt_id;
 	uint32_t viommu_id;
+	uint32_t hw_queue_id;
 	uint32_t vdev_id;
 	__u64 iova;
 
@@ -696,6 +697,11 @@ TEST_FAIL_NTH(basic_fail_nth, device)
 	if (_test_cmd_vdevice_alloc(self->fd, viommu_id, idev_id, 0, &vdev_id))
 		return -1;
 
+	if (_test_cmd_hw_queue_alloc(self->fd, viommu_id,
+				     IOMMU_HW_QUEUE_TYPE_SELFTEST, 0, iova,
+				     PAGE_SIZE, &hw_queue_id))
+		return -1;
+
 	if (_test_ioctl_fault_alloc(self->fd, &fault_id, &fault_fd))
 		return -1;
 	close(fault_fd);
-- 
2.43.0


