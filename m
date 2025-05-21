Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9CCC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 12:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONujXqfJdNV+51aCh+DF6y52FJ3mUZQoSFkUXOx0VDM=; b=vdANoJ5fXjGF4nw2mwpi9MBd7b
	K21spcKsmECU4ljxF/FQ4P1SLIjdV9b0Nu1YX9lcLTMqNKuuh+EbZez49iXmZDK3k9FT8kLnUf9hg
	mUGlXyntPZ8IWPrGi3DOuRCJPHOJ3ERDAX24MMWsKvNFCYJI3iSBPgnH1SufRp+ktrrEHCfO1TUSs
	lhKtCZf20nQfLovX5+gX4jByCYzUHmIFRmKYzyBGvEoCmnczTgEBz6EjAuV3/Qi3MOTaNKBNUlBM8
	uP/4d2qCVCdwJ/ppIxbHoL7O9AVXF3+qH72CD9My8t32TGXbYrNHRBjGMarsyYdbkMoPzGz4ZRHwB
	gAGeDmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHiBI-0000000Fiba-0uDl;
	Wed, 21 May 2025 12:04:20 +0000
Received: from mail-am6eur05on20716.outbound.protection.outlook.com ([2a01:111:f403:2612::716] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHi8E-0000000FiDw-34xc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:01:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hl4A2E3M2iIFuI5o/bfD2ewQ/YAHpylmOO2q1nwTqIxIdyUnC1lEA/VvWj7c+mcTmoFEjD3jJhDQZnbOdZ03rMYezD/zkbSxCaRxDVMLsfDsArYxMF94dTDMDPAwniNmCKgXanuiUkyY+f76KF6PLz/DPYdgFISaOh/Xnx5FAez3kPp4EXjXOhJ8aZ5rkzxZ1INh2bwy6RMRsSPJcHlY4ENdEVlK4y2SuaZYA/2EOFFuRGcYD3XoVuT9bgdt+FFNTnOPjyQ2hltOIJbNgtPXPNoi9w09UjN4mttMCt5QVwoRGf9q+iB0EDINtxlfndAL0+tWgCwnJAkn8O41OnVhBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONujXqfJdNV+51aCh+DF6y52FJ3mUZQoSFkUXOx0VDM=;
 b=JIDCDcW1RpGXzI26C3k2Q0SBpjCLrpxIFrm+VDlGGl9N8xtzHvWQpEUU54dkCXWAM1+I5HoSVLz6VjBAO2BZWGDek3om5PnezvN7VnSfvHLQBt4FXd2TLtUHJwg164a9U2kR2VNeDAMeO9VHzX/TmthWVKELXpxLOD0imQJVgZo4J6cnZftmpNPlKj3yCpQQ1308mfiylrs73/BBGTyMpFiEQwu3DDvdTo9/l5+ET/rcjsairnkyoLwlPcwYbzDoHxK7374mt+O1Nh3CnTTGDIdZHu8Ezz/2KiLWq9ZNAhYGkz192O0dxrz6Kr3FsiNAWo29QTkEiapLaO4i8ivJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONujXqfJdNV+51aCh+DF6y52FJ3mUZQoSFkUXOx0VDM=;
 b=hUGJlgOkl3HLEMH8g+OkdQxIR5vYWlBFQoFztHlZFMkKzZobL/vooQHQP5biXPr94pTzMBciJsqe2s3D4HFfpyNFHAF9iLvGVt3KztOBAurUZ7Xiq7WkBqHCMZ9jf7xRgsjRcL+hnTgCNEmgGTmVyak8j1yfkTkbCgPnRVVwFzRrxpGg1I9ty7CWqqN+KoZyJKC8dEeO5Z3O13T739bquwk0V1wz/tZK7Jv9NK7oGItE9Bp1VnhKoK1IGEWzigNeex0D6BGn3wCXwDnKGsoyLqkMf8ePBMEaL0+36YXUh4Re9XBxpbjGN2t3DfvxUxWgGuz4oVqOZBHIoOzY8vFC3g==
Received: from AM0P195MB0257.EURP195.PROD.OUTLOOK.COM (2603:10a6:208:b7::25)
 by DU0P195MB2222.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:47b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 12:01:00 +0000
Received: from AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b92:3cc:22b3:4c59]) by AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b92:3cc:22b3:4c59%5]) with mapi id 15.20.8722.027; Wed, 21 May 2025
 12:01:00 +0000
From: Christoph Stoidner <C.Stoidner@phytec.de>
To: Fabio Estevam <festevam@gmail.com>
CC: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Topic: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Index: AQHbyX2bW4iAAlnw50GZbSoOhdp/G7PbhNeAgAF4NgA=
Date: Wed, 21 May 2025 12:01:00 +0000
Message-ID: <bbcf96dea612dd5dc2e9f2809139a3df2602f7d1.camel@phytec.de>
References: <20250520115143.409413-1-c.stoidner@phytec.de>
	 <CAOMZO5D8giOiBCeV5AP1pL+hCFQt9bs3gFsr2mCgMSSbcbCovw@mail.gmail.com>
In-Reply-To: <CAOMZO5D8giOiBCeV5AP1pL+hCFQt9bs3gFsr2mCgMSSbcbCovw@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0P195MB0257:EE_|DU0P195MB2222:EE_
x-ms-office365-filtering-correlation-id: 8c1f6263-3fd6-426d-b531-08dd985f2769
x-ld-processed: e609157c-80e2-446d-9be3-9c99c2399d29,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S3NLQitIbEkzdlYrR3pOTTdGbjNuRENGaHROazBtRHoyL1lJR3hTNExTU256?=
 =?utf-8?B?VmhWSUsybU9JV2wzTlZNNEkvcHBTYlhHaXlwR3cvclBJSlRzTGd6UEc4bnZp?=
 =?utf-8?B?cUQ2RjY1eklhU0NyTkt1bnN1bXlUVlNlZG93VFM0UHhvRE8yY2VZRDdVcStS?=
 =?utf-8?B?azkyMm93V2pqLytYSDE5OW1kbEc5WG8wMitaRzdKVzNCaGI4VGxPN252SHV5?=
 =?utf-8?B?emJQSC9OZHM4NUl0VGh1TVZkVmFWci8ycmc4N2RBSzBkVWxMK2Yyd3Rsa1hV?=
 =?utf-8?B?QzZ3S1ZNcHY4WnU0eFFHS3VuRVJtRlBMcCtwR3ZiWmVaTnVUWGxhUWlEYVA2?=
 =?utf-8?B?QUpMUU9YZ0VnbmdTL0F3T1hHcDA4M1VTVzM4Uk9pcFFFRlJlL2YvQ0d0azNR?=
 =?utf-8?B?cmVBcE40VlJLNW5jc1JmNXMwcjM5dm5IYXVCL0VYVmNtUHBQSDg2TW1tNGh5?=
 =?utf-8?B?c3B3T3VDWnpOdHdMZHJGemR6MXNiSEZhOFl1OE1KVWYrQzMyTnpzbkJDWWw3?=
 =?utf-8?B?UUxjbkNWaTd5QmZRTUE4RmRRamVoL2dzc3RVZURwczV2bFZFaDFVUGNIdUFE?=
 =?utf-8?B?UlA1bmQzMFlneWxPamt5RmhncGd3OU9pVUhtK3RSaFp5QjhBcmZrZWkvbjVG?=
 =?utf-8?B?LzZsMkQ0dHczL0toVzhFNlFvUGpscXl5UEd3VSsvS0RqR1lhckpYWWtmKzVT?=
 =?utf-8?B?VjZTSzUxazNteEd2aWd5cVNVZng5aEdWdXlURmxwU2h4U2hwUnlINTY4U1pB?=
 =?utf-8?B?Sm9ZTWNGeWhKeDN1OXE5S2JaVUE5THQ3NW5ueG04RUY0cGFOR0N1dWZrTHUy?=
 =?utf-8?B?d1gvZHZHdTk0dG5ybVU2cUJhb0QzaWRiNkg2SitlQ1NJd2xuT1BnYlVXbldK?=
 =?utf-8?B?aTFmeXFzK3Yra0FsMkhEWDA3bnRJTHpDanBWQXA5WTFpV1NOTVNqeVl6QXBB?=
 =?utf-8?B?UzQyYVhlTy9nMEQ1cGpleHMvakV3RXBtK3lMRlk3Y01VZENOL01Ka1d3RzlT?=
 =?utf-8?B?cFhwU0phVDd0WllJVDdtSFh1YlRCRzNOU0YvNDEwMTlNbUNmY1hwOWQra3dW?=
 =?utf-8?B?YkQ5NVl5azYvNyt0eGlDMjRKY05UcU1RL1Z3dTFsNnNZSHV0Mks3MzNsZmN3?=
 =?utf-8?B?N3QrNkRuNmZCOW9ZQkR3TERjT0FkWXBRYzRQSDFlSzNZS3BQeVQrM01HRW9r?=
 =?utf-8?B?OWlqVkZxT3NpazBmYlZDR2xJK2VJeWRjRVNkWG1RZmsrWElwTGIwN1FpMmNW?=
 =?utf-8?B?TlVtQ1lpMFk5elJYRXFEeFR4bmJyRGlGNEY3Z1IzQlFhZ1AzTG1GaytjYi9h?=
 =?utf-8?B?b2dvV1VzbVRZVjFJMXB6YlN3QVFDVUJyUis4dGxCRmZWNGhGWjQxMWlGUytq?=
 =?utf-8?B?SnFSZWhlVDc0Mk5zTFNUaWM2dFpEZTE2ZFRTTUNDbm5yaEhqUjQrVzB4S1M2?=
 =?utf-8?B?NldoU2gvbURBS1U4ZmxoQlZ4NmFvOTVtWTFqcUM4TW8zcVlCK3ZpSkczeXJk?=
 =?utf-8?B?OXY0T2k3MHFFdUxpZTBodnExSTd2TU9kUkJCdFU0OWIwUXVxa0c4ZWY3UE95?=
 =?utf-8?B?NGxkZ0NDYzczQlFlUXM4dTRCMUxlRW1CWmdiUjBYLzVucndiZUc0T0Q2WUli?=
 =?utf-8?B?dDdxMWNTc0luanppazNIeVEveEpIVFk3Z0JIT2FUUUhnbzlPRDg1RG5oQWVk?=
 =?utf-8?B?ZURRd0Y4MEMwZU4rcVhaQm1jRWhEVjhWWDJwWHlWeS9GcWl3b0tQY0pnVWlK?=
 =?utf-8?B?eVJaSE5aa1hXU3hUdFBSUGYwcDI0RlEzVXYyVnQ4S3VjSklVYjMwekNldC9X?=
 =?utf-8?B?ZXJvZTBGa29WVEY1ZUxwNnF5SUdpSnRLTXMzUGUzUTgrcnVpRS9EWjBvaENJ?=
 =?utf-8?B?UzRFQWlmbko0QWZtL1p6Y0M2TDgxd1FGNU43akV2SWY0RVoxVm11dGhTRUtN?=
 =?utf-8?B?QjZHUmxxWnZwMnpMMlFpbXNWSjlaaEE0bnlVWG9ad1REMzZ0SHQzdWVkQUdl?=
 =?utf-8?B?TlM5eThRZHVRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P195MB0257.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk1ac0ZjWWNEY0FBNStIZFNRSmswRDdYT2ZxdXkzbmI5NVJXd3JLblJ5MGpB?=
 =?utf-8?B?VHRNM1VSQmpCU0wxWG1tWjZYSmIxaE1jNCtUY3JBaXNVTFphNE5PZzU4Z0Rl?=
 =?utf-8?B?NHdmUUU5TmtFcDc5UTJtV1JBZ2JCdUdSOHYzNXIwNUdOa216SERqZ2FxZ1BJ?=
 =?utf-8?B?WWpNNTVIWUxRTWtCV1ZFVzFWSG03aHhaUThLUmVHNHUvclhGclFqa1pyaFVR?=
 =?utf-8?B?SnZEd3FqYVJTUCtYSXYzZ2pZV3JKVkFvSDlMVnpJRlVZMExod1pFUFRIWk80?=
 =?utf-8?B?c3dvWXZYbnJnNWpYc25DSEhFdEcxNmJwVUloVHFSN0NGSFE4UzlvdEo1MEtv?=
 =?utf-8?B?Z3VWQVFGZG9DZGhyQnRFNkQzaHk3RlZFaEdMQWRiMVlvNnIrb0swT3dwZFEv?=
 =?utf-8?B?N0dXYUl2OFV5TXFBVFU4Y001VTV4ZjlmRDlIR0h4QVkyN1V1ZTk5aGdrTndu?=
 =?utf-8?B?Y0ZhNjVIcFZXbXRyRzNDS3RCQmZGUWFka0xkNUxSNVNBL0JSdTZCM1VZbU1J?=
 =?utf-8?B?U1BFaW8yZThNTUxqK0VpNXhrZWxnSmZQZlc1b3g0ZFFnZ0tweE1IRzV0Tjli?=
 =?utf-8?B?aGdRZHF3SGVHenE4K2hnRnE5Ykh4S0w0L053bFRJV0Qzbm9uRlAraEhXSzJy?=
 =?utf-8?B?dUhLSmtuUno5NDJrTmR2MU95TXFRQmdsbWhNWlVzUnUxK3RmcmZLM0F5SVpJ?=
 =?utf-8?B?eFJjOFJJa1J5SUVVVkRXaXU4TklmYTNBQjM4enV1c2JWRHJhNDdWaDNMU3gz?=
 =?utf-8?B?U29pbjRmV1Z3MmNhYmlIc2RmcUxiTnVpaStLL0xxbFdnemhsNHBqRHZNWnZ0?=
 =?utf-8?B?eERmMnZnM2MxWEtpSnZaQnV3dlhXY01QMkRWdzFDY2dJUjlwRVJocGNnR1FN?=
 =?utf-8?B?SU51VCtHY2dlNVV4VWxONmM1bzBXdE5tMnFoeEdwck4wYlZXUFpXdEJhNXp5?=
 =?utf-8?B?K05VU0hoMTkrWVhOaGR4SmJBNHBqNjgxNHk1T1JkbmVZcUtpaHJCMi9BcnlG?=
 =?utf-8?B?WjRuSDJiSmlhZ0xJU21DbzA5N3FHdEFQb1ZtbG1RVlFTeWxmK252QzlpZzd0?=
 =?utf-8?B?Rm9NRWJLTlpNck5oUUd1dFpKMUpLUjFWTEtTNXBmWFRqdFFGY3dvRzM5cFZ4?=
 =?utf-8?B?SjByVHdvL2d5clNlekpWcDFYWTVkS1pPUXUyUEJvaG9ZbTcwaW9aL2lyQ1NZ?=
 =?utf-8?B?cHQ2aU4xSHhqNkxtY0VHOGdlS3p3MGJOaHE1TUFBL2c5ajJab2N3aWRwWWQ1?=
 =?utf-8?B?dEZzMndYSm14VHZFdHY5a3ArMCtsSGZnQVFSRXdtUzhxWWhQNHh3Qm5kZEZZ?=
 =?utf-8?B?WGZtd0ExdEs4VmdIcUFkOG96NHV5SEJRa0c2MVU2QXdHNGFUSkdOS3dNbzRS?=
 =?utf-8?B?b1JWOVRuaTI1a3RXQVVCeUxlU1c1SXRXcEtlVi9iT1V5UkdUYVI0YTh3aVRn?=
 =?utf-8?B?Z1VTVHNtOTlQUDh5dXlQU0JnSENVUDR2NERYVEF5NE9qNWg3UVF0OHh0Yi93?=
 =?utf-8?B?T095RVAwNXVpRHdCUEtUSWsvakxlVks2WWNoYVBKRlN3ekc2RHJsRkFoaDdj?=
 =?utf-8?B?YWlCNnFWYXRXcE9IL1ZaVjlRY3dEczNJbHM4eFBDYWxiS09sclVDaDB4TjBt?=
 =?utf-8?B?OVJNelphNXJ0WmtLU1VxMDdxYjJURGpLQzU5NFJkczFtY2NwMlZrTTRaalRW?=
 =?utf-8?B?ZnkwaXA0cHpsYWVDWXNtYWIydCtzeXhDNFduK1ZjOEdPRElwbnZ0akd5cnFV?=
 =?utf-8?B?WjhrL25DVjdwYXR1ZndwRC9oTFlNek4vOWxIRjhpcGRzcE5ZdFRuaXBhNjVw?=
 =?utf-8?B?T25FRFRILzBTN21HeVYvQjd4cVQvT3NBSWs5bzc3ZS9pekU4bFBCemw1d0RI?=
 =?utf-8?B?YS9VblVjWUpxelJHVkQ4OXFBZjJjKzBieW4zYnFIemFFcUY5SWxGZTdvTnpB?=
 =?utf-8?B?WHNtRkdSRE9YVG94clpxMU96R04zdmpBMGJJZDUweFIyRDhiQUtFbHFWZEJr?=
 =?utf-8?B?UHl6SFpQZTU3QU9GeVdXSzNtNWVGWDVKYkQwanFCUjZQWGlyV3Y1dzhzVytD?=
 =?utf-8?B?Q1JYZjlHK0NyOXZ4M0ltdEY1SjhMZW05enpsLzFMQ0Fqbnl5MzU4V3VsWHFT?=
 =?utf-8?Q?5c55HutltJFUPaQaQ+vpHIuef?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4B1150307D2D349AFA7E994B4A595E6@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1f6263-3fd6-426d-b531-08dd985f2769
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:01:00.6844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lwK4iF9JMyLkQhNUXn24Umw5MRh5y3kyqxogjNKk7VVqQT2WAQ245DdLdHcws7FFwSBpycS6vxfeQRCJLTgULQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_050111_072560_99895EC1 
X-CRM114-Status: GOOD (  15.58  )
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

T24gRGksIDIwMjUtMDUtMjAgYXQgMTA6MzQgLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6Cj4g
T24gVHVlLCBNYXkgMjAsIDIwMjUgYXQgODo1MuKAr0FNIENocmlzdG9waCBTdG9pZG5lcgo+IDxj
LnN0b2lkbmVyQHBoeXRlYy5kZT4gd3JvdGU6Cj4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMtcGh5Y29yZS1zb20uZHRzaQo+ID4gYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My1waHljb3JlLXNvbS5kdHNpCj4gPiBpbmRleCA4
OGMyNjU3YjUwZTYuLmMwOGY0YjhhNjVhNiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDkzLXBoeWNvcmUtc29tLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLXBoeWNvcmUtc29tLmR0c2kKPiA+IEBAIC01OCw2
ICs1OCw5IEBAICZmZWMgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JmNsawo+ID4gSU1YOTNfQ0xLX1NZU19QTExf
UEZEMV9ESVYyPiwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZjbGsKPiA+IElNWDkzX0NMS19TWVNfUExMX1BGRDFf
RElWMj47Cj4gPiDCoMKgwqDCoMKgwqDCoCBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwxMDAwMDAw
MDA+LCA8NTAwMDAwMDA+LCA8NTAwMDAwMDA+Owo+ID4gK8KgwqDCoMKgwqDCoCBwaHktcmVzZXQt
Z3Bpb3MgPSA8JmdwaW80IDIzIEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4gK8KgwqDCoMKgwqDCoCBw
aHktcmVzZXQtZHVyYXRpb24gPSA8MT47Cj4gPiArwqDCoMKgwqDCoMKgIHBoeS1yZXNldC1wb3N0
LWRlbGF5ID0gPDA+Owo+IAo+IFRoZXNlIHByb3BlcnRpZXMgYXJlIG1hcmtlZCBhcyBkZXByZWNh
dGVkIGluIGZzbCxmZWMueWFtbC4KPiAKPiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcGxhY2UgdGhl
IHByb3BlcnRpZXMgZGVzY3JpYmVkIGJ5Cj4gZXRoZXJuZXQtcGh5LnlhbWwgdW5kZXIgdGhlIGV0
aGVybmV0LXBoeUAxIG5vZGUuCgpPaywgSSBuZWVkIHRvIGRvdWJsZS1jaGVjayB0aGF0IHRoZXNl
IGRvIHdvcmsgcHJvcGVybHkgaW4KdS1ib290IG9uIG91ciBwbGF0Zm9ybS4gSSB3aWxsIGNvbWUg
YmFjayBoZXJlLgo=

