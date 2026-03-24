Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F116F532C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 01:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnmCTrDMeHYriH5d6Xmzv7d4/3KX92c2SKYbVpbkJ6w=; b=eyNGMG8g5ffZh/fdoLb5CaguDg
	Z4kK1xAyNc6QhwMkRonBCKlewE9ekY+KqxRNEYArTMb5udN7eDnVXXpGYdgklVlx+NbFkni4foefz
	MMgoQ+nMqUjXv777X5VvauPMyozUo1fnIN+t3nt5cSZo1VEYBf51y2JbChtGiM1A52Y49nwnXcbE4
	P1xefjcZqjBNwoOBQ9DBJeVXvua+uWypzYJzEhyERBp0LgCKR1LyyhoXK9hK2cNW2BQmNHjV4Twjo
	T+F7v2gZGaDITrqXAX0QpkUSfakbZXg7DFb5LI6NU5KLup6jwNaVwQC/5jTWmodWlbgoORUP2nkxA
	SoLaG5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qbp-00000000JEP-253E;
	Tue, 24 Mar 2026 01:31:05 +0000
Received: from mail-northcentralusazon11012042.outbound.protection.outlook.com ([40.107.200.42] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qbg-00000000J8C-1rV8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 01:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcMnTP3h7e+bnip2nQEI5nmimA5fawPptR9+1yaFq2MupgMZXOVPC+lXDsJVSs6BeFfUdalAjpHw0zyxoSkW/2aZ5TxqLkLeIt+WwsrfgHsckBA6qOK87GbEAJeHm88bkk9QOBhSSRiI0EMKyvrZup4f0Zd3k2y7YhcdRhPoJNs8L/h37nBwx+fxJBtBplF/hr38QDrZAU8H9CPt/wAOWYheibGSRDrNkbvNR6et8TDcwZvkjpFj/E49U4Pi89uUYEZ5sm90vYHvKARNKECNdcw0SiqMREBxo7Z6POWm4NTeE4u/3iRMz2PM+/U1iHoQjvXYsdM1H+Om/iAmUOEnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnmCTrDMeHYriH5d6Xmzv7d4/3KX92c2SKYbVpbkJ6w=;
 b=Mb/Vf3KxuHUxqk13FkIlQ4ulRMoV/vnqDMNWnzTctJPuMPsIO3P1ZXNlv3DTlStFBm0NFvYyhY7Wkmr0XeH9N/O3TtFGuIQsQAYwBHYps2QMRoK9eThh1Y8pdy7pSQUseAj4jDcx5PX5zaMzo1Sz9hFmn+3JV3Y/wbhbbeh2V4U++JHz740p8VbgEqDcSiTbSKPfDDhtr57eRqhjQEgnEJQbxspWC5/3NOi7OU4aEZWgtCtzX2xsNwNjat3+Nfy2Ej7FPHWholwzUWNyyXb7A8B4/zPyQ87EAyz/oTG+zJxopnImKZV+PhRBMoheSf94vGLKjK/eMnf1l+q9edD+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnmCTrDMeHYriH5d6Xmzv7d4/3KX92c2SKYbVpbkJ6w=;
 b=pDupJ+ZXh0tShdySQCGIYdy5R4mActcYUQFq1c5G0/mGus56AC4cCyxY21MH22vDBke1Mguj6uJnxwMwMVxLFv10iNn7Uf+CoaGEnbl33Xey8WZfomuUvjRamuLXugqlr0irh53Y89f+ibmpwD2QR5KUj0/EUhe6rYTT/dDISUmMm71cZRbhp5HL0XhV26dMinUfWbiPx4QO35wXt+Nhb49i++nKGSyr/4iYi7ygY6IMPZPdArTEe5L6v0UZhBipU0XFjZy1zhCUEo1SWWJDpHYoQi5OBE8Uj/PDK9bxt4TeBHDI/ZaEREFpweFvUS3ID9GyGB5/Wv2w/K2kMvaYNw==
Received: from BN9PR03CA0879.namprd03.prod.outlook.com (2603:10b6:408:13c::14)
 by DS7PR12MB5815.namprd12.prod.outlook.com (2603:10b6:8:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 01:30:44 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::49) by BN9PR03CA0879.outlook.office365.com
 (2603:10b6:408:13c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 01:30:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 01:30:44 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 18:30:25 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 23 Mar 2026 18:30:25 -0700
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 23 Mar 2026 18:30:24 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>, <jonathan.cameron@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <mochs@nvidia.com>,
	<nirmoyd@nvidia.com>, <bhelgaas@google.com>, <wangyushan12@huawei.com>,
	<shiju.jose@huawei.com>, <linux-pci@vger.kernel.org>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v3 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
Date: Tue, 24 Mar 2026 01:29:52 +0000
Message-ID: <20260324012952.1923296-9-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324012952.1923296-1-bwicaksono@nvidia.com>
References: <20260324012952.1923296-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|DS7PR12MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 32cc17bc-cbf4-40d2-b86c-08de8944f804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: UlX0+F8ZXdYSv49fUzPeLJg/86IF88RJPu6nlZRKtS68TZDuR6aMAgrDnG0l/NlrSx9uKPUbBKu3hsWv36O567/mPyaPWmS85TRGNMS4iOgaZIWDOGye8yL7lFUUHm9Zz6YQHRWcWsPq3194GCanOX+vDtv2ZHIzxmqc/iwFVVHPI9HOjtYlePghTePqCHRpum25L2oSh0NEt9GdLXof5/k2KLdqHlu5uTzVSIMqmFqeBDi00kcJfiqjzPr9EGVKorcWcg+SoiobyyGJMCd32QmsNwu3qDy46SDAn+kJiMgrw5kqtB/um7hGP5Lr7/AUULsxu1ZlQF3N2wdCQ0pnQh9jVTrmq10dOFmcG7mFxLRDbzWVoG900c8RuAKEPyQhwXuiO6tnmILhiR74Xr/nBpRGlzgxPez6u6n5xKyFrYafbjBpmlZ9VCAOskQk8KKnADp1+WQQWkIxiSCJjX78sMuOait6lbycnnryz4btzkievRCyU+7FimOK2D9ic4Fib/unddL6JTByoEpFX6GAqyzDcQyT6wN+N95nFVIz0YYGSEwgAoL9wGkSR/sJW2YwMgRgCZ26w4YP0shhAWSSWUUHRMpkeRo8I4zgClNEKnSz7+sKtki+7DQC1mpUjfD4qGucBlnp+0L+DEc1B5s08WgXaHQiQw9wp0tNsIQFeggND1uz1pPaYYb2kvgVgqO1rki8j4KpGrvc3v2tEjSkrluMn9Xvi0BVNnzg5yPDirkq3paDIK9imx4ZlfwQBx46pMKUR2PFfhW1bFhf6jgA7g==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: L/7JJI5Bh8Pbmv5+n/i4xCvsPoX6pzL4wd8tHO8KjdK2ye+WnSURh46rg9bPuUyLupK6igAl7Bxd5XrII4gzTUDjmmcYeG1XZIjm7l4oGl8di6G9G1TC8XyUM3u1tMeeN3wjRTiV3/Aity//b/rjxfQGQ7iXMNa1I2r0+zIJQzq6ZmlSomeE/587Z9lLmuyuL+vDzymtjtNrnqzFxe+cWeV7UudqYw88KiZTYg2UudlQyOd5GD0P2kUi84JFZrqUT7KvZw45Q3p63VOnGd4Hp4hFD3Zqd87c+lUb3XXnIxYBkaaOxs27tQ0VuB3wK5x+vjG0Ip6s1CHAK6o/yX70q8Y0NXUd29/+b4UkTn/kkFxjbOP5FXKCLO6m8xbJs4Z7CU2g/ShYm2w4F+gvWtpUdJOJov96R6Wh3I0KVTIwFn7IS+0iKLoQcMiF3BXPwTQ9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 01:30:44.3244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cc17bc-cbf4-40d2-b86c-08de8944f804
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_183056_509400_2B332E60 
X-CRM114-Status: UNSURE (   7.77  )
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

Enable the driver for NVIDIA TEGRA410 CMEM Latency and C2C PMU
present in Tegra410 SOC, which is an ACPI-based ARM64 platform.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..3d0e438cb997 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1723,6 +1723,8 @@ CONFIG_ARM_DMC620_PMU=m
 CONFIG_HISI_PMU=y
 CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
+CONFIG_NVIDIA_TEGRA410_CMEM_LATENCY_PMU=m
+CONFIG_NVIDIA_TEGRA410_C2C_PMU=m
 CONFIG_MESON_DDR_PMU=m
 CONFIG_NVMEM_LAYOUT_SL28_VPD=m
 CONFIG_NVMEM_IMX_OCOTP=y
-- 
2.43.0


