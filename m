Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D862ED64073
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 04:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gN4x8eN8q67VGhqmn4NdVfdtKNEP1XvN+IKhZtsMFOo=; b=JWV+lf7DQD2Bgyi/2FWlslsgLH
	/GTnCdlEHV0Dnd0trKuorzltuYa93Hxy0otlx/adELPRs4n7zHktJr9jfRilb4664uXCcfCbc9p33
	AxYDdPAxRsEW0W7aQ2DXqUtP8IU8lP7Uv0S9H1Ssg8rKoiAu0yxrDI+9bcqRGZcxIvd/dkCYt/8oc
	KRZhkwrA/NdZjO1mlU8Rj4Jj/1UiT/jsDw2Iy6/viLpbpWMctXNPLgS20CQVYLQ3DpfSQx9C9Uxzu
	H48UNZd1agPDZ8QJ1+U3ziJbk1uhztyx/SFHBKgnq6OXJFFG3ocC3cBpU6EOJNwZe2I75hltncUGv
	iuROFy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVj7V-000000069Mq-27in;
	Wed, 17 Dec 2025 04:26:37 +0000
Received: from mail-westcentralusazon11010035.outbound.protection.outlook.com ([40.93.198.35] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVj7S-000000069Kr-2owY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 04:26:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phxy0tyWLeDcCTvc2lK52IJ6g2RhFfDRAklG2Vg1fZOmOf04mTZWPlkS9zi87WqaxgcJ8dRhEjJx2BuGHUqKVw/CB5ivLeATor69SvrZZx41+4OPxoiKBmyI9SAo5RvMYIfQgKVlmTrgvA8kCIpVnmQJfKU8n2wLgG/RSNn/EyPNp9mLl+NjctF7I1/6ojQYuF/JOSwR2yr9emGQqOAnNjl4SUm/JJdIxyd7l34WllUM/NqNlAeMahQ+pgUwy/D6DrM2FMVVe4FrrUTLU54gsDSOEr1RaFK8z3rIe6ohdejSZhbiFTLxVU1Nm1raLQcTc1WGbspR3cY4P1bIR8yr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gN4x8eN8q67VGhqmn4NdVfdtKNEP1XvN+IKhZtsMFOo=;
 b=oIVo4v+9lBWG9CgRzcziLi+Jl3fEiWxI312MBBjtMY3U0LISaUyYdrAI5QCFNN1YfUqKZy5WMg5nHWrJ5YCWi2MgPmU3GHMYkZIC3IQjPuJEq7Jr6Uuy/pjgIK1RT6puLUyJrHlqTV09AfGbOIAT6c3XLPd/8CAYo0A2LD7b+8EtMxgeOjSi7T2THGmryEmJOUnEbJ/0NdIsdU9r5ZB6X61uUyKt7/fGFzstL2HdIvQRyveocMl1xn1d77r3yuVfmUw9nQtJb6ahqp237HucP4pi/isqhg8uKntsUH0zqgYSvkLiqH7mMuHDcTtbbxOSUlXaqU7lIQNLAFCHGhmldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gN4x8eN8q67VGhqmn4NdVfdtKNEP1XvN+IKhZtsMFOo=;
 b=Kp7qp9smxawp0bI1bnjlEd5adeJDM6seuj0KY0y2ye14hbYxujPyAz1/Air/aDw0Iu0Fav3hdAfItMcwVX+OQCfM+45l8NXHrfArMZzCzEsl9siwe9EOf/iZCeXHoEUDLWGUxuC/7+VvUROm/CWKg5hsPH9aApf1VBaHdVjETMva8YIbwSWuyWc38ZYjS61pbXNpc2MQHPowe2fC8RAD/wEjwCcWpL8WSwLoiGbA5O+hK6arpauvU26IjN40ES3302uYsACaV20j+6gwJ/cpCUWUFgTDpuuLVlacDyW9LNasqUxaj7KXoUfWDj2cNQI7sD+ixt2y9xX4bRmQDj4chw==
Received: from CH0PR03CA0044.namprd03.prod.outlook.com (2603:10b6:610:b3::19)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Wed, 17 Dec 2025 04:26:24 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::7d) by CH0PR03CA0044.outlook.office365.com
 (2603:10b6:610:b3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 04:26:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 04:26:24 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 20:26:14 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 20:26:13 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 20:26:12 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <smostafa@google.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>,
	<praan@google.com>, <xueshuai@linux.alibaba.com>
Subject: [PATCH rc v4 0/4] iommu/arm-smmu-v3: Fix hitless STE update in nesting cases
Date: Tue, 16 Dec 2025 20:25:58 -0800
Message-ID: <cover.1765945258.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 137b730d-2dac-47fa-3a03-08de3d247025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8yPS7eQWvw6VmxPFKOrbJUE8Z+6uWvhNEvYaMXSM8+pDfGmYtIhsbHq4vFeW?=
 =?us-ascii?Q?cgmOWL9+NLHVZnwL/d+dXYB2j7ZAlE241jYBgd1PTCD0m2jdBTjfRSV5vFqD?=
 =?us-ascii?Q?aIDhpH+yxSvtMrtkD5Prh7HB1/BLXaCsQjVAxeCKL2YVPPRnuByOeNwjk3qq?=
 =?us-ascii?Q?0CNNvoF+V392P5suqxKholuLBjTKD2lOObazzy5TlzW9l+QJTxy1dTJBXy8C?=
 =?us-ascii?Q?N9co3DmxFbpbWYcEcgFhdI9rX/vIS6I0rpHrcuvr4I7LfSXMEIBNhgylf4dW?=
 =?us-ascii?Q?vF3un5s7h3a5gWjwZMwmA8LhK8aMOvYc4WpcUT17SQLbp7twkcaretqmg6EC?=
 =?us-ascii?Q?DNfws+rPEPTLCYzzEJ+ZwjIKET3fj0wn8ox/XEnsj6VVb7GF1bEFnhOJlC4P?=
 =?us-ascii?Q?b4IUoya4BxfmnKFO11s4EZjDKFHzmlFdtfuSiuRlK3SXBA+QHRP29pN6e8xv?=
 =?us-ascii?Q?qQkjjMTW8pxkFviALSjw/IddM6+jRRMzq8KyV330UT+Q5qELefH6qT5dY8wr?=
 =?us-ascii?Q?uTvlceoDm4obs4gZug57UYwa6PQI2xpr9aEeC5ppCCTKuduqhU+Rs36m3YsM?=
 =?us-ascii?Q?p3AR/uPxAPEBWYZdnyb5f7foNRKAr/1eawKR6On6zyz1mCfXZwjp4UUl/6T9?=
 =?us-ascii?Q?XzPBLwVEK4VtnuY4i6QCZPamrvcqEyo9AnyZbRXWXJnJYtFrjhUj8eXbKHJ2?=
 =?us-ascii?Q?FxYoQVKEx/C8kr4A0JXkZ+6Cr+9D5grtl4OpNfSM0Ht7bOnvb9qFxTJ2irxD?=
 =?us-ascii?Q?8YBAc6cmw9CGWMWNb/Ik5PXrUmUakLmeHJN3ZYyjVnupRa+djlOGmblzqBtK?=
 =?us-ascii?Q?vGbkQvnpGFwLytKarZFM6Faggmiq0HYzL+1wMKTAN4UTF+WOEG4pw42YhomH?=
 =?us-ascii?Q?byRtrdLbyMm+Sh1x0TxHzutg744z1GHW9rR44uMNgYLA1wuwDzCxUYL84JXb?=
 =?us-ascii?Q?/mlpbaatuQiekI9hTP6ueS87LnS75NI0XGoasSTyNj7Ei75m6sgZVKoRT4qh?=
 =?us-ascii?Q?gRgWqv6q+wvsVaSSxqsCYavAYaMn/UBS63YZxNKOTJ0qYJz3WDBmT0kEuWHf?=
 =?us-ascii?Q?76yZ+CmGNHExDc8p8LlOyAoeTOiFCEkd5LMmMjz5agAO1o2O1jKi/LUOrcLU?=
 =?us-ascii?Q?INFvstd0GREKKgv7GbcHGvqMreUhc74Gcw3mIQLQn7wBffufDfzoIzUMu/EH?=
 =?us-ascii?Q?HvzVlj4OrzFqY0BCI3/7m81rGk1DE7o6iF/Tku7OkxXGR74FzlWyWhDmsz58?=
 =?us-ascii?Q?AV4EmEEKxKQrAtyRmnnkxT3Gn5M4g69XljuOjxUTh7z/8N+nEslF9IDGZNCh?=
 =?us-ascii?Q?oH9NpSWhmR7YJZgoIYpp6w+8h5RJJAtobV2Flh2Alp2lMYu5hglfLqnfMldf?=
 =?us-ascii?Q?mpBcrfEQG8cmuPuIvYegb1pDkE6vRzlQ7V2B/JgBvATEZljrJbwWlEKDActP?=
 =?us-ascii?Q?DYrQebVS1V+yJ3qO2kkNFNOqUmo6s3ZVo7u/NqxNu1CaMdsYwhrHSUCZCiDI?=
 =?us-ascii?Q?QIcC98bmFkb0IyqzSyTqZAJNGp8yscynbhF4NtsTSHO0J/KHNdmIXU4iMNuH?=
 =?us-ascii?Q?WElK8hF/srT6LkgUCFE=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 04:26:24.1404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 137b730d-2dac-47fa-3a03-08de3d247025
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_202634_737037_CA4C9FE7 
X-CRM114-Status: UNSURE (   9.52  )
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
v4:
 * s/ignored/update_safe
 * Change entry_set to void
v3:
 https://lore.kernel.org/all/cover.1765334526.git.nicolinc@nvidia.com/
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
  iommu/arm-smmu-v3: Add update_safe bits to fix STE update sequence
  iommu/arm-smmu-v3: Mark STE MEV safe when computing the update
    sequence
  iommu/arm-smmu-v3: Mark STE EATS safe when computing the update
    sequence

Nicolin Chen (1):
  iommu/arm-smmu-v3-test: Add nested s1bypass/s1dssbypass coverage

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 64 ++++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 46 +++++++++++--
 3 files changed, 102 insertions(+), 10 deletions(-)

-- 
2.43.0


