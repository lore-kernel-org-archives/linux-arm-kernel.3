Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AC5F3C9AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTC31OVItFQUhDr8bVdOOKdZiCFc2iLLNV81eot8Z6k=; b=4IbLgulzUxxLuc8IfKvUVrTx6E
	NNebrYY1uPyAxqnuAyX9PMO53J7uICqscJxOPWc0dBex7NCSCLzQqCtN8JV1hFV1DmHTSrwC0zEYF
	qkzHJzUa39zQyRdCzoApNH/eNMSZ5ugesSVos+m3yuvGmJoHgF+/AFHQVvwah6cV2U17EftC8RqEO
	VfmkhZy6CfgSOzW6k1XxkNNykvoyP2Ms6A10UpFYh91TuiexQd/lQFO8GzS3Xf7b4w4uwx6H+GZz6
	kKxMR+XfUT1apeYkLJnJlLR34iv7NLlkmLAjuJbagbvt8J/hzNiZjnDY+M7kJARSluoWSjbPKYMBM
	VKINg5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvdt-00000002QZs-1iAS;
	Tue, 24 Feb 2026 16:52:13 +0000
Received: from mail-francesouthazon11011045.outbound.protection.outlook.com ([40.107.130.45] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvdq-00000002QZH-3YXK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 16:52:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOF592R7havJNoX0iugLVBeV9HqM+sZ/rU39VXfEhbGjUZwJ302JlYJQqcZIhBqdh/UZkNtkPMIUe4sweKafBhww6K4e3/ZXpCMSmhgyxhUWqm+SJWF38PNaEFxxigHZONGNmQ38rJROhcTRqwJYrQG2bZg86A05rXKNpi0i2cjxK/8Rt4Voq5S5fnlZWwtTscYpDgSNrjEEBqMD/qa2ePHHblUSj5k2Al7Va8q9meLqHUcjG4vA4Uk1TPrY/bDEiIv9XdSl1b/rpTfDQkx+Q8cR64vwDU4Ly4hPgFN2jauXbXOVDRJbNXQWu3k6XtybFmGzoRogyUQeA/2YGL0cuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTC31OVItFQUhDr8bVdOOKdZiCFc2iLLNV81eot8Z6k=;
 b=crAptFQyPYok3O/d1IU5Sa0OcPkxQUhe38QbUpInn83/qvzs3T1AEYZEJZmGPN7JZmUiAeVSGGc+9+yIe5zoVZ55YDonb5vl7NXicqJZf6NNSDyLrFv9e05aC5mwVZJwqStmQwBQqjgXooygdnmJG8r9LYVdy+gCvZ986p7hwYHzo71FJnDQUTuvwZ+3u9FZ4YH3XxBMkIP/siJblmREMT7F2/3Sm2SKe/rErjONiujy6B3Vm3UiwAPHdtAfHjnHyW7IsUmiim9U4IZ8DsJVRwfWcX3ZKsHULbkBwVDi1nAxvBX3qWWAAnST+1t53Kiu7d7d4zbQq2t+CNi9rOCd3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTC31OVItFQUhDr8bVdOOKdZiCFc2iLLNV81eot8Z6k=;
 b=a7fTgYmrXpHnuecpXyr0ibK4GoRQPoAjfyyR46icHkJTJ8XAqbVxSn58RQ747JK4darfumws9UMz7LP5ymSOBr/lBa9SjMPBj7OKykdiOYVGclqWqqqsz9REtTbTbBD/1NCNcqKZzPfh3A8EwtKrq6HRnQgjfKaEOo9u2wQfjLStPgyXFUyUuFkuhzrMVv0G0OTHLcdE79qwdQg+TyB/wd6RtYimpaihEQWNVioxJ3jm2ns+kh9+xzdC0TKpKq1axXTIq7vZF/81ZUBkx0+DZtKZZ+6SQNS0bj0pEvcFU3uiqf5C33ds1TSn8d4DCCv4ehfkq8zWukgWtYUQI9sUjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV1PR04MB10155.eurprd04.prod.outlook.com (2603:10a6:150:1a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:52:05 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:52:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: Disable the audmix
Date: Tue, 24 Feb 2026 11:51:46 -0500
Message-ID: <177195187396.2902565.2558014498532954737.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120100221.47274-1-francesco@dolcini.it>
References: <20260120100221.47274-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::22) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV1PR04MB10155:EE_
X-MS-Office365-Filtering-Correlation-Id: be0b0c7e-aa46-4f94-aaea-08de73c50a46
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|7416014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2RtRjZSdTYrTzVFR0gxd1U5TW54Tzd6YThNOHcrVWRiRXpFQ2k4bWxJZWdR?=
 =?utf-8?B?bGZLUW5hNjBqMi9CRWhZTUhJS08ya0I3cEZHdStzemNraGRRUjMrbEYvNVZr?=
 =?utf-8?B?YkNLdWZHRUJEL29JSGFWMy9iQTdFeVVLRkd5eW5rdklURkJNK1F1dTJYL1dP?=
 =?utf-8?B?eUFzQVBMZkN6SU1PTnphd3NoTWl3M2prWjBTNW9VTjR1a2QxeUhsOTVWTWpF?=
 =?utf-8?B?bm5VR3BzL3FBbXRIVlRQZFhOSmV0WHE2K0VaVitkcHVrdlV2NDAzMENTcENK?=
 =?utf-8?B?SE5GajQza0ZOeWN6U1B3NUdsdStGZXRPNDZFZUxCaEhxb3IrUmRQRk5XL0Ni?=
 =?utf-8?B?MEVOMm94bnRPZmZGaGx0OFVGa1dKTmR3UWJsVjcyVXNZU3BiYldJWWZPaEU4?=
 =?utf-8?B?UGE0U3lVdk1DUlgzc0V0aml4OWVYRGR1THVER0NsQjVCR1NFYmdZNUduUVl5?=
 =?utf-8?B?MVBmSFhwM0FZOEUwbFlyUFJKRHcrRTE5MGlEMEszRGQrU3QzbW9Xc2dSZUNR?=
 =?utf-8?B?M05jb0RTQkZvdStNbG42bWJxNDI1M3RmTmlualk1N2VoYkY2b3dhZEgvc0Rz?=
 =?utf-8?B?TDNTUm5KNndZRzNreE9pZUdSb2VuNE9EbHhuditOajBtNjJ1KzRaYU9OOFJu?=
 =?utf-8?B?TEpTWmZBc1c5YzB3anNYT3lMbWdyZGg5MEMwT2tCb1B5RVpkdWY5NHlEVnBa?=
 =?utf-8?B?cTV4NytGOTJKRDcxRVFSWEYvLzBYMDM5WFp1Q2EyNThkNzNSZFQrQlIzdXd2?=
 =?utf-8?B?ZlZ5bys1MGw2MlJreHlJeHEzOXF6eFNYNnJyNk5iQUgxNHNMakxvNWs4dC8x?=
 =?utf-8?B?czZWZzBMYk4wWXJHaEVOQkhpb1k5Zi96dkVaQXhxcW9GaEFsbUNoc3JsRjh3?=
 =?utf-8?B?L0tucHVjVVZ2RlRRbjlvdlc3enhOdDNJcGZYcmZsQzZiV1A2V25Fcjh6VXJo?=
 =?utf-8?B?bVBFaUxpNkx4MDhxQlhNRmFkMmdmZkhmblZ0akVQenJhb29qOXNXeUVaSlNN?=
 =?utf-8?B?K2UwQis3YWJyOFNhckg4VEtvOFNtMld2eEx2MFV1YVNsK0dlVmcyd3ptUXpY?=
 =?utf-8?B?VmRqQ3NYeXFtWUZNSnRObEoyclI4Yi9TUWp0T3A0S0c2S1V3YVZ1MjNOV1R0?=
 =?utf-8?B?aG9PM0pzVTlGbkkvcHZHM2cwanRkQkpkMm9LbFlFNlUzRHdYVkRrNXhta0FP?=
 =?utf-8?B?ZnVCakxPa2dTZDZaVXphUnY5UWVYd2c2TTZrcXBhSmFoZjhPU0lIc3pBbkkx?=
 =?utf-8?B?MG1YdlN6K0ZqVC9MSEZPWk9WTk5SL2lwTWZHajhQeEIrUHh0VnBiU21OY1Bv?=
 =?utf-8?B?dXNrSVpySHNNbEZwd05RakxsTkF2UEV6SWZ2aUdRVWJwMjNXRkF3YmlJOVBp?=
 =?utf-8?B?ZUtBYWNqTGZUbEozQVpjYkdrZUYrNE0yMmRMcE5FRkgvWkUyWkpjUTdyeHlT?=
 =?utf-8?B?NGp0VFZOZlFHdlc2bzlkclZld2RhNXA0bTRmUjlURWh2TXNRaFpXMkFkZkpF?=
 =?utf-8?B?SHN3emFLU2phM1J1bXpoMkdJcWJaRDk1S1QyWTE5Y2hpZmtpTG9CZ3NENmJR?=
 =?utf-8?B?ZUMzTmhXSE1teEFxQkd2dW9hcUYyQUFSeElEeC9oWTNCNEl5bnJRa3BoMGdN?=
 =?utf-8?B?cjJDOE1mOXNsZVk4akF3UGY1VDliVHRyM2N2RGNMVXdMQUhFdVBEMktzNXBC?=
 =?utf-8?B?RHdXYzZ6RWl2bWJYYm5TMzlCQTBXWGZkeER4ZHdoM2Q2WEgrV095ZTNqY3ov?=
 =?utf-8?B?NUw5RC92OGo1YThqcXJ3d09Wa1F2RW94VDV2OEorR1dkc2hpMUIxdnZ2Znpr?=
 =?utf-8?B?QWNWOVdBSDlXbUNHQ0VpTEpQMFpKZFZrTmMvQU00cGM2LzZudDJTdFUwemRL?=
 =?utf-8?B?VHNBSG1XMEJCbDJqaUlqT2c4QjhSSEkxZ2plbzJ3YWwrZGJaZ0R4RERmeHlH?=
 =?utf-8?B?aXdyWnBHaVBJaENNZnljL1ZaU1NEQ1BwekZxcVdzbmEzVURHdkJyMlM0V2JH?=
 =?utf-8?B?UGFLdGpxZWdSMVBMRUYwWGE3UDNsS25iY1RpQXN6SXMveEhWSDQ3RzNHMDB4?=
 =?utf-8?B?azlmNkZBYnVMWjZRTTNiNjQvRGcyd1BIV29zendSTFhxZUtiL2EweDg4Q08v?=
 =?utf-8?B?SnpOdStSSHFDM2F5SmR4UWVOcXJ6SXhPZU0yaEFiOWZ2ZjFhWVZSYVF1enF5?=
 =?utf-8?Q?tEPdSMkWPuJEsGOulreD0dQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L28rMTdYcmRybDE2NVlSb1ZCYWg0NEZZaGN6Wjl5YU5GN3FRZjEyeXNJZHVv?=
 =?utf-8?B?RDlydjlJdDJTSlJOaFpyb05mS29FckhibmEvTWR0UHR1V0VuL3UxblNkQjlw?=
 =?utf-8?B?ZVdjTWFiNHREWTZZV0d5WXF4OGRXUUtheWY5dlNRNm8wRHVuOTRncENyUmFR?=
 =?utf-8?B?Wk51akFWRkdaKzM0NlV4c3FkVmF3dnVnQzhmZ25ZejRIVmNvR1Q1dGF1UFRu?=
 =?utf-8?B?NDBBdlVvUWRQdHJDNWdrbE5HYXBiRnRHZ0lySVpxV1kxRlZzVS9hRlo0MHpz?=
 =?utf-8?B?eFpUYXd2SFo0ZWsrM2dpeWR6ODlQenV4TjRmUEp5ckNqZnJ0NXFHN214cmlq?=
 =?utf-8?B?ekJBQ0xwdlhBaHVPNi82TkNRWlJsMEplSEtqTld6TFhBQ2ZrSXNVaWozbHU2?=
 =?utf-8?B?eG51VVdxSjVzYWw1ZnMwRFdCL3hDTUlhZUl3emxrUEplVTVlamkzMm5mb2My?=
 =?utf-8?B?c2x2cTIrSUo5OVkyTzFxeHA3Mm5zSmZDUVdMTlpBQlhkSTZVMGhUOUc3Njd6?=
 =?utf-8?B?NElvRTgyZHZXeVJVY3MxV0dueGNFaDNaY3k3amtkNVFlQkM0aFRIQmF1S284?=
 =?utf-8?B?M25KdXNCRG1TckxTanVkSkxWS3FWRytQUWhUanExbkNBenZwTXhDNlB2cWtt?=
 =?utf-8?B?SGUrTGM1S2ErMVBSSGxkaURkRWdnb25rbUpDcXVUQm9YSUhCdXZ6Q0h2Titm?=
 =?utf-8?B?aHdTNEF6WDV1YWcreTRhYU9COVJEeEkwWCtWVXJxRGR1YmhxaENSWUdjZlBt?=
 =?utf-8?B?M2c2Z0NqZFdDeEwxeFZScmMyUHM4ZGV3M3ZFZGRPTlZ5UTFJRkhsTG0rVUtZ?=
 =?utf-8?B?OVErSFBkc0JHK0hNdHgwRWJ1WFN3d0UzSUZvSHdpZnJXdGQ5emF1S0lyVmhU?=
 =?utf-8?B?VFBiZUNMWkFiSHVJd3ZwRWhtR0Zrc3h0YnFHb2plK2RacjVaOHFNa2w3L0NF?=
 =?utf-8?B?TEZlUW53QytQY1RJQkE1azdSM3E5emhaTzBkbjU5ckZJeHQxeWN4T0VQS1pk?=
 =?utf-8?B?aUNEeVpOeHI5ekNaZ1pSazQwV3hYUDBqc0pZaUdRSnMxVkx3WCtDZWdsTjBP?=
 =?utf-8?B?QkZCZmtmTlk4Y1Mza1lvQUppZEdpZ0NGd1pmczhPcG1yRlNlRlFqcHprZFVF?=
 =?utf-8?B?bmM4UEIybHJFalNxME9kOGYwVlk2QkE5dk1YbDNQVlZidmxIMjJyVnlHQ3I2?=
 =?utf-8?B?clFpWlRONWx4RFlOcU9NQ01lWDJZWlhVazRYMldjY1JZR011UTBrR0NFTFhp?=
 =?utf-8?B?eXBmYmhXU3N1RVFLMmhvZXRTNTVibVR0MmpRMm5VRTQ5VWFubC9Pc05LL05y?=
 =?utf-8?B?VmN2bGtzUWlmMEZFWTdyRWVzY2lqRFB3anJxWTN6TVFzc2pmYU00cGxzQnRD?=
 =?utf-8?B?YW9Ya2p4TnRQYWQ3dVZvNDlFd1JEQk1WN3o4LzZSZTNMVkIrYktzSGIzcFdp?=
 =?utf-8?B?VEdpMGk4L3lFWldOc1ptdXNyYkZxM0FXT1NDZWJUTUE3WDRKTVZza1V2YVRP?=
 =?utf-8?B?ZUIvdnRwUGN1WXJ4UTlVVllZUzk5T0dmaE5sVklXem5KZ1J6TnBieGxEV2NK?=
 =?utf-8?B?emQxMG4yd1l2aklDTnRFL2hxY0tPVjRGMUJvbUtWV09MNXRLV3RxcXRCR0Vn?=
 =?utf-8?B?cTA2UWtkMXpXV3orbTBqZnRwTHp4bW1KYU02bjJxMWo0WmtHN1lvZ3pRYytP?=
 =?utf-8?B?Mzh0RzhLYUhReWxQM3BwcHZTSDZ5RnUzRFlQYkl5NjVXYTMyYmdyQTJKSjRY?=
 =?utf-8?B?aWU1ZVpXQ2ROU3dtZFVWaHoyeXFHZDFOOEdHSjFiUzdUZVV3d0RQblFIZlVU?=
 =?utf-8?B?MFhycFBleWRqQ1RINnl0aGcvdDJSN2xPam1xSWI3L3dLZTJFcUNGRlhsUzJU?=
 =?utf-8?B?bTU3R2tCbFlVa1lBb0VjclJScFRxZFd3WGQ3djNPcFByNlNXbkNaelFyMWM1?=
 =?utf-8?B?dTR6M0dwWFJhWVV6NXRKd2ZPSmppbkpiZ1hPMEU2cHJqdTV5RjRhTWp3YmNq?=
 =?utf-8?B?Rys2ZmQ1S09PWFYyL2tDeG9ZN01ZR1JnUUp3S1VMRzg3UHZMNGRlK29BUnpv?=
 =?utf-8?B?NmtyTlgxYS8wWExwbGVHQmV2L1Y0akxUNGNaNXVLYjhBL25qMzBrYUhRVVly?=
 =?utf-8?B?cVZsMSswMDZ5OUZsOFpENitMZXFIM2FFRThaanUvWjdNakRGc3RTQzVUTlNM?=
 =?utf-8?B?UGFiazJHVFh6TmdZYnJnR1JLZ3k3TUlScVVQRkU4NW8xaEc4SE8vdEhCK05o?=
 =?utf-8?B?TEx0eFQzb3l2YXp6VlZ5SStOSHNDV0Nra2tpNWVJUURwbnRsZTJLZ3lIOUdq?=
 =?utf-8?Q?n09PBTRn7SZhaoAuIb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0b0c7e-aa46-4f94-aaea-08de73c50a46
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:52:05.3960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1f+Nhoa/v4wrycz66dsP70WzVg+3uRhuCUS4NC/ZkqOHjaEpqSNTN/RkDEeHMG/2NmzeulZvrdC+kdUrDoxnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_085210_890112_91DDBD21 
X-CRM114-Status: GOOD (  10.08  )
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


On Tue, 20 Jan 2026 11:02:20 +0100, Francesco Dolcini wrote:
> The audmix is not used on apalis imx8, disable it.
>
> This solves the following warning message
>
>   imx-audmix imx-audmix.0: failed to find SAI platform device
>   imx-audmix imx-audmix.0: probe with driver imx-audmix failed with error -22
>
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8-apalis: Disable the audmix

Best regards,
--
Frank Li <Frank.Li@nxp.com>

