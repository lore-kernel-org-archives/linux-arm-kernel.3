Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE15C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 02:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wehHMMmpUz1AKcG5jDKN7j6J3bMmhWlyglNr8JwqfV4=; b=sh+DQ+taNPkUzrCukj13Ie1dgb
	oNd3VGXkCUP1atAcfqhtJ/lXf1/EyF7DS2cI6Ar2h/is92ABoE6nCHbhh8AJ+nrhfTtZ1zk0TRZtQ
	+CThgjHMheNPNNy286oM++GMgInd7/e7Y0slwrhi1R/IJ4qO4fgUfByJFNM4/ap/7B/PrBpPoDuxr
	qwKlEDQiaxwUgW/YPK9WkeDfclfFVa0jBJVx9H1uHAMir20fVfHGAaGfBHlCDdDs93g0wQGXmZqel
	B/LaRzvqGr3RTaPwwsEAFWFd/+dwzBrV9pKIjDcxUfwodWzVV6bj2drtL2W+zSYqcXPwHedAav3F5
	JANr2DjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWDO-00000008tk0-2qsK;
	Wed, 19 Aug 2026 02:39:42 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWDL-00000008tja-06pz;
	Wed, 19 Aug 2026 02:39:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzFjSJHED+zQFzsVULfhfOUOqjXvDzVPt3wB3dEGLbIsWhe4OZ3xNwoVY/rFwen/ag67Vs0NFBhlzyOthm/NrwdH4NQrTaV6+J6NrVt8kKwO+pHqkI6j2pd47hpnq+biJ3ne8uJGar8z1Tfxnk5qrqOeyOxVPL6vQYft8byGYI0sKuC53kMMLdLskUiTFEeUS+iyukYlAL8v2yGYvKn3jqhn5oyKcpoHh++y3Csr46nC0WYKp4jfvIjPL+56UnkBo8+1P/tXO97WlxbfK4Jt9CyVGAjFICZsiFcSevxMO9NZDekIIV0YA0kc7Lk9OZLZ7vU7eBEqa2JuBci7JXrEcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wehHMMmpUz1AKcG5jDKN7j6J3bMmhWlyglNr8JwqfV4=;
 b=BL2dyeCbvrT33i1TBxuphTCUkECIWnBZeEAUFh7xfax6ogeQL3JRYMuw0uS8lZCEbBHM/6ac28zrFv5ycrsZUvESSG8XKvnt5ak0j3dwlyocIwes9hVLgI/LTF35F7nVWy/Z3E0GKRqkRpRwffOHHEPg2GlMloHqwsMn2ANavY3bHwNg95nM5iK8RRAZEAQ3iEXGj+283BzSStSaZU8PZkIgj6o55zLVKiximG4MsVXGCACqLQ9+LN7jKina6FLe8jilZarjoLe5MUu0CW5ka5ZCEqsmSzrRNfMKIamqnjwACx1kT1SxJQe6Ial3+dquEvn/xMWwx+bt9bKeeo7lYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wehHMMmpUz1AKcG5jDKN7j6J3bMmhWlyglNr8JwqfV4=;
 b=U8FQLoElTNaFKVfFXs98bfNJHDWXKijeTHuPBd4POsFPxyOoEtc6UiivZE3PXiuiW+tUQ3DjckOYc8c8ekH3KRCcMqfRwchh1G0WzrYkf1aTpd43VdX122wWmRwSQMgm2m8N64QRiOvsAQTwKqqiUHbXVdIPV8mYO/YXo5Wyl5Tw85AoaxrriIA+/RUeIO80fGHuCrVZozYIHQZXRM9ctIqTMwf/h9BZ9CQbgvtlmBoRg7zUUU849xCLOw4YCqg+CMS1GhN1s6cDbyAWKxtyDxeTmYAMCtw06ydycLmOuBfA9YLLYgcW7GTEc+jKJVRRmaR/vQc+e5UDrP+sDVb/nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by JH0PR03MB7380.apcprd03.prod.outlook.com (2603:1096:990:f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 02:39:23 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0315.016; Wed, 19 Aug 2026
 02:39:23 +0000
Message-ID: <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
Date: Wed, 19 Aug 2026 10:39:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260818191159.11523-2-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0033.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::14) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|JH0PR03MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: a219550d-5cf1-42aa-7a91-08defd9b1449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|18002099003|56012099006|22082099003|6133799003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: MCcBO7OmDHYOb1Td+XwLMgesjz+TZh/oYWdoOCYg5DfplxwRW72VTZ2gjxd9vE/swwhKBLptvyO0NOiq8H+duJF1cgViAcmoO8VStG7rQHKqpRLWqgxGVnJqEGfqlkEILPiWWHfpfTyypuSDfHNsNDYDDYCYWohXkqO8vfWXC2bz9rY2qNiDW+XndozmtyDrC/AlS4RHCbk3wSb8wfadpmJGkTmfEkVVd2WW02qGcsIfYO4SVybzMdouehe3dv0dbfIEbV++WJHP/3JZu+cX4xjuYBRV032/nfckt5QGpl2s/CNTezsuQ6mXGll7Qy1FBk+338A7T+WAMwoisyNoLa9+ExdWTwW34AmKEuVyAGgma4VV4m6b7ehP20uEAxDhucxm2SrU/2kokFWNXzF0G9fiHpAuVXYR6Y4YiSSboIAUth3MgapGoFd0x/QPDOJB8JrKuhMenPHK+epIok+frcxLUn8o4vU6qdN+vgm1+tkFcKwex2zso1BetciAhU+/Qx4oUTebGFyTrGJYJIf21xH5nLQ6O7QAsKBNwHsH3na2G5igOHkVYkXe1so2agFMsrWYIKlZvznl/+Pq0K534nuzvJTJDk5hyqaE6LFsJyMqJF4T7r055AwahkGsuIdXKbPG1xYBPatr7HfXj5FB7sLm00cvaCy7ovpZCmN+iW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(18002099003)(56012099006)(22082099003)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZldDRnJxMFFycWFSSzlpWGlPeCs3VlM3cDhvSndUdTllTVZZd3Ivc1poNmVR?=
 =?utf-8?B?YjBmcnVrVi9rWmRQR2RsaSsxbHkvZlU0UXdJcjRydWs1OGNhWFhTblM0ZnpK?=
 =?utf-8?B?RlRxS1U1enNRRDI0RWEwOXZOVnVoT0tyOFJ3b2xpc3pQNFEzNWJOcVBkdERJ?=
 =?utf-8?B?cUV1N3NDOVltdCtUdE9hY0dHRzRSczk1Z2lVUlVWY3pFVUFtTExlNU5pS1dB?=
 =?utf-8?B?elk5cGlKUmhPcTlpTk5kVW90UnMzRHZMYytHcWl4Qm56dzlWU1JJSHo3cklp?=
 =?utf-8?B?RDFFNHZabWpXdUx0VUxhSjZSemg0TllJNkVwYmJGQkJtTVhOQnpQaW9EVVdE?=
 =?utf-8?B?NXFDYktOZldUSm9FckZCVUtQTTVncnh4OHZaaGpVbTdNTVd2YkMxNFkvcnIz?=
 =?utf-8?B?R25DbFlrR1VRcGw0dlNIUkZtWFlmNExqMDRqTE9TcXV2SFRaUjErb0J0T2Fa?=
 =?utf-8?B?RTNiV0NnaUtLKzJBOWhVeFdkekFQdU9zTjZhTFJ0MzNvNU40VWpBazd4a2lC?=
 =?utf-8?B?Rmw0NlREK2RUSFhFcDJxcW0ram9pWnY0SktEQ2RqWGU5OTFRR0VrWUVhNEdT?=
 =?utf-8?B?OUVhQkZKSkwySzRkdzNNZTh2L3o3V0lwR2oyajB2K01zQWppRzNySjV5Znk0?=
 =?utf-8?B?dnl6ZDVvc044WWZtbVgvR0VVYnhyYnZJamdpa3hxcnBOTFZOc2ozakhDcUQ1?=
 =?utf-8?B?TVl2NjYydlFFSnpCV3FjVmlOS0N3M2htSEZQYTk1OE5oVFNvOXFiTlMwNUhB?=
 =?utf-8?B?b1plaThNR3IxV2JFSXpRRTQ1akRWOWtVUVFqR1Npc0FFWW11RkJZNTdiZmFM?=
 =?utf-8?B?cXJrYmtUaTRhckp0ZElGTnM1Y2tDV3JoTGd2Zm1qY1VxVGJwUlFJclNRY1hL?=
 =?utf-8?B?RjdiNFI3TE9CRm5INW1XdWY2MXdkcVZxR2hOQm45Mk9QWkdqdkZQQ2FMOVFH?=
 =?utf-8?B?N3cyVUN0SHhIVk1iNzJ5VGczWlNZUVU5YXpSQlhqZEJnUCtIUlpOV3FTUkFv?=
 =?utf-8?B?cHkzUWhJT2ZFc2pOTXpNRkJpRFMza1VHNWRXNE8wUjNuZlVTWmx6MDg1ZXRJ?=
 =?utf-8?B?NmRPOUJZRzJNazB3UVRSVFJHUnFHZ2VRZXNVZWgySC9XUTNZU2JMYTkxYTJx?=
 =?utf-8?B?MVMrR29SUzBBZ2c5M1c5TkdLSUJJVUVxZGpQYTlaS1M5aWY3QzNOV0lIaUF1?=
 =?utf-8?B?Vkc4bUpOWWE3akJxYS9wV3REdEZpVUR5ZUNVdlJ3VDFjWlBZUWRHSEovYmxY?=
 =?utf-8?B?Y2FqbW1xQmtacldXSlhvZWdqWUxtemJtWVZVWU5jM1U5aFFTWGtMRVI1azUx?=
 =?utf-8?B?ZE9mM3dORlBTK2dBMENxdXBwbGlocHVqeUlpcTdVeS9jMzVMVk9rZm1ETmhB?=
 =?utf-8?B?b1FsN0dic25YWUdQdFg0MDQvKzE5U09nYkMzS1NON0xyZFlZVXNRRFo3WE9u?=
 =?utf-8?B?QTdrNnFPZGxEV0dPaTlIdFhOUWlGcS8xWlZWUXdlRWlKYUlaaW5zTEJLZjdQ?=
 =?utf-8?B?NHNMamdnd2s0RDRIRXdSbnZ4VlF5c2Z1bll3QnBLTXo0dzdRR2t2TjVWMDVx?=
 =?utf-8?B?b1hTWGd6OFhId1d0c1lNV05mMHNhNGlQTnMrS2JNVjQraXhrQmcxNGZHOXJm?=
 =?utf-8?B?WFhyVm1UMFU4YVZ2eEhsU1BwZDExM0VIZ2pjS3RwVk1kRytEMERndUJFb29m?=
 =?utf-8?B?VThtWTlNNVBTdGZ4UXQyQmZrMU0ydnRSM2tJUklodlRGQ01OVmN3TUtuWDZt?=
 =?utf-8?B?aktRQXF6KzNmdDdsS1ltRURpSWtVV0JIZEZJVFp5SjI1L1hkbDFhS3ZRYkZr?=
 =?utf-8?B?aHBrMWxzNWtISGlhUCtrSTRrV0NicnQvanNJTUhuT3d5VWxHNnkyTkYzU1Fo?=
 =?utf-8?B?ZnlqRGwwVk1GZEZjT1lpYWcrUDBWTTFudlNxUnN4QnBwdVk4OUZkMklOVldD?=
 =?utf-8?B?NDlkakRkOEtHaDlnVWZtN2s1a1FXVG9qK2c0ZSs1cEQ1eHpMOWdtRzFRMEFo?=
 =?utf-8?B?NUFyQjRvWGJ5UmQwcG5Wb3Z3UklNTkp5VCtpR1dnWWExNE1HV0NWUlRqYmlN?=
 =?utf-8?B?b05ROEp5QzloaEZPUEdIMGZIenVPaWNoK2tCWlY3NjhqOFNBeDc3YnQvTXBH?=
 =?utf-8?B?SUpkV0NKR3Nib3RWcWxzRGY4dDVXVUoyd2hQQXhmZGJjMUo1ZnArWmwrWmsr?=
 =?utf-8?B?MjBEbllNa1lveThwZ2VVdHZUdmhGTGR4RUJZNW5aVlpsS1JHUVRaZyswT25B?=
 =?utf-8?B?QW5WWEd2SUpqNjRkTkt0Z3J3VXpvZ1J4T2xlTHZwdkxlUk9aSWZYL0lnT2hU?=
 =?utf-8?B?dGoxN3V2OVUwL2MwbDVsaVp0RjNqcG9Va2N6d3JpMkMvdHhHUk12QT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a219550d-5cf1-42aa-7a91-08defd9b1449
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 02:39:23.6984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52/MPbNXqr1d+H6CK0kRDa2O2rwUitaAUQsYc9WP3CPiuHwzU/dtaKONsW9tFyZxOhY+AAtEM4X861wGiMQKJY/sDtwgZ9wzcjNX8uv7y34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_193939_110665_7BD13097 
X-CRM114-Status: GOOD (  17.79  )
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

Hi Lucas,

On 2026/8/19 03:11, Lucas Tanure wrote:
> uart_a lists the 24MHz crystal for all three of its clocks, because
> the T7 clock controller driver did not exist when these boards were
> added.
> 
> That leaves the real UART bus clock without a user, so the kernel
> turns it off when it disables unused clocks at the end of boot, and
> the board hangs.
> 
> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
> the placeholders from the two board files.
> 
> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree")
> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
> Signed-off-by: Lucas Tanure<tanure@linux.com>
> Assisted-by: Claude:claude-fable-5
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> index cab2ee9ea0d3..dcbcd08a78b9 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>   };
> 
>   &uart_a {
> -       clocks = <&xtal>, <&xtal>,
> <&xtal>;
> -       clock-names = "xtal", "pclk", "baud";
>          status = "okay";
>   };
> diff --git
> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index c41525a34b72..677069e58f30 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -266,6 +266,4 @@ &sd_emmc_c {
> 
>   &uart_a {
>          status = "okay";
> -       clocks = <&xtal>, <&xtal>,
> <&xtal>;
> -       clock-names = "xtal", "pclk", "baud";
>   };
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index cc371fcd1896..7847582e77ed 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>                                  compatible = "amlogic,t7-uart",
> "amlogic,meson-s4-uart";
>                                  reg = <0x0 0x78000 0x0 0x18>;
>                                  interrupts = <GIC_SPI 168
> IRQ_TYPE_EDGE_RISING>;
> +                               clocks = <&xtal>,
> +                                        <&clkc_periphs
> CLKID_SYS_UART_A>,
> +                                        <&xtal>;
> +                               clock-names = "xtal", "pclk", "baud";
>                                  status = "disabled";
>                          };

I agree with moving the UART clock configuration to the DTSI file. 
However, it seems a little odd to keep the XTAL clock definition in the 
DTS, as the alias may not be consistent across different boards, which 
could result in compilation errors. Could we move the XTAL clock 
definition to the DTSI as well, similar to other Amlogic SoCs?

