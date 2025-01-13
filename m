Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FA8C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 18:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5tDeG36IqD3nJeLXKNXy+PCm263s+64zlgeNuAkiXI=; b=jmaENPZzwvTEyRxy7EMydwHOtz
	W5hXzTdYKcC3pWME70XfZgiTMGN01RDakDBuY2EbR4fDejImguV9s4/ld0mKHv0uVRQ60wr3+WI0W
	kSn1XigRhE4CmGejCnBc08w8+GynlXGp/zBxA8Vnx3yNkYPZmPL9wWrq/j7B+DIopBJVKz0UiDt5p
	ozHudwfY5ube0dD7Iq0gDxxGNYV7gvqI1vI22Zn1bu5wlvePibKdGNtwHiNXdo60ZGHcJR6kzkWfN
	QETWt1a6/+PAe6YlNMEnETvQ/GuOByVa2iHH+LWv1Y6pBbnZDNuChV8HfJ3/uMvvGrp8C2yAJjgMs
	dZK8POig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOpN-000000069lX-2WHE;
	Mon, 13 Jan 2025 18:06:17 +0000
Received: from mail-am6eur05on20606.outbound.protection.outlook.com ([2a01:111:f403:2612::606] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOlm-0000000694X-3qAF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 18:02:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I46MFGDsEtaoZD8GeezZFAM93HUVTVLKMm/BL9gGaBbxTMnh/0IyW4qykbNBKZVD/aBy5IEjWNN2oBm1nuh7E5qLafQbZaQDfW3Y771cb5qk2NL6RoBWBJnu2PDhBA9+ubzVNN8jk6oiSHEeWApCZY5SKegcjkiaQMaZ0pJKtIfmZO37pKBGJxJlx8VQRURR9IkuJN14EN5lzZo8kl8vRxdAEXGBN/GgqOuSc8ELMtboUevuuQpyswLG/UTqkZBZNnINRw22NbDtQlmObQgT32qC9z2nOMeCuUPQYV4VOMlWSyhZVqVw3Ja95cAbM1C9Jz+tP5LE70QgVwbQQpyROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5tDeG36IqD3nJeLXKNXy+PCm263s+64zlgeNuAkiXI=;
 b=hlnrWPePLfvpFEMTJxcTmn/zpoo3XMCUr3EeAAl5Ff4kfsPc0pyWs7Cz6m6/Nzd8rIB3yBvBj1dMAw0+IDee0JB376zkcfjN6PRf500MlIaoG5vRRgO8/AeEzPhULbo1SZn9G7A3oSt3PT2PsKa+TLngymSioaJlMaFAqTr4AV1mh9YH8P2lHFBy8hvZdzked9HlW3s5HKxXWuJbkblPwJBXxHQVrrDShciByiSvoA0BgxVJ84gcFq6cv7TX2OzH/N9qRSuCowpZ35TmWwVCo4Pj/GH/18mkDJWRtEOCc4FOMWjVUx9oH2xTNaczrI2l0x/eyszJ70m8PUN8ZyJlGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5tDeG36IqD3nJeLXKNXy+PCm263s+64zlgeNuAkiXI=;
 b=ibmNUvHLaznCJcspjbY0GrtbaFddabGMz6r7iG9CbzSske3jVeW55QaajSWfxe/cW5DJe1XuzTXflAGGSKaSszbU5JZpS+RfdEDObMpyn8TvDDwJxG5ilU8LmndngNGB/B2mXcqjsDXoSTLGgjGBZ4WdQY8xGbI7iHg3KeOCX+3u4ouHbsELDSe19B/f+kYZkZhMQEQt7GrVuhX/XaMFh/slCXSD5kLpePrT3yXnRB/+Sa4g/zpCUsogZPfl09hYLG/G5UVhYm/imUQDwXDpy/1YAe2IaEnnAML+vgo1winETW1LNoNhdeZ1CYCmhBBw89BYetGoSYH2QFUnlqJk2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10774.eurprd04.prod.outlook.com (2603:10a6:150:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 18:02:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 18:02:30 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 13 Jan 2025 13:02:00 -0500
Subject: [PATCH 2/4] arm64: dts: imx95: Add #io-channel-cells = <1> for adc
 node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-imx95_15x15-v1-2-8c20cbaab9ed@nxp.com>
References: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
In-Reply-To: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736791340; l=659;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jXYHYmPl19jXYojLzXNGE34gMOyMmkAoiqp6CPMxh5k=;
 b=vd0yyxIYZjC5blhtt3dYS7pKR7T5DVaJsTk1jTosi+iubSMYmLQ52KiMMTVSQ+2x0dOXQvL1a
 H1Wkh3CHFiJCZ2JtFHuyFU4Oe/mR+sv9rAJ9VdZG482a8FM8lspjKnl
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: 0115ddea-c4be-4bbd-24b2-08dd33fc72ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z09BMDZRQzgzNE94U0xtbGZVMUlBdWNHdDZwYi9tM3Izb0VmZURyZmNEQVhx?=
 =?utf-8?B?a09LMkw1WkNQaFVQYkRmcURqUEVJOGpuZ2taR1hwOUhGSUgzWnFZcTlOajlT?=
 =?utf-8?B?Y1orajFici8zMFVlaWZlU0xHczBhZWE2UVRHbGtDbXk0UVVDUHRWZE42Qisr?=
 =?utf-8?B?NythZFhiWGwveStHZHU5YjB3V0pUTTNidU55L2FIRy9PYUlnbCtleWVEdGds?=
 =?utf-8?B?cnF0eGt3MlpmbXJ6WTZnQmxhS3lQczR0ZzhCeTl0UWtjcFhpMzZ6YkF6RUlk?=
 =?utf-8?B?VGphaGhvSVlsZmNjUHRiN1k1cVJIalYycXhJWEFPbDZNUndjcSsrZHNsWEZo?=
 =?utf-8?B?OFBISEZlekZSZTN5elFiVUFkckJsUzd1OTJ0NnZLUExWNzRKZ0JaNkY3MEhk?=
 =?utf-8?B?cFYveE5wKzdYK2tOTGdzcUpNRWk4UHpFK0Vvcy9TNTFIeUk2QWhzK01lRjIw?=
 =?utf-8?B?VDhveHN6V0EwdVJQeEx5dFlUK1VLaXlId2NPOFo1UFdKN0gvME16L0hDeHpV?=
 =?utf-8?B?S2x4aVNUUndzdWdtY1d3WUc3cXladWNaNUFrSm90UEJ5TnNROW0yb0lHM29h?=
 =?utf-8?B?YTdpVkNxOVp4RzlpM3k4eWpFR3BQODgwRUxFT211cG53T21PR0o2TWd6TW9u?=
 =?utf-8?B?eFovY2pBMHUwUFU2bFVta0NSVkVlYVBCWWtQYWxPMzFuaEM4cWd0blhwK2Rz?=
 =?utf-8?B?dkhadnA2Vlg4OGI5VlptYkhUc09ncU1rSk9lUTlnQWRLekhwKzRIWXh2Q0Vq?=
 =?utf-8?B?cENxSjRWZ1pKY3h0anZtdmE5Y1ZZeVRMNFp3T3VmaittSlR6QkxndXcyK25F?=
 =?utf-8?B?UGwxUkdUYUY0M3dwTTI0SXExeVpPZktPUS83d0hKV0JNcHRXVDVHRHVDUlNH?=
 =?utf-8?B?ZlNtZWdyRjZ2a1NhY3o4VWI4YzlDSEd0M2wwa3JTekxURkozVWcwS0E0aFA1?=
 =?utf-8?B?cnpmQWpOWHBURG41MTJTUEVQYjB2LzUvVGgvQ0FaQ0VPUVkxQXRLUjlGZmhD?=
 =?utf-8?B?Q0ZDbGlJaFlQS3h5N3NTRXZZYTVhRGk1Z0xFVUhwSE1FYkdLWExpUHNYN2FH?=
 =?utf-8?B?dERoQ3Z5M1hzZ3g3alJnTS9HTzNMOEtEYWJldGdpK1RZa0xyWUcwVGo4Mm1v?=
 =?utf-8?B?SzEyUWhuU2JsNDdqRWQ0d3VMSncwbXIzaG5wT2FnL3hITVVRTVN1ZGZ6cU5Z?=
 =?utf-8?B?L3EvU0FXeEdseUFGVXBtNjlsUnZyZVFtazIrQ1JrUGdBWSsvQW1QYVdkSmlR?=
 =?utf-8?B?enozVUZldDNOV1l2eFh2d1o3eUNTNG41cENvUzUycko0U05BZHlhSEZKNlRK?=
 =?utf-8?B?dnFTT2xXMHNuTVVCczNVVTliNDhVb3d3K2VMaUJEdHdIRUk1SXErVUpFL0N2?=
 =?utf-8?B?akFQeFZYS28vVlMrMlN4MkVnZmwwQWFPT1hTZmZFSXAxODh5WTdJZDhvaGJ5?=
 =?utf-8?B?dkI2d3pCNUVrNEgvcFYrYUl0MExaQlBCeXNqSU5JM1RMYWRJWStpQkVNOFhr?=
 =?utf-8?B?VEdITVg1Z1I3WVNyWTB1WEhocjhyenBnb0MwVEZzQmFNRGV1b1IxQW92cDBX?=
 =?utf-8?B?TnpwODBKbHNsQ1RubHhVNk9qSm1aeWZJT3FLa0wvLzN5ZmFBdVlkVjhzNUpT?=
 =?utf-8?B?VXRGTklHZkFicDFlbnhZQzJnZUlWblExdnZsN3FTMmVZRzFCWnN3MTZvSmVD?=
 =?utf-8?B?Z3JvaGpHYzhuRGUwcGZUaEJGUUxqUCtqd01OV0RZOGVoL0FucU85ZnIrbXJr?=
 =?utf-8?B?czVta25NQ0RlMDRVZkZjVEVMZ29kUkNhTjB5MUM2Qko1NVNJT1NBdndtT1M0?=
 =?utf-8?B?ZkVWYmQwQTFiMzVUZVNRQmlReVpwS1lnYVVRMXdyaytFUnA1STkyREVOdmQy?=
 =?utf-8?B?dExmSHNYTmpEYWVCUG96UXZnaDZIL0ZwVVd0M1pQWUZpY1RDVVpvdVhHZGh1?=
 =?utf-8?Q?b9pH3m5tJhEy/xabIPl0GhECUoLLlHGy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnpROU9CYWJlSHVxbzNqangrbFNETXVaUEs0MlVscGZGYlQ1dW5vSjVxMEhX?=
 =?utf-8?B?SThCL0VjWVhZb3ZaRFNVcmIxT0NQR1QyaXJnNTdSclRjcWlWUGFMbm5MYWN0?=
 =?utf-8?B?MDQwWUwwZWdRc0M3WXpVRk1GODEyTkh6ZlpnV253Tm95enE1QTRhTzNGc2VK?=
 =?utf-8?B?ZC9QcWVIaFFMYW5jM2I4TUNzUEkrZEZQMTIwTEdkMnRPVmVYTXFvRVdIaDNB?=
 =?utf-8?B?QmQrSDdmZ2FBOEk5ejEzUzlRVDJDNEt6Z3pDNTYwbzFsME1SYVY1SVJpQWM4?=
 =?utf-8?B?aVdLZHd2enJUSXVrYVF6bmdMdHhURkpDWVBoUHZRTzdrUjliS2duSXN0WDQy?=
 =?utf-8?B?MzdLNjU4QkVoUHB3WWFSU29taGRnanVScE10TGVUWnRqZWsvdzhQdVBUSTF6?=
 =?utf-8?B?RlhZSExkbzZEaTZPN2x5a0IrUVVuWkFrUjFvbzRrSGpuazRoK3d4MkJodHBS?=
 =?utf-8?B?N3ZjQ1B3TXFYZ0FxQ1lGQkhKc3RiWVQrU1FnMzJVQmZpVlV3bGZFY2R1Qlk2?=
 =?utf-8?B?RVQxRzNYNkNTaXJIYWM2dGt1YlBXOXNpdFkraS9WNjFzNE1ucXcvaEoyUkdO?=
 =?utf-8?B?eVQ1djMwZEdwNDdlY05FamZ4NTBHbkNjU3JvUjc3UmdZbTVYRFZDMytkL2Jx?=
 =?utf-8?B?aFB0RFhzVm96R20yekthbkg4Y2ZaS2RZcUN2Yk9LcVRDNW1XbVo0QXBtYjhN?=
 =?utf-8?B?QXFRQ1pkNFVxTnFldlhxdWZVNmVJa0wrRjNQM2w0OGxwc1I1TjQweHJhN0Z3?=
 =?utf-8?B?Q01ZUXcrcVhOeHRkTm5KQ0tSTEYxWk9uQjNxK0ZYT25YcUFuMDM2TTk5UEdX?=
 =?utf-8?B?UjU3TGI1aUEzVXJoTUZZZk0yNGJmM2VwRHRXZFcvVzJLWlkrc01JMEhPVktU?=
 =?utf-8?B?MHBOaFN2MTA3QU4vMEtPcm83WGE3YlMvSkF2VDNyZjF4ekJSZjZiakxHN25t?=
 =?utf-8?B?UmJ6WDNtaXU0NGpjNzRieER5S0c0SVllNjZWYlBOTEExSkZWOUtZc05FSUxp?=
 =?utf-8?B?YjdFbTh2aTEyM3NTOXJTdmxhUWlYaUZuTXArTUEwTDBaZDRkenZHcE9GbGtO?=
 =?utf-8?B?WTJyQzFFcWlRbkgvUjR2MXlPMWJwNi9KQXdvZWpGb1RSV3BxdktBMWFLeGQx?=
 =?utf-8?B?SHRZUnBqRmhxU0xKMVBnVThUUWNoMjVzQTdhajRmR0Rxc281bVA4VjA1WmNE?=
 =?utf-8?B?dnlpYXdnVGsxbDNYdCtwd3JsWUlGUjh0dEl2WTdsUnpUNVJpQVBma2J6eFVy?=
 =?utf-8?B?bVVxRklpbmpnb3lXMkpPamJqaWFXRXlZRjJ5SVcvOHAxUmNXcmpSZHp1S25P?=
 =?utf-8?B?V2lEbHlldUdTL1JIdkM2ZmF4dE9JMW5VcUFCelpHeTFxc0ErQWFMVEp4dnFz?=
 =?utf-8?B?MDFaWHpwMC9RK0JRREp6Y3BUK2VteWNuZTRrcmF1ZExUN296TE5jcmhBNUFM?=
 =?utf-8?B?QW0xaHZscVFXbDRZRk1RVVV6bys0RWNrNHRaS0ZVZU1KZm5yVHJ3UFZQcUVH?=
 =?utf-8?B?S2VmZEdFdmdvdVdoQzlwVkg3R0EwL1dIa2pnRngvaUpCM05wUzg3b0xOaHcz?=
 =?utf-8?B?UjlPOU8xV3grYXR1ZEN6bmtGNVRURlJuM0tpbTgvWWhhL0pOUXRSYTFmdXJu?=
 =?utf-8?B?QXV2VTF0NHlKOG5CdW9GeG1uNjVXMW5sWlIzamRkY1FVUTZuTVNZNTNBWkxx?=
 =?utf-8?B?N2tXb2FMeHU1Tk82NXZEYUsycG8xTUVBM1FBTDRNa3Yrall4VlRQSTE5anhx?=
 =?utf-8?B?M3R1WUdwUCtaL3d5djFMam1FWUlpc0ZhNkdkOHNIUHpPUUFYakU2OEcwQnFB?=
 =?utf-8?B?YlhDbFh5ZnRtd0w5aC9ubHRZTUFzOHIxMUxybnFmOFFISWpqUEwwVE5mNjdp?=
 =?utf-8?B?YTJOZ2IyN1IzSVk1TDJQUnRicEM4M3pnVkJyQnNiQ3oyYms3OVJ0NEtjNXJ4?=
 =?utf-8?B?emswVE9kWVg2cDdjVU12WG90eksxSmpVY0hSaVVxNFhtWlJZMUxDSnVVT1NO?=
 =?utf-8?B?UGZxV01weWJBbFQvQUd3OUtBd0ZycFBxUlNpRTBVbmk0bUFDUllHSmZKa3RK?=
 =?utf-8?B?cEx1ci9leXVWeU1xQzRrdEl4OGh2UlFQM3dVM2EyVGwrY0lhZm0wT2szNWNs?=
 =?utf-8?Q?W4kzYg5Q48xmGaovBMvCuIvBz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0115ddea-c4be-4bbd-24b2-08dd33fc72ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 18:02:30.5858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T70TcZ9T4mIaknaS/XTPov9yxjhFsNVQ97KLxQX0nbb+IG00tYsU4tFaNxODKExNYIgRTJMf7oE/k6Mkh5O03Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10774
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_100234_958452_1C7DBEC8 
X-CRM114-Status: UNSURE (   9.60  )
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

Add #io-channel-cells = <1> for adc node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 6b8470cb3461a..06c50369aa2a7 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1379,6 +1379,7 @@ adc1: adc@44530000 {
 					     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&scmi_clk IMX95_CLK_ADC>;
 				clock-names = "ipg";
+				#io-channel-cells = <1>;
 				status = "disabled";
 			};
 

-- 
2.34.1


