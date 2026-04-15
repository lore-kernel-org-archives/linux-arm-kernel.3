Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48E9F4198B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpSp7DK1DuZnX1F+XHa0NKp6xj3zqklTWqMiKU+bEH8=; b=jVlg39eTBw16KkcZtNki8V8qb+
	2TcEyIzEB0UgtRteTMcOR85qXbYdN8HOpUN4BmnJDnz/X3lFmrYCVLrXyETTTreevMMAX15+Y48DR
	4njWU+jhFyusFQqAhYJkbJ0WW20Bna1tTIRuJ35GIyv1bYFgn6OmP7HNCkLzaOQoB40BeaHxQV8Qb
	2X9Gso7bCiuHrfAFGliFZ2A4tOQYSZ9yy34EUpJX3n58rLVNb9+WIkTOgOQTijKNZA61VrSMiXqU+
	9/HT+EEroZDOFc87inCAkJp/pIs/dHWO1QoYYcu3y8vzoI5dpGIppk1K1s3mRe+sW7CEITOtSU67S
	HWiARmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyPz-000000012cl-1rSl;
	Wed, 15 Apr 2026 11:28:27 +0000
Received: from mail-japaneastazon11023093.outbound.protection.outlook.com ([52.101.127.93] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyPx-000000012cM-2vTH;
	Wed, 15 Apr 2026 11:28:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzA+j9aYQleeEJF8iC77AEksQ74nuF3lc4FYsFSbXqRq8d3269/WumwxRPSjzRYeJ1umm3OXKsAzkRNdUhq2st1IFynDHANBAHSFC4hecOuyPbB9exlAEE14x/FXBxvOd3236HdGufE5GdCaBCsIcUGB69EoAETLhGyIbmBpG99qBY3ePis0iQn7HOrBUPVO0Pn3DfaWNEeITP1I5RuKNV9kQKMSGtjPJQ+2V7o+cqejP/Ac+jbIf2kxZmZVlwqW0O5hHiPBrENkGpfGBPiiOAZLy3lVuwgaDxljbHExHkbAjivMce0YIBhbYbKFtsB2+r8QBmF1WkECKa+e3kA57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpSp7DK1DuZnX1F+XHa0NKp6xj3zqklTWqMiKU+bEH8=;
 b=XIs/5EPdRj98mVJckqt5yvxgb5TS2xU5QHst7z6QLKre037myeI9mTp8BU42dviX5s34lox7UzvyG4z28EQsG42Ia30aDEcTdiuE0/moGvQk96cIaqX16Q6Pf+rxgkRoDAhQTbUEZWg7RFGAnjSGwg/hRQNK0ePeG3TUIv3R8YiSZX9s054joH4/nnS5k6aR8O9vru+cjYp9Tff277+u1aRYgkw6SIEDHBFO/cTQv2zj5QC03aOfMZpbaUfUJT2D03qOGz7hrhI3Ythc9uE3fHLDLgSPQgX85xJshcgGJt5vVrHJlT+67wagD2znGJn0ovaSbMzcEzMfx9YLWO0/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpSp7DK1DuZnX1F+XHa0NKp6xj3zqklTWqMiKU+bEH8=;
 b=FcxzOncBFrMaMAhQuQE2eIzjwpePaWKqMy7Zz4Y9GztZMfqe7mRwSoYYoxwm7pKaMWfqDjzijixpKhH4fJXl6SIaQe2xVW1etfQ63IFnHrlFgz70zZIIER6q9ndK7JOPDZhqiXGyA6kiimcdv+kyY1HQZAvIg4w0wi9ODkwHaXrRwibpMu00bsdeFv6Oh8cRafo7PPvhhfIKfkCzcRtYENVknc9byjdHAdI1DaLDwkUDb5mGh7eHddvayIZmICjDug8HINQJWyTz0q7pF8vJefy54yNG8iX7vZNvXkliqjNkOeQ5enIWfqC4jTGrGettxZ2vWV7u4VHgACyX8G/Q0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY0PR03MB8173.apcprd03.prod.outlook.com (2603:1096:405:1a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 11:28:17 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 11:28:16 +0000
Message-ID: <956625df-0a80-4d0e-9bb7-8071d5797748@amlogic.com>
Date: Wed, 15 Apr 2026 19:28:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: amlogic: t7: Add uart_c pinctrl pins
 group
Content-Language: en-US
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
 <20260415-add-bluetooth-t7-vim4-v1-1-0ba0746cc1d6@aliel.fr>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260415-add-bluetooth-t7-vim4-v1-1-0ba0746cc1d6@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY0PR03MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c97029d-b312-455f-875e-08de9ae216a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: ky5JlLd9ivtsZX9TJWZM8Mfbsq6beSd49OfBA03CCbgxcIXYw+n2lrhTT94SCo9KogAmkS7XmyVvHLQJQZSAEb+kKthU9PmrHlmTyyw4fjRgvm68jN2fspTUdN484q0KJvaqc1bTIIbPi/Z1d1I9QneMMl1LrczOqNEbW0Qzl6J1YIzJ6UuORZuUXhJpQvj16PVVe4dZP0OlAZlckNnuMZt5HKTvAuowWEa0BPrJlda8X02/Seqvbh37ZO/uIuooezQB3bw5phzT5jNphEgLu7f72D/6sveojUeL9Vgy518nxmeKJPdc2UQdDfSXi43I98OBm9Mf58E+dEqu18fINhEbFEo4RjZttvn6jKjgH9B0tShe+i8cGlrI2WTMObSqtnVSLm3oFcN/BSTfTu7tSNr4jQPeNCK8Gu3QT7B4N3pEMgqft6d5z03+JYURoiyrgIkagunJQrNiM8NbL4Tyky5118xBZPgJvvRiHbFFMS7OWKq6oZOXBNSwfZ71DpFok1JVTlNAptcVofupqurWd2SqVtKp7z0azrNfBDsNdUHs3C09fEeH8QakLfSA4LGqjR1iSNAW8HitglFarM+IePKGW1xUYtpT+9MUddmOiXy3Z5ijogARAHUVsM4VhQDWAiNupAtriWQeMyu5fr8nYGWC5V2Nxi5BYNlTVW3cX2qb+0mqIEFo6aXmfs7ttk/7CHR9tMv8FanFNIupdaisRolR4Sd8CT4tCtTRjYYXAQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckVjNXlrSGZLK1hTaWY5Rk9iVWtMYzR6OWU3RHgyMFE2cFkzeFdZc3VlalFX?=
 =?utf-8?B?S1FpWm9OZ0N2aFBzNHB1UXFsSVd0R2tZZFVGdWQyS0U0eGpNOG16NXNiMlg0?=
 =?utf-8?B?OU9oM3hnMzJTUWN2RHcrdEk3bDJhRk5NVEVlNDREd0NpV1kydHVmNUpQUkgz?=
 =?utf-8?B?VUwyQklQazVYNnBscFVhTHBmTm9mc3U4MXYvNGRKWXRvY3dUWHBWSFpKdkJ5?=
 =?utf-8?B?MEpxNk9ReHd2dC9ad3J6T1liM24rRXkzaXNoRXFVYWViVmQzYjNYQWwxQ05s?=
 =?utf-8?B?ZWFqWkYxMFZ1NzFOSHZWcVpjMzJUUDZsTE8vSUFTaWNFemU2VmVFOXRWOHdI?=
 =?utf-8?B?cFJDZjk0d25mWlpMS0w2bWkzT3FWQlRyR1hSNDBxNDBENG9aYlhWelFHWjZa?=
 =?utf-8?B?SytadUxlLzVJMG9zR1NtY2REK3JFSTBHSWdKMmRIcnlzT3I4cHQrcHY0ODJ4?=
 =?utf-8?B?OElkL0dJajZEQmFIQjdXb0s0T3cydEk1cEx3K3pwUTVlT0hhak1XdkdtbU5l?=
 =?utf-8?B?dlFuUFkvUkI4UXR6T3BCWWtyWXhnbFlzaUVNV3A1ajJ6YXAySUdsMGU5dW1Q?=
 =?utf-8?B?RTBzT0JoaXVBWHpaUjdLNzZNSTZ1MmFvUFV1dmc4dlJESjBaVFR4ZVNESzFu?=
 =?utf-8?B?QjBxdTV6WWJzQ212ZUFZeC9hdDVQaG9yYkZ0RXYyT1UwUkgzWW5zUFRFdTdP?=
 =?utf-8?B?Vm1INis2YzJvWXkvcFRBSkpscG12dEFnTkJxQmJNWEtYOENRSVdtSFdpbGF2?=
 =?utf-8?B?R3dhSzhpRDJ3bFZmV3lLalpnSE52aVlhanNVcDVVNW5jWDRnVUMxK3hzMmtn?=
 =?utf-8?B?dkNCdW9lOFFtbWZod3FRZXVHSHA1TGxTWlpGWnVhNTRzcWhiL0gxaHBWdVNx?=
 =?utf-8?B?MUxCUnY3enB5aEQ0UHRReVNqZml1bGFUUG5ocVZCNzRzWE9JUmo0YVdJaito?=
 =?utf-8?B?SnJ6dlBEMmY0emo1czlmY0ZNdEZzQU04TXI5akI2blV1RXRmR3pZMjA4OVpn?=
 =?utf-8?B?RmpLdFVYaGZlalNoSzVUU3FCKzk2K3JXMUZYSTMyY3RZWnphMkxjRkkyclpi?=
 =?utf-8?B?VVYrUzBvUGhKQ3VJOE5mS0F2QmpoZVYzQWhiS2tCSjFIT0QwQ0h5R1hKQkJ1?=
 =?utf-8?B?aGlXOU9tSDF2aUg3VU84bFVrYmRSdkZ5TjUyTWtMR1hvNEhwbEd2d0tPaTVQ?=
 =?utf-8?B?blNuUWlxMnJSZ1ZreVNralkrSjduL1RIVWxiNmRMdjdST3pGcU1WeklqaDhY?=
 =?utf-8?B?cGduTHdTZlRvVEJQamEyTFNnNklzNzBOQzgyVXVrZ0tJS2tLV1NwUUVITkRk?=
 =?utf-8?B?TnpqblRrdzh3WXhoQzMzLzdjR0NDL2VYSEhmQVJWY1VnUWtrY3RYRDY3Z2hv?=
 =?utf-8?B?OUZIM3dxUC9tTDYyemZCWmFFNzc1dE9tanBwS283cng0d1VaRzJ2QXJGSUV4?=
 =?utf-8?B?U3JhL3NLY2d4M1pJcVBTamx1dFRocVRYakw2aENQSTB4UGsrSm13Y2g1TnQ1?=
 =?utf-8?B?blkvUU8xMkE1RnZCa3ZlUS9jbnZ0UitqOE1JOUppb0cxb3BuUjQvZytHREpO?=
 =?utf-8?B?cXhxMS9kR0s0WHlWL3hma0Q4QlhIUm53cFhScVBMSjlaUjk4c0t3dnVWcVoz?=
 =?utf-8?B?eWZHRTZVUkZEOXRFWE1QNnQ3cndKNXBmdGVYR1RLQTBvZWt3eVVkNU9NNWRa?=
 =?utf-8?B?MThDZUs2NHZMRzh5WUJWdHp4eHdHWTFLUWJoZW41T08xMlJPb01pN2lUM2xs?=
 =?utf-8?B?Z0VxbXYyL3R0K2szcVpZeXRlTDdHVi9XbXlWR2lFNXVTcmROZGkyT0FSV1o4?=
 =?utf-8?B?dVBuVytORklRNlBBMHhnb2Q1TEx6OUQ4Y2pkbEdmc29wbzdYQk9KeU9xVnN3?=
 =?utf-8?B?dXZqQlhiZzhOcXQycEVEYmtKNUs0Z09ZbUQvaXN0YTROT2dFQmxjQlMrZTNz?=
 =?utf-8?B?RjRSVGIwT0phYzhFSkJHMmJkTVJObDYyeW1URmpWblF4QTZyQVI2OEV4RVJk?=
 =?utf-8?B?ZmdsS05sMWJ6cGExS25rS29POGlpaEowOXF4ZUNaNXJzRm9Xd0owY1lBOCsy?=
 =?utf-8?B?dzlncTdrempUZW44aHB4cnViZzNwbmU4dFUvSm5TVVFLL0VNYUhONHFFQ3ps?=
 =?utf-8?B?blcxM3FhYXMrM2RmTEtUL01QakV4eE1qb1FhaDBiMW5pN3RRdjlHYUpyV1Jn?=
 =?utf-8?B?UUtmb1dteXQ5UEdpREZDZ25qeXpkbmZsK1FkcTNLN1hSQjZtaTNWRHkyRWYw?=
 =?utf-8?B?RzM2cnFGdkptRlNJUzVvTlQ3aDdveXBQQ0thbjZQQWk4Nm41TzF2ODQxV1ov?=
 =?utf-8?B?UTcveHBqbkVrTHJ5TGM4b2pKUDBVclNiTCtqb2JtSkxLeFFlQ3VrZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c97029d-b312-455f-875e-08de9ae216a3
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 11:28:16.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wJHQa+KcCFDvpCV47KUZU0QiNIJAQNy4W19WB5dJ/hszX0fe1CMwkfgmbFJNVI4F57AU544KxzoVORqEtGeaC+aPvNrXqN8V4YM9M6EjJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_042825_784433_3819B353 
X-CRM114-Status: GOOD (  11.34  )
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



On 2026/4/15 19:16, Ronald Claveau wrote:
> Add the pin multiplexing configuration for UART C (TX, RX, CTS, RTS)
> in the T7 SoC pinctrl node, required to route the UART C signals
> through the correct pads before enabling the controller.
> 
> Signed-off-by: Ronald Claveau<linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed623..531931cc1437c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -553,6 +553,18 @@ mux {
>                                                  bias-pull-up;
>                                          };
>                                  };
> +
> +                               uart_c_pins: uart_c {
node name  uart-c
> +                                       mux {
> +                                               groups = "uart_c_tx",
> +                                                        "uart_c_rx",
> +                                                        "uart_c_cts",
> +                                                        "uart_c_rts";
> +                                               bias-pull-up;
> +                                               output-high;
> +                                               function = "uart_c";
> +                                       };
> +                               };
>                          };
> 
>                          gpio_intc: interrupt-controller@4080 {

