Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FB4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gi5niZ3O9MtgQ+u471zH+vJ48RDUBXUQA+9NX3J9Kg=; b=cdgnMJXzHvM7vGDnZdBAAvEGDb
	tg0qHj8Vo13XdFpgS/qlLPJKvAmmbEoBGTdhqTCxXgqArWohurEB4T8j4eEKnwwW4Z1z8PBwjQJhU
	3C1xNBpUbgD/4BUXdNQHvygI0418IwB8YT6o/J9aRuaycuJ8EJH7I0ub22swE/Iwr4z2854rVsy0z
	MfAAeP9yo/sA/UsgpV/dxkSW0EpsltWZA0ykyehWozLFqmxBVeUXY0jVlhuaiEbOB+D9F7AmHTrZQ
	7b3cbLetfXkNo+3Zpg8Jl2BjqtQoWi8JSsxwBXcJzcLXQtuyIW3Hh2zARijnXdiEVaFbwPY7PcZyP
	S5BWLkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXb96-00000007erp-0cAv;
	Tue, 14 Jan 2025 07:15:28 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXb7r-00000007elF-0TNq;
	Tue, 14 Jan 2025 07:14:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOI3BRq02JZqz3B6t10mMBJd3rF72n4j4zTN9eMSyixDrGd17ZN/TmlwvjtB4KlGdASYJ2CdgZIHOXl9FzhZ7fm+EDvfHNNJwzEdCIBryAZJj419pA/X6ftMO3FM7ie0woVHBy6qx5I78R057N7EwpywXVWrAOotD65tijm47OLwDgOJANMVkiMPJO9iSnYoTX8T/G0OSaFYqNx5M8ZjNYV9pK+UPdn5mBafPhB0wAUDRZfW9YV7wyqtQtynCJrADnEwNCRH/u33sqUwjjQPyhnd1Bl9rTKFfOOUplKn9E2hirXVaXW2pc1B8PCqmRoci83iSSE9l6zuaCCe07e0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gi5niZ3O9MtgQ+u471zH+vJ48RDUBXUQA+9NX3J9Kg=;
 b=UreBVq3FB+wFfscxkdhK+gqS41/7iY7dEwYJXSWJcTqYUfNePIyDu51+yYsiPmBROOPu79XBMASYwUtAZTWmkZcC5MQRUlXsHfnZkWpsflGWVHtzWRRxcmvxFgZET5PGgyIvJI9qJWGtOm7AJo++3kk6fMo1pD6dpfS+RqfwPegKIxW9Y6gc3YleZIN6q4WPssxHHf7MaEIQBAUVlyS96ODQfxcdpil70vNmvHvlaKVRLOkhfK2+0krQxYQ/SKYVPnYVEF8DerWm4Hm/Tl+nPuepqxNXokuFc9YKybRH1dEsY3BNCaE+QOiMkIJbjRT+uTZsqSIfWBkLw1dqA01HDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gi5niZ3O9MtgQ+u471zH+vJ48RDUBXUQA+9NX3J9Kg=;
 b=yLH3qIxFmNSZoi6ZrzI7M6/pcSG5mQDbXMH2JvHYKI6HZLQ8iFK6FZm0FjWKVgAxGNfZFwnipNFEBdH0PDOSaVARpEaLcNSiHcUMjUc2b/tTNNQtsUwsvaN8Jq8EIDOieHemeBCNeu46yJGyAxfFGZhS85qtvQkpU2Y35zq+6Dqs5pAtRld4Pm6JYWKstJ5s37nQlK51QOG4lXSxflmaYxCa7aqPEzBrhGDtuW1va2HSVpxiUo4l4dbT/vYfdutkmwdZO/I+NWs/8zqTt4qDg1x91s1bzKNy059LQVCiUOgFJSMXaZrRLPpINpGKuoy+YJ25+vZ9KYwe8+/cph78nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by JH0PR03MB8351.apcprd03.prod.outlook.com (2603:1096:990:49::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 07:13:54 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 07:13:54 +0000
Message-ID: <aa5a47a0-8944-428b-907c-c88fa169f841@amlogic.com>
Date: Tue, 14 Jan 2025 15:13:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: amlogic: c3: Limit the rate boundaries of clk_hw
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
 <20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
 <1j34hqai39.fsf@starbuckisacylon.baylibre.com>
 <2578a79d-1e24-4336-9859-e384c8f69269@amlogic.com>
 <1jr05693nn.fsf@starbuckisacylon.baylibre.com>
 <af501f2e-2dd6-4182-872d-76260edba973@linaro.org>
 <1ja5bu90jb.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1ja5bu90jb.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|JH0PR03MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d260ccb-84bb-42cc-aad4-08dd346b0108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWlFMU5hcVdaeHFTZFhJd0Y2OUFhNmIxejloRVJSaVR5NHh2cVBxZ2ZPUzkv?=
 =?utf-8?B?Z3dDNjMrelg3dnZ2d0plRDNBNVJSQ0hPdTBYejYwdzhZb1BuMFhGK2ZJZm82?=
 =?utf-8?B?Y1cveHl3MkltbjNqYW43TDNhNTZvSUJhZlVTOUxHbDhMNVNWUU8zdStWMS9Y?=
 =?utf-8?B?M2I2M2o4QVNESU9JcHVmUzFNSC81R0MwNjdWTmlvbHBvZkJIOXhHQTlqZzJ3?=
 =?utf-8?B?dDdpN3h5aWJPQ0ZERmx2bmFiTHE4ZEp3Mk1MMDNzamVQc3FCbHdiSkdSVnRK?=
 =?utf-8?B?bWVIL2xZcERjelFCbXE4eStkSVlGODFSTE5NeDNhVTcxK09EYWpTL25iL0do?=
 =?utf-8?B?b3prcDNSV0ppUjBCcHhQU1RnMkt1SW5Ka3RmVUpxZHFUS2R4bDhCcCtnTXVL?=
 =?utf-8?B?K0RZRldpdHQxeGQrSmtINDcrazY4elQrWmVpSWdLdDd2K1lkQ0UrTjlKNSt6?=
 =?utf-8?B?V3daRitMaG9KVURZSk9BOTR0Y1ZDakZPN0xhWjB0bFZOaVRyUlBMQjA2L2c1?=
 =?utf-8?B?L1pxdENJK0dsVGE4cFh5bTQyYlEvN2VIZERVNFlxTlRmL0k4S3h3ZnVYZ2pX?=
 =?utf-8?B?ai9EVjdhMnhUTndMUS9LdGxIUUR0T3p1UXgrNTBBYzMvRlhlVXZtZUhqNEkx?=
 =?utf-8?B?TUxCUW9tbkZ0c2ZkOWZ1T3NMcU1qZng1Q1ZtLzlXbjRlOWp3eDhNem1KTGNN?=
 =?utf-8?B?S1FUdC9URHMwb0Jlam1XZ09iTHNVZ1FNRlJhNzdia3Y0cnU0dEdaRU9kWjZ3?=
 =?utf-8?B?UjFQdVRGSGlaamQwa0Q3aWFUNDRXUVZldHJuRmtkcUxyRnNQaHFaM2ZuUGJw?=
 =?utf-8?B?NU5YMzJVckJoVTZ2RFdmZm9iUDBNc3h6c2dnRmp4RmZhMFU2SXpUdjdMR3h1?=
 =?utf-8?B?R3hOazNrTmlRQ1pNQktPU282VHI3Z0VoYm10WE03MHVmeEl2RHdBdGRYNkNS?=
 =?utf-8?B?MnZ5NFNsbkhVS21DUEVCZENTSVdMU3kveGFabWhSOG9lSHkrd1J2eHNWekEy?=
 =?utf-8?B?YmEzRDdac003TVY5bFBFQUE4ZEFUQUJWdVlPMFpCLzVzbkZUZFdpeE8rWWNt?=
 =?utf-8?B?d2plQ09EQmhjZVdUYkZmdWUwZXhwQ0JWR0JMcWlzNG0vTXJDelhyQTg3RHRz?=
 =?utf-8?B?Y2Jmd3hmZUxiOVpuZ1VxenAwWGx0Vys0MXB1U0dxeU5ZNWxiRHBHcEpHVEwy?=
 =?utf-8?B?VGhxdkdGcjl5dEM3alRpZkZQS0E4VEsrWlBxMVBWTE43MUJaU2s5YW1SUjVp?=
 =?utf-8?B?bUdHOWp3YWdaQmVTSGRzLzAzZGpCaGRZMXgreG9mTnlVamFpVXo2KzczTnpF?=
 =?utf-8?B?SWZqZWVuVUg1M3pUQjBVbHpXYW1pOEJUeGRPUVNqNitpOENmU2VCd1p6dUVI?=
 =?utf-8?B?U2pmaHQ0NEh0aVNGMHYxUm9KWnFpczdWdW9Kc3NYT1dnRm5uNjVhTmNzcjNN?=
 =?utf-8?B?MHdtWDRtY0FFS3NIMUpjc056RGtZdmJMSTZNZTRzYS9OOXAzSHhDTXNlUTh4?=
 =?utf-8?B?em5tWjFZcHZqanM4U2o0VEZFcmc2dzUvcW96VkM2QVRBbi9ObDdsb0M2c0Nr?=
 =?utf-8?B?bWI3OElzd3pvTVQyMlB1ZVVwemlMdi92THF5bHpwSThCUjJSUERTd2huTXM3?=
 =?utf-8?B?KytTVXFmSDBDNndQUk1UOHpKMGZ5L1FJSnlZR0J2cWdveXE5bkhmTWZvYUxN?=
 =?utf-8?B?NzhzSTJXSitJNFg4cVhzaWtrZW92NDVvdXVLdkRnZVFsUGJaeEdQK0RDUzFT?=
 =?utf-8?B?UVNpZ0pta0lNdy9NTDRYWjlZQ2dnSThUZU05TVd0b2Z1V0w1dzJnODRHdWpn?=
 =?utf-8?B?QmFwdm9hWE5FdVFqd2VXdjRUbzJVcGVMV28xMlpHeHBEUWE4NmY3bG9UdS9n?=
 =?utf-8?Q?Plv+aE6T/+qhr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2MzWTlNUEMrRWtGOStFS1l2M2UwMTVXTGpJcU52WVg5UnVlQTFEZEV4M1A0?=
 =?utf-8?B?WU9USURORy9mYkhwWkJnbDltWUJuZVcya2tJT3YzTHZaK3ZpSlR3aWtaeDE3?=
 =?utf-8?B?cWhRTjVadTRiVzZiUzIvN0JwN25LYy9sQjBqREpMcWlxTjU5ZHFjWGJRa3d3?=
 =?utf-8?B?SDhjWUlyYmVnNHJRZENjd0xJRVR1aE9UNjJoNUp6ZXFmN012UGc1ZFhPcjdn?=
 =?utf-8?B?ZG0xTnVSb1ZFTFBCamd3SzNmRlE0RTYvcFpFaWtJU0FUaXJtRk1tdlRUWlp3?=
 =?utf-8?B?SjFBWlI4bkxGSTJwR1BzVmZwSW1qNW9zNEcxS1R2Z3NHbzd2VDd4alhNcnJH?=
 =?utf-8?B?MGJYUExNRXhJNWRTNTR4K0VPbm9KWCtPcG9IdGJ1d2NZUFk5YTdlN0poOG9k?=
 =?utf-8?B?YWdMK2dvL3ZFYTB6djdpYU1wWFVoYm9pc2pEd2JEV0ZldzArVHhoWUlEenNB?=
 =?utf-8?B?czdBWHFuY1doOEJNVVllejdwbFdtZFZmc0REd044ZW1PTXpuemFnRVNpcGhX?=
 =?utf-8?B?MmpNSHlQaEFBcXdOU3FZbFJUMkZzVVh6eU1ock5RVXJjRWRHMGc3OFJ0Yzdt?=
 =?utf-8?B?dGZIWnhQWmhwNlR3bGRqcXBxS3JGWnBGTjNWZk1aTmMyaURpZFJPb0grei9w?=
 =?utf-8?B?aHZPeUJxSWs2bDVRRjJLaG55WW51anJTL3czZGJpMlZpZW90TnovOHBQKzVK?=
 =?utf-8?B?aWhxbnBscVU1bU8zMG1XZUdrRnBQazdVQ3Rya2JCT1hNc29SODBUVVZ0TVFs?=
 =?utf-8?B?enI1L3JWRlo5dkVHRE9TMEZHWUxYSTBjdFliOXVyOFAxYndHQVllNkNQdHZD?=
 =?utf-8?B?MmwvOHlBdDBnUDgrMlVTR2pUS1FtaWJQdGRYS3ZyTnlBRzRFZFQzMGw1Rm1j?=
 =?utf-8?B?czBPMS9IMGJScGZ6Z0JwZjh6WU9JbUpQMWNpWEpndXN4K1RwdS9UdmZmaGxW?=
 =?utf-8?B?VW1LQ2N6WGhKRldoRHNhSlpYTmxReXV2aXF1RG51b0VFcjdNYjhpQ01BMmNI?=
 =?utf-8?B?VGZvdnQ4dG11SnNPQVdEVWFid1l4TEVRRWlIOTVrNmtmYUhuL3pUSE1UZHkx?=
 =?utf-8?B?eDVoYS83akVpMHVvdFFWTVlqV3IreHRwQXBzSVNoaVg5d0pzYjQ1YUF3d1pT?=
 =?utf-8?B?VTdSNmFNamEySGtTY0hJaVhya01URUU2ZEJGdFF1cVZNcXoxbENpZyszajJt?=
 =?utf-8?B?NVJWNTRsbDdjRFpRTXJwYWpVTE5kbTg3Nzc1bDBxU0RoVlZtNHdDUEZBS3FV?=
 =?utf-8?B?emZ1TFBiN0FjNi94YUF2dTYzY1U3a2VIY3lBZTFwamcrelVlYkdPd0c0QUZ0?=
 =?utf-8?B?TDBDQitoT3J5TDY1WTdZR0hVZTB6T21aMkRMV3F0ZUJFcG9mcEliUTZmamRE?=
 =?utf-8?B?WUFuMU1SRFJnTHgrTTlIK3FySkJnVlQ3Q0NRN3FCUk9HY0dRd2dSZHBxb1Y0?=
 =?utf-8?B?SlpJYysxZTgxb2t6Z29UWGZORjRLdkJUaWdSOG9ValRZVDM4c3FhaVRHbC8z?=
 =?utf-8?B?WVJyQ0hVdVEwc0VmYzZHZEJNcW5CWk0zY0JMSndDaTJDZDhaS0wxNC9ob2RN?=
 =?utf-8?B?NUxRMXB6RkpSNTBTWmFnazdzNlZPeHZYbDNmOGtZQ3l3ekVoYjAyU1NoSnhO?=
 =?utf-8?B?d3VqNW5GZCtTWXhSL1pONkYxQUEza0FQZStGcnZoYlJhZWErT244WnBVeUZM?=
 =?utf-8?B?eDB6ZWpjdlIyQzBWS1dJanBRTE1ISnpoclNhUG9NelFDVHExbGtaY1FMVzVJ?=
 =?utf-8?B?YWdONHdaTktiWkZ1VXVHUGhZRiswZkN1aFNpajliTEtQREtIZkk4ZDl5NUdq?=
 =?utf-8?B?b09Od0IxYThzNTd1UkhvSnUvT1pPMmVYV3RJcHRqVnhSbVV4MmZTZktZRDdJ?=
 =?utf-8?B?YmpuWVV6NWhzUGdsZjhnUWF0L2lJejBzNFNNVjZuQmVFSEpJRHhzTWNSRDBx?=
 =?utf-8?B?VldHMGpUQ3BPQy94UEV5U2YvN2s1dDRsVCsya3hNTEM1V1paaFVFWHF0VU54?=
 =?utf-8?B?dlpQbVpmSUE4QTBxNndOQzNZSVc1VzRmQ0EvR0pwOXdBTkdEZzl4T05hVTds?=
 =?utf-8?B?U0FMdnV2NlZtd3NKb2VNc2MyZjBYcjhhbmoxbm5KNVFkbVRsZTU2VUpmR0ow?=
 =?utf-8?Q?IBhFBHmEtv+QcknUAj0mqCwOH?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d260ccb-84bb-42cc-aad4-08dd346b0108
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 07:13:54.1433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCm62dY1yZNwADasTwShlfgGIz7BW8FRvINsr67v3RMzQ8QjVMxLXjj7BhiuSdDa1snTT0MnyXZTQ5L80VpeJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8351
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_231411_151386_068C8706 
X-CRM114-Status: GOOD (  19.98  )
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


On 1/13/2025 11:49 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Mon 13 Jan 2025 at 15:46, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
>>>> I think that the clock configuration exceeding the timing constraints
>>>> is a hidden danger that all chips have and face, but this hidden danger
>>>> is not easy to be exposed?
>>>>
>>>> For instance, if the routing of a clock network is close to the clock
>>>> or data bus of other modules, and this clock network is wrongly
>>>> configured to a frequency beyond the constraints, causing crosstalk
>>>> that affects the normal operation of other modules. If such a situation
>>>> occurs, it will be very difficult to troubleshoot. How should this
>>>> situation be handled more reasonably?
>>> Fix your consumers drivers if you need to. Set range if you must.


I don't think it's reliable to have consumers drivers self-regulate.
They are very likely to overlook this constraint. Moreover, when the
clock configuration exceeds the constraint, if their own module can
handle it but it affects other modules, this situation can easily
mislead people to look for the problem in the wrong direction.

Setting the range offers relatively higher fault tolerance, but it
requires adding members to each "clk_regmap_**_data" and implementing
callback functions *init() in the ops of each type of clock (*init()
calls clk_hw_set_rate_range to set the range of the provider). This
seems to complicate the originally simple logic.


>>> Those are not clock provider constraints. Those are use-case ones. It
>>> does belong here and CCF already provides the necessary infra to deal
>>> with ranges.
>> I kind of disagree here, if the vendor has the data and is willing to share
>> the range for each clock path of the system, I think it should be welcome!
>>
>> Usually those ranges are not disclosed, so we don't set them, but CCF will
>> certainly use all those range to make an even better decision on the lock
>> routing.
> I did not say you should not use them, I say that a platform
> use-case, which is what this is, should not be hard coded within the
> clock provider driver.
>
> This is no different than an assigned-rate, and like any other platform
> description, it belong in DT.
>
> We've already seen how these ranges may depend on what else you choose
> to do on the system or even what package a particular SoC variant is
> using.


That makes sense. The information I have doesn't make a distinction,
I'm not sure if other manufacturers do.


I think it's more controllable to converge this clock constraint issue
within our clock driver. Should we implement this constraint in
Amlogic's clock driver?


>
>> Neil
>>

