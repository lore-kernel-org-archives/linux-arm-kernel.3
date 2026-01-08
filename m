Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42203D185C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6beM1ppS6kgOZ8T15gZbBKFNwZ78nPveHcvJKaPL0I=; b=AEkYV9xVrJZdf+PsUjVRX5MJ1A
	OTLIx+dTd0zqZENE5exjIcq1/0nFhWA1s/cA4Z+CfK4iOgbzCWIC7fH1uVeUjT8isk6UTwQZimcWA
	sXsyZAZb190yhlDfsfNWqyLNeKT5xJ/AdSHeL4FR06RFSJl585tsHa4J0aUKv8g7OcecBHLExsNq+
	RQ7WTpijMTbqgFYoZ8i0Wzfet/qyUrd1dNlDknA304THaSIh+pconKjOxZbWH0KVlX2ZdcddCutRk
	7bWxjq4YcWhVVd17D48sZl4gbz+S/8kAmiDkET7IBshK8Ya0HJvrhX97h3bzxzNAcUxuRhtQ4AUwk
	BgwtkwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdncB-0000000GhcD-0bz3;
	Thu, 08 Jan 2026 10:51:39 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnc3-0000000GhLV-1odO;
	Thu, 08 Jan 2026 10:51:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w95PFr5t4DRedtkE2hqgm28fC6YXEAGDhdrnxf/i4G/Yh+pWYJilDyWLJTI4AUch9D+Oib6rz3IuNzKS4yqe9ANB0IKF823tyMKbXtWd8GkGVL/xRqrqoQhvc6mENE26Tnsz0UFY3LA2hinxhS9gRbUIccEa/FOcVDEq6HTEcuc77mpd0iGo+kPqH2qxkqdjQv+BqgGohiBHArliggsBkhSMV0nCTZGfSYkAdxBNqy1KboJsiJLwQQrNkhwRMTWpn47McNlTvkdgqZhp7LiTPN/2pYhTpVs94wDMj6v9JnLPx5bTWyJwCeO2I5qRiw5mIZZsA7gWTRCyNL5JOjmDig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6beM1ppS6kgOZ8T15gZbBKFNwZ78nPveHcvJKaPL0I=;
 b=rEnaGgDv8QDgvEbA6j7kYClpx5G45JWDacIeDY6w/YYR/W1Ppshf/HYdmygk5peWpzY3H7ym+y6T1A7539hA1BJRdl4UzvCTplBVnYjabh22ceP8hQG4Ju3/YiqWbV3m4KVsrAnQVS7NG5pkwGPqajPfKBRysRpQ30Wtj4mdFQOSdsl384n6GPWzUoHISVAGXkEqTfbHb8YFd911+fX386hxzU+jcDjnhVSd+LL1exVbNpVa7zGTGkQLcfAgw+y8keDlGJI612vDptOBrfQnn6JKvxWrJKxfuUQ/Mvf/as1MOJLzIGhS39+vV21BBfXtxWEAII25Ss9Lawz+3wpqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6beM1ppS6kgOZ8T15gZbBKFNwZ78nPveHcvJKaPL0I=;
 b=iVGRHIDw+U9yJjWSVK3EXwF7sgFRZ3LGBleWHbATte4SaCh7FvukTEnaVrxaNvOPSJspT2pcMUeCkXLw25LboTut5QW+g0OtvMNw2ujIClUlwr8lU7Q3RiOlz/1iPPunrqxpl0CsN20RQQG3iIiOg1kGO4wgWmvezdxD6ZnO9Ws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB8182.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 10:51:24 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 10:51:24 +0000
Message-ID: <2520283a-3131-422c-aa7b-45ec1ad4a875@cherry.de>
Date: Thu, 8 Jan 2026 11:51:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
 John Clark <inindev@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, Chaoyi Chen <kernel@airkyi.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107070322.323-1-kernel@airkyi.com>
 <20260107070322.323-3-kernel@airkyi.com>
 <afe968a0-f14b-423d-81a7-c1046d2b32bb@cherry.de>
 <1b08bc47-70be-48fb-a05e-1101e633a776@rock-chips.com>
 <0d99140e-8f57-4a7a-a492-92efa30292d8@cherry.de>
 <c6fac95c-dd7a-4fdc-a93f-8ebac731d499@rock-chips.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <c6fac95c-dd7a-4fdc-a93f-8ebac731d499@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::9) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 004e3c8b-1454-4ce8-4d23-08de4ea3de07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlRXUEIzd2dTWm80TVk3dzZnOFJmSlFnWFhpWFpxcHhGMGJSRDE5WHo5b081?=
 =?utf-8?B?dkdIdHJMS2ZuV2xzR0xMK1psUzJVNWc2eEtYKzdIeWhqeXhNdFgzT1ZXT04y?=
 =?utf-8?B?TlpSbGNIL29tVEViZTFONlg2UkN1UXE1c3R6STJqenNVdEwrbzVqZGhHR3BZ?=
 =?utf-8?B?K0RDUC9jZGlKYVV4eUhiQndIcTREUm9HT3BiUE1taE5ET3VOMlFzdVM1aVR2?=
 =?utf-8?B?RG0velVsd1BVdnBreHBFVjhQN1dyYUpFcDg3K3oyc21NeFRzWFRTMit1RWZE?=
 =?utf-8?B?TUdLbnVhaGhvNGFiWGZUVHFLa29DWVA3MUY0YlZ0VjFEU1BVMU91RkRpMHB5?=
 =?utf-8?B?QjQvUHNMMnI0ckt4UmsycXBwak9uZXVWWmZJSk84WkhpYzBKRFlzajI3REJL?=
 =?utf-8?B?alRVN1NnMWRlREVMa2Qrb2hSRktEdDh0REt1aUxneXdYQzdiRDZ1UEtuemp1?=
 =?utf-8?B?UkJYQThMaFJURUZlemNacXZTYzJBaXhKL2h0ekNlRExTdWJ4NnlCTERIVWdv?=
 =?utf-8?B?ZUN1WVR4Tk4xN2xFZ2tlMjE2TzdMZmFCVkZ3VmhySGI2TmhoT3RnWkJKbHNx?=
 =?utf-8?B?dTRuWGRDd2N2ckR5YlltT0JwZFFOejM2TThCRHRTS2paWjk1Z09BbWxGTDVh?=
 =?utf-8?B?YlB2aHVjWDhLWnU0ekwwOEw1TDRQU1paTkVvT3JKd2JZajE4V0x0bENQbEw0?=
 =?utf-8?B?Slp3S05ycmZ4VHovamIzZGdBV1VtVmxvVWthaVpiTjlZZjBkOFdOaENrdkhn?=
 =?utf-8?B?YXN4TFZXZEhKWWlLK2p6cTVrVmJSVWw5V0lYdWQ1U3VDS2FRVkhJcEloeVpn?=
 =?utf-8?B?dWpEV0RFby9RaWR6Ri9YaThHVFRyTFlGQ2xGVXpudm9mbmRnR1ZWZjlLM2N2?=
 =?utf-8?B?VG4zS2VweEthQVpLekg4R01WZUZOejhDUE4yS3hVNlJnNVBoZkZxdFFCOWZL?=
 =?utf-8?B?SE92ZzVDWE5OZ3A0dGdTa2dWNUlwc2VtU09MaElYYU5OUWNYcXAwbTUzcGIv?=
 =?utf-8?B?c2I1MHhTY2Q5UnJ3akdRZE9LazZsWXIyaENEbDRURWRtUkhJL0U4ZkI2cGJ4?=
 =?utf-8?B?ajJrZ3l3YmdzWm9nSTZEam9iellieFlGcU9kNlpXNWljRUlmTTVIZlc3NVYw?=
 =?utf-8?B?UnRLVVB5ZFNXUmlCVlVUOHNIdGVmSEI3WlNwR0ErYnUwSkU3SWQvaitpZTcv?=
 =?utf-8?B?UUx6ZUpGZHRWSWZkQ2ZNRENlbEZJSklFRjRuN1d1L0JVVnkvMk1KMmt3enpI?=
 =?utf-8?B?U3FoUDY1TnNURDl4YjFURjNyN0ZxWE1zTUl1eGgwYURUWlgzTWtOUzMyRnpw?=
 =?utf-8?B?WjlrSXZZRm5wQUQ3b0cwOUhCRTRLb1hhZklYd0ZjVlhPMklYdUNUa2dwb2hN?=
 =?utf-8?B?U0R4SkFjUDRDR1MvVHBqbWIxVWJNSmhET2c3bkF3NEdOaTVQL1EvYW43T1dF?=
 =?utf-8?B?ZG9nUW02VDRBMVgxMk1yWW9KUHIzSjErTXZTTy9rL3E2dU8rNlZXMDFTQVRY?=
 =?utf-8?B?cXZpcWFxRWxCeEpyOWlSR25sK2cwRE9Kbzk0S1I2ZGl4WlE1UkRFVUZ6eStU?=
 =?utf-8?B?V0JSalV4eTQ1NnN4SXFXTTduS3RSdUFQZUpvdnVGV1V0YmVjREZpNWNHTStU?=
 =?utf-8?B?WGY3bXVyRXNZdXVRWGg5ZkdCMFcydEpSSlBtTXJmZGdBeHFmOTVEZXVTRm45?=
 =?utf-8?B?TWhZODVKaFpET0c4T3VhbkF2bXhoMzlXMjJEaEh6MVVzdndzVkNhWUw1VFla?=
 =?utf-8?B?Y2xGa1Z6UlhoeGpnSjdKZk1ZVktQMW1laUxNT1N4Wkh0SWFldTFQWGVMalJj?=
 =?utf-8?B?WWNDazErUkd1SjVmUkhXeUpRdGVIN2xieFcwZ3VWWW04L2NzTUZwc05rY3ZC?=
 =?utf-8?B?UmFkM3htcGhhRGNKS3c5amJPT3NucDg3QXdIL3dudy9DQjU4VGZEbk1GME5q?=
 =?utf-8?B?NnBTQmNNYjBtNEo3OEMrdlRQNEJWdzN2dTFmWVpqV01VRzVvNDJoV0hjc0hU?=
 =?utf-8?Q?all9Hj2vmAihhTslqeXd8oR6mMDrc0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0JIVGk3dGxDRGIvZ0M3MHljTjI3TkV3QzZBNWE0eFFONHpmSU92N2ttRjd5?=
 =?utf-8?B?UXhlRFBSWEFtZE82eE4vZS8zcmo4Sk9XelVyOElXbEdLQlJzQjR6WmhiSmJw?=
 =?utf-8?B?L2Z3RUM3RlFJQVVScUlVa3R4R05HYnkzOFFqdzMzNGxEamtCTW00WXBCUEZL?=
 =?utf-8?B?c3krUjhlZ09iQnNMNUlSU055UXRDbkFrZ3hORUVkV1FsK25LSm4xQk1ZR1px?=
 =?utf-8?B?Y1V5MU5HRkY3dEtSc0NxVjZQV2s0NG5jTnA0aDFzRm9EOHY4b2plT2l1K2Ns?=
 =?utf-8?B?ZmViNWFMWlFYZFR5eWt4bmMzaGl4aTFQbHo2VmpnWW9rNEVVTjN5djFMcGx4?=
 =?utf-8?B?OVRXbmFwNGp0SE5MTnJuZDZRSkVBeWEwZUNUcnY2V2lab1FnSEVPY0M5OUZZ?=
 =?utf-8?B?VkhScFBTdTdVdFdla2c4VEU2NWgzeGkyMWRqbHBWTzJWaDN6YW5HRkVlRHI1?=
 =?utf-8?B?S1AzS3RnWTJlcUMrRkF4a1pFSWFBdXVtdmphKzVJb3ZHVkpua2hmM3Jtd2U3?=
 =?utf-8?B?d3dOOVRwZXgzb01wb1p4d1orcTlTeStxOGtVbndKVGs3amFIN2h2dDYrem5X?=
 =?utf-8?B?M21ZTU5Pd3Nrd0JTMFlsQ2l1WjdVTUVjbUN1N1RKdmE0cHp5U1NZbFkzSFls?=
 =?utf-8?B?Z2FtUzJZbE51MWMrN1Y3NW05dENQWjBrMktpSXQwVkJ6QUdsQXNMMDF4VWRy?=
 =?utf-8?B?MWJ3Q0NTZEtQbU90NXZYWEhPdVZUVzZ2bi9lNFE1SGZ3Wi8yeTB1NG0rd3ho?=
 =?utf-8?B?NGhQaDAyMExPMmZ2aHZ0eG5vYmh3VHhnMTQ0aHpJUExSUEsxNG82d2dvWFJB?=
 =?utf-8?B?aWtDV2Vmdkx1c0F1OW0rZTRxanZheGhpMmJzWUY0aVdXTzQ3TGNjb2ZmME9L?=
 =?utf-8?B?L0xuQnhwZHlIK05yRFpOQktQK05yWTlZcDFtWTgxT0hrckpkSklvTVpJRXYy?=
 =?utf-8?B?Vkxwa3llZE1Kd1EvUTIyOThqemlqS1NueGliRVRuWS9HNmVKY1ozUWNVK2hp?=
 =?utf-8?B?dUppcWJYVmI0Yk1UdjhGekRncmsyZGhtVE9qU0tydGtsSEtSaTRsVlJBS0tR?=
 =?utf-8?B?ZDdYU0dUcHYzbHFRNmV2SUp4MmthYVZDajJ2VGxEbFJBdVN4Si9WaEZqUjd5?=
 =?utf-8?B?SW5qL3RwWUhmcHRKUk5FMUF6STI4MFhNNXJ1dmZFalUwcTkrc0xOWGNId090?=
 =?utf-8?B?QXR6ZVFmUGZqVmFkdFNKOXk1R2pZOFkwUWY2dzYrMitoaGxXZmlDMEdLM1NI?=
 =?utf-8?B?VmxBRm9VQmZJOFl5eUcvSHhEaG9LVnFLNXUyNGlSeTFKekQvRjNDL0psQUty?=
 =?utf-8?B?elJmVnRUVTAzQzRPWnBUNmdXd0pGNXVrOEVteTE1ZVhtL0h3SmpoMmRacUlJ?=
 =?utf-8?B?R29Qa0xLWEdvOU5oTVlTZHlReko3QVdkVkR2VzBRdGJLTS9oNFUrK2V6VGR4?=
 =?utf-8?B?djR1N2xFSUoxeGlTUzBIS2xzckZyWmM4K0VVbEkxRXNQTkhvdU41QmwrSWRn?=
 =?utf-8?B?YlptTjduWVFYbG9FbWxkMnQxWExWVEhyVi9WVUlWRml4SW1nZDlDV1I1c0NI?=
 =?utf-8?B?N3hoMllZMEpyaTZVamQ1a2p3eDJheVFLamxVWUY3K29FaExTL0hNbkVjQ1Zy?=
 =?utf-8?B?WHlXUEMvcGd6WFpUTDQzTGNCaitDR2tjVzVqTTQwT2RKcVNITWtWakk4bm12?=
 =?utf-8?B?MVh0TkttV1ZVaktyNklsV2E5ZmUvWGI5YXRXM3UrcDdLeWJ6Mmxrc3h4K1U2?=
 =?utf-8?B?dnFZQnlaeEwxbzhPYWI2VzlVVkk2VkJjTFJNbU8yRk05RjNZL3B6MU9LaHRG?=
 =?utf-8?B?RS8wc2hVdnIxdlNGYTVaeDFEcC9Bb0tmOUVrODlHZW02a2VKVjNYQlRreFRV?=
 =?utf-8?B?aDIwOGhDaGwvQmZkRllLaFo4RDBKMGM5eEp1RERXaGVFRWk2SEVTekxVZFBs?=
 =?utf-8?B?ck9BVGREclJURjNLUDd4ZjVoV2N2ZmpCUWwrVFUzYkRrUVVnYUNvS2lyaEU1?=
 =?utf-8?B?SEVDVVdaVGpRTDNkb1VSRThoKzhYM1RxLzhpZ1lNYlh2blZtMXI2UDRKbG96?=
 =?utf-8?B?RVZWNnNwZ202Nk5CMkk2Z0RETEhzQkQwOFppNnBEQm5CSmc3dUpIRUpZR1FY?=
 =?utf-8?B?M2dnRkV6YnhXTTV5UnRpdC9BckQ1MjdTMmtqYWwvYXNmQW1ka3huTHpTazJX?=
 =?utf-8?B?RXZ4bVM4SGF4V1YvQUpXVXlJTFVaQmlyRHpVd3EvM1U3UjZkdXpraWZzSDRq?=
 =?utf-8?B?SjNBYWJsWUdWUlZ3VFZUc01Hd2xzZ2JXNnF2SUlWbUpxVjVLWFRoT201MXVZ?=
 =?utf-8?B?Q2h1QjdCaDNNZ2Ezb1VQM0I5WVdzV0ZtUFNGYk9xRUxjSDhoVy92dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 004e3c8b-1454-4ce8-4d23-08de4ea3de07
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:51:24.6117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0cK+U1j59mDR7fQ7OSg37a0BqGHDrEkyh2lnao7Aj76zqcwCNB5ONmaoFDzmKANybrqYZlo3KsEdiC4AEqQ7rRIh/M9ncMkcuO0lH8CX9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025131_692969_F6256C81 
X-CRM114-Status: GOOD (  23.61  )
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

Hi Chaoyi,

On 1/8/26 11:41 AM, Chaoyi Chen wrote:
> Hi Quentin,
> 
> On 1/8/2026 6:07 PM, Quentin Schulz wrote:
>> Hi Chaoyi,
>>
>> On 1/8/26 7:27 AM, Chaoyi Chen wrote:
>>> Hi Quentin,
>>>
>>> Thank you for your patient review.
>>>
>>> On 1/7/2026 11:46 PM, Quentin Schulz wrote:
>>>> Hi Chaoyi,
>>>>
>>>> On 1/7/26 8:03 AM, Chaoyi Chen wrote:

[...]

>>>>> +    vcc3v3_rtc_s5: regulator-vcc3v3-rtc-s5 {
>>>>> +        compatible = "regulator-fixed";
>>>>> +        regulator-name = "vcc3v3_rtc_s5";
>>>>> +        regulator-boot-on;
>>>>> +        regulator-always-on;
>>>>> +        regulator-min-microvolt = <3300000>;
>>>>> +        regulator-max-microvolt = <3300000>;
>>>>> +        vin-supply = <&vcc_sys>;
>>>>
>>>> If this is for the rtc, shouldn't we declare this dependency in the RTC device node and not have it always-on?
>>>>
>>>
>>> I checked other boards that use the hym8563 device and couldn't find
>>> a similar approach. Could you give an example?
>>>
>>
>> If this is truly always on by hardware design, then I guess it's "fine". That other boards aren't doing isn't much of an argument, as they may not need it. Typically, you could need to update the driver (and its binding) to accept and control power supplies so that you can link the two together in the device tree. I'm assuming for an RTC it doesn't make much sense to have its power supply controllable as it likely needs to be powered even when the device is turned off (otherwise the RTC stops counting :) ).
>>
> 
> Yes, this seems unnecessary, which is why I'm asking if you've
> encountered similar designs before.
> 

I think it's fine for me. It's not a controllable regulator and its 
parent supply (and the parent supply of that supply) all are always-on 
as well and non-configurable so there cannot be a way for this to not be 
on. Please ignore this comment.

[...]

>>>>> +        gpio = <&gpio4 RK_PC7 GPIO_ACTIVE_HIGH>;
>>>>> +        pinctrl-names = "default";
>>>>> +        pinctrl-0 = <&satapm_pwren>;
>>>>> +    };
>>>>> +
>>>>> +    vcc5v0_device: regulator-vcc5v0-device {
>>>>> +        compatible = "regulator-fixed";
>>>>> +        regulator-name = "vcc5v0_device";
>>>>> +        regulator-always-on;
>>>>> +        regulator-boot-on;
>>>>> +        regulator-min-microvolt = <5000000>;
>>>>> +        regulator-max-microvolt = <5000000>;
>>>>> +        vin-supply = <&vcc12v_dcin>;
>>>>> +    };
>>>>> +
>>>>> +    vcc5v0_host: regulator-vcc5v0-host {
>>>>> +        compatible = "regulator-fixed";
>>>>> +        regulator-name = "vcc5v0_host";
>>>>> +        regulator-boot-on;
>>>>> +        regulator-always-on;
>>>>> +        regulator-min-microvolt = <5000000>;
>>>>> +        regulator-max-microvolt = <5000000>;
>>>>> +        enable-active-high;
>>>>> +        gpio = <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
>>>>> +        vin-supply = <&vcc5v0_device>;
>>>>> +        pinctrl-names = "default";
>>>>> +        pinctrl-0 = <&usb_host_pwren>;
>>>>> +    };
>>>>> +
>>>>
>>>> I assume both of the above are related to USB operating in host or device mode? Maybe there's a way to have something more useful to the user in regulator-name (and possibly the regulator node name) so that they have an idea what this pertains to?
>>>
>>> It's a good idea. Actually, we have two regulators here, one for USB0
>>> and another for USB1. I'll try to rename them in v2.
>>>
>>
>> Are you sure? vcc5v0_device is a supply for vcc5v0_host, so it'd be odd that in order for USB1 to work, you need USB0 powered?
> 
> No, the "vcc5v0_device" serves as the vin-supply for both
> "VCC5V0_USB3_HOST0" and "VCC5V0_USB3_HOST1".
> And "VCC5V0_USB3_HOSTx" is supply for USB VBUS.
> 
> All the names marked here are those shown in the schematic. As you
> suggested, it would be better to set regulator-name to the schematic
> name "VCC5V0_USB3_HOSTx" and use "usbx_vbus" for the label.
> 

Yes, that does make sense to me.

Cheers,
Quentin

