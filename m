Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398F1CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5y6Ze+fbIFuo18Z2V8RSl+iGqt5gKuWtUmh9kYG8n3w=; b=ih5YlqlUUzPiO/J9/F5smdRmFs
	clWcGpI2ynQRU3P8ZFT63gix6ld8QP5FoV7m9pe7e0koTWw6v1Nswz7W230bCaelQC13TeF9pGVgo
	EnUpz2MkjgIYMfag96hV/h626jXIJm4VrMVBrA6qsNkdXpPgyW0Mo8tsHu0NCjquQ+pYQQUs6EZHq
	Ca34qILHo8+PuAmceTo2QBTtM6fw72MxOdxcTbQR41wmkPsocqkHVLCJZdYhNJSmhp5zHtJUU6lUW
	RccBPU3+MVM8tqObeSK725x/NP9xeWYH3FsUoDc30qOPYLCxHbiW/6DkP9QtfMJ/Ic1st15bDAOQc
	eKoWfHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3OCf-00000003gSu-3T0Q;
	Tue, 30 Sep 2025 00:26:49 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3OCc-00000003gQl-3dPU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 00:26:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0/2DFIKO3A0TgCscIjO+H+QrzYiIYD00zPV0N/c2WdUDZoQlD6sjITgalIXhTgTZFDiAeTpDUe/psaXisqC4IYBf6LIrMWCkyZu58Rp52ct3VALfF86JelFl46pv/Wo9MPNpcP9013aICtykvVT0Ol16zr3HPBxIApcWI+tJ8/6BunYe1IyJuYjTcDp/6mhblGYZuer0nqbPEpx0LhGMBwxhAk+rdQ3vPdXPne1AG0AGystcVqZkE1R+4z2nB2+jzWJ206RWPj9vRHRE3cP5ed5jxSbrJ/xPxZN2cGgugBrZIn3Lwnr6vO2amvoFS3h7jVNZKq+CtK1GgdmQylrfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5y6Ze+fbIFuo18Z2V8RSl+iGqt5gKuWtUmh9kYG8n3w=;
 b=G13h7TiWehLLeJ8IKillcGZRz4eu2U8qa2UqkpdAa7Y+nRkih7OeDKN1ZQJkTgzA9AOOzPKvj8GNnRY1Wxzf6JgQdinTbGC9LysspIM5C95XuZVbo0Cawu7bIXgbL6zyidK6M+c+RzAnjAxOrcND578z9GIFPylc+0bBg1FgNbC/MiqJt5SijsBpYuabbrQMJQN1Jx+LCQ3CAvABNa2LTMClDUY4ScofEbeLiVJcrLYrYeNVmo1vMsnbsmcICrhzUyxOptV6wCUEqSjiYVzk7vyDDv/MtuUcLmEngECd/Hu/YGI9K0Z2gNBFp8Lsu4lzSnCqZGjYfeEyEXsQP8kkAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y6Ze+fbIFuo18Z2V8RSl+iGqt5gKuWtUmh9kYG8n3w=;
 b=s4VMgHNuJbwzkwYZKPEFCJBcJpCeMvKcngvqwvNIp+VEQSCChS8txUn49TESXTcO+EsowY+vjCL1hu0ZdNIs4xIHwP2m/ZUvpNMUGWc7Kmzzcp3kZtluc0K7E4HJOwe5Vq+b4AqbqqI6Av9JucB17saJx9iQITQf4uS73XR8NtN7Lfm137KBejKQ7o38aBwO1gavzJy3PmrXImlsPExpLHqk3iz0/q4FYtRr7pU+WhVEEMs7Oje6x2z8vfn5HMx8FqVH8NojM89t6f4xaeDrRUoExaXWx74A1pTKs8lNqZsHuSDlDAW5gElGdPOyNeMXjMxpE2w5clmsoUa6/zxUQQ==
Received: from BLAPR03CA0165.namprd03.prod.outlook.com (2603:10b6:208:32f::9)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 00:26:23 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:32f:cafe::b6) by BLAPR03CA0165.outlook.office365.com
 (2603:10b6:208:32f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Tue,
 30 Sep 2025 00:26:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 00:26:23 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 29 Sep
 2025 17:26:12 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Sep 2025 17:26:12 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Sep 2025 17:26:12 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <bwicaksono@nvidia.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>
Subject: [PATCH v3 0/5] perf/arm_cspmu: Preparatory patches for NVIDIA T410 PMU
Date: Tue, 30 Sep 2025 00:25:59 +0000
Message-ID: <20250930002604.346306-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a28ced-43ea-4c8d-1e00-08ddffb7fc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ufgAlNu3vcycQbyJO0QEcnSf7pszIB76jHXxxQwd2/9RAPAqXsYIwgQVUQnZ?=
 =?us-ascii?Q?MxOGtg9cp5nkrbLfiVizz0hZFV5Ie/5BSzKfCgz9l/rlwF9n/buedTlr7tnW?=
 =?us-ascii?Q?1e7TVunDLHwGaqkdIQThqmh/QttSNse9BXWOjIWrgAv1DjIas5xYAszjjIHH?=
 =?us-ascii?Q?hQPFyVjdjEaIxPYcbG4Dc7dHCwQCBMpsPysEU9LSTygErQNH4tlmcVUSSp/Q?=
 =?us-ascii?Q?sD3qJNSC2GkmWXcJQenky3pYMmV9z7WMr2me2CFlQJPxuPWkFDXc1TmWjIXG?=
 =?us-ascii?Q?Vb9yRXKOI1PH2wDHKTODBNzQolWEnAWONc7bkfxysn7J1ykWLvXQiY+gmqm4?=
 =?us-ascii?Q?a7D2M12Ho8vXacibQ9EmxEzE+yY37fs1dvqyn990RlQETf5wcixJaUGzBXLH?=
 =?us-ascii?Q?HFJHbUOy0AM4R+hDQMHZ0ltzZzYDNxuOPsWsVl6epub7Ha8qy2wFFlt4icxS?=
 =?us-ascii?Q?Zp1YIg18jlX5Uf7EO2P3y3hhd7fFTG68rWs68Mvegrw6DPxOS4g167InVL92?=
 =?us-ascii?Q?82GKzU7dYiAVXF3rLH3zMC2hJs4RD7eHFaw0ujSpccvVSQlcgQ0Qndd0bDVj?=
 =?us-ascii?Q?GbFjIkf28bLmjX9x3v69IinLrx0RIbOBlesVCgA7hsJYOtBo+688loOdH4nE?=
 =?us-ascii?Q?Jxv3S5PzmXJ+xrgx1Es9QhBee+APwMDErFNsYQHooe1zOQHd8doOjd0oUHJ0?=
 =?us-ascii?Q?QaQLwdInIkSq3C0b07ptyOcuKIrEnkYMuAs9vigoWYAUbA2QvtydUeC/1y4I?=
 =?us-ascii?Q?4z/zldfyx/yZPp8vVbkXZt53/NQbghrfgiuxkdCQ1SF6dJ214FFk2KaVbPPK?=
 =?us-ascii?Q?FIy+w6rsSMGDncsm0ABGC9E1VcdXuLpVLi+6cP7g4h3fsqc2hg7BxgPT1k4+?=
 =?us-ascii?Q?s9rOLL0w4vlmIh9VHLZX0bgauxD+4s86s0J9hyshZ6A0XNL/eFCJCEQfh4gg?=
 =?us-ascii?Q?wziG4pHJhI2VX4J1sfOY9nYCLYJYCKYrMCimIGp+wi7PuF9PZDR5F02yFIiM?=
 =?us-ascii?Q?Y4KCdQVtmUAGO5ViGGTUG0LKbVpCTM1CfawmTnbOcG/lQwDh5dB+yuFK18ZF?=
 =?us-ascii?Q?NMdnybAuMLrN+TxdGxQ9/uU8ojtxD2tw81GvW7vc2UkCbpP6VBZIZCDtTiF/?=
 =?us-ascii?Q?07aV4xJHvLXb2fRNqT+kDtzSo/og5so8xGWBAL6W/yB4S23VYE6FbrKU35Dz?=
 =?us-ascii?Q?7UaAYPP0DeT79S7Lg7iEz97YuRlJWEWQoel8nGfoA+EiImJw8bo5ZngQupCD?=
 =?us-ascii?Q?srutAyvUOfTk2WXC0m20fb5FjcU7URh43+OujEYtJTiTrgDk/cXH3bLUFcqG?=
 =?us-ascii?Q?brHTVbrnRUdZgHOcrvA0vJNAti3xrOzlhNv/EJ3uakMvJr3JqMVm1LO68jtH?=
 =?us-ascii?Q?xlO6TG1xeyGQZngqnO7soqp/wCml0FsN8+pJQVmFvZIr6AUzIltKoygBxb92?=
 =?us-ascii?Q?XgpNMdU3RgZ/T21GILMYe/4UJJY/x7wD/m6/kUDLQQbA/yAv8H64YJagDV80?=
 =?us-ascii?Q?Q2rMlfD9JT1kDm9MisW3SD5qQ2udQRx/E45oiVc/GOxzblKtIcSb0oMIwVwC?=
 =?us-ascii?Q?3hPxxKvDYgp4Qn56/CM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 00:26:23.0639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a28ced-43ea-4c8d-1e00-08ddffb7fc37
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_172646_905155_7C191103 
X-CRM114-Status: UNSURE (   7.44  )
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

This series contains initial patches before adding support for upcoming
NVIDIA T410 PMUs.

Thanks,
Besar

Changes from v2:
 * Add Reviewed-by from Ilkka for patch #2, and #5
 * Add Reviewed-by from Suzuki for patch #2
 * Add stubbed implementation for arm_cspmu_acpi_dev_get
   for !CONFIG_ACPI case
Thanks to Ilkka, Suzuki, and Robin for the review comments.
v2: https://lore.kernel.org/all/20250923001840.1586078-1-bwicaksono@nvidia.com/T/#t

Changes from v1:
 * Add Reviewed-by from Ilkka for patch #3 and #4
 * Drop change to [1/5] on making arm_cspmu_apmt_node public
   * Replace it with new API arm_cspmu_acpi_dev_get
Thanks to Ilkka and Robin for the review comments.
v1: https://lore.kernel.org/all/20250812233411.1694012-1-bwicaksono@nvidia.com/T/#t


Besar Wicaksono (5):
  perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
  perf/arm_cspmu: Add callback to reset filter config
  perf/arm_cspmu: Add pmpidr support
  perf/arm_cspmu: nvidia: Add revision id matching
  perf/arm_cspmu: nvidia: Add pmevfiltr2 support

 drivers/perf/arm_cspmu/arm_cspmu.c    |  70 +++++++++-
 drivers/perf/arm_cspmu/arm_cspmu.h    |  54 ++++++-
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 194 +++++++++++++++++++-------
 3 files changed, 259 insertions(+), 59 deletions(-)

-- 
2.50.1


