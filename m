Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E41E668A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 23:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iE8sTWgYvHYFzOgO26pI/qN65gsLLyon20fNXuNBtE=; b=SPSyrK9ECDrf5sGbNsGbycgFQJ
	c3cSOUIJvkKvkURGQonRU5NVior7xaYe+Ex48GiyRe/7R1yPMgtibvLi5NTybJ8o61jSODLFzTIY7
	105ftqlOOoFLRm1vbIqnhkm9n6TbkELQm8vL1lz4dc/BUOEtklxefg+8iIep6gEi2bZEnGK9JXzpg
	8IQ1eXRPiaKVvBqjM8fLmirC/JZ8yhEXfAoHGO8ZcqcXW7kDT+V1FvJ2eeDcnThyjtxN3H3Db6BiU
	TgRKXL91HMSM7w3gw8NkcyKEhMBRtIXvjMiAzULqTovnfXXTTihPDWPwH8EpHsWcOuKYFH+z8uIQ5
	3m66Tn7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWjfi-0000000B4gp-0tL7;
	Fri, 19 Dec 2025 23:14:06 +0000
Received: from mail-westcentralusazon11013006.outbound.protection.outlook.com ([40.93.201.6] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWjff-0000000B4fd-2wis
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 23:14:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNJbN5Y+vQ6yhrgY73KXvENzZrbMn3Ib0h0vkeuTgH5RDJQjLHgFjMHqWWWfV1N8HWsRAsLqwmIwOC5A6ijHLda8Pb2pZkP6eKxQomdvUQhbqt+qnuf/Pw+0omfqK0YKD09mEMpBE2oyXdfIklHbNN+svid1wMFTbmEXWtA/HSF8mO9dqafN9ufv5+3m6AYRL878aOiDP7r+yZ/WZC7QOy199xJK8+Hk5CLMUVi9g4bTILApxmM+CXlijUDO76R17bj5TpOe6tzy7+fHZJjI5qUW42ODA/Unw7rh2fcCqvjN9UdbmfCZboWAnq1DPpcJZTDTl1CknnOjDU4QBHjCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iE8sTWgYvHYFzOgO26pI/qN65gsLLyon20fNXuNBtE=;
 b=jGCgX5ZgIP+bHAFLrRyp3bCotGZCUuHgbFsVPVItVu6FWTL1PQ8YhsFA3EbnWrrS6Kw1cgOj5/4vtEp9xvBqHhqc21MgsRuhf+7R6fA07j4awxD4wJn/DJMm81bhAsHmrUqwS+0eyaAB44RoE17B1a0LZOyobS/guvguNUz/BkC99xBPGLg6IGfIh5bFdgcxJrhTUzl9n2IR9HbVkbcW9vb9qndTnGmYkZZT8OBWjQRhgdDUQrP+E9yUdsJiRwxV+iJp3TUm+WgOLO3EsuNPTj/UKv1N15a+oELCpEj8QWQHoZASXK4GoPHHqzOhdt3snjZrztikILA6iXUau438Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iE8sTWgYvHYFzOgO26pI/qN65gsLLyon20fNXuNBtE=;
 b=Gn3MAUAky+R+YxuE7IJdmyvBHsRm33EO+jkzXg6i6U6fqSoYYj6KqMSGtnl4JR0wmc/JMdaExgb2Rg/SuCCHsfSVVDMgf+sIfT9j15rfOUAY9qzIbEG/Wlcd2Vu4+HHYUKg1LHpCYVVLSN1XSH7mqukR7WpX51f6Yl5qabSBlao/M9MP+4wBaraqpZoo+fbOdsuRHj7HdKLctQlQt86NRWPKVN+CRb6x1y1MM++hWE8If/5d3sr+DgOrk6t/F6PFEMSObwciSmMQNR1a/76jPsawkoHkfrH2tDZ1g+dHVpcf12a+HRQZ/j2c0G+w/5+/pFBZ5X940Yk1P1bCL1xuCg==
Received: from CH0PR03CA0287.namprd03.prod.outlook.com (2603:10b6:610:e6::22)
 by DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 23:13:57 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::98) by CH0PR03CA0287.outlook.office365.com
 (2603:10b6:610:e6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 23:13:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 23:13:57 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 15:13:41 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 15:13:41 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Fri, 19 Dec 2025 15:13:40 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <acme@redhat.com>, <leo.yan@arm.com>, <james.clark@arm.com>,
	<namhyung@kernel.org>, <irogers@google.com>, <mark.rutland@arm.com>,
	<jolsa@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <skelley@nvidia.com>,
	<ywan@nvidia.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 2/2] perf arm-spe: Add NVIDIA Olympus to neoverse list
Date: Fri, 19 Dec 2025 23:13:25 +0000
Message-ID: <20251219231325.2742580-3-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219231325.2742580-1-bwicaksono@nvidia.com>
References: <20251219231325.2742580-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|DS7PR12MB9041:EE_
X-MS-Office365-Filtering-Correlation-Id: 3051ae49-f986-4da9-13b0-08de3f54497a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YUMjsS5MDS6yWXBoioLxnQ6qTphTkOdP/c7IGAKWQH2YCyFtbMoaDm6qpIUM?=
 =?us-ascii?Q?yyfFWMcsqNA5VKWMGINFzlSDHxqc0kg7SpqvbUi76xyzTBwt97FZcF68XLHF?=
 =?us-ascii?Q?3ycAomVdlg/nyquvdIG/If97jdV6FazfTLpNWLhA6Wt8XHXlHjEPfvFraDzq?=
 =?us-ascii?Q?NJSSSI4pAU8rs7wPw4NSLHO+KkEpVh87QNnwflgR3HJZGP9KqVz7tKCDV7m/?=
 =?us-ascii?Q?3isYreO2QzXv6WMbCJNa1xJfDX/Crdz6R4c3u4Yys7lCgMwFgTu2f83LyN1g?=
 =?us-ascii?Q?fnRkUakbone+NHRLzNJuDbKKIqLGnw8JiKAQ7vb0eVUATlxn7DOqgFV0wYRX?=
 =?us-ascii?Q?InbY9PG4ayRzLAKe1d4sCuJzwdS+KqhT+PiHaP9gRbcPFlwazl5IKMA3yaTd?=
 =?us-ascii?Q?nkpWI6Ji0/JQWAyIIgv1zUINkvCPmPQCsvYqxyLWsdFHXej96NZ1Z3nzd17f?=
 =?us-ascii?Q?96akXsaFTV7uHfuyZu6c0fla3QwxxgCsbdo0n4+KDNfFWTGrhJSQsvx8bSCv?=
 =?us-ascii?Q?DECVaR09+9ZkSs3Q+vfJYtATtHyVG7vsBus8n6pUj9Nm3Q52vUd83LRU2u3s?=
 =?us-ascii?Q?la0sR97IsKJWHIQdr7GCNgDXX3VH6bXjM6B6xl55yxuSJgPqEk2sqh+gjymi?=
 =?us-ascii?Q?QU4NTgy9Wge3lS6t6MS46UjMLcpU/zzLXFG14IKnWYXcemdJdynJWAS73d1c?=
 =?us-ascii?Q?P4xECAI/r/pCRU0aH8fi936/NKzMPermkNAu2rmN4SWBv12jQRTPPCoJamVX?=
 =?us-ascii?Q?ZKU1C94FFzI0WBYSzXuc9d1VvKhEsr7pziAmPNGucHOTrq+vM99TQxpplP/M?=
 =?us-ascii?Q?D6lkh7tWWU0vg/SbzxRiQv/ir4GlTXoaQcQ4zwnNehDMgcCkHAFMaZFkODbl?=
 =?us-ascii?Q?AgmeWeOMAADpvIEQ8vxmmg2Qlurh5bEgm9gWh7V3gHdBqVSDm44kUOQYUtu2?=
 =?us-ascii?Q?H6cvbJMaNTAEcrcMYhih9vaO79PP95RoXy5ayF52bmO8oSqrThbTrdaED9bk?=
 =?us-ascii?Q?hhGt4oDFsjnQG+GdgJ2eqk5J0AXVYbyEewy9CnmIIx2zAWVa7IJ2QdIWy6xa?=
 =?us-ascii?Q?u+8ZLMf98PA5gmUE4vdRourCXxOH6jDGMU0UpWwh/FrEa9cERK1rgM7jhH2k?=
 =?us-ascii?Q?8NSyDypHe+fOQ9ug1tw5lfqXu0DEg5CgCFasaF/XhOCdsZ5XQix5hyA8cpar?=
 =?us-ascii?Q?Q65NwftfswVnwmIuFCLfJ9zf7Un9eqiBKwfauu08U2kT4cWeHTEzYGkrilj0?=
 =?us-ascii?Q?OFNUlHD33xgR8OgjbPY3Q5NTtdjQQyf9IeCyDKdamU/ztcNx7uQnwXeMeUMG?=
 =?us-ascii?Q?eYDOVhZL06qbKTK4UUAwr8PTyEXpa57kkqA8ezkFW3hI3Hz8a0rd18iaCg2c?=
 =?us-ascii?Q?euj8gaN19Ijdx4dgUGh0oQr8IIrB2TNyITo5xviFJSXzRjaQ2x940JOW9aCq?=
 =?us-ascii?Q?cN4tzjFOJVggv+BdP/5YOMdBylGZv4dmhVwayrOvJTgEANKmxC913YiWSguk?=
 =?us-ascii?Q?BK3Xs8/YVy7gzKaLw7IYXGl9vMVusHqzFnEkYGCa9/y08DzYvdNRC5/ILBAF?=
 =?us-ascii?Q?XGtxH1/jEjCXiZZBjbc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 23:13:57.4111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3051ae49-f986-4da9-13b0-08de3f54497a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_151403_745193_D094C94F 
X-CRM114-Status: UNSURE (   8.32  )
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

Add NVIDIA Olympus MIDR to neoverse_spe range list.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 tools/perf/util/arm-spe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 71be979f5077..75208935d2c5 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -579,6 +579,7 @@ static const struct midr_range common_ds_encoding_cpus[] = {
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
+	MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
 	{},
 };
 
-- 
2.43.0


