Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBB7CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 02:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vSsm7iSf24w3J1l3X1h7BcyNoo8qw6QJr4VMWlNtbI=; b=N0Tsl9/oHm0MTnWENgZxDy0kt/
	X66QPTOIEH4cCE+N8/Lfc54MzgXvB9T2eNgbOVDN3YwNonevZzc4y65tTO3YSBxYwCVQRn+deYoxh
	5kf+fjjAydBKuJiIt5Aam848P8KGAHutldNuwnhfnetJYfe6Oj9WxVt/7JdLrAH2wwNPZZP2zUsKP
	N6u34KLR/35/YjFDpi9hh7GByJu1yLZN+PWjmPNu0daXWuN9Mm0qyCGMtEBRBt3evLTujsvb7nEP3
	9K4huv527Rnkq70unkmYU9nZGepQsvmAQ6IkOTPLClmdNMJbmdks2EQQ+rVTEUYNL9G/HXjIS5q5H
	uUajo3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo5o-00000003gwu-3nzK;
	Tue, 09 Sep 2025 02:28:24 +0000
Received: from mail-mw2nam04on2062d.outbound.protection.outlook.com ([2a01:111:f403:240a::62d] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgXK-00000001XP8-02LB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:24:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHUQb4BQH43bCFXpid5DdtiXMbEqGAWETSKqgl635e76sCshmadKzdxflcuJQ7rcyJh0Kiyx0YxvocyYwlTQd0kOL5/LHoyDhzuzi685sKmXO5RGxL5HRs8ZuvudQvfi51QMiyZo5+2O9xgJXOQjj5LhUA/eCSObAPTLnStcq+BtAvpx7iV7Xy5lByZpnsIdZi2d2dAJrnuKRrHs7aQwKq2vD7xRuCs8A61tkcH6UsdCjqDtv5hyZkNQFBVDsT5urboZAAe/3F+IjxdGniGSgltdwim4F3SKrYXssyCj9qi9g3M4XeXzoceeLM91s33v0JPyPN3ub2JwK3xqhvrncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vSsm7iSf24w3J1l3X1h7BcyNoo8qw6QJr4VMWlNtbI=;
 b=DWz4ZWE6vqUsqh2j1FEBfU7WWGjNTFx0FPBm38wsYsZZ1tsF/ocH/o3LV8xPRhJvPY9pVFSP4FOE0Jz+VzFHvBunjOCyZBj27gLzpPxOgkGU8vLXA67GkIjhmuNUPTcjdU+grw93WycS3DtZ1cyigYJ8QhRDOA8Rh1c0xqXqatzi8GeTmyCW0CdNjL/ihQRcjjRW98RRZvFuKpb45nYWqW5ugqBYVWq6Bk4BCKpcB9hredkub8qvQbwGu0GLshF/1jTa48uluL9dFEvab3op2UdhlhFUiGkgxs82QUL4kvSWpwZ4w3RwoYxX0yIhRVIzOotkY2I7CYMhHbvEFw3BSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vSsm7iSf24w3J1l3X1h7BcyNoo8qw6QJr4VMWlNtbI=;
 b=N8q8qmklGcS/Kk/R/RQKo7jRRp7QxqsnG16y7dtKrGj8JVGJ+lxr6WsjeJdapFVKIRhMIYXVX7zHmmGZLIqSIa8XAXpjYg9QFPuAG0oswfjKqi+hRiigtmdVpy/OSAhGGL5wKqsBjXCZxLra1jcb1VQNe5x8UvHuPF8G1+rWY9dKwFuiyMJTNGeH8bxHcaolHn27MlMgvEzz40X5ADMkYyOGOASpNoDZHVpD8t/DczwDVJ8FjWP0MtwBu1uLm6lEXaEG0nX8NSTNP9UvLtVjMMeD+BnT9cmKKFaPQ/1mJQEOiAjO9kJXiaLnRT1D9Ru9ffVM6Nh/ehPIFGGP+qVUzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SA3PR12MB7858.namprd12.prod.outlook.com (2603:10b6:806:306::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 18:24:06 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 18:24:06 +0000
Date: Mon, 8 Sep 2025 15:24:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jean-philippe@linaro.org, miko.lenczewski@arm.com,
	balbirs@nvidia.com, peterz@infradead.org, smostafa@google.com,
	kevin.tian@intel.com, praan@google.com, zhangzekun11@huawei.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH rfcv1 7/8] iommu/arm-smmu-v3: Add arm_smmu_invs based
 arm_smmu_domain_inv_range()
Message-ID: <20250908182404.GH789684@nvidia.com>
References: <cover.1755131672.git.nicolinc@nvidia.com>
 <8c4c5aec144f65cfd1fcef2eafb395876dac97ec.1755131672.git.nicolinc@nvidia.com>
 <20250827184923.GC2206304@nvidia.com>
 <aLvs8WrxEHpykCT/@nvidia.com>
 <20250908153911.GC789684@nvidia.com>
 <aL8ePHvQ25LUU81J@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aL8ePHvQ25LUU81J@nvidia.com>
X-ClientProxiedBy: YT3PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::11) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|SA3PR12MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 643efba0-6ad6-4b27-890e-08ddef04e517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|3613699012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LZ2L9FrX+CQJEVaqrOBOnZi1LxjLlAIn0cwl6zqDa99MuYKoFK9XRswffDDj?=
 =?us-ascii?Q?ntF9XEGwRdAAqKMLHIKU62ri6y8uuylSWy2zkbqaH9EJPkrkqtAKC8sHvB5n?=
 =?us-ascii?Q?vmvObdoYmTSo6Tej9zmYr7lLBaLLiq50B46nRaNXr+cCkdTtfxRJSUoLfsrB?=
 =?us-ascii?Q?mGuRDibhHPxeab54cqQXtfICdF2JRdMJxR8L/MQTLCnhAnvnzyseVJTtZCSB?=
 =?us-ascii?Q?zdf3qFCHqHyEzUQTqr/wN4PTwSKolj7ZbiRm1Lto9gjvoSCPconDsBi7r1yv?=
 =?us-ascii?Q?WMgbByjKqrJ94fO7UgkYFP6YcxxYr02TJ2Gri3k3OGWPLmkLDGG126qDQx8o?=
 =?us-ascii?Q?yQRja2oj8ez6EcfOOQRHXzOtO3dPLE7dHRR/X0pS1YnZVaJ5kToqEfhn8gJO?=
 =?us-ascii?Q?cGnKQlNAwa00q4cZ0tA0DS3quyW/2EH6GwkNuTOo3OBPTzeZFoLrortdkuNj?=
 =?us-ascii?Q?lf0H1ueDUrtuxBnv9aEw9wdmTXEmtziT9PEXZWQAyzDsSInJvCuqP5ISTE/c?=
 =?us-ascii?Q?O6vikO/VGzm5cH3sINgaEvRApVq5s16QlP+FgPxiVlzS7hkci2l7kGJTmIvG?=
 =?us-ascii?Q?MQdljC6r5m00p47vdFVL9KS9rGE9RA+9zLGv2ok9YxrncpQT9JJYnXjC0Ub8?=
 =?us-ascii?Q?LpwyfOLUng3pUzb597OAV5A/vNmU3FQWQ4Hl7XID8RShZSgSxNEIkV3pT/qh?=
 =?us-ascii?Q?rkdWpD6NjaC0v+QCi1xZzjl17oPCyMAjZPiSy0x9XtgHLfd2pSZJiU/H6vdP?=
 =?us-ascii?Q?uDtKWsS0VEZhESiNwEaxtBzY1jf5NbDG0M5LfTI7gIyrXBGP9cPI5nysObuX?=
 =?us-ascii?Q?y7cfiqQa8CDoAqZg9O9AE7lZtacPBNJCVqiJzqOY4VEnDw2py7Tj+dPZVqEa?=
 =?us-ascii?Q?dQfCjFP+mlC+fYEEyIDBCPaNtx/YMZCOmLAW9QfOyfzBFawd7P8dAvqWJB8U?=
 =?us-ascii?Q?bk+CMrW6oQTkj/ovb3i2/ahmpCbS4BVg5WBSS4Y9uDJfyvVPhY5xxtJv9lJG?=
 =?us-ascii?Q?AUIHFZEJZKZWaruK7yLDoFXwF9GGiKkgSsDEZwnCvL5VpQBdR3IY7Yo34JGR?=
 =?us-ascii?Q?QeZEe4GCv0LmiQLt5C84BQoOVgyzuv9a/TR90/4h/otcDeS1fAq9w9nbYDIE?=
 =?us-ascii?Q?v6A82Cp6Hq2u+wWnOb7rqNdqKzxl3+u7mFI8s6dplJQTo8o1JMzO1XWJ30ow?=
 =?us-ascii?Q?DfCopTxu/lGqXTcuFB9RjDVlTIxLYCZAqLmz4/G0qP/WuYQ+wDCvM0Om4oCH?=
 =?us-ascii?Q?Z+KQnX8UMrXV6akSVU2bsen45zlN9oAty5mwwyX5nzN8UHNbHFdgJOcrVJh3?=
 =?us-ascii?Q?MAFXauljZDmofP7uw5NoVNMJmT6ehyFk/oBHMe4J/uIA3tI7lkb5ogExQV9M?=
 =?us-ascii?Q?u7RmlWecaRLvOSOLdG46SXV7RYFTFe2cB4CuAeoRn9lt3vu9Udf/NNfW02/d?=
 =?us-ascii?Q?J46DyGC1r1S/xy4jo38vvOsfgU2sY2Eb2Yd6xOspGdLDqK+p8sSdKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5753.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cWKWiBypEIUPoV/CB8N3dn86XDhoxR8mHBldhJixRK3dfwD66ZmqQ5iP96Da?=
 =?us-ascii?Q?IInI+pPI/9aKeNTEP2Ft85/QPJbaHV0KwXPgVxIkJ3p8kI26q2oOlvtZxp+R?=
 =?us-ascii?Q?wpqbCigrj19iMbZ0Fplhu30eF+ASh4LVrd1sT05xgQ3/LIwIfsHg3zR4zJf+?=
 =?us-ascii?Q?m2JT3VZGXjVCSRtxsn8CQhDOEp0ig0UAYr5gNB9RcYlJyWjeO9KCRuR3iv8v?=
 =?us-ascii?Q?jh+qibXTd9EXubxY1/gAynicVWmH/mJupSlqxLwAZ8gvcrEVMDx6uQCHKozD?=
 =?us-ascii?Q?Vdy1JRYTGkwrZupyo4YEGq2AOrbYS5hXsuXC2nUcOe+j3sY4v3fMV+Wgq5du?=
 =?us-ascii?Q?nFOQ6+gy2M/wrVexDcSNmqzW3jchN33y8WgvNv6XjrIvq21sgbLADakSNiOG?=
 =?us-ascii?Q?b9a9E2pfYLRck1lCkFwJb7jexlCFhCJf7lAQs1BpAjg/DrYkTUV3c5WqaRuV?=
 =?us-ascii?Q?rzqy8E6fmGXDcBNqnsoP8blKnhQ1R30PRhhj2NJH7p72U9iYE5aFYyLWsRjm?=
 =?us-ascii?Q?RkOYmZ7updBxCC89zGNtMghCY2ZPL2OeS40xQsIv4ktd+mDBJDJ6dHJsTvrx?=
 =?us-ascii?Q?VMZzcylVvIHjKG0GanKi5UUGWAqWmRoWe0mWLLICEZYwvoBqLT4cPzNYxwzW?=
 =?us-ascii?Q?XM938KB7sGk5G5Vq1or+JCy8F1NVnJ9/hSpbsNPCRd5jXegdVBXtSzS4SVsz?=
 =?us-ascii?Q?ZeN0T8SL5v2Z7q1sscEUVkE3HyrynjBtg2k3he1jJ0L7vG0RA49fkd3uRkM8?=
 =?us-ascii?Q?bLndTQFbqF6QiGxjuxNFt9ptlE4BVDu84nC/3xZzTyUYrZ7vBts2PsLJsMEL?=
 =?us-ascii?Q?1Usb6L2CAZLIt6LveGJvgPWoG7LU8x8kn7INVVYN62dNBSs0f20LxvllxH2w?=
 =?us-ascii?Q?wc5tu0S32SUNmzPc3CDl/WHaW8jn6oxlO5hcylRxL59FZzLm08LtzpG1cIjZ?=
 =?us-ascii?Q?Ro4oRojHpkz8UjsmUDIRIaBEk5csKzDmodUsBuCvyi+TxSKQFrEzRIlS0KYj?=
 =?us-ascii?Q?Y92HKG6QsN9USIOQLO0xtl/M8wXkO3zEbuuf65D5WRU0Qzyvi2+ZGFF2hg6s?=
 =?us-ascii?Q?NKG+3vGPwTfT7UzkywiqnRPnZsKGoYJo+VYPKdcJQSknbaQrvS54HpM7Ue7/?=
 =?us-ascii?Q?XQoK+vvJnbEtSRYdXUPkKkBcUpZOsktYCtBjVurCjnk147BgNqTpe+nSvuc0?=
 =?us-ascii?Q?5r/+FZBLdm7lvJMcuaJJQ06flta1lsRocO9+v/TWAiGKtwrSC5hBaQMwKwPA?=
 =?us-ascii?Q?j59uh9yolBVNmwFKA/HA0CzmNgMuH+kp5tjfzO24Vum4K/LmUsXmDztmyxJV?=
 =?us-ascii?Q?z9f95OwePMInLvg/DiQSp364ZpyhVoiuPt+3FJe7PjqvMQnvx41hEpgmy7+F?=
 =?us-ascii?Q?LcJ3co/F1gaJ5mzWlH89312iVSgpHEv3cZIWOqTNpIYA1cY3u4AIMppHQlHz?=
 =?us-ascii?Q?fJj4eiW1pi645R2UvSg4yRapdFBS4a9KQra75+V7JIkcglu7C0O/DzrpRyG3?=
 =?us-ascii?Q?awZ4TLJ/1XpMVxHHs9CFYWvFY40fLtU7bAkcR0pdqJtuTb9lRmwVDafM0uRG?=
 =?us-ascii?Q?DY32s4xUNCmTuq/NJ18=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643efba0-6ad6-4b27-890e-08ddef04e517
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 18:24:06.0674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PNYnCO6edBNQzkE/h2VkmZ7XgxoteLc4Mr2HMItaRics+Y6H4TPBe1qUESJ+ovO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7858
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_112418_044002_2915B2AE 
X-CRM114-Status: GOOD (  19.04  )
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

On Mon, Sep 08, 2025 at 11:19:40AM -0700, Nicolin Chen wrote:
> On Mon, Sep 08, 2025 at 12:39:11PM -0300, Jason Gunthorpe wrote:
> > On Sat, Sep 06, 2025 at 01:12:33AM -0700, Nicolin Chen wrote:
> > 
> > > I know that performance-wise, this piece will be a quick respin,
> > > as the attach side releases the lock very fast. It still looks
> > > a bit complicated. And practically, it would respin even if the
> > > attachment removes a non-PCI device, right?
> > 
> > If you are paying the cost of taking the lock then it should become
> > fully locked and consistent.
> 
> Well, the point is that the reader doesn't know if an ATS entry
> is getting removed, and it can only speculate by looking at the
> full list.

It doesn't care. It knows if it has to get a full lock or not, that's
it.

> So, would it be better to just always take the read lock, while
> applying the ATS condition to the writer side:

No, the whole optimization is to avoid read side locking on the fairly
common no-ATS case.

Always taking the lock destroys that.

Jsaon

