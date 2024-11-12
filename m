Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAABDD32D81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXIbQQQ8yDyW7l37GYP8bkvAQbnhwG0mdYvYqZwCELs=; b=gLrigEl8VNEcNwjz7EOsLdyqRm
	OyEVBDm4J4AckCu8hjUAOg0SYZwktGUfXqo2hGLKcKk/0HlXlpfYiCQMydrSymLX8PytH7D/0rFWs
	YU1LXzOz1bbrSptNch1hwXnEVi5MZBKADQQIS0PyB/PSPJKdoQrdluaBuQVKakxDkG7VwINh+2NaF
	C6afx3+72yRIgBJzwATRa19NtBU6CmT/CEzQXzuJyXW+wYFUul4VbQjeiVWNJAqz2gKHxaUdU8jQ3
	qsrBDfIYlM/t+10EFVy1qDWKgCzOc/voIWPVjt3zLtNfy2nsMY8dMO6pQ4aradwxGBeeZRvsbyeHr
	+0j0gEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvg9-00000004ZHS-1PCm;
	Tue, 12 Nov 2024 18:31:53 +0000
Received: from mail-mw2nam12on20605.outbound.protection.outlook.com ([2a01:111:f403:200a::605] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAve8-00000004Yy1-3nn5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:29:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4Dpq6iW+BuRURrTqWCAP8MeH62RrclAyNStdhNjfmfm4MiS3svbFk0CnBKmDKyeP3lE9RgNGsMFJCFU3pjeGmEx22Fi/ku6VO5Wdy2LLMseesoRP7ieF1wusD5O7TQuFY3d9IXrLnpRYXNw996Fr1g1qC9b0Sfr6hEi8K4uunFO6kefRRsowImEyYF8m8RNFdAOP0KjDTzrix/GUPwh+yITLItKeAuq3vhqac59dhV5LQJ/DWkzDEmzfj3AQvWVYaC4HLXDwjgJ5N2yuQj31ukypoEbY7uDcjpcy3Po0Fv1uNWpTBq0mUxtEBKcfIX6YRGbKMisb4YSxbEpdebuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXIbQQQ8yDyW7l37GYP8bkvAQbnhwG0mdYvYqZwCELs=;
 b=Nd8Fim/USs6d6/rBgjGdvtW7GZsJ3Qm/Ehq+Pw4ZE35HPag6UuqspzXmYFjv9BdpgDolq5UXmSYGxUKT/NSq3mOOwWyPNbPBiOKx/+e/Fy7fnzTPTjxwzMBTGUtLmiWho2iMWZCe2veHT6PhVX5Fe185N/jXgxw4JVqxiwcuaEEIkjg1325fSnXLDZOb77eTwIWt/GIwKGB99w/0YeI/HokWmAMEhj0/YXRv9swL7uXLSOIXGtOIXBnMyJdNlNPObZhPkhz1jzWneYmRxTwx8fM0laZ1zVw8K3UgcFl4OyvaxUefHZEAhUUVj9Q0O8pTDEcq6ow2/3w1gn8Z/LJ2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXIbQQQ8yDyW7l37GYP8bkvAQbnhwG0mdYvYqZwCELs=;
 b=QEnvaRPpzeHmbqjspP8RhxqMdqOs49Jav8QnTAt8sgT2e0WuzLDbfkev+1LxI+VItT4+mbCJ/N6uE+al3U87x6LdHrrddz6VhL/1AcyI+SZzYnOUi5SEWVp7hz3xGni5aER+puET6Va2qJbz+4lPUUXDrvhjgPRlLafwhy5MYD/iydw/cuOu2DBGCHxj5Y/ZF5i1cX8bv19nFWr3exR1wzK3SF7liSikGeHTrSrXjYni0TJkfJdVeCaE4q696uxWpv3l9EGgvBBhIRZ/loufJSgnGjRKy7HJjEKIxHjBW9NSogAQjYcpklSLJyNNRtp9aL3SHYL+FxFG0rpGq35CWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB6482.namprd12.prod.outlook.com (2603:10b6:208:3a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 18:29:41 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 18:29:40 +0000
Date: Tue, 12 Nov 2024 14:29:38 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: acpica-devel@lists.linux.dev, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	kvm@vger.kernel.org, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	Michael Shavit <mshavit@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v4 00/12] Initial support for SMMUv3 nested translation
Message-ID: <20241112182938.GA172989@nvidia.com>
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
X-ClientProxiedBy: MN2PR15CA0065.namprd15.prod.outlook.com
 (2603:10b6:208:237::34) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: a60af493-d0e4-491b-181d-08dd0347f835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M3lgGGgXyx+sSjVM5yu1uEK+v1kf3OfMMPDPCFeO2gXZIFImAyr0xW2CR1uA?=
 =?us-ascii?Q?r5y/8kNKHdKqxGoAie0uN/B35tuGXRq7mNVpzD9LtoffOB1GE/5xUl9wPvNY?=
 =?us-ascii?Q?Vd84EFAa1nfptHc/5UPSl+Xotr9uYgEnz0DLhhrTnHGusyGOIIYvTnoO+Urc?=
 =?us-ascii?Q?4lV/GURcnFqTVy6habeYb7vYcjBMY7pAN9f0YjT28Y2THFrFkdFiWeK00ZJf?=
 =?us-ascii?Q?as8mRd6s3LsS6VtIp5ulj+WnXbchv5aL9FKGfeGkLrUCUz2eLJdvcm8LyXzk?=
 =?us-ascii?Q?wZPdgZpIrkkmCTLjZn0wW33KmWceLvJxGVE4J9ocd/oR5HMK+ADVEfLT6w2W?=
 =?us-ascii?Q?E8o1yzyTsNMCx6ZdTFFc6nFq3bhuOI1GPx42pmkRnZcpleHCTI4Bc2gEoNdz?=
 =?us-ascii?Q?3aeQcE0ejlc8EdzqlweGqGAXry+r+kfeD29LJG0vDGs0Gns2S0EtyEdhkIzy?=
 =?us-ascii?Q?oXs+0FEwu4NJk0JSqBDZnasEhJ6/3Zt7w6sdXyXAD5nW6gxkCsUs0CaSPLh4?=
 =?us-ascii?Q?LbpzWEaFC4TbMjdOOoCRVEaDMTh7mxCwU6iwTeyKJNiFMRYGphvn++mx9ANZ?=
 =?us-ascii?Q?y3XxC7D1UXNVvSh/3V30bBc5+2aDpP8W7JkBzpM0hoWcJmCfE/9F3XuW5R+T?=
 =?us-ascii?Q?2v5z7/s/Umdngp7pRPthzPg8fGgrCyEmeK9I1XKKqd9zy39bx0hpkPpI32bj?=
 =?us-ascii?Q?OUry4umYUEJ83zyrqeh1WT08lR/m1MboI31IHky2MAhu4/+V8NFrd7iQIN56?=
 =?us-ascii?Q?gt3lUSWwRhJIZG3N7jvU3DAcvRkQPr0lqSYACtxNFeXjt4huoZ4SgVe8Tw9O?=
 =?us-ascii?Q?7NWmu5BTT/8xjVb8ix/HXHle/E5hxkHzSrwBDBIOenJQerK5CnBPikR6MiX/?=
 =?us-ascii?Q?gRy/NjMJUR/09fLqD8xOuhG1AVPl+7ElKPmgDCj7G0AJTpO5m8r/vDheo4nx?=
 =?us-ascii?Q?u96QSBs00iB/WKYYAIZgAChg8vvfnU8YPXIGGMH71PtWSjjEDDO3PvwrVAfb?=
 =?us-ascii?Q?Mi2Bt77tgeR+oUUve1C4RKBoSNCK/bomTTqO44O/eOkooMSS+cexUarxFK+a?=
 =?us-ascii?Q?ka1Tc65V/re5SLXN3wRXEfm0k8j6vhvwYvlJOa9s862t4U8yChR2k0DJgSsP?=
 =?us-ascii?Q?zz9Kn/NtFIXfs1VuOi7dOycpEkQLqUN7vSC8f0HsZB6bHuE1YYo46exrpYbb?=
 =?us-ascii?Q?cCu6EY+H3PIrFqt9GTMPoeKE4hBRpvo6LyQ/ljUeSFCqhTrgYmpvqn0HLN5x?=
 =?us-ascii?Q?XrJ3+LtdsMjvD+Ktq5ayJ05YfUS6/TmJKB3pEKwFLqKTO5pi54xWQMtHH5jm?=
 =?us-ascii?Q?v1LgAi1xYGaGSeNH7ueKi3UH7O5G4rBbE44yEmFO3DAVs1OsDI4DWH+cSoca?=
 =?us-ascii?Q?fI5gMuY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XYMQAUyFGnTXWbwdUe3WC8bsB3n9HT0ge7sji3la4gThn8+FGa3yep9BASkD?=
 =?us-ascii?Q?Wg0ifESUNLwzujAsSdtoZWt+apFr7S+DMq8DogCwHqLmcwBIFWkaONKnAH/0?=
 =?us-ascii?Q?uAoRRSqZXZDpphiJJNjbtYU/hK4bU7+CNK7n6x+2ko1Adjrfe16e1JLfqPwe?=
 =?us-ascii?Q?ACUIls+zkA5iGWeWXXzkpHGz7VYRmHWqeIMHXHHd3lpxAaKpeGyN9G3HuNU3?=
 =?us-ascii?Q?mqSiJP+kL3+wETvbLT5gcoG7DQISB3gfJCHPXA8/ju8B9bK9inM+2r7E8+QP?=
 =?us-ascii?Q?ceR/3iGXq/GpmguZYd2ISvDObJVI2IsD3NdIAOfnyi3HPaAAear/tq8A7sEA?=
 =?us-ascii?Q?36T4r9qdctj8EZRCff8nCG+rCCMRWoJOKX/IBk7pHRQNLOICd7Zrweq0CgkH?=
 =?us-ascii?Q?As4KQNb6Z27L8NkF0C0OWDqlTTCiPFb2NKWrcUIlYa3JEV+ypVOeLu+fjN0/?=
 =?us-ascii?Q?7QBCUTVDYgT/jom8W5rTRmbN1N7kSm1KThkckrsizFr2lRxlmOOamr046fro?=
 =?us-ascii?Q?fXwKX6Lmj3zNtt6MvBPnL/OUDMyO81Lxctfp//Fds7zC+Zj0an0DZn5R88UM?=
 =?us-ascii?Q?cMGPBJ/lNJUdBI66Q+H46IVj90gDdV15giABYxIv/1kUdQ1DKjKolKAW+K83?=
 =?us-ascii?Q?w4vQb0MqnuPUcf0TIOazzqx6Bp+2h+0aJJEK271GZfHQgcsrfCds4+E7UjYJ?=
 =?us-ascii?Q?3zu/RYI4Hygk8Ys13TSxtBNalY/UH8J4oS/bXirVn4XJ+KYmcmQr8tNqr/VK?=
 =?us-ascii?Q?LcV/sZiClI7bWWuXn8L7UpHKN0Slq+3vfp7oksH3pIAEZSY7NJSM3NWuwqyc?=
 =?us-ascii?Q?qzob24BYDeZzT+wH5geLrTUUJMNphaA+TUUZFdKXJ1JDaXTHct/SU+S4VWgK?=
 =?us-ascii?Q?7aEdpx3jTy1dCYSU82wtLLTNNhOu6Hv9FsvylK6O+UToxQGLf5/h5yJliGOU?=
 =?us-ascii?Q?aXFZr7lHI0PnyZrgvMQjIeRxzZMz+3Gt1nX+CYJdcvLRXmZCxfxLulZ3tyus?=
 =?us-ascii?Q?yTkpN1Mv8bGnymnEr7/esDcUbTdpx6gVWNUEjPsb6sSeP+exv4SzaF3pmDL5?=
 =?us-ascii?Q?JSABeq43JenFY6k75pRam+HZHWMFudYyRQh/SnjkUeAYpUVg4GblNevp3Dm/?=
 =?us-ascii?Q?TP70A3gB/uOhoHdiMrYYrE+9WOEKluIleJwzA0P8YBOIziS1LSP5yDAi2hfq?=
 =?us-ascii?Q?3YnjTI20nTEufOJLNDkMteG/6JkgbDJZ7GluB1RIOBYbDhyk5RP9Un1LHAXD?=
 =?us-ascii?Q?Xul0s080JzTrxNQxUsoys/hzAg4ZU8PP/zk6g0O9BOuZr0AdyCyEfp2MZIXm?=
 =?us-ascii?Q?Cpblwy7050pa76HVhdXXGFBjXbbJJhgG/ZNLRkbdMfUTo544cB/mvJCnICOq?=
 =?us-ascii?Q?BKWpgfuGB+x7uqm4HmcCdKsZP7YuTlGseFfhSZWMntDXqGNX551RhrisnyyV?=
 =?us-ascii?Q?ApQ4nIqPZ1HhTJrlFQLX6baQnp4JWgmWFQtbJuRC7VvNZCFF+NAfGsUwIsMM?=
 =?us-ascii?Q?ayvKYX8i+DKlAMSSnc4mG1YPX67Ytmmsf6ukAWWuA6L225tEwu6ZqUgZ9dgA?=
 =?us-ascii?Q?qCE5917YvWngSeCYqDY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60af493-d0e4-491b-181d-08dd0347f835
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 18:29:40.0508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fExhsYtRoGGLNbIu4ccvApSNdh8LOSNB5eey6/pUqwbVWvahlIr7eYowaxtx0lc0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6482
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_102949_046458_38C2FFC4 
X-CRM114-Status: UNSURE (   7.00  )
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

On Wed, Oct 30, 2024 at 09:20:44PM -0300, Jason Gunthorpe wrote:
> Jason Gunthorpe (7):
>   iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED
>   iommu/arm-smmu-v3: Use S2FWB for NESTED domains
>   iommu/arm-smmu-v3: Allow ATS for IOMMU_DOMAIN_NESTED
> 
> Nicolin Chen (5):
>   iommu/arm-smmu-v3: Support IOMMU_VIOMMU_ALLOC
>   iommu/arm-smmu-v3: Support IOMMU_HWPT_INVALIDATE using a VIOMMU object

Applied to iommufd for-next along with all the dependencies and the
additional hunk Zhangfei pointed out.

Thanks,
Jason

