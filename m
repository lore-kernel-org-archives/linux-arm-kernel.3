Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A3CC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oRCw40TW3C6byi4cN1ZrsVt8cvIxF9MnOO0Sku87J0=; b=ACeQYTJks/VnBvZM13Wd44DTTy
	0vrgO29heDWxkNxpj05fLK4o2IlAov5pBfT6NBgC/+dy7x72aBH1zTmbqzrvOlilURHePiLXkD0jJ
	deCIqyGPe3Uaa/zMkrBa93V7eCuOjINQOZJSEwE/i6FlR0v8L9IXhpfzMwPOxwIQ7SXr/eujNrD94
	MhUGuuxlbjC+U2BB2+bie1tNh1Wf1v0SAeUY6ZkmK6tKTdc/E2PRtCf2ho/DOW343CiqcOzwScYFg
	e2Bq3PR7+G0KDfBBXjirA6SAfCfjNJqQk0ZXBKqPSHJ90ko9dEKuvRv03vQbO5KRKDI07HndQ9lcw
	OVz6PzAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyZR-00000001VCT-1Cf9;
	Tue, 25 Aug 2026 21:20:37 +0000
Received: from mail-francecentralazon11013059.outbound.protection.outlook.com ([40.107.162.59] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyZO-00000001VBz-24ws
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:20:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nG5NYJs9+Jf+jHN8tQtMI5Txu5WI1Triug0BslZoIbqLc4fH7osmXWPlSgUkVAlC34BEYIH61d66zFzD1hIkdZLwkLuD4frRIs6Hl2YjiFFoP4sdmLWjpF2w8nNANp0lq8HuIloWurcyU5x8mEjMP4JwMtlwv/tgQOJ1yvFuxryAt4Ehv6QH9tu/IbBus5Bqho4TFjLeH8YpodE4WTY2IOzcQx977drokfUe4lcHtylCHqa2X8gN9/tNZYQqRZOMMAUTp+BXmV+4Hns0Xs9UP2x2AKgJ2sIJshGOuO63iz69IDCfA638EI74W67miPJblNg4cVfVCnwBVGOPUPGAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oRCw40TW3C6byi4cN1ZrsVt8cvIxF9MnOO0Sku87J0=;
 b=O/CGNZitvMPLUG1byuSa3TP/LXaO8XP0jp4esBIrbdD530gxgt1ayQLbazmfmX81lpkP7PNFymUU0IBA9+5GcYTZhjviq/esGwaCINeoFDVXQpmp0+GnJE7Y2mR6Fc+uCQHwBKlZGau+l7vBgSCVMWcsUO9Y2MRGLX2YLYnx0vVWGqLFC2BzAadjwdHMLcdU/HUIonGt/X4CqVJ6pkigDdWsLex9NmW95F6SDdwpcFXEkeeEDyxCviapYKEFtQn3VqY5Y3XF8XFFD7NrzH5Xa3rqvxENyCD2WWShhHX9xz/bJxSK/BwG6Mg86MS1K9Vz6XCCtouMnha78gIl9hH41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oRCw40TW3C6byi4cN1ZrsVt8cvIxF9MnOO0Sku87J0=;
 b=fNMAfms0p+EUpsjOXlRgU/1bTPDmpv6Wop4AR4R4BvUsQ6ABclED6QRBkmOY/thU476/IfDyxIj9OXhGzHTdRv6XuRnxvsaveoY9dYz0l/JcoiL+Edf6YY77bUZWz0ZLQPJuVup7cHuwrajhAAUMJh/i60NIbWf5sZGvkqY+3hRq5hiqn7nCjL+AApvlKUyOvIEzt0NIEq2XfS5REuI8cY+8AGmNXEmp1RrzBhHfNxAmFjmL3eyDesLe4nRYp+Qgr5s5e9Py5V4wdfDYBpH3BJ7mHJrSm7ZFrY3AwCxoiiVAdovI6ugjxTaXZ9Lkfu4DkWPY/9oLtOcxcisiY7ZQfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBAPR04MB7253.eurprd04.prod.outlook.com (2603:10a6:10:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 21:20:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 21:20:29 +0000
From: Frank.Li@oss.nxp.com
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Mehmet Fide <mehmet.fide@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: vf610: describe the L2 cache geometry
Date: Tue, 25 Aug 2026 17:20:21 -0400
Message-ID: <178769279504.2257666.14082487125513547474.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810153001.3236085-1-mehmet.fide@gmail.com>
References: <20260810153001.3236085-1-mehmet.fide@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBAPR04MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: b9508a6c-780e-4bfa-94f0-08df02eeb06e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 4agnl1Yrx+kJj1dh+aUxN7ZOoNmKAg3yNZTbSH/PPKqRIzbDaT1v01sq/jmUUQsiPcfwTZdG6MT43c7HCmk+TZYHRb3RFawp1RHSIlaNrWpw3OZV2SQhYF6ZgGjoXibUDewIsix2619VRLqai6WTOyiULfBl0mg1dFCpqabdFNjMKVmg7/lFIDen3ChmSAWol8cAfyh4aqPGoLZp4ff2MzqwdmbDbv99TMtB3gZ34X5Ts6mkgEXcRnYbCovGHXt7SVHX2rTbUYP2YHWBGO4RzAbvU3GfLruqCr0hc0SqPWrDjmcPWdgXJgT5eJFIGuNaLfaC6a2qfoj3xJ9f8T0JmX9El1XSuNzeCRq8z0w3R93tTdig8MMSgT9/6Ny2F3lWwW53r5nccVtEHFEPS1BMzBI/3Ld2D/WoISzJDf5kgp/JJvc9Ti/GHJnjAZJOor43ifjNDZyujaQ+KBr5cLKlk9pnWRzf/hXkxKhl+EwNKhdibHGcUVfTtqsOLwS/jt4xazO9DaNoxBx+FUcPjWU7U1TryAFFIV9j0TGKejEUIwMKEw8YAXHFsvfcWw4rzX25O8THDwVr9gdnilH7kid6XbkRByb3HsBI62vrF2MCQUSk0IDzlR6NKymwKo07lXVkebip1yNDTmhqMASXuwd5REOWQ0oZg4fhInFGvVnMqkE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXZ1RlUrd0ZOR1ZVenl2cWZ1aS9ucnNLRE1kbnRKb0ZodDRFM0FxbUltZ3hv?=
 =?utf-8?B?bTRqbGY4NFlWTTlnL3dDd0dEYWdCWlNFTzY0L1FPT0dxdVYyY3hJVDFFL3di?=
 =?utf-8?B?SnJyNHdiSWpBbllOVTBuRzB4K3VwMWlDUC9BcVZGWlZDVkxUZFJ3YTRKRzJN?=
 =?utf-8?B?Si94NExjaGF1QWJXNEl3NTlkaytrZFQrOFZ5WmZsdGxBNDNac203cVo5bTVB?=
 =?utf-8?B?aFF6SVBJZ0FQSG0wU3p2c2VNOGdTNHhpYlB6Q01Rc2dVWGpQcGdKbmRUUUxR?=
 =?utf-8?B?Qkd2VG9xWDBjTStTcVdid0Vpbzh5MVo4enQrbXdVdm9RNk1uMjZWbDlaa1pl?=
 =?utf-8?B?OEg3VCtic3czamE2NGNUcDd2aUtUamVVOWxDZ21ncjF6a1Q5cEwzM2NXRGc0?=
 =?utf-8?B?RUhTd3NEb0l4TytDTW9RSEwvTlJUUjdSWExiWXlGQ2pWZU5ZTE51MHFyOC9W?=
 =?utf-8?B?WjZDbXNSeUpPdTBGYzMrYzlhQy9zR2xJdkV1SjJ1YUlydk5rQndTamVMekpk?=
 =?utf-8?B?S3BRQWxTbGFydFZtU255M3I3K0dGSll4TkhXV2p3NjZvZ0pHT2thL0xvNmpk?=
 =?utf-8?B?Qi8veS9qNkhjTDZpRTdqdTJXY0l3TFg2cTA5aGRlZ3N3NmpQK0tXdmtMM3o0?=
 =?utf-8?B?TlZ5RjczWlJUcU9kd2htcVVsMDVySUxzNE10RTIzZ1I4VG14OGdQZTZXOHIz?=
 =?utf-8?B?RUZ5UjNmbi85ZkxwWitYSUR0RW1Bd29CcXdMUTdwTE10SWRnVEE1bEVEc3lB?=
 =?utf-8?B?dkxubTIrK1VkTTVFV09IT2l4ZFQ2ektGUDZFQWR0cG81WEZ3Wm9iZWFCbUZC?=
 =?utf-8?B?cXdkcGZOYUNvM0cxUXdReS9qVDBIYjlveEZqNzNaMUsweUsxQlNITVA1dlJJ?=
 =?utf-8?B?NmJUanluZXUyOS95WXhYRGc5QmZmaXdNZUhpa2RYTGovRVgyNHAwT3VjaG9M?=
 =?utf-8?B?UEc0d2NWSS9rakdaVHhPR0pDd280T1ZVVW92ZTB5eE1YM3piNFk2cWU4Ukow?=
 =?utf-8?B?V2VJQ09NeEs1MG0wUmtTcHFtVDhmZit4c2w3Mis2SjlPQmR6M0ZwV1M0MmNB?=
 =?utf-8?B?eW9Pd1dRcGFXUjNNQlljdzJFVFN3UHpPVVZzSitsOXVnTGRDSEUxUmw1dlNa?=
 =?utf-8?B?Q1FleG5acVVXdFpDeHgzeURPVitWaUZtZ0xSZ0lzajRHNTlTQlNvb0NNTEha?=
 =?utf-8?B?MFJUa3Frdy8xU29rb2ZTbnpKNGcrbWJRL1BUVlVBZWxaSjNPdndaa0x6MGw3?=
 =?utf-8?B?L0FWN3dRTkxSMjJETTNNb2p1WkVGWHJkVC81ZHNINkJ5NkpaUnhNZjVwTDVs?=
 =?utf-8?B?UWhJWVFRY0xabmx2VlRIWTJURWM3R1pZTGFqUDBNcWJpb2N1a2RBbXZWYkpL?=
 =?utf-8?B?cDVKZ0RpN1dWOWhtSU9WdjRkcEVZL3dQeG9MMWpOZVRqNlhtRVhFbXRaS3Zi?=
 =?utf-8?B?YlhmMnl3d3pGZks0eEpuK1RCQUZHUTRUL1NNS0U2eW9QSTdPaFJ1NXhKMTNL?=
 =?utf-8?B?TW51NENUU0hiRlg4UHdsalgxTUQ4emlOU3VrWVp2bU5raWJxQXpVamE3dDA1?=
 =?utf-8?B?ejFXUDRSTHhhRmYzSnNTRWVBTnVjUVZKU21GWEpwVVhpZndBUE9QZ0VzdXpG?=
 =?utf-8?B?REVqR1FnOXRzcUJOVVVnc01XSXBpb0tMV3ZjTmFFc2xZVW1iRXN3V1FVTmJM?=
 =?utf-8?B?Unc0WDREd2N0V0R2YjRBQzhoNkladnVtbTh4Kzc5cG5JTmdjdkl6YmJPNGJh?=
 =?utf-8?B?K2RQYzY4bldTTWdDMlRCNkt6dUhLQkxUOFQrdllHV3MvWldUaEpGUS84RDY5?=
 =?utf-8?B?NVlqK1kvbXVPcmszSmJrcCtNUFdjYnQ0aWZ6NktwMm9rQTBoc2tFcWZWQnpL?=
 =?utf-8?B?THFGeVUrUWlHT0NsbmhKdHppdkY0MDR3TDNvZ2s5QkFmbGxmMU1MSUQ1R0J1?=
 =?utf-8?B?WE1vTTJBMmhLVG9ubi9FM2VocnYxWVRITHVwNk1EQU1Wb3dqdTVxdkQ3MFEz?=
 =?utf-8?B?L1QvM09uWjcwVmpwYkRLUURCYVJuSU5CWFR1dG0wVzJZYWt5R2M3akYwRFZC?=
 =?utf-8?B?UWZCRnh3VTE4cTBkU3NCcmIreHF2RUtzVVg2cUIxcGt0NEdidUJ6QktUbzIx?=
 =?utf-8?B?OUVGOGQ2YnpnQzZieEdSQ0RiUkNtZGFNdlNqRU9MVHFkQy92Q2VzeXl0NU9J?=
 =?utf-8?B?aExNYkxjVVVlNlQvRzB0OERyUEVhTFlvZ01uRnBxSmlIN1pBbEN2K3dSQk9F?=
 =?utf-8?B?THpHYWI5MXcxN2xDdk1XLzdLVVVGMlVPSVB4SXluUUw3MHpoODkxL1BxNnFy?=
 =?utf-8?B?eEYxbTFjNTNsTjRxRE0wQkhkbEtCV2dkRFIvemZsTExjQi9aVkhBeHpNTXpD?=
 =?utf-8?Q?gaS6DxLJQWiDsptrM8/M1+WviqB1aA31P2j+W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9508a6c-780e-4bfa-94f0-08df02eeb06e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 21:20:29.7068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLLGDfoJmXsJNQP9uelCcvafrzNABQPv3pOcof5XPKK2Jcg9Tt/ZwKODhCuU9oqjnkHpxG3AuFpbFIf+mTxi6dfUqNVguBaRseZ3B9p7dFmkere68mKeO+tvnM7sfow1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7253
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_142034_560979_0B559FDF 
X-CRM114-Status: UNSURE (   9.46  )
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

From: Frank Li <Frank.Li@nxp.com>


On Mon, 10 Aug 2026 17:30:01 +0200, Mehmet Fide wrote:
> The L2 node names the controller and its level, but not its size, line
> size or set count, so cacheinfo cannot describe the last level of the
> hierarchy even though the cpu node already points at it.
>
> Fill them in from the Vybrid reference manual (NXP VFXXXRM), section
> 3.2.3: 8 way set associative, 512 KB, 32 byte line, so 2048 sets.
>
> [...]

Applied to imx/dt64-intend, thanks!

[1/1] ARM: dts: vf610: describe the L2 cache geometry
      commit: a9701a0f76ed7f0b75d7d00c322d13191ef32e7f

Best regards,
--
Frank Li <Frank.Li@nxp.com>

