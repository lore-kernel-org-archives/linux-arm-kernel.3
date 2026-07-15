Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DB8C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FYF/AUOaoIBPSufVeUWPqjrKF83lwRFcgmerDNFjAI=; b=AQE7Puy+UcpgVPzBDZGMQq4QbG
	tvE6knHiWuF7COAajVWRUTHjnT+CaEXpC7kWWbaCf8BmevYGAQXaXn7HPVJerFb/Ax5EeeLSbPHdo
	gwxD5exDQqF4h5icmKOUWKrkQRtNZVco13cFT/AeZNCPxStNEM3BchUUjdZ8go1NKb1hIZCpENDXN
	wuuZQWJ422FqG8cbJlV3ddWb3Kj97AzjtRy7F9l+0C4N+KKZhIf3PUFKP0D2lPCbE7yudXU8QiF8S
	NS/nM8DdOEl6Um7Sq5OMsNaDl85lKllhXrfUQzbn5+5SuIxaat7kqrGAetCbg3xEgHI5kVqDpSkZ+
	POO+e7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk52i-0000000Flil-0tkA;
	Wed, 15 Jul 2026 19:13:16 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk52g-0000000Fli3-0zsG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 19:13:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPHMGDhAWlizBcw6eMtCIvwqx+QmaPJeulUPhJFzIxD2BDvCot4T34f6gHoww9NoW4/Ag0W0e+Vh22xZxh94V0m1mFAdEK5AheFhF7qTpx4FJqmxGxRzZfQ9yjKNiy9QyZGgxkDM31qUcaVxyCsvjfNctAK47IXzCYDuNHdc567DdS2JRwh4sbtwhA35INTiqi3ExuAWMk+1urtQ/G9fgKsEisIPDgpQXkHHy7aR2n2XoFLgoJq4MO9IYYyWAfaU+z16ydTJA38Fy2v9+y6/vU0OQa2yhD5a5U6GmcNqWNzuGmGaIVCPIS5xW1ePH5p/e8FGfnwnOHHWQG/Hic3PyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FYF/AUOaoIBPSufVeUWPqjrKF83lwRFcgmerDNFjAI=;
 b=MIOqYCsrLcs8udWKAzzm7ue/QduqQBTMr6cMuysadTPizXq04reMI6g52NEx7fRSoBcmdthfxOqykFfMsrwAr9xSxYGVOgLnwOUtpSe5v+nC8XptxhxXnLbKxG6GmWurFXMCo9yNS70jYWgaycDnGd6pIM4H5L7tpISKbzGLCi+37aD8E0xq5qJkKfOxsa4AnNouPH+XTupznkDDAmDPAUhktjyU5+RYqod85C/Zy6XJxSw1vdX0PfWtTixfsSzYHESoEdP70v1FGLp+6b1997CfY8WpXs1dImYgbOMgXZ9aQS0cWCGnQdMY2pGhB3WesY9OWaYFYYj5X9SUIqI5QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FYF/AUOaoIBPSufVeUWPqjrKF83lwRFcgmerDNFjAI=;
 b=qZ4l0Ao9guqU9K+ddIP4tJN8zMIYDmVyGMVAW7VPwgFRMG9PBGmt7nq6fnibjrFpcS90QfCHQ7DRg52DdaFZwgGteyvA90A8PqS6HPjPDOFlyltabVNqqgk7DngrTtDjZEWpPd9FVTsz4RcBqNOHML3oF9PuLsHkTuabVklaLnGdXWgjaqqpnsBHH20hogpUZ21F4gEFGEt1cim0o8mchsFdEebaNxBVTigCxRCbm5dEUbr6aaPN7vK96LGnneNCPsmKspKWB7c6Mh5Tnc8r9Fjd39LnjorqnbWfUmXwYjtYfZz1qL3k55vvxlXR+zr4RKVXpei7D7mkt1yRNuVhpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BN3PR12MB9595.namprd12.prod.outlook.com (2603:10b6:408:2cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 19:13:03 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 19:13:03 +0000
Date: Wed, 15 Jul 2026 16:13:01 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v3 7/8] iommu/arm-smmu-v3: Change how the tlbi describes
 the invalidation
Message-ID: <20260715191301.GB103013@nvidia.com>
References: <0-v3-4e7f64f4e094+85e-smmu_tlbi_jgg@nvidia.com>
 <7-v3-4e7f64f4e094+85e-smmu_tlbi_jgg@nvidia.com>
 <albBoVkI4KIh+spI@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <albBoVkI4KIh+spI@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0625.namprd03.prod.outlook.com
 (2603:10b6:408:106::30) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BN3PR12MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 76674801-ccf4-420f-728e-08dee2a517c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZBizITFbOSY0qxDD+hFWiaA5dc23fA+Ja0yIbsxM1jr0iOS9nExwBj7e6MQgbvaM806E7BZbewOWxlO34S2I/iWdxR7xRMm7cT0D8UrXujWJPkv0KfE0263J6BCuTjgmYX44u1Sl7PFWQPWtPTfEK4QpuBdh0PkZfQJXpyKn6DY1iv/Qvv/YFjclUkPiRc9hjD2ZUpvsj2OwaPFKEabLQe6JirJNLW1r9+BwXVgzAZBh5hC+eDV4YVK8TLo1rbi8nzf7XneR0sY/m/IXN4Rd6xiN6iO7y5m8zq7GRTmPFqbC8sPRre4iBrq6wLR52LG9UUDgLaVowIgpPopwGtqWhkbF+XuLFKfUIjvGSM3QCMhABEicjGsKNs1oDA7DKxYSQdRzsiJaTnDelAhKPc5QZS+iT589VqV20qANSYcS8lt/2xBe3FeAAWkLeAx9OKpizjLHxfoAMNftE4h8K5ZFv+/11J4tMTX59y203PeAM/kefHWFrEX79+syq3r52XVUZXZwkkv9Xh1f5hqZECkwKBAPVK2YDS8vigzN5wNABziTm8ndVtgeKZDTciPXwFx21obbEGncGYxyVzA8u0lYtql/uxu652u6jiu6lfLS+pSDa4AZVYLrcKs9+/IFHu/OaoGLxGWP2eA1iQHTJrzo1OpYYimMBZCxSD7bDSEC158=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z8P148F1Q2GqlWFOPE2vxkCYKNGX6w4zafZO7v3jp9gyFCNse6hbhPvKTl7S?=
 =?us-ascii?Q?2ZeEXtyUoiD0gPi6KIq7u5BOGKN5XTAmSyaMB8Dism/gGVgRQDyMmjiv1GH6?=
 =?us-ascii?Q?PUcCM8DjwgpN9VgRt/iGZmkt/4idzGATsGg3dqSu4U0t/B2chpZNe1jIGgnh?=
 =?us-ascii?Q?+86D8jxXDSeh8Du2sRPqNyErZri5Pet7I1oXnU2AeLMpwEaNL6hrJZJBKndX?=
 =?us-ascii?Q?KP2Yl12Hoe/ALC5DqX0WT2c7BG0yTJ0zfmlW+eCjN5xqakVb+BLryH2IpTWx?=
 =?us-ascii?Q?TFpry4YFYY0b9AGZT2lgAglvplGJ/AFKUTVVpiRGX3EVh2oYOwYgPXftjT60?=
 =?us-ascii?Q?8WydnuXzl458lezoRn4YyHlnCYYH/vDMumcHp0tYAMAjc7d93oNp+3TA6YOn?=
 =?us-ascii?Q?jr5EmeLVY8ZVptee7T6xmN+eprZexOOdA9MHQGwxgwNvYgnUNLj2YfZLVPav?=
 =?us-ascii?Q?1gGJ9Bx06u42263NkfiF1uYamMfBWRqFjqUucF78bdngkXOwZhwKa40kBk7y?=
 =?us-ascii?Q?JyXNsQC8C1HKoT2y2DOxDuVuQhvJS8t2DNDc/W7u+zrfhQFSBc2bAcazNjSS?=
 =?us-ascii?Q?hVLBLJlrwC6Q9epSONOCNI+V7vSmSLuuEdtR4IxxlDAhI1uSaZ+Us3dp8jp6?=
 =?us-ascii?Q?QcLq3mM0FIzhxtRAJFGAbXLPX1Wx4cYCOU2p4As2rHIORiF4tO/U4ki2S7WL?=
 =?us-ascii?Q?e+AIjg9r2c2zR5fq4bzukVqpExd3CEoqsZonUIKtLBHyaP9Ho92mZaDdRuZ6?=
 =?us-ascii?Q?rEXXC618/qkuD+hkhqBH7RPX/flXhhFN274GZxsr/IUdFsYpeWTLQrJooAzH?=
 =?us-ascii?Q?iDFaQlCenMIk9ssynInDG6KQPVFwZrT0c/wC4ACR07+FoT1HzO8JPr2DKMeN?=
 =?us-ascii?Q?+gqeN2dl6S7mFWzHxqeyYhDHf415xhkFuc16vCR2JbeICb/HnliZH7XibNOE?=
 =?us-ascii?Q?faXpdUlnvachfU/wXCey5giGo49zqZUVSP4EJbaIdE/M/EIxPjucCxmUQzHD?=
 =?us-ascii?Q?L9w/vTXMSkit93qIIJlPvchIXLk08fQ9zgdbO4fcjlYCx4Rnv+UHC/E3Lcl9?=
 =?us-ascii?Q?0mNyhvOI3aIP8cyMjANs+BVlCd7/s5f9V+w1IMVv7GtFeUaP10wTgPoy7g0t?=
 =?us-ascii?Q?noCRtHTBp/a0jwTz+URUJQnZdrfp0loIi8zBN8Qs+hO+i3nkR0JcSTv4Veys?=
 =?us-ascii?Q?mlRgZSMZ1udpjBUbOe1Xy0i5sPoDnNTe+HMwrtn9PBH+NJ0+tGCQ4H2o7hoL?=
 =?us-ascii?Q?O0d6p90Xwet2dt7ACRKVeyotxIkPlmbdRNwkTNVQ98vdg+4QjsitTekRwvwV?=
 =?us-ascii?Q?+/n5lHOssIoPC3tFNDs57psvMsS9+7Nm8T06gy6v6FBWwUlj0PMyYCazULaO?=
 =?us-ascii?Q?FTgWN0pseCT7chbFrw0/YM51Ek/zDmsgM3Ywf2MeeKS5VKEL5gO4wjhGockC?=
 =?us-ascii?Q?vCrYYIAnpUSeBPOj0Q4r3EG9d5QiIiR3OLrOA9z9wTas3ID/FgLUAzqmzNfP?=
 =?us-ascii?Q?yozCWWcZOfNoDtjuHT2SGPTid8EfPR3FWdFeF7jhqiHQW5lNQVHTd97eIsOP?=
 =?us-ascii?Q?OgiqoMh3rJTK1lWZ2VCESV7kcVrFhbOOCLY7sxNjSntdPePJkTWiFke1FyqE?=
 =?us-ascii?Q?BeOsuBHtVl4cuK5Hx6KclYDGbZBPFc4PmjD9/i2O4PmSZCPQTMnpPsBa8OSX?=
 =?us-ascii?Q?660NX0XwE37hLsm8aBzzUAVGbQhVvPvOwUmDvSpcKf+LQYkC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76674801-ccf4-420f-728e-08dee2a517c6
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 19:13:03.2745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYYkOyGgrMYjqQqXce3116et7ZN4S+ThkXQm1sVxONNa7nyVZY9Ufc1FjSWkWGGN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_121314_284178_86FDE136 
X-CRM114-Status: GOOD (  16.35  )
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

On Tue, Jul 14, 2026 at 04:09:21PM -0700, Nicolin Chen wrote:
> On Tue, Jul 14, 2026 at 03:46:07PM -0300, Jason Gunthorpe wrote:
> > +static unsigned int arm_smmu_compute_ttl(u8 leaf_bitmap, u8 table_bitmap,
> > +	} else {
> > +		/* Both bitmaps zero is not allowed */
> > +		return 0;
> > +	}
> 
> "not allowed" reads like we need a WARN_ON?

Yes

> 
> > +static u8 arm_smmu_tlbi_calc_stride(struct arm_smmu_tlbi *tlbi)
> > +{
> > +	u8 combined = tlbi->table_levels_bitmap | tlbi->leaf_levels_bitmap;
> > +	u8 tg_szlg2 = tlbi->tgsz_lg2;
> > +
> > +	if (!combined)
> > +		return U8_MAX;
> 
> As the code checks "combined", ...

This should be a WARN_ON too

> > +	 * If leaf_levels_bitmap is 0 then this is a walk cache only
> > +	 * invalidation. If table_levels_bitmap is 0 then this is a leaf only
> > +	 * invalidation.
> 
> ..., how about listing all combinations in this kdocs:
>        * The pair (table, leaf) below selects the invalidation scope:
>        *   table!=0, leaf==0 : walk cache only
>        *   table==0, leaf!=0 : leaves only
>        *   table!=0, leaf!=0 : walk cache + leaves
>        *   table==0, leaf==0 : a full invalidation
> ?

I did add this table below the above comment in the header

> Then, arm_smmu_compute_ttl() would read slightly better.

Yeah it is a bit tighter

Thanks,
Jason

