Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0730C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXksVFxsAV9l4mElQ01Yncf9K5e4C8tU7BhxeNj1N+Q=; b=FICbum2VYhVlYG9bPbgWJVyLAB
	6sr1YL1pnj2fTk83n13EEra7qsjJRCl+BTdc1UW3jH4WDatkkCGYwes1SlDExt/vUPwhQDC1ycUgu
	ChnjF2ilFU21asPPPGKhiQo8h8yUCa2Y2sihEOyNkAAhLOtE/UwjNSDujufLEkDuH/MpUY+1ohfxl
	wbUkUT8t7hi/4Kn48O7Tio512iqRXupy85EskwWv8x8QVdvN8qO3SMmPe/PEwynpV7hSXtv6kapV9
	zr6fIsg860FDpST8YEpvg2Wrl7urhDkejKjtJsd7CMbpc8XaXkw2RYFcK94QQu+L+6nskgMkrepxH
	ZWlDN72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCtw-00000002RuE-2FNA;
	Wed, 26 Aug 2026 12:38:44 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCtu-00000002Rtn-2rLH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 12:38:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNoFod3dI1QABz0wqBidBtQmWTbHkFf0IfjbRbtfrvH6h7Mofgi2SmWT2tlpBkEWKdLgzV8c18AoUqg8yxARMKLSiOrKFIUBmyvj5v4+zbJr7JYlyaba0ponTng3LwFGVHpU/FaR9BG45Kl2tAXJ7U6imwdSSgCbqyfwLbX52hntknvUqyehdiuABznucodgxK909sfSOY/A98QuF4hYg2L+YmgbpfVNjQQXWtipGvKcBw11wq2Lh1ozw9d/ZQIuNuaiKHqv5iWcUHHVanPOlCQcGPbcyCSqmuF8GeeUC686nqEK1EqR/zX3bgABulwlmbm0mXV8cSCGgZ0DGgjC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXksVFxsAV9l4mElQ01Yncf9K5e4C8tU7BhxeNj1N+Q=;
 b=Z0UcisH5LKfYhtNNcC+W8HT+hsK9LbjyS4Hp+aBnIxmdKCZOudIuYFHlOvuHSjoYBrX5/2yIbCszADYjhEmPgb+0u+bvN+zFOH8dbJOP4v5DWf0wdCH0qccUc1UutiphDWY4vehPJEWz7laWI6Jnqj6+d4VgatJYqKw5yXwryRAO8cjhi+DvDyuBGZpKLJQRcfmb4BQgKP2iCDPZ3/q00q34w+eCCQ5q0jeCD+11bfsJUnQFtqgfNNNOBjDgyYiB3LAe1Tm9uhIlvvTzb4APB58cudfrbe7PU6QEXuxybm79iJHY4Wu2oaEWLUabC8rxJUNZKseslAisYOOMWUlrEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXksVFxsAV9l4mElQ01Yncf9K5e4C8tU7BhxeNj1N+Q=;
 b=GAzJ6foCXXdYL+SmJQCcdYRidgoC4hU2j/hdyKaXUZC4oiO3KzuvPENuYVTmQL+/1t9PF3xiWAgaoDeTgKPXZilrtY2Ow1JksljNIEzwEAlT452wGMyHKoqiKINzL57Seyvl1yPo2GhK6e5Dok/IWqlImg0t0VCojGkBr0nEdG/BWejV3L/KnYNNfLhhAhFGR5NikW6jEdyCmsZ0NceBqC/geZufZ2nLkMdxdfzPCYHE8rEQyBCXEbxZ94Xln0xXjDEQsQZ9v3MngP7T936c04z5+sutUPzCF2K47PnAgPgE0cut4fosCaXIUfhdYoq+/4akt/rp0IyTO8KnR0Qs5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM6PR12MB4481.namprd12.prod.outlook.com (2603:10b6:5:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 12:38:34 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 12:38:33 +0000
Date: Wed, 26 Aug 2026 09:38:31 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 23/24] iommu/arm-smmu-v3-kvm: Enable nesting
Message-ID: <20260826123831.GA3667628@nvidia.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-24-smostafa@google.com>
 <178769159057.3356902.13161185498161727294.b4-review@b4>
 <ao6puxVSNsLC8aql@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao6puxVSNsLC8aql@google.com>
X-ClientProxiedBy: SJ0PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM6PR12MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: a71e8b13-2ace-491d-66bd-08df036ef108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: GSCcHc02fICfLBWIQYuMRe9004rCybkni6tDUqrXTOBt3ZYri2BfXI0D9NhGMFZ/WLfqAMqrkIHF+F9Hmf3q9nlpa5gL6FGYNqWLVghbx1NYX5SaHpht/kja6SYTjHdHRlw2i2gN5w8TSWJs5yMyGV9y7t4GR1z0gKpvxarujMlz1M4cMYKD6KVR3+WHj03gKXAwY95K72xOJjd2YgdigbJTQ50MU/U9ObXlPdLA5pr51nXKXysqDqUZV6MTJEzcX5sd3eS6TfAZZ8e/9gVV4jZSP4jVyRe99ftZvvt56Gtq4Ond3JUIHa1kykm0Ql2Vt7WZJ5kJ2U/Tzsc29BTZGeRFGCcpUqCrYat/2cAF3we7oVW57P/76yIiGtNqW642zvjcXDyicPqkmMi9EddHipu0AivXA1+uCV93wBJI+5xuPLZCOnyxwAjvud+Z/uIrrl7MJ2UAwiNicdTlsf2bJ1D/PYzYPRpYvbmkivYTgJWvrleOH/0fVpk+FoZstTkvn0kcsRERVqKWNKOoLlATSi7kd2MQo0ywZHh/Wc4OqMxzp4LK1GIQvXa6qZ8+3m02ULs5dS6H7qe4vkgVRcvC2Wp+x2AvWIsfikIR/LANNxwFBInmtHbi3bLwLoxOHo7UfgtLvZ6RtNF8Ks72B/r60p4rgBVGlEYaSUZv1JXipcQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ithjnCk7IWCCTG6NC0Xf0KVh5eYmVuNt8DuF3RnUgwiAQqCE+Y9AYLoy/GRs?=
 =?us-ascii?Q?gK//GJsz+ch5hDxAXkWJtDjbevWvS9jNwr6K5TGJSwfd0HGAgY1MvSMriwmY?=
 =?us-ascii?Q?ECr2/ZV/7ut/v2H8h06eGkYYC9difkMds6q5PWBKXoV8ZFeNrbwbDJM6+8O7?=
 =?us-ascii?Q?QcJqnLojIYzvQtO9pZgjEVWRgkUt6WtzSGFvgfxRRYqR6F4cjunt8N0G3AXX?=
 =?us-ascii?Q?J32ioWBrmFSBTYqZFA8pA8LIw1iZa8Hj9YjIGq1L+ByqhSv8rASsRBiVXDOR?=
 =?us-ascii?Q?PGw3yIksUrJJNgYb1RXJbb0guzHmR6rA89XQvrAtigPKlGsK3nknUE2Lkv5z?=
 =?us-ascii?Q?EWCv6R/Bg83VklCJVJZmG4p8GfmagRo/ePiz65iG7R9X3JyXKilYNHDhyAuX?=
 =?us-ascii?Q?8/4FdMj8FKPrgxyGWs6a3yXhF+Xe/gvVK9p652lpk0Qj4OkBXpYcABNgDisR?=
 =?us-ascii?Q?U2iw0PyrvlFfQjyjhKQjms/gRG2h+5TFMZGSbrWs7LiXQgsjqBWqYhOmdVge?=
 =?us-ascii?Q?tCc7aFoa+c7Pkx00oAMXhzvbbjpi+eTiDMeGDL/V8XE0lXkN/RjbNVoYMJoO?=
 =?us-ascii?Q?XjNmYsSF607oqcfWyU23iJvPszM5jCEf7mBVT1w1AzY60uJ479TpK1VwuMGr?=
 =?us-ascii?Q?9YkLJN6Fx3ZdLcMtrE0icBf7zdytfyfR3T0u9JlIBSQffC2AFI6pt+X8Ja0i?=
 =?us-ascii?Q?x4E22V0R1vEOdCMDZzw2/anJwG9v9ROsgdy3gqNAQwaY+xSHWV3UFmxB2XEJ?=
 =?us-ascii?Q?4cAIQUqPYGCZXowjEL/SHjrkZjBqeRFCC5qUasW7r5m5lw7lMU8Akv7dBy68?=
 =?us-ascii?Q?dLkNpJWcG21VPRepZHF4zHX1YN7BwH20l3cFysQrEJvXppJc+LVT1TLkxArb?=
 =?us-ascii?Q?z0kOs+qg9MkRemaZR+5p3a1RdA5R8gw/aDRw8bACw7w8B1fIo7eu1i3XFhTI?=
 =?us-ascii?Q?rk+HC6Pk510C2SWNJ8bHU32h/ZFMvdfVDcgea9g/GP7uUJ/Oj3HSX8KtktS2?=
 =?us-ascii?Q?T3qD5yhdTexaFo8/ww5sjJNPAZQ+8U3gUUGQ45+PqlqAqVLuTjoihYmSk7+5?=
 =?us-ascii?Q?s+Svn7h5mO7oCv+AFOd0GXbFdT1caFk3UzNDiDHF7JqYr+Jq006rdLKWxfbG?=
 =?us-ascii?Q?cIv+wIwdL4x9W/GLnnFfsxWiuUcfudpBCAToIKS3aFCSRDdUr6Wcc+mCYXu6?=
 =?us-ascii?Q?v3ZGrR/QavawImb1WL3MIpymFIJhlL/XX2o2TV6rTJ51t7aELuiHAZg4j15o?=
 =?us-ascii?Q?jekzId16XLtrSBpLMuAfLrZDRgdLpy7ulh6Ee/4cUq3NS12DUrUEW5Qbo0MS?=
 =?us-ascii?Q?jEJbi7fObwaew3UmwzgMoakSqbjrhPXG+NNzG4aVMl4irTZbQ99mRGFZK9O8?=
 =?us-ascii?Q?BT+UJjl121AryHEdwmXK5I9VPQwzsbN2X0Lf37P7M+JCwlCklYYrWJqCa4ho?=
 =?us-ascii?Q?vu2HO4or8tNnjr21Bue34n9JYIfxYqDhqDJidyTT9zwFD02Bye2pn6JnjcmK?=
 =?us-ascii?Q?YKnXiE512z2I3eufwbL3gfiCKdBojQvOjK+x8rMpzhG7qZlHsUhIW6WE4CV0?=
 =?us-ascii?Q?QBUI6yAt/kXM+1g27BW8/v0UQdpUsS203X9HIauousxtoyZewRHg1gGZAuU2?=
 =?us-ascii?Q?6Twa2N0IgQJRUP2SJ3Cn/IJbdBJ4qm5JW2RK8EX/nR9hzxOKc/ILc7TFqYiI?=
 =?us-ascii?Q?iUEZ0hiQLgz9cfn6wC6oQ6/utCht2YxJCbIB82Hy6oOcQYqn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71e8b13-2ace-491d-66bd-08df036ef108
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 12:38:33.8956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qnb+4ReP0pEbO86zDB2ZCR3gs+DnYi1Kld3Av8WkgtHX3JgsdQWs7rOz9Tar01Cl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_053842_764792_CDA05F3F 
X-CRM114-Status: GOOD (  26.44  )
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

On Wed, Aug 26, 2026 at 08:54:19AM +0000, Mostafa Saleh wrote:
> On Tue, Aug 25, 2026 at 05:59:50PM -0300, Jason Gunthorpe wrote:
> > > [ ... 129 lines skipped ... ]
> > > +	ret = smmu_attach_stage_2(&target);
> > > +	if (ret)
> > > +		return ret;
> > > +	hyp_spin_lock(&smmu->hw_lock);
> > > +	cur_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(hyp_ste_ptr->data[0]));
> > > +	target_cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(target.data[0]));
> > > +	target_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(target.data[0]));
> > > +	if ((cur_valid && !target_valid) ||
> > > +	    (target_cfg == STRTAB_STE_0_CFG_ABORT)) {
> > > +		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
> > > +		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
> > > +		for (i = 1; i < STRTAB_STE_DWORDS; i++)
> > > +			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
> > > +	} else {
> > > +		for (i = 1; i < STRTAB_STE_DWORDS; i++)
> > > +			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
> > > +		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
> > > +		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
> > > +	}
> > 
> > This doesn't look good enough, a driver can't safe writely to a valid
> > STE in any order like this, and it can't make it non-valid or risk
> > breaking guests. We had this bug in linux already, the hitless STE
> > update in the hypervisor is mandatory for linux guests using PASID.
> 
> This piggy-backs on the kernel algorithm, as described in the comment
> in this patch:
> +       /*
> +        * Summary of each host emulated state vs real HW.
> +        * |    Host    |       HW      |
> +        * ==============================
> +        * |    V=0     |       V=0     |
> +        * |    Abort   |       Abort   |
> +        * |    Bypass  |       S2      |
> +        * |    S1      |       S1+S2   |
> +        *
> +        * For the host, any V=0 transition is not hitless, all other permutations of
> +        * (abort, bypass, S1) transitions are hitless.
> +        * For the HW state, any V=0 transition is not hitless, as all the S2 config is
> +        * always the same (ttbr, vtcr...), all other transitions should be hitless too.
> +        * However, the host is not trusted, which means that any V=0 <=> V=1 transitions
> +        * or any transition to an abort STE we need to enforce writing order of the STE
> +        * dword 0 and add CFGI.
> +        * Otherwise, we write the STE in the opposite order to cover cases from abort
> +        * to S2 or nested.
> +        */
> 
> So this way, the hypervisor doesn't break the STE and keeps the host
> STE transitions hitless.
> 
> Or there is an example that I missed and is broken by this?

If we are exiting S1DSS mode it looks like this clears S1DSS before
changing to S2 only mode? That would be a bug.

There are also gotchas where writing things out of order can make the
STE UNPREDICTABLE that must be avoided too.

We really don't need two versions of this stuf, just use the
programmer we know it is right at this point.

Jason

