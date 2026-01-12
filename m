Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB7ECF45CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bRCzlNxgfvH7doI4VA88lvrMB5hJt+MkYXLrz6zbJ0A=; b=VNMO65NIsjuYIITsGs54yz8THZ
	Zn+YBt3eVwvMkkgLVatnPzZTqccM6/R6XXKspmZ9n9dxVnuXGssVEvO3FbFrryiWjZn08v1O5/bnc
	SxP0rXWTrKj7H2gbMO8w2/yFjgZyUV4OWCz8d2rR3w+5M5P/tDI5FduwysDacSy8qYExR8chgPS0I
	4UrbAYIkt+fE3Be50OBzZDFgynGslH5axnUClL0tQdmP2FgqOrS4dRDQ1wELvyqeaNeVE7wXIE6qO
	zu1oxbO21H5gnaVkRTE0rJcv+yx8FhZDlhozPyQDwR0MaujkyIKeitRXw24FSbr84k0JfgPTq6j/Q
	JeiTWLYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfOPN-000000069mb-2GOC;
	Mon, 12 Jan 2026 20:21:01 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfOPK-000000069ll-40tg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 20:21:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzk+h/joUWt/xMkeJ7OaL9iXVpex1DIQYim1dOOEVhALgyes3nR5SehwhB5IH6VW8vvFl28It8xJMaHkG34AqZjsZB5+SGmugU57cw8uoUkk7Xj608WSVa0/WCNGb4FPdhNwUmdW/ilyIS2TO3SCa639mx5be2mV6J1+bwlrBv4vzSEeX19JqhTfWinwd5YGNhwbPZjhBSgJwrPr8og/23qtFvoV+0r1nb1Bswiz0YXLDwROi0z+B7W0g2WCvmnqMDyS1tiZhZmPe1WXvnVNT3iyvIYNQGSMR8x1qFpfi+Z/mHTwzIE9zjoTxUkS6O6yvVeu43QfNn7sK7RhtEf0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRCzlNxgfvH7doI4VA88lvrMB5hJt+MkYXLrz6zbJ0A=;
 b=Q7WhGE84evsInxJiJr4ngNKC7ec6+MzfVxsYxXRVv/ZnYHcMndgQGK7VAJbgF0zfloc23wVZod4oSQyQ3sjo1rwnlGw8PVlRQdx6my6LLfcR7u1h2j5xVi0gCOOFka76PKstYDmZk4m69YY22nBRMB6HZkRJ/u4in8l+V3WrOScaVnDMlBdaEKdS+YSNgAQvWMuX2BmWK6IsqrZVim/bqVF/hq+5Ppa1SDsntH0IX9JthyPybAE4cMKPkaFIGv75WuhhT/SAb1zIa3jgtteY1ChRR9bSq8Zl9yauDPNdzo+NmY/98P3kSG49EX1Z79694pn/B8alr8rAi/DcV8bj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRCzlNxgfvH7doI4VA88lvrMB5hJt+MkYXLrz6zbJ0A=;
 b=KYJ11VUJF7LLYkzMvSqga89byIYisKPbd++bkYD/h2GliWsZFA+HbJkCJZaVNiPQiXVGF/FJCtq2ZYLR0c/baJu6feMSig87wlsBhh/Bv4OCOo6n24vs0geUvshGh18+SCqo7AorwhU4ukPdoojVNIOOIfwZw8fhdMx7/HR8I/SOnoJbm7Ffx2BReX4MnxjPTCV0A2l7bBKj0kLQxDsJpwTQLa7aRZg4bzt3zFJzMGV6oU2/qoB8vQwlpNs/oG9hLPXA9w7RMl0rT4646d7zA1azGRPVI43+TKw+Tk4Wpg6gCk04zPyV/GLLVCtYuNAj6mec8CtgEF9V04vI7Uob9w==
Received: from BN8PR04CA0064.namprd04.prod.outlook.com (2603:10b6:408:d4::38)
 by CY5PR12MB6251.namprd12.prod.outlook.com (2603:10b6:930:21::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 20:20:52 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::96) by BN8PR04CA0064.outlook.office365.com
 (2603:10b6:408:d4::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 20:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 20:20:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 12:20:31 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 12:20:30 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 12:20:30 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jgg@nvidia.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>,
	<praan@google.com>, <xueshuai@linux.alibaba.com>, <smostafa@google.com>
Subject: [PATCH rc v6 0/4] iommu/arm-smmu-v3: Fix hitless STE update in nesting cases
Date: Mon, 12 Jan 2026 12:20:13 -0800
Message-ID: <cover.1768248467.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|CY5PR12MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 2842e97a-4278-4ebd-0427-08de5218150e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?544T5l85wRJT32lD6e/+7G3tpe6Lzxt+Xk+v1uwwoNiTIZQa59qNwdZer++b?=
 =?us-ascii?Q?ZSi+qmCgUcIo1UYt07NK9bE3oEVR/A0g7DIApHcn4i0vE3jUPl6YQrkeTlJc?=
 =?us-ascii?Q?e8e1QDofcOKKs6lLo2E2q/lhUm9GMETbRoyUMbhMe6etkS7Uu6LSjqn/TXs+?=
 =?us-ascii?Q?LmsqxewgHfCC63cr0mTZeoSYa0fR4v4hJn1R8ZHJL51wM3dUbPGiCasTAo+X?=
 =?us-ascii?Q?gvyN5M8LL4590sBJJboXvsNUMNONl4hrGXn6buqlxWrI7Q5DDzQTg4DFTnRs?=
 =?us-ascii?Q?M83T7SjGIidEmNmSDze5+25kFghyrH3EI4lgDrfR85mtuDfkXfeZzE7M6vdr?=
 =?us-ascii?Q?8dg2OmcRXj3zaOKGdVQYm38kdL5tLK4TT2qKbRIcvcgNZP2MtBeC/8OxTiFM?=
 =?us-ascii?Q?/yamqWaDrwVNKgoXupuHPGlxRXI0x1C0L4/mg94BVmizAgAOJotwf108Cc1J?=
 =?us-ascii?Q?cj7iHI8BgiSVZtLIpjSo9LR/jo+/6Auhoidv10NX2fNIUdKJwNU5DGB14tPl?=
 =?us-ascii?Q?SQfdoAw1w7NvqxsYG3pIFCJd4SqMyOFZzZZbMVIij80w6c1BVaCep8ncGjJG?=
 =?us-ascii?Q?TTJ17ZKyobhAJtxueeTMuzsbocFnzEOE9UjM72eMMfvm5Y09KXxuTRHQFv8R?=
 =?us-ascii?Q?g7LNeHQljS9TU97Uqzf+iYNX8PAtfIXvgrmhciiN5zC3xVpvZm8vMBBAAahq?=
 =?us-ascii?Q?SArrk/TWpnv6IggEJHc4/Emz3Py/28Dhn6nvIx2vpGqHEe5CRqvz7aoKIpi5?=
 =?us-ascii?Q?mviV53UbgeiHWwll5fo54CI+mD1OxG33kYjG5MEuZx0/Qg91DjmQX6SMA5Q3?=
 =?us-ascii?Q?oStiEzOfC9T/0Ip2RzJ89aPHsY2m4MYhDPA/AefhOc+6z7HJ0bziKF1MNJp0?=
 =?us-ascii?Q?+pe9+Jsxv75PZIkRVkEQ5/dvf9wCA09h4l4pQg+yYwdy3P4MRoZfUOZbEW0C?=
 =?us-ascii?Q?awwPVqfwoiMExtgZrGWZMVJSaVSrTMDPceUrpIEO+6P5yeJz+Tn+gRo2HxoY?=
 =?us-ascii?Q?wZJ4bb3/dq9+FLSXrsQXJTPxPCieKhHc++IbWk5z45zSNLWUKuQ4mWlRP7AM?=
 =?us-ascii?Q?gEdNPHhG+3Uyypok6XeBYO6Ujb8mQPmtrsAZhA3iG8YS/y43g1cCBWVBqiMI?=
 =?us-ascii?Q?lLd4/jGPETwO4Wye3g/y1W3j++gFUmPEDMHqtk5emVeU3Ri4QkSDuyvcrjag?=
 =?us-ascii?Q?dg47EEqmY/hK2CCycVUp3jBf0p2qunL7KjRBKxKpVNyfU4UKkbsxkYwSDbF9?=
 =?us-ascii?Q?sWATKHS/wAU5RJz5UASzkkVERENoN7/iDIZn+qxhtyYL1uP6p1/a/JHlKloN?=
 =?us-ascii?Q?XlvoH10VCJV5DE/yNwjgK41MO9laTaoNFuErBfUNsn2ASKJLzOPUT5+G5Iyc?=
 =?us-ascii?Q?YUKustqUXX9oOeMZBRd3Tb9YQX8O9OsaPJabE0/BnY0RIvIBVYY10AEWkxy5?=
 =?us-ascii?Q?wT9kWiwkhgCXaDtTJgAJ1UQrp9CfWjLMx7vdNih499rXq6H+1B9kiWNNwWQu?=
 =?us-ascii?Q?qTCZgQV+zKjP8pU7jqUU85EYFeYmK007IsysyqPcMO4RSwUTgYuZ+oFn0BBe?=
 =?us-ascii?Q?W00xPq4d1DE0rdbv6NU=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 20:20:51.7353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2842e97a-4278-4ebd-0427-08de5218150e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6251
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_122059_440677_0AD472C1 
X-CRM114-Status: GOOD (  11.53  )
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
v6:
 * Add Reviewed-by from Mostafa
 * Update inline comments for EATS
 * Ensure S2S is not set when returning EATS to the safe bits
v5:
 * Pass in feat to arm_smmu_test_make_s2_ste()
v4:
 https://lore.kernel.org/all/cover.1765945258.git.nicolinc@nvidia.com/
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

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  4 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 78 ++++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 56 +++++++++++--
 3 files changed, 128 insertions(+), 10 deletions(-)

-- 
2.43.0


