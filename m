Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CBBC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 15:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQJAXpvHCW6eCgk5zoBB6QUeth/krclAtLV/LTqj8m8=; b=mc3P9bw18Xs75HKhEa7lhQjY+q
	M4xzyw2WpSphvq6AEOwd5Zlv3gxtaQgtWWUX74DW8HKTlE5j+MjliviWQshNibGRnAlLiSkBAd6cd
	mLA5D3gKfd/wzSzz8y10ZHOOdEv8fVuwcVnuN/9RfI7/n0b6/yst/2GUE+Yywcf+D5JZjVru8Bbpg
	DAbv7e+sIQoctqujpV8grOfsJCKMkrasb9BC+I06/R44NSkWrFA/akZh3cX0aWbh/vJMhh7SmPO/P
	REkWVz+2BQvROdbHfXZt8yn5wXOMZVfkGALVi4zpSpF3BZQxPlDBUAStyFDh+1R5DfmgRifgPctfz
	AdZsrQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY4Sy-0000000GhDx-3ote;
	Sat, 05 Jul 2025 15:06:12 +0000
Received: from mail-mw2nam12on20629.outbound.protection.outlook.com ([2a01:111:f403:200a::629] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY4Qe-0000000Ggz8-2GiM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 15:03:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clu/5CISrh9eIs2SRc88XALq1mIZuS2eLDDdjcb1QYfheKrBJQoln3vECrQtpuQo91/BF9F66yrGKqBM++/TqB8lqxMB07lb3YtGWFlrBsmiyN+MYQ2GoslZnOtsOZN+bcT/X1a+Jtn868L3Y+f9UtrfJFXZY4PqMAhwa+WFymlNtB9ab+BqqLR1h0DKaTryFcaEcd61UGfFIkWHD3o8ok++O6eguQd5vKt9yCyx0gNfEW2OTi9Yabp3D8tKUpPGA5x/p2rsjwJ6QCTuLehzToZouADPFhWJYwTOFmVtKXYDApFNEV86Iu3QUa+CE556Du+dYCV+hhXTly1qzjaZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQJAXpvHCW6eCgk5zoBB6QUeth/krclAtLV/LTqj8m8=;
 b=R1Odrj+XD2rbUPodRnhCjqVrTaHq28QJC3aJqE3V0r/gHcQ39ZEf9sJTqHZxWM8wUuEO3js3zVsHOj3TBx6+fotgyj6gAk3p4nR3R+ar11go8/2zpBuyPyMuxLBCYff9D92pNiDBwqFmW6yZ6y+P/eOIr5VrLRKJCXpHH5H9zAGyhWUU3tiGOCnSJRzojSbnYPi3mZchpgRdOtKdLRCMxH032/wT9A09Qxcc2/xNPNCxbXsaYJmzEriXLiqSlpkzX4KNgjs1j2lKCRhR41QsgVWc9UZQXthPqft0rW4fo9b44/+VNJYXhys0XM4RbCYo1uv36ewD47b7NyqdgFRk7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQJAXpvHCW6eCgk5zoBB6QUeth/krclAtLV/LTqj8m8=;
 b=jIjpWgp+IXdKoLEkSv5P/0vXO5/C1nHygBwF5WBuMP6z+FQe2sNriFFlpFjgIhY7lh5zajPCQj7aYwXhf4PNI7PlKvFWgkJhwLchUZyiZDXYWEF05gjWX++Z4KvSqA8JjOzUcY2/eF/SzJS38N44xHkZU2J5WMUdW2nFMnJx0g4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6048.namprd12.prod.outlook.com (2603:10b6:8:9f::5) by
 DS2PR12MB9776.namprd12.prod.outlook.com (2603:10b6:8:2bd::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.24; Sat, 5 Jul 2025 15:03:42 +0000
Received: from DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::6318:26e5:357a:74a5]) by DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::6318:26e5:357a:74a5%5]) with mapi id 15.20.8901.018; Sat, 5 Jul 2025
 15:03:41 +0000
Message-ID: <5d186300-7a94-497f-8d10-30eff1bd2795@amd.com>
Date: Sat, 5 Jul 2025 20:33:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/29] iommufd/viommu: Explicitly define vdev->virt_id
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
Cc: bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
 peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
 praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev, mochs@nvidia.com,
 alok.a.tiwari@oracle.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
References: <cover.1751677708.git.nicolinc@nvidia.com>
 <146f91d9e1974cfdbbed3418373645295ce0cca1.1751677708.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Vasant Hegde <vasant.hegde@amd.com>
In-Reply-To: <146f91d9e1974cfdbbed3418373645295ce0cca1.1751677708.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::20) To DS7PR12MB6048.namprd12.prod.outlook.com
 (2603:10b6:8:9f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6048:EE_|DS2PR12MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1e1c66-e98a-4484-21dc-08ddbbd5210b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlN4ckorQTUybk9KeEVHTjExdjhlemwxT2xDSEdkWHRNZVBFQm0wN2FlNGwy?=
 =?utf-8?B?NzcvZ2kzd3dCZU9CZ3FWZlpWc0kxZUdlSHA5ZXBqSnU3K2dqRjNHWjVIM2w2?=
 =?utf-8?B?U3BOdG9kN1EvZjlEUU8rckJkOWY5ZDhJWHN4ODdmN2R4Q2N1UHQxcXFycU9P?=
 =?utf-8?B?MTZZS0xlNzk4eWptMXRuOHRBUFkzcHg3cktKbDR3RFQ4d2RrNUF6RHljQkdK?=
 =?utf-8?B?MXRnVkFSWE1NUGg4U0hYTUhaUTRnSGdPazcyN3V0Q2ZMWUZWV0IyNlNsUGZO?=
 =?utf-8?B?dWlBNnlYT1BqV3FBcG1QbEhXUys2WXNZbDZGYmhQeVo0Tm9ZZkJNZFAzMHJC?=
 =?utf-8?B?ZGttalRTby9LRnJDbDRMSG85aW5EeXF0bDFlcUtvdEdLeDVYM3h2c2RYNisw?=
 =?utf-8?B?b3o2bXFUcC9MUHdrOHZpTzhCSkhXY2t1K0xoeG1ieGJmYmRoZHlZSnlxY1hk?=
 =?utf-8?B?MzlzMUtIM1MvOGhvU3hEQnBMTmhCN2dkYk1YRllzaU9HbGxxdnBIS2dUWXZ2?=
 =?utf-8?B?U0VZSDFhb0hFT2xqZnA2N2U5V0x2dWlRSm8zc0Rvd2lyZWpsU2x3UEo0bnh6?=
 =?utf-8?B?ay9yVkVzcyttOVQ5eStyNkdDbDhJd3RSRjNLQzh5Q01VNncvN2MySGQ0VEw5?=
 =?utf-8?B?VE9HazdwekxjQmcya25XUnB6Q0Vab0pCMnA4Ym5DM0EzdnFEakl1M0gyRjQy?=
 =?utf-8?B?elA0Z2xvem9mYkpTVVB4ZVlkMzJtajUyZkhBcHROQmQ1a2M3V3RiV3QyTFQ0?=
 =?utf-8?B?ZE82K1ViaVRGNWxka29KWGNMaktkdHlZQ0piL3VGSm5FdVIzdEFKZGM0Titn?=
 =?utf-8?B?K2JJTk1XYnNva1I4K2FHWlVHazVVSUVOUit5dkE4RC9vM25vZE0yL0xkRUEx?=
 =?utf-8?B?eVFQMzZYQURiWXlmOEhxNFdJU1dhbEZJT3pxK05BV3BSVUtpQjM1TEF2RU9L?=
 =?utf-8?B?bzNVMFhTeXJ5QUJrWWVBZlhpeEJTdk54OWU4SEdrMHQrMnZDbittaWxsVm1n?=
 =?utf-8?B?Qnd2NDNPMG82WjQrbUhma2l3WDhNMG1ZdkFLTThQWmRhZ2NMaFZtalNYUVNC?=
 =?utf-8?B?aXlWYUNMVVROSlF1SksxU09MQm1yaU1keExPbU5HSVBpK1RwNGl3MmJJeE1Z?=
 =?utf-8?B?UkJzSkFIbkZZaGsxc1d4ZEl5aG1MVjBZNlRvK29yNC9lcENGTURLM241bWpR?=
 =?utf-8?B?eXhBTGNzUDdxRVdEOVFLWHd1b2FzZVlDRDlLZS9KU2RPb0pDYXNIZkIweXY0?=
 =?utf-8?B?RkNCaE1wNktadisyN1FwWG9LdkIweEhDRDFzd0JaK0VpUVZWc2VhVWlqMVZw?=
 =?utf-8?B?RlRCKzZOZFFpbHp6OUtpK3VlcmNHeGtwM25jVEMyb3A4ajU4Wk1NMlg4SFRQ?=
 =?utf-8?B?bjh4dHIyWXpsd2xibGpieWR1cWs5bGZ1MzE3OHBFNDY2elVJZzQ5aUxmRWVs?=
 =?utf-8?B?NUZ0bHEvS2MzakdZMW5kVzNQR20wVnB0c0JLTGFzbCtNZHRWQVd5Z0hpMzI5?=
 =?utf-8?B?SkdHSDY0Wmk1TmZTcmhETExYQ00vb1Y1SzdEdVp3YXYwRnFPdFZYZzZGMER5?=
 =?utf-8?B?eGxGWmZRK0RsZnIydUxZZTBaVXdNUVNlQ29BREgxVGJCZHk3YWkyL21QV2RD?=
 =?utf-8?B?VmN3VGhOOHlRdEczd0hML05lNHlhb2Vna0xDekZjQndkVXQvbHp3bUU1SmlX?=
 =?utf-8?B?L0hxM2lCRC94Y3dubU1FTHROZk5OU2REekNCTW1HSzI4RXo2K2grZlp6b2Uz?=
 =?utf-8?B?NEhUMUtGVkh0YmVjNGRsdlNEZG1ZV3pDUHlISTVTemdJUFhuaEVoa3dscXIy?=
 =?utf-8?B?ZVdBcjBOVzFpVlZLS0NxK0RXMU9yOUNMcWNXbjhQYlRjNVh2LzFETlRUYVRI?=
 =?utf-8?B?ek4yMVJ0MlZjbWp2UktGK3VObXBDSytia3RGTzhKSGtuM3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6048.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2FzMTRBdytaM0FGMStRa3E2L1FCc0xrbm9qQmdybjFYTVFzdWVzazdPMGF1?=
 =?utf-8?B?SDd3NlpUOThocytndVN5Vm5hMEZseEVFQ0M1ZjloRFVOb2RVUzBXTnU5eWNE?=
 =?utf-8?B?c1dmbitPdi93SlA1VzdHRDdtbzNQTEtIVDFwZ3N2RVkzMmptaFVkOVUyRjlJ?=
 =?utf-8?B?QjByMkEwVWVWMisrK0Jjc0ZlWEJiTEtWMzNwbklTRExYcUNjNkZjTGFLQzkw?=
 =?utf-8?B?czFsMFhYbXQ1NTJPbDFSdURORVRSWmxCd01KTkZRS0ZNdm13MnA1SjBtQmpF?=
 =?utf-8?B?UFJINWlzVlkvdmZWSGoyUHdiOUdjd1RzQ3N5QkNFcXRBNDhYdkRjcVplY3N6?=
 =?utf-8?B?V2FRT2JZRFB4b0lHVVV6ZU81ZHBnQkVCNm5uOTJibWtjWkpwWE42eW9CWXVT?=
 =?utf-8?B?RHZMaVFXVzMxSWYvYU5GVWZLazVKenBJQ1dQZ05kSmhOckRGZHlZZVFxMzlL?=
 =?utf-8?B?cnBNamQ5QWdtR2RsMEx2VUJLbkRPL0lUNlltdGJRemNVS1ZzSVpmTGMwTjZS?=
 =?utf-8?B?a0kwemk0dVZUOWJQSGRCNEVORmlub09aeGFwNWJHWXFsZVhOL2VIRVdpMmlH?=
 =?utf-8?B?SVV4elFaZ0VlNnhaNDY5Y3dYSVByc2VIeWpveFNjSFpyazExN1ZTakc3VDJj?=
 =?utf-8?B?blZ2UFRYRDQ4Qm9pKzZJQU1URDlCeEU3Z0U3bCtTVlVQMjZ6THFwczEyZTg0?=
 =?utf-8?B?dWlHV29uL2Z0MDFvV2ZubHpKWjBpL1ZHQ2VXQis4L2czbXdCL2RFazdwcWxj?=
 =?utf-8?B?U0owMkJtWUJ5dkJGV2VrV0ZHZTNwK0hOV29JY3NvRmJpVFZ4QlMzNWVBQ3du?=
 =?utf-8?B?NFZ3bFRXSXIrU0NjbERCTjVKbG1LM1ludFZ4VDduN3RTZlQvR1pWK1gwaTEr?=
 =?utf-8?B?ODRQYVRNKytMNHptQWNad25DRVYzRmRUVDlZeVdxSkdrNVo4ZXhHRnhQS2p0?=
 =?utf-8?B?OE81VkwwbjJNaFl4MHMzMUxZczdjRThxVFE0TTJYKzRGNUYxWWc5bWlDdEhK?=
 =?utf-8?B?bXd6bXlxcmtKd1czMDFlVDI3SnkrcVdpUU84MjMzTGtGc3ZqMG9iMUZ2dXdl?=
 =?utf-8?B?NGJyU0pNYzA4eXhmKzZySDhoNWNBS2hBRnB4Q2FwZUxTQzhZZnpkU1hHT01K?=
 =?utf-8?B?RTlzdUluMS92dDVxT0ZHWmpRd292c2tiM3RJRUFtL05lMXNqbHhXN2FZeU5m?=
 =?utf-8?B?cHZnOTI5S2ZyV0tYVFhjeVFNTHlZZ1ZUYWhvTXlJTXZudzllWnFuVjd5RW9s?=
 =?utf-8?B?VGFaOHlnWXZBUzBSbm0zSEVKYkdCUEsxZ3JqSzdWbndNckUwcXJWMGFCcmJW?=
 =?utf-8?B?ZHZjbzVFVGFlM3gwcS9TUG1oZVVuRk13VjFGOE5vaUQzY1FYT2FZQ3NscVd5?=
 =?utf-8?B?ZHFqdXF3VUt0bnhHM1loOUp6ZE1jbmkvUVBoTWxYUHlHSUxxNFovMHgxazhw?=
 =?utf-8?B?dnhsTlFCTXE3T0JqNmdUNktnUSs5azRBWC9rUVluODBtQTB2blBZVTM1Qk00?=
 =?utf-8?B?TW1NeTZCZ2I2eUczaUo0aW02WVo1ckplaStTb2c1bXJyWEZBZnpYb05ZQXBD?=
 =?utf-8?B?WEpMSGpFNjRSeHAxekducUpqU093RXdLT1A4L1pKUHRFY2VKQUJPUkpleFlO?=
 =?utf-8?B?Q252eXJwb28zcFhMM0lobis2QkdISDErTTRlMWV5NVUxYUl0akRmY1ZjcGMr?=
 =?utf-8?B?OWU1UE9KTWN4OFBCNGRCOXZyQkoranNMQTFiRXAvTk1TVElvcEJkTURXNmFF?=
 =?utf-8?B?VjBHNkdLMm5ZSFZVVVdiTjNBeE1Vb1dWeGFaSi9GaEloMVU4cjhDVWZ3Tk1n?=
 =?utf-8?B?VllReDJJblhnd3hJN3FYdVdBaTNoVWlERFFSSFdPdEVYUjJkazJ2UEoxUm9V?=
 =?utf-8?B?VnE1dlVyazR3akpiZytHNzVDeW1ubnN0NVcvK3BnRTFvRGNWRVJ1bE1PMmNz?=
 =?utf-8?B?T2tjQWxLTmN1M09oclNMZ0doZjFNa0lZSy82MnZqclEyNnFvVUNNWFNJRFpU?=
 =?utf-8?B?K1R2dGdtYnNtNW9BRjdTaWdKc2pONWJWSnBrVG5lQVM1aHUyT3YrSHlwMDk4?=
 =?utf-8?B?QlV6TmNRV2w3NTJiNm9KU2xEdW9CaUE2YXpTMFZwYnZMWG83M05iRmNCTHZH?=
 =?utf-8?Q?ubJZ9m9LgJkx5dK05FOMY7+DL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1e1c66-e98a-4484-21dc-08ddbbd5210b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6048.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 15:03:41.7543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r81z7FihKyiAllvaOyEtO+lgqnL0m/XTWE/8Ri688kKrq2OnFypmfV+m0Qg6iB3K+w2gHkbJ5EwSRKvZOXXbyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_080348_728710_7358596D 
X-CRM114-Status: GOOD (  17.10  )
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



On 7/5/2025 6:43 AM, Nicolin Chen wrote:
> The "id" is too genernal to get its meaning easily. Rename it explicitly to
> "virt_id" and update the kdocs for readability. No functional changes.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Vasant Hegde <vasant.hegde@amd.com>

-Vasant

> ---
>  drivers/iommu/iommufd/iommufd_private.h | 7 ++++++-
>  drivers/iommu/iommufd/driver.c          | 2 +-
>  drivers/iommu/iommufd/viommu.c          | 4 ++--
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 4f5e8cd99c96..320635a177b7 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -634,7 +634,12 @@ struct iommufd_vdevice {
>  	struct iommufd_object obj;
>  	struct iommufd_viommu *viommu;
>  	struct device *dev;
> -	u64 id; /* per-vIOMMU virtual ID */
> +
> +	/*
> +	 * Virtual device ID per vIOMMU, e.g. vSID of ARM SMMUv3, vDeviceID of
> +	 * AMD IOMMU, and vRID of Intel VT-d
> +	 */
> +	u64 virt_id;
>  };
>  
>  #ifdef CONFIG_IOMMUFD_TEST
> diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
> index 2fee399a148e..887719016804 100644
> --- a/drivers/iommu/iommufd/driver.c
> +++ b/drivers/iommu/iommufd/driver.c
> @@ -30,7 +30,7 @@ int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
>  	xa_lock(&viommu->vdevs);
>  	xa_for_each(&viommu->vdevs, index, vdev) {
>  		if (vdev->dev == dev) {
> -			*vdev_id = vdev->id;
> +			*vdev_id = vdev->virt_id;
>  			rc = 0;
>  			break;
>  		}
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index 25ac08fbb52a..bc8796e6684e 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -111,7 +111,7 @@ void iommufd_vdevice_destroy(struct iommufd_object *obj)
>  	struct iommufd_viommu *viommu = vdev->viommu;
>  
>  	/* xa_cmpxchg is okay to fail if alloc failed xa_cmpxchg previously */
> -	xa_cmpxchg(&viommu->vdevs, vdev->id, vdev, NULL, GFP_KERNEL);
> +	xa_cmpxchg(&viommu->vdevs, vdev->virt_id, vdev, NULL, GFP_KERNEL);
>  	refcount_dec(&viommu->obj.users);
>  	put_device(vdev->dev);
>  }
> @@ -150,7 +150,7 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  		goto out_put_idev;
>  	}
>  
> -	vdev->id = virt_id;
> +	vdev->virt_id = virt_id;
>  	vdev->dev = idev->dev;
>  	get_device(idev->dev);
>  	vdev->viommu = viommu;


