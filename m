Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BF2E9D414
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 04:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liV2N85NQHUcv24R+1eqADkjtfxrvuxosHv4xlcZFvU=; b=SRdVZ/LUwKwA/ZVH6sHLxeuk6I
	vXu3Q2HeF4laWlRMlrkSPVJNC04uPB0iXFdVLhK7CGL0dtsqWHP41eXShzBMAQtjUUdN9zlN8YUNW
	IvKbwqnfcE8EAT/3M9ULN9e3R1FZ+BLxF0BgC1uu/sY6eM/vzs/neRCdtFAN0ph9LDJcV7/sSzg41
	ivPsEi8iTwjnvoBWg+lcZdjO7kD7Gl6l43pqVSb8qDcHzGv+YpRXcA+TKz9eYCtBDvUqh5Oed78Or
	38oitdxdq8BL76pbJx9ElsWYo3Qse7WP/17+NiMwgGWcPekxErzmLPuGOA80xPgfxBZMbYPTWegXl
	goMO5rbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voDes-0000000ArMc-3IVV;
	Fri, 06 Feb 2026 04:41:30 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voDep-0000000ArMB-2djw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 04:41:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4XwI4h5JgIcLQmR8Wc/FDlBN1/CEcy4vsQ6JArELLuyT8Do02Q/NEV55iwHkr00385pM6bwV4lMtTkTdbJeAetBMAQaPOQWom/QXIB9I70DlGp6ous144wGBqluJkyyATOuUG2YSBalLNFE1E6fe02SjAiU3JKshoK7kJnad4m3Rdz1cnqo+xzIYxHTDaCONqawuEVso7dS+N9nZMwZ4PQLxVdeRDNJtPGdKsX7ZBz/YZ8oYx23gq3fRRHxNXz+S8FG8lzWwHxCtA8/FnGj/+EvcSAdUO7DZwZL5XVVkJGFrwiFqLLqvZNMKXvYe8gE4qr+RklhX82QDG+Abuy2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liV2N85NQHUcv24R+1eqADkjtfxrvuxosHv4xlcZFvU=;
 b=AFHl3Y0yTM9UeOcibiMYPDiwU4YfemmUo2fzANNVcx/yL34QbnfbsX4HzzKN839iBM6es7ncjFhHTjg7F9zq+nRSa4MRk9dEr6kPqO1mGlkxCPj6tNonX6fdD/tSHnomQsPpVKolAUqveVlG4p6Gf8NFkf3uOIgxcZHdV6QGF+P+0NMZlEwrUieuapPk/6KRY5rJZHiDU1ZyX20fSRF0joCxMx7q3LoPSpvL03ijScIt/+6OlkTmvAyWVLb+xNpKxhsRU7mb8F1hQWVdfRR5jX8ab6zsH0iL0cGT8JrzVGU70q/CaB/Eff/Buu5e7ipIeJSM5JFRPiO8gVF6S+HMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liV2N85NQHUcv24R+1eqADkjtfxrvuxosHv4xlcZFvU=;
 b=J3qtyVhTaCN4dKnhd3yvX+B+4bS3LIcUIggu70vVL5C/M2uWpxC6zgJhOkO/jOLDs3cRfnZUnRfS0zVu/4/Q4wDWjcURCcsqyc7PxH+2deU+Lu8ejo6UaRbW6lX8wm2meJn/ZPSgtWoVCC5zInfZhx5FOhCKOmmOLOJUALmtkWw=
Received: from BN9PR03CA0617.namprd03.prod.outlook.com (2603:10b6:408:106::22)
 by IA1PR10MB7166.namprd10.prod.outlook.com (2603:10b6:208:3f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:41:21 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:106:cafe::b3) by BN9PR03CA0617.outlook.office365.com
 (2603:10b6:408:106::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 04:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Fri, 6 Feb 2026 04:41:19 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 22:41:19 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 22:41:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 22:41:19 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6164fEve517591;
	Thu, 5 Feb 2026 22:41:15 -0600
Message-ID: <3bac0dc6-6e58-4a04-a0c6-a6646e261f6e@ti.com>
Date: Fri, 6 Feb 2026 10:11:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: boot: dts: ti: k3-am62l-wakeup: create
 label for target-module
To: Kendall Willis <k-willis@ti.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dhruva Gole
	<d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260127-v6-19-wkup-uart-wakeup-v3-0-e7ccac761f3a@ti.com>
 <20260127-v6-19-wkup-uart-wakeup-v3-2-e7ccac761f3a@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260127-v6-19-wkup-uart-wakeup-v3-2-e7ccac761f3a@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|IA1PR10MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f762d9d-2d34-4f41-ec2d-08de6539f919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2d5TnE2S1lmZFQ2djVqME9WV2pUWTlwVisrKzVLcFdibDZFb3lwNUZEWUMw?=
 =?utf-8?B?SVl2TGo3Ym1OMXdxRG5MUVNEM3kzNGxqSVIvWFNrbzJrTWZZOW8wazNtbmxX?=
 =?utf-8?B?NVFWeXZSbnVSUmpMUUcrUEFmNGo0RE9ESnFZcGlMWVNiZFp2MUtyMFA4enln?=
 =?utf-8?B?UXdDQ051Yi9lNFh5YUp4ZlB4RU51NTBXakdHdnNSdFNhdGlGb3VLYVlWcjYw?=
 =?utf-8?B?YXh6aWNGWjE5cFVKdS9odW1aTDFvSGdqQXZIQjMrRWk2RnpzWExlRkVGZFpV?=
 =?utf-8?B?SzA2SU5RMDg2eEhCbDk1ZTd3ZDJsNEw5Z2oxY1hzL3NMUzdqSmlESFRpWU5Z?=
 =?utf-8?B?cWMySUh5cy9lNlA5OU5lQjVUYjJQQUw2bENGV3dxMWdQT1JlTVd5TTMyNllX?=
 =?utf-8?B?em5kN2hrMVN4VXlYWEs0Si9wZnExYm8yRFRTd2toS2d6NzlTSGNnMzJqMDUz?=
 =?utf-8?B?ZHc5QzJkd2tpVG5uU0w2TkRGdnZZSEJaRllSR2ZwallQbnlEL2YramF6Zlll?=
 =?utf-8?B?QWh4dXRHT1NSYm1RZXBBck5zM2swRmNDL3RjOUo0MGR3RjdzZzVTOVNJZnpD?=
 =?utf-8?B?cnpOTUY1TUZHeklZVDJ1eEVvc0hsdFI5ZG5xQVFabTFyUlFnaWs1cnY1aldm?=
 =?utf-8?B?dkRyZlVzcHNyazNnUWU3bkNFM2ZSV0xtbHVleTRuSjR3eG5nZjBDN202N09k?=
 =?utf-8?B?djFOaUFqWStnSTJmM2lnNlB0Y0E0OExmK1JzMTZqNEJWMkt6cDZUTEMrbkZO?=
 =?utf-8?B?WHk0cTduZ0x2bkZ3M08yRDhlUkhFUThLZXAvRGlMNXA4UDJ4dUIrMkVBQWFu?=
 =?utf-8?B?SFA3dFBuTmNITlJGTnI2VTJlS2RCbWxZcWZnSnIxdlpVMmlhcGxlLzJoRWw5?=
 =?utf-8?B?Wks4eU9sNnVCU1lodnBxVm1RUHJaR0dlbmhnOVYrTHc4MkdkcmJNcmwvcXBE?=
 =?utf-8?B?UE1VQlRjc2sxcGFxVklWOTZjUEdVMzlBMGZuWVJzY09tcHpIOU9sUlEvTENs?=
 =?utf-8?B?N2pwUEIxZ2U2SDUwTE05RkJGNVBoamhxdm5oSno2aFJQb09ZV2N1L0JqQlU5?=
 =?utf-8?B?QmtHakhqS1ZuNGxYdXFQYllScHN5MjFGU2N4YzVNY0x3ZkpKN2dFVWlJWXJE?=
 =?utf-8?B?NmhBM1NKdHpQQmIralNTVkdSdkk5anlYdGNmM1QveGRGaUxhcjhOWElFRGp0?=
 =?utf-8?B?T3ZaREZDczU0NGNtbnFKK2F6NEx4aHIxSEtMSklPNlZqNmZ4YytBWGdhR2gv?=
 =?utf-8?B?WFJ1OGxLcUM2TWtUd3dWQm9BS1N5eG1rRTgzUThyS0grMUxaYmpjV0JZRUgw?=
 =?utf-8?B?MkU0R2VLSW1sZkFXdnJOaXp2UUpyYTRjWndRVnVVajQ0Yk9FazVXY0JTS1dS?=
 =?utf-8?B?STJGL3lOU2I4Q2hLRmFCNG9Yd1RIYWlINURzSzBIZjFlclFJWk5RVmpWWEpl?=
 =?utf-8?B?SDJBZDZwMzFaaVQrRWNkdnIwcHNDaWt3YkZxbXBIbzVHYWI1RFVXcFNoek9P?=
 =?utf-8?B?Yk1RQUdmalJjbFQyaFpXWFQ0M1RRdDlLakxQdG1WMVpYZ2xDb0p3cVQxUW1q?=
 =?utf-8?B?UU5PQUVra1FGMytkZXd5SDhsbWhrRUZBYnJvc2I4b0ptemkwSWl0UkRxUzM3?=
 =?utf-8?B?UFV1U2NIMW4yZUs5SWVsNDdDYlkzOWlodTlORDZwSlNsWUsybEt1cEZLTGdL?=
 =?utf-8?B?dXlUcXFEaVBJd1J1V0U1RXVZdVRCbkM0S21QZkZzbWZPc2xidUQ1MmxLZ3J2?=
 =?utf-8?B?ZXRDQWRVZjhVMkQyVUxYZ1FHYlkzb3pTcDVpNW9Dc0lUVWJWWDNJT294TkR6?=
 =?utf-8?B?ZU9KeW9KNEZpNFVmSWIwK2lTZUJKcTdmbmhjdGRUcXF3MjZraFBJVDl6eGlx?=
 =?utf-8?B?aVVnNkRkS3ZqUy80M052M3pyeTFqcXhXT25ra3ZuUEJGTmJzTm9QSzhUaTdl?=
 =?utf-8?B?VEVQVVVZb2xhcmR3aGpOb3dydlVrSm9vVGhKVnYyY0ZnUVZmV1l6VVNRc013?=
 =?utf-8?B?cTRKY0V6eGZGbVpCRkVaRXFrNVBTaW5MZXhmaHVRQ2M0L3JIaHhkQUxjQ05J?=
 =?utf-8?B?RTV0T0t4K05La1FsSC8rTnNCc05BcDBOUXBuZGxKTU5UeCs3QVZVNndsaXlC?=
 =?utf-8?B?LzVEYjZhYVZPYVF1K213bnQvSS9TZGtUK3Fwb0lJWWNnRGJnREZGeVNPR3pq?=
 =?utf-8?B?NXczY3JwWlhGMWoyT2phbmhQT1Fqd2g1dms1TmVlR3N6aGlIa2tZcEJHZERs?=
 =?utf-8?B?b3pjMEVwMGlCVTFGYkQ5OUsyRXpBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wUl0vdODou3oHF/atQei1zbSasquQJrVMoC0GD9HHWYiGhN7+f1STv95YwmfIGDmkjqMHVUc622aXE3z85ccr+P41YeVYTZDA/EaNZ5ia85n77SCtCCKOy8JNSUjlf2H97OZW0eb6MczQ2GYh59d2gd2jD3+d7MYwcCWAppaNHg4blZ/D15l8SI9BzGqYjv0U+WW/AR/J+k7l88oA0UGtu68+VEV2Sl2d3PNaIMhe5M+Uo79fJMYpXu5APvF+wqpSy33lc1TqQXfLbHtW5/rfPxWckJowzxTyFmOc4YD0D5LQm0iEesSEZOaWPjsdtLWkVwc1fji82oVRqLkDooIc2+ocyoRaTk5/sSou9CE3VVKMkGuTABW7sqUWhbtRmYHT9ikOipaGyqZ0BdfIL3onI7OyYHSazQNW9h7wLCeZihxVo5oitsOUTIYNpbHJdFl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:41:19.8802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f762d9d-2d34-4f41-ec2d-08de6539f919
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_204127_912162_E1E7D50A 
X-CRM114-Status: GOOD (  13.23  )
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

Hi

On 28/01/26 04:09, Kendall Willis wrote:
> Add label to the target-module node so that it can easily be referenced.
> The node specifically configures the SYSCONFIG related registers for WKUP
> UART.
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
> index 61bfcdcfc66ea8d802a36ed43cd01fbbf3decc70..e9d638d9ffd3a52aa6e0df70f6003879bc292358 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
> @@ -81,7 +81,7 @@ wkup_i2c0: i2c@2b200000 {
>  		status = "disabled";
>  	};
>  
> -	target-module@2b300050 {
> +	wkup_uart0_interconnect: target-module@2b300050 {

This is not an interconnect node, so the label is a bit misleading, just
use something like wkup_uart_target or something similar to how these
are labeled in arch/arm/boot/dts/ti/

>  		compatible = "ti,sysc-omap2", "ti,sysc";
>  		reg = <0x00 0x2b300050 0x00 0x4>,
>  		      <0x00 0x2b300054 0x00 0x4>,
> 

-- 
Regards
Vignesh
https://ti.com/opensource


