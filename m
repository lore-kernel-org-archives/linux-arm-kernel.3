Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECA5CEBF97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 02:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aeqG9D/q+DK+IIQcCceRkjKEcP1nPwrPLuAbBEJAgI=; b=yTJ3N9k9HFl0lvTg0mV7/LdZ2j
	MYwMk1cDYBWiEcglx9TK4aUDlhbCNqmeDFemke6mqOaGkc/yDoMoD+junYDUrbjmNAZsVIx4x5u4r
	6wMUR0aPMl6iEHaOluByFVq5bjvFZjwxZYovNb00RImOy1BExt+UGIx2W2t3KShzjFWKElJS3RfRf
	du9fzFFe994pH9ICsK/7H8YGD6YIc49JW/VEksQWytl6zyTNf/kNjGd+RFHPsqN1JCFa2PQivQuBN
	Y/KiSn0sXwzbcVh9ZFy9KdGoyhywvAErcJw5QDW60Xv8wyCEcgudTOA2h5yQufI9k8DCNoT13n4C+
	ou7KzlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBU9-0000000HEGL-0t4N;
	Tue, 18 Nov 2025 02:30:25 +0000
Received: from mail-norwayeastazon11013062.outbound.protection.outlook.com ([40.107.159.62] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBU5-0000000HEFi-0Tqu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 02:30:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDx9i24BldnnvFQkr3gffllGkVoLgYUmZBMFsarFZiXu2eOdpkdcD/nIGgeuR2q9wCwC0/NZzB4phfs7zmxHe8jNqFGfTnbl8bReFBNkHZudVNLEyf1UicNusTKWIa/9q0oQiXar7QPp/wcfd/7R8MKsQI+TwqWXOrNvT6nkipFHksUYyCgF34K9tyrpmAZmdLg+RaNF7RqpAC/TFPH5oZrp/utwcdU3ifcZ3VLgzP4JjMVr3JNXBJzklYaMkfgsPXZqXaywZvufBbyIekqBjcbG1BiUup5liz1SjnNg+qdlW9V7MT34Dvf2HUj80FpnE1ML1pHKvR78aCrXbVs0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aeqG9D/q+DK+IIQcCceRkjKEcP1nPwrPLuAbBEJAgI=;
 b=p/zW9DEG9WSYE3BVlBBcCMLe1tCb79kRB05+E2cxeEtuNzbI6opkElBf/7t+YQ+Smh9zA0rFiqBeF7wtPRPIvTe2e7GlwTykIMwi/KwwOw+GLk/+yGRefd+X644uiJNRKvv8FAUOLG21sesQ41by4y/x5HfUBX9AlHMcNRuRtWv6WhISw5crL+CcxAqAVUkv4dviA+W+bZ+wWUSKfm/P5krDmM33UtTwM/8WmQJNAoG9quyQ/PTHUd67kjPY1+cj0ynu52ijy3Jfx2qgXdCoQU/cHd3M79G5pPoKBNDFFj9okZoBKyI+rrIT7BQCNSQ9wMk193k56xT15IHOtBgh+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aeqG9D/q+DK+IIQcCceRkjKEcP1nPwrPLuAbBEJAgI=;
 b=aeattlJGJbod9B9y9g/t55+PfgiJnyp9trkqPOSYDS2qOn3ngRoqQiUggypf6ECrDkmkCzRM3OjKG1kegJ6eolqwxGlGeUWasWtWQN1JS3pxQaG/BM/+sBq+Zsu3ilwORhsWaMnxMu0dPxgHr81dXEgbSh6HsXOttSA5bU9qkofPPMbihBnPwdjvpjt2jpxBs+kbtwpKLo8RmT/F450KARRAC39Y7y3Pz708MksG+dh29C94HTycjrumi8AxKysnIp/89X9COaxkXAN8Extl5byibUGLTGgty9eMQDiP89nUzIipluZpTsV3AZvRHPDDd3LBFH2B7HwbJhRjlxVxlg==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by DU4PR04MB11756.eurprd04.prod.outlook.com (2603:10a6:10:627::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 02:30:17 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 02:30:17 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 0/2] Add support for NXP XSPI
Thread-Topic: [PATCH v2 0/2] Add support for NXP XSPI
Thread-Index: AQHcV7Hhc8OvQmOtHUKcu0etVVYrvbT28u4AgADEFeA=
Date: Tue, 18 Nov 2025 02:30:17 +0000
Message-ID: <DU0PR04MB9496785C9D77B3271A92602090D6A@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20251117-xspi-v2-0-e651323993fe@nxp.com>
 <20251117-logical-benevolent-penguin-29b355-mkl@pengutronix.de>
In-Reply-To: <20251117-logical-benevolent-penguin-29b355-mkl@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|DU4PR04MB11756:EE_
x-ms-office365-filtering-correlation-id: 7db083c6-8f71-45ee-d319-08de264a69dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ejNYTU9ZeEVBMTNSVzI2MUtYeWFPdnJLTlQ3S3pwd1UzN2hheExpTmJ3SVdV?=
 =?utf-8?B?bjdJeEF3SlNmaGlPYkt1aWpJK2ppcCtXaDBJZmMzVTFxbGc5NExvZW5abUdZ?=
 =?utf-8?B?bEYvakxhdDdETE5WZFQ0RytaOUZJYS9VK1hQdFNwcU5IcjA1OFBwVHFsb0sy?=
 =?utf-8?B?blRZcHFOdWNrTDMySVQ1ZzhzRnZxS1lhcUptbEtxZXpiSHlIU0lSUmp6Q29l?=
 =?utf-8?B?akdPVmdFVXBQb2hIUkNTOHJPSktWbzZ3YUhNRFJHK1REWDBibmNPT0h4WXVS?=
 =?utf-8?B?bTlGWWQ3ekc3UGFCZ0FCQkkvNTdaUmFwMFBZbmlvV3ViTWVWak1CU1JJc0l1?=
 =?utf-8?B?VUg5MThZNzFpak5INlR3OFBWRGxQNkJYODZLbTQxRGZnV0Q2TmhNRFQ1Nmhv?=
 =?utf-8?B?OXRBc0JqZzVYeDNXb2hHRzlIQkh0ZzRZdnlzUWNDNmJnNWQxeVZuVFZWbWdL?=
 =?utf-8?B?Nk5pN0tjeWh4TkphYzBPSE9wNVB1UjRNSUJiM2pLaERjb0FPQUlsNHBabHY0?=
 =?utf-8?B?S3Myd1RHeUVwRkk0cE1WejRlWkcyV05JMUhDVjU4TTMzZHI0YUNqTjVkTU9B?=
 =?utf-8?B?WWxGUDNvcmtQalR2OU94ckZ0VWNGRFY3MzNyaUVsZnhaaDZobTR3VXlRaFpT?=
 =?utf-8?B?d2EweVVQQnF6bEVseUlUVmIvK0lJbzJJQlB5czBtdVJodzZoRlVIb0o0RUFr?=
 =?utf-8?B?UUt2TEhBQ2xSSWZha1dWM3hiSGppalZrTkhqakFuWWkycmpPN0Yxd1FYTUlG?=
 =?utf-8?B?N093SjlaM2xKTG03MGlWWnZEcDJxNzZQaEcvQms0cnBOK1BtNHRsOGhrRU5i?=
 =?utf-8?B?L1UyVUVnVDVGRjRWK3VEc3FMVUtseTZZaDlTRStJeW5sYnlUVXJDNmF1Vnkv?=
 =?utf-8?B?SDNodS8rVms3QkpDem9zUXQ1bDR6WTVaTExwUU5JNGlCMllJRzc5ck5XSjJK?=
 =?utf-8?B?SUNSR1VEdFR5YzYxay9JVkRORDJ1cGx6cWllTWsySkRka1pSMmVzT0gwc254?=
 =?utf-8?B?bkJockZiSFFTUXBtMXN4TFB0V0xxdFMyS2RuTkl1eXUxaVdQY0g2UTc4ellO?=
 =?utf-8?B?N25DTGw4ZHFvdzZpOHhJMXQ1Y0Jubm1KMDdQUjY3dDBoUnNvWklvTVpJM0Mx?=
 =?utf-8?B?c1llU2lmcGhPQTZ1TzMrY1E3clQxUWdZbldIM0hldDlNOVlhT05VQllSWXdu?=
 =?utf-8?B?eVlFMCtGRDJiWGNybmNpUlY3alZlK0R0MEgyN0ZTSU1YL25nMnZCbGQ2bUpm?=
 =?utf-8?B?elRQT2Y3a0hZNDZzcjJiTXhkL0lyWXpjazZzbDFRRkMydWE0VnZONi9pejFL?=
 =?utf-8?B?enZJSnRadG5vWS9keEJlNmZJU1p1a2EvWmxjaWtNc3Bkc2RNbW9mejNIenpN?=
 =?utf-8?B?YXcrMVVtaGZWNExZS0M0UHhQakZwSTFwUHU5SWF4RVZvVlRkUkZUbVBQVURR?=
 =?utf-8?B?NWxteG9XS2Irejh2OXNKcXMwWHhXUkRSanVxV1VSbi9ycDk0dXQ3TDJtenlq?=
 =?utf-8?B?MzlrU2I4TFcrV1VjaXc3SmhPWkhTNTFtbHVVNTRialFMZ2NZQWhhZW1rTGpN?=
 =?utf-8?B?MmZaVVpaTUpXcUU1TlRkbFJIc2xoUlQrMGVtcW05VUc2cjQ5Z0oxbGUvZnlO?=
 =?utf-8?B?U1FpMGRRRjJjRW13Qml3Q0VlUFdLVzNEelVEQUZydm4yTWdVdi8wSG1HV2FL?=
 =?utf-8?B?RnM1S0pCRmxFNXFqc1pyeTJXNk80a3Z1ejVSUC9sRnNBcGhwTlpKalFIL3E4?=
 =?utf-8?B?VnJsTVB3MkUxVTdQMm1LdjdmbTBKcGdyS0dKbEZJcjFsRFlSOGFweGRORWpw?=
 =?utf-8?B?MGJQODV5SnNFdTFBaUN1TVlKeXB1ZDZmcU5qYjVCWmlnbThWbWNPUzlCSHkv?=
 =?utf-8?B?dGNLWTlRbDhjaVBJNVhvaFhjS1c1STdVbjNKZEFuQ2dJbHVCbHc2blphV01H?=
 =?utf-8?B?eVVvcFJYbVJWL0pudmhqdy9ta1lVbFFLRXM5R3J2NWEyb1IvWkdqZ1BhQzJj?=
 =?utf-8?B?cm4zd3dnUXBBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjJCV2p2NEZYMnExSzNOekgyM1l4ZjFlL3NFeG1ubHlXTjZPaHhTR1ZraEZj?=
 =?utf-8?B?cVNVcmxyME5laG1tWFF6c2l4L0tBemJGUG1XR0VNUEZxQnFJRUVUaE1nN2pz?=
 =?utf-8?B?L3pFVllSK2c5N0pMZGl1Skh4bXFwdUxxdVExMWRYNjZOa2hoc3BBNDlvMkdK?=
 =?utf-8?B?NDdRQzFpSjBZT3VNK3NGUFBjODVjT1B4d1RTZEpxTzN3Y213Q1FKdHR4dkM1?=
 =?utf-8?B?c2hoZW05WnVPcHdjOWxsQitWS2s1aHFKc21aWGZ1TDlwcVNQdFUzTFVxM1BM?=
 =?utf-8?B?TDFoN0FNZHhoZUQwUTJrSWhFK2VqSThOeVZETEVNY2RJa0dGbFRwQ0FVTVNL?=
 =?utf-8?B?MGlWRXV3QjBhT2xGaWNXdnM1VUd4cW9SUDNabUVYMDZ1VFlnNVFtWUNqRkpo?=
 =?utf-8?B?S3NOVTBlYm1zNDZ3S3ZNNkcvYVAyRlRrTUpqQk5YcWFkSXVYQ3VzdE05bjRi?=
 =?utf-8?B?TFlRcVFScXROdlQyOFZDamc4VUlHeVF3NGp3WEloMXVlSDlOTWNudDlXbUFr?=
 =?utf-8?B?TzJzMXo0TWVyUDNRY3VNdjFQS0l1TXdQSFFXakJkQXhGMjFoVDBvc294M2FV?=
 =?utf-8?B?dW5BTXBTNERnc3FHUVlLdmtLdkh1SGw0WUNHZGpCRXlRb2VEZXZsSWY4WGpF?=
 =?utf-8?B?a2JUaHh1KzV6bCt1a01BRHozZ25KREVXL3JVMWdIcnQyRmZsQVVYQUlrOU1a?=
 =?utf-8?B?SHVXRUptMzFYU09WTkQ4YkN6NVJ6Sm82TE9mSGZaVEhVWVpnT0dSQTVWZnN5?=
 =?utf-8?B?MU8rZlNxOW5Yc3FneXZtOWdXcHRlK0lTYnRpVXNlbnNkYVo1SWEveU9TSjlM?=
 =?utf-8?B?RWdtWmxuaisrbE00aVdKM0RrZTNZVEx3c2laaXkzaTRJWVU5aVpRb3pzREFW?=
 =?utf-8?B?dlcrb0dnNTZ0L1gzZnptcUxKdktNOHdXUHNNeTkzdlphbkQvVnNNR0JISE1r?=
 =?utf-8?B?U25QRWFSam9BcUpZWE1FZEJGY3gvMmROZDY3Szc4WjRjalVHSU8xS2RLVExp?=
 =?utf-8?B?T1N5Ly9VaFdFK3RqV2dqdDdTbFluTkNDQ1ZpOWhYMGt5Z005U3A1SmV1TTZx?=
 =?utf-8?B?VEJ2KzJkMEdaMUIyVFc5blBsUXdjaDNRZG5FaStsazJITnlZR3h1Qk0rNjRM?=
 =?utf-8?B?c28zc3RKenJkYUNDSXRIQXltYktkNVZaZ01MOE9BQU5lZ1pmZUlKSnhwSmVE?=
 =?utf-8?B?S2w2UG5sYnJBSXE4OHF1a2JrUStWQ1J4RmFiS3lsakhPQnNKRGhsNFJSRndo?=
 =?utf-8?B?RkZLUXBFT0hrblkyc1AvTGk2ck9tSEFMS1lRNWpTQW5JanVPRmt2VWQva0hr?=
 =?utf-8?B?VTByRlNrbHV6TFBEQ0MvRlhEK3M0SFZ1RVVZb096aUs2K053dFlNTTlzTE03?=
 =?utf-8?B?c3hQTVoxSUhwQmNPRGFRMXoyeUJ5RCtOcEppNjVhMVp6UHNPRW9SVExRc0xi?=
 =?utf-8?B?YjA2V2h6TmxqT3ppVVlOSlZaYWhYdENsaHhQRjVvaGNidDU3VEVhOG9kbFk3?=
 =?utf-8?B?ZnlZeGNEd0NaNkhKZmRoWHYvcTFCdlM3eUlveDNBVmxidmxGVWR6bDRuMDFj?=
 =?utf-8?B?cGVIZDNnd3pIV1BXL0p5MW9URGFnb09ncTB4eThlUkk5MkRpbjMrQjNYUWxW?=
 =?utf-8?B?YmdGeHpNa082UkYvTzl1aEJ0M1hNdHdocC9hQzJrV0JDcG8xakVMelI1dmkx?=
 =?utf-8?B?NzRWZmF2Y0lCTjNRVTlDMCt6VDliZlM2dXJDMkdsR2J2VEpUR2pFNm9UaDVs?=
 =?utf-8?B?VUw5SmZOTkV4Y0NhU0pFV3paSlViY0hyd2wzb3plZmtCd005bHdCYnhmc1lm?=
 =?utf-8?B?YklGOHlnTmlGd3N4TmhUWjBOVmlkdUpkaENIa1dXNG14WXdPOXA5TlpOYlNn?=
 =?utf-8?B?SWJRRnNjaE4zSjhHemNCcURpMmwxVlZWQ2ZJaW01bG1VOVV5aVFJMTFyZ2Jt?=
 =?utf-8?B?SlR2YWJmVUIwUHBmOGZNUVN4dUMzYUFuNVZjK2dOS1dZdjd6QTFiWVp0dEZ6?=
 =?utf-8?B?Yk9rUDZYWUdFWkhXTVNpWE1BdFd5MUc5aGxDUkNtTTl4bGNySnVoMXFaclQ4?=
 =?utf-8?B?dGdmam5UUytyM2ZyWWswTDJkN2JlWXZSaXM5T2Y1NkM1dEN1Qms4MlROcThZ?=
 =?utf-8?Q?6tYQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db083c6-8f71-45ee-d319-08de264a69dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 02:30:17.8650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VHuGch3Hxc732QvydzCvjIuEWJ9S3jlrMV5qi15cNjhrJJZ6R407vbVZPxlo+4hd/8C+YcWOQEVeEnz1JdiXaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11756
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_183021_153292_BAC7C005 
X-CRM114-Status: GOOD (  15.73  )
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJjIEtsZWluZS1CdWRkZSA8
bWtsQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAyMDI15bm0MTHmnIgxN+aXpSAyMjo0OA0KPiBU
bzogQm91Z2ggQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiBDYzogSGFuIFh1IDxoYW4ueHVA
bnhwLmNvbT47IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz47IFJvYg0KPiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5v
cmc+OyBDb25vcg0KPiBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBTaGF3biBHdW8gPHNo
YXduZ3VvQGtlcm5lbC5vcmc+OyBTYXNjaGENCj4gSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXgu
ZGU+OyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsg
RmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsNCj4gaW14QGxpc3RzLmxpbnV4LmRl
djsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7DQo+IGxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvMl0gQWRkIHN1cHBvcnQg
Zm9yIE5YUCBYU1BJDQo+IA0KPiBPbiAxNy4xMS4yMDI1IDE5OjA0OjIzLCBIYWlibyBDaGVuIHdy
b3RlOg0KPiA+IFhTUEkgaXMgYSBmbGV4c2libGUgU1BJIGhvc3QgY29udHJvbGxlciB3aGljaCBz
dXBwb3J0cyB1cCB0bw0KPiAgICAgICAgICAgICAgICAgXg0KPiB0eXBvOiBmbGV4aWJsZQ0KDQpU
aGFua3MsIHdpbGwgZml4IGluIG5leHQgdmVyc2lvbi4NCg0KUmVnYXJkcw0KSGFpYm8gQ2hlbg0K
PiANCj4gcmVnYXJkcywNCj4gTWFyYw0KPiANCj4gLS0NCj4gUGVuZ3V0cm9uaXggZS5LLiAgICAg
ICAgICAgICAgICAgfCBNYXJjIEtsZWluZS1CdWRkZSAgICAgICAgICB8DQo+IEVtYmVkZGVkIExp
bnV4ICAgICAgICAgICAgICAgICAgIHwgaHR0cHM6Ly93d3cucGVuZ3V0cm9uaXguZGUgfA0KPiBW
ZXJ0cmV0dW5nIE7DvHJuYmVyZyAgICAgICAgICAgICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3
LTEyOSB8DQo+IEFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2IHwgRmF4OiAgICs0OS01
MTIxLTIwNjkxNy05ICAgfA0K

