Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEA0C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 00:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuDuxpfaCNTfMcptOVLFBBqpVhpYLFUl2vhQTrAk7e8=; b=bf8huNhEWJTNxp2bQFRi2RxV3Y
	McJ7AmqzzRUl/A5v4wTNQI6z4d5VBdjgWH88cwnY19bdtMW0wC7/zN/hTc/a/o4GvS3JN2hKlxJXi
	Pur/Tv89s8YqK3Bef73krvbBsmEM4TCc3oubl1VcaJo9lc8J1+5Ja5b831WecXhG59EB0KP/M1CNC
	SOmYjZIoj99dMZfEzT1bKdWyHVDjG6AW8oVN0oH4FY6Xbjp0WeUaQgVngCyONKvB0p6gSERRquVns
	nDqgcQMDlGhu8UgyiiRDOcKGhx2kTV7L+x57WtUtSC4jioTcTOFztMRMSAdnn2fcrcYcQg8r/X1Zu
	PFczK3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thHqP-0000000Frjn-0ezX;
	Mon, 10 Feb 2025 00:40:13 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thHoz-0000000Frbl-2lYC;
	Mon, 10 Feb 2025 00:38:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1EMvVUV9X4Pbp/IjEym1gOWhhr3WkfYuoxP6t5JbARPnqC/nBEIpAtX1J4NrvU0RvZuN74cpW4Efmr5MMz9G/Dc03G9hIdtYubU6+lgixkT1SCUw7kz+akdd6zS+olLvlk2wiQ0ZlGx18ECehmK50jqM5l0USWEJVQrA2fQCIkfgePqRwttbywYrxOzwr5BTY2MC+bbFJ7pzCONmZTgcmqlHOM56Y+jMjeNfTwztCMAtdN1Zc3DQxcuiRYBGN+HTpH0jbcz9zo9m5DoR+sX5fRCaMpEZRo4ArI7boHBrmEOiqUddLPOr8wUxqyYN6JwiObbjtY18yk7Jv+MfJooew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuDuxpfaCNTfMcptOVLFBBqpVhpYLFUl2vhQTrAk7e8=;
 b=JWiwT05qTSiri7T1RfKxGAam99oPJmX6On4iMl0SJKitSgwuMbcG4zUxB+pwL0X6epfP5hNOIZ8AJOp/Zw2oE3d7QvhQ3CNmKGrEFYaZ5ddH+zoWrx8l56JxZGRgPMotNA9S8zacIFb5u8o6/BBVp73xIcVTt8MrNLzREoiXSZ97JadBbjlsHQiZ+4mygF/FgEmxyA+BOFrJk8j7w8tUOmmcdq+Lc9w+QLRJPd7YzGoh7t8ORYCuhDVH5GjHYGBqZfEMDDG2b4kCvXcTcMEx2SdfuL5o9u7vYmV7oWSnZrs/KnGX67aQWpysBGLeCME/Iq+9SI6l290c9kRj9ZzTug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuDuxpfaCNTfMcptOVLFBBqpVhpYLFUl2vhQTrAk7e8=;
 b=PjNTw+9pR71fl4q5O4te30EeRjFepEcG1EIhVRQQCTs2A2F7/285Wbyv0WsB2v4QKbNjU1yxAJdFzpSeDcGYzpcz4+dRLZwspETTEDPTjROCF8iGSl+2q78TO30pyqk3yxe8Dp4G3AQt/8I2m5Qc5rFU0kC1zxYzUuymfMY2T117OKrTT0+tzhs4eJz6dJU5vniZExPlbcj7mbatPuWUUD9GO8aeL+8SpMbE7Hw2Akz3Ma+mdT0SQwo/oRGm0kvfdaSdsPE4+DH5aHE6rC5yHiHSblsHFAUqznvh8VbSqxyfawh7U7eyBXpj1RXZHMarvMcnWPvyyaUZT7aZWeaW3w==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by MAZPR01MB7732.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:23::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 00:38:26 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%7]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 00:38:26 +0000
Message-ID: <BMXPR01MB244088C20EF7E523FC696C67FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 10 Feb 2025 08:38:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] arm64: Add SOPHGO SOC family Kconfig support
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org,
 Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-2-alexander.sverdlin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250209220646.1090868-2-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID: <a3d37e31-3a1f-4471-8bd6-1af4db5b8544@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|MAZPR01MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 18136492-10ef-4193-dc49-08dd496b3b16
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|5072599009|6090799003|8060799006|461199028|15080799006|7092599003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bExYYnVzTm5Cb1NoemlyQjdzb0ppNitVOUNvb25JZ25STFVyays1UUNMbjdx?=
 =?utf-8?B?T3FYUjI4T2d4RnpsQWxFMkUzenMzYWhOQmliRHRLeW9PcHpVbWNydVJtaDdL?=
 =?utf-8?B?RUJhVVJaWVRhRy9zOHhxNUhDMnRMQ1pNVzNPd3g4Q3NZNXQxcS9DY2ZycDVO?=
 =?utf-8?B?ZnJzZzVObWo2aEhreEk3VExYM0prNCtPaVQrWjcxVzhCOVN3Z1ViaVdpUG1F?=
 =?utf-8?B?M3cxenp1UDd5L3UvSDEwa2FKRExvU3VGVFhZcE9hSFhsRXJEY0pRTDgyb3NB?=
 =?utf-8?B?ZjRYa1d1V3E5YnE5Kzd5blZ3bVdKeFVxYlBrMk5XOGxON2wzQ0gzRTUxeWgw?=
 =?utf-8?B?TEpGR25EcUI5d0xrTHF3T0tkSDV6Q3NzaGsvYktZSDlTY2p5cjlnVUROZCt6?=
 =?utf-8?B?emlQNi8rd3BDaXJzQmxHa3M3Szg5Y252ODE1ZFhQUE5sd3I3NXFjbzZsNnRU?=
 =?utf-8?B?eTQvS29IbEV2WmFSVEdUWVo0ZjU1VzdjSTBURmxIQVBzazNDREhRTW14MkNk?=
 =?utf-8?B?ektvUkg4WjgyRE9Ba2toVmM2SDNyRW4xalFXeUNkdjQ4MlZJaEJhbFV5a09K?=
 =?utf-8?B?RzU0QXJXVFA0UUxQc3lwS3RBVDg2VXVvR0pGbVpnY2ZaQ3U0QWEydks3cXd2?=
 =?utf-8?B?dFZRSFpsSkpkRU1YMGZFTDRjeWQvc1VFaFB5aDhlTTcyM2YvODVLNG5uZWRW?=
 =?utf-8?B?cFovNVRmcDZHcjBGSzlLSlpsY28waVRMOXZCcDMrdk5vZFhiNVlnMGswM1Ru?=
 =?utf-8?B?Wk42SlhBVlpKaHJndlI1Z1NPNW1zQmZhOGdOWFRQQzNoOEtrNllwbXB5RmZs?=
 =?utf-8?B?V25PZmRFNTNZNjl2YnJ1TlBjNllSTWNmYzV3dEFCSnltdGczL2ZlM0doamp5?=
 =?utf-8?B?c3BSUkY3ckxiQm1YenNmcERKODRhcm9uUVpSc3BremlhR250Qk1XUk12R1pV?=
 =?utf-8?B?ei9WVW9zcWZNL2d1LzJtUXdDZElHeHpyQm50Mk9keXVmUys2TnNYYnZFOHo1?=
 =?utf-8?B?QzJ6UGVhYmJYQzRCRGhTWTRrQmplOG1YbG14ampGZkM1R2JGZEd4eGxvbFdU?=
 =?utf-8?B?MmJiUWJpSENIM3drS1Z6VjZwTlVEREN3UjBwNm13TUVKQnJLc2FoZmFrSjNY?=
 =?utf-8?B?T3gvMGhLVll3YXV1QktZUWlOWldKOURFR0dRbG9ET2plTklPNm9LVjB3OFRp?=
 =?utf-8?B?NFcwWE95dTJ3RHVhL0I2WHJUckFjcWNPMTdMaXEvNkRNTDlTMzN3SjduOXp6?=
 =?utf-8?B?K25KZGZPQVdXdEFFcmJBQ1NoSkhLWitoK2RjS3BvNTg3SlluRlE2NEdEY05k?=
 =?utf-8?B?ZVNIUWNyMDAyY3VjcTNLT2J6WTAzb0pwZ1pRT2pPSFlBNFlLVndjUWE1WlVM?=
 =?utf-8?B?dUFRWFlQdElwd215Sk9MdFNaMWxmTGRMVUVFUEo1STd2dDU0OGdUN1dIWm9z?=
 =?utf-8?B?M1RyUXpMc25jWGpkOG5TYkxNcGZoeHpqNzQxWjlvbXhzY0Ryek5EMGcvVzk3?=
 =?utf-8?Q?eO2d1o=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWd5eG8zcnVYV1JFb3VTZjM4OEdZRTE2WkFjN3Iwd0VYdHpVYytUbmhvMG1a?=
 =?utf-8?B?aW8vQXlHc1NCS2JyNEpaYXE3VVV3R0dJVGsyOEROa3FxK01kNTR2cG5vZHRU?=
 =?utf-8?B?Tk12RTF1dElQUkRmQ1FNV1Joa2NWUmc3bW8ySlRmRDZrMkNSK0FXa1V3Ym5m?=
 =?utf-8?B?cW4zQllEZ3g5R0U5cm9VdXNybWZrbml0ZnFTaFphNDFldTVYS2w2dmd0NXhj?=
 =?utf-8?B?Sm1xRTNMOEc4NEd5emdMS3czNisyZjBVMHJmWXZaeGVTbmZxNzhpY1huQXpR?=
 =?utf-8?B?b0Fta3ViNys2d05XcjdyWllsbklUL1gySndXdkZ2RTZiZ3NRMXhTaER3K0t3?=
 =?utf-8?B?TTluR1dNUUpmclZBWk5IV3FCdlg1ajVlcnQ0QW00bDZhVTVYZnZ1ZXJHRkMx?=
 =?utf-8?B?Y2Y1aERMNUdYYmJlZWRUYmNrTC8xbUIrdUgwbkNtR0ZybW0ycDlhVWIyYW8w?=
 =?utf-8?B?TnhadS83ejdiSXk1RXdKaG8rZ3V3ZC9XWkU1ZzJEbEt4NFF5MWVKVTdqek9B?=
 =?utf-8?B?RFVBUVZyOVJHVjJLMllmTVVXQThRR1VzaXRVcE15d2dYUWVHT1Fpc3YzN3lm?=
 =?utf-8?B?dnVOVHZHQUZYT1NFNU5XWjdjQ1JiL0wrM0N3WmdDNWNlajNXQUJ2a3UxQ3E4?=
 =?utf-8?B?VS96ZU5LTEVObWk4dUdpdGxERTlDcVRKTW1SRmh4YjF0ejdMdW5WUzI0OHlC?=
 =?utf-8?B?L3kvUWFCUldPWGJnM3FIZUw0dVJKbjlzRlRubjE5SUw4cFY4TjZnVCtSNGdv?=
 =?utf-8?B?YmtkZTRVVnQ5RTFCYVZqVWx0WmZNV1UzZmNTYVd3M0FOemUxRVdJNSsxSU8w?=
 =?utf-8?B?NVFySTVnMDVOckFmVWt3SlQvZCs2cUlEYmNQaCs0WGZVZzJlL2gvYm93aEU3?=
 =?utf-8?B?VjdIZmJBZHNYeTN1T3FSQkh2dFprL2FvZGRqRFErem9IZ3NxVS9lKzdzNDcy?=
 =?utf-8?B?ajdNUnRZeExMSit1SG13ZTVFcnA2ZFBRSTlkdmRIZlhJRTdIQ2dDdS9zdVBQ?=
 =?utf-8?B?TWMyUWFnRzRKUXhiYkE3YjdlbTYyaDZQUnRKY2RxclFGL3JBb0F4ZUdnRmp5?=
 =?utf-8?B?NGdnRG9XdEhzbEZQU3RFRFQvMHhNSEtIRkZ4M0dpYXplQWgvRzhWSVE3bGI5?=
 =?utf-8?B?RmJrRi9qMjhmcWxhZzQ3MWVCRXZTdnJRWWJzbU5WWExjeE8yMzQvVWZ3UU5O?=
 =?utf-8?B?MjMrMFo1NExKOXlRcFViWVc5NkgySGpUKzhVQ2ZJRFAzVlY2REZ6RFhSSkox?=
 =?utf-8?B?U3FKOHl3N3ZYanM2Rm4wbkJ3S2QvYVYzanErVGxleUE3VTdpaWZuSmZXYXlS?=
 =?utf-8?B?MlpRT2FhWUlGOWxUcXR2eENEYWRDZ0V0UGdNYUFjc0FuaXVIb3BQcWp0bFU2?=
 =?utf-8?B?RzYxYXA0Wkt1cXg4WmowdkhsN1ppcUFJbTEremVNdzBOSGdYaC9XQi9xNDVL?=
 =?utf-8?B?Z3ZlQU82VmQ1OXVWQnloYnZPUXlYY1c0WE43aUFhVGhHL0IvdVZPVlFDVVEw?=
 =?utf-8?B?OFFzUU5yeHA3M1hCVC9iRmRIRlkzdVl4QUFtOS83M2VzMmd1L1grZGt0QTQx?=
 =?utf-8?B?ZmFqMmxMNldGQWs3UXV1a0NidHhpcHJpeHc5eG5NemdJWit4dXE2dkRhWGwv?=
 =?utf-8?B?b0RxVHdFVzdJUnhEZGFCeDlxYUJmYVowWFN3TXJMaEpnTzVPc0krUUlmdmpy?=
 =?utf-8?B?RE5taDFTWFhkbTZ0cHRPbnFHc1l0U2FSUkJUMk5LR2Q1amwyTHFRbUtqSS9Y?=
 =?utf-8?Q?/Und6E7YyAQpCjf76eOTj0e9EuAX0ZL7eW2xyOK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18136492-10ef-4193-dc49-08dd496b3b16
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 00:38:26.5779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_163845_717838_501314FC 
X-CRM114-Status: GOOD (  15.23  )
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


On 2025/2/10 6:06, Alexander Sverdlin wrote:
> First user will be Aarch64 core within SG2000 SoC.
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>   arch/arm64/Kconfig.platforms | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 02f9248f7c84..f45f3f05edf8 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -307,6 +307,18 @@ config ARCH_INTEL_SOCFPGA
>   	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
>   	  Agilex and eASIC N5X.
>   
> +config ARCH_SOPHGO
> +	bool "Sophgo SoCs"
> +	select CLK_SOPHGO_CV1800
> +	select MFD_SYSCON
> +	select RESET_CONTROLLER
> +	help
> +	  This enables support for Sophgo SoC platform hardware, such as
> +	  SG2000.

In the long run, ARCH_SOPHGO will be used to enable all arm64 products 
under Sophgo (although only SG2000 is seen at present), so it is not 
good to limit it to SG2000.

So I suggest you modify the help description here and do not select 
these SG2000-specific configurations. The specific configuration can be 
enabled in defconfig. Please refer to the similar ARCH_SOPHGO processing 
in `arch/riscv/Kconfig.socs`.

Regards,

Chen

> +
> +	  Enable this option if you are going to boot your dual-ARCH SoC in
> +	  ARM64 mode.
> +
>   config ARCH_STM32
>   	bool "STMicroelectronics STM32 SoC Family"
>   	select GPIOLIB

