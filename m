Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BDEC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7a/GQCGL71IzVoggpRWjMreqk/EMbrCRU7TPnszJ+E=; b=1DTPaK6XtwxWfR6sGn0OpJWKns
	gx9lbG8i7Mep7LQ/6sylOeAZMVM/Tl2W8pW9kUbhCJY0pDF0PPpCJJGaep7j2sllyI3P2LUeBpbTR
	g4JXjGVq83L4d0ArFG8j4RHKyDwcBaDWK5hj48F4EzPWyOVJbtbVqbswqMq4E9O4DiuYwdcodcmSc
	j/shrY4Fjk5jksc++9YEixESo6LOCaUMQGp9QN6eQKMEFE7OKDz16ekHgiwd2KCfE3vdLp0r/SWbB
	H/3FtjazdvrbGrlJ+pocx5/6tOdqt9DDsgR07mh9kDAYLzXvaM+LnDKt9X876lwp6nXwKRwqY9IUt
	uAnD6eEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgzD-0000000EbK3-3x1o;
	Fri, 04 Jul 2025 14:01:55 +0000
Received: from mail-mw2nam12on20604.outbound.protection.outlook.com ([2a01:111:f403:200a::604] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgff-0000000EXvU-1io7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 13:41:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnoeUZBSFxmAahT9gSZCcys+lJGOqXsoUZvLh8e53W5Gm/xSwRhiuez40UO3TjrU3IfahEEehGfM/w/F+J8SZgiw6vqRHRwzthKuIu9GHWk5L79pUGZj1dzIofo0X3A3BweX6q1/+5geCfB0hF8SQ2e3+/EYqRGl5zMg+Sak1jkkVVkBJpNiJAI+f/qRxPWv6VRfBKprv4TqSFm9KPRAjdsEfDJP2ZurPcZg7NP4cGYn9lTgHzZq4QR3XK9VPK5K0oZBgkKzjWpUUXZmBPt5lS173S5ZF8mG+7iVWQxLr1/jSZvmq7WHKPKBNz+WEmtk2WVUk4YrtJRmgV1niXW/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7a/GQCGL71IzVoggpRWjMreqk/EMbrCRU7TPnszJ+E=;
 b=ttNfxGhzb4X4FaqzUT4AuLrgEo0a0M6GZbvSDeGa9roFt5L23H9Rua2k3xmWY1CYLsJI/5RJ0aXylT2+ZUO2I046XIVw+7ofs7EOEETH4emmgQFs1rNxxln6/SjPa+IPOK3AVJsLTSxGM7d6UAK3Ry5McZVuVWxxIaQAWO4RoQhpfWltmZu5o9sDek7iTUYcnAADwZnQEn7rp72WNOgRuxk4xvmVDcSKbCCZJUDNvUt7hnEs8HqtaQp2tLeQjEeTa2IoZXu4fdH+6aDsf+6wwPsbkiH7KpbkODS8GpLU8J7h8u2ZF8OrG0PnXXQbu5m48wo1tm5HnQXhxWDvlK5sYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7a/GQCGL71IzVoggpRWjMreqk/EMbrCRU7TPnszJ+E=;
 b=Zvf7fX+5x1a//kfNga6JN3XKVMnBE8ExWkoskZEw3TiABWz16kzX4eUGgDpfuYazFdaWomc2dfibY60Q3lYogQ6c0OgpMV2iTZ2ZKH3MF2ER3J1KrpgEl6ewyKgL8wK+x51nS2npQtY5WNYnvlRsoGLcbEwg5iouWEIz3nv2KcgBh9vsSQahu7CJvlVFe4cqFmD2Kj/CxQIJEzCVo8RkyXxXqKnxfqEIDhNafZLTpKZt0Vcb9WwK+A/NdcGKcgykThEDfRSx9M420ZDpk1NFMMiVX7UKzRAqi2npQA1cNIclvw7me/B3uPy5dONekQyFeoi/gEn32p7HUh0ljUDDCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ5PPF183341E5B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 4 Jul
 2025 13:41:36 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8880.030; Fri, 4 Jul 2025
 13:41:36 +0000
Date: Fri, 4 Jul 2025 10:41:33 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: ankita@nvidia.com
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
	shahuang@redhat.com, lpieralisi@kernel.org, david@redhat.com,
	ddutile@redhat.com, seanjc@google.com, aniketa@nvidia.com,
	cjia@nvidia.com, kwankhede@nvidia.com, kjaju@nvidia.com,
	targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com,
	apopple@nvidia.com, jhubbard@nvidia.com, danw@nvidia.com,
	zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
	dnigam@nvidia.com, alex.williamson@redhat.com,
	sebastianene@google.com, coltonlewis@google.com,
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
	tabba@google.com, qperret@google.com, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	maobibo@loongson.cn
Subject: Re: [PATCH v9 1/6] KVM: arm64: Rename the device variable to
 s2_force_noncacheable
Message-ID: <20250704134133.GC1410929@nvidia.com>
References: <20250621042111.3992-1-ankita@nvidia.com>
 <20250621042111.3992-2-ankita@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621042111.3992-2-ankita@nvidia.com>
X-ClientProxiedBy: SJ0PR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:332::23) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ5PPF183341E5B:EE_
X-MS-Office365-Filtering-Correlation-Id: 166b7b0e-b96e-4b71-e059-08ddbb007ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Sihb8me2zKNqWvtAUY/BOk9XTsyjdQYXr8GjUXmv/pjqhOHhTjmM8+bhb2I?=
 =?us-ascii?Q?BSV6uSS0/YtFe+8CwqVZjlrk8Oy8/6O+ArBXWEIdiOxthk3oUxn9qBJT2SFN?=
 =?us-ascii?Q?UQjRp6b9YgFb/pgSwtWbnQe25Yy3lBZrz3T/5uwd5iIljdxCWDOsH7o5op67?=
 =?us-ascii?Q?N1ZXD1rFsgogsRMGlEPbNWujudzpa8TCXiJwN16obcJFP9x8d9vm1kFCOEG0?=
 =?us-ascii?Q?OjA33jVUe+3W4DSB0JJEVrnZPcXJoJYh2ZtHPBftUJRkbItHSynGOdvaCgnb?=
 =?us-ascii?Q?+qKAWlhzI98CMDlY8noNkyNBO36Q0HDl6jYYyHRI3ED/+i7QpGGRLUgXfBhS?=
 =?us-ascii?Q?FIXcV7/wUgra+0Vg3wD0Qc0fkQrXForYfFH41d38sX1bqcaOrhL9W9yzEY2l?=
 =?us-ascii?Q?sy/w0LBjbEHKRrWYnXQYmCrCWHfXgqC7Gk12E1Fb66Zbv//4Ns5Maf4TZitC?=
 =?us-ascii?Q?tbM0KPjcQ9WN/dNZB/qYFNqf2F269orQxmKbLYnMIFkVHxJdVIdfsEbOs61A?=
 =?us-ascii?Q?7kNmBKzRSCbX0xbTthwdlOloYwMCBSq8tHc2xJ9dWK5OecXxNSWQgxhysL3b?=
 =?us-ascii?Q?6rJh62jDp3czLZ7fbQYRLMR7RLncvpphFXqnle/wKL9p8pryE0J9JzY6PDuX?=
 =?us-ascii?Q?FatB2j9lPJD2wPDS+nGoRljg+YMOWgqR6r+6vAmXHI9HnntdvLPKzFujDoKX?=
 =?us-ascii?Q?HiHY0xA+6iJREeNrbj3ByfFHd/IRwrnIRht8Yybsj5oNrT24yzBwVkx4sv7u?=
 =?us-ascii?Q?lQvNvvIsMOUYmWv4OP3VQrjN2FD5dZQhCh36J/vesqnKDf0pCt8VrXPYsam8?=
 =?us-ascii?Q?3Q42zRhqxfafEzABz3G32jX0P9z1MZVUzC6K+Nt5qvHBkYI0UmWYMIgaV2zR?=
 =?us-ascii?Q?PNLnyyzuHHOcllFiXteodTq6MQQ9hR3onZ+Car5SGSpPMTjFPndC+5SmlrvQ?=
 =?us-ascii?Q?Dg52csgrfaKApqdHZcpILu37HxicaEzr1KHofbjFxI54Vnud2dQUwxYClsFm?=
 =?us-ascii?Q?JPc1D8R7z31z+5Vlj4my91N2L5KoJ1xIykNMYsvkqePRJu5NOcq6ZFP4oegG?=
 =?us-ascii?Q?tW6NzG9+ldfMSmHd0yuaU0WFwGzhpCM74Ido6hI2no2/dFyHJv9G2KsagVC/?=
 =?us-ascii?Q?OBsr9itfws3tROQu6a8RfZTwGTHrOfkPbPnalrxif2ExONZq/7Eg6eeYLqKr?=
 =?us-ascii?Q?39ke6j1KA13n91ZN2tMKcEE4VCVfS1se/Cd5W521kLpQXmiGfbuwAF/Ub/GB?=
 =?us-ascii?Q?JqUPy0a5T7ez8kNamDOChTyLjUe7/RCet0ZCxeQmkzmOkk+ebA6W9mhsBL6P?=
 =?us-ascii?Q?Oos7tb2yKWyF3dsmp/fp52QTQIF+XQkMAM+3qo0sx/jt07/yNUGKC3lNmgfB?=
 =?us-ascii?Q?VYWgLWRdjcipzGekLYriBSJnT59howd3lJLOCsD8ePt7ooFoVwl8HH0Q8m60?=
 =?us-ascii?Q?8LFO6KPfbxU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I7hmqIWikGGoElQoM6mWIeJrUaa6bLoddZCJ+FHkGj7DcAn7iXJdEpASMrtF?=
 =?us-ascii?Q?nt0ok1mSfNvOo8/yGzl+x8JiqrZHNPFtBWgcBFSz368yGgMWKQxlBti0XBcK?=
 =?us-ascii?Q?Mo68/j5hBUnN5I98B0yUWpFcMypUmkZndafTftTIBlOduUE/JoFPTi0Qq4ke?=
 =?us-ascii?Q?48vAUjShc2yUrkJ6/WSkkm+q3T2oAzEt0ahs4Tv8IS0I+HNbXndvD6raV3+6?=
 =?us-ascii?Q?sLwNonUhljMLOq+MVDe1P+exkuJio6HrONWbtFO2kVWYoKDI/UdMUAXY4OKM?=
 =?us-ascii?Q?5rVcx5NHnjx1/Ou1HzL0nr5ONpsEwz9cfjajv+40xCU8wZ+q7Q1LNSM+U5JP?=
 =?us-ascii?Q?VheM+lfIINb1ADlGWTkNxNKMEYc0gG9hpq2lxzMxdzJfSe6s+n/pKvs7t09P?=
 =?us-ascii?Q?nhwYl8qI20cMwuJTFRLAfWdGRpPvsHWAQYmu2Ade3b3+dzPQ3bA4NzoLG2qF?=
 =?us-ascii?Q?s5Vw5NpcfhQP3Kvvk/p3Dgm1FkyW4Jws3UDlPwA7rQyLjnoWTjfoTwKVqVD7?=
 =?us-ascii?Q?CIsIbnfzi98o0c24hvOYMxgLL92cdNtxxppcl501UHH95909yA1hOTLC7NZh?=
 =?us-ascii?Q?WH370EXG1qtp0b+NY45ARPPOol7LV8dV8T7bn8xfuNy+jY8FTZiG0B3mFjMA?=
 =?us-ascii?Q?RxKvwb8tSXa6msrO4W59iM9OKFdDljCSmrvMjkeqRpkrYyet51PNfqMoYAcs?=
 =?us-ascii?Q?pf7hm+rCzc5qJqG5jtiFJershwohjpMLa/h2zpvGv7HHUKr+XvRYC3Bl+eJ6?=
 =?us-ascii?Q?LzzBlyHRAwjOhORKJa+eVPoqtnFBSqlf7gODDyy5aaqAKQx9bm7K7osfIeE5?=
 =?us-ascii?Q?JZzgguxpCXNY8Sui88S4X2L1zji+zsbu6yY6/8g8sAKRaxgdMGw+ppiEU5SM?=
 =?us-ascii?Q?p65UQAmLzVsFqVNBfFVC53gF6bAzy+6rg8ZKULB28z2RqdMcT+2TZkWxux1O?=
 =?us-ascii?Q?Okzy6Syjoi6u2lru6SltMZCLn98Latst9W27acIXRBeHg1VcM83sXXSUNwRm?=
 =?us-ascii?Q?EQjEMHioMd+htHVrUvzp/8EiFG92RKZwa/zHGxUDj9yLIL7s9RFwP6pE4qMP?=
 =?us-ascii?Q?ZbfdXK9ug2eoqriKBSj8TZxNd/4wWjkChU95mFfz9+OXTsKS2hGwRjy1EZv2?=
 =?us-ascii?Q?0ldyyAxeloSmtfx62O4rHEqYl1YbFxC+IkSpLWeebsyQZ89c1pcABXhMvHuO?=
 =?us-ascii?Q?LDbq5l5sWCBgnldQSHTGm8BsRIXcN26k0BoJdvIOLGWYpLX/zEn9GijsZXYQ?=
 =?us-ascii?Q?c8jgMKoEr/i5xH4XPNeMRfdTiGqb8nmJVLJeUxmrEUhPwkWKQJhlT7TTvHP3?=
 =?us-ascii?Q?IIkJjOgJ6N4mWtBabEjqKc5Gdx7dP+C3k/Dtxw8LNkXtu7cPnPUA+FJ/T4Yl?=
 =?us-ascii?Q?vUAp4irxaPlpghyRYffc6E71j11IOgIOXSuN9cgiKeENVvmQT9587TbSYuzF?=
 =?us-ascii?Q?jlT6P5Tt0dR5f2gCh0blnx24eAcUiKvKiHGoXxmeUsqKpOGkSxeyhYNboe48?=
 =?us-ascii?Q?K5hI4ULHjPN6MGhVQ6SYY7+uLCo/49anxz0AcE4w+GL7JHwHVOIEnIkQA2aT?=
 =?us-ascii?Q?Y/Q1SWCDLnMVwJRoYxEkvdpNaWwjPrc3KJImMh/r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166b7b0e-b96e-4b71-e059-08ddbb007ee1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 13:41:36.4503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7K3maEcetF2DYgb9PxSUb49HfOBGj+O0MuohWL6/Glt2WalfT/IIEvmNWaFt7iy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183341E5B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_064143_450894_39EC577F 
X-CRM114-Status: GOOD (  16.34  )
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

On Sat, Jun 21, 2025 at 04:21:06AM +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> For cache maintenance on a region, ARM KVM relies on that
> region to be mapped to the Kernal virtual address as CMOs
> operate on VA.
> 
> Currently the device variable is effectively trying to setup
> the S2 mapping as non cacheable for memory regions that are
> not mapped in the Kernel VA. This could be either device or
> Normal_NC depending on the VM_ALLOW_ANY_UNCACHED flag in the
> VMA.
> 
> Thus "device" could be better renamed to s2_force_noncacheable
> which implies that it is ensuring that region be mapped as
> non-cacheable.
> 
> CC: Catalin Marinas <catalin.marinas@arm.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  arch/arm64/kvm/mmu.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

I think this is much clearer

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

