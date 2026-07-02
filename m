Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D87C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Is8eINyeAVVB+DLIHgXjkqR8cN2aETcY+mCrmiLpgo=; b=VLXEj3IZ7odraxqXR0KCHK/vVh
	hK28eX3Yq3xEnHi4jDqM/rKhTRPwygl2YhbAec/CBi9SGl43bpQuGcrcy3x+/n2Uu0cIJSwaJ9v/S
	dm7NBaXKtboj9nHPx84uLVagocJtgM/zUn/nwaO96EhANxSHW8Lqva2iqtP1VeChvif97lyrpQJug
	VM93mx6AmiZzhZFXvLmAqRYL0Lr1XZGMRrkUsj629K4w5sr3pX9YZuP31eQE/H1Pd1G6QULS57G9q
	X91vK/tK/HY+24b3m7vEvAvMChm0PvlSWEh9tC59PY6bhk6pX7IM0v52BWiQZkuVolS8DA4S593JJ
	tCwePTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIcF-00000004eIb-1ht5;
	Thu, 02 Jul 2026 14:42:11 +0000
Received: from mail-westus3azon11010008.outbound.protection.outlook.com ([52.101.201.8] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIcC-00000004eHx-2CjY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:42:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7MIwxXnn4Xvv25uG255cgiVDXhqxhJZpaHmC1MbxY4T6P5CCu/aq03C3y72eAakt4UO8saIC1NKs5QfYcgBcwrrwllBJIAkSeLiCiHMLkUJsoP0d/T3FBrvfcqol3cH9Ks8yKPtRRVS6qC4g/3JO8eVELkJfPugzestNIvh7stXWkrFJxw9sxoMCOUXZdwh2CJjYgYYi2SX0XZ3UvPBil/tTMdrcQ+kEub/1SoQPWFHTYKuHesP+yC1HPDqaCuJQE8Wrfbdf+bU9m4vyp51zM3uf+4uXCN9MDquzf9Vb5DMuvBJNp/TkFqKkJi7iPvSmqEcdgYbV92krPaiN4cg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Is8eINyeAVVB+DLIHgXjkqR8cN2aETcY+mCrmiLpgo=;
 b=KmCZeDO9O94qn95YUAjj9U1FiNRl3NMxDcatasbM36AFEKWO2yCTY2b3dF8XOITriqQUsunRBr2Z5U71OCqmREyL+vH9/jqkoWjo73+5laSZrM1bq8iN50/d3ihSM1zFDBtAl66gAiTo2b1QPF9xJ10JYIZTp1FDAtD2DueGtQm3ZvHvCgMTqt40u+RtZegeUDXS3yVbdKBmfeBlwAYDIDemsN+o1nxZKxQcC/dgPiyGjogqnuX1CUXTPb0rjOMHBj72YOSiFcrmzFEnayjTNg+dTjrX/hCJmg4t54cyo2+v8n32n40ozswZmwO+HtU287U41v7boyfe28l2AlqnOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Is8eINyeAVVB+DLIHgXjkqR8cN2aETcY+mCrmiLpgo=;
 b=oEmIpVhUtoyb3x/ZSNuhbrCMC0m0gyHalD534J9qmUwj1BTmuClCP+81JKT+ex2Wjv+URldIR0buDvThSwDfNhzoR492nZTelGbelsQZA/sGbreRkV2ynI5DVaYs9i/BxKbuykxtanyVMMLI2W7Y7SN/dGJLDsmwUm0TvrN8GqEcO8W0uVfvO6j0FCuuXaBZ+DCvs/pyEZ4G6+9PkLeZ6+kj3lkgrwrLHXgWLWlMYceTtwCwLzkS4mqe2Kd/Yv2vomENgDXrErjPEAViG/41pEaK26VVF6aHWPUeE69nzkktdnvrOF5fEnnSPPxdlVKszR96YRXtxQGFU5HXuH6M/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB5813.namprd12.prod.outlook.com (2603:10b6:8:75::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 14:41:59 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 14:41:59 +0000
Date: Thu, 2 Jul 2026 11:41:57 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Mostafa Saleh <smostafa@google.com>, Nicolin Chen <nicolinc@nvidia.com>,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH rc v7 0/7] iommu/arm-smmu-v3: Fix device crash on kdump
 kernel
Message-ID: <20260702144157.GM7481@nvidia.com>
References: <cover.1782799827.git.nicolinc@nvidia.com>
 <akPB6l-fuJUcg4a2@google.com>
 <akPX_N0P2EcI_jbV@google.com>
 <akPhuF9pAWaBXzpi@google.com>
 <20260630185942.GF7481@nvidia.com>
 <akUQj2pa1W-MekgF@google.com>
 <akUX3T3fIoN42sdM@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akUX3T3fIoN42sdM@google.com>
X-ClientProxiedBy: YT4PR01CA0250.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::22) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: d7570ea1-5d2b-4313-58c0-08ded8481240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|366016|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: mKu8fMrJJvTBzDIH0BOOoz+vHttD38qzDzhOxYEtNzgR5f5+7OMLbWB8K+SK9lh6QuD57mDJmR5khpWeUjXcObfgEbjcHc2aB4Y5Ya1qzEtg/A9lyxGES5mZZG1k7ebRlwXfdyOLNjZ+wRFXx1OLfwKIBpXt8lbYog7bgiikxD8LB/EiHKzM4yUkn5n+aGZs6QrE69doHteyiH9HWw1FfBZITadthsDkySPWwTKkVMXvZb+WXGNMfZJ/ry8sCfs001jtjjj1PChrNvf7n/ZJ17iThqLdqkf+qW9tYT6oXTirwjvHxmJ///v0q6GESBqj5VdbcygPL4ieKaiNaHa02uq4A1zTRbJGHvP51jqoxowRopSHdYCb55pLhVrC4t8MvcWJ5QuRxCfz8ye65HswkFKHD3gNNMNGvrYripIMjeOQpJPvtl3EF68KqsoR/V6sZHW2CeEeFd7V4Y+jY7aafx0shpSV9dEN7cskdybBiYQtyyERK72h5kOlxhEvyGm9KtT4bvDtKfHafsNpfUJktj0W3WfNix127ZR2ztvCsXBKF1I3Gw8+wk5jJ9wYzlVGnU41XUVJzkgWELiEc7h4gyvNMeRmjHiyXLCHU/nMeZNcTx+0pf+xu4pT6jL7GyZki2nb9XtVX7xmNiq8FqrFGfYBtjmdyWaAmEKKdungjkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uL6iBiLfzQ1EEmHEPUtS7NBIkNYI2zzDA8CBa9I6gLEQwSamdYP8oVBKoX7S?=
 =?us-ascii?Q?4g9JLOlLrc5PEGsE3/LW/qtJAxoCZ8bJu29mxDRHYuwmRGp+31ykQXy/uom4?=
 =?us-ascii?Q?n5Z6i+/ygQaAUdQKK/jM9FeadyfWkVhYIBW2Oj2JZjxOCk68KdUVG+3RFrUx?=
 =?us-ascii?Q?QfHRSeOLEMQ6LVKu+7yzc7CbQ8HWq8EqmXBeFoRphET+QvLdvxAbl67Wnp92?=
 =?us-ascii?Q?KWmVd6Hgef91DgyGD4jQz5fdLRn0i+PayDngXxi+EHy6od0Z0sxHxKUUsljG?=
 =?us-ascii?Q?toyCk2OTGjC6mg1DWOgX+ABstieFQQBDbkFvpIxjZPpSW4u7ypbZrWqdFIG3?=
 =?us-ascii?Q?1S1MWw5aumcMOE9IK/+KGIv2/Dv5j8asoXDk7f+vzXbUslQGJcBY8KL78+Mw?=
 =?us-ascii?Q?XfQ7GAyORIy/adX3rXeAs+g+8DbRlCcXReBsW8pzBOH79rj+5X2tBGgMlHnb?=
 =?us-ascii?Q?GJvzivsVOVT7FtROsOb+29zH5ER5/BZsAgohvHvLjHKe3W730K3kZ4EbUQU8?=
 =?us-ascii?Q?yaL58pqPXCMVyaB+/7CbDYhKGRuo8U439uBWXcHvA+X4OtKFabUz97aykXpE?=
 =?us-ascii?Q?kgZgQRyFqqJvEBa9/u22l6hLScO0iZYTLN3SMpQsyCzCAcQU9cds6xNhpF9l?=
 =?us-ascii?Q?VDqxDOjO0MEJ7UQnPbgnhsSZ9g+G2mMBzeQCeB6CfqoP9BSIJmC7Sw/9Bz71?=
 =?us-ascii?Q?Fnf+04mBohw4H7yMfWcH/zRabW5iNNakGKHMRRsZ6kPeBgmQyTPZljtHojod?=
 =?us-ascii?Q?on6y7xatHvZ+CVI2xvtXbMhWzcM3ssfcAyOk6UskBKXlabuOG+BwNDJ/ByLn?=
 =?us-ascii?Q?I3/Zsjni+wSGU8TufwJIkZHjtdBBtAsZINzzZqYyTOEGj8ZFJKINKIdXuXXL?=
 =?us-ascii?Q?KjH53pugwhtqjAKXX5Id0ZX6+VaDP8dY479KB4OZQo/wFP8j73fLEwj+MLzo?=
 =?us-ascii?Q?/6d1wzuVKeol9TuzKSPUpgybXIYnv9R7VZ8Ohx6ShvrTek8Q2d8o+THY8y1s?=
 =?us-ascii?Q?+A2iCFwkp40MfTxqwksOfYhC5aK4USszfU+cZZdZY15AmNvJuQCQd6gqfdA0?=
 =?us-ascii?Q?M6U/IzwbSKofFCxVzGs1myw3O3PFEs4sBBvJMByhBuK8YpztU+/HsA6TY2Co?=
 =?us-ascii?Q?5NB/ubW2jj77Xa1NUOdq2xkJBIpVIdCa2tg9KrJ4+xNK7n3nFIVzCOSRVogf?=
 =?us-ascii?Q?7ozeC8AYOKZxYX0MgH14WJ+avU2REoJ9GCjbklxgH/V3Vycrvh0fp8mIRhPi?=
 =?us-ascii?Q?O+iL874joDd7QOxDXGTwE19yUhPgyHPjekMGwcaD7+9p+S3aEuu8Ym0GhTtn?=
 =?us-ascii?Q?V5s9uod2Ec2dc+yyipDjwjnDUhPy6JMtkhgYHTDtzQ105bitm8YOu/HB/Fbc?=
 =?us-ascii?Q?jVN92n4CY1VJyV80b+ovNROFV5ly5Zh7uhSkU/oE2SChQQqAdV87Z3qby1Hm?=
 =?us-ascii?Q?SEUHIqcGQFC8rLTzwajcsjUbCg/EInB+yYE/3S4imZuiaTjmjo8g0vMenEpB?=
 =?us-ascii?Q?6ZTzlGPESHttIKrea+42dJfOCYYCUyuleJn55CAsOh0bv/K4PKm0d+cX58Tn?=
 =?us-ascii?Q?mQ7w/PbVDPQRuJHLNDV1s5tfH7FF5zgN2UbeR5tTWo7wCkq81fmoAta2Faxq?=
 =?us-ascii?Q?cZsoHeXJ3oi/gyuvrqSNfNYlL5hxYbwlVDOPeNLyKMyULH3tISYdGrQ39In9?=
 =?us-ascii?Q?AR0qoebSZ4Vda5WWX1c935+ONjegfWJtUQwKYl/Coj5XZNfR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7570ea1-5d2b-4313-58c0-08ded8481240
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 14:41:59.0588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylMJV0lnIGhiHgaU/QqPAsdNLGXl1XJbtpqZtAZaOpjMJdOCro0s0agmHtyBa1Xy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_074208_564286_1E3EABC8 
X-CRM114-Status: GOOD (  12.95  )
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

On Wed, Jul 01, 2026 at 01:36:29PM +0000, Pranjal Shrivastava wrote:

> However, I agree with the overall problem, i.e. IF an active device
> unmaps the DMA addr after the transaction in the previous kernel, 
> (with the SMMU powered ON) but the TLBI was missed due to a crash/panic,
> Any new DMA in the new kernel may alias onto a memory in the previous 
> (crashed) kernel, not the kdump kernel.

It looks like there is an issue in this series, it isn't doing
anything with the VMIDs.

The VMIDs that are in-used by the adopted stream table have to be
removed from the idr as well (and similarly for ASID if we don't have
VMID HW support).

Then the VMIDs that may be dirtied by the prior kernel remain isolated
and are never re-used by the new kernel. When the new kernel wants to
do DMA it will replace the STE with a new, clean VMID, and there is no
problem.

Jason

