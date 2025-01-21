Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A56C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFEMV91giKwOQXKBNUjFkIG9c9LcPu7ESdphl8uZ0Jw=; b=qN51Al1QihfwXX5c/ITktBTlGe
	TyYE6TvX00zRynGVgWzoe/qLykmny9ynOQaludB5mWQQjYiIKLlN8MTobIP5XyfYHTorCAzR2Ht2T
	tTPWZJ6IdAZFGM+bqAfsKAy0aQVs+JCGc91hcpZlnM9Sr8jcpB0kCjp9wuJVZOdN2w+AgNqtLfG1l
	guWp93QISVhWrXlDNETCYJpdTcSJ3ZjlqhazInbFO/8xCA1T2ybrV5aLVpLWLmAtB64Y+Z4FjgyYz
	ieV5yBBQlLRT3YrxGuOdZ6bdutlL6u+Rlym6OzTOkLIMVhN9vPVG4LK2M4DgzrNMe2FRy2cptS5fi
	hKQbhCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta98Y-00000007Bjh-0xKt;
	Tue, 21 Jan 2025 07:57:26 +0000
Received: from mail-bn1nam02on2062a.outbound.protection.outlook.com ([2a01:111:f403:2407::62a] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta93L-00000007B1s-2UHR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 07:52:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TukncMmPt8K9kHEoPirX1Vbp+ArfPCqF9h2bBBm3H4FSZQvrmHhO5IbAyTy7xKZSGVHI5f8R5WvN4Ec81fntHy1tejcrSEveEPCSriThbIdBqEyF/Y7+qGJkU8+cHtYDpp2LMxnGdb117HoPjkMxcE6QbtN8hPnP6GymVz/uM6v90c3/jk3QEIr+bTzU8VVMkN89ipF820Y1z3GpJaM6FtqBTqHbb/6YxjVnuG6iW148+uyQj6t3egaD6anZ1kTV2RqtbBXRjmCyZPud80NG2N7ZJ9tiag4XhP3Icm57+D/rt+NDnOIDEWuhTs833vyfzEG/cVpNt0uNXTOLL3XhrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFEMV91giKwOQXKBNUjFkIG9c9LcPu7ESdphl8uZ0Jw=;
 b=JpCGVVTZ+abMFb8uwWo34dF9lUH2WawVHcFgY4r977YOEkaaZQWuW0/qcRTOXNv5kwYafqcxfc0XNEH6vaeVmc33WzGZq1hBkcLaLu53qbi1btseCjpoALqabhPB/pdlYQAMfe2W4e1+WjAF3ipZqGsQxtfFntnwVsgu6Nn9LRfeFaEXkHy84oQUuxRAA5ogHWWZgIF29EcY5Z8QszvMbCLUsduI64qT9PGtjQZDUXmqrgNIv9fchkHgyjNPyqvVwQLrluj2EGpoAEsk5chC8Q1AN/Jjwc6qV3VVNKKx9zivKBNodlfnG+PtRK8Ll/qOYMMCIxfvSRs/9IdG3K44bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFEMV91giKwOQXKBNUjFkIG9c9LcPu7ESdphl8uZ0Jw=;
 b=paoSRJPSnKeHXNylK3tiGv88Ns9OoFTLjqi5AQBn8uzXu4/mvUTt3eWMuEVLRUFMFDAb8MkGic8x47uTbM8dXg3aoeXd192aPpMWYu+VGzRKssf0jySTAzqAGbnFMRYBi0fo67ARpg5koJ1nkMcpngXcajLlAgvjcuj/XqoFBE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SJ0PR12MB6709.namprd12.prod.outlook.com (2603:10b6:a03:44a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 07:51:47 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 07:51:47 +0000
Message-ID: <d28a25ed-f3d7-41dd-b492-618c9c169fed@amd.com>
Date: Tue, 21 Jan 2025 08:51:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: soc: Add new board description for Versal
 NET
To: Rob Herring <robh@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com
References: <20250108113338.20289-1-shubhrajyoti.datta@amd.com>
 <20250110160056.GA2939302-robh@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20250110160056.GA2939302-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::8) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SJ0PR12MB6709:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d0417f8-6544-48ee-68f7-08dd39f074ed
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0ZWN2V6WUNaRkpZbStES0txSFVXdmxtemRUV2FmS1ZkTU8vYmZ2V3pVdzgy?=
 =?utf-8?B?cTR5OG5UVHpOVExzVDdCak5LNVVyK2JEZkc0RzcrY0RDU1ZQTFBQNUlHM0Zv?=
 =?utf-8?B?Y2VHbkNaSUdOaXlxdWZsM2ZwQ2w1dDFZekNRdG9nMWdNU3VERGNyMTIzY3dG?=
 =?utf-8?B?dllvUklzUWFOOTZ3b0RmYkJINWlFbW4vSTZiR3pmYklqcC9GWm1CeTRDS1hV?=
 =?utf-8?B?TVgxeHM0T3l4ckV0dEx1bUJvK1hLbWFEM0VpNVBoL09LZUM5amZQeS9iK1Fv?=
 =?utf-8?B?WnYwT2FiRHNzeEQwY1lna2twS0lVcWRQcFNiNWRETTJzZDdFcXdKNWVlSkp3?=
 =?utf-8?B?NENPcnpWVmdaVkt0WTZMWkk2R2xjNkg1QUdIb3U3SHAweHZWWnE0MTMvdVBK?=
 =?utf-8?B?R0x3YVRmZzRnLzNQZHNmV0cycHlkOW5ZNTF2SFZ2c3d0bnVvTVRzZThKOVpL?=
 =?utf-8?B?cENheHh6ODViZzFJT0w0d05kVlJjQXZpdDgwUHh3eDRqL2t6c0Z5V3RWUUxJ?=
 =?utf-8?B?K2lmKzJuNXNud3BxKzgydGdYeitmWk1ZUTZIUks3S1hFQk5tNmVRZmpoUjNN?=
 =?utf-8?B?ejNLbGpWWWROQll2MjNDQ0RET01lOW1abmd0dWZQaUJLZ3JUdmFTb2JWbU43?=
 =?utf-8?B?M09ZQzgwUjZFQVQrRkpCMlpHb0plU2xremNJRWFPYjNZT0dBYnV0VWxvKzU4?=
 =?utf-8?B?Ymt1SGY3ZCtYQzY4cCswekcyVFhnaC9BV0pLdTN4OGlKeWhCS3ZsWDgvamcw?=
 =?utf-8?B?VGtEcWs0QXhGL2xlYmFiQ3ptZllBYVlQeW40ejVDVmhpWHRhTGZ1U1FUMVZy?=
 =?utf-8?B?Smxtb2NJSnFONGthRVRxTFNlSVBrSFhjcGpNQW5MZHpzTHY4amFlK09QV1Ba?=
 =?utf-8?B?VHVkNFliWThtdW1kWCtBRHBDQVdGbFZRWHFkRTMxR3poYzN4OUxzTDdwSGZD?=
 =?utf-8?B?OUpORmtXc0t0TDVtVmRuNjFHam16bjMraTlkVThZK1FUV1dobkJwSnA5NFdt?=
 =?utf-8?B?Ykg1em1GUzhvcENYTW5JTndNZmRwUk1TN1pZdzlJaFc0cUFMOXZBaHZCcUhH?=
 =?utf-8?B?RktWd1NpRFF4VDgvRHlFQVdVMEJ2VnVMRGVobW5ncnZnd3JRYXFNSVBPTXd2?=
 =?utf-8?B?cnFvak5LVUxQbTNSQWd6V3J2Qy9vZ291ZzJFUExVd2Q1eHFVNDNmbTNuMEhY?=
 =?utf-8?B?WkIvbnFJbmluYk1vc2ZGRGw3eTFnM1huOEI4TUlQUlhuZFZGbXN2VnZrUU1G?=
 =?utf-8?B?eWFPb2RSRGdZU3ZjSUF2Ui95ZEJURi9MSE0zVmNSQXhZaWc3c2NaWVAydW45?=
 =?utf-8?B?N2tDQ0JKTG5yUXgzcXZFaGNQckZEOHJITEQvNTNOS3g1QWYvVmhEeXRSeDh4?=
 =?utf-8?B?bW1sdXV6ck1Ia2lWMTB6cUhOOHlFdGZrTlJpRFdRbVIrOTNObzV6NlhCeE5R?=
 =?utf-8?B?YjBOUTVCRkswMDFaeHFOTHlITUpYOEZKSzFRWkRxWnRqaURYQ2JnTHJoWndE?=
 =?utf-8?B?Q3huQ3BqUys1UVRiNFpXUGsxaEZVQzJIbStuNGxuL3dzMld4MDUxV3FVK0RJ?=
 =?utf-8?B?V1IxR1l5Z1crK212cGhySGxzMUIzUTZZbElhM3N5OCs0REhTM2dZUEw5UXZr?=
 =?utf-8?B?YUY0ZVY3L0ZqTVlDMUozcWlWVC9EU3dzcm55N0Jia2JlRDV5YUNhejBKQ051?=
 =?utf-8?B?WENJRTk0U2lVdDU2SkFiQmVtU1Zrc0FteWtVdXBWNXR0RG10R056VFMzajZN?=
 =?utf-8?B?MTlyV3NPK1BVcG0zWVhZZk45cnlhRkkxTkpGalpnbDZsNms3ekkyeHJjM0lj?=
 =?utf-8?B?TlJxS1V0YWc4RERMeW03d29MOHp1Umk1cWZPZFEvQWY4VHYvb0JiUmxDRG1U?=
 =?utf-8?Q?dgsu4HFtRgeQ6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1ZwcWN0S1pWa3had0lKb2ZmZi9aNjkrY2pnNkdOak5lWXVuVXpyTTJSY3pv?=
 =?utf-8?B?SGxvOURPY1FFa3dCbDcyMUZGbVBSNmVJc1A2WGtNckpJbnBrLzVzQTZlaFpu?=
 =?utf-8?B?M1V2Qkt6R1kzbkttMitjK0RWOGtJb0JwaUV4Y1FsT1FtVGxDazltclJWVWZG?=
 =?utf-8?B?MDZnR1NHZitId3VpTTRDT1J2ajVRVmJZaHhjRFdtTTgva1VTMEdzREdjbTVk?=
 =?utf-8?B?cjlYcUZRZGIzZWFpZllkVFpadWY0QXlMS1ZOcHRRRnJVaWJMWlhSNDhxazJj?=
 =?utf-8?B?bjBaZGhNclJBajV3NFRYYVN5OFVTZ1ZldnVVT3E4MnR2OWFpT24xeE1hQXcr?=
 =?utf-8?B?V1BtZE9icEUwYUsxKzdVeEpiY2F0N1Z1U056QXE2RHB6MG8raG4vUmxTdWd6?=
 =?utf-8?B?T1I0SHlnUEhrRzMwRTN5TDlyb2xSMUFldk1KR1E2ZTlmRXhwWGZHUERsNFVn?=
 =?utf-8?B?VzFzNjNyeEZRU0pnMyt1YVMyTVNnUTVSa1h4Vk92ZTlnUi9OVktDTUZHVlM1?=
 =?utf-8?B?MlBRbWQ2RCtkVUFzWlh6Rk52T0hVQmRTMXArU2J4azBJSFNGY0FGNFVaQXUx?=
 =?utf-8?B?WW1Zd2dsU0pVMm4reEp6czlwNWJPWjFSMFVRdmw3R3c5VmhPUlpjWVRMQXlB?=
 =?utf-8?B?aEY5ZXJpOFkvR3N3ZUdyejl3VFJ6ZmwvVWZWVXpsdzFUdzJiYXRhYTN1UDVv?=
 =?utf-8?B?SkpZUENhejdkak5MTEZ1bE1sT0liL2VtbGFsTWdrSnp2dWgwM3ZORlc4RXl1?=
 =?utf-8?B?ZUMvWnA3ajVHa0xiekFtdTlkR1U5dVd2QnltTmZrU2tQbEhodDhGRGpDVXVh?=
 =?utf-8?B?dGthenZKcXArMGV6K2piUnFhQ0lnbC9nU0g1WmJVVWZjZ2JGNUtHUjNuMmFS?=
 =?utf-8?B?QWtERmYwSGV5NkFhdEZzZlJMSXF2aDhOWG1PbGVOajAwVWMyWFQ1VkVnK2Vt?=
 =?utf-8?B?cDdrZTFnb1ViUWFoRmU0MEpjREVsY291TWl3WGJrUTFQS3A5V05TaDVkR2lT?=
 =?utf-8?B?clpZUzJpWUxKVUVmUXA5U1RGTEFZbGJ1U3hGV01HTTNIQXhaTmd3blpVYm1R?=
 =?utf-8?B?cmhhYjFIdUNtTTFVQlZLaUUrdlE1L0ZhL3U0ZEt2cTdDaHVzUkpYbXZ2cTRm?=
 =?utf-8?B?ZWxKWkRjQytzdnhDZGhKdG1ZR01MR2JoVk5tQkhreDlINjI0R1ZWeHBXYmdm?=
 =?utf-8?B?YmFLYVZXa0VEOUJYQ2hQcGhMVGtvL2N5VWdBUnp6L05pLzBOMFErMTJ0SDVq?=
 =?utf-8?B?bnkzWVhaeUpENWJ1YTVPVXFNOWg2bkNMQjM1alFGclBXdkxGQThlZXZoMkRk?=
 =?utf-8?B?d1ZaUjA4UnpiWVF5TEtRQTJBSmlrcDR0ci9TVlk2SnRlM0xzcWl3OHBsTHN3?=
 =?utf-8?B?aXlFWlI3d3gxUU9tUVZGc0RhZkpiM3JRWWRUVkF2bzFPQ3RMajJXekIyVmZa?=
 =?utf-8?B?WDZjaXpHWWpObHBXNm1oQy92aFVxYzgzbmIvUTJMYjNKcUcremZremNWZnFi?=
 =?utf-8?B?eE1LTHE0TnVObjNkdG1xbHJNR0tySWNhMFVZS2xuVVE4UVNkL1JJODdiQnlO?=
 =?utf-8?B?VTVBTUh2VDBDTDFnekJYTnpkelo4OFhVaWV2a29rR0N1YmdzTlkrZVRwR3lK?=
 =?utf-8?B?T25Hd2dSTFhKM2s0MU1MOUZkZW45K3dvbktXaStGSXVuV2djZGdJSVNJVUx4?=
 =?utf-8?B?dUE4VEQ4b2hZa09TWmd5MU9MQ2prYmtVOFhJNzdBVGkyYTJwanRNeEpyU0Ny?=
 =?utf-8?B?SzlZNW9qTHU4a2lKbkZ2UnRzVUpSR0JLLzBZdWxWSTlwcE40b1hlamdzZXI1?=
 =?utf-8?B?U3JidndwNHg2SG1QSm5RV0ZoUjQ1T2tpT2lEMkdaVlJTU2R2K09oRlVFbWlr?=
 =?utf-8?B?MlkvVjQ4TGhiMFRVMGNuREpjdkpFd0Zqcmo1SmRscEtYMGlscFdkMUhvdnFU?=
 =?utf-8?B?b3dCYnhQZTNZTlRXcHpIY2RnL2V1T2Rpd1V5QzZjUjhhTVpMdlZuTUZhejNF?=
 =?utf-8?B?VmdGRU1EUTBwMEduQlFjVzBuM3FxNTJvdlZPMHBXc3BDMzczZ1JzR0dmU1Yz?=
 =?utf-8?B?anlPV0ZUUExjbG45eER5elg1djRqWFpsUW4vOUo5bVZGVFV0ZW9oZEcrc3A1?=
 =?utf-8?Q?ig6FRKW+q2AlymevKixQW66Yt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0417f8-6544-48ee-68f7-08dd39f074ed
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 07:51:47.5573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zviuNhrB16g3+uY5C6Qg1ywSSZhswhIpyFoeibcIq9l0ARb/O7eQ1z5noCWzuXy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_235203_626640_34D8B2CD 
X-CRM114-Status: GOOD (  14.35  )
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



On 1/10/25 17:00, Rob Herring wrote:
> On Wed, Jan 08, 2025 at 05:03:38PM +0530, Shubhrajyoti Datta wrote:
>> The Versal NET (Networked Adaptive Compute Acceleration Platform) from
>> AMD/Xilinx is a next-generation adaptive platform designed for high
>> performance computing, networking, and AI acceleration. It is part of the
>> Versal ACAP (Adaptive Compute Acceleration Platform) family.
>>
>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>> ---
>>
>>   Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> index 131aba5ed9f4..e0fa36be7e35 100644
>> --- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>> @@ -10,7 +10,7 @@ maintainers:
>>     - Michal Simek <michal.simek@amd.com>
>>   
>>   description: |
>> -  Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC
>> +  Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC or Versal Adaptive SoCs
> 
> Perhaps make this more general instead of adding to it for each SoC.
> 
> Also, the '|' can be dropped while you are here.

It should be likely AMD/Xilinx SOCs

> 
>>   
>>   properties:
>>     $nodename:
>> @@ -187,6 +187,10 @@ properties:
>>             - const: qemu,mbv
>>             - const: amd,mbv
>>   
>> +      - description: Xilinx Versal NET
> 
> Above you say "Versal Adaptive", but not here?

Family is marked as Versal Adaptive SOCs which contains couple of products.
Versal, Versal NET or Versal Gen 2.

Thanks,
Michal


