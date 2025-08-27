Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6191CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fq5tEKR/el8ofAw80T32EP5IOEXunE7GwbNTc4myLMU=; b=GXipOrpPC1cAETTUjJFYwWjN1w
	bYuTQiS0QufYxG7Cawzl3GcZIHwDGJuvZ53VXnqO82lunatCSI1d23MEpMLAlb/RPo/woeqRfuBay
	YS0pCSNtod1ut6LD5+Fth7uWHERthaqCtfXCsgaLtpLKsVYf4CLPv6fUM7hOwHlsRABiTHwz5Nhbo
	KykTt0NymO4B/fjCeUc0umkyKVvFU6CI55EiE+AsegcUSQG2W53As2K2mkdRI54DMwCjhnw9ZWpL+
	fYdypTTCA58d1cTuwRg0sH+0G3LBFHLMogkG36HOzYShn3q2ZF25bLv1w1pwJASSo5j1K4pJ49D94
	LKWaFANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLv3-0000000Gcjw-0FXz;
	Wed, 27 Aug 2025 19:34:53 +0000
Received: from mail-bn8nam11on2061c.outbound.protection.outlook.com ([2a01:111:f403:2414::61c] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJoO-0000000GIMy-1z06
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 17:19:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXPYOCu5D7AcKqQ6wfUeDbkv/IDtW53xjfsjxI7qy5iJ4Dgx0qESdG+JunA31MskcwnwKpQB1ROrxnILYqweqYndPuZXPrW/lmeKt9Ilspa+pQtV6CNf84HFc6FJf232c+7EULl464p5arq+wfYnfjMY4Vap4xz0ajMXlxyStO7vKJECFmsBOC+2rFwwtSKKBqU55cxch2cXUnh8h/frz+/5OQxtIl2/Nh/P7IFBkyPHsItUM+m/xP2miHAOw2vRugG0fxUEoJ/swPs07/Qh+rKtspevRrT5fWuvIW6yIHoeqdas1PqwQgSvLf936qAUnv9o2/jKvrhcJ9Zrg14UxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fq5tEKR/el8ofAw80T32EP5IOEXunE7GwbNTc4myLMU=;
 b=pEhRTfbzrJEc57//YbRH3XC18pb1tPnbgBzQY1iYSo6hRNeIw5mYnDcmUnG9P5I+Ngy4m2FRshpDXYkUxwn3X2dJTWR5PwaLTtCD08/TlghxbsXfmcdqHwRtTZbLb/yA++XmdtUzJQ2SZLlekkgRm3U2YrFCLw1mk6qe9e6w07d4ZLWZD+toJPdpWcPjwHwQpDhXLrP7JRjl/QBMBRgVbycJX7bnUHCZ19vkgpjNbmNvebgahJMbspuFy/0zj5kRU7Uhs5bIJ34YEm+7HRIjX6WSytwSwJQ3s6a7y1iL/DG8GViJH6zcIKHWa+R+NM9l5N6bIasfyZblSQbiC0EMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fq5tEKR/el8ofAw80T32EP5IOEXunE7GwbNTc4myLMU=;
 b=Ww3/H8uB56jk8UPW/s/TFCFxP1l8wI+9Vy+4MldhPRmzVFcAjaeDywsiC4u3HdCPyiIJeondLuCmbHSTY0FqcYry1N8XGrRsItgrEkqMR45i5v4Fp1tU2KVnXPhxIUnkeLJcU3VGcKLcgWm0m7kyLnDmYqFq49Om9TqtK02DJBKTg71knVvhAcT7c17ULQSfFn8FffrkL5gk3gs9IQG1fGiqJsf2gjuUzNHax1vpR9sL6zIuCLlHIdEOPAbdcz1SinFq0x2oBNMm0lucC+HnXJqVw0VQl6bkWYRoAQJUHJKnGcWF2r3NDIpU8PbHIiNy6eb7EXp9ADnwGaGlEPO3TQ==
Received: from BN0PR04CA0106.namprd04.prod.outlook.com (2603:10b6:408:ec::21)
 by IA0PR12MB7507.namprd12.prod.outlook.com (2603:10b6:208:441::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 17:19:48 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::a1) by BN0PR04CA0106.outlook.office365.com
 (2603:10b6:408:ec::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 17:19:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 17:19:48 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 27 Aug
 2025 10:19:21 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 27 Aug
 2025 10:19:20 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Wed, 27 Aug 2025 10:19:19 -0700
Date: Wed, 27 Aug 2025 10:19:18 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jean-philippe@linaro.org>, <miko.lenczewski@arm.com>, <balbirs@nvidia.com>,
	<peterz@infradead.org>, <smostafa@google.com>, <kevin.tian@intel.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH rfcv1 4/8] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <aK8+FvkbpB9G9YA+@Asurada-Nvidia>
References: <cover.1755131672.git.nicolinc@nvidia.com>
 <fbec39124b18c231d19a9b2b05551b131ac14237.1755131672.git.nicolinc@nvidia.com>
 <20250827164804.GA2206304@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250827164804.GA2206304@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|IA0PR12MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 806d3b85-90f9-4530-81d8-08dde58decf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BlhgLRH57j2Fak5wm5aOGhMIedse47lG982ZiaB6WHNhPQ404UakZ9wjJXkD?=
 =?us-ascii?Q?Bq8dZow0RLfjv7nLG5R3PwiSuSEnpDXyhe+Bu5EAS7lGMCrqtl58VVhrs4ed?=
 =?us-ascii?Q?ESbKsifQfyJ64321F+HjHPrFc8XE0J2Hlc00EjxpxEIVlFNjDhaxDW7o96d4?=
 =?us-ascii?Q?CF/1EE9U00XyE7t4mewl0grt9qx9rXSkyKgHOCHzykYFvtioEDpBjcGPuXQh?=
 =?us-ascii?Q?Fw4jN0Hc98/Xi9nxInH14rQm1yxoxIgWo+cyWsRm8GQZw6QeTjcWnXyKG1tD?=
 =?us-ascii?Q?5+MrDxqnxhk1UcvvWgFibsmmoVJBZotXL8Lvv5Of8+zhExH5xEtOGhGgyQMd?=
 =?us-ascii?Q?mcOy2RLXnh6U4qDTFV/xuGMbpQn3zKqEDseODH9QBbUwOMLJTKbMpkR0CwZR?=
 =?us-ascii?Q?tIXo9yAPVzGgSPFrQMWwHh1E9sv2pBkP+/FPlhB60ibE9oplnLUP3Rja3eCq?=
 =?us-ascii?Q?PxZ2U+p/Bo/GSc6tkkL0hLiLg//5ZA+LUHZp/qJOegKFwHADuQX5YC1t0ySs?=
 =?us-ascii?Q?wRlepkT1RmDhpOfOOe1tfDCmChUVi9QrrvNqDRO6RL/nX5G7u5Jd/ZLz2+W3?=
 =?us-ascii?Q?Kpf8Caid8r7FuIQBZPliECRjc9Bc5KeDKKOzLuC2t+lJkgSyHO7/xp5/ksta?=
 =?us-ascii?Q?LUmcP+v/xCM+DUXVzzO1dJQ9NJnf0/wcB55YDpm4aMrlpDB1HRzCEET19ucs?=
 =?us-ascii?Q?+nJSw8DCb0elFTwmCU6fMx7PS/E/KisxwdS3eMgub0NLbwVFg2x2IVLJm+/4?=
 =?us-ascii?Q?t7Kgnc7ymtdHYEJwkaeASAGOU2G05p7gp50GQG1z245T2d5yC46J6xJOttqe?=
 =?us-ascii?Q?FGvcY71buZShpPRhCBh/SswId8yAJl0vzLUoZ3F61eSpcLVZ/O6q5SZtrj8K?=
 =?us-ascii?Q?hpICin4VRHeKQj6xIUBwx/Qq0c7iKV3yyXRtbXOWK1CZwljfVSjfJ0jtED8t?=
 =?us-ascii?Q?Max9Tlk3xHSeH2dgIorR+YFmH6GjJ0HWYUhOrc2rfkCPYX6K8zSofosbKmzi?=
 =?us-ascii?Q?DBflKIz0yEIaVEt3l1pMqRwjFuDQvamlytxPinUpMPFNVWMBDg6kSpz2UYnN?=
 =?us-ascii?Q?xFfqLJVh+0be+8DZhhvik/3FhNpkL5DSba2rLfegAEpEiHJjr5wXKYD5oDKc?=
 =?us-ascii?Q?hVDm+0QcS7Sp0Uk4xlg0l/MDq5sqN2cHpx3oK6vluVLOxivbYCYTh8FeayUk?=
 =?us-ascii?Q?9/m1XaRE0rnLI8IniN9b1wUCgd5bpiJfNiRHZ+6uS+03Dul/8NepL0tUaQHD?=
 =?us-ascii?Q?bpOOxwzFCdtrE72seF8nvbpT784vs75Jy6eETNoW1nEPD1HWsWjmtMSOLyKr?=
 =?us-ascii?Q?55kejS8pge2dNsd9YrewnRGmGkwvxt4WJLWFEMxAhb2VmwGYuNvUgvfaRsv0?=
 =?us-ascii?Q?iwUWSDbLYw4h6p97R92GIUKt7qV4D+6VFpc89jXbzwsZXFqVurUduV51gPKf?=
 =?us-ascii?Q?dBqOOq7fJ4zsyDyzEvnYovKdvUwR8SQ+02incdSF+7FrKK1DThFDQZQNWoCW?=
 =?us-ascii?Q?R9+YcKO2v89y+sXsT7PPiJLzs4HAx9ddoz2P?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:19:48.1667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 806d3b85-90f9-4530-81d8-08dde58decf3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_101952_516069_A6690EB8 
X-CRM114-Status: GOOD (  24.97  )
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

On Wed, Aug 27, 2025 at 01:48:04PM -0300, Jason Gunthorpe wrote:
> On Wed, Aug 13, 2025 at 06:25:35PM -0700, Nicolin Chen wrote:
> > +/**
> > + * arm_smmu_invs_del() - Remove @del_invs from @old_invs
> > + * @old_invs: the old invalidation array
> > + * @del_invs: an array of invlidations to delete
> > + *
> > + * Return: a newly allocated and sorted invalidation array on success, or an
> > + * ERR_PTR.
> > + *
> > + * This function must be locked and serialized with arm_smmu_invs_add/dec(),
> > + * but do not lockdep on any lock for KUNIT test.
> > + *
> > + * Caller is resposible for freeing the @old_invs and the returned one.
> > + *
> > + * Entries marked as trash will be completely removed in the returned array.
> > + */
> > +VISIBLE_IF_KUNIT
> > +struct arm_smmu_invs *arm_smmu_invs_del(struct arm_smmu_invs *old_invs,
> > +					struct arm_smmu_invs *del_invs)
> > +{
> 
> Having looked at this more completely, I think we should drop this
> function.
> 
> Just always do decr, then have a simple function to compact the list
> after the decr:

But the _dec function will always take the write lock, which seems
to lose the benefit of using an RCU array?

The complexity of the _dec function wouldn't release the lock very
quickly. The current version only invokes it upon kmalloc failure,
which can be seem as a very rare case having a very minimal impact.

> struct arm_smmu_invs *arm_smmu_invs_cleanup(struct arm_smmu_invs *invs,
> 					    size_t to_del)
> {
> 	struct arm_smmu_invs *new_invs;
> 	size_t i, j;
> 
> 	if (WARN_ON(invs->num_invs < to_del))
> 		return NULL;
> 
> 	new_invs = arm_smmu_invs_alloc(invs->num_invs - to_del);
> 	if (IS_ERR(new_invs))
> 		return NULL;
> 
> 	for (i = 0, j = 0; i != invs->num_invs; i++) {
> 		if (!refcount_read(&invs->inv[i].users))
> 			continue;
> 		new_invs->inv[j] = invs->inv[i];
> 		j++;
> 	}
> 	return new_invs;
> }
> 
> If this returns NULL then just leave the list alone, it is OK to sit
> there with the 0 users left behind.

Yea, it's better than waiting for the next _add function to compact
the list.

> No need for the complex _del function and the _decr function..
> 
> This also means the memory doesn't need to be preallocated and it
> significantly simplifies alot of the logic.

By "preallocated" you mean "master->scratch_invs"? I think it will
be still needed for the "dec_invs" argument in:
  size_t arm_smmu_invs_dec(struct arm_smmu_invs *invs,
			   struct arm_smmu_invs *dec_invs);
?

Or you mean the allocation in arm_smmu_invs_del()? Yes, this drops
the kmalloc in the detach path.

Thanks
Nicolin

