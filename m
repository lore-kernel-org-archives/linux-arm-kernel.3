Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FA4C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMLbgHETSv9UE7Yr+8kLZ9l2+MfuDM9RoSbAHwZtKHM=; b=ZOMdZlx7jIlOad+nlv8GBpNXHQ
	V0v9eGy19/EsKHhY+kcizSOfW34Luq1EbJe8Or67h72QOyOny3uxFNfUkGuuk8YZFf6gA0CIaF6xw
	vidQXN27KC+bEGSwvYbKh6DXPvVpMIQ7Jdi7spow9HH69o8d6ljED6kusrP9EX7X51dM1O2uQrlBK
	oxEBjJ4l2iUXxDsYrD6NjkGocl5biilp55WdWTI3vMwniTJEN4Zimj3FNB5kpeOfJHdNGJNGyt4IE
	WDdiT5VeaVXxeqRA5LsM0i1WDcMIc6TpIvfeH32rz87MA7tjq449dOUyS474MSsTcBWionJ9klgcK
	wbsxc7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAk3-00000007ROf-1l32;
	Tue, 21 Jan 2025 09:40:15 +0000
Received: from mail-vi1eur03on20600.outbound.protection.outlook.com ([2a01:111:f403:260c::600] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAgK-00000007QmF-3PSV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmnZTGV2wDRXViaFWwkiDOaSNZFd9h1aSiCdBbkNOsTyOGecoX/OgwU7lk3Jz3f7Fs74uPExerVASVvWYl9/RFXP65oU26jPYLtWusDhNFjDIzv2YaRyG7ZKMgkjMyNH7q24/YR7y69RUcHBWazomooWmVf8YyQLZ2VwluInAebuhG54WQbcscytj4No+VXKb4WguE9MZZDfCqwC29rAINGawLXq4B4uqXWIQJDPBduWZhoX6G5SuY1TMwyUghZPLIAp4b+oW8RmMB57lTYvRPMoWo4opsNV2AWrngZm4HunV43pNk58KJ+i+KXNTM6tod8Tdi5qtL4j9/lPkj3YkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMLbgHETSv9UE7Yr+8kLZ9l2+MfuDM9RoSbAHwZtKHM=;
 b=qeJkeAG1QGcfhS++h3n8AKXiZSmnXR+pcyBSSl1QFjQc+L1AT1c76c11/T7dPOvME8T1lxx9qe5JxZLVeadd+1KzqsbpSxQYsKiQ9fMESfZSfaMNGMgiIVfpEvSLSCCKbAHtcRptLHKSmsWSQrJrh5lF9gKwvALbVH0Y0t/VKpAOb9Bezq+4grelys4GVa76O8eqinUfygI9XXTLe++AUfJGKJpUynIY3rAs73404Mm6DLHfARv0JECybSgzIfW9myyVxftaTzzD8aR2UxegXcMIvuh0igEbcUzXNvZQDz020QtN6pis+LwTd6E5AzjkFWPpNRQI3AxkQzNIAjt4AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMLbgHETSv9UE7Yr+8kLZ9l2+MfuDM9RoSbAHwZtKHM=;
 b=MBKwEcdqOh9HRv6FLNhodcBD/CBL9oyUcjeQ1RLmnjCYNORG+/rgN5o4qV3O/Yg/VcZxr9SZWR22eHX9tsTwVPK+GGJRcYZGwzSl172l4eHG2ZcvcBsYnFBRSUfmay4vVX8ym+OPPR5SIRSxBXvaiBka5vIq5tdJs65ddY9dfjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10502.eurprd04.prod.outlook.com (2603:10a6:102:44f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 09:36:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 09:36:17 +0000
Message-ID: <2d80ae4a-f836-4492-997c-69dac32be41b@cherry.de>
Date: Tue, 21 Jan 2025 10:36:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Move uart5 pin configuration to
 SoM dtsi
To: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250121092255.3108495-1-lukasz.czechowski@thaumatec.com>
 <20250121092255.3108495-2-lukasz.czechowski@thaumatec.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250121092255.3108495-2-lukasz.czechowski@thaumatec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10502:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c0a581-0e10-4e32-9f9d-08dd39ff0dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDlFMEpZKzlYRmRrMEdkY0tCdi9IdzgxZ0IzU1pyNUZiRHB5dlBnUDZWclRE?=
 =?utf-8?B?djBkcHRpQ2dGZWl3ZDloMUdTakxvK2k4ZGtucWpGWFBoYzJKZXpScEFLS0w5?=
 =?utf-8?B?UkNjRTBkb3AvKy9XL250d3JSTmNnSmUwUHNuYy9PaVZ2VGZOZGJpVmQzNHFB?=
 =?utf-8?B?NUdUWldiZmloYnJidU56ZXE0RkE3Vlk0bkNFUkNKRDh1WURYSXMxQnRTdkR6?=
 =?utf-8?B?cnk3ckh4ajNlZ2dQaTBkZEMybysvQ2tRa2dIckZuR2hGdW9vWGxVWER3NGpD?=
 =?utf-8?B?c3NzNnZ1U3ZFN0Y1RlZBU2ZmcUVNSE5ZczFOeFFrQW9KdTdQUXdyVXNpRlJq?=
 =?utf-8?B?VDc3S2ZVZ0l3dG5ZTUJuWGM0TU03ODVsT1Q2VzM0endHRUJMbG9YTjhjZ2hn?=
 =?utf-8?B?SFNOQ3Y2Qk1veUVxUGFkQ3RoTXp5cjBrMllXY3hSU2NuQ1NrQVQ3MnhHVWxP?=
 =?utf-8?B?SElYNEtVT3hBTHFiNjlVTWQ1bVNTYWthQjc3NHVSdEU0ajVDU2syakJldmo2?=
 =?utf-8?B?c055NWJOYVo2VWpQb3lIaHcvLytBV0FYVkxTNnVpcnAwblRLbVl0b3pSOWlx?=
 =?utf-8?B?M1RyeCt1NXBaRnlxeXVNSnhMWVVrMGVrblJLQkxqMDF2K0RRNHN3bEFKdWVn?=
 =?utf-8?B?WEoyQTlLWHJEVHJpWHd4UjZoM2pHcVFvM1RjTVZhUkdFK2xoenJNZlpXdWJ1?=
 =?utf-8?B?eVF6T3hsSjJuY2NvMDh2dGVhTHpSRWEwTCtOM0tsQThXc2RndVBHUktBOGFa?=
 =?utf-8?B?MUFlQkF2Y21HaGVOay90cU0wb1hTZUY0RGJOVmo4WWtKcW8vUXNhdU1VRmxC?=
 =?utf-8?B?c0dDQ0JYeXNJSnlNZ1VGczdjajFWa01CcUFwN3p3bmxncWZlWkRwd2wxVGlx?=
 =?utf-8?B?MUcwbGpGb09jVTJxUWhNbXAyWUNHMHZXVFJvdHl0UllmbFVXRGRuRk0zRFhK?=
 =?utf-8?B?ZkZ1TGNyL1pic01NbFdhMDNFOEtPaFovMUZaRnEzdmI2MHZ3VkZ6NlJqTlp2?=
 =?utf-8?B?b3E4MzZLL1RleFY3R2JEV0NSbkRQR3gzTzVmWFZ4ajJFME1SZTNIYmpwVVl3?=
 =?utf-8?B?Yy9JWDUyR2dmUDRreUtlQUVRby91KzYwcW4rZzdIT05RR2ExTy85STVBaEFi?=
 =?utf-8?B?Y3lqRXM1U01pQytTNDdFZHdaSENFZUxERkx2V3ZDcVFoSUk3dzZVMnRFemlE?=
 =?utf-8?B?OVhlL0U2U0hVM0lFZTFvU2xHbUdabFUvdXluZloxVGpkYWZjM1VGa3RxaEJw?=
 =?utf-8?B?S3VGbkpUdTVvVVN3NmRqL1dXZnBJUzV4TjBsaDZFTUY0Qkd4ZnBzdnhWREpl?=
 =?utf-8?B?RHRTV3MwWllXUkV0WlRMZS9CS3V5blhBV09vY0xoZlR6MXpCZzBPN2wzKzRB?=
 =?utf-8?B?Q3J3L1pFRldmZDVnNjZ0OGhuc0R6K2ZxVjhPK2VFc2pKWlFrcWFHQ3R5TGt4?=
 =?utf-8?B?TXpmeWVuZDVzaE1teENnajIvdHNyRTdkOXBHMDVHaXN3V2RQOHp3RVJ2WXc3?=
 =?utf-8?B?WU1kbkhtU1Y2a0hTVWpjVVBSVHpiNVdGR1hLbGN5cTNxS045TjJGZGlsazV6?=
 =?utf-8?B?bWlHM3NmdE5lY1VCcjMxVUJxVDlIdmw5R3JLMktJUzd5WkxuTDZuTENySEg4?=
 =?utf-8?B?Slo0UlVaZFJaQVRieDFkTXU2WDZIbFh2WkV3blVaR2RvYy84a1JZdFg5MHIv?=
 =?utf-8?B?aUVWU2xNU0ZCbURsOVVTeHI1a1h4ZVV4bEkrSlNIc2NaSHdlZUNLRE1hRUYv?=
 =?utf-8?B?RzhHelJudUpFVGpoV0g1MlJSdEwySUVxVm9Ra3p1L1hSSE14ZjNxcmZITDcr?=
 =?utf-8?B?L0VyY1hWOFliaW9KUFRzZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmN3ZmZ4eDFNY0I2cHN1cUpjaXl5cUxkWjJ2VmpFTUhnNC80YjJneXFXajdL?=
 =?utf-8?B?OEZGUktzNXZzUTZOZlk4NXNPMGV5dlNCblVCZ2NmWVpyL0dQYnN2SzFVUGFt?=
 =?utf-8?B?bkh5MFRwTEVtYTZQWCtCbU9pWWVlNG1XL3lyN0JzY2JpYzJFY0VEQmw1bElY?=
 =?utf-8?B?UUJJdWRwR2QxUlNLNUlYZ1NNNVNQQ0pMU3hTVnFLVlgyR0Vudjh6eGRCMFBz?=
 =?utf-8?B?Q2FjMHBXbEpMbkVWNU5FU1ZWQ3I5aGpDWGRLZXdJSjZESnhiYmhOT2RTL0pG?=
 =?utf-8?B?RDUzbW5pQ20vWTVxT1o0VlhFdVh5SlhWYnpGbGF3Q2pvazh4QkE2WFdWQTN5?=
 =?utf-8?B?VW5PZHZHQjQzMmtzVzdNYnRESHVvN0Fmc3BxeEkyNnBrbUpGS0JRWkl5M3FQ?=
 =?utf-8?B?ZmhoeVg1L0tFT2hFRDZMRTcrZDk1eTR4N3VTM1FWMnZyN0QvSERvZnc2VVll?=
 =?utf-8?B?TFltZkpZOWoyK0UydWRYWnJkQ2FTeE91bG4zMm9IaHZLUXUxaGNmSUZTZmF1?=
 =?utf-8?B?Q0pTbjdEVHA5WUw0eFZlZmMvL1N0c2pxTE1RZ1ZQNHlmb0hQdTkvNlpSelBa?=
 =?utf-8?B?NWhPR0JOL0hMZmpad2tZTThXZkdUSHFRYjlHSFhBMk9lZVNZdHZuWWlsZE9Q?=
 =?utf-8?B?SGVDc1oxaXNUK3RlcHlpT0xoU3IzMHJ0cWVqTGUya0J6TWo2dytodEFLUzBP?=
 =?utf-8?B?Nlc2dDkzT24xeEJLSGMrYzU0L3FrT0s1azliakxJQURTVFd3ZW1tdlhDemRr?=
 =?utf-8?B?dWlCOXc5Nm9qUURUOUVPbE9kS1lKMUowaFVwVldqWEIzbUlITWR1MGl2THZ5?=
 =?utf-8?B?emozd0tQU1NxWjEzbzl3Mm1rNE1ISTZXRzFJWjFIbkoxWnVzTlB0Q3JhRmxR?=
 =?utf-8?B?MUdlUUxwcDRscVRiWmw0MDkrT1V6TEh1MXBYblhjc2hRWU9iRGd6QTQ4Wm9F?=
 =?utf-8?B?Z3EzRXJRZWJBK2ZpWnRUdVZMdnMvWmM0SmsweWpDazZPNURZVjlSYXQ1aEly?=
 =?utf-8?B?aTJqMVNqVjV6OStXbHRUNkVCdFhuanBLQ0VZNmZHVTdOU29pVUtpYVBMOGRP?=
 =?utf-8?B?cmJvM2dYT3dVYUxVZ1prVlVCUHJpdWlQeDJKK3pFbG94WGVwNUhYaThoY0dM?=
 =?utf-8?B?MnYzRW5OUjlyM2Q0eDcvUkZRYnZhY3p6dFU2NSt1NllHVjZVYmYrYVNnQzla?=
 =?utf-8?B?VThCRWliRTIyUURVR3VIZTJMZFZ0TC9FNEVLWjV2Y0hXNkZ6REZWQzNnUVc3?=
 =?utf-8?B?bE1FeTYxaWRJSy8vOWg4alRxVWFIRkUrUWcvY3BqeGgvVUo3NDlsUk4xZHEy?=
 =?utf-8?B?ZzB2a25NbUVTcTdQeU9DMFpCazhqd1lsTTMvUG1CL3phYk05UEpRcVIxcm1w?=
 =?utf-8?B?YThKYXJwWUVIVSsrRGVXYlErcmM5WWZUM1NFM1BNVXlGT0pQaEhudkxxRmJ6?=
 =?utf-8?B?TXlMZVJtdW8rUTVkTFVaMnZvZ2o5Y05vYWwyNUxjZUZnZDY2b3FteEplZ3B3?=
 =?utf-8?B?UWFERjkzV0YvSDc4Ry9kckROWWJINE9mNnhoeTB4UUx2c3dveUEvcVFEdTNw?=
 =?utf-8?B?Nit2cmpvdS91L3dxMEV6U05saTE2azduYjk3SjF1aTlpWHdqS2RrdnhOZWRt?=
 =?utf-8?B?UlhoRlVYT0Z1K2RKeVAxcjlpWU43ZXpCOG0yUllhbk9jd1l4UUNrdjNWNXBK?=
 =?utf-8?B?S3pubzRVYm1CclhuSGwrSVJUNlNKN1NkNjdvbFdQdWZ0ZVhtVVhraUxHWFlE?=
 =?utf-8?B?MWpUUnptVi84a0VKdzJKVGJvdnpJUDVMR3VKWDl2Q2N6ZElNZm55aDh6SUk4?=
 =?utf-8?B?ak9mU1AxRWFnbHE5WUE4RHRaR0RPajlPa1NPMHhkbGhLQUFUYTk2cGdGMXg3?=
 =?utf-8?B?QURSQUloL2c5QUQzQ3lXK1l2SFlxTVVkZjdBNEJYL3dBTTRFeEF6b3RpdVpG?=
 =?utf-8?B?WlVmZml4RHE2NWVCZFIyR2l5Q2RWNFl2MVpSY3VDSTQxVnRrYWtpOUpHMlRG?=
 =?utf-8?B?SUFjZ1NQbFlnLzZrZE1HeWJmTGJFTFZ4cjZsYnBmVmhnd0U1ZGNBQmk4WC9j?=
 =?utf-8?B?djNxQnRSTzVSVVdTNm82bkpuUS95QUFnQStlSC9lOGlXb1JvaUNaSk5mSVJ2?=
 =?utf-8?B?U3VaMHcySEpPRjBhaUwydGhtWE1rRWVBbTgzamtOaldyeUVzRk9RMEYwcXJP?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c0a581-0e10-4e32-9f9d-08dd39ff0dd1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 09:36:16.9691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOfpi3eqejP51ffFmvjfWv/woqGGT6Jl5XUDnPdwis3mly/LdSLEWf9unkk7h/DLKjTv5+f4OCsLr98c7p1hMXpJLJS2NKDrYa8t3/8I3bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10502
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_013624_921574_BCA822C4 
X-CRM114-Status: GOOD (  12.68  )
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

Hi Lukasz,

On 1/21/25 10:22 AM, Lukasz Czechowski wrote:
> In the PX30-uQ7 (Ringneck) SoM, the hardware CTS and RTS pins for
> uart5 cannot be used for the UART CTS/RTS, because they are already
> allocated for different purposes. CTS pin is routed to SUS_S3#
> signal, while RTS pin is used internally and is not available on
> Q7 connector. Move definition of the pinctrl-0 property from
> px30-ringneck-haikou.dts to px30-ringneck.dtsi.
> 
> Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Considering that I'll request the next patch to be backported to stable 
releases, we should probably backport this one as well to avoid a git 
conflict?

c.f. 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#select-the-recipients-for-your-patch

Essentially: Cc: stable@vger.kernel.org

@Heiko, this one patch isn't really a genuine candidate for stable 
backport as it's just moving things around but it'll result in a git 
conflict when backporting the other patch, how is it usually done for 
stable releases?

Thanks!
Quentin

