Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD50C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 22:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+T2vCWDs8vHqngH/at9Qb/e7wkZP+AMlnAipwWdUNY0=; b=dp79EroqRx5p/RjHXHXDuK68I2
	te5P15hDn4J5Zs7ahE5wxWon87E+zgmLiaVHTXVnG9HQMd3Sp/JbOV6PEjk68IpNNKR/Awx6h228W
	BD4YYV6KmWOkXL/M+aIRubtB5uvxl73RNxPYp9UhkXCIXM2iH/4G++6QlO64hMp2k7iGqPpWQ7Gmb
	1+MXwnDFg6aAGrjZstwFgP8esH6lsd7rDhsjW+x1ErvC17G24aPG+DE/90Ue4Uo6W1G7srbt2iZQ8
	3KNXY3cpK4LizSGxlMAKtzcatLo6JfwGnIoztcdVxiuRYkYAgBfjSnOu7QZZ6nkP5daoJN6NI87WW
	9wvuTW/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2H5b-00000005WjZ-1lgE;
	Tue, 08 Apr 2025 22:06:39 +0000
Received: from mail-db5eur02on20611.outbound.protection.outlook.com ([2a01:111:f403:2608::611] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Gth-00000005UXl-30pS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 21:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hei6kiu5WFSruUOuQjlLAdJJYwDmNuoXxAeYVhtYkwqEdQSq3R/lYw1gYundnWPgykHxgfxZ9ru0sW5Ev6XTCHHDKjSPT/T/PvWXEPViTc4OPYe5HQbaZF07cJys73SeEfHaRczN2vzw3TjGNK6TdGsbp6CgD3Rh5OvSZuXoX65YK5ekGeFFpI7/gC2pY2MuPBcZdIQjP/t8OTvDKaGW5+FKMGdaUU1lqZRRnHFEBHMBkGQBx8U60cnXOZFXa9e1tVG38YqiG62rvlosfK1kQj5TJPxlOntKB1xpwSbs4iHOwZAOUGBr6ziVVO2tww2Bbe0XtxP9RrmyP53Bc5N/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+T2vCWDs8vHqngH/at9Qb/e7wkZP+AMlnAipwWdUNY0=;
 b=NrUnEj7kVneaNox9JOFKRqWJidfzBK/FlC5ddCMgSZVnGxvZH+U1d+7n9NCX+GsS1jt+vuR8KRv8vlViAs5Fo+H1YMbntPIXEkfVdl6Ldl3do9JSBaHALs9AjAiqxYSZ8Q4DJ8RlFncuk/bUQiVNh7vzHG2CHmt1BkGhLXTZpaAsR5sVtU1fG5a+1q1gaKZpO+mJ1mLjxDWgSe4ydNrAYrsimVXrocakXf3frrARm9/7Jy6GFjGEsEI0ukJdN4oropAgGH5BndLc8Yx2mulf33sXcEfes37q3nclh+GmZP+Tl/v8EMR+BnbmEEf518uyp3j9gOxdE4cM3HxguztRlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+T2vCWDs8vHqngH/at9Qb/e7wkZP+AMlnAipwWdUNY0=;
 b=M+11fB2NaXvchLIirUjsCyvVa8C76F04tS27r3NNpZGiYAqcGRRAP0mWFY3fWTxRWxHskoFsDgINbrrMV1MYnSPrmB+8EbxfdswTT+WKb9pqZtxSEVFb+HIEsm+3WFCLDPUJ0/Z6BBGMYl60+vXdubBijSv71Q6mlkhRBOIFgWAXhoDB/zZCM9A4wqpzIy045Dcx/WmoR4PdVFy7x3NbmAkbYiv9zb1fvyQ876Co+FqeLkysCXB/XdFr7RiJFfRebO2sLg8jKE1zazVYsE1rPg2+UKhVLWux22Ubg9t/qw0e4EBOPyiWcGZlcaDy1txJANneKaHFg5Qjtf/FS3MMHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:19 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:04 -0400
Subject: [PATCH v4 06/13] media: nxp: imx8-isi: Use dev_err_probe()
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-6-ef695f1b47c4@nxp.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
In-Reply-To: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=1421;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=JVcBDHXKyjksqu7qIzz9vxx7gKd9zWNURmLLuL16DR8=;
 b=ZVkcr9VeI+3SFFSmnx+FZ5T/+YNTKDA9vK/hrbZgXJdv5jiwyPKsGQRWV5RA49bnmuzzjtc5V
 hQXBOrfy7NyA7tuqbAKJMizhcC9yic1oNhZCbi2MuYRGnrUc3gCe3P5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:510:2da::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 7522b18d-0c26-4bbb-7e19-08dd76e7e9bc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUlIcUU0Qk1QdEgrTlJjcUNBaW1yWHN4MXdPbGxwYndKODdtc1FBd0hURDg0?=
 =?utf-8?B?RUNQUnF5TlRtMWdyNkxnUlkyOE52L2F2L0IzTWdPWVhaT3U5c3dWK1hIeGV0?=
 =?utf-8?B?Z2hHbU9PY1BLRzB5Tkl3RHRJT2RMRWt2aTgyTzlwaitRb1lXNmZJSFRJUWRk?=
 =?utf-8?B?aDF6aXdpTTNsQ0hsVmQvdEIxV2RvZWdlWmMyTVlvU0N2bTRQZWk4TXZvNUpR?=
 =?utf-8?B?N2diVU54bzdvQ3FTbnd2V3BZL3pGMzBlaE55Z1BsQWlBUEtkREdYZEt5cnlQ?=
 =?utf-8?B?SjZCU2NDd0RmMnFodzM3R1hvUnpWT3VId2Z0RTZSUG44UmZXM2UzZGpPYWdt?=
 =?utf-8?B?UGdHbWs0MWprQWNIeDdZV1NreldMOStQeFZWNWZOelFuTnpTZnJRemdyU1pO?=
 =?utf-8?B?VjgzTEVITVlRTVBZbmZBNFMzTlJUT2w1VUJUbjZkYlZNS3l2UmQ4SEZyTXg0?=
 =?utf-8?B?eDFtY0FtZEhONHhsK1NNWnMrRTUzSktuNjNDVnRZd3hoN0VKSE90ODVZL0NH?=
 =?utf-8?B?TzYxb1diS2pPYUFQK1hFNzhidEdqcTVodnBoNG5acHVHNXR6akttYlE3Yjhh?=
 =?utf-8?B?NmErNis2cFRFTzF6aVFXT1pnKzg1WUhuZjdLa0NFYVFoUzlRMlk2U1BrTjlJ?=
 =?utf-8?B?RzZPN1h1UTAwNEloM2J6QktHV1AxaXdjeEN3TWRJQ21xeGZwZEFIL2E2em1p?=
 =?utf-8?B?ZGJFbVVDejhjUDhhbHJWQzh5ZmhKS3lFaGkvVWJLK09hRjN5VnFoNzFrZUk3?=
 =?utf-8?B?VHh3VFB1bHZCS3A5RUp0K3RzU1NqUjd0a29XTlBGMjJYRVB4TTJ0OU1mOXhm?=
 =?utf-8?B?a2dSZjZGZ1UxVXFwcWR6a3Yya3l5cjh3L3d2NXIwSzZXdlY4OGt3Zko4Y1ox?=
 =?utf-8?B?aW5mNHBSc01xc2Vka3psZHk2VHYrM0w2YnJ4MHhVeWQydG1jSHRGclZaN2Zs?=
 =?utf-8?B?NUZldE05djZENlAzL3hqVHdKY2hzblZoaE1lcEh0N0M1QlAvOElVWjY1SE0y?=
 =?utf-8?B?Yk91Z3IrR1R1NDFLY3A0MzQrRVYxa25UWm1OTDNoRkFCU042Nk5JbUVKcUw0?=
 =?utf-8?B?YlVEUVlUN1lEV0NrOVd1cDNFczZiakovY1dpeFZuamdHYnN1cUtwdFg0R3Jj?=
 =?utf-8?B?S2tqZUVHQldYRGRJUWxuSzc5dDFLWXdSaFZzaEN6Y0NRdGsyTE1IbEVibm9L?=
 =?utf-8?B?enNrdDZzUE1sR050elNPZWhSZlBybEhIa3ZVQWMwaVQ5Qld4WGpBck0xeU5t?=
 =?utf-8?B?TGFqUWpUNTh5VVlqTzFTOEhtTnNUdFZ1aVNJQzJmc0RXWlZIT0d2ajA0SzhJ?=
 =?utf-8?B?OFRuaWZxZzJ5ck1WcGQ5aWpOWWF2TGU0aGpEOTU4S0lweEt2RWFGVlp4SHlh?=
 =?utf-8?B?bCtCU2xYRUV2dFhsV0o2QlFHZFBMbXpzRmdxNndlclVJQlRramxFdzFBSHNJ?=
 =?utf-8?B?Rk1BeHpaVVJDWWhDaklBV2RHZlFJSGtvN3p6RzBqYXp1WlVxbHdsalQrNjND?=
 =?utf-8?B?OVVmcFZRc3dKa3p4N3c5blNtRFhSR2dIRFBsUmczaE1FYVpOWms5WHc2RzRo?=
 =?utf-8?B?TkNpQzlYdXpQMGQrZGdzYmI2MVE0K1hmb0JxZXcwQ1QwOTk0UzFLZVlOejhj?=
 =?utf-8?B?SWh4MjFLNEFTOUw2Znpna1hpQm1GYm9VZmhtYURRNkR0Y1dOa0REUEt3Sndx?=
 =?utf-8?B?QS80YnhiREozZEtONWluYkc4aHRUdVRpQlNRNjFmTWFmbDU5UzN1ZzhIdzh5?=
 =?utf-8?B?cGNpRXVIVjR4cEU1NmdHcVR0K3hhSW1nT01UMkVaNDVVc2lxWGFNV1BMNGdq?=
 =?utf-8?B?aWpGaHRxVlk3b0tDTzlrOWUvbnprVHhReUVGT05YWjA2Z3lJNTRPazVVbnFw?=
 =?utf-8?B?NVdHSnZzVnNTdzA4UjA4ckp5K01FVEhUZlJPbytidFZQc3U0VS9zcDVRNnVF?=
 =?utf-8?B?OEZMYkhucE9DNm14VTNvMXlMRjB0aFdOckZnWHJBNFBWNEZmOUpLZXZ5YmFT?=
 =?utf-8?B?ZVZEbE8xWUVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWdiVmQ4V3ovY2NTeGNyMi9yTUp6RUdmcGJjTFE5YmNVSWkwRmMrQkNQcXk1?=
 =?utf-8?B?RXZaRzFDSjJkWVcrUTY5c2FCSlg0NW1MVzl2MlQzKzdjckE2Z0c5c3ZFUFZQ?=
 =?utf-8?B?ck9nSTJWWHNlMWQ0bHcwVFZrZUhPQXlSclBCUGxmQTQ1ckp1U09VNVdoQklB?=
 =?utf-8?B?bXZrR2pOYlVDYkQ3NVVsRFNwM2RRL3JJNUpibzlzdnEwTThPR2xDRDlpcFNi?=
 =?utf-8?B?RTdiOUd0eFFJL0Q4NllMRjNhUFdqVEo2S1R5RjYxVWMvL1E4M1Y2ZHhoalQ0?=
 =?utf-8?B?NXhSQUFjd25Cd1ptVFFJeit3TTIwOHV4NHBVbTVUOU9pc3J5bWVWbzBPaUdl?=
 =?utf-8?B?U0xaOFd4R0NxZGJ5Z0pFelVINmlXQjlNUjl6cXVzRURqTFl2QnJOWUh4Vjcx?=
 =?utf-8?B?bVVnNnJPRDZCMEhmQVE0eEx5RVpneDVHNmZTTUtnYW1yR1BnekJOWEpVVjhR?=
 =?utf-8?B?WTZQckhOWUxtdG0zYjdMNzhDREdYMFZDUk05aFZJZW41ZE13dm9BUWJUMzg1?=
 =?utf-8?B?OWNwNGl1WVVzekQySi9GYVNuTWxFbGRPRUNkK2NFaWYrM2kxMUFRdjVJM1c5?=
 =?utf-8?B?Yk43K2JrZzZnOTVnQmVTY2NNVVVkLzlGYzFsYzVkcmhlWFBWV0JzNEpocVhB?=
 =?utf-8?B?dGQrS1I1Vit6bnhkN0dZTjV6TlY2MTVXQjNuSVhWR050UXFwZFNkMkhrMnIw?=
 =?utf-8?B?MlNmaUFCU0o5UWFGMnRKUlVEb3Fvam44NzB3L1Jma09VTmF1Zjl1Mjc4OS9O?=
 =?utf-8?B?aU1HWkY4blBScjhqMG51WllNUW0rOVBJcWdXdDFPdy9RQko3MnROTEJ6N3pS?=
 =?utf-8?B?ZlNwbk52Wk1EajFPZFR4UUhJc1l6aXMvbmFJckFtNCt2KzdINDJvbHBtRHlP?=
 =?utf-8?B?Y3h0TFVHamxyNWw3QnRjMXNYNlR4cEQ1RExXM0svLzJSa0l2TGZTTGlVeXFS?=
 =?utf-8?B?NDkwK2tzamxwRWtFMDV3bUh6SXJHLytxTDhmemRoL1pSYWthbTdLcVFWRERl?=
 =?utf-8?B?NTNBWVcvNmdoeWpPcEdqZW1rMnEvOE5JRXMvM21USTVJOUpYV0JxMTd6d0d5?=
 =?utf-8?B?SXJKTWZ1RmpId3JieDRjMVBsTE4wV3hjOXp2WVpqUzBUZWh6MFFOSU1LNmF4?=
 =?utf-8?B?Um1IT00rRXRtcWErbVIvVHNuUjFHbTR1QWJ3SlVIcHdTZnhVajJQSFprZE90?=
 =?utf-8?B?NmZTSEtUbmtGNitMNzJ2aG12WlJYSlhtTlI4bVIwdVl1Ymx2aVlNYjE4d1Vz?=
 =?utf-8?B?cGlaZzZPMXl5K2lmZmxtcEtFY0V0Z28yRWhWbW9hMC8wYWdDOEgwKzMwZXly?=
 =?utf-8?B?VW5MYzltTnROK2RTa2p6Wnh4RzRwekovUjkvMzcyV1M1UzE4V1NUemNpanNH?=
 =?utf-8?B?REI5NllidlJnV1RQS1l3WTFOOG83TmdhKzBlTTFQeWV0Y3FVeThaV2tKUkFi?=
 =?utf-8?B?UnA1K3lqeG8yRWVjbFdwL3NTNkJMeGE3dU93MVVJb0Mrb0hPdCtobjd5OXBZ?=
 =?utf-8?B?czA4SW9ybkNBMVBPa0p1bDg5eTVlNlhMY0t0bERnTkd4MEV4SUFlQmltZ1VM?=
 =?utf-8?B?NUh6RGluRFJMOUlJckdrS2RmOStNMnFlSFZ1L0gvcUxJdzlJSXZKUFBxbWZK?=
 =?utf-8?B?MDlxYjNEQ2Rka2dVOVFjQmhndXRqMVpGUmkrVWJIYnFBam9heDJxWG5rcXVN?=
 =?utf-8?B?YnZ5anlmWVJDaWJSOGh2NTRLakZqd3ZzVXNkY28rNE5hV0w2UDdSZHA3blhs?=
 =?utf-8?B?MGpsQUM2MnRmMVlVbmEvVHRlYkMrWHIvcXVXcnJMRVBPRzY2THEzZTY4Mk5v?=
 =?utf-8?B?WTFmeDNTeEZZcmltVkZMSDlqdDNVOGNCM2hoVCs4VUhHOE90dThzT3g2S0pj?=
 =?utf-8?B?MnBldlZZVkZDUGhCM1NQc2x3U0tCS3h1VWFOQ29YWWpMRnpNYXJhM1J3TFYr?=
 =?utf-8?B?dytnZy9ZdHdML20xSFhGUTlwL1VpaTJ3WTEzVHl4SHp5UEdTTDIxZVZkeTdF?=
 =?utf-8?B?UndtRk9KME1XSGhnZW1teEJPNDdYMXQxU0JOajJwQTFpTVNtZDNjbHpFQk16?=
 =?utf-8?B?dzZYQ1V6TCs4VWlBdGZCZURPRHpQc1ZBUFBmWFZDNmFDdWRaWlRxbTR6OGwz?=
 =?utf-8?Q?TxqPFK0EhmvLdbBr+v0KGUub0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7522b18d-0c26-4bbb-7e19-08dd76e7e9bc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:18.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxAQLACspjhR8fUUhk07JHo8mt9mAbeltC8pX1bZKTyF6tr4+LBAK+j5KsTblquaNaIubKm4Ez4mvq8Xb0X6Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_145421_760760_8F5B15C7 
X-CRM114-Status: GOOD (  11.55  )
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

Use dev_err_probe() simplify code. No functional changes intended.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 073ea5912de3b..398cc03443be3 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -428,19 +428,14 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
 
 	isi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(isi->regs)) {
-		dev_err(dev, "Failed to get ISI register map\n");
-		return PTR_ERR(isi->regs);
-	}
+	if (IS_ERR(isi->regs))
+		return dev_err_probe(dev, PTR_ERR(isi->regs), "Failed to get ISI register map\n");
 
 	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
-		if (IS_ERR(isi->gasket)) {
-			ret = PTR_ERR(isi->gasket);
-			dev_err(dev, "failed to get gasket: %d\n", ret);
-			return ret;
-		}
+		if (IS_ERR(isi->gasket))
+			return dev_err_probe(dev, PTR_ERR(isi->gasket), "failed to get gasket\n");
 	}
 
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;

-- 
2.34.1


