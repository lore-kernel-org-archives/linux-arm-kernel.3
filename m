Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB35CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 06:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBrCYiNxntciBYz46qO2cMDqx6NzHbF2FThpi2qKFiI=; b=iMrTLkvU6fvFogrERQMbf3oD3m
	tZeeD+47qQ7lhEwq6gQJfVh1WXMckuOc4LlE4c71SnqhIqBWxBZhm1uwreuXDGSAWX/iWvZvHABJY
	+gaU0KaAZda021QA4HXXW0VCcDgiScUZ8huQAKdgFZMMOM5Ly2JtxbENLLktH+0WPfUuj/3k1306S
	a/7JwFSKtaxC/S7rZzDXZM3hSAzgO8xZkJ1kzq43VtVFICRQ9VCbxb1DtYYkRR+QBXq0PUImxafIX
	BCvadJc78vnDxJqZEY4htdmvH1vAV9J9K5mCblU0GI3Nu0XyF0s2hMxZ+a9k+r/cZdNB6lFJkOqPG
	2GhZsPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEXl-0000000CJGc-0fjb;
	Wed, 10 Sep 2025 06:43:01 +0000
Received: from mail-vi1eur05on2070e.outbound.protection.outlook.com ([2a01:111:f403:2613::70e] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEXi-0000000CJFK-2aFW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 06:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPhOuSe8fYIV5wwvMlS48VlAk1pGFBOpwRVINay4PRNrmb6Y5xa7p/wq6VnykKe0AUhqx1IA50EYEnKvmCBwg5yZdUkhozmMkCfHQKkUIP7I67U1Q2xKZE1rUFllaYX/3coyiGeqZwKs9oWRJMN0qAn82HyWYyMVhlIGJ1RumEBG66oFnyBxlUv9z9HnsKciX3Jd3qYN0e0ILgG28hJoe73kDgRTAHWK4h+hMb+FQXYV+FQRNBwpgpji7sPINATZsElwvAETrz7/gG5WWfJeyAWJkuRaLQoNSXgNjPKgi6tBleHzDuqofkYY33Ts84Wdk44qfSV0lEfYJ4HbM6KkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBrCYiNxntciBYz46qO2cMDqx6NzHbF2FThpi2qKFiI=;
 b=a32de98j45JxpDmpnkxOt36cAMiRmHGTcPZto5eTnrxBBWSEf4PAXj+kQJ7DbirBf7UtBOhEPmYzV6Ptwf2lD2Yqk+zL97JsQEMBxq3ySFIPg9qlPaQpUc451O3pA0DuXAv/F4GeiVzu53b/BGmU2VM0kwWbOGUaBQ8VnJPobjO+jRS9Rc53nWbBrxqgwdLF3LtWeEmREpB904u6oYHKC9rQZ4O7c0UXtqSjcoSSo0+c+J0t3U2FRZz/3K7f42aYBdMnKgKX+SksLFZiAamnW87sWkGPcr1GIQpQTCKEKZD7UvOJjWZbIsjSRONuAPTRv2fxCECQgAAqOeZh/bHeng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBrCYiNxntciBYz46qO2cMDqx6NzHbF2FThpi2qKFiI=;
 b=ec+vQKQIVlSGnwFEt1tCBN8qBpAAXEeIB298yhyl7IxTzPnlNaIaEAM9mEdmh+AEWZiYdyea71CKol91wFdxnT+fPmDY/yFD6XcmxsPdXSNnJ6yoGbYGViGBBto1zeD8CuFBohBhKFFgdokJc6geZx4+95K6J4s+Ip+Xd1vmkf3J8swayvceJIvZgM+uVvqULB9q0bo4o7DO3V92y7z4qI5EALD3oxpsl5delAh3e1pDF1/HPoz5TQjCvlldYtatRlrCEo9zRJik/vnHPhA01aEGUMSNKAxQBQXhWVy/01Hfi49PYiA/5JFq0zibhE8TMp1evWpdoj2wo6yWy/J5AQ==
Received: from DB9P195MB1228.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:297::14)
 by DU0P195MB2118.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 06:42:48 +0000
Received: from DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
 ([fe80::389e:cc69:1eab:3c56]) by DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
 ([fe80::389e:cc69:1eab:3c56%7]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 06:42:48 +0000
From: Teresa Remmet <t.remmet@phytec.de>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jan Remmet <j.remmet@phytec.de>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mm-phycore-som: optimize drive strengh
Thread-Topic: [PATCH] arm64: dts: imx8mm-phycore-som: optimize drive strengh
Thread-Index: AQHcIh4fuSB4Rnpd4UKz9dfAEXs06Q==
Date: Wed, 10 Sep 2025 06:42:48 +0000
Message-ID: <ae0d3bfb56ff70839b5795cd0dc4cb32779c3d3a.camel@phytec.de>
References: <20250910061739.9800-1-j.remmet@phytec.de>
In-Reply-To: <20250910061739.9800-1-j.remmet@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P195MB1228:EE_|DU0P195MB2118:EE_
x-ms-office365-filtering-correlation-id: 61cc7c11-ef28-47ae-e941-08ddf03541a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UHRWYlJ4RDU2VVlrYmtlNVVTdW42SW5SaFBJMzQrZGttQ2h4Z2xvNS93cXNQ?=
 =?utf-8?B?TDdHVk5yMEdnM3ZWYWx0dkxJMCtEQjZMZnVvaVgvUXBCMUIrL2kxQlJlTisw?=
 =?utf-8?B?bG1zRXFuWmxvQTI1L1pmNXVIc3dTL3p6b0IzdHVoTmZlMTkxSW1OM0tFS2NP?=
 =?utf-8?B?bFR6SXV1N0FONGZDc3R6L1Y2aHFmWXZFcHdRcEhJMHFlNTFyK2I2R1lGbGFP?=
 =?utf-8?B?MC9NZVpJVVdEZmMvSkw4dW1JS0doSU1LUjVTRW5CUzVYeklURlVRL0JUSlVk?=
 =?utf-8?B?V21DVzVVMHpHRXV5UHllc1NsYzBNekk5QVJ3Sm4ybEVHNWxHaEJhdkZNNTlJ?=
 =?utf-8?B?aGJvdnBOZ21mTDk2TDZaOXVvdUJEUjVmSmR6SDE1NWtUaGxPajNXWmxCNmZn?=
 =?utf-8?B?Ylc1bkl3N3dKMHptWnFhajNpYjU5Nk5VNE1BbHhFUlJZSUYxa3ZTN0FHbXBK?=
 =?utf-8?B?NzUvT0JMUGFPTTdmYldrc0RpLzV4Q3RVcHcrU0p6Ukd6eUJKSXdBS3A2R1NV?=
 =?utf-8?B?S0hobXgxZkp5SzlWUTd1V1FWNUlpWUFNSis3UXVFZ1lKdjh5THVPODlMakk0?=
 =?utf-8?B?QllaQVNqK3FTdzNQNGgrM3BBejhVV2Y5L0wvRmZ0M01QMjVFYWV1NFNhTk9z?=
 =?utf-8?B?ZTBNN3MrMmM5SUlRZTFMVmJGa0kwcWwzeU5kUDh2TG9ITURKVXg3WFd6VTQ0?=
 =?utf-8?B?UDlUT2E4MnIwU2QzeE11Szc5Y3J0RUpXZjd2TG51NjZJaVE5VzNHYU15WFhI?=
 =?utf-8?B?bjFzYWlQS1puV3lYcjJoaDAzV2gyTExoVUc0bURnQ2dRWXFZUWp6eWlQdlVs?=
 =?utf-8?B?SXpTN28xTGowcU45eHlEbjBRZGNzdnFaUmxjVi9RQXZjT0lVaEVkTEc1M0pF?=
 =?utf-8?B?ZTlweWVnMEdEQ1FrMTBGNXFpOTkrM1pIeGw1ZHNWbDNVTGwzWFY0YjluSTdo?=
 =?utf-8?B?MTJOYXBwS0c5OFF0cXVab3cyTlFucEhDWURoSzl2NjBMTDVITnVNTHdYc2VD?=
 =?utf-8?B?Z0pkekxHU2lVU0h4ODhpQnM1TWQyMk1Ud3k3M083Snk3alpBL1pNcEh6WnRo?=
 =?utf-8?B?OWhVcVZqS1h6QlQvSm1NRUUyYkZ1Wm5xV0ErcmdqeVBZVUJ0Z1hLSEFQeUta?=
 =?utf-8?B?Nmh3K0Q4TTA1UjVqZ3EwdFc3ZFBmNGlqdVkxTERnaXphbGU5S2R6OCt4MGF4?=
 =?utf-8?B?cGw0S1NpVWFxd1RkZkdpSncwMlBWbGpOcm4zUm96OEtRSXo5SDZ3cWsvQktu?=
 =?utf-8?B?L3RheW5mVUZrS3B4YmNEeTNnaHlLMWFxVWc0TmJOS0x4ZDhkUFdZL1RVM09z?=
 =?utf-8?B?VWg0Ym1KVHo5NHVDcm5WWGl4N0hDOUVsSGJ1K2JOcExPYWowRVpCM3hnSFRP?=
 =?utf-8?B?ME92Q2dSRGNkQnYxcjhackNkODhVRUxkalFlOFNYc2dsMG80bXNidWNTSTNS?=
 =?utf-8?B?VUR5TXFJdFoyalRib1lzM01wM2J3TzRrWDBYMDVNOVdjTXpPQXFZTFYxN1k4?=
 =?utf-8?B?QWM0TG1sN0RqVDNhSTcycDJaZldESjBHdFRVVGZQeFN6LzZGNnF6M1ZGc0sv?=
 =?utf-8?B?cy9NRGhXb3AzTjhjeXgyN3dpQWp2dzJrQjJpYjExS2l4dlpEejlXUE5xZUFu?=
 =?utf-8?B?eE5Bb01USU1idmVpeUl3TEJmMjdRSnRNTVFrK09NS2ZndlZ6QW9JeEU0bFN5?=
 =?utf-8?B?V1BXMmREMWIza2h0ZGJXYmtsUVZlUUJScVRnU2ViQjJ0bHBTazVqSkFQcTNR?=
 =?utf-8?B?dk51ckkyRmxQVlh0TzNjZDZZNFRkRUpNT3h2YWZqS0xPRVFQUXFkWjJSVjVU?=
 =?utf-8?B?SjMzNHJWR0UzTHV3VVBkMVozQzdReTBXNFpQQ2dSaUxPUXhEM0VWUVdoUmE1?=
 =?utf-8?B?Nm5Kd2tUSGllK0pWL0VBSjVjbkdEbldtWmRZaWNBemo0T3E3Q1Zpa1JhUFBz?=
 =?utf-8?B?YTZjL1NJVTJwUjR4d3l3WFJSc2RuZURTTTF4OW5ZSmJBYVZLR1ZJR3MrOS91?=
 =?utf-8?Q?PO5E6DphZkBfMBpMXtELn1AodIozVU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P195MB1228.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3ZuNXZtQThsb1FKTFliK2lOSUVnMWZFSUIrWkVra21LRk0wNlZVaHF2WFdI?=
 =?utf-8?B?R2hCOXk0dVZuZ3F3dGc0Z3BEMUtHOU8wdVFHOUtQNzkyaEMyaUxUdWdOZ2FC?=
 =?utf-8?B?ekNrZG9TR1hwUk9hTXFWaVVHYWNYS1lpN3JRR0ZuNXFPZzhmSVpUYStFVVVV?=
 =?utf-8?B?alRxYzN6QjVoWVlJQUoxWmVNd3k1NmlvY1hKbm52czhoTHdlcG9Rd1ZjdkJq?=
 =?utf-8?B?RXlFWnFNbmlidXNjNW1rbThOVDE5eWJJaExRVEt0M3hRbm9YNUdUL0VPVWZK?=
 =?utf-8?B?Ums1ejJzQkRQcWVtVnlLM0hmKzdRVXZkR2ptVUZFSTNVZHIrS2xKWHJuZ0JS?=
 =?utf-8?B?S1hQTWxQSXVwWWdxajhSUkFrMVJjY1kzUlZyaDVZcWxuRktsRjJNV1V6SDkw?=
 =?utf-8?B?MkJNUHpRUjd2Y3UwaUlKRzBaNjZ2MDQraDh3WVJydmFkYXJWVUV3LzN6WWVF?=
 =?utf-8?B?dUxYdHhxRk5BbUw5M2dOMW1pTHZPS1dCemZxNGFjZysxdG0xbXRaYzJhUm1K?=
 =?utf-8?B?cHllVXdvZENud3pWVUdZRGE2MkpKbUU1dFkwZ3ZBUnozcUtoOTM0VzdhRm1v?=
 =?utf-8?B?ZTl4T0JEc1Vsb3R3ektXMXZpcTd0c1JSQnpQY0ViL2x6YXFvMi9BR0g4U1RC?=
 =?utf-8?B?a0orK0dxQ1BkQnBMK3dnTnFIb0RmRG9jcEZmTDltOVlUMjFoMVhxMFNEdlJu?=
 =?utf-8?B?TWtiQnVIN2t1d25PT1YrcUZYUCsvN2lEdVBzVTRGSXlmazVUV1M0T1B0c2V3?=
 =?utf-8?B?dTVvWVlTaFdsSWIzTThaOUJLUUk4aFhNdXNNLzRNYzUwQTFYQ3pGNUhoQ2dT?=
 =?utf-8?B?UElPbXBkOXJBOGJBa2N4cmVHQW1ZaVJWbHFkNnNONzkxWnIyeW9IeUJwdVNv?=
 =?utf-8?B?NjZFUU5FQUZEMmlSRnZLK1pNVVBSQUkyUHRBOUY1VDE1Rjg0TkNmOG1IV1di?=
 =?utf-8?B?MmtPM3Q0QlJnaXA5enY4WVJDSTFScXh3a2tpVldjNTlBOVlvR2d3NVMxTUZF?=
 =?utf-8?B?bGNNcldQVmxvQ2IrSkRRSGpMSHYxdGVhM2doRkVYOG1lbTNMbWw3RG5LRUZn?=
 =?utf-8?B?UGtUT24rWVFGMG9yTGxGR0xoYUNoYXZ0Z2g5S2JtRlowSHpnRk1HRmg3SWd0?=
 =?utf-8?B?bi9sQjU3SG5taGMwdy9QSTJRTnJBTzFoU0lWVDVGazJpcVFUZXZMVjY2Rkpu?=
 =?utf-8?B?YVNpTldOamhtMkRDTmZ1MHJZVW9pOGNjaUE4VlR2cFp5Smtjc1NoVmVsNXhW?=
 =?utf-8?B?RmNtbWkrQUxoM08rMW5HN2g1L2pGZE9Xang2YzFqcllpckhzeE5vZUJrdFpR?=
 =?utf-8?B?MnFCWFBCbTA2eHVVZ09XK0l0QzVzY29hZHJocjhpM3NDaDhXNi9INTQ4Wmp5?=
 =?utf-8?B?SUlyUnF6aG9FbG15aEtMZlUwaGg1M3g0Z3lmZ3FiSEE3Q1oyYWhsWjlQQ1Ay?=
 =?utf-8?B?dERHTGhPTm1HTmpyM0Y1akhLVXZvZENQbUUrSkxCSWZHWG5yOXV3Q2hPSURE?=
 =?utf-8?B?akZadHREYUlPcHhpVmJTUmxyU1pEanZra25WTWNpaFF1UitGUkw3WXJSVUtl?=
 =?utf-8?B?cFhGNDdSaWg1bzJEL3hJL2dzVnlDOUxaREtzWGdwWVRUc1RXaWcrQ0lTcFF4?=
 =?utf-8?B?ak9WK0ZNb0tnRHZKN05CNzRxVVZnT1drN1hnZ1lJUDRrNDdSa1RyaVgwWHpj?=
 =?utf-8?B?angzVjhmTTlRVmRTWUxsaEpuRVNDa09BczdUdG1ZYnE1M1dHNWVVRTMwSEVY?=
 =?utf-8?B?ZjBBOXYzR1FrN1VEOFAwa3htTTNWcG1MTVZnajlwV2xaNlBxVTIwMHFwSzMz?=
 =?utf-8?B?V0tTUHNYM0p0Qmgzd1ZmdkxudDZENzFFNUV6UHNJNzhTbHA1TG83dEQ0Snc0?=
 =?utf-8?B?MTJISDJQWjVNdXdlNlVrckI1Uy9WZ2oya3hSRndPOXJldENMMlQvVjM5bWMv?=
 =?utf-8?B?UFcwVUV0Q3hYM2FjYzcrVUpDWmZ0VUk5L2hraHVvaW1VeERGbFVuOFhvZVVj?=
 =?utf-8?B?MEErNHYzcm1mWnVlZ0xnaVN4U0xlVHk3REV2VUpxdSs1d0RRcVpZRndUemRk?=
 =?utf-8?B?TnRnRytNak9lUGV4MCtqWkpQMVZvU2xmWlpqNzdCOFZJOUV5cFFuK2orTFJP?=
 =?utf-8?Q?XFuqaZZoqFEWt6iPDcjN6+4yF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA26B57892FCEE49A3B1F2456D61253C@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cc7c11-ef28-47ae-e941-08ddf03541a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 06:42:48.1994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 82e2ATec1cw1Bi8o18Q5EjkDdxq1zZJt6yWfPZ+Q4C8oErrA4/g8OQ/zXEY9mOBeBk+mjieVwUvVTGMg0wnS+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_234258_656554_27D40A1B 
X-CRM114-Status: GOOD (  13.40  )
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

QW0gTWl0dHdvY2gsIGRlbSAxMC4wOS4yMDI1IHVtIDA4OjE3ICswMjAwIHNjaHJpZWIgSmFuIFJl
bW1ldDoKPiBSZWR1Y2UgRU5FVCBwaW4gZHJpdmUgc3RyZW5ndGggZnJvbSBYNiB0byBYNCB0byBv
cHRpbWl6ZSBzaWduYWwKPiBxdWFsaXR5IGFuZCByZWR1Y2UgcG90ZW50aWFsIHNpZ25hbCBpbnRl
Z3JpdHkgaXNzdWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBSZW1tZXQgPGoucmVtbWV0QHBo
eXRlYy5kZT4KClJldmlld2VkLWJ5OiBUZXJlc2EgUmVtbWV0IDx0LnJlbW1ldEBwaHl0ZWMuZGU+
Cgo+IC0tLQo+IMKgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLXBoeWNvcmUt
c29tLmR0c2kgfCA4ICsrKystLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4bW0tcGh5Y29yZS1zb20uZHRzaQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvaW14OG1tLXBoeWNvcmUtc29tLmR0c2kKPiBpbmRleCA2NzJiYWJhNGM4ZDAuLjky
MWE3ZjU4ZmQ0MSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4bW0tcGh5Y29yZS1zb20uZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhtbS1waHljb3JlLXNvbS5kdHNpCj4gQEAgLTM0MCwxMCArMzQwLDEwIEBACj4gTVg4
TU1fSU9NVVhDX0VORVRfUlhDX0VORVQxX1JHTUlJX1JYQ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgMHg5MAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oE1YOE1NX0lPTVVYQ19FTkVUX1JYX0NUTF9FTkVUMV9SR01JSV9SWF9DVEzCoMKgCj4gwqDCoMKg
MHg5MAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE1Y
OE1NX0lPTVVYQ19FTkVUX1REMF9FTkVUMV9SR01JSV9URDDCoMKgwqDCoMKgwqDCoMKgCj4gwqDC
oMKgMHgxNgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oE1YOE1NX0lPTVVYQ19FTkVUX1REMV9FTkVUMV9SR01JSV9URDHCoMKgwqDCoMKgwqDCoMKgCj4g
wqDCoMKgMHgxNgo+IC0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgTVg4TU1fSU9NVVhDX0VORVRfVEQyX0VORVQxX1JHTUlJX1REMsKgwqDCoMKgwqDCoMKg
wqDCoMKgCj4gwqAweDE2Cj4gLQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBNWDhNTV9JT01VWENfRU5FVF9URDNfRU5FVDFfUkdNSUlfVEQzwqDCoMKgwqDC
oMKgwqDCoMKgwqAKPiDCoDB4MTYKPiAtCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoE1YOE1NX0lPTVVYQ19FTkVUX1RYQ19FTkVUMV9SR01JSV9UWEPCoMKg
wqDCoMKgwqDCoMKgwqDCoAo+IMKgMHgxNgo+IC0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgTVg4TU1fSU9NVVhDX0VORVRfVFhfQ1RMX0VORVQxX1JHTUlJ
X1RYX0NUTMKgwqDCoMKgCj4gwqAweDE2Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBNWDhNTV9JT01VWENfRU5FVF9URDJfRU5FVDFfUkdNSUlfVEQywqDC
oMKgwqDCoMKgwqDCoAo+IMKgwqDCoDB4MTIKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoE1YOE1NX0lPTVVYQ19FTkVUX1REM19FTkVUMV9SR01JSV9URDPC
oMKgwqDCoMKgwqDCoMKgCj4gwqDCoMKgMHgxMgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgTVg4TU1fSU9NVVhDX0VORVRfVFhDX0VORVQxX1JHTUlJX1RY
Q8KgwqDCoMKgwqDCoMKgwqAKPiDCoMKgwqAweDEyCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBNWDhNTV9JT01VWENfRU5FVF9UWF9DVExfRU5FVDFfUkdN
SUlfVFhfQ1RMwqDCoAo+IMKgwqDCoDB4MTIKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBNWDhNTV9JT01VWENfR1BJTzFfSU8wN19HUElPMV9JTzfCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAKPiDCoMKgwqAweDEwCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqA+Owo+IMKgwqDCoMKgwqDCoMKgwqB9OwoKLS0gClBIWVRFQyBNZXNzdGVjaG5p
ayBHbWJIIHwgQmFyY2Vsb25hLUFsbGVlIDEgfCA1NTEyOSBNYWlueiwgR2VybWFueQoKR2VzY2jD
pGZ0c2bDvGhyZXI6IERpcGwuLUluZy4gTWljaGFlbCBNaXRlemtpLCBEaXBsLi1JbmcuIEJvZG8g
SHViZXIsCkRpcGwuLUluZy4gKEZIKSBNYXJrdXMgTGlja2VzIHwgSGFuZGVsc3JlZ2lzdGVyIE1h
aW56IEhSQiA0NjU2IHwKRmluYW56YW10IE1haW56IHwgU3QuTnIuIDI2LzY2NS8wMDYwOCwgREUg
MTQ5MDU5ODU1Cg==

