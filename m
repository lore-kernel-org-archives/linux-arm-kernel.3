Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F3AC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xFit+RzJREa+X1O6tSaaIDDxb4K53BI2w+v/fECv7o=; b=xuXK+IwiAtKbMHqYj2HfDzOcsj
	1yFZhqOMzP3TGoAEHBIdP1FZFpNK20QQvPPYfhwTweg+3JTBsHopw2HFroF6PgFaBva9W8Kofy5di
	UmEF8Lr7UYSqNZ+3kikxRXZ81BJrBqgvDekCjKEKca9N7V73J7iSROs0qEcsxXsUV6zi70Qh3O7LU
	BLDOsfVbQHkPrA6QN/Kc0BUFiRYMCFk7u9es/wPrEB37yIwgHRBKsC8j2063Jz1/poSxtuuvpyzaP
	CZiJ+dMilPE3QOrqcCcCVnFtRkpVfjJ243mOlDSZlHjVACO6rYKF+c5OEO9eh26WerFc4XSn9xl5O
	SGyuuTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUP3-00000005tMD-2C9R;
	Fri, 21 Feb 2025 14:53:21 +0000
Received: from mail-bn8nam12on20604.outbound.protection.outlook.com ([2a01:111:f403:2418::604] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUNY-00000005t5I-09MZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 14:51:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5IjzqADTJv2wA4OJrW0AfO5NNJ+OarkMPZgIOr9yGGl2OOxeg7X2rYmkupUDVIlb8jKmiBYJyY92TB4D7iIZllJqGaRx9Kaj+vqie903rgslqTqqSzDoKeUDY5j7ObfBDV1qiJbPlMH8TmHmcJUX5i7Zlv6RsZMbXnbmSwiu0HlwO4CkiuvFQXkNARYpuglbIVHklPyMTStaEo7GVEbolhfYvaTmdTfKvHckQEu2DLqsR5R+tKD+2Gp0IEgQAdKKoj0v9JXfb70TrlNSLxDm1fLJ9JYrg7H4Dn3xUzVJrvVkkCNuiXBFZ3MjiMgr8uiBJC0dbp8j5d9n+/5lU+Wzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xFit+RzJREa+X1O6tSaaIDDxb4K53BI2w+v/fECv7o=;
 b=OEfACqter8kimmTOXKf2LugE9zAgvX38UqQ5D/SdQrU/gZhN2mRRPinns1u81MXG1QqOuaZkUAwOm3TpFius230Y8kmIjtc7OsxrZpxhYNryUtX0IMNxT++cXX3rbIAjG4/MZkax4Z8gO7+BXZu14UPBb9hToaHgPEABvhZiaBIFZHI0kFdZSqaePc9JLaj70hXeapD4njb01nYSroUFcFbMtJ3XtsBBjDxG8dQvQWYV4RkSl5VnqZ6oV458G6dzOBBO61oUHIXyPGsfhG31ZkyyAPjhiY33Eg4D2XN8AEuC7BQ8spD1SPBJjT5gJSEfKRfxohSTKOXbs39OYmF3cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xFit+RzJREa+X1O6tSaaIDDxb4K53BI2w+v/fECv7o=;
 b=EL6g4JwswBGQV05csIz49/RJ8+aNZCj82429cqGIT2j5S4YgA9UAv4lTPMGcDOQlz7MiZiXF5TiBwvv/cfzQ3217+3aTFztAOK2S+ljZmvg9bqnBPW5sdrODAS2ccDeAVkyaLovh5RKdbNEBW2uNxH7Mtxznt8NID+4SUjyeuLW1qJcc4pMqXxByAGf1Knhhguzz5rosv0wbPTIpQfLqFwHyCZAJpDnVH5KJZLYJdZKHX37Aak2W74Q2bl4GuIJ6t9PrNDcnUnMDvDtbprqdBJZz4DbizyFXud9Os87SY7dc3A/Rh2YZ3eVnEgkjsmfmcLOFjzjVY1xlEjzAxWg4WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY5PR12MB6550.namprd12.prod.outlook.com (2603:10b6:930:42::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 14:51:42 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 14:51:42 +0000
Date: Fri, 21 Feb 2025 10:51:41 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, tglx@linutronix.de, maz@kernel.org,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	shuah@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	baolu.lu@linux.intel.com, yi.l.liu@intel.com, yury.norov@gmail.com,
	jacob.pan@linux.microsoft.com, patches@lists.linux.dev
Subject: Re: [PATCH v2 6/7] iommufd: Implement sw_msi support natively
Message-ID: <20250221145141.GA291164@nvidia.com>
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <e13d23eeacd67c0a692fc468c85b483f4dd51c57.1740014950.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e13d23eeacd67c0a692fc468c85b483f4dd51c57.1740014950.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::28) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY5PR12MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: 341d6dea-6b28-453b-f43e-08dd5287410e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?42isSrIj+cHydA/qUBNGsZ7SalsoWv8eCteHRoFDIY2ghQeoVIJEG8LiAJRT?=
 =?us-ascii?Q?Esc99LSUO5BNJa4g602HceYGm6C5ZaJuE9rsT94WRXwRXNya/5lkLp3V+X8V?=
 =?us-ascii?Q?SyMoJpNy1TIhM0G4cAYRW9bIs4cYXwdzydAS8zJDF/hX/6zn6YOtYV5aw/ep?=
 =?us-ascii?Q?efYJs6yC7XlqyefXawkqwKNdaSG/kFfeNngHT3dtdmtS+ElY+d2zN9HXAXcA?=
 =?us-ascii?Q?RD1Xzefu17HoU/MqVt5vKv2Rkt2aN58l9K4reM9lmUn3513jbDu/6Y+N5Zyz?=
 =?us-ascii?Q?tTYXzCuZSpz4jyotTq6F3w2DlyjnyZTBYAtJsCSUX1hM9NbSstWig+rxCHAY?=
 =?us-ascii?Q?JjMsaNcypduVC4dGGBrCeyTF6dPusDvp1Xp0KalA2alW2J5T8oWo75UUUCAP?=
 =?us-ascii?Q?WfkdDGy6hmiR84K2we/QTKA3dDduhk02Jj26eRdoGfzwlhdJJQSeQI//L1R7?=
 =?us-ascii?Q?B5ZKGU6muoBO0d1U2vX7Vl5cqDTTuLd4pQTd4AtXUK1yu+zlYcvcLj44Lb3s?=
 =?us-ascii?Q?0/v/D/QPQBRk6KKxvLK2CDUMUvUYgKgO7n4vyocZmdB/zhvYrwK0r8Cn2dy3?=
 =?us-ascii?Q?GPJmLOYV61ELT1ISEN9xLw8HI1RfD8NW3fyHToNrOOilpwqKbkHKd5zkgjX4?=
 =?us-ascii?Q?H64QDmMDIdL7sp+nv7Yzp9mQkKGhh+dkKv/1T90TcWInBMqVwVPSLVNwhS8g?=
 =?us-ascii?Q?XmDGEClcxeJJChWlSxv/HWKV2Ay0UkDXY+BhgyaYgViCPBZO7e68ZHMujreN?=
 =?us-ascii?Q?j6NemzuXSJhoaIhZJXxYuPotimO2JWrijcFaxbtYJ/bky4epFisn2eY+sJrw?=
 =?us-ascii?Q?lB3529dgVPf69RiyPAwme8M1RvJwZ+zZsEVLK0ZD+Ji1lKuks8easzABTGsJ?=
 =?us-ascii?Q?RBZJyclkJlbBOT4gWp9PZ2oCP9PmFVMZzQAG11P8734vvBtvOmHcd0F7RrcL?=
 =?us-ascii?Q?HA5bfERSs4O8Kfd3Jcdq/IYbBxtrSQ4Bjt9eYw9B8a25nKYavWaN0DfXAylU?=
 =?us-ascii?Q?XWQ8OMRFvEQPjuYhAgwDSxG78qZkG+jnqq825vYDq+bFA+MO/jCY729Nz4L1?=
 =?us-ascii?Q?DCuFNfgzkcYozZDpxtwLfnEHGeJS48qct1WezPXRbmXA283SBET5opspNGDL?=
 =?us-ascii?Q?s5QW1dDYQDnO0C0sn2vBB+6tbSgaLrpt5tpxqBT7y1A9TL1pTWFNrzanOXDv?=
 =?us-ascii?Q?sgaMYFuSfVFZfHglmqS1LBBWO/YALlHIKoqTQ06p+PhvwOtm7h5iesocwn4l?=
 =?us-ascii?Q?k7Z6N1nBAR8Cnb71SFGhIHrI4VdtnLqHJ+SAWrtOOU0GCGjuSeNY1vzJ+0z2?=
 =?us-ascii?Q?XYCxauFpcsWO/EDNBklyDqLr2FFU/DTrBf60g01ja9Daq+S8/lQVfpUb3keH?=
 =?us-ascii?Q?QL7zP+FrKiXKFxJkWz4jwK9qmiw+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t+fpvTLzT8ljb/vA+caatbNre6tbdAVvnKBLBmTJa375xgv/VCKvCT0fWa50?=
 =?us-ascii?Q?6Hh9BPBXlcEu6qCDYAbDlf7bpXelWSsCl9E24B11wyLuZ3hz64wcAXh5MUZX?=
 =?us-ascii?Q?+XBw6FAdLsuNud0O4azWtRG7vx7j+DrT5hCJyCAWuIEbUslkgVB7sKE80iDR?=
 =?us-ascii?Q?8JHCJvP5LHp4OISlMeVnIBiXUSB19sFxO+KbH/5vL1uF2o95dHlGJuEFIAkR?=
 =?us-ascii?Q?B2T7W57ftjaxFqt2vEji1LPCY7wO8ZyLe9Cf6FwqiVGkj01qLoM7bDHMsn4v?=
 =?us-ascii?Q?/84h2XOalXst/VpFetgvNw81TYeXJ5+Nmp3QW7hXaB6kCGzNjfIInYmtEUBO?=
 =?us-ascii?Q?40Bd1f0jDqJLnUAZkv8xIWc/soI2UrUcNyx/Zpcc8c+BHY91GlZ2ZVAIqMy3?=
 =?us-ascii?Q?DCP7bgicMWcSY/gEGXYzJHUPOiG8mLrbq11EazTz8ic0rKINmCOxwkoD3GZH?=
 =?us-ascii?Q?WOlUf16XroUF2HbO+XHXTtq+G2Cf05nw+h4AH0UrhtGsERGdAfu23D/0KE3G?=
 =?us-ascii?Q?Q6IBEv/JgXpylFaGqwOT2BtR74vZOgFh3FCuw3X0/aR2IEJ8+Cyh1gKMkujF?=
 =?us-ascii?Q?8eQRCFDbkstqrlEN8Au0k+yrDj32w0PPy3TniPLYa+rhjMcydLQV8Xtp3GJ3?=
 =?us-ascii?Q?W9u1WsK/daSbaLMwwlKDjuAeG84dC66Uszy8ww7PybU8c9ju81OOM5OBd4l4?=
 =?us-ascii?Q?c+o1UStUOVhdUx/j1Dqrt216XWBIhwnRwdVMqVffy1rQeDMjic/B9ZB83yKM?=
 =?us-ascii?Q?VnwNEoMgiNHDN9XdJKjv4SXo8ZzOQGV2s8eeEsifmezszN1HVykDfu09OimM?=
 =?us-ascii?Q?uP/PjeVH03mO7RfYtoTf46OPdx8jGD1r+NULx5R0BIJ8d0jvLBulPds8s6cO?=
 =?us-ascii?Q?uqQCeW76SN4Es4BLRhDYoQtI6/62SgvFCResmA6ybnYndTUEp++r6EnmbZia?=
 =?us-ascii?Q?oj/eH/3uxYVcoXkjfC2H7GbgAJXMbMSLrPMCezk+ilFjxjuep6Ms64wjFzir?=
 =?us-ascii?Q?2NexMKgZ7YiOqIgVsfxZ4xHLDbPa0M8WIQRMtKrAz/4xfGBD+BSKTNnRQ5xf?=
 =?us-ascii?Q?YB/mP8MnDOXcNjDzQz1NEMTJDVCQLAOTHWlvh11Az4RzBO9Aa0FC0sxVhhJV?=
 =?us-ascii?Q?RXGQr28TXkd1Yhyhn5FSn6X45xCyscuLpb6r07WzpStIEnW/Pkibuh2jvEe7?=
 =?us-ascii?Q?78qULIcffq27I9+Dity9GHTNetvVaHm8BNjv0ba3KJne3oyAop1YiymSmFgR?=
 =?us-ascii?Q?izRLTxqP+KkMrIJNyAAI9H/yvfitgpsk7p9Op/Qf3Gq39rzAdlkEsA1Ww+JY?=
 =?us-ascii?Q?oM+6pjtIrx3v9uK1YCXEq8zsD2MlzPIieUYb/UNWXD+HAGsP730c91N0GwGQ?=
 =?us-ascii?Q?6keYLsJhDnnJXnvkOIVhh4jqIjevCCOSz8nuB/J0mZHoeSW72q24j+HZLPvI?=
 =?us-ascii?Q?suglXtq77YaMCbp/38wUaGq82Bw3oXrXWfaCSDfYUEsvSeh+q/F4XcgqoFZv?=
 =?us-ascii?Q?q7r4/uMdD4R/wurs7FhYqlgmbU1+TNSrsrvHT1FtRq+rI3ma55TZpgStVFeL?=
 =?us-ascii?Q?A1sqpOltxjLyJ12kFw7Bk8bkRkNgkpNytCtoKGIl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341d6dea-6b28-453b-f43e-08dd5287410e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 14:51:42.3625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUc1BsGStl7h5b/D+a0dZyLVqiJgU7Obw17vUUkRD07RFSokwmFN1sXfGM0Nla/c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_065148_093634_B1E200E1 
X-CRM114-Status: GOOD (  10.71  )
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

On Wed, Feb 19, 2025 at 05:31:41PM -0800, Nicolin Chen wrote:

> +/*
> + * Get a iommufd_sw_msi_map for the msi physical address requested by the irq
> + * layer. The mapping to IOVA is global to the iommufd file descriptor, every
> + * domain that is attached to a device using the same MSI parameters will use
> + * the same IOVA.
> + */
> +static struct iommufd_sw_msi_map *
> +iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
> +		       phys_addr_t sw_msi_start)
> +{

This ends up being never called if !CONFIG_IRQ_MSI_IOMMU because the
sw_msi doesn't exist.

--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -300,7 +300,7 @@ EXPORT_SYMBOL_NS_GPL(iommufd_device_to_id, "IOMMUFD");
  * domain that is attached to a device using the same MSI parameters will use
  * the same IOVA.
  */
-static struct iommufd_sw_msi_map *
+static __maybe_unused struct iommufd_sw_msi_map *
 iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
                       phys_addr_t sw_msi_start)
 {

Fixed it up

Jason

