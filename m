Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A059DEFCD93
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUbccoGQrFJgzeeHUl6/iYyDFGDEHU6GCqOlb8ofX9E=; b=fAAQPqX89nePg82popQAeFRvdV
	pE/mUSTK77Mz7naswwVzk8kLkI/bfdrMFWBH31gA4hb8Z4FdOzmcJ596f+Ii6G0XTOiDJ+gbMlWj/
	rwe7ZUc469PCWbXYEFUFYfmpz82OMXU87bME6kzaWCbDDaw2ZmRL8RWJ5VlGsG53qdpMI39PxWYpe
	8i2YoO5bbLiVxz4rUxYA+umGaUTY7aGjc4W9sJDp/du1Gqr3UZ1ltosX8WulfrtxmUS57gPQGQj88
	1yrktXfRt6ipYzSTyUq5rxtWVmEXEwIsyaMpVS0kjFOe3fKJgI2i7gueP6UYQhjEkUEbVd2f6AwbW
	2Evw8DPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYiA-00000007BeF-1Y94;
	Mon, 09 Mar 2026 11:23:46 +0000
Received: from mail-francesouthazon11011024.outbound.protection.outlook.com ([40.107.130.24] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYi6-00000007Bdn-2E9a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:23:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFR7cG+6/B1hlv1W4lgjG5sS+Sw+sFE88nyyBgobbF5TV4HYZ6PxtFqs1ZrbayepkEbV5XbEt3V+NbOcA8TviEiNk9iMARwy3BC5UmnQMNID9jYGY/PKkSmGpz/c9MgKL+8MLQg/h+p6b9Vdpd9VpYTZNbRg2y+lTtqOXkjaB+MLiB6h5PBe4DzHuBZlGtMHJBO8/ldMF2p84z5BxyGzY7oIvZAa0wR8uPr4YZtqyyXQBV3jM94DGmUmvEKU54iCcXe45OPFfYFjvYfzlpZObyfDb/lcXsI0H3S0zLA2UEZ1PmDKI+6gyWEVpWOdhriynpodfaC141m471TRNyrNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUbccoGQrFJgzeeHUl6/iYyDFGDEHU6GCqOlb8ofX9E=;
 b=OoBvHfbkRW0VBQ7SJEDQKiQsvwXwGzECsV8hgRNQWJsWS3BYG3f1prxJJNqWZm8C2ZZumUzZF3kRNaGN5zk8NCvG8wwPzOmH4vqQ6VBs84MC1ji798kgLRRaLxjcYdfFWtxItI6KHefe9QIoYpueFIl3346c62DviFLSZwOym6Jl5hsk5gQeif+O8nt0fZDcOIyPlXlfPGwIwGD8I/MgiZW8KE77VGqkYt7lXG2Cvt7aGkPtFBBf5cHFUX9WsQc/3Dz9NgB5cPX1gUzp0nhOGukfqjsu/pErLTBDCH+4iSf/pl7A+mW1fGBBH0q/6TuEvtGjcWLzPSe78KzpxdQedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUbccoGQrFJgzeeHUl6/iYyDFGDEHU6GCqOlb8ofX9E=;
 b=UzCnE9bwQsKV00mlFyPgLu2spLr40uQxVgEpAVP+uznF6MJMukBH8KPG2Kt8I4T9t2sd2cYlxDxzNGIVEdEQKFGlknrPBlQw13sM+Or3a2YbLYe9KKbN5cnPBloDfO7QWK14Eq2cgJ02E00VcXxdY/KsLoPjOXyqEaQtdQk74foG1SgaLbeU097BfoU6ykc/gvTsXz/G8QebvHf/bRHJ+EgotBlaOjqZYhoOia+EmnLF5m43ljixalFLFxw+vKK/1BwzJ0Dzz0f2u12ii2leP7UHWtpIDlek7lXticREB3PNWkjmVAhvLCKL5TdywMB+LF58KKTIIDaWd3VfAMnNxg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by VI1PR10MB3632.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 11:23:34 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 11:23:34 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzk@kernel.org" <krzk@kernel.org>
CC: "kishon@kernel.org" <kishon@kernel.org>, "j-choudhary@ti.com"
	<j-choudhary@ti.com>, "s-vadapalli@ti.com" <s-vadapalli@ti.com>, "afd@ti.com"
	<afd@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kristo@kernel.org" <kristo@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "nm@ti.com" <nm@ti.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "ssantosh@kernel.org" <ssantosh@kernel.org>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "rogerq@kernel.org" <rogerq@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: soc/reset: ti: add binding for k3
 platforms reset module
Thread-Topic: [PATCH 1/3] dt-bindings: soc/reset: ti: add binding for k3
 platforms reset module
Thread-Index: AQHcr6zALlDmtI7vZ0C5otsWBhL4dbWmBggAgAAI7AA=
Date: Mon, 9 Mar 2026 11:23:34 +0000
Message-ID: <ee0d0b9cd2467136f0aa48ea4060e83928a50620.camel@siemens.com>
References: <20260309100800.1134701-1-alexander.sverdlin@siemens.com>
	 <20260309100800.1134701-2-alexander.sverdlin@siemens.com>
	 <9f95d122-ffd5-485b-9bda-f4141a77b6ca@kernel.org>
In-Reply-To: <9f95d122-ffd5-485b-9bda-f4141a77b6ca@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|VI1PR10MB3632:EE_
x-ms-office365-filtering-correlation-id: e5d894e5-611b-4bcd-27e9-08de7dce4d19
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 1ZtLRHolPH8Q3y1mjiYIvjpKkW7BVeWrvfLCyC56KUysye89I3QLRzfEAgRSyvGKVp/rvj1bLYXV36BN+rm/AI0HBqgsgf3iHoHmJBtPA0X4/y/+8I90fopnPhI7KEZRlhpvchi+JQTKNWsERYemZqZWricvpoCBANucR2kTvQmNV/7FFoeAD1CHdp9QMD3bc7WJPgyMd91p6qDQnmZwxO502/6iCimJljtSZP+AZVrm60sr3zMdIe8hdVda/DIcVP8guQ32EYpFM29JDvvaJJGlBuIlUF4W+c4ViiZ2yZR9UWLlBOTl3G89h0+MKDZ/jAKAoxgtvYBKqcMxokfotgwnvL2l9fhWKFhGU9m4N9njlfyq82qDbUiambxoFLyHEPZzjuTaRtmsfn/z+G7V0qkGJH+19skmCCWHwjOoatmCBAKBwCmvO6fw/9Av/Ug1uFwYpGsop1yZo85bqBUkhrun6y2IkgsSljQyuu4VDSk6pZ8Uw2tw0pc82as9u6kebDKK3krEctnGAyf+Eh3CkS1prwjtS5GaRfVpbdLcmzcBwsarB7cdRFlld0S/LomVMFgKoX1TlSNtIWFqc+08kcnCUtO7bQc5WxIOogDxBTGx3b6EAeLmQF7LSt2FZd6Fc5wQLKGoaZSj3IKS1O9eZG0fKdEsku/wOyOMQWhmTUw4HZ3UgsCzNJRNUItjv6HnY2DEEV+gAzJbc515QAuMDA4eGvytzakJlFu2SzuqNMMUhLZjCDm+ZxQLipXGGKd5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVR0djFFTUozY1JuRkdJdUxpaGVHcDg0ejBWVEdBNXl3ZHROVVBiWHdIU1hL?=
 =?utf-8?B?RzEyejYxVFl3ZHFScHRNdGdVME4yU1VrMG9sa0VkdEc4MmJtQVdrenZlRVNV?=
 =?utf-8?B?T1ZNenJhOFIyMlRYRDFTbWtMM3FSUUFOSG4zUUVnM3JQS3JRQXAzQ0Q3bmRx?=
 =?utf-8?B?bFBaVm8wbjhMU1YxdndIZGs5WkswOEJ2SzRabm1yNGhkZ1BNNGpiMVhwcnIr?=
 =?utf-8?B?Vm9CUHgwL24wV1kzMDVGdkRFdmlueGhrdGhGdk5ZU29jNEFWOTk1UGZjN1E4?=
 =?utf-8?B?MW5kM0VwSFVWZ0o2RmRaU2tRRzFvclFuNlpraS9wbjNMZ3pCZ21qMVlWUzdP?=
 =?utf-8?B?YXNMREI0WXowMTEyQzd4eWs5NTYvc3IzNjNVSHZ4SmEzRTRvY3dNWFM2L3BN?=
 =?utf-8?B?Y3J5dkJiNUh4SkVWa2tsbjgrdzFSNnp2b2tFVG51WjZBRndMdFErYVlHMVBG?=
 =?utf-8?B?ai94ZjBxcktQRmFVVHFMd00wT0lMOEYrMlFHQ3NPMzJuSHBCNVRWdEVxd2pY?=
 =?utf-8?B?UTdGL0pYQ3NuOW1qUlZ6QVp0alBWRmZkbXFlNXBwU2hCSEM0OTU4UUk5L0Y4?=
 =?utf-8?B?UkNNZUhKdmdJRzJqYlFrb2dOTDRuaFdlUFM4azRyNnhia2VjUHl4QysxL0Nh?=
 =?utf-8?B?cVcxSnpnMHBmb2Z1SjFrZ3BEUXkzMGt5aWdGc2s0ZWNFWVVWaGN0VEtKWDZz?=
 =?utf-8?B?RzUxU0tSR1lDcDdHUXhKNFZjYytWT1drTjVPd2I5NVQ0QlZjWENQQU5tZE5X?=
 =?utf-8?B?MlozNllSbXFxaVh0cmltbnh5TC94ZG5tZEhPbWNPU21veTY4TU43akI3VlN2?=
 =?utf-8?B?SEJFZmFpTGhpZUtWTjg1YmQvK3gveDZsQ0J2Vnh6cjlyZmdBN21SYTBYWE9p?=
 =?utf-8?B?MlNMUkFzWjNWWXBESGRKeU55U0FrUnVkVUM4TnhJbG9mVzU2R0crbTRzZjNm?=
 =?utf-8?B?clVxYlhiZC80TW4yU0hhQTBqWDNOSEQzeGtBMmI2QzZzTk05aWRJY2NTL2Zl?=
 =?utf-8?B?RjdJek9XaXpIRis0WGMrQjZNS3owVkJtQUtMVmJvZlBYRWFwMnhnbVV4SWR3?=
 =?utf-8?B?cTZ0emJsbDN2TnI5UTJCWmZOMzd3SHRpL0hZWm9uRjAvUThlNkgwR3F5SDNP?=
 =?utf-8?B?SktVTHdOM25YZGRFVVorR3diaU04VVJSNGJPRyszbFlQeGs2U3VVSHJnTmhk?=
 =?utf-8?B?aE1KcCtwblh2dkJjdU81d3VobDVYOHBSWnlkQlA0OW85YWJPRnZtdWZFdDFr?=
 =?utf-8?B?WkZnSzZ0dC8wQzg0ZFdhQVdiWGV3UWx5REw2VXgrR3NnS1hWeHo1QTlzL0Uw?=
 =?utf-8?B?dU5TRTlhUTFucldGL09jeHhUaE13L0pmR0JrVlJqRklFYTMwQU1iVHdjWEFk?=
 =?utf-8?B?MmNkM3dTQlhLRlhiTGxXRmtPWCtFeENreDl1YTJEQTFWcmt2K25Rc2dyRHFo?=
 =?utf-8?B?cmhGaXJrOGNKZGFrTFIxam1keWpNUXFtYlR5VnpSNzA3Z2wyWTBlUk9QREFy?=
 =?utf-8?B?L2dZOXhBcy9TWmdhakJ5YWY1SjliWHZGcHdLMDFQbER3LzlhUERNTFpoRmlt?=
 =?utf-8?B?d041VDF0WmtPM0VZZXNsWGFRWVJYOXBqdWFhYzlqc1UxSDVKUnJFR3hYelNE?=
 =?utf-8?B?TUdjTmdvWCtKTXlqSnRzS2pUN0ZLTWkwZkk4bkpkY3dnc2lVNUtTYk4zOSts?=
 =?utf-8?B?U3YvVnBYVXNoVEgxQjYzVWFidWp0aGEvNVFsZ0wxOWFzYmNGRVphS0I2RlFZ?=
 =?utf-8?B?Q3NZVTN0MkFLOE9ibUQvQ2ZUcERtUXBDSEtJd3ZmNDBtb1dEWmV0SlkxTVA3?=
 =?utf-8?B?d2FlMnR1LzZvUkphMEhRSEhUeGN3MGM5U2xnYnAvdEZod0lNczQwaS9weDVj?=
 =?utf-8?B?WXptdXBGVnMvVDFEVXlROVowdTU0WU5QQ0JyRTVCNm1ZelFCS2luaWg5Z1Rr?=
 =?utf-8?B?U1BGNU40UG9UTWhrLzdmeVo3ejM4emdTNEJTWlA2YUprNHZzN0R0cEl6VFpT?=
 =?utf-8?B?ZllSaCs0YWVWNUlkOURqSWxROW4rK0dSb1p6RnA1THd4azJlRHduMnRZR2VK?=
 =?utf-8?B?ZzFEM1ZSdUFCN1dWZ0FrRXJSSzBrc1Qyd3JrTGJKeWhpWEQwNmt4SWlEMzI2?=
 =?utf-8?B?ZmQ4NUh1REV3SFp6KzFwUVMyOCs4Tkt4NVpIRVljV2dvWXQ2dmxaMHMweS9p?=
 =?utf-8?B?NHBmazBDU2xtaVRHdHA5b3A1OHVYQTE0WUkvVTJGNEpDVXIwMXJIU0hvM1E4?=
 =?utf-8?B?aFpNVkRRTy9YUHpjQ3JjbnRETW0rQTh6QTk5QmV0cWtSVnp4MVlmWDRDNmNk?=
 =?utf-8?B?UytGd1B4eE9XWkpOUHJvYmhaVytDTjhwUythUnR0OWVscW5mRFVFaXhsTkhG?=
 =?utf-8?Q?/ZeGUy6jXk3U7HkYswhZOtEUdBNA1AmO5B03o?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D530528687CC049B5A5543838AF1D36@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d894e5-611b-4bcd-27e9-08de7dce4d19
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 11:23:34.3225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KNQeMKWutw4OmWDd/srw4ccoNI2UgMaimEdEG7255PoyJ+OFnLnD5IFX/AmEMwQHG6VyXSAbGRHFE09LUKEWP0jfCE12F7D25J2NMJGVSbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_042342_840002_9C021425 
X-CRM114-Status: GOOD (  15.78  )
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

SGkgS3J6eXN6dG9mLA0KDQpPbiBNb24sIDIwMjYtMDMtMDkgYXQgMTE6NTEgKzAxMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gK8KgwqDCoMKgwqAgLSBjb25zdDogdGksYW02NC1y
c3QNCj4gPiArDQo+ID4gK8KgIHJlZzoNCj4gPiArwqDCoMKgIG1heEl0ZW1zOiAxDQo+ID4gKw0K
PiA+ICtyZXF1aXJlZDoNCj4gPiArwqAgLSBjb21wYXRpYmxlDQo+ID4gK8KgIC0gcmVnDQo+ID4g
Kw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVz
Og0KPiA+ICvCoCAtIHwNCj4gPiArwqDCoMKgIHJzdEA0MzAxODE3MCB7DQo+ID4gK8KgwqDCoMKg
wqDCoMKgIGNvbXBhdGlibGUgPSAidGksYW02NC1yc3QiOw0KPiA+ICvCoMKgwqDCoMKgwqDCoCBy
ZWcgPSA8MHg0MzAxODE3MCAweDEwPjsNCj4gDQo+IFRoaXMgbG9va3MgbGlrZSBqdXN0IDQgcmVn
aXN0ZXJzLCBzbyBwYXJ0IG9mIHN5c2Nvbi4uLi4NCg0KaXQgaXMuLi4gSSd2ZSBjb3BpZWQgdGks
YW02NTQtY2hpcGlkIGFjdHVhbGx5Li4uDQoNCj4gPiArwqDCoMKgIH07DQo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvdGkvdGksajcyMWUtc3lz
dGVtLWNvbnRyb2xsZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b2MvdGkvdGksajcyMWUtc3lzdGVtLWNvbnRyb2xsZXIueWFtbA0KPiA+IGluZGV4IGYzYmQwYmUz
YjI3OWYuLmEyMDcxYTE2NjhmOTYgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvYy90aS90aSxqNzIxZS1zeXN0ZW0tY29udHJvbGxlci55YW1sDQo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy90aS90aSxqNzIx
ZS1zeXN0ZW0tY29udHJvbGxlci55YW1sDQo+ID4gQEAgLTg2LDYgKzg2LDEyIEBAIHBhdHRlcm5Q
cm9wZXJ0aWVzOg0KPiA+IMKgwqDCoMKgwqAgZGVzY3JpcHRpb246DQo+ID4gwqDCoMKgwqDCoMKg
wqAgVGhpcyBpcyB0aGUgRFNTIE9MREkgQ1RSTCByZWdpb24uDQo+ID4gwqAgDQo+ID4gK8KgICJe
cnN0QFswLTlhLWZdKyQiOg0KPiA+ICvCoMKgwqAgdHlwZTogb2JqZWN0DQo+ID4gK8KgwqDCoCAk
cmVmOiAvc2NoZW1hcy9yZXNldC90aSxhbTY0LXJzdC55YW1sIw0KPiANCj4gQW5kIGhlcmUgaXMg
YSBwcm9vZi4gTm8sIGluZGl2aWR1YWwgcmVnaXN0ZXJzIGFyZSBub3Qgc2VwYXJhdGUgZGV2aWNl
cy4NCj4gDQo+IE5vdCBhIHNlcGFyYXRlIGRldmljZSA9IG5vIGRldmljZSBub2RlLg0KDQpJIHNl
ZSEgVGhhbmtzIGZvciB0aGUgcXVpY2sgcmV2aWV3ISBTZWVtcyB0aGF0IEkndmUgcGlja2VkIHRo
ZSBvbmx5IGNvdW50ZXItZXhhbXBsZSwNCmFsbCB0aGUgcmVzdCBmcm9tIHRoZSBzYW1lIHN5c2Nv
biBibG9jaywgbGlrZSAidGksYW02Mi1vcHAtZWZ1c2UtdGFibGUiLCBsaXZlcw0KaW4gbWZkL3N5
c2Nvbi55YW1sLi4uDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cu
c2llbWVucy5jb20NCg==

