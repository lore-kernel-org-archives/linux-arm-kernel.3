Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C81CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gwo2sVCoyVuzGfe4qaOkIZ7uwE18sgXm0cabRw8gQWs=; b=V69Y+g/Mpe/ZDG2A1Imk/NAjS/
	njqF4LAT7OQiiSCKJhXPddEKO143za/ykINkAblg2Us/aTEgzTqdL3lLWAmizuKxjCgBTdxjKsLqv
	femFT0rtK1v5zCHsAhes8QwUP2yL4JEy1brfSmj9jsGne60GPM4bxhRfyRlgXqE/PcJxm+DHQOWnC
	o2SpFci+CLV1aLvL+ZoBeP7JuVGM9/LikS0xtMG2sXEsGccYfoRvZtgHH46zvIO4i5Ypthc04GhPf
	q7jrgbTzYez8EgXde7Fjkm+2pf2z7PQlV2vArcCLnkrrdA21CAlAvxzW3jsZrezlIx6VvLvc8psxw
	lA/V0zTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVqk-0000000Dl96-0la4;
	Tue, 02 Jun 2026 20:36:34 +0000
Received: from mail-northcentralusazon11013005.outbound.protection.outlook.com ([40.107.201.5] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVqh-0000000Dl8g-1HsI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 20:36:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc/+mQyZahlsAY0mVASZjweReoeIWZ/AD7sqC3myRvpZ+k0kejaOJTNH0FuVqPsAzLeDHv3+b0j2XokSPq1RfTop0mL7yb/WEisiBjDg5MP2iBkAiywzsF1v/xVTxdWdujj7QblcVn7bhYOS38ZTDUsJL1BpDs9d1qBcW75fjPDapCsCLzeo3j+Dfl1id3io1n7G8RD4/j9+kYMFBfj+IBq7cqd+/9tW2ABfAaHu07wqBQ/ANJUZXWVY30hGjoSm6nH50HzX6eq2Kumkt23hXZ/dvA/3xVkis+2eq62hVIr7UCXM87kcxkXWogmhlrGlMsJFX2qe4U5g/tQMIxvuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gwo2sVCoyVuzGfe4qaOkIZ7uwE18sgXm0cabRw8gQWs=;
 b=eBBXViWBOqzjP6U8SL3zk9SX7CST3RW0KIamWxQmcf9p4B2/ev6LaSwrencBPVuEWGsXC6XK7oJbVWFHh+jn/lI9Je08lAwYD55tyADFHqxh6dtHk+DkZaFhVfQifU9vviL0QxQZ1LoMdyQF9fXwcMzwKtC+lGPlzffIpcTHIYbflGEHErWFWgdm03tU/qFCBmLvuLl/mCkZcoiyDsD5Zhv0N+Ze88dGsQsWPBoOswD53oi8oKLpqW49QnJyMdEwCmfhPJCRJK//wKW0w4NpckKtma8QaR57JWWWb5DRGVqrnkAF1sIVNlQhzHkicKBfVEKXk8GY2pKZhyQkvuocCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gwo2sVCoyVuzGfe4qaOkIZ7uwE18sgXm0cabRw8gQWs=;
 b=pidIkF4uaptDOgg7qhdbCYcWU8KpYBZRU2oxF+TNgvU3pMCnSSgZnsgLSm/kBRfGs5/aqQWI/UmW4CbElr6CZdLpRg+DKPxTm0whPnxjRjv6WSs5UTygyjpy1QQBSsDe1XdrEUMt/8qVK2NJgdJFN1QZCt0oNgOrXGePI+/qHwR32J6oYdPl2DHvV5QSitFX0jbBsCOGX6KCnJDQJLnX0qNK7q3JwXLcX9b0Ju+Hp3kAc0TctjNOFeOfydLGjYJb/52z74IK+IPQ0UJkTQ5hC3tK6UxS9x1V0jzrWXKs1Y2rev3Gu4GNjEzFqy5G3wVh9mQpkVdA7VK6OSaB5mmWsA==
Received: from DS2PEPF00004554.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::516) by PH0PR12MB7959.namprd12.prod.outlook.com
 (2603:10b6:510:282::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 20:36:21 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:92f::1002:0:10) by DS2PEPF00004554.outlook.office365.com
 (2603:10b6:f:fc00::516) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 20:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 20:36:21 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Jun
 2026 13:35:53 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Jun
 2026 13:35:53 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Jun 2026 13:35:52 -0700
Date: Tue, 2 Jun 2026 13:35:51 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Ashish Mhetre <amhetre@nvidia.com>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] iommu/arm-smmu-v3: Issue CFGI/TLBI twice on
 Tegra264
Message-ID: <ah8+pxWXZgXqt7Fi@Asurada-Nvidia>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-4-amhetre@nvidia.com>
 <ah87dzHOOTNGBBmt@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ah87dzHOOTNGBBmt@willie-the-truck>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|PH0PR12MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cbbed54-5cfa-4ece-2e98-08dec0e69b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|13003099007|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: LswSJnmbtFk/TKmrjcG6qy5ZO6+u0TbuAMCLq0jnOrh5wDuAsu8MpqQPke7I+l0PDXhHCqBtKmu567bM3b5VypRbPpdcXm5Tmcs9lynyOFXeVbmtOYmy2p3y6gNXkX+nxh0bDpZHh1E1vysD5poBl/EBpXpZhndkNHUXyqSX7Cp6XgInl1FJF/pn4GUJBJpx7qGrksEkWR2KB3MjfpIlkzIlQhRiGGJroGrnIpwgvOWIjEoHPpD9RVRLpLjKSpfMxAuszvHMBGhP5roXr5hO4TdoGsKaKXTdkqSc/b9CWNHKJJXqMBBfE00rur0eKfyVb3ApxY7yIYK2SCDnB0ifgZDcjFe1vvIX0mcYeaxzIerAm1UYOwF0gV3qkrFhQ0C2JTx4obLQhKTJC3+/fMajFxbiB8bDfVSTaGkpdNm+Y3H9AiczSwna97623ESVfuCehRRDca+xU/iUUeY1tEQWvqVq1qJ6QnhGn3dJtPQDQEyWV+2BUYFvDbYvVPLbW5BiaTrAkkDEE2VnVOShA7iN76F4hgIIgeV+gOIgYqnZy72SmvUi1C1B5K4/bnQ2vNfvaG2tH4BWhNhqqziYmmNbcFeV/XMWtKFNqRy6XTE2T5yPLDJZ5UHg39cDKAmO2zv8Idxbgjs5mpv5mBgWh5sTw/1UjHJvujtHb4Vx3LWTZbq67PXNXCfaZ8zyBdCHoJRfq8OwINw4LIYu0x0D+MtaII/Kug3FpXYqYpQC8ZMYzyM=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WNutYPjyVIko+XZ+iVD3LdmTy3ExF3wUFR9CPE906wKXWNpZwspnBzs/pvNIFtAuxSmzWA/lc1iYgPbr2B9vgQcixpz9W6z55IHPwuLjqFItNkEnpjx2jRdhtQUwXGHAkOLGaeMCgLeiiSetQdnkvGDQOwwY0HYs9bW7lMxn+j96ErtIcSvAb0q3q8uJyCsDcdMC3FlB+IPM71uSVCSpSCVZM8QP/DWmehlhSNamAc/HwA1Hu38/9ru7oKfMFTO8L7yYn2FxDOGe7CEDeE53r2N1nHPCmmTU28suOiYeiOOCfQZuXnDNfqrC4Ws+OngXirBPU5/tfWXtuOg29TmyCnIk8dUsvH8GKkawqrxqgXaSAr/4cAsIVwnWItxF/xsQ8JlIi6pNEbyDRX3VgvX1R6/OD0B3eBE/u3UacvFd+tOWNpHyEdUb1gly3JV53Hvu
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 20:36:21.3891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbbed54-5cfa-4ece-2e98-08dec0e69b61
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_133631_345899_3C838C13 
X-CRM114-Status: GOOD (  12.76  )
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

On Tue, Jun 02, 2026 at 09:22:15PM +0100, Will Deacon wrote:
> On Mon, Jun 01, 2026 at 10:48:45AM +0000, Ashish Mhetre wrote:
> > @@ -382,7 +402,8 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
> >  
> >  		/* FIXME work in blocks of CMDQ_BATCH_ENTRIES and copy each block? */
> >  		cur++;
> > -		if (cur != end && (cur - last) != CMDQ_BATCH_ENTRIES - 1)
> > +		if (cur != end && (cur - last) != CMDQ_BATCH_ENTRIES - 1 &&
> > +		    arm_vsmmu_can_batch_cmd(smmu, last, cur))
> >  			continue;
> 
> FYI: Sashiko is unhappy with the existing code here, so somebody should
> check that out:
> 
> https://sashiko.dev/#/patchset/20260601104845.995005-2-amhetre@nvidia.com

Ack. I will submit a separate patch to address this.

Nicolin

