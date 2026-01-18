Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA217C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 03:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P8SnkjeXEO07WKrPn/sO4Y2qxLsqfhleiGgKKSvuBMM=; b=gU232sxPM0DNfV7EoQKAUk2zEj
	ZuYQMBEJ5cWvNgq26okOHBatNpVlozt5KWoXkEHytdOCIBc4DJsxn5Lae531AevJawhKbb8Lu9GgA
	SaXGUrRQ8sBkT/d0ExQ14ndlHkygZX7qsg/jwCkdK/SetPHyeCUnzE5/yvKGfZk5x8aIjvphf2NAI
	FxRJdG7CsHz3s7UOCGGyTczx1th4u8lSHDDmyEPiP4orGHzJcWOL/k4wIrRj1Io8+hTDuwaCeLvZT
	uuRDjO1MR1K/1BlO6d8RhizFq4heD5udyD6pMSfOH/eVVB/uF4BiB8tpeE02YJ7d225jAP5OHJCym
	pAJStXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhJcO-0000000Gc0q-2MZA;
	Sun, 18 Jan 2026 03:38:24 +0000
Received: from mail-northeuropeazon11011070.outbound.protection.outlook.com ([52.101.65.70] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhJcL-0000000Gbzr-2UyZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 03:38:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aY0fKdqqiQ0Hy8wRPDs//vh1A6gj452IeFGAtP3NeKB3Dug/YeZ0AEtZ3jJsBEiZd8ICZS23i3LBNvsJ3NFcY9qKIuhse+AwaNszAtw1JZTJ1t0nmDugJMDAM0aG35GPRBzwvaaaSg0sX37QiFDOZN3YqroKv/THi+1Flqfx69IKgZRHk8SLG2JMXoB46+0HbDxpwPwpdE7TbDH9J7aV9VKjoufwz2COuMoAX/OY5ozTYNtyjPLM6jG/RTFK2vw90oFTgp3BKAKCGeFP7/9InkB/q108zeUcAI8/pDAYLDgbnzOyCMGO7NS6yf0Ut3H6HpoK/cxUiQcLq16qS/A0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8SnkjeXEO07WKrPn/sO4Y2qxLsqfhleiGgKKSvuBMM=;
 b=S8XQnWGx4PPns1f3L1nw16Qe38uRr6y1Cy5FSa4AZ35whDOVg0Toy3wBTgYzqBmLwYm7xuRmRaQKarRvZWswsx62y77K4Jht3kiv8lycx/nXsomecf/zL0yU+Ut7Ib4PbwTEk7yuLl6Kjd/UU7C6OSR4dcIERbsDutYoPvzyjsDqiKVjc2LWbDrfrRdZ/n7H8FkzZv3X9h4/T1AxutVZ30760cR/vRB8I4tjue1gphKwv4fDlRJGrlsvCcp6LFeVkAfDmLIwqijQ0CZlHoW48FC9i8Ni058bKZxpC0B+9J9eRl1dCQyYCsELT9AST0ii9tZvTDXVF6hGqWPq0VkkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8SnkjeXEO07WKrPn/sO4Y2qxLsqfhleiGgKKSvuBMM=;
 b=VMRKjYbzeUwBH4f03zhDO9b5/eLiC5TLj3D0yXshuD6yGfPxYSyUc80PJSDv7mDeyC0U2yu1SpVjUsR1jJElBApoJLN8zqovLSAUr9zKdgtwNoFAFidmxczZ7jyi/7VDucOHr1e2GSFYgmXOlGq9nF8qjseSdo7h5TSOQI9yS0YfBESSUGNyFlhN8hwuqSYBmyVsxWJWHePSAfSKAAx7C7a23ufq6WG5SP/AEFM1Z7cahTfg4pbwPwJkQj6TrTCEnjyV5lvDYtPtU7LhdiTa5VvlOSiNSZLO1QiqpLn3c0fEiEQnc3rjQUmLrvNljB+skkg7u1goetWsZPtkXwCmDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 03:38:12 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Sun, 18 Jan 2026
 03:38:12 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/9] arm64: dts: imx8m*: misc update
Date: Sat, 17 Jan 2026 22:37:34 -0500
Message-Id: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH5VbGkC/0XMSwrDIBSF4a2EO67FK5pHR9lHCcUabe4gJmiQl
 ODea0Ohw/9w+A6INpCNcKsOCDZRpMWXEJcKzKT9yzIaS4PgQiHyhs0UzWPcIjPSmFY61FY5KPc
 1WEf7Sd2H0hPFbQnvU074XX8I8j+SkHHWqFo+O1d3Gtve7+vVLDMMOecPJV9S3J4AAAA=
X-Change-ID: 20251107-misc_dts-c4cc84f1ae5f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Sherry Sun <sherry.sun@nxp.com>, 
 Li Jun <jun.li@nxp.com>, Fugang Duan <fugang.duan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768707488; l=1437;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=xz1Rexi2P80MvXgf+TNGo8pDCsqGKSBnOvcmg4y2zFg=;
 b=fYqXxESXNFpgAKV4W+c5UwNwOflwZMC1YuMxP7xqLUeLFKakoqCFcFWrGy72yT+W3gJdmlYaY
 j1ynWviMTemD6nervQvuKdgj19sBurNdY+GvDc8lcDcgaVUbGJsS4XZ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:510:2da::6) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10021:EE_
X-MS-Office365-Filtering-Correlation-Id: b9325be3-4dad-41f8-483e-08de56430199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekZJc21WRGd2TG5mRWt2NUhFaTEzVVBhMEwzQVQrVGZTeWtoYUZnRTlqVEtH?=
 =?utf-8?B?Nk1BMmhxeUFRWEIxcEFQUWVBcHhSdWFjTDNIOVdpQ1ZyZkQ3YlhGdlJ5Z0dZ?=
 =?utf-8?B?NThFdTRzUUt1OGJLbDNuSkl3azdtaitJR2NTMUhsNjdhYXRSbThPRVBaajhQ?=
 =?utf-8?B?ZE94andCb25WQjRtYVlmaVJHK2prTHUwQ2NBQzc5R0dnMVNqTWN5MWhFemg4?=
 =?utf-8?B?ellaQzRuRjVWY08zRlNFY0Y3NXNxRHdTR0hNVmwreWZ0NW1TbGlPeVczZi81?=
 =?utf-8?B?anA2YTlYY3RrZVMrZWFWSUd3eXVqc3BEazBEaW02cWt3aDd2VmI5a3A1bXYz?=
 =?utf-8?B?T2pSRU9CNEpqRFg5ODRlUHMwWkYvUCtpVTBQUS9QTjg1RXFSUmZEK3BuM2Vt?=
 =?utf-8?B?OVBwUXlkUHkzcXJTajNBMVFiaEVJOUphTExmeHpLSUpLYXJKS1VoN2xMd2w0?=
 =?utf-8?B?Z1FVUjJFS24zZ3QzQno2SU5yY01TOUVibktHRXBFQlpMcFNpcTlIV2V4L3ZQ?=
 =?utf-8?B?WStBNGtaTWRic3VLRzZXMmZLRWpESHBtQjZ4cmVzY0xRRWRidmhvVUtZTUwz?=
 =?utf-8?B?dEpaejU1ODJZU1dhUVJkSEtZTTBnTE8vRGUzNDFLVnp6QXhjQ3l0RFhySEsy?=
 =?utf-8?B?LzZZTFVTZHpsckFHdGF1TVQ4cFVlWTRGbzE5VUdWZGxJZW5ZUzhWOWdFRGt0?=
 =?utf-8?B?ZmJrWS83VXVLZENZclMzMndGN3YxUXR1VGNHVjZXcDVFMHNRWXpISjlCVkZa?=
 =?utf-8?B?YnNsTW94b1NPRzRBRVB2MFluNUI0YTFJS2EwM21MVlpHNi8rQ243SVNkMk43?=
 =?utf-8?B?UzF2bWlOSjNMdDkrM21HcW5wOGFBdU1RbHcxQUg1QTFKcUFVakZOTmpTUmFX?=
 =?utf-8?B?ZVdVYWIwcEUxTElFaUIxZjNzck84SEhoSjZoTmNyemhreDhmVzRObVI2WE5Q?=
 =?utf-8?B?U0Z0Nlo4ZTEwVUlIbXkwWXB2VU1Rc1RaTktBdHhyS05xOFN0Q0NJRCs2SFJM?=
 =?utf-8?B?VmpsU3hOdXczZEZ1VHl2TnVJWU5iMFhNUWdGV1MwVU1PYTVPMEhrd1BtQlBS?=
 =?utf-8?B?SnFMaGF2TVJNY0JrSk53dndQQ3pZL0hEbkJ0K0hRL1M2a2oyWTlnbG4za1d1?=
 =?utf-8?B?ekFBcS9FRW14YXBRWmk4RmNJZFk5Wmhuajg1TkJVcHk5QlAyUXlDdStySG8r?=
 =?utf-8?B?a3l4OThtSXp4a3ErQzc3SnJISnhxaDluM1ZTZkJ1emlpRUhoeW43VW5PVFI5?=
 =?utf-8?B?cU96MVJIRVF5U0gzUFBPR0xnWGNkM01BQ08rNWZyTW1EczBGakFaRTdVT0Vj?=
 =?utf-8?B?R3NHWnI5NXpjbGNXOTdxNWhpRmdJQ3NzRTY1WUJaSmVDcFU0aHpKVy8zVGVt?=
 =?utf-8?B?RXFORkRIZ2d2TzRBRWUzaHBUNkNNckQwOTRKT3N3VDlCVUZ5TFlwVkx6VHJM?=
 =?utf-8?B?bjI2azRsUER3SVkzQ2ViY1JudU9yOXVQbXZaRnlVY3ZJZHJFRjUwNk1pdEZS?=
 =?utf-8?B?MHF5VFlIVnJSTUdqS1IxQXd4cjFtOU9YK3JOamwxWk5Oa3ZHd1hKd1hDZktT?=
 =?utf-8?B?amFOaWp5Yk9FNzdrU1ozdFhQR1ZHR1N3MVVGekxieGluOW1TK3IwWEZ2TlMz?=
 =?utf-8?B?WnJ6Sk1pYTRQTDcxNUtTelBzWUZtQzIzaEJJNTIxT2FpU0RNUkMwNVdqS2JX?=
 =?utf-8?B?a2tlMkRPdWY4UmJaTXZseUVuTU0yRnRNRnJDR0sxSDJ6Uk5PcnJ0bFRLQlk5?=
 =?utf-8?B?N3JLY1lYcHJaVG5YSGhlRG9ybVY5T0lRZDVDVUI2TmNuK3NjMDhyd2dMSzE2?=
 =?utf-8?B?MG1VYjE1UE1UYmJzdjMrR0ZlQmNrc0pWNW1XbllnbUhJcG81WnFDcC9jeHZY?=
 =?utf-8?B?VSt5ZXpJYTVNaDk0WXZnZitOR2NJQ1ZXZTZ1bmw0NVM4LytPVTh0UTdPY2o0?=
 =?utf-8?B?UXl4alIrMTV4TVNmWjI5VjZxQ3ZHQXg1QVgyOG44K1VBazd5Y0EvVVhZY3VQ?=
 =?utf-8?B?T0hpTnUwREl6OWJKSDRQTXFSaDdpZ05FRU5ScEN2a1VtVThnclNEYWc0eTRt?=
 =?utf-8?B?YXZKcHVkZ0h3QU9RREsrUkIzeEMxY29KUjNYZzhIZDg4enAxMzlmUE01UnAy?=
 =?utf-8?B?eGFJbDF4WmI1d3JsWTc5MzZhVlYvYmhLTHI4bEhXNjZLQnNCbERzeE9xWkha?=
 =?utf-8?Q?kh9Swm3vk/Z4UyPZuIIT2bc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkhOa0tDa1V5UWhWV2psTFBmbm9NdTZDMlZrOE0rMlkzRVV2eTFqMVZKRDNI?=
 =?utf-8?B?TXRlc1VsRUI0NEQ1ZHVxUUZVWEtTd3N6ZXVSR2crN0E0b0lUZ2lneHpaMmE2?=
 =?utf-8?B?b3d3eGZkUHlYREt0M1B5TXlHTmIvSmtPUGlsQVJ1Zzd3MHg4S0lMeVFkdGRx?=
 =?utf-8?B?Q1dSOHV4RHJaN1N2aEhUWTlBZWtTTDkvU3BlSUd2UUpTTEgyL2h4Q0ZjUWxv?=
 =?utf-8?B?UzJJaEFaVlZuMDhMYVRDNWtHTS9hUmlBaE9lVGZjSlhSNDU2SnlYbzBFTGtK?=
 =?utf-8?B?cHUzUXpaSmFkVFNaOTNNTkFlTGtwQ3FpanVGMzFnYThQQTRCSkVOV1VjR2o5?=
 =?utf-8?B?WDJtTGZIcXdYNVVDdWZzV0ZwR2pZQTloNUpFaWZ1Z3ZEWU5yNEVITDRZbkk4?=
 =?utf-8?B?MStrUGNPYzBCTkhWZDhGUlVjRzQ5aEZEL2xkamttUUhSQndvRGxLRWlPOGJN?=
 =?utf-8?B?UFg5d2ZZTWo3Q3kvYjZkbUNqeGVZdVBKaGJlbVJQYU9qUG5HN0h4UVhraStr?=
 =?utf-8?B?U1FPZlZmSExIZTl5c01UV3RaNGQ1ZFgxKy9zRHFoY3R5Q1VWR041d0NNOFg3?=
 =?utf-8?B?UDQwM25aM2dXUDRQSk5YOGFPenFGaVB2ZWVGQTd4RWQxTnFxcEs5d1ZsYk5C?=
 =?utf-8?B?WUdIZlhVVDBVdWlLS0pWUmFZSDhnWXJyNE16RU9jcVd0ejhpSm8vYURDTmdH?=
 =?utf-8?B?SkwrZU1PVUpxRGIwOHR0NGJ3SWhNcUd6QTlodExta1doNWR0b0lsSVZxcnBC?=
 =?utf-8?B?ajk4dEdxelpqdnlBazdGVkFLbUNSUkpyajlkdlZvY1luaWRiK0l1M3RaT1Rp?=
 =?utf-8?B?ZE9vVTZDaWpBY01xY01TVGpOWlRKcTlSemxxc1hCNERyNytXU0tBcGM2L003?=
 =?utf-8?B?N0tUdGR5NUllSG82TFJxUGg0UWxGNmNneExSRFZ0TllzQ2RITDlrZ1NpeDdq?=
 =?utf-8?B?Z3pKUGs3S056ditrVWZpbDRRTU4yQmtTT1NYc1ZkRDA2Mk5STFU1RnZzcSts?=
 =?utf-8?B?RWhJaWVrZVFDRnNoZ0JoaENxREs0TFRxMjZRNTF4ekFBR3kvL0JkV3BHWWdK?=
 =?utf-8?B?bG9BWDJGeW9VbjFTc2trUVdKdExmdjNLdm1rSTNteER2MGw0VXBZaW01OEpZ?=
 =?utf-8?B?NDgzSWtXWjdCbGU5bURZdVJDQW5uMERFbVlLWjhrc2hybDdKMVc2WDhDbjU0?=
 =?utf-8?B?SGM0elVJYlFCRHQ2d1JuaGdpdHVmd0h2M3hzTTRCQjhoOXFOYVRnbXBWTXRq?=
 =?utf-8?B?d0VxeHRKOVZnOC9aSk9YWjhIRStrcmlwVXRKUHc1a2g4b21vWGJ1L1pOQ2Fw?=
 =?utf-8?B?Y0gvRFZ0RkVwd3Nyd1o3dmJYRkw4L1o5czU5MzB2dnA4WS9PdmxCcWt3Wi8v?=
 =?utf-8?B?eUE5OTAvVER3MmZTZFRCcm5KcGlRMlhDU2FkbDJEUmdVN1FYbldzV01zWGFS?=
 =?utf-8?B?Rm4rT2daQjRLZU1wNFFoQVV6aE1lMHFmSmNXQjlnK2pMQkVhZTBsakx6V3hy?=
 =?utf-8?B?b1E3Tk1uWFV3clpsM3dQcDQvTDhMcmcza084SlUrRmNGbkNSdFhob3BIbTE5?=
 =?utf-8?B?TC82N3BZRmF2SzlhUEZYamVNdFArWWZJM25DMmg5MXhiV2pQY2xOcUVhdzk1?=
 =?utf-8?B?bUlsQXhLOVk2dVdEMDVJb0VzMUExVXZLNk1tV3dGZVVXVFA1R3oyRVJTZnRv?=
 =?utf-8?B?aHVnZHVmTEhRVmhnWFlHVmhueXZURTE4SGlIdnZGYXEySVlDMEQzUDg2aTlm?=
 =?utf-8?B?Zmt4YTQ4RkNPS2czM2FGSGE5c0JqTzVlTDJnUUR5MlNHNG9nU2F4VkF0N3cz?=
 =?utf-8?B?bXY3ekZJcGRsOXA2S2xRd2Q1Sm5TU2lWNnN1cUw1MU10VlVWSnhHQkxSVDVu?=
 =?utf-8?B?SytwSjJwZ1dqaVpyQms5ZFR4a04yc0MvZ1h4SUhPeHAzWktzTEpJNFJHR1RJ?=
 =?utf-8?B?bmM1VGRjS1RHL3NPaGJxblJHeHBObkRzL0VwR3JmN3hhd1Z1Y2VDanN5T28y?=
 =?utf-8?B?WDZ3NnM5WTZMUmF5QkRMQmFNMU0yUXFyY1l3Mmw0M0t5SHNKVHVYdWRQV25T?=
 =?utf-8?B?b21uRk1DN0VDZWc0WmFxdFl4d05mODl6OEg5cGZzKzJXUG9TN0p0SUQ1U0lY?=
 =?utf-8?B?bXd4TlJaVEpZaktHemtPTElHdFU1dFcyanpZZHgwTE9rN1RqYWdNMmo3Qis3?=
 =?utf-8?B?d3MxaTZyYzhQcVRvV2xJTzh4NG4rbHRQR0ZpVWE1VDFJaUFwc3RrTWEraVJn?=
 =?utf-8?B?RFZocTB5akNKS0J2RlZ0anFIZGs2aDRNNU9lRXNQQUZieDJOY2xjOUZXVjND?=
 =?utf-8?Q?/989ZbdlcUoYT3bqDk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9325be3-4dad-41f8-483e-08de56430199
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 03:38:12.4446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYscGDtFo00WnwDOeMh/DX827Og+ezOPKNR/K12a9ey+73SbVm7cjvpYpakytoqEB1b8gLTZLsEjLR6jITYVyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_193821_684093_48638E9A 
X-CRM114-Status: UNSURE (   8.79  )
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

Some misc update for imx8m* dts

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- rebase to guoshawn/dt/dt64
- fix typo, should be imx8mm in patch
      arm64: dts: imx8mm-evk: add wakeup-source for usb phy
- Link to v1: https://lore.kernel.org/r/20251110-misc_dts-v1-0-7564b9f69a18@nxp.com

---
Frank Li (2):
      arm64: dts: imx8mm-evk: replace space with tab
      arm64: dts: imx8mp-evk: replace space with tab

Fugang Duan (1):
      arm64: dts: imx8mm-evk: add uart3 port

Li Jun (2):
      arm64: dts: imx8mm: add wakeup-source for usb phy
      arm64: dts: imx8mn: add wakeup-source for usb phy

Shengjiu Wang (1):
      arm64: dts: imx8mm-evk: correct the spdif compatible string

Sherry Sun (3):
      arm64: dts: imx8mm-evk: add uart1 and bluetooth node
      arm64: dts: imx8mn-evk: add bluetooth dts node
      arm64: dts: imx8mp-evk: add bluetooth dts node

 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 78 ++++++++++++++++++++-------
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  4 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi |  4 ++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 32 ++++++-----
 5 files changed, 85 insertions(+), 34 deletions(-)
---
base-commit: 3e315c88a3362a1fc92302710eca20b865d28226
change-id: 20251107-misc_dts-c4cc84f1ae5f

Best regards,
--
Frank Li <Frank.Li@nxp.com>


