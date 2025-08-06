Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FD1C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 14:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OovILAbN5FC5FUOyScKz/1dnTLdTLsQ3PeZzdJumPPU=; b=LF2+HdzwFpIJSGFAVncecLxerl
	mYOMb/XI1hbS2NStnLj2kH8Zc0YRpWc4qNamFX4Pq2NMpux4hIs6BCabo16RWsRjq8OveDQRNBS+i
	qPgifMY4oc10ajfJNlJn6t/3PaJA0R3yAGSdrHiJsrb2tW5Tqw7mkISc8wxnBXkLHEmSz/98rhi0p
	w6IJabG+10kIGk8Bp6J3IZYYmr+VnDdELaE7OpZxl95+6IfgdlTACsOzV33u0BYvzRWg73ghHA5Co
	itMdutYkPSehTmof/QNGg8+gw9/0y+hoWImLaEihkdYiTeCLvVPIrIxklq6K4m1mJioPHv1bPRLIl
	ZujwS2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujepo-0000000FP4c-0w7s;
	Wed, 06 Aug 2025 14:09:40 +0000
Received: from mail-dm3nam02on2061e.outbound.protection.outlook.com ([2a01:111:f403:2405::61e] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeki-0000000FNd5-00j8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 14:04:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWgNXq8bwOvNC/IP7bx3rfHXRaHkbd8Yq09dAVXSk7fJ7O8dH01POtiRwOdABfFNbs5DBIv7hVd2NZljJYA080nHesR1sUKKQaEfs9Zozw6HSSrgXET+tVW0rqjgxtaO9vTvVRT98JGySlxOf6VovzT30xiWhC3KVR1t4WIKcpEMAVngZDycub5P1bN/VRmH90MXOEILG5UJTpgltrkLiFUNmzFIVz8RHHhGPkIb3MEjfYN2GfPuL1GTWN2IrFgOir+BuXWBhzOukpqPqVNCpSpME8hlycJXy6M9wNZb4AsyZBBFqark4PY2oS7tzCrtHwYviTzMV56DfZL320xXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OovILAbN5FC5FUOyScKz/1dnTLdTLsQ3PeZzdJumPPU=;
 b=Oc0ETKurBkF99ornb3lq7JekxVowUSmwaFsC5Fl3UPkkMWnVaPyzCZlvF3UUdg6wYTpUzksJJxWg75cFwR92pjEfPmq6oPwoTv46MoDY/xlUespo78Wb6UNmx2WEkB+xlpDtCB0p4CgHLd8UaBV4ITgwX0nqyRKrzavpmsf+tCJld9i/ejPtBv4asNYbaNMl/g9eiafYUyFCjaIXw4G9l02mWNxAmbvihZ8Gqcnv+LvplDJA+72Nlg6Umg4Hde5ySQKMAn7bvDTyn4Vg8GwS4wsiT0lwpLR7yRG5UZ5VjYr/LXOiG0U+SXblK+6qTv3rtrnFV3XZx2+8//ijMxi55g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OovILAbN5FC5FUOyScKz/1dnTLdTLsQ3PeZzdJumPPU=;
 b=dpSidHeNNoJZLC+N/0R7oGrWOZdEeCtjZnWkzm4HLEkEQL9euYo8XIXNPgz7XXOV6A0Qw+qIyExaYo/fF0Nbz/LfCAMw6qeMY4pT4iUs4kFtjGeIlQnM94innWjVm8y4gPtC8pNDfWIIueNVX0/WnplcUTJ8AxtDGn817JElDIPHg1/FNReHTCwqG1bfqKxLgO38tRpRTEeLTYS0rOdHK0DiTKyni1XKqrv3QgMoWPEAAJmrehqsv2DbudX0IXuSPGdEH9wxz7G1k8zZ2o1AIM33r2aHDNIoGjb6n2mOk5OBZqukGycprIB+qLDr+Hva4494DCjWvhjSTcQz0mrwVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ5PPFD5E8DE351.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Wed, 6 Aug
 2025 14:04:14 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 14:04:13 +0000
Date: Wed, 6 Aug 2025 11:04:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rc] iommu/arm-smmu-v3: Fix smmu_domain->nr_ats_masters
 decrement
Message-ID: <20250806140412.GT184255@nvidia.com>
References: <20250801030127.2006979-1-nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801030127.2006979-1-nicolinc@nvidia.com>
X-ClientProxiedBy: YT4PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::23) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ5PPFD5E8DE351:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0f6f36-ed06-49c0-6f25-08ddd4f21fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KUfVubCNzWfqTI5gifxOjQHjkY3mQTH2bVJ29ckH0Twi83YQ1Nz29ij8sTSB?=
 =?us-ascii?Q?HK5+zU790sRbSyLFV7goAOH9sNA3+6OZzvOQhkupv8gka7yxuG3TTYCiGEW0?=
 =?us-ascii?Q?SyNkoRWsa12IXEbxBbth4kILFJP2wCtd6NbpvFO3d7ZCguZAmktfC4nRP6qG?=
 =?us-ascii?Q?2oSb9/KYVt5hk6CqZhfp3ndugxWa1CV3HI8to8A+RKaoywBtXT4pQgJeAhjt?=
 =?us-ascii?Q?gfEfuSZjrB1Arvc4+FAas10+oJlg0xwZpyns8GYXOscP5wrEa2+IiCQmQDDr?=
 =?us-ascii?Q?/sXJXOSP1NP94IWLSqxipTHGVftFOzz4Jr3EyoayCvryzDVm64yqFS55TLzn?=
 =?us-ascii?Q?CeWkc/YI09xlt/scnIRxagrJ9benVnLYyWwnZa1HAs61/TcHe59ZYH/l8OV5?=
 =?us-ascii?Q?HzRjWnhdm7VKnrvyEzrolJid6bgg9PRUwv4HAYeh8TcxV1G/SR2mDnnigj2R?=
 =?us-ascii?Q?5K9XxbrHKRVLOitZSIe9FT2jj1Y2ZxVZWjCsd/SS/UjhwWjJ9PC4OAQxW8PB?=
 =?us-ascii?Q?cSMlAdLZecJy+ZEZQFHt9WFqYJhxPFTAS0xRP+M81j0H8OVwfsz0sAW75w9a?=
 =?us-ascii?Q?DnE0b1mfh7C7rvd+X+yD85IyYbCFIgWjpyJxScO7rsET3ao0fEGBMBX5QYxZ?=
 =?us-ascii?Q?+CStvvNVyq2elPUvDXlvZQ2CMLd8t6vCZbbpHo3zuO4qRZZVFOXW+JUCqwXB?=
 =?us-ascii?Q?M/VKwp1eHqXrxt3kDD74+u4PE+bxUUzSbCK/gRDcShVVEqnbhpJH1vxoJ3Fx?=
 =?us-ascii?Q?i6qfmIwZg2hEEXgTiEecHgnKjctuVZLGILI+DP6ep4D/S/iIKiQJjeRjU4AE?=
 =?us-ascii?Q?GidI2MNV7E9DaQsojtA/TGCsc8f5WXxpZUi6b/+HDmxdz0G+lcqu2sB/j+Lb?=
 =?us-ascii?Q?n0v6Kei2TGIm4rDnEBDOcwf+vy8WyXuTwo5DajSh9n8mcz+3Zs3CveJqdqM2?=
 =?us-ascii?Q?7YFUd0dCXHic4b2An4ictN9tHDH57slw9veJS+cafQOyE29DoJXlWyGK6EYU?=
 =?us-ascii?Q?reKp5LD2bvwemI+6Kdj5KeDrBpDwplXEFbtssz4qT9VbrlA4+EHzW52O9iMt?=
 =?us-ascii?Q?GnGYRKkcw8HkEtjvPQqH9OGSRfSAXsiyXFgx2xoWuw0W2Lgi7oxW7A4oxOgu?=
 =?us-ascii?Q?d7UsalNq907gezIJEiMmxinrOQjc0hXg5uE3ytLVC1z04IKQSugq1PvXQ1ld?=
 =?us-ascii?Q?FDLNZEKEG/P1CtJZc5kBDVxgmiAy6AI/W4JdSDRJ5Ie1d82t/InarHKmp/OG?=
 =?us-ascii?Q?WEke8ZM6k5SyyQ2aUQ8XGbAFUlcyw6wyaBfqX3RIsDSpWtnW/N8SeHHnHUFD?=
 =?us-ascii?Q?CbXBWzQm1NdJABUWpPQLWkw6TN0iM4OcapJw4HEdBSUPD845cqzX7LbaHI+m?=
 =?us-ascii?Q?FlfM4abtj5jdAtj+2AOb/xiaTU85h181fTyL+kxKTwf8Ej3zAg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0veNci+NtnRsUP9+7vx0vFuzfescAdc+ZR3QcXZIaOqvcxZrMY5tlrUWYvUY?=
 =?us-ascii?Q?0ewujuBQuZAES15SYXq+S6sT1qVKp8lkBlWzCX+IsmoEOTJliTe6CaghsDdg?=
 =?us-ascii?Q?ZU7ZFphTFCUHvuTEyjSn8OKCdn2ViT/I4UyOIVMSu/lbmcvWn4SJSmnEB4W+?=
 =?us-ascii?Q?SNxVE+DF1cZwbiBiFD2g2VenTsWGXUKKYPYy150IhmVpCa93kLkYRP5sU8nY?=
 =?us-ascii?Q?gpuQHT7HJzS0YWpKHMR6xXoXN6ogCWc7CrBoxeNvrpJa+XvZ4+15FLPiMNe/?=
 =?us-ascii?Q?3Nf4FDf0xX9V2ZzJwVmyVbti6vqK90Rlm7nX4M1HCAmiZyfCqPcu59TBS43s?=
 =?us-ascii?Q?+DHsTRQlHbVtGIDRrdxETeNI01YRUZDLEmWF4n+Q0Mweb+GjIyUX/9mAq2n/?=
 =?us-ascii?Q?sgqdDiafjdebNducp3m5zbeDbjW5ifj7W7MJrlxYO3KP0rISkC43cuRSA2sY?=
 =?us-ascii?Q?TFWR9v/VIe8fgNnOpNEoMeFu5lffm2fgGyN7Tb/rZS16SBNuPLAcuykquYJT?=
 =?us-ascii?Q?dgSHbuOKfN8nQh9MVfWdUQ+YtsZBWnh8IA2gCBODmXGNx1tA7C1OaxsJL6ZN?=
 =?us-ascii?Q?gVnMO4TZ6u7d4//JbWL+oa+/hlhs7oJ4H5sAeoITdtXLvteVfDPHZDtPAHlq?=
 =?us-ascii?Q?aVuHhEJtOGbAOGm1VtH7BxoryxctzSfHz7nOdkJ+sPmlkYxBgx+2BRdrTSDe?=
 =?us-ascii?Q?SAEE/mPuk4ISJokcV8nuLZ+81nQfTIz7YUgXNBc75RqQXeSZh/QBZfX9oIho?=
 =?us-ascii?Q?Baw+CER96myO8Zruy7DQXlT96SxKNZXq/NPCEhVAyeyT2kXf9W/qUKAxSiow?=
 =?us-ascii?Q?GZks+mM+8mnclIJ9eho6CitcRVTrPdEaoRYX1dSq7dAJrnlpovpDuXzUSeAF?=
 =?us-ascii?Q?j4M1MK0tSnyLoHWajioRPA0U/R3NJD95MZ0jwa4e/Mvyy/gomBIS66QCVPbq?=
 =?us-ascii?Q?GcnSGzbTnVJfsRKkPdv7IvYbIjVecRmn3N2iHWqbki0ADX1ufzqiAM2w98Kn?=
 =?us-ascii?Q?C7WF4vDkUM5+EGEKQaap0FS2oTbMD/IWYVw2YpNSHT6w8Ns5FiQntpgKBt81?=
 =?us-ascii?Q?fCyyzvNDadug9RR05y6Z6yzEv0lb0QedEGfJNG2WhCwWd+4j8lz+BTmnzYo9?=
 =?us-ascii?Q?4zFqAlqCwJ8LCm9oCDDRkbKi+qtd+/5ubb/Pepm/eQa7gji12vKfBaMOxDsk?=
 =?us-ascii?Q?UPLvAGWZWzrIRYLSEwLoJ0l2Un/kzmYORvM+BXSYwek/K6RfztOOCQ972ZPD?=
 =?us-ascii?Q?z7AtnwYBspmhS7oYt7qPjuZnXIPZJb2+8GwqX2qXcunurenuzgzZzVlWQ/wa?=
 =?us-ascii?Q?Arfa/BrP8GtAmGMebA/tUwJz+rufkQw5uvxKYo8J+Ht8OvbU8VIiJDmcXe/3?=
 =?us-ascii?Q?LvkoueKBxYGho+A/sYbJWtph+veI1YzZgnw/PBOd7ICexP+A/aWK91Yrz/dA?=
 =?us-ascii?Q?8JwwPTlIfNnA0pxO2lUaM7QNHDVWQ2QxIq5HL3OVFEZ7X2RHisVnMizHiYAb?=
 =?us-ascii?Q?G+shdqnTJursWVllQY2HWrlD64IS9k9GFYhQpkUSqQKPdahueaTMNQ3nqVnS?=
 =?us-ascii?Q?OBWmaecMfRE4aBAqIzE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0f6f36-ed06-49c0-6f25-08ddd4f21fb3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 14:04:13.7974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKUvtZOn0/Z7l9IHb/XCZ2N0dzoUKFA0GT9r5Utnn+Rj6o8LUUAEyMQi8HUYxqLW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD5E8DE351
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_070424_041878_8223A460 
X-CRM114-Status: GOOD (  14.92  )
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

On Thu, Jul 31, 2025 at 08:01:27PM -0700, Nicolin Chen wrote:
> The arm_smmu_attach_commit() updates master->ats_enabled before calling
> arm_smmu_remove_master_domain() that is supposed to clean up everything
> in the old domain, including the old domain's nr_ats_masters. So, it is
> supposed to use the old ats_enabled state of the device, not an updated
> state.
> 
> This isn't a problem if switching between two domains where:
>  - old ats_enabled = false; new ats_enabled = false
>  - old ats_enabled = true;  new ats_enabled = true
> but can fail cases where:
>  - old ats_enabled = false; new ats_enabled = true
>    (old domain should keep the counter but incorrectly decreased it)
>  - old ats_enabled = true;  new ats_enabled = false
>    (old domain needed to decrease the counter but incorrectly missed it)
> 
> Update master->ats_enabled after arm_smmu_remove_master_domain() to fix
> this.
> 
> Fixes: 7497f4211f4f ("iommu/arm-smmu-v3: Make changing domains be hitless for ATS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

