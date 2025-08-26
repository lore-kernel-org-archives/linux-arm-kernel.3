Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7743CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 20:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EQ/rv+9T8eudcGAWXXX1weU+64UHGgzoiFIv5+ryk4=; b=vXS8LPn1fIgS3eNmdgSfSko0Nt
	9WqihiXPFx4xHHISAirMAS18HmL1BPNmogZEfYfvgdpFlyFBvu8x99V6wxfiGqpW4iq7spuvYAkp4
	SHSiptr/budutboiMIX90LN4G93zzqJIHKB9EfhCnd1g8IaP6zFAIBbkWeNJuiBaeWY0X5myxutgz
	VLiq3yei4M8Eqhh6g2/9Y8gm2LatvsJl088kPCx60GkgpHodJaJEy3XdwTRrcO9qpL9lidd30YUNj
	QX+P3fJgNDALfaw9xSEYg4F3L7iK4QTrTwCqBJGIZQA2dKYVdMBqraQJ320yF4tTZGUbyxdhvW/jv
	gLjKbdLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzsG-0000000D4SU-0Z5N;
	Tue, 26 Aug 2025 20:02:32 +0000
Received: from mail-dm6nam11on20611.outbound.protection.outlook.com ([2a01:111:f403:2415::611] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzmk-0000000D3MU-1UrT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 19:56:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIaZMZ/7aTL9eEQ1t9Yo7Gmb0hhssCubxWcz9+9hamVupcDAa/w4rwDKlTpZkXy58isPpSGgf6SWcW+mzWoDKkPYx+uZ03fLBluLVgt/JV8iHxfT+BQLKM7sXiuJ7EnIH6u/yvBccey1/4YXU0uD+vH2z5HwjmC35383pdSY+pDor0VC6K8RJzJuT4YwLSloP2tBaSfqBZ9licLzx6NCj7hWFdka3XwCww3vsuBfSz1iBJ5MwyjyQy/Va9mHV2jwbtS7q5V/w3w/GQ389ZcjX9D/hrFYH5UDZYCcgKnz1rQ4wK+gJPw82X2H+zYVqmtTbnGOxloxgbVQShdxNU4MRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EQ/rv+9T8eudcGAWXXX1weU+64UHGgzoiFIv5+ryk4=;
 b=kFI9wkaDPyvGYz1olYTFqIzj0JctpriTi+JLRJH4eLfi0F51KMPRcreQnRMUU6oM0JjMQS6ihjJYbAG/JFcluU7jIXzcvkpkTV1W8lhwx2D+1OvY3lyXu6hXBQ+z+VJjV8Dw0d/bcPB5SSFoTlXc4TxLVF6SIWzyZ8c/yt3IM2pdSm0EXn7yOdlKa8cEBAUTy4MdqQSO9m9CHPXOWWn0k5jYE/VwYdSKMkU5bmySRWCYefvI2+c4GgVPm2CpNfwumPGRNpqSoPWhbnSsAd8s2aiLwgN6b2EMMeXrgbdmhBydSlMWssGN27O3qCZ4NqS/0DOnJcRE4erPOrEYrWWenw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EQ/rv+9T8eudcGAWXXX1weU+64UHGgzoiFIv5+ryk4=;
 b=DSB5qgy/zI9NLB2//ERY1empb3Cr3kMPZbf/djX8uVwtmZgpHIqxFO5a3gFr1QOfII9+KP15wdGb8SLMk8d+m/tXMeBcPFWVj3sugv6Rwt4RAPsOAh/HwF9wN593FIqDgdC5VzjI0pqzMz30UwUyBcMHqx06Ekw6epQregvwdpHwqh2qy+EhK6NSUbdCqHJLE7mcyD3rpAPm+yFd4P7tMNolhGBcwBHVcE6Ew023z1NET8wDYAmfCwW8fnqN7eRt1iuv1VFzpQyO6MBgUbjTBa0ltGdBK0CK2QoBGOLky+iNuVlHNTPdlg2xq5XZ1J4sX1lPBqcQsxoGk2dhLWy7jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB8641.namprd12.prod.outlook.com (2603:10b6:806:388::18)
 by PH7PR12MB9202.namprd12.prod.outlook.com (2603:10b6:510:2ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Tue, 26 Aug
 2025 19:56:44 +0000
Received: from SA1PR12MB8641.namprd12.prod.outlook.com
 ([fe80::9a57:92fa:9455:5bc0]) by SA1PR12MB8641.namprd12.prod.outlook.com
 ([fe80::9a57:92fa:9455:5bc0%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 19:56:44 +0000
Date: Tue, 26 Aug 2025 16:56:41 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jean-philippe@linaro.org, miko.lenczewski@arm.com,
	balbirs@nvidia.com, peterz@infradead.org, smostafa@google.com,
	kevin.tian@intel.com, praan@google.com, zhangzekun11@huawei.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH rfcv1 5/8] iommu/arm-smmu-v3: Pre-allocate a per-master
 invalidation array
Message-ID: <20250826195641.GB2151485@nvidia.com>
References: <cover.1755131672.git.nicolinc@nvidia.com>
 <2b55869f698340d5791210b9a7e542f81ad20bcb.1755131672.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b55869f698340d5791210b9a7e542f81ad20bcb.1755131672.git.nicolinc@nvidia.com>
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To SA1PR12MB8641.namprd12.prod.outlook.com
 (2603:10b6:806:388::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB8641:EE_|PH7PR12MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: 91006f22-05cb-45c1-f70a-08dde4daae6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ibHIN6RwLPJhQuZ+ZbJHkjlHSoIRkJoq7mtJhhXnmiWke6juemg0gWi+I9+u?=
 =?us-ascii?Q?m4J8CG2TSp/Uv5oJRX/mQK6i+QY4OO8YIvJ5dNZQlgs6yXGQhHeqxgUmatXD?=
 =?us-ascii?Q?82xrE1+Gax411rDp3oDCzv4OAUlco7EScSrVK0yeLPDlG5SEmzcntFGFf7CZ?=
 =?us-ascii?Q?ktr7sm49RjikkpQAEoZh7oflxLH1/34CfMN8dXWznhbWkMz9aBKHIupJY1cG?=
 =?us-ascii?Q?c7fMXNv+Ooc/9Ha4zK8Js4gFjGv5QSe/nfENvJ8OibZIbBY10ClAHe3R3HVW?=
 =?us-ascii?Q?vSs+DH2eSZOltsNW2OEE+Fp/gR4bCcsJwch0ARLBDBP1xnv4wK05ieGM8dSp?=
 =?us-ascii?Q?sg0/iGjCacx1idIi1tve1LqqFTCo3jFPJwH2q0BTAJH6wbjZ8RGE8q2rSQ1g?=
 =?us-ascii?Q?CnPcYSoqr0v2VfnMUNggzpabh8UZLgbLrPu6ntjzDDpoM3aAqIReVlC2jteA?=
 =?us-ascii?Q?pclDOoHagi9eB5Pkn6gBGKycNJpHibLIX2cGE6izhB01L9HN9g3+TW0hd12h?=
 =?us-ascii?Q?g6hN++qE4GAD2+GLPYfIQAtsGsEtK7RMBtdHLBcMft7EhbcdIGeWqIwccFFU?=
 =?us-ascii?Q?IcC832wehMPAVZUbYKTl2oD6rO0kO3Q0g4KZWf0dyp0OgCU02He01i+/dRK2?=
 =?us-ascii?Q?7iV2BCaku4mrCBuLiUqavwY9J1hW9GmRB2uU3s2PWcNGpj6X8JWlmsMkAMg0?=
 =?us-ascii?Q?NtcCHb8+VyXIgmUSEkMIukfFPoVcTe/zLiQX0k8zBQclY83t0Se9ynkC32N2?=
 =?us-ascii?Q?DOcoQXTCQWCVZoWthIy12dAQmNEqcfQjw0RdJzy6hUGldx+znjHiNqhvb1v7?=
 =?us-ascii?Q?LV/f05vut95GO9B9/s4Q2ZCHjkAAhmXtbCzIolcjp0BXEeNulXss/Ixh50Kb?=
 =?us-ascii?Q?2BBfHa3t2cTNlZP6Icr8OeB1eqjL5VOQOKtvK4VTYiIfDhasH0zA3aKegSXU?=
 =?us-ascii?Q?MpVg/aYj9lGDDqYXVYp7uxqB4ORUwsWLv7aklJlKwK/Iw36JOJoAimQQqhNh?=
 =?us-ascii?Q?y0bL12F0srwM7hj9hkPeGpTuifjiSaK47x8UTc7zoJqGyP++3SUC8UBfTXk5?=
 =?us-ascii?Q?61CcM5EjKl8CLncGIFGMSObfIyWj310fOpHm66lsTzXG4v7xX11VTCXoLUAL?=
 =?us-ascii?Q?cdYBq+1O08ckQpbZbN/aWVcHPVsUk1fV5P+hEehC2KmtX0TByL5w2UbgYN/2?=
 =?us-ascii?Q?Xw0Ivbiy8m31AZwLJm+QYhtCHte1X9NJ+segCp6KK0EvsZJbtOchOkfUcBRk?=
 =?us-ascii?Q?5OeiOp9EHfwcofI4/2v2OuEEOaUr9e923jA8Ag0iwlEygLuICsh4RgvLotD1?=
 =?us-ascii?Q?tDo2g6lYr/skwOe3xrx1ZJPuCNnlNFAy06YrwNRTfXduAxVdY9kFxnE502g0?=
 =?us-ascii?Q?KIdKsNR6GzalTVqWnMoIXX5CoNasilcUlBilA1XotOr+nRGc9cNcR6/ny7LY?=
 =?us-ascii?Q?9D/cTYDcAIY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB8641.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xKFP++m5sSm6Z4daVJyGvV0EH1M5EXY/xFZUo+KtfoQnccmhg3xLAwCrNo9K?=
 =?us-ascii?Q?fbNeILohiwmKxFsqfJVWaahh+kbwC09VZQygF6gFJTureEmj0v4x4RqjMnhq?=
 =?us-ascii?Q?4bsfwYx5TEn+nFW9s9C+WxJI+6UeZLVuo4KVWuXqYOnVb9maBbWcwCNWcato?=
 =?us-ascii?Q?nHThsgTHvx998FEUT+2AaXl60QwfkaHPexiadZO8UN+UgVwcFWAZBNlygmF7?=
 =?us-ascii?Q?BvB6nNCb3WAP0uoj1Ajp88bySIwEYNcL77xQQ16u0XjeBwn1fH9Dx97IvcUs?=
 =?us-ascii?Q?ogA19C/wqulMUlnetXbf2zwnLmwvO1WL4iR8GqHw3eSsddwacSGq+dljqyPr?=
 =?us-ascii?Q?+JgV+Fiih001frB2Fck/+NA6hkrAfHE6NbYUSOGnanVgeHVVBrzX4mQyhrKI?=
 =?us-ascii?Q?kTEH+kGRdBEfA0fy0hJq3osK1yidS1FNtwk4wYWfmKhgO+STcGuaRMRbFUFc?=
 =?us-ascii?Q?WUAXHQApMCELXwe4jHSt9+zq/NlPAo/vsgvDAQT2DCg8YBXDJvyVzHpcrCBX?=
 =?us-ascii?Q?tYHYNSVMGLek5sgFUf5Lm45YYIt/Ouog91dp3XGASoDlb1caPJCFPKISWO9K?=
 =?us-ascii?Q?Q+fqq2hl54QHEn2QjKc363ogdMbFM2rE8tM5YwjFYHSqQ+E0Vor0wKsoduXJ?=
 =?us-ascii?Q?KrObXETghpeqiah8Yi49yVf5nQzpVCQd4PSyiJin4TujgpJ/rtfcUf9ugC25?=
 =?us-ascii?Q?JuViycUhQxet0CHhq64ZrCvevaKfqkRfTtk0tbWa5YA1MCElN7BguIRBjNOG?=
 =?us-ascii?Q?ooA1Zh96qxSW4Kp7RSGx9CyRp8E/VJGuLNtpypjU1j67weQslxDcmSFG0qFD?=
 =?us-ascii?Q?BfoFR9ZkgFP4vTgXnWviCmu6WHq4PbsFlqYLyRoGgZIVrbMMA2q2Vm8SHz8I?=
 =?us-ascii?Q?a0CEs9EGSwv6mWZRWwvlEle4794y3/jH0An9ySkZxTsp9+i2GV8UiZltWhhg?=
 =?us-ascii?Q?E7GY0KhQ40xXfZWzBJBVxqdHote+QZQBh2yNW9leohc5ops89GvmDD8pCBuU?=
 =?us-ascii?Q?yuEvBlv7zb+Ceot3VPfCrE4C7srQXikapn8WKu9jBBcKljW2FXONYxX9Jy3v?=
 =?us-ascii?Q?eqr3GNjOFNVxEGPu230KAdCkFZfPC4qT6l3ItpJVS4MOyLPxiea6tJTIJjQy?=
 =?us-ascii?Q?nJT8+HGAC1H3TqtapsxXiEFBCl6jA9RLuqZkqAVN2RBE9QMU5z93Dve6RoLJ?=
 =?us-ascii?Q?BHuNiLO2QdsEC5a/TR3wX1Z2V33+l/0YAInBXMKLbuJk+SxA3+kUuEMjU1N/?=
 =?us-ascii?Q?zdqfTtjPVKrLazGYW+pIx5b4dY2aP9lM95xkpuVpUsRBY9e97krMctVINqZ6?=
 =?us-ascii?Q?2zjUYJfAZPur0F1XIP8Q2GhW4kcxkNDSzqJM3eUm1+eF0IWOupJhvYYim+cr?=
 =?us-ascii?Q?gdjqSFa36VwzDT+HUpV+qRggmV8jKAjv9SqCsWJTY42t4+7+LvipuReMHcjT?=
 =?us-ascii?Q?A2ifcI3yeM9koXV+xMQGcsmyDKsLIzPtIQXPynDKJ4fRAYXsQxiuMTZ4LdWA?=
 =?us-ascii?Q?Yyrou1Bgd37zovBXkf/DqodpD1ndD0I7AXeaGN6eJnyHJxEBtFvy2el1vbgE?=
 =?us-ascii?Q?RwRe2vwr9A06C3nE67DJ2zr4xEgq5aiKDTZXUVBj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91006f22-05cb-45c1-f70a-08dde4daae6e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8641.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 19:56:43.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vY+lmIgq1cfXeZAxBMHTr/KyHef9lQB4v7m+DESJqw1ouuttC2mkX4dANtN6pCYz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_125650_397213_3A7AE29B 
X-CRM114-Status: GOOD (  13.07  )
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

On Wed, Aug 13, 2025 at 06:25:36PM -0700, Nicolin Chen wrote:
> @@ -3730,6 +3731,13 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
>  		return -ENOMEM;
>  	master->num_streams = fwspec->num_ids;
>  
> +	/* Max possible num_invs: two for ASID/VMIDs and num_ats for ATC_INVs */
> +	master->invs = arm_smmu_invs_alloc(2 + num_ats);
> +	if (IS_ERR(master->invs)) {
> +		kfree(master->streams);
> +		return PTR_ERR(master->invs);
> +	}

This seems like a nice solution, but I would add a comment here that
it is locked by the group mutex, and check if ATS is supported:

	/*
	 * Scratch memory to build the per-domain invalidation list. locked by
	 * the group_mutex. Max possible num_invs: two for ASID/VMIDs and
	 * num_streams for ATC_INVs
	 */
	if (dev_is_pci(master->dev) &&
	    pci_ats_supported(to_pci_dev(master->dev)))
		master->invs = arm_smmu_invs_alloc(2 + master->num_streams);
	else
		master->invs = arm_smmu_invs_alloc(2);

And probably rename it scratch_invs or something to indicate it is
temporary memory.

I'm not sure there is any case where fwspec->num_ids >1 &&
ats_supported, or at least is should be really rare.

Jason

