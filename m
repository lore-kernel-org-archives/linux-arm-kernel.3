Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458CDD3A694
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 19:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufp3cKoOlmKKk3qRTJMzofx3iQLtff2yrTyTdBMKcII=; b=KpQJ8GZXXsS+ihhBbB2ywQ7SEH
	W5ovWRKfvcmQNlmsQiQab7KOgjDUdf5XyAfe1ss4slqGslp1pwrsuBBCB1Ugg5GDgkerqPVTHX4xT
	OfxEKNAlo8aPX8hAezYgCas1dDaDhd23mMyhEz7+122am53POJQxqWlQIHZsUZdxg5+lzVbsE+7lR
	WKZoLdFT8o2sQ49JQ2MxTxInj7bYvLQA0TolPcQZqdgfsriDTp6Zj5loSpcQUvOh4STK6p8PbwVow
	G1/6qFgJYVujXIiVvBCVA9uKatZSyysSiJgaR9MBYoGB+dK9PBKmxzOMxs9CUF2XRh39j3AWWdv69
	c33BZ90A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rcn-0000000Fcw5-46xD;
	Tue, 29 Oct 2024 19:11:29 +0000
Received: from mail-bn7nam10on20612.outbound.protection.outlook.com ([2a01:111:f403:2009::612] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rbB-0000000Fcj2-2Jng
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 19:09:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dngUXxqcynJPU+HCL/JJGKFXsapJuxpaX2lk8gM0Xt6meL1q/1DdjgHbMUSyWu/pYnEFQAwxPMrJZ7SQ/zymE2CirU2wtwlo+cji/HswsYVugWsaTcuuaF2icowCSuh/oXTHgV+E4chj4xT5+mcH8qYxKhkR34hg7t/HhIwQLYFPQHDk/0+ECKzzfdweLNwd7X9VkN+MNRTKnv4S/4YN4nZWFzqjWyxVGFsaSh/brj4eONc5wyplnkq1WSCdUL4O1EtiPTiAJ2GYsSghaAjcmSuqHNsPkvlqGu6tPGmvUP6MLIhwUZsrHEtHE7hhp03m3PjypoGfVSv2f86u4jIDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufp3cKoOlmKKk3qRTJMzofx3iQLtff2yrTyTdBMKcII=;
 b=fcN2Ny7EfmwsUw2rETwfxpCZbZr+gMIFFhcSX6ugRbtKWxn9QKvRZd0ssfVucIT94Tal5kXkODTKnGGLYaqBe9RJYYQvxT1FG+/27xa/iUIKMlw0Bl9RDLwzGGKcj1d3AYqPD/c75ZYURo2kLuDBVwuJ3jvY6nQlacSgiP2sCkl3CzIuwPaf/4z4BIRmcY+FyLzAjGc7l1tv0xGuEp7hs21AqZOnRUoxtSPNWXoTcjEMSynJGXpvC6ab2PhBiGaHjbVjGL8OnVPPD2hpGRJSqi58H0MmY6wga29IU+C5vY4a2AuHyYVwg8HCk6qnKIZApIVRanfTw4CEci9ewgVrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufp3cKoOlmKKk3qRTJMzofx3iQLtff2yrTyTdBMKcII=;
 b=gvJQg/ZCMzjBp38hMtY5lNtzZBU4hKFqrNFFXW7aya5qPY8DhB8PPXkimXrY9xk1cl49I+ovJHoYB2+rgPlWo2h+G6JJOfn2fqEXmKo5IGR0WYhN3JjxXCX1DCctpNwhVIvOHYoV/+z8gKG5Hd+6aHZrwJnn0Wv9okEFDXgi25kmO6zRpIvKKADEn7jgumeC+ozGIOAqZdRyUOyjLvlrOP54iAGk34m6Cnqe9nV30nftd89nwGkv3FN5rNQUTrLeQZDKMNyB6dmcStU5bjZxmxmdmIvi7O6DJY1dLNIN2xnX531gpkzJvyETjC7aGtaJ/ckohOmzN2xUtUOgqaWD9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB7685.namprd12.prod.outlook.com (2603:10b6:208:423::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 19:09:43 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 19:09:42 +0000
Date: Tue, 29 Oct 2024 16:09:41 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
	shameerali.kolothum.thodi@huawei.com, smostafa@google.com,
	yi.l.liu@intel.com, aik@amd.com, zhangfei.gao@linaro.org,
	patches@lists.linux.dev
Subject: Re: [PATCH v5 05/13] iommufd: Allow hwpt_id to carry viommu_id for
 IOMMU_HWPT_INVALIDATE
Message-ID: <20241029190941.GN209124@nvidia.com>
References: <cover.1729897278.git.nicolinc@nvidia.com>
 <6b8bb8f2319bf26ead928321f609105e4e5eecf4.1729897278.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b8bb8f2319bf26ead928321f609105e4e5eecf4.1729897278.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BN8PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:408:ac::18) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: aafdd428-0243-41dc-fe7a-08dcf84d3ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UrAiVoyOSTNPUU5+PmYr0LhLAXML4eN7QL2PsrTLqh1Ntg/NVOjxoeGvQtZu?=
 =?us-ascii?Q?t/dGo91r3ZEsW3v22otWtOyZrHcjznEo0T2YVQxT14axNjKMU0R3qevEwxee?=
 =?us-ascii?Q?sLwM5FEJUWPGGwHmKgDN/mIwRBeJ6/iD2VmPcedAsDabFXVJs87SGTwuDniH?=
 =?us-ascii?Q?Gcd7eUeZCsMYT+wDY2YABzSfAl1Y46EZv3/qPNIgcOLj6gDp46jEJvHvYJB7?=
 =?us-ascii?Q?4b3JKJUxFQ2AUFwB3qFZavMMCEvow7BBGWOe7ceiCmNfwycJVRJDBMS3W+u3?=
 =?us-ascii?Q?Ghea65ZZa3uzmbzWZCQl0fLT6gj/XYNziE+NFABenCmso56dHY011lPR+cTA?=
 =?us-ascii?Q?kmlNE7mYuNSqOtjbf7eqQp3V1Cik9Mzfv2kgk5BjAtSF+0g3zm6+A64SFYMt?=
 =?us-ascii?Q?mMfmb7ORSnREPZ2CgI2wEPx7e4il0ImdTMWzQEJKruBDfguUajXjkECvwIIn?=
 =?us-ascii?Q?H38YE87I1IxfZfmpxmULym1V6h+8yTWedYmL4FdJMuCMJtRmxD/w+kyxa07D?=
 =?us-ascii?Q?of5TpwxJt87bVHThgUDcFUJD5E1+fmapJjWQSlbL29epWWjtefbekPwij2Jj?=
 =?us-ascii?Q?+iNEYe9bQ+oK01qwTz7zM2eVq6rujtmzH1uf54Mi/zGld7POn6lz5nT+8ClP?=
 =?us-ascii?Q?l4C06U3toUdm8Fnk5qNMSm28/kQ1+qwSfZFrvDbSp7oQWn58NknNKV3fxAxF?=
 =?us-ascii?Q?r0iDY0wXuyTHrlkIthhThe9bTGh21CFz2m7TSQ/uqIOvaEwU+QGxvjxM1zvY?=
 =?us-ascii?Q?5DR/JGqB9UebX6H9l4LOhTdu96fU7+h+Q/X03itzD2DwymVigrkqy988cc4E?=
 =?us-ascii?Q?gSEiv2ED1tg7ocI6yVYjY7J2Z55s6nPcCpqV97pBNTz67WQ12NaYFab4fkLX?=
 =?us-ascii?Q?JhexFKZsZTBHzb+Pa3YpqyW963/cbcRYv409Wj3qGsZs+evU1RZ4TdjGXQJF?=
 =?us-ascii?Q?c9qkP/YwP/oicdN/Sx97lREAbVD6crCJl7yMaqWAWB4gq+JtvLIywxKCy9E2?=
 =?us-ascii?Q?ptJ66B4DkV1hED2eqsouxGC8737CU9hSOanAABLhQtcjgcf8L+daxqEIy6tf?=
 =?us-ascii?Q?krLu6rYFoOFVtaa1jvmFDfNf18w7U/Dzmo0UgaYHQ9K27iCdXWhDHKllRiAz?=
 =?us-ascii?Q?9P2OPM+kx7zwPGxCMXPZDWBW+LSf1cQSHTvAxluMaPeU2YIDYoww1S50zmi9?=
 =?us-ascii?Q?B1iip7yCOvf1HiVyxdoWQCaN2550APxtqkgLvUJKb2ltNe5supMOgDRj6Ru4?=
 =?us-ascii?Q?78Sg3AoptgsWOlql8h4rtGoI2JWolFTs87eNNWvkwGMB9RHgtJPofnpA5oAb?=
 =?us-ascii?Q?3pOPX1qjpihd/JvmWe6e9+wD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6TW/LVxrS2hn6hVm4MhfxuCeyynORVPy0kK+sreCxGxElFtdkX+AJyRpWJ7n?=
 =?us-ascii?Q?9xs41/3Kn8douTSMZmXRjLYzWOCcMlr/vs8Dj5J9cm7rs+8vFf58FWNwHAkj?=
 =?us-ascii?Q?bRhe8WQ9CdighYsF8Gsu28VwPGcjw3u7Zt3lH/g3lkMrbYOlWYPgOSdT0CRE?=
 =?us-ascii?Q?Z+Xfn5XDwaUYWosxI7lig1bFBXCIi+naTs3TkSTZ8KmwgW8IEKicHp3K64Eh?=
 =?us-ascii?Q?d5onzX2rCv+HRJ5vBK4c7jEPfCC9WcIahYWwe9tLSQuZa4Hx1V/sYrnFQCl6?=
 =?us-ascii?Q?O8KwPk0r7BrtZW1XJsdfXK5FIVUllLHXubq4ujRaDNgxo7czFi66MrVshe51?=
 =?us-ascii?Q?BYO1h7T6fq/jZ+fiM+6zfNj72g1FqMLBxhhsTNso45GzJ7/JKpjzBAp5RiXp?=
 =?us-ascii?Q?eB4dg+XjwAc4bl+ePnsFYe1dXYnE/5efYkuA4zS2HQflLGiAvv72Jn/hJGPu?=
 =?us-ascii?Q?6cgkSRTZ9IUIX/2vNKy5Fgvaioner5RRTrL+54e54ERJN8csQn76L7/XPX05?=
 =?us-ascii?Q?WNcIrlt7Yp5FZb3ctGX21O+oB4XLRfUGNPSaEHZVyUexmhsn3fYid8YGs7an?=
 =?us-ascii?Q?DRLT91uetlFkuK/SxBcU3Th3frITV5VuQ19dDTygu9PNu6Fz1+MYt4a1Pzcc?=
 =?us-ascii?Q?Lk2yolxfqzwVR0OIgyeNsSv6AexJ5ewTonh2VMADe/U7mQjmHokt+bAt3gw6?=
 =?us-ascii?Q?SovVxdNazs3pvzJfKvMk/Mf7PFlZQl3Zg4tBjTA1kpcIuvpaRd/1SQfsV8Kn?=
 =?us-ascii?Q?p6ngSHuCS1wHujmfcV2pHotIErBFcg5R1mCY+45lmkTbgt15vwG5nYZNRVoL?=
 =?us-ascii?Q?wvcBLYTfXH25uZKAk7qoV7ZNP4pWSRp1nYFbABTh/z+z0ugzajwoqZQA0rkM?=
 =?us-ascii?Q?4UHgTHhyt+D4CBmQ762fKKW6x/fTZuGRdUwz70Ee1H0UGKgTm1gErLO0r521?=
 =?us-ascii?Q?TrlRdroCAmlPy+K6XegNQgURje+fFOReHp5inrphWy7MaF/IVgK83nDUuTIJ?=
 =?us-ascii?Q?trUj1Y5A+w4bdNMAvL7wjx4FdOzIsa8nOlAmRP1UTZmBCTE/INqIZjJ0e4xy?=
 =?us-ascii?Q?O3tO0XLOAO3OTvJZdApQH8nysrigo4YHUcH+XCphhGNZtIFHyAQ3RqmxNjtH?=
 =?us-ascii?Q?EztWMbiabgx0upAxwcM5BKVw1pfroyZ2rJ5dACTs2CRQ9SXLD6eNt5MmAeUa?=
 =?us-ascii?Q?8TxazEDIxRYbRW8/lnWYVYyU2lMK0SsWRu4/STZXZRepgKvOvR+2uj685qwb?=
 =?us-ascii?Q?/6ODiCUPxPXA024sFHVFRyJXkZRSBcK65flL7eMt5Kh/0ysx3JVvoFLbvGwu?=
 =?us-ascii?Q?KgPNleAO0Slckmm96w1PeW5vnFa8zvxtr4aLzHb65m7uPzcRpnkIy01+QUsS?=
 =?us-ascii?Q?0llZeB4BdxMnE7Q9Jwl3zO0s/ty1UPZnybJP/mgKszXyQ+DAWrkDo12oDrFY?=
 =?us-ascii?Q?u5ir4WhTxaEvf3/FTBAQpSh9mmaX3Id10GT7CCPdoUmvruhHGNxRGCjl4htU?=
 =?us-ascii?Q?rS76IkcK4ucdqgolQHhTysVx5VlP9/tzlee95Jtw7G8z4XXRFGnwyWa8sA4X?=
 =?us-ascii?Q?UB/Bbn+3LE7HcbkrV30=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafdd428-0243-41dc-fe7a-08dcf84d3ea2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 19:09:42.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0fFCeA9TJQVlguIyMBClEna99y//oLPgClmLV1i6N78kLJ0tI9VNhuH79giELcV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_120949_615915_16A2E9CD 
X-CRM114-Status: GOOD (  11.61  )
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

On Fri, Oct 25, 2024 at 04:50:34PM -0700, Nicolin Chen wrote:
> @@ -497,17 +497,35 @@ int iommufd_hwpt_invalidate(struct iommufd_ucmd *ucmd)
>  		goto out;
>  	}
>  
> -	hwpt = iommufd_get_hwpt_nested(ucmd, cmd->hwpt_id);
> -	if (IS_ERR(hwpt)) {
> -		rc = PTR_ERR(hwpt);
> +	pt_obj = iommufd_get_object(ucmd->ictx, cmd->hwpt_id, IOMMUFD_OBJ_ANY);
> +	if (IS_ERR(pt_obj)) {
> +		rc = PTR_ERR(pt_obj);
>  		goto out;
>  	}
> +	if (pt_obj->type == IOMMUFD_OBJ_HWPT_NESTED) {
> +		struct iommufd_hw_pagetable *hwpt =
> +			container_of(pt_obj, struct iommufd_hw_pagetable, obj);
> +
> +		rc = hwpt->domain->ops->cache_invalidate_user(hwpt->domain,
> +							      &data_array);
> +	} else if (pt_obj->type == IOMMUFD_OBJ_VIOMMU) {
> +		struct iommufd_viommu *viommu =
> +			container_of(pt_obj, struct iommufd_viommu, obj);
> +
> +		if (!viommu->ops || !viommu->ops->cache_invalidate) {
> +			rc = -EOPNOTSUPP;
> +			goto out_put_pt;
> +		}
> +		rc = viommu->ops->cache_invalidate(viommu, &data_array);
> +	} else {
> +		rc = -EINVAL;
> +		goto out_put_pt;
> +	}

Given the test in iommufd_viommu_alloc_hwpt_nested() is:

	if (WARN_ON_ONCE(hwpt->domain->type != IOMMU_DOMAIN_NESTED ||
			 (!viommu->ops->cache_invalidate &&
			  !hwpt->domain->ops->cache_invalidate_user)))
			  {

We will crash if the user passes a viommu allocated domain as
IOMMUFD_OBJ_HWPT_NESTED since the above doesn't check it.

I suggest we put the required if (ops..) -EOPNOTSUPP above and remove
the ops->cache_invalidate checks from both WARN_ONs.

Jason

