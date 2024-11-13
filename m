Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B044FD41C0B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 06:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUKN+fEuN4Y5I/RBQj0NdhTgdsXGIktrhT8DVNjjRO8=; b=kJk2Mhjqbaecw88juFZD93QfIz
	xs4T/rtcXHulmDSVg2ihcnne0niWPaCn8QV9E7an3fH/g40+YmgRtCyb/akfehTkBvGmY8U29uX2t
	HsEOlaT8H6ze19ZSFZ8QvOzN9jbP05nTUGREE1xD96mALuVPdAPubK5nnuqhtr2oCoxdtw8DTvgJ9
	1eHAPaR13Tv2w2Pb9nxy+NfZqDZ64Ju29TQfZJRXLOuYOx7xOdTT95Xjcyirwf8JwAWRN9cTbwZ32
	Tq/dJiCd4esVIslI5dIKvT0U6cE36rxVurWPyVyB4sgGAHeYJ1YN6+FsMSMlONXlQGAZUzrJC2jcP
	L1yVOJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7Kq-00000005wkJ-2GPK;
	Wed, 13 Nov 2024 06:58:40 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7J1-00000005wYv-04pD;
	Wed, 13 Nov 2024 06:56:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtM4ivHIRRzPdbULriix/XfW4J8GOc0dmxQAneE/qtGM94umgmWAClEb7VHHwrOBPjmqoPlEpRmcM8ZKZ3orZWyQmHg7LhUFK5u/LcEX4ae6JhrYxJz/9KrHMz1exYEpIemoprDjE07R4CGByOVC4Hf2rcG/KoxS12W+jjfiXschaaUFzeqxKnGdFO9z3rdfV5552jHVa0rv3yPz6Uz5RVrjL/ttNWQbGzW+p3kjKLuOo4KxZSRv1NVX/MYeLrou2/a+njlU3JdjUj+b5TtJxiG4iKOpqiwambzEwlzJEevFdADlp9Qo7gNJ6ogJ4pvzAKOpvOwRR4BA+Cs982o0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUKN+fEuN4Y5I/RBQj0NdhTgdsXGIktrhT8DVNjjRO8=;
 b=AkBfexM0QCKqm95bN8jKayJJ5tVAF8FOWsWwAhJKC63uObLw9E8Vwe1admBRiRKACKilafoJJDjWrbd/typoIyNcaKNJWRl5zSNMZnFpoaL3xj+uz2QorsyNH7HVuH81HkGqq1XhAGwiTbJLdy/qKGXvKpTkWzRd/D044CW1tEuJU+Wcx0BtqZn9xPL23CrKUFkdCL9kdZl64oZBWgRQXd7l0kBagA8fcwYig/KgyZJYdaC2R015K5aDeZ675cESlhIqSm3m1rHu3WK7jbrh1dzeb40VIYctsQdHhHYRuZI04qKnWYa5peBv19DaetWO/DjRbAPOgisaP8RnZ+NA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUKN+fEuN4Y5I/RBQj0NdhTgdsXGIktrhT8DVNjjRO8=;
 b=gG3jeR1fWjgFnjvwQUrbqF7KCojPSE8m68LMAIfTtUthCKSq0wgcbH5DTza+6Ofyihy1xOnjufc77+yOHJeixEAzgCEHTDVV6w7bwpkkebuePGXQjtftuqgQXNYc8F/XpmMQOQq2cYuhL7jR14QcsV52nFgOD4fmdM3zhuF3sI9hsOgEWqsZlCZbjRUm154jXzCV22MP+0K7BRzE2+UdNPxV+jSZtSDaR5uKn9ZwKWlFez2Mro5JJB2Qn3wo+2WJEe5c6bAaPawRTEXUaohSpXEdzKERT7hGotFINLWD8B7QzZTPwBFTO/cNI+scQMkmVsMlJZZmNyp9G+4jvl3sdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB8497.apcprd03.prod.outlook.com (2603:1096:101:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 06:56:31 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 06:56:30 +0000
Message-ID: <da391fec-738a-4044-a598-fee1137dfa5c@amlogic.com>
Date: Wed, 13 Nov 2024 14:55:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: meson: Fix the determine rate error in
 clk_regmap_divider_ro_ops
To: neil.armstrong@linaro.org, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jian Hu <jian.hu@amlogic.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241112-fix_childclk_of_roclk_has_been_tampered_with-v2-1-64f8009cdf2a@amlogic.com>
 <35307d7a-a110-430d-9ba5-808a05450adb@linaro.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <35307d7a-a110-430d-9ba5-808a05450adb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0236.apcprd06.prod.outlook.com
 (2603:1096:4:ac::20) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a007d4-8da7-4bb4-1a24-08dd03b04d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0I1M2xPTFhpUVRndTVWZHFYRHhqZ2xsL2VycVVxRStJUXc2c2xCd0hTZmJU?=
 =?utf-8?B?WUhZS3BZRi9vQ2lNN0J3YitsYjdHT1Zqa3dwMkdpZTR3bzNYQ3lCMVViZ0dr?=
 =?utf-8?B?d3VuenhzZldDcVo5WVU1a1JPM1lvTjhMYUhWbEN6eHVLSTZNT1FKcDZaY25l?=
 =?utf-8?B?M1lqUUd3OEFkSjhwYjdxRHNqVDhhc1dLa1AwbG5BbFlWckFGN3kvVEpOQ2Er?=
 =?utf-8?B?VDAvWmI5UDRNZUc4S3I3c2xoSlJFRm9ucklERnR2RFRUQzBNQ3B3QndyMlBl?=
 =?utf-8?B?MGF6amxSTThSOTVLQ1NHWTZzbWQ3RWE2SEtleDlZTFNaOGhwSUthVSt6czhL?=
 =?utf-8?B?aXVLRC9WT2tzYVFxVEh0cUVWWkVEVXhMNElZeWZLaVZHS05XVFhMSzhYT3JU?=
 =?utf-8?B?bTdmU1RkWis3YkE3dXMzVmsxLzNJams1L1RYTC9TWVhHUTRSMW83aGdKRGJa?=
 =?utf-8?B?cSsrUHNaQVZVVEpIb3RoeHUwREN6b0VzT21sa0hwUDg1VnIzRE5qdEhWRXVF?=
 =?utf-8?B?eDlVeUVhRCtkSWpRWEtOZnRLRkVkcnNkeEtFaEtPSTBlRlVQNDVjVzFVTWZv?=
 =?utf-8?B?amQwK3ZkUVlVZjV6d1gzSmcyU2hqUHliUXpwTnlCdUlBdHNxbEIwWVljSEhD?=
 =?utf-8?B?Z1lieThDVW1CdFlITFJrdERtMDY3TFNSeEZydDVGRVYxSDlVcFNLbnRMQzNp?=
 =?utf-8?B?Nk1sNlFMcWFmY3Mwdk5kQ1hFcTBTK21XbXZqTGhNem1wS1Z0SStlRG1QMWpk?=
 =?utf-8?B?RC9pSGNHZGZHVUFoSW5ETEhLV0FXWkhndDRjSThBdTZjQ1kyNEdjMUtWaTJC?=
 =?utf-8?B?REpsdnJ3VEVFcXJsUHJjUzhGZ201enlmSjZXaEEwN2cxb1E4a0ZhTEVhSTFh?=
 =?utf-8?B?MFFqWFFtUk82UklXM0ZjVjZOb01wQVFuMDdUR0dEb2EwZDZRWHl0aGYwcmph?=
 =?utf-8?B?b1hCOUNXVUJvZUVPRHZJU3V3TS94MWcrQ0VtU2FEZ3gzVW42UkNrUU0xdjhv?=
 =?utf-8?B?a1YzT2hFYk1TNHhwWnpqV0VONHNmcnRyczRpQW9VQXF1cVVKdHpzc1cyNUx0?=
 =?utf-8?B?QWtJS2p3bHAvUDVnd3c5YnRaTnZBTlhmMjhJbnJWa2hCQWRaYit5ZXl2cDBT?=
 =?utf-8?B?WklzNHJWZWRrSGVSVnIzOUZYN2pyTVAzRDBMRS8xQWYvT1c3aWZFN3BYK1ZR?=
 =?utf-8?B?MTNhOVNGRWh2OTVMUTdveFo4Tkdpd014TElDbnQ4Sm55cWhxdUlkR1dFZElW?=
 =?utf-8?B?ejJxdkpjVXpGTnJoSnByUnZTdldobG9zdHc3K2M1dVBUYUNtVW5zT2RoMU03?=
 =?utf-8?B?b3dZd0VqNk9JRWRpQ2hDS1kxaWllV2JDWW1icGZpYm96Z3NaWmpaSldyNmdP?=
 =?utf-8?B?VlJ4dEovalFzSGU4R0hid0YyQ25jQWl5WnJrbm9DcWxIdno3K2lUZkJibmFN?=
 =?utf-8?B?bHRqMVBCY2pXNlN3Qjh6dEZrT1VqLzRlZ0V3SVRDem9ZRU83bjJlOXNsVWhI?=
 =?utf-8?B?dmdQdHdpSitYT0FwNUh0NjF1UElnMjYwM1kwYnFrRFFFN0tzTWNtOW1KU0l0?=
 =?utf-8?B?MDFnYzMvRGQzTTVKWFhSU3RKck5yZmVoV3I3NFdHRTl5WVFZOE1nQUZXUDdn?=
 =?utf-8?B?aVZvb1ZvM292S1B3NmRQMG42M0hTakp5Q3U4MnhoSEtPUi9oL0FpTW93YURy?=
 =?utf-8?B?WTlNWTg0eGN3R2E1cDB3dWxSaWhLVTQweU5HRGx2aHJxWjMvbFloZ2hkQ0NB?=
 =?utf-8?Q?Gx5cj1M52Ot63db6DAVsrMjkOT4a0xQD9jTgmYy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Szh0L0V4ZEdvS1BQNXBRVWN0VkNabnJoSDFOLzB2Z2RmdXhtaGd3M1FHbkk1?=
 =?utf-8?B?Y3BMR3grN05lcGc5Ukl1MGwrR0swMkJ0d2l0UkthRUpPaG5DVDhkcjRpeDF6?=
 =?utf-8?B?UjBYaURSL3ZuNTIvYmZWSi9aa3BGeHdVRWo3YjNkSjJQRW9EemRLVEF2bkU0?=
 =?utf-8?B?UkdDaHQ2RUprTk03SDhPSEp2Zko1a1BsK3VuOC9CREcyaCtJWHRlbUMvb2x6?=
 =?utf-8?B?dFBxZEtwVG9RTDQybm1ObFVpZ011Wk9OeDZHbEpFektjNDN6c0RwbmFWcVVk?=
 =?utf-8?B?bmhaemxJK0hNcHNRcVNOMkZibW1YV2hUb2F4YitTVnRPR0RIOVp4RThKVnFU?=
 =?utf-8?B?TWFOekdQYitkNEFvZFBZVlBoMFl6QmNDS2s4bzdTV1gzQThVSncvMk9keFRy?=
 =?utf-8?B?dTNRUlljZlJuc0d1VmZaSXZlUmtGY1lNdUFFYmVQTVp5Ukc0WXFHK3Y5c2hu?=
 =?utf-8?B?OVMvK0NyZ2hRRjl3U0dtNU9yalBwclA3Y3lWUzIwMDkzWjdUaVJyRXp5RmRo?=
 =?utf-8?B?YzQ0UTdRcGxnU1dpa2hyWWhMS1VvTVh6VHU5NFc0bEIxVDlGd1hCVzgrNEkw?=
 =?utf-8?B?OUZ4MEdoRm5WRzQ5YTN5NTNoMFZka1pwU0ErVitvTnRjY25FVUZWZUVZUlFj?=
 =?utf-8?B?OGhUZTRoZXhsaFV3dVBZNW8rcFlPendrbk5rMXVPUHUzSHk4cjhzM3I0Q0U0?=
 =?utf-8?B?N1V0UW01S2pLQ3ZtMkFZdEJIY3R2RjFpZzNjM29QV0UxTXpTVmhrNXFISDMz?=
 =?utf-8?B?U1lUZmlwR2NGaHVnTzEvTE83Sk9MZ1pqWkJGdktpN1dEeTF5OW5EbHJmSnFB?=
 =?utf-8?B?TjloTHkyby9GcmRscTZzSk1vZnpWRXZWUzRRRlBrQ0Z3OW40MERvUGp4bjA3?=
 =?utf-8?B?ZlFuVHdFTTRFbXBnb3VUcS9PNHgyWGxwOG1BUWIyMXNRaWNTWUxrNkR3b2ZR?=
 =?utf-8?B?OC93WmkrRjg5ZlA1M2ZFMUNoTVJIU205c2F2RmdRdWxSYnNPenoxR2RoWThN?=
 =?utf-8?B?T0hJRXpycERKRGxUb29XOWhWbkU4bmtXN2RJdFJvSXMyL2VUZWdLSHlUcjRy?=
 =?utf-8?B?ZHppaklEdlRYZGM4NEgrRFpZT2ZwZjEyOHlIeTZaMDdSNWxsS3FHdFFkeU5y?=
 =?utf-8?B?eDZ1NmprdmNidjJJWXNpckN3VCs2N0laeHg4ckppY2t4czhKcEFFSU1UQUVi?=
 =?utf-8?B?MnpkS3d1Nzg1bjg0N1Z2aTFpdjZTMHJkaTdpNXdaWENvaGZRSUoyeHBvc3RV?=
 =?utf-8?B?NGtjeUNldXkvcE0wNWJIVWw4UXRyOTBxWDNrbTJFZ3d5VXlrUHVsK1M0eEc0?=
 =?utf-8?B?Z2c5b2tNNnFVZlZOTnNGVlVaS0NVWlE2VDFVU1BLeFU2dU8vNUVMczVxd01N?=
 =?utf-8?B?M3plditxbUpCaVZhQVNXdVRpVWNoMzVPRm9taE8xWnJOQVJnK1lVNitMaDFI?=
 =?utf-8?B?Mk1MRElucGFmZytWSlRxRnpwdTlHSnowaGN2V005MkU0MEo0dmQ4L1FwdThV?=
 =?utf-8?B?YUo1NzU5N21idDBoNEZYUVJYcElseEZRSmdDVkRSV2hwakgrcno3QnBvUlp3?=
 =?utf-8?B?RmhlUHhRbHY3T3N5K1hOOFpjMFZEUzl4eTk5M0pGVENHcEhHdkhscitZK2dW?=
 =?utf-8?B?L29rMFVlS29VRWV1eGtnOGM1eG1wUjRiRFgwL3grbDVMMFdZKy9nRUtNRjBo?=
 =?utf-8?B?NjJ5Zk1Yc3B2MDhtdER1MXNtdjYzL1B1VDR1TkY3OHo4UnFMU3FwL2xDb0ND?=
 =?utf-8?B?MjRDTkl4Zmk4Tm56LytMcWUwZDhFQm43OEhWME5DQlEvWTB2WGZHeHlrZ0Ji?=
 =?utf-8?B?Q0hFaFVmWGdZK1hQZGFEbzNIb05CUWNPNlE3UzZsNmVXME9GeTg2YURtWSsv?=
 =?utf-8?B?NDlNSkxvNlNtN2d4K0tEV01zWWQ2ZkJkcHRKVXZjU2VZMTJZdDRlNWZydTNQ?=
 =?utf-8?B?RFhlbzlzcmR4clZtRkZnM2RQNlMyR05ydHlzVEhpbWZaRzdlQVlsc3ZFZEsv?=
 =?utf-8?B?WVdGMFAxZHczTUJ6VHJYQmxCeisrRW5wNXFPWHlRN3BIOEVIL3RaV2ZBWnFX?=
 =?utf-8?B?bFE3dlVLd1Y0YVVMcDZveHhucElpeDZQWkt3UEJCQk5uWVpia2ZzNnI5NFZV?=
 =?utf-8?Q?6IPnVsF9iLS5s6CTG+BHr+NLl?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a007d4-8da7-4bb4-1a24-08dd03b04d8a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 06:56:30.8439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzZn16BuZfwRByk/QX8tG96glUu4+zux5Z64lCCtVq+9sfRR5QcPU+v54MW/WCl27vRcyNq/JRqHZBUgeqcD7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_225647_224653_BB1DC335 
X-CRM114-Status: GOOD (  19.63  )
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


On 11/12/2024 9:24 PM, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
>
> On 12/11/2024 13:57, Chuan Liu via B4 Relay wrote:
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> The rate determined by calling clk_regmap_divider_ro_ops with
>> clk_regmap_div_determine_rate is not RO, which will result in the
>> unexpected modification of the frequency of its children when setting
>> the rate of a clock that references clk_regmap_divider_ro_ops.
>>
>> Fiexs: ea11dda9e091 ("clk: meson: add regmap clocks")
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>> Background: During the execution of clk_set_rate(), the function
>> clk_core_round_rate_nolock() is called to calculate the matching rate
>> and save it to 'core->new_rate'. At the same time, it recalculates and
>> updates its 'child->newrate'. Finally, clk_change_rate() is called to
>> set all 'new_rates'.
>> ---
>> Changes in v2:
>> - Remove the CLK_DIVIDER_READ_ONLY judgment logic in
>> clk_regmap_div_determine_rate().
>> - Add clk_regmap_div_ro_determine_rate().
>> - Link to v1: 
>> https://lore.kernel.org/r/20241111-fix_childclk_of_roclk_has_been_tampered_with-v1-1-f8c1b6ffdcb0@amlogic.com
>> ---
>>   drivers/clk/meson/clk-regmap.c | 36 
>> ++++++++++++++++++++----------------
>>   1 file changed, 20 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/clk/meson/clk-regmap.c 
>> b/drivers/clk/meson/clk-regmap.c
>> index 07f7e441b916..edf65ca92c7a 100644
>> --- a/drivers/clk/meson/clk-regmap.c
>> +++ b/drivers/clk/meson/clk-regmap.c
>> @@ -80,21 +80,6 @@ static int clk_regmap_div_determine_rate(struct 
>> clk_hw *hw,
>>   {
>>       struct clk_regmap *clk = to_clk_regmap(hw);
>>       struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
>> -     unsigned int val;
>> -     int ret;
>> -
>> -     /* if read only, just return current value */
>> -     if (div->flags & CLK_DIVIDER_READ_ONLY) {
>
> You're breaking current code by no more checking this flag,
> the new clk_regmap_div_ro_determine_rate() is fine, but you should call
> it from here if CLK_DIVIDER_READ_ONLY is set.

My idea is that the newly added clk_regmap_div_ro_determine_rate()
implements the functionality of handling CLK_DIVIDER_READ_ONLY in
clk_regmap_div_determine_rate(). If we still keep the logic for
handling CLK_DIVIDER_READ_ONLY here, it will make
clk_regmap_div_determine_rate() ambiguous and easily confused.

>
> Neil
>
>> -             ret = regmap_read(clk->map, div->offset, &val);
>> -             if (ret)
>> -                     return ret;
>> -
>> -             val >>= div->shift;
>> -             val &= clk_div_mask(div->width);
>> -
>> -             return divider_ro_determine_rate(hw, req, div->table,
>> -                                              div->width, 
>> div->flags, val);
>> -     }
>>
>>       return divider_determine_rate(hw, req, div->table, div->width,
>>                                     div->flags);
>> @@ -127,9 +112,28 @@ const struct clk_ops clk_regmap_divider_ops = {
>>   };
>>   EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, CLK_MESON);
>>
>> +static int clk_regmap_div_ro_determine_rate(struct clk_hw *hw,
>> +                                         struct clk_rate_request *req)
>> +{
>> +     struct clk_regmap *clk = to_clk_regmap(hw);
>> +     struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
>> +     unsigned int val;
>> +     int ret;
>> +
>> +     ret = regmap_read(clk->map, div->offset, &val);
>> +     if (ret)
>> +             return ret;
>> +
>> +     val >>= div->shift;
>> +     val &= clk_div_mask(div->width);
>> +
>> +     return divider_ro_determine_rate(hw, req, div->table, div->width,
>> +                                      div->flags, val);
>> +}
>> +
>>   const struct clk_ops clk_regmap_divider_ro_ops = {
>>       .recalc_rate = clk_regmap_div_recalc_rate,
>> -     .determine_rate = clk_regmap_div_determine_rate,
>> +     .determine_rate = clk_regmap_div_ro_determine_rate,
>>   };
>>   EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, CLK_MESON);
>>
>>
>> ---
>> base-commit: 664988eb47dd2d6ae1d9e4188ec91832562f8f26
>> change-id: 
>> 20241111-fix_childclk_of_roclk_has_been_tampered_with-61dbcc623746
>>
>> Best regards,
>

