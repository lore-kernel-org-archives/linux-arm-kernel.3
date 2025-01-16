Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B23CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 11:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxEdmQjQzXxuuQs5EB5eCtKFKFvgIUvi4fhsAYxgl1w=; b=FWC7gdnigIGjJXWWU/OO0rYlon
	zBPsncEuJCZM0VZKk8W4rNR8Op9k8M27EmZ6QPud+tyRicidRetMJgxNf8BwjgxzjIflltzeuVW3O
	HNGDDRdGHRuyXiZHcWFvIQp7Zr+oPVrIi97Q9iP1cZXsvBZTB3YT1sKHMyAAjJtXaor/5+Y497001
	EjIXXIjz4+yy6t3DvyCbP2Zgv+t0DQVJlBzYTNxsadtpeqfBqN0kspVvV8/5gdMs1b1lyGI7NXpsO
	9V5sGQQMnHqiod2tYRaTaBrPGqTQUfyVaTM7jNscLX9NNUa2A1P/Z58Do6FhsSRHvEDWY5MhHPU7k
	vCTr7pIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNdX-0000000EfIo-18qJ;
	Thu, 16 Jan 2025 11:02:07 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNcE-0000000Eesd-3Jqr;
	Thu, 16 Jan 2025 11:00:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yp+QY+2mZrDaypaShoY09KMzN9KTOeQMvt+0rEsMOanjMGP400byfTeDj3bK/G2mMCgFvBfB95nqFkP7hkUL7jvn60hSGj4tIr1gUpM9xfhe4nxJac4B7Kc8Se8t4ZfWfa5n6+zYkQKNnW5ovIIPc/0biqmlTkhsCtgngs7fFld3eqBG14PgeAKL0Co0msQXo+0/sN3XDsgbgHDU6d5YOuPwP/bDvsTiyMFhJyfc/jWJYzfZTLmlkqSSjaOYZAYTgVZpF5VoJqBK337bdihufRdNfEZuFytVR95ICVbd8+WEabu4TBpCGgigQNnUlMNcgP6T79K3okqOw8Y4Olwx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxEdmQjQzXxuuQs5EB5eCtKFKFvgIUvi4fhsAYxgl1w=;
 b=UImPJdcZmxcFqvBE2IbqdW2yxXKMoF2dJQFyps4OOxujzlMDedz7cHBmVZ3uDkE2WgYbHVIVwHaU4KY26imUJ4K/Fj1rhKD/ihrcZkb4v2lUXrmresK6gAQA8CeilfdLrNmOO8/VS5j6SAVUJ6b3BNFjNJCypTCQzpocCF7KDkxCuXOXMHtnDVh7Cgc3tlCYXb4FtsJUXdi9oR5/ZKhSCxhMV0sO8qxAJyJKb2uebz80a8Rc+5shNa2KvW2QxgEeTWKm63NXfM4vtIGjF/mBPtXh5hW8ZB9LEgJFtldpe6N4w/SjYMWEisP2kjLIH5etZ/hGzoQRgpmeYHp75sUKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxEdmQjQzXxuuQs5EB5eCtKFKFvgIUvi4fhsAYxgl1w=;
 b=H+6tgPW7mj5L6w0gU9dLPQVwDQuyoeadtXR1Y2apvoywXNaQzLkpxur0GVjv8UNe7krkM4DncnkbSQm6p3K8hj9AM2DQyJUzHWd3xM+uCySme8zVw2jYbV27S0BlBkvCrfMGTuskZHsvKeVJO91DUDT/l35jvhM1CjgTXlhK6UU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10795.eurprd04.prod.outlook.com (2603:10a6:102:491::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 11:00:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Thu, 16 Jan 2025
 11:00:39 +0000
Message-ID: <c140ac85-f5d6-44b9-a025-cc5736dd6965@cherry.de>
Date: Thu, 16 Jan 2025 12:00:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: minimal support for Pre-ICT tester
 adapter for RK3588 Jaguar
To: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241206-pre-ict-jaguar-v1-1-7f660bd4b70c@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241206-pre-ict-jaguar-v1-1-7f660bd4b70c@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10795:EE_
X-MS-Office365-Filtering-Correlation-Id: 597463d4-db17-4859-0cd5-08dd361d0330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzkvSXRCK04yOGhuRmk1R2JmOXljdTZ4NFVwM0RSaFd5d2xwRFgxbzVDdjdz?=
 =?utf-8?B?d0c5bVFXV0ltWU9BcFVIako0cGx4TUxmMGErOXNSRlpuU1VkeUdCM0hMOXBR?=
 =?utf-8?B?MUUyOGRGanc2aUtVTXZDRkYwNUhSR0Z0WCsxaXhtYktTcVlralVEYnIrZ0o5?=
 =?utf-8?B?M0FZelYydUFKVWZVSnFHTGFUQlFmVy9KVGtsLzBBSW8yWkRvU2ZrUm03c0Y3?=
 =?utf-8?B?RGdSKzJlZ2NBWEtTYlB2NWh3SmtHZUFSNFhRVVhUdVlreFBSNlgvMXkrUTNV?=
 =?utf-8?B?MFd6MlQzdHpSd2doM0o0TmtyeWV6Z0xHdTZJbTFMbEhaRE1GS3pndGtVUVln?=
 =?utf-8?B?eDJVTW9DRVdXSWRxU0FFS3R0MXJWZHNkNmRQK21GVmZVeEVJMlB0NGhZdUxw?=
 =?utf-8?B?V1pXRFV3TVBPdjJDeDlGWGtFdVZQVTVlMFlNTFd5MHd2L3BjV0Jra2tGM1d5?=
 =?utf-8?B?cUV4cXhEdTVMc2JjK0pIUzVYYVo5RnM0WjF6ZGZLQ0wxam1JR29DMnlhWEdY?=
 =?utf-8?B?YTZQVCtyWFFHdkdJQ2F5aUkzdHZtZ2VxWlN2dG5Ybjk0UzZBb2s3TWpDbk5o?=
 =?utf-8?B?OW1mSlhhZUxKd2tKVlNUZzcxVzE3dWhyOGpyZStZN2xUS0lhcXIyaTVNSFVI?=
 =?utf-8?B?aWRMdy9ER0Z5VXpONW85RnhzYmFLMHVON1BJRHRYWFlwc1JzMzNiK2dVTnZ0?=
 =?utf-8?B?Nk1vUnhaOGNwRHZoNFFmOWpjRERXeXozemNCQW5lWCtZV0xnQmFLT3BKZU1F?=
 =?utf-8?B?YitsdnVlY3UwNEFOaUFXc0RYd0FCUmtTYnJNTWUzb2hidG1hSVRwSENDeXI1?=
 =?utf-8?B?SS91U1lrYWhOUTZtT2QzSzRySUZGM3FkalpRdHlKRXo5T0JBQkpjNWdvV3Vh?=
 =?utf-8?B?WDZBTURrZlpFRm5qWHk4ZWI3aStjWnp3c2tCMDhUZkdUQWh3RkNjZlhLNEhJ?=
 =?utf-8?B?SEVoM3VQMmVMQTI0bHZjS1gvZDVpTUc0YWJERXdxUDJFbFRKemx2VzRvK3py?=
 =?utf-8?B?OUNueURWVkoxTGxXZkN1MW5QQ0FTN3plZHFrSm5BdXdzVVZJVkhPYkRJdmN0?=
 =?utf-8?B?UkNQREYyMTFwQVRQZ1lOTUJObEV2K1BnTml3VjlNai9vK214Y2NDcEpUT1JZ?=
 =?utf-8?B?M2YyMUpKaHFEOGh6TkNpbUdWYVRRSmh6bWNVcElqRzhmNzZJWDF0OXFDQ2Ur?=
 =?utf-8?B?MTdOQWdrbFg1Tk1hWTFWc05JV3grLzVZV0VscU9pTmZqUS8rVUluQTVvSU1p?=
 =?utf-8?B?aUhISHZZOGdtNEttbyszYW9tUlZqUkJZa2FsOHhlK0drKzV2ZHVBYml2OFox?=
 =?utf-8?B?VHdUQ1FPbU80VWEvbmRXY2ZIWTl4ZGQvRlZoQ1lXK0s4MFFiVkZmTVZXeWk3?=
 =?utf-8?B?akVoVHcwR2V3L1FzRWZGV2pabkZPSENiQTJUaTd1OGhPeG4zM0d0d09LOVVW?=
 =?utf-8?B?UEpCaHg3MjVZNUNJdE1kSmwrTzNneE1LRkhPRXNWU0Q5VUozNURpSUV6OXVJ?=
 =?utf-8?B?Q1JYRzJpa2Nod3NwbTNTSUFVWmJINFlIc0Zyd1RqZkp4VHJOSlBqbzFNMnFH?=
 =?utf-8?B?eTY4aDI1Y01uS0Q4Vmh3eEIyRjA3VTRLL3YzS3Z1N3ZHU3pOcVg0QStZQ2RF?=
 =?utf-8?B?RDdYSkFHWDE1WEM2aUhxR1JvRW1jbDFGN251T0VFWm5LSEtRckt3MlZmUTNa?=
 =?utf-8?B?M3BOSm05ZTkwajNtTU9pd0RWU2wyZFVkL0xWN3ozSzQ1MGRERnpIS3BSRFI3?=
 =?utf-8?B?NUEvd3U3bXpNbGsyV2s0dENuMFUyOU40eDk5N09hMnhYQ0F0ampzRzE2SFVo?=
 =?utf-8?B?SzF6cjI3UFVmRHphV3B1bW9sUUJybGJSa2Vra1BpbXBFRndJbUlKUGowd3E0?=
 =?utf-8?Q?yWmBROwwfSmJq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEV2d2R5RnNXeWExUWlRRTFCMzdVbURJRE1tOVI1bytaUUVXRW10Z0JoMEM1?=
 =?utf-8?B?OXdhdE1IOUVEYjZrR0FzNm1rZElCZXdJOUk2Sk1XVkxyM3VTaFZIYXpnRUtB?=
 =?utf-8?B?dzdxQWppNEFGaW1uS1R6ZnhqM3RqS3BxOW43RGt0S3FaMzJORkZkSnN5WEVu?=
 =?utf-8?B?NURPSFdjRmJlMGN4L1YycDFWYXJjQXAzTVJJVncwc1pBQlpMUUhJYlZmSys0?=
 =?utf-8?B?RURhbFQ3TVkxRy9sMmtTVE1MWmluYWphNlJvSUpUelRjZU9JTGZ2bm1aYUhr?=
 =?utf-8?B?QnRpcWgxc1RKRDg3NGlXbTdVNlJpb25kakw0eEFBWlhsUWpkR2JEdmswK25m?=
 =?utf-8?B?aC8zTDJTT1p6aloySmlXVU5Ga0x6UmpGZHRvc1I2SGttMkFmZEw0b3JXRTRz?=
 =?utf-8?B?VTZLakMzUzBleU8wK01pTzl3cHZmeXpKWUJYZTBsRW5jU09CNnFzczFjUk4v?=
 =?utf-8?B?bTBqRk55bDd6VWE1RzlCVk1wVUFmd3pyOXdVb25TM1k3bE5oNnNrYkQxUGMr?=
 =?utf-8?B?N0tVQnZIcXVlaFJSK1htYy9sWUEzUi9yblhMSWdIMW1NT0U2VnUyTXdwRWJ1?=
 =?utf-8?B?MjhFbkZFSDg2ZUdtaW0xYnF6LzkyNU5TYU5tTm9BWjZZNEEzcW9mK1pBVnJU?=
 =?utf-8?B?cVdwMHVNUkFUeGRybnN6bVdMWDMwdVZudWZUcDA2U0drcWJ6WWxFUjBuK05t?=
 =?utf-8?B?UHBRRW5uY2lFanBFMTA5V1R1U2RTYUd2eUtRNzZSaXdONjQ5blZ2ZWloOHpL?=
 =?utf-8?B?bGljRSt4cGhRcDRjejhBemYzaFR1TkRUbFY5TVc4MGhocFp0ZUdGWUpRb1Zl?=
 =?utf-8?B?OUwreGo1M3NvTVRUbjJaWjhKV21mMXViU3VDcWRtSHM0Z1NaRkE0UzVWWjBT?=
 =?utf-8?B?aGphYUFSRXVUcUwyS2FtbGRvRTFqb0NIbHUzVUJHRnMyVm9XWDFlMjlmSC9G?=
 =?utf-8?B?QjdVWXBid0lQUGZMd3lqR25xbmhBaGgxQ2RHaDNhN2pJaGRid0NEUVBFeVNQ?=
 =?utf-8?B?WVdPQlVEd04xN2tZaTZvdUlIMTdoVXlCK1RGcjN4OHI2QndPaDhWK290MEJ4?=
 =?utf-8?B?dk43RGVQeEwycTM5MktVczZWakpzOURCbXREQUhlKzl2eVd6THYwd3FpMTZL?=
 =?utf-8?B?bncwbkxKMzRQbk1SOXIrc2tZUUZLOGJBTWFMM0gzb1dhenFOcEc5L0VoN3J1?=
 =?utf-8?B?WmU3Q2ppY3ZVT0c4NlB0RnM0OFM4QnV3bG9iZ0Vqd0k1NzFGUk9FTlhmWHBk?=
 =?utf-8?B?UVlTTjF3T3EvRk52alFOcURxalovajdSb09yUWFKczBYNi9udDVIN3dxTlYy?=
 =?utf-8?B?K2dRdVNyRHpUcHRTSjJ1blZ2ZG9qM3pib2dlS0NSdTQxZ3NDRGoybDNLbHFU?=
 =?utf-8?B?ajBQNmVlTGkyVkZFdWkveHZ2YXRudFg4L3QzaGswOXNGUllpVWNGWGhWc2ZG?=
 =?utf-8?B?ZVM1NWs3VnV3bXlvcGFBVFFhOVdzN291NG1iTVJxNUdJK2FMQkZNOFVtN3NG?=
 =?utf-8?B?WjFwaDBLYi9ENjJ0NkVSbVE4aWV3TktmSUdHR09abFJDcG1ZNlliTU9aY1NX?=
 =?utf-8?B?R2dWQkp0c2xuS0ROcGdTdUxXblFmclk3dGFuVk9yVzVXaTBlMk1SNk9VdGlO?=
 =?utf-8?B?dlZhSlpyRUFhT0p1R2VJMHFlNWQzeTFKRVBlVjBHbWQwUklPSWU2MkhQUmVU?=
 =?utf-8?B?UFM3aXJxdFdOZEZaRGZGUnozQW1TOG1kUDgyTk9HbTYvK0pveGtQOXhuQTli?=
 =?utf-8?B?OWh5RXQ0V3hVQStpNjhzS0VxMkZNdExUV2xRL2hkeE55SHNrVEJKaHJBV0h6?=
 =?utf-8?B?M0Z4NzRndTRYckRTWE1uZ04rd1ZMb3dWN2tnMWw4WFA4ODlISmkvTkJXV2hB?=
 =?utf-8?B?Q25VR096UkJwaFFuaUh1Z2NjZmxQLzZKcWMxVlFOWTAzdXdqMmdPUXBGaGRV?=
 =?utf-8?B?UGQvbkY3MElWN1AydWVzSnFJNmFIQytCdmQxWEt2V09TSkx6OHd4Y21YeGw3?=
 =?utf-8?B?OG1TV3RVSStVTmNYeUZtc2hrMFg2YnRDZlNuNlRkdElYakQ5WjRTRWNqbDI5?=
 =?utf-8?B?MWhtaENrTmd0NlZ1NmJwbWRLYlgrQW13RzhRc1hDeGx5d1FOQlA4WEQxRDRw?=
 =?utf-8?B?U0M4QzVVR3hWVmFBaWFhNlZpdE5UaWtQM2lBRTV6MEJwRUg4NVRqZWNRMjZr?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 597463d4-db17-4859-0cd5-08dd361d0330
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 11:00:39.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaD3Tg9b3mjrcXc0ciy4RRJ/jAC9CmjYeqDcQXzOzIIEn038pMBp8gL57YXzPnXA9MeyxyOP5GZySHhPPFuXm4hWVHte2dVprxYoAUaK/iE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_030047_001234_E2C0F726 
X-CRM114-Status: GOOD (  28.07  )
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

Gentle ping.

You should also have received a parcel with the adapter so you can test 
it yourself if you want too. Let me know if you need support with that.

Cheers,
Quentin

On 12/6/24 4:46 PM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The Pre-ICT tester adapter connects to RK3588 Jaguar SBC through its
> proprietary Mezzanine connector.
> 
> It exposes a PCIe Gen2 1x M.2 connector and two proprietary camera
> connectors. Support for the latter will come once the rest of the camera
> stack is supported.
> 
> Additionally, the adapter loops some GPIOs together as well as route
> some GPIOs to power rails.
> 
> This adapter is used for manufacturing RK3588 Jaguar to be able to test
> the Mezzanine connector is properly soldered.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> GPIO3A3, GPIO3A4, GPIO3B2 and GPIO3D2 to GPIO3D5 are all routed to power
> rails and can only be used as input and their bias are important to be
> able to properly detect soldering issues.
> ---
>   arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>   .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 +++++++++++++++++++++
>   2 files changed, 172 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 86cc418a2255cdc22f1d503e9519d2d9572d4e9d..60074d21d92b4800bdc555648a9360e13d19febc 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -139,6 +139,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-io.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtbo
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-ok3588-c.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..9d44dfe2f30d793accb994a230c58038f0c3daad
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2024 Cherry Embedded Solutions GmbH
> + *
> + * Device Tree Overlay for the Pre-ICT tester adapter for the Mezzanine
> + * connector on RK3588 Jaguar.
> + *
> + * This adapter has a PCIe Gen2 x1 M.2 M-Key connector and two proprietary
> + * camera connectors (each their own I2C bus, clock, reset and PWM lines as well
> + * as 2-lane CSI).
> + *
> + * This adapter routes some GPIOs to power rails and loops together some other
> + * GPIOs.
> + *
> + * This adapter is used during manufacturing for validating proper soldering of
> + * the mezzanine connector.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +
> +&{/} {
> +	pre_ict_tester_vcc_1v2: regulator-pre-ict-tester-vcc-1v2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pre_ict_tester_vcc_1v2";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		vin-supply = <&vcc_3v3_s3>;
> +	};
> +
> +	pre_ict_tester_vcc_2v8: regulator-pre-ict-tester-vcc-2v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pre_ict_tester_vcc_2v8";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc_3v3_s3>;
> +	};
> +};
> +
> +&combphy0_ps {
> +	status = "okay";
> +};
> +
> +&gpio3 {
> +	pinctrl-0 = <&pre_ict_pwr2gpio>;
> +	pinctrl-names = "default";
> +};
> +
> +&pcie2x1l2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie2x1l2_perstn_m0>;
> +	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>; /* PCIE20X1_2_PERSTN_M0 */
> +	vpcie3v3-supply = <&vcc_3v3_s3>;
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	pcie2x1l2 {
> +		pcie2x1l2_perstn_m0: pcie2x1l2-perstn-m0 {
> +			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pre-ict-tester {
> +		pre_ict_pwr2gpio: pre-ict-pwr2gpio-pins {
> +			rockchip,pins =
> +			/*
> +			 * GPIO3_A3 requires two power rails to be properly
> +			 * routed to the mezzanine connector to report a proper
> +			 * value: VCC_1V8_S0_1 and VCC_IN_2. It may report an
> +			 * incorrect value if VCC_1V8_S0_1 isn't properly routed,
> +			 * but GPIO3_C6 would catch this HW soldering issue.
> +			 * If VCC_IN_2 is properly routed, GPIO3_A3 should be
> +			 * LOW. The signal shall not read HIGH in the event
> +			 * GPIO3_A3 isn't properly routed due to soldering
> +			 * issue. Therefore, let's enforce a pull-up (which is
> +			 * the SoC default for this pin).
> +			 */
> +				<3 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>,
> +			/*
> +			 * GPIO3_A4 is directly routed to VCC_1V8_S0_2 power
> +			 * rail. It should be HIGH if all is properly soldered.
> +			 * To guarantee that, a pull-down is enforced (which is
> +			 * the SoC default for this pin) so that LOW is read if
> +			 * the loop doesn't exist on HW (soldering issue on
> +			 * either signals).
> +			 */
> +				<3 RK_PA4 RK_FUNC_GPIO &pcfg_pull_down>,
> +			/*
> +			 * GPIO3_B2 requires two power rails to be properly
> +			 * routed to the mezzanine connector to report a proper
> +			 * value: VCC_1V8_S0_1 and VCC_IN_1. It may report an
> +			 * incorrect value if VCC_1V8_S0_1 isn't properly routed,
> +			 * but GPIO3_C6 would catch this HW soldering issue.
> +			 * If VCC_IN_1 is properly routed, GPIO3_B2 should be
> +			 * LOW. This is an issue if GPIO3_B2 isn't properly
> +			 * routed due to soldering issue, because GPIO3_B2
> +			 * default bias is pull-down therefore being LOW. So
> +			 * the worst case scenario and the pass scenario expect
> +			 * the same value. Make GPIO3_B2 a pull-up so that a
> +			 * soldering issue on GPIO3_B2 reports HIGH but proper
> +			 * soldering reports LOW.
> +			 */
> +				<3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>,
> +			/*
> +			 * GPIO3_C6 is directly routed to VCC_1V8_S0_1 power
> +			 * rail. It should be HIGH if all is properly soldered.
> +			 * This is an issue if GPIO3_C6 or VCC_1V8_S0_1 isn't
> +			 * properly routed due to soldering issue, because
> +			 * GPIO3_C6 default bias is pull-up therefore being HIGH
> +			 * in all cases:
> +			 *  - GPIO3_C6 is floating (so HIGH) if GPIO3_C6 is not
> +			 *    routed properly,
> +			 *  - GPIO3_C6 is floating (so HIGH) if VCC_1V8_S0_1 is
> +			 *    not routed properly,
> +			 *  - GPIO3_C6 is HIGH if everything is proper,
> +			 * Make GPIO3_C6 a pull-down so that a soldering issue
> +			 * on GPIO3_C6 or VCC_1V8_S0_1 reports LOW but proper
> +			 * soldering reports HIGH.
> +			 */
> +				<3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_down>,
> +			/*
> +			 * GPIO3_D2 is routed to VCC_5V0_1 power rail through a
> +			 * voltage divider on the adapter.
> +			 * It should be HIGH if all is properly soldered.
> +			 * To guarantee that, a pull-down is enforced (which is
> +			 * the SoC default for this pin) so that LOW is read if
> +			 * the loop doesn't exist on HW (soldering issue on
> +			 * either signals).
> +			 */
> +				<3 RK_PD2 RK_FUNC_GPIO &pcfg_pull_down>,
> +			/*
> +			 * GPIO3_D3 is routed to VCC_5V0_2 power rail through a
> +			 * voltage divider on the adapter.
> +			 * It should be HIGH if all is properly soldered.
> +			 * To guarantee that, a pull-down is enforced (which is
> +			 * the SoC default for this pin) so that LOW is read if
> +			 * the loop doesn't exist on HW (soldering issue on
> +			 * either signals).
> +			 */
> +				<3 RK_PD3 RK_FUNC_GPIO &pcfg_pull_down>,
> +			/*
> +			 * GPIO3_D4 is routed to VCC_3V3_S3_1 power rail through
> +			 * a voltage divider on the adapter.
> +			 * It should be HIGH if all is properly soldered.
> +			 * To guarantee that, a pull-down is enforced (which is
> +			 * the SoC default for this pin) so that LOW is read if
> +			 * the loop doesn't exist on HW (soldering issue on
> +			 * either signals).
> +			 */
> +				<3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_down>,
> +			/*
> +			 * GPIO3_D5 is routed to VCC_3V3_S3_2 power rail through
> +			 * a voltage divider on the adapter.
> +			 * It should be HIGH if all is properly soldered.
> +			 * To guarantee that, a pull-down is enforced (which is
> +			 * the SoC default for this pin) so that LOW is read if
> +			 * the loop doesn't exist on HW (soldering issue on
> +			 * either signals).
> +			 */
> +				<3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +};
> 
> ---
> base-commit: b8f52214c61a5b99a54168145378e91b40d10c90
> change-id: 20241206-pre-ict-jaguar-b90fafee8bd8
> 
> Best regards,


