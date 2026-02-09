Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8667E7E0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 17:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2QUkuVwc8OGDhyT/X6SqrCbO0kEr7fEQPtWE0y+oiY=; b=bDT45kmvEeUCy+YGWQwSYOPhsg
	aSy+G2lQcoNAu/+Lw+uA4xdgbTZjwTs42gzrXN2cFRmDrZTTFRiMpEwe1bnX0DlPt9qgzMlh41Xsf
	gcyRUwW/jT1LwmCcRbRrMCIpQkTC8aHQK2+zSfMoNU0i2mg9TXZRA00jo7fO/f5ozY5WZowcKff8w
	BJ+xLYGMsrAtiDGy5I74MvOXscC4+27Cec986xpsTtCFQi5b+Cxux6d0PEX72HeYnXQgIWdLrfACN
	UTLegAujQmlgZzVK+s01Naou3T7617MF1phH02X/GrcA/OcxaYIfpN6RaZi2oLFVPbCyX5SlShNhn
	ctVLlISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUoU-0000000FkVk-0YNR;
	Mon, 09 Feb 2026 17:12:42 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUoP-0000000FkV3-21uG;
	Mon, 09 Feb 2026 17:12:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMhA92xYWHl00QYLLOtKSD1EiY6dx4q82vyqSXYy2boRoSGhxt70Yx+Y/mHgV+sRPNNeZ48UMYcnDCQbYhDyB824B59nON/iOSw9SQlzXkByaZMOYYiKhTKNQ280fd704+mesJrgTtR4T9aENsmygHSqe8RbNkS/n6NmnWz1J24dtZnJsgWzK6sYkTifrhPYpOqlFMp7/J/1URogP2S0T0NLIfqV7JKN3IAXkuzDDnHP7IeuUFglhZvuLtYtxI5YIazMdBIDYbLb2PfVnl4dqbOL1/PZNoDRHf/KFk45BgcNTr2FGjbC0PM78y+ECDpobQybk0b+bhwXYIEyqlCATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2QUkuVwc8OGDhyT/X6SqrCbO0kEr7fEQPtWE0y+oiY=;
 b=ko2HN5PgEvJ4wDba3J543Id0t8s7cCCVpx0JUPqrM4FZaypAhXP8JIIHg4wZC0tJvaWOIDHgzPffjPUTHlABSoSPFot8RkQvifluXxR/NFQagznKO1G6r7Q3AG33GXa3r9daxfkQ5C9VBdFb6v0tL+6oomlKsr6YwR5dmIgJ3Ab9+tQ7dFs+Z4DN4ByP2RBT6mqWCebXITMqT7MqS8sVI34ui+uB2R6CfbjCFJuWaRG3Y0fws2ZMW/NophuxKwVyTp2PKbtypvdVetHGE7NkSPoV6EXlQKe59/sVYuAN5dg1iBz/MNnYQYeMcoyEwc2JRaP0tVYbHVJ8J5NsfMWMEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2QUkuVwc8OGDhyT/X6SqrCbO0kEr7fEQPtWE0y+oiY=;
 b=d7SM0p9ipSPVe8AxWdALHSPahFlU2r7Pii3ihGWbYtEcxh2YHnaXUF637cXCT4p8arjXs+EUfaHFjVzJaa5J1voQceKnr2g0sOBhigH1Uis0BE1XvoAk3de7lMVRGEmElizEsycNUeV2jYHph0HO+cx3gmjQ6dtGbInQ6OMdNnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB10193.eurprd04.prod.outlook.com (2603:10a6:150:1a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 17:12:28 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 17:12:28 +0000
Message-ID: <93704b59-fbd1-41f2-928e-a4398e3714da@cherry.de>
Date: Mon, 9 Feb 2026 18:12:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add pinctrl for clk-generator
 GPIO on rk3588-tiger
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260205102104.394991-1-heiko@sntech.de>
 <20260205102104.394991-4-heiko@sntech.de>
 <c8816ada-bb46-4c15-a3a8-a06dac5acdbd@cherry.de> <5539724.6PsWsQAL7t@diego>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <5539724.6PsWsQAL7t@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB10193:EE_
X-MS-Office365-Filtering-Correlation-Id: 77137a7d-7618-4179-0a46-08de67fe674c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TE81aUJ2bGdxOGVYNTNTT21TZWFPNjNMeWpRMGNhM0ppdWpGb1QyeXlxZXJD?=
 =?utf-8?B?dDVQWWxENXIzMW5OSmgvblllUmFMQ0IvQk1RTFVicTRtNkR6MEx3YlhxL0tH?=
 =?utf-8?B?QjhmUy9WbW96TUpnZVV3WlZEU1gyYjZBNmpGNGJqR2JMbXZRTnhvNWNLWitV?=
 =?utf-8?B?WnhaQ2lHTkpkbStVQW91K1JXV1F1eHBtZk9Ecm0wSVM0amNvR2VDamI0MUNF?=
 =?utf-8?B?dkhCeEw4TUs0V3FZSUVZcm5iOUl1N3J2bVMwWW9SMlVYLzlFZUc3bGZVMVc1?=
 =?utf-8?B?a1pzRVErOWRpUlY5OXlKTnFsTzlTZ1U1NWdpVHFhb0h4amowSjduYVlUNTNt?=
 =?utf-8?B?VStJbWk2WjVEMkovMlZubzRJZTNOVDNUY0VoTzViY2k3R1lVR0pFV3ZEYkY1?=
 =?utf-8?B?U0x6ZVE4enBxaGM1NzFKTUZJdGpVem5PR2E4RWVyU1Jjd1JhVHRwNW1ZdjEw?=
 =?utf-8?B?ZVRnTVFnL1AzREY2WCtMTHBnQWlZZ3p6V09RV0V6ZXNjekpjNk9La25Tbkph?=
 =?utf-8?B?V01aa1hXc0R1cDYvampFRGY2ODlPZ1lPUGNSTzlTOFh6bnNhQXREN0JXZk1y?=
 =?utf-8?B?QmhpWTNrWW02VU5xekQ5akxpb1NmMTh4SnpiSW5NQjFMZG8vTW5GRXZaeUY4?=
 =?utf-8?B?V0F5b0RjV0d2NkI4TENRRGloTXpnQVlYS0FyemEra1MybXEvcW95ZkJ2UGdQ?=
 =?utf-8?B?MjErYllrdkllRXNlYU40TzBJZnZzQ2hZQnkyVmNHUUsyQXk1Vkt6b0JYc3ZE?=
 =?utf-8?B?SnZ5UGhyenI4cTdmdFZ6RDZxcmFZbnRSazFGcmplY2ZvQmlGaXVmRzFMQmxU?=
 =?utf-8?B?dkdGWXcvME16cmpHYkswQUkzcjdPM3Y3ajJIbG9vMnpVaVBRcy84SGxLYnlO?=
 =?utf-8?B?ZjJIdmFkalR4eC92UVFkem5PRmFiU2gzakQrMXdOdzR0R0tyMG9zQmFlOHM3?=
 =?utf-8?B?TTNuNlhzb1BHRFhKM0FGUytiUHBXb1hYSU9mWEI2VnpUNGFualJnM2djbGti?=
 =?utf-8?B?YVZjM25LektwYld3WUkzbGwzTXd3UitMZ245ZFBUQndmWTd1VnlGUWJMaFpa?=
 =?utf-8?B?VzRHdS8zUmdSZ0U2QmdZL3N5aU4vc2psV3ZBN3psWnVGSzNTVWN2aTY1ZFlp?=
 =?utf-8?B?a0hTL1B0UGlHbDBQMjl6NnR4ZXMrOGhGM0RwTk1SL3U0MEVET2ZwcDEzK1hx?=
 =?utf-8?B?dlJCSDdJYVVKTU14RCtnRVcrM1ZQL1BMN0w2QmJ2UW1RRDlBK1NiRzh6Q0E3?=
 =?utf-8?B?YzM0MmhlUTI2VEd6WWxzV2ZDZFZSbmYwZ3VpRlRQeGV5T2FDN2YydEZyNGl1?=
 =?utf-8?B?bTFvaXNnZ2gxM0xQR0pHOExYYndCY2w3SjVBeHNxZUhGY3BHdkZPcUFKSElT?=
 =?utf-8?B?ZWNGcUQrNUpYUEVSbjZ4MnlndTM4dHY5RTN5QlNieFJOQTdTYjhzOTlsbTI2?=
 =?utf-8?B?MFlVbVg0SzVRSFFrM1dCci9KRmE2dnl3NTZ2T3NhTlBsRElBb09kTzVUUmJE?=
 =?utf-8?B?c0FTL0s4WEFLZVNXVFA0cnBIdGJlQXI2ZHA2c0ltQ0dRd3NlbDZWY3RycVpL?=
 =?utf-8?B?UTRlZkg2NWFhVFRHdGFnUFpTQjVhR0tGR1R3dVZseWdiM3dCSU0zMGNRKzZV?=
 =?utf-8?B?THQ0Y20rNHRBKy9yUEpaaE92UTdac1NWelZVS0lTdXhKcVFOakYyb055bzdu?=
 =?utf-8?B?U1ZhUk9jSWxkaFJOaUd1VG0xV2FpbloxTDJtTURmNVdRdGhkWE1TZGtGcjh0?=
 =?utf-8?B?emxuRDBrc3FVMG04QmxrSi9aZUpvcURTUUFHUEJXYW1KWHU5dXlqcnZzQnBE?=
 =?utf-8?B?Q0VIajlFZHZySjUra29rblFpN2hFTE9MWXRUSFlYSjBPRFhJS1MrTUdhb1gv?=
 =?utf-8?B?b0ErNGlSbC9qVGc2WWVZWmwxbVUya0l2MEZPajJqb1JHQmFFeEl1dHk3dHlM?=
 =?utf-8?B?VmhZM2FPb3NjZTFjbytXa0NFT3hOdXBjNFpUZWZtb0MwdkdHNUR4WGRaTGFs?=
 =?utf-8?B?MS9WZEk0M3FRSEUrQzZ6SCtiMWhVdjNjVit4MjRxRUlCMHhYS1N3Q3htUGpw?=
 =?utf-8?B?LzVqemNMcllZZWsvQnhTemhSRVVXVGJsWTE0cERSdU1vdVBEMkErdkJla05D?=
 =?utf-8?Q?WPx8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXlZVnV6Qlk1dTJxNXAya2taRHJRVHNiSEZDcTBlcHFMTlM3UDJJb3I2TUpz?=
 =?utf-8?B?VXo2ZHBseU9KSFlrTFVuVTlqWjZwNzJoTjRRSHlvN29FcmozTUNjTWpLV0J3?=
 =?utf-8?B?UTJCR0JIRExFLzZXbjQyWEVDdG1GNDc5UGVrNnBQQkZvRzg5MW1IVGE5Sml2?=
 =?utf-8?B?dlZqa1h5TFFnV1M0d3BBUGZyaGNMQlYzdjI4Znl1MkRwK3AwWDdWR01SanBM?=
 =?utf-8?B?K0RPYWdWRzExVCsxSlVBUEE0SWhHZGRkMzYrbHdSbTdQV3p3QXdhQTUveTVY?=
 =?utf-8?B?NG4wNzFUZDlqZklaNWtoMFpscDhFNFluWktZRW9Oamptb0lFQ2Z2YytrRWFG?=
 =?utf-8?B?YmpmczJnZXQ5d255TU1MNmY1aDY2VkhDZ1hZVG9YeXlNUkhpeEtZWnlqeFdw?=
 =?utf-8?B?WFhaNzB4dzVFWXpMdmtzMEp2bzFjL0x3STdRM202ZDg5aVQ5MlVWeEpEajBi?=
 =?utf-8?B?TEg1ZnkrcDB2UTBwZDFORXpmMDU4a2p2WW1OcjRCeldJQ3k2U2dqZVlHVm5k?=
 =?utf-8?B?b0Nia2tpNzB3S2JsYWdRVk1neWtSblB4SXZEOFdQeXcwNjBxTlFmNGJ3czRC?=
 =?utf-8?B?dno2OU1ZRVNvMXFIaEptcHRGalV5RHQwQlU1M0p3VWp3M2l5YnplZ2R1NXRj?=
 =?utf-8?B?ektlYUFNb3Q3RUZIaXBLa0VRSHBQM2g2UVBHeXFmUkszdnk4ODFhRjgxd0h0?=
 =?utf-8?B?MmREa1ZXczNHYlhkTGZ5Q2dKNlNsMjlBN1VDcjJFbDhQVzcxVVErU0VLYnpn?=
 =?utf-8?B?NFF6V0VtYURBV3pQRVBxMVdCSjZhcXZqNVRHQ3h3T0tRYWo3TmdVRXM0Nmlm?=
 =?utf-8?B?b2NZWFBhbC9VeHRtMXVIZk5pSko0REtHTHd0eC8xcmtORk5KbU0vZ0tKME1J?=
 =?utf-8?B?WFdKNkhvK2cyRmJSbENJRlcxcjlnNnhjVUVVL1JRY0I4a0ZMT2xpQlNORUNh?=
 =?utf-8?B?dURseEJ3dXN0Q3VKclRBQlpTVXVWMTdvS2VCN2YzcXVCZk1QQ05jcER4RUt0?=
 =?utf-8?B?OTF0SnB1ZDErNEIrejB1RnNJa2p1M05SQ3lTY3N0NFlPVVQ3RnM4ZWhaTEU0?=
 =?utf-8?B?TkJBTGxjQ3hoQm1tdC8xWW0xL0pRZzlwTFhPQkp5M0YzUm9IRWlFek1qVHlR?=
 =?utf-8?B?eThkb2I2bXN0MTdoaHZLVjY0dUlhdy9xYzFMSnFGWHJzQWtxaGVUVjB5S3py?=
 =?utf-8?B?Ymk1dm9KWFZQcEVML0F2eVdoWGxFK0RmUVBHOGgwcVRLRHAwb2piM1ZCUlVM?=
 =?utf-8?B?enhHNDIzbkJLbUwyNk8yRHY3Sk5LLytPTFRxbU9hUmJJU0c1YVZVRzMxVXhB?=
 =?utf-8?B?RE0rT2ptRXpPZHFQTnVhYjlTcExyWUZxVEo5ODZ0UUhFa1F0NDlqNkVNWm1t?=
 =?utf-8?B?Y1Z3R2w4aC8yNnFVb1UzME9ETXhZMkdwOHg4aFd1Y2VqU2VYb28zSkRIYm4r?=
 =?utf-8?B?SS8vOUJhWk5WMERxUXk0TzFiMy9ZSk1YeGRHUlBOR0pSSGMzc0srOFQ4RWNI?=
 =?utf-8?B?SlJNV0t2aUVMeUtqcTdpaG9SdEhnaU10L2FCWTZZdXF3L1p5WGk2cCs1cUFl?=
 =?utf-8?B?VGl2K2hVTURwTGtLdHBQd0ZWMlozcHFSc2RSK2hWbS9tWERvUTFVNVpIRzM2?=
 =?utf-8?B?YzE2ZWJuWGJRZ3c2VWNyNEVuL29ZMXUrMHlUem5sRzBkVTlqMS9lckhxY29W?=
 =?utf-8?B?YmdRdXZJMlBpN3dyb2FBSEFOd3FOeCthSXA5Ym5VNHJ4N25ENDNKdmRhYitY?=
 =?utf-8?B?ZUpWY28xYVhjeFJHOVppSGozNVo1RWtEREZCYTdqK0tPU1JZd1NEbllsOVhy?=
 =?utf-8?B?c0hWOHhxRGFLZk45V2hLeER3T3JOWlFDVGNHc0ZKVDlmQzkwTUFJckxxNnJi?=
 =?utf-8?B?TXNuMExpR3hZcW43endSQUlhTDBwSU0rbk84WmFOVkhUc2ZrRHM1WEhXQkkx?=
 =?utf-8?B?RVFZNmYvYjJOeU5qUFh0czArLzZ5ZXd6TzIweUgwUGg3RXAvSTZpTXBtZ2RR?=
 =?utf-8?B?SGhGa3ZaWmtuT2F3a0lQVmZtcHZjNWtydTdtK2lRc3FGU2RlMmczVmFhRFJW?=
 =?utf-8?B?eFpmRGdzcEtKZUkrZnZTTDRmMkVBT0puclZxUVZCY1hHVTVLbG5lRFNIU2cw?=
 =?utf-8?B?eGJuenVsNEhUWHZmNStiZndKa0dFWVkxajR5aHltNWN2MG1USXkwUmlSK0s3?=
 =?utf-8?B?MDhTWjNhMGhvODFoTWw4U0Y2bi9wQVBtT1hGRWN6L2dVNnh3TVVYS3gyQjdI?=
 =?utf-8?B?RlNWaHVmejVaRTNOWmNLb2V2MHpmYTVVNUlzZSt3aWN3TG9JUW9rVkhVcVhh?=
 =?utf-8?B?TVFpcEVmTElvaXlVcld0dktuUkh5SnFwUHlVVGcycHZhUmV2MGEyaVBxYllZ?=
 =?utf-8?Q?qdg3RruPgABLRcUFTYrZVdK+xQwyGVCYWgk+G?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 77137a7d-7618-4179-0a46-08de67fe674c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 17:12:28.6577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeMtvptIuGZm4WqlNj6H+u+VbS0G+BWSnZqD2qwG/GpMOeRDv5SHvgc6NQ9RlyloNDFH+gb4jd+LZegBubElR4PZqHpeOFqJkf+gQfmk/ZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_091237_553020_9C524212 
X-CRM114-Status: GOOD (  23.33  )
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

On 2/9/26 5:27 PM, Heiko Stübner wrote:
> Am Donnerstag, 5. Februar 2026, 17:49:15 Mitteleuropäische Normalzeit schrieb Quentin Schulz:
>> Hi Heiko,
>>
>> On 2/5/26 11:21 AM, Heiko Stuebner wrote:
>>> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>>>
>>> While specific driver in the Linux-Kernel handles GPIOs gracefully without
>>> matching pinctrl entries, this might not be true for other operating
>>> systems. So having pinctrl entries makes the hardware-description
>>> more complete.
>>>
>>> The somewhat similar rk3588-jaguar board has a pinctrl entry already,
>>> so also add one for rk3588-tiger.
>>>
>>> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
>>> ---
>>>    arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
>>> index 259fb125e13f..91057b166690 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
>>> @@ -58,6 +58,8 @@ pcie_refclk: pcie-clock-generator {
>>>    		clock-frequency = <100000000>;
>>>    		clock-output-names = "pcie3_refclk";
>>>    		enable-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>; /* PCIE30X4_CLKREQN_M1_L */
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&pcie30x4_clkreqn_m1_l>;
>>>    		vdd-supply = <&vcca_3v3_s0>;
>>>    	};
>>>    
>>> @@ -357,6 +359,12 @@ module_led_pin: module-led-pin {
>>>    		};
>>>    	};
>>>    
>>> +	pcie30x4 {
>>> +		pcie30x4_clkreqn_m1_l: pcie30x4-clkreqn-m1-l {
>>> +			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
>>
>> So this is interesting because it made me double-check the schematics
>> and I think we did a mistake on Jaguar.
>>
>> This one here is fine as this SoC pin is connected to the PDn pin of the
>> IC which has an internal Pull-Up, so the state is defined.
>>
>> However, on Jaguar this signal controls a transistor and there's no
>> external Pull-Up or Pull-Down between the SoC and the transistor gate so
>> we probably should not have pull_none for the pinconf. The default reset
>> state of this pin in Pull-Up so maybe we should go with that such that
>> there's no difference between the reset default and the time between
>> application of the pinconf by the core and asserting of the pin by the
>> driver. What do you think?
> 
> Looking at the datasheet for the PI6C557-05B, both nPD and OE are
> described as having an "internal pull up resistor", so the pinconf side
> should not matter?
> 

I believe it does because it's an undefined state for the gate of the 
transistor. Look at Q21 on the schematics of v1.4.0, it's directly 
routed to the SoC pin. There's no HW pull-up or pull-down on the gate 
side of the transistor so we rely on the SoC internal pull-up/pull-down 
to have a stable state at the gate. This means the transistor gate may 
be either high or low based on who knows what since the line is left 
floating the moment the pinconf is applied (by the core, thus before the 
driver is even attempted to be probed) until the driver probes and 
drives the enable-gpios low, meaning we either conduct between drain and 
source (meaning we pull the PDn and OE pins of the PI6C557-05B to 
ground) or not (left floating, no external HW pull-up or pull-down, 
internal pull-up of PDn and OE should be enough to guarantee a stable 
state) but we cannot say for sure which. Of course we exit this state 
once we drive the enable-gpios line from the driver.

This was discussed with the HW department, you can double-check with 
them, maybe we overlooked something or I got something wrong, my 
transistor-fu is not even beginner-level ;)

Cheers,
Quentin

