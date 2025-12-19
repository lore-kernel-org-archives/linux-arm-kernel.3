Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38190E668A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 23:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/MZCrX/Qu0kIJenTHZbSgiA4wGP09pCaf3KwrNptGo=; b=nfQyRcz/1q3X9GiMYiraqv/dAd
	iv0agtENCr5ytCcjVpkTNF6bKSmlMQzbS5q5gq5t9LQUwcffRH+XIXd3KQUPpmc+zIl+KMz2j3q3i
	QZ7XAKMr2F3Y34Tf+iTYmGcNyZv6/2b2y6M7UD+ZMjkU8+pXnCLbFq0Zm72+brVkzANpLNakYXQX2
	6qz6OnIc+JPYXrh5vg11S25iBgL27BQJNFm4nn+qNZBkZ9+pq8VhvYLAeJK7LaW9bGbuVnEn/lqCO
	c0pGRni/QoP0Pyy++plrUaw2bbIbVug37MTRs5tvuNCJaepPeDU22RbMkUubbDYYTO78zsXHtul3/
	04qeg2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWjfb-0000000B4eT-3mvT;
	Fri, 19 Dec 2025 23:13:59 +0000
Received: from mail-northcentralusazon11012065.outbound.protection.outlook.com ([40.107.200.65] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWjfZ-0000000B4d2-0D9u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 23:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVM0P5VHcyo8lCvIVMwsPLjtxCTGZ9o6CCxPEtiH5ER/Q96L4wLdeq4Z9SmkmxhhEmNltv8pOuqQA5l7Xg3uSsC+AKv3+56crXO11sTY1AUYYUJq5FizWQKY19cod3aH6lvFox/b70q4qSYA5rr8DWPbvwbbYGRsaFeS2BuSKG8z3HQzmGuluC5xn6FffXCJZCCbhbfbk8axistxISi8wB2VgCTPZRVqbhK5ZbVQC1AxnRu0nVozWg1mKQDbO9kxqAbVF6D4t6zBnSbp9C/MF46Ud0/7KcLZ+9hZ6uDV6vhKjYArfhu8quitKJ4oDqy+5bZOTiOyqR+ka20VmoRMUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/MZCrX/Qu0kIJenTHZbSgiA4wGP09pCaf3KwrNptGo=;
 b=Guxm9CBI5TJ+qyYUTMcXL0o66Zh8/s6t6v0TPRXTT/MWor7tF7bo6p9wkLYZ1SU7GBVc40/F21Mh6yJ9a0XWjhIBSkorHc49H2rQ5iox1oHN1mXISo8+gdsB86OHQ4S5EXdJKpuvEVlO1t2LgtPwe4UmEpGzGbplLjnhqhrCWaQLE41umJFgIOvfmoKpvOOi0JgyBC9soBcYYgiZoKLMXXjKQ8E3aa1cI+fJ1xxwOaZ6mPYF++H5p7toXv/bv5cUO1PkduA6R7+HfAqf96Pyqlup8+K3Q+mApacnqWrWu5+/BDiLS93QoIvq8zmcgCPFBquoPhHO5Ss40Kb+jSBFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/MZCrX/Qu0kIJenTHZbSgiA4wGP09pCaf3KwrNptGo=;
 b=F/8NWbz4NwpcN6W9bCG+g2Eq4w5Eo3srO0i/V8R8f4oMzUQGsmIwzUSHLowg8b7JnjbRj46Q/tubtMiMrrsm42ZS7giuJEM8nbUki2hHEWkRpRKCZt7iRqzS/1PVKQnaDAr9oJn/40cNDWqnm/+JC+BhqFCpTApGC3dh5cnhhrv4i5yfLPDUQR8wvGL7lgfYGS97OFDOv3gWfT5YEhE2OACMVlq2oFvMRh179YexSxmGqsxCRqL31x0cYAdsOX+j3Hny3AWdgjKz3Vuh1onCKCcOrVn6QbCSgROolDp9ag/TFsPXiGrYDUNDbXd0+w45tiEb4hMCmOFWxTTtVNVpXQ==
Received: from DS7PR05CA0096.namprd05.prod.outlook.com (2603:10b6:8:56::28) by
 DS0PR12MB7876.namprd12.prod.outlook.com (2603:10b6:8:148::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Fri, 19 Dec 2025 23:13:51 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::8) by DS7PR05CA0096.outlook.office365.com
 (2603:10b6:8:56::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.7 via Frontend Transport; Fri,
 19 Dec 2025 23:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 23:13:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 15:13:38 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 15:13:38 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Fri, 19 Dec 2025 15:13:37 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <acme@redhat.com>, <leo.yan@arm.com>, <james.clark@arm.com>,
	<namhyung@kernel.org>, <irogers@google.com>, <mark.rutland@arm.com>,
	<jolsa@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <skelley@nvidia.com>,
	<ywan@nvidia.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 1/2] tools headers arm64: Add NVIDIA Olympus part
Date: Fri, 19 Dec 2025 23:13:24 +0000
Message-ID: <20251219231325.2742580-2-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219231325.2742580-1-bwicaksono@nvidia.com>
References: <20251219231325.2742580-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e509511-416c-4a8f-66b8-08de3f5445a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r9aXxNXNv6bPtcHrwW8omRrruwqcUrB21SLuxzkeCbCHdWhY+tga2hDzHu2d?=
 =?us-ascii?Q?fajJ4iE+Rwk9o55llFCZCaeJIbebEbLq+Gxfq4xsOQ5hmDCAQhUUH05ZUEpA?=
 =?us-ascii?Q?MVJw1sOsEHAayMnpclhYnHfoP+q7dopq4DfrZSDqyjiaeTtpVmXH78/zXUXa?=
 =?us-ascii?Q?dXmidaG6rs5oRxVODxE50u2wwsbW+RDm5sKZy/Va8zh1s8qqJCpTDNCFdRaB?=
 =?us-ascii?Q?nGecp3MyaTUs3SDvUeeMtiR9JsJVALf0P4oNsFODUZV3G1KyKg4AJSUReABH?=
 =?us-ascii?Q?BygMPfzaGq0xYl2g1U+DBNEsfM6SCQ5FoTbqZvl9GUVNUVKDLn8LIbVM98fL?=
 =?us-ascii?Q?yvo4hiR19+aiWIbAixhh9jvz0ZWjNJv17xOuLEI/urFf3xbIf+QCT4Kiqpjv?=
 =?us-ascii?Q?Wk5CNl7xx/SA5shl3PzelXZAHtSvUTaxY44EQIBP+H1p/iqkCbapKHaz/DBv?=
 =?us-ascii?Q?l3u+/obK4wz4zIH6oWM4cXiagSiTk/vfagQIHRzo/RIoCo8EzAgSgxDTqVQY?=
 =?us-ascii?Q?0/MlFLugVAzsnUpE1WjW+ouGsKsTFjqwvgrGEiqzVcIS009TzaYmkSWoW+2B?=
 =?us-ascii?Q?5zfoGtJwa1FM6xF0XqSVkpc6BwalUnOTm97w7z3ac3BDMJashQh1Orhnuij2?=
 =?us-ascii?Q?fe/+iZsRODOUhQLWQ93t5z91boZga2ZjYcX9zqLaoR/A2ourF7DCO2Qh+wUu?=
 =?us-ascii?Q?AfdCoRe69LfPALB6Ar4xAvMC/KkXWKiHqTxlGfHtuC4KTelRrBbVKaRU/sVv?=
 =?us-ascii?Q?urZrlAIzw8ntYtNBRE1V7JT9USrKRTYdKY9BF+KIYMlpdaLeMuRelkQ2SLAK?=
 =?us-ascii?Q?lxQX44LhcDoQJs0VtkyG9r4lcK8fCadA0NbY540vo9ZlcmzlTau/icu8b3Zb?=
 =?us-ascii?Q?ZtXjYIDFm69nNbu+636SD6JL2RPUwPvpSY3BO6glZOdMWd4AtcVZDTnh8xKS?=
 =?us-ascii?Q?NwtzPbgfJuKCqozMDvWyeAe4MN7eCTvdcEd/fDES8r6WJYOZR5b/JGZslPmR?=
 =?us-ascii?Q?fJvHBk4FfzW1/mkJf2FvN/9l/Zej5v6sbG/9ZJ5aC9nrnWbFBt7beTAu4lpJ?=
 =?us-ascii?Q?5lxHrwge5ZNu9Mn/R2JG+9U1hlwXD+DmTO3fhjX5qijmJNd/cDVN3EOpNKdu?=
 =?us-ascii?Q?bA9Ug1Q7/dChkhOdIfEUahKjdowuASityDBJa0zhc/N5FfPS11B1wZYTQGxc?=
 =?us-ascii?Q?uRvpuEwDzVYEfVRKaS50fvXinanXpXMtUPYNnTZYoFKEfUr6PyePiHlYEXWP?=
 =?us-ascii?Q?uQPFqq6yQKPXvBlRj3E90JKIdlG1ele9oMZ/Q/X8Ziy2DQg9tDrUfTYofXpB?=
 =?us-ascii?Q?/DDGmNN8HQfwhCTHQ+zC93mqtJ/nwNpHS+tRZ6/Ogs1/7FVge0OEyx2jo2xU?=
 =?us-ascii?Q?wOHzZqeYr+1tRO0zpbykuiowEDDXKsIUGc4f4yKMYWPyr83w8FUBiW+nXhEP?=
 =?us-ascii?Q?4PUkOB2nspW60/prNomyR1L+03GFQwcLuLNCu3V5bSaSS3NQRUdyvfx9ZZFT?=
 =?us-ascii?Q?FN9geiWoVy2cdGCGWsf2WRY09FTs+qBkyRVxlPbXV2rqSRtEhGLnQDVFsaza?=
 =?us-ascii?Q?TbEda1/MrUIEeSJl9hQ=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 23:13:50.9826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e509511-416c-4a8f-66b8-08de3f5445a3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_151357_092778_4AAAB956 
X-CRM114-Status: UNSURE (   8.25  )
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

Add the part number and MIDR for NVIDIA Olympus.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 tools/arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
index 139d5e87dc95..45ec0d4fba71 100644
--- a/tools/arch/arm64/include/asm/cputype.h
+++ b/tools/arch/arm64/include/asm/cputype.h
@@ -129,6 +129,7 @@
 
 #define NVIDIA_CPU_PART_DENVER		0x003
 #define NVIDIA_CPU_PART_CARMEL		0x004
+#define NVIDIA_CPU_PART_OLYMPUS		0x010
 
 #define FUJITSU_CPU_PART_A64FX		0x001
 
@@ -220,6 +221,7 @@
 
 #define MIDR_NVIDIA_DENVER MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_DENVER)
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
+#define MIDR_NVIDIA_OLYMPUS MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_OLYMPUS)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
 #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
-- 
2.43.0


