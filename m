Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F294ECA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vcz7E6rg7mDkodQi5uDNQ1QWRcuxfyIzjw9R+DrgHuU=; b=Oq7umdw0XUiCs4YvaJEMK7mWyV
	ItZvdhzXjy5jDlXblM1FpsYzrmauv04N+w80cC8kcRhTnbmMHFwxgWmFR+TGTVC90bnh3hS/sx8iB
	FRMqragvaktMVlf0WclwY7NFaAlDfqIrgdW1Eqf5B9UmwapBKBGdQqRKVgZjrmOz36/+R6edYIAUv
	olOb/D2RDZNyZHcgXJUUcn47H/RnLKI1emqmN8Qt7FTtbrcfnYELqTpmzO5azk7gQILSSGKQDCM1B
	UBfNJqIQ0CN9ruG/Ba+au7Zi/BkmM28eX1UCLy64pgVuZCymaTLxnVVOFdiIhcoSfVwWH1WWFrpWU
	AuO+3/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgZq-0000000C5fN-086q;
	Fri, 02 Oct 2026 16:57:42 +0000
Received: from mail-centralusazon11011068.outbound.protection.outlook.com ([52.101.62.68] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgZn-0000000C5em-1xc5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:57:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxuv3yyxvk2Aqqn/G74KtWcYJtqCHwcMyric17g/+uvAaZ6G1L/OijM+AmcdThKyP7eu4tIpW1Mg48AeTkpWuwLNPhKRhoEvgnVYHQjCQ5SyEY22MczYEf+VJcV9lKMur+BXt6qdV5KS6aCVX1edUp0tj4dezRTJu2/QUoci2dsdnJCokfALve9yqrUk+qVekgUNaJHYdg71aUcXl2VFfpnNCi/2baYuS4o1RlRnwJOjW6ZSstO5awlm6LcdPWh/KLV58e7vQjxZtAWGRxpzzw7NUat7Ja4LJ/QHaKFXqn7Yx5aE4GdGLmrLlykPXUoeKyspb1vK0FF81lLbG3wHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vcz7E6rg7mDkodQi5uDNQ1QWRcuxfyIzjw9R+DrgHuU=;
 b=QFqqsnn3asCmG90Ddm+5Y8NrXAfEPqmCXSc6cQHAIFPEaGlmKNVARV/4zIxZUg0b5DZQ95aVcLL0dA63DSHtFcHtazTLxsZa76+co232kwBvZjjg30X3hfLHE9+lKmPvDmVl5k3y0pObMHB260SxXb+1N2vuKu52UVKRLce5V/ZyRrCZpjOFIeUkCv71yls3OBuoCTEIW1EUAjajrEYxbfaKuH2XsLJ//WWrJlXOHwclRBMzKGLmR1aUtbqdKY0XNGsQ5ANYdi7KfE9P/68OW06mfvXzxN36pY8/yLoZGa3QOhmwBpf27bVKfPA41T2jT0BzjFfvOdNYIdxkAac8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vcz7E6rg7mDkodQi5uDNQ1QWRcuxfyIzjw9R+DrgHuU=;
 b=UATf6yHDq92M6edlvVjmOhgLQx97Fyos88LtnVx+l5Bn1gNSKBKq/tpLF/h5H+vZrYVIhZevCSi4vpEJYHdAk+BDq1DSQ821hLphvxJoZUYJqXcOyTkyYcMe9xuWhjzpJ+BA79kb3nnBnjhKfwRcs3VEK81VW6Ho6HZoPrzHXds1baCxHd+vDbUtbCskt9yF09qdu+T5ALF0U25PFRmaqQ/SPzqioYg5nrfu3t2CpkTa/iIbDw89R7CzYR2ccrNbfkVkCg/LGLBKlOEmntRdF/2JtPUys55hQVPLPY5YRAWp6OnKdlu0G15zuUIzU5n+VOQ5L8B4RihMjmfvVKMjDA==
Received: from PH7P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::25)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Fri, 2 Oct
 2026 16:56:56 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:510:32a:cafe::a2) by PH7P221CA0011.outlook.office365.com
 (2603:10b6:510:32a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Fri, 2
 Oct 2026 16:56:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 16:56:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 2 Oct
 2026 09:56:30 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 2 Oct
 2026 09:56:30 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Fri, 2 Oct 2026 09:56:29 -0700
Date: Fri, 2 Oct 2026 09:56:30 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Peng Fan <peng.fan@oss.nxp.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel (AMD)" <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v4 2/4] iommu/arm-smmu-v3: Support shared SIDs in
 insert/remove_master
Message-ID: <ar/iPpHX2FJ4UswZ@nvidia.com>
References: <20261001-smmu-shared-sid-ver3-v4-0-06b34fb2e691@nxp.com>
 <20261001-smmu-shared-sid-ver3-v4-2-06b34fb2e691@nxp.com>
 <ar6Vou12yzoZ2z8I@nvidia.com>
 <ar+HLlB2oyiz/cgD@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ar+HLlB2oyiz/cgD@shlinux89>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb0b9fd-1755-44b4-9585-08df20a62a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|7416014|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info: 7vxMDf9k+O6hQF6CHmEcQQbpsUGHHquUmfbdjU3h3QJ5mF3LMBmo3zz0Yct3al83w2yFf5Otf5xax7gmB6/HKD/QhlF/w6kuGbai2Wr+fnAqK/gA/y/7Ms9HxtBe+9FoDBRpL/+g1OlQw+wUkqiyd2PvSdR/TLB43pgVnT8i3duGysWaBG445Jzbu5htHI4xYjep2wm757Wpqmx3U4J8+Q7YribLiUDEMliH0ufIHEj4dfKJhkmbe+9f/70hjh5yOCL4V6CBJOAieKYm7+Uq88g1dWE6/Y1jPlFMkHO3JM98Y0LOpF1/4Cj0Td4Srwa7AYq8ZOHDnypwxKZTlBVJtXnJ80T+h1XOq1N6hbyX0XkUcRdvxrzu32eNoqEECxt6WbXwB26Ju8biGM64Jd8BhzE9yMevHk3Srz2e9SNi71kLS+akBRTPKnfvEg8zG3Zkonn9GYXxjNLTRs2VSVidjSgvNIdHEyrBQKXsSkixdptjz6GXOaxnCEP0rlmuV8/0qKdkKPXGySJRxxDrxbT5hsnXp4IcGfzZ1vMEn+JkK1GGGp+4nYkBRvXNsw9EMsB3BrnTL2waoHXtOvkwo3ud8L4/xeUMdIXCeIMb9OLqOcgUOuw0Me/b+LYAgNoS8k8YJjL8MJGe12O9jkIP7tISt4aiAO4i1zNLPz0lsbl/C0L/nbZg1xOnRvl+CAkhfmL7UAhZgoIGKTKtbmgYT3V2DQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(7416014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QJLk4okNNVkeceeynISsSpvrFL3mgg2Np31AXcu9CgyCZiOcVlBC7VPAb68JrMAcZ00JlozelLEEwbYkXwzIo1uF95nfjKFnFxuGgMjpGp7Tl7+cPpuVlhoMkoovbNfkOiieOcegd0OraodxTF+gEneouGYuSoCez1r5pVVpI+r9tRK19+jYMP42Law0MEs0DogLgVz329H58pvi5pe0ondOWFIOaXz0WVc/uwGXDi2jjEDiPvMtZh04pzVmchtEMHtk+KUzY+dxr9NQPavleszWi4wpR/+CmDC5ZwtPrYobSJTjai9zfLwHUSiDGWikVtmt9rviy9m2OtrUtbuBZYlXz5oqx0SP3flDFk/EbMrFl1S3EgAMmepoZVoV7mok7CRGprrGEtnsvuaymCzhWQ0aeklxGQ8y4QvMZFsTLqVGoSfzCO61s5BmIne2Bz01
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 16:56:55.7761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb0b9fd-1755-44b4-9585-08df20a62a81
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_095739_509928_57237691 
X-CRM114-Status: UNSURE (   9.36  )
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

On Fri, Oct 02, 2026 at 06:27:58PM +0800, Peng Fan wrote:
> Ah. So I need a patch list saying:
> 1. iommu/arm-smmu-v3: Allocate streams individually. Change master->streams
>    from an embedded array of struct arm_smmu_stream to an array of pointers,
>    with each stream individually allocated, to prepare for shared-SID support
>    where multiple masters will point to the same stream object
> 2. iommu/arm-smmu-v3: Support shared SIDs in insert/remove_master
> 3. iommu/arm-smmu-v3: Group aliasing devices into the same IOMMU group
> 4. iommu/arm-smmu-v3: Wire up shared-SID STE ordering and feature gating

That looks right to me.

Please also check Sashiko findings:
https://sashiko.dev/#/patchset/20261001-smmu-shared-sid-ver3-v4-0-06b34fb2e691%40nxp.com

Some of them should be gone once you fix the out-of-sync issue.
But findings like lockings would still remain.

Nicolin

