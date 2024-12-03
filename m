Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10F4E74AFF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 22:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L5s817ygXNnbwAhZ21VhywgGFS+QyK0/04NNx5QGO1E=; b=k/Zuc4ComyBY5oiOYbXEKM+v9l
	MoiFPCgoNq7CXpX5v4re90euSbFoPLRiv8chXvI2xPt8s49XR6UgMerdXwGdRt/pHVY738olT4MpT
	JNsPhHbmRmrDQjFFhLjuLmQYjL6cO6hQhnrQZnebbQkz35pw1vfmS5xV3zu8bWBGpoTV3rekOypYW
	3013KFSsp6O2A2T9X5F3hOocwrGiAccEccNmoePgouiCMhqct3KXxZwjEGLb52FGz0iSlqbND5MJm
	xPysrxWp/1PinnQPBJGSaK4NJ5aCOhKnt9m4Xc/FStOJ5hsaPeLLnqelcFB+4TdHzGsW418yEth+z
	HFPzgD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbAn-0000000Aswj-42N7;
	Tue, 03 Dec 2024 22:15:13 +0000
Received: from mail-mw2nam10on20624.outbound.protection.outlook.com ([2a01:111:f403:2412::624] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIb6n-0000000ArpN-3YA3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 22:11:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LR/TExuJE5v3CK6XlUTEK7I5NzorP+xaxCab0yFjZF7CJ/kdvgh20zmbxTi29mBVNRivFiGZZpCOP+ZzZVYemyXIYieZDRXW34tdZCsc0S/ZAaD/TyZKliqvWY+D0x48n7cF1U4nXx3H2vsNhrAZKrV4w4pRn0YQiqVvLhOVfphUcwhyADMAunuCqSTi6kC/f9BWy+aUEChWtldgl27WkvDjNqC30tON+5DPM3ezrVJNuboiyms1Ku9mNO7GexavnnJ5lR8KJN+JFk9H+JTlHxLLpGUHE19cfbXHOct/Ud/m0gA0nBY+uBEjW+c53nrbF812zb0n6EKP9Qaf9k3p5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5s817ygXNnbwAhZ21VhywgGFS+QyK0/04NNx5QGO1E=;
 b=YbO8cF1168vkmsqp24UPRvSEYjp+KkLo/Ng2VANva/JtYKFVRd66vZa3SZiEg87OQtyE6c5YSz0tUbRiTlKW5qX4DiQadb66W5ENMfn0USG6LWUYYwg1Mowtqlk0ddrQMPmP3nWmV99cFFI377SZRPGwroot7fuhSK62P4WT+10dEIr66w8YGsLniC/cfvVBazrXfMfDwrKWSuYwCA0uEFcisN4pBQmJdeyKMpTaebuvqOXvnr6NZnHu5QPqrZpHwcVhQtNucJ2F81l4IeFvj2jx37RQEzC3OYgE75f0K63+lqYcGd9+k5P7TIeLMeoR6zCAcJ7qFQZqAXnw4W5Yng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5s817ygXNnbwAhZ21VhywgGFS+QyK0/04NNx5QGO1E=;
 b=LYDJ9ju9kNsZ1vkNsved8/JFd8MEiVoBxoroVVoEmVzdeIETS4J/Jrm6w0xnqhQA3y+GPU4F03tBW2AIKQmX9UN6o5ANWL1v3Xg8sHqJWLDxuYkybWLfvo9V4AF1sTlWj9+0vAxRdPkEt3zW4yzu1bKywdE/SU1pRKUd0B01L3rFuCmDu5UyBFms6WSUhZqp3yNTljyTUe0oYEGzYrgfs2Jcu+XyFLyHh8BgoarzLdKfhY8CSyJTHWnEPzqYlzEhqZcwYcyJDZ9SVtzCfSk7EpVlMseHm74n93OiYBO1j0xWzpjIz1x/ZMIhZ7LOmfFXwj3pEzfHsHGBfot2jflKig==
Received: from BYAPR21CA0011.namprd21.prod.outlook.com (2603:10b6:a03:114::21)
 by BL3PR12MB6595.namprd12.prod.outlook.com (2603:10b6:208:38e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 22:10:54 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::9) by BYAPR21CA0011.outlook.office365.com
 (2603:10b6:a03:114::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.8 via Frontend Transport; Tue, 3
 Dec 2024 22:10:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 22:10:53 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 3 Dec 2024
 14:10:33 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 3 Dec 2024 14:10:33 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 3 Dec 2024 14:10:32 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <will@kernel.org>
CC: <corbet@lwn.net>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>
Subject: [PATCH v2 00/13] iommufd: Add vIOMMU infrastructure (Part-3: vIRQ)
Date: Tue, 3 Dec 2024 14:10:05 -0800
Message-ID: <cover.1733263737.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|BL3PR12MB6595:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c877ec4-ea33-4719-90a3-08dd13e75acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GU95BR6C5qje3ws4cChm7yLqCe9Q9Q5DzJiZi2pU81ssFcPlwNNd78/SqFtH?=
 =?us-ascii?Q?SY260mYDXv0OBR54UcJ6bgRSYMkbO2+84PRTtXDe4G2azwDprYfrcp5+U5Ku?=
 =?us-ascii?Q?8mLDo/DXJw+86Jmb/qv9F6QQT46dicq7xxiES+RYLsyCCLbKFHJyVgip2Ilo?=
 =?us-ascii?Q?+ObMopGsP2zmvOHxbBApSRlF/JArD3BP6v4MQiX96XGziJvJTAuth8Wd2QZ7?=
 =?us-ascii?Q?p32hCDyx6snG0DGn19seq1hyRmKOUd6rX8WXj56YMtBvOzlO5bUuRY1jJc/d?=
 =?us-ascii?Q?vapnmhQy4ldtS7uy4y7IwQTnU5yRI5z9/jVeto5cXmhR36lozlvXf7g5wDzJ?=
 =?us-ascii?Q?dHv7vIocfRpfTbgHwMzZNbCK73y7U4zk3xr0btVEYqF7oe4xsa2FVZFz5DT3?=
 =?us-ascii?Q?kZJGXR4MJxhUjxa5xT37nL9Cw0KSgs4v3cWivVC1W8ftx2tQJknFW6gggCau?=
 =?us-ascii?Q?ieWzFSXzqjc7BpXiC2rRaFnS1Kt6W1xIsEpZgir6I+7J0XRs9pwnIW/1jLA3?=
 =?us-ascii?Q?B3PSR2CvhNxhmIVIyBp7qo3lD6xZ7CQ4kJo3qYZD9jiV0diD5WvlvUMg6O2p?=
 =?us-ascii?Q?9yqPNUuWcYrn6DVRYBfJLl+df50L8rgBnYhc1AM10H2A2CKV9iEb0VyuNr3Q?=
 =?us-ascii?Q?w80J0QeQj+Kk6jQL4t73trLXKOK8/hYCHdK6IOZDpa1q8t1lO8ODhIP3QnPb?=
 =?us-ascii?Q?RhwwtM1vyM3jWPIGCV1nUq83psqL3lOBEzSsmaGipFWQbzN3EQiOMkW+RHEk?=
 =?us-ascii?Q?VrxoFMDEnoqChRjvHOyB/57V94yiBrI2ls85HAvilp52iCCXtmEb1l+yIeMX?=
 =?us-ascii?Q?nTu9nlsDX+gANCKYFUDFR9yzra7pz+Rzib5uZhEv/1+BBh3oUVTbubF5ZNE8?=
 =?us-ascii?Q?PL2++6zBG57/AwYdh7rs/dlFf6iY/4DUQZv/auf5dEle2DY3GaihQz5Rj7wF?=
 =?us-ascii?Q?eozsMmkAntXyTwZuIn4JvRjq2ho+/RR4c8I6uQAwq9cxBT6SGilBrIXWToNn?=
 =?us-ascii?Q?UvM492mOVbWBG4rjEqZPgIxZbvOBkaQfTk7VjQ7BJoAOi50C8qoBe+IgB4Pp?=
 =?us-ascii?Q?/4uSuQXpxBTLunm0YIjxniwwTCdREaG6TrLOQfALAhY5I38r9d2OPr9WtQTe?=
 =?us-ascii?Q?aKZRo322aCG9KDXHJwD3O3YOkUY6JHAD/5MY3uW/DTzAbfIY629JYh90Vhy5?=
 =?us-ascii?Q?fRvPqXu8DSJrW9xd/fH/DLjcTGToGyzOGKbYyZUlYmMNWBSIR7Was4f8tQcQ?=
 =?us-ascii?Q?XNUEZTeq8R48DkvuG2n04ss8dGj6ot0LPfOISE3BH7AGTMYsoSQnmSr9V/90?=
 =?us-ascii?Q?GIm+9+RLPytEL4gdbKE/JCSDxtOY1ud7lTlcRqLmhhHHgpFXOlMBEg8prqDR?=
 =?us-ascii?Q?d0tQN3hstrDxGyVwbIXPlCmBjX35R8DTbvv5q4Rq7vQQJL2sYoAyPbFnPL30?=
 =?us-ascii?Q?V5z76uJPzZohjdx85TirFBsCizI5YYpkRRb5TjmQ/hK9tv/uGTKyUg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 22:10:53.7960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c877ec4-ea33-4719-90a3-08dd13e75acd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_141105_886732_7B39C29C 
X-CRM114-Status: GOOD (  14.29  )
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

As the part-3 of the vIOMMU infrastructure, this series introduces a vIRQ
object. The existing FAULT object provides a nice notification pathway to
the user space already, so let vIRQ reuse the infrastructure.

Mimicing the HWPT structure, add a common EVENTQ structure to support its
derivatives: EVENTQ_IOPF (the prior FAULT object) and EVENTQ_VIRQ (new).
IOMMUFD_CMD_VIRQ_ALLOC is introduced to allocate EVENTQ_VIRQ for vIOMMUs.
One vIOMMU can have multiple vIRQs in different types but can not support
multiple vIRQs with the same types.

The forwarding part is fairly simple but might need to replace a physical
device ID with a virtual device ID in a driver-level IRQ data structure.
So, this comes with some helpers for drivers to use.

As usual, this series comes with the selftest coverage for this new vIRQ,
and with a real world use case in the ARM SMMUv3 driver.

This is on Github:
https://github.com/nicolinc/iommufd/commits/iommufd_virq-v2

Testing with RMR patches for MSI:
https://github.com/nicolinc/iommufd/commits/iommufd_virq-v2-with-rmr
Paring QEMU branch for testing:
https://github.com/nicolinc/qemu/commits/wip/for_iommufd_virq-v2

Changelog
v2
 * Rebased on v6.13-rc1
 * Added IOPF and vIRQ in iommufd.rst (userspace-api)
 * Added a proper locking in iommufd_event_virq_destroy
 * Added iommufd_event_virq_abort with a lockdep_assert_held
 * Renamed "EVENT_*" to "EVENTQ_*" to describe the objects better
 * Reorganized flows in iommufd_eventq_virq_alloc for abort() to work
 * Added struct arm_smmu_vmaster to store vSID upon attaching to a nested
   domain, calling a newly added iommufd_viommu_get_vdev_id helper
 * Added an arm_vmaster_report_event helper in arm-smmu-v3-iommufd file
   to simplify the routine in arm_smmu_handle_evt() of the main driver
v1
 https://lore.kernel.org/all/cover.1724777091.git.nicolinc@nvidia.com/

Thanks!
Nicolin

Nicolin Chen (13):
  iommufd/fault: Add an iommufd_fault_init() helper
  iommufd/fault: Move iommufd_fault_iopf_handler() to header
  iommufd: Rename IOMMUFD_OBJ_FAULT to IOMMUFD_OBJ_EVENTQ_IOPF
  iommufd: Rename fault.c to eventq.c
  iommufd: Add IOMMUFD_OBJ_EVENTQ_VIRQ and IOMMUFD_CMD_VIRQ_ALLOC
  iommufd/viommu: Add iommufd_viommu_get_vdev_id helper
  iommufd/viommu: Add iommufd_viommu_report_irq helper
  iommufd/selftest: Require vdev_id when attaching to a nested domain
  iommufd/selftest: Add IOMMU_TEST_OP_TRIGGER_VIRQ for vIRQ coverage
  iommufd/selftest: Add EVENT_VIRQ test coverage
  Documentation: userspace-api: iommufd: Update EVENTQ_IOPF and
    EVENTQ_VIRQ
  iommu/arm-smmu-v3: Introduce struct arm_smmu_vmaster
  iommu/arm-smmu-v3: Report IRQs that belong to devices attached to
    vIOMMU

 drivers/iommu/iommufd/Makefile                |   2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  30 +
 drivers/iommu/iommufd/iommufd_private.h       | 150 ++++-
 drivers/iommu/iommufd/iommufd_test.h          |  10 +
 include/linux/iommufd.h                       |  22 +-
 include/uapi/linux/iommufd.h                  |  45 ++
 tools/testing/selftests/iommu/iommufd_utils.h |  63 ++
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  65 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  94 ++-
 drivers/iommu/iommufd/driver.c                |  59 ++
 drivers/iommu/iommufd/eventq.c                | 612 ++++++++++++++++++
 drivers/iommu/iommufd/fault.c                 | 444 -------------
 drivers/iommu/iommufd/hw_pagetable.c          |  12 +-
 drivers/iommu/iommufd/main.c                  |  14 +-
 drivers/iommu/iommufd/selftest.c              |  53 ++
 drivers/iommu/iommufd/viommu.c                |   2 +
 tools/testing/selftests/iommu/iommufd.c       |  27 +
 .../selftests/iommu/iommufd_fail_nth.c        |   6 +
 Documentation/userspace-api/iommufd.rst       |  19 +
 19 files changed, 1218 insertions(+), 511 deletions(-)
 create mode 100644 drivers/iommu/iommufd/eventq.c
 delete mode 100644 drivers/iommu/iommufd/fault.c


base-commit: 2ca704f55e22b7b00cc7025953091af3c82fa5c0
-- 
2.43.0


