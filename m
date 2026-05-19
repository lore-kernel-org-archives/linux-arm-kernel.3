Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C7CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVF6EIzyWoRYwrm8AbkDslANkpge8wPa4mduGp0eFFs=; b=1BjTGJWKQOtL4J+13uxlwmCRxa
	v2AXBI+5jRm0wDRcnBYbWDhc+LSL/2VPnVHP9k2NJr/xxxnWfOyZfl+Ajht6mj2mVnhth5Bt5MbzJ
	S7fg/zTxIvCKZlTszHDz7en1pS9xUrDXBEibntZ9fk1lo/9R8reViGczKkBDgj+QPRxujfAhH2+Yr
	JFhwEeyGdd7TJc4/F2K86ZSCJ2TLl1BG5TkNuNAY/cj9yaZi6wc690jTV7cGQ+NkbZG2zgxn1pXWX
	az1QvkD2bhcF5jUrTgT6M7yWs5z6BMTVtF8NpwBHSHpeVpBLROMpwrXFKX7ND/AW+XxP7nUDHPLPy
	iwIOzKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSuv-00000002x2m-1pYn;
	Tue, 19 May 2026 22:28:01 +0000
Received: from mail-northcentralusazon11010046.outbound.protection.outlook.com ([52.101.193.46] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSus-00000002x1s-1nU0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:27:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Owf9M+bqkmrmblOPVWNsAcFQ9eGf4AVHD2L3XhZ/ynfwOlgwWhnQA29PPQth5Oh6at7Km32TJt79D+cUWzp7fr84eoRgGrr9LP9XRuzjnNtMQm34H1YTYgQnho6cedcvTzGPD6qiGWrjmKGloWH7eRXlm9UgK5f2VUSr+LQGqJ+UsYP+h24X8V6Wqr8P17iNXvbL39Ktvd88Gv8TOnOy6l8pmJ8KHSnmUfv2HkBdn8Z4R3YjK37o9nZLW6ZXoK3s5D0lp4c32UnMk6Zb3TMzO9hTIEUbKnEJM8F1BJuLSI+BoOttvVF1Z9AMSiPUeUV0sjjt8Cr02ZBDLLmDf7SVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVF6EIzyWoRYwrm8AbkDslANkpge8wPa4mduGp0eFFs=;
 b=mcJP2D0IS6rbQs3zk2fZKYD3FuccR4jfyyJbdoYbAdoqBDD4Iv1ePRxGh7OBU2FUgSCKcYbmX8mxdeEoRwkxTLP+mkm6vMjw7ghcE0Sym6jK45b/YMmlxWRNxCSU7e02VwRGRqRDFP2J2sqIDtBZUbfvW20i8sMYAC2mHOQYuLaL4k/RjBiiJzGdtmqNWuigzuOs3AxEhO+JVEZIdOYQ129Uec9Bwkx3i+l274lPWnEu1OjI3vxGWWDm3iHFo8EaLN520ZLts0lxnrH/SGNCWQ9T2wuH1aRAM8We39noAbkNdZZR6/UTbifR46vgPgWArCBC5Ticdmssl9VWvOZolw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVF6EIzyWoRYwrm8AbkDslANkpge8wPa4mduGp0eFFs=;
 b=iaxr2Pf0wfRSAJyZ0wATN3ojEVhj96aBE2VLLaqcbY/3wMjx2bufxHhnhnk/+VIamsFX2PNgcl2ZlYeyor823gwS/mu6YUqTeeVNlCPTjFYsBsJny/KstjjOrzLeU9Wgt6Nexh2J+qbG7P1C0nCCk+PrIKANRBolbapkMfhAGf1qXuorMS6mHzDhNzl3W5ZCPQ0H6xogcsMNyI0Si7jeykmtESzCwp41clQr/5uUQ4+aSjJKnVN2N+I+9L/LFouTKQY6ZT0j4+YJcSeO5zDRVYUL3P/r1l3jsNmjcYpWKStSDAXr3DH3HLZ9ZchFCL2z+coOAgsyNVdeQVevVd+CBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 22:27:50 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 22:27:50 +0000
Date: Tue, 19 May 2026 19:27:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, kevin.tian@intel.com,
	joro@8bytes.org, praan@google.com, kees@kernel.org,
	baolu.lu@linux.intel.com, miko.lenczewski@arm.com,
	smostafa@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH v5 3/6] iommu/arm-smmu-v3: Suppress EVTQ/PRIQ events in
 kdump kernel
Message-ID: <20260519222749.GL3602937@nvidia.com>
References: <cover.1778416609.git.nicolinc@nvidia.com>
 <6e5828f3288aed6f9e9f4e0ca54e7fbd9f439274.1778416609.git.nicolinc@nvidia.com>
 <20260519174453.GF3602937@nvidia.com>
 <agzEVS5SFKHPb6/u@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agzEVS5SFKHPb6/u@Asurada-Nvidia>
X-ClientProxiedBy: BL1P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 486e5691-bf09-431d-d350-08deb5f5dc50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|4143699003|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: rra8iYBb+kWgtSubN/4Ne4RcDer6eRyKNv/byUwSHjpQBRVmhY8hittUQUX5p4S5dKoWInJxLexy5UVAHNpXyxKDJtPyPEYRLNrq5VhhEv5xGEdljbQpyPKNesqoDpPIElY2ZzOYmE6PY3AntXfacBYtNHfqmJ2djNiel0S3ZRrSQklFkeEl04V1l6HMWq+scVlr7oWbIP9lrQjiYSFzQ6Xzzox54T0Aw1oBtsiM30V5/245/tAiq87eMdWfRgNFEa91RYeLZ+icTh9xWgYj0JGi6UCY/oaaRnEvpJ6j0m6AMvDPpX9m8kSTLPHH8OXy3JQWkoZuXasZaZ5Nr0Nt5eczKirYe4Ey2f9jbz4KQMHRfS33Nlx4/S1acU3ugoScma6j8zsMyedrQLvAA2Lc9e1QlzHFvZIFdFygR2CeS6exgvIa2Mc1yQn/L1YHD/YEuda6rlrb9LECyREGkJ/t28m1Do3UWPDqCpprfd9oSGaVrRy0T/xwSxYaM29a6dE2DlipscV/lpmAc/bfNAqxGXSB1f+XEksLCj5rYcj0llx2Li/0rbuVdBnCX4B8pJ0Y1g1ckxPgtI9go24OOp6XeNMAg5QAbTpJOS6QPXwuwjXPAmMzNHy3Oj81sJGc2lNa2o/GtBzh9ftohv1dEjPeJzJpJPs7/3w0lMy2K7TM8nNWChHZlkdfc8cxzxlEBiWI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(4143699003)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yiteDq5zcwCLbslGFZrzDtBSVFfmiR2oiYig4TgUEl9/qPAHaB2tP6o0Rq/R?=
 =?us-ascii?Q?mf5j8Ypu3aiYi4h86N/eOgzy0fm2ubKMScaewLZCeZaKWGcAjDnl5AoNiYW2?=
 =?us-ascii?Q?t2E2hyMXZAc16pJH4eBsI56ja78CgplAe6LuzmXVX/CtQqAE1i4ENyT7l8GF?=
 =?us-ascii?Q?5Q6Vjq7trQoHDzKcLBea7FAG9o/E3N7wMw48dMVzQ0mS6yeglDuroeAx2Etu?=
 =?us-ascii?Q?qML3v2KFB/htC+GtSbNydajSXgSpiZFEbAjrDgzSthk5jrQspxBhmlfgniaw?=
 =?us-ascii?Q?4Tg+o5cAJGCDm5Ldsbzh8eJen9FREBxv134gvPCwFMJBe47fYUMgfCUSU2AD?=
 =?us-ascii?Q?nqrX2+ekyGz5+mLc1MXcLBsn/MURJvmDYv9jZOcDMFPYrenaYNI/1Jshr3LX?=
 =?us-ascii?Q?37M3k0Oc1Ko6aFWsA7U+Y+Dd1lfzt1WQtqwmLtoVMTL/6zglo4GGEmj53pgY?=
 =?us-ascii?Q?eMMUb7idG8m5q2W4QxC8G9Aw1l+7cukR6Jk7RK5etcrNCJip0qWSlV7VmFQf?=
 =?us-ascii?Q?66/ireXWlMiOCB3cj/gyuHkOCv8Zk8NisfZ9QioLUC24CL7B2B358vqzAou2?=
 =?us-ascii?Q?HzrotCTgl6D1x4XiPfLt8QcrEqTWuA54NFGuViKLZ2QZO33TYoAU+iKOaRiW?=
 =?us-ascii?Q?ufsXQLOvCb2iBWMJsflqYUrxJnaTSeAXlZ20uq25YsHwaGaProBT3WJMrcxW?=
 =?us-ascii?Q?2ju08F/mORoFS1V38MDYuG66HERwyv03o87UYhGLgaDyNgpxVwswDNLp2exV?=
 =?us-ascii?Q?dYXqaUAYe7/LkyfWVs8G4Lb4FjRQWTW6RxbgmZcfq8rpoMkEu0hizIdNf2AB?=
 =?us-ascii?Q?SLyYsCaNUR/z3GwtfNqHDnYPfAfps0i2fNO2zafUkyyXlMP2R3vkuI2CTABd?=
 =?us-ascii?Q?uZuUQzYLzxae3fuAxNKIvzEQZHSASAbH682B8Sugic5Wzkij5o6GTP/5wo4x?=
 =?us-ascii?Q?5wWRj0ZARgeVQopL48+6FwqiQHQcg5+yL2z0sNQ6rHlRlKHhqnMy/zVBFM6Y?=
 =?us-ascii?Q?yARHUfhl4ho2bRkVFqGK6nVHbLWqaEO3qWKKtdM8p5eTV24mMzfT+TcqtpHN?=
 =?us-ascii?Q?4JsyIxrAs7l3NWmw0Qtrh/UIpvLo37BhcdSjMg+V8V+WNzmr8skbfOb5nV90?=
 =?us-ascii?Q?IpRYaY5tbjzN8l5EG9yvY01yq9Y8D+ubw/r+y8/LyocZxXtQhJV8rp2TTnYe?=
 =?us-ascii?Q?YcMHi5m4XBmZHVyOO608NTu2nohqBMHUi+sIAQZAv7HpnxwW5eRQ+SzAZCdP?=
 =?us-ascii?Q?3hFfQMHo/HofV54Ld3Ya294xz5DPOv6ns15DUpgRNfc09zxkxyKBpLStWfLY?=
 =?us-ascii?Q?Clo/oPcwgfNESXsgtl+rbF/VNO/Nv+ewJ0AGhY5v+8yIhu2KPgJzAFgHro4x?=
 =?us-ascii?Q?/676zIkXSTCoQhN1GqqD3nrqZR4NreEIaRxvB4ncjTz8jgGAdj91Bn2szom4?=
 =?us-ascii?Q?I4KcOVK91dD7V20cCHSmGqrclNiJjNDp9SxrNgXO+36qEJyLymwxcH8q+qGk?=
 =?us-ascii?Q?ZZ9P2N720APu4EWh4SIjK1oLTqLAT2VcDTl90ggG8jy6p7XuAYzHy8aZJefr?=
 =?us-ascii?Q?lAX8qtaxe2662AonNd7TAVA/fwEyMJb4p0rTDTKR5MstGylIH0G8ggHZP5Li?=
 =?us-ascii?Q?cNQAe4GGkARSPKT6oc3OlyA72kFtSeXfwaSjnQ31yi7M2ylUojbUfl/3B4fd?=
 =?us-ascii?Q?mI1Z0Lj5hx8Niygio/XtyS8Hn4z2AB+uzK48am9fxwLdo2hq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 486e5691-bf09-431d-d350-08deb5f5dc50
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 22:27:50.3124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIg9YfqS2AqaDHjaVeWgPBAs+kp6wfYZNGwV6wWAWkveeTRXF57b+UJkJERtiI0g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_152758_468576_E1E6C59B 
X-CRM114-Status: GOOD (  16.22  )
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

On Tue, May 19, 2026 at 01:13:09PM -0700, Nicolin Chen wrote:
> On Tue, May 19, 2026 at 02:44:53PM -0300, Jason Gunthorpe wrote:
> > On Sun, May 10, 2026 at 02:23:02PM -0700, Nicolin Chen wrote:
> > > @@ -2364,6 +2364,14 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
> > >  	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
> > >  				      DEFAULT_RATELIMIT_BURST);
> > >  
> > > +	/*
> > > +	 * A combined IRQ might call into this function with the queue disabled.
> > > +	 * E.g. kdump, where stale HW PROD vs SW CONS would drive a bogus drain
> > > +	 * and a CONS write to a disabled queue.
> > > +	 */
> > > +	if (!(readl_relaxed(smmu->base + ARM_SMMU_CR0) & CR0_EVTQEN))
> > > +		return IRQ_NONE;
> > 
> > I don't think we should be doing register reads on these paths. 
> > 
> > Why not load a different irq function instead?
> 
> Yea. Perhaps we could even entirely skip their IRQ requests. Only
> gerror should be kept in kdump case.

Yeah, if the irq handlers don't do anything then don't register them
makes alot of sense..

Jason

