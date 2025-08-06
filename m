Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7916CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 02:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIPjQNI2Wng/loJNM7D0XiKUFYAzfsdAlmqeZCF4/tI=; b=Q2K6r+l/5wVLanGVuBOkU5Iyhg
	ngPuxTfvCVQjDgUIb8YYVxNxeDRDcY78EhXsFivIvwCV/13jV5YPAXW+tOZaLQXrZb35hwNzR9TS4
	ThbBv3KcLfmaFFGyHVXr4kgUVLTld4SMTBxZUTAeEElZ24h4gK4LeeRUEw+j/uvDX7pJuHcQt2WML
	gISa+A28CV3HeMvt0BfdRlZdersT9uq3mMe/ZgshLR+M9tILyZnW8Cy1I3ArM7UpBNQ0kkiFXFO8Y
	SnqOf0caxvsQ5dggl+qQz4p+FAXk45UStqKtpodaK/S3e0vDtFnOTAiDEtr2HN8e7BSgbBh/piJPr
	VWB4rDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujULl-0000000ECFf-0axi;
	Wed, 06 Aug 2025 02:57:57 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUJA-0000000EC6r-3b7x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 02:55:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qB8udkW5jq8rbhT7SIoiZzJb6NUt5/+RPMwfNxcz6wox42KeXry9WNtoXtwivIHBMpmvTDXM5o+OMK2AoYXA0T5lNN9WzA6Y85jfixXKDYo33ayrwAaaSlFrZxTFxEOn8hlUMxQIwsQo36c7Bh6GGYQZSmuZfKlhyymTw9h+qGNJuQVSge0ztNCW7hMR4x3p5NuBc93LPyAw4rjEB0+MNsgOjdNqxz7M6A4Vtf/PgXNIj0kCBU3arbFaEuwCTXm2aSQtFdmarzaj0eAVx86I6zT4zD9rVYQW9CMaNNAI8YWtpEunWUb/9G3b7TxQyaJilnmFi/xHJfGyTp+QuSMoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIPjQNI2Wng/loJNM7D0XiKUFYAzfsdAlmqeZCF4/tI=;
 b=wZiq8yQ513YR5BQthVxVdvo1wVuoqt9wvH3E43xiGn+EeVBpBbuPQHpnhW61WXrc9CuEqxszRpPx+DyENmyHJ/Hk0RNH3c+pw1lVUQc0IuFSVOseC4JnnZb3a9u39YoGP/Cu4fsSqYjxNibg8ixVp2B95LOdFA1yMs7qY5to5PDi5bzvI6CqvKSQrZ6N1e0AoFOlBFWhZx7TMKw5wAO3F4rx8nzi1/8L3/J9MQOYT3BTQU4BiZJUJIZ3qDhEe+ZikRp4U2DbyRCRM96BGfYZLRbkGGK1iAmRuxzSBrQM9twlP+z/eOgzs+zx6jjBSPZ3tsdNJn/ocICC1xonreBmjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIPjQNI2Wng/loJNM7D0XiKUFYAzfsdAlmqeZCF4/tI=;
 b=Mm9o+X9Pqx2TF165FiuiTo64/ZvxIMmYYa7beFpKYXXLpFElszlVDc3O8k7bvp8r48ZNzlR8WM/LJQ+WGWhRjW6PREF+952CIEn2KW/e5/SQNYwCd/VEKfg5VaE3Ann4NxqOaWX5At7MGQ+OP9L3/156p4fOOaglc3KIf9IAFpJ+t7DEMFr3RZc6oEsU5NBi6CoPbMX0VT9TLzLlwxDAiSgffxMdDVzelJ2NjZWciTPOZiUfe6hbHwN2TIA1bCoE6RawDi+JDGTdh34tgX6j0BcdKLJZffFpzDk1jWEyzmMUtEby0u5CK2IqZP9HeHssSWLmhJsxqAznl/NBPrjHng==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SEYPR06MB5063.apcprd06.prod.outlook.com (2603:1096:101:54::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 02:55:00 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 02:55:00 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drivers/soc/aspeed: Add AST27XX SoC ID support
Thread-Topic: [PATCH] drivers/soc/aspeed: Add AST27XX SoC ID support
Thread-Index: AQHcBdPFcrZOhFLCe0ixLd10Nb8OdrRU04WAgAAavoA=
Date: Wed, 6 Aug 2025 02:54:59 +0000
Message-ID: <OS8PR06MB75416120C6B6588528A7FBA9F22DA@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250805063957.1452653-1-ryan_chen@aspeedtech.com>
 <182db4f2848dc7b8c110d45bb606e6219983c237.camel@codeconstruct.com.au>
In-Reply-To: <182db4f2848dc7b8c110d45bb606e6219983c237.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SEYPR06MB5063:EE_
x-ms-office365-filtering-correlation-id: 45642437-5dea-4811-33ed-08ddd494a251
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UEJEdEV5MjZaUmJDWEVpOUJZNnlyMStiMVJLMnlDRmI1TURSN0dMU2x0em1Z?=
 =?utf-8?B?OVV4dnFzYnJndWEwSTg4QnRqQmxCT1p2Nld4dXk1WndWNDZpbjhOdFROV1VV?=
 =?utf-8?B?azkrS2RUc0o5OWg3eEhjMnJmSzZabDZHMlVFbHJYUjZQOFJHSUtXRnFIcnMx?=
 =?utf-8?B?aTZ4ckV1TU1FM3U0cjJGMURSSGFkTjRZTGsxNU5IQlZPWG05TnppNUw3TXdw?=
 =?utf-8?B?WDkwb1FiYWdmUkdDMERNaVBCWmgwMVR2U0t4ODlpZ3FNYzZwYS94c0xoSllx?=
 =?utf-8?B?NWlURGVXYWJycWh0bi9ZTVc1ZXpVSXViUmZxVGNXaVN4WXVWQjE4UTFtclpY?=
 =?utf-8?B?UnNBZGJRSmlxTzR6b215Q0xmRkxhS3dxYlNVMDBhOGJtaVV2ZkJoQk5MZ29K?=
 =?utf-8?B?Wm80L3RNTiswK21qejE4Wk9UdEJEeVVwaFFKd3ZFekZqS1d2ZGE0dnphcEdR?=
 =?utf-8?B?N0RJN2h3cUF5dTliTjJHKy9rdW42cHdHTXRPNmFhWjNpT3cwTUtZYnFKVGFC?=
 =?utf-8?B?WnpOQm45a2RIbmNYWFJiYmFvVGg5RnFvYlo0a3Y1YVIvSjcrMlNEbGs0ZmIx?=
 =?utf-8?B?WVV6MmRBY0V5U3BNak1JTWhacUJWWmlBYnN1a3lDZTh2YXNMSGJHbjhnSkli?=
 =?utf-8?B?Uy9PaWZ1L1RSbjVVZWFxL2F1TE9VNVh0cVYzNS9MV0VaeHhNek9KbWkrWTRp?=
 =?utf-8?B?eUs4TWluNHVPSStGc04xNHZNU2Zna3JDN2JhR2UybUlLSjIrSUEzSldYalcr?=
 =?utf-8?B?QnhRRHExQVlJUGc5RjYvc2lzVUFUSGtPa0hJSDduWm02UTllc0wyaCtNbC9y?=
 =?utf-8?B?R0M4NytGTzNZd0RDVldiTC9UNmNHUjV3Q2swWEFSeHBZbVJ6VzczTm1mcDJx?=
 =?utf-8?B?dGdxZEllOENxUHlhNkdYbE9oL0xDWmQ0ODloNEpHVUkvVWVrTEQyWUZ0ZThT?=
 =?utf-8?B?cUtudDNwM08xOXgyRlhGekFCSlJaTVZyRk5wMDlMOTJCQ2tOcmNmZXZkQzRr?=
 =?utf-8?B?SFJhUk1hQUN2b0ZRYURpcUwxeE1uQXFqOGJ0UlRLeS91cnljQ01YQXNPWEtz?=
 =?utf-8?B?ODBsYWhFT0VncGJOU0graHR0ZmZZdTN2U2RCckEzbW5zK05Mck5jbmxnT0hN?=
 =?utf-8?B?THJiVFp6ZENzSmVQSHRkb3pnU3JRSEZOWWdHc29nTjlORFJtT245YmhkMWxo?=
 =?utf-8?B?aHVYbEpMVml3aGtYdGQrVzdMd2JMK1VieUFzODgyM1RwNVVIdjM4OURqWW1U?=
 =?utf-8?B?SmNiN1plcThWYnM3YnJ6YVBlYS8vdFNjUVBkZFdPc3hZdjVWSGI1dmVOYUVG?=
 =?utf-8?B?TW0zV25NY21XckF3eHRUSmpwLzNhY2hHd0NvUENYRmRzd04xM3E0dEtUNFZW?=
 =?utf-8?B?RjV3VVZPbFJoU0Z6ZkgyTi9KckN2TFRWeVMzQmZwcW5mVXFlUnJ0UENrNGVK?=
 =?utf-8?B?ZzFJOUM3ZlU5WTB2QlhZdnp5QWpPZHZXNkRieEJNYXRCcG5RbnFRWnpudysv?=
 =?utf-8?B?L04zYUM1S2dGOFMyZXduVThvMFV0d1MwbFVNN1RpeHlMenBJV0RTZExqMUZ2?=
 =?utf-8?B?S0kzZjQva1hub2xwREhoZ0hOWTErWWpkQ1FMZUhiM3Uzc0FiUWpJUWVpMGhB?=
 =?utf-8?B?NXVycGllakFtemp0aS9WL2xpOTVoRW9IUmVjOHJXQml1aHNQUzdtQWdKZzJC?=
 =?utf-8?B?NllacEpCV1piMnkwa1FqdjdhOGc2elhqRmZFM0pNc2lsY3o3ZDJCSXI0bXEy?=
 =?utf-8?B?RDZzYk9MVEJyTTNFM2d3UjVTMXUrbXJyOWlQMTNGcWQ2akdqK0hwYngwUVU4?=
 =?utf-8?B?elpqVXpkUm92OWRCbFhrd2pRdmsyRWtJZnU1QmlmRFVweW1oYmNRaVE4NkJm?=
 =?utf-8?B?VjVFQVU4ZHNIRjlNMjlnYnhiTXBKSkRtQXZ0a29DQmFjU2UxV3p0eG5XTjVq?=
 =?utf-8?B?Qzk4YnYxRDB5aUFIcExLbitNdTFZOC9NbjFPQWFHTUpMV3czSHZ2cE4ybWlh?=
 =?utf-8?Q?+3xMbHKqHQeVnxBCpf3z9zBU7Zqowo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTRGYTZQb2tPbTh2dnZnL0g5VjJuNmc2djZiS2VtMTVmQ0w4S1NZQTdsNUZQ?=
 =?utf-8?B?YXlxVm5EdXhzVVVVNCtSRFEvTlUzUmFvcDJ5UzJQRXJNcUgrK2RPc1NsVDE5?=
 =?utf-8?B?c3gwdkNaa2Q3OHNYNm41OG5ObUx3QXlBUFRVczZ6cTFhb1N0elU2ekI0ZEta?=
 =?utf-8?B?NFEwc1lKR3ZhZGpJeXc3TGtpcmxIYTJBcFR4V0VObi9PSUxlMkhveUR5dXFx?=
 =?utf-8?B?SFg2THh6UVlVb1VnSzJEaVZ5MkpjNm5BL3hXNjVSNFBpbExZVy8wckZKSkxt?=
 =?utf-8?B?V3hjbmd5SUJkd2xzQVBFUTBVU3NlMkpoa0xtWmlDRUV2dmJLS3JmSmV6azVL?=
 =?utf-8?B?UUxHakZNL2pzS0dOQnFUc2x2c2owOS9vWi9zT25jSzFsVHhCbmZHYVdveHBI?=
 =?utf-8?B?Y0JYbHR2d0dHMFpOK2I1UnpTRmVkK1ZrSVhiMU9wWTRGbE13cFk5NWErNnNU?=
 =?utf-8?B?UFdpWVZ0dzNVT2lPTy9hakJXSUppMlo2eWduRU5Ka082K200bk9FWGIySDJO?=
 =?utf-8?B?bXRUQldLMHJxMWRZVG9YelpTY0FxanRsaUh1Um9wL2l3Tmp6L3RCUGZ1V1JM?=
 =?utf-8?B?bXhDQzl2d095UmdtUHFvTExNc1F3MlNmR24zMWF1M2s0OGRjRFYrY2c5eTNi?=
 =?utf-8?B?Sk5HeDdyNExmd0lTbGtnRHBEaFFPY1JYcjR6N2FaQnBOV1Y2ZGtITnpVRVlO?=
 =?utf-8?B?emhIaVJtdUdFaUVIUm9RamVwVEttSXZnTFVRVDVCU0JzbDNDZmRpcTZmaUxy?=
 =?utf-8?B?eHR4ZlBUc2FhSWoyYWxtVFNkUEEwYnJIMTV5eklUS1NxRVlXUWJ4VlJPSzhz?=
 =?utf-8?B?ZE5MVy9DYlk1TnNaMkFXeVZlUmlzYXZhbVUycU51bXY0NmhNRDJhS1ZWMWdY?=
 =?utf-8?B?TDN4T2lMT0M4b20rbDR4Mkk0M0MwZUZBc28yeHBNZUZxSHZGOUx3d1hmeXNt?=
 =?utf-8?B?ZnZldU12TjAvcm5Kckd5YzY2NWhGTTFETUVNcWFBRWs3TytjcXJYRm1jOWhq?=
 =?utf-8?B?czBXQXN3emtKRDBYdndZZmVVbVlFcnhQTm82LzI0cVgrdnVPSVRHZGxwT3hZ?=
 =?utf-8?B?WHZkZnVFdjd6RGxBeEFtTTZueEhKQnBOTW1YenFKV1lQb3lFMEZoVTRrQlBS?=
 =?utf-8?B?djNReW9ZQVZtMGtaUDh0YjVGMTFVank5Q2I2NWFZVVJlaXp2S1pOTGpxclRG?=
 =?utf-8?B?UWdBd3VOZWRSb2pUWnRwQnJMSjFCT2p0aU1SZXV0elR1UVZHSmw3enRpZDJP?=
 =?utf-8?B?UHpsVXBTTVpHZ29UUWVvMXdQTHZIU2U2Q3B2eVZNcktjU3ROTUJveEpMUGZj?=
 =?utf-8?B?UmVRKzdyT2h1MlpWbm43OXdOR0tTU2Rra1ZxR2hNRnkvTWJyV29jdTVUSVpK?=
 =?utf-8?B?Zkt3Q05PKzMzRmUxT3NublJFallQK2RETFpxeWloRncyNEY0ckF6N09iYTNq?=
 =?utf-8?B?OWVyck1LcW1TKzZpTjVXSHFKWElYc0EwZzV2NWhuYVJXbmhwcXRoTlpuODZZ?=
 =?utf-8?B?Y3V1dHdTdWpDUFZWZmxndGlTVThjVENHbEZDMTNROWhFRDlyUEovSHJPV3Jr?=
 =?utf-8?B?bG1qRVBHN2V5K2p6NlhGcHlobTdkVS9PRkZvSjU0QWJJa3BSQk9JdTU0YlFC?=
 =?utf-8?B?dTAvT0p6a2NEbDFBUGpwL0o3cDdoblFLeHpFcW1jQWd2bHBBWStHTTZsYzNP?=
 =?utf-8?B?dGREL21WVHBybFpKMUhUajd4RVFnV09KNWFCL2lBKzMwbDRjZ1BqeXpoSkJw?=
 =?utf-8?B?SUxIR2VkeUxreUFFZER4MnVydFhtRzFRZjZvK0J4OXNCQjJSaEtWbGFNR0lk?=
 =?utf-8?B?TXdRNFNzZDdqaDlZbk5pZVUyM2U1Z0x1a2paUlVRYlB6ajN0ZFUyQzgraW5P?=
 =?utf-8?B?RFJnL2IrYnM5Q09KNWNKcGltVFl4MUpUQitRNENKOGplS05SUzZ4M0ppdU9X?=
 =?utf-8?B?TUhDanpVVklHdzdkbGdkQ3M1WXh6bmtLclVQMksyRWRWbVBFWTZJbFkyU0RR?=
 =?utf-8?B?QzVnT1AyL0RlMjRBNmRPWDUwTGVXbC91bkxhR0kvUG84UE03Kzk3SGhQWTBT?=
 =?utf-8?B?Tm5mdDJDbVA0cmw0eks1aWVSRWpFZjltZ1U3MTJoS2E2UFRoSHFuNUxkeUVU?=
 =?utf-8?Q?hvi/LItyXro+5gEd5cRxZs2Iz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45642437-5dea-4811-33ed-08ddd494a251
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 02:54:59.9481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3GTorjAqm7+NuEfQpx6uUDuC+P2yIPe4Rg107z2fmuHlRi2eCh4BgGAPDrceIeWFgedUnO6z67YqxcqsdjpvmEIV7RRn1iYDYxW68RIsy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_195516_892565_718897DC 
X-CRM114-Status: GOOD (  19.61  )
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

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcml2ZXJzL3NvYy9hc3BlZWQ6IEFkZCBBU1QyN1hYIFNv
QyBJRCBzdXBwb3J0DQo+IA0KPiBIaSBSeWFuLA0KPiANCj4gUmVnYXJkaW5nIHRoZSBwYXRjaCBz
dWJqZWN0LCBjYW4geW91IHBsZWFzZSBmb2xsb3cgdGhlIHBhdHRlcm5zIGVzdGFibGlzaGVkIGJ5
DQo+IG90aGVyIGNvbW1pdHMgdW5kZXIgZHJpdmVycy9zb2MgPw0KTXkgbWlzdGFrZS4NCldpbGwg
dXBkYXRlIHN1YmplY3QgOiBTb2M6IGFzcGVlZDogc29jaW5mbzogQWRkIEFTVDI3eHggc2lsaWNv
biBJRHMNCg0KPiANCj4gU2VwYXJhdGVseSwgY2FuIHdlIGNvbmNlbnRyYXRlIGVmZm9ydHMgb24g
dHJ5aW5nIHRvIGdldCB0aGUgcGxhdGZvcm0gZGVmaW5pdGlvbg0KPiBiaXRzIHVwc3RyZWFtIGZv
ciB0aGUgQVNUMjcwMD8gQXJuZCdzIHJlY2VudCBuZXdzb2MgUFIgYWRkcyBzZXZlcmFsIG5ldw0K
PiBTb0NzIChhcyB0aGUgdGFnIG5hbWUgc3VnZ2VzdHMpLCB3aGljaCBpcyBhIGhlbHBmdWwNCj4g
cmVmZXJlbmNlOg0KPiANCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvc29jL3NvYy5naXQvbG9nLz9oPXNvYy1uZXdzb2MtDQo+IDYuMTcNClllcywgd2ls
bCB0YWtlIGxvb2sgaW50byB0aGlzLiANCkl0IHdpbGwgYmUgbXkgYW5vdGhlciBwYXRjaCByZWZl
cmVuY2UgZm9yIGFzdDI3MDAuIA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2xpbnV4LWFzcGVlZC9saXN0Lz9zZXJpZXM9NDYwNjQ3DQoNCj4gDQo+IENoZWVycywNCj4gDQo+
IEFuZHJldw0KPiANCj4gT24gVHVlLCAyMDI1LTA4LTA1IGF0IDE0OjM5ICswODAwLCBSeWFuIENo
ZW4gd3JvdGU6DQo+ID4gRXh0ZW5kIHRoZSBBU1BFRUQgU29DIGluZm8gZHJpdmVyIHRvIHN1cHBv
cnQgQVNUMjdYWCBzaWxpY29uIElEcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJ5YW4gQ2hl
biA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9zb2Mv
YXNwZWVkL2FzcGVlZC1zb2NpbmZvLmMgfCA0ICsrKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9hc3BlZWQv
YXNwZWVkLXNvY2luZm8uYw0KPiA+IGIvZHJpdmVycy9zb2MvYXNwZWVkL2FzcGVlZC1zb2NpbmZv
LmMNCj4gPiBpbmRleCAzZjc1OTEyMWRjMDAuLjY3ZTlhYzNkMDhlYyAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLXNvY2luZm8uYw0KPiA+ICsrKyBiL2RyaXZlcnMv
c29jL2FzcGVlZC9hc3BlZWQtc29jaW5mby5jDQo+ID4gQEAgLTI3LDYgKzI3LDEwIEBAIHN0YXRp
YyBzdHJ1Y3Qgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqB7ICJBU1QyNjIwIiwgMHgwNTAxMDIwMyB9
LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqB7ICJBU1QyNjA1IiwgMHgwNTAzMDEwMyB9LA0KPiA+IMKg
wqDCoMKgwqDCoMKgwqB7ICJBU1QyNjI1IiwgMHgwNTAzMDQwMyB9LA0KPiA+ICvCoMKgwqDCoMKg
wqDCoC8qIEFTVDI3MDAgKi8NCj4gPiArwqDCoMKgwqDCoMKgwqB7ICJBU1QyNzUwIiwgMHgwNjAw
MDAwMyB9LA0KPiA+ICvCoMKgwqDCoMKgwqDCoHsgIkFTVDI3MDAiLCAweDA2MDAwMTAzIH0sDQo+
ID4gK8KgwqDCoMKgwqDCoMKgeyAiQVNUMjcyMCIsIDB4MDYwMDAyMDMgfSwNCj4gPiDCoH07DQo+
ID4NCj4gPiDCoHN0YXRpYyBjb25zdCBjaGFyICpzaWxpY29uaWRfdG9fbmFtZSh1MzIgc2lsaWNv
bmlkKQ0KDQo=

