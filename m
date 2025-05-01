Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8823EC3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 00:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tinXA2xoCQcIKMM3d3bTFYrC8mOUhqhQzr6uGnYc1y0=; b=e4JqqniZ+CjzijnW3IdZj8P+QA
	JF9Mal4jrtczbLBwxUZNPpVga4OI7ZfMPgumAKvWeV12vJCrERRcQ+yfn+VRSrbeabMTD5E0eM9XY
	mCuBCHduKPOGxxpJVvt0SC/jBrx9IOJ7DgYQ9Gcaeekzk09+7Foyy4jbnD+Zqv/Rz57O9Y8zzIY4q
	kjonsAnBWr/LvX5v+s94VYYOmq2hooHY3iiDp2JdUZKmxMmbBtCMwH0cLXvrs4qHw0yUkoigVpw/r
	XI0ZGBCrxsWcYvxiw4AYMoLNVxmib+x5D/RlDgbgpB5ZcNvKcWs8DsZb5Ll+e2zwq3YYcAvs1bwHy
	4su9hGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAe92-00000000NwB-2STB;
	Fri, 02 May 2025 00:20:48 +0000
Received: from mail-bn7nam10on2060a.outbound.protection.outlook.com ([2a01:111:f403:2009::60a] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAd2N-00000000D5H-2YFU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 23:09:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBWx9RMxvu9RcqUufkkNTYz1HqbqWWvnlYan2Zx0FyE5BJOAAN4mLwwe7jeHmZUIk4AdR2J86866RPpN6NLDzG980P8xi/ChPtkDeu/lR9PjI1j+RPAKxCk+hGKqwvQ8KQH0edudGuasrYYZ0AlQoCJHjK9FbuO4JUJAL9LkqvBHv+1u5u4DVbNTnCGWOg5Qr/qRK4Hd1hMEQTOK7wfvLXPbLL/vHmndN4uTmQ2oVQU8xhCxvvZIPWxyuPs3OQmPy5JUfXhbM4xIrnYvO/WeMo6BGy7qIWrb085aKiioDbx6HWSvpB8suY2/a6hTGaHWlVOPalngJzPaPow3qy9AAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tinXA2xoCQcIKMM3d3bTFYrC8mOUhqhQzr6uGnYc1y0=;
 b=DMxmch5eq5kV1uae0WEFtOwBMiKmDOHZZQSv+US2UtlmzASJkcAJydmKhNGa89m6cLWhP+bS5Uq9CHTZRu/ursutVFkmosXhst4VtKzV3juEiP4fj89Zv9UW+m+b2zpWhUm/RttlvaFLd4Mk7DipYijzSdJcf3UPC7zVXR5+wnOG724RanrXAdOmsGNHvsiSNBXF2dd1sEZeWY1a0Xewi3d8SZGgag5Z+zKdSPI9sZjjEwepD5OgvCOPwHxIe1Ms9gSpkgifx6Vq+2k/qsY11NmRh+//gdz43ErIYHDVBHJ1SP14mwa30OA1tbzUGNDQSAG+MjBx4U8G+Extchogbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tinXA2xoCQcIKMM3d3bTFYrC8mOUhqhQzr6uGnYc1y0=;
 b=rvGeRQTWcCPo30CsfuoMQ/gGxDTN7lPdgN7dEfPL6RXASR/BVKhwApnK+3vgG8u4hpaKzy6mH3xmWChNohcp9DbzbCO9d1xwkFwMHg63KHokRzT/V/RqfB3b73Trqz4f2WZ5KXo+KG5gmGCuoJy5gDD6LbYIysooIdPzupqng3A8/2JhRAN/IdZePkaR+p1dD65Bi9gHT+wpkXij7PzOFRx96yZBRBqBPhfyDO8mR4Z78myIxnaXp+FnjEMQfRfoKJGLMz0ODroTc9F86nJcG/oUNsRMOzZyfr4H6+58Y8e+9vc/R1rQug4MdEf/3fcR5O5XlG821jPScBFqr+N7WQ==
Received: from CH2PR07CA0042.namprd07.prod.outlook.com (2603:10b6:610:5b::16)
 by CH3PR12MB8308.namprd12.prod.outlook.com (2603:10b6:610:131::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 1 May
 2025 23:09:44 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::8d) by CH2PR07CA0042.outlook.office365.com
 (2603:10b6:610:5b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Thu,
 1 May 2025 23:09:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Thu, 1 May 2025 23:09:43 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 1 May 2025
 16:09:28 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 1 May
 2025 16:09:28 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Thu, 1 May 2025 16:09:25 -0700
Date: Thu, 1 May 2025 16:09:24 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: Re: [PATCH v3 22/23] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aBP/JKyZlskIdS/0@Asurada-Nvidia>
References: <cover.1746139811.git.nicolinc@nvidia.com>
 <5a67688a9675e7787660a51774b3213094875028.1746139811.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5a67688a9675e7787660a51774b3213094875028.1746139811.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|CH3PR12MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 418e9754-6edd-4a42-774d-08dd8905427d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HvAMC/2GdcHF10JRjzPjFnXXKdzcZAyl8P1PiLs+s2183ag8RENcazcpPNE5?=
 =?us-ascii?Q?YLNOsZrCGce0Jf/XqtE8gBXxC31f8ufKA/581XVKMhHK/+Vfu8v6Yt4vecyl?=
 =?us-ascii?Q?6eZWO/WUc/KZUZLPfxN9edxjkXtkHH8IiP4wjculDPGBrcQaJ1tnQcregQof?=
 =?us-ascii?Q?vnaR9grqqGEOe3JSzsS3ikJf2Thr7q9sjE50Y0t1QNarfOgJBX9WR+HPUJ7Z?=
 =?us-ascii?Q?dGfMyBvT+wGCgPUr3bFLBFkt28gbBAQY/kXWytGecdyGeyv3c9QQUB2djJtA?=
 =?us-ascii?Q?T6n27niGK0BUWW++4J+PxzIVy5Fs0BNkyMhmIlO5zemM4wLrE1waa1Q6fU14?=
 =?us-ascii?Q?orNAtbCfY4VCG9jDcxMbf7SiljkG5DfjuRsq0zXt/fKjoNcsR7UfPgmW1FW5?=
 =?us-ascii?Q?S4DWEeCmVZDvyJ5E63V3jTJTPhRUkoDmb5qG1tJpau+y0V7QEqPSveVB9yMR?=
 =?us-ascii?Q?98ZA6jnghzKsauoEXgoXy1yC2TIpLLWTsC6oBFLqbXwNQwNtkozGdcj1gvGu?=
 =?us-ascii?Q?MXWJ8oQ247r/+2xK+MD10cwHTZIpZh6BFJXdIxO6ljL944eXSpMWHQuqBgWq?=
 =?us-ascii?Q?1Afr6j3AGE1OMg0FrFgD5xslzyFKn44fzBPU8avysNqf6J8vyjKQ4DAok51E?=
 =?us-ascii?Q?CxlMl3AmpfefVFmoymlCOVwBadX9pnQQEkQ+kJ6XYKdcQuUfr3CjUBXIKd3K?=
 =?us-ascii?Q?NJxdTT/ECRe1m9+2Ev7HSsfZVNp4bXeEuvDmzG7PC3fcd+SUInCf/fSTxvrM?=
 =?us-ascii?Q?y3j5m/qHj7mTBm85UvJcObCYkoax82lpujWPhll/4/ueuorN2sF1d1xLdsSC?=
 =?us-ascii?Q?GsQi9O3Wjs1mg0RhC/6l1aw7dPOfT5+Vmpe5VEPAtwyT06i5PKMBPjTqEw3a?=
 =?us-ascii?Q?+nfEXmieBArEJkylWgyQwsCxRTsVEe4w4X6Ap7Qm60O0yBUGT0/zYGsZ1HET?=
 =?us-ascii?Q?L66oYiZOjRmalb4Ei5lIocLnkJZTBH2rvAfGCuyPPSA2rQeTbjyCaR3/EoLj?=
 =?us-ascii?Q?9GeYhK0ttKddanvfgIsdGmmVMgAngauQfvwd0Lxb15x3S1RJweHoI+gzB2sN?=
 =?us-ascii?Q?Vkq0OtZCudy8w0pprLTmRU/eRQzAR7xjn3A4ZXN8mpfc2yzCsQrxQXxqv12Q?=
 =?us-ascii?Q?/eANig3A7f00B3Aac6mIaAx33EF5y6mDPMmAPJ5Njth5c260nX3/uiS/Agk4?=
 =?us-ascii?Q?TsPBKpBHVxwCiiqhRPx2esZTV3IsiLOWSxuDyABrMasxVxshFQs8S2ZEePv2?=
 =?us-ascii?Q?cIyI7RvSZpAG1LtvqxW5KOKHDDeiqttJA8kqL5c15hsuuxWdmAPZb4BXdETO?=
 =?us-ascii?Q?vRbyA8dLjuP5sDJ9sezOC2quWpIrUJU8890Nfa8jt06yPxksPhXHiPDPYDmC?=
 =?us-ascii?Q?/w+6W8MTrVkvKaklRZAAtLcwHrDlOJ+naczdL2qN1KyhxygKRJWdI6nRhFrP?=
 =?us-ascii?Q?EvIoUl2hz9eJtPz7+P5ChcjrE8wuUCC/Hgy8SHI7oEI+MDGPCLM9S0p7LrUZ?=
 =?us-ascii?Q?17WGKTTVUY3cKbj9SSHQ9bsfoY/e590JMvAy?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 23:09:43.8236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 418e9754-6edd-4a42-774d-08dd8905427d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_160951_641964_30B0A687 
X-CRM114-Status: UNSURE (   9.47  )
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

On Thu, May 01, 2025 at 04:01:28PM -0700, Nicolin Chen wrote:
> +static void tegra241_vcmdq_hw_flush_timeout(struct tegra241_vcmdq *vcmdq)
> +{
> +	struct arm_smmu_device *smmu = &vcmdq->cmdqv->smmu;
> +	u64 cmd_sync[CMDQ_ENT_DWORDS] = {};
> +
> +	cmd_sync[0] = FIELD_PREP(CMDQ_0_OP, CMDQ_OP_CMD_SYNC) |
> +		      FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_NONE);
> +
> +	/*
> +	 * It does not hurt to insert another CMD_SYNC, taking adavantage of the

Oh, ignore the "adavantage". Will fix in the next version.

Nicolin

