Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6559DD3C521
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 02:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ax4UpKQriHV7gRw2+94eMr6esoM1XhGsO7y0HMXHic=; b=wi2e2lwn4/3NNIpFLtVFiboqUQ
	OY+6JxumcrbxGsXO/rP40RbrO9D0Soxg3DRxqypHTCMUVYG3CloNpzdZJuNTH/c8cdcu/9y+4oF0X
	nrMzSi+7RGudNvMN9cT9nofoz0j7lTCjCvNSxYUd3RvRbkO1PyBpv+Eke3rOWRCxCMxyBgll6u0Em
	SXpm0XeHDxAYU3BNSY9yOzciyRJWqDfRSH0ZxsFCZSxFkX6ZZcud1Xe8y3NY+oJUguQtmOeUF0hdF
	ZkkaXmC/ntmG9aB1/urgvDOImjYCnzJ2fD10tHQ9phNMQVdPr/JQ4svX7jbFibzt1IjUaMlxNi6uO
	Hd059wZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTADM-0000000F1MS-2eDZ;
	Wed, 10 Dec 2025 02:46:04 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTADJ-0000000F1Kd-2phG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 02:46:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOA10C2xGrXIWRi1Kfv5BgMMuHBLYzjwp6QwELf+7j2gNBBCzvFb5ufjiFoQKSeRohEIlFsZfDeIP7shqsi2B7g/nwe5EBdVKt98u6zmEcjHGJ520V/yZbMSHXEBfwyn9uuXsYivGvISfkCwjEZFQaGYhIWqSE6dvEssBK1KrauGA5B3H/pUeVRhneBUgISagWAJ9/Gcu1D8Zu11lJ7IA/X/aTocwUA8guLYvhflrviMpKfdD3ebHzIrICBFO+d1ayu41ZwRVZaaR3MnJNhj8dVsCQ0/TPd8+tlVdoQKhmjZ58IevFQo9hdvENN8NHQKxoCRvfW9TIG7Osa/0sWiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ax4UpKQriHV7gRw2+94eMr6esoM1XhGsO7y0HMXHic=;
 b=rckUuUk2W4oBkcZ8K5ZLaeqCbPZTiYat+OFIC5zibQsmJwA2qopvmUYkyMNUhvRMVMYphSOWzxZA5UAJWNINOdjD56tzspYL0YUYyjSqhq9NI0b0sX+CJ3MrkvbxxhzcJECatf10RUQj7qie614DoJ8w9EVyaFkHVjitR6GcM5VKyAi0+y7Qt9lmqfPXhi1mO4mmIpAE/rfUngvX7KRX5XkaXIKMs9HzKU/88Gnj6Gyir74evLJpXS3r0OtsJuu70eUZh8sVJuAyujo1pcF8GYwYs6GiaD7mnjJY3QI+UJqthdfYDhmt7DcgzFT1mcj5o1+D317nRWUBehl5oMbn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ax4UpKQriHV7gRw2+94eMr6esoM1XhGsO7y0HMXHic=;
 b=HLUi9dgEzdzRzJBkx+UacqO8crHLzFyQ4UZWUDX6qsIX3LMYKqA9cFN6+UuxEiGAJIju6sryuw7ZNqQs2EjeXFsE8JL+meCxguVcsGY8dJ1zG4cNL4WGbWsQVTloKtvQSd3D9jl2zeXeLTgYCwq7ddO5GuCZBEy8drSTBGVrgjJpU6xiPHRFGbmnw15dDjODb7gw4PxheCxmTtg3EF1FjauUXqsQCOnkbjJ7l515d4ITtfRe7V6deL5CWw98cDtOV6i9hYykG3fp/bKb1299EOd1P/x+VfGJW+ckiBHgEHIEIWv7k50xIOoRDYfrQ1B+G+Yq08eBxKJZCylf+/GHsQ==
Received: from BN9PR03CA0795.namprd03.prod.outlook.com (2603:10b6:408:13f::20)
 by DM4PR12MB6469.namprd12.prod.outlook.com (2603:10b6:8:b6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.6; Wed, 10 Dec 2025 02:45:55 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:13f:cafe::b4) by BN9PR03CA0795.outlook.office365.com
 (2603:10b6:408:13f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Wed,
 10 Dec 2025 02:45:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Wed, 10 Dec 2025 02:45:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 18:45:49 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 9 Dec 2025 18:45:49 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 18:45:48 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<skolothumtho@nvidia.com>, <praan@google.com>, <xueshuai@linux.alibaba.com>
Subject: [PATCH rc v3 0/4] : iommu/arm-smmu-v3: Fix hitless STE update in nesting cases
Date: Tue, 9 Dec 2025 18:45:15 -0800
Message-ID: <cover.1765334526.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|DM4PR12MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: e424fbf6-14ec-4250-d997-08de37963d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZUtHGRoSbT/lC+g3eNnCCeeBMkEfHxnFmRKYHWVj/6cZb/VTOO5YNKoFzkaw?=
 =?us-ascii?Q?OLQO3pYOXqlTajcLZRTBe1eaIx62djjhE/56Wy9m7gzgV/qHzyamzrOZ5qNn?=
 =?us-ascii?Q?wVqMyVk3cKcBS5A7erkINEwbLfQ55ka1URcPYMF+Hy23qQBrWoB/N4VFSN1s?=
 =?us-ascii?Q?Ezg6w5AfDUTbGrgiWSvy9dv3JEa8srWbljC/qS6pz8VNOvr+q5ecGVFfP8Q0?=
 =?us-ascii?Q?jsn79zlp2vkvmwLB/82nBAvX5sgSaFFIWR1qfjj224n7ipZO1jmCeDnQa7BR?=
 =?us-ascii?Q?9JZvW+yZpXKku7ce5DR+kYA7rjeacHhuC4w10cSjerbzhqtWqD1xVjtC+lp0?=
 =?us-ascii?Q?NFDFjI52aIBjiZ00b5kq70N/z2pkDVnLc0n7oihMknqWIHei4CNlBIKXQRod?=
 =?us-ascii?Q?e0Lgj+Y6m8kjjz1A4Bf2Wqms5VOgJqD5G3bHs6yqG9/t1JgUZCgpiU+x30PU?=
 =?us-ascii?Q?D5DcJDLMRogCfi/L0Jux+O5tjtAnDDpVKkcFEQu4qhPgFF3+XbrrbitlzEI9?=
 =?us-ascii?Q?uI01NQDzLQOSJYKPfbRxQHS8wbbzoIDyesCQ5mt/8WLDSCsjFcWBxWL9mdZA?=
 =?us-ascii?Q?WHgb2MF+4rpAtVlRoBn7EdcEAYNH0018rJyODha+WUA5difXcWO5zmNFhI7B?=
 =?us-ascii?Q?Pu/6rF6KjYvp+i3A7MdPZ2G1iUeNH+qAk1GArUfJibe4TutwZ0HhQpAxomgf?=
 =?us-ascii?Q?dZZCg3WnRok9FbHmFV5SDyZpJTIatJene6kA2xPO02bct/zS+Ki7CicNcHRO?=
 =?us-ascii?Q?kzyKh3rUH/XcMGwAAb8v+KHn/M76tgwS0vUEk29uBuzwiUw+ujaOkCec8YRs?=
 =?us-ascii?Q?dtEtKC7Flti5G3TYbOMdP64YHLkmaOhLwCLtC2wFQmh2Y4nN52n+MIp5B+ci?=
 =?us-ascii?Q?U6Ia61UeGBkdn1L68889BA85du4alB1YgcPk/niDj0I2JtJPvhPr5495eSyP?=
 =?us-ascii?Q?vG1ERUWgS8zaNqf6UHGP2/OQUDkWXIoD0njBz3+O2qZXBGgt+tMG7ENeAZRl?=
 =?us-ascii?Q?WhI/IKxYkeRlNghR1eDw9/gGseM1/Z51cQkDK6OHlo9/iOXJaH8dVDzWYTMc?=
 =?us-ascii?Q?aSvRYe3PdGkvN/5J6qLgSjyr/z1fLnPKo7U97vDskcu0MF6Z+Cf5kDXLnaDd?=
 =?us-ascii?Q?b7nBVxtwclbGQzOVOoI/p7mYIIWioPORQVmbJSWLlDAZtpPuGj+5owmYCsMZ?=
 =?us-ascii?Q?zTq4NOo1IS0qYziKnfL9xUh8vYout36s1J03l3ibZ2v+oLFPaiU+xIF4r6uV?=
 =?us-ascii?Q?FvXxVwDHmIdwNOLh/Tua2hihFGRY+3IOfbNRFkBbpHWlyb5AIaTTydcfd3Uv?=
 =?us-ascii?Q?pKpELtfZlkwpR5kJwliZFfmq58GyGqAzFhmWs58x2atrno9CXUrdQ146L/zk?=
 =?us-ascii?Q?y7CWjTvcQKQz06I1d12jWBB1svDIHfVvvpKUbmSl5ppWas0F2nOXqXZKfwcs?=
 =?us-ascii?Q?rnh94KpwxXW8GpKx0Jz+BjZmfX/zTXsGkasj0CFbqfU01a1MQEgNf4nMyB3a?=
 =?us-ascii?Q?CgwG9DziZqeX7c5HNX4/bDv3ymRQFEAUm6478rJ9Pcg8JYzBQWPfZVMqLyk1?=
 =?us-ascii?Q?Gp9wMUhW6ybXgEr/HYY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 02:45:54.1320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e424fbf6-14ec-4250-d997-08de37963d1c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6469
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_184601_714068_8428DECB 
X-CRM114-Status: UNSURE (   9.93  )
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

Occasional C_BAD_STE errors were observed in nesting setups where a device
attached to a nested bypass/identity domain enables PASID.

This occurred when the physical STE was updated from S2-only mode to S1+S2
nesting mode, but the update failed to use the hitless routine that it was
supposed to use. Instead, it cleared STE.V bit to load the CD table, while
the default substream was still actively performing DMA.

It was later found that the diff algorithm in arm_smmu_entry_qword_diff()
enforced an additional critical word due to misaligned MEV and EATS fields
between S2-only and S1+S2 modes.

Both fields are either well-managed or non-critical, so move them to the
"ignored" list to relax the qword diff algorithm.

Additionally, add KUnit test coverage for these nesting STE cases.

This is on Github:
https://github.com/nicolinc/iommufd/commits/smmuv3_ste_fixes/

A host kernel must apply this to fix the bug.

Changelog
v3:
 * Add Reviewed-by from Shuai
 * Add an inline comments in nested test cases
 * Reuse arm_smmu_test_make_cdtable_ste() for nested test cases
v2:
 https://lore.kernel.org/all/cover.1765140287.git.nicolinc@nvidia.com/
 * Fix kunit tests
 * Update commit message and inline comments
 * Keep MEV/EATS in used list by masking them away using ignored_bits
v1:
 https://lore.kernel.org/all/cover.1764982046.git.nicolinc@nvidia.com/

Jason Gunthorpe (3):
  iommu/arm-smmu-v3: Add ignored bits to fix STE update sequence
  iommu/arm-smmu-v3: Ignore STE MEV when computing the update sequence
  iommu/arm-smmu-v3: Ignore STE EATS when computing the update sequence

Nicolin Chen (1):
  iommu/arm-smmu-v3-test: Add nested s1bypass/s1dssbypass coverage

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 65 ++++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 43 ++++++++++--
 3 files changed, 102 insertions(+), 8 deletions(-)

-- 
2.43.0


