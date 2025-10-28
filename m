Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD91CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 20:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeCCiezoPOsRsE4ZnpktWCpq/UgctbxL/aJ2Spr/NgQ=; b=QanIcoo2tVl+f8S07IW4UkYH0+
	NvGKGM4RJmD57MTy7U6ZLNQ2cnS+csjW3amQ1vPwgBpUrvijpzG+DYvzT1SJE42nFTGu+TH2wIxqB
	tYiyt+PTwUsGhUhijACdzP8mgBV0nczKackIqEMbENl/llGLQBC2H1J39eRTlgyjWGlO4Jo6DBS/b
	WkZB5BMERFzSz9m18k3enrdSW4moPN9KSrKVvkZu+9JbZR9fmdPE+QQa17sdEjqo0RYBB32Ej50xC
	VULCB0jri0x6K3azim3AD/ShV3PlcQAaBO6uzWekawt6oNX2QYPdArpE896l+xyaLa8t0mLaeY6jD
	REPzwi2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqLY-0000000Gc7I-2lMx;
	Tue, 28 Oct 2025 20:31:12 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqLW-0000000Gc3q-0q17
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 20:31:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fphIT6fd+gt5zhc+Gwti5e8BdKT3ZlSL8+IyY0jluYyPzprggT3esVHGbLc8UU7Mt3Q5ANLMlhPXuIY63lgTbas/yV4gcviu0ZXUFrLWUWR3lr2jKGsUExUPn+xIXVl076tzqMTryslCdL45+v76/uBtYMhLnJFtFsbyUYuCtAHD++IOQYiUMLetsREnhe446XX71cj1jsq9J7WIn6sZCsBR2KF1IJgKzCIz2evAnzhMPGFY9Fi8knABSJnkGISpH0QILYAmffBwMTcNeXK3tiN2lFjte7I2Q/x9K2wwV8FFcLTbuz2VmC1xyXUkRLMEYdMe/3Tp5k5TmDbtPJgTqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeCCiezoPOsRsE4ZnpktWCpq/UgctbxL/aJ2Spr/NgQ=;
 b=OCKV4BfRZmc9RNptoVLWFBXtc9JCtdnqvIzXjxW+mcfYxLnqJM93Z/ReyjOf0jGxp/t23DWc2ckbX2a5qxOCTdXUO8N1DD0wkUjAZQGMW7aVDoCQb64YowqSWAQb+tBW13/Rcj44LvpCXkgpiTY22J9yPJaYl1oElTdRdY6iPgeCQ/qIJTKS3Th9GGRD5oCrr/8JMD6C+7noh/aNQm2vz/qL5bUudgXkmuZkEEdJ/SmuDpiAxN7kD37WhuL/oMmIbt/5526YALhJYKufI2z53Vis/1y51DM30usdDKlot5mQNWhEO3ETa9agGvqS70TKCNWU7XMP5NkFaq/lFbTZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeCCiezoPOsRsE4ZnpktWCpq/UgctbxL/aJ2Spr/NgQ=;
 b=ZnVjmFAB/h3waYOeFdUW3PHrFFvKJwTF/m0OErfnF/nLPEsCRjr29OXL/cLyvOaK+sG4pt+Uod6ahPatoPaPzaz+2uHwuAA0Xp9ta6l52gmX9kcLB9++r7mcFRuwm0ykHMAle4FUCnhHIn8yDDu/oGBAaCPHQutDzDWGiUbvdtG3mVvDQhDkDiEjyTtWJWwqAJZorLtRu+v/3DwKxKfhfbM7oKEubWwvNAXDHGSDd8KYur8gyREaZGrBhxoAuTqEkkxqaGw/fakBCIv96UAMWUgbitUPYcIV5hJ5QeTE8OP5N0kGzlWc4eL4Jxq4g0/LG7s2WjhNHK9GE0Ln+0Sm3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB8820.eurprd04.prod.outlook.com (2603:10a6:20b:42f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 20:31:05 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 20:31:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 28 Oct 2025 16:30:44 -0400
Subject: [PATCH 3/8] arm64: dts: imx8qm-mek: add lpuart1 and bluetooth node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4_qm_dts-v1-3-51ba94389c1f@nxp.com>
References: <20251028-b4_qm_dts-v1-0-51ba94389c1f@nxp.com>
In-Reply-To: <20251028-b4_qm_dts-v1-0-51ba94389c1f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761683454; l=1274;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=5jNhmEK6dGjiFsgJlS/TJQDgBrbYqiMg3pm4S7hhJ6Y=;
 b=oLvbAydFWdPnBN8TKa8UB9iJU4OyqG6GJCAlonAOei9/U2qhXaHgx23slqdCmynYcmdfAC6C4
 965Hpsc1cBgDMrZFeM46oDXb6pMb2skLBwEUM1nAPpPoYCZH0np3/67
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0PR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:510:e::6) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c8a249-14c7-4c1c-11ec-08de1660eb2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVE2RzFqdUlXMXV2b1htVi9sWEdBWS9JT3d5c3NUbk9ZSWVrSWx5dzdTTE1M?=
 =?utf-8?B?aHhiT3Y4d2lNZVcrWVFaS0paMXRjMStjWG84YUlxRUJDTVpHNllCeVlhc2pu?=
 =?utf-8?B?ZFM1OVZvSVhGYVZkUWxSZHE1UllIYzFObGkzN3pSYWh5c01RdGlJTzBJelBz?=
 =?utf-8?B?QXB6MFZOSVlaTmYvWUYxQ25ORGZmR05oRmpmdElNMXp6YTNtQ25GUWtNaWp5?=
 =?utf-8?B?dkkrQjZZaTVPcmhsUHRYM2JmcENPREJGZG1tSFhubXRzNnlkcFdRaHhINGlX?=
 =?utf-8?B?ajZLNVVITE5jU0dubEFkcGF4aHhXc1RBczBNZlZrNzlXZVBDbm1ZTWtKcTc0?=
 =?utf-8?B?Sm5kaHFVSEEva3VkMWgyN0VVbjV1ckV6bXl2Ung3blNZMjdodG4xOTY4Ykp1?=
 =?utf-8?B?YjFUWHlMTnM4eExyYVU3dmN2THBOZ0ZPNHIvTEFMdFlPRlZLM3hFdU9ISmtL?=
 =?utf-8?B?UzRaVWZWWCttZGtKOFBrZ1UxcjlFa2t6ZHhXNnRuRkFWNFZiNnNFcFlaY0JH?=
 =?utf-8?B?cXlVcm51OE54UnV4UUhGb1lkSUhoRVNzcUlrZXVSWXhvL3o3MDIwNVNBaXZS?=
 =?utf-8?B?Ny9aY05xeWJ5eWhUQ0xndGgwUU9GRm5hQnJiUzQxdFRLRXg3ZUJaV0lVb0dq?=
 =?utf-8?B?WjZrcVc5NTh5V1g3VVA2UG1Hbi9nN2dMWlRHejh4N0p2TGI5Wm14dDVJVFRw?=
 =?utf-8?B?cmozTlB2Ymo0aG5BdnF2TjhKZnhmY2VHS2l2dVNkcmxjN2hVaU1qUDQxQk0r?=
 =?utf-8?B?bG9GS2YvUW1XQWwwV1NWMmZ3aTJJdzVWakdYMjRISzdaeEJ6c3BOU1greTh0?=
 =?utf-8?B?SGs0aXNwOU9kaDZRZUVrekFnYjdZdmVpZ3BTd3VQMCttM2NTSHlVSWJreUlT?=
 =?utf-8?B?OEFobU1xZnpaNEtDdEhQcUZIYnY0bUpVWmwxaWZOZnYyNkNkbXlYaExoS3pr?=
 =?utf-8?B?U0VoWXFUV1prRHBsSGVaTXU0Q3g0aE41YkdldzNLamVMcjhjbkFmNlBsaTJW?=
 =?utf-8?B?cllZcDJlY1Z2cmpCRC9UNlVLRndFMk9jL0xZSTR1ODZxK0g0RWpRVHBJZjJt?=
 =?utf-8?B?T2JTT2dCMFN4NUdFdk82YVI5Z1h5Ty9Fdy9PV3lXN3JHZTYvdHNsaE5Ic04y?=
 =?utf-8?B?SU5ONVNOa2F2MStaUEp1OGE4NjlhNkxaNXVLOSt3dTFKSS94L28yNENmRFFn?=
 =?utf-8?B?SFFKVEZ3QU9oNWJDMzJ4MlpUUjd5YmdBWUxVOUsyME9YODQ4TVFJa1Z3M2pU?=
 =?utf-8?B?MlV0WXBBYjlzY1lWbkJUQys5dUFaNUtuVEl3eSt1Uk9lZGRDMVQxQXlZK3BC?=
 =?utf-8?B?TjJVUXNiTVIyNTZyZGFHOUJxL2prNVM4cFpyb3QzWlVLOE1OaHB5ZzlLTENB?=
 =?utf-8?B?cnFvZFExVDFPYmZVcmpnUlYrWHlyd1A1Vy9TV1E0Nit0MG1sTGR1YzB4YVBQ?=
 =?utf-8?B?cmkyTGFFSEh4UVlUSS9PazIwc3pGVHhVTzJMQWRPd25CS2UzSmNhT2djQm9W?=
 =?utf-8?B?YjNyUEZaSzdSL1B0VEJBWXo2RVRlVUhUMTNJTCtBSktybHNHVExRMVF0cGhh?=
 =?utf-8?B?azZyNUJRQkh4VThWYlBFZmttclIvT2ZaMWszajMraG94OVg5SlhTT0kvUHBt?=
 =?utf-8?B?a2pRL0ZRV0tEcUNOSVVVSmJSMGJoUlE0L2U3em9FajVheXVZenQ3Tis4SWtU?=
 =?utf-8?B?Nis0TUxvWTQreGJZaVVGRzdYMlVWV0xpUEJOZkhtSGkzd1VRZFRRVmR5UTQ4?=
 =?utf-8?B?aWJZZEpkZXo5dHY0Y211UlJBK1lvMGN5SFVlWjN6cjYxcGpGWUtiVU5nT1Yv?=
 =?utf-8?B?WWQwVkxoOXBJd0o5UlFvdWtYaFU2M0tLTHVjTW1Pa09WM1hrekdxaWR1K1Fp?=
 =?utf-8?B?cjZjZ2J4cm5HK0o2MTJCOGdTZFJVMkdXK1E4Yy9mOGdONDFQdnhLNlBDQms4?=
 =?utf-8?B?YTNwc0tkUDY0WWFpVzNOb1Z6UVg5ZnB0cUJrNS81ODFvS2RzMC9HL1lZVFNV?=
 =?utf-8?B?ekpvM3hFUVBFeWhUYUEzNUo0ek9XQmM4c3pUWEhlZ0pVN2FvRkROQzhTZ0d1?=
 =?utf-8?Q?H+6ABm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0RVYUpMZ2E0M0xJb0w4bWNKNGRCRSs0RElOWVlEb0MxbDNvSmNuZS82QUd6?=
 =?utf-8?B?NnhPQmQ5LzNsUGh4Y1dWQVNMYlIrTmJMUEpmVzFnYSttUVkxTXQ4VmNxRjVK?=
 =?utf-8?B?VWhNeHlnc2w4b1lOcTd6dHB0anYzNnRackF2eVdWN2luMTI2bUhCMXowV3ZH?=
 =?utf-8?B?TENLb2xhT204aGZGZkt6V3JaUmJEd01ieTcyekpWU3ZYY2FXRFU5bk9BazlJ?=
 =?utf-8?B?bUV5ekVVWW5VSHJRVUMzcmsvbmFMOG9aWE5uOTNUNldYSXg1SVVPbFRLTTRQ?=
 =?utf-8?B?RVhmWnJQaWJxNlVMS3JuZ3BRYlZpL05pS1V6SXU2aFZqWXlNalljcFhEcE5y?=
 =?utf-8?B?bXdDS0tPejNGa0NCdWJ6Z0V5MC9SWHFOclpYbUtyV2VDb1c4RTU3SldFRUY3?=
 =?utf-8?B?ZHI1UXAzTlZvSjZZNDhxRTJqR3FOeXU0QTlVSCtFNEJrV3NvUWhQOHd5ekND?=
 =?utf-8?B?OHMza28vTWJGYjRuZHl5NFNJMVRrTUJ5bFNUUk01ckp5c0VzV2dPaTFhY0Fn?=
 =?utf-8?B?bmRIakE2aVorQ2c1eW1PUnFvMFNHSG9Sdzg0L0lkbHlxUTlab0FheWY0VUlN?=
 =?utf-8?B?ZHFLRU04V2p3bkJGRlVXbCtkbnBCdDdWMUFvbXZFMkR4ZDZHQVpEaW5SRXdF?=
 =?utf-8?B?ekpLeWwxOVhxNzV2SDRTUWkxd3NPMFpRU21CNVR5aGNwUDByZUl3d24yNjZX?=
 =?utf-8?B?YjFKSGN1VjhoaDZ5cmkvalhYTjFUS2dGYUVsWThEU2EydVZUVjk2M2JiN3lX?=
 =?utf-8?B?ZTlsNFZyOUVYUXA0WTdLQlFnRXNIdXNKWGU4WjZrOTFucnlVTjczb2dPM2xG?=
 =?utf-8?B?Y21JNXhHdnVHb1lNZ0pnYW9oTXRXN1ZrVGdQWXdDZGdqcDF6OHB5MTIwZG5W?=
 =?utf-8?B?YmxZOTgwbG1JRk1FUHV2U1pIdnFyYmVaMnlrb056VUxFUFg4dm51ditLUG9x?=
 =?utf-8?B?WUJ4aG12eFZMd0pKS0RUTFB6MVdrTHRhMEtZdEJjRVk3azRtaVUvQVZRRFgw?=
 =?utf-8?B?eGFBd0t2cWZpM3FpN3RpM0NuRGNGWXVFU0NnVDR4a3JUZWtFMUl5N2VPTHNn?=
 =?utf-8?B?dWZ2dEd0UkJwY0ZlOUFyYktXWFpZU1hKTlRiRWpGTlFRcmdWVDNUYWNXT1BL?=
 =?utf-8?B?bWJ1d0JybzdtRjZBWlRGUWNXOGFrZy85Y1luR1JsY09OZHAzUC9WdVl0ZzJm?=
 =?utf-8?B?aTlzT2F5VGE2c0FueHoxVDJHNUdaNDU2L2V3d2gvRjNJeGlueVk2RFp4V1J2?=
 =?utf-8?B?dnNvc2NTalBTSWpTRjZMN0dYZ24yaktzM3pVenZyM0tCaEFzZ3Rad1QxSVhq?=
 =?utf-8?B?clBWdjJIY05pT0ZyYzV2bVE3Q01vMVMrcSs1SFRXbDZ3Q2ZPV0hURk10V1oy?=
 =?utf-8?B?c0NQQ2dGQmUrUnJxVytoSldnRXlsOEwyd3RWcXdMOWo4WjQxZ1hyaWRTdzBH?=
 =?utf-8?B?Unl2WUU4dlM2WENIWU9TTTZKSGdMd1Y2VytjUFV5aEV2a05mRTRYeVcxMmpu?=
 =?utf-8?B?MzNQaDN0QkhucDBOVVdvaDhEKzlTQ3lvV25OYThjMmo0UlZRZElQMzl2WFZW?=
 =?utf-8?B?dWtBTmtwNDNxWlhCdi9OSWQwanppdjdyWHFZYVIzeVBVWTFoQ3lJdWh3N0Nl?=
 =?utf-8?B?WnRMM1p4MjBFL2lTaU5qN0tTaGFBdU1ETHdhNjNhelhKNWZybjM2VXRESEVa?=
 =?utf-8?B?ZFhyeWVaTTM3QUx2WE9QbGNyb0tIRGN4RWVBTmdMbGxkUFZoS25EbUJWMlVa?=
 =?utf-8?B?QlhmSEZIZ0QvWDlRNmdSU3h0aXVneVB1ZGNkY05WV3Z1OXhRYUZrTVBIcWJF?=
 =?utf-8?B?UVEwRmYrc2IyM25GZW9ER3A5TklQMFpxa09kWUh3cDF3b2lUa01rLzdzbzJi?=
 =?utf-8?B?OFBIWmwzMVF2Skw0R1Jzem1uVk8za3dPZkNnV0ozcjNWcURBMXRxbnVRLzZ5?=
 =?utf-8?B?WFhaUm8rLzFsN3MyNjZXcStaeG5nYmFnK2M1TngxMlhLVGp5bjEzazd5QVhs?=
 =?utf-8?B?SjI4eXJXQUl0Yk15cURHNWwreTV0T1NVcjB0VFlMb0VJd1VZQ1czdGJ5bjZE?=
 =?utf-8?B?SE1JbEk3ZG53dDlSQ3JQTHA1NENQRUUvd3dmMitZQnVJMk8vWkpjZjRWWldI?=
 =?utf-8?Q?vAkA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c8a249-14c7-4c1c-11ec-08de1660eb2f
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:31:05.2761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfV1jHJ6kbrVkDvmmlSv7Cfw1XsAcfHyzX6dSw0YlfcH7t7DQMSiYpB474RICQo0CVKIfFjVTngMtAjyqzqxFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8820
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_133110_274522_04BBCD9C 
X-CRM114-Status: GOOD (  10.10  )
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

Add lpuart1 and bluetooth support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 44b8e9c75c59aa31cf9dd04c3d03be047ef82ff9..a88e8600999adf53e66785e608c6231bee53b162 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -686,6 +686,16 @@ &lpuart0 {
 	status = "okay";
 };
 
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart1>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpuart2>;
@@ -1098,6 +1108,15 @@ IMX8QM_UART0_TX_DMA_UART0_TX				0x06000020
 		>;
 	};
 
+	pinctrl_lpuart1: lpuart1grp {
+		fsl,pins = <
+			IMX8QM_UART1_RX_DMA_UART1_RX				0x06000020
+			IMX8QM_UART1_TX_DMA_UART1_TX				0x06000020
+			IMX8QM_UART1_CTS_B_DMA_UART1_CTS_B			0x06000020
+			IMX8QM_UART1_RTS_B_DMA_UART1_RTS_B			0x06000020
+		>;
+	};
+
 	pinctrl_lpuart2: lpuart2grp {
 		fsl,pins = <
 			IMX8QM_UART0_RTS_B_DMA_UART2_RX				0x06000020

-- 
2.34.1


