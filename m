Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4933BC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMntrNDt4uf3nylEoQt5BkoO+wskEGqCv9nSD9K1cPI=; b=XVpUX9qzAlYzg/j/eiNnQ8P/d2
	c/Uag/aG+ZgeajJlnfECCxvKPl7BaLiqYcOBwvru1rCuHBp73aQhucGGrelGOJPUH57PeTnYq3qmt
	+nkWqlcdfzK5siY5po4NbgkMb8KGbOpZizdNXuvItse0sbv5PfXdLiTAXR4ozB5JVUBaR6P5CSVIq
	QUXzgTb257oyUNTCiCo6ZMQniRFBgPBAazfN40WdRHGkhlNYNMejp1AD3s7npQSS8Vgu7t8o1VmIX
	rVh60+mOVANAij8V5U341+3f9bxyYPApIHoX/oKzWf0IqmEJwT0FbBwDUY9+f8bW6eu+IP0kj9SDp
	309ACi4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUyq-0000000B45I-21uK;
	Fri, 07 Feb 2025 20:29:40 +0000
Received: from mail-am6eur05on20604.outbound.protection.outlook.com ([2a01:111:f403:2612::604] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUEE-0000000AwJl-2EJL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:41:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hqci1JKKSm2gLGLIrzOCY4R4KI126wu6vgO80RrwngSM1qHeuELDVnHTOsASE4ZHlbrRl3DJ13IaFUWZ2PrE+d0TkbSzzCQj4scSKOE8STQnvix4FSOnSQZu1B0Z7z0OefXvK3jyT8VsRxAu2mi+S7hpdKQQcrnUTbU3E5S8t46IqTDGMgfm9M/fHuCq0Cdj6KMvzQ/XSYYp4iT+Ar9Vm8z84dy7ZvrvneUaPFKXCnDX8tcOhDF5uwKtQOW1StqqAeM94Qrm3iDWKH5W4ocEEV/2TELfb5iHwi7FS8O1F7QNjECnJbC1brbpmV1SBEbdhSKngdrsg1wCXxZ6zGL9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMntrNDt4uf3nylEoQt5BkoO+wskEGqCv9nSD9K1cPI=;
 b=ZC1QNvTuMk/w77CISseMB2qLaFR6uosEOwQ3erj/W3q78k5Grw7zkZoixxJWbqir917cJT6KapzvzOZ4A+sqREHXvaWK3IcZ2fQBLxgv/FTko9pp+gyqJe9eUn6/DmpbFIUc63EbKvl8vXhnyjy492ZQOkFnlVMQoUbKThT6OkSabvBKkXy6smW0OFWgg5+5KRgQKyWptgBfwnLJ2DFIsAPeKYG2pzzU6sDkCCKJqxPlTXQzs+HPOhvCwJ0d084s3flvmg1sFiGNQxZCRN9vLKKtYTl9WYG5zfZLuGo1bjHWYq2WzNsTtd7ei0NqKD1KWzdBLlJLazrprB/JVCpGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMntrNDt4uf3nylEoQt5BkoO+wskEGqCv9nSD9K1cPI=;
 b=Es/b5eaAfWzDcvuzohxuzNJ35vfOxL1scAh73hyaAQi5kixoWRACn2u7D1Pn/aJmr48gYiiU5+YmCVYPH39v5aFaKRQ0yYe/KP9CD0tVIwaBHf1hUmivBrNlv3DtKKp9A0lvplDqThxKKnMUP39S2zCmp8ETloWbBWeIKu/lKfgmk6uspgt/yUOi54rzKp59Vyu2KGcPua/6+nnTCHlBe86RSEFeMZBxxNzlyuB3NBcVu6hLIbfjpei66HJslo0Cp616ZoyjvvgoRhRCO4H8CfcFZvCBQV0ds2K+23NZP+K7pZ+ikQSdjyyYQ3meS5VDOokrxaq/QcUKy45+ES/LgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9787.eurprd04.prod.outlook.com (2603:10a6:800:1d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 19:41:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 19:41:26 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 07 Feb 2025 14:39:52 -0500
Subject: [PATCH v14 10/15] misc: pci_endpoint_test: Add doorbell test case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-ep-msi-v14-10-9671b136f2b8@nxp.com>
References: <20250207-ep-msi-v14-0-9671b136f2b8@nxp.com>
In-Reply-To: <20250207-ep-msi-v14-0-9671b136f2b8@nxp.com>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738957203; l=6317;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=cBbHPYl59BqEWZgs9oM7up4sogl7vTD8SxSGWaSbPIk=;
 b=8xYctc3RMTYAqWd5KEHaWPd4uhdLfAkQ6WcjDkFLnrWNCsdDAI7ZHzQ8V43vBKYI3YHgxgOtv
 ML2YCZMRe8VC6SJ6z5Nw1/PsDVAg+Yl4hcpiH9pnVRN83JIGD8I4bF3
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: ab585e30-19a6-4dcf-cb9d-08dd47af693f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzlYM210YWU3YXVscjduVDBPRlM3M2FDVk9lWUx1bjZUYXpnOHNrMlNSUUUy?=
 =?utf-8?B?Q2dvdlVXN1l5ZXBuQUMzK01zQlVtamN6N25Ma2I0SFczZUhVMUtaYXJoZDln?=
 =?utf-8?B?RzVjclU5eG1MakJJNWZkL0ZjemtFbXVVd3RaVzRXRmNIWExFVXBnbFZIcjFM?=
 =?utf-8?B?QWR2Z1RHbFBDWnBSWEdvWWFSN1BOUXJpMUZNaWNHWjhJdE1rT0xmWE9KaklF?=
 =?utf-8?B?elFoU09qd1prVEk5S0tBdDdvSXVVQnljWVF4bzNCU3hKUmRvMUdGck5wRjQr?=
 =?utf-8?B?a3FEdm43MkhEamt5SWdmTWVoL2FLQlkwL1R6MVVOV1p2NWt5K1I3OXk5VVlz?=
 =?utf-8?B?Rkp0L2pBNDQveFVlbmZQVThleEhVOU9sQUdmMXlvem9VRGV5cHd5ZzVUNTk1?=
 =?utf-8?B?QldBbjZTSlB2NElIY3dxTUFuVWJwY3BQT2gwekdjdjdDeTJIbWZRQ1ppRGFu?=
 =?utf-8?B?RnNvNUNnaHAyYWhnNkpCL2JYM0g1dnBEY0Y4T0hyYnB3aEVzdTFqY3ZyZFVw?=
 =?utf-8?B?eEVSK1VkRTNFOG9PdjJZVThpbDFrRzZ1SjRNTHR6LzJuSUNiMUxEY2FnUTV3?=
 =?utf-8?B?T1hnVXovSENSUE8rL3dKOTZnU2k2VUN0NTFLZVRnNENFcisyRWhmb3dhSHNI?=
 =?utf-8?B?cFVYSzZ1MWVQL29adXJoWTAzTlNacUxsa0Q5Yi9pdmp0NDFNV2dQMExGQjNE?=
 =?utf-8?B?R2VTbzN5REZhdVhyQ1VZUTFkYmQ3QUxSMTBuVVVOLzVpWGdmUGV1TkMzQ0Fp?=
 =?utf-8?B?RUExeHdTZjAwTjdsM0JlV2ZXSXpqekhGNWlvcjJUdXlsc09Dc1FKV3ZEVS9W?=
 =?utf-8?B?VWlaZ3dPQmx5UXVES0daNlZQSU5mMGREMU56akZwdlZyMnFlREJRZEV0WXBM?=
 =?utf-8?B?RG5yREVuNmFZN1poTG85d0FQTFlyWGdkcGtjR25PYkNtSzhYZ1AzMC8wZmRK?=
 =?utf-8?B?RHNVaVR6eGczTjVoM24zL0U2MkM0cFB3WndRMDJCQzM0aVRIeE41MzVLZGdt?=
 =?utf-8?B?dGlOa2t3dHd6ZXR4MHpuY3dCeGMyOUJqelQyK1VEZWJTeDduOWVOWjFyNWlC?=
 =?utf-8?B?K2dOeEN6em1uSGMzcEFOSGJsa0JKTDQwamZZdEdBTEFjUE50TnhZMnhseC9J?=
 =?utf-8?B?cm5mME5ROGFLdzZHTG5ybmR0QkhuWU1FcVZZeHlUOGh6ZEM2WE1zUjAxZ3BN?=
 =?utf-8?B?bVZSaWVYQTdtSmFNWWFncmE5K0JNMkd2L0U5T0o1c0ZxTDRicnZyK1QwUjVE?=
 =?utf-8?B?Rjlld2VObFc4SHU2MVJLTnIwZHIrbk9CMWY4dWZkbG9hRDI4ellPOU04YUFx?=
 =?utf-8?B?YzBVZ2c1bnhWK2paSUFCQjM0c1IrUlR5dUpmZlY5dUx1V05Pdjd0akdFSmw1?=
 =?utf-8?B?S2pXakgzZmlrQjNNeFlGN1JhRktyVGQyN0luM3hOUmFDZWE4aU1OU2tRd0wz?=
 =?utf-8?B?dGRweE1sbWxoUWlOUzIwTkV3R0MyR25ZbWlMYzdTdUhISVhJd3dXWGdSMzgw?=
 =?utf-8?B?L1hNR0ZockJtRXk2enlhREdySWlFdHlWZlFkRFdlL1B5WjhjR08vUEkySG1T?=
 =?utf-8?B?dFVCTmpoNk16QnVMV0JhdDF0eXhGMGxCNEEvSzd0WnRBRm1KVHM3OVZDWFZv?=
 =?utf-8?B?WFJpOHFnbDJWYzlIMTh0WnhocHo5RnFoTDhVR0ZmNTVLOVdIN3FuQ05qSUdz?=
 =?utf-8?B?VEVxbVhvZ1dwVE9vbzJkcDN5SzgvV3QzWVJqeE9WMUs4YUtUVTB2R1FCeXNH?=
 =?utf-8?B?NG1XcmltemlDdVl1clF0YWVvQzcwNEhFR1FacjZWSExTUTFibzg5NGhkd2hX?=
 =?utf-8?B?QkwrcUpOQk0xM2crOWJNeE5JeFFFNXRtd0h0dFcyazFxa0lFRXdnN1FmYzJJ?=
 =?utf-8?B?ZlFqVGNlbjhobFhBNG5PMEJCQ3lZMHFVTzNjbGIvM0U1TmJRTUp5YXk0RXpz?=
 =?utf-8?B?Tk92dWNqMzllUS9jOXZaUTFJYS93UUZUN216c2F3M1ZXVGNyWWlYR1JLQlo5?=
 =?utf-8?B?TmNIWmhYQ0l3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1V4VTcwc3FuTmNJeHNiWVBodTVOVVlaRnBhKzdEYmgxYUNSL1FFT2l2MmpK?=
 =?utf-8?B?blJEeHUyVVFZa2RkQURyNmI3Vzlmb2FxdUk4UHl5ZEhTRmZxWjNZSTdieGxG?=
 =?utf-8?B?ZGliZjM1dXVBWFhGVHJJeTdvVGpKU2J2Q2xxNzZob2Q2dmVrZzVhWWhPOC8w?=
 =?utf-8?B?SmYzdlc3VXVySmdmOHJxWEp6bWpta01iZ0toc3lvaUcwVGUrTDVrZGxXcTFS?=
 =?utf-8?B?cTNUdFBwZ3ViTUkrWkk1dCs2YTVwVXQzdDVRVEJpSFIyM3p1eEM2ZVdQQmhH?=
 =?utf-8?B?MmZycStoNnlBQjh0UWJ5Mk83b2ZNZDkwOXo3WDcxTlEwOUppV2pXSDE0UHhB?=
 =?utf-8?B?THZ1YXRzbTd3RzF3VG9ZZ3VZdUFLaHNRbWEwKzFZc2l6U3VXWSs5dnFaQjYx?=
 =?utf-8?B?N2NUb2V0b0h5dTZUenZDTlNHVnQwNEc0dW5TWkgxbnV1VE41TzBvcVpMMjJV?=
 =?utf-8?B?V3BJY1hNNnNHaHYyZ1NId08yQ1dGNm9nNVVTd0RLZEhXcktBZjFXQ0UzZVZ3?=
 =?utf-8?B?MnhlUDU4N2pyZ2UwbmFhdmZYSWtJdTlsMW4xdkFqUmlHWjdMbE9ORi9Rdmlx?=
 =?utf-8?B?R25uaVE0b2FvbEZpUXdmZFJBcThSQkJjZnNjZVFoVzYzR0tQMjVEblE0SUlt?=
 =?utf-8?B?NmxtN01sa0RJekNzSnkzbkVBVis5THRBWFRtMW1MOVMrdUV1ZHVJMTZXYWow?=
 =?utf-8?B?VWhFWXhxeWJKK0UyUjlSakhkZGg1Qk45cDRwd0NndWlMN3kzeDBZT0ZDRUZ5?=
 =?utf-8?B?ZXo0U3V6d0dxa09qK2pDOFdZeVFlWnRRNDBkblY0WHpueksvemVEVzR0T25h?=
 =?utf-8?B?VmtjckpOUHYxN3YrQjJpNGR6UGNkc2dNSVowRFo5YlhKNGo1dHFsVDAxb3Jl?=
 =?utf-8?B?aVJSM0FSUHoxK2w1UE9icFBVdFRveTdwRVkyTUdEZkpKQWZLMVRaN2VDQkxj?=
 =?utf-8?B?M09xenJQQ0N2d2dvMUt3N0JKa2N5UG5TblEvbXE1S2MyVWxtOFlEbUJROVB0?=
 =?utf-8?B?VWpPUitXWlltZEU3Mzk4QzJ0bHRmRmVzVk01ci9oRFVVUWk1cGt5c0hzN28v?=
 =?utf-8?B?bklUOHg4S3R0eWRuN0xhM3FVcHhCNW5XemZmQjZkZnFtUmFab2Z3dUpNZkZl?=
 =?utf-8?B?QnBHOWtoSll5WnpvOWc3NjJSUjBLTUlSRFMyaHhlOXU4L0xmYmk0SzVFM1lU?=
 =?utf-8?B?SHpaZ2kzYUpVYVZMblJzSjJkL3FaR1BpcDBSY0NDdll5WXh6Y2xSYUR3QU8w?=
 =?utf-8?B?Qjkycm1iQ0NpZEc2SG53cE1mOFZMejZXYlkwYm9hL215Vm5hUVBBKzdtcVBF?=
 =?utf-8?B?OFpidk1TbUwzS0FsbXRRU05LVTdtOVVnaTZkUG9JaGdGcXBqMjY2VEoyQWtL?=
 =?utf-8?B?RUlxekpLdksxSG0yWVg4bFdKNGZncko4aVprK3FsK2VSN295eC9xcEd4UXBs?=
 =?utf-8?B?OVVGNUQ1S0d2cThMdkowU1FOY2YycHhSWkk1MUJvSlp4K3A2WU9JalNIaTJC?=
 =?utf-8?B?NjBWbGRUbGlOOTBXYXV5YVdmVXpUL1duY1cyWWY1WmFNUWJKbEU4L3ArNm43?=
 =?utf-8?B?WGFQa1RPVHZBZzR5OHdld2VyR2t4SmJnTkVxMFBKdDRmeVZvaTZnVGFLdzZE?=
 =?utf-8?B?a1hSaGovTGFxZFEveVpVc2QrbnZQOEVmRWhYY2xheWs2K0dFWmRQQjVISUwv?=
 =?utf-8?B?dHZzeGFhQUlweElMTDhHS0xDcnZINjc0TExucXVHMnNGTUYyVnNLcGMvV1VY?=
 =?utf-8?B?OWR0VHltWmowbldIb1dEOXlic1VKRSs2RGtaN3FCcVdzdFRubXVPQSsydzJx?=
 =?utf-8?B?cEN6WlBkNmVNWWxXZGs5QjN6QzZlY1FtQjhzZ3lRWkl3NnR0UXF2bmpUTzli?=
 =?utf-8?B?NFpjaVZIKzdPNkxXODdIL2RUS1pvVm5ISjdzMkp4dStOZDdVa3c1OGVUaFdE?=
 =?utf-8?B?azBKTEI0TXF1ZU5OSlQwYXhpbUNPV2R5THRjVWRobzFhWHZ5S0diU2VKSG5o?=
 =?utf-8?B?Mmx3RHdXZUNwS3oxTzhrRm1TdkxwZ1VHYjg1ZnU3U1dPdEVmdW9jSXFmZytY?=
 =?utf-8?B?cWtEWlc3bTlEcnFTWmhSVk9reG9lS3paTklsUkM0WHZIWnZ1NjQwbWR3NUZG?=
 =?utf-8?Q?MOTSggDQydb5CGGzZaEXPtoqG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab585e30-19a6-4dcf-cb9d-08dd47af693f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 19:41:26.8468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEk0384/YyJQIbjsikMahtUdVdEbDQxMi+XfvkzOOb9iV4aiwQJqr1hn92Kri1qb88nfJbTsmAcKLDV0flSRRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9787
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_114130_741928_F1781F34 
X-CRM114-Status: GOOD (  15.30  )
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

Add three registers: PCIE_ENDPOINT_TEST_DB_BAR, PCIE_ENDPOINT_TEST_DB_ADDR,
and PCIE_ENDPOINT_TEST_DB_DATA.

Trigger the doorbell by writing data from PCI_ENDPOINT_TEST_DB_DATA to the
address provided by PCI_ENDPOINT_TEST_DB_OFFSET and wait for endpoint
feedback.

Add two command to COMMAND_ENABLE_DOORBELL and COMMAND_DISABLE_DOORBELL
to enable EP side's doorbell support and avoid compatible problem, which
host side driver miss-match with endpoint side function driver. See below
table:

		Host side new driver	Host side old driver
EP: new driver		S			F
EP: old driver		F			F

S: If EP side support MSI, 'pci_endpoint_test -f pcie_ep_doorbell' return
success.
   If EP side doesn't support MSI, the same to 'F'.

F: 'pci_endpoint_test -f pcie_ep_doorbell' return failure, other case as
usual.

Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v13 to v14
- update to use pci_endpoint_test -f pcie_ep_doorbell
- change ioctrl id to fix conflict

Change from v9 to v13
- none

Change from v8 to v9
- change PCITEST_DOORBELL to 0xa

Change form v6 to v8
- none

Change from v5 to v6
- %s/PCI_ENDPOINT_TEST_DB_ADDR/PCI_ENDPOINT_TEST_DB_OFFSET/g

Change from v4 to v5
- remove unused varible
- add irq_type at pci_endpoint_test_doorbell();

change from v3 to v4
- Add COMMAND_ENABLE_DOORBELL and COMMAND_DISABLE_DOORBELL.
- Remove new DID requirement.
---
 drivers/misc/pci_endpoint_test.c | 81 ++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/pcitest.h     |  1 +
 2 files changed, 82 insertions(+)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index d5ac71a493865..7ac021bcc7152 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -42,6 +42,8 @@
 #define COMMAND_READ				BIT(3)
 #define COMMAND_WRITE				BIT(4)
 #define COMMAND_COPY				BIT(5)
+#define COMMAND_ENABLE_DOORBELL			BIT(6)
+#define COMMAND_DISABLE_DOORBELL		BIT(7)
 
 #define PCI_ENDPOINT_TEST_STATUS		0x8
 #define STATUS_READ_SUCCESS			BIT(0)
@@ -53,6 +55,11 @@
 #define STATUS_IRQ_RAISED			BIT(6)
 #define STATUS_SRC_ADDR_INVALID			BIT(7)
 #define STATUS_DST_ADDR_INVALID			BIT(8)
+#define STATUS_DOORBELL_SUCCESS			BIT(9)
+#define STATUS_DOORBELL_ENABLE_SUCCESS		BIT(10)
+#define STATUS_DOORBELL_ENABLE_FAIL		BIT(11)
+#define STATUS_DOORBELL_DISABLE_SUCCESS		BIT(12)
+#define STATUS_DOORBELL_DISABLE_FAIL		BIT(13)
 
 #define PCI_ENDPOINT_TEST_LOWER_SRC_ADDR	0x0c
 #define PCI_ENDPOINT_TEST_UPPER_SRC_ADDR	0x10
@@ -67,11 +74,16 @@
 #define PCI_ENDPOINT_TEST_IRQ_NUMBER		0x28
 
 #define PCI_ENDPOINT_TEST_FLAGS			0x2c
+
 #define FLAG_USE_DMA				BIT(0)
 
 #define PCI_ENDPOINT_TEST_CAPS			0x30
 #define CAP_UNALIGNED_ACCESS			BIT(0)
 
+#define PCI_ENDPOINT_TEST_DB_BAR		0x34
+#define PCI_ENDPOINT_TEST_DB_OFFSET		0x38
+#define PCI_ENDPOINT_TEST_DB_DATA		0x3c
+
 #define PCI_DEVICE_ID_TI_AM654			0xb00c
 #define PCI_DEVICE_ID_TI_J7200			0xb00f
 #define PCI_DEVICE_ID_TI_AM64			0xb010
@@ -111,6 +123,7 @@ enum pci_barno {
 	BAR_3,
 	BAR_4,
 	BAR_5,
+	NO_BAR = -1,
 };
 
 struct pci_endpoint_test {
@@ -829,6 +842,71 @@ static int pci_endpoint_test_set_irq(struct pci_endpoint_test *test,
 	return 0;
 }
 
+static int pci_endpoint_test_doorbell(struct pci_endpoint_test *test)
+{
+	struct pci_dev *pdev = test->pdev;
+	struct device *dev = &pdev->dev;
+	int irq_type = test->irq_type;
+	enum pci_barno bar;
+	u32 data, status;
+	u32 addr;
+
+	if (irq_type < IRQ_TYPE_INTX || irq_type > IRQ_TYPE_MSIX) {
+		dev_err(dev, "Invalid IRQ type option\n");
+		return -EINVAL;
+	}
+
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type);
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND,
+				 COMMAND_ENABLE_DOORBELL);
+
+	wait_for_completion_timeout(&test->irq_raised, msecs_to_jiffies(1000));
+
+	status = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_STATUS);
+	if (status & STATUS_DOORBELL_ENABLE_FAIL) {
+		dev_err(dev, "Failed to enable doorbell\n");
+		return -EINVAL;
+	}
+
+	data = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_DATA);
+	addr = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_OFFSET);
+	bar = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_BAR);
+
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type);
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
+
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_STATUS, 0);
+
+	bar = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_DB_BAR);
+
+	writel(data, test->bar[bar] + addr);
+
+	wait_for_completion_timeout(&test->irq_raised, msecs_to_jiffies(1000));
+
+	status = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_STATUS);
+
+	if (!(status & STATUS_DOORBELL_SUCCESS))
+		dev_err(dev, "Endpoint have not received Doorbell\n");
+
+	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND,
+				 COMMAND_DISABLE_DOORBELL);
+
+	wait_for_completion_timeout(&test->irq_raised, msecs_to_jiffies(1000));
+
+	status |= pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_STATUS);
+
+	if (status & STATUS_DOORBELL_DISABLE_FAIL) {
+		dev_err(dev, "Failed to disable doorbell\n");
+		return -EINVAL;
+	}
+
+	if (!(status & STATUS_DOORBELL_SUCCESS))
+		return -EINVAL;
+
+	return 0;
+}
+
 static long pci_endpoint_test_ioctl(struct file *file, unsigned int cmd,
 				    unsigned long arg)
 {
@@ -879,6 +957,9 @@ static long pci_endpoint_test_ioctl(struct file *file, unsigned int cmd,
 	case PCITEST_CLEAR_IRQ:
 		ret = pci_endpoint_test_clear_irq(test);
 		break;
+	case PCITEST_DOORBELL:
+		ret = pci_endpoint_test_doorbell(test);
+		break;
 	}
 
 ret:
diff --git a/include/uapi/linux/pcitest.h b/include/uapi/linux/pcitest.h
index acd261f498666..80f4c0e05679b 100644
--- a/include/uapi/linux/pcitest.h
+++ b/include/uapi/linux/pcitest.h
@@ -21,6 +21,7 @@
 #define PCITEST_SET_IRQTYPE	_IOW('P', 0x8, int)
 #define PCITEST_GET_IRQTYPE	_IO('P', 0x9)
 #define PCITEST_BARS		_IO('P', 0xa)
+#define PCITEST_DOORBELL	_IO('P', 0xb)
 #define PCITEST_CLEAR_IRQ	_IO('P', 0x10)
 
 #define PCITEST_FLAGS_USE_DMA	0x00000001

-- 
2.34.1


