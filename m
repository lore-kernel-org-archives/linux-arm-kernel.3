Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDDFD4415B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 09:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+wjKYbPolJiBROWwpwzPT20pQBjpR2bCMVWhWIAHTo=; b=dogi00p38rje6LoUK1ExycnnCZ
	oKk+2A5hgTFcetqexDFwhTMUnLOSzqLa0CSfD4MGIgXRql8cxy2zxgtRTKfXyqIyPLEj9GcbLqhDt
	OLcXENHo5v4fC926K+DocD6WcbCdDN4WerxkBk/bea+d1eaI+vfvk6nA1yIyMqnNUlT2oYpQdiPpS
	yk8W4o7GyBcLikDrLNj63hlbFDT4QLOjjXIj2B9KOxT3Q8cP3KJZgGhPLKaqFhhCfDw4R6sqCi85+
	M6Gfv+uN75cyaI2XoYslUH4RLnyz7kJgXJInbp1pL9kdo1mVA/SXO9KGmORRz8Pyx/b32uS3dFGyq
	8Rx4AsrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzua-00000000Nti-28Qo;
	Fri, 12 Dec 2025 09:58:08 +0000
Received: from mail-northeuropeazon11011029.outbound.protection.outlook.com ([52.101.65.29] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzuY-00000000NrG-2YAv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 09:58:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mt/J7jyLq+C/znoGj0ZBwBUVNoVJo4pTelPZ0cZNyL/SwGsoepUm9zxTRWcNz7ChDaT8N3nQe2P9k/myE7sDu49HAgSLHKv5GDswROlmcN4cj6aP4IVJV0yiK2rKjf8jvU7Qxy7owh91W42V30NDNH28MumWUQHHFZzzebxYropMqqTFD+ggZieVIjtJmpmOWGrF93q0Pwtax8wqxTjx/6IvCfMwEIcz4DRZpEqvwKF/auk4ci1Q9adn9KFVafUc2pkjzotTE4lYYBX4OJvrhTb2lAcEv3pQByHMZ+ekuJw1UaAhv5VZ7LmiR3mpIVgughovq5BSWLgj3Nmkj7p4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+wjKYbPolJiBROWwpwzPT20pQBjpR2bCMVWhWIAHTo=;
 b=mz0YRjFVY/m1PWoFePN+/9t4tZyh0KusS/DOiwPd9a0p6vVu/wKyO++58zKrvyEjTtmmsuhlAhFdS0y87zmG1ta+gAazBjW3bMHYiEidr1Jpc1StSXdHGRCbdweUATtIr/LqzWDgMtoSynSNb4RYNTobekxQiPqtuIzB96nmzLdU+S37esepUaoxkM8pceZ7fdBUDZPLOiIGyELMHqZtKDrwQU9IR0PiGHobib57pjf3BH6oIPV6kaefLWpkYngtrE7s083ByzByT6YtI6aN9861fyTklbQSeJjX9Xv8f+TQYlkCfbd1bGUZtpJXL5HVpSfM2Sg6QrxWmI4QsFs9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+wjKYbPolJiBROWwpwzPT20pQBjpR2bCMVWhWIAHTo=;
 b=ESDriO2v068fDIphao7dJ5RJAOtxAG8SN4yN8QuGZJRZUTR5HDDyaP7pmDrqFIs+cAJPQ+VyVj5rWLz9qYI4GBZqOnx4PTUZCC2x9/hXct6AujDiPFtWmGzRM72Dlg0dq3qUaSUPAp0jhxZ/iOglHbVm9cMppd2ln0GwXsCBfIS25Pi9vNyHOZozsgZuGjEd4dtI4la/xBS+3MVHICsH2ZUNB9duVNlqRWW6rijAgrHAXDnylVDswQQK/tmYnwbvn6hIlxVDdMNVHrn3Q50aCJC9MPrTTMdB8IlND99sXmRWr/zRmRi0rz5CrIScojGqUANGWvtDfGObXENhVt9T2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB11501.eurprd04.prod.outlook.com (2603:10a6:800:2c8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 09:58:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9388.003; Fri, 12 Dec 2025
 09:58:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Dec 2025 17:57:21 +0800
Subject: [PATCH 3/3] arm64: dts: imx93-11x11-evk: Use phys to replace
 xceiver-supply
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx9-can-phy-v1-3-a421d7023e13@nxp.com>
References: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
In-Reply-To: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB11501:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c388444-8445-44e2-c11b-08de3964eed6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE9nN2RyWGxSdDdHNkEvUDFqWEZQT3FJUEJtQkJrQWxManRFUCt2a1FETUww?=
 =?utf-8?B?U1J0NzFsZVR2UmFQQ2JxcllLZkJ4RnVrQmZGRFNLM1BCNDQ4RlFYOGNtbjVt?=
 =?utf-8?B?TFJjSVh6UEdLajVOcU90WmlvZVpDSnRPL0xUenBZcXduY1U0RGZ4OGhOZGhh?=
 =?utf-8?B?ZlRLLytzSDB5ZVVUUHdLaXRBK25yTUhNSW1mSzVRdCtJL1F2Q3d4T21DRVB6?=
 =?utf-8?B?MEwzbVI5K1lyOVVDQVRXR1E5NENaVUZlL3JjWklnYTc2RkxyM0grWkxHTDlO?=
 =?utf-8?B?SmVWZCtSbGRXUFVrbDlQdTVsLzZ2Tk9aTnlydXl5V1RjdDhIdmZncUtPRHA3?=
 =?utf-8?B?QlkxNmlWQ21FNklWNEt2SWxlbWRqcjhqMnVMYk9oNkw0bEFYeFQ1MExWeWZ4?=
 =?utf-8?B?Myt3ZUVrS0FpdTRoMFFZMXE3NVBjQXV3WjAvOEdtbmptNENHTm9rN3NKaThV?=
 =?utf-8?B?QlJkM2lRRGxNQS9mY1dwc1Q0UWdlbGNjeTU4dXFVYzI2dUFObXV2a1BlVUVI?=
 =?utf-8?B?QUVPTXJWNTA1Q3EyMVcxQ2pBTmVNc0IzZ3VnRm9VRHJjU2ovcGdGRWp3S0hS?=
 =?utf-8?B?ZjFFYThQQnc4SDNHZENwZnBJN3lOYXIrb2tVSU95eEk0c2M3M253MERGM0Ft?=
 =?utf-8?B?anE4bnlFQmJpMS9kQS9UczdZeWFUeEdMYmtoSkk2Tzk2QUZLWmtnZWw1YkQr?=
 =?utf-8?B?aVU4M09jNEtwbVRoZlh6NytIOFZxWXF1TDNpNUlDTzV0RXJiaFZkcktZZFRz?=
 =?utf-8?B?NS9MQnNvV0R6NEQwRnVXblNYVWZRU0Z3Z0pkNjFqbE9vRjUzM1g3Wm5LTEtp?=
 =?utf-8?B?dFZLdzZXMG84bnFsbzFDREN2MUNna3pFSjBSanJkU0J2ajFMVEFiY3NQWmJT?=
 =?utf-8?B?ZXVCUFZuOWtTMTZxYlJMZ3Q5MUxUYndiN1VsN0VCMmhsMVZRVW5rZ0h3cDQv?=
 =?utf-8?B?ejZnUnhGbkhKNXgveXE5Yk5DL05PUnF3UWVKM0xSKzRLajVSaWlUSExvWUNS?=
 =?utf-8?B?UWgwMGU5clZzMXR2Z2V1bllMNm4zZXFQNDQrZUUwWUpTLzhNYVZTblg5Rm9z?=
 =?utf-8?B?RjdTbnMwbDhlNzlGa1A5TjcxMGpoMkN5ODRmNVQ5Znhqa05Pa2tqd0R1eUsv?=
 =?utf-8?B?b2ZZRFZyMDlIbDF6OWg3L0Izdmp3c1QrbDU4OEkyNjhaTFBKYlVQMU94bWt3?=
 =?utf-8?B?OVNqZ2ZqVWI4YnloL3FBN2hpekxWU2tsa2JVNXpiMTZLR2FDcVNqZnNqcVhP?=
 =?utf-8?B?a0wwSm8yd1NpNE1LTlppN0QyTmtqWXQ0UHdQUzZjMEpyaFA2VG1rUjNSaVhX?=
 =?utf-8?B?YWUxWWVBK3B6SjZINUdHRnRIRzdZQ3NHYStuOElGcHlzY2EyMzAvTnhvZXBp?=
 =?utf-8?B?VFAvam9JWmswQm16ZHJVb3Z5WGp6bFg5L0NNS1FkS1FmQkp3WGdxaDZyQU1E?=
 =?utf-8?B?bnhlbjkzRnVSbWV2MVNSS3ZTajZURnFreHl6VDluYi8wUGpQZ2VtVjdzNllv?=
 =?utf-8?B?SzBkZ1BwMFBJOXMvN3lqRkpXcURCcTV1aEZZTTJycGkyR0hpNzk1SmdxUFcx?=
 =?utf-8?B?ekxYTTFyVHZGeVpZNXZ6UXRWN29JYjRvU0lFR25HRUJKMkx1emx6eUdZd0FX?=
 =?utf-8?B?QUtkWXhReUExa1JFbCtudGVpUEVid3ZiMk01aUcxY3hWTEttVjlKR0Z6RE9W?=
 =?utf-8?B?L1ZjUWNXWlVNRTZsUFk5ZmVUdlg4L3dKSW1HZ0J4em9rQkdsdlJnbWZNMm5u?=
 =?utf-8?B?a0VtTDI0emZtc3kxNUIyV3IyWk1TTkU3QUhVTWthSytIelVrWEJkNTFyVUF3?=
 =?utf-8?B?RzJIL3VwaHhuL3pnbXlRZ2xRa1lJWVFpU3Q4MERVUnpvN2tuVlZzRXFPeDd3?=
 =?utf-8?B?ekxOSG9OSXBIZTFYckd5anNZbWFXd3BYbzVFcEFLdG9QNHJCRzl6NUoxU0FY?=
 =?utf-8?B?K2ZCb1ZpVks1dWxsTGxFdVg2N2NFRGFNNzlHVGFDcmdXeFZ1aWRaTXE2b2Fu?=
 =?utf-8?B?cHpZTDd3MjhmV1ZlcVBmNEFac0UxZ0FTYitYNjcxWk5MZlVuWHU1ck9IUDMv?=
 =?utf-8?Q?NF42qi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVhMaCs5UlB0S243NUhGUHc0TGhFbXQrT2t1TGFiamdvRU12TWtOUEdwT3dP?=
 =?utf-8?B?YngvWk9FOEhvcHd6bGVZRW52TzRiY0xGZUFsZ0xvcEFhWUJxdjdhVlFqSzhx?=
 =?utf-8?B?bEgzcWx5YXV3WWNQR1ZTK0prTXhjT0VJOFpsdmk1WGVvWDRyamtOM0R3bEZO?=
 =?utf-8?B?cTVBaS83UlJ0cGpHamMxRS9rZGRzZlgzbkJkRkh1ZnkzaXZQeHJkU2hSRndI?=
 =?utf-8?B?YjVrbFBtbkN3d2dXendGVE5pRmZVRnJ4UGJLSThaeUtkUEVPTTFMS0VTaVA1?=
 =?utf-8?B?d3BKTzBQTWtlc1gybGZtVE90ckFYMVlkaUF2OThTTnZHQ0MwTnhJdkF2SnVs?=
 =?utf-8?B?R05tNjlyZndLbm5rT3I5TUtJZWxocG5sc2VFT09vNFJydXRPMHpSRy9VZnpm?=
 =?utf-8?B?Wm9HNHR4YmVCMWJGTGx1akN3ak9lWUpYV09YYm5ucWVHdmNINWNTZzJXdGMx?=
 =?utf-8?B?R0I0VkdHZmtyNEJUZ1J6WkpXemlaenkyMDBmNG9zSVpqZm16SGE0cEgzT3pB?=
 =?utf-8?B?SHhVc2R4SVM4UjdOTWdNTTNlL2V4ai9lbFJoWTJhNEo4bUdhT2QrUnQ1NmdJ?=
 =?utf-8?B?clQrL3ZVY1VJNFBRS3M1d05LMkFaYXEvZzZYRHRzNWo1MkRBQlBNQkFTVU42?=
 =?utf-8?B?Vld4NCtiTzRKN0trbzRpQkx1cVA3RG5hWm53ekNwdmgzTDJHUHFFWThCWnR4?=
 =?utf-8?B?cFZ2UDdFU3VXR0Q0dzM1cDQxRHZZMGIyWEE2eDJuSnpjNjExaGdJNHVuYnE1?=
 =?utf-8?B?c1Ezdm1ZVkpmU29kcTNQVWFFT1BqNEdwR1B3aFhVeVN3U3Y2OC9RR0NLUW04?=
 =?utf-8?B?bFVNNE9CUjVXRCtlVmpDZUJuaEVvd3JRcnpGL3o5Zjk4NHRNVmdDOTZBbnFY?=
 =?utf-8?B?V1Z2MllJOXkwQ0tKQlpXTzlSa3BaMzMrdnN5WG00YzlsU3ZiTVgrQ2pwYWdq?=
 =?utf-8?B?cHNJUER3a1pqWGxRK3ZEWDJtSUhzd0JnNTc2bmNpSE02YlhWNnhFZzJQTXE0?=
 =?utf-8?B?YlR4eC9GRGdlakFMSmZ0WU5BUHo2ZEtrZHc1Z2ZlRjBkVEV0cXBvcGNYOUZi?=
 =?utf-8?B?NTd3WXhkdXUxZzA0Ukk2a3Z1TEdDNkNHRnVDcG1UdHVDRFFmVy94QkFNUmN4?=
 =?utf-8?B?M1F2Zk1EM0RvU1Y3T29qTVpYVkhYV0E1a2tNcURqSWZQMUxPYlc2cUI5SUEy?=
 =?utf-8?B?bWpZY3V3YlI4ekd3WWM3M3NscHhWVDcxaE5xMThvWnZ6YzBOM29OZDFPckZD?=
 =?utf-8?B?MVduVy92T3lpZVhzU092NnI2bGwvWVQ1MS9QbEwvTmtWR1N1QzhIODdadDRh?=
 =?utf-8?B?NGxmYTE5Wng3S3NFUDJGN3ZVNlVqSFFwbHo1QkZFVFZkdjRnZlJ3TXBQQnNm?=
 =?utf-8?B?K2dWN3BoTm5Hc0trb1ByTDZ0KzhRWEJxdWl6anoyNTY4Z2dCc2FteFpqNGg1?=
 =?utf-8?B?bjIydlNtaEF2Nlh0Z20wQlArdGttcmdKZmYyczhHUkFRY1F2YmRmWjdERndV?=
 =?utf-8?B?T3BmeXhGQzBjMmQ2SU44RUtLdTl6VndrcHEvMk9ReTdlTnY2OGdaVG9iKytZ?=
 =?utf-8?B?aEJKZXpNSzJsbUJjSmNDa1VVazdxVzRTQ2FJak9oYkEyNi9UckZqMXJhOWk3?=
 =?utf-8?B?cDJEOTRpOFNhTGk5T2RNMUxBMDZWaVRwWlQzbzBEcWFNYXVLMTRHVkN6eXVv?=
 =?utf-8?B?b21xV2tqMjd1MFJZMzdqMVYxVkdrZk9xNzQ1TG1MeFMwOG4wZEJsZW0vQVFZ?=
 =?utf-8?B?YlA1RG5mcUtsUXE0Ri9BQzJZVnBLdU1hcEl4c0xNZGVLMzF5RlJzM3pxQitN?=
 =?utf-8?B?VGxJdUZ0ZDdma1U3cGFob1VHaG8rZVVXZklZWUprRG1kN0h6RkFGOU44YjBH?=
 =?utf-8?B?NjM4c1oyWmhXbXh4c1cwUDJQcyswbkIvOElnNi8wM3VGaGxHbzltbmpLV1d1?=
 =?utf-8?B?dWVlTVUzZnlqWmFRSkhUaWFkb3huVkhMWGlVUzdBdFhkNHVFNjRsaUgrdWQ5?=
 =?utf-8?B?dUV2V0crTmRDMitQd0wxeVJ4OTZuR3I4bTdxN1RPcldFTHZUUVVRZnFaZHU5?=
 =?utf-8?B?NEFUdWlpYmczRzUzeDlnQkYxZkVlVTRIL1NUc0JyeklsV1gvVTFOcmErb2hj?=
 =?utf-8?Q?czkEJ7+Jgbmjbu7xYLeKDoEDO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c388444-8445-44e2-c11b-08de3964eed6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:58:00.3628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CelcaQ4Sn1YwANKHXw4hj9iOpKIaD4CumQZZkQo/kkcdzB/aCuAiekJNKLCqqurP7iM9kvvmRcfLIwya7Q2avg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11501
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_015806_659059_98D56D1E 
X-CRM114-Status: UNSURE (   9.77  )
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

From: Peng Fan <peng.fan@nxp.com>

The TJA1057 used on i.MX93 EVK is actually high-speed CAN
transceiver, not a regulator supply. So use phys to reflect the truth.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index b94a24193e199b266943c58466f4f620e81480ba..8dd5340e8141f44913be8167e85337f179f5edbf 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -81,6 +81,13 @@ vdevbuffer: vdevbuffer@a4020000 {
 
 	};
 
+	flexcan_phy: can-phy {
+		compatible = "nxp,tja1057";
+		#phy-cells = <0>;
+		max-bitrate = <5000000>;
+		silent-gpios = <&adp5585 6 GPIO_ACTIVE_HIGH>;
+	};
+
 	reg_vdd_12v: regulator-vdd-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_12V";
@@ -106,14 +113,6 @@ reg_audio_pwr: regulator-audio-pwr {
 		enable-active-high;
 	};
 
-	reg_can2_standby: regulator-can2-standby {
-		compatible = "regulator-fixed";
-		regulator-name = "can2-stby";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&adp5585 6 GPIO_ACTIVE_LOW>;
-	};
-
 	reg_m2_pwr: regulator-m2-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "M.2-power";
@@ -302,7 +301,7 @@ ethphy2: ethernet-phy@2 {
 &flexcan2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan2>;
-	xceiver-supply = <&reg_can2_standby>;
+	phys = <&flexcan_phy>;
 	status = "okay";
 };
 

-- 
2.37.1


