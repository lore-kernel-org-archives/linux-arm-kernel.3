Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E14FECD98C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 16:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9lvMkBpH0yvJgfWFfeluLpfixBS0ztTzgH+cj854OI=; b=xiBsmfuknDFesEgsEqjoEKFg5d
	tFvEUp8QGKMOA/gv4QAS4md1LfMX4PQJkauu3G5XvrIifOtIpmmnUJg1kQMB5F8+PFtP0138VU0/K
	29pNl9Iri3UiNcVoiGcv08v/zZptKVyct67Ne3VWTOVPZT9SISjepq4knhF9OwEa+hkoezkRMb96D
	ihZUaNJPj9hNIk+e1F4IGjHo1iuFA7J4aCyJ1/wZD6g41+Iko4EP/ljxvOxudtDs4vKZnse2Tto8y
	qL0gwXQEKRJERvnw8AxWh08PSs37eRgSBUCwWzFMpDxtrv3+cmwBY7HlDWKehxNuHNn4TVlcQqIss
	WxPn66YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo2ZI-0000000AFPT-1qpm;
	Thu, 05 Feb 2026 16:51:00 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo2ZE-0000000AFOi-2NNq;
	Thu, 05 Feb 2026 16:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9+JSg+EdlobPUgui1/AV5CePyxxB6AL1UHKQaY6luKr71Jdx9ozz6FSO8yGj+5Ug5YD+Z2krC4r6qx2YDYh3CPLm7MX6myCVmRxV4wvZcR/fHshXC326mT8dwxLsm802IL+WJj5p1urJ113C3aesn41hg72qqfRuLuL5DlORrr5XfTqRXgMjLVlwDWB9Ryx85xiGJQZKa6m6rhY3sYQlmq0gXpOtQ4VJJZrwD1phODTGMA5Aol7twh4pB9oi+Gd3E3jpPien8yrU7NfrVZV/cDI4AZKSsCOpuWMA56wilfXLLTvfBqM2pthcnt3oE0+G8GCqEqJEr6b0drmoHzFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9lvMkBpH0yvJgfWFfeluLpfixBS0ztTzgH+cj854OI=;
 b=BXzJBKjgAAEbXs5v9dnnV6UJjbtwOGlsRbctDkC0UqD5vZzM0bGBkxr5N4xfZPBeQLj3bfeFFlaRufKqEL/4YckRRvtKL6RqRdy+Ah7BzwcmP1O8sWOwqCgnwKvyHsmzZYiFvuz8OoY0TrH2EnHEFQabxEFJt7rVd/3jUtS76mkAD4FBcPeikzrc0lbYJL3vazGeQoQUSLG458sWX2l0JZuPLg5sbKY7q9QtBQXCv6/WA1oaYjshvhAFk0FJZthgoApi8dB+GKdq9RbBMuQGoj0+XI5a5QiGfqmOPiQTEaQXxBqAqnPycpkl290Cj951GFeNZMh4iEjgQ7f8/yOcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9lvMkBpH0yvJgfWFfeluLpfixBS0ztTzgH+cj854OI=;
 b=ayxGxxu3rBXEPy2w7z/5Bm/Q7XPi+in40UmbT7nuV01Qgmf5PMdgccM4e9tnM3v4IRg9oCcUI+FTmFHmW8FYWd1laIhQbxEwn5JtxXJ+Sve7mC7g44+FqXN5cX96QZ8Qw3s0f9olx2S5FI89Mu0OJciAcVhnPEkcYQUVRQedalI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DUZPR04MB9747.eurprd04.prod.outlook.com (2603:10a6:10:4b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 16:50:51 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 16:50:51 +0000
Message-ID: <c8816ada-bb46-4c15-a3a8-a06dac5acdbd@cherry.de>
Date: Thu, 5 Feb 2026 17:49:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add pinctrl for clk-generator
 GPIO on rk3588-tiger
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260205102104.394991-1-heiko@sntech.de>
 <20260205102104.394991-4-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260205102104.394991-4-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DUZPR04MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f1cd35-91d0-4be7-913e-08de64d6b858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnhNcDRKSW1JcWZJK09kYWt4WVpLNm01eXN6bTB0RXNjYTJFcGJLQkpFSUxE?=
 =?utf-8?B?a0JycHlBRGZDOTd1UzdpcllvdXVkVzNDdEZRWTVTemlYMThYejJPeU1rakZE?=
 =?utf-8?B?WTlaWFdyYmJvcnBLTnFZQWhXUVlUKzFpRjQrRUorSERpbHJrZldvU1RxUFB3?=
 =?utf-8?B?U3dGb3VENERVRFlZMDVheDlwUk1PYWhRZGhUSVJ5b0M1U2dLSHBYanFYY1dw?=
 =?utf-8?B?UjBmekpyV2dxTW91Q0JCTFgzeWZQS0hsRXlydmZDejRNTS83VlFEMTB0YU9G?=
 =?utf-8?B?OG1oM2g3RDlSNnEzQ0RIWGxGM0RXdlJycFBySDF2K0I0TWw4RzBROGNQOUxo?=
 =?utf-8?B?UEwvbzNCb2dsOFdVK0JVaUsweDNmNHZRc1JoeVJaM2hlUmNEdFJEUmQ0dDRF?=
 =?utf-8?B?M0NseXhqKzZ2eno5OHJkRjJGWVJadXJOUXJXRnVOS1gzSzRkUEdDdWQ1UWxH?=
 =?utf-8?B?YTVVZm5MMGtnMnNsVmYxV0tXaWF1bXVHdjErcVlxVndhMkRpTkJkMG8zek9h?=
 =?utf-8?B?eFNNZkpLTmpTVFFjbmxNdWg2c0hrMEUwUlJCRGlFcXoydUVCTWxpV3B2M0Jl?=
 =?utf-8?B?MXp3TzhKRklsMExBU1lYb2xnOXg3eHhlcytrQ3hNdUc3dUZnSnhZTEJGZXJE?=
 =?utf-8?B?TUpybnBVUmZlNUxDNFpHM0huNWtUWkZxYnFHSVVVQjlQS1pZbE80MmVKWDVv?=
 =?utf-8?B?MHZ1SFVZV3diN1drWG1weTFsamd4SytpaTBjdEg0OTltSTZJZDJoS2JWd203?=
 =?utf-8?B?UjJoaUJrMUhGU0hMdHpqdjhZa3hpMnlUYU1DNitPeGEvbUpDdHlOa2oxajJ6?=
 =?utf-8?B?bG5kOFRrT0hkRWhLSHQ2Nk9HdHJsK3BGT0VpVXpLVFNkNmVSanZkbDU0Nm9G?=
 =?utf-8?B?dWg3VS9IaGZkUzVjb0plUnpqUVVXaVZoYy91UlMrSTFEOFB6Mnk3V1RwZ3VE?=
 =?utf-8?B?UlM3czA2dURHT1EybEw4Mk44dVIvSTRHWEkyYXo5QzBJVEpPVU5mN3ROWjRO?=
 =?utf-8?B?ZVNyVHVtbDh3ajhmc1MvcVpSeXp1eVZHUzFXelB0VEpLVllnekxtTmRvRTRO?=
 =?utf-8?B?cEhUSXcrNGVTRWZlTTdsY2ZWYkVXbWcvcjdiSUFMb0JVSnR4cERqOUZhZDNF?=
 =?utf-8?B?akZyZEdtZXFtdEx5ZVJyamtDODFoc3VvQVNKWk5hSnZWbGw4THlpajFDZkEz?=
 =?utf-8?B?WEc1SzM3U2R0UDk4MUdGVzVaWEJaSkFqTXhBVjZaeTlBd2c4WXB4SHdrYnlD?=
 =?utf-8?B?dW5HNEVkY2dKSFhDSytCWnNzL0R3ZFRqNUFQQkE0RXFCbmhwLzlXMFpUdEU3?=
 =?utf-8?B?SWlyVGd4eHZPdnA5OGxkV3BSQ1gvZjNESXBVWFBCaWwwVitLZkJXVUxZNXAw?=
 =?utf-8?B?cUdrdHdSa25jT3RBRVV6UTdwSytSeUxvcUlBNkdLL0tMUUNadlltczJCbG1T?=
 =?utf-8?B?R2N0V2pCMFYxQTFwMTdYWlZ5NVV4SjhvdlJ1b1V1cHRZMHpzMlBHbnl5OTQx?=
 =?utf-8?B?aWRZUnNiYWhlc0NaMytOeUhTS1hFMitaOU9rRnR1eVFxQ1hIN1gvQWF6NzdI?=
 =?utf-8?B?RnZqUnE4d2J4U1NkVm9kd2E4WTc5TmdaWEZaeGNRcWtUcFJRNDgrVzQxTGdS?=
 =?utf-8?B?S1ZNWlhnWmErampGZWk5b1JleGJSS2FSdjY1OHRlSE5vdktBeU8vU2NEbzly?=
 =?utf-8?B?WWJQZWYyMHdVdWQycmJuMnpLRGgzTXNrbGdXREhrRFF2UVdxSGc0OHBCZUpU?=
 =?utf-8?B?blN2L3FMYkFGOU5XZXpCT3lrT1dEUkZmekppTElKbDd6Yk1kZE1hTS9XMWpN?=
 =?utf-8?B?U2l0bWNWaUQwT1AxcFNmY2tPZ0pwRXEwTFNCcVg5d0Rxb21lcnpPT3FubERT?=
 =?utf-8?B?V1ljNHYzMncyeUVrV2EvdjgzY25oZWhGRFk1dSs0cTIyZTB5TEV0TjFVRGUw?=
 =?utf-8?B?VnQ3elVydXp4cHJkN0drd1d6VHlDaVFFeXFkWTBOaGRIdTVGTjNVTWFHZ3hp?=
 =?utf-8?B?dHpEcUlJeENVQko5NkovNnVOQkpMYUNEYWNNSHlWNnN1dk9mbXVyWS9VaXBU?=
 =?utf-8?B?Zm93RGdZZDMzMHJ3ZStYZ1lpeXZnKytsR2RZeHlybnIrSzVjOFBya0lyS3Zv?=
 =?utf-8?Q?5u1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGpERnQ3dXRCUExFZFp4MmZ3NENFRGRibmZEQjkyaTdINy9YcGJaZE4zWWF1?=
 =?utf-8?B?OVF4WVI5ZW55a2pTL2VCcFI0MzRLb0lDK2pJSFNNbm1IZ0V6S2RQRU54VWE5?=
 =?utf-8?B?QTZocEFSdjdpM3d5akJidW90S2RTdVVwc0M4azZlWG41S2JUWWVlTW9uMTFx?=
 =?utf-8?B?c2dSLzVGYlBsK0thWGd6bmltcHI2ajZmLzQrOVpIUHI0S0dRd2c2RExlODdS?=
 =?utf-8?B?UG1NSWJqZEk5NDd3QWxublRRMDdteXNJSFE1b0RnZ0pwUmxDZjBJT2JXU2Fl?=
 =?utf-8?B?SGNpV21MVFFFYlJPaTRjVUY3WHA5aE1SMFFRb0VoV2c4aWE4aitmVUpsNXdi?=
 =?utf-8?B?MWFOcWoxSzlBeHh0bytDVTV0YkRZLzdpb3ZXaE81OGdtSzFsdDZWZXQza1Zo?=
 =?utf-8?B?OC9jQ245NElOK2ZqRDUwMFJoYTE3U1JHZjFRYXNzaEhwOVM4RVE5Y0pNN2pq?=
 =?utf-8?B?aTRKbzFidGo3Q3lSWk5EZmpCV1NLQkJCQnNXS2RKTkc4WGVVREk5a1VGelNI?=
 =?utf-8?B?cDQ5THFUaXhFdHFORVBGRVljRTRTNFZubGRDMGQ3emg3YVFpdVA0RXNlRjZR?=
 =?utf-8?B?eDZBRjdqYWE1UldGeXRIaE96djdQWUtXaXR1QUk2cEdXWi9lT2FncHJvS2pp?=
 =?utf-8?B?aEJ4V1pvdndka09ic2plSzVaZ0NpSE15UVRud1BIYTdZRlZmV2daUzBWNGh2?=
 =?utf-8?B?TkoxQm9aN3k0d2lrV1YwRmxxVmJnNlFNY2prUXh3dUdLY2dINlFodjFRbThJ?=
 =?utf-8?B?S3NDWXFMTWphdE40bHJpOW1LQVFSQTBjSnRONUlaZCtaZlUyV05lbmRGNXow?=
 =?utf-8?B?TDBEUHFTOWtkTGNzL05CSThNWm5wd29uOGFaSWVEaURjeWNidkNQZUhpQlFs?=
 =?utf-8?B?UW5PaEd2ZmVvaGVRT3R6WCtmUHVoek1XdFZnUmJDNFhRRldEU1Q2dHBzRE5u?=
 =?utf-8?B?M0lUTVVGUktBWkViMkswK0RPRXBVVENXYWw2aitzNDlnWXBhYW9wdWd4eUhn?=
 =?utf-8?B?ZFMySmZWMDFBQ2ZLL21KMXp5bGVybXhnZmpKTlFLdGNMamRtNXdTQ29DSlhX?=
 =?utf-8?B?MDQ0aXA1Z21GUldzN095NWs4d3dWeGFJWmZLMmZHVGVRamN2MlNFY29YV0ha?=
 =?utf-8?B?YURNWXVNRXMrUFg5THZyb2Vtd2tQMWJRUU8rSytrWlNCZE9kTmk5WDVkMXRE?=
 =?utf-8?B?YklBeUczcFBkMFZEYnhQalJjY3Y2OGU5KzFta0ZzTEdpQU0rQjFod0Q2SytX?=
 =?utf-8?B?RnJnY1dYMVdaQzFoMnZTOWMxVXEzMVBNLzBVdkdLWDJwWUMzZ2xwYWVMb0pU?=
 =?utf-8?B?T2lPNnBSS0JTTmpOTEk5MFh6VUFUb2xIOGNDZVFxYnRJVW91eXZHZ3JMaktC?=
 =?utf-8?B?TDhMTndvWGxvK3FSVCtPWllsVWFER2o4Z0lFZkt2Ym92ZGo0c3V2YkwvRXRp?=
 =?utf-8?B?TDFsb0tuQVJaQlpFMXZwZk9YU0NvdUYvUnl1T1psK2ZLM25kK2tqME1oeGNi?=
 =?utf-8?B?L1hJeTd2cDJoTkFIOGw5WmZ1ZHMrZmZkNUZtSm1sUkdkQnpTVzNydnIyTVBT?=
 =?utf-8?B?dis4WXA4NDcxNjNWaTM3cGQ4UTZVWk1xa0hPL1NDQ1djUW1JL1MwT3hPZzFD?=
 =?utf-8?B?K0UxZ09UVVNPNlB3cFBtY3hLVGlhSzduVEJ5OVdueWFaSXFjaWFPR3lVV0RX?=
 =?utf-8?B?NDVjZzY3RmRQb0hLaXR5TXVkakN3S3crcGxMVHNZajVvaktrNFZmTTRvZ3Zm?=
 =?utf-8?B?TnNJaERBQUxWVFphL2RTV3E3WHhMNnE1SE9HbHhQTG5MNVVPVGRBSUt2ZytL?=
 =?utf-8?B?bDVSRnZra2R0b2VDVHBnK2JIWmphSjJLTGVwSERqellNYzNOMnN6TnBuS3RU?=
 =?utf-8?B?VGM0bWd4bnlaWTVKYWdkTDkrVDN4blc3akJ5SXhIa2Z4VVF3ZGpFb2VLbi9v?=
 =?utf-8?B?TmVJMTFUQ0dFRElJT3JQTzJSV01WTStBQis0OUZJMUpXdjhZVGtKM0hlQi91?=
 =?utf-8?B?WUpUMUZUUS9WaXVrTVVKK3NVUHpSWU1ob042Z3lHUyt6bEVLa1VERXdOSFVv?=
 =?utf-8?B?RkVCWnh4TmpsbEd5UEtaQmFsS0dBOGV6RWs3bjQ1VGZGQ2dKLzVlbTIxaVBM?=
 =?utf-8?B?RytlWkZRTTFoeXE2TUJVdjhwdnZrNFhpbVpJZGk4TU9YLzhaY3lRSTNIMm9k?=
 =?utf-8?B?U3dWRVJRQmFraTZ2TWVVRFlENXI5U01sM2NCUkRiRGMrQVFpTjgyb0Y1Rkwr?=
 =?utf-8?B?UW9OcUxVd1M5cndXa3pUKzJkOVZPcy9hZk5mOGV1WWVNaTEyZVJ0Zmo0RmJK?=
 =?utf-8?B?RUgwdWdxaTExZWJCT1IyZ0lnK0xqQUNISmttQU8vWlhPNzdjTS9Odz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f1cd35-91d0-4be7-913e-08de64d6b858
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:50:51.3401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYmxJw0sYAK4FtLSAhTdlhn0XdPU8LVMGOhAB0aqIdzuCOkc2/jMFM7szI9c1YApcbYoZ/qb4w3q048c9P4VD+qfwk4o1PpeqJSOrvFkAHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9747
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_085056_704053_B9563BC8 
X-CRM114-Status: GOOD (  18.77  )
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

On 2/5/26 11:21 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> While specific driver in the Linux-Kernel handles GPIOs gracefully without
> matching pinctrl entries, this might not be true for other operating
> systems. So having pinctrl entries makes the hardware-description
> more complete.
> 
> The somewhat similar rk3588-jaguar board has a pinctrl entry already,
> so also add one for rk3588-tiger.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
> index 259fb125e13f..91057b166690 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
> @@ -58,6 +58,8 @@ pcie_refclk: pcie-clock-generator {
>   		clock-frequency = <100000000>;
>   		clock-output-names = "pcie3_refclk";
>   		enable-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>; /* PCIE30X4_CLKREQN_M1_L */
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pcie30x4_clkreqn_m1_l>;
>   		vdd-supply = <&vcca_3v3_s0>;
>   	};
>   
> @@ -357,6 +359,12 @@ module_led_pin: module-led-pin {
>   		};
>   	};
>   
> +	pcie30x4 {
> +		pcie30x4_clkreqn_m1_l: pcie30x4-clkreqn-m1-l {
> +			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;

So this is interesting because it made me double-check the schematics 
and I think we did a mistake on Jaguar.

This one here is fine as this SoC pin is connected to the PDn pin of the 
IC which has an internal Pull-Up, so the state is defined.

However, on Jaguar this signal controls a transistor and there's no 
external Pull-Up or Pull-Down between the SoC and the transistor gate so 
we probably should not have pull_none for the pinconf. The default reset 
state of this pin in Pull-Up so maybe we should go with that such that 
there's no difference between the reset default and the time between 
application of the pinconf by the core and asserting of the pin by the 
driver. What do you think?

As for Tiger, this is fine, so:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

