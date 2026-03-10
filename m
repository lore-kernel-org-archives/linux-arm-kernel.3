Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF1AFD4F0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9hce3KHYUSgUGLwjA7DtgVIy+dhi5JhmAHFEJLhTf4=; b=W5Vsrk3KX4QLFOB66d+pjg9J6G
	q1fERHlaHVkhVYbcKCt0viwchzaH9QvorDr5pSwNBp5xx/PMzNxM2MBNqO1iMB79qYxCBLYA1+lxW
	RlOkYtakhYrov6rqPEU7NXIWi2Q/yH0KrQDfnb8Bl9Gz/tSwmr5ex62mYgrCqO7/xa0RjMOgIeP0T
	IFZdZ/lDI31RkXZ3NvQniUhWWtxHEW18LIbOxvDSOiZQK+mDpp7KIIfZuGcQDJs+GABRV3+qo1Snp
	Sa9YzjIYzPIA5JffVH/f2AWnnfJPU0+2XEIw+qmHiXr17j9LPt88Y7Blm4UDEOlEAhKVzofctvlAc
	CqPUu+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00xW-00000009zfc-3fnn;
	Tue, 10 Mar 2026 17:33:30 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00xU-00000009zeZ-2j7Y;
	Tue, 10 Mar 2026 17:33:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmCO1+T/fVM6PAU5hxcJnVWyjV0NcxaCHv1zfS8d9387XDnxyhqNOXUWvbsEe2jAJlD6ODnqo9r9pRe5N5Iuip1WPGUs8eOseLTO7ZNuzJ3WixJo28InC88jNW2twa0IaXcoWGlTEvWZO7Ugyqrkbf/NtZ02Tm/rFKx5MPgDvgUXdyUed8ieDC3AlueBMnkMRGnmLiOZaqsGAELiCVXgkZSEk3K9LdXy5YV8RVEaL3r8Pyk84i6fUY48rjyPya/QIeTw2wYIt+sn0q1TrDUbxf2sYyNs7SHdzkFMM5T3gu1cAe+oyMeHBVYxaL0/P3nHoCx8MwIKenvu3u3G5rxa/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9hce3KHYUSgUGLwjA7DtgVIy+dhi5JhmAHFEJLhTf4=;
 b=LsmYPBLCbojzX997UKq+7XOUtTBho9xr45Ob0TRzEtlsIYnUS8v7uzv07qXwmJDl/5Xg0jjFFJBhyyqEmCs05S2X1zQxF/HIe2ZEl5m+axt6PBgdoN/fPeAkIhQQUXBu+pyw9003DzUf/mweY3SZgcXUo5GdhgU0wqXwaQjN61zZ0MWbCEn1thV1Q1QLmnapJx0TqbJ62YmhK0blaongjhJO4qabYFKAUuH3eiHhZnO0IBICZrh5lkFdGNdXj+r6kI9jcdqV9S7tq16Lmeb1oksMi1qfT2OXkdvDliRtsMAo45NUuZzXjlTKH18y/1/h/6jUcmvG3G5KPv0eZezTWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9hce3KHYUSgUGLwjA7DtgVIy+dhi5JhmAHFEJLhTf4=;
 b=BGRvMg4fDnIf3TIJa3Vf3FzpO/2BDhLtc7PFmQ01m4Ya1oT7ONm1zySht30hbWZDBvvrY0Tttmzhhxdo7EymVIuUFNE/qPGeW1GvslyeHBAmmYvpFok8wnHHsP2VuH1nSrDJV6BJo2l4/GpGfAVHuOXmaRDDXVXT3LufZGTuSmtxFwRYwRV9uZX4lxmzk2O4OcN+L7Q0ZcpCxTFii/5ngM+qHZDFPxHZ1Q+3vj7+s9QYJt4MODRM8b7iJq4OuKgstjMCrBjhTK6XSMPxllQRBpNmwkmxFnppi/MLU7WtJSLwFIb8v4o3AJVRLSeUpF6uupiEDqNySsz9Loeh0vkwzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14)
 by DU2PR08MB10068.eurprd08.prod.outlook.com (2603:10a6:10:490::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 17:33:20 +0000
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f]) by DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f%7]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 17:33:20 +0000
Message-ID: <46cefc22-947e-48da-8ec3-12654227d562@genexis.eu>
Date: Tue, 10 Mar 2026 18:33:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: airoha: en7581: Add switch node to to
 EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20260310-airoha-7581-dsa-switch-v2-1-852692ba68b8@kernel.org>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20260310-airoha-7581-dsa-switch-v2-1-852692ba68b8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF0002398E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::193) To DB9PR08MB6697.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB6697:EE_|DU2PR08MB10068:EE_
X-MS-Office365-Filtering-Correlation-Id: 089e6162-9ec9-4610-104f-08de7ecb1f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: NYvV4sycHjKCnX4EZ6hBJ0vkUji7zqal711cxEqWrrxp/rq86J6Xavq0QmtDczCr2kp1IRNOnFrcSUUBncyIK6S1si5Fpl7fmw7Lz2aQRPHH3bD8HW4MuTP2nwtOUJxhL0jo2dSTimJwLb8wUl9P6tPE0+sAqPEXv4WvsVfmPENbvVbDzeGx1A4C6l8GYP9Yc0B2VZGqSngVQ1GrkkvmEMbqvhE8Bbi7WRlusjQajcYE/Opc7V4DF/XyJwGcXQrQunGQkzef8dbifnxsR2dlSLdDtPJNzdTXt7F57qRnfOl878VZEaBvP334C9xV6Z2Tp1PIRpNk38ky6A986oSiRcZqJak8qerLnFmh01NSwCtqAIYLnJsMu+EapFUi5/atM5lXlKl0joqgG8MBhpoavn1fD4vW0bvFSIL4BHzvxzGpiENQvMbEqbtGCARM98vyK9wYE8IU+pC6ewv/yQAkZn/mmgER7kDVbkrXmiaI4K7e9Yyu6AcEYZiFXKNhAGhm9eKON77mx5mJeSzoutKBCgwiEPPRcoKGc9bs2bwojqmx6AWwxgZIFeEo3/4sm56zkRIAXmu4+uLWO+mIocWGKlMWR9bZMdmInvT+6vtZY4PIw4aw/Kf0Qzaxc1n5eTkocyLA0VLxb5DZ2iM7PtiGpxi+k2qn+Agr1VMPrIffmqbcBbrJIQRQd5LaM9WrnKoN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6697.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzhvbERYVFVHN2huK1B2YU9VZlM4Ym9SZjBjTWhNeFVNSUFWS0E3Uy9xTHpx?=
 =?utf-8?B?M1dydDlXcTByVStpYk1sWDlYOFRMZ2pSYUhPeTBHYVV0Qk5pWG9ndGlQR1ZT?=
 =?utf-8?B?Zko1Z0lHYzh6Wk5XcVpBYWV2TVJCYk1McDNtSGhLV1JxU09JY3k1cU9wckZH?=
 =?utf-8?B?OCtCaFMzNldibnJiSXQxcTNJdjdyZzhyWklXRVVyLzVIL011VHFCQlVKZjd1?=
 =?utf-8?B?aFBhdWdxWGFSdU5xN1hrRTBGa0xaeUpnQlNDbzMrWmxWcWRweGkycXRBdGZu?=
 =?utf-8?B?dTd4dG5vdThrVUZ0WGFKbmNMekhKTU0waEFWa3NhRmduY3ZVVlpjMkFFNWVE?=
 =?utf-8?B?RGp2Nk1MWlBRZEhHbGFlYWxkdDh4OHhRZXFqVHViaFlxUGxQcWVqb2V0eVV3?=
 =?utf-8?B?SjRwRHExdldIUzlzUUZxMjROL1BjamxQaitpbW5pZlBxVkh2bkllOENIbUw5?=
 =?utf-8?B?dDRBS29OZ2RWT0FLQjc5aG5sWnNlNC9uMXlMQnBudmJDYUlRODM3YnlEQ1NL?=
 =?utf-8?B?R0o1Smo5eW03eTJ0S2NNU1hLbFhEdTcwQTVmcjNXYlF6NlA1bFRzNmJzeGdy?=
 =?utf-8?B?ei8rOHUwdXNaREczSFZOSnluSDFyR3FnTEtvMEswU1dsSW1uanNaZ0NiK0pp?=
 =?utf-8?B?SU8wcUUrdG8wQmhaTENNYWdrZXpBdzZNVUdIUDBuMUc0K20vYW1HTWR4TjRu?=
 =?utf-8?B?QXN3RTdETjRZRVgwbFd6YlRFUmZPS1dxNE0vR3VEMmsvNEJubWxvQ2pTeDZM?=
 =?utf-8?B?TlRKalZ3dEtSSFUvenVnU2x4M2FOYy9xZEUreXNHTmZWWFlwbjNLdHloTmFC?=
 =?utf-8?B?djRRM3Q3eFdzd3RSYXlLVnZTUDZYUFphb1pWRWhjdnVnR0NhRlNpSFZpWDg5?=
 =?utf-8?B?UG9MSlZtZ1Y5S1ZZdGFwYlpSU2dsc2NxTnB2YXlibnAvQXMzSDI4NzJ4bWhY?=
 =?utf-8?B?bEZxYTJoRk1xR0hMRWhtcjlKampZMEtPTlBnWkN2a0doRmFDWllqSlF2N0o1?=
 =?utf-8?B?OXB4YUZIYmcwTUhwM3dDeGNKWU92dGtqYTFkVXZXN0Zhb2ZyeDBTenJCWFVa?=
 =?utf-8?B?enVKaHVEQ05wMGlXeU1kZjZuanQ5dFA1RXdQRjBJRHpHRzhFNU53WmZBNEZh?=
 =?utf-8?B?Rm1mTzNaeWUrY3g3TGJMMHNJdnM0SlZrbHlGVVNlZm80UnJYdXBOeWlPNFRv?=
 =?utf-8?B?djdQMTVodzNLelZ2T01NTGZhVXIzTlBrMTEwQ211TGhVRExZN2N5ekxaa3hU?=
 =?utf-8?B?djZiYXZjVlVlNDg4R0FSbFU1NlhDWFpMemJrSmxuRyttUmVpKytUeFA3bnJV?=
 =?utf-8?B?K3c2TUVUcXNtRitMcFBLU3VNdWVIbUtQcVBCYTc4RWZhOFZ5VWpsSjFHU1Iy?=
 =?utf-8?B?UHVnamtIY25tVDd5RE9HVDJ2bit2R3RSUWxpcWJidVRsako5emUxNXFEbnl5?=
 =?utf-8?B?RTNUbGlRcFRkU2M1NXpsTzduUUF3QWhkVDg5d0NzMWVCMVRaZ3M2ZTRJL2E2?=
 =?utf-8?B?bmphd0JNaUJiZ2xIa29OdkxmUlIraW0yL3IvM2Z4Z0RNTXJkR0R1OVZLTTY5?=
 =?utf-8?B?U1V6MUE0OWd1dmppRHl6cVZseVFIVk1GYkU5WmhVVDBKUTBkajYrN2k4ZERW?=
 =?utf-8?B?b2hlVkoyenFMSUVMMGI4NEhES2xyWm1OK1hDbUFvaC85bnhFTjlwZkRHM0FU?=
 =?utf-8?B?Q2N1aGtmN2MzWXBuenplMjRHOHVvMitqNVBMd0pJRzZWblQ5c2RZWmh6cVVE?=
 =?utf-8?B?QytoYTE2YzZSOXdJcGI2dFF1TTcvdUZwc29ZSmhTbFFheWwxQmsxdXFkclBv?=
 =?utf-8?B?VkpHcWg4cmlBeDJWeE9iOU41Y3lpMC91MDdQMm1jSlR0WWIxWURieE9MZXN5?=
 =?utf-8?B?ZkQ0bXBoc2ZEbGsxbnVUQ3hRdDFFNUdtTGdzaDZjUllZQytqeU9ibjhYcmk5?=
 =?utf-8?B?YzZBYVNEQWpCRXVXcGxmQmdYenVOVm52QkJKN2VHNlcrZ2VvSTdTaWpvM3Ew?=
 =?utf-8?B?VU0yb0dURzNnN0FpMmRJUHBsNUhVVEdPWW0zYVRtbU8wMWduMXY4MWwxQURB?=
 =?utf-8?B?RjR1eU90OW9nYjBJczZpeVhhRlZDWnkxMnNBSkJzQjY1am5GZThVWDVGd3BP?=
 =?utf-8?B?Q25BWkM2NlVrdU11cWI4Q1VyL2hhU3FUMVJBY3lHd2xTcDRjVTZzYnRXcU5x?=
 =?utf-8?B?cjZXd3c4aXBScFZoQjl5VzVObGpmVEd3SVFNeG1KcktnbWJzdDkrWlpRbk5N?=
 =?utf-8?B?Ty8vb0IxK0NVMW1lQ0VtbFp5cFVaSCt0RXpQMjZwcGt1TXowR0dtWGZQQk9p?=
 =?utf-8?B?QWxWNVRNdExtQnRBbnd1Q1RSd3VZL1RleEk3MzZWb2RxZkltVmorcll2cVZ6?=
 =?utf-8?Q?g4g4kC7XxbqrUCiw=3D?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 089e6162-9ec9-4610-104f-08de7ecb1f8d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6697.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 17:33:20.7587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7pyf0WvsoeUIMw7BilGb4F8GzeTU7D0uHiK36/qOPvQjHP7SBMRxewxjr/EKSJzXEsWIUvvWvyj55EZs2Q2QHjCb6i9wYl5+QEuCsCdXjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_103328_730101_092E3256 
X-CRM114-Status: GOOD (  11.42  )
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

Hi.

On 10/03/2026 17:12, Lorenzo Bianconi wrote:
> Introduce dsa switch controller node to EN7581 SoC and EN7581
> evaluation board.
>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Fix ethernet-phy node name
> - Remove unnecessary phy-mode property in ethernet-phy nodes.
> [...]

> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
> index ff6908a76e8eb6cf91343495d1fe531a868e41fb..c84c8d4a6662e24531e0c22ef3a4eb13da2d52fd 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -395,5 +395,89 @@ fixed-link {
>   				};
>   			};
>   		};
> +
> +		switch: switch@1fb58000 {
> +			compatible = "airoha,en7581-switch";
> +			reg = <0 0x1fb58000 0 0x8000>;
> +			resets = <&scuclk EN7581_GSW_RST>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;

This is the wrong IRQ, should be 31. This is also what is in openwrt:

https://github.com/openwrt/openwrt/blob/main/target/linux/airoha/dts/an7581.dtsi#L947


MvH

Benjamin Larsson


