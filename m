Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF18CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4A+KbJiMyHxqKtvt0+yx23BhmynAulV4IjGH8tLrVA=; b=sNpptvNR36LfInFkYv3tLW1SvM
	SIEDNEjrVFYzsxd32Ce8/MMoemC/4DX4Th8uAS9B8fYD7w3mHGyUg4dlAZlGb24FnrEknz/v3K0aZ
	wDMpdfwdY3EccZ5zhvgh3y2QuhE9XEmc8PGRJRc0uP26RoBppVjsRVH8WsonR/E1tm924r2rSjJSz
	3WGGs6WeYkNaegwV4yEeWk5VOZYtydtPKejJ47cYaylBSi472opYzt4bVgWoH8EBGVK9dVdozq1bV
	9u0CqFytyc5h2m6NilvQt7RfA+QH5o3QZqZJc+1a/6YATdFXuTI4G8f6/5llDB9pUxUp42Ow9nqML
	XYNnJKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v915n-00000001crw-399M;
	Wed, 15 Oct 2025 12:58:59 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v915j-00000001cpR-2UZI;
	Wed, 15 Oct 2025 12:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY5uOvB/uv2sNpjMDNQrqijIPrUf9iF9YVHD2ogJw4ocL8/dPK++misjljclPaBRzI0R7+UIWCfekTNVqLQb2GwrzDryF4UIQW51snv7aPu6I/rLngSH/kF65RxK31LFF7iskw61NV3sXoR10+FOxcbaSzGAU06ef3ToFxcJXk49FgVrt0umJD65TsYZyLNk2Z7ri8IKO8fYOAlhGNJZlLP3o4QvgQLFOZMcpv5pH3gdpqmVrVDB1dV2xbLVRb5qFBbK6AMyQZeh/NLvrPA6Ar3MwJxfb9t1+qrIiCDFb/H0VYx2uE07ISMlYSP6nlRRkZHozy04Yr4rbR2lee1sPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4A+KbJiMyHxqKtvt0+yx23BhmynAulV4IjGH8tLrVA=;
 b=aOCgnYEtVL1gHpKyD8bYYWuGdPmF3VELUQnPABdVywLBcKc1LLJEct7xBtgB+sMYLNBnmhEM3ztB0GWGqqfH/+W03HfnNInWNtbixQUjstfYSPAtBguYJSLu+Ugbi/uxFI/iIR8mffty0rGiE40rEmA320keZLbFcep4rlnd2XQGr6roYX1V7DRC35IMS/8l1IX/99nw8arXFWbmEnwoV5EmnozxA9iaq1qucUvtQrHw+i6DgdEQtjCPp5lTMTbMBZpzrhmghlAt0DUonQGnHvDMitbjPOJ4W6IkMJz94ilnE5wr99fTqVwcPRSRf/emChni/Dp8BdZavabcdfW2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4A+KbJiMyHxqKtvt0+yx23BhmynAulV4IjGH8tLrVA=;
 b=n0/2j6CjdwGcjJRdNiCknbq354CGeZW4UTT2UcSgfNqIunYqceOdGFXNgrBrI9lQJcrGqh6G4hqFTZzkd9YlpYLU64n1TZXYhVcNp02Ld0hGc6KKdYgM7E0Mg45GAuz6wTshyAFnjRESJAttOSUxghsFgltCTBa1MKwQuEnDKg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 12:58:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 12:58:47 +0000
Message-ID: <6677ebf9-50bd-4df0-806c-9698f2256a8d@cherry.de>
Date: Wed, 15 Oct 2025 14:58:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: rockchip: rk3588: Don't change PLL rates when
 setting dclk_vop2_src
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org, zhangqing@rock-chips.com,
 sebastian.reichel@collabora.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251008133135.3745785-1-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251008133135.3745785-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: fbdca7ce-54fb-4dcb-edfe-08de0bea9449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTcrY0h6RFZCYnVRQzErbWI4U3FETElFaVpNY1RIR0tZTm5ZdVdHelBUZnBl?=
 =?utf-8?B?Z1o4ZWowOS9FbGRJeHhTUW43bmFOWS9YazZ5Q05ySUJpQzJ5cTBnbzA3YzVt?=
 =?utf-8?B?UDZlaFRJUkpLWEdiZUNxbS8xbUtZRDBVRm5OM2tUQ2pTYkpaYitxMTUvK21j?=
 =?utf-8?B?bjNvMzN3SG90dVgyWlFFNGcyZ3N2MVBoZ2FiaFVJN0Znay9wRjg0dnh5b1dt?=
 =?utf-8?B?SExoekc4OWdqVEhWTHh1dVZpN21ib2t2Q09GemR4MkNQSEdNR0lHdWo1ZjdI?=
 =?utf-8?B?cHZCcVFER0x5ZCszVzlyYnRadmQwQzV2UStxbmc5MUZDZ3czWHhjNUIvZVRt?=
 =?utf-8?B?Wm04K21wc25JZUNFbWVMZ1lGSzZSUjNlb2pLVVZiVEVVNFFCUEp2VDV0Y1dY?=
 =?utf-8?B?VksyZWw4Rkw1MkdyUlB6S2Fwa2ZGZkNsdHVFc0NmRjJjVW45ZkRXVW1XVWxj?=
 =?utf-8?B?QWlSc1VrdkVvT3VlbUtnNVhuNFpwYTBNbCtHbkNqbmZlaXY0cExIeW9HN2Fz?=
 =?utf-8?B?YXVSZDNiK1hHT1NQSTZuTDBJTDhuVTRGVGFLOVdrT0ZlbTJXQ2FjVWRaSk85?=
 =?utf-8?B?dVJnanYycHhONmw2ajVHMloyMnk3akZJMVc2WFhURi9wSCtGYjBsUEJDOGZt?=
 =?utf-8?B?MkdJWjRQMWVyT0pGY3dyOGNxVExQazhCUjJoWEZyVWRRQzhwd0JPZGVQaUxZ?=
 =?utf-8?B?elJ5WE9hV2ZRQVZmZStuUU5kUVhRc0VMMGx4L3NWYnVkTXY4ZW05S3V6SXdo?=
 =?utf-8?B?N3FKWm1TS0poZkJ1U3kvSDRCVkxETEMwaThZdWNOTGVISk9IR20rcG9nd1FM?=
 =?utf-8?B?YXhMS1JKSjR4ZWQ1UXhiRG1LY3l3NGlWd0pPVFlZWXdKRjFOV2JMSzBTMUZB?=
 =?utf-8?B?RFpVVzA2VTZOSGs2OXZnSnVpMFJHVFNlb0xyelZiNDZWNzRhdjRXVGhZSWEz?=
 =?utf-8?B?MkhQU3BWMUtGRnRBUW1ma29HK0QyZlY3VVFYVUo4MjJqMUxDcEEyK3NSTWxY?=
 =?utf-8?B?ajRoL3JQai9vK3JpcGdGTGVMQStlUkpuaVBhVk5JSUwxMlNFbTdCblZ4VElk?=
 =?utf-8?B?ci9kQ2VKenFsYmdKWENoZ3o5L0Eyc3BWYXkrUUxLKyt5ZEtGeXJoaG1ub1Vy?=
 =?utf-8?B?Q20wNW1yc0srNXJTZlpFR0dFUXdVM3l5M2VTSlMyTnlpSnZYUngxcFhFWWdR?=
 =?utf-8?B?dG5tWjZtWGRPWlpSS1Nuc1F5eDV1YXZpM2cyTWlkTVpmV3lKVWlXVUNNRHF3?=
 =?utf-8?B?OVZMczZhcFQ0VG50NCtCb1VMNDMwcjVaN3A5NTRiMlRCQnZ6SDduZ0hKTEI3?=
 =?utf-8?B?MjBxanl2Q1dyWGNEblFVYTUvbVorWGl4NlJiSiszWjhBcVNkYmpXWWYrOHpI?=
 =?utf-8?B?VUpnU0VnNnBuMXR0QnFlZ21KQjViMEx6OE9KL1RCTjUvNTBhSHk0T1kzRUli?=
 =?utf-8?B?SFRjU2g5Unp0S3FlYzZ2eldYZ2owakEwTk5UYWNXY21NU0VvUWt4VHJzaXFs?=
 =?utf-8?B?a2hHanI2NnhwMENFOXNjS3FKTXAwdWhRTnYxU2hiZi82dmhnVE5VVHd4ZzV6?=
 =?utf-8?B?ZWxZZ2VGNVUvZGNGdGFYNFVQS25lcXJhSnlrbE9QdzRoSGFEOFZzOXZleWJi?=
 =?utf-8?B?NFFWZWwwclZzc3ZITTVrNU5hTnlUYXlOQ2ppYzhtYmdKeTV2alZ2cWsrVFVL?=
 =?utf-8?B?eVExYmJxZVFvQjVKMDMyem9CcjZIdnpkbUd5V2IyUlN5VDE3TG1nTFphZEhJ?=
 =?utf-8?B?dWZuaytDWUxhRFdQaVZFM2YzdzdrV25DQkg2ZC9kOHBWN3ZpNGdQK01ZUDFC?=
 =?utf-8?B?bmpQZ1NsRWk0QUNHNVh2dXJvWTFscC95ZDJpV2JpbUFuZzR5QTNRMXV0Tytn?=
 =?utf-8?B?elFkb1h0dHlHdnMxSlVEM09Pby9rM0U5STVPRjFWR0dSNFFWeGd5cC9MMTQv?=
 =?utf-8?Q?KituOcq9/wX4ttqVCNjQlYlo4J7WGYCs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUg2OFBSbnB1NXB5bE5FdzdzRXoyeTJhbC9FUTQycGZHOTQ0cEtOYitLTWlx?=
 =?utf-8?B?ZGhzNFRjTTBQdVVydzhXTWM3SXgyTjZVbTZZVnloSlZTK1dITEdQYlBqNnNC?=
 =?utf-8?B?UGFIV2IwRHZvQStRTGZObUdMWVo3WHZwL05sTmhYU0hpdXRsZmdlVVFpZ2kx?=
 =?utf-8?B?YXVaQjMwbzJuZGhzcE1WNHF6ODF0M2JJdXBUMkxIbk1kdk5zek9ZTW5tZDhL?=
 =?utf-8?B?UGZEYzV0MEpSdERxQ2lBcWlrb0NuMEFyd2h3QjRsL2xNOFc3b0JtUzFqdVpP?=
 =?utf-8?B?ZDVTdWdaYVViVUt3N0tUajJLcVJVajhhWnNxTHF6QVA3eVhYYXpjcURZa1J3?=
 =?utf-8?B?azlxZzFnamtNZ0FBR2ViMlR2NzhERG9Jb0UrYi9pNXh6UWRaWGZFM3Z3RGVP?=
 =?utf-8?B?b2N1Y2NscUwrdEg3akdZbFQxa1RxVnFndEh1WW54bTFaWHlKb0czMFJLQWlN?=
 =?utf-8?B?OTBMdzZGZ01la2JXeVdjeFQwNEpCUTREeEJ6RmVQMzJGVXBUTmpNQ3dSeGRj?=
 =?utf-8?B?K3BHN2hmN29Sblc3T3FaZFlydHovOUNUTG1QaitTLzc0Uis3NEVwc2VLUzd6?=
 =?utf-8?B?VG1UVzAycThVNkVjcEV0aGVkNFZRRVl1cUN1QlByZXRkbzlPMldGdk8xeDZD?=
 =?utf-8?B?MXlROEs4aVhDcWZBOS9WOW00QjR6OWJtakVRK0RMOVM4VmtiMkZaWWZDNmg0?=
 =?utf-8?B?eUpaOTY0aGZyZ1VGYzY4NkZxek5HQnlUaU4yMlN4Ym5OTlJ4ajFQOTVBOS93?=
 =?utf-8?B?bUo1ODhBZWVpSUd4cGpPckxEb1RaRVlOOHVjZzJJbVh6bVVZQnFJUlczYTJN?=
 =?utf-8?B?SUd5U1BWcGdNZWw0VmozM2VMSitmR0hZNm50bVArNXdKaXJTeTJJZ3BkeG9R?=
 =?utf-8?B?TW5ja0crc3A4czl0eUVjT3ZGWVFmdEpsWENhZkZqcWJRWEtFZmlLckxTVy9p?=
 =?utf-8?B?QzU5bFM1N3RKZXVUMnhmV1V0RSt6L1VweWNBcUs5WCtKL3Mvem01UjlkQk5w?=
 =?utf-8?B?NkQ0Tk8wS3dGNi82RXVtakxSRVoxaWtyTGFOb0VCeTFWZjdXTTVOYlpwOGNH?=
 =?utf-8?B?a3hFcktoMmY1Z2JBNUZxcDFVNjA2VjFQeDRTYkhPOUR6SURhem4xVjdhNkdI?=
 =?utf-8?B?QzBpYjJUeXpEL1EwWE4rNXlaRUJQdWVNKzE2VzlNMHNuakl3NFlTSys1MTJV?=
 =?utf-8?B?bStPRGFqSE1Rbmlxck9zbTZ2ZXRGTVN0QzRBb2VlUTI1aHRPeXZLUFFDWVN0?=
 =?utf-8?B?MGI2bTllODdQWlZtTUxOQUY1c1F6WGNzaEd3bXE4QnZnejgvZjg4ZUZYR1Uw?=
 =?utf-8?B?cHRzREozb0FkSjloQnN6V2NKTjBwTmlYSmpUUmJwVmVMWjU5dGpYMEdxOEFn?=
 =?utf-8?B?MnM4ek0rcXhnWkJ0R3pUeUNNa09IZkd6bTlqMEN4SWlpMG9sbDdudTQwOUo3?=
 =?utf-8?B?UGJDQU81cnRFYzhmbVFTbGhYRXF5dEorbTc5VUh2NGtieXpwMHM1N2ZWZFBk?=
 =?utf-8?B?bTRza1NqZjZYd1FkdEFtdlU0SnphUmJjVGcrRVFSekJCaEFHdHk4WTlyWTB5?=
 =?utf-8?B?L0xJUEFxMXJoTW5uN3lQWFhyd0tPWVEzUGJMUys4NFJCb0RqN0tIZ1NiS0RF?=
 =?utf-8?B?WXl4bWRNMnVmUUVOUGtnUnJKQ3ZHcGYwcWFORzBiUHdER09HVXR0RE1lY1li?=
 =?utf-8?B?c2Fpdms3R3VKRkkvWGxvWUdMblMvQ0R0ME1JcmM1cWw4d01Gem0rcEZJMDlY?=
 =?utf-8?B?STk1eFpCQ2hXQ2dvdU0wMkgwQTJ3bVlXeGIzZ2MySXpKTjVWMUdRQy9TQ2JX?=
 =?utf-8?B?UlN5L2czUWZtSjRFSXVQWmc1S1VDV080VnB5NFJDWmEydFdUc0tiMTVDT01H?=
 =?utf-8?B?VUhGc3AyVW5Ea05NV0RuRGlacWgrWGpmNkdTdlZRT2ExaWhwTkZHay9LNXUv?=
 =?utf-8?B?WkdKbzNXY2VJRXBQWUpHRU9peUNlczVWZEVjNXgrOUlDK3VjeWNsS1dSbkkz?=
 =?utf-8?B?K1RWS1RqQWNXR2FGVjRCR0hYMGZlU3lmSE1UT0pKS2ZnZWZWMUlGVmZQNkl4?=
 =?utf-8?B?dXBYdExneWJCV3VxZ1dWWEZuYm5NN0N4YjBTeWY3L3JKcnNvOGN5bjVFY2xi?=
 =?utf-8?B?eG9GRmRvV1BVQ3B3UGFZWkFRREFTWGJ3aFBxb3Z6ODFyYmpGdWVjaCtDWlZi?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdca7ce-54fb-4dcb-edfe-08de0bea9449
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 12:58:47.5711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5j3o+yZW1NOBOx4dD2zixJgOe25nBEFj9iS2HqqiemAlF4l+Eo5DlZmhzkeT6UYewHmzbiF7dArjR7eK4uLo73G8++oN98GaujSm2ZJtnkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_055856_062330_1B5BB4A5 
X-CRM114-Status: GOOD (  17.00  )
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

On 10/8/25 3:31 PM, Heiko Stuebner wrote:
> dclk_vop2_src currently has CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT
> flags set, which is vastly different than dclk_vop0_src or dclk_vop1_src,
> which have none of those.
> 
> With these flags in dclk_vop2_src, actually setting the clock then results
> in a lot of other peripherals breaking, because setting the rate results
> in the PLL source getting changed:
> 
> [   14.898718] clk_core_set_rate_nolock: setting rate for dclk_vop2 to 152840000
> [   15.155017] clk_change_rate: setting rate for pll_gpll to 1680000000
> [ clk adjusting every gpll user ]
> 
> This includes possibly the other vops, i2s, spdif and even the uarts.
> Among other possible things, this breaks the uart console on a board
> I use. Sometimes it recovers later on, but there will be a big block

I can reproduce on the same board as yours and this fixes the issue 
indeed (note I can only reproduce for now when display the modetest 
pattern, otherwise after boot the console seems fine to me).

So,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger w/ 
DP carrierboard

> of garbled output for a while at least.
> 
> Shared PLLs should not be changed by individual users, so drop these
> flags from dclk_vop2_src and make the flags the same as on dclk_vop0
> and dclk_vop1.
> 

I hope there isn't a hardware reason for CLK_SET_RATE_NO_REPARENT which 
we remove here. But there's only one consumer of this clock (dclk_vop2) 
so this would be an isolated problem if there ever is one and now we 
match vop0 and vop1 behavior and I like consistency :)

Thanks!
Quentin

