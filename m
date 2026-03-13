Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951DB106FD9F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvbXW00J097k7xHaXBo1zA9Ozm+d7L41RN655R43+Rw=; b=C8Y0OlZMh85dzSP6dC5UDA00Xq
	9IrK4vSyFexOqHGtpqDaYrd5TXIwQu5AEWfbLaIRbWUE60L16GZ4s0gBlLt66fWg6DHFQp/ZzHuIk
	c+6E3i8OYDSQvF1v19czXn7Lfju4eMxQNQJQ2LLLzwb2Jt3JKZLtjxGaNyJBcmPp1hwaMB9wSJXHe
	wYd2Duad8vZLLUHpjdDvb6o5wVUyQlUq0KlxEDsrFaKfr7V0e/EhhiO5yqbPlltyVCBOKfFxtRoSz
	Qx9QaTtiSjsdBrKdehNyB4uDYeLtUVAcIsqyA23QMCkYyMp2z0VA3NVGkt5FGT0l2+NBjvZfNW5WP
	QQvnbAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yHD-0000000HJg3-031M;
	Fri, 13 Mar 2026 08:53:47 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yH8-0000000HJfR-47lj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 08:53:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dwm8sRUhssSXm2ZlgneIgUIck2GctPNEE7+TJWiUhS0CCA3lBCSMdtvVzwyCrqPWMrcNJ/nf1eJ2QyaYz71EWUb2BsVmeA17/HE1cpEFm6OfNkLh5f3yy9sNInpxvRwBiJeWsWFAqDXwO8bIvhg2vT9drlPB0SbbJBHkMoPNYwVeK3oD7HTtI5pQP4fiCsxTUgM/QVUVTA3vd0T+yvDI4tlAWLHiglmYFJ58VxP1PGRiIK5Ch/Vi8Ua1sJIiqFttgGOOFetJKGg9yoN5bsiwHhdz1d5nHbckr8iDb4aoxqGY6BGxR2q3IEbAC2n6LA1K/e7F5Fv1Ycav1s0YwCDEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvbXW00J097k7xHaXBo1zA9Ozm+d7L41RN655R43+Rw=;
 b=JKUAM4QKCVV8xO1f+ihmTK/S+QR2JmvADGOCVVJWwlXx1f7+skpqqtNLvJb5F/Y0mjNX6cgUNqt0h2Yl941bmf8eAfRVF+8Iin8N4j5xo534VMXrzZoQPC0GZmG+75HmnTJPzdqiYVT/rj9AhSb9BRl39DdpDLQJeEJciCq1DNuckMgVUMs99ExGUXChUKLXuCJLpTn/2YSp6Od909ojHO6yzxmSedMkQKp1+0nNFYVUAbB4iZJYFVLXTzA78+IhShJQ0kQpgtp0jA6NiPKUAqE1m6YLmaSb1mQp49XNhQ6O8L0srNnih8p+wqnBC8ZV6U3dD17c6Fe4poAIK8ecOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SE3PR06MB8069.apcprd06.prod.outlook.com (2603:1096:101:2e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 08:53:35 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908%6]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 08:53:35 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Peter Chen
	<peter.chen@cixtech.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjMgMS8yXSBkdC1iaW5kaW5nczogUENJOiBjaXgs?=
 =?utf-8?Q?sky1-pcie-host:_Add_power-domains?=
Thread-Topic: [PATCH v3 1/2] dt-bindings: PCI: cix,sky1-pcie-host: Add
 power-domains
Thread-Index: AQHcsq8TbEH4TkzUwkyIJK4gXzlCk7WsIJ8AgAAEn6A=
Date: Fri, 13 Mar 2026 08:53:34 +0000
Message-ID: <PUZPR06MB5887055EC1C0745627143092EF45A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20260313060308.1300518-1-gary.yang@cixtech.com>
 <20260313060308.1300518-2-gary.yang@cixtech.com>
 <20260313-piquant-robin-of-honor-cb9f39@quoll>
In-Reply-To: <20260313-piquant-robin-of-honor-cb9f39@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SE3PR06MB8069:EE_
x-ms-office365-filtering-correlation-id: a91d09a8-65fb-4da6-8999-08de80de02b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: G2pi92rPw6sEHKyjX629zCXyLwYdECyTlP+A9FCFu4ebjU8RgE1//cnOob9uvXfVjnhMyU9krk1mlOhAcsWAYIyRuEQ9DVJ1jiB4TzKFB0/UGB0UfuQWfgP+t+Hp5JmP01c7pUzXZyTIHyo3Oqq+/VNyBqPFX5UnEVfquNuY9X9lgOc6h0JhUc35eXBf1vE4vU0ccn3C2bBSAKBM5XmBCZ0Hw1Dn4cc+62C5LLmW7LtJpuXlWE1gJFBtWk8ENYld6xOM53iBUQ0YDjwBoivIA6fkQRa+XUbpzR7VfecploKvT9KSHEhKNUT63G36viZ9jC5XG4nUwW72zuIui3LNT0mBNGMcxd+fcH5DDxHHPF8Ksedg0kf16p28vuJpFqg+GKttuGkqbHF08G4otQZJ7Vi3OBbLTebbnBt0H03jrfCxr1RAUej5P5v/3QgXz5S4O24me7QBs+0iTQqVbP09JdOmP6VmRWMZnbMTX/Kkq8BCsd49B8ebe9kib8oBO7jxy1/QwPQFs9Gwolu4fvuTpi2H+K4N8NCmS42XbZFAGckdhw8IA7m0FVJ4qUf2CZf4SgjDWapTs9RNDblNemeheA7r2Dqfn13zXDScoplmUnrAfaWfKQxLnyCXQnqb2ybOogidvpIJFz07sGUiWZbzd/iT7EkfP0xyHjgF45aevSdIlotKta8RpNJ39rIIFpo9NKSFGEgjroPxcu08gTFjQgrpchjtbgc0dVKoZA11Sbc0N5xH2hLUNAldugu2s8fOE1/T4Hu0muePfaiekJ1Z4dXKardtoWQ1L/Q6FRplxkA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmI5NldQWE5JaXhSNjRJcDkyWkpOOG1YdXROaVV0WVYzZ2hTeVVxVE5jbzk4?=
 =?utf-8?B?bnE4V0lYUmVnVjJBNVB5YVZQZ0J1SEE0OXA3Y2lGaFB6RG4wazc0VnNyT21v?=
 =?utf-8?B?OEZ1SVY3UlJrK0lpazk4QlFQVlRHTVdwL1ZHMVBrdFJYNkdSc1dGRXlxTHpI?=
 =?utf-8?B?aUEzWUZNRGlXRnY2c2lyUmYrUW1KemR4eHRPbHdjWlpQZFFaNG9oTmJaMnFm?=
 =?utf-8?B?NlYyT1hpc25Oa3I0SW45ZDlJWTVjTGFTMlkxeFhnU3ZnM3VhZDJDL2xSN05a?=
 =?utf-8?B?SFhYNWNEVmQwdWh5YnovSE1CWVZzRll0SytVelRMVGdqSExQSzgva1FSYzVX?=
 =?utf-8?B?cURPTE1tR01ZSWg2aTRhL0kwZ1FpQnJxOW14bXMxR3g4UUxqQ0ovVm9TRGJD?=
 =?utf-8?B?bTcwN1lSNDVxMldOczR3NUl2RVFiQVZIaTNrNkdsR1BFTmFsNTgyblZkcE9O?=
 =?utf-8?B?UVI5OEd3MzVXUy9KUWlXQnB6aUdwT1lIbk9lSk9LL2FKWnNMWGtyZkxqTy8v?=
 =?utf-8?B?M2NCcDJ2R1NQd0pjVzhxSGx0UklDQzdER0NMSVhmdHZyS3FIMXF6R3E5RGRH?=
 =?utf-8?B?cEU4dXJFWngzTW5EeUJaYjU2RGlQTVJoTWM4bFI3TUpmdTZZd2M3ZFVhaGxn?=
 =?utf-8?B?UjJFWVM1em9aL3ZVbit0MlNsUS9tK2k3dURnMEdSa3hmUHVnbXU2Rmt1Sk1Q?=
 =?utf-8?B?ZnFWMytUbjg5aGV5SjIvcm95dGp4ZnBVT3hOQWQ4YmUxeGhIUnBnSUZHWElV?=
 =?utf-8?B?WlBtczdveHlhaDdrNllDc3crZDFJUlpiL3hXRDlOYkhmbjBCZ2ltQkp5alNC?=
 =?utf-8?B?Rm8rUnBSM1FFUFRNSnBVdlJNWHVIQWxXWkVoTDN1bmVXblFXUm1wSS9TTStj?=
 =?utf-8?B?clkzR0ZCUThCTjg3V2U3emJhNi9xQXFJck80UnRRUWszdDlGL0tpdHVOV2ti?=
 =?utf-8?B?UHl0N1ByT0Q1UmI5U2tTZVNpR2w1KzBJZVZrbThjUWFsb2N6YnJkWm1VS2I2?=
 =?utf-8?B?WSt4aEdONGM0R1N4WmdtSkVXVk9WQlluR3Blb21jNjdQRjRoZ2l3VkFDYldB?=
 =?utf-8?B?eWM2WTVvL25ZVXN4YWNRNm9RT0FsNHZYSDVGUnk2MEMxbHRCamlra3JnS0pm?=
 =?utf-8?B?OFJ2dm9hOGlHc0VtS1l4QW5OaTBDVTArSWpxSndrZmZNZzdwOHhNKzdxRFRH?=
 =?utf-8?B?eDVBTG1DSnduYjdJb21GMmVOMGVUeFUraVpEbTBnM3lSUjFHMnhmd3VtTEl6?=
 =?utf-8?B?T1VBbUZ3dk1GMmNpSDhHSnN2alQ4WkRGTXVPaUdnVms0MmhEdVgyUDZWamg4?=
 =?utf-8?B?YytKM0JsQ3E4eEdjUktHNjJDUm5YVUtOWG5TMFNrNFgwaVNGTnVRQ2ZQM3dk?=
 =?utf-8?B?WnZCWGkxZ3NhOFFjc3FocnpXL1V4TjNXS2p5dHRDRHE1Z1lwUEpkRjlqMDhM?=
 =?utf-8?B?SExReEVMNWtpZUlFN1ZXbmx1U1BVSWxGbEZqcDRTUFBQOFlUa0dTTk8vOVFE?=
 =?utf-8?B?WHN0czgvejNWSEt1Qit0cHB4aHhBVXZHS1ZjSUt4OENrTWd0WStSR0FwM2Ny?=
 =?utf-8?B?ZUhDSlhCQkdtVXVUS2pnR3A1VXRpRytxMDRmRi9mMis1UWQ0YStGSXhWaXNp?=
 =?utf-8?B?UHpLUXcrR0JBMWZLYWk3YjZhMkR0MnFWVWxaTHNRUjVkcDQ2YUVab3E0bEoz?=
 =?utf-8?B?bHdOUVhkTm5HUE1FakR0V282eElKV1RHQUFvMlRtOExxQTFRUytiYUNoWGhQ?=
 =?utf-8?B?QktySnIvR1g4eDRCU2VIR3ZYTTByeTNRMXJqMW9WczdENk11ZE1jc2pTQU1U?=
 =?utf-8?B?eWFrQmdaeUlHUklNSzNYSlhwZ2FGSHlBZ0JaVE1ZbVd1SFhvVk41YWVFTUpj?=
 =?utf-8?B?N3dqMTJicFF0SUpVUldRdEhRL1J5ZGJlbDFJNzRRZ003OVJWdDhpaGEwbVB5?=
 =?utf-8?B?MU1NdjNKVm00YStKdCtQd2pnQjdCWUZjcDNFSlNKeDNqMWdXMS81RmtqREFv?=
 =?utf-8?B?VWViTUVyVjFuNHIwTEdOeEg5b1lJL1J1TDdITjIvaFo5cnZRQmI0RGpPZXYv?=
 =?utf-8?B?Y1M3V2Nrbk12SXc5TVFpTEFtbDhiN2wzZUwwN0s4WmxNZWMwTmlxNkUveFQr?=
 =?utf-8?B?S1NLWVZrSno0VFNwMVcvaGpmU0VLRVJtMWZrbnNxQ1kzbCtXZmRhWldKU2o1?=
 =?utf-8?B?b2ZsOFRjNW5hajV1OUpta25ZSmJ4UEw3NUR2bytpd2tmeENFNURQcEc1NXZj?=
 =?utf-8?B?Uk1NdUIwM2RVay8vN0t0cS9VYW82VmdicjJzeVVWWVdWZkR3SCtZbVhmcEtE?=
 =?utf-8?B?WlhRSW5QN2JRQnRhZXBJUVhmYzZkYlIxdnRmR3psdzd1ck5WMVYyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91d09a8-65fb-4da6-8999-08de80de02b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 08:53:34.9448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +e76yHi9YeygCnDNGGEo8ED6mSuvjUcb1Iw1imYBWDCqRVhANSbkTir//TIwr5IaXzZk18D+2SAXz0vx4dyGgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_015343_020510_1E6BD729 
X-CRM114-Status: GOOD (  12.79  )
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

SGkgS3J6eXN6dG9mOg0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMNCg0KPiBFWFRFUk5BTCBF
TUFJTA0KPiANCj4gT24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMDI6MDM6MDdQTSArMDgwMCwgR2Fy
eSBZYW5nIHdyb3RlOg0KPiA+IGFkZCBwb3dlci1kb21haW5zIGFuZCBwb3dlci1kb21haW4tbmFt
ZXMgcHJvcGVydHkNCj4gDQo+IE5vdGhpbmcgaW1wcm92ZWQuDQo+IA0KPiA8Zm9ybSBsZXR0ZXI+
DQo+IFRoaXMgaXMgYSBmcmllbmRseSByZW1pbmRlciBkdXJpbmcgdGhlIHJldmlldyBwcm9jZXNz
Lg0KPiANCj4gSXQgc2VlbXMgbXkgb3Igb3RoZXIgcmV2aWV3ZXIncyBwcmV2aW91cyBjb21tZW50
cyB3ZXJlIG5vdCBmdWxseSBhZGRyZXNzZWQuDQo+IE1heWJlIHRoZSBmZWVkYmFjayBnb3QgbG9z
dCBiZXR3ZWVuIHRoZSBxdW90ZXMsIG1heWJlIHlvdSBqdXN0IGZvcmdvdCB0bw0KPiBhcHBseSBp
dC4gUGxlYXNlIGdvIGJhY2sgdG8gdGhlIHByZXZpb3VzIGRpc2N1c3Npb24gYW5kIGVpdGhlciBp
bXBsZW1lbnQgYWxsDQo+IHJlcXVlc3RlZCBjaGFuZ2VzIG9yIGtlZXAgZGlzY3Vzc2luZyB0aGVt
Lg0KPiANCj4gVGhhbmsgeW91Lg0KPiA8L2Zvcm0gbGV0dGVyPg0KPiANCg0KU29ycnksIHdlIG9u
bHkgZGVsZXRlIHBvd2VyLWRvbWFpbi1uYW1lcyBwcm9wZXJ0eSBpbiBkdHMgZmlsZS4NCg0KV2Ug
YWxzbyBkZWxldGUgaXQgaW4geWFtbCBmaWxlIG9uIFY0LiBMaWtlIHRoaXMsIEFsbCByaWdodD8g
DQoNCiAgIHBvd2VyLWRvbWFpbnM6DQogICAgIG1heEl0ZW1zOiAxDQoNCkJlc3QgUmVnYXJkcw0K
R2FyeQ0KDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==

