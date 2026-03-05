Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242CEF30955
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5zVsERJ5AxLSu+YZ8Q76HfpHYdfqT3jJxmwrqINGnM=; b=rA7vE7j96C0UbYQ1OQB4M64ntd
	aiZ9Kwr/fflNojOocWoOuPOtLb9B1zc76uDABssyZ0W+ua3DURZNHcZQ1bm5v7ZB1Jz9Y383zdmGP
	1SPUdOHY2d1MeX4SSmHbW8Mvof+H02WdAo7cSAQ5lBIuM1+HL1CDSphSqQrbAVfUcvoUOgFtY3VTF
	9PrHJ1WByurXsvIow8m5JzYInLSHzmRK5mWlhg7dkgkZbh6w4PMb5BzCov8IZwCXd+PL7PUzqlG9M
	0X5VbYTBNfTAVHoJ4WzG0CgxFZ9Qiq1Nbvq2Lm/5cV/Xd9pxT6F5rTA2VWlev120G1pm9ZF7c0jfg
	8CW4eeJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7yj-00000001mcU-2mOA;
	Thu, 05 Mar 2026 12:38:57 +0000
Received: from mail-francecentralazon11013064.outbound.protection.outlook.com ([40.107.162.64] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7yg-00000001mb6-2YGs;
	Thu, 05 Mar 2026 12:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbJcrMZ8JoL3JM+UQarEIlYo1VRL76lF/yu1Ysk8dIbpKfIW+YQyuD30V7S7fZCpKeGcZ2QB4imDosCntYHiSndWmbdkWGQoAeX5pyCxtWaaBOo8KaxUjSmn9cfQ03VUh9PcwTm8XwvLGQxOZJ2ROoaKQik/B66rtHB/Ex17F+OkMtVxmUbX4xauqF785Jq9J5Gdrti22QySMG20h/+INnGnRNaUYn4rFbpZGd0A7GjBv1h1kNtTTcV3dmjA8l8+gtS0JIVkfkOw0f9SSppXU64jc/BuuLQZoRzWTYESeTW9lBLVpczMPttRpk5yRKo151xKzxiZOgjqPQRnHJRz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5zVsERJ5AxLSu+YZ8Q76HfpHYdfqT3jJxmwrqINGnM=;
 b=S+3ojnKwSNBnLejWohnje/QHQt9J34aMfJil+J11jjER2+ERCndiPBMI2QDZRXGKffgKnKnzGm0o5mlOjqE4U/T9x57d4czO/8jlZJOEjvJbL7wJ/XZU1gbX89NnP8j4JbnPisv4VVo4tRuJnT2/thEx5q2iblPw7cwOWuN3kKhjMmBhlgBVUY0ICdiyfTY6gRW/D3Zlj1uB8Jlw8+aCPpt5oZOipcceJeCLtzxxPuzb8Pmdzyamyqe/rEM4V7U+ggeZoDowibzvceSqBPLBPtvVBdif1GMFqXjVe+GUvtM0MPXxpag87M84gvVd+obBMXciBmkYtCUmFmUmTbK8oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5zVsERJ5AxLSu+YZ8Q76HfpHYdfqT3jJxmwrqINGnM=;
 b=oUqlfobSt5WV1IwafvcYR4pbTs8L/SocsjZ5aY8Z3tvURLsOdwKeUHhxLCt714SsBDCTkPyPn0Pq5NxSBZiF/ka/I+GLrfBvpXkrEDmrMZPV48mK/91I3HjAr7tlXcBiUp+EWfg9QmkSmhfcLxhRG/2FAcuCD7kpRYWXpR/xXxiFrMXheV/jF8mhExU1s8R4hVRqMeO4BjzG+zxTXAgdrlZRm9JPddeJZHJqkfMeVHzQRS+EvEQsDT8T5dSNyaMBY+DE4tY4xYOcDyuKXhz7G9NC/JguHKGq/SxvEy66/gELa4FV8Z6eMg0WTYnePQ5KkDEaNwNII79+sHvaZ5SuUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10677.eurprd04.prod.outlook.com (2603:10a6:150:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 12:38:47 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 12:38:47 +0000
Date: Thu, 5 Mar 2026 14:38:43 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305123843.i47asdrjychwlgdt@skbuf>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305121532.GA1649635@rocinante>
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10677:EE_
X-MS-Office365-Filtering-Correlation-Id: 92fd34bf-a4bd-4ba1-ae20-08de7ab42580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|19092799006|366016;
X-Microsoft-Antispam-Message-Info: Or+3d3/Ai/ryZw9YiuleRyLi6cCpR/E4gqjC7S9WM3nwx9v938lMLYmfPt8wASXmJkcCeqES7dQP00CmXE8idAgy6SwSJQuomwP9SkcoRUzDj3VGHd6+co+pjwYpGoiA6g7R4WOzuAt8PpDZi4gBSnX5qeKlfNGHTxmHX8QiGOS1m682O2qX+Oz1cvy/IBLLMzZ7DfAIoLUX+4JWEOmIxCq5DY+f/BVhluUbA7KfccSnERH7SBttosd/r5zAsConSn/00qM1bycBYAwSMLFBkQCJicNM1IITNiE/OFgYEJw7IH/KXVSVkH9HW0fDmxFKUWphxIO4b6iR8vPQQalzRtU0H0oMkfjQpqfVjvlZc1FkBoaTnA35Qkf9GPpgF0au80lUL1ITwqoVIR6AsHNxqIyLXJDIE1NmBujwPS1Bi8eSzwPZomDu5S0uGL8ucs4Hiq23xFTlEeFUvoCdKgLWB4YzyGixa+pdjdAs6Wy+G8yJsAWyMn02/fL20iPpCr9orYFYKFYqG3Wykns+JGSD1KeVg7wHTYQnk3hHoUmyMijoH2Di8kCgIeEh792TtJuWELSd45qq5TxK8iBEROCG/tJKi5Hkk9zjnhrEc1j/nuzCKWSsa27cCCl7F2STkh4w4J8hz7kkjfpiwXVSkDoqCqn+cRjks05o50h/a1LZllRfW0QXjUVh3rcNSvZv8bvAjH5Z4OHj9HiPvvGl+6J5U59vroFPrWkPWHla1yrpjz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(19092799006)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVRFZVpvdTRVSE1td2poSE5HdWRRZ2NwellsNmtKbmVvUnA5TjI0Q2JqV2Jt?=
 =?utf-8?B?K0FRSFhqZkdIdTJvSFhaR2FTQTFRQU5MM1R4UEorRUY5Zy9MM3NtT3ZJUWhH?=
 =?utf-8?B?dzdzRlBLUTNOZnozUlEvQ3FJVVBtVjFFRlJ2dkRoNHBZZTloNmFDcU80T3Fx?=
 =?utf-8?B?UWxXZGRrbis3STh4MnZlaGNaNyttQVVaNHlZenVqT2hjOWFFYnpRbnJldkpD?=
 =?utf-8?B?Z1dWV2o1SkEwM2JTTjJRUjVEUGdJUUVYRCt3WTR2TDRtNzZMc0tnQVExaStv?=
 =?utf-8?B?ZDFDQ1g2VHJMS2cwcDAzbmFXczBVV2d5QktTbDBNaFVZZHJSVlIyVjhjSW5P?=
 =?utf-8?B?R3p5T3k5b2p0MEpJMXozbm9NV05lRjduM1lwMys3b2kwOVRPMk9VbmliMUpO?=
 =?utf-8?B?UzJYUTV2Wk01alpYeXAydWxlMExRNnF2RGozY0JRQ0VwYnNhejMvRlRmeG1Q?=
 =?utf-8?B?Z3A5c1QzUnZCQVA5OVJrYU13a0Q2RVI5UmFtKzQxaXJBTWlJTG01blNUWkcw?=
 =?utf-8?B?WGxDam5CdFJYMHVEMDNlUFJHb3BucElBbTNyUkZpcEhXVUQxeVFZMzIrcUVM?=
 =?utf-8?B?b1E1Q3ByU0ZwbWowSkFReWovRzdPTEJ5dFM4Vng0QitTY0lyNGt6WGpzZktn?=
 =?utf-8?B?QzErcGRjU0RyTmhVY3E3TGJFQkxwUE13cmVaR1oxcTZ4WG10bGoxRzRodzM1?=
 =?utf-8?B?QmIyTk9PcnloZW9EendTblM1c3gyVTJqMnlyZVhPUzJPYmtTK2FDaTN1TE9W?=
 =?utf-8?B?SmhIWVhLTVphc0s4MUFTY09EUE93V1lQUjloQW43VDZSV2Z0OHRqQUVML2da?=
 =?utf-8?B?L05RR3pHTjE3V3JjMkc3RVphelVvOFRCTnZUSFlvQkcyaVZyMHhxRlhORjl3?=
 =?utf-8?B?U0ovN1hkL2tqWk96WDdjcndjazlaci82SnpyUmtsR0RzNjRIY2NHYXZnTkJK?=
 =?utf-8?B?VDNLVW9yRVQ1SWhRa3J1M01YVDNBT1N6a0VoN1NybTA4dVA4TG9XNEN4emxE?=
 =?utf-8?B?cGZCamVyUTJUdGhVZ3crb2hPdytzeXlmZVNqK2ZoSGpwTGxTNk1zWThXTStK?=
 =?utf-8?B?YkNrUmhvejVhRk8rUDZFZnQwL3JOSGJwOEpybTVkNkc4MlpQUEFhOXMyellv?=
 =?utf-8?B?bFNUNitkcGQzc2dGKzJkL2xtSS82SFQ5bjIyb2RtR0wzU0krbnUzSjFRK3E0?=
 =?utf-8?B?WTUxRGVPbE9sQ2tmY2h6a2RPaU42N1RKa1dqT1k4M1p6Y3Z1YmJPc3FXSTFX?=
 =?utf-8?B?QjFDYURkM2hzYytWdXVlYnMwdGk3cnhWYThud1BONXpMZDRwL1BKMEFoR2FW?=
 =?utf-8?B?bUhaVWNIQXZzN3h0T2lyYnpuMGIvcS9LcWliSzU3K2RTY01DL1ZxOXhHTEpV?=
 =?utf-8?B?T2s2Um4xL3pDMEFsUC9zVDNTVXNBeGpScjFrN2JueXJyVTY0c2VtRTY2ZmJx?=
 =?utf-8?B?Q0NvdkpWVWprL2s1ajNpcSsrSkdXN1V3Njd3RHZuNFNWbElqL3Z1M2ZTdjVy?=
 =?utf-8?B?OW1wSDhkc0hTUjlRZVNaVzlNTVdmOUsrbmhOT2h6UnNvZ1pEQTBncnZ0ZEVj?=
 =?utf-8?B?OWRYcU5OS29NelZwZ1RrWnRlZXNGSS9sZEU5V3FuUXJMVWNFRlZobTZiTS9v?=
 =?utf-8?B?WEdzN1lmK2ZRRU9nMHZOaVl6dkRHMjB4amN2YysvVlJRNUNvVVZPa1NVRXJr?=
 =?utf-8?B?ZWc3NzNYdm15K0N0YkdOeUllMVd4UGhNcU5VVGovRlFlbVdwTDE1YkF0Y3Z6?=
 =?utf-8?B?SHp6UWJ0Yy81K3V2U2FMQ0UydUVzMEltN3B4bmJPUkN1Z3h0QWtnVHFLcWNn?=
 =?utf-8?B?REFJZS8zeDlMRUhNdnQvM2FMeGc1NUxibXNJUlpIWVYwVG9URTlBZ09NRWRP?=
 =?utf-8?B?RW4vRHlCalg0djBla01TYzNUc1NiNFN4blFPcmlzbjJaclJjNklibUlva0ln?=
 =?utf-8?B?ZHl3OHdFbDJPakkrK3ZQdTZjbWdsZXJ5bGFyaThuMDlCMEpWUGszdGlwWDZv?=
 =?utf-8?B?WE1EbUdLdGlOdjlyNnpCRUtBMkt2cFBDNW5kdDJEc3J5ektsRzdydVd6OFVk?=
 =?utf-8?B?bWcxemFYWDBYWm1KNUZueHdNenVBT0ZFMUtScjhzZ2RuSFlLeGlBOFNGK1F0?=
 =?utf-8?B?KzA5cjArTXFkdlVrNXZReXVWWU5sS0ZONnFDYmMvdWY2ZmE4S0FSbkdmdjNV?=
 =?utf-8?B?ckU2TG9FYkUzRUV2YWtFT2N4aGZTRk9qUlBRcnZhaDVOWTMxNFloelBIRUl1?=
 =?utf-8?B?MytZUlFsdmxaS2JFZDZDajFzV3c3QS9mRys5cWJBaEMxNDRhRU9HZS9xN0J2?=
 =?utf-8?B?TmRFTTRkRFJZaTE0aGpYZGplSHhvNSsvR3hjelIrVFN0QjdNMWVaNCtuVyty?=
 =?utf-8?Q?VSQ4n96COp+VeG6DZUIqCWVnYJeZC0fJ6wvBjGTbu27n2?=
X-MS-Exchange-AntiSpam-MessageData-1: icg1hWaeECYBMzVpOHpoBY6XIi2hkmJbrlQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fd34bf-a4bd-4ba1-ae20-08de7ab42580
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 12:38:47.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgDM6NP8bMhDa1quO7mroDtw6ECkhySH2qEHvkhMYT1b5RojcHOyLsIjjwaiPJT1OvIxWKhpdZSLVTruGzsBfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_043854_656884_5D852204 
X-CRM114-Status: UNSURE (   8.26  )
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

On Thu, Mar 05, 2026 at 09:15:32PM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > K:    \b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> > K:    \bphy_(?:create|remove)_lookup\b
> > K:    \bphy_(?:get|set)?_drvdata\b
> > K:    \b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> > K:    \bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> > K:    \bphy_(?:init|exit|power_(?:on|off))\b
> > K:    \bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> > K:    \bphy_(?:reset|configure|validate|calibrate)\b
> > K:    \bphy_notify_(?:connect|disconnect|state)\b
> > K:    (?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> > K:    (?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> 
> What about
> 
>   F:    drivers/*/*phy*
> 
> or something along these lines.
> 
>         Krzysztof

I don't understand your suggestion. Is it meant as a replacement for the
keyword regexes? Your file pattern matches on:

$ ls drivers/*/*phy*
drivers/base/physical_location.c           drivers/phy/phy-airoha-pcie.c        drivers/phy/phy-core-mipi-dphy.c   drivers/phy/phy-snps-eusb2.c
drivers/base/physical_location.h           drivers/phy/phy-airoha-pcie-regs.h   drivers/phy/phy-google-usb.c       drivers/phy/phy-spacemit-k1-pcie.c
drivers/firewire/phy-packet-definitions.h  drivers/phy/phy-can-transceiver.c    drivers/phy/phy-lgm-usb.c          drivers/phy/phy-xgene.c
drivers/net/sungem_phy.c                   drivers/phy/phy-common-props.c       drivers/phy/phy-lpc18xx-usb-otg.c  drivers/reset/reset-rzg2l-usbphy-ctrl.c
drivers/nfc/mei_phy.c                      drivers/phy/phy-common-props-test.c  drivers/phy/phy-nxp-ptn3222.c      drivers/reset/reset-rzv2h-usb2phy.c
drivers/nfc/mei_phy.h                      drivers/phy/phy-core.c               drivers/phy/phy-pistachio-usb.c

drivers/net/phy:
adin1100.c        bcm87xx.c      dp83848.c     lxt.c                 mediatek             mxl-gpy.c                 phy_caps.c           qsemi.c     teranetics.c
adin.c            bcm-cygnus.c   dp83867.c     Makefile              meson-gxl.c          national.c                phy-caps.h           qt2025.rs   uPD60620.c
air_en8811h.c     bcm-phy-lib.c  dp83869.c     marvell10g.c          micrel.c             ncn26000.c                phy-core.c           realtek     vitesse.c
amd.c             bcm-phy-lib.h  dp83tc811.c   marvell-88q2xxx.c     microchip.c          nxp-c45-tja11xx.c         phy_device.c         rockchip.c  xilinx_gmii2rgmii.c
aquantia          bcm-phy-ptp.c  dp83td510.c   marvell-88x2222.c     microchip_rds_ptp.c  nxp-c45-tja11xx.h         phy_led_triggers.c   sfp-bus.c
as21xxx.c         broadcom.c     dp83tg720.c   marvell.c             microchip_rds_ptp.h  nxp-c45-tja11xx-macsec.c  phylib.h             sfp.c
ax88796b.c        cicada.c       et1011c.c     mdio_bus.c            microchip_t1.c       nxp-cbtx.c                phylib-internal.h    sfp.h
ax88796b_rust.rs  cortina.c      fixed_phy.c   mdio_bus_provider.c   microchip_t1s.c      nxp-tja11xx.c             phylink.c            smsc.c
bcm54140.c        davicom.c      icplus.c      mdio_device.c         mii_timestamper.c    open_alliance_helpers.c   phy_link_topology.c  ste10Xp.c
bcm63xx.c         dp83640.c      intel-xway.c  mdio_devres.c         motorcomm.c          open_alliance_helpers.h   phy_package.c        stubs.c
bcm7xxx.c         dp83640_reg.h  Kconfig       mdio-open-alliance.h  mscc                 phy.c                     phy_port.c           swphy.c
bcm84881.c        dp83822.c      linkmode.c    mdio-private.h        mxl-86110.c          phy-c45.c                 qcom                 swphy.h

drivers/usb/phy:
Kconfig   phy-ab8500-usb.c      phy-am335x-control.h  phy-fsl-usb.h  phy-gpio-vbus-usb.c  phy-mv-usb.h    phy-tahvo.c        phy-ulpi.c
Makefile  phy-am335x.c          phy.c                 phy-generic.c  phy-isp1301.c        phy-mxs-usb.c   phy-tegra-usb.c    phy-ulpi-viewport.c
of.c      phy-am335x-control.c  phy-fsl-usb.c         phy-generic.h  phy-keystone.c       phy-omap-otg.c  phy-twl6030-usb.c

There are a lot of false positives, and a lot of false negatives.

