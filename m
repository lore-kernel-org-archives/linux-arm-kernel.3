Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC8AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 07:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWg/04MqwjzCxR/RY+YjgQikjy3lkqbePMHA2J3Jc+M=; b=hhLYZH2EW1OMdA4+AmW1vHgNEW
	OGf9o7NeJdQG4muWF4q+nrkWwBhdRGjs1cD5GdivSduw4z/+1q9MojflaXIkntHcTuFXdKlq9THCA
	tilunq0VILS3qVEg86DP2I41bYaDQ1WqwVS5RBzOxnHp+85KHBxELnGRPOAY/HkfvcY6I6nAvQtGm
	oypNQ16Gc6Gsu169sD241hg/1MeV+JGu4/qXXppbAh5UNnawHd2jwGfic4XPbUXskElgiYpoTVSpX
	ZSUg8a9SRGaKJ5Rfss2CpOsVIujXzwG6kge5SfVguAHAHie5uzmPaLG+27MOIZLLtDk6wjrwv54i2
	nKZaHg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfY46-00000006Fz4-3SWV;
	Fri, 03 Jul 2026 07:11:58 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfY44-00000006FyS-3IwQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 07:11:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imoo0DWEVJaMgnQiKhCeIfvc7s0B54jaKJoXAHChnBFaWNyK9DTwDzgiRN2DpdTy08oGdBRsYUJGuXYCnaRwEKix9Ud5tptxWOJB+eBlTiOHYvut8P6eId9uui5fZ5qdw8weWHYF9OhNXuZKk4b0/MsYYTdadtHVoLbssrot5gzJkqgct/eiSFGwo+T3q7w9387psh5qx/xotwyIInILLtXEFkoaJkjOdMLeW6M/OFjftXMQNJAF3oQcFl+n+aKDkx6ceAI1bO1tkKLYaqKqt4weB4RgC2DBkvc/8voUeJ97PMNji1e4mpNmvKDmsalUqfp9ie+sgMGDyW0zzqxHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWg/04MqwjzCxR/RY+YjgQikjy3lkqbePMHA2J3Jc+M=;
 b=sBaNBCoipOJTxxWQ3qryKIOE33DQR4i5QdaPPoDMgTUpK33Cd0JegfTGhwby50Stb4ByE5l8Tj5sZvRTB7l1YodmIJgm2YMMtjbGN6X/ZlnAdcKhEVmHJbwW3R5zA3xWRrZO8XOZV6t7rd5zZCalaygShxoWE2I6fnSrIOKjdYnQsLIxYg6CVNTTwFPpZs/7X6KQel5SSspPoSdDSsis3AorYj5d9PmlxMHOmwburwnAvEPvvbugJRE84tWf31X9d1dR7N67PS+yJahy8WAAbGnaSEVbOVBqVQHHMpn8jqE4Ej3BMQrfQb6WQfnCKSp6h/gwXKpH5aSVDX/6gvZiXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWg/04MqwjzCxR/RY+YjgQikjy3lkqbePMHA2J3Jc+M=;
 b=mPu4msqITOqexgFLLv7CGudmSKG3D3uUi5U9BFUuNr9REHPoyFyrdPkNdWKX/frModlDBPS5Qkeq2BmtZcAgbC1E1AHwBi763wdaFRbEz888+qQTLGGABxysg2LSnbEiptPf0MGOtUi5cXphj9mayKCye+aIXFLuxdLyADJGNQ+mOvm3KZyXvXrMn1UuUdfw3eEUA4N0zhcTItd7MCRo/4I/9fvQ2uRYJqCUYbJm9GrhAfii7ZDcgRT9mafPdvIxrXy494fBg6ws9o/obW7fqlCRzsFO5yvRsT3tfUlcYfl5rwvsrUQnZzutr+pRcCWMTy8QQ+T4iZ0jmzKXK95GpQ==
Received: from SA1P222CA0089.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::19)
 by PH7PR12MB7235.namprd12.prod.outlook.com (2603:10b6:510:206::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 07:11:50 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::4) by SA1P222CA0089.outlook.office365.com
 (2603:10b6:806:35e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 07:11:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 07:11:50 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Jul
 2026 00:11:40 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 3 Jul 2026 00:11:40 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Jul 2026 00:11:39 -0700
Date: Fri, 3 Jul 2026 00:11:37 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 08/11] iommu/tegra241-cmdqv: Require exactly one
 Stream ID for a vSID
Message-ID: <akdgqcheFwS8DnfN@nvidia.com>
References: <cover.1783054570.git.nicolinc@nvidia.com>
 <3177c49c4d9f24b1dc001d54b5ac30e5061feb7c.1783054570.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3177c49c4d9f24b1dc001d54b5ac30e5061feb7c.1783054570.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|PH7PR12MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: d81c282c-5706-495a-b8e4-08ded8d25a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: nZE+V/HHACHT59sGzIY+pwVNVwPqEFjT8xUrFDqiHGkD4+ZV/jFKmrr2ZuIYFSLcyxSAkwX9eIBcmJBiXKdi0gJab+FT3onOFfLSNVeOpMe/sy0VIGxXuA4gk4HE5fquQ1UbbtUGMTnWMPaFh7jj38ICmcvxf6wZ1jO/fpMIEZ0wBEFomoIPX+UBFFdmyz1OLkJjOKry5/t19n3V8DjCyPs1yhaGK6bkapJRFALV7CYaggi15aoNb6M3Kju9PiiEDK5ysskEao9T1g+DlAX9/YBBzb9dCS1Jsli1Qk4CRssGAEc2eqdXwg2ijKEgszE4Jd6/usQaOJ7nubUI9q+eqZqXkseESXKesdr4Q7GHA1xlqBoMWb5t8ud9zu93wDpNNQDUGf4ELgiIIIRlYwH6jDHcIKvlzyzNd6chEOl48+QHN/XhBRLe3Kvb2a1Lywbm6l93ABIBOSoe/nz7L/nLnUJYhcN0ZWxD7MlT1NDlv589NKRLe1m7x+Ae1uTIg5cb5sR5CIKbyx2c9nnZXi+q+TSwCJONbeNmcvkqlZor5zuTV6A+zYqh2gBXALKwYOnIroUAn4TalKczLm56UnZICaHvvqSfsZbbp9++zzdKUy1X7nVm7WiXI5yMErFUGjU9cB+lAbJtDJktnSaLnK0tUtSqoxlowztt2a/4tPxpVnieO6up/C9SAdG1gkijgkRwxl/9gJOGApbGUzNV6EN5pg==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cOD6yAod88JZnYXftyjR+xDl8ymuVgmBXQJflq4mSP0BS+J509szqiPwIE71IHnTtEKhr+z9Lb3AiuKH6l0ZT27bUaoRVAr+Gy3BzKmmOXLh2QBFjz1pmVSCJygXWxfTAcW0Yqx2jHaow6A1lLS1ktltYknBOLFsM+s5vTLX/bIpwrWPPdUO7LYXzrL4oQ1p1Q10eJUEWCYN28c2ebR7SL3wyyuTjjmUtePoBef5jiVxzg3PHEivu09PGUAydErXXwd7mEGQM6wM0ptdM6REZJr1O+PFE66SDJwWqUlzXPR0nNzqesqND7y9JDo8MK8BjxKpBmjKmTqsXSSMdMUJmj5eYf531em1W+ca8Kax2TbeMWmouAjQBdUomU8BBWsPCWLXWAtpfHM5DfNZArWt+YIvpwAf4VxgzhJIdZVFyQZkgUNqMyTKvjETPwUQGLxb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 07:11:50.0173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d81c282c-5706-495a-b8e4-08ded8d25a38
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_001156_826693_F9589265 
X-CRM114-Status: GOOD (  11.26  )
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

On Thu, Jul 02, 2026 at 10:31:34PM -0700, Nicolin Chen wrote:
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index 812cc500b4a1e..aa0568e328356 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -1249,7 +1249,8 @@ static int tegra241_vintf_init_vsid(struct iommufd_vdevice *vdev)
>  	if (virt_sid > FIELD_MAX(VINTF_SID_MATCH_VIRT_SID))
>  		return -EINVAL;
>  
> -	WARN_ON_ONCE(master->num_streams != 1);
> +	if (master->num_streams != 1)
> +		return -EINVAL;

Kevin pointed out in the other smmu patch that this should return
-EOPNOTSUPP instead.
https://lore.kernel.org/linux-iommu/SA2PR11MB4844DD8A0367D8E909123F868CF42@SA2PR11MB4844.namprd11.prod.outlook.com/

So, it'd be better to return -EOPNOTSUPP in both places. I'll fix
this when doing a v2.

Nicolin

