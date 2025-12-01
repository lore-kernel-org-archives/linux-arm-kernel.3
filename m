Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEA4D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuB/mcnZRA5ciqrY5kyrP3RHnGNhGj9qvv6te2R4iWs=; b=QlAFx9HYrndpFRzOOpw2ybHgUB
	BHDsdeR+gSHkuEdSEgoJWezGlS/+Tmf0P4S1Hq6VQDklPrD+CnuvBbw2Rm63UX4iO17JPmvZPXrxi
	h6QSU3u3wyW+u3cJo0hMUuktyB8W60jz1PRdzMyXIS6IbGP6e9Qv6bhTw6ZJ3NyTjgYQ7awoe6YMc
	2bkyZKGtS1exCcX3nhQ4FZQWavorMC4ZfpyXSpJTOmJCH9qeksMdIe7y5Okz2DkTZFWym9xSdmUg0
	huAQbR7OyivYkGdtvoFCZpbjHYYf5lH1hVOPllXRlm8lgpNHSWYspw4jZIgfiOEvA7FHd9vjRj7t2
	MGReAcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5Fp-000000047Os-3btL;
	Mon, 01 Dec 2025 14:51:53 +0000
Received: from mail-northeuropeazon11012019.outbound.protection.outlook.com ([52.101.66.19] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5Fm-000000047KV-0ckX;
	Mon, 01 Dec 2025 14:51:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vu+g10uWgzeXx6KI3Td6CnxNJ0zm8ID0rIKdx0KhELr/lBuLMyUstqfNU0UgNhC9JLP7mgE5hUf/+drsKrG+rJsx/cZuzv/XpEqHAVr2+PqmNHpk8a12Bj383WnZhXZ/ovdxW9rWd8PxecTNeC+Oxu8yQiLzu/r3HEkTzp6pj38SVbuZyMyO9Hv5H6b0ydQiQFV2zKSa50gSM/e5eCPmTI4fWg4RcWzxmhgwdgkq3EcTuHvMAwr2ZSNAbYdpCOUVzIfAh7QllHOSBVvNVphxloSVdA+WHtd59odHLWf7o6LJl+9sdj958ibXGXwvfayAzUjAxglOwiJW4ek6YxaiAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuB/mcnZRA5ciqrY5kyrP3RHnGNhGj9qvv6te2R4iWs=;
 b=RFEJcyUwyD9tYzq/YgVlQjfbFQw+wz/4lU2JPisbdmHXySnglDdue3SlOk8QvDh+AoNG6DhCyl63bOuA1yYo0vWluL0WgHNvEuA3qz3ANW9vhinv2cbbVSm3cNkee3aWRwBBjWqFzxqg7gQ/nmFXwNvefVmAYbnyxSG4iI5v/TcjmaYDv27klUa+RPDErhAPdSoR6uQE7eREJF1lxQz14IbPbJJvh1sgLeVEAKxn8WoSlhBAzRAIseGVYx2NC2/gkbsexVO3dIg2cChV9o1agf2zbM7iIsB9uqLw/bVIjsHq53Vf6UIBA7Y7zHFjNI6grB4N4Ar1VpCEx2BsJ/brUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuB/mcnZRA5ciqrY5kyrP3RHnGNhGj9qvv6te2R4iWs=;
 b=jN9X0Q9BvclMzrFaO0+mKORB5sZ6wrpBRXPo8FnzYD186RjTpzU79FOrUYpb3SoGTuDyN7r1ek/BhK3iI2qpY9Lh59uebWlTEsZQWyAhNx5t51ZheMkcDaXfQNQVQ0HddudD/ms8lPaouDtKF7XVkDrZlDX+mmHWy5PqX1zhEAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10651.eurprd04.prod.outlook.com (2603:10a6:102:483::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:51:46 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:51:46 +0000
Message-ID: <3b497181-6d8a-4c45-b5bd-29415d273f3f@cherry.de>
Date: Mon, 1 Dec 2025 15:51:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: add mdio subnode to gmac on
 rk3368
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20251020100757.3669681-1-heiko@sntech.de>
 <20251020100757.3669681-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251020100757.3669681-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0026.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::22) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10651:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f8b372-cf4c-4d33-8b6e-08de30e92626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1JGcWdTY0Y3QzhuS1RvTDIzQjN0alMzNkpHejN2bWdMWmlOZFoxUGdidXEx?=
 =?utf-8?B?V0pIOGluMUFxSDZrV2lHaVFMaDYrUzdQNkJFcXVFSjAyNStCWjFMZHdQTUlq?=
 =?utf-8?B?YmFGRmlrMmhod2hTaTYvc0Z1d2IvME44SFV2cHc2RXJIM0lYUEpxRnlNR2I2?=
 =?utf-8?B?UEc4N283dzVKVkVmVlV0bW9GZWYvSU1zY0JCb09ZK3IrU2dMcERoeFB2Y0dS?=
 =?utf-8?B?M0VwZnVKSWhzWEhId3YwV3JtVDlBN3hYUXhxTjJza2NQNWJEbE1Ed05hSStD?=
 =?utf-8?B?QThCdzkvMmF5VjE2N2Nvb0c2aEQyOUFRQU9LSGVEOERVWHdLNys5Z0c4RXBv?=
 =?utf-8?B?M0p0NjNoekx3VEFTNE94QWY5OU9zakd5YTdjcHM0UURyci9ablpzdDBLS2lF?=
 =?utf-8?B?NVgrQUxGQ3RqQ1R6b3VEMmxBLzJqSmU1UFhFOUpDWXlUcUtXRTNoWFZVRFJp?=
 =?utf-8?B?SFdkc201K3RsbmRmL3M0M0ZkSUNXOGVUdlNLQklBU3pXK3dOYkk3R0dyWG1I?=
 =?utf-8?B?SGxLak9OcEJFbzlxdjVNZTF2RXc5Y0VPUFJkMlJLVXdRUS9rQXl2emlCdzBN?=
 =?utf-8?B?RFdLRzJ2UDhvMnU3TmZ3eG16M3RuZFN2MnRmOXFGd1VqYTdJZWJUUGJtYVA2?=
 =?utf-8?B?OHZUdkxxRWhyQnF2eHQvSHI2WXFIenRwaEI4OWppSGx1WHQva05NQldJWDNu?=
 =?utf-8?B?K0hyZFRpL3MwMlh4eUxHTFRyVFFvOXJrVnQ4cGJKNTl4NlBDc0JGWnlISmFk?=
 =?utf-8?B?cTdLMG5PZmJpUTFYWjlNTjZoZzlVL1ZpNDZjOFBUckVIalI4eDNiOEJUMWFM?=
 =?utf-8?B?VVNYNjA1UmlKK0VlWXU1RjZUWEplK3MxYXduMUxBOHd1TlBqS0VGY0JoZ0s5?=
 =?utf-8?B?S1BGZU4rY0QzWFNLbFZoU2N4RUU1VGd5YUprdUY3dldZb004RExFcytFSmpi?=
 =?utf-8?B?dzJ2TXNkbEZYeEZTSEpTOEJyaTY3Sk9KMC9hWVdGNitMcUFWQU5DU25WSEZK?=
 =?utf-8?B?UDlMMHR5OXRtMXBGYmhveGhpSG1BREdmMjJQM081bVlsT09nOVRBSndpcUNO?=
 =?utf-8?B?U3A4bzN2OHVDTFBsZDVNTkNINUJlZXlRYmUrOHExZDE1UHp4eHRITlZUdWpq?=
 =?utf-8?B?eXRvSXl0bThVcS85OHlKWnlMWXlKS1dabFl3ZTI0MFNBc0tDY3ZjODNMRUM0?=
 =?utf-8?B?eUswc0s2T05nUW1xb2pHTFpMdXlNbHpSbUk3c281UjdMeFdjSGpid0lNZEtp?=
 =?utf-8?B?ZWZsNUlCNU9sV0Nlbkx0UDFGQ2dkdHJjK0VhTUYrS1N1OTJ5KzlJcXN6Tjlk?=
 =?utf-8?B?R21WVWVpSTVod1M0MTNESEU2UFJMUWZYWUtMY2UwblNsZlJlcTU0MXhsekZG?=
 =?utf-8?B?VUZrWUtjSi9VcHlYVjUwcFpTOU9scFkrZzVGTEJneHVTaHJHRlBMcExjcE5o?=
 =?utf-8?B?dWlZSWYrblVHaGsxUUd6Ti9EYlpsSkVRb29GSVlVdzBqQ0JrR0cwenAwSVM1?=
 =?utf-8?B?bVRoam5hQ2NHczJqYVB1MUpiWUlpaWVEYmJwVDBGcE1BM1lPdUIwWTRPM0JQ?=
 =?utf-8?B?Z1V3QU85blcxM1BsQ2tTVUJ3YjRTR2FhNnJLc2srZk41aEJEd2VmWmNqU3d2?=
 =?utf-8?B?MnNwOHlwdTBLcHNxcXVBdklkdlN1T21jZ2NXM2JjYmdMUWpJY2NERFJNTnAz?=
 =?utf-8?B?UkNzdElUMmlGSjFLT2dPUUNLNnFOVGh2ejVuZWx5S2xIam0zY3RVcitINGtx?=
 =?utf-8?B?UVplZis3NkhUaXFOYzFNZW5CV2tYV1FOODE5b0dVQW4waDBZU0llelhjejNB?=
 =?utf-8?B?b0tSdGluWUpsRlVhU1pGUHBFcHlPc3FNU2haV0NqWm1HaFkrRCtuUEpONGVD?=
 =?utf-8?B?blFnRFhOUW5wb0lSd0JqTnRZMDJiT0lZVTV4WDluY2xHUm1MR242ektFSHA2?=
 =?utf-8?Q?1Uq28u3gNFamE0WmcvD2ntxDVd7AwZYw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFkvb0c4Y01LZ0JKVVZmMWFlaStyb2VzV3dsc3dCazBuVFNmTVRYZGNxNHhq?=
 =?utf-8?B?eUpGYm9naUlZVi80ZHg3elFIWFZXV3VGZkhhdjhmamVDdUVrV2ltM3U5eS9Z?=
 =?utf-8?B?dnpRdEFOV25ZcG1HWnlYeWVYL2sxRVdqZkFzdEk5SElxQ29qaHBiQlk3MmM1?=
 =?utf-8?B?MEZxRUpkOEF5SjEzRW9aamlxVjVwOHEzYWZVQ2xkSzJDWjlObjd3a3Mra294?=
 =?utf-8?B?N3d0NzdPbDhBWW9rUTZ0Q3dERFgvUElqbTRPS3hMcXdRUEJMc2RTekszSHZB?=
 =?utf-8?B?UCtJdUNPZ3Vka3AxOXczNnRpQVNPdkcyOXgyMXRnNjliTDY0cmVudkR2Z1VW?=
 =?utf-8?B?blpLNElpRHBUaXVabDR6YUdvRFlkZmxDTFBOSG9kcVkzbll5NHBOZzBxRGVk?=
 =?utf-8?B?UHorMEZIYVV2MS9FcjNLUEdkR0x1bWgvaWgvWFhWbEJIdlBvVEl0bUhuVjBm?=
 =?utf-8?B?Ynl5Ukk2aU51b29ab3BKOGpLQ0RXVDV1UHBxeGhrU2Y3elBnZnoxQ3Jvemty?=
 =?utf-8?B?K01aRUZCTzR0amtTSnIvd1p1eDRQN3UrY3lWT1o4OElwbjlUL1ZJckNhbi9P?=
 =?utf-8?B?ZzNhb1F6MVdkQnNDc0E0N3JyS2FzSnhxclNCZVVzWUxaaXZUOXZZMlVsN3M3?=
 =?utf-8?B?b0d6b3BWaEpNSU9RNDAwU1RFSlRxaHlwbnRlVUpBNS8vUDU1VUVJNllLSnBv?=
 =?utf-8?B?ZVgrQ3l1d2NDUTd4RXBTakg2ekZXZ3VraTZ2cHRFRDVUU0Y4RU9zOUN0WmFG?=
 =?utf-8?B?V3VrSkhwOUQwUmZZaVBSQmJoMVNBYnFlWTZTd3ZEMkphNzZkaGNZZHJqMk9t?=
 =?utf-8?B?QlVLQkF1UXdvT3dFUTlkR2NxSzRpNm5kTnZjS0E0R25OUVkzdFROYThTMmZr?=
 =?utf-8?B?L1NCMkc5Q2pWUkFaSXV5REF6RU5iL0pJTHBaMGd6dUUvdVFoQ0V3V2p4QWlp?=
 =?utf-8?B?Qjd3ajlqcEZyY2pld2FoVC9VZW4rdG9pRU1YTTBKUzJSbG13SEdTSzNTNnhV?=
 =?utf-8?B?c05CQlNQazZTZVlOS2NGS1BRUHZMcVlCVEQ3RFVUL0p5eDBMeTRRQ2NXM3lp?=
 =?utf-8?B?aS9mZEhqdzBBM1dPcXVha0xDY2lCWm9PWm9UVnVmUXZsVElJRGVuRzRUaXdB?=
 =?utf-8?B?TGEwTThNd1VMNWZIN0dxTjR6U2x6NnNBVk16R3Z2S1J0czJuYWgwcXA3bTJH?=
 =?utf-8?B?cGxhdDBNMHhObkJCMVlmYlhXR3pDU1hKVUZSeDFNZnN5QmpYbFAvZFU0cjJa?=
 =?utf-8?B?cnZ0K1Y5TERFbVZNcThndlJ4R1JwS1BrT1l3cHltWTU4RXg0RlMwRm5DRXYy?=
 =?utf-8?B?R0pxRUFpa29UcnVNeXlnUEJpTHF2Q2NSWVhvQnZvU24xR0ZlV3BiQUQ3MTc2?=
 =?utf-8?B?TlhacnlPbzRpUUlyNi9wWWFYY1FDVlo2dGpnMUc3b2hRbFFmZ29PZjJWSnln?=
 =?utf-8?B?eEMzZGRvZFdER3hxSUJxSm8rcjdpWCthWUY5YmU1M0RPMzl1dHU0WCtGdFFv?=
 =?utf-8?B?TGlxTFJBUkdOQzMrKzFTU3hJZXNsdSt6SjF0ZW5BRjFMR3RFRWQyQW9RaXZB?=
 =?utf-8?B?UE1CVXA5eFU2WDJ1UldzQVYvcU40ckV1elBlMzJGTlRnS29vS3p0dEJXYjFV?=
 =?utf-8?B?WWgzN3ExN3g5MEFDdWxOVlB5N0F3R2VQUjEzTlNraXMyUWFIS1V5ZnJTM3pN?=
 =?utf-8?B?Ykg1bUZ0K2E2WGtxbXQ3VDAyZG5DMVNSQTFRSUFWdUU0YmtxV2VpM2V0aS8w?=
 =?utf-8?B?cXFVRjZjUGI4MDlsQ2xMdDhLSEg2RDdGNVdYSHpjQlFXMlZzb2d2ZURxOTZX?=
 =?utf-8?B?ajRCbUMzb3VxT1luOXJHYktGa2FXanNDSVJuL0w4aFBxb0Zqdk5zTFBtbG1i?=
 =?utf-8?B?NXdxQU83ZmVaRDhWWHNnQnMxMHB0L08zd0xvV1BOa3U3QTZ5VXVNdit3WHNH?=
 =?utf-8?B?bjZ0QkliTlhtNEZGZUJLVHdydlBnL2YzeVpvRmp4d0huTGg5elVPdFVETC8y?=
 =?utf-8?B?N3NpM0M1VVFjcEtnUmtVeVZuRGxZbWlGbExIbnhObHMyd3FPYVhuTkJKMExL?=
 =?utf-8?B?d0VPejR1UG9CTkpYcXZFVGI5eTJwT1pJTDBmRzNZcnZ5NzJtRFJtVnFkZDNF?=
 =?utf-8?B?TkkzTXBZQXlONXhFYitIZm5wQTdubTNlZ0lGb2lvelVkS1dGdy9wcVV6UDlv?=
 =?utf-8?Q?KNg2L39LnXuweY75HwLsYHY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f8b372-cf4c-4d33-8b6e-08de30e92626
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 14:51:46.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8nBvo083toofcoRBa9/zyxRCj3PlJaLNI0+UR73KdruT9+rgOIeE+xtcuqRXHKjxFZmmU5nbFr3RUWNrL8Ov+egAaDHtIMmXXWssnBspsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_065150_206589_A2B1E34B 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
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

On 10/20/25 12:07 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> This is needed to actually describe the per-board phys connected
> to the gmac when needed.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

