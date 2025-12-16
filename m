Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3591BD5B87E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 01:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UFkVWEbuXlEyhQIYx0Mov0Bl+koyt1S1wlVHUGASKs=; b=2FFHS9McE6IizhE687y77oOx+w
	riYKXELHlWsgUSEKzwo013O5JTQEDdfx6Ndr4HTH4sdvz1gYd8n5wCAFTNTmnk1jWt08GOv1VwNDm
	jl34oaRmrCEQKdHCR6cJP5mlLYYgX9niqdGTsYVUO4grHgnJo9p4KZ1jX0R/dwcVgMm01Azni5Dhr
	+vhnqQnOAgk3W0WwoctFE5h+s8oqnTA8R5e796KoV379hRqhR5gqUzzyb6oQLvMZX2zJkip8Xk8Ez
	xmM9OtgWy5NKXnGtDNz1ziQGlbwejbmbUz82EqVGw0LjHpS7ywtsFDfO/EJMutojV7BTqTfoG9XnE
	XPcI0Ghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKE1-00000004WxI-04L6;
	Tue, 16 Dec 2025 01:51:41 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKDx-00000004Wum-2W3Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 01:51:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFjvuYDVpPWrdr+I8zsfyjxBHramIIeoiMj1TLQmXZ+7qlJw7fMXFyleeE+HFx8tUqL8i3HL8vDEa7rMLb82WO9GOYzlE8SnxEtGSNTiloi6AT9Hf5AUjgWlJPr/GlBGN1ehRGlTGGWKBYs60u6Jpk/aN3C840VCmd9IEVRklMfDFIFcXTH87N/U7C4G03VZmXhJMrweu0Rcf2EFlnefakuArlnu5lThMYoT6GfcgmJ1SZI6EKnoeAFy6P7LTITfFHbmLyfPnUfNHXMGwSk9dYFxR771hMiCR5jvWduEyKwfMoIVKUiEeKWF3dh/O+XW6kwcFwFQFmH8qfUcnPdbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UFkVWEbuXlEyhQIYx0Mov0Bl+koyt1S1wlVHUGASKs=;
 b=xFfmvDSF9BtZPQnvnXt7nHeuhjxOkw9/p1vMvzC6NJkFhg3ueXSQ/lguXMfppXuewahL5QBCv3AJ94miM5vTeBq8MVTEPUrqmt+Bm+uVl66n4Ux9xTy5XB7HZ/EQ6CAws/CS8A8g04McSO+lJWYVqtnAhCHVO7pWHs8tO4kMijBtZhzG8N8rl4qL4ikPnYrGVd7ujS7KHw0t/YwOIzPM0gOG0GCnDGI3e1H6kEw6hT4HMdha6OvUTz5YWEYOoGexfaHvMusb39ii/5o39n3guWTgGq7lVzFcBBIs4Ko+D26++A+o/iT4iOpBNnW34V4RoeH39d8nVbQdRiLmHdfntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UFkVWEbuXlEyhQIYx0Mov0Bl+koyt1S1wlVHUGASKs=;
 b=MbT5h2IM7p8zV4j0LRSb9WdEDDX1UljnPmz1QCtAliel7LAuWI3wasaNUp7oEq2Kq9EWHcZh2QkagfWE0Vhxdb3zpx9NNlU6FK5+aaVvmu9Nlv5JBmJQtlA9UGIKJQtQ6o32GckXAtApVOkWfPdgol8ZLYpm/bNN+9OjYWabS2p2QoAUb69Gc6GfXNiLJWDYGOIixrLRRuye7sUoMqCyC/ZCjmPbM4NCQhhV1/FvHD+NSHncI3tHlWY3IPL+9UeedT2m7FqitwGvzQ5bJ38uCuzv37Vy6E6lOWiVCcMj9zN28fHH03/erc9P5Y27rZo5qiKKkFLp7pDP04WVQ8kWFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 01:51:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:51:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 16 Dec 2025 09:50:59 +0800
Subject: [PATCH v4 1/5] dt-bindings: remoteproc: fsl,imx-rproc: Add support
 for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-imx95-rproc-2025-12-15-v4-1-bf1064ea8daf@nxp.com>
References: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com>
In-Reply-To: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 7479f086-3c1d-4e24-ad82-08de3c45a455
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUk3cFczcnQvR2hERGs1NEdmMnRiWkdYNndHUEdJNmJrWlNmVndleHhxYlNj?=
 =?utf-8?B?cjJndFBuODE3K3cxMDFsdXN2NTlzVHVWUXpnSGNGdUNtQTAxdVY2MzJlZ2tS?=
 =?utf-8?B?ditOK0svWi9kVmwyODhmTUVxenBKemJSTTd0S2plZXFHUERQVEE0TGxzUEs1?=
 =?utf-8?B?SUtaSzhoWHBLSlMzSUZwWVlQUVFQSzNWdTAwVTlNRk8xd1pXbGp0Mnl3K1RZ?=
 =?utf-8?B?VGM2RmloUnovUEFFaUV6ZXVBcDhncW5WN3J5ejNUanN4bVMrRlFxOXJNc3dP?=
 =?utf-8?B?N3pUS0xvUjdma2wxUlZ1TTRuaXY5Rm1kZHdoSFU2MlZZZDV1ODZnY1h3c1pX?=
 =?utf-8?B?SDQ2aDhQZ3c1WWVldkpIcGdZUmpGbnFZRnkyMnFPeVBRNzdKWWdyV1JnM1BQ?=
 =?utf-8?B?V0FqbURjeDFBalphb1hvOXRNRWZuanFQWVB5ZTNJWVZzS3ZFQklFa1kydWRH?=
 =?utf-8?B?VEY4OUpReVA3TTVpY203Q3ZlV3J6eFdXcGFQcmpTZzFHaG5kSlZkZU9lV3VR?=
 =?utf-8?B?bDF4SnE1OVZLbTZpdHhGS014Z2JOTTVCWVM5Z05iN0lZbDREc2dwWHZKbzJ4?=
 =?utf-8?B?cmZxMUJGMFFiTFI4YjRjL3ZxNGU1MHVSemRUYWFYcXhVZGFZNXVJc2QwMllh?=
 =?utf-8?B?R1Njc3l6TStqRGkwbXJoT1QxT2RCcTBzaWVXV3BvNURHdXhoMGVSTVQyV1Zx?=
 =?utf-8?B?bGVJYWlrN2lJb3NweDNSZTFUeDVnRzRWWU8vNTB4MlY0RlIzbE1EUzRqTWtS?=
 =?utf-8?B?QW5DTmNuU2pPWTFxY3d5eDdsVUpXZytOMWhudHBDUXBmaHpxemVLL3NtbC9C?=
 =?utf-8?B?eldScTlrZEZMREdaL0toUDFLakNJQmE1eTFub3FleHdIbkVjdjVlTk0zRGZS?=
 =?utf-8?B?NW5aWDRUeTRwMVlyZXhTNzR2WEJDd2o1dkZoMVV4aHBOblAyTUtmSVFTWENL?=
 =?utf-8?B?eTRXQ2FCMmpHREU2aWJEZlJrV00yNk8wRUo4d3dGY1JFN3VNUW05eWVVaXpG?=
 =?utf-8?B?VE0zRVQ3YWg3YUlpamJCaERVWmFuMGNrTEk3M2ZRSVU5OXVGNUNwa0gxc2xv?=
 =?utf-8?B?dmlobnVscFZINEZLSGI1b1U2dG9sMCt1ejVYWjZESy9uaWhkWVArazJqc0dz?=
 =?utf-8?B?NFJleTFyeThMeTZXbVRhdkQ5eXRMcGtTdFNjdklETHMyMzhaQWtZMHlieXNL?=
 =?utf-8?B?YjAwb0xCOW1DS21seUJETmozeFM0YmtGUk0rcVVneTEwYTFzZGhKRTFEWVNB?=
 =?utf-8?B?aDB5dXo5cnV6eG1zdWRGcmhpK1BTN3ZiU0Rmd2NNUUVrTmlqMmo5dDdGRGlE?=
 =?utf-8?B?RVlVcFovOXNEelcxR0RDMnJZWkdyVm5HYi9oUzdoZXF6NlJsdmIwVU1LUmJM?=
 =?utf-8?B?TmlRcmkzdDRjZS9aQ1lhTUpDeGFCUEIvbklnR1VLUzZ2alJ3ZStjVXNzQ0tv?=
 =?utf-8?B?aVNkU1gweGs5VXBuczdmREdtc2Yxc01KSEkvL3FLODFVWGJNUkZhSVN4VE1Y?=
 =?utf-8?B?T1J5eG9hbHpaNjdYOWhzQkkzK1BRVDl6SU50WjJCT1RTWDVieHpLSGFNeHNn?=
 =?utf-8?B?ZDVpaGlYSnBUcm9RY2p1akZ4RHF4dDhJYUJXc09JWUZOd3VNek9yN0F3L1VD?=
 =?utf-8?B?cC9GZ3U4bDVKQVpKVy94S250R1pJVFRXUStHYjJCNDVtTlQxdndra2h0QU5Y?=
 =?utf-8?B?N3NxZXhxWENVYVg5MGFLWkp1M0NUMGszSEJQNUhTYWdGcGcyQ1RjZU1meTQ5?=
 =?utf-8?B?ODFvT1YwMzJtUm1KODZKak1iem1qWHdMNFgyTllXZ0FIc0dJTGtNaEsydkFa?=
 =?utf-8?B?OFZvZDJCN0pLeHFVL1VJRWxRL1oySFFYa1luSm5VUFcwb3dYMXNMU0NDaGR6?=
 =?utf-8?B?RktJWDFlNnZIL2F4eFlvTWNlcVFRbFFSVTBOYXlETm5teEdlZDFSYlU4dlNC?=
 =?utf-8?B?am0zd0dhc1JsNU9tYUxLc2k1cnA2UThzWGxkcjZMc0kya2FJVGhqdnVkWDFr?=
 =?utf-8?B?THZ6RWczcXB1RTZsMjNMaFc0NHZRSG0ySGJQRldiVE1IdHdoVUdjRXNqd1k1?=
 =?utf-8?B?Tlh6bno0ekV6bFM3V1NPQ0J4dGJleVpETlpsUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUloeGczMVB2aFpHTTBGS0Z5ZHpicG53ZWdqQUpCVGZ0NndPaDNlcEcwVVhw?=
 =?utf-8?B?SFRNRGdSbTk3NHdFVnFFaTBOL2pWTzY0aEZPc2RoK3dhSGpHd3Q1bXNoeWxF?=
 =?utf-8?B?L0piQktrSjhsdVNCOW9QY1NJMU9uZFN0OEQ1UTREVlRSYXFqRTlGY2xsR3Fq?=
 =?utf-8?B?bEFzWDhWVGNKdVc2QUlTUjllZWtpU01aWjNWVy9Zb2JWSjFyMUUremY5OGFj?=
 =?utf-8?B?QjdKMzhOeGkyeE85YUh6dm43K3lTZkhmanZTeHM1VnBJbkVDMTl2azlFQU1S?=
 =?utf-8?B?aE1uYnVsTmpkZ1dPVExKUW9sVkpOUVFVT3V5b1RWekxqUmFYWWhiTG0wVDN6?=
 =?utf-8?B?Q05aOXVRRTNiTUo2U3IzR3pWSFhiVUttUEhRckgyZXNqc3ZaN3hDczdMcDBE?=
 =?utf-8?B?dDUrZ0VNZk8yUk92THFZVkhJT3k0RW94OHRHNU05ajdVYlBYYmgyclJYUVdE?=
 =?utf-8?B?Y0R0NktOMy9ldTBNZDIxM29zODlkQWpRblJoQ3Y2cm5aNUJoRGhLT0lEdzdt?=
 =?utf-8?B?UTlCUjhaMk5KcDh2RlgzWjhDeFlCZFplU1NzbkdHWFJvNHlnOG8wQlFOd3pj?=
 =?utf-8?B?L0lsdXRJeHFrU0pNOUdBNG9WUHpNZGUrR2o3Zzk2NVBZUEo2YjNhTUVPUjhK?=
 =?utf-8?B?Z3dvVi82dzdCOStBMk9lZnFYY1FvZ05JeDJHbzBUTHlYbDExTGdweG93dm40?=
 =?utf-8?B?cHNrOFBQRG1ycmNxcHNwSExjc1YyM2FVeVJkVnN6NVlTMTAxVnJXbThXSFUx?=
 =?utf-8?B?SW1pSEd5YjVoTGxWeUsxMWwzS0dmRnU0R3dreTlONVJkSTRuOXMzV1A4R2FT?=
 =?utf-8?B?eTNGQVhyRkpzV3h1UnNQaG5kcEQrYW8zd2duWEExczFZUzFqTXBtckR5M2Ja?=
 =?utf-8?B?WkJLRzVuc3BZOEF1blFvQkY0dnVIaUZ0ZG9XU0xWb3NLK00yU25DSkNDa2Vs?=
 =?utf-8?B?ZmtYeG9ubENCcVdrUVlodHVnSDE1MUoxbXZjelBNZWdKRzRLeVMyemZGK2ZO?=
 =?utf-8?B?b3ZIN2dhclhqTGk2VzRuQVlEeVUzZ0pxOUdka0dROFFhaVMyRUdiUHZESmY0?=
 =?utf-8?B?c1hCNE95bW84eEFLRWlYQmQ4bnhJc2IzYnQvWVdJc1FOVklSN0FYSWVQUkFK?=
 =?utf-8?B?b2o0bEZFc2oxV3FkZUFUU1pHOHJSQnBFTytrVE9MblVHcEgxSHlSQ0dlaFJC?=
 =?utf-8?B?L3J1QlhuVmw5RFp5V3hYUTIzazQ2Y2g5M2FmVk0yN1VRTng3cjFUQUI0bXhS?=
 =?utf-8?B?L3FGeFJPNVhVZWVESDNFc2tXZ0RVSENxQkNqcjJSK2NtVXdESVVHNUpqSzYw?=
 =?utf-8?B?ODJkWVJTVDdCL3kyNzVxSU9uRTlReVNEeDdkSFpIQlRkV1A1L0lXM3lzdUJ2?=
 =?utf-8?B?enVzMGw4aHZkYlU4ZllwR3hxbmRiaVZvNnNvVnhZeVJXNzlsMFQzeUtqTjhM?=
 =?utf-8?B?VVg2eGhFK3hhM0QzNFRuNkZaZWR5dmNJM1VKNGJMNkJsWFY4OTFNNkVVRXZz?=
 =?utf-8?B?cit4bHRHeXJsNFZyVGZIU2swK1AyTWlER091WUVRaTlzeGlROTFSbW5YSFJn?=
 =?utf-8?B?eitnVHk3bi9XVHpTWS9GRmxiY0gzcVZZWnA5NERNOVN0M1lRNTV2N2Y4eEh0?=
 =?utf-8?B?UEZabFMxZXFPc1BzZmNBTHk1dWlRZG4xWTZFSjBIenNDMmJlWlhYM3FpY05V?=
 =?utf-8?B?aldOM202dDJISis4TjhrNGo2Sm5JN3Q4TG0vU3h3TXNPTisxTUhTbGpRdzZK?=
 =?utf-8?B?NzZjem5FcGhueEp0S1R2UGlidUtvTitwZklWNmRYSUR6aS9TM2hxT0VHSUdO?=
 =?utf-8?B?dU5qZ1VxSWNaT3NZWXg1NDhuUVNDZTlXM0VIRkxvcG5RVmdUTnNpT1p1VWRs?=
 =?utf-8?B?NC9OdmhzcG5YRG15MmxmNHFXSHQxZE80N1VYODQrZC9xbWFObW5LYnVsSXRp?=
 =?utf-8?B?OXpWSXBibE81MHVRNTJiMGc2NmsyRVFPVUtDbk0wV2VpRXIrTDJJZ0lQbUkx?=
 =?utf-8?B?VEFOZ09lNTEwZTBkMCttTTJ2cGZOV0g2K1NPME9FWUdBL0NyVkEvdFBid3JF?=
 =?utf-8?B?WUNCakJBZDgzRW1UWkV1M2d3SjRXdTBwc05LOW9YdkZBNzB2Y3JocTlackpK?=
 =?utf-8?Q?K9u0iuIrEojpL9nrGM/SIadQq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7479f086-3c1d-4e24-ad82-08de3c45a455
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:51:34.1840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDDY7Ak/9UIO1O8dR5EuvUssF7VKfckcd7eY+UifwQafLKFTdW8WDkXKsrNxVQ6sTn0mUDRBcYCjybsIGVwjyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_175137_645749_4454A886 
X-CRM114-Status: UNSURE (   7.89  )
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

Add compatible string for the Cortex-M7 core in i.MX95

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..ce8ec0119469c8fc0979a192b6e3d3a03108d7d2 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,7 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx95-cm7
 
   clocks:
     maxItems: 1

-- 
2.37.1


