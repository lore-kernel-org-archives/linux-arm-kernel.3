Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82583D65C41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 12:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/HlGQhSy4pvD3Q9M2vJTXIWf8oY9zuHt19NyMGweH4=; b=TUY3ftF3PcCyoHVmJ19AbPYt9r
	mDvMIuNSaZQ/HKavFWNZoHPs4ZDMKKLuZQv4ABpQ73MAiqZO26iXRN6OzaBhmSru9rHuxOSAhciEl
	rYGAJMRmpyt4n6EiiUOQoqu0/eiwYcui58aDAy1iEY+iYcYcHS64wu/i13XRuD+xd8Y/wuuI467It
	QvbPrcPvr3FmiRreur4SdR5Gg3zDMUxTFNaV2z4/BfCPqxJH1l/pNH7Lg7RN8MX5ijQlbo1ePjYbQ
	FTvKbrKRAGkfRdPwGiEIlD0pzQz78Xj/XwkvmXw1JLldiBO3iLQ/PuVXPciicYqTGWAegD3PzHqMR
	3dTMdofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqrl-00000006nYB-0MPD;
	Wed, 17 Dec 2025 12:42:53 +0000
Received: from mail-francecentralazon11013055.outbound.protection.outlook.com ([40.107.162.55] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqri-00000006nV9-1hoi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 12:42:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7ekY6Hxz2TuZLiWCfVkkVWFIEaWTmxmfw32PQkXRXwTlKv4DvVCBZ640ZmfkLOAsU6w74rZxvyByEuBLN2+yAFW12GWYEyRa9UOiSZChz7lokYg5S2I1SQZrSG5UU1QYhmyKayx8oue//xsRovz6oZvir5FWAk6TTSGVriSKrpCoo6xHPCn3ejy9oz88tX1DHYPUyqD7iKuu8xUgQr8X+tkUZcISxooAHmPP76A6S4gWGDrYwwZfDQC1SGtP9v6lbwc1CXE7HPvQU6Nn/WrIEYf16IcGSGLYgYHdksYMEL0MezD+6pwNEm4y/4U3w1QeJYfswh8KjZMSITCk+NTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/HlGQhSy4pvD3Q9M2vJTXIWf8oY9zuHt19NyMGweH4=;
 b=lgx+qxaxRkAXZ83/dP6Jve66kIDyPb5FCS8Rw8D+zdWPxG7YmDBe4Av1Ox922K8rXvWkk5iUMaPKIz6NomPxLoRWGdUSp2RtKa00kTMQIj7eQQVq3fDzYmSzuGnQbBlYwZu00i99mAt+kH8UH1IIlXuM8Rha7MKxj/VBAtRq0Ato0MpjCvjpFC4sUl0izimewhAOu6PRfDyXWINCjwFudvNl21EqqC75v+LixQllJA9R4+wmHwOiTS9aI7J/t3JWRb69ET0shCXd1UqMex7c6IDlElsNy4I07NSqKQ7uIF5jjinZAo+m5Z40AymgycMm+htGKSqt6/XnwcchF84rag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/HlGQhSy4pvD3Q9M2vJTXIWf8oY9zuHt19NyMGweH4=;
 b=Gt6R4CpC3wRg1mixod6hwXIxJbKRnD3YLkIvE9wTqXrmPXi96V7DhsG8Dc5SlHv6HcX3/9kIZPK/E9cEX5NimvXsXSVkto/NRnRdzzIby8P7mYGqPlrnnuJ1ZBdTzRnyop6aM2L10RG0Wtnupgy0VPPHRk7tPNbV6SrdTg2EVvkxCNDjpfbxyhysZufRs9kC0Kl7lFhNJVk5/0642sb9ur1CAcxpl1iCvV7NpvzcvEj+snlx/vPBqXaOBnTfjJTRDzM0U6JCLXYULY2biS86DesWxs9WDGKML/K0f22FowKHaF40vTJOg1VkiwEg/aLp3i5zqszZqOkl1ldaGPLlHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7508.eurprd04.prod.outlook.com (2603:10a6:20b:283::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 12:42:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 12:42:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 17 Dec 2025 20:42:08 +0800
Subject: [PATCH 2/3] soc: imx: Use dev_err_probe() for i.MX9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-soc-imx9-fix-v1-2-0c763c2dbe29@nxp.com>
References: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
In-Reply-To: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::19)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: ab79c417-6502-4f84-3fa5-08de3d69c404
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cE1NR1VaU2srUDNDSnpJR3I4eXh4RzRqNEYzTUpQcmFvbDdFTUJudzZiVzFq?=
 =?utf-8?B?M3pXZWtyb0gwbmRzcExDeEJmYTE0YVA3aGlBNCs0QUFXSEhqVWVxMnA2cFp1?=
 =?utf-8?B?SHNMeVI0TG5ROVFDQXRYbjlIdngzRCt3UlIwSnBuaTJ6aGVRWmNNUktBSXRs?=
 =?utf-8?B?cUFFUVYrK1dYUmhTTmxoMTRsaHkyVXJ4ODRBeVQwOUNYSExsSlJpa1QyNXd2?=
 =?utf-8?B?Y1JlYlJuaVlMVDRGTzFhQWFMRW50SEJuM3Fsb1F4WGdZaVU0QmFYWjBzb204?=
 =?utf-8?B?eFZRTGVVbVl0R2NzK0pBYnNRNmtNeHVDTkVRb0VpMVo3bTlHcE16cmh2cmM2?=
 =?utf-8?B?a0dodXNrN0YyMWFKajdIWmo2djJHUVN5WGFUTkk5bkVXMWFXREdzdE9kZHlZ?=
 =?utf-8?B?bkJUTzdXYkJTTHhJRFBZV2w4YjV6a2FjdVlEWVRYWTJ2MUpYaXFkN1Y4NUZ5?=
 =?utf-8?B?T0s1VzYzRU0vNGw5dUxBNHVDRXFVVElaanBHcjM4SGpoV3JHemJtcjVEM0Nx?=
 =?utf-8?B?VkVpa0Ntdys0SFRaUHdqV3NqSEJiK2s4eGRKWExUOFl4YUR2NTIzTnBMOWJC?=
 =?utf-8?B?VDgzcmhRZXZDZjRGc0NuNnBjVjdXOU1CRHA0eHNET21EYjkxbHZvaWFlQnAx?=
 =?utf-8?B?WE5Xcm1vQllaRXUzWEhsemdHa3VZN1pmMXJhZnZIZGVHZEwzL2QzYUNJd29N?=
 =?utf-8?B?ak8yK0VNSVlxa2dXM1FpeTZZYzNZaEdLbDVIN2VobCtRVDluUTlxVG0vVWw2?=
 =?utf-8?B?akZEbjBQVURibTdtb2djZFlIZGdVbkpaQXQzcTRqKzZEcjVyS1BOZFk4R0JX?=
 =?utf-8?B?YWZnbG1scWZiYkZUT2tXMlJJcWgrT2lHQk5nd1hpdnRkK1VNQkp1NFRkSmM3?=
 =?utf-8?B?N3Z6dklvdkUyT2ExZU0xWW5WMzlMZ3NlZFU5am9KTkxjekkrU3BEOWZXaCtx?=
 =?utf-8?B?bnVVd09BRlppMkZjUlJHVld1a083bW5hY2JFRE1UVzZyYmlFWE53Z0FLVGNa?=
 =?utf-8?B?Wjc4ay9mK2hqM1FGS1RZNjh3KzYxeHZUMHI1K2tTWWhIdzE5QnNRK0JQV2FR?=
 =?utf-8?B?RldwdGE4RU5DejNkakRtREZaR1lNV2h2bFRDQ08yV1lxN2FmQ1MveWtneUNO?=
 =?utf-8?B?amg1S3dZZmVCVE1Id2VRdzBQZTJmTXZOSmFZUkRWWncrbHY0NWlYYjZzNEdh?=
 =?utf-8?B?K2srT3I2SDFSK1dCMFFuWTRmNmpLU2tZSHJNemZQZ0kxbXBya3R1SHF4aHBt?=
 =?utf-8?B?QnVUN1lydWY3ckFETGhQdXQ2emVFRFU5YkJ3Z3g2VUZ4V2VNRit2ZUY3S3pU?=
 =?utf-8?B?NzZadmJvRm9rVXBLSXVqb0JOM3FtK2QyYVM0a0xhSFR2WHBzampGdjc5RnNN?=
 =?utf-8?B?dEVuN2llbGtnWVl4YmdFL01UWGdYUXJVNzZFV3ROdTZQTms4enllSm9MVTNj?=
 =?utf-8?B?ZnFtOHpaQmZBZW84ZS9SUmp1M29xcGtzTjVQNWlZRWpPNyt2WndjaXM2b0U2?=
 =?utf-8?B?MTZDZU55K0luYW5WOGl3V3Nvc2g4STAxcm9RcDQvcWloRWZaSmRBdjVoSVR3?=
 =?utf-8?B?MURISnF2L0RQdkpBaDN2VnE2TnlGaHNsczhqTVQ4REpuRURBeCt4RnNWNi9Z?=
 =?utf-8?B?VXduYithTnBwTFBNMStuUTBRRm1Mb3ZnR2UyTkdtVURGaGVnT3Eyc0tud0l4?=
 =?utf-8?B?aDBYcUwxUkVpMyt1QXRwUG1UL2FCYk5TUVZKR0ZITHE0bVN4T0pVRWZ6c2lY?=
 =?utf-8?B?RklNVDBSYnk3UWwvai9QUzFzMzZtajRFWG16cDJSS2hHNnlVRnBleTNzdVZJ?=
 =?utf-8?B?ZC9QUFU3bkIzc2pUUEpYTFBuZ1pTUUVuSGhNYko1YzRVem1UQTdvd3lla2Mr?=
 =?utf-8?B?elVXeitkVkIvRnJjTlFGTUFEajBCWStqWkhEQXVuNXhhQmdSL05MQ2JWd1lO?=
 =?utf-8?B?ck8rcUl0MmdVZkdQdysvTkdRT052dzJMRm5KUTRHTURkWi9jNFFuSkVBVk9k?=
 =?utf-8?B?WVJQL1p6R0NNQjlxK3JxUlZYd3JDUWNFZ2ZlS1JpWE9BUVdHRlJNaGY1OWxt?=
 =?utf-8?Q?qwlUmr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHA4QUtJdE1qNWovMmFzYmpiZ3lYSENGYVVpTmlqQjJTQ0pOUktIQjE4UXdG?=
 =?utf-8?B?V1A5cURZQWl0d2FUU085WEtRdmQxRmQrQUw2MFp5OFo2TS91TWxLblpPWFd0?=
 =?utf-8?B?TkxndmxZUEkzQkZIdzR1eXZlQ084Q2FtdVI3dTZwVFd5K2N6MmhSMW8xdHVB?=
 =?utf-8?B?NnI1aVlZZDEvWWdjK2VaQURCSXVKbGdIcWZDUytqZ1MwYW1DYytPSnlsN2ZO?=
 =?utf-8?B?SjYvWlJ5NnhoeEZVN090THdzbW83cGNKRERrWVhUZGczY1A0dUp5UldDeHNx?=
 =?utf-8?B?aDJXakhveFVmSk85K21NWkR5S004OGZCZ3FESTVTaVJCYkhTWXN5NnBTVHdJ?=
 =?utf-8?B?c2dmcnVQUUFadlhEVDUySStjQzE3emYwU2UxTTYzWXlrWFVZWlRETFM0aGpa?=
 =?utf-8?B?QVhZNGlNa0ZpVi9Rb3hGSStGQ2k1dzhmRFJ1ZEp2YkQrSWdSSjRoeEFGTVEy?=
 =?utf-8?B?SU1DN2RtZDRmMThTaUsrQ3ZmQWVYaWdzVnNqR0s2UEEveGsycmUrYytic1Fs?=
 =?utf-8?B?akhzVUpmSDFmMURHbFBtRTAwK1hVZm5uSHFCeFMxeFVONmR6bC9aUDVLeFhu?=
 =?utf-8?B?amNENmxDelFvcG1CMExMSmFtYm45Wlk2TzBNZzhMa2ZRQ0N3cXp6MlFqTUJi?=
 =?utf-8?B?d2lucFo3VU8vWnNGdVpjS1VyYm9wd2ltOGJYTUIrZTIzOEZYaW9lYzUvblFR?=
 =?utf-8?B?Sk5TR2lrVHMyenBLZDNqeDRTTmdWMkxqTzVaNkNmL2o1dnUxTHphNjgvS2pY?=
 =?utf-8?B?SWh5aVdMRW1oNGpRYUhKZnVhQ2l0d1BqSk4zSStocmpuRUN5eDN6U3hrTVRL?=
 =?utf-8?B?NXVPdVpJdFJOMlNHaGJsYzVHdnJ3MzZHVS9FbXBiMjNkZkkxTHZwVkRzaFRS?=
 =?utf-8?B?a0llS2JSVVl3ZDFBTkIxYlozenFEcEQzSkExeU42UFhCMENodzZ6QzczZnQr?=
 =?utf-8?B?MlR1UkxrNlU4M0tGWUNVOHd1TUxhQkpZSFhFLzNBeU83Q2hGSHAwRFRrdVRm?=
 =?utf-8?B?cnRVdFBTN3dCOWVjdmI3enRlck1za1ByY1ZEYlJmRlltR3M2ZG15Yk9TUXNR?=
 =?utf-8?B?b2dScTdWd2tUVFQzTzNOQ3NSUzJkZVRmRGVsN0RaS1pDUTZ6cDdlcytiVkQw?=
 =?utf-8?B?ZlJTeEg1d1IvUnRIRFZZNXQyWjh2TWxQdExZaTBXSG1NUk0zMDVHRXFwNDdL?=
 =?utf-8?B?NEN0MThTcVlCU1plSUVWSVFCOTBSZ1UrSXVVWU9aWGlkcUFKVzhjeHRkVkZL?=
 =?utf-8?B?UWczZ2RWQ1ZyV1ZpejZnbWpQTjZ3UGY2RGRZdllyckY0b0ROTCtYckVkT2hC?=
 =?utf-8?B?L0krZy9iZGZsZ21JZmFKS1UrL3pTSVMwQVUwU0dJdFZXZkR6LzNRRVpmWGtw?=
 =?utf-8?B?QkYrai91dE0zNlpOYVhWcWtyb2lYb0ptTERaM0dQWTRRTEQvYjdIMjN3cVVJ?=
 =?utf-8?B?aG90K0lUa3U4eUNha09WbXhnMWdWTHljRWtaVWZFVFNvVm8wVGcxcVJLNEtS?=
 =?utf-8?B?b3RmeTcxclRDNUZRNmNkVWFCMWVNaXFmUzJOTjZJQVg2RTM1U3ZZWW5OaXdy?=
 =?utf-8?B?VVVWWGVIRDIzNklHRGYwNXZaSk9PeG5UMlJWRjkyWGRmOWJmazJZdTBpWFZP?=
 =?utf-8?B?M0pWWlc1ak5LcHdITVEyQzZCNHhiN083MUxMcW4yTDFlQStEVkVmZmMxUVNv?=
 =?utf-8?B?dWcvVFhlY05XQXFyb0ZnalViZGR2T0JCa2Q1bEhVakpOU0pGbXJCbVZtRzcw?=
 =?utf-8?B?cm1ZZ3V0OXZPcGQ1c0JPbVk4NkVlcGFyZmdOUGtHNGpEV3RseGpFZHhsRDMz?=
 =?utf-8?B?eVRrSitxdVAvSk03N3NobkNZL0gxWnp0U2VSN2ZYcEkya3Y2Wi9QUzhEU3dI?=
 =?utf-8?B?TWwzSU1pUFlBVVJzYnhyTC80NnlPd3c3c0g5Y1orSWJWTTBTYzZMQlk2QTdW?=
 =?utf-8?B?WXZ6cS9zMTNVdEl4N0MyY1R2UWh2TlRLTGFCODM5QkxaaDBNeXY3SmJYQnNG?=
 =?utf-8?B?S3ZJMEdIWGZmTDBzd0dRbEE0dGRkSUtSOEJDb2I3TXJoTmlGbGtFTElZVHI5?=
 =?utf-8?B?NmJtdjJQUWU2ckF1a0xGdU4zY3JPT0plQXg5aVRDOTVtYmRLNjlTV1Q5dzVR?=
 =?utf-8?Q?c9M5NV1Abs2ZywOKy/HvhwBsl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab79c417-6502-4f84-3fa5-08de3d69c404
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 12:42:40.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57rAthcitROTGrfGUwKP5a72cWFbTLxXnD+PNsoLS+xaiXhGpL5ei9lDMpZ8tBz20MPVZqFpvpWaL0GZrOCkpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7508
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_044250_452825_A01D4ED8 
X-CRM114-Status: GOOD (  10.22  )
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

Use dev_err_probe() to simplify code. No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/soc/imx/soc-imx9.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
index 0b1c59c7ddb244549bfeedc47ae6e8d83c20b39b..d9a686299c5f710bb9988c55ed601fc9d9f19229 100644
--- a/drivers/soc/imx/soc-imx9.c
+++ b/drivers/soc/imx/soc-imx9.c
@@ -31,10 +31,8 @@ static int imx9_soc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	err = of_property_read_string(of_root, "model", &attr->machine);
-	if (err) {
-		pr_err("%s: missing model property: %d\n", __func__, err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "%s: missing model property\n", __func__);
 
 	attr->family = devm_kasprintf(dev, GFP_KERNEL, "Freescale i.MX");
 
@@ -46,10 +44,8 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	 * res.a3: uid[63:0];
 	 */
 	arm_smccc_smc(IMX_SIP_GET_SOC_INFO, 0, 0, 0, 0, 0, 0, 0, &res);
-	if (res.a0 != SMCCC_RET_SUCCESS) {
-		pr_err("%s: SMC failed: 0x%lx\n", __func__, res.a0);
-		return -EINVAL;
-	}
+	if (res.a0 != SMCCC_RET_SUCCESS)
+		return dev_err_probe(dev, -EINVAL, "%s: SMC failed: 0x%lx\n", __func__, res.a0);
 
 	soc_id = SOC_ID(res.a1);
 	rev_major = SOC_REV_MAJOR(res.a1);
@@ -63,11 +59,9 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llx%016llx", uid127_64, uid63_0);
 
 	sdev = soc_device_register(attr);
-	if (IS_ERR(sdev)) {
-		err = PTR_ERR(sdev);
-		pr_err("%s failed to register SoC as a device: %d\n", __func__, err);
-		return err;
-	}
+	if (IS_ERR(sdev))
+		return dev_err_probe(dev, PTR_ERR(sdev),
+				     "%s failed to register SoC as a device\n", __func__);
 
 	return 0;
 }

-- 
2.37.1


