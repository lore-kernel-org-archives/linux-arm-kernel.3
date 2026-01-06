Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8675FC47BEA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kv6PSeJ3KAoTyUQYDv/PVNVyAvS8/7hJ6Xuj1vVpsII=; b=NVDKuvG3xc1n4PMFd8tUWFgsAj
	veDcQHThc8fTB2oVGqrt5KKV1KBiBFrBJaubnhQYoS9ZZa2pUCeWMxWp42vr/+xQ1V+og1cHokMFI
	+jSH/il9pUzoO3Wa1djPcldHH5AFxt8wfCjpT03Ex2sxoxdUoqq6vAdbJy71OZ3bo1xyHwq0hfo9x
	/pVhw/M7L38KM8YMC28lSS+Uv9hUJBoDb2CXwL1vpjNLhWmQJM1WocfezCCeuXarWp9e4X++UghYb
	M2GawNVKQqWmJSAoDAlPj039PJz8v/zcB67e8nfJiqyrmlE9m0KCZpEbkR4Bxgu2rwjj8HN+mKutt
	U1N0GqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5JQ-0000000CszP-0fsa;
	Tue, 06 Jan 2026 11:33:20 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5JN-0000000Csz1-3NLA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:33:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyhdhzIzwiIMsSasWoevX1H0Z5eXAzwelky37zHiB/4XvvPqG19zIJ7dsLhzMuYmQdmrH0cLdq2rQGtErFl5Fh5MAnAxJSE6wNNlDAaPsUOThvPGsK121+y+Vz8Rjg2V+thozKufUZurIt9tDZpohT6mpeawhZLsefiCEqXI0gFUC63L4ZQpRhFA/sA+mklqqKZ/KkewiVGGUwiKJ3LAbVIi4D04ZKuqfxTBDg1KwuiSlSCEccfkXuT5izpzPJBXPCtDQtaT+sYP1n+TKsoF7xXDnbfIuyKBvqOoZ3h9sXvwCh+p9w09ZCilw1UyEseIUzZSNl3inUs/gk/ipQhbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv6PSeJ3KAoTyUQYDv/PVNVyAvS8/7hJ6Xuj1vVpsII=;
 b=vitsrX2vegTaD2QkGvq2sFqdROctlqQvynT53+QGclww4fsiKQ+Cali1ez+K/VtmccxXEr2hNnzH3lKazehizchmFQbGBnuWM7SdZpWmBwbkUZAhJP5Xs9MNKYoBC7HNbFGSr/ZRLh/LT8LPeBEVmx4gu2VQ4JAuxF06dhlSdjFJh0iS39owyJVrEIG275it/Q2VBnj8F7yMYDJamUUS9TM+EhpQSEbV7KBpukDqT9CFhn1d44R87otcvFc8p6Dq5MlawVlVxR5koQSjfi8tLSX27lVUDajL9QQx10hWi0I1R7GzFjS53bDh9N0Tl/P1O7bHSWSrlHpOKW+snr2KFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kv6PSeJ3KAoTyUQYDv/PVNVyAvS8/7hJ6Xuj1vVpsII=;
 b=DA4J3AD1ewIyxfsb7Pg2W5fP3TgnkSSzsb8p0IiEiwNuqQ5kxYycNLwzr7hRNySwOJCdd59wX6gM/DP7H1FdmGd4tcRxFj5AafCHfKMZgBNi0eTB9C/SQnX/Hqqa80PA4cykAvyM3J6haiGmnutgnL9x+if8er91FIEtHeJt1fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SA1PR12MB9002.namprd12.prod.outlook.com (2603:10b6:806:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:33:12 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 11:33:12 +0000
Message-ID: <58d8e953-5875-497c-9313-484b1b1849e9@amd.com>
Date: Tue, 6 Jan 2026 12:33:08 +0100
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
X-ClientProxiedBy: BYAPR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:a03:40::45) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SA1PR12MB9002:EE_
X-MS-Office365-Filtering-Correlation-Id: d9924639-7c50-46d3-2b76-08de4d175ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkUvYk91NnU2VXE4a0laZlJoOHBuRFhHVFpKQm1ia1FOS1Jtck1GYzNBcnpi?=
 =?utf-8?B?eVZmLzlsVEtKWXROeDlXNzlmSk5kVHluQjVWRVExVCswQ3JEZEsxdklhU2w0?=
 =?utf-8?B?TGNlTjVjZkxSZzZBTmpXbytqMmVFenNMSlJMRWx5ZWgzcG5GNE9GWVRBZE1n?=
 =?utf-8?B?eStaK2NSODBnWURWeXN4R0MxeHpPY05OcjR6TGxUR09hRkJoNlF4bldXeFRH?=
 =?utf-8?B?Qll1aWRMM3RXellKMHFpKzg4K3pYV3ozbGRQRnBJd1VieUpYZ1pJWHg5SzQr?=
 =?utf-8?B?Zm02em83eTFJeDZrd3FKVlErKzd0NE0wZXkwL3k2R2t1VmpyQW1YdjJwN29h?=
 =?utf-8?B?QW0yeTUzRk1UVFJZaUtjYVRUdDNQNEhsUTFEeElvQXdlbHpzNkQzMUtQZTdl?=
 =?utf-8?B?SHhtZlNKb3JTWkJRd1hqbGR1bTZ6cnl5dlIxd1N3emVncXU3a0RCdXJDWjFF?=
 =?utf-8?B?NXRjOUxvSHcyN2R3aW9rQnRXUVdZVGFoNjBWNXNUZmpDSlJxNDdtODFZZ29R?=
 =?utf-8?B?Ym1RbVRSdGVKN1lQMTRBa0h2NXF2UGUwbnI3dHpLSUdZWEgvT0NNbDlmdjFn?=
 =?utf-8?B?NEFTdjRmWStpVGZkdWtXQm5XanZqWXNwblI1ODM2cVZNTERpeXhsK0tEYkNP?=
 =?utf-8?B?eFhzUlZZNnV2czNxdlZkbUJrR3NiL0wybVYzKytPeWh3cXFVTitDNm1uSEFN?=
 =?utf-8?B?UlZXQjEwSzRtTTJXL3J6Y0NPVXpJR3d6dVUxVXVOL1ZtSWlNQ1k1QWFySzVC?=
 =?utf-8?B?NEZQc2lzRmpOVjFBTEVnUlpxUmx0eDVwR0JOTi80WnFvZkYyWWZvelp5bm1Q?=
 =?utf-8?B?a1NNNndXRXlySXZuQ0doOHhHT2w2QWVKMU9MUEl0WW9RK21PemN6Z0dRRXNF?=
 =?utf-8?B?MU90U0xnT3hLR2k5WDRVQlRmTW9IUFZIZ1dNY0RIc0hVTnBvNStuWm5TRFlH?=
 =?utf-8?B?RitIbkJZd2paK2ZTWElJSGZxQWZQWm1BOTFpSHM2T1kreFJURlU5ZDF4K0Uw?=
 =?utf-8?B?b01QK0ZWU2RaYXBFZm5ua1UrNEVPUkNwemVaT3NrOVdKNWllQVpUY1Vib3N3?=
 =?utf-8?B?SlgyZ2tSc0kxazhpNWxQQkNTbW04dHRBU2tqQ2JPNVgzMW40c0NVOUpCLzYv?=
 =?utf-8?B?YW9QaW0rUkRjZmZUdWFWRlhua0JKN2pHbjZNQW13amZodkN2a0V0UXJ4dVp5?=
 =?utf-8?B?aWs3emhKemJhTUFTZW56dnkzK3BqdjNjdTBzSVRPT1B2OEZ2eDNGV2FkVW9i?=
 =?utf-8?B?VjFnTUdHY2RsRVZiWjlDN3hnc3B3d2RESW5tQ0JxbHd2LzB6eDdGa3lFM3k2?=
 =?utf-8?B?WHEwMU8zR1hvWG9qRnl2bzFqY2gwZXN6MHlrNTUyQmthSGRVeUxRK0xRK3Q3?=
 =?utf-8?B?UXdvbkNVN21GN3N6ek9kaGJpSURXd1pZWDdVRHpRZEJXNVdLQldoYzhyU2Y4?=
 =?utf-8?B?MDNNZEp5SlVlOUZkNDYxVzU4MjdKTlg2UG9sZExiRGl6dUFjT1ZHUDlpbzcz?=
 =?utf-8?B?ZWh3V0t3UjdaNFNxQWNpYWd3VzI4cWxrMFJOLzUvMkFtR2oyTmphSjVySEtn?=
 =?utf-8?B?QlR2OWhHVUV5TnB3Q2VMeG1YUE5QQThzOXdsUDNlWGFwSUJpK0Fkd0paMHlq?=
 =?utf-8?B?OVFXWnk0VDVuS1dlQzBMSTd6MENkclNNYkdBSVQ2S1BEbDVQL1N5Mk0wS2Iv?=
 =?utf-8?B?RkxOemZDMTVzaVFoTkcvUEtoZ0p5c3hYam5saUJSdnNmdTVRbnFNVExqbkhB?=
 =?utf-8?B?YnBaZ0gwR2ZrWXhpeStlQ1gvb05VY1JPK0w0YmRUNFRCR3dtTDFYYjh4aGVX?=
 =?utf-8?B?RWxQK0FwWEV0QWJhRW8vY2hDNmg4RnZTTEgvYk1sWDJLaEh3WVJpMGtZekpS?=
 =?utf-8?B?cThGUGtjcUl2bHpCekh3bUdVZDNpODJ6MFZyWWNOUjVMWldPMHNZVWoxWHlu?=
 =?utf-8?Q?6VabZybBXJ3xn6vPzqQQzgZNJO3F8/C4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG1oaWNRZHJLTzcwSFUvcFNkMTJBM3kyM29BTllEWDVEQUZWNVBkMjdTMXA4?=
 =?utf-8?B?U1pMZStib2YrN25xMFlUSlFmOWNHRGVOeUM2UmU2YUt3Z1F3NTBXKzRiMm5J?=
 =?utf-8?B?ekUyVCttY3cxUXFPaVJnREtvRm4zQkVMMkRjVFFwbER2UW1Wa0JvTWYwQWs2?=
 =?utf-8?B?endOR2NOYjNXdmNPYWtjZzlxZk9HQmVDTWRGT0JSb1ZGUE9ZQ3pMZUpWT0lW?=
 =?utf-8?B?RXpjUDQ1d0tLVTFld1NtSWZELzJHSEVDMlpDTUpPb2JCSEplclhJamlnMWZ6?=
 =?utf-8?B?ZUxaMnZBWE9HNm15WWZNNEw1eHE3K1lYZmpXTUlHdFYveEFZMEF1cklybEUw?=
 =?utf-8?B?STUvQm45U2hRRnovZ0ZQRzIwd3BzVHg2UUJPWUpOdWJxT3lGVzVjK3NtWkdO?=
 =?utf-8?B?OHFpSG1abjF0K3pNZEpVMGFQNnZwNFpzbUdsL3c2dThzNTFMOFpFTzVyRlpp?=
 =?utf-8?B?d2ZpMkUvNEtCTjZuNkN5clZaVnAzbXJxN3ZxaEE0OC92ZGxNMklRUGt4YUhT?=
 =?utf-8?B?dmFReGFDNi9JV1lEOUtwUHJkL0RlbDRwTFVpdEM3K2Q4Z0hKK3NOU1YvdGo5?=
 =?utf-8?B?Wnk1YzBvdGl4ZTBkNk93TzBQVXUveU9rVG53Qnp0NHppb1I3V1ZVTXpZRGJT?=
 =?utf-8?B?UVRsM0RYQ01GdWxSck5kT292QlFUTUNIUm5HMnNNaGVyL2o4UE5NVks1VUdH?=
 =?utf-8?B?V25tWWk4Tk51b1MvTnRXS1ZFdWlmQTFMNWQrV0p0YmRDSnlKWTRsUlBQZy9r?=
 =?utf-8?B?aHFMV2dDbDdYSUhKRkVnQkNMd0szRGYvZGgrMkJNejdGWm5US1ErUjRDRWVN?=
 =?utf-8?B?bXBxZFFyYnpOZHRXbHNCYmJiMmRiUjVBMXFiYUJJYmJhTG5kZDlvdUQ4VmVL?=
 =?utf-8?B?U3ozaVg1OFlDd0h2Szl1VmRoazNlTGdRMEVxMzY2T2pBMFZOOEgwdnYrR0lE?=
 =?utf-8?B?RkpPd2R3V1dtVEduNk5pbnVzcGtyRHZWQ3djbnhNOHcwSjZzMTlEY0JzTlQ4?=
 =?utf-8?B?bzZZQmtCTzRNb09DajdrYldBeVpuTXhEMXJueVo1UWhCVy94MFJpaEFUU0Zt?=
 =?utf-8?B?VGVzcEsybitMeE5RdUJrcDErOURMaVA2a0s3b0FiRElONTE1Ri82Q0pXNGhn?=
 =?utf-8?B?M1FSNm9SeDZLSmFQTk5ObTFEc2xTQWg5ZjdVWUxOSlRMTkJlZEFmV085QmxM?=
 =?utf-8?B?WmlSQjgrWWlheEtwZC9Td1ZUZnhkcjhncW5YeDVRWmhHR2ZoWnpOLzkvRkRS?=
 =?utf-8?B?T1cyWVNPdTZYMFhtbDByRmx4eCtzb0lQdVA0SzYzVTl1bmF4b05rNThUeHV4?=
 =?utf-8?B?TXZWeGhLZytvUGRUazkrMVJTNTUvNGdnNnRhajJBSTk1TWJQLzJTUUxwQmlk?=
 =?utf-8?B?QWNxSklraCtnT2ZYMHliV0V3NVRIYy8xY05ZYmY5YzRtWjhqSFlRTXQrVURF?=
 =?utf-8?B?eDB2TXpSY0t4dllMYVYyWEk5VkVpUmpTMUpmRmRVTzIyMnh2bDZXKzdGa1Iv?=
 =?utf-8?B?NFhlajZKS29iZjZocnZtNERocDFFbnlSc1pkcHh5SkxpemFBaUl3MVRIV2lZ?=
 =?utf-8?B?QlhLZzZ0MzhidkZhRFFrc0p0OWtWeWZDMEZTZzllbnVGNzZBd1pFb0ovcVZK?=
 =?utf-8?B?Yi9QbU90cUgycS90eDcveUNnYVZQZkVGU1ZBQXRRK0w5dzdFZi8rdE9GWjdL?=
 =?utf-8?B?UDVVQjVVRXBaVFQ1Mk1kSEpnWlBrbEhJMU9iUWtRTEtuUDR2bmthN3RxcFgy?=
 =?utf-8?B?QlVFR0doQ2tlTTlpcEtONUhRWko0bG12enBVNENXMFJYZDgrVWNpL0hTWmNm?=
 =?utf-8?B?UjBBV1JadkFCbkJtcVBoZHJnT0F6T0ZhOEd5anZab29UMm1ETVV5NGt2d0tw?=
 =?utf-8?B?ZTNjbFpZc0xEY3AwVys0aHZ5N05Fb1RlZTl6bWRUVXhHTmtEb05QVUdkY3Bp?=
 =?utf-8?B?SmFmaE83RjJXSEM4akNjcG5LdzVMN0IvTXp1RWFKSWd3d2lwWHZ2bEIxTnpR?=
 =?utf-8?B?UHZMUmM2aHlHWDhNUE1wcDFSV0k1Uk5CbjRJL0d4RURINVdZcGpxTFNyT3k4?=
 =?utf-8?B?ZHJuWnRycUZzdVMwcThHa1d0SWI3d3V3TEVGMmtnd21FS2RMNGtkeGRnb1NS?=
 =?utf-8?B?OStsZmFPWU9tNU5GTTZuYUZEOVh4NVBoNlgzT2hmVVh6UFBKenowYmJ2YjZx?=
 =?utf-8?B?RHhQUHM4VG9lTXJFWk1zdUpSWFFjakpDZk5lb3RFTHk4cElaeVNpS1pZTkhH?=
 =?utf-8?B?eFZ5bU1xWlBjczNYUE0yNnJ5Q1NZNDRiR3U3U2VtTFgrMlhGZVdpNytsVHVD?=
 =?utf-8?B?bjlvb3l0cWNzenFyWGl1V2dZT0I1ZW9VMy82VkpuSkFtRHg1ekNGUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9924639-7c50-46d3-2b76-08de4d175ffb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:33:12.3902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAxc+010zjosGpAmBEvL8np3im0MyrGOEh82y+o6bw9DdtJNU43RRDxtmj5WMVCz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_033317_904216_DC20A108 
X-CRM114-Status: GOOD (  14.54  )
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
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 1 -
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 1 -
>   3 files changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
> index 02be5e1e8686..d0230da47068 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
> @@ -75,7 +75,6 @@ u3: ina260@40 { /* u3 */
>   	slg7xl45106: gpio@11 { /* u13 - reset logic */
>   		compatible = "dlg,slg7xl45106";
>   		reg = <0x11>;
> -		label = "resetchip";
>   		gpio-controller;
>   		#gpio-cells = <2>;
>   		gpio-line-names = "USB0_PHY_RESET_B", "",
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
> index b92dcb86e87e..5d1f031bbd89 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
> @@ -103,7 +103,6 @@ u14: ina260@40 { /* u14 */
>   	slg7xl45106: gpio@11 { /* u19 - reset logic */
>   		compatible = "dlg,slg7xl45106";
>   		reg = <0x11>;
> -		label = "resetchip";
>   		gpio-controller;
>   		#gpio-cells = <2>;
>   		gpio-line-names = "USB0_PHY_RESET_B", "USB1_PHY_RESET_B",
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
> index 99ad220d13d6..1d5c95bd6073 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
> @@ -104,7 +104,6 @@ u14: ina260@40 { /* u14 */
>   	slg7xl45106: gpio@11 { /* u19 - reset logic */
>   		compatible = "dlg,slg7xl45106";
>   		reg = <0x11>;
> -		label = "resetchip";
>   		gpio-controller;
>   		#gpio-cells = <2>;
>   		gpio-line-names = "USB0_PHY_RESET_B", "USB1_PHY_RESET_B",

Applied.
M

