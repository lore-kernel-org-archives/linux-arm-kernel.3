Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC9DC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 19:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGCBQXcRBkgrd37YNskUHnnk0FetUR6jvdApHdcJ4Tw=; b=ZG/5GoMyf6U6ke8Too8x+57kDq
	jQQnaCQLjjLPcVZf9Z8d/VnCro/Bj5IskgJxvNSjoNcE8eHQyW75BDZVdbgkLjE8B1g+k0McqKOx0
	7al2W/Z3YYl9Q+PX4rEAocSO7k7xoZc44gTFRk8K8Vkz1wbGBHURWc1etpz3BrASSyKouiCUOXskG
	hVFGozlM1CaoggOYBVbkHuWSrqh0lrivzzYLbvkSCccGgBSSw74vxdrEoDkV705xjnuK8MsveoGPJ
	qxwHpUVieuFrFX72iGkPCgdZDhE/prTrCgohwPdmL2kNJhWGtXsC20bpOXlaMrSHypje/66MkWsQx
	Cb6NgYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ZlV-00000003BA9-2tY3;
	Fri, 04 Sep 2026 19:39:57 +0000
Received: from mail-westus2azon11010068.outbound.protection.outlook.com ([52.101.46.68] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ZlQ-00000003B6h-05qv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 19:39:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1uYIjKM4sLwbU3hqUqu2z4JXikkfl4QywG5R3N9DjmRUDl98sWJUIapD3FsHF5+eQX9B5WJ9Kal/lnYdOLcNkNdbLHO86w17x9lAsX1Bw3RJwL/m64bN+TC2CNrNXgQMJgetSI5NhpjGTNSS4PyZFUwPlQIJ3qh9NzA4h+9Dis9jI//KK10fFv6SkVOoJEp8BVb3F3rEnELwY9SyX8JhY8Q7aPwOpeAcUeWT7x+74TkeQITuwKL9RK8BWUROpqEANJfFSjvRvIisCMRVQDjkoXV6OQe3VMz0ayql99oLvfnyzlr0o5UCn7D85RbvTTgBjkAF1Nh/gZuxL3nQR8I6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGCBQXcRBkgrd37YNskUHnnk0FetUR6jvdApHdcJ4Tw=;
 b=QWb8gBOmGB/2FT7U3WIAHIOpLhhLpXuLyV+qdHkiU0HfS2UEBrCFtHWIwSrKne6Dgq5VbK5bQr3OQN2IGsxKy1HI4OXF7UTVVOjLjGDQjt3dq03zkH+uU/kfgZ1y3Xkw1lQMseItCaY5zBZkG+S7ZFY1mullvcRtC/Nefm6yszd/N0VAOjeeHP/fzcOR1KxX3cbrXkC/vQ2mqjAFNJeIdhoutMm8CJQzuPzKDXNYyf2ayPsn2D2wAqlVY/qc25ahBbCYyrLH8tq0vyYWM5p7O6zohU3+loqaCYW1Fks//p6gtO1BOuvAMFRD5OCyOSOm/lf+odYVeqDZn5VJrJi99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGCBQXcRBkgrd37YNskUHnnk0FetUR6jvdApHdcJ4Tw=;
 b=JCaPVVKyYMvl+UTLQUYwpNf4qUZFkq/2kycTjMiXE04KF7rV2MfjCepRuJGaeMpyp8SPGDC26zQ90SOm/UABzr3pb51bnsomY3qTS+oK4HLZbnNfihgmApqbNP+7qyOKfs3vkH6vJUchgRVBjz+CSlCeZnZuHYwl3/AxwqpTarTlFKpgNNu552YKZCaWXePZgxLOSHz9GvUHK6B7bUCDxU9zCkzJ0YIi2e4ORcq7G3ZCE+QiL8nBLHp9NtCHQU42MTGHkaOLbQ4FjOuLV2MfEdlFlIKW8T2wBD7Bz15olMn4Bmu3gsOGnWaM31ubH+TpEYjrvZqEJXdOmLFsqy9F7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 19:39:42 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 19:39:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 1/7] firmware: smccc: Add an Arm SMCCC bus
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>, 
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260904095000.1184861-2-aneesh.kumar@kernel.org>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-2-aneesh.kumar@kernel.org>
Date: Fri, 04 Sep 2026 16:39:35 -0300
Message-Id: <178855077568.693280.12901641270978126497.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: IA1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:464::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 65519589-7b65-4d5a-187a-08df0abc424b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kVny71iuVTg+ybUSsoCsKAyrpU451dyqcuKuSTUObsRFhAnVr8/kVbbTNO2GWuCDkH8aIq/h+GvdgnyuC07o1qWtYreXZ6AyIO/DYBay+pePcJrKYIbYAZq3yRUQ/HnWZA87X4yTEdzpGCgYrFGUEsSB1GrUjPlSB33zqh73Za0bWnq6SfxXHVl9vEqLbddc2RluSxeWQDKJXPZSsTNbzM2EVG+si2HWGPksEj2y44P437ID1ueyXoV01/loPhc/QOCDT3pTapN2cQYY10n7FepKVNHzY5f+LxvpFLGU+MLku/0VnRIu6NYTMqZRf4OnzvXMy5SJZ9Oy0U3A6NrfUeOfQxO5jGGd30v0MNNocUD0gYQvOpYZcPx8+0gW5I5xln2DvouUg42F9w2mM1Vk2lI6PQzqFunp3YskAjvRmSG4l8tGKs/7xbij+B75bktClr0CMNOETDCuhTbCn4E5oGlyfP7FfoKAWQxzaF8O4Fk0vTI7iNBHNCmp2sy+b6BZvU+iU3mT1tvpZBmF+DgQExAFwWcoBWtiL5J8euHAtWOvcgijWcZjcxcekDviTRhUoSsQhpZetvDXzjbXsdkovUA3Hi4o9hC/pqm8v6ivwCO6SD2LdLBjY/Agj37GAnZ45thIWvF7+MSyovLuZIKMo/pA+tIo1GbE9o6BcreXTp4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OSs2MWVneVRKNi9HRXRPR3IvZEFYclpCMXFqRkllT2NlSlRFeThlelp0MHBw?=
 =?utf-8?B?TkFlUUZjMEs4Rmtzb3lLZFpXU3VaamNXcVE5ajBYWkF6ZVpWcjFYbXdQVW01?=
 =?utf-8?B?eHBjaUhOV2l1UXdaRjlWUTNpdHRnTG5RVzk2RlhCYnMxRWNrQUVBYmgvKy9p?=
 =?utf-8?B?WnlWa1p1UEt0WlhmWlNkM1hjeGZKQm9NRTFvM29vT3lQSThweEg2MGM3bGpt?=
 =?utf-8?B?V2dwZFE0OGMyYUFxUURWQklUOWpmODVXYUQ4aTU4M0RzTE1pNVArMSttdHZM?=
 =?utf-8?B?YzBZdFd5Sno4eTdNUmE0YVhhd0ZHYjYrSndySk5Vb0FNTE1DNEVTaDlwZElv?=
 =?utf-8?B?dENtSTBqVGVwVEYwYXB4QXliS2pJWnR1b0RwMFV1b01zazlWejVBM1hYTDZr?=
 =?utf-8?B?U1lxSlVWcmVHZFM3RXZhZk1ETkNTbmVhb3dkbVc5and5V1ljTjc5TkxGWnBB?=
 =?utf-8?B?L1gwYjdhY0JXVFhFUkZEY0ZMa1FOQUFEdFlub3hpZjcrWlk1YkJRL0E2bzQx?=
 =?utf-8?B?WU1IYmMyOG9LV2VpM1VwQmErR1JMSklZNGpHR1FzQ0phZWltMlcxWXpyS2lP?=
 =?utf-8?B?MlRCaTY1eTVHZDgwUUhCUnpWdmZ1aWI5Y3Y5ZklpZVl4MStvNmd1clFMWEFk?=
 =?utf-8?B?RzR3a01Qa1U3UnJObExKcHhuUWJrMkl0Nzh5VlliSzVHajJUb0VNNHNBL2JB?=
 =?utf-8?B?UXNDeXlnaXRsNXRLNDRETGJUQURYZzNmV04vNnJxQW5JZXc5THlPcW4vSDZN?=
 =?utf-8?B?VDJXbU53WnFGYVJDbit6bmdQWERlYmI3TTFtUUh2UDA1ZUFVZ1hWSlFuSWZw?=
 =?utf-8?B?c0xZVlNaSi9OQ1g0Q2dXVVowVklDVEY3YnRlK1FzZnVNRjZ3WStxTTltR0NC?=
 =?utf-8?B?VDhQeEd1RDNFTkVFUjFnWEhOYStaRStReDFSSVJReDdQYjNnL3Z5VXFaMEUv?=
 =?utf-8?B?L3c1NTh3TzVzazhUOTVteUhEaWhZWGhXYlFZbTZVcFZSeVpWblg5aDZxSVV5?=
 =?utf-8?B?UU9TcWJpZ1l5YUVjUHdxVm85VHB4aFdkUHI5MzBsNkh3clFITDdpNXdVcEEw?=
 =?utf-8?B?dTlCblNLS01nZCt2WDJSRzYyeXZwb0p5bG53aGU1SmVwZzk5b0tObHJkVmJG?=
 =?utf-8?B?L2ZBbTdoZmVKQ054ZGg5aGNxdldtMS8yRm9MNGx4d1orQ1Jyd1lCcXgya2dM?=
 =?utf-8?B?Vzc1VDdiMXBZbDJNU21NR0lsaXZrWTM3NjRzSjh2ZlllN2tzbVFYZnNNV3Q5?=
 =?utf-8?B?YjEvV2k4cndSZTZBQW1nVkRFZENwZi9OUXcrS1NKQm5TQTNIdGFub1pCbHpE?=
 =?utf-8?B?ZkM2a2JSYXR5YUNEclNoQTNEYXB0OWFhV2FqTVMvUlIrZlZnNXBjYTN1Q2Vr?=
 =?utf-8?B?MEpDTnFPd1Jnd1BpZDcyakNZVTAwMHhQc29JYVRjbVVxMGIrRjJ6WU1ETnJH?=
 =?utf-8?B?RFVKZTBTUWJEaTlhTHdRb1AyZGF4c0t0Q2Z5QUw2YndoUGJmMFpEblpncS9N?=
 =?utf-8?B?WG5maEJnTFd5VXFLak9jNFFyeE5STDBwL00rNDlXYU1Qa1dNYmNKcDluYVlR?=
 =?utf-8?B?bXR1MnVhVCttY0pKN2lNWDJmWTV2UUZxRmxJVTRpSEFHV2trYzBGNFNWaDZl?=
 =?utf-8?B?bzdYY3Z1M2NYN3c5OXJRNDIzUHY3RnIxZnQwcC9DZmIvOFNGRGpydWUrQnpP?=
 =?utf-8?B?SUNkYWFCb0lVSnJMdmFMTk1pM0lpMDlsUUw4bitrQWFZbFFPQThQWUhhSXB3?=
 =?utf-8?B?VGZCWE44ZlhWSWpIOWRwVmNIZFFTZ1JBZDllbm1KKzdEZm5FQlkxa2tPVVpS?=
 =?utf-8?B?clZnR3ZVN2F0blZmZ1pGMkRJc1p6TDV1R1Awa01HUnZsajZOQ0tiRnJiMXg0?=
 =?utf-8?B?Z1U3SHUzeEFOakY0akc5aDBJZGx1QVUrSExWQXVwbnNJekJybFlaSzBjdXVj?=
 =?utf-8?B?U1BZWTRWeGlWSmdGcTJ4dlFudzB1dFBvQzlaMlVsMmtoQjVNWXFJL2gxY2s3?=
 =?utf-8?B?REQxaVdCaFNJUjVEc09NZTMrVm9VT3JpaHkxTW4zcUVqeTZtSTlHWW8yMVhu?=
 =?utf-8?B?QnYzZTg1K0d4cTZCVjFJT0NCSWtDSExxdUwzRDh0YmdveGZaSEt1SXZHTXhF?=
 =?utf-8?B?VGdpbUZpMVRlMS9EdkpQMXlKSlhPLzRiZmdrbDVDczRsNFFjM0dnYjZVdStm?=
 =?utf-8?B?dDR2SUhFeWFVdEtaR1Y2SkNxV3dabU5TY3diTXlCbkRUSDJvK3Rrc2luNVBX?=
 =?utf-8?B?SE1EbUhNVFZMREhHUGs0Wm84QkJUeEMyeStRdHlxN29WNndBcFJIbnpuZmsv?=
 =?utf-8?Q?sfvjmQCXUyCoXWfrZO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65519589-7b65-4d5a-187a-08df0abc424b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:39:39.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKfK69SAqYtI8Wgp0r3fv8dd2VEE0BqaBK/5/Y2ikE5cO35tp7wMiiZj0qhjsZ+e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_123952_067610_527E483B 
X-CRM114-Status: UNSURE (   9.44  )
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

> [ ... 243 lines skipped ... ]
> +++ b/include/linux/device-id/arm_smccc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_DEVICE_ID_ARM_SMCCC_H
> +#define __LINUX_DEVICE_ID_ARM_SMCCC_H
> +
> +#define ARM_SMCCC_MODULE_PREFIX "arm_smccc:"
> +
> +/**
> + * struct arm_smccc_device_id - Arm SMCCC bus device identifier
> + * @func_id: SMCCC function identifier
> + */
> +struct arm_smccc_device_id {
> +	__u32 func_id;

 [Severity: Low]
 Does this new header need to include <linux/types.h> so that it is
 self-contained? 

 If a C file includes <linux/device-id/arm_smccc.h> directly without a prior 
 inclusion of <linux/types.h>, the __u32 type used in arm_smccc_device_id will 
 be undeclared, which will cause a compilation failure.

It is minor, but if you have to respin it is nice for clangd users if
headers are self contained.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

