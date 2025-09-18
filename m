Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8784CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxa8kePjA8oPf8ZJQwqTD5fif5VzYgM8BwBlSKuZW0U=; b=yfJkFJNOhaZb8/vNI0Xu/H9BtD
	XTlfCm9b5uv0Abcx/VN99KfM48GSoC4PuqorN4IU+VKB77CJrmTQMZe0JXyOE9VAZVa+kf5v+1awU
	2xmU7h9atotS3mHskzfGKne2fphB8wlheN5yoMpWxG5YXxAvPsj0TeuYtmP3kSSzt9BHHXVtbIPel
	xdKVmfHenpc9+kh4IunQwrgMl9ZisF1p6n13754Qhb0HwbvmrcATe4NeDOqmFxkeYVgPbcWBGdJo/
	f1wAszx5hsK+29wBmIxvwWs2SJB/JdqYCI8ATsi7HunUj8grRzGzw0/P5xw4EMgDBAz/eVC7xHwgS
	opIFRJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEeX-0000000HX2U-2kjD;
	Thu, 18 Sep 2025 13:26:25 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEeV-0000000HX1p-0dYg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:26:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ej8znNl39a1m2qlWjzC77cPFla9QTxe1Rh/D8I9IrWA+PZE86kneeTZoNtkJiRuZUPt0gSuyes2Hy89BZP2CuzhIeKtKYv4xImEeIm4Pf+kM3gCtNL7AjrcS/bcSLVN1LD6pS9cV37YyK4LgHx0fC70eX88fr+/rWVv52daAtdKYQeId+VGGv75VJHqSx8phlBqpJspl5zpTHuQLn/1YXzdXAoejO6sM7JVU1QmoxQVN43n2y9RdyuJfUxU3OuNvo2bmLHfZ3YyYGkAbzvgR037ZZGXxHAoon0wVSARZhQ2iMza/XmiN+6qmIh8QsM8LFS4zwvx7b9aVXQP85h3dLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxa8kePjA8oPf8ZJQwqTD5fif5VzYgM8BwBlSKuZW0U=;
 b=pHvFZ1D6OtTJuyAhlPuBzXds+z5I0BIIWADINm8GhF51VtIlRm8L0PALzw0NBwPaWkpyc8+VbmVVdOJSVCXatQc33s1yOM25L6JVENeoZbe9ze1ecVCR2/an2F81SOlVt01u8pPJHQ1L8+G2wI0Ul1yujjLJF4w3+zqaNCnldWXTGIkxbt5ypbcC3tj8JpuutQSNw10GYFdRtKy4E/Q1kGnLiA3yYgtEoJnXcjhLO9RZwcQTdauEQ2ORVgnKrdzCS065VcJc1YfYtrv3u2p63F1FIvHkYTBFjcCRhz1XX2p9VmbcGok0MaMsg3Q0gEw49qNSFEPUb10EgOazA8qfow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxa8kePjA8oPf8ZJQwqTD5fif5VzYgM8BwBlSKuZW0U=;
 b=Q2OD75CJ+v7eXMtcuf8ACGiZV9DfmgMO0Mf/HK6fl129waIOKMRRxyLh2R1r5xGls2CSKPcvMPGPc0EjqjknVPGLvUwHN5/vwajDsm4KDlgM/CiFdH4ITf7se2IEwwBZ3/WIiOYfOYOyz+IVK70JwfyMNsFVq5Co87i61QZmLTD7OXff7J0WLd0ROPj/3voZ+Ucs/30GTLEnh+rYJfuxa5eMtdlemgbMQX00gUPhzSo8h3C4F6GecmELODfQDazujuyu+0b2BR6OA95GgjBG19IFSYci0pb9QXL6sQTXlsJptiwYQG4tKzba6QRbeeqG+ieBWMKRNFx3lFqNHfzE2g==
Received: from BYAPR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:c0::26)
 by DS0PR12MB8454.namprd12.prod.outlook.com (2603:10b6:8:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 13:26:14 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::42) by BYAPR05CA0013.outlook.office365.com
 (2603:10b6:a03:c0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Thu,
 18 Sep 2025 13:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 13:26:14 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 06:26:05 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 18 Sep 2025 06:26:05 -0700
Received: from SDONTHINENI-DESKTOP.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 18 Sep 2025 06:26:04 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Shanker Donthineni
	<sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>
Subject: [PATCH 2/2] arm64: cpufeature: Add Olympus MIDR to BBML2 allow list
Date: Thu, 18 Sep 2025 08:25:48 -0500
Message-ID: <20250918132548.1141306-3-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918132548.1141306-1-sdonthineni@nvidia.com>
References: <20250918132548.1141306-1-sdonthineni@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|DS0PR12MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b03819b-721b-4a37-69b7-08ddf6b6f144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BiWYVDP7VBoCkrjchsfi4//Sdm8IeToaMVl/5XQZrKIcXzGwOQ1nN+gstgSj?=
 =?us-ascii?Q?fXQTJFNwNuSU1LpgB4PRQgwW1CYgFVP07Y3rDtFhWQ1d5q0OsfAvjAZ7g6Il?=
 =?us-ascii?Q?ThLXu4yNWRUBkLFHQyxVnrg1XTkCiwZ++hFSIe3HJPSdyKbtUkVb1zJe38Bd?=
 =?us-ascii?Q?e2MVfndyBzTeWV6/mDbQqPdBnXHyUgLIhFd/G7QWVID3T7dhvXFlu0bPgr/G?=
 =?us-ascii?Q?YUhzhxwq3S5MWOoOLqVIUDOOp+3cExBrSXIYulR8XQc8YI21XOCLBeRUo7gr?=
 =?us-ascii?Q?8zcibAMflpLohuxqQ4oge7YV7agf4e0Tm5sCJSU+8VtUfmYzwr1owWW9VUo7?=
 =?us-ascii?Q?mRddzXsP1LKsw9JyBBeoOm7HhHFFPedLgPp4Mv0xYpfdECJaTsNcn8M2XBzD?=
 =?us-ascii?Q?GH+kFD52PNqjQyNbzYKEePJs0go/0jG9loabTB7Jof97mHM5XIsagRf5x7f1?=
 =?us-ascii?Q?XhrRXjT/ba86tjNV3Q6Zv94KrG5SgIs2T6ig/Q7gZFuarB1vQhtWmshw/Nlo?=
 =?us-ascii?Q?HFlkrMGMP7/PPoOmAUJd34EKDTUCJ4r96K415TjE6n+sEjoKPNjN5yAFzhBo?=
 =?us-ascii?Q?R45krOff25ExHS+6iK+HsKnhEM37RzYg6ZLxoC7F+/cTA2Dyd0fCukISZRXY?=
 =?us-ascii?Q?LPCwlqH4YK9Yb0U0XiiHfMfBPGmPkdUCTVxNVSL+neo1c1h3CqnJkanJ+FP7?=
 =?us-ascii?Q?MrYAIM1RAtGKZCa4AadEM6JJGproDPhU4AZVzJ0EaXKGZNkd2BrfvQrat7uu?=
 =?us-ascii?Q?qb0Rs6k3riNANNWRMMJENMrBdU7EXxnQln1Xs+KNi2ppvMzxJvJecreyHGua?=
 =?us-ascii?Q?4xuOrDuylt0VHyKTz6RnXnVIFUS/L34xUu3RKhIQ3UbQY6ne2XjLp/Gj4hW9?=
 =?us-ascii?Q?bBEpDEdyllZCmR1C0Y2OCTSBSoK8JCOEDwZTJUwbXi+F9wOb5d/IxwBaM6Mx?=
 =?us-ascii?Q?iXL8TzGAynZCEfEgNqnwRmmq9eq4deOfODuoXTb8Lb/sIfIGcA56i94bZQR0?=
 =?us-ascii?Q?vDlmwH61AT8yxYtir3LBxD236JgqiFIMI7MqJ4L6439Bw18ZduZUO5mNp2Hj?=
 =?us-ascii?Q?eS3HXB/PnCByUefE1+g0qesWdvTvvaPbdxok31dxeaWqAwmFR/YBMYLvBw4O?=
 =?us-ascii?Q?xGcUPu0/iL7D5r1SOtKQolTa1TEtjepZaZQ2rVBNT+4Kdila8shmHiTAIovh?=
 =?us-ascii?Q?FaSvBe25zMZfw7sRLF0zsqEvWOEmiOkQoQAAfEyFN3xz+Nmqt9bmKX4hA5ag?=
 =?us-ascii?Q?sKAp1eycfMLBhNo4R1s/bF5LF/P83Ew3E/L/yi6dBURWL76QB8y0xc79rNea?=
 =?us-ascii?Q?ZZiX1iMIV/CBcpv94snM7FGlNOMLuf/xov8HfdfuZWd1KpidhYrXsBWROK5+?=
 =?us-ascii?Q?+xDRE+R71a3132BBnntJmWc4sw4jsRaYUFB2leoaVcgfVH+9UME8+gIhl8Jl?=
 =?us-ascii?Q?NxZsUmjP1gVauAOdJJX4RtaHmZ2wUryepdJEIss005HyK7U2kIvWeZ7OZaYh?=
 =?us-ascii?Q?cBVaCDN8LVM/M9dDtD6VLhy928fZrggq7P0+?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 13:26:14.8409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b03819b-721b-4a37-69b7-08ddf6b6f144
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8454
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_062623_374952_48DE3EA0 
X-CRM114-Status: UNSURE (   8.87  )
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

The NVIDIA Olympus core supports BBML2 without conflict abort. Add
its MIDR to the allow list to enable FEAT_BBM.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
---
 arch/arm64/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index bb6d82b2f7584..30f45af3b684e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2236,6 +2236,7 @@ static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int sco
 	static const struct midr_range supports_bbml2_noabort_list[] = {
 		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
 		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
+		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
 		{}
 	};
 
-- 
2.25.1


