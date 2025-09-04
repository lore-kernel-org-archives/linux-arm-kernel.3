Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77838CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZFNAlsk9zii1koVPsGDMHMT1gPWa2JQzDLfTeUbwOk=; b=bY9zGW6qS2/XU9fBgB/eIRNEic
	hPQfzv5rFYydLpbqAEvjOwDo9UowKeRxtmK8yufP/E2lhIcOQYMlccpGEBcEQfJxrLEY0Duk31JxE
	THFuWo7FuwLXhlBxw3ZVfh1T/Ia18Vq06dMe8f2vpUXsDw25d7EX/SiBtJua9la6v0N+fmPpmLOS3
	Csuuzjk80nHoGAPXnOSXEMwFzvgr0cmBlBeLk1oyxRE62TkRiLdWBpz6WTTtGeH1WX0J3JDFz3r6j
	JlTxLxpnx1EHl30uXF4fTvfEKkIWSWmKPI/jj+FS9dmMG9ZTE6Omdv1BHw8Ao+ZV0m7DEaLR0pufG
	YFNz9N5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6I-0000000G5GD-3ItJ;
	Fri, 05 Sep 2025 02:22:54 +0000
Received: from mail-bn8nam12on20624.outbound.protection.outlook.com ([2a01:111:f403:2418::624] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuIY8-0000000Eu9v-1orZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 22:35:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJf4NSNzcGGvw+fqNLomQ8DwFFK2ZFm5fWwyTz5mdlLUm4eVNssH+u5BGWbweGNAvXnoVdrZqLXrMq7ZKdZGlFF2YFj+PN6ivsMFxtC+erxuexiv46mjqbPr1zEuVhVYtiFa/4Y2clZAcZzVxVmLmKwnMfYiGB6eIsmrB2mprwMWBjFALTFOhEKPh+2ffvTBFOVwMXZS8FYLlGXi5JdBiEMUneWSCuqX+6YLbor0sC+GMA/RmeoP0g3LJEZFVRyRL//5Ks95SGSnNADooShCtVVU5ncyde8qI5k3gfAUB4Je4h4ZCtxEDcDDz4EG9x9mmbYnFnmZK4APOld2RepuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZFNAlsk9zii1koVPsGDMHMT1gPWa2JQzDLfTeUbwOk=;
 b=E5rGiV89VcjrC5tMStGkS+/wHfVgYDoAQJwzGKkxNGGziMnClwD1nqkMnbi+M8nya/4+A9pT2dKmKIds4BdhL+1IXDiw20D6Oei5HGOg7pYYQlbJcuP69pdDEPWqumn7NDHi2obNhQR8syoGmFSA9GvWhoH8EvBLbBIB66ii7UgOEtc0Y9IqnRSmIY3qHxmgl9NpdutuluBv3qRkELytwrww05mc4Rq5k1qnjFeRH2fB0wzFGOYh140NLJUC0786hHA/nqJR5VnWTEELyGC6A9vPL1Nizuhe4XoQ5+Gr/SqcFOyQwGeg0cXltZvk0GswT2XeHrdS/fhG+8YWieuUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZFNAlsk9zii1koVPsGDMHMT1gPWa2JQzDLfTeUbwOk=;
 b=A17uXoxJIYZsK7Ptb/pEkJMJNSlswAZnrHqqwear9R+bfRXBp+Yo8OYxte269J5lBVOOKdlNOeTDMhcwAjjHGW9gqHTrwlOKfNHWSfEfRvb0hkXeCaQH2+sD7XZYMj33+9p3cQm9m/kujq62GqvSql8DZ1zikfMQ7t3ZNPeM6/GPWTx3/6De6ZWMKiu+gMIyao6CHHtl+aB0St6UB8F2NA1c6a7J3o3AqylrcWEXKT7eGT/xzaTm9BlnRcDlSPDs06i8AMnfVHUVzIr+XUtmWYIypOxYz4YYEUJpgNN8Ag5N8M5bkLMovc0QGpP1q78DaLKhI7WIhtUd87ZJ56dxNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 by CH1PR12MB9669.namprd12.prod.outlook.com (2603:10b6:610:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 22:35:18 +0000
Received: from PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d]) by PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d%7]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 22:35:17 +0000
Message-ID: <457567cc-4863-42a4-8b91-27de17b51887@nvidia.com>
Date: Thu, 4 Sep 2025 15:35:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: Add NVIDIA GB200 UT3.0b board
To: Andrew Jeffery <andrew@codeconstruct.com.au>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: joel@jms.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20250815224344.908130-1-donalds@nvidia.com>
 <20250815224344.908130-3-donalds@nvidia.com>
 <c9348ebb7f0cd24c950ba07abf4641a1d5382160.camel@codeconstruct.com.au>
Content-Language: en-US
From: Donald Shannon <donalds@nvidia.com>
In-Reply-To: <c9348ebb7f0cd24c950ba07abf4641a1d5382160.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::18) To PH7PR12MB7282.namprd12.prod.outlook.com
 (2603:10b6:510:209::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7282:EE_|CH1PR12MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e67b6c-095d-480d-4381-08ddec0352aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3VPeGZ4V1VybFVvOFpxOWQrNDQ5RW1BbktoRjd5aFZZbS8wS3I4NUNlZDE4?=
 =?utf-8?B?NHczVzUvSTNHSWMxaktxeFBlZm0wVUZRZ2FkL1UreUgvNHJLSHdDOUlPNXk0?=
 =?utf-8?B?eDNzUkEwNkVsdWRENEcyMGQzMm1hWG53V2lOb0duSUhFMVBNNmpuOWZpZy8z?=
 =?utf-8?B?dWc1ZFF5MEhCL2xLb3ZXVTI2K2h5QzVFQ29vU040VmhVTzltakdYazNKVTJV?=
 =?utf-8?B?RjlHYTJNd1dwaU8vdmRVRjltcDNKUEtsUVlaaGQ4dmZFcGdGWkpucitPNTZZ?=
 =?utf-8?B?QW03VGlZVng4dFpqMURCYjNDT2ovRSswWTM3eVhwSEZFYnZnTERjQ1lJZmZF?=
 =?utf-8?B?RC82U2NqRmNFV2oyeEk5MDZMVk1yU3ArREs1MGtENVRxdXRjYjVJNUVJODFD?=
 =?utf-8?B?Q2wzc0Y4ODFka2FjMzVBbEovSzJuVU5mWk9qbG5vam51SEVkSjdaOUVGUnVk?=
 =?utf-8?B?NnRybVc1Q2l2NUlNRWEvMVdCVGpYMklvKzJSRXRyVDBkV2w1V1hNWXNmZXlq?=
 =?utf-8?B?NmZtTnl5dGFwOWRhUExBbTlYeG9Kc1NicUZDakl5VXYyQUI4eGhTTTdrK1JF?=
 =?utf-8?B?YURZb0FOZ3lvSS85OHZrWmhoZWljV0l0RTNhdkhadWRmaW1WUnladGlSMlhJ?=
 =?utf-8?B?OWl5NWVucE44NjBhanpQVk0wOUxHd0x5bGFjWHJkSUViVUR2WUZyblVPUldi?=
 =?utf-8?B?YnR0cnFrZWs1RUE1RjVvRm1la3BMSWRMWlJsSjVoTTl1Z1Z0RlVVbS9qb0Zs?=
 =?utf-8?B?NHZPNkVqcjVzbnFVdnNIZ0V1UHJMT1BNZUNLbUc5MksweUJWc20vUmlqNFV2?=
 =?utf-8?B?UzJsUHZpTDkxVWFRMjY0VzhOZEJoU3RSUmpBeTVhYld3U2dZWWUwU2kvRnB1?=
 =?utf-8?B?RUxNZ2VVcTVublBuMENOYUh4bWpNWmJDaWVubkFSQ1RUQS9mY243VGxkY2hL?=
 =?utf-8?B?eDN1Y1dWRDJ1S0FvS1VJMHdaUm93T0dlMGtmVnNXdmhIdnRMQ0tYU1RoOE1i?=
 =?utf-8?B?RWFSVGRGaHdjZTJMbE9ncjBZcnVMNHZPMCtpQURYaWIwSm9UdEVSN1NvUSsy?=
 =?utf-8?B?S3ZycUlRWFEwMExscHhIcGIreTdqVjFKWFJ6TUxFNDVwdzdKSVY3ejVNSnF3?=
 =?utf-8?B?ekdXT1NLbWV4Mkx5MCtBK1VIUFMxWmZtdkFVVE5RTVBsWEtHVEFlbWhvS2VF?=
 =?utf-8?B?dHJRaWxhNGNySkZHWDR5UGNzUm41K2pPaGZBVzVqcmtjdXVuMzI4MHd6Szh5?=
 =?utf-8?B?dW5GaGZINEVucVlLTE90NllkVW5UU2F4S0d0S2VZN0oxaFJqRjBjV1l2SDA0?=
 =?utf-8?B?VXN0RzUxLzVGYUxyYk0xRG10THR1elRRMEI1VWhKdGR1R0VBcU9xSllxUFA2?=
 =?utf-8?B?dVBDNVY2cmN2aXZIVXcxRm5RcUxpR3BidWV3blJNdnlyM0NzSGt6azIyM29p?=
 =?utf-8?B?S1NqblFFUDQ1UW1rM2xEOG5IN0g4UktuaWRoSDdIV2JkV2J2R0hNZHBwRFpN?=
 =?utf-8?B?WG5EWTB2MFZmU1ZXTzZmbVREcGVGcGpuamp4UVlINFVNWE5NemJGdVdxKzFZ?=
 =?utf-8?B?d29rZzRuUitMWGtlS3V2L2pZUm1TUXpLTXdhTmM2TFhlbFdiako0R3p6SGZB?=
 =?utf-8?B?Y21VUHpJdVNNa25GN3MxdUtQcmtTbkhXQjZ1aFZLZUJqRUtOazBOR1d5NVRU?=
 =?utf-8?B?SW9keGN6UmJQZ0ptM2N5TStMZjlmMEJsYndpN2R1enRZUGtIaEd3Y3d4R1hN?=
 =?utf-8?B?clpEbnlSK2hHRE5hTkVUdldOQkpGZk53UlJ4Y0xBUzlTenpzY050Um51Y1I2?=
 =?utf-8?B?SThPTTdPVUtCQkxtZnpodEFLa0h5R2RTN0lLNTVFaVBScUFKVU9GaTdXdUR3?=
 =?utf-8?B?QXhRKytvaml1M1dPdlI3ejFWa3k0cEYrTjhaMnp0MXdSMTNXRitIbGw1b0U4?=
 =?utf-8?Q?mQsvcIgjoOE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7282.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MktPZmh3UitGMmRwM1BVai91Q2RVSlNYSWwwbUVvZ3pqQU9OMUxpd1JKZFpI?=
 =?utf-8?B?RW9GN3JabHZ4aVpGVzRhdEYwbFQ4N1IxMFlHKzlZVGhPa0tVS3MyaldaTTZy?=
 =?utf-8?B?OTYwdjBueWlzd1Z5aFg4ZCtvRVRSc3lCaGx6ck4xTEdPZ2RaNnJUQmZtMS9Y?=
 =?utf-8?B?clZDVmZmRjZUakRubHVsTkVNdytZSVN1VXNPMTJ3ZGpGbHlCTm5IUDcvQ2Rh?=
 =?utf-8?B?cUFLNTR3QjNYNE5iSjF5MHdZUkY5MWRaSlM1VGVYUVZTVzJjQzhpUnVjd1JH?=
 =?utf-8?B?RUw4eEJOUVFPS2NGLzFqSW1lQTF3TFpVbzNZMmhRc2hLTTdHa1VwU0hNYkFC?=
 =?utf-8?B?Z1hUQ2JJYS84NTJjN0tzVWRiZExtUDQ0dndOUDRoY1ZDTTlCZktlS3A4cmxy?=
 =?utf-8?B?Rkptc2RHNDZIcGw0RU9IN0JZV3Bid1hoUHBsY1NMSnp4ZU80ZktoSDF2WFZx?=
 =?utf-8?B?MTF0NnJKVW5JMEdsa3ljbzVuM081UmQwZkJnb3FOZUxvaE1ObGxRdXVKQmVX?=
 =?utf-8?B?SldyU2hXaHRZdTJkVlQvK29OcnJTUllSRzVPNE5aZ0d6amdUUjNNQjVrSUR3?=
 =?utf-8?B?ajVnbTRycjcrczFZS0h1QlJJczhEUllEWnhGUnB6SytJMG5uWk1KV1A2SlE1?=
 =?utf-8?B?aGg4N1R0ODhWQ2pUUWJkTnZJUXA5LzVMZlBjY1NPdCtYMzd1WCtFR2tSVnVB?=
 =?utf-8?B?bStjYlJqeFBEV25lRVhrblE2bWVQcU5MY3lNTlhSaXVRdEdBaUk0OGJIZlpR?=
 =?utf-8?B?R1hrM0RuUUQyaE1XdUhnVXE3M3J3akxEc3B4ZHl3V1RZSUd6ZkoxeXFKQ241?=
 =?utf-8?B?Q2s2SEJuOU5RL0xkRTZWbGRNcEhYckJHa1MxOC9LVUZET3NQejhIYU82TDlv?=
 =?utf-8?B?U2Y5bjBtaWNwa0drMVVFa2ZhaHdqR1ZkN2dWRVI1UStYYS9KWFEwOWZMUVdY?=
 =?utf-8?B?OVA4ZkUyTXdnSTJYUVV4MWZQbE02TWNqdGJPUHAvWnVFaVRsOW5VbkgwMjFs?=
 =?utf-8?B?TjljNGY1YzhJWjJ1UjZCcWtNcnc2U0JDYmsvR2VRWnhQZ1AzcW1xL0dmM2Nq?=
 =?utf-8?B?SllmRmQxWlFlMGtiV29Eb0VuMGdGbDk2NDFEZXBBU1F4eUEzRityNUpHa0E0?=
 =?utf-8?B?bEVsN2ZZTE1CZUM3VzFLbGp6MmpPclpTQkxPVmo4WXlpVUNLQWt1ZW9sZTlv?=
 =?utf-8?B?WnlLbHRZR1ZwcC9ZZmt4SDRINEdiR25VTEVzckRKZk55eGtzMDQ5YUYyYzY1?=
 =?utf-8?B?UkxjV01DRGgrUHZORXZIdWtXbmgwTXNJc1pEcVJzeGhaYVA2a2NBSU5SNXVV?=
 =?utf-8?B?K2RCeHVBMkI1Y2JNNVRYUzBNeWJ1UndyclZHUEp1enBpVkdoZFFVcloveUN0?=
 =?utf-8?B?ZlJFQUhPdjZoeGtXeURIS1c0dEU1L2J2T1c2bkI2NWsxZEtBTUVwZDhraXpT?=
 =?utf-8?B?eFJjd2xrYyswazhwd01XY1JnZkJiUGM4cG5Od05YUHBYNXZqWDlIRm52MG56?=
 =?utf-8?B?U3dFYzd2MTZmbTUwcGhvVlZXdysra3pTQm40bkl1K1BNMjlLdnRQYUtRQW1k?=
 =?utf-8?B?WG9oeVVadkplemZyWXc2c0hRYTBQd3lTdTBrRHZyNGppek94WVNabzd1OUhS?=
 =?utf-8?B?ZlA5bDM2Y3liZmM1a2dSelZSRzVwRlV6bmp6VUNQV3g5L3N0Q2c2NlA0RTg5?=
 =?utf-8?B?QkNyNEZsUS9JSzhKZStORUZhMXg3WENMMmRUNk9wbGxJY2RZd1l0aE9JQzFv?=
 =?utf-8?B?OGFDelh4VjdDenlLTng4RG1OM21oalpCUE85L2srZXNSYXVYUmU3NHlOTHlw?=
 =?utf-8?B?S0pLUkE4WmYwY2E3RFNCU1pFeGtYS3NycG9Zb3V1Y3F3RlcyeXJkKzhXblBJ?=
 =?utf-8?B?ajJBbDA0R2pGMnkwRHVQTVFTUXdjdmVYK2Rra1FiQk9yN3o4R3B6S0gwQUVZ?=
 =?utf-8?B?Rk9NMU5iK1p2VXBSTjl5YTZYd1laT3pXYTZVMVZza0Z4Vk9YQS9WTTFFYyt4?=
 =?utf-8?B?UEo4R0JjMXRYVzNaMnFJcUdPaGZROHMvbFNMVFpMNytTdkpOZHFxNDlTbmtT?=
 =?utf-8?B?THN1NUg3N1RFYjV5aGM5N2Z4aFdQWHZaWEZabjhRTCtNeTRxS0RsOUxRcVVt?=
 =?utf-8?Q?jLgCDlmMAPrpFDUaX8SBFPgiB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e67b6c-095d-480d-4381-08ddec0352aa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 22:35:17.4073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klc1ojWHAfPXQhXi7x0XukEurzzLdi/MB+jaJGQPr9OxZtjVyTFkGwryU2zZPFSQFXvyEmVY1I2px5RVv0NOWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9669
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_153524_669744_A3101240 
X-CRM114-Status: GOOD (  19.65  )
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

On 9/2/25 22:46, Andrew Jeffery wrote:

> External email: Use caution opening links or attachments
>
>
> Hi Donald,
>
> Sorry for the delay.
>
> On Fri, 2025-08-15 at 15:43 -0700, Donald Shannon wrote:
>> This is an Aspeed AST2600 based unit testing platform for GB200.
>> UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
>> differences, additional gpio expanders, and voltage regulator gating
>> some devices.
>>
>> Reference to Ast2600 SOC [1].
>> Reference to Blackwell GB200NVL Platform [2].
>>
>> Link: https://www.aspeedtech.com/server_ast2600/ [1]
>> Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
>> Signed-off-by: Donald Shannon <donalds@nvidia.com>
>> ---
>>   arch/arm/boot/dts/aspeed/Makefile             |    1 +
>>   .../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts  | 1030 +++++++++++++++++
>>   2 files changed, 1031 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts
>>
>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>> index aba7451ab749..37edc4625a9f 100644
>> --- a/arch/arm/boot/dts/aspeed/Makefile
>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>>
> *snip*
>
>> +&gpio0 {
>> +       gpio-line-names =
>> +               /*A0-A7*/ "", "", "", "", "", "", "", "",
>> +               /*B0-B7*/ "", "", "", "", "", "", "", "",
>> +               /*C0-C7*/ "SGPIO_I2C_MUX_SEL-O", "", "", "", "", "", "", "",
>> +               /*D0-D7*/ "", "", "", "UART1_MUX_SEL-O", "", "FPGA_PEX_RST_L-O", "", "",
>> +               /*E0-E7*/ "RTL8221_PHY_RST_L-O", "RTL8211_PHY_INT_L-I", "", "UART3_MUX_SEL-O",
>> +                                       "", "", "", "SGPIO_BMC_EN-O",
>> +               /*F0-F7*/ "", "", "", "", "", "", "", "",
>> +               /*G0-G7*/ "", "", "", "", "", "", "", "",
>> +               /*H0-H7*/ "", "", "", "", "", "", "", "",
>> +               /*I0-I7*/ "", "", "", "", "", "QSPI2_RST_L-O", "GLOBAL_WP_BMC-O", "BMC_DDR4_TEN-O",
>> +               /*J0-J7*/ "", "", "", "", "", "", "", "",
>> +               /*K0-K7*/ "", "", "", "", "", "", "", "",
>> +               /*L0-L7*/ "", "", "", "", "", "", "", "",
>> +               /*M0-M7*/ "PCIE_EP_RST_EN-O", "BMC_FRU_WP-O", "FPGA_RST_L-O", "STBY_POWER_EN-O",
>> +                                       "STBY_POWER_PG-I", "PCIE_EP_RST_L-O", "", "",
>> +               /*N0-N7*/ "", "", "", "", "", "", "", "",
>> +               /*O0-O7*/ "", "", "", "", "", "", "", "",
>> +               /*P0-P7*/ "", "", "", "", "", "", "", "",
>> +               /*Q0-Q7*/ "", "", "", "", "", "", "", "",
>> +               /*R0-R7*/ "", "", "", "", "", "", "", "",
>> +               /*S0-S7*/ "", "", "", "", "", "", "", "",
>> +               /*T0-T7*/ "", "", "", "", "", "", "", "",
>> +               /*U0-U7*/ "", "", "", "", "", "", "", "",
>> +               /*V0-V7*/ "AP_EROT_REQ-O", "EROT_AP_GNT-I", "", "","PCB_TEMP_ALERT-I", "","", "",
>> +               /*W0-W7*/ "", "", "", "", "", "", "", "",
>> +               /*X0-X7*/ "", "", "TPM_MUX_SEL-O", "", "", "", "", "",
>> +               /*Y0-Y7*/ "", "", "", "EMMC_RST-O", "","", "", "",
>> +               /*Z0-Z7*/ "BMC_READY-O","", "", "", "", "", "", "";
>> +};
>> +
>> +&gpio1 {
>> +       /* 36 1.8V GPIOs */
>> +       gpio-line-names =
>> +               /*A0-A7*/ "", "", "", "", "", "", "", "",
>> +               /*B0-B7*/ "", "", "", "", "", "", "IO_EXPANDER_INT_L-I","",
>> +               /*C0-C7*/ "", "", "", "", "", "", "", "",
>> +               /*D0-D7*/ "", "", "", "", "", "", "SPI_HOST_TPM_RST_L-O", "SPI_BMC_FPGA_INT_L-I",
>> +               /*E0-E7*/ "", "", "", "", "", "", "", "";
>> +};
>> +
>> +&sgpiom0 {
> So the style guide asks the referenced nodes to be ordered either
> alphabetically, or in DTSI order[1] (which should be unit-address
> order).
>
> [1]: https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes
>
> What we have to the quoted section above isn't in alphabetical order.
> To this point it was DTSI order, but that breaks here too.
>
> My preference is that nodes in the DTS referencing the DTSI are
> alphabetical (as we can't see the unit address for ordering). Can you
> please fix it?
>
> You mention in your cover letter that ordering was addressed in v3 -
> did we lose that along the way?
>
> *snip*
>
>> +
>> +&uart_routing { };
> Drop this?
>
> Cheers,
>
> Andrew

Hi Andrew,

Thank you. I will switch to alphabetical order and remove uart_routing.

Thanks,

Don


