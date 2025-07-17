Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FC9C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 02:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WBdmwh8LhzdvQWlOaIdSpTtrWSVeJz124z2j+CMCjY=; b=yQIr0UWgfe+2akiTACw0pKVzjS
	TLotwfPdoFXjOhxjt5D+hx0opBVm1Zeti9rZIvaelcYDNdU0yCBXh+LQ1EmQoGoNwhWatdcKiCom/
	AZ1cjY2SLtntk6xv6mUe7ryBXkZ5aQiESGOXmd6Zbhc2vaTfvp0t7rhMgkdUKcQRtRtNeK+/4Emfl
	dOT+7P2ztienvFoOCL4HX6Vt70H604Wxj7q5QsN6gHMe3rN1vxr8wUrwRgdxnTv44wMsw8Me7jGmU
	Ir/SVbW5OuclNOeVaY2g19Rk//tgTlEjcTLdt6NBCxm12F/hyM3QDtgUT2Tlia/2FK/ZCw1nAMWpZ
	Wb0Osq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEMP-0000000940V-41LK;
	Thu, 17 Jul 2025 02:28:37 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEJv-000000093p3-2fYV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 02:26:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBjwettIeq82Jy3uDjoFw8ODHWhN/ZEpctClqfcbMCKNi5h6V2jpUzvCdkSqv43JoltXd2ENNTdrt67KvF/+1OFgMc49m/uWvsXbRoWlAW878BylPJMFmzpls97WY6aCe0zibTdun7Q8wZtV8GqNUWv2P094TZC7E9dhKqN5jY2teMOmpWauYjlEW3QFGZ6t21vBdfnCfF783K7nN/o/EJeNJbVzkK/+lJwX5DyjJatVQ/lf2NehA0AqAUJRwuUJQA22g7DniN/mxEUCF623/UC/WASUNHinZ9gxDeo9gl9NiTNpXFhDvhoc/2H0mb4KN/rQwfIh+BxApoLaGuyzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WBdmwh8LhzdvQWlOaIdSpTtrWSVeJz124z2j+CMCjY=;
 b=Pb9O/BNTK02nfIPVz2gOJHUGLcrkB1g0vPV5SOuyv5c8la8x7Pv5GgWEYCh+ycfg/LYCqj0mYv5S1/nTkK1rLNfLKwlODVDHTWo8II46Wr4fjDIWFL3vbl1FPEo2AMwLMMhV+rBO3APpvMG2WDmsN4cfuK9M25mI9l1uW3qIlNzG7S1Z/iP6DtYMqAGdGD4IZhWO/tfaojS2nt9ebo+bxnL8xQkIYD7RStMA77n1cKSlsYmVbfWcqbRG92iWmhteuZ6DT5PyFcXZV1bft5ckJf0awZ6wLbllyT4WqbNwZe3GL68pO0x0SNaqRjjRlCUC2ZeEobcxcdU0cjIfKh98GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WBdmwh8LhzdvQWlOaIdSpTtrWSVeJz124z2j+CMCjY=;
 b=U59SOMEwEC2t0/P5vRvD6f0G1Srmxn1r4Or0lDjIgG9InJ3RcEdWH4EApJ6MHQIqZcSFZSEhIOPp7sYN8gb3p7rHRtpE+yXn6TyKAiE3HJKQAATDSp6JXk4odOC5AquJ4N4bPzoqHz3dQyZp6FproZRePLbkacejKuSuBawXRjxFc0WHxy0dLqDtHlLg25eCkXI6qn/KCN5ms9o2zvUMSqU/X1XX4WXHimzDkXAQQ22EfBt10ZKggkXyLfZiKiOSvt5ofDFgA2vFPQo+3nB8JQ8n3tV4WnGwkXAaPQEojJhxfbMlNibMm8mdlVlRTSQQFcGm8hWI64jfi1i9ESMJrQ==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by JH0PR06MB6677.apcprd06.prod.outlook.com (2603:1096:990:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 02:25:39 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.8901.024; Thu, 17 Jul 2025
 02:25:38 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Kevin Chen <kevin_chen@aspeedtech.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH v2] dt-bindings: interrupt-controller: aspeed: Add parent
 node compatibles and refine documentation
Thread-Topic: [PATCH v2] dt-bindings: interrupt-controller: aspeed: Add parent
 node compatibles and refine documentation
Thread-Index: AQHb9TIybIHPDglL/0yieNpxMb24hbQ0au0AgAEqIIA=
Date: Thu, 17 Jul 2025 02:25:38 +0000
Message-ID: <OS8PR06MB75414FD894E30FAE2D29DD5FF251A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250715024258.2304665-1-ryan_chen@aspeedtech.com>
 <20250716-spotted-spirited-axolotl-c94e0b@krzk-bin>
In-Reply-To: <20250716-spotted-spirited-axolotl-c94e0b@krzk-bin>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|JH0PR06MB6677:EE_
x-ms-office365-filtering-correlation-id: fd103c0b-9f11-4c9e-cc19-08ddc4d9385a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Nm95T3A0eTUxbVZaNlVUY2V1TG42amR4elRLSFF5SjRiV0ZiNHNLOHhFbVgy?=
 =?utf-8?B?Wk5OUWVMZTd3OHB4QlVsUmdEUWorUkU1ZmQ1RXA5M21kaHY3dCtwZ25yZzIr?=
 =?utf-8?B?ekkzcWZRWGd5TVBOZ3FiZmIzSzY0S2R4eHZiNHJRL1BFYjNnN1VPYXhuWXVl?=
 =?utf-8?B?cW5QRTI1dGZPN1FvZ0MydlkydVNGOURpZmwwSVF5bmlVZlpGbHVPclFHR3pj?=
 =?utf-8?B?bVFhU3ZqNW5oVWNrZnJLQVA1VStmYjdoZ0hORWwwZWRRNjZnVTZCYmw1WVZJ?=
 =?utf-8?B?VnVJYXNjNmFEZElTTVZCaHBzME5pTm43VVFabWN5ekcrUi9UWHVrNzVZSE5D?=
 =?utf-8?B?bjdIeVFqQjlxQk9XcHdqUjNQbXdLUlVzSzkzMHFUT0h2c0ZjNWFrUWlUaVRr?=
 =?utf-8?B?c1R4Q243TjB2RWw0RmoxUjdxb0hydDNMNnZQUFpjMlBQek1qV3JhVEVVNUxU?=
 =?utf-8?B?Z1h5bUlTMm94Ujl4d1drRSswQlo5UE9VNzBGRGg3TzhvK0NNbGtwbVNNa0g1?=
 =?utf-8?B?dFg4MGpFWm9BK2tiV09QRDhiMUxXZVkybVBZK2dZUWkxdkdkUGhlcDVHYmsr?=
 =?utf-8?B?UUllWDRyUlZNYUEzRDRBa1ZQQnFtcFd6OUo2dlRYVC9tbGphS0ZDOXRjVHB3?=
 =?utf-8?B?OS8vYnBMcnZaT2YwbmhDb2gvWkNyZ0l2M1h1M1BsREoxRzhvaDVuZ29LajRR?=
 =?utf-8?B?S3lweTE3eDFGUHFBa25DeXlXNnpKbU9DWCtUeE83Mmk5ZnFEM0dWMDU5eXU5?=
 =?utf-8?B?V2t0UmR4QklwYlFrMXFzVFlQRERMR0FyNUw2ZzhxTkVsa3A5MUVvVTBNTmpM?=
 =?utf-8?B?VlJ3eWhZVWp3ajQyeDkwL0xicEVueEhFNkl0Q0RFVGZad2xPa0w3SU1GZGpq?=
 =?utf-8?B?bXNxU2w1UjNVUm5TNkRlejNBdkpkOUQ4QjF4VmVEc1I2QlhuUEIzTXRjczZm?=
 =?utf-8?B?cHQ0Nit3c1p6eXdiMGxXTy9tclluYzJLN0VmaS9pLzE5STYyRzNJaU1yQm9Z?=
 =?utf-8?B?VjJUY3FocS9aMW82Rjk1ajhLNXJuMEkvU1ZHVjgvRDRrbS9rVGJZVktaaXZT?=
 =?utf-8?B?Ujl2Nkx0T096bStpMC9JWENpaG5wTWRMa3dPVWM2eldoZFRRV2c5enh6TFZW?=
 =?utf-8?B?Y3BDVldiSFg4bEdYemw2cFF5dWh6cXVycHE4bWVWOVRNSTlEVUU1QytnMXlM?=
 =?utf-8?B?amtFMUJpU0ZjanJGUFYyaG1jOW1iWEVkQXdIbXJtQ3NoTHNiNDJsNzhndEJi?=
 =?utf-8?B?bGg4UTM4M2pwYTVoTElKdjEwSDJ4KzdXQ1h3WTBBMDdLZmFMbjg4L1FKd2ZO?=
 =?utf-8?B?MU01VDR2NmRXMlk0YlRpdHNYalpWZWMxdlN4bldrUTlCUTlUNEFnTTFpZVM0?=
 =?utf-8?B?NDdnbzkvZDlTM3FWSldMMHlxbkk4NGx2OUxPOGowaWxnYmZZOEVOV2k3V0to?=
 =?utf-8?B?T0dXWEpTelpyOVNQYTZzU0lkUDlaVGFOT2lUaEJFUjUzT3lNVGhXK2pCTlN3?=
 =?utf-8?B?OEQvNmZTSzZtVllxR0xNQW1hSFpEYXpqN0diOHFJaEw4cjFTZXRaWEdLOGF0?=
 =?utf-8?B?N2N6RWtLcU11MVdqTitwM3QweC9TUGcvVERyT2NWbk5aTEx1c2xMZ0RCWUxj?=
 =?utf-8?B?QjMrSUpNVUs1aEo2eFlicDVManJpOW9CUWFnMmV5Um9HM1o3b1pqRGY5ZUNp?=
 =?utf-8?B?WVFvQmFHNWx4SzZnQWRmZzBiVldGQ2JhSlQ1ZlhhbjZOelI5OVNtdzE3QlR1?=
 =?utf-8?B?NC9xclhmN3ZXc3B5akhodWVTTmQxc045RVlhMkNiOGlTTW1RM3BCNnZmTC85?=
 =?utf-8?B?aWl3WkZJWGk1NmhsNnorc3BHTCtoaFlRSGhCWkw4clQrMWl2Ujk0aTh5a1JJ?=
 =?utf-8?B?c2JDNzU1bmY5UTBNNEpmMEYxOU5OMjBKWFI4clpKdEFRblBzdUp5enA2RHpu?=
 =?utf-8?B?Q0dMT1NJS0NUYzhEY2lnVW1hN1lsYTgwaGJFcnZSTk4yRnE4ZVpyRGRFd0hI?=
 =?utf-8?B?ZnFUME9YWjRBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aCt1QzFyY0VQU3hIWnZlaXhZL0tLRm9YaTM0SVZJalQ4d2plSFVUS2xuLy9l?=
 =?utf-8?B?Z1puOEZxNWtuL0MzUytCckFtWjhNNVpQaXBGb091THJuSHRFMTJjSXBDVHQ2?=
 =?utf-8?B?Rm1sQTFUSXVKbnIwSDN4QWN4YUhOZTQxMUk2aWY2QXNVR3hMZWVIWkNoNzdD?=
 =?utf-8?B?WjUyNTZzVzVXRHcrVFYvc0Q0ZDNwNHpZaSs2UkVpdGJUNWcrNmhmV2VuUkpR?=
 =?utf-8?B?bGpQcDNTeUdKcFArNUdnZHBkSGVTQkorRlZFR3FXL0hUQ2R4d3ZNV1FSczB0?=
 =?utf-8?B?elFUR1U2YURtbWVETWJzd2tZMHRhekVCMS82S0wxeExzRE5vVzlyUkJMSkhR?=
 =?utf-8?B?anI0YTlvbS9lR05zdGE4WC9JZmZhYzdmV3ovUzBNdWdkbmo0eHhSVlRXazdl?=
 =?utf-8?B?cG03bkc1Rlg5cUNxM1lMTHRHQUhoVGdVU2NJYWVkUm05RmNGdWYvbFNweTgw?=
 =?utf-8?B?TFhzOXBQVkMrbjJBdXcxeEhDTU5Xdklka0VNbGFWTWw3VzJNTDNWTHIwTFVH?=
 =?utf-8?B?cnZiOFhpcTFTZTFEaWtaVDNZd3crSFJCaEFIeGYweHVsc01iMEJFV3A2RC9R?=
 =?utf-8?B?YjAwWEdKVzg3eE1QdTVmV3U2akVqeSt5SUlmc2ZuamdFN1RqTGJWSmNWL2xH?=
 =?utf-8?B?a0crNFBGZC92YWlITUdtTlQzSUhpRU9kWHhyTXFCd2xaeFhWdUFqbU03M3hX?=
 =?utf-8?B?SXM2Ty9ZVFdIVFFZWDVBVmRuOGR3VU5wOHd4YUlwS0xaemlLMTFwYitTL3BY?=
 =?utf-8?B?UzU1SGlTMDlwV3g3WmxwSlhGV3YvcDhjMlJOQlVWcTU2eFk5UTk3SEFFb1FR?=
 =?utf-8?B?V05HOFFoR09jY2c5RUprRnkxYWIwc1hqR2oxLzR0UjVVaHZXZkhEOVpwOHVS?=
 =?utf-8?B?Z1l2eXE3MXFOcU1NdTlhQ25aOGNRdEhLOEw3T3lFQ2xsT2lDUzdWcE5Rb25Q?=
 =?utf-8?B?N3ZySEQ4Y1crTzFxT2svTDVJQlZVM2FmZ1lrSWFzemhXTng4MHo1NVQ1b1k1?=
 =?utf-8?B?WjhxajBJaUJ1VjVUZEFwYUFTSTRLUGFpOU9QNmFXZEorWitPbkkrMEM2anU4?=
 =?utf-8?B?VVl0TzJZU1FUVTVtWXF3dWc5T09nc085MEcxaDN4K283L1lSWkM2clI3Q2pq?=
 =?utf-8?B?YUJJVHJ1eDRpL29WUnlQMkJpT2RQeGFBeDdrTVo5NzltQjdRdkRyOTVQaWdv?=
 =?utf-8?B?cWNKVTJIdEhudFFFTTcvcWw1UTQra0s1TFNtSVplS3MvMC9UK0pJQlhVaTRo?=
 =?utf-8?B?UEZZWWJDSDhsT3RLK24rREZCMkVDc2VwWndJcVo3RHJKaGhBVVhjRTUramQ4?=
 =?utf-8?B?OFYzU2dqOExHRi9oTUg4cGk2TStva29GQjRXWXJhQzBrVnIyZ0lwS0tOaDFS?=
 =?utf-8?B?VGZHVkNDMThFWVFUMm1tUm9xNDlEMTBnQjlmTlYrSWN4aW9pTDFDNzdBQTNn?=
 =?utf-8?B?dDNheHdHVklGclpzVGtxbS9xelg3WE1TbnM3Z2xSUldJTndSZkxHc3BNdVI2?=
 =?utf-8?B?ekR2MnRodFBSam4zbEhJakdqbTVQM2t6M0tFaC9OdUdyZCtGT3R5bWpaMkpn?=
 =?utf-8?B?OVo3M2N5bnJRRHhIemdWR0RTbnZVWGVDOHJsRXRvQzZLQ2UzM0dLMHNhRVNE?=
 =?utf-8?B?Z2w5T0xnUkE1R0VlMEVLdEdxY09Zd1d0dG5RVnIvTzRURU52ZnkzODRTSlZO?=
 =?utf-8?B?czNUK21EazRCREtCTnNPbE05UUppVGpkODlGdlNncXNoWVJGckVCZ2pTN3JV?=
 =?utf-8?B?OFA1cUdhak1qS0RQQjdyNVZtaEZNYWtpb3VMUE1pZFJPUklUUE1weG9SaHZI?=
 =?utf-8?B?R3YyWEk2UjIxZ1JpYnhjMnpUM0FQa28xN2lGMTJVNHI2S21naU9TSUlsVk1V?=
 =?utf-8?B?UzBPcnhiZDRzMFZDVW9TNmFKbHdlT0FHRS9IOEVmbXBOM09vNWhrK2xIZEw2?=
 =?utf-8?B?WUU5ZmpKaE0vcmZ5a3paMjg4MGRTc0t2ZVAzRzJYV211SGVTeDhub0JiWXVx?=
 =?utf-8?B?cDA2aE9qeXlPVHpQd3hSZ3dtWUhWM0NoSlAvV2FCUjZVZGNmSVdQeGw5ZUIz?=
 =?utf-8?B?eTlpMEErRUkwYmZ6Ukx5U1MvRGJmNUZKT1BjbFJSdDE3SVJYWlFyOUwvd0xB?=
 =?utf-8?Q?JB6lSJEO77xdeV/CACUOzqzMM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd103c0b-9f11-4c9e-cc19-08ddc4d9385a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 02:25:38.8393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99PPmOec7KHbtORzCT3sbkodGx3uuaqhIhlA1cLPo0iN/xgeTuApy4hGF+zqt7q1RNPJ28NNMe8AUg3yEh93BZiUcQ7qcDjn6ZOubN5pje8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_192603_671033_F97D026F 
X-CRM114-Status: GOOD (  22.29  )
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xs
ZXI6IGFzcGVlZDogQWRkIHBhcmVudA0KPiBub2RlIGNvbXBhdGlibGVzIGFuZCByZWZpbmUgZG9j
dW1lbnRhdGlvbg0KPiANCj4gT24gVHVlLCBKdWwgMTUsIDIwMjUgYXQgMTA6NDI6NThBTSArMDgw
MCwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+IC0gQWRkICdhc3BlZWQsYXN0MjcwMC1pbnRjMCcgYW5k
ICdhc3BlZWQsYXN0MjcwMC1pbnRjMScgY29tcGF0aWJsZQ0KPiA+IHN0cmluZ3MgZm9yIHBhcmVu
dCBpbnRlcnJ1cHQgY29udHJvbGxlciBub2RlcywgaW4gYWRkaXRpb24gdG8gdGhlDQo+ID4gZXhp
c3RpbmcgJ2FzcGVlZCxhc3QyNzAwLWludGMtaWMnIGZvciBjaGlsZCBub2Rlcy4NCj4gPiAtIENs
YXJpZnkgdGhlIHJlbGF0aW9uc2hpcCBhbmQgZnVuY3Rpb24gb2YgSU5UQzAsIElOVEMxLCBhbmQg
dGhlIEdJQy4NCj4gPiAtIFVwZGF0ZSBhbmQgY2xhcmlmeSBkb2N1bWVudGF0aW9uLCBibG9jayBk
aWFncmFtLCBhbmQgZXhhbXBsZXMgdG8NCj4gPiByZWZsZWN0IHRoZSBoaWVyYXJjaHkgYW5kIGNv
bXBhdGlibGUgdXNhZ2UuDQo+ID4gLSBEb2N1bWVudGF0aW9uIGFuZCBleGFtcGxlIHJlZmluZS4N
Cj4gDQo+IFNvIDcgbGluZXMgZGVzY3JpYmluZyBvYnZpb3VzIC0gd2hhdCB5b3UgZGlkIGFuZCB0
aHJlZSBsaW5lcyBiZWxvdyBkZXNjcmliaW5nDQo+IG5vbi1vYnZpb3VzLCB3aHkgeW91IGRpZCBp
dC4gSXQgc2hvdWxkIGJlIHJldmVyc2VkLg0KDQpUaGFua3MgeW91ciBmZWVkYmFjay4NCg0KSG93
IGFib3V0IGZvbGxvd2luZyBkZXNjcmlwdGlvbj8NCg0KVGhlIEFTVDI3MDAgU29DIGNvbnRhaW5z
IHR3byBpbmRlcGVuZGVudCB0b3AtbGV2ZWwgaW50ZXJydXB0IGNvbnRyb2xsZXJzIChJTlRDMCBh
bmQgSU5UQzEpLA0KZWFjaCByZXNwb25zaWJsZSBmb3IgaGFuZGxpbmcgZGlmZmVyZW50IHBlcmlw
aGVyYWwgZ3JvdXBzIGFuZCBvY2N1cHlpbmcgc2VwYXJhdGUgcmVnaXN0ZXIgc3BhY2VzLg0KQWJv
dmUgdGhlbSwgYSBHSUMgY29udHJvbGxlciBhY3RzIGFzIHRoZSBnbG9iYWwgaW50ZXJydXB0IGFn
Z3JlZ2F0b3IuIA0KQWNjdXJhdGVseSBkZXNjcmliaW5nIHRoaXMgaGllcmFyY2hpY2FsIGhhcmR3
YXJlIHN0cnVjdHVyZSBpbiB0aGUgZGV2aWNlIHRyZWUgcmVxdWlyZXMgZGlzdGluY3QgY29tcGF0
aWJsZSBzdHJpbmdzIGZvciB0aGUgcGFyZW50IG5vZGVzIG9mIElOVEMwIGFuZCBJTlRDMS4NCg0K
LSBBZGRzICdhc3BlZWQsYXN0MjcwMC1pbnRjMCcgYW5kICdhc3BlZWQsYXN0MjcwMC1pbnRjMScg
Y29tcGF0aWJsZSBzdHJpbmdzIGZvciBwYXJlbnQgaW50ZXJydXB0IGNvbnRyb2xsZXIgbm9kZXMg
KGluIGFkZGl0aW9uIHRvIHRoZSBleGlzdGluZyAnYXNwZWVkLGFzdDI3MDAtaW50Yy1pYycgZm9y
IGNoaWxkIG5vZGVzKQ0KLSBDbGFyaWZpZXMgdGhlIHJlbGF0aW9uc2hpcCBhbmQgZnVuY3Rpb24g
b2YgSU5UQzAgcGFyZW50IChpbnRjMF8wfng6IGNoaWxkKSwgSU5UQzEgcGFyZW50IChpbnRjMV8w
fng6IGNoaWxkKSwgYW5kIHRoZSBHSUMgaW4gdGhlIGRvY3VtZW50YXRpb24NCi0gVXBkYXRlcyBi
bG9jayBkaWFncmFtcyBhbmQgZGV2aWNlIHRyZWUgZXhhbXBsZXMgdG8gaWxsdXN0cmF0ZSB0aGUg
aGllcmFyY2h5IGFuZCBjb21wYXRpYmxlIHVzYWdlDQotIFJlZmluZXMgZG9jdW1lbnRhdGlvbiBh
bmQgZXhhbXBsZSBmb3JtYXR0aW5nDQoNCj4gDQo+ID4NCj4gPiBUaGlzIGNoYW5nZSBhbGxvd3Mg
dGhlIGRldmljZSB0cmVlIGFuZCBkcml2ZXIgdG8gZGlzdGluZ3Vpc2ggYmV0d2Vlbg0KPiANCj4g
V2h5IGRyaXZlciBuZWVkcyB3b3VsZCBtYXR0ZXIgaGVyZT8NCj4gDQo+ID4gcGFyZW50ICh0b3At
bGV2ZWwpIGFuZCBjaGlsZCAoZ3JvdXApIGludGVycnVwdCBjb250cm9sbGVyIG5vZGVzLA0KPiA+
IGVuYWJsaW5nIG1vcmUgcHJlY2lzZSBkcml2ZXIgbWF0Y2hpbmcgU09DIHJlZ2lzdGVyIHNwYWNl
IGFsbG9jYXRpb24uDQo+IA0KPiBUaGlzIGp1c3QgZG9lcyBub3QgbWFrZSBzZW5zZS4gWW91IGRv
IG5vdCBjaGFuZ2UgInByZWNpc2UgZHJpdmVyIG1hdGNoaW5nIiB2aWENCj4gYmluZGluZ3MuIFlv
dSBmaXggZHJpdmVyLiBFc3BlY2lhbGx5IHRoYXQgdGhlcmUgaXMgbm8gZHJpdmVyIHBhdGNoIGhl
cmUgYXQgYWxsIGFuZA0KPiBhc3BlZWQsYXN0MjcwMC1pbnRjMCBhcmUgdG90YWxseSB1bnVzZWQh
DQo+IERvbid0IGFkZCBBQkkgd2hpY2ggaGFzIG5vIHVzZXJzLg0KPiANCj4gQWdhaW4sIHlvdSBu
ZWVkIHRvIHN0YXJ0IGRlc2NyaWJpbmcgdGhlIGhhcmR3YXJlIGFuZCB0aGUgUkVBU09OUyBCRUhJ
TkQNCj4gZnJvbSB0aGUgaGFyZHdhcmUgcG9pbnQgb2Ygdmlldy4gTm90IGRyaXZlcnMuDQo+IA0K
PiBUaGlzIGNoYW5nZSBhbG9uZSBiYXNlZCBvbiBhYm92ZSBleHBsYW5hdGlvbiBtYWtlcyBubyBz
ZW5zZSBhdCBhbGwuDQoNCk5leHQgdmVyc2lvbiwgSSB3aWxsIG1vdmUgdGhlIGFkZGl0aW9uIG9m
IGFzcGVlZCxhc3QyNzAwLWludGMwIGFuZCBhc3BlZWQsYXN0MjcwMC1pbnRjMSBjb21wYXRpYmxl
IHN0cmluZ3MgaW50byB0aGUgZHJpdmVyIHBhdGNoLA0Kc28gdGhleSBhcmUgYWRkZWQgdG9nZXRo
ZXIgd2l0aCBhY3R1YWwgZHJpdmVyIHN1cHBvcnQuDQoNClRoYW5rIHlvdSBmb3IgeW91ciBndWlk
YW5jZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==

