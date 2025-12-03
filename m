Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3CFD12694
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGAzHIVfl9GskhsEtOXNqmx8yUNRoqyHS5Mwx+o/gpE=; b=3jwkDWaTV+8TbH97TKKNY/H/WZ
	YG+FSBapWVvef9kttxYtqMq0Qs7HB1ti32L68fTY4h7TAV29KJ0KpYsPiuELfUP4xqwvvRDRTyMO7
	EEN9Xl8bWAqqX8pYzsEDmBoIl9rbbjTKa8gaUD2SibtLy2okGArGiwqsuwrufGPDNJL2nK60u13RC
	moRjoXUP1oElpndMbvCxVDqwWAKznBTW1VnpRQJTj4yz707q6biVm0s+TqOMPHElpBLH/Dd1kv75Z
	7w9weToS5+m5aRmvJY+Yz5dx32s8qgRFrvPTFVvHVGoQI77TFh3KR4kOOB9UQvC20RCc3z4uS8aLx
	rTbwY13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkEB-00000006SOb-3pra;
	Wed, 03 Dec 2025 10:36:55 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkE8-00000006SNp-2a3o;
	Wed, 03 Dec 2025 10:36:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGWa0bbfCGNEQdMVhTE0ginYqhGAaVQCgQVAviz9VfgWKpAoddrrw1VnSHmw43gUyOlBNDr31o+32bqHqgv1kQ+LHP3waSaNygzbLM0DITC/oP1rP91LMZDRzYrU+ebV/uroHLw89DTwjIfSdLtESLk9xxYXSldSdAt1bKrp2cdyAE4hLtOs/c055k9xKdzzHtAHdYR7ZLDHmR4Wg0lGdy0ZZFkemhJTUY95bMeKOUTJbYe1kb1NEuGqgB820PIi4OW4jqie4yxc5bq+Z7NwXnQI1gLMYMNvQq/l/1qbNYgFEZd8NU0R2Zrj65pAxUnzInhAFUmRY6RD//eohhaiow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGAzHIVfl9GskhsEtOXNqmx8yUNRoqyHS5Mwx+o/gpE=;
 b=bs4DbDUAbOxReeoBUPHGXL4hXfNqk/5VzrbcaxaCfTGmkpue08D6R6keBm7pQoNwMdE+w8N5R1s000yGNTd6gR9giDV07nxpo2d9xZG4KtdpvE3YnDy2yyTqRKRMlLIyTqx5d29mn2y/+f1Ar3a1+KHMUUz4WT6TbYhZPigKToU6a6fZEnREQK+ozxMmVA3LdY95bc5QJzIDGJSXxYdE5vM/6WOPAQ4jLA+gC0zZNETliYymK/9Tzb3uqjc0ISiB6toLzvXvhQfbhTdDFn4kFH4MR+ordYbvWWiDsxupAHbQDZkuRSmiRkHiMxgOSoXNqSmtW/Mt/EFWyJ4C/s9BfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGAzHIVfl9GskhsEtOXNqmx8yUNRoqyHS5Mwx+o/gpE=;
 b=VNNHScURnLRLlFMYHWvQhqXQkfasAJeD30iSElUMk/OiUjBO3I/gNMgn07ILZD2uFo74gcFjH2pWr+ppsSraTf5BB8G2i37MGGjDOCi11IfgUR7fvLDS/JQ4NEqYMpcXqHVoJ/n5vd/U9ioFIxO/WNeYvnD5jB/QA4Y5PXQi3yI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by AM9PR04MB8537.eurprd04.prod.outlook.com (2603:10a6:20b:434::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 10:36:44 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 10:36:44 +0000
Message-ID: <66560f3d-dbb3-4c4e-a46b-8e2f604d53ed@cherry.de>
Date: Wed, 3 Dec 2025 11:36:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: rockchip: Add the Video-Demo overlay
 for Lion Haikou
From: Quentin Schulz <quentin.schulz@cherry.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20251021074254.87065-1-heiko@sntech.de>
 <20251021074254.87065-10-heiko@sntech.de>
 <ae0d2de5-4fc8-492c-8d46-8d90118c5e64@cherry.de>
Content-Language: en-US
In-Reply-To: <ae0d2de5-4fc8-492c-8d46-8d90118c5e64@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|AM9PR04MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ecfac6-cb7c-4314-a082-08de3257da85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVR2d25HbDdoelpaSEZpa3FXcXk5NGJGSXJNZm9vQ05wSGZJNEtnd0ppUTFI?=
 =?utf-8?B?dldZbWZLQWZ0ckZpbVNmOS83RVJFYW5HbzNjQmJHSVZNWTMxUEZ6ekNZL1Rj?=
 =?utf-8?B?ejlKSWxMS3dFTVIwTVVIcEZDbGt6L25zNzdXU0RKYXpHUVZZRXIyRFR2ZU1r?=
 =?utf-8?B?Y2JYdVNoVzlodXA1Wkx0bkVES3RWdXV3U1gvRitSRHVmSDNSZjBhd3RSZFZV?=
 =?utf-8?B?eVRtQ0ZMQWl0elNEVnZIWWI4MERjY2sxZ2VzNGZ4ZUZYSTdtWWdHTXdMd3oy?=
 =?utf-8?B?TlozcWdPb05jRzErOUZYNjJHUzBJZHRlcGp4YXhIRDlvNGpiVkEwSVRITUpz?=
 =?utf-8?B?NTA0UWtHWUdSRUxDWityNnhxb1dTbndVTVJGQVhtOU4wR21HTnJEYjJybHBP?=
 =?utf-8?B?dXFQNStPV2RoRksyMklpdlVacDFyd0dBTkpGL2VVd0pZMkkzSytFUWRIOXpO?=
 =?utf-8?B?blJ0YmN1Y2FPYU8rK2J5UVJUbmc1a0JzeWlLMHNULzJjWithclN6ZDJhdFdm?=
 =?utf-8?B?TzZaSzkvZ3ora2hmNCtaeTkzcGxCR3I1Z2k2UXBVa0Z2R0FHMW80U2hWVk5w?=
 =?utf-8?B?K2lyMDJ2WThIMUtyd0xpWDBrV25aVUxtajlCUGlJbzRtVjdPYnl4Z3dQa2JI?=
 =?utf-8?B?ZXczaytDdEZSdkxxMjBJclQ0dURKUC9xUm5wWittOUJKdFM1bTY0L0xLUCtC?=
 =?utf-8?B?RXp3TXBIM2pHazMydTNFMGNvc2hUbTNnUExqdzB1RjE3RllPcmlUeG9YZXlj?=
 =?utf-8?B?VE9SbWpiOElob3lrc1kwMTZERHlneFptaEdzVVlreDdsR0wxa3F5ekpPaWhI?=
 =?utf-8?B?ODNja1FoYWZvQXBlekNyYStRVGFzWjdhdTVkU1Z5bGdRN0lUU0tJYXJDOFow?=
 =?utf-8?B?TDlqK3pKcVZ2ckNXUGljN1FCTkJmZGR0czYyRW9mSjY5QXpzdGtFWGZCckJk?=
 =?utf-8?B?b0ZkVitpWXJxaHpPcjVkVXJUR0NuR2NabVZOZmUvR0FNbnppYloxV3NGenph?=
 =?utf-8?B?ME1BcUdvN0t2Umh1dWhsald0SkhUQzFIL2paUXVJdVZ4YjZOM2g0ZzFkSVlB?=
 =?utf-8?B?UnNPUWJYTDBjZC9xKzJPNjRCNUpoYnRzZE1vYnJBUjVkUGNJcE52aWRhUzNU?=
 =?utf-8?B?Q0FqdnVxNEFuaEU1c3o1RW4wa0ZrQjFHdXlFYzdSZDFjSmJ0dmFyRU14RDB4?=
 =?utf-8?B?dG1pem1mTG1CTFFGMEhWMVRMK3lsVEc3SzRnNFJYVHpKQ2hsS1Y4NG9oaDlU?=
 =?utf-8?B?ZUVyR1NnSDQ4bHZPWmFSaFZodnVQdVVGZnRDRCsxelNWUjNHb01MMHhrWnI1?=
 =?utf-8?B?STJZdmU5NkQ0VEdBZUlhUlNSK0FqZlJ4M1JNZ3N0QTZXTERSTkYyQnZrS1lD?=
 =?utf-8?B?Nk5Qa3h5dnBNVHBDdTVsZi9sVGhTUC9LZnZxNDlWc1J1MWVDa3JzcStIZ3lJ?=
 =?utf-8?B?MW1UT09mM21pZUM0bFZSNlRJaFVZRlNlU2pJaTBzWTRzeEk5R1RNY0JQd09n?=
 =?utf-8?B?TnlTM1hnVFRjSmxrY2lMcTFUMW0rQ1JidkZzbEpHVElnY0REL0pIVWJzMU1h?=
 =?utf-8?B?d2puU3hDN1pZbmE2YTFMTTVCWmFkZ3VtSkI0Y3RoYmJicWRmUXVyOHNsWkZu?=
 =?utf-8?B?TENBK0EzUFhMNjFNbUdZRm00SzhtY2N6QkRkaDBDTlVXY3BpODJZRG1CeFNx?=
 =?utf-8?B?TDhUcEpmQ2VoZ3BRclp1Y2ZwYmhBVWR3U1o0R3ozOTZDYi92aFd4b3Jud3Uw?=
 =?utf-8?B?UFoyNXR5UTBlUlJVVEcyU1o5TStweXN3WTlIVFhYVWV0ckZRSHF2akI1RjhS?=
 =?utf-8?B?SmlkUTRxVFFUSktzS0NrYmYzeklxamtoSlRGY2FXNXNNWmxVcUF6U1lXSzND?=
 =?utf-8?B?di8yUDZtdXZRWWxEVUIzVFJ4czBtb3NJdE92R2cyQ1lpeVRXaVJ2elBndSsv?=
 =?utf-8?Q?p0F1/3AL9bY+bsyADR8ZNPGqxZSfkxv9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d093WUhWUDNTRmV4VCs1OVNTVWsyaWNUNFQrODJISVRaOWRTQnMzZjhTcFo0?=
 =?utf-8?B?VWJzMDVSeDgwRWkzR2ltekd2M1p6UTNqMUJjTEdYQnAxNVRyNlljRWc0bkQ0?=
 =?utf-8?B?MXZBQkkyZ041WHJQbE9qOVl4eXgxR1B4TmNhVEVxM0dCQkR6d3I1RkZLS1ds?=
 =?utf-8?B?dUFMMmRuRU9NUWtOUlJLWWNKdFBvSWgvRXBSYUFGTVBNRHMza1hqTGxGUXl6?=
 =?utf-8?B?cEN2OVRISlhDUzk3bU0xSld3SVR6Z2xWZGc0T25XZ3Y3WldERFg4UUNZdUZM?=
 =?utf-8?B?S2lkMVB1NDJLNVFlTVQyeG81dlE5YjBPMjIvNG5hZnVxL2gvL01TWnU0NWR5?=
 =?utf-8?B?eHVPUjRmakN4bDBLQ3lSbk8yc3dvUHFlSTJUZVcwekw0bkJKYlVpazU3N0NL?=
 =?utf-8?B?eTNNRkI4V1YxM3IxWWo4QU1hRW0vMEovTVE4V2VtaWxKZXQ5K2Q4OWVsQUNq?=
 =?utf-8?B?dm9LZkFmekJGODZXR2VOd0VqNFA4aEJmL3ZNYVd5b1Q3SWlWQ1phMjlJRHlS?=
 =?utf-8?B?d2NvZlZrVGJReUpmbUJIS0lrZ1pEWW1XYVZkTTVmeHBRbEhLdjJLRzAyU29p?=
 =?utf-8?B?NW5wOGNYd3J0WEtZSGJJNlU4Y2dKdktkU1FBZW1BVzFjM2F2NlRjMHE4aUlv?=
 =?utf-8?B?YmNhbk1LbGhXOEUyTS93OXpMTVI5K0V5MFhoNWRETXJ6L1F3SkdUcFpSRVFh?=
 =?utf-8?B?dmt3cGg4M3lPTVgza0g3RlE5aWZscS9hdE5yeTlzMWIyMG9hMHBEYVhKRE5L?=
 =?utf-8?B?WTNtQnIzTmdjQnAwb2hCQlBpODFSM2dnVEtNLzdyNUlQTzZrKy9SSUNncTYx?=
 =?utf-8?B?cEFqL21UQTVEeHJNNVcveGJOYTVZRVRhQnF1NVR5MGFCNGRrNUFnUmEzcTc0?=
 =?utf-8?B?YURtNVFjbU9BcUdGYlFmcllHUC83WThoUjN6MElOWG10cGVEUXBrQ3d3SjdO?=
 =?utf-8?B?QU5JUDZGNzhqM3NXNFgzQ3FYQXE3a3BrMCtEclA4TGRCR2lsNVdFR3BNSWs4?=
 =?utf-8?B?Y0NtTWw1UDFpNENMdWZYbWJFRnpHeDN3YzA0L2pmMDd6V0kwTG9wSm16OXJD?=
 =?utf-8?B?SUNOMVl5NEdrL1haMUxjK25CQzFUb3JLOVNUNGhvTG9kcUQ3UUpNcENJeFVh?=
 =?utf-8?B?Sk9ZZ1JoMFJEdU53T25yMFVab0JUL2RrdHBMSWJYSFZNUlBMd1JUd2N5L1dS?=
 =?utf-8?B?U3gvVDZBbThZSXVxR2ZWQVUyNHEvSnVTbTJFazVsY1ZZcEVEUno5QXNuQndT?=
 =?utf-8?B?MjdOdnQ4eW4wanpVdE0ySnJ2c2xoQ2NDbEF5cE5RblBDajl5OTBsdWFZcDdv?=
 =?utf-8?B?REVMRHdiT01vNWdSTW1PTU1CUWF1ck01M2VWbElsQUlNV0xUSm8vamNGODVx?=
 =?utf-8?B?STVjclE3alYzNUduUC9YZGxRdDAxZkZvbjlNaHE3Zjd0bTRGQXVlZmN1L1Bt?=
 =?utf-8?B?amdQTWpMdURLcWhnUXh2TFltb1hKQUhhMUFtbGVGWGcvVFNEcTB5cW94SG9E?=
 =?utf-8?B?ZTQ4OTZ6Q1ExMVpvMFBRdldscUpMalIyNVpjc1pVeDFrNkVpZjZIZ29YMEN3?=
 =?utf-8?B?dXBRU2J4UVgzTHFtcEdGNkdRUWk2c1YxK3B0MTVrdWloNGFCU1JkVisvWVVw?=
 =?utf-8?B?bmhtNTArVEpjOU03K2xrdlpaZk9nOXpma00xNW5sVEdpUWhOdTByWmpRTS85?=
 =?utf-8?B?MVhob3NYSkltSTRQa2pmT1hiYmsxQlh6dlBZcmZjWHU5L1lhOTBqQ25DYnNh?=
 =?utf-8?B?YXBKaHQra204aHVxL0VjRGplMFh5ekxsYituNU9lcExxRmdRclIySGdEWEVz?=
 =?utf-8?B?cW16MEtlS3hJWDA5R01tRm1HUldnTDBNTUhsVzdvdTJYUlF3YlNZZ2M1LzhM?=
 =?utf-8?B?czljTjk4ZG1WQ1BOeXBKM1lOeno2OFNKelV2bEh4bitsSUFqRE5acXZ0cTVu?=
 =?utf-8?B?SFlreGVEK0wzcEtYSDA0M0FsSUFpK0R5Z3ZDSG5zaWNYeW1qQW5OTkVOVGl3?=
 =?utf-8?B?UXpUTHh3WFcxOVJWVnpGRW5vS1dDNjZqanhRd29YMzZxNTRoenF3aUtPdTd5?=
 =?utf-8?B?MG8wOWVSMC9tUFMxeDF2QXpJaDQ3S2JncitmMUQyNEdES2N0TldpanNPTkhH?=
 =?utf-8?B?M0l6Ym8wRWxjUndnMERPWDA4TkhZd1cvK1NzL3RTN29DQ2JTWndkbjZXQ1A1?=
 =?utf-8?Q?5odkW30rQhiMHMEtO6DY+es=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ecfac6-cb7c-4314-a082-08de3257da85
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 10:36:44.3948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTjq2Qu/P96ZpxNWJLcv8/VAShcGAJw0odaLsGJtZJLnAnzHOcw5I5xAveYvzkIuz+tRDlVG5zUkkGXanJ4pXrcOfx8WTmsT31JpJEmSuG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_023652_699903_CE034E98 
X-CRM114-Status: GOOD (  14.56  )
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

Hi Heiko,

On 12/2/25 2:37 PM, Quentin Schulz wrote:
> Hi Heiko,
> 
> On 10/21/25 9:42 AM, Heiko Stuebner wrote:
>> From: Heiko Stuebner <heiko.stuebner@cherry.de>

[...]

> I have not yet managed to make the DSI display work. It is detected but 
> modetest test pattern doesn't show, only blank.
> 

Seems like it was a classical case of PEBKAC. Haven't figured out what I 
did wrong the whole of yesterday, but it works fine today.

> Since there's only one VOP, I'm also wondering if we need to disable 
> HDMI here? Or is Linux capable of handling multiple connected displays 
> but only use one? I've tried to make DSI work with the HDMI controller 
> disabled, it didn't change anything.
> 

I can display the modetest pattern on either DSI or HDMI, when HDMI is 
used to display the pattern, DSI is not showing anything (it shows the 
console by default for me).

So no need to disable HDMI in the overlay with the DSI display.

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

