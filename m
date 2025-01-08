Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E238CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 07:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsEDvNEYhF3R8DXfZgJKKwqLRbmEeD16rDVIKjmLYLA=; b=z4NWFYExYjRuKqnumw0XOEBUE0
	nC08q0VqhhwPspEJ0X95ZQTJWLPn3eGwQZDrV675xgsyDUosd72eq1d+1iiExGNiCkHZYOM+chgh3
	ka/W6B4ZuVDQ9ZJDwhJ1lvGwlnPDkBB/EDNLwldEfLS2mAD+ERAdCl44NaSTBAa9GsF+yn5TBMBsI
	p6kv6ZlDhn3GqccXOVFhjmSllBxO5q3xy1iYMwdPYAnTCsJaBsWKQjx0lMfsmeOyBMTKFhJICVZME
	SkBu7qzGMS1VzQLido8UzB1/ioPj/jsmLt+W4YAYm35Z4Fi7GbFJvXW4HwDFRQkb54Y3ZGWaMd4yT
	OVTwjBqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQE9-00000007O2H-3oPC;
	Wed, 08 Jan 2025 07:11:41 +0000
Received: from mail-vi1eur03on2062f.outbound.protection.outlook.com ([2a01:111:f403:260c::62f] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ43-00000007Kuj-0UAo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 07:01:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0GOmXbCMNpt0RMocn9x2VaBkR3pJK58zil29e8mfq02k84X05XH4N6Xp04t5ldYlRxOeUV97dMjS/t/BczEHYUza2k4dlzkotUPMP6/L5vmn7Jrb5C4DfSXVOxgVEJy7KRCCfcV51r8ixrCaPeJ5RtoSHVE/KoQomvvdY6hFemFsJZRNZxQFZxCpKhqlnmuKINQsVtmdKCkIy4UINk8gVRaEcqQBK8FZt0yxGprBUv2tv0PQBbRpEgW3iCP0zKULiaG5xuNc/Vw/1tr65c+Q5MXINJhhUaljoe7K7W8JTv1BIDB3TzgGPpN29sabPdH9fxugIIq4KWmALYz+PSa2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsEDvNEYhF3R8DXfZgJKKwqLRbmEeD16rDVIKjmLYLA=;
 b=Yw5puENHGrmAikULtKI7kgakD8qgpZQhGstiEk46DeAAwhsP836pP6Ruc2we7GJmzAw2ZUf/D4kbrl+qYJQnldLWSPybg0tQ5YhuXSNoUaVaUmQiuzbRYr7GNtWqlMWnWTE/nT1qL/kcdkMxhJIjtrQJXftrXD5DDqpt/N9esrAhwbsgmCo1dqCM8XpdEry5PoIfMhWcK39QQv2azDcFPQpDg2atSM6aeaAm4v3eLNM1/TTVCrr6r5TB+sdxp/yWIBE2dkflORJNpWiSbZYSvJhHn7l9tJisP5jGKDZwqJvUCSAJu5JVSPJEonQF0SqaZGSbt4mWpExRxcC4jfg7Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsEDvNEYhF3R8DXfZgJKKwqLRbmEeD16rDVIKjmLYLA=;
 b=xiMx/BVxJ298zT95l9lxwkbE2HVFeL5z3shrl0QJz9TWTyN4CggD+hz3Qg5WAqI5hdlLaMmFuOag6dqdKqRnHXWiD0VV/mY/vadkBeyi+MSXuG50YtuPIhaTOAu2jtUGZYCHmEWnS4jgWqbxh6Uh7A2aR6FDXcVZdLdHc05lWTqa4IDc225EXCn0aOe6EaeiuyVCKN0qpUFbsRUuDC1oP5YgnAv4INkIDyPdFCQMPYnBUxEDvf5bL3a7IhabW5UApecYHH70LZU9Ca3TyALq8zAgYDSfikcXlAizxWa570FHIemFFiEbPw3WgY4eY1YGs55OXXuZjuBKwOWgxIqObw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8299.eurprd04.prod.outlook.com (2603:10a6:10:241::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 07:01:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 07:01:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 08 Jan 2025 15:00:17 +0800
Subject: [PATCH v5 1/2] dt-bindings: nvmem: imx-ocotp: Introduce
 #access-controller-cells
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-imx-ocotp-v5-1-a6d90e18ebe9@nxp.com>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com>
In-Reply-To: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736319636; l=4068;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=4MXzYq4oLyYtlA95EQap1UQZ2xOM248M5j3t6NvUUFI=;
 b=MGtlcQOrZ4CrICX7A47sjs0cXUf2A1iz+LUocXwJd0b3rYGjtryZQ5Uuv3Py1SOHk2URjQaaV
 30oir+TDuRTCSJSmsaHTeX6nEJO/btUQNPZHbdh5gqCixBxYFhLRRKM
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:54::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: 07749586-c128-4f6d-e649-08dd2fb23a59
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVVnVXdLQWVJendlSDZLTzBYazV4YUlkNzEzYXg5UEEzcmhNSTQ2N1lBM3E4?=
 =?utf-8?B?cTdaVldtVzRoZlVoTlp1TmJZVEJ6a05qZExHemxPOFBjTmRqRnVlSHNyVDNG?=
 =?utf-8?B?SzFKcUJHbHZucHorZDB4NUloT3p1dVZiTTFpRFZVbnJGNEhUelQwa2RocGdv?=
 =?utf-8?B?YzRoWHJ1alA4aW1oeWhjUzN4b0RSL05va0hTMVRKdnRQSzRqa21RUDBaTGpT?=
 =?utf-8?B?TnBTcGtyMlhUbk45cTNnVXpmcVlPRllZb2FNb1A3Nk5hWU44eUp0UkFab3Vv?=
 =?utf-8?B?cGhBa1ZZQWt1ZUo5ZCtYb0dWTSszTFd2S0lEdXdXYjcrR255LzQ4M1JaOU8v?=
 =?utf-8?B?V2FhaXVjK0VFSmNEeHlhN2dKaDFrUkNraWNmRTF3c0xqSkpzc01uTXdzc2dP?=
 =?utf-8?B?bkp0MVJHdWRVUUZ2dXdCMmh5UjA4UXczMURZWHBOdGg5Ymh5S3BKbDU5c1BW?=
 =?utf-8?B?dWg4S1lrSGsyS0dranBaNWFWUE1teTJtdTVqdHhjN3Q0K0xnallSakdvczRJ?=
 =?utf-8?B?U3c1eHJ3THQ2OFUyYVVWZXFoN2g4RzFIOWRySFFJOUVCRzREYjlTSXRtd0tD?=
 =?utf-8?B?NERQNlBtalJSZWtYelJyUHlBR1dGcjVRdFFTblJNTnkzVnpqSUZDc2ljQXRC?=
 =?utf-8?B?L1VhWXV0dkd5QjVyYndlUnJGd3pQRFlad05LQjhjdHlNQVRKSkswVUJKemdz?=
 =?utf-8?B?QnhVQThNMHQ3OTdJTyttMWQxaUl0MSt6dGsxS0hQV1pXZWw0V0w3b2V0Wlo0?=
 =?utf-8?B?Qi9QQnZyTHlVbWtOK0RUSDZoTnNFNFZmR01BdVFETDhTbis5R1MrT2dhWHdv?=
 =?utf-8?B?SFJGYThjL2o5OEZPclliRTBuaEVHNWNmTmtTNWg2NzZxdnVIRWVlNjJuWmdU?=
 =?utf-8?B?VWY3RENVaHR6UkwvaW1Fa2NRdnpOaWFFSzJMakdmUmg2eHVVd3RLWDl3eEJY?=
 =?utf-8?B?cktrZWFjYW9jR3d0eUdrSndvdWlSWFZBeFkydm5CTFZ4WlVkazNjNzdrVGxn?=
 =?utf-8?B?ZWlxRUVRbkRWNndiTzJkVEZtMlJtQVdHdzh5dmxhMlJsUWMrQzVNczRLSHVX?=
 =?utf-8?B?bXpzS1ExYmNGS3VGMjJPSXNMaVlpRGRuTXMwajhHeUUvcHNGamxCV2NmNGVM?=
 =?utf-8?B?RndlcWdkVlFOKzBlZ29RK2lCZGtRWE1OQUJUNnNaaHBBL1lSOVVEUGpLaCtq?=
 =?utf-8?B?MFBXUFgwbXE0bnVvL0w3UUE3NkRrUFJuWUtablkrU2puNVNBVHJ0cEw3QXVI?=
 =?utf-8?B?VXlwVXdxOThEbG1FTWZHWlI1ZTFwUzJKZnpOVjRCNHlUN3JUSGJ1OWV6QjJk?=
 =?utf-8?B?S3J5NXlzUWRqNHpib05oczh1WGE0aTFyekh0VndFbUU1TUozc09ObDVMM1VN?=
 =?utf-8?B?ZUVDQkZQYUVSMmVhNW80SXA5aWdqL1JrMWdpc3c1UkM0UHA4bHdocy9CYXU2?=
 =?utf-8?B?ZmxZUXRlVFBVWGhzcHpJbE5LNlNVcVlsbzRsV2JqcFlQVDRCM3RjaFZmWjVJ?=
 =?utf-8?B?dmI2dDFIOEttQVBiWXJqbm9hSXNYK1lGdFM3ZjNMUHRZOHVoVlEzdWIwL0U3?=
 =?utf-8?B?eFNUTzJoQm80K3VDVEJqMVM0RkpFMkJKZ2ZQWWxmWG9EYnkvK3dkeWRrZWhW?=
 =?utf-8?B?VGZWaEdLSko2Ykx1TXVqMXIzb2hEVm0vK205S1F4S0RCNnB3R3Y0KzZielZn?=
 =?utf-8?B?TUF4NkQvbW1qZXdFeFUyb0pHNUJwNTdUcVRRcEI4UmlIcUJjYk9aQVE4eHFQ?=
 =?utf-8?B?S21NblNMMWpZWnFQSkJ1MFo0QmlvWW9QNUJwZmIvZVMzWkhRQTA5YUR0UVdY?=
 =?utf-8?B?WmpHc3hSbkZ3VUFPaDl6NFlkNkNpZ241MEhyVDdobUJhZTJ5Q09qTE5LRCt2?=
 =?utf-8?B?ZkRiSzdmdVNXODlzY3grZW9iNlVzWi9Ea2hVVy9lVFhNcy9zUFZEVDFWNk5o?=
 =?utf-8?Q?5j9lpc9Zmenghs0IF+RHMlQihK2/Wkw8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkwzam50cXdRWWZLb1BjV0tGYm1VRWRoSlcvZXJQdDVERUdSZVpxbnN1Ujh2?=
 =?utf-8?B?dXRIYWNFZ00rTGhDMHh5V3RoOURzYVo1UFNack1VWkg0aUt3enBDMEtlUVpn?=
 =?utf-8?B?M1lLTTVFazM4aXpPWUpTdXlzOXNRNlJzYnRlYmhqN082YVVLb2N2aXpvT3V1?=
 =?utf-8?B?Z2RHYmVTU0VnVjFxZGFabmF1TGJSUlprUHNyL21tamJVVnIzRnNJSjlDMS9m?=
 =?utf-8?B?QTN5UVlJZisrcmtSWkduS3BLamswMTZxUCtTcU94M1h5bDRRUHUrbnU2bENY?=
 =?utf-8?B?a3Y5UTVDTk5mZUJwSjllVmJSWjk2ZUs4WXc1OEx1T3J4ZGtJY3JWWUtySWJm?=
 =?utf-8?B?NENwTExqY0xyVXVCaXZ3Y3VIM0ZWOHlFME5PKy9PNHMvem1vb2NUR1hkOFBL?=
 =?utf-8?B?M2JmNEl5QjlkcHJ2azBLVGVUOG5ZY2h6R0Z2TGRVajNRbjNjUW8yUGFoTzBl?=
 =?utf-8?B?cWc5YTJsM0NuaHNoNWV3cmRSSkNsOVVPRE4rZ3IzNUVSRGlXVDR4Wk5HVUdY?=
 =?utf-8?B?RjFoNTlIUFptREVOKzVrNmtzT1JmYlJicFg0U0VXK3NhUTZhVllid2NIN25H?=
 =?utf-8?B?YWJtRDNvOEtvQjJRVHYyOUNnckF4UDNwOHNQQk5mU1NqTk1YMjZoMFVHOWlX?=
 =?utf-8?B?a1luTUZwdVl0Y0tLcDdyUWxoWFBYSGpUSkpzVUkxeTJXSzZSakQ1K0tOQUNn?=
 =?utf-8?B?UVNQODE1M2pLeGpHVHFRZlVmT3JtdVd4UGd4VlZkdEcrY1NrekE5ejJyU1My?=
 =?utf-8?B?VThSck1yVmZKTWMrN295VlRjdGh0MUd3YXg4K3RYcitvWkVFakFycjdPTFhi?=
 =?utf-8?B?bFdNcTRReWlBdkpBaCs1UkdUWEZVdXM2NW95Um5HcTU0L3oyNFFBd05KYml3?=
 =?utf-8?B?OSs0bXUzMzA0alhQNmlDTkNDVUNHcW5tQ0tKbEkzQlhaM1lhU2V2dzB4cmd6?=
 =?utf-8?B?dnlUSGx0NE9hTEhVVEo3TFNNSWNCMFBrYTdVaDZuVDl6SDJOamZuVmNWZEZn?=
 =?utf-8?B?RWZSWlM5QzZtVkZKd3IvNGtWMGxsMnlHUVU2dFhZM21OK1lBWElCSmt0ZDVn?=
 =?utf-8?B?dUlNMVNXVktoZkV3N2RUaTBZZ1RNaWZvVWk3ZHo2NVdKTHd6SzIvL2hmWEJx?=
 =?utf-8?B?aWxSQW5pc2c1dU5IcDlqM0QzaHk3bTY2bnNYd1UydnYyb3pHVUVXYlBDTlBo?=
 =?utf-8?B?d3MvUDZ3WnhLQk56Z3FvSFBsYmFNaFRSVUJ3RlRYTk9rRTVVMHhvamJyUWhI?=
 =?utf-8?B?Q2l6OE9WZ21yaUJFZStXenZEOHJHWjdsMlVsbktqN2FwRjNHOVpFNUhPa0ZW?=
 =?utf-8?B?cDNJZzhwRnY4QXk1ZDlBQTBVY1luWXZzWEdFMGlyZkxuOVRSQ1dPc2tVRi9S?=
 =?utf-8?B?eVd0V2ZybXMwaUJNeUpKT2tiNVZ4a0xjN3JkY0dSdW1jUTZDTEJia2JaeGxy?=
 =?utf-8?B?bFd6NjZMRVdVblBsTkthaTRpQ0hUOEFQMmp3cEcveDlmUC81ZVJQb3BkdU9q?=
 =?utf-8?B?dTJPZ0llN1daTllUNUoraEJqckVHRVk2M0dCR3FFbGpibEZCL3h1TmI4d3hh?=
 =?utf-8?B?b1dkTHNXLzhJZjcxK3dtOExRN0VYQkxSemhqd2M0a2d0Tm8rSFJwRGl2UlNX?=
 =?utf-8?B?aG4raURmTjNOTUh4N212NHlWekZmdmoyRWhUbHE0ZzE5b2hERCtZcUN2aUFH?=
 =?utf-8?B?U2Qzbk5HcDFEa3hGR2VVRTRjWm95QkNybnljQ1h6NG11UEh2eFV6eHhkUG1E?=
 =?utf-8?B?RnpLeXRyd21iL3pPQmpUb25Tei9ROEFQUjBSM3ZMaldsN3dWSzBlYmFZVERF?=
 =?utf-8?B?ZHZlS0VLTHFRWTIvR3FZSW5PRjJBenhkQ1lWZUJIdlhkdW9obXR4VDFTNmRq?=
 =?utf-8?B?aldDMW5uajhFSXRqNVpyWjJTeGp1WkZwV01INVcyQ0NuRER5R3p6VnRFZnN0?=
 =?utf-8?B?M0IyUEoyUytxSjlEaTkyQWsxVTcxbnpyVU4yRWZLMXVFWHlyUEkvR0lDS3FO?=
 =?utf-8?B?VUFrSzQ3eVE4MEZCUGNnK25ZRDFRbzh2RklGVFN5S1dXaXNTYjl3QjZRVzVN?=
 =?utf-8?B?SGZJeE5ZRVpjZDJzSExSVU1sSlphSjFYSGNFTzh0MTY1MEZBSzkvWGpmSHUr?=
 =?utf-8?Q?VIAzRFY7n+osRlMlbC3ijnSjD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07749586-c128-4f6d-e649-08dd2fb23a59
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 07:01:08.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcU+lEEZBwLfACwrZFbqx5jOq/pgICq4TZdBhZZPzPX1Gm2DlcJP+UXWGbMsBhn3hRU15g0gmBDOF1st/govZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_230115_167234_401AD2FE 
X-CRM114-Status: GOOD (  11.45  )
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

From: Peng Fan <peng.fan@nxp.com>

Introduce "#access-controller-cells" to make OCOTP be an accessing
controller, because i.MX Family OCOTP supports a specific peripheral
or function being fused which means being disabled.

Add the i.MX[95,93] OCOTP gate index.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  5 +++
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        | 24 ++++++++++++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        | 43 ++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index b2cb76cf9053a883a158acaf5eaa108895818afc..c78e202ced22f1c278f7be827b71ba434832d2a7 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -54,6 +54,11 @@ properties:
   clocks:
     maxItems: 1
 
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the gate ID associated to the peripheral.
+
 required:
   - "#address-cells"
   - "#size-cells"
diff --git a/include/dt-bindings/nvmem/fsl,imx93-ocotp.h b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..6ef525173845fd4ee0e847cf5a17e53a14f71362
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX93_OTPC_H
+#define _DT_BINDINGS_NVMEM_IMX93_OTPC_H
+
+#define IMX93_OCOTP_NPU_GATE		0
+#define IMX93_OCOTP_A550_GATE		1
+#define IMX93_OCOTP_A551_GATE		2
+#define IMX93_OCOTP_M33_GATE		3
+#define IMX93_OCOTP_CAN1_FD_GATE	4
+#define IMX93_OCOTP_CAN2_FD_GATE	5
+#define IMX93_OCOTP_CAN1_GATE		6
+#define IMX93_OCOTP_CAN2_GATE		7
+#define IMX93_OCOTP_USB1_GATE		8
+#define IMX93_OCOTP_USB2_GATE		9
+#define IMX93_OCOTP_ENET1_GATE		10
+#define IMX93_OCOTP_ENET2_GATE		11
+#define IMX93_OCOTP_PXP_GATE		12
+#define IMX93_OCOTP_MIPI_CSI1_GATE	13
+#define IMX93_OCOTP_MIPI_DSI1_GATE	14
+#define IMX93_OCOTP_LVDS1_GATE		15
+#define IMX93_OCOTP_ADC1_GATE		16
+
+#endif
diff --git a/include/dt-bindings/nvmem/fsl,imx95-ocotp.h b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..2d21d1f690974d0215c71352168378a150f489af
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX95_OTPC_H
+#define _DT_BINDINGS_NVMEM_IMX95_OTPC_H
+
+#define IMX95_OCOTP_CANFD1_GATE		0
+#define IMX95_OCOTP_CANFD2_GATE		1
+#define IMX95_OCOTP_CANFD3_GATE		2
+#define IMX95_OCOTP_CANFD4_GATE		3
+#define IMX95_OCOTP_CANFD5_GATE		4
+#define IMX95_OCOTP_CAN1_GATE		5
+#define IMX95_OCOTP_CAN2_GATE		6
+#define IMX95_OCOTP_CAN3_GATE		7
+#define IMX95_OCOTP_CAN4_GATE		8
+#define IMX95_OCOTP_CAN5_GATE		9
+#define IMX95_OCOTP_NPU_GATE		10
+#define IMX95_OCOTP_A550_GATE		11
+#define IMX95_OCOTP_A551_GATE		12
+#define IMX95_OCOTP_A552_GATE		13
+#define IMX95_OCOTP_A553_GATE		14
+#define IMX95_OCOTP_A554_GATE		15
+#define IMX95_OCOTP_A555_GATE		16
+#define IMX95_OCOTP_M7_GATE		17
+#define IMX95_OCOTP_DCSS_GATE		18
+#define IMX95_OCOTP_LVDS1_GATE		19
+#define IMX95_OCOTP_ISP_GATE		20
+#define IMX95_OCOTP_USB1_GATE		21
+#define IMX95_OCOTP_USB2_GATE		22
+#define IMX95_OCOTP_NETC_GATE		23
+#define IMX95_OCOTP_PCIE1_GATE		24
+#define IMX95_OCOTP_PCIE2_GATE		25
+#define IMX95_OCOTP_ADC1_GATE		26
+#define IMX95_OCOTP_EARC_RX_GATE	27
+#define IMX95_OCOTP_GPU3D_GATE		28
+#define IMX95_OCOTP_VPU_GATE		29
+#define IMX95_OCOTP_JPEG_ENC_GATE	30
+#define IMX95_OCOTP_JPEG_DEC_GATE	31
+#define IMX95_OCOTP_MIPI_CSI1_GATE	32
+#define IMX95_OCOTP_MIPI_CSI2_GATE	33
+#define IMX95_OCOTP_MIPI_DSI1_GATE	34
+#define IMX95_OCOTP_V2X_GATE		35
+
+#endif

-- 
2.37.1


