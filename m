Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB5FC02187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 02:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jl8nAGY/ZjoDzYb1Yak58SewtrQzOg8+j/EYm1sobVo=; b=NXNg/EjL8qYfXasLa73n0eLcm5
	h1Tbe2xiVjSPG+DfyUguvJmNSObtgI4EF8F0vs7ev928nhueow9ONyrVht9jZv7yI3KsxhNmxTxGU
	2IQ3UHofwo6hQHIbqAOqp2usbT3fmpsqMEWpFlBoMJS/tLvPJWsPm0ktzB8mVc0UDrGKiE9ww3/Mj
	Kjx0Ff1Am2eSpf5gPzZDygezKBdACMdtxZaB5PvZJ1tPPOE/pyRDFR2Q14SBtn612Nx2Zm58WQd2O
	KTi9eOtrpcPE8+vgayWDTTOmTle9/qeDYzpAsctrCl9EJN300rITesdcw0BriugxmAyqlYrUBRi+4
	PtrKv6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhb5-00000004ajz-2Nzj;
	Mon, 20 Jan 2025 02:33:03 +0000
Received: from mail-vi1eur02on20619.outbound.protection.outlook.com ([2a01:111:f403:2607::619] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhUy-00000004a6I-0271
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 02:26:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPYvAu+EtnxssWrwRuv3ZUoXwY65PfGoY+7jrhC63ODXDVznPaZ3CQ1k1UQ/YI+ZbsqWPZjdYgwe+ttxfJYqLmwZkZzbejFOmeQTti80PXJJbLUOlV3pswEyy6bgzQp6SbON3VefUba8VJRaftjgsrtbbO3onaWV8iyHwV6RVDvM8e+1yv9LX8RpGcNT6PkQ3923cGwI9fGdoEYYQMIxUQyWE9AUMy5afu+/VRSPC2k6jkhJi3EBwu6vM5HTp5ja87r9+NNC+JdN7WlTsheqPsXLnG5lDEfacZS372yyajr2l3841Qniw5r7BpUpvyz1/wbd3Y+/ELxFLap+npzr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jl8nAGY/ZjoDzYb1Yak58SewtrQzOg8+j/EYm1sobVo=;
 b=c7gl+0hGGBjGF+YKRi0FXZXpbV7Ixq1aNpaxemjTaBnv29tA1Q6HmVmZa2RvDAQPm4mHZccVs9De0WHhoqPcxeeUcIhzXss1c9n7Lu6eeqN2Kt2uRJ6DS0jRykpM4HdSb2JUTRA93x4A0QeG8fvSD5gv4S3ld8uwdPc6Vq7EK6Hh754I4IVDQPeDiOZPDWhmjVIcjQtt0AOzDrGowouNX0LBtSzvquFvG4ezXYJ4dl4YA/PRVjJktGtfUtyy/gLuYlvtOKaJD1rsqm+jna6sARBrsz/reGFBtIZjefGF/mf12I6DMvqcfyuHBbnUJaImPJ2MH5YdB8dqU+auiapSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jl8nAGY/ZjoDzYb1Yak58SewtrQzOg8+j/EYm1sobVo=;
 b=hKMrbcf532RNiBz1a/saqM+z7CeisO46Vwsg6La8X7PcW5SXFFb1eJVz1dqXXwNmvsrPCGiB+84sWauu9B6PiGclwJ7sTEERMNCNJlO9E2SSA/n26MRIna2W+hoOL+ZuZga3RELbYfHcLNeiouNt+PT1huTyANYrNJuyKx3JR2DjnQqXT2jZWPG7OFI23NLSmqOifRTWFxSm06iv9/6r3Rz0NxJotZWLlfkQjYP1pfvXxDGIaBUzWVrTMwyTJYSzCIPKPp/E5juWShLgjlrBswvvP6OBYbjl4J44oTe9C56o0ZDDhQFF+zzVrMI+1IJOLGzlDT/4IaylXr17ZkCdmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8690.eurprd04.prod.outlook.com (2603:10a6:20b:429::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 02:26:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 02:26:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jan 2025 10:25:36 +0800
Subject: [PATCH 4/4] rtc: imx-sm-bbm: Support multiple RTCs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rtc-v1-4-08c50830bac9@nxp.com>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
In-Reply-To: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737339953; l=5574;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=iF6bDJjhb1QTl2LY4lI/hL+omPn4K8AgkYH5lkX3plk=;
 b=DG4qxX2zPOrPVsqm/bacn+JQDSZJol1U5HpUMP+2sMFsZeh8uJ+JyjQIkmvudRyPhmviz4duP
 CY1fjZZ/0WXB9jqOjFmvAuM+ldiD46k0m4kJNlbON2es7/cawLP8kxl
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 20befcec-14d9-466e-f6c7-08dd38f9dfe6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTZqS3A5WVdoTk11RE5aQVlPSFpvd2EvWnhCeXNnbThGYy9WRVRXVC9VTnFO?=
 =?utf-8?B?M29zU2VoY1BRMkc5RWdSR0N1bm13Znd3ZVVQZ3UvT0pLZEF0U0RaTmRWN1J3?=
 =?utf-8?B?elNVQm5ISTgrY3h2UWpQMmF1eWNJTnA5MjI4cWNRM2Y4Zk9yNGQveDgybUhy?=
 =?utf-8?B?RW1lWnlRekdNQktENnA1Q3kwb2pIWUpnbmYxRSsxeTJzRmNZa1JjSFo1ZlQv?=
 =?utf-8?B?YjR5NlVtSWhuNm9LNlRIZThrbnlHamEvMG1SUm9BQjg5bUpKL3NGUnZqZDJW?=
 =?utf-8?B?YUxPeVBMOE5kakNHSlo1bUVEVmNFTU1OUlZZMVlmOXRkU3Y4Q1NIdGlOVGQy?=
 =?utf-8?B?eEtrR0hLUncrVTdSbEw4Nm5MT1F1YWUzN0k1MEdONzVydG1jWFFTbGkrRUhl?=
 =?utf-8?B?dTRGcGdkOWJNZDFqTWJycmFKai9NMnY5S0FxNiswaGRXbW4wTXdiOEYzN2RH?=
 =?utf-8?B?eElwRWlIWEh5ck94RXZTOTNacnUzQndQTi9uSVlqdmtNbHRRMFUxZTcxNXNn?=
 =?utf-8?B?OU80VkhZZTFtRWw3OCtTem5OUW1oWVV6dDRhVDVTUnREZHFIZ0lrQ2xVSEN0?=
 =?utf-8?B?K0V0UE9MMkx6QW1wZTUwMlRySlhqdDlpUEZzaUxEaE13RDRjdmdSZWFIY1RS?=
 =?utf-8?B?cGlkZTIrLzdnc2JUK2dXU2ZXd0NteVhqalNVZGc5N3VCcGVvY1UxTDV6OHM3?=
 =?utf-8?B?bk0zdTNRbWs4amtZRTJjTXZHTndYMFVKcWRYbmZQb0U0M2RBV3lhRDNBNFBw?=
 =?utf-8?B?eXU1enQ0bDIzK2NydUFBbUJXSlFuQkg2MnpuZGtQejBHVk1WS0EyRzFqYks5?=
 =?utf-8?B?U3luYWJEMFRnd21UR1JCbVgyR3V2dHpXSFdJMGw5c0UxTmFpVk9sZTJyWVcz?=
 =?utf-8?B?cW1KaDBHZjd3OVFZZEVjYnphUFRlTnZqeFlpZHFQeWx3KzVLaTFicWJMazE0?=
 =?utf-8?B?Q3NIbnJUWmRRcFBra3FVckNSRWZpczdHNERMZ2F2Rm4yY1VnMjdUWVY0Qiti?=
 =?utf-8?B?ek54TkJoaU5SUTBzQjB4aFhLRUc1Z2I1OTZ1NEdDWmMzaVNJejZCeE1JK3c4?=
 =?utf-8?B?NUZ5U0xQMGxhTGl2TWlCQmo2NWQ4Q2NjaTBFYXEwaTdHZ2sxTi9EeDZhSTFV?=
 =?utf-8?B?NXlPMDRzWlRxYWIwU3QvKzg0UXN5OFBpeVc2K1NJSjk0bmFrWllkUWgzZEh5?=
 =?utf-8?B?VE85WURxZk9iK3Iwdy9IUURseE1wR1JHYUViczFHMG9hVUFPM05rWDZLQW9a?=
 =?utf-8?B?TklUeDBSWlUvaXllNnArRXU0eGtuOFRyR05wOTZvTUtYQ08rU3ErS3N3THdx?=
 =?utf-8?B?T1A4OW4zNmpXcTcyY0lRS081VUxRTkkzeHRWNHY5WWN6c21GNlFybXZTWnpD?=
 =?utf-8?B?SDU5UVZJLzBkcy9FRHVUSkJoK2JZM3BBUUI0QkVWbUFJak1VcVZ4TGNYUGhH?=
 =?utf-8?B?ODlCNHJVWGpDaSt2bFNDczlIa1RRQzY5aGNDZ3AyWTNDOWV0Sk81N3ZveXBQ?=
 =?utf-8?B?SjB3djhUdkNiRHR0cWh3T2NHVlR6TU5BTXBTUUJqODBJZGp2V2cwcDZoMzFD?=
 =?utf-8?B?dHZ5Qjc1T2gzSTJsMm04aEZQTHQwV3VzK1VqWmNjM1pFVlliZG5YMEZMVVNk?=
 =?utf-8?B?Y2ZhSGIrajlBOGhVOUtrMm9KaFdLRTBrZGZ3di9IdVFQWWdtQ1VDbmFVYWpL?=
 =?utf-8?B?S2ViVmVzSmdzQ0M1aDlmYjBiSFlFUllROHR2dHh2L0YzWCtIZGRqd1pSVDZz?=
 =?utf-8?B?bGtCZ2piZFZnNkJGbGRib0VMTnNXV0ljMGs5Y1R6dk9GS0p6NnVGZ3ozVkNU?=
 =?utf-8?B?cnIzYlpTK0wvK0k3UFlLOUFxeEhuckkwRitsZ0ZOWUFyZ05FbWhadXN2b2lw?=
 =?utf-8?B?NUZuYTFXYzFVTUtHK29zay9IZHdTYTJwS1hEaGJ1RGNkQ2lxdXFpUVcyTEQ4?=
 =?utf-8?Q?JNS/6GaDYTfA1fVEup/gacrOu8eEVGQj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M05TeEdsU0ZQY1N5OGR6c1c3WnRWRktFdmdLSFlWRnpQUGxlck5OUzR2QWhH?=
 =?utf-8?B?T2llWEd5NGhEenZOTXRqbENYQ1llanYvWEVUVmRTVk43clRONjBsd0hWNDJ6?=
 =?utf-8?B?UUwrejFlMVk5TVJrbDNFY0VuQXU2Y3czVVl0aWkxdDd4L2piRGtLZHpXU1Rn?=
 =?utf-8?B?YS9FK2tPRVFmc0p2bUpnRWN4UUI0VlExYlFvSUxNdzVBa0o0OVpzYytiVmp4?=
 =?utf-8?B?aTB2WUFxK0tadkx0cW1wUGdsRWlBVGRVZFQwcVFnbWp3TGhIdGVQY1B6NWlo?=
 =?utf-8?B?RVpWR1RZbHdJeU4vem1UZGRWRWQvY0U3NFB1aGlZVVVvVzQ1R1RmU0hNaGZq?=
 =?utf-8?B?Qnhnd0xGb2QxMlI3N1NBaTZwMFRtMDB0UzN1eWg0citzWEF4ZWcwZDQrMXUw?=
 =?utf-8?B?VGFRM2U3NEFnMjBLbC9oTEhtT0pqcUJ2WHE1R29kSDBURE9RdGdBWklQdHdR?=
 =?utf-8?B?ZWhidno4Z29uM2FZbHVkT2x6MXU2Ti9XQ25IK2hwRnYzTWdXQit0RjRyczNZ?=
 =?utf-8?B?UURnQmdHb0IvN1dyaHlaeG41OHppLzhKRHpjdlYxM1l2TlZSdXAwSHg1NTVO?=
 =?utf-8?B?ZXA3SFVVa3Rycm1kYmNyK2FlKy9DRWpaTmhLOG1FS2hER0t5aDUvb0trcUtp?=
 =?utf-8?B?eWh0Zm1jY0cxZ250MmRXeDVQTHQ1Z0RGcEJSN0dpZjNGdkZsRGNjUDc2dFhz?=
 =?utf-8?B?WnZCVkdrU1prTy9zeXF0WkhpdU54TUxNTTQvbE94eGFtZHA0eGJXYVF3aHRP?=
 =?utf-8?B?cENMd3ZSUHZZaUZhS2VMUDhNQ2VYeWNwNithNGR4cXlFckRNRStCdmFEM05l?=
 =?utf-8?B?dUcySFJhL1pISnhyNG5uY1g3VHZiR1Y2eWVRUG5uNmNTeW0zd2ZoeXc2Nld0?=
 =?utf-8?B?U3NpQVlEWHlBL0xJQkhPSEdEeEpRRnY1VzZUV3FvdTE4N3dqMndvdnRiQVJ0?=
 =?utf-8?B?bE00N3hBbitIYnRqYURvYnVvK0l0U2NyM295TkZ6TGU2ZWxCbjFiYVljMHpP?=
 =?utf-8?B?RllSdzZJdEw2TThHS0ZEcXVJMXZGMWpOS0hEWFd1eWNQNmh4WFFwcVFZb0Y4?=
 =?utf-8?B?Y3VzYmdiRWhkdEdKOHR4YWI5OUFTd25oQWdpVnB1SzZoWnZUb25VTm1mUFpO?=
 =?utf-8?B?NmJTSjBSdS9CY2djYXh6Z1h6QW51djJ2NlBBWkt5Y0NIT3YvLzRqQ2pPWkRE?=
 =?utf-8?B?d0JtTTBCQ0d2bXRGMmtqSkJDVWFhZjU5Mm1WU29zMGo4bzhncXQ1OUx6QlZS?=
 =?utf-8?B?M2NJMVVxa0hrR1VIc2xIK29QUXdGU0JZRm5tOTlqb2ZNcmhVbnkyTWZsR1NS?=
 =?utf-8?B?ODlXL2NqYnZYeCttTlk3UGIvL1g0ckw0RVJQcU04c2RaSVJ0eEVtYWdCSExL?=
 =?utf-8?B?eGh6Q1NUNGlTSTVyQ0llZ3dtdHJZTFRhdkp4MFlSU1VMbWxhbEdpYmx5UmxX?=
 =?utf-8?B?WDdYZFkra3pFUFBoN0Eza2NrSS9KVXlpNkZNdnJWOFhvTEZNemJGZHVOZ1Vl?=
 =?utf-8?B?SE9yREdXOGlVVkF6SWk0ZXNpS05saWtLVkhIZFB6T2o5dXozbGQzZEV4R0pY?=
 =?utf-8?B?ZjY0Z2xhbnBhaHE1QlQrVk5WMmpjWWhHUG5ydXdlbGM0SUxDL2U4WFZuMkMv?=
 =?utf-8?B?U29KdCs0cmlEWFVqZHFNQmxJT1BNYmNpSWFmZVg4aHEyNWpnUDVISFBGbW5X?=
 =?utf-8?B?VjVOUERpZ0hnOGtqQUhTSXUzd2FJNUdHckVPY04vQ2dYdTZ6RG9UaXFZRnNF?=
 =?utf-8?B?dXFYMjlob1hBKzdHOEh1NkJqTkxheDdidEV5dmYyWHZPSk5zNzQrcVVNQVBO?=
 =?utf-8?B?Y2IyRWlORFBqTlhibkdFR05yYTUwTlREQVBaL0JWU2d0UUZRNzRlenRKTkNJ?=
 =?utf-8?B?SE5ieE5EdXlaL0IvYm5JOTRPcklqRTBUZmVrT2ZiaTk3VUxzMGtvelQrUXQ3?=
 =?utf-8?B?bUJyQmVZakEvV1BlREJXclFCaGRWVkJ3RjdoMHhSL0pTU2pxS2tjaytwUVlG?=
 =?utf-8?B?V2ZEdFJYeHdvSFoyZzh0cXJQdXdzREk3ZUJOY0NWYUJsUXUzaWZ3RktBSWg4?=
 =?utf-8?B?aHFVUjEyMi9TZCtxeUlwTzhZd2QwbnhZRDBQTE5VNUhidFRmZENUbkFJa3hs?=
 =?utf-8?Q?xS/WkK1S8eli45KQH6W5C71rx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20befcec-14d9-466e-f6c7-08dd38f9dfe6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 02:26:41.1846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9S848fhkD2m4+eyC5EyCJl4p1xMTgyrGu6NBQh6IEd66ooj9mwphedY3hA6cp1refMMwB7f1IzvksQU+L6RBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_182644_231402_03255C06 
X-CRM114-Status: GOOD (  17.30  )
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

i.MX95 EVK has two RTCs exported by SCMI BBM protocol. Current driver
only enables the 1st RTC inside BBNSM module, leaving the board RTC
not used by Linux.

To use the 2nd RTC, use 'bbm_info' to get the number of RTCs, register
them all, and set 'bbnsm' as private info for rtc device to know which
RTC it is when using rtc_class_ops to access rtc device.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/rtc-imx-sm-bbm.c | 69 +++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/drivers/rtc/rtc-imx-sm-bbm.c b/drivers/rtc/rtc-imx-sm-bbm.c
index daa472be7c80697aa3cd3432eccef0c877e4c378..a29b30555d0c0581ecaa8b79760209dc780d2f0e 100644
--- a/drivers/rtc/rtc-imx-sm-bbm.c
+++ b/drivers/rtc/rtc-imx-sm-bbm.c
@@ -15,16 +15,18 @@ struct scmi_imx_bbm {
 	struct rtc_device *rtc_dev;
 	struct scmi_protocol_handle *ph;
 	struct notifier_block nb;
+	u32 bbm_rtc_id;
 };
 
 static int scmi_imx_bbm_read_time(struct device *dev, struct rtc_time *tm)
 {
-	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct rtc_device *rtc = to_rtc_device(dev);
+	struct scmi_imx_bbm *bbnsm = rtc->priv;
 	struct scmi_protocol_handle *ph = bbnsm->ph;
 	u64 val;
 	int ret;
 
-	ret = bbnsm->ops->rtc_time_get(ph, 0, &val);
+	ret = bbnsm->ops->rtc_time_get(ph, bbnsm->bbm_rtc_id, &val);
 	if (ret)
 		return ret;
 
@@ -35,37 +37,40 @@ static int scmi_imx_bbm_read_time(struct device *dev, struct rtc_time *tm)
 
 static int scmi_imx_bbm_set_time(struct device *dev, struct rtc_time *tm)
 {
-	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct rtc_device *rtc = to_rtc_device(dev);
+	struct scmi_imx_bbm *bbnsm = rtc->priv;
 	struct scmi_protocol_handle *ph = bbnsm->ph;
 	u64 val;
 
 	val = rtc_tm_to_time64(tm);
 
-	return bbnsm->ops->rtc_time_set(ph, 0, val);
+	return bbnsm->ops->rtc_time_set(ph, bbnsm->bbm_rtc_id, val);
 }
 
 static int scmi_imx_bbm_alarm_irq_enable(struct device *dev, unsigned int enable)
 {
-	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct rtc_device *rtc = to_rtc_device(dev);
+	struct scmi_imx_bbm *bbnsm = rtc->priv;
 	struct scmi_protocol_handle *ph = bbnsm->ph;
 
 	/* scmi_imx_bbm_set_alarm enables the irq, just handle disable here */
 	if (!enable)
-		return bbnsm->ops->rtc_alarm_set(ph, 0, false, 0);
+		return bbnsm->ops->rtc_alarm_set(ph, bbnsm->bbm_rtc_id, false, 0);
 
 	return 0;
 }
 
 static int scmi_imx_bbm_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
-	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct rtc_device *rtc = to_rtc_device(dev);
+	struct scmi_imx_bbm *bbnsm = rtc->priv;
 	struct scmi_protocol_handle *ph = bbnsm->ph;
 	struct rtc_time *alrm_tm = &alrm->time;
 	u64 val;
 
 	val = rtc_tm_to_time64(alrm_tm);
 
-	return bbnsm->ops->rtc_alarm_set(ph, 0, true, val);
+	return bbnsm->ops->rtc_alarm_set(ph, bbnsm->bbm_rtc_id, true, val);
 }
 
 static const struct rtc_class_ops smci_imx_bbm_rtc_ops = {
@@ -83,19 +88,18 @@ static int scmi_imx_bbm_rtc_notifier(struct notifier_block *nb, unsigned long ev
 	if (r->is_rtc)
 		rtc_update_irq(bbnsm->rtc_dev, 1, RTC_AF | RTC_IRQF);
 	else
-		pr_err("Unexpected bbm event: %s\n", __func__);
+		pr_err("Unexpected bbm event: %s, bbm_rtc_id: %u\n", __func__, bbnsm->bbm_rtc_id);
 
 	return 0;
 }
 
-static int scmi_imx_bbm_rtc_init(struct scmi_device *sdev)
+static int scmi_imx_bbm_rtc_init(struct scmi_device *sdev, struct scmi_imx_bbm *bbnsm)
 {
 	const struct scmi_handle *handle = sdev->handle;
 	struct device *dev = &sdev->dev;
-	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
 	int ret;
 
-	bbnsm->rtc_dev = devm_rtc_allocate_device(dev);
+	bbnsm->rtc_dev = devm_rtc_allocate_device_priv(dev, bbnsm);
 	if (IS_ERR(bbnsm->rtc_dev))
 		return PTR_ERR(bbnsm->rtc_dev);
 
@@ -105,7 +109,7 @@ static int scmi_imx_bbm_rtc_init(struct scmi_device *sdev)
 	bbnsm->nb.notifier_call = &scmi_imx_bbm_rtc_notifier;
 	ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_BBM,
 							       SCMI_EVENT_IMX_BBM_RTC,
-							       NULL, &bbnsm->nb);
+							       &bbnsm->bbm_rtc_id, &bbnsm->nb);
 	if (ret)
 		return ret;
 
@@ -118,29 +122,42 @@ static int scmi_imx_bbm_rtc_probe(struct scmi_device *sdev)
 	struct device *dev = &sdev->dev;
 	struct scmi_protocol_handle *ph;
 	struct scmi_imx_bbm *bbnsm;
-	int ret;
+	const struct scmi_imx_bbm_proto_ops *ops;
+	int ret, i;
+	u32 nr_rtc;
 
 	if (!handle)
 		return -ENODEV;
 
-	bbnsm = devm_kzalloc(dev, sizeof(*bbnsm), GFP_KERNEL);
-	if (!bbnsm)
-		return -ENOMEM;
+	ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_BBM, &ph);
+	if (IS_ERR(ops))
+		return PTR_ERR(ops);
 
-	bbnsm->ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_BBM, &ph);
-	if (IS_ERR(bbnsm->ops))
-		return PTR_ERR(bbnsm->ops);
-
-	bbnsm->ph = ph;
+	ret = ops->bbm_info(ph, &nr_rtc, NULL);
+	if (ret)
+		return ret;
 
 	device_init_wakeup(dev, true);
 
-	dev_set_drvdata(dev, bbnsm);
+	for (i = 0; i < nr_rtc; i++) {
+		bbnsm = devm_kzalloc(dev, sizeof(*bbnsm), GFP_KERNEL);
+		if (!bbnsm) {
+			ret = -ENOMEM;
+			goto fail;
+		}
 
-	ret = scmi_imx_bbm_rtc_init(sdev);
-	if (ret)
-		device_init_wakeup(dev, false);
+		bbnsm->ops = ops;
+		bbnsm->ph = ph;
+		bbnsm->bbm_rtc_id = i;
 
+		ret = scmi_imx_bbm_rtc_init(sdev, bbnsm);
+		if (ret)
+			goto fail;
+	}
+
+	return 0;
+fail:
+	device_init_wakeup(dev, false);
 	return ret;
 }
 

-- 
2.37.1


