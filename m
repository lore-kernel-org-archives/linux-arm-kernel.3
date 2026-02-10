Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC91EA3F2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 09:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awUyYUnK+73tq2uDRV+FC3g0Qm3Y/kbTt8uXpCsdMhs=; b=45eFuMbTkVHTKOJTiqlmh78d/Y
	9devezMhZwo5E3ov4bLSZmcQK6Vre+CDLBl4bZqDtQoTmNDIcEUSIrg6ihB5rb/BeMUs4VABruinT
	geoaTXUCbq6eJk89E11Vge9EG4NLblWCR/r79SQ+ebewQ+AUY/xP5+bAHlD6A0Lbnk0MZLgvIluBF
	Ld95Cz6ua+ryxviDhlTneCEWLzy1RLwXGvPD6u2DUk+jheqWxv1zDnOiHr1i1p2KvMmLmX5nxLRPa
	D0ybx3ZfZus9acLHXgsKhZn4G0p37kZ+DOzXxbiXP1diBdiEqMS9iE7mqLt8052ft3WcDyGgR5zBS
	jzjmFgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkEo-0000000GlCs-42Wc;
	Tue, 10 Feb 2026 09:40:54 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkEk-0000000GlCT-3Yqw;
	Tue, 10 Feb 2026 09:40:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wapYSxH6sHtbwYssGZcKPbhdyHZp8UcoF2nbuh13RjvPLF4eE+9oCGZ2S+Fezj5SKKhibHkqRiab9509MJGX7zg7wO8dBxihMO3i8ereyi6ZPtM1vu0ErJ4ImcV+xmbUCnpGZokpH4vfl4W14js4TmUPnVOmEC7o7018GxMVGQDyUuAxjBENIV4bmMFV0yG/oRsAeCJBcabScVeY0/QZISwf1DQqO61ilLDd4ipYEw9q+V8LhMw2XaXl2wqnB/IX4V6qOBx2K2hnMiH9tgu9MlYoJYTbyiXIX2Ts01G7a+G3HHdO9vgoHFswMdPuQ1sjY4C7ZhmotXqSo+4iERxOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awUyYUnK+73tq2uDRV+FC3g0Qm3Y/kbTt8uXpCsdMhs=;
 b=AU1Gi6/4/x07PGUg3eVV8/T626kj7PFDXGveJFJnoPAVYScNZyf7PyjT5GaSZupqP71R1iC6uvP0KSYj593bRzngT1DGvahvQpRLWxENfQLxu/uUBkWFusK+cb9XaAozAM4kqIN6X2M2YJyuufOpZ9KG1c4Dng+7iNkuYBBzmPicc5ru6UAxCRfxnkAdvXfwGUvO0Cxyof9NCTAw5nmtl92ApDCBOXuZkk26K5unVitNL2Uq9XBDLny3m19Q8Ob6q79/djaYlZHidMYM3ZhzkNLjWfRM0vqZVc+AbWg3uP4WF5cMupPcrSBJvboiuAmDTBYrq0Ouf1QZ+LcTYLQSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awUyYUnK+73tq2uDRV+FC3g0Qm3Y/kbTt8uXpCsdMhs=;
 b=jRKLDhB8C0pRo4JzfUkpRm70DZGQWWFkpyfcrfEOwhhw0fPUWdNSfSYz1ko+JGllp1iDO3vfK5WVj+rZ0fPRE0Em+lzpxKrrh1mNP8WONeXgDYC5SO+y2yrxcpbPjQoDsPZkCoscaKnixdqrF6T+/wzym+ifeDu6OBY9ONjkpd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB11217.eurprd04.prod.outlook.com (2603:10a6:800:29a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 10 Feb
 2026 09:40:42 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 09:40:42 +0000
Message-ID: <c16d9999-eb03-4a43-88ec-92a35447cbe5@cherry.de>
Date: Tue, 10 Feb 2026 10:40:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: rockchip: use gated-fixed-clock for
 pcie-refclk on rk3588-jaguar
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260210080303.680403-1-heiko@sntech.de>
 <20260210080303.680403-2-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260210080303.680403-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB11217:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a2f868-f332-4e4f-5f14-08de688874f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlFBUWZhLzR5YWo2SzV4STlTVHRNWmk2RVE4LzJzSmEyZkNGR0t2RUVEYkNh?=
 =?utf-8?B?ajQyVWcxT0tYZWlOMUNBVGFudnFPaGkzekFVTnBmWDdUaTlwL01JaTlZKzlk?=
 =?utf-8?B?c3hUNXZ6ZG1ua0xkT2RwV0JDcCs4VFRPU05wU0hPV2lTak1hM1pRY0hoYW53?=
 =?utf-8?B?c1dvNkdMaE5MeXFjS1JEWGhyNWJUK0JwWDNIN3BZQm52Y0N5WVFRV2ZGdkpp?=
 =?utf-8?B?UlNSYnFFTTVzb0Z6L3c1dTFqL3JHZFE4ZEtrSndwVVBsT3JpOUh5RzNpOFBQ?=
 =?utf-8?B?TnAzUlRkc3J3NlNwNlpPNEpHTGFZK3ZwZ04xL0ZiS1hSNldoVjVnNmk4T0la?=
 =?utf-8?B?NCtKc0d0aVRsUlVydllzd2d0dUt1TFVBNFgzOU51NHgwdjdoajJ0ZmZXZ25n?=
 =?utf-8?B?NCs2T3RVNm5jSjBaRzBMU1JLcE54bzlsbFQrVEs5RGp5YUdia24ycXZNVVdT?=
 =?utf-8?B?OVg5SnJ6c2ttaDQ0NlU5QzFIWnRZVk9INU00UzhXRXZ1OUNEVlUxaER5Ky8w?=
 =?utf-8?B?Rko5S1dnMEZaVEl4bE1FelphUkdtN3BPZmJKaythMEY0Sko5Yk9MeVlRUFZ4?=
 =?utf-8?B?eWFhU3Z0NGlwZDdqWE92L3hJOWVMUDNkUG5sQVFzZ1JXSXRWNU5KS3Z3L0JQ?=
 =?utf-8?B?QmdXZnJSa0M3K1dQRjdqQzg4cWxhenkxaGFmeTFWTUlKQjVoZTUwdEpJSlhB?=
 =?utf-8?B?Q25OWXc1dmhBcE82U1MySkhXaW93MUFhTXc2aGNSbVZ1ZUV6NWJCU2NBdmN0?=
 =?utf-8?B?dE12RGZCZDRLblpnRm9YaFhVazJETWRnblU4REtUK3dCb1dMdm5FVk1BS24x?=
 =?utf-8?B?MERIM05CbDE2MUF2MDNDRkZGVGluKyt5NTF0eUxUK2NhMkp1M3VqNlowYmln?=
 =?utf-8?B?MmN0c0xQVWY4dHZFdGFEa2NkazhuRTdwcFo3OVY3VXUzUU9zZHBHUkFpQjd3?=
 =?utf-8?B?MDZWem9wbUhtbWpWKy9tRWdlM3NEeUU3OCtmUmMyTUdhUm40V1F6SnV1NDNp?=
 =?utf-8?B?a2dJeDZ1d2s5emNWdlAzZEtSQjVzRVJzOEJYS1BaQ2syNFdwUWQ0U1l0NmNS?=
 =?utf-8?B?dTBxYWd1MDBMWkRjWTBzbWcxMEZJREYwVEthSnpjeTNJUU9yWklsalRCRkRV?=
 =?utf-8?B?K2habHFlS2dFbi84ckMyNGIybkNSM2NrS2dJY3BROFU0MTdhSUN4OXZaWHFn?=
 =?utf-8?B?UGVNS0FmREZwaExMeUsxRzRHN2VXVVo0bFVhWGRINkhjdVhrTHJRVUdqLzUr?=
 =?utf-8?B?UHY1VHpiK2ZqcytmY3B4cE5OeGx6amtwWExiZHc1QWpQNTdDKzlYN1NRWk81?=
 =?utf-8?B?ckczNDB2eU13Nk5oVE5SSlpSWWRvR2QyUTNRQmV6eDZLY1Zwd05xcWFJWlBY?=
 =?utf-8?B?QUlGcHgwUlA4VzVGUTh1SzdqQUNudmhnYUZrbmpUT3V6aWxQRGJUTmV3TkpZ?=
 =?utf-8?B?d2xzbmJJZ01zdUc0dHdtcHFSaWJtY2RMVitlQmtRUEFxcXI2YWdlNFBSTG1W?=
 =?utf-8?B?QUd2eE03YU9aYUFhWXpXT1ozQnl0bmF6UnRrbWovaFA2cGNEQk1JOVRuNmFS?=
 =?utf-8?B?UVdmVVV0SWVOSWFTQVIvQitwWWJMakJ0bDVocXZwK3kreDF2RHBTcEJsNk5Z?=
 =?utf-8?B?MkNGQ0xPL2FvNlFoYlZ4WVp5Zy91M1UxV2V1YVhrQ3UxRzEzQXZzYnZFa1NH?=
 =?utf-8?B?MEpDdldmTUs4Uml0Sk1KbmpPZzBzSUh6aU94bmFpdk5UcFFpdW9hNWlRbWsr?=
 =?utf-8?B?Tk1vdDE5ZkVkRlQ3dDMycUNEdmdobGFVcGdsVXNBU1pwNjVScmdRWEZsMytK?=
 =?utf-8?B?VnZpSUplRXVQd0VnU3o4MTZ1UzYxbDcraDJULy9uZ0pqWXppMWhnZkxZdVMr?=
 =?utf-8?B?NjhHWm9LNnNuc3A3ZEtwQ3lmWkx6aFc3R3IyR3Y0S3E2L09NZ0VxOGVZbTJa?=
 =?utf-8?B?L1YvWG8xQXk2YTJBNTBvbG00VWdPT2NUSnF3b0dwY3ZQTHFzSlkzQ0s1a2tC?=
 =?utf-8?B?TGVlaEdUWGk4SlR4S0dvZE9HWXJGK0pqbG1KY3g1M2NLYUlHM3JQdEpWaWov?=
 =?utf-8?B?bGxMYTJGajEzQ0gySzhtdmdiWmVjUXR4NHUrK0Vmem5SV0RjMFR3T3NZbENF?=
 =?utf-8?Q?0JV0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am9QQ1BoNUd3OTRhQWlNekhsUWZWYVM1N0xpS3g0V1FpYmlKRG5EVm4xVGlL?=
 =?utf-8?B?d09HUndrZ01BZFM4Z0RIZDRmNHo3MXE0L2RweHVPeklMblJBZHpRTTJtZVF1?=
 =?utf-8?B?RElIQTJKWU5hSElnSTZ1all6YVZUNzZxL1ZtOU1zWXMvNmEvTGE4S0JRYk9l?=
 =?utf-8?B?YUU1Nk93c1NYc081MzNGRkxmS3JtZ3c4dDdxUTFmYWJxeHVidEU1cTVBQ1RS?=
 =?utf-8?B?a01rTEk3VVB3ZDRqTkR5a012eDZuN2FLMDNWMVJHbk42andLdTg2bjdwRGV1?=
 =?utf-8?B?RWZoMW9ReUtzeGRsVmlxSHpmVGN1cHh3bXJFbXlmOUJEOGg1cHIvNEwybmR4?=
 =?utf-8?B?VWQzaHR5dGxIbHlxd1J0SWMwa09uVkQvOTMwWGJFM0JUbzZkaGcwV05PSmdZ?=
 =?utf-8?B?S0s1Z0VJdm0wSjhhUDBkMk1NZ1BjOEVyWTMvY3plNXVwWXNzV3hVS1Q0MTM5?=
 =?utf-8?B?d3NqVzNRU3NVKzJHZ3M4NCtETm5OY0pvSUtrWVM3Qy9DTG1nZkl2Rll0Q09H?=
 =?utf-8?B?cnlGbFZINXd1c1kvWEVYWk9kT2ZKSnRLZTlmdHI0Q2xKaXpLQ093eFJPN3lo?=
 =?utf-8?B?TCs1Vy96VW1WVFpOcE1mUlNWQ0JZVlg4VHNzdXV2MDVSczhJWEIzV1VQVm9y?=
 =?utf-8?B?SHFsQ2Nvcm9MT2ZmL0lvUlJnUUNER1pSalZrK3g5ME5GQjYxV0ZCeUVwSlhK?=
 =?utf-8?B?U25JWUJWVlFCNWlMSnIwbXdGZnl5NXcwdU9vUjd4dnVabnFCc2pNVHI4c3BM?=
 =?utf-8?B?eVFHcE5QY1owN25WVHA3R08xcm43WUlNemxHQzQ3SllSZTg5LzdnY1lrdGZH?=
 =?utf-8?B?d3ZDNXhxOTI2dGMrSUNHUUROM1BUUjhXRnZObi90a3BYNnB6elhXRldrelcr?=
 =?utf-8?B?b20wUmdqNitocmtWNzlDWjR6YXNZLzZ3bHR5ZXhneFZvWlU2YzRESXZnVXoy?=
 =?utf-8?B?T1ZoNkorZUlXanMwL2NtWk1IUVkxeHFaUWcxYlp1OXdhaUQ3Y2J6RlVUd1A3?=
 =?utf-8?B?Nno2SWk5MjZxSlhGb3UzZVd4SFVOOGpXN0hzUTd1cEk4UmZEVGZqUWxTbko5?=
 =?utf-8?B?czkxcmpHcTg0bEM2Sm5jSzc1NFI3djk0cmtUdlVLaDBNbk82YU0rcE80cm9l?=
 =?utf-8?B?a1Z2Y3A5dnlpN2NOSmRWSnNKcjNiUnRCdk1BbTR1UjcwdDhFZ2lqdEdCUUlW?=
 =?utf-8?B?bEN0YklvR2owVitCaEVHd3REdXpsUGdNdkRBemNIQVZWZXVzbWNRVXJSdHlm?=
 =?utf-8?B?UWM1eEh4WUhiRUlJcFRKRERNcVFkckZmalI5NGNNZGllU3l2UXFnRnZKNzVP?=
 =?utf-8?B?MmtJVzRXdWdMb0JZTXhxT2N5YjBCcnE3alZpdG5EOVJDY2REeElKT21PMGN0?=
 =?utf-8?B?K203YVNid3JDYW56cEhZWG9SRXFieVJOR1hxcXQzK2RBbFlROHF4STR4bEZH?=
 =?utf-8?B?OXEwS3M5U0JNaDFRRWVKVHB6MHF4UFFVSUNkR2dPVmM5YmxzR0M3Tld2Rm10?=
 =?utf-8?B?RXlzYThJV0ZzRWNpUXFHZHRYZXBZZVE5dzI0MUFyRHZuSlZpeGxEcmtVc1R2?=
 =?utf-8?B?Skp2d1lPblIreXE2dTJ6V3NkY015djR2M2pGZ3FsVTJ4bVNJZEVNUTRFbUdW?=
 =?utf-8?B?Uzg0Y2JtWFBvU0I5dGhmZ20vaXVIT1BwTXVWQk5HS215RVF0cktQQXlRcHdD?=
 =?utf-8?B?TFVNNjY5VGNtSU5ocktzenR6RlVPV0ZDTDcvUkdaakZyTm1rQitQRmgxWFhk?=
 =?utf-8?B?UnRnWkZ4alhPWG9waG1VTWptbjdWOGNUeEdGSlZNb0ZqcFFiMFppWUkvWGda?=
 =?utf-8?B?T1RZTUgvclQ5cTRQdHJwUEU2VDZXajZDQ0ZJT0lhVGdaa2E5VDJXTlpxR3ZS?=
 =?utf-8?B?c2gwb2F1blZnYkRsd0NQMHhod2tWcDl1bUxGL0ZKZW9va2IyMU1DMnltR3Fn?=
 =?utf-8?B?UEd1SUgwWG82WVNudzVOc3hvdE9hT21tdWdsTWN5bkV3V3d0UXBEMnZrVHlj?=
 =?utf-8?B?WEo0YWR3dngzL0dCK1FwQVZINmY1bHlaSXUvdmFMekdaRzZUSGhnaFRYZXdk?=
 =?utf-8?B?QXgzZVZScXlzOW5OMU1VL0Fyc2dFLzVoRFI5dHBOZ1NzbEIvT2F5V29PdUhV?=
 =?utf-8?B?SjI4blFPRWxYWmVvS1JhemV4ZkhzU2xUeGFPMmRveEhSemxnWHowUUdiYVBZ?=
 =?utf-8?B?SVpFaTJvT0VLdm8ySElyUDdVMVQzMVRIbVovZEVxWWxUbG1jbXhoRTdFMGs1?=
 =?utf-8?B?UmtvYk4yb0VmQko2Q3ZndmVkcTBvdzN0TDlvSDZTR1JMLzJsZ1B1aHl6a3hx?=
 =?utf-8?B?dnptYlJkMXY5Ykx1SWp0dTlER1FHc3NDdHp6TGU2YmJjUHhxc3lGeWxvU3F2?=
 =?utf-8?Q?QD8B2dUWdTPvoadnBORFGDqYp8ZqJOxGKBsnO?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a2f868-f332-4e4f-5f14-08de688874f1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:40:42.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AhZi+J64K3RRW7rsvvtoXwBSOeG848OiogwjQnIWa8kMC+hObfZZ9A2gpiIv182wf/CbDG/dG9KIkZ3eb6FYb7BmjXAhkqH4kaFHCXzuso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_014050_911568_6D613F88 
X-CRM114-Status: UNSURE (   8.74  )
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

On 2/10/26 9:02 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Using a combination of fixed clock and gpio-gate clock works but does
> not describe the actual hardware. Use the gated-fixed-clock binding
> to describe this in a nicer way.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

