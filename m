Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE4CD5B84C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cc0NU93S6jLFBaPYoZxKvRoMpHd71A0esMlkssjO4s=; b=3jVDAfEBLcj09LdqEcjPpEvE1v
	pegRw37s2ZGwvDTBw/MQJOAy5yU3IAZAeedOf5YZmCLBDQkOEb46i5f8OQwtIBEnnWe9qGmMFG8eE
	UZ3HCsRHMsnz4CHMFCjfg3yvkjf0yitF8wguz1J7AEqNJr1KJXvtZQv3PYUEt/+1AuOw+ZWRKzBmv
	QVedL/XpdTSEalTcg0KjcGh5LdEEgL7EkqJzL3A9+29s+xDVCpGoQCpHkDYwFDf0O2K4kEr8hC/UC
	6h2qVWspnT6yAH/KMMHSHgQVVzt9oyFH2vzr8BzdZ8CHQazyZZ/pnppymwM5CdbMjlVth0z4b4p1g
	j+z0K43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBA7-00000003xwC-0u6O;
	Mon, 15 Dec 2025 16:11:03 +0000
Received: from mail-westus3azon11010009.outbound.protection.outlook.com ([52.101.201.9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBA4-00000003xvj-0Kn8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 16:11:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nkgim0aHO3JxGXxbPCi+ntqVNyoonliDuKDHTXr/A+BITOHyywydB/cgzMbGnw/7cREy24NfT2nSBFeHbEYlKptQPtHjjlAdoxfmUASJauYk1vQbGsAtAzqtVEXerYQXUb7P8Ds8ZQ1b08sjSU+S7By1vdkp6G+9M+Eq09YwupGXxrInKERUpw96+sDpKv6hAQZ22RHks0PIlTMqQrt4sFdQMJct7GL96jkBHfYiBY+we4Lzzscqe887No205bVpZLijid9lYN5lNmDJw1Baju3A+1C+xfe4y1r14ouo6ok25W0LPDCH1B4p6FT9VAPWgHvlexGZdDRBSDtIt5Rg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cc0NU93S6jLFBaPYoZxKvRoMpHd71A0esMlkssjO4s=;
 b=m0w026jE5VfVQOjMXPs9Dzk2VflwbLnvjaES2z0kqbRG08KiDVom5uH8oLxJdrtQaEOuzmjXjHmK3Bpu/ArSHRba4wCUYwrewBWYeswb3HjjNX5M9hfMgCZ0aMQMMzyTzwyUP4w1qV+LJq7bsuLW/x8m4067mDrtzy3/hgc2E6j+BdfvcDwNPK2K5GtPRPOZhVna34tgtHw0VuPufF4szXIek7dIaaTXBzP8Y+omg9CAiGiy042bcIfFMMGzdB4WljFwmgK5Ot6Enn1//3SPyQU9W5Kx5nOpZGTIDGPAP9RdfXLCL470E06a66Qhs90k2yD4znd3NmMTHP3RiO1XDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cc0NU93S6jLFBaPYoZxKvRoMpHd71A0esMlkssjO4s=;
 b=ltya1uW5zhIrkYbg93Xdx23WsAgeboZ1QHhq4YPgLU7zSRXIjJKCshG8hrir35SWyYEwuuXiMWSkVabyVa7dt6/AzGuYmTnV+zBH64PxGCCQXvF4e4ayibN3qVoW9SueUDE+t4a5u9WAQwEzmxnagEhLL0h0p+gJHGAaRCVWTTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 16:10:53 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9412.005; Mon, 15 Dec 2025
 16:10:53 +0000
Message-ID: <7e82a871-0234-409a-8fd3-a548cbb789e8@amd.com>
Date: Mon, 15 Dec 2025 17:10:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "arm64: zynqmp: Add an OP-TEE node to the device
 tree"
To: Tomas Melin <tomas.melin@vaisala.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com>
 <88b72343-e86f-4b13-adcc-ba09683eb898@amd.com>
 <199062ba-9a0d-40ae-ac8c-0fbed5615cf8@vaisala.com>
 <3654c600-553f-429a-8bec-1add7f6eb5c6@vaisala.com>
 <db79cd4a-548d-46f1-b498-aac82ca53010@amd.com>
 <0435af95-a3bc-4ec7-b07b-bdec42f25c56@vaisala.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <0435af95-a3bc-4ec7-b07b-bdec42f25c56@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0237.eurprd07.prod.outlook.com
 (2603:10a6:802:58::40) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DM6PR12MB4156:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7fbf47-e9db-45ec-0f7c-08de3bf485ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2o0OG9lZEp3dFVQRlQxYVk1N0JaVWdicG1wR3QrVGFTZ0VJbEhmcVlScEFD?=
 =?utf-8?B?NDJRZHNtVk0vVXh1eVJtVmd5WWM1alJqMDVhM015aDVzY2tZdExad0FuVzFU?=
 =?utf-8?B?RnI2cHUzeWNTVzQ4cUNRemcrQUpzb3kxTUR5NUJQNWhvRGczQkFOR2JxWU9X?=
 =?utf-8?B?dVAxS1lLTnFkSE5iZzYwbGZZNDNiSHYyTjkzSlFNWHc2SktPanFScEFxelJv?=
 =?utf-8?B?VFgzWGU5YjFsNmNJMFdHc0tMWlBoYkh4M1RVVjBkUndrTDkyNTgxeUI5L1FO?=
 =?utf-8?B?YXNFQkpNUFl3bnJPZ1lzWnBxQUtOYlZLVmppTGFzUzVqWmg1cW8rSUJNTTll?=
 =?utf-8?B?RU1TZ1gvbEFIdStvSkJCQzBjSkZPaSszK2dxd3Fic0NmWXVWM1FSaituVnNy?=
 =?utf-8?B?MWR1emQ2Y1JuQ2ZDWjkzNnEwcEI5eDhYMUo5V2hEV29rYlVGSEJmOWZmbFJH?=
 =?utf-8?B?bXV5MmlxR3pmR2lyM1FRNVB1ck1CU2FSWUR3Rktvc2UwK3JtK0NTV090MW9S?=
 =?utf-8?B?OWpERWY4WTJHSk92ZjV1UEIzaUYzV2dVa0w3aXdmTVkzOGdhYnZDNmJqTjJr?=
 =?utf-8?B?OC9NczVSdkd6WnAwZHdZZDJlblcyZnRIbjhGalpVZWFUTFRUSEhxUUpBcVYr?=
 =?utf-8?B?aTdMdUFLbm1uY0NSREFUMlFKKzhUb0xUaFRmUlgrd2tUTjVxMlpCV2JNdkVS?=
 =?utf-8?B?Wm40V0w2dno0ZTVIRXRnaVhmWVd5ZW45ZFpWMkd6WUQwUkxlK044MGJtZjlY?=
 =?utf-8?B?NnhOV29KRlVrc0JjNlVmSGFTVlRvbStSVUNuV0NXTXQyMkZwQ3JMSHhQZ3ZT?=
 =?utf-8?B?ZVFWZU5SUk43Z1poaXlzTWJ2N2pzQythWUxzWEtMd1l0cjV5K0FtTmEzZTdU?=
 =?utf-8?B?OTJhY3VyM2c4cGVUOEVOL2RKaHQ5VXBkSXo2WjEwa2NEVmNIYW0rVERoakp1?=
 =?utf-8?B?dy9xK09INWkweUVibEx3dUxmTlIzL014WDdMeEJCRHd4c1ZMVmQyMVNhdXdj?=
 =?utf-8?B?c2lndDloYUFRYWlieWJ2UXdJSG9ndE9nbzRMeHB6eElzS2x1bDhiYzlJUjdW?=
 =?utf-8?B?RDZKUUVLNTc0V2hYRnhkSklFZHJWc3hFM1RzQ2daN0dNUS9zbWVSTWVIWEVI?=
 =?utf-8?B?ZWwveU5zNjBMaysxYzVYVWVzWEpRek50cjF6bzdxRGtaeUVPbkdIRW1XT2F6?=
 =?utf-8?B?aVh0bUFpYzhRUTVzUjVtZVE2RWppclFaV0dxQThyUHhpVy9QdXAxejNDdk82?=
 =?utf-8?B?RXBRcElGWnpLZVlzdWFNMk1BbWtyem9pMng5ZHlGTWJKbzNPaS81Z1Nyc25o?=
 =?utf-8?B?OVRFZGtxWnd3SUhXbmpnT012bjVQVmllZElZUzQvSGxBUDdKRGFSQjVwK0VK?=
 =?utf-8?B?dGxkc1pwckdlMDd5QzZDWTBvUndXMUM0TDNsNGJzT1RpUnl4YUJrTWFLOEQ0?=
 =?utf-8?B?ME9XTE9wV0ttempUTUtuZ05NL2xYQ09uRlBacnJZUXBneUpNeDV1NEZQRnNh?=
 =?utf-8?B?V0RiaWI5MXhGcS9MT1lxb1Ayd1NwaUltMndCUmZuT2lIVFNnaUNBYjNZUW9C?=
 =?utf-8?B?ejllb0VPYUxINitmTWVheVNjSzlQeTIyNnFtTGRuZmdMTC9GanE4TDl1SWhL?=
 =?utf-8?B?b0ttc2c0Q0ZrQ3VYdTlJcUdGWENSYXg1L0NhNHh5NFJFR1k3ZlYrUGJUY1VL?=
 =?utf-8?B?dThwbCt5dHZIak50cy8xMVF4TTdPWGF2VUpKbkcxVmF3Q3FsUU9DK0VaME16?=
 =?utf-8?B?TmNTNkJxQ0owWWRHeERkTnEvNUJ3WnIyZTdWNjdTZ3NmRGJZYXQ0dlVrWXNk?=
 =?utf-8?B?WEE2SHkrUmhDSlhqNW1GT3lnMVBMVkQyVmRiY2hBTVNZT0hQa203NGFHRDZy?=
 =?utf-8?B?VGhBSFhqSVJpcTVTTGg5R1p6TVdEb0NYMTZjcCtKMUNHZnV0S1RsWnJPOGUv?=
 =?utf-8?Q?zENW+elAx4928jG/QY7Vq5x/6KtsVY0j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckRzZmRUeHF1ckdKTDdodmhEZ3doM0F2R2l0Mlp2eERISjIrUVpuNFBSQmky?=
 =?utf-8?B?eDhacnhxbEkwUUlZdlc2WWU5SzRXb2srWDFWZTE0Mm1mdVVIRStqckRBRkRX?=
 =?utf-8?B?VEZpVUZjcy9LU3E2RUpITjdmSG5DbTd2Vlh2SitNWFZJUkNWa2srKzhsNy93?=
 =?utf-8?B?OEdUalprYUNqNkNXd3I0Rk96MjIwM1l5VlFjRG1nRFhiTk0raUgxV2RLYzFq?=
 =?utf-8?B?Z0txQ081bThBSktQeGdzM0xjNER5MFVXVXhnL29NYU16QTVXVmtNR2xsWUc5?=
 =?utf-8?B?b2JEbVpxMHhVclJ1RWd6RjFqZ2c4WGttMmMwaTBwcnN1K3lHR2dvb2JPZk9C?=
 =?utf-8?B?YlV3UGJUYW9xVFpjUDJ1UWwzVE9DTmlQSkhHZ0RFeTFPNElkVWkwQlhPRU1o?=
 =?utf-8?B?U281UExrNnJqaU5kRktaci9adXZyY2ozQVRnL3BKT1plUGVpaklDRWJBUENR?=
 =?utf-8?B?UWZyTU1lclozV29WcUZBdnFoSGRIcHgrZzhkZXhidG12Rk00R2ptSlI4S016?=
 =?utf-8?B?UFhEakQrS2JNdVVibzhETnE3dlhwbDlwTXAyWE1sM3RncG1aeGNwWXowaTl4?=
 =?utf-8?B?Um92VVBzc1JuaTJNbmZpMUNtTUM1dHlDWHkzM0Z3SkQwLzVJS0kvdDg0TitQ?=
 =?utf-8?B?NWtFZHZ0amE3c01GN0ROMjBDQXhnQkgzNWQxR0U4ZGhKQ0tTSzl1SWptcnVu?=
 =?utf-8?B?a2J0ZnQ3ck10TzEweG5naXdHcDB6akRsa0xWSG5wWC9IaGVQMml6TUhvQnVK?=
 =?utf-8?B?V0Y4ZFh2MWRRb1ExSDNpY3VYaG90S1JKQUNnTXIxOGpnZjQyTENFODMwZ1du?=
 =?utf-8?B?Nld6L1BqUUVPVVZMMVNZMmRDVXZpbS80Nkg0UU5tWFJwc291ZVgxa0lKQytq?=
 =?utf-8?B?cDQ1SUdGckJkd0hzeUJlYnhENlZUbkUzRnptbWdMSjM2OU9oVUtxeVUwUSt2?=
 =?utf-8?B?c1k4ZWpTYXQrT2NRblk3MWFnbzhLMC9sNFdxM0I2OTcreVFHb0RCYUJxRS9o?=
 =?utf-8?B?SHBLdVRzZnh2TS9yQWxSZUJmMFkrV1laZXg2T3o1aDdoZXNkWG9NaHpkaXov?=
 =?utf-8?B?dXJYYVNhMGlLUTVSVFNBdnU2REFmbU5DYlNBOTRMZEtneEFwdWdTNVJySlVX?=
 =?utf-8?B?bmdmUkdscTd0aVkzRkp0emVkQzFnZGcyWGtaQktBNHJOR2NzUytOeW9mZkI2?=
 =?utf-8?B?OGUvMjVtK2ExKyt1aWxDZmEzZmhiaVpINHM4QTR5aWo5d0pjSXlwN2dROVFq?=
 =?utf-8?B?ZWc4L3NGb21wc3Z6eVhjUktnalVQZWdFOFBjUXpPbHo0Z2FWY3BTZDVSMU85?=
 =?utf-8?B?bFdYSzgzU1Y2WDU1N0ZIZ3ZiYkdBUkxUNVFXTU5PeFBlUnFvMHVMS05RZUIx?=
 =?utf-8?B?UXArcDNvN0NJZFIvd1FxNmdVNzYydE53V2tDb1F5MVhrZDV2RmdVK3NiK3RF?=
 =?utf-8?B?SVMwTi9KbGlGRzhPcnBNdlhER1ZQS1BUL0pncXNySk1FVWdPdnZEVVRPaUo3?=
 =?utf-8?B?UmYySlQrS09hcmVFQXFlbStuWHJXV0h1dzBKVjQ3Q2JqcnNvakcvMVNNVHJ3?=
 =?utf-8?B?Wlp3Nkk5K1ZxTCtTbVdQbUNCMHYra3QwcFAyWVlVNmVIS01GK3JRRzZ5eHJi?=
 =?utf-8?B?T2NyYXpqb1JVbWoyOGpOcE40eUs3cnVVM3JreTIxZ09ONlFybWdOaU0xZDJu?=
 =?utf-8?B?N0wvVmlVNENSc0ZBaVJvWTF1YWRvTlIxdHFsZTc5OW5jTFZ0U00vdWpUZzhl?=
 =?utf-8?B?YlB5OVdlU3A3MkNXZ016b3JXUU5NMmdSWndtcExKbVJKRDR5YmN2MTFhTVBq?=
 =?utf-8?B?aDNIWXAzNlJZNVJ0WUZ2SFlubDBZZHA1aG8zTjhWd2VlWkg0U04yVnJ5VHlM?=
 =?utf-8?B?WmZRaW5wS3FlT0JkRGxMMWVPb3pPZ2o3Z29ISWFxcmN4RjdYcDJvbnYwQUZt?=
 =?utf-8?B?bFZOQTdVR05TQ3VVc2dpaDhLZW9BQmFsVERZWVByVXcyaVpXZnR0NlFjeGJm?=
 =?utf-8?B?cHdMSFRDRHlIVFpkZ1d1M2F4ZFdSSmpIajIrZHNhUm56R05xdXo4NzhFMzBj?=
 =?utf-8?B?b0R1ZnhvckNVekhic1g3Kzc3TVBvcktLR05HRmFwc3dRQ1lKWUxqWGtJTEhF?=
 =?utf-8?Q?1j/BanHV9Tx5dDlFQEcYMd6pV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7fbf47-e9db-45ec-0f7c-08de3bf485ac
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 16:10:53.6167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgSkhyXMMBJgu2Q83J4gM7Dowhcr5H51Gq8k6dlwLhHv/897ktYQ45HNkP276hfZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_081100_277457_74D181B3 
X-CRM114-Status: GOOD (  12.93  )
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



On 12/15/25 16:43, Tomas Melin wrote:
> Hi,
> 
> On 15/12/2025 17:21, Michal Simek wrote:
>> Hi,
>>
>> On 12/12/25 13:09, Tomas Melin wrote:
>>> Hi,
>>>
>>> Is there some more specific information I can provide regarding this patch?
>>
>> I am trying to identify U-Boot code (2026.01-rc4) which does what you have
>> described in the commit message but I can't find it out.
>> Can you please point me directly to file, line number where that described logic
>> is skipped?
> 
> Please check lib/optee/optee.c, in particular lines 128 ->
> Target dt being linux kernel devicetree where the reserved-memory nodes
> are automatically injected. When node is already there, it bails out early.

I don't really mind that's why applied.

Thanks,
Michal



