Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6379EC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIDOEICOt4x5hTo9wOxCSTq4RJfWI5CvqmdehNQoNPk=; b=YGyTHW6HE++5EzY91nLiEw6JOz
	eSZsEf039tikVbFlYtRj+dreoT4xME8zvgKn9Y4fqSGuM4jNs0vUy2XkZvPIbD7xTTTbHM8KGSoE2
	kyjc/b2378XNHBoFJUpwTuVPelv3fFLopInY9MYTwRR1ofQfoZY44hcbYKdOp9iA90G74EMNmBiNg
	jR7YiWWkw2PVLdRxQueN3M6VWpym3qkgrE/wRaGMib0wJYWY5Wma776jj7qYNxfQbcpmNuoYf8a8r
	mMXFH8SpCUDmpj0w3geBGeTx89Nu4rHGIjktFpB3zYdiLOG+0i0Ji1BiIVbSVqoLYJVq4P/0KE73j
	uk2tb7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59gA-00000000GH8-1Y9P;
	Fri, 11 Sep 2026 22:25:06 +0000
Received: from mail-eastusazon11011000.outbound.protection.outlook.com ([52.101.52.0] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59g7-00000000GGn-32Ax
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:25:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqKs0c07H+J8pSlTjDiWf5c0K2AW8SIrPt/9DxXGI4jxWqwhGkLK3Zn/5rS0T26mSt/bQMu+xLAHleq/1lw1Z0RxCv9ePA/Jrl7FRA7mtGWIrNHULSP0uP9Y3/y+UUd6gDwMfGeu8NrL6JE1lYTvNrPWYG8wsdl9j1DBT5Iufwltz90GDGDXt7bWSnfUIcmEPVK7wUTkZuxZaHS3KQd2DJIujTcjVrPdLWz8VkesoKKxs3A0sdyc/DZNcts3iebxY7ook2QrI8C1oZm0kCYy9IFxfXQFm4cVoYj5TElOaGbIQFhfLFNX2yXnVTSR8YJBu0evjH3lapX7nlYKOXGsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIDOEICOt4x5hTo9wOxCSTq4RJfWI5CvqmdehNQoNPk=;
 b=ckQ+I3h9+rLC74G8BkNIA+hztJSxN5TxRIx4olA7jfk/wWb+Kv/MGQ6HAGDqCHRajUAc53oRG5RC2cnSKKN0qJHLuUvegnqEn37sfKvr/FkYrYPsM+qMEq2Khg277nXjfXTf9zlFh3XtNunUyClv1X2pe25e+8bhnx67MmUFGY1PoCPx4xtla7JAJCta62DMrPjr/+XKzXcywySGQxcfbPlir+Sp80xiYtIDmNldHj4xV2Aw8oKpWDtfNJXeGDoqCIOZRDTgj6FaRgvJxNAi8V13ucQZHdotYaE9akYD92cp+eSpLSvi8e+cPl0NUDrWg0o2Neb5vaRSe+rGaeGL9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=uniontech.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIDOEICOt4x5hTo9wOxCSTq4RJfWI5CvqmdehNQoNPk=;
 b=pGx+G4aC0jprbrsZRCQCeTlvONygUrYG3ykJoyZKoJaEDDpDoolwVg4mwjBcNis4Wc5iAjVVsehRdOFOV/jT5YsUrRnv2MK3HZ8s8ySl+XDGX6buwiD5jO9VKLzgy6y2PcfLY9VT1ghCfb46wxcUAeevM1Iv+AUNg23GGHh4cfRV+favPZ4GxvzdRiZ6G87xrDmmjwMiOEf6yAK1wWLPW4It9EULYrqj0dDuFFTc9TyYSpRMc0vBTnzoeoCNYtUU7hodqNf5UeOup8zyiwwhwHU3jqcWhzsSFxAkeci3LJ2vEwFJej/Xg2h/QWgnao8Alag4uCX9YRpMtM9B2bBopw==
Received: from BN9PR03CA0253.namprd03.prod.outlook.com (2603:10b6:408:ff::18)
 by DM4PR12MB5748.namprd12.prod.outlook.com (2603:10b6:8:5f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 22:24:55 +0000
Received: from BN3PEPF00022BBD.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::19) by BN9PR03CA0253.outlook.office365.com
 (2603:10b6:408:ff::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Fri, 11
 Sep 2026 22:24:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF00022BBD.mail.protection.outlook.com (10.167.248.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 22:24:55 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 11 Sep
 2026 15:24:36 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 11 Sep
 2026 15:24:35 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Fri, 11 Sep 2026 15:24:34 -0700
Date: Fri, 11 Sep 2026 15:24:31 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Wentao Guan <guanwentao@uniontech.com>
CC: <sashal@kernel.org>, <jgg@nvidia.com>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<stable@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<skolothumtho@nvidia.com>
Subject: Re: [PATCH 7.2.y] iommu/arm-smmu-v3: Disable implementations during
 devm teardown
Message-ID: <aqR/n+VtlgpjJrAV@nvidia.com>
References: <20260910065429.1703706-1-guanwentao@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260910065429.1703706-1-guanwentao@uniontech.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBD:EE_|DM4PR12MB5748:EE_
X-MS-Office365-Filtering-Correlation-Id: c1446d86-e23c-4572-8bd0-08df105381bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: DClE4X4qXMNVE2R1X4cETnRrslVMjraL39BpzUR11SaAafXnbBykMVsWRmB2+BImluS2oTcTnjw90+pa0YdH5iClN++ps0/pKW/bzRtAFU+VW+fYjVdsvCzT+8kFDE30yBctmzjiCNc/5O0mWovgIkdayZsGeYAowrnnzcw+QfrgKXiSYKvfBPN6vJSp5kqUPji79ZUm8CzPkqont3ttQtxUpQMGzaJVKncKv7C9CNpcLwyoJML+s4kkw2Jcnm+XYa1iLkdHx0VDaDVd4P+jA5kWHuIgn/ouIG+epIzY1rltBieg8M0iovqDeVpVY3IOKnTDPHMW2VNQ99cIrlaJbnImTauD6/QWIMkhS7VoFvJFheKp/yEJRX7R2xhG9N9bTEqm1camPkRCnKUQyahDwpF7pmi1qxLwOZo4ubDSPu4qAQPuKGgO7bqvbfexkgfmjyu3nLCgnZ41RWHU+W8u9i1gV0cQlTYopsVxHJ3byCNyNzB8no9DgCavWTI3OFZ/cvY6xIoSRYo9GC3MRF4Hvr0K8Cwi8ncc0WsceyJfoUvLIgwHtRHhH4PxOQd/UEJ/ER3d2G3yOj7o4RdsP85ra4x83IfNesMf344CAKu0NAiTaFAlLsa+PaKSLC9Crw+iVh685JV3i5vYS/hQ5prOKT6baBt1XxshLz0wTIhWtV2QaVqrpKORsxqpSmWdfjv0NrC+EiOD/mdypWcqXnOKMw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: f/8eI8K7Sl3tIBj1hCC2PQcGOeI2x26p3eXID4jOWJpCx8wXnhiOjbbdyXNYT0XoM0U/to7BcpnUV3TPsESuGZJlmJYfyqCTfSxTavqk6Yg4OQYcANqwK7kuHVyLv+ksUX+db1YmY1W7OiOB6hADebNt+d6mFkLO8Hq6hYhqRoL2cIM5do11TceQ0OdFlKzBCWEbtgtH1Q6gzWMPgBl/M+CeSvUlf7uw0LUNhu0Vh+OVJi1hCKWZ9RgaE0wiFnFl/tlZCfugQEHY9BZIO01QdDMleAOwP82ZbuZMzpSgFDo2e0I+E1dmuruMcWmbZ3UGjdLyU33ThEToFf+ei1LEPoSXTI3zkh43sVZ5ruZWtpouwakWet7K8+tYbYawENturxza9R0XsdI0VV+guaPDdk/SLOmrSe6MlMpkmZuOrNTpzw6EB06FgepPkPaCy8fY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 22:24:55.3097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1446d86-e23c-4572-8bd0-08df105381bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5748
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_152503_768858_9C5AD401 
X-CRM114-Status: GOOD (  12.74  )
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

On Thu, Sep 10, 2026 at 02:54:29PM +0800, Wentao Guan wrote:
> The Tegra241 CMDQV teardown fix moved VINTF hardware deinitialization
> into the implementation device_disable() callback. However, its stable
> backport preceded the conversion to devm teardown and could only invoke
> the callback from the shutdown path.

Hmm, it did...

[correct in mainline]
git log --oneline v7.3-rc1 drivers/iommu/arm/arm-smmu-v3/
...
9ff145a25c5c8 iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free on teardown
2bd22a0d40503 iommu/arm-smmu-v3: Manage teardown with devm
...

[inverted in two trees]
git log --oneline v7.2.5 drivers/iommu/arm/arm-smmu-v3/
...
78fd5a2d65f35 iommu/arm-smmu-v3: Manage teardown with devm
f9b7375db3b36 iommu/arm-smmu-v3: Add HAFT support for SVA
5994617e09ee6 iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free on teardown
...

git log --oneline v6.18.51 drivers/iommu/arm/arm-smmu-v3/
...
2235eafda9b3d iommu/arm-smmu-v3: Manage teardown with devm
d903d99ffd22b iommu/tegra241-cmdqv: Reject a vSID wider than the SID_MATCH field
d2ab08437e913 iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free on teardown
...

[missing cmdqv fix]
git log --oneline v6.12.109 -33 drivers/iommu/arm/arm-smmu-v3/
...
981686f413776 iommu/arm-smmu-v3: Manage teardown with devm
...

Patch itself looks good to me for v7.2 stable and v6.8 longterm.

But v6.12 longterm might need some extra fix, Sasha?

> Now that arm_smmu_disable_action() manages normal teardown, invoke the
> implementation callback there while the command queue is still alive.
> This prevents the subsequent implementation remove action from releasing
> resources while the CMDQV hardware remains active.
> 
> After ("iommu/arm-smmu-v3: Manage teardown with devm") merged in stable,
> now keep the shutdown path consistent with mainline, where disabling
> the base SMMU is sufficient.
> 
> It is a fix for stable tree commit to aligned with mainline, so no
> upstream commit id here.
>
> Fixes: 5994617e09ee ("iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free on teardown")
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>

Acked-by: Nicolin Chen <nicolinc@nvidia.com>

