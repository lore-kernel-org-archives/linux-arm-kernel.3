Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A868AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HXJMXZ9LGUTZustVJgA/C/zKgpGDb31Acgkq44bsAc=; b=B23IblH2xhka5yBDgiuoClODJg
	aA4nY3EVwkx1oeMFmB3udA6pwQuc6eqopi4KUam7GlO/rSU08UYh829lCAuWGqrymXBa7BREPQNyo
	9kq9pb236/fu5/xo27/zcWIVOyLx9Yo15DCYcMQ7iV2uTPdJXY4xCvKoq8XNSDsuinJs/DRT5Hhmp
	AOATE7Je4RxZaKPK2xdusT/pJkOCEdcx6dRvl1X+Ay/3lJsYTbhsSc/BIOYyKnm2TVvOFZ0J1vX6+
	H2CD/KIJVN3TM1rUZaUSjA76vl8KcXos0VDsM1tSSpiavCIzrbhpLw6NT5kcheMaFFrU0MppP1JoZ
	iGqWtiGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ml5-0000000CdPM-3M3i;
	Fri, 04 Apr 2025 19:31:19 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mJs-0000000CaJ4-0p5b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 19:03:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OT+NeHABzLgUQpDr3iP0GVWnbqLPt+39XDzl8pXw8yq+5yruKTImJFn9LJJeUTXI0MG8px6fM7CCiZ4trgipdDkrWAMOGg0YjZ+ZXrEhgGPsWDRofG7+hioGaXzLIWQE3B981ml8ZkWXM5BpBGe78qqg5qkkh65meMDxbi9q/7BhDvYm7ZBv8cKSIhxfnwghtzA8vOz5SlY7y81xwwB2QMNRhQqOxtq6SI8uQ+/+zKE1Go+58L09yrnYtVj5V7RH1vSSt0gTFLaE/GLWZRIvNcXVV8fSxhE3yVvzQYe2JxD4mFmyUBrobeHsawGAW8RGSxEe9rnzSZ9CNL6+6bTp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HXJMXZ9LGUTZustVJgA/C/zKgpGDb31Acgkq44bsAc=;
 b=URyiYdYuatD9gMdhOtPmJd7Zzhu7Pxjf97gdHDr9UqNaUOSEH4K2/EeqJLuFWpPAGD3co/L29T0gCqUV8TegcsI8PwnajEGKUjcgogvclXsDKuT8dVCMkZIrSpHY+yq3XJ1TBIrvq3A2S26a8605NqXcAVCaqXwMJMUuvN6nIrKnROYgAdWNWFNoZJMZ2a7eoQOXDOh/270RWYSvO7A+YthoAdrsZZMJQrAY6yuQxeQmYsSb8+iiBJgxGI4MTWjTM7xpXP/mIoAuV5P9OvGscC+7PIRIw3+jlMrQsQWugOAkSH0XZzLjPfBfk/wkRKCYskHz6a5A6dZk12z2o6N6cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HXJMXZ9LGUTZustVJgA/C/zKgpGDb31Acgkq44bsAc=;
 b=DFzJ2LJyLsCKO0LKdD5OsE7FMZ56KMmrw55LTwkHq1hyZPZ37wzUQH10ijz2qLVh5N87ajipLIyPmdZgTeMG38HyMX1AEaCLhNVRX26Zi4rQ8rzacFIg5/M0bux+/mLkG9s3qXDJKqq04MyteYchaQ+iAh5hpJUj+CSCKMWeBc2hXBei83xfelVu1CG7JRxyuQcL+g3UYZOdOS6iE+qzWwVwGGbDVluB1wQ1q9BJm2vcUnRa63dro9oLWaMYjJi1FbChe80PbNoSjYSt6oqpR/oDyWLYzGtyzferp1LaA0KWRcJ+HLNpP03F+7Em33/0P29HSOljsK/qm/eecubYAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 19:03:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 19:03:08 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 04 Apr 2025 15:01:16 -0400
Subject: [PATCH v16 15/15] arm64: dts: imx95: Add msi-map for pci-ep device
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-ep-msi-v16-15-d4919d68c0d0@nxp.com>
References: <20250404-ep-msi-v16-0-d4919d68c0d0@nxp.com>
In-Reply-To: <20250404-ep-msi-v16-0-d4919d68c0d0@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743793288; l=827;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=qxV51hE9iVaqehK/qn4rz9KrbxpDkLsIBLjf7RRGT20=;
 b=cP4Od7G40rZkF7wPNKy11/Cp7Jw0XnnJkrXhxrhrGwtZUOG2nqVxd4MpHVmfVJ5rqz8iqlweP
 4nTygYymjWBAa7iqYt1mvf0KZtnkzJs3sBc3DdPx1F729VuHK5gPYt4
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f7325d-d0df-4a8d-4cb6-08dd73ab566a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXg5eVg2WTR1SEpRaDVldjRXOC9wWXZtdlJodFM4UU1JNnRsa3lIVE1JMjgr?=
 =?utf-8?B?Z1RhRlFWK0U3TFhzWmc1Skh6L3lnbmt6S2QvTlpQTFByVGpzdnhTbUJwK0Z1?=
 =?utf-8?B?T3owYWk5eUdDWlhFdkhCKzZPRkhKdGZsWVNxNVNZY2lHdHZValRxMWRVY0ZP?=
 =?utf-8?B?c01DeVdWY1AwVzY4WElVWHVHS3dGbjdpQjcxSEdNTWpSeEc3SFQ5TzJUa1RK?=
 =?utf-8?B?Nll6S3dFZ3A1OWZpNWdOSE5rUS96NTlzTWNCTE5SWmw3VEcxMnZuNTl4Zk1I?=
 =?utf-8?B?bktmZExlWEdsSmxxQmxJWVprUExlZ0x0WmRpVDhKSG9OYVovVjJLMEpMenQy?=
 =?utf-8?B?RnNLdDFQTHo0enR4OERkVjA5TUhkd3YybGVGZDZkMkVUR25uVWdYR1VidjFD?=
 =?utf-8?B?YjcrT2tMY1JOQkl3aXAzUXlKN0hyTU43MytqcEhGM2xDZlMreUVTYlJqVWYw?=
 =?utf-8?B?V1RZamFiVHJDZW5TdmtOU2pSZzl3dEhvMUg4QzV4WHg1ZHZoU3JPUzkwZW91?=
 =?utf-8?B?M2F3RlA2SmFmTjFCRmJEVndPYjlaSHFLZlBRVlJRd0t1YklDUmhhOWRkTnVZ?=
 =?utf-8?B?MDVqU1REZFlrNWUzL1JETGFvZXpMSTJmcThtclVOTVkxWlNYOWpzbnZCNllh?=
 =?utf-8?B?WWRmMmk5enBKQSt3bUtHUEVLbFhlMkpRdVVnM1pqcDF2MWh4UGxCVWNkMXJY?=
 =?utf-8?B?S2lwUFFsS1p3R0drYUxTRXE2Sng0dytLSlF4NlZYOWczbTc0dkN5U1Y2cWEx?=
 =?utf-8?B?VWNQWFVSallOUHp6ZUs1YmpiOHQ5MU1QQlVrYjVJR05sN1NteUJia3JFYU53?=
 =?utf-8?B?VDNIakpwTFBsS1ltSVA3ZnRIb0NwenFSZUUzY2N2c1VFVitTREhsZ3JQbmYr?=
 =?utf-8?B?U3NIenFTeXh2L01nSVZ5S050UFZ0Y09uU3lwc1ZTY21UMmw0WGhRbUtyb3ZK?=
 =?utf-8?B?a2NBUWZHT29RdzNIWDlSbHZSNzR4NUF4U2w0ZHRBUTRwTXFHZUFlODEwNW1T?=
 =?utf-8?B?TVc2N1hqVDBPRlNNUnVXTDBXR3QvTS9iOUEvS2NidVhmWE1vMEJoQ3UwbkRq?=
 =?utf-8?B?ZlFMbytCcS9xT3o0b1p0YTZieis5SDZPZGRnRUJWcU02VFU3NWFZVHZ4SnJQ?=
 =?utf-8?B?aFNveXZGRTNFTllGVzBoQ0gxd0dLeEU4UHVkL1V0RWtjanFGYjVzVkR0Ym5y?=
 =?utf-8?B?U3dCTWQ1MDdPNXQ0Zm1pSkppRnVDVEhwaGtVY3hMMEx1UTJDSUgxUlF2VHVo?=
 =?utf-8?B?K1FZQmd6N2wyakhCc0F2Qm5IYk0zSzlFSWxWbVFzMUl6OG9uSFVzQWptNVFQ?=
 =?utf-8?B?aFU0ZTh5bFAvQzQzQU8vaVhtUVh3K2lzVHU4YUppcjhBWTBuNklwTzk5elF3?=
 =?utf-8?B?UWFaZWZyNEZtVmN3NFdxUzQvY0NyZ08wemI2d2Q1ZnVWSGRoaEZyUU83WHd4?=
 =?utf-8?B?dDR6dC9hSDN6bURXbVdOeEtOSzFsMXhMY0Jzbk5PNXNmQnNqem13NlhuVjJS?=
 =?utf-8?B?TElZcTViNHFkT3BMcHBlT2szT3FSMzh3QVBUSHNRMjY2MmUrVm4vWjJGM1FW?=
 =?utf-8?B?Q2Z4QkMwRzUzTGRXZmdLTDNvL1VkOFNEa1NlRFgwRmJQOHZjT243SXE3WWt3?=
 =?utf-8?B?d3Z4TjhmQjN4Szd3ckcvUkM3MVVvYk5BNTYvVUhQSU9hYWI1RzVjRkZyMnk3?=
 =?utf-8?B?VU4vSVgvRVhhcGN2bEJjTGhETkxwOWpUSTJTczZYZDN2UHlsR1dGNzc5ZmY2?=
 =?utf-8?B?RC9XK3R6blZVbDg2cWZ6elplKzhwanl6UW8vdnprV3pLdzg4c0JGRUwwanJ2?=
 =?utf-8?B?Um5YMmZVeWQ3Y3dvUWR3Ty9CcnRhWmljTzB1S1pqOTd3VC9ydWRTK2xaOGNz?=
 =?utf-8?B?K1c5VWhHYTZHbktTZmRVWitJcTl3SG5KbW41Nm9Ud2RwU1F5QWt6V0JKam1V?=
 =?utf-8?B?NE9KMVFqcnhaY0t6RW8wTXFnUlBmMHdiSzMyZDVIWjJqSXRMR2RDbVVndVlM?=
 =?utf-8?B?S0U1amNqZldRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUphZkhyVHVGRkJHN3dpdmh3STBUWFlrdmJMYXVPaXBzMWg2cUZ2V05QVzE4?=
 =?utf-8?B?ejNkckhQSERxYUxiQks1dGRBWThCT285WUZPUTQ3TkoxcjRUZDl6K1A3c0R5?=
 =?utf-8?B?bi9YRG9nZHJWQlJaVURCckIxS044UmY1bDJCQWU4aGpleUV2eHFycy92Z2xw?=
 =?utf-8?B?WDZXUlhBUTFlSm8xYVdjcXhWa2VaTnVvMDIxVUlyOVpHeGNITDhQZncyQ3Rs?=
 =?utf-8?B?bHdBNHd4MU9SODBNR1A5Y1YzOHRSRFJ1eHQzQloyempPV2tueDQ4Rko4ZTZ0?=
 =?utf-8?B?Y2NzUStLbDltLzVhTVNJQ2JseEtiK3BjNGFzOEE1OEJQWnBOUnRFeFU0UmQy?=
 =?utf-8?B?cmtMUXQyS2FtbGpmRnAzSFhsTzdRcW1mWndKY2tEdHY2VmdwN01qNnlyTktp?=
 =?utf-8?B?d1F1bjdnbCtQdFFLYk1XRHEweGVyc3dkREtSazJOTmRHdTdWdENiaVAyaEx2?=
 =?utf-8?B?N2hmalBnMXRvZjNEbWhXbzNKc3lCL205b3NzWFNoZ2FEUldaT2xwcDhJUE9L?=
 =?utf-8?B?ekNQZkFMS1Y0QUxFcjhIUVFxQ3NITjBjc0pkeWVISzRHcGZrOGdONXJaOURz?=
 =?utf-8?B?ZTkzTmFuL0tmNXhQbndwbUM4NHNYdXR2a3lpOUg4ZGdHcHQ0STZ4R1FucXJi?=
 =?utf-8?B?M0JiL3ZLNVdyaldwNnNCRHM3Z1c2Rnl0NkR0bzJ3RTVpZWF0dU1DMWJ5SFZK?=
 =?utf-8?B?SkxDM25TenY3S3RaSmVhNWdDMXE1ejFad3N3RWlZcjV1NmFhSy9EdzNMSWFm?=
 =?utf-8?B?RFZGL3c3K29IdUZWMWZla1g4N01LdTJsM21yK3RxR2ZaQSt0MDdISk90R3A3?=
 =?utf-8?B?SnlNVXJackxOUGlCRUdzbnFiUlZrTnhsT09aWlhidG5KVk5kWTVHMDczQzEv?=
 =?utf-8?B?b2txTzMvbFc0KzBSN2hJSDh5MTZ4OHI4Nzhpd1ZENzg2YUFFNVJyWlh4WGJT?=
 =?utf-8?B?RGdwNitSOGd6UnJLWnJPVXV0S1JFV0l1OGRVSEdrU0Y5V0dOeHZDOWtlYm84?=
 =?utf-8?B?enpaOGlZSTBoQjRwelhXYzRRRlhsNmhMR1ZyRkZNQzJJVVkvM0ErMzJwYUtl?=
 =?utf-8?B?SjlvQzZXWGptU2xjcUYrUWpaQ1FFa3pyK2Fkdm9BMm1jOXpEak1pT1FGZWR1?=
 =?utf-8?B?SUFIY0tQTHVES2ZudzA4RHhoakJQZFVoMmFtWTlVb3NCczdZalJxOXdVRlNm?=
 =?utf-8?B?VUprMldpNjZ1RWtGU2FxZ0UrYzNhUCtjY3hKVlhzNDFKMW9xb3JTdlppVUhJ?=
 =?utf-8?B?RGgxWTlocmNnV2xnMm9NeTdUdnBVcURxVWYvUkR2ejRjWld4QU5yTm0zcmlZ?=
 =?utf-8?B?NDJ0cGFvRzVvOW81eFo3SE11VExkSkQyNXNNcXk2aCtEV0pJb0FzeCtibVEy?=
 =?utf-8?B?RkZtTXNLbEFIVG5EZHdtdkp1NUIrajdVb1JaR0gyb0lIaWtCblYyWW9XTHRT?=
 =?utf-8?B?bElDMXBKN0dQMjhLcnVFaTM2NlNqVnZnYngvaE1kRUlWOWVYQnJGb1dpRjZp?=
 =?utf-8?B?NFd6bTV1SExaVm1EeExNK0hjd0N1NmVpUWlJZ2tBbm9HeXN1QkxlR3JWaEcw?=
 =?utf-8?B?OFlKY3AvdUhlU3Noa25lc01WbmQ0YkFteklvMlFoc0J2cm1mS1hUbkFiM2NF?=
 =?utf-8?B?RHZlVzYvVHhqWHZ6dWlCa3ZBR0FQZFE3UXJDeGdnWVNhK0d0QnZ4aGhRS1M2?=
 =?utf-8?B?RU1MT2xCcU1aMytiSzFjNnczWUdTbEtSaW92cDFHVi81WmZKMEt1MVNMNHFI?=
 =?utf-8?B?WTBreWplU0NhV0NHS3RzN3pUd2NxcmhBOTF0ejNjWFZIWXA1WjFLNzRScDZH?=
 =?utf-8?B?MG9hVmVOUFEzWUhPNUNGMUM4SmlwbWs4N0VQUjRzSDV0eEwzR0hTWUpId1p1?=
 =?utf-8?B?V0V2MGxjZkZ0eDV1S2RaVER2ZTFMRWdjak1IY2JJdEI5bTYwSXJBUVF6QS9w?=
 =?utf-8?B?WXpjeldjZGtTNjYyUVZGN3UwbGdxNHIvelVqWjRycko3NUJFcFhQNmxDUE1O?=
 =?utf-8?B?UkRSOEJ2NXZNZ0FIWDA4VUNja0o3anZkYzNlSWx0bXdESzVGaFJTaFNFMnU3?=
 =?utf-8?B?aVdxeU9GRlZBaWc1RjBUZlA3T3NVakoyZCtQQmJpK1hneHp0U2cyUWVxUXZR?=
 =?utf-8?Q?x4EY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f7325d-d0df-4a8d-4cb6-08dd73ab566a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 19:03:08.4760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/S237abjertFtJGn5vA4bSM/GM3LwfuQr9IQPVbF5k5jpWm5glgqdPyeD7GpOSmxG5NNrYyMxaTByML7uHIZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_120312_243316_BC7B5752 
X-CRM114-Status: GOOD (  10.65  )
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

Add msi-map for pci-ep device.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v14 to v16
- none

change from v13 to v14
- new patch
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 15ba83ce691f4..c3c76991f1c8e 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1768,6 +1768,7 @@ pcie1_ep: pcie-ep@4c380000 {
 			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
 			assigned-clock-parents = <0>, <0>,
 						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
+			msi-map = <0x0 &its 0x98 0x1>;
 			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
 			status = "disabled";
 		};

-- 
2.34.1


