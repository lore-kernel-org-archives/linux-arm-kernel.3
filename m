Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC54E668A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 23:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0hX6Eo6PgUdy74hH+oo4awc1ELa144kEX/S5NhHuStI=; b=lgUkIzmn/PThNfCeZVMgN8FPK4
	kya/i2buGQ8XHGBq4yxrU91v07R2juFXGHXflhC8AyjiqYBSgZ0vyt7kokEbI5hvR4JTIHbrZjy0Q
	ANzEwsAz8f3w9xR3KwXAzMIALG3Ojnr2yRNdGRj7Vd56mgIx97am9W0BsliiUrjLHHfoujYjnuZkA
	dxrnRyp+kwbf20vDECitjPYQSOoXqB8snI3A2mBet5B24zb4QqMi9ijUanbQKU4XYYyFL56gjBE7z
	RTvvA1nAHKeb8bwUzVccSul0c7Jx7Iub0hkYLFM2QWtG6m+Db1jno6FUgA0TStZx2IrXGMiHqJSrN
	smuf77BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWjfY-0000000B4dC-2PrP;
	Fri, 19 Dec 2025 23:13:56 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWjfX-0000000B4cA-04dl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 23:13:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIZLGJLzUh/EVerO8wXXEHtDUgG8iAISkoNQ7rfrkNlMqeYJU1I1IKZ90Z2JDoqTnqMPZ+UU8PEkzTjaLAOX0tYJ21nz79TQoRP3blpNRS4Wc4o1KzzAfFrZR+Ep8FV2YguuKjdqUlvEZA1moE1jRkql0ce8uSIcb5/pw2wkERG+cxmt7XcDMCQBCumk+kZYsaM/9RNeVRcnZ+3DScW5Bjk7tQym4/x2EqABkgm1KrbrASBPr6ucCE6TrXI3LohLcEgWmbePrBr5FxiflFToXwFrpOajU9D8b4TPQxbhYWvqm38Jiwb2aZsGthBQQXg4LBTOamNAMZwkWWMtDNPbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hX6Eo6PgUdy74hH+oo4awc1ELa144kEX/S5NhHuStI=;
 b=mQlCB4BVIo38r9wtqHOX2+BhyfvbYt9I1x4onGBGvRG5rJ4UsZMqMaAHQKnmXNPqtuuEwuTTiLghAUxh9fKNb2ctSay4CBpHlAOCYNh6frONibQrw/8AZmNXITrXh+KL0DgUWxGiQN/tUZkuLHTcp7LxdM+y8KlZrpci8etUWWYoXtfkxTWjymxq9pYR8oF/xoWgnP1EZ0E/KEqXNC7DOiJKyTV555mfchbF6F3kihcTuk4PiKvIDt2iM5WLIBB+YPJNPJ8HymnNkFnPmdQZ12jMpyVG6kWqym68q5+OxPlBl1Vae1TdsreNoMpmpKTTIwsH03zBpAYzvivcqvYrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hX6Eo6PgUdy74hH+oo4awc1ELa144kEX/S5NhHuStI=;
 b=WoC4DDJXH45ullir9IZbG3g65Z9abcFw6DQ+3NkSgIBIetcqd+iFqOUDQF2D1pGz4hYTmlsu8lptg/RGtaGfq6nl4QwHymHnyriZtKbfL7YY504VaXq7z4KTqorfaB51pJAGwogizaWjRb0CmTLNalW62+FrpNjusJdwmRLG/lpWpANUtwBLHoZDeyZg02DRgqtp8VB36uomodLgIZe3yI++GgdDUDdjpwG/Dp3fzJJrsw/9/hS8WBUINfzIabSVu32EUBRT4rBbdA4RPeCPwRQFH42ZA3vXBJ5FUp2JYYbQQDmrPFSyKiCvGzyuR93HBfwLGYyqq9nmRkubj3sTnw==
Received: from DM6PR03CA0042.namprd03.prod.outlook.com (2603:10b6:5:100::19)
 by BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 23:13:46 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:100:cafe::73) by DM6PR03CA0042.outlook.office365.com
 (2603:10b6:5:100::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 23:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 23:13:46 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 15:13:33 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 15:13:32 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Fri, 19 Dec 2025 15:13:32 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <acme@redhat.com>, <leo.yan@arm.com>, <james.clark@arm.com>,
	<namhyung@kernel.org>, <irogers@google.com>, <mark.rutland@arm.com>,
	<jolsa@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <skelley@nvidia.com>,
	<ywan@nvidia.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 0/2] arm64: Support NVIDIA Olympus for Perf Arm SPE 
Date: Fri, 19 Dec 2025 23:13:23 +0000
Message-ID: <20251219231325.2742580-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|BN3PR12MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: f2426078-5640-47f1-aa27-08de3f5442c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s7Gs4RwOL2JOwVf4KZri10MMqvsY6Uj/W9LMS5Th0CONeDq6S4PRJuf6GTvE?=
 =?us-ascii?Q?qkfSqfo2l+CWcQAqOCkz1mzOowarjoB5u15PGLXW3NHxIKJX5+mLHr7RmCH5?=
 =?us-ascii?Q?D9ype/QfAJLnjQZgw1F0ayYv1HEWIZynxIMYw7DV6IM6S2jQrXYboAjlW8zq?=
 =?us-ascii?Q?Pz3BIrrskByXsvIrsvgs933Ke+zNLS1wepjAgqJTV/iI5rL73FTgYs6uolnw?=
 =?us-ascii?Q?YFhs9NUHB1Cs8M8J69+IlFGt6YmFqzYsmZQJZdquSzfbI0tgXkwU84Netwie?=
 =?us-ascii?Q?UI/NPIPVrf2zmYg1XUigAh2iq1PtDl7SoLoJ7GX8lyMZCEc09qAWpJlk+mXu?=
 =?us-ascii?Q?up6HbXZgsj0ZGyFsQ3NvLGg30kLmHB1RSjCDbyzCvbq7IfkhwQMHhUSbT3d9?=
 =?us-ascii?Q?xWCiQtxH/i1/VoOsJCWZ9hst+ibwaxleOBdEUFhBEjSRnYy33yldo0YU5pz4?=
 =?us-ascii?Q?GlLKrciApaOnj71L+izMLRraT0mu580jLMiWH+xetXg5QM3K2bSE/p5YJVWb?=
 =?us-ascii?Q?tnmGogEfJgCD/kU39CY6PTtCE3ScFO5dEQP0DRa6r+hDtSn+5ldKr/F0A367?=
 =?us-ascii?Q?kTuTwLQSVTjfKCrc01HRXDMqtbLJim4ZmQEr+0tlBi3xnjgQvxfV7ll3HmlW?=
 =?us-ascii?Q?eFAp4xlnaeIhbx21zVaoNCrZU+1t2BvoiVeX8gm85g4Rs/PQIA/GhqsTMkbv?=
 =?us-ascii?Q?K2Fw7ZIMnnxxBV/bhLxs3aRkQedw0hM2DpqGcodSJWf/V7Kyukz/Yj7iMskS?=
 =?us-ascii?Q?TI6kVLHDPr9P3iRvxaJ/zei8TehzzZvE43MMJvJ3WieiBUC6oXGkHZWFvYGe?=
 =?us-ascii?Q?DeVk3QyN0kl5cYUPHlhiMY4BkwJYTIaRY82jTlumi28S+C8aS+YLnj4MyJ93?=
 =?us-ascii?Q?j3buUXmO0mdNFYobXopIoCtH+PwgdLdeleF9JZwNeywOkxGUrWmewIERbJvT?=
 =?us-ascii?Q?K/nVQ1sKAE7H5m99da7mMgRbmO0rJG0wB9rDIG0dfjpHPhtK8CGr6bP7agTl?=
 =?us-ascii?Q?hDoATa3Ct9evguNFDAbooAGkHVHnYnhiwoW6pw0MXQ3TuJJLGqG7cLxZKgWl?=
 =?us-ascii?Q?TPo/dpw/yGa1UBSLlMHpR87I18dib/JJppxifp/m/sPaTuIhwHFfVrM45hmW?=
 =?us-ascii?Q?jrttDGKbW14+LTy1igOwIBb/+wD1ElDSYm+tugC7qS69RK48/RiB9Qke2/ZR?=
 =?us-ascii?Q?80Kc770Pq37JU4IIb6UMIjheb0Ej5qjo4cd8xXQQPP8oRGTAhucloB5DYom+?=
 =?us-ascii?Q?o//D7DkFcGuMAg1Y393HO3cy6fW3RARxB8NLx/lWAAwD2sESRu8wNX3toGhk?=
 =?us-ascii?Q?Wr1L4X/MMGe+GMTeMoJCKF/1Yeu4kiPVi9FUc4yjoFoBS5KwQEJ/54FKH6nG?=
 =?us-ascii?Q?SyMF7w9xGZk0PO/jxTbUrmHcUkm9UB6884mPmtby7BCLFJA4FUs99uH6IBtv?=
 =?us-ascii?Q?Su5gm3sdN2fwEYJgO304TLv7eWTvcPzoWwMBuN83K1kuCGN1mXZyhxAcLIoN?=
 =?us-ascii?Q?rj1VqJHR5h98Zw7GBho1wI5CoF2KCyrFt7Tj78v0MlG//EULwwLLxAMI/d+X?=
 =?us-ascii?Q?Vg47j8Jf2RQyjetXQP0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 23:13:46.1705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2426078-5640-47f1-aa27-08de3f5442c6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_151355_053934_874B2C3A 
X-CRM114-Status: UNSURE (   6.98  )
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

This series support NVIDIA Olympus CPU in Perf Arm SPE.
The first patch syncs the kernel header to the tools header.
The second patch adds NVIDIA Olympus into perf's Neoverse SPE data source list.

Besar Wicaksono (2):
  tools headers arm64: Add NVIDIA Olympus part
  perf arm-spe: Add NVIDIA Olympus to neoverse list

 tools/arch/arm64/include/asm/cputype.h | 2 ++
 tools/perf/util/arm-spe.c              | 1 +
 2 files changed, 3 insertions(+)

-- 
2.43.0


