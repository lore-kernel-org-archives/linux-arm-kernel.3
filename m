Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9FECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 03:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJQRzwyv9hGdcFinz3mJ/IkcxW6QFlg69+WbpJe0g9o=; b=dp+AW7+jJiRZtaoXHXWHwrfHQ8
	9YIF/y0wEP1n7BMzjewvEGDHM8iTvk1Blb/ZbHZLO1894UDBsRHN6I0xFUI1J/Udffx/IsRim6eri
	OQDl55h/GqhvKBN9JH55I+mGsgEMqz0k3VhzSrC0CJV7Be9AwUlKQRCjZiEPexppNpDzMFxZznJnW
	H+Xcs5f0XdYc1pMhOJ6IqBX/i4LvDSgEuJWLY2fSwgfq9VDVtM3IItPlmyv0JAISTNOpeOxFctw0n
	vvC/XlRuDdzM8gD0DCb3zMh25vMhObnMg7sSpxoEginCrTtidEFW8Wwoto0rgZPk7LE3aaI7mhUyH
	OXQe0wyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGqin-0000000Eor4-1Ozw;
	Thu, 06 Nov 2025 03:31:37 +0000
Received: from mail-swedencentralazon11013064.outbound.protection.outlook.com ([52.101.83.64] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGqik-0000000EooJ-3JVR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 03:31:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E85EkrPWyxTQiRt4eD4ydUL/2rpQAftVyKEynDc4HoIePtMebaElamEpqcbOI8Js5Ycovfwtuu00ePprRRtRXCgOoaQ3ECKi7bp7fDWfJkpHagmCTkS8Z6xwJlAMRCUZTv6LGRRWH6OgtCRke26wCi+S1DtvEnwGzJIaqzig3vOcqDcai6oGyZBHx4EPaUyra5ogfInGpAxysmsYKGt5nL1nk6WDVBjqjaaotlJt9LoNqpK99ThvGfCZDrukDvp4c0Z/ORNkRmyTu46dWwshyyhRGOP0CZdjr1K5BhJ9B7kV39TC9LYV36Bc2qU5h0iRGBkwOtBmtHp+njJhRI4YiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJQRzwyv9hGdcFinz3mJ/IkcxW6QFlg69+WbpJe0g9o=;
 b=hKm6hSgoUktkRer3h9XtVzfC6pZAQm9TjnAs327mec3e3GGN2VpyW3JgelfRFDY6u5ALSkwMa7oXOzMDkOFL1X9z5vLw+ZHePIVAINnRhKI820d3RArt0TsNCQLXwzQpNBOWtsHcEJ+RhnoXTvsXhWf6Du7KO1mrBMYgzS18J9Ml0GkIkeTu8FgSnOFRiSMTMazO4KT8MglfXgAHeFW0ZC3JOEiQp2Xdx35kAoTjzRUgZO4Ovhdp8NQgXC2QewnGT/nioP8OZabAqVlyaWpi0X7D66s/CL8wKRBPdAE9Z5QZodtR4/WDaOxyebrljipZDcTrFyuDFCqKO6IbdA+lWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJQRzwyv9hGdcFinz3mJ/IkcxW6QFlg69+WbpJe0g9o=;
 b=DT172/GJUaFPuy8gz3X/3FX6mUANSLuBYeCd7y5X8TATksrj0m/lZAk/zcvpNILHn4cDNLg6r1qrYkaObJL29U+hszV6mshzBPiOgVqRKcxhxKo9ARJ5w37z0SOdsOAXRpj4BRMFOel3GtH9il13zo9I8E6TTRx6BpudoV2r25iQ1cGHJ6qSr0yRX32yjfYHoNwDREYtv3u50De+5RVWqHsYlE/MnwsnbypLFyPaM8sDH6/mSLb6UzdQi5NVp4BqNgsoLjPv63i8ssHLOkQKa3hBLNAxYULUR5vK6krB0fAAUD058AOcNLwyFf9AfWnnL/pFVSCMvL3PIJmKXzuP+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 03:31:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:31:30 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 06 Nov 2025 11:30:34 +0800
Subject: [PATCH 08/11] remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO
 switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-imx-dsp-2025-11-06-v1-8-46028bc3459a@nxp.com>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=5452;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Kfgs/vF82eWV1bNh0E+Y7nXzmmVLX4GlUMjPOkJRabk=;
 b=Tp0YWMcFvS5m7XHo08CYkUe4JUf3ySBCBhdwpukkZ8Xsz7xq9VPoJpeGJKbyXfvcTGLv+kvrW
 KsXWfRMP82CC9CoUuq8Bw1NiKyaEPg3CdOlNxacB6wNMrjOucsn3viu
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: d67c66e6-1c1d-4616-2228-08de1ce4f9a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|366016|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFdpMUh1OHFoR3AvMEZIeGQ4bWhINXZRaDN3dFBpejZxSE1jbndYSmh2VExq?=
 =?utf-8?B?M2VjNURDbUxNOEhXKzlTWHpKZ1NmUkRyTnhqQVZUdWFJTkhhU0hQSnBYSzBV?=
 =?utf-8?B?T1FManIrK2tkbTEvWDV6UCtIVU5NSGxVd01aOTBwMU9xdC9sQ3k3VWZadmpX?=
 =?utf-8?B?aGtxdjN5SFVQV2RBTmpOVlFMVGlvUkh1UGZyZkxXc3pxOXA1OXFBWXZzS2F3?=
 =?utf-8?B?ZTNET3VpMTF1WFYwUEhtM2ZQU2ozRFdmZW9sOW0yVEtYcDE0cjhTMzdzNTY0?=
 =?utf-8?B?a0RCTVhQNnE0ekpoU0J3SHdRczNPRXBkeW1QOHVHUXkxZmJGRUJtcHhwVHBs?=
 =?utf-8?B?eDBNbis0akNuNVU5ZlpmdWoyYmNXTGdUNkhMY3lZR2QrRVZIa2pYTEtIWUNI?=
 =?utf-8?B?THo1b0ZqM1QxamdDZGtOUW5kMWFsUUsxaDhOMFNnbzJpVnR2YzRFblpqQW5m?=
 =?utf-8?B?M0I3NkFYMmlyamVsSUlHRVR6SFdLSG8yb3c5d1RVcmhOc0pCYUgwbmJYMmJR?=
 =?utf-8?B?eXovcW5VK0x4YXNKaFR1cXFNejhKbTAwdXZkZ2t3S0JLUmlmdUU0M0ZsK2VY?=
 =?utf-8?B?RUtER1FvZERhVEpacHV6a0gwMjF3Ym8zaXlOVjExQkQwa3FLQ0ZwazVVMkdu?=
 =?utf-8?B?d3d1VExxQ3dXaXZsUEFFKzBnaGdCTE5qQ29qQWc4aFRSWGpydkxsUkE2cjBk?=
 =?utf-8?B?cHF2YTFzVWhyckJJOGFkZSs4MW84VjgzUnpiekNsbng0a3F2cVpsb0FXdW9v?=
 =?utf-8?B?WUdwd3AzaHR0eEtOczJTaklOazJNMlllNFBWdlRSRm1jMHd4QVZRL0NpbWor?=
 =?utf-8?B?dEtDbkNPZndES3ZqY3hSWGlJU1FwS0xuNC9qZHBEeDZpcEdGWm1HL1hFTDdl?=
 =?utf-8?B?cHZZWHhXS0JLcDRwTU0vZEhUN0xjaklKd1F3ZHQwa09CdGI5RER6NVZmNytw?=
 =?utf-8?B?Qi85RGN4a1pqSGtKMC83eG5NSWpTTUV1Y1h2dU5GWjVSdkdtcEV0Z2RFSGJV?=
 =?utf-8?B?YzJOSHNHL2I5Mlpha1JFbklUNllZb3VKVEpNbnNsdkFZdXFsQ3FTMC9WNkZY?=
 =?utf-8?B?S2ZubFdRWFZEWlYrNXFJUE9mb2JwaUtpSkU1VHhySkVDZ1RIeDBhblVkRk92?=
 =?utf-8?B?dkJyU1NTWGNQcW10TjFlbWhIRnFiMEdxQXh3K1hKSVQxQTMzMkdBdjlsOTJn?=
 =?utf-8?B?T21EdlJWOTNWTVJmUGxPZzRTQWI2QzVwZEdvNk9tcm1CN3M1aGUrNVBNRjV2?=
 =?utf-8?B?QWVUVndSUXJWSjJKS0w4cHpqVldPbGdmOURPU29BTEJhVW5YSk9pYmgrUm8r?=
 =?utf-8?B?SXQyVlJMSFY2MXFFWXU2SFM5RmtPOUs0TS9LOGpGTWJDbGtyNW1XdDByUnVR?=
 =?utf-8?B?Q0RqckJHVG5ENkg1YnVRSnJPREVNRldLTnQ2RVVYTkRuWE9LUkM5ZUlrZnNw?=
 =?utf-8?B?MzNlMEFMWmJjdGwwVHAvNVU4Yk1GcXg1S1grbnJzdjArQ3pYZkc2ZWt0eFFk?=
 =?utf-8?B?ZHBRUEtLN2diNDJHZ21MczN2UU03bnFMeXczdDdLK01rTjNuMW1RYUQ1RHVF?=
 =?utf-8?B?a21QM25TQmllalEyTzZnVVFXbUtYUUt6bGdyR1o1QzlyMUc2amwrdXRYdi9V?=
 =?utf-8?B?dXlySnRZcXlPZ2lsT0NOZnB2ZFZWOFVEdUJoK25sUm9EdUo4aFJvTmRhM0xB?=
 =?utf-8?B?N1ZwZHpMS29kMU1yL1hnMU8vTTZZcjlqb3gwTE9GeEJhSUVwTEF3TFM3eG1r?=
 =?utf-8?B?QzI2TUNvdlp0S3ZFOTllZ1lyZzQrVUtOL3oxakFTWGtzMXdOZm9RQTI3RGFy?=
 =?utf-8?B?aGc5WjlyT3B3V3ByMDIzV2UvWTBMc1o3TWxtV0FlRnhkb1RuSjBlZDU0b2xF?=
 =?utf-8?B?bHI5WVFJRGEzU1hZSlRSSm1UeEU0Z3gyL0xKbC9LVVN0WWZrUGlDendMczNU?=
 =?utf-8?B?VERzbGVBNWZxM09KZXh4QkQwazlETUpraytEaVVHd3p0dkFhTzk4MEwreXBj?=
 =?utf-8?B?cm9uZGJqUGNpYUpzZEl2M3hRZmk1NytmZ3ZRODlTNzVpczN1b2s4TFZ6UG10?=
 =?utf-8?B?ZTJKMFdlNGZ3NEl6VnBqNlZXT1MzdUtsd1FQZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWhDOUNpM0xrQnNkUWlmZWtvV0FnNkQwRktlQnJtZ2lVb1oxbng2ZFhaaTRy?=
 =?utf-8?B?VmpWZFYwTkRxdDIrajFqcFg2NTVBMGpXdDZ4SzJZZitpMzNxTWxKN3FGRWlQ?=
 =?utf-8?B?VXo5eGUvM2I0elRHSHdibmtFd211NWlPZDJZc2I4Mmk4S1RtSHVzOVdZYjh0?=
 =?utf-8?B?dDVMR3d1UUdMNHZzOTFUaWVPaXFwV1MvZ3RUbXdLUHFONFl4WHI3dDBvQ0RF?=
 =?utf-8?B?dlFzbG85K1FqVE1WYjJ5eHhQSUZBd0EzMnJFb0Frb3JRSklpTSt6N2xJR2Vt?=
 =?utf-8?B?eUl5Y2hwOExheVZWT0JEZDRyOWlnV1JzMlZvUFRVRkU3Rmt6V3lvK1hUR0M0?=
 =?utf-8?B?ZUxWZmR6WjgwTFQ2OVoyV2ZFUnZSdlIxZHJEUmlaaDJZb1JLaE15bGZTN09n?=
 =?utf-8?B?SkJQQUk5NXFuWXlEbVJDQVZUeEtFUUVweVV6bzMrMExsaW5RZEt1bjRmV2hG?=
 =?utf-8?B?YnBuc2w4NWxINGxENEllOVJIT1Fab3dMY0ZNdktFREFxblU5a08reTdDNVBC?=
 =?utf-8?B?R1BacWhIOU9hMEFqTnlNdWZKK01FZVI4Qk9RYndUSXFvZUdvTFNNV1JRbk9H?=
 =?utf-8?B?OE9SOGNad1BLVFdJa3Ryb2FuQUkwdXpjVlJzRHU2c2MwUjdFbllLekdqQlNa?=
 =?utf-8?B?REFPcSt2Um11OEZwYU43VlN0YzJ3VnFDTVczUVh4MkNOTXVkWHRQWHpHV1da?=
 =?utf-8?B?Y0pBK0ZET1o4RlJkc2ZwMUhVdGZPM2VtWFhpY2J1d05NTmM4NXdIa20xd0RF?=
 =?utf-8?B?ellTUUdKNE5UN21sMnJEVFFKdjZMd2hBL0t3RHNqSVhOdXN2TUJjTTB1SExH?=
 =?utf-8?B?UkNNVURPdzhoNDArbjJxdjJsanludHRzNERkbjRKNVFjZC9EbDlFQmVIVnZP?=
 =?utf-8?B?NDhSNHRZaWh2YjdSNkJoT2duRWJvNVFhUmpYUHFnQW9lZ3FrTVVqQjkxRXZv?=
 =?utf-8?B?aHpzV2E5V3BPMDlMbzA5cGplMnhHdnM0eDNMVXZzMTJBSTU1Z0krcFpteFd0?=
 =?utf-8?B?S0dqUFYxK0RXYmxNb0hVYnA0K3lsZDU2YlNXdVM4QnJzYU5RYkoyaUtGdHIv?=
 =?utf-8?B?OUZjYW8wSlZEc0kvVVhxb1pPWjBCOGRod25lQWNZbGkyM1JJTlJPbkd6eGtO?=
 =?utf-8?B?RTdyWHI0YTBYVjBxUlgzQy9QdytPT1JCdEdrMXdjYUtRaVByTy9QUUdYakdq?=
 =?utf-8?B?MlpBN05zTlNtZHBSdGZFZ211c0krbVBFLzlIdmdoV0FHaVRFaS9EWU9lMmVl?=
 =?utf-8?B?Zk95M1VWa1NkMjFIUFZiZ3BSc3g3VmVZa3BqVkEvMjQ0RTlrSXAzMk50NENl?=
 =?utf-8?B?N1JZcmNTd1UwUC9xaHFYamdmWWtDOEdhUGhwZzV0MlppejJHSFdjdEdHUERY?=
 =?utf-8?B?cWNibExISUZQQWJQaDJNdzA2Y05LeWtlVWsvYnQxS3BQRzJiMFVqZ2FiT2JQ?=
 =?utf-8?B?YXJBSUxoL1NwdjFrbTJEQm1FSU1ZamM3SDBhVlNVMmJkc01sbjRSSnpXMjhV?=
 =?utf-8?B?b3BCMFZ3bm9IazBnSWIwZjliUHdRbDRGakduK2ljTTJWMTdjSmRmUFJ6bEtI?=
 =?utf-8?B?Z1pYYjlxbzNTc3JvTkhLTGQ3QW9WbTZjWDA1aHdXcTdyWXA4L09TdmNBQUZE?=
 =?utf-8?B?b3Y4KzRyK2s1QVA2VUhVZHFoZXhxdDZqdHZ1TkY5TWNTeVgySnpENG8yditt?=
 =?utf-8?B?eUp5cStPc29CbzNwZmN3Q2FnZUpzZVJBR3BuendNdlRtVGdLRmtSWTJxLzMy?=
 =?utf-8?B?Qk00elcvNDEzcThXMkw2bUNZQ0piRktwZk5zSXpYT3VlNkJWcmNOYzVlKzVH?=
 =?utf-8?B?dDFyMkw4Tndtdm11eTBFUXlnNXdmZUJmWGVWcGpQdHdmK21ob3Q0bGo0STFu?=
 =?utf-8?B?b1liSmlRRkMyWnBCaFhtNHViRENYczdqR3ltM2FKNXRBRzVsaUhWbkVIbC8w?=
 =?utf-8?B?d2t4TTRWMzRZeTFyK3RSdk5jL05tUDdNRnVnd3M1czY2V2N2dU9UVFVmczdU?=
 =?utf-8?B?TC9nTkk4bEtqaThHbXJmM0pwVnZtMFo1ak9VRTg4ZENVVmNGSkJFblEvcVlv?=
 =?utf-8?B?c0p4QzdGWjFINFFMMmM1NEhlRk9ObnMzSTJkS1pPMlZNcGg2YjNYbVVTVGw1?=
 =?utf-8?Q?8X9Jcs0JXSqnSQzHbOxJHSP40?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67c66e6-1c1d-4616-2228-08de1ce4f9a1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:31:30.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkaY2drf+fVlf6geF+go/3dYdB/WLCS4de7SY5l9C9iROEJAbd6KHPk0q21ouTXVGMN74nDneMEkPBWhtUNtfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_193135_014056_28F3AC1B 
X-CRM114-Status: GOOD (  15.35  )
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

Introduce imx_dsp_rproc_mmio_{start, stop, detect_mode}() helper functions
for i.MX variants using IMX_RPROC_MMIO to manage remote processors.

Allows the removal of the IMX_RPROC_MMIO switch-case blocks from
imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and more
maintainable code.

No functional changes.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 61 +++++++++++++++++++++++++-------------
 drivers/remoteproc/imx_rproc.h     |  2 --
 2 files changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index f28d25cab3f1d89e5cde37a04b528870a59abeed..71776816c3508a86bf7b8a09ac45827a83a7bb3a 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -338,6 +338,14 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
 	return RSC_HANDLED;
 }
 
+static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
+}
+
 /*
  * Start function for rproc_ops
  *
@@ -360,12 +368,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		ret = regmap_update_bits(priv->regmap,
-					 dcfg->src_reg,
-					 dcfg->src_mask,
-					 dcfg->src_start);
-		break;
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
 					  IMX_SC_R_DSP,
@@ -388,6 +390,14 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	return ret;
 }
 
+static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
+}
+
 /*
  * Stop function for rproc_ops
  * It clears the REMOTE_IS_READY flags
@@ -411,10 +421,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
-					 dcfg->src_stop);
-		break;
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
 					  IMX_SC_R_DSP,
@@ -1032,6 +1038,23 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
 }
 
+static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	struct regmap *regmap;
+
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to find syscon\n");
+		return PTR_ERR(regmap);
+	}
+
+	priv->regmap = regmap;
+
+	return 0;
+}
+
 /**
  * imx_dsp_rproc_detect_mode() - detect DSP control mode
  * @priv: private data pointer
@@ -1049,7 +1072,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
 	struct device *dev = priv->rproc->dev.parent;
-	struct regmap *regmap;
 	int ret = 0;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
@@ -1061,15 +1083,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 		if (ret)
 			return ret;
 		break;
-	case IMX_RPROC_MMIO:
-		regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
-		if (IS_ERR(regmap)) {
-			dev_err(dev, "failed to find syscon\n");
-			return PTR_ERR(regmap);
-		}
-
-		priv->regmap = regmap;
-		break;
 	case IMX_RPROC_RESET_CONTROLLER:
 		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
 		if (IS_ERR(priv->run_stall)) {
@@ -1301,6 +1314,12 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
 	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
 };
 
+static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
+	.start		= imx_dsp_rproc_mmio_start,
+	.stop		= imx_dsp_rproc_mmio_stop,
+	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
+};
+
 /* Specific configuration for i.MX8MP */
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
 	.att		= imx_dsp_rproc_att_imx8mp,
@@ -1321,7 +1340,7 @@ static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
 	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
 	.att		= imx_dsp_rproc_att_imx8ulp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
-	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_dsp_rproc_ops_mmio,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index aeed08bdfb5619c7afd7201589f417cfd6745818..912827c39c0dedeed76c13740efd42a8e7cf9c45 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -18,8 +18,6 @@ struct imx_rproc_att {
 /* Remote core start/stop method */
 enum imx_rproc_method {
 	IMX_RPROC_NONE,
-	/* Through syscon regmap */
-	IMX_RPROC_MMIO,
 	/* Through ARM SMCCC */
 	IMX_RPROC_SMC,
 	/* Through System Control Unit API */

-- 
2.37.1


