Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD0BD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 08:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQz3nWtZ8unXl+bjvPJEbFo37wSwk8g210nCkLxYdpE=; b=h5GsihXpOXVfIh3EybzPLtbh4m
	OGE80QJwMtg6/thmiYQoeFljoovgyNedTLAHoCFrJBTrA7OLrVKlkI275Xa5Zgo1wUguC2riQNk3f
	PklWnyl+2OkHjuljPZCPjucOojwdIiZaQx9fLlAd/MhZTjU1BcHmxmQr8jvKO1kpnzssYBl8tRdBK
	Gnn3EcEc28QBVGKFAo4cRLJCFNQJlO/HDBZe107CHBUkWY1dDVNqUFnmvyX3R75JjZe9dhWQH8OLA
	YfXUAY9w9774M6tvts4QS6KyknlDBOrRazV19CczVUtnKMmSKMtyyj+jnv6NdmZa/EaAT9lrVjjsG
	gceySznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3Zq-00000003FHX-35j7;
	Mon, 15 Dec 2025 08:05:06 +0000
Received: from mail-southcentralusazon11013036.outbound.protection.outlook.com ([40.93.196.36] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3Zo-00000003FHA-0GOC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 08:05:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aChd63iG7g8ioTwpNhhNWxNFGwfGOZQbiD8VT2/HiDBEAY0mv87YSGo0UhbTF+UgytNCfxhB8/o13syKFKwq6mT8m2Bgk6jSm/RO0dMiNalryrEROKBmVMU8uvAFgdajarihGBjVgzyB67m20lzQLuNOtVdi6lJparS7V+SZJpmHRLA57Epbcpaq2ZOa0gwl3zUBNsbiDKhLcRicirXr74NfP/mwZhVvq6/ic/i6aNpum0KrBw9SOA84DcZEU0R2ML6EHGpeSEi3yLBxHPHyV7dv70KViOzRjPY/JU4UEZPpBXCgDIxeQFhmPBBi0W0XIif+ONXc8TSJ43OZ+oGL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQz3nWtZ8unXl+bjvPJEbFo37wSwk8g210nCkLxYdpE=;
 b=kIMam4ym+uNYpxOVkxyG5slnXbFYSit/JK8hjcRXlncLbDyf+6W922S/74C0RKRRzWznnM26lNKRT8cjFqDy2fg01tkyrUVuFd4LRLqTAo/I38LJ1wzBJSaazrIsjItlrrg74I7grsghkywvawrF+Ywqarp84UPYhna+IvepTw2Sbn0ciF26qs4Jzir0j3Wj6H8qOgE2hZ4W3AGGk70vs7MhF9gioS8dv11SXp2qrs13VdJURnwm98+r5yNeFcNggrlKLYlvYLrd4Kck5hPjlaJ5HRUtrAMtDyvr9VylPtouXaeyJhqc7lOrz2xk0Key+bpyB1OWuglmcwmc/Z589w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQz3nWtZ8unXl+bjvPJEbFo37wSwk8g210nCkLxYdpE=;
 b=M9pJyXXFX0yrPYmmmv4/f+6tC+CWA+L3Ks0W2KHDhFIjB8+U4iVIcopQlpH95BdaRsMz5Ue9DOcCsIUHNx4jCWzx9zD8z50UvQnjPN1F+izbuAYEwJV98IctUKa8yVqHSa1PgWX7TvJpQWqyn5ndxF1o/b5u1VobfLTEeGvMJlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by MW4PR12MB6924.namprd12.prod.outlook.com (2603:10b6:303:207::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 08:04:59 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9412.005; Mon, 15 Dec 2025
 08:04:59 +0000
Message-ID: <efb1de24-059d-4bd0-8578-d3f47ef8e432@amd.com>
Date: Mon, 15 Dec 2025 09:04:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xilinx_hwicap: fifo_icap.c: fix all kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org
References: <20251214191750.2173225-1-rdunlap@infradead.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20251214191750.2173225-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|MW4PR12MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d38d23-9c40-4aad-60a7-08de3bb0a482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHE5eEdOSHFaSUxVbnNvL0twY29NRzJOenFWWEFxQ1pZYzRIcE9tcXFsNTdz?=
 =?utf-8?B?RmpJcVdPOWxFZUQyaWZPSHRFOTU3SDhqQldPYWxlWXU4QWxxUUdOcW5tdHU2?=
 =?utf-8?B?VkZNQlBKdGk2NUVXRUgwTFVkWTBnRTNPRkxaOThhcUdsV2szWThKei80d2JH?=
 =?utf-8?B?OWo3aFBPaWp1Nlo2RENiTjNOK2RrZThIODUwdkxEcE82UkxCUmlQNW1UQXhn?=
 =?utf-8?B?QmVPM3hXMEdiNTlTR0FWZktGOXdzWVI5UXJYR3pFWE5nUFZCM1hjL0ZYdXZL?=
 =?utf-8?B?aHRNc1ovWDdxU0dneUVlUVp2V0F0MHd1STlRVExyakdTQ2dJdXlZbkNqNXVH?=
 =?utf-8?B?M0pkaVZESVIxV1p1aHdDRTd0SkZBeGNSNFdJdnhyOWw3cUpabU9nZU1XZUto?=
 =?utf-8?B?NVIwRWJ4UXc3bENRdmRlNitadE9oVTJINTFsb0FaV1gwYzFqNlE4alhoaUV3?=
 =?utf-8?B?ZWpRbjBPWm5iV0tHTjhRcnpOTStNYU9tR2RnUVBaeU9qcW9XZkY3WlNaelVn?=
 =?utf-8?B?Ykt5cnkrSEpNbjdSSXVsdnVuUXdsTmdPc3Vrcis2OGFldTkwakU1RVF1QldR?=
 =?utf-8?B?TDVaalAveTBvYm92cE1vdjZpcUMrbThPaEo4d2lxbVNOaVNqcjZtbHlWZGs3?=
 =?utf-8?B?dTBPZjYxOGtTWEloNG9QZ1V2c2xoVEgyTW1TdkVVZ1VNSmtPeGJmZkFvZkIz?=
 =?utf-8?B?NDNGenNVYnErL3NYeUVSUFhYK2RzY0JNVGRSTi9Xd2dCMmF2UTFlOER5YUg5?=
 =?utf-8?B?cWMvUVo2U2FIZEpOQ1Awa3pXNnE5Q2FEeTJjWDRJWmd6b3VhR2xteXZVNlpN?=
 =?utf-8?B?ekh4Y3FoZmlSR0tlOTI1TEJaWDYwTUN4Mm9Qc2NsMmRXRmlFQ3hzSlBRZVZL?=
 =?utf-8?B?QjI2MnN6eWFBR1VXd0Raa2dMWVp2WXo3K0VEYlVqeWdUN1hIVmlnTjBLRDRW?=
 =?utf-8?B?eUVWV0JlVFUxK2x1TFpvYjBWc3V6ekF1S1ZkOW5COXdNV3lnR0xmU2JMZC9i?=
 =?utf-8?B?WWc2em9ieG5hQm1UcUplZDFJRjhxeHlXRitNa3hOUXZ1RGtjNyttMkNiK1Ez?=
 =?utf-8?B?TzQ5QlhWM1ozWVl4bEFSNXdROXdTVGxjeS95RGVrck5URktZOUZSSmRJemMr?=
 =?utf-8?B?MUNvditIcnlENEFNc2x5Qm5FejRkNEEwTHdzUTZQYWxES3hUR3ppOGQ4M1Vs?=
 =?utf-8?B?Vng2TFdRS2xQcGlXYlZnbFhUdTgyaXQ5SHhGSHpLVFhnYTNOUDBxM2tCQmxR?=
 =?utf-8?B?R3J2ZnZiMDN5MzlsdWFuTzR1V2NFWmRwRkdpcEtEdERRUGpadXFINHhrRUlQ?=
 =?utf-8?B?WXBqUGhybFB6b09SSFhHKzcwVmJUaHlZeHFER2wwRlBjSm1naS9TNGJrYXQ4?=
 =?utf-8?B?YmNmaHduUXBXdmVCdk9WMlZkaEVyVDdvZFpnZFRvbmhoMUpRM3paQWsrM2I4?=
 =?utf-8?B?UEg4dmorRGJ1eUpiNEVmVUhwVk9CbmJud05RVmpGNVVtK2FPMWpoKzJoRkE5?=
 =?utf-8?B?MnovZk0wMUNNZkRLaHhuQTRXMXFLak9JWVR4YmFCLzdVVDVpTUV2RVlRNjgx?=
 =?utf-8?B?YWpDNFJITzNZa2JmTC8vVjV3enZTcFZBWG1uY08xK0FjRTVIVGQzbmc3SHM2?=
 =?utf-8?B?bUVBcEJ6b21Kb3FBYXNPTk8xcy9hR1BQek1KQ1pEKzhYSWI4alNIbTlMU3Y0?=
 =?utf-8?B?YzlHNG9FOVJIS1pma1lqVVRiTlo1My80K2ZDOVpoS1BpK3U0eVZFSHY3bjdh?=
 =?utf-8?B?bG5IcWdHZWM1OWNTUDZYQzlMMWtYVk1nalQydHFFODhkYnhqbGxIaTE4ZTZH?=
 =?utf-8?B?Z0dEUlVZWGo3cTFNdDJpTUp0VTlQd3BtNHVFZFVMbTNaQ0hqZnlzWDdrT0dj?=
 =?utf-8?B?anU1MXU1ZC94Sk1Kc0JoanMxcEJXTlJnQ2lqZFVhbDdEN01KN05wb0ZibktI?=
 =?utf-8?B?b2J0cTRyTDVuaUtRMXFVY2NzOU5kdDZlK3F1S2t6MDE3ejluNEp6d3hNaFVF?=
 =?utf-8?B?ZWN4UHV6b0JnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTQvU1d1cEJVUjBwZndObS83SkVIK0lMU2V6aHBmQ3ZIdkhHRy9NVTd3UGUz?=
 =?utf-8?B?dHV2NGxDc3dSNDNMeEo0VFlPWWRoSkVEK0xFQVpXdWRBRk9vSWNtbnQ3VWJv?=
 =?utf-8?B?L20yM25IQVlWczg5TWtZQUxSSERzUHluNkNWaWJwdVVMMmpLbXVwdnRNNERJ?=
 =?utf-8?B?WXAxRHk2b0tQQSt3QTZ0QThBbTRERHUyblFVVzBsUk1jWFBBYW43Wktjalhu?=
 =?utf-8?B?c2s0UjZONWRrZ0xxM21NWFlrNWlTSFJJNTZLSml1emF4NGRZaUMyM2ljUmFP?=
 =?utf-8?B?M3Y1Z0wwL0lEcjlFd2tLaVJSck1oajNsTktQU0VnR0tyUTFFZVcvZkNvbFk3?=
 =?utf-8?B?TElzT2NhVHBBTjZYRHNDUEsrVVAzZ3h1dE1lT3NHS1dFR0QzWXdCSnhNbXNs?=
 =?utf-8?B?YTAxQi9oODRmV3ZUNXovYVhnWS9lRWZMdy9DVzFmOFJaWlMxNzYvNXhHZjJh?=
 =?utf-8?B?UXFHU2pTV2dYQVFGKzVSd0JMQ05Fb1gxR0hWaTMrUFRkek5FVzZad0Q5a1Z0?=
 =?utf-8?B?bFdsSHJOVXZuSlMwN2drcVBoMlV1R2dhdVJTbUdSTkNjVVRiR2FWNTlFSDgr?=
 =?utf-8?B?ZFFJUEZWUHNJc0ZkNHU5cWR5Q0MxV21jR280UDk1STBjWHNRaFhOaFZBeXNR?=
 =?utf-8?B?aXRGaHVYVDNCc3JuaEJtNzdkUFUyN0c4VlFKVTlNMG5pbzJRZ0lGRGtncXZE?=
 =?utf-8?B?UUVydllNcCtveld0UWdIeGR4Y2gzK0NHalBlMlUzWkxZTTNCTnBITDNLTUVp?=
 =?utf-8?B?M1AxQkxXQ3U2YkNzendBdXFFSU1SNnF3RHZtVm5JYVNjb09VbGF1Q01mdU1K?=
 =?utf-8?B?dVMyWHhZa090eFdrSDA3bFZ5dGpkZHMzQVgrbUFBZTRnTVdHRW1oR3V2MmJv?=
 =?utf-8?B?RHZOeFVML1NzYmx1RkFOeXF3TVE2ZjhJd2RNdUdxL29yN1RkYmdIU29aODlv?=
 =?utf-8?B?WGJseFl4dm5wcXBFN1VCQUJtMmplalBrKzVlMExUd212S1ZtR09WMjlEMXE2?=
 =?utf-8?B?cTk2T2lWOUR4SjMxcVhLeHNCVldiUFZyaWgwbWl6SWU3Q1Y1LzZMdWhVRFVn?=
 =?utf-8?B?a08xdXArNGpEYzFRVDNkSUFOZnlNdHFzeWl2My9URUZjcXR5RDZaeXRCMW5w?=
 =?utf-8?B?eE1ZcHpUd0txaWRiYjZDQUhSTnYzT2dzeWRPcFZSUmNIa3c0SWdSTzZIejZP?=
 =?utf-8?B?c3czYnhqM1c2dXdhbTB5WGJmSTRITFdjdmErbEYranBWbTh4K0psMkdJdmRX?=
 =?utf-8?B?WXg1LzhKS1JvVnZWWnFNN3dwL1d1OE1qVWo2NFZLcElKUFZTZUhiWjcxbHlI?=
 =?utf-8?B?RmNkcGhkWjVqS1NQay9NL1JOYXFNbjBvNXM5TFVCN0k1UTAzbHNWN2g0Tlhq?=
 =?utf-8?B?UDNnU2E3WEMrOUhZVmdzNDdScnBBR0JSR0EvajNvK0dBYmp0bTAyaDR4VUph?=
 =?utf-8?B?S2U4OE9ZWm9ocVpxMlVINHNvZkZyNkx4VGFuUlA4S3drbE9QNkVLUTUvVVBx?=
 =?utf-8?B?djlJQjQyNVgxUkpoNmZ6MmZ0VEtmZHZwSWhjemZJRmt4SnJsT25RaEFGQmF3?=
 =?utf-8?B?dVhCTlVIMVNXOUNZdlF2UVFScmhQL0cwblhuQVBKaWZpeGFDME9NNW9GMFY1?=
 =?utf-8?B?MUFwdDJIVGNEdFo1amNQL0xlTDlMOFk5TGVFNzJ3c3Z3NlQ3b3ZkbEVlZ0w2?=
 =?utf-8?B?N21WMFpEcFB2YVhTcGkvekRDdWorY2ZiMFVUUnRsMzhZQU5WTmVET0ppQ0FX?=
 =?utf-8?B?aFpSam50bGhNNTEraDBLekU3dTArVFRZa2NKV0xUWU9hT1orZERiVFZSTkEy?=
 =?utf-8?B?L0txYUo1c2F0M0NUQ1BCL0NoeDFMeWtVY29NRUVQSGp4VDBuOEVPMCtDRGRl?=
 =?utf-8?B?Rzk1UFZIUlVVQ2hManIwVno4aXlzRlpMbG41WGNSbVNjejlSd2dRQ1p1ZHlj?=
 =?utf-8?B?eHN1dW1Dby9NZW9wcFQrT0cxVERFMHBpN0Exd1NNdjJJcDQvVWhxMS9oaDRR?=
 =?utf-8?B?TGZxazUvVDFBaW5TZTVWUHF5TDhiZkdNcE4wL1BZbjRieDlBSEVaSHRvZ0Ez?=
 =?utf-8?B?WFBwOUE0TjNpQVZnUDhGcGZhRFNwUFY4RitXMHBFb2dJanZ4WDlKWDExb0xM?=
 =?utf-8?Q?H2Ye6giBMUwvhGMafnhxK2VnR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d38d23-9c40-4aad-60a7-08de3bb0a482
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 08:04:59.4173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vznKOizLKAKTl8qZR/dMNWzLHnUYWRvzS7WxQcY2Ju2e8dSs/FOrcgx+R0MIaDP0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6924
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_000504_173727_9F73C97A 
X-CRM114-Status: GOOD (  16.30  )
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



On 12/14/25 20:17, Randy Dunlap wrote:
> Modify comments in fifo_icap.c to prevent all kernel-doc warnings:
> 
> Warning: fifo_icap.c:51 This comment starts with '/**', but isn't a
>   kernel-doc comment.
>   * HwIcap Device Interrupt Status/Enable Registers
> Warning: fifo_icap.c:106 No description found for return value
>   of 'fifo_icap_fifo_read'
> Warning: fifo_icap.c:160 No description found for return value
>   of 'fifo_icap_get_status'
> Warning: fifo_icap.c:171 No description found for return value
>   of 'fifo_icap_busy'
> Warning: fifo_icap.c:184 No description found for return value
>   of 'fifo_icap_write_fifo_vacancy'
> Warning: fifo_icap.c:196 No description found for return value
>   of 'fifo_icap_read_fifo_occupancy'
> Warning: fifo_icap.c:207 bad line:
> Warning: fifo_icap.c:214 No description found for return value
>   of 'fifo_icap_set_configuration'
> Warning: fifo_icap.c:290 function parameter 'frame_buffer' not described
>   in 'fifo_icap_get_configuration'
> Warning: fifo_icap.c:290 function parameter 'num_words' not described
>   in 'fifo_icap_get_configuration'
> Warning: fifo_icap.c:290 No description found for return value
>   of 'fifo_icap_get_configuration'
> Warning: fifo_icap.c:357 expecting prototype for buffer_icap_reset().
>   Prototype was for fifo_icap_reset() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>   drivers/char/xilinx_hwicap/fifo_icap.c |   27 ++++++++++++++++-------
>   1 file changed, 19 insertions(+), 8 deletions(-)
> 
> --- linux-next-20251128.orig/drivers/char/xilinx_hwicap/fifo_icap.c
> +++ linux-next-20251128/drivers/char/xilinx_hwicap/fifo_icap.c
> @@ -48,7 +48,7 @@
>   
>   #define XHI_GIER_GIE_MASK 0x80000000 /* Global Interrupt enable Mask */
>   
> -/**
> +/*
>    * HwIcap Device Interrupt Status/Enable Registers
>    *
>    * Interrupt Status Register (IPISR) : This register holds the
> @@ -102,6 +102,8 @@ static inline void fifo_icap_fifo_write(
>    * @drvdata: a pointer to the drvdata.
>    *
>    * This function will silently fail if the fifo is empty.
> + *
> + * Returns: 32-bit data from the Read FIFO
>    **/
>   static inline u32 fifo_icap_fifo_read(struct hwicap_drvdata *drvdata)
>   {
> @@ -156,6 +158,8 @@ static inline void fifo_icap_start_readb
>    * D2 - Always 1
>    * D1 - Always 1
>    * D0 - Done bit
> + *
> + * Returns: the 32-bit ICAP status register
>    **/
>   u32 fifo_icap_get_status(struct hwicap_drvdata *drvdata)
>   {
> @@ -165,8 +169,11 @@ u32 fifo_icap_get_status(struct hwicap_d
>   }
>   
>   /**
> - * fifo_icap_busy - Return true if the ICAP is still processing a transaction.
> + * fifo_icap_busy - Check the ICAP busy status.
>    * @drvdata: a pointer to the drvdata.
> + *
> + * Returns: %true if the ICAP is still processing a transaction,
> + *	otherwise %false
>    **/
>   static inline u32 fifo_icap_busy(struct hwicap_drvdata *drvdata)
>   {
> @@ -178,7 +185,7 @@ static inline u32 fifo_icap_busy(struct
>    * fifo_icap_write_fifo_vacancy - Query the write fifo available space.
>    * @drvdata: a pointer to the drvdata.
>    *
> - * Return the number of words that can be safely pushed into the write fifo.
> + * Returns: the number of words that can be safely pushed into the write fifo.
>    **/
>   static inline u32 fifo_icap_write_fifo_vacancy(
>   		struct hwicap_drvdata *drvdata)
> @@ -190,7 +197,7 @@ static inline u32 fifo_icap_write_fifo_v
>    * fifo_icap_read_fifo_occupancy - Query the read fifo available data.
>    * @drvdata: a pointer to the drvdata.
>    *
> - * Return the number of words that can be safely read from the read fifo.
> + * Returns: the number of words that can be safely read from the read fifo.
>    **/
>   static inline u32 fifo_icap_read_fifo_occupancy(
>   		struct hwicap_drvdata *drvdata)
> @@ -205,10 +212,12 @@ static inline u32 fifo_icap_read_fifo_oc
>    *		ICAP device.
>    * @num_words: the number of words (32 bit) to write to the ICAP
>    *		device.
> -
> + *
>    * This function writes the given user data to the Write FIFO in
>    * polled mode and starts the transfer of the data to
>    * the ICAP device.
> + *
> + * Returns: %0 on success or %-errno on failure.
>    **/
>   int fifo_icap_set_configuration(struct hwicap_drvdata *drvdata,
>   		u32 *frame_buffer, u32 num_words)
> @@ -280,11 +289,13 @@ int fifo_icap_set_configuration(struct h
>   /**
>    * fifo_icap_get_configuration - Read configuration data from the device.
>    * @drvdata: a pointer to the drvdata.
> - * @data: Address of the data representing the partial bitstream
> - * @size: the size of the partial bitstream in 32 bit words.
> + * @frame_buffer: Address of the data representing the partial bitstream
> + * @num_words: the size of the partial bitstream in 32 bit words.
>    *
>    * This function reads the specified number of words from the ICAP device in
>    * the polled mode.
> + *
> + * Returns: %0 on success or %-errno on failure.
>    */
>   int fifo_icap_get_configuration(struct hwicap_drvdata *drvdata,
>   		u32 *frame_buffer, u32 num_words)
> @@ -347,7 +358,7 @@ int fifo_icap_get_configuration(struct h
>   }
>   
>   /**
> - * buffer_icap_reset - Reset the logic of the icap device.
> + * fifo_icap_reset - Reset the logic of the icap device.
>    * @drvdata: a pointer to the drvdata.
>    *
>    * This function forces the software reset of the complete HWICAP device.

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

