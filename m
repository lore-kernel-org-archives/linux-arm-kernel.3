Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63237CCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mdBfZsRIiIRC1UZ5XsRlWPEf44+/h+G4key0gza5qAw=; b=O687ym47XZ2wMmiNUOOr5FrVAn
	ZpFssd9CPqu7hXzVpHn2x/DTVOpWVX5lDBzDWf3Cc/qtq3p+60iGZWkBI7J4KVMKQdMUSX/7RHbj5
	iA2V/cn3K6KANcUlkbZ9lMRkmvoP8Ic9EILqM2PvnE6ppFkTJcSJou8EYYnKeqDE+0FSIU/WYUAbW
	hhzAILYMj418t/zMewUbl7DxZ3n2PviYVkYQfwnF57XQtBc+VjI+6+KmpMV8A6OtYTWX5WoAcjA93
	B30IDtFh4MhnklTVm9CkqCAf675WTdNivDfJQ4/oAsosFuvl+0j3+foYadTyezMJJTD1gQ+l0B8VL
	1wImgFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v864n-0000000BtHy-0ETJ;
	Mon, 13 Oct 2025 00:06:09 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v864g-0000000BtAX-2iaK;
	Mon, 13 Oct 2025 00:06:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scqSKSuZ/0vOyX3CNylnVdcxwLr4D5ueVVj476B0ZhhQug+mseF65Cc1v/Pvqp1jrQunvQaH0UpZVzyUJENWlRuDHX/vBNmm2SK7UqaLz0ByYjVum+zoSmrJO8QjxKtdsJrPiV71Pt4xAOtiYzzOp/UrhAtyqnklkHY8NmqIGQwzigGROn+IbAi8PAGvvLIvevhQMOQ9+Nc0NJFW/XGPuQG7QGTqDGGJLOk8eB2y7TQETwlpkxXDgDlopZXs6TAxAucoSVl/qBAeI67Zr8/Kz6OKoNUrdfSMYc5wsB32SRzJvAOau7RBVdcQtFrqwSHjzBL7R6AyG++d+lppQr4PCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdBfZsRIiIRC1UZ5XsRlWPEf44+/h+G4key0gza5qAw=;
 b=OTudbYniUod6M0elCDu/EbIcWw2ZahuFT9xnxOg5trfKxOIGMs4NRrLaNH9jbRmc3HG68pYMMxPMzRyWqoahAKrxDEg919rUsIIVV+5enYKxuM8u6v/xhfUb5RbnAtofXLrvLDaHUcI8vAsfya8F6Vuz+hrFCxBfFZHcd7fTIL9CYjxHd1JKfBGhFgFiR/Ft/2DiXuC79VexVFKU355Wlh8Q+ZcxIEZtdI2p0QyA+pZSTIOIVuyGUp3dk9k5YKgzf2tcgqYGl9Hbpo9echC7BbzlDjS6qDC79DRsgZyk7nzwYYlvyC8F6JUsSOIR3AyHXvJPo757PjQuWQHVVE3/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdBfZsRIiIRC1UZ5XsRlWPEf44+/h+G4key0gza5qAw=;
 b=ElC5O9xoo+E5bdKEvVX4Z1qjritKLAUmVhGMHUpoPigOHJdNEHlJuqm5OgjFuOCYEplKH1TcwhyRdAUZ8VnzKVpj/VnaGfeMztXZasHqEfAB1sQhwEK4ykg6JjRAKBww5a1IuPjHJtckzsrtmWzahi/0bQHulZj6zBbkSJlajCqJRGGhaVFkto90Fg+4LcCNFR/v+PouFj9fQDVyNbND8QLPivmtlvY7vkKa77tWygNi0lzUzftShATBAZLxSEdZkGiAw28tI0ZPPOQfgNPjWLz1e8jm5GtyIQ0UThZsutF2eZqrNBDYN6HFP+/a1TmrgNBCcO8rSTWrBYMEGZW9og==
Received: from BL1PR13CA0022.namprd13.prod.outlook.com (2603:10b6:208:256::27)
 by PH7PR12MB7377.namprd12.prod.outlook.com (2603:10b6:510:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:05:46 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::a2) by BL1PR13CA0022.outlook.office365.com
 (2603:10b6:208:256::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 00:05:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:05:45 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 17:05:28 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:28 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:25 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<jean-philippe@linaro.org>, <robin.clark@oss.qualcomm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<tjeznach@rivosinc.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <heiko@sntech.de>, <schnelle@linux.ibm.com>,
	<mjrosato@linux.ibm.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 00/20] iommu: Introduce and roll out test_dev domain op
Date: Sun, 12 Oct 2025 17:04:57 -0700
Message-ID: <cover.1760312725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|PH7PR12MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: ab18c537-9971-4475-dacf-08de09ec422e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UevVKGCRpOnWEK3tM/CXPhMi+wK1RFJoUUOqYdxl/9SMF51BQwEAWXu1BH9L?=
 =?us-ascii?Q?67OHyBrnD9UH5hm6KMrbmLrlC2039v6Z9rsWDQcrH/stbUpLG+e+XjPq8d6S?=
 =?us-ascii?Q?PyG0SnBsGMmi4mESreuoXhpySqu82nZJ1gZVI1sRe0iZu+qeucoGQTH/DxLp?=
 =?us-ascii?Q?uekktXluAxgB/UnPTY6AqHpv/gGFv/LVojgRHc+MEA6UTvO5YwqNn1+FzV4b?=
 =?us-ascii?Q?yHHFPYgku/7Jl62nkKqL2GBA3d0UMotNysWBZP4k9TtvE8ZYTCRl2I1oAXMy?=
 =?us-ascii?Q?rU5qiPbD7lFy+ymXSXXT8N1bzxBjEGdxR7bLAlT0ywwznx+XX++dcFAlqmuJ?=
 =?us-ascii?Q?FSnGtE8W8BoDr99We9PnvCg0gwUQBCKg8GYDsjI6389vyGQP3DlQtqAd4M+a?=
 =?us-ascii?Q?CS9DWo2G890qFWv7VUF0bh/UfYQBOkVfOdiKBnNXeaQyVSYraEGBzPeFaBig?=
 =?us-ascii?Q?NwkmG1bYY2NEGHp3ge58bDYjfZNMK5RUDN9mJ4c8VRLbAIgGQpkXStxSq7sj?=
 =?us-ascii?Q?0MCFI8pCaOmw6Mh2eun9mULAV5ACkJae3+Z/I0MgkCkJiWHMZvVKMf+WgdrA?=
 =?us-ascii?Q?giG+AoN4q42UOYwtPkYkgG3e635F8orT5P2b78eBvdv1g2APe96FmOPam5rm?=
 =?us-ascii?Q?BB9HOX6wojMBFGHO7rm/nGQkeuyIZneVtuLhNmPtqadl3ynOCRyZ6P/8FQcg?=
 =?us-ascii?Q?ASF9OnZ6vzqn6boi+K4KecuJikH6KThtbNHTuGTJux3q/i1IDnu78Ti6Na7W?=
 =?us-ascii?Q?OVs6WGX1VIfZ+UysjesTLthdOiIYdgfvFnTyWqq8KAE4P5XIHZzLDKg13IYa?=
 =?us-ascii?Q?bKOJS+Am1Q+vejtOgcXGe/+uqP5ABFu6yyEQ+6H3O3xnQkwtqELe1UNl2jvH?=
 =?us-ascii?Q?GLuq5vvacWB6gq43lH9HOU7nO2sy0eQo3+8JVrIC7brp5DxtZLgv0N4dH4ZF?=
 =?us-ascii?Q?zzq3Cyg+bDQFWmN5aSA5o+4qkEci775qzJP7Qaj8tfhpUsniuOavzjSmJbb3?=
 =?us-ascii?Q?8Z7pc6M8rPET6dJowprfAbg+V/0ekoMRO5iAu33WINiNSTStBlzZwblMGF3g?=
 =?us-ascii?Q?SzHh26cVda+iuFnwYqiuFtyIAHgX1chRj2dvzc4nzlH3WIahVTO3yd43XS9n?=
 =?us-ascii?Q?oJLcRn2C9M/ElvqX6V5GFjec9C4XjO6nMSfv+DlShasHYTI4lSeh5IiQkbQp?=
 =?us-ascii?Q?3ha4AtlCj1bgvjRgt0nDlJZn6+BjrTgTmgpvlEWQ+eHzva/DTq0PhoSSGKfa?=
 =?us-ascii?Q?/99x/iSokSlJSXPBbnbDCQYO06UkchXm5TqlpkNzd/PDlIYeP91KPsTyBmE5?=
 =?us-ascii?Q?DLXFXPt5Q5ZPH/J0V3T2Q9Z61aZDsBsY+Y8sELsksusEd+APyeC6fvVP+vPd?=
 =?us-ascii?Q?T5QnpkeWQu6hQ/O4i3+q0f3PW0XpyhyxRw/pTC0Xgpbci7IxUv4IpE8hwK6G?=
 =?us-ascii?Q?mP1HKKPeayrV5eE8kvVwKHQFk3grEtRAtXicHEq2HDL/iiXlHAkbLY3pfvlv?=
 =?us-ascii?Q?P5SK2TAQmUGzy8C12xjP2k2740T6lSQuVzzVSj3WoK/f8/laASHWOXHNtuwn?=
 =?us-ascii?Q?aiHnXU1s080FDG0laN4cHO7hQMYchhm3H/PzgA0q?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:05:45.8999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab18c537-9971-4475-dacf-08de09ec422e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_170602_700250_0FAF635C 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

Add a new test_dev domain op for drivers to run a compatibility test prior
to the actual attachment at the driver level. Any incompatible attachment
will be rejected early, allowing the iommu core to postpone any concurrent
attachment during a device reset state.

This is a preparatory series for new iommu_dev_reset APIs:
https://lore.kernel.org/all/cover.1756682135.git.nicolinc@nvidia.com/

The change is a must to keep attach uAPI behavior consistent.

This is on github:
https://github.com/nicolinc/iommufd/tree/iommu_test_dev-v1

Nicolin Chen (20):
  iommu: Lock group->mutex in iommu_deferred_attach()
  iommu: Introduce a test_dev domain op and an internal helper
  iommu/arm-smmu-v3: Implement arm_smmu_domain_test_dev
  iommu/intel: Implement test_dev callbacks to domain ops
  iommu/amd: Implement test_dev callbacks to domain ops
  iommu/arm-smmu: Implement arm_smmu_test_dev
  iommu/qcom_iommu: Implement test_dev callbacks to domain ops
  iommu/riscv: Implement riscv_iommu_test_paging_domain
  iommu/mkt_iommu: Implement mtk_iommu_test_device
  iommu/apple-dart: Implement test_dev callbacks to domain ops
  iommu/ipmmu-vmsa: Implement ipmmu_domain_test_device
  iommu/sun50i-iommu: Implement sun50i_iommu_domain_test_device
  iommu/rockchip-iommu: Implement rk_iommu_identity_test_dev
  iommu/msm_iommu: Implement msm_iommu_domain_test_dev
  iommu/fsl_pamu_domain: Implement fsl_pamu_domain_test_device
  iommu/omap-iommu: Implement omap_iommu_domain_test_dev
  iommu/s390-iommu: Implement s390_iommu_domain_test_device
  iommufd/selftest: Implement mock_domain_nop_test
  iommu/virtio-iommu: Implement viommu_domain_test_dev
  iommu/tegra-smmu: Implement tegra_smmu_domain_test_dev

 drivers/iommu/amd/amd_iommu.h                 |   3 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   2 +
 include/linux/iommu.h                         |  17 ++-
 drivers/iommu/amd/iommu.c                     |  27 ++--
 drivers/iommu/amd/pasid.c                     |  29 ++--
 drivers/iommu/apple-dart.c                    |  50 +++++--
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |   6 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |   4 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 113 ++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 116 +++++++++-------
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       |  46 +++++--
 drivers/iommu/fsl_pamu_domain.c               |  50 +++++--
 drivers/iommu/intel/iommu.c                   |  66 ++++++----
 drivers/iommu/intel/nested.c                  |  29 ++--
 drivers/iommu/intel/svm.c                     |  11 +-
 drivers/iommu/iommu.c                         | 124 +++++++++++++-----
 drivers/iommu/iommufd/selftest.c              |  45 +++++--
 drivers/iommu/ipmmu-vmsa.c                    |  38 ++++--
 drivers/iommu/msm_iommu.c                     |  31 ++++-
 drivers/iommu/mtk_iommu.c                     |  17 ++-
 drivers/iommu/omap-iommu.c                    |  41 +++---
 drivers/iommu/riscv/iommu.c                   |  16 ++-
 drivers/iommu/rockchip-iommu.c                |  18 ++-
 drivers/iommu/s390-iommu.c                    |  22 +++-
 drivers/iommu/sun50i-iommu.c                  |  16 ++-
 drivers/iommu/tegra-smmu.c                    |  23 ++--
 drivers/iommu/virtio-iommu.c                  |  16 ++-
 27 files changed, 671 insertions(+), 305 deletions(-)

-- 
2.43.0


