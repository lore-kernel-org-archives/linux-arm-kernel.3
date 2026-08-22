Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B14C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 20:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c76e8qnZ48IjVa7fcJxlXE7lBHWwuLE4C4uF7wBFi3c=; b=RllL/arFtPiLBLIe9+iMgydgoj
	WSQbMO+FRQyUd7W4gu3eVgsfV9HRMXDe53mxLJN+9zPIKQHfTjUrOwuINF+dZCXxH2d30rVY7L5JM
	ASPnWUtkI82YSuQEZwhpAnonlmEaeCl2NJharP/tvFKfGhuRv6Pu8drdf/6jEsFwx+pjy/P5bnhtM
	nGpg51o8cq0GBuziFppqpG90clANvQQ+8rnwE1YVae/5VlafP8jDWEocev0hQ4TOodtd9IbbbwO/B
	mIZbJKL2iPmzp1ee6mu2GyDPBaZdLK/UCYmOjM2O6eh5RWWYhHp3SrYiSufCCucnEPGsDJHlfxISE
	D3qBpvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrvE-0000000ElgB-1M6h;
	Sat, 22 Aug 2026 20:02:32 +0000
Received: from mail-westus2azon11012048.outbound.protection.outlook.com ([52.101.48.48] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrvC-0000000Elfr-3PAl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 20:02:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/9+iMe6lPbLgfElb1cvS4uQCEtGATLL+kYiVW08zz4VnN77dUQm+xWbYpKyK0l7t29HGxLqNfPjaGC8eR/SjCg2YvV/4+wd6bKZFXXCMEgqpbowOLBJ6AjuB3an1PeFvrI5nZSlaJGieEiSuej9wEHDpvxmOiIQDI/JcCDEmVr44NvGE/p6sNWJcEV/5Qcfasi8FEZtD8EPX8f2LYUf0YASt1FwHzbWf4JcMw4c+IQHmMw6NwWMsPHGBWnIy2OAH/LeWQyWR9vNC04H4jL5AGWpPEZbJZW4DAV0lBLuVbVPbCsxblwpACo4+JlKXUJElSzTnFkh9MfRre1mm1F7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c76e8qnZ48IjVa7fcJxlXE7lBHWwuLE4C4uF7wBFi3c=;
 b=pEYDQcXS54QKUTVw0OLQADFkNE5tnjqSLbWVop2jV1OO+/0+Pec2IKyqjznaZIMoDpIpD73oVD2uBSv8FWzlbHZGRRvF6QMptfHMKGX8IpJ1XJSYprPfvdyl/XcHJpSU7+BKJmIBdKu30x3AxfjhxZWv/VzoQ7V/3n80wlI3rzHFSOxasX3HAgVr7zpcWBMu76zoShiUluCnHmYRTpBxswnpsaWLScVmpK6omWT4MGUI7AuFs3wyr92WdjEgozryhBFp8Ce0jU3h4PtX9nuE3UvS7qSAaTfxBuXEBlNhXsk54BhVOlq1+Tq59swgERFXX18n2ZD4iMDIssR/48dU5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c76e8qnZ48IjVa7fcJxlXE7lBHWwuLE4C4uF7wBFi3c=;
 b=pRpTg9VEuwngFiq7JUu2px9+Te/O/rnJCegYhPfjgW16IXegAMcW5jpAKv2zEHmKHCK1QJcWu3rYOtTtGJ6YwDjLXZ4xO9HHWBhUH6abJe6ZPb9hGQJB+KD9inS238vOYdaWLgUhLo1ZZvP1/Y71BjBFRaF3FT7Z3yDH+Cjg2b+QC9urbIWOullyzxc1FzHmVuQ6lsHHCsynevjobIwq174cp/AwCTmrITvI6UDYUbQTzLJTG8lIJ2YPlKGOCnf5se/MnJTZGCWMdsm570i0ceoqxwG4Ay5ZLA7NgcUwlVOUIOyj63dJlzfOZN7cWPVP40/Jc5zFzdTmv9Het3SIcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW6PR12MB8835.namprd12.prod.outlook.com (2603:10b6:303:240::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 20:02:27 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 20:02:26 +0000
Date: Sat, 22 Aug 2026 17:02:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	praan@google.com, kevin.tian@intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH v9 09/12] iommu/arm-smmu-v3-kdump: Implement
 is_attach_deferred()
Message-ID: <20260822200226.GO244917@nvidia.com>
References: <cover.1784663183.git.nicolinc@nvidia.com>
 <eb795edf2598c6df57122cd5951393ac1a860bcd.1784663184.git.nicolinc@nvidia.com>
 <178735412602.18212.5709943748630447883.b4-review@b4>
 <aonng6MDJ/s/MRuE@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aonng6MDJ/s/MRuE@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0798.namprd03.prod.outlook.com
 (2603:10b6:408:13f::23) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW6PR12MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: c3457321-57c8-4e46-63b0-08df00884a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|6133799003|18002099003|10067099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: gGZ3Y+xsSQLV1OV6Y/IQW/KbwbctE52ml38w1JIriwXbiojSg3c99I1a26/rVYSTJtn+7u6ChSXZSuOVCsTv++sMn7JArhCDVOuoB2A0cUamCJ6mFjs+DM52P0ovmSfEfk7BWv7X4y1IurmGVn91OaeUMlkRuQUUqkvVNTmaIPwPDNveKT7X4kBAv+FkiwkWXvfMce5x9T/lmFqbSK6cZNvHRZmCNz4R6wu3Vc3ftvpuM+4AuIwvYFOABk0GXhKAQglfM3b8ZF/N9Y7QZc5jYMdp3JhIQYrDhAqrOzCt1LwRVlbTgNuXJQUEaoJUsbWb/6OKCRhInhsvNHKuchJ1g0qFWuLjHE/zO/tLOmuVCw8aCVmi6uB+NIriUzz4BjKE7+GPB9Ah4lQ7VALSNRCIgeanNHsOzKjELkAV67T9sdVRsHBjereHUdqV7i0rxeow2N50c8Z4EDg2qhhuQxWo0fLVOH1YRjQgLiPBoMegUmICfc/b2kaPKpjjT0/7NKP7bcxxljtSYLis6s65nx7z77rzmkQaYBsLjUD93WD2x6xCgNFo9q/OZ9R33xbXL5MmhX8OJfxfMTq3G6ed+wNIBLliSh69qX7NWyP6oNB+jEJnUsO0UsDOzh9T6xPRiZh8LbYzeqwDY8DnZAmWgBiAqNvFskgLNHr0vWE/EjAWVkk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(6133799003)(18002099003)(10067099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bJs9xeH/FK0XS8pm5wcnJ7UToP65sP1Hjbkx9PP0mpr97bZJtQW3PZyoTIhI?=
 =?us-ascii?Q?mn8/eoXYSV2KKIyqGZIqkeeL2XBGYidpGOboKJpFW3k0B/HBTgZ3uHqFNijl?=
 =?us-ascii?Q?2QhN+oDKe0SsPL420rVl3Tnqs6B0gwM3X+LPW42pJTTV5UNfwmnjXdCH75tQ?=
 =?us-ascii?Q?abHD2/RProbmnsWXvKrLtFZKVYNu15mRweyEQ7BsKDpyEysU413+FLRskjiE?=
 =?us-ascii?Q?SJ7kute8kVo+2bJMxWX7YroW/gvUKHQD0Aq7mA6HDfE1hnob4z+qMMr1OtaV?=
 =?us-ascii?Q?djI6RW7At+6bMMX1k18QeZ+3vWpoEWQXBnQg7sRAY3DXCfcIQUsMfd8bMiEc?=
 =?us-ascii?Q?SmbQ0mN7rAx6WwFjXfzc+GpV5wVPR4nvMApdkAQ9teE4SsvNvtQA1VVDeTXX?=
 =?us-ascii?Q?CiWHgOYtw41jHszL2Tg97zKqG8+Uu6t/ndojH8mdeLGiVed3PxvQ+By6hdtE?=
 =?us-ascii?Q?nQPuuJxpqvNmUiIzUZp9A7nQlTJeA9p3yENHy2vkh7gNZREq2hxgmfaYb97+?=
 =?us-ascii?Q?KI2sZAg4rTXFtut7e4pFqsy2Z0cLfz2o9sABhEfqyR12b0aoV66L5wX4t70m?=
 =?us-ascii?Q?f0JBwxDOyD8uoIGbohRm8WCTGGDa67VyezxnDxyPbHysyi1OC45udeD+7XBu?=
 =?us-ascii?Q?UYDSdwN4qg1/cy2yZf5xgtwBgR0nOes3FzmCUvXFGWCRm1DQLYeHBMzB1hfu?=
 =?us-ascii?Q?xU0oJI7Uo1b/QLaM8wE/NlIC8DqTXYZAMbjo3jDdsUF8jo/lPrV8tR2E4i//?=
 =?us-ascii?Q?2y3cF7NdqMZNkEZghkwMK+DBRZ5kJyJeNWyTrZjT02QxIhrqeSa9JoFptXSK?=
 =?us-ascii?Q?YysioCIAsNHR7zdK+JF9aP0uT1ZpUJXRoyh+UBhUYxuWaMY5G7GFAXRi2rPm?=
 =?us-ascii?Q?I+zzVDOHrf24XhqlEegwAAtqPovNITrNK5AvTMSiNaQuIOPg3fQMCpD7Lz/x?=
 =?us-ascii?Q?5hLZILq8rXrSfMF1CH0h73RKVXNM6icT6GmHiX8wOjDiQGtEUmRpptXU0K4o?=
 =?us-ascii?Q?cpCLJV1r9Sah4eixMhJ+1wvF6ASuCXR+bOcoGQlQAcaLkhlraiwmpMUy8c4o?=
 =?us-ascii?Q?tzJ5kXeP9+9y6d+BRMAwDrLYFS7ownp/e24LCzl76JYNie7nv9LAfNYKWH57?=
 =?us-ascii?Q?9GdvoHxw+/m7ksa78Qd88jJR9zhpYfILLYE6zET0TuVkjjzAivjAki/dFuKU?=
 =?us-ascii?Q?VxSAX/4rKcUZpQiiyNTBYLkO4HZHmydtgLlsKswXd8YTFHQeU+i8v6UeuezR?=
 =?us-ascii?Q?kigK4LJec/ro+6bntaYfNWM5lQ/d6MT/WpPpTVVF7rDGdM0rEkZLekrJGxCr?=
 =?us-ascii?Q?pQOCo5MZSpCVKEixA1+11+2r/JLGd7CzWvJkhcShq+GbQKHpbnImTEjyxlUK?=
 =?us-ascii?Q?q5JwcXivn0UXCkXj5ztXzT8tmZNcdNC5zDziFiF3ljzkAVj766gG7nvxpTdT?=
 =?us-ascii?Q?Kk/6uzTyuZ4ktWsYWfUl2tkZ/T9aL12cU9pUYHU7k7GIh68v2RH6SSc6Vwf3?=
 =?us-ascii?Q?AdsG4TYHOroCPxQ4sP+AXwndbKx098f67Dm3+87fShPmwD0QV7/I2BOfYM4q?=
 =?us-ascii?Q?/+5jGAKUwA2qBeHQIjjkOJ8XTL3AopfWRfct9q0P0FMdhfLA3nmlKEXxMfEQ?=
 =?us-ascii?Q?Twx8VpHFu2Es0wdg8hVlZILvrN7AkExF88rDHsyQSyaZgtfllaWkDf5y43aq?=
 =?us-ascii?Q?RRxRki0qld+1jB7h7Fq1njpvGIRrAb9xCLPSCMZeDUU4sUo8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3457321-57c8-4e46-63b0-08df00884a01
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 20:02:26.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSYUTvZnwnOcKO/RcW4875gIxixlreiHCgRzuLX/l39wpsqhB/MDkJkUi0gc8kdB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8835
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_130230_854273_B83D4A09 
X-CRM114-Status: UNSURE (   9.74  )
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

On Sat, Aug 22, 2026 at 11:16:35AM -0700, Nicolin Chen wrote:
> On Fri, Aug 21, 2026 at 08:15:26PM -0300, Jason Gunthorpe wrote:
> > > @@ -1276,6 +1292,12 @@ arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu, u32 sid,
> > >  {
> > >  	return -EOPNOTSUPP;
> > >  }
> > > +
> > > +static inline bool
> > > +arm_smmu_kdump_is_attach_deferred(struct arm_smmu_master *master)
> > > +{
> > > +	return false;
> > > +}
> > 
> > 
> > ?
> 
> This is for !CONFIG_CRASH_DUMP case. I think we need it.

Hmm, I am testing b4 review.. I had written

#define arm_smmu_kdump_is_attach_deferred NULL

?

And I now realize b4 review drops lines starting with a #

Jason

