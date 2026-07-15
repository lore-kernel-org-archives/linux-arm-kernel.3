Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5658FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 20:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1x63JOtDcXC0PbVrqh0+MQjXhqm/fk+NfVTVgOaFHU=; b=oQDEsF+b4krPIH9epavfZ/FVkW
	9ashgpoIe3po2HSUQ/EoW2iGxsb7J2H0x1qaa0ZI+mCSMm6U4a7qoMi7ACF30YCRvLKbU3kCL6cAh
	2g1uoOS/gIoW8ErPYKRuwjfkNyVkaJNMLqVJDafpqAEvRRfhF8dHjSJnSRiN4imbj67YuwtXmjpBu
	P3drKovVTn7udmaD1LswM39BeGxrI8TsA6YIt0/rZU+RGWL49MHMwuN5cWgi2dkltVSrVVB7bYq8i
	yzOgznLM6aAG2xgvNfq/oCRlo4nQSl+2y89ynCh1cznQUWVniRFZkAhyfUPYO1bJEoGanoO0/80fp
	BDx8zCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5rT-0000000FqwK-32zQ;
	Wed, 15 Jul 2026 20:05:43 +0000
Received: from mail-westus2azon11010038.outbound.protection.outlook.com ([52.101.46.38] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5rQ-0000000Fqvk-4BmM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 20:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8N9SqFQuQ169krSKWKOhd5ZSLeMZeFnLxuX8ku9Rc3p5p46CIfosPYpFrhlINotxpxtcsyOeR6LJe788f0OpSUxDB2XML7JEkCOEeQraiv4gltnpPjgK1aIPCsJNbwKJjL8Tu+C45GDGgg/GMBqNZjatR+VdNzVlxRcEgp8uZk+9HxgjJ6sceh1umW8MfBxZL1eW1me6v+5xoJ/YSCTaZV/eqw0n8QbMAidEUBa1GJv80BwzDIMgBLnU1gDcYzx0ror70VjJE89Kz0Uf8jQXcJ0BxA9wGrq+kswyOxqDcOg50zIHD+5uBEARsmam+WMJ8OT9wDVBZ+5Oz9MR2SJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1x63JOtDcXC0PbVrqh0+MQjXhqm/fk+NfVTVgOaFHU=;
 b=NSCac31FzNVKEa0K6FgcRuhqeJ7feieNoDBh01Hs4s/xh5YWzHe5xD45YEYrEemYi1k+vTL+s0FnA36tK5d0Bjwb+uLjvdtq9WA8dKLvRXmq4lRpXIWdYRYphiHHT4gX2pPqYlnosVDFv3HJLiAYDDfv5cR1jrTHk77WSGLBAyouFIWpfhwgM/RydwRYaStrs23OvaEy9G0QxFJ8n72+2Cw5R/kfio3cZPtkPwRgjCTD+nLKvehyGaJ/Os7AiVaI22/MPvmq0946FkJYKA2ASq14GlZP4JArsfBHaOWGOPjgOTCDimHMWwiaPm3+31bROoUHgefruFzeS/HWZjCGhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1x63JOtDcXC0PbVrqh0+MQjXhqm/fk+NfVTVgOaFHU=;
 b=qsHGHG8h6KWeLlyOrqOmS+QAQbzXMp+RKP0isi0qv+rCn58XDGpNV1NijbOnhfNVN4pJGgqtiYJuApLwemzp2zDNwdHohNMhxqi7Y44SDkFy1cRRdMpH8sxNZ2mKTT0uebsZwmgpG9cvlaSrKOzzNGbnNZEBlD6zqwXSZ/0JTY3gpgyb7tGnY2qaaTaaM/x0JjBlsyBHe6NVvdo0fTN/GdW0fUsNJOd++dQ5D2CsycKbDN3YhM0hSWHTHZRJKTF/2O8cmGvFwSM0jNWIfe/p4803kKxp1DZ/rTx/69jfmebNdcrmfW7I+4HOrGlMy/jC8PMMvnkJbTWNMQqpOcfIhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SJ2PR12MB8875.namprd12.prod.outlook.com (2603:10b6:a03:543::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 20:05:29 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 20:05:29 +0000
Date: Wed, 15 Jul 2026 17:05:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v4 5/6] iommu/arm-smmu-v3-iommufd: Convert cache
 invalidation to the core array loop
Message-ID: <20260715200527.GK3775915@nvidia.com>
References: <cover.1784054606.git.nicolinc@nvidia.com>
 <4c85d0d43e9871b8dc8ea8e393210bd62654c0b5.1784054606.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c85d0d43e9871b8dc8ea8e393210bd62654c0b5.1784054606.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0732.namprd03.prod.outlook.com
 (2603:10b6:408:110::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SJ2PR12MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: 263c8188-3184-42fa-af18-08dee2ac6aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|6133799003|3023799007|4143699003|11063799006|56012099006|5023799004|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: u7w9K+1Sk84g6bnjYPRD79DEl135wefxyghsCSBDVTL+Nk2NmTxF75yvWRnRCvxDvG0efX1h8fh3AVHQDfTlSrG/YNMgwLRsDDZTLBGx8VwixrkQghbBXzlPfP0iht4jeyjl3lfXe/160Gehiy0Y8dmM4mEObib+GnVlvw1e3v2jHEWPPqV/RsbLTXkH7edCiNI02r6yq9L2ouY1axTrRPwV60e177tz9/5J3oB3lAQ4dbg3xz2PnPG9WlN1aEwEw2xbLuImqOTK8qfKG2F3MMn9shI9ssjuTyQzUnrmQuvA/3vK/pv+ERJ1m6KlUNGdTwfonsknSttv86bybFJw0xtRxwCrf6Z8lbizs8yZNqOrasJm0O3p8w6Wut5sHmUBWEm8mNwx6HbvvIF4xXbKZH3Df+0lvEfoP2m21alQfxl8b1FvCMpXugrZDlt59IM3JZSVXxZSkMHpR4kwqttmfy7DitZaqZ3WR+eBRhxD9Es99HTtMUd48Dvcub9hrl2jzX5QGSqdIuxTG62gCXO5GFJfdY9vLFrpX1f983xqO8cnzquQRtj48eu5ZMD6CqGWHxNUPEpL2mHcdbB0JlDQuUCWqssYIqmwKoGHTLG3Nh1GgPou/8QxYzeBrgd/eCisd3b9Qo5jr2HbKgg5JlLvL2Q0mLSWTLcon38eLAQAIGs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(6133799003)(3023799007)(4143699003)(11063799006)(56012099006)(5023799004)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LOFPH3gCiOeAsctuZzDXVrex+940zU2SnOC63YpxpnEVZT2+gGE+6hYO32xF?=
 =?us-ascii?Q?gdMuSsKAACdKL/8wacLIM/NZ6/Gnm5hLQbuqdiUt42FvN5mUEoW7QX9zSSQj?=
 =?us-ascii?Q?xCQvRjSZYsxcNqxyI/D/TrLOXO7BWbmVJVEFoR/vE4aPlbPN19ONbXBwEM+6?=
 =?us-ascii?Q?ZgpWaH4HEc2BQn1UFnnNpn1wIahVeZCTmcUV+PRLaiMFUdNQcIIrLUGdTquZ?=
 =?us-ascii?Q?cogEXVifEqZ0/74THY8rIfjXupqX2QmcA1eYbRkl9f0KkEt89feIdz7Io+ZQ?=
 =?us-ascii?Q?kBhYKru9bg1npWgmCE4aDAYw1N+28XlQt9POxl1mKBEcS1a9mY8uA3IYgx7p?=
 =?us-ascii?Q?vw/0Ay8cp2sxT9GIaQZYfM1vPMvEPEdwhUWLUkwa+twmTpmpYLg7eLs/odbU?=
 =?us-ascii?Q?Ad9wyNyKevovtaVyZiXaB3Rtetg1IRibh7hY6Jw025kzhx5rXl3OfbeflPEl?=
 =?us-ascii?Q?JYUmQ6WpjZvCK9SbPDQx9yG4FmzESmvZEEEH9RWeC9N3NQC6n+eUm8/hLf2G?=
 =?us-ascii?Q?YbHQvN5JYuc4dWgKpx/p4h5VHjIcThpwJvkE/mAu7g5x8Kvbw8ikV/BAu5dY?=
 =?us-ascii?Q?eh2RjQQJ2EHF98bEKgzAqjq7QjBnht/oLchYECPQc3IAWCsgz52H6TiHaj38?=
 =?us-ascii?Q?lSUR/WvWNRdkdlrDfcSGO2Gy5f1v2JBGgUleJmGfDatkg3uUtDQfbda59t7K?=
 =?us-ascii?Q?XI+bjDkwP5+WDiUZVUN8H9jB9/ehpz3n4TZ+/wBkHua4xrHARhsVyrFM+LAS?=
 =?us-ascii?Q?s2Pwv25BLfv8XIe/nYYusbkVDUNnjIzWuTz8iKR9JAJ/MKZkJymlm1poQPdc?=
 =?us-ascii?Q?E8GmSe5LzffBMPkT5aINZOvVkdxpy5mhSqipHeaOjlNX9/8tiKfnYkiyt5fb?=
 =?us-ascii?Q?0Q4yDYy5+hOAkKcDlPUlPoFHYtdYwYzaIhqhNidpbutzEykHMBZ/AWSsqXit?=
 =?us-ascii?Q?7Qny3D8fQPhwX1j94EpztsFS79mHT2AXKRXrnOUB1asAg5HgqAaNqjIhMQST?=
 =?us-ascii?Q?qCT6daJZEISubWg2Vcb9/TFC9bXfnoiFDcTGOrNX7qfdrKRE3W3Fr2hR+FAk?=
 =?us-ascii?Q?W3ZKLEqIpXFXKL1WxAsy+jpOpcFcctqyQFkJ9P1aB1oYOnQ2hNfm7f0bQMKk?=
 =?us-ascii?Q?ryITZ5Q5HNZb2uxFKoW80as97WlAvuHYefK52U3H5NtjQG5v034NgxSuOKxt?=
 =?us-ascii?Q?WINYkFvIW9uxov1k5BRO1q27cKeeHasHmyFL4NGMMGe0O4Di8C6boYMIM8B5?=
 =?us-ascii?Q?rN4iL0gtd7QfmHTsUJlu86dA7ccHwIR0MvaUf7OYbBP9U+0hF4ErrzRsFiIj?=
 =?us-ascii?Q?wvMzzWczhIHiG9Gt5TlgfsF0HMTSpyLaxbNjCk6fAjPPr75dD9TbV0QoZKyx?=
 =?us-ascii?Q?hdoNB8c2WfqzkFSm4HI3oG7Mn7kPDAOdkdlvxS5wLPAp39maS4s641LUCCRk?=
 =?us-ascii?Q?Q3ZPanZnU5S8OJOsmLvPGo6RkGaDqRVmaUZAngWeNisGKzGXFfw5R67q9aGH?=
 =?us-ascii?Q?Q5KugoRPcgISmfVzHMm4SOvgyUwh/uRJIk9+2ZOUaFOqIf4Hqgfg1N9QylnG?=
 =?us-ascii?Q?ugb/mCr/pFr+UVouCOGMciKEv1AW7pW2kzA2W+jKNLTN88afaypf7OotW0wn?=
 =?us-ascii?Q?j0Sf6tWqcl6sMRzS6zQP2qGFU0iZRZwZCYx70IR16ujvjMRKh2j9FI4jXkbl?=
 =?us-ascii?Q?3UIT+nLdbk2BKkU7nLNK/eG6+0gtmemjPSt4vSNUZ6LyJUKF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263c8188-3184-42fa-af18-08dee2ac6aef
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 20:05:29.0821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXWKSXW9Mg0S6B+a2IUHAbUI0mQ4IMPe4OuEbXItYXXAXw1GFo0prw3S0wsM2OYV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_130541_041624_8B2EDEB7 
X-CRM114-Status: GOOD (  19.63  )
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

On Tue, Jul 14, 2026 at 11:48:51AM -0700, Nicolin Chen wrote:
> arm_vsmmu_cache_invalidate() allocated a buffer for the entire user request
> array, walked the array converting each of the commands, and issued those
> converted commands to the cmdq in CMDQ_BATCH_ENTRIES sized chunks, carrying
> the sub-array bookkeeping all on its own.
> 
> The iommufd core now iterates the invalidation array and re-invokes the op
> with the not-yet-handled sub-array, so the driver only has to proceed with
> a single chunk per call.
> 
> Instead of a per-array allocation, use a fixed on-stack batch to copy from
> the userspace array. If the copy fails due to nonzero padding (VMM violates
> the ABI), fail the entire batch.
> 
> Convert the whole batch before issuing any of it: a malformed command is a
> userspace bug, so the first illegal command fails the batch as a unit,
> issuing nothing and leaving array->entry_num at zero, the same way the copy
> above bails on nonzero padding. A batch that converts cleanly is issued in
> full, so the op returns either a handled count with no error or zero with
> an error.
> 
> A zero-length array now returns success once the data type gets validated,
> matching the documented probe behavior, rather than the -EINVAL that the
> full-array copy helper would previously return.
> 
> This also fixes two long-standing bugs:
>  1) On a conversion failure the old code reported commands that it had
>     converted but not yet issued, so user space advanced its consumer
>     index past invalidations that never reached the cmdq.
>  2) A zero-length array was rejected with -EINVAL, although the uAPI
>     documents it as a valid request that only probes the data type.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 68 +++++++++++--------
>  1 file changed, 38 insertions(+), 30 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

