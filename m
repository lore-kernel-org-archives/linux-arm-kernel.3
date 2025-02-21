Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD930C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ea+jJjwioHF4EZ/P8r/ZAhJa2ghrs2AXUEfztQj9XUw=; b=kckZDC8oiFlynqjcN14eir7Aa0
	rl/Q4jNC+695lseof1o81i7XG+l9YkyQbVL1XKc0+0RIJOmpisVKRwgBmK76cpBTy0x/sKtvNtCjY
	UN+tizTDTF+ks5B2e0jR64ihnCY+ofbuwbnJYbpo10JXKpLt+AiMzeNV8hCIGrg+WwunCWC4DuVdt
	Ne4jL01qngHeseDjbEvWNgAtFVyXVcdxaqWGiI1Au9IKrkkW5Fn4XF3KzOJuuao8i2hd7je9CcnzU
	0Orum2LOw6EwrbLCOeXY4roFjgeO6ldGsejROd3s5Hq4YVbiRs+a5bfmahsiNjtw3tPxJSKw0nIFb
	c8qgva9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQ38-000000058DE-0PnY;
	Fri, 21 Feb 2025 10:14:26 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPqz-000000053Wc-43jy;
	Fri, 21 Feb 2025 10:01:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEVRkkwb9ACqvWotPca7mudS39Uf7isS4Az7qIJBbmIDl5jHdye13/iKCvf/59NUKq8JdLbPIblTctUD39qC3hU34XOXXe6rmutEXffRKSSmam2OmOr0PehqEHbRz5NXsEFYpiASRZRR64oVT5QE9DiYEhg5vqJJuy8EVVNdPiX6LdiIgNcAD9ExUYyK48t6KJUVfkZVQcQ8KOUh/oTHtwIdyNtEUkCUbNqWuiJ84beKtW99jPE+UADDBXq0PtB5JTU/mSMh8RfBS2ynl2TmI/M6nbaivZLBXfHSmKv3JU1q9D/iMEzNDaSrQUuKiIiTHGEimbJ1/RPGfhyaLG/1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ea+jJjwioHF4EZ/P8r/ZAhJa2ghrs2AXUEfztQj9XUw=;
 b=hKoge4fr+Iyu/+jq7X7LO70zTJKy7Re0UKROG3lZFyUY/IyYB50RGqPx+0qyauyfH9rkxscOG+qEsXRIVBgbK8BtQ37q2TgquN091VDOTkuDRbmxmpif/nebdK5dw9M9jP6i6ADXgiibC/aFW5bZvJHfVI0YewCJAd2kfi0WMQ+dyQ0M1ppaL1vDIoXxRolSRQBJjHE/FdTjYa5Bqb0ou3/JM5cA4VzP3ZQlwfVBuljkW/KetXvgILLP7eF4a7Ve1fJpwwCUDIgukr5NzHezAjTkNapQj7cx3JbT+wblqzcGuoirDVryMBquO6R+/nzeWMD3LrtrIADNqABPNbP4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ea+jJjwioHF4EZ/P8r/ZAhJa2ghrs2AXUEfztQj9XUw=;
 b=nHeRmOYlTGG2pyKuwjUhQWR5a0kypEJxxMSO1Ak56Hg71qhcDkNeVXm5C8PCoEacbGtGGA+oUGtxmf9nWBjwrsJg1FGGGyD2Si/wcGz3BUtUXEaayNM28yCPAwJNWbf39tHYZd/qQ0MKtJGlEMZozhWc49ZWvLCELMdJEHHtJRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10695.eurprd04.prod.outlook.com (2603:10a6:10:580::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 10:01:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Fri, 21 Feb 2025
 10:01:45 +0000
Message-ID: <f9b40055-bcb0-4245-b899-4c7890e81b20@cherry.de>
Date: Fri, 21 Feb 2025 11:01:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: dts: rockchip: pinmux fixes and support for 2
 adapters for Theobroma boards
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 stable@vger.kernel.org
References: <20250220-ringneck-dtbos-v1-0-25c97f2385e6@cherry.de>
 <174008661935.4046882.3221866764998287397.robh@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <174008661935.4046882.3221866764998287397.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10695:EE_
X-MS-Office365-Filtering-Correlation-Id: 68228041-4317-46fd-5065-08dd525ebfc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTlkL21LWk5qRG42VGxTcSs0OHc0WG1COE13cE14WGtBSjh3VHU3NE5waEhp?=
 =?utf-8?B?OWd3c28vYkdoQ1pLaDRTOWVXcTJTVGlnV0FjSXVCVmxBU2ZkNURqdUZqWlhU?=
 =?utf-8?B?U0JFUUZrOTRvRDY1Wnd0SnRYMVF2bGRENGtUaXBrV1Q5V2V3Y3QyNzhGbXR1?=
 =?utf-8?B?dzBGWFBPbWcwS3ROS2RHT0dDbkU1R2pSOEhmUEI4NXgwMXR1Sms4aEhJd0lD?=
 =?utf-8?B?NEdUdmtESnlNWWNQWTVjdE1nWTJjQUtpU3U1NzFhUTlXMzZKMU1kckVpbzhl?=
 =?utf-8?B?KytCRGtwYTBsc0xUY1NlNS9TbTFJUWNuM2NJeTBQTDVqU1p5VzkzNUxHTGxh?=
 =?utf-8?B?b0kvOEpueURRRTIvenkxcWNqRG85ZkRzOU95c0pwT2lBS2xPSlkxMXlFU25i?=
 =?utf-8?B?cGpnMzNJZnhqZGltalMvbHZseXZTKzhGQ2Y1VFJXRU5ScXRGTHVNSHBuTCs0?=
 =?utf-8?B?Zk15QXJSYVlZY0FLOXNYa1lYMlA3eVhiZkNPMUU5Tk9jSHhmQUtWZThNSGJR?=
 =?utf-8?B?azhpS3kwaStCVFZpSko1V2xlWE1qaE9RUytTVlp0ZnJ4ZUgxYWxVR250WVBs?=
 =?utf-8?B?OS8wRFEyaUVaWkgreU9Id0xGNUQzZXUzbk9MVmF0bVdqcS9iekNNYUFmaWVq?=
 =?utf-8?B?cUhTdEdaUVNGakZQMjBaZFhiL1dFOXpreHZVaitrMEhpeEZWdGdNRmRLNXEr?=
 =?utf-8?B?djEwMXFKSHhaZWYrRVlMQkl4K0tXaXI4UlplektiWnNDa0xlZlVqSXhXejlR?=
 =?utf-8?B?SGUzYW44V0FIS2tJd3VHZnNGY2U2SGVxeWVEeXNndUY0TXgwVXZMOTZIMmg2?=
 =?utf-8?B?SG9QODJhc0pUR2lSTzBCMUY2ekxiM29INjJYVzVWVVBTdGNJUWlKYjk0NTk3?=
 =?utf-8?B?MTBqQXkwSEcxVGxRYUI4bTJyWmFpOGRGa3YrNTgwV1RpWGY3TFBoVWZySnlF?=
 =?utf-8?B?Z0JXVlgxQytTdkxkTTlPdUtpZUVldnV4c2ZManorK2VCb0xIa3ZUanNscmlN?=
 =?utf-8?B?SEI2bnhCaGhzdDRyWXgyVkp3MmNQMzZtc0U3Z3BVTTdiV2hRMHlFdHVabEcy?=
 =?utf-8?B?ZGE4RmlYUzVSeDZncU5pZkM3d2JqNjd3RkwraHJiT0ladW1LdHZyRGtwVWdC?=
 =?utf-8?B?WnYyMjUrVzFHSTVBVnQ3bGNpcFF3MWVId3lJRU1JTnBxb292SXZmRjhvb0Uz?=
 =?utf-8?B?aDdWd0twVzlxcG1WYUIrc2xJZGw3OGZuMzRVNHYvcWNPTGRxZDBBTVBxKytB?=
 =?utf-8?B?c3hkeUZnVDl3SzN1YXNEYjlIdVpaNlJYYnV5LytxS0lNUThNQWdUQU51aUNt?=
 =?utf-8?B?SHZVQmZXTVA5aXZwMjF0RGpDSEVRMEo2VCtuYVNaSUVWTnJWYlk2M0d5bGNu?=
 =?utf-8?B?L3FReThiWFBCN0RzZTJNS0hKcW9EbS90cFNIN3plSUVNeUxNR1Ftc1FCYktP?=
 =?utf-8?B?eXlNK2p3RUFsY1E2dTRKMjBmbGRVNVhpMkJ2NTZxOUs2dUFYOVBZeDdnK3Ur?=
 =?utf-8?B?d2tFbkZPaDdTd0Mwc2h5ems0ZWtWOGlRd25raDRQTnhlQVRySEtGalpYOXBW?=
 =?utf-8?B?RFV1S2NBMmhSVGdQd3Zic01aQXE2N3VlempmQlBIV1N4dnc3VjFVcEF2NThY?=
 =?utf-8?B?dWNMSjI3TUFaSkhNckREci90ajNzcWM3NzlQOEdwZVpodExORDN3Q2U3MmZB?=
 =?utf-8?B?elZZRE1TNDZ1SXRSQVU2WURtUkhheGVLbEZvNStBaUhkQ3B5bW9zNTlYTTRT?=
 =?utf-8?B?TDhibUNIbmNUSjlrckI1c3NhYmdRNi8vK0VHeW1LeVJ0SUlDWnZESys0bHk0?=
 =?utf-8?B?Mng5M3pGOTMwRk1QOGpGQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVE0QTVZRWVaUWpxV3JnZU8vck5kQm5tUldjVmh0VGpzSG1pSm1IaUR6b0VH?=
 =?utf-8?B?R2Qvc3Y5bUkvWmZSdXU2dTJGcGVWM3ErUTZ3MjVnZHhGb08yQmJVbzRQMjVM?=
 =?utf-8?B?SW5TSUZ3UkZtVThwR1RBVVFvWi9GajQ2Qm10SENETEFtWDBsU0xOZ2JXNmdm?=
 =?utf-8?B?L0hvMWJ1SlhPYVVuTk1KYkpoandMc0pYTjNsSFgwZzRiTDlPNThKd3BiVzZr?=
 =?utf-8?B?RlMxQkg1RkFsQTV4cGhHL0I1eERQSTBkTlNqRk91ODEwQytmTVE3U1cvb1pj?=
 =?utf-8?B?N0VVUU9oSGhOczFneXZnMVpHcHN4ZkRvaHhiSTh0dzVEUFR2UVpFRDluY3My?=
 =?utf-8?B?Q3Z1ZVo1a3N2RW5oUkoyVGZpVEZDRTN0UzBzeTF2eEIzZTM5d0RnSVBNVEVG?=
 =?utf-8?B?WGhQWGFxR3NkUUl0clVnZkluZlRyVUMvY0NJa3RqeDJpTllnQ3Y2RnRPQW1m?=
 =?utf-8?B?ckhuVFM1NGRleGhHWC9iN29HYTBPLy9wZzVFVjhzZHpGRDUwZGE4V0Exdmlh?=
 =?utf-8?B?dThSRWtGQ0RQQVQrVXRQMDRSYnF3T3VKRGJhNjhXeTMxVURQV216VkxzRGtE?=
 =?utf-8?B?MnNpOVVTU2xTMXo3RDNzZlpLZXBJc2M3bDdoeTUzOHF0dktEQXVLaXdoVk9W?=
 =?utf-8?B?aWlxeFRrSENhTUxLL1RFWjM2UWFXMkk4amgzREtEUGtWSVFMMkg2SkxYaTJU?=
 =?utf-8?B?cHBEckE5WWJPdmUxZnNUaVE5ek5JVllWUzEzcmlNekFSbXpmNjNZZlVZdkFB?=
 =?utf-8?B?dExaNVE2d0thdnhMNjBaQjBLNGpkVExrQ2dYbEdZT1VDK1ZMeXFXRmtzUEk3?=
 =?utf-8?B?T3U3Vm96Y3RBWXBhZkV1RE1jOSsrSktHOFhmQk1WQ3R4MitUZjBzOG9udEd1?=
 =?utf-8?B?S0VMOXZuOTJUYTNqcHBieUFiRFJaV0hXRWRyWnFRVFFKcFY0TzloT1hXbmJn?=
 =?utf-8?B?MmNIUUtvTmRab1U1STdyVjNrU1EvTzI3SGF6YlV6TkJCcUVkWWs3d0RZdnMx?=
 =?utf-8?B?MVdPT2xmMmFIV1ZuVzJCb0JxYzc2V1VZRGI2SzFCaXZLeUZnVHlUcmdBN2pL?=
 =?utf-8?B?UVBhdWJhdzUvUlBFL0JQalZIbW00U3hUVml0NitjWE5rYzV4b0N2cFAxc2ty?=
 =?utf-8?B?clR0Q29Xc2tNejZxUFN5bDZicGZLcXZFRlo5Y3FPb1RRN09vdkxQaUdsVzV6?=
 =?utf-8?B?eG5GaUxJSDFmejdBRTU5bi8vaWFDN2h4cVltRVdlcFlTWDVGbGVWelFDN3JB?=
 =?utf-8?B?Q2VVcFljUDdqZHpja09MYU9yeVJOaDY4S1pTRVFlWTJWUElUOUJZSmpCRWQr?=
 =?utf-8?B?c1lZWDhKbVI5SEk4UVljYkZtUnBSeUdldWRjNEdmRTJjdzdPTFlyTTNDVDRX?=
 =?utf-8?B?eVFRbVZQNmVma29aZHZ5K3NzSTlydGVlWTRNUFg4NExFenE0TVE3eHBMY1Ev?=
 =?utf-8?B?OUNnOW1STEJzYnlMbjFUSTA1RGQxcDJIZHh2Q01kOFNVSmFjZnAyd3o0MUQ5?=
 =?utf-8?B?S0F1Tnp2eStRak5hbGxjZ3lZTWZHVTdtU0NmNEZ5UUtHSW1TQ2pIeGNNUmVE?=
 =?utf-8?B?S0tzL0xhcnVMdDJpUVVxd2RDVnlaK1FRaDlyNEhQWjVCUW1hYWhHNDJxaXRU?=
 =?utf-8?B?dy92cTF4NVNwemt6eE5kV25qSVRFL2YzMm5oMkdNOFFyQ2thNDVDWUhVNHVX?=
 =?utf-8?B?dEdNRmhnVlNCMGhpeVFaWXkxOFBiN2R4anFXNTJ2b3BEbkVTdThrZUltRFdL?=
 =?utf-8?B?K1NQMVhpRll6WTNWMFh0dzZNaHZ5YU9xVGxYS1J5a0JsREdZbUNUTWhGcG9P?=
 =?utf-8?B?c2xCbkIxWjNNT2FZeENsVHB6dkpIc1laQU0zYmtmNDB6Q2YrRGhsT0VYQnpH?=
 =?utf-8?B?YUlMMzhwbnN3NStLYWFaOUFxb1lTb09DdlN3UU9iTGFYQUQ4S08rRXcyUTZP?=
 =?utf-8?B?aUNLNDZrWklBNDFsTW9ZSm41ZGtZQTd6SzhQV2dQdDNkQWNkYmIwNWhNb09h?=
 =?utf-8?B?OE5kVzhrOHc4WEU0aTJKSXNCSS9LamQydHY5NkZFRHBYVHN0Qnc4eE5QRjMr?=
 =?utf-8?B?OWVvOU1HRkEwNlZ2c05oVURJaVNWMVV0eldxeDAvWVpFQUlSSTlabXEwbUVQ?=
 =?utf-8?B?eThhNFNsbjdKVzEveG5NVDZiWVpaTi90MG93bEJnNm85M3BKNXRuWEszb2Z5?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 68228041-4317-46fd-5065-08dd525ebfc2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 10:01:45.6186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZX87IXpcBnoV6T1I1dBo8FgofW4J0hjUilNxceND7xRklUbX4THcx3PJsNOIT0bIixibA5Ir64AQqNBJyFyfAg66mv/v4L2RG0OXRBTGJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10695
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_020154_023173_AA40BDFE 
X-CRM114-Status: GOOD (  22.40  )
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

Hi Rob, Heiko,

On 2/20/25 10:29 PM, Rob Herring (Arm) wrote:
> 
> On Thu, 20 Feb 2025 13:20:09 +0100, Quentin Schulz wrote:
[...]
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250220-ringneck-dtbos-v1-0-25c97f2385e6@cherry.de:
> 

$ make ARCH=arm64 CROSS_COMPILE="ccache aarch64-linux-gnu-" O=ringneck/ 
CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/
make[1]: Entering directory '/home/qschulz/work/upstream/linux/ringneck'
make[3]: *** No rule to make target 'for'.  Stop.
make[2]: *** [/home/qschulz/work/upstream/linux/Makefile:372: 
__build_one_by_one] Error 2
make[1]: *** [/home/qschulz/work/upstream/linux/Makefile:251: 
__sub-make] Error 2
make[1]: Leaving directory '/home/qschulz/work/upstream/linux/ringneck'
make: *** [Makefile:251: __sub-make] Error 2

Is there a way your bot can provide a command we can actually run?

I believe for me it is something like:

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y $(for dtb 
in arch/arm64/boot/dts/rockchip/*.dtb; do D=$(basename $(dirname 
"$dtb")); B=$(basename "$dtb"); echo -n "$D/$B "; done)

> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dtb: uart: uart5-rts-gpio: {'rockchip,pins': [[0, 13, 0, 147]], 'phandle': 70} is not of type 'array'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
> 
> 

I believe this is a false positive due to the node suffix being -gpio? 
If I change -gpio suffix to -pin, it doesn't complain anymore.

"""
diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts 
b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
index 08a11e4758413..249e50d64791e 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
@@ -196,7 +196,7 @@ sd_card_led_pin: sd-card-led-pin {
  	};

  	uart {
-		uart5_rts_gpio: uart5-rts-gpio {
+		uart5_rts_pin: uart5-rts-pin {
  			rockchip,pins =
  			  <0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
  		};
@@ -234,7 +234,7 @@ &uart0 {
  };

  &uart5 {
-	pinctrl-0 = <&uart5_xfer &uart5_rts_gpio>;
+	pinctrl-0 = <&uart5_xfer &uart5_rts_pin>;
  	rts-gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
  	status = "okay";
  };
"""

@Heiko, I guess you would like a warning-less DT :) I can send a v2 with 
that change then if that works for you? I can wait a few days for other 
reviews :)

I'm specifically avoiding naming it uart5_rts because it already exists 
for the RTS function muxing of the UART5 controller and I don't think 
it's appropriate to just override it like that.

Cheers,
Quentin

