Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F23C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bom1unExi8B84YD+OPhlBHwnF0Ufb9Y+nU/oqAqzfNU=; b=OjGuirX3U0C6R5yRZaM8ONMd4L
	qbVzj85HrGOfwW2hmm70snEWrRd1hK38EkM3JbrR6B5fdqKNnCBZCga9lZEkSjXptkSB/ir55fQgP
	hXLXUF5cnA14YrQHcZX9m1hwUDh+NoXZBPGcYZKp3KcNHtZpIFt111YYEOXMnf1+91FuP6vkIqVxZ
	cHDdMLzfDYeoYI74N9a31Xj2j5T65BemeVEs3mzWwNbgfxgsSZ4UM03Br+hGb+BbnvKJMrh5efltj
	ybkMpqyn+L2JVr7bEk8uOPGm8rGmMaCFXAylQ4ruI76II2DTJFLpWSCc2TtLFSwecXqUXMI77Scd9
	RhhEbn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLHF-00000002q4z-2LWH;
	Mon, 27 Jul 2026 13:21:53 +0000
Received: from mail-northeuropeazon11021101.outbound.protection.outlook.com ([52.101.65.101] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLHD-00000002q3r-2VVb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:21:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jx25K+tocBH4zzQmNcWNT+fkUGWd8W301kGKprwJXj/hUO6BYPNwB+f+ZcXl7Uexsi9R393EYzoptqAZi2Jbl52UAAO39/wOUbJxLv7T7DzlnjnCluFlE1YIHPeK9mNB40tkpE5/lX59qpoUhDC2RZmFvCNgQjfLxbsTM6JAkrj5VDLPo71pqS8YlifTEkJ6EQhP4nQPJwQBrXfjfAfade6zG0yznWOC0dqYQ6oUc92kF+dQSOlIMpyn9Dnzl48RBtvvHc1PVrH+ZVFdmMIxpywbx9777G9nSnyTe0CdWh48NpSJsfcpuUXdURJZu9WFKJTw/zGcZcXYcLE5PTR/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bom1unExi8B84YD+OPhlBHwnF0Ufb9Y+nU/oqAqzfNU=;
 b=h3+cLaH0Bn8Y62UXTh/vkTm/ZEOqRUQalb3rm4x39NXkigjOkj85O9lUwdSPAICop8ljrvPz50wx7Sw4WirUneLMyPXS1+/rksgYSVblacEza7huaIuyD7l1AUTnHy3egAeTbBtkn0BQ9FzkU2ET6H4Kd1t9aHnaqwy+gcSkEZbeBMHQgjeXmnFZy6/rTr1cVUBV68yWtOwJL1KrY3kcziiK3ykOD9FT6wlvDoebZXc5YvMpScVRcoluzRk/Zw9vWTApFzzcRw1p6021OyWlXPMDnjud6olCOrxHnFEqBlLluwfUhiQHqaJLsTuiBVn9ViMg7AGK/ViezYeq7Xnf5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bom1unExi8B84YD+OPhlBHwnF0Ufb9Y+nU/oqAqzfNU=;
 b=YJ8F55gV5waL1jAvI6NtqJ6oHN955KjQE4T70EvfwNgnZd2h9EC0TQFEjtJCBUjWKtcCdejqHai0tNcy7HcU+ooZhW/gV3XBwZRLP25Q4Bonn9ZYORk7U5CM6cBTDBEBccm+BUDKThx7zY/QRjZG9s5zZTKHxiv6MpjGuW7XrvB6tvHhMneY4kw6Ex1Mxy3w+AqUmMCkrv92gP6JJN2suwLUXLa2GVWGIOpHpZpWXEwD5PNINfHviJ4eQNGoYQJkGpoJdtvUVQt8ibOmotdS3EN4eQHZpnA0fg8FiFNTkTU7YRww5UqE2Sx9LJopU571Xl+SuCg+J8/SfQxzUdHdew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by MRWPR10MB9839.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:501:81::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 13:21:45 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 13:21:44 +0000
Message-ID: <15db3d2d-8ae8-4b71-841a-df92844ec080@kontron.de>
Date: Mon, 27 Jul 2026 15:21:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 6/7] arm64: dts: imx8ulp: add secure enclave node
To: pankaj.gupta@oss.nxp.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
 <20260724-imx-se-if-v30-6-ce8ba256692c@nxp.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260724-imx-se-if-v30-6-ce8ba256692c@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::14) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|MRWPR10MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: b5349b71-62bc-479d-ad04-08deebe20125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|11063799006|10067099003|56012099006|4143699003|3023799007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: 126Er8QCmfJoNBdvST+cCi9Jjw/d4/tcBeaO90GbvW2SLINpJCjNRqWi+X6LDVJwTHxidPoQ8QjKuzKm9GdzDldRW/OVqgAZQXUaVv1mMK2CljnBa+Xfrf0iRXGfKoEdA4xnC+IaKkF0ZWNLnMwWZHtUcVB2w+ov/kCEfyKP0advyCUWslwO47fQVuW+K6un0KO2Pe1QFPZzvTPDspe9X0MxS65rTqdt1wPq9kNdESvbMMUPoqqXINOf3WIj1DuMwE7lmEMIGaDVWcOYJLkmlcm+SYhKxCFlArf0EGLMWpHodp4AmTuNPUyX+nMewEZGgq2MW7jI8co2t3ZUAApY8+ny74lH7ZhdLxV/kNwkqe8Zh9NJ5Y/pivI2WBSBJyJTYnD8LbeUhvXXbQykcdmjdcyLtjROJB/nZ/KRNqeFVfkdgXymWAwKDGOX+/kLXNxtigcPgF6UJlRNjM3xFFSOkYc5igbAXjuDjwYN0yRJWUV68s9Djx+AVEbJSjW4aSJwS2WOx2yqObW/mIDmEDooVS/4c2rt//F2r8gNS0fGlZK8zG01CY1SbqqJGwOT/7mbR+fuzlSg6Cd0aOMbiOlo5X2h6sDTJxSHbisK8iMQxG031sX46hdKg1gkG0t4PHzdcv+qqpeBbbNaES8e667hQtH8QyuADiPlKsohtGMUO/OhwvyumyR7GaUiwD9V0S0iIm8uGJ8E8hmtYax024TxRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(11063799006)(10067099003)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFZYT21wQnNnalRQS3UzUXU0QzZueVIwQ3E2STR6NnBOVkxxSXEyc3ozMWp1?=
 =?utf-8?B?RW95d2lrcGlUaTFVY0FoTXNQcW90THByQVhwWEhCQjc1QXowVlIxbG9Fc0Rl?=
 =?utf-8?B?NnhGMmVFZ3YxVE42LzVNdzdQNzdQT1RNbEFOekZFVm1UTll0MHpDK3hPaUE1?=
 =?utf-8?B?L3JqYVFjR2pzd2hnbW5INXhDaGhjL2R0TWVVNjJEcEcyY1h6dlNIL0FpazYv?=
 =?utf-8?B?YmtsalZpK3FSRlRBNTJjU3hvZFVXQU5YOTdNRlhLbFdvdFBIbjV4blI3N3g4?=
 =?utf-8?B?aVRPVFEvZGFYeHlkUHlwSit0d3lyYmxUZlc3Uk5CU2hvK2Q0ekNJOHpsWmY2?=
 =?utf-8?B?ZVozNnRDdS9aS3lZNysweTJUdkVTdTR4MjRwUi9jbzNYSXhZNmJvUXF4cENP?=
 =?utf-8?B?TTEwRWVqczQzMVR5T1FKT2hhaDM4SHpEMFRNVXI2SU9RaEdiL1IvRHpSbnNG?=
 =?utf-8?B?eDhmd0xvK0llalUvUnl3eE5uNHBMMnltVytrWGxEZGV0dGVxZit1N245K2dK?=
 =?utf-8?B?eFlaZzh6cGc5ODRoamZaL21RaE5lQzVocjBRL2lVNlo2cEVzcm9uMlljS0FE?=
 =?utf-8?B?RDdHemRGcml0R3hJbTVidFRydUMvMHJqRFlyMGtwNGIvZExjcGxhVlJHNmEw?=
 =?utf-8?B?Tkl4c1N2L0dwQkU4WSs4ZG95Q1dLSVNEMU5sODlaQkFRcTJsQ0tqWldWSkR5?=
 =?utf-8?B?NFVCOUJac2JBTW0va1k2aHpkTHFNWXB2c1ZUZFpLNkVyYnRnZ01mVWtZRmYy?=
 =?utf-8?B?OVVodGswOGpiTGpneURWT0FLQkFPZlVzcDFmRVlFRVJTdjUwWFlhL1VPaExj?=
 =?utf-8?B?cThmaXI3SlVKOGU2Vnc2MXV2U1paeVBlRFJwSmZiRko2QjdnTlNYT0d6QTdX?=
 =?utf-8?B?QVduNXNxQTk5UE9mSHhNTmJOc3B1R3M5ak9Ma044QXlZZkNzNkNDS3lKOTBk?=
 =?utf-8?B?ZnppalVwU0N1b0U1NmlsTlBpTUxJQkxlTWtGWm5VcWQ5akhuR0lOblp2aUg1?=
 =?utf-8?B?Q3ZkN2RTZzArQ1cwTzN3T2RUVURuOTJVSjNmdXNGcXQ2Y0JvUmF3ZmNNZ0V5?=
 =?utf-8?B?d2NCeFVDM1h4blRWWkloSkFNMGhXalkxajFOSmRRT3E5MGhTNjF1TllscURo?=
 =?utf-8?B?aTkxdlIreXhqWVZMVmR2aENOelNoOTJ4a29Xb3d5YWMwMC94YUNyOEdBSHo3?=
 =?utf-8?B?MTRLYVdIc04wY2pLTS85YVN6R2k0OXdwbzlwZ3pmQ0kwOHQ3dUM2d09VOTVO?=
 =?utf-8?B?QmlFbXJMaEVWQWdGZHh4ZjZPYW40aHBSQ1lzeThybHpOL091bndveHJKZy9u?=
 =?utf-8?B?K2tuUnByQ2JPVDkrOFd4bExib3Zka1gxT0VqNG0xWXV3djRzTzZzSW9PZkgx?=
 =?utf-8?B?b0NwQUtveTA1TlhNbWpPNVlmZzlhaDlPOHdqeFF1NjVGaFUwdHNXUVRwUjd5?=
 =?utf-8?B?dzFBZCtyVVQ1WEcza2RqWVFDdm4xM0RBb3ZoQ3QvK01Xa3VoV2VMZXFENGlH?=
 =?utf-8?B?Wk1PQW5nbC9oS0FaUlpoREhFTVBPUEI1VzJtN3JjaWJ6Q2pHZllGU0plUjNn?=
 =?utf-8?B?TVl6VnJIek5zNTdMOEI3QSt5UzlQaE5wcnlPRXhSOWZOekducTBhWXpsdVk1?=
 =?utf-8?B?MXZnUVFrTE0rQ2lkamQvaTZLY1JGbGZLa0t4RC9ZQVZJdlEwZXE4VmRUMk1y?=
 =?utf-8?B?WDdoYmY5eGk2RFU4R2MwRURNNnEzbzJJZ0xrZVdUdEhXU1ZZcUVJY1diRkFJ?=
 =?utf-8?B?MEcxRUw1WnJLTE1XUm5nUUprUkRSekUwbW9WcXFleCtwbmRPVW5jdXpRcjF2?=
 =?utf-8?B?Q2FaRFN0aWlGUlg3b1k2NktaSm55a0hSUmVBY25FYnR6RFYvMlJIV1d3UUx4?=
 =?utf-8?B?U1RXMTFhTEYxRXJzMkRnQTdCRzBGRkM1eWlRQXo0MHg3WWd6OVJsTHhUYUtH?=
 =?utf-8?B?ZU4xNWQ1MThEdEI1bmNHTk51SWE5TExvU1U2cDBmdks0VFFYalU5NmoxTllK?=
 =?utf-8?B?ZG9VWElzcjh0RThyclpQTmJrWitvYU9BZUl6bVRJaCtWbFEyR0pwK0hmaU1y?=
 =?utf-8?B?NDZUOWd5V1NQNXIyNnlFNnpuREtESlJyMWFYYkJhTVZPTC9lcGxSQ0w0UlBK?=
 =?utf-8?B?MHp1YS9RUkxlSEZ6NFJpdzJaa3RnaytGeUxQNFZ1c0F1MElwTUQrZjBDTGRs?=
 =?utf-8?B?QWRBMUZnUFEyRVFXQVowQUNFRFFHQnZxbkZZQStzcXYrenJESFB0eiswdC9m?=
 =?utf-8?B?RkJGbXVMRCt2UEtzcWtFcllQYyt2dkx3ZjdmUmxiNDdFMy9BdDJEckNNdUtH?=
 =?utf-8?B?SDh6cW5YSFp0VGlTdmt2K0xPMzdZNDkySWtRVURVZ3daNGpXbW9kNXYzRmEz?=
 =?utf-8?Q?EkSyn6cT2f2wf5rI=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b5349b71-62bc-479d-ad04-08deebe20125
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 13:21:44.8455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ot3QQrSLftCZygGi2QNtUf4jRLlMAgul9drFfO0bm2UZuO7osm6HjpBN/0ycocVCU8FefdaHbvmrhfYwHOGWza0JrCYk8DsVTfPInO/RRkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR10MB9839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_062151_957721_E2478FC0 
X-CRM114-Status: GOOD (  16.10  )
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

On 24.07.26 11:05, pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
> 
> Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
> for imx8ulp-evk.

You only touch the SoC dtsi here, so this description seems inaccurate.

> 
> Add label sram0 for sram@2201f000 and add secure-enclave node
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index c6d1bb9edf38..182f1444b643 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2021 NXP
> + * Copyright 2021, 2025 NXP
>   */
>  
>  #include <dt-bindings/clock/imx8ulp-clock.h>
> @@ -153,7 +153,7 @@ sosc: clock-sosc {
>  		#clock-cells = <0>;
>  	};
>  
> -	sram@2201f000 {
> +	sram0: sram@2201f000 {
>  		compatible = "mmio-sram";
>  		reg = <0x0 0x2201f000 0x0 0x1000>;
>  
> @@ -185,6 +185,13 @@ scmi_sensor: protocol@15 {
>  				#thermal-sensor-cells = <1>;
>  			};
>  		};
> +
> +		hsm0: secure-enclave {
> +			compatible = "fsl,imx8ulp-se-ele-hsm";
> +			mbox-names = "tx", "rx";
> +			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
> +			sram = <&sram0>;
> +		};

Adding this node in imx8ulp.dtsi creates a hard requirement for board
dts to add and reference a memory node. To make this easier for board
maintainers and remove duplication, we might want to provide a default
include file as I did for i.MX93 here: [1]

[1]
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-10-1a515de33093@kontron.de/

>  	};
>  
>  	cm33: remoteproc-cm33 {
> 


