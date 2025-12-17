Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B3DD65559
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 12:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWMvJ3jejPxMq7cHIqzXCAuFXdsQfXSaZFtPT2fzwOQ=; b=P6301oueF/3DM8FYiMCq175OyA
	3bSahf7pVl5BhmR7RslBz3wHrKOOm6AhdbTnAjTS5As/8ceLC9z5teCggBzJjdFKHaAyAT6C7VYFa
	C5GOVaE5nH4vnJLKxwVVRSP2KilF74tAlXd8C56ueX58MGkYlrrnLaeP6hbUIVaCWAEVrH+s0zSfC
	yQjqsmAWJWj0x5qOzuq/jYD9gJfH0n+1d6hQbBQ1YW2nCdpWhPlIFSwVkljnFEhIVUmkP8l136TC6
	N9zb+WL2AP6rkDz6JRGQ6MY5l7DrwfnFgqFXJ+EI+dKIptFAmR8MiJJcWLIh46bKJUDcn3uK5UJgC
	YjM/c52w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqo5-00000006nDn-32zE;
	Wed, 17 Dec 2025 12:39:05 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqo2-00000006nDQ-1xxD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 12:39:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMU5/EsjUVr5YHt0wkpbDSy5Ltguf9+SZ+45FaFdcQKk4rDv6OBiJelewA+HsRUe8Vhq4+AIc45TjMrDN+6545M96APQiRSPOv/To77fUKXbRS0Lb5NBXe8MyzGAxZ098EoWsE/3WBoIplxwkWRzIX7ZuALWXC/YRvz1ltN6yksWXCTwWbsvy/u4p/TGRCSoGV0xU8A8pR58x/Qf2QBm6shNFfq/JHLnjN/8/nim6dIP1WArwX5xF99gAzGBRGrjtRUz6FkjORg7umAPhKkbcQk+Yxe8WOpZEWhawgqp9roRgfaB0vHPORJzqek6XaZHXK15jtv3CSiS4fm3u7CJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWMvJ3jejPxMq7cHIqzXCAuFXdsQfXSaZFtPT2fzwOQ=;
 b=zUixEjQfSKmaepdFcitjXJKc/A6Ao8mDR9W7ICLgSe1bMQRNPY4X0PaUlYWHzhwc5wLKMH4L8F1FgMTPqyWEKFEMYl8f1VX0LRySDqAzz0YNEhz1jFFLMlHvVwzCuIsM3tbwWidsUqPrjVYA526EeHM8GW/MPokk5UovzSwpwaV/WBMyn0xZ8qxxtaHR5F6WlB+xqvdGKq4OY8NWaJqWh7yOMWqTRoH7pxcDZJdWyOavNTaySnemz1RBMa4FginnHrJ50hdxuJwCkbSTB22ThuLWJwN3jH/MZtCX9axDLi1iRJeRHtSHaf7CAI1r4jrYMBFfIfPGFsHDTXDIfhw36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWMvJ3jejPxMq7cHIqzXCAuFXdsQfXSaZFtPT2fzwOQ=;
 b=gbVz1lTkwD2HsIbK7gLy+yMMrf/8bmIKNRDa3QEuMAyfWFrTMUn9jFSvYHfocwJkuB0oT/bMkVjJrs7Z8J1dzy5AhNUoPYOMziex4OsDJ2ARNKAoAXeqYkyiOS+uinF4ptF7qswuW8xy/FXdPe5uXMBXPVykeDseWwbHkTQr5uw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DS0PR12MB8416.namprd12.prod.outlook.com (2603:10b6:8:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 12:38:54 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 12:38:54 +0000
Message-ID: <aa064ecf-1714-4d40-8658-19952392cae8@amd.com>
Date: Wed, 17 Dec 2025 13:38:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: xilinx: Drop "label" property on
 dlg,slg7xl45106
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251216175914.2791200-1-robh@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20251216175914.2791200-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0152.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::45) To SN7PR12MB8101.namprd12.prod.outlook.com
 (2603:10b6:806:321::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DS0PR12MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc12fac-65b3-429f-f455-08de3d693d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG54cFRLaERqNzRNOWh2Y0lMbURJNnBnRHliVytJNjJrb29wOTJWMzNjNkJk?=
 =?utf-8?B?cVgxcWk2MzZPUU5qd1lDN0RZak5DbklDYkVOWDNzM0kyNGdyelBJMWhuc0xz?=
 =?utf-8?B?RktYZWRJaG5KVlBKU3RXR0wvM2xjVkpBcnExdVIvbGVNdmJlSFRPeXlUbVB4?=
 =?utf-8?B?RjRSd2JmUVgyZ1l3TTQrS0FJZzZnSUtOVHN4MUt6a3dGclg3Z2Yxd2lCNFlG?=
 =?utf-8?B?UFlnWi8xTjlRRzBKcjgrQkFCMGxsbjNxcDJXeG0wZCtMa3FPUlVpeWlXdzVZ?=
 =?utf-8?B?aEx6UnIvWUxHUVA1cTV4UFZLM04ydXdiVGg2V1gzTEdFOHJGYnJldFdqengr?=
 =?utf-8?B?TWdMV0QrYUMxYjlVOEpPU0VSVkJrbXQ2Y2gyMkVDVzlUaGg0Wis1WU5jVXdB?=
 =?utf-8?B?SHdmdnVMQXg5aWR6VXV4bzBTbHpiZWRvb09YREJwZnhDZ1VobXVGd2xRVUs1?=
 =?utf-8?B?RlNZaXowYWYxK0hjS1ZOQitxd0RTM2JFa0sxU25PcTZFbC9EOG9xOFNyNXpk?=
 =?utf-8?B?R1Y1VzBVYlNsemlFTUlYNWRLSm1rRnBZVy9rRThNKzVrTWlpOVBBRVIyTUxT?=
 =?utf-8?B?NGQvODNCeDNES0EvOC81QTV3cWp4cDdrRzVSVm84UjJvbFppNTJpUWtIMncx?=
 =?utf-8?B?YlJLczdJdlZvMjRJRTIrUTBQNHpSSTQ2Z0N1a3N6Tk5qUlE5bUh1OUpXcXRm?=
 =?utf-8?B?L3FnWFIxN3dyOWs5KzdvbHFyVmdkemRoMWlaZ0tjOVc1anpLYXVOWGROQjdX?=
 =?utf-8?B?bXVqaXV1bUpsVDlFSTJib3VMTjBMREk0SHZMQmNtdEtqbmV6cG4yT0FTV1Ru?=
 =?utf-8?B?eDhhSUFwVm16QW5mVW9HeXFzUWUxNEJ1eXc1dTdielZiU3JxbW15ZUhyazNI?=
 =?utf-8?B?WkZCR3FzZGVWWkRkSElFNlR6T0huMnZIWVhuSzA4dEcrWmtQdUNoTEV1TVd4?=
 =?utf-8?B?VFhGS0pkNEo3Y1dITmpHa1Z3dHluK29lNis5cUZpNDBXSDRGcHlDT1ZpNzMr?=
 =?utf-8?B?dE5NbmxhM1VOL3F3QXc5cUR4VTRQd28vTGN4MThVNVJYQ0kvcWNBTVZjMGc1?=
 =?utf-8?B?SEFjWkVOREZJV2YvbGpIWGpWNnN6T2lJYk90Zlg4UE5aKytGZEtwdmVrakRi?=
 =?utf-8?B?Zm9MR0gzcWpwdlhVRVBubjhBa1NmUjNxdDFVM1FDY3NQRTBQemJiakdsdjBO?=
 =?utf-8?B?cTVzcnVqNmVCYzB6UU90Q1l6TE1rbkF0c3l0dGphYkkyL2Fid3NpSGQ0QlVK?=
 =?utf-8?B?b2J4blQvV1YxLzk5bDI2QnpKTWxhMnpTeWk2MTVGL0IrMURocll2RHdQOVVh?=
 =?utf-8?B?dEcvbzQwZlRWam1WRWtzUGFSVDVZajZROUQ3N0EzNHpuVnFiM2h5UmV2aGZM?=
 =?utf-8?B?WTJjaEI5QUd0R2Q0Q0hoUnZFYlppdnhMcHlzTGdjODJNb2hwY0xEUjhsTkpD?=
 =?utf-8?B?RnlLQXE2V2tzalZ0Y3lianc2U3Bndjd3Z0Y0TVduMEdOSEdLMWQvQnFBS3ZI?=
 =?utf-8?B?T0d4OFNDMDBMT2pmK2dqSUtIQkhvM3N6U3dtWXAweXliTE9XNnJ0aTRhOFhy?=
 =?utf-8?B?N0g4KzRVVXdqNklzR2tRMkpjRlN2ZnhOTGVseUJTTzZ2c0FpMkUydzFYSldE?=
 =?utf-8?B?WnlrVkpoRDZJNlBPN2FLeFpMTndrZFQyMFIweVJBRGxTbldjajVlOFJrd1Jr?=
 =?utf-8?B?NzRNOU9hUjN3cUtOcHlMdlZNd1czTFBhMWF4SzV1MkVodzcxSHBjWjMwbnp6?=
 =?utf-8?B?azliaEtxNkFSdjBGQm1uN2U5bDdIajBSUUVVSG1KTHRzTUtqMjVTZ3NMZjRR?=
 =?utf-8?B?MVI4cE5sVjBGbmpGWWJhWUpzMVg4ZE15QWJoVWdQaXBaZGVzUWVqMFk5UzY4?=
 =?utf-8?B?YTNDSjJPYnNvOWRsWDJBTFdGb2xLRW1GdEMwazgyNURaYXFKUkJ4a2svYktR?=
 =?utf-8?Q?+eC5FMJI6IviHHahsBS4tg1Nb7QFGPkv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejlpV2FpczB1ZGNoUWQ0azdGQ3FIQ1liWTZ0YjVoejZpWXJ3anZaeFd3OG53?=
 =?utf-8?B?YnBwREFDWWZVQllmY2VCUGZPaEwzTTg5eFg3Z1RHTUFKRFhJdUJPdXg1TFRM?=
 =?utf-8?B?bVBHMnR2bDlhVEZLMTVoU3BnZ2djdmhTL3N2OWxWcVQ4SUsweHNCSXg5TitO?=
 =?utf-8?B?NWhSN1FNZlBJbnJRd0I5WkEzZm10SFZ4V0NObDNBOU9XdjRxN29DQUNTNTNv?=
 =?utf-8?B?bWZpSjlmK1dHTDBKZnZXNFdKd2FycUxqTEdoaHBWcjc4OGpPa1RacGpPWHlL?=
 =?utf-8?B?ZHo0Vm1FRHFELytjQk5SNjQ4em4rNmoxZGN5ZUtYN3pjODRvQnpidDdZbElO?=
 =?utf-8?B?ZmZyM1RJOGdEZEduM3JUZ0ZzUy9xQ2M5WkJtV05WSTlaM1lJKy8rYWIwN1dR?=
 =?utf-8?B?Nzh5UFJRWlVZc2RrQlI4b2xrNnhuSUtzclRIS0gwRHI2SmY1S1Z6SUQxbWpP?=
 =?utf-8?B?QWg0MDQ0cjIveHdMVDVxd0FnUEpxSmt3VlVUeWsyUzBiL3dRYnpxZitKNFlO?=
 =?utf-8?B?SGIrVUExRmVySUM2OGV5eUt2Q0tZamtyNFRaWDZLbEU5d0RzcjZPcnZwcUpO?=
 =?utf-8?B?Y0tlOERHR0hZZnY3Zm42MjJ3cnZwaTB5dFRmTE5veC9INVcxVFRmYUUzZmhZ?=
 =?utf-8?B?aE9DWmRHYzBQSzVLblZidDd5VVNTV1FzYWxMV0lOcjg1L0c5dTBqOTBxMHdN?=
 =?utf-8?B?a05iU1doV1VCUU5TSGQ4WmU0ZUdHV3EzYTZxNStrWTZJS0NzRE93Sld1SWFJ?=
 =?utf-8?B?TEx6aW8zeHBmaGp6VG9aY3dBUUFiMWR3V1hqQzU3RW8wWm12L3ZwdlJhN3k4?=
 =?utf-8?B?YW5VbWR0cjF6SG9RYmRvN3pvNXNRYU9GaWU0NHdpTHRVcHViQ3VYUlFmK1Zm?=
 =?utf-8?B?OXJKdzE3Y0gyTC8vaFJRVUh3V0k2dmVOcTNFQW8ycWcrV0Q2ZUFYdVI3ejB5?=
 =?utf-8?B?VmFtUHNxbWplR1dsK2FCaDJrS29LS3N1elQySGJUQU9qbzFGc2dQeUJWanI1?=
 =?utf-8?B?Q1FlUmtRTUtUNHBRaU9mWGtCNzdrZ21lby9jUThiMDJpVDBjL2NxVG8wYjZE?=
 =?utf-8?B?TXRzUjhXSjZMamRYQjFKYUFycjB5bkhjRm8xQ3F3T0pxOWI4bTZ6dDBNMkMy?=
 =?utf-8?B?R0R2clZRWEd1RDRqNUZBRFhYam03dzBjN05qL0JZbGp4Q2ZHQThjN3VvbzY1?=
 =?utf-8?B?Mm9XQmZIQnhkeWUreDlWYUZSL09oRlJ5Z1hDOXB5ODI4QkF3RDZ2eGp2LzhW?=
 =?utf-8?B?NDVzUFBYejkxTktBeGlyOUZOMm1KSTUxT0FOR0VUSGVpblg1bk1EM1FraGo3?=
 =?utf-8?B?NndrZ05hTnRjOHgxbXNDTGpaaktHYnp2eFkzbEcveENHT3Ywa282c2pMTXAy?=
 =?utf-8?B?RVo0YlVvVlFiUWYrVE5kYkYrRXEweHRGZ0FnOVBLbmJQa1VBUTZtQzlXV1B1?=
 =?utf-8?B?NTBCWXF3Ky9KRUxIZ3crN3Zua2FGOFA3YmdCYXdHZ3Z4RlhTOWVIMmpCK3gy?=
 =?utf-8?B?bUVpMUpDU0N0RFkxelU2bkN1UDFMZWxOUjJ2Nzk1bjlRbkdJWWVmakZlRDY5?=
 =?utf-8?B?aDFOZHhnUkw2d3I0dGFnOThFdlJVWjk4clRwV002TmhwN0VJMTdwdHpITlJk?=
 =?utf-8?B?amJUWDZJeDZzUXBKYTdaMWRSYlNwNHF5dVcvU3g4QUM1WXZCN29WejFkdnE3?=
 =?utf-8?B?RmZYWHB5VEp2azZQazBsZHhIV1VuU3BZbTVPSTRVc1NrK2F3L1VwNFJRSHVO?=
 =?utf-8?B?MFNnZFBvRmNoL0pubjFWbGdBL2x4YVJQa0ZDT1BEcjNxbTY1ejlTSm5RTEls?=
 =?utf-8?B?SzdRZ2lkNUJTVWZtWkMxbnV6UTl6QmplbXZtL3JsZzNjYkJScERCNE9EYXRt?=
 =?utf-8?B?T3piVzFhMXczaTQxTWZ1TWM0S2Y3eElMZlpxY3l1UnFmMStDWFZ6NTV6NTc1?=
 =?utf-8?B?U09Ub2hQSFduWVJoUmVEMmY2RytpbVdRUHNVUmhYTC9lMjlrVk0ycjB3WUhY?=
 =?utf-8?B?aXNZelhnenhTdTFPMnBJcEdIb2ticFhjSmt1U3hEVjluV3FRVHY5WFpRSjBh?=
 =?utf-8?B?Ryt4ZEwxN2J0S0VPMDZPdDhDdzhybnlOZWZqOVVTSXRFWlVEMTE5MEg1bDZP?=
 =?utf-8?Q?MlseYYUVi6+LFXh/FrzDcJRji?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc12fac-65b3-429f-f455-08de3d693d18
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 12:38:54.8751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ahhwmbe/uyJqmzjuKjFY4QzTt0g+j4MVQ0CAKsrhfIfdqtCXU93o0x2MEAfFfKAC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_043902_658695_FF91EBCA 
X-CRM114-Status: GOOD (  10.10  )
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



On 12/16/25 18:59, Rob Herring (Arm) wrote:
> The "label" property is not documented for the dlg,slg7xl45106. Nor is
> it common to use for GPIO controllers. So drop it.
> 

Correct it is not documented but it is at least used in Linux also by
drivers/gpio/gpio-mmio.c:810:	err = device_property_read_string(dev, "label", 
&label);

which is also not documented in DT binding.

I don't have a problem with it because I can't see it used anywhere.

But there are other devices where label is the part of binding. And IMHO this 
should be more generic property.

Thanks,
Michal



