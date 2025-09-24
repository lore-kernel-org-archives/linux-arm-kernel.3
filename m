Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDC2CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 21:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H56afC44vAYginp5JM4OkHZp2D6NzjZ3Uc2yeYbisfE=; b=XDTH/zS6n7l1qMZcSDjNOnzjMr
	bBA0Vz8lGGcEEOg7p927v06cLEepnyOYpJIdTzvJKfm7xJ+hHMlJ0sm0DkGT3mUCow6Cly+zkun7T
	IoKHGAaqaLOs7RRWsy5gl21qS2DvkbhsiBkKSD8k+V0bYK1lGSs46jY4mU+0OtM1nYE409MIjODCd
	Gl/sFabugir3EUY8wsGP/YGupcCcXV1Jlc+oJNZkNMk+GyoHy7pU/GoEnl0OC3d3T2OeA9mMam4Ms
	0fC0F0pJOhzj2pQ/5B4EPhqi28BmbRv3Oh9/ALINRor0oFVnhCi/AVJbTUs3Km2LHdbzf2nMMmrva
	M9x5h7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1X3d-00000003uYd-14sL;
	Wed, 24 Sep 2025 21:29:49 +0000
Received: from mail-southcentralusazon11011004.outbound.protection.outlook.com ([40.93.194.4] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1X3a-00000003uWa-2f74
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 21:29:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yls3c5zMWJRf6EhuA0f9Nan042gLEquzBBjwEGf8ebShimbptYcnGY3kkUvbvTH7siKw0t6hb8XYZfHu3KThOFaALBu5TVsNvHO3u+lgctcOb/9mUDEFjBE+06SNB53vD7q5+X3xvICXoY7yVRGzjDrWLbM0fM4Pj9Qjz2TatgxHrtPACyxj5dxNFtPbOg/Dg7VySdtOAuE2VeUr1bJxinwsGKWeGRXmADU8gPNjacLJb1p14DnwJomKklk0Jb8ArlyXtyqNc9ZBwdsk6GiVspP9tjdbYldkTpZEPCJqkssLUiHzazcmPO5ndPOBk9pVd5YpRSpkR7j/nrZR1VpqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H56afC44vAYginp5JM4OkHZp2D6NzjZ3Uc2yeYbisfE=;
 b=idj3K+MiT7Qn5qa/DHhvzZqb1jL0iDh+zIc0xXsobLdFTquZgsG8a4aMksNf2YrDIznpHPD4tjLIw6VQ5uAd0yqH+48I3UomnEXoKBaGskuwHGPWgNlGycYQcSFCRmRvoFGgehXeovGVjK6uxzjrHu5nxdYpzZfHRzzUBYppfA9uJdI8I2Pl34Ww7Yp3zDNAgkDbMb6Udsh5EtXaGxvxHdk/7qVe6vJyLaow0sgFBxyx+h/ZS39T4xQWdmz7sqrd1EO907K42LsIr+VQfl+cv0mE/a2ziJE9OPEXxh3H6LK/gbSXlJtbRQ/aiKAfMuUIcK3stxVs6iMLJVBHG+xTrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H56afC44vAYginp5JM4OkHZp2D6NzjZ3Uc2yeYbisfE=;
 b=ty35MRNUj1abtXjN/2snHNYhp51mIBcNAFrTWLjdpO7mUdzwsagGJpBq/UMi5fdFCNrYGTT2je8ifa0EM479YQjY+LU29HMCWWfoDXwu8oGoH/mozrOXCWF9jqZUik1XHP/6Rb5WCV7GY5xfb/4XqReWw/kvvT7QQMOg6Do/aJqDZEftPfBoaNYjY+mm+61fGWcAzTfKZJ2irQdAuYbV5lnCRHSAkLfvQYncfa7tnb0n8K5aV72ohtH9GNVymfhhmZUnYJnaw1/ruiHiR03ulS2cNFc/UcrF4//QXo28iw70tIHEz9Bn0L2eYVOShtWTgM7T0WyKSnKTdeais7Q1ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SN7PR12MB8004.namprd12.prod.outlook.com (2603:10b6:806:341::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 21:29:15 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.021; Wed, 24 Sep 2025
 21:29:15 +0000
Date: Wed, 24 Sep 2025 18:29:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jean-philippe@linaro.org, miko.lenczewski@arm.com,
	balbirs@nvidia.com, peterz@infradead.org, smostafa@google.com,
	kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH rfcv2 4/8] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <20250924212912.GP2617119@nvidia.com>
References: <cover.1757373449.git.nicolinc@nvidia.com>
 <80310b98efa4bd7e95d7b3ca302f40d4d69e59c5.1757373449.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80310b98efa4bd7e95d7b3ca302f40d4d69e59c5.1757373449.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SN7PR12MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 945b86bb-643f-44e1-4128-08ddfbb16903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VLb2LpL0OzlJ8mCCwKa6hASE9Zt+RS5+E5vXtQVqnhv5bG+M5QJ2dxb5dikr?=
 =?us-ascii?Q?mK0mvlPiQNd3BItXE9Kjkbu72FiC3a9gX/PA8xJb5lZWMT2pDg/hzPKdAGsG?=
 =?us-ascii?Q?Ixb/+enTBUAYzwbvPCFiyRE2jh8UR5slXH8QFR7xbyZdNbTrFUAYNI787odQ?=
 =?us-ascii?Q?kC7ow6PjTGumGeAASr8YcCSBCplWuwY4AnOEyLQ4CAVWn0FknccaQ6NUDHAH?=
 =?us-ascii?Q?Pz6BL9nW0Jujod+Cqs/ptwUQeNHjRLhZyCBNQ/2Q/bw1ytr+uvwTf0BsSssS?=
 =?us-ascii?Q?qFsrjcr01VWDxkAsfKsFdWTcWAPnnMCQtSvFR4ZfGRx34d1BaprvaRZEaaGJ?=
 =?us-ascii?Q?dmucUfgygjDlFaYwG92tH5xwv+nPinv+e6eaxfobV0Wtw2bkpZSnHInUgV5b?=
 =?us-ascii?Q?thBZpHpw9lL4SA4rR+rkKwxPvZZxXD9YwAJYVnmzweSI7XG/FBB0vT/l7ybY?=
 =?us-ascii?Q?sH42rRdWD8pQhidk0gLObkFnMmmNZbLtm8ckpU8Pmdqw+Q3FR+7ZnZPaup3Z?=
 =?us-ascii?Q?+ayscY9fiYlIxUmqgWcARTFS5UrUzmf9HXcrIN+w3EphsmZCFQqW7TGTyIrF?=
 =?us-ascii?Q?M4ixDHYMrV5YZ1P1pQGt8AbUqtbgPEcSSqbygkyrNu84Xv91R1WHVANhDEvn?=
 =?us-ascii?Q?eIfBmsaoEjUyaLIkZpa8qjwa0QjulGKzYTStMEc3LYH0y/gFetaKc0t0XYLs?=
 =?us-ascii?Q?z7zFQyh9WcGqZBTuGTLV6Awr56AFgCElDpKudzC7mmQmZiBhCerHjrquTXP4?=
 =?us-ascii?Q?E9XikRNR5BroeVscZUN9eiEo+acM4WYiEf1JMRlmFL7NP8D9AK6thhhozQEN?=
 =?us-ascii?Q?9LfpdiEx19FQIC9bVP2wCFmKSwJgZXfp1GWH+j5XsliEeew40J4ftO5Uxzx3?=
 =?us-ascii?Q?TK3wEkONck3k/lMjYpgfEXaDHp81CCtUD18eXlQLcYvTxZd4ZDI7Kh1cddgy?=
 =?us-ascii?Q?wWuMsg33ZC/8Crf8DFTHZBdjZJfsNwYXlj6asnpDC86wIbWk2B8DewOZAggD?=
 =?us-ascii?Q?GD+3davNikgH6dVNqq0aaeYyeN0B5z6R+1hWHUlxG4pFPER1iGhRxs1GpuO1?=
 =?us-ascii?Q?G1ztHc87k0SsxReoWRkiirxF+OlNAHCMPKo/rnVL4Uo17NVjRuP4TofFrMZn?=
 =?us-ascii?Q?aa/mHhzeWMnr3awWKiBhzNJFbMhB8Pi9zYZ+4Ys95dQbe32QGJrEXEfHmxZz?=
 =?us-ascii?Q?gFmK3NSPPyb8Y+Jq+V88yAPeLGn8xJxMDYUMyYcmuJZvmBbFY4n+A0Nfarcz?=
 =?us-ascii?Q?HnwrNIQGKAfb51Nt0/3BSMPO07D134ilLRk2Qc+e6iv2v2vUjEcwMcIYwljU?=
 =?us-ascii?Q?3hXzetLs6AkC7Z5W8eGO/ELJNORK/MMkUbGQ9/GCHwgJBRCDLzCriJi3iHZm?=
 =?us-ascii?Q?YvQTtzQLPq0GUX9t2smUo4uSowsO7m2uY3tS4AC6n9cgXGc3st8XP/NRRHpQ?=
 =?us-ascii?Q?+CHyvF8RqhU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Pff+MT8uzCK8pVWA1Lup27t15GsH6tHZN/bxf5nu7R40h9965wc5lqsZSdi?=
 =?us-ascii?Q?9SRveCWKjb1/Pp4bkjQHyls/16VJFXH4Pk9L1pU5sm/tBuf5FYXywnjqFVmB?=
 =?us-ascii?Q?H/amIeLjLV5GQpOQdaBqNmmbW24DPmfC+VBlYMkos+C5fZvT4xGu/0iyTnJy?=
 =?us-ascii?Q?U0ZQWMcML1s+g7Jx0XbjQpwzOvTnyjlFR/zrYQv5sN7dSGADsoNMvTNPqD0I?=
 =?us-ascii?Q?mDLNmNW0bZKSUbqfxqWMef60tfLk+bJFH+2t/SoWYvbJ4fOagQrovQwBIZ10?=
 =?us-ascii?Q?h3Dur6m3XXhUkiTsDO/NyKqd3RphHlvVeCi6zhQZRYci12dWSF4Qf4cYr+7r?=
 =?us-ascii?Q?4+LlYFaQ9aIXmUr88XltB/lgVyOcPwJLrlvKUvdNSxV/XOyuZqBDD9GzaVfO?=
 =?us-ascii?Q?uoKe0UPttE70c3FXCSEtV6BRUOV3DVWb/zkY7AvLwmJHSsN66HCUF7ibcLit?=
 =?us-ascii?Q?O+LFkS8n4E05egk3CEqiYFpfBNSQnpI0KZOyACAt7TTVXxoYRWnKT/MaZPgC?=
 =?us-ascii?Q?dLyPoNMwF7RPbb63yXF5BAmbN5V86hvSFYaW27Kxo+/ciElvZjez+h7UJCBM?=
 =?us-ascii?Q?wkKsxtm5aCWFULHJ5RiF9IaBsTtMauoQxodRyQlFGqIFiVLz+NteCZkCYqZh?=
 =?us-ascii?Q?Zf1DK0IG7/y3y6hkxzRVjizQjMZ74q2BiXMz0fMNGdrQOjU9p5GROLnF/51P?=
 =?us-ascii?Q?xqNLjqIN6hSKW/Sf0QCBGAdvGoNxB16F2rtC8NtfeKuKjDQMuH5AxwrIP7GZ?=
 =?us-ascii?Q?n77fSM+zVfnqVG2JHVj6pNU1efJTt4Dc0u4wPEMbBJeHSGNS0bqNrGxnFZgv?=
 =?us-ascii?Q?Od86ZLStfXck4Y8v5kyUym0GnuOQo8gG35NgehCISa+ghDoVc02cE4dNCBuz?=
 =?us-ascii?Q?NwIKvYKr1MzVsuxP3HCRphCAaWUqB49yRi8e4H/fg/qofqCvl9FWlzFSNaSO?=
 =?us-ascii?Q?lLurMb6IrI64x9TPuBPQO0zDf969u+vAnrkIdMKuKTn+H81Sv1ml4WpC33sD?=
 =?us-ascii?Q?I6FoVzz+l+4fR6Ue7TQFtFuLXyWJl+2FiBJG5rCy7gtuoTDiRp9IP5uYBm8X?=
 =?us-ascii?Q?KOUaq9tF5xbKi8/174Dgsgf6fs3vhIT1NnTVrbIrlVlLq2AfLGNN87jiNlxX?=
 =?us-ascii?Q?xbwXcFQzvAeB7uj9uo0L6/TSln8A5Y1k9WwzqNQM/NncoIHlEgXoP9L8ntSa?=
 =?us-ascii?Q?S/IoPF4c93i0E5JmySjN6HuIWnEAPph804p/4b8ax13pAw/zvbVpuOWmgz/E?=
 =?us-ascii?Q?AGPmlany9RYpP1q6P6IcygrEwjR7dzAMfMrU0DAdAsGWEGMTeq0myd5t3NJO?=
 =?us-ascii?Q?ox7eAQx4odMyWu3mQ/Wcm+91EyO67/U4bq479jbJFqsA5HMTcLmVWVrmv04s?=
 =?us-ascii?Q?CdsGCL7Jq+durRMHJ497mwyxyXxknf1wB/hrolfAWzvwMTp2qVD+iqdRKQVP?=
 =?us-ascii?Q?tpNT+CiyiTMGfqdeq+19uTx1jbzLUvMJ105EDRAMCE7+jKLTcIkogn5IgwdR?=
 =?us-ascii?Q?I2ODjN9/75Pe0v9nZawUmGY0brQf3M6xUgUu1OwqoSI0H+j4hjyp16I9OO6E?=
 =?us-ascii?Q?YWFfBzhXum5HxsrjPRsYpFiolueoNtwzCHm6QVf4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945b86bb-643f-44e1-4128-08ddfbb16903
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 21:29:14.9754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LB6D9A54mjCsMzKT9Ew1lbY+vdJeRrhhcWB4R2rm9OGTXJ1yeBrXACN0REhL6Y6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_142946_672853_50A2462A 
X-CRM114-Status: GOOD (  17.80  )
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

On Mon, Sep 08, 2025 at 04:26:58PM -0700, Nicolin Chen wrote:
> +/**
> + * arm_smmu_invs_merge() - Merge @to_merge into @invs and generate a new array
> + * @invs: the base invalidation array
> + * @to_merge: an array of invlidations to merge
> + *
> + * Return: a newly allocated array on success, or ERR_PTR
> + *
> + * This function must be locked and serialized with arm_smmu_invs_unref() and
> + * arm_smmu_invs_purge(), but do not lockdep on any lock for KUNIT test.
> + *
> + * Either @invs or @to_merge must be sorted itself. This ensures the returned

s/Either/Both

A merge sort like this requires both lists to be sorted.

> +struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
> +					  struct arm_smmu_invs *to_merge)
> +{
> +	struct arm_smmu_invs *new_invs;
> +	struct arm_smmu_inv *new;
> +	size_t num_adds = 0;
> +	size_t num_dels = 0;
> +	size_t i, j;
> +
> +	for (i = j = 0; i != invs->num_invs || j != to_merge->num_invs;) {
> +		int cmp = arm_smmu_invs_merge_cmp(invs, i, to_merge, j);
> +
> +		if (cmp < 0) {
> +			/* no found in to_merge, leave alone but delete trash */

s/no/not/

> +			if (!refcount_read(&invs->inv[i].users))
> +				num_dels++;
> +			i++;

This sequence related to users should be consistent in all the merge
sorts. The one below in unref is the best one:

 +		int cmp;
 +
 +		if (!refcount_read(&invs->inv[i].users)) {
 +			num_dels++;
 +			i++;
 +			continue;
 +		}
 +
 +		cmp = arm_smmu_invs_merge_cmp(invs, i, to_unref, j);

Make all of these loops look like that

> +
> +	WARN_ON(new != new_invs->inv + new_invs->num_invs);
> +
> +	return new_invs;

A debugging check that the output list is sorted would be a nice touch
for robustness.

I think this looks OK and has turned out to be pretty simple.

I've been thinking about generalizing it to core code and I think it
would hold up well there as well?

Jason

