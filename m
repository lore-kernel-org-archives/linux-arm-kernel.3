Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB67DC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkwSRsDvujGZagf6TIQ1S6Q0gP+73z8/IM3j4OHKmm0=; b=yrbtUoip2uKSuXOrNHDvOeY/lI
	DbCGd+2BxFdqGGOdV848wAVd427JkiLyAozJoN5TYLMj0jQIECmka8eP/A0U8WlKyP4Ap6FJFhOxy
	Dake+ZWDVUfiMHz2Y7UT2mx17noQyPA3BKdUiNsuMhvHSwOEOXYBTQ6ueHax/wiNJjePmfDq8tTVi
	LVF3hWRV0TLIkEaKVhz5SVBPTbAS4w8PU9u40LoyfcTojbpEF2odWoO6h+/ztOh4zzJdPRfCY9rPn
	Ow0kukTnS+AOwAsja53pR+NomTzBukTMiTXVZnFFDWhSsTcbUzuRaOgdyvQq1ZPnKQKUIp7vnRzK9
	4H8tYOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNFC-0000000HWCJ-3Lwf;
	Thu, 16 Jul 2026 14:39:22 +0000
Received: from mail-japanwestazon11022109.outbound.protection.outlook.com ([40.107.75.109] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNFA-0000000HWBI-1hbS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:39:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypZx/4UH8ohMmOhgbVld6+MT9dmS2tfCdo1gx04J4Okz5qrdQKDQjRFqRV+Bc4iIE3bAXKmNaWhxdhkzqusBSFRMRPB0VtEwgB1EQGOW0Cw5MFlSkSOX3BZx+TBQxkV66mIBhhm0m2WGXKcblh65ByPSTF94et9r+rHpzsVeiVwsfvwlUMPmd+lw3qwfegNU8nebfjYDOI4KjaYVrYrKg/HB+zwg+JL4HdThV9nKg5shkyUETIYuilcsaDznkKih/DTbIcFmhFBkuCre8QIlFfKMsZZxb7uLkT4MeH/oFgCrtF8uAq0J7XFrYWIKKcFQIOGEiWZnlmIv7wBb4GBpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkwSRsDvujGZagf6TIQ1S6Q0gP+73z8/IM3j4OHKmm0=;
 b=V+CcgpFe4stLCPxgUki9kCXyL5WBwyG2td4l4bicofZVy58d/YWUetEkYmw9sit5GRwYLdC3efud7qmn+4RQ0blQPavdiyBVp2SSB+HLuc3JdYVLb6p8r1XGeQgtg9s6Fa8YFbF65kvNYcqkYReOYh6zzFAuwVuA3Xsd2LNSQt6NlMJ60C/XaEITLPxapHfyaCJgInbOin127NKn24cdsvX8VrkMHr1Cl1hJKSqtLWqQucNhMwhDqbV4fBw3RUjMbmt3hB53XX03wEUXIB6Uo577xp0hmK+c7o08wHKfxJs5wQmKRoo5K2lD4Q1iVXRkAfiq5ZwSSo7Bv8FKSfJ1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkwSRsDvujGZagf6TIQ1S6Q0gP+73z8/IM3j4OHKmm0=;
 b=DtiaBDjYCZdbJKUBWObCEkLsXTFQ1vTJEQLZPHREexbrFv5p3GvLEcKLmRP3ntwiJPm6Zwx76WIqpT3ST9Uul8YzJPVpz55HqaUoDc+fQ8Auq3WG+iycRLeVWIeYzafWyIo+29lJUXKEyegfyvMEiMYHYpAZbZr48DCJXS6wJ9Y=
Received: from SI2PR04MB5648.apcprd04.prod.outlook.com (2603:1096:4:1a4::11)
 by SEYPR04MB6632.apcprd04.prod.outlook.com (2603:1096:101:d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.5; Thu, 16 Jul
 2026 14:38:59 +0000
Received: from SI2PR04MB5648.apcprd04.prod.outlook.com
 ([fe80::8ce1:b82b:3b19:f79d]) by SI2PR04MB5648.apcprd04.prod.outlook.com
 ([fe80::8ce1:b82b:3b19:f79d%5]) with mapi id 15.21.0181.008; Thu, 16 Jul 2026
 14:38:59 +0000
From: Pu Hu <hupu@transsion.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [RFC v3 2/2] arm64: kprobes: Allow reentering kprobes while
 single-stepping
Thread-Topic: [RFC v3 2/2] arm64: kprobes: Allow reentering kprobes while
 single-stepping
Thread-Index: AQHdEDXw7507o/wC2EuRGyt7eMVEu7ZwLF+AgAAUiAA=
Date: Thu, 16 Jul 2026 14:38:58 +0000
Message-ID: <0f049d38-b7f6-47f0-a410-95ad2aee7fd4@transsion.com>
References: <20260710063242.228714-1-hupu@transsion.com>
 <20260710063242.228714-3-hupu@transsion.com>
 <aljbf_RmOd9U2KDT@willie-the-truck>
In-Reply-To: <aljbf_RmOd9U2KDT@willie-the-truck>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR04MB5648:EE_|SEYPR04MB6632:EE_
x-ms-office365-filtering-correlation-id: d08fd68a-60ba-42fc-5eb0-08dee347f8b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|10067099003|56012099006|11063799006|4143699003|6133799003|3023799007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: xHPddy8n6oq/K4XXChzTA/LvDI1S+Mwl2Gc91IPQ/bd/zSJCSAGPKiG9nOFC/uyCTg6C++4KDp/icgF5EmuPvbGxQ9EBBWpAvvPyYsBG3hzakT1YorhlB5gNZZ3QCMy7ZdPbUu8XfQO/KgxkceAgKcdHGbXtLf6WySaGLWhAmfkrJgS7Ox93L6hQMSAfX/ZSceNr6ImTuu6rEit4YFMUJPN9uIoJU0JdAzc3Cve5W+CCXkuHxhOomuXfpOjh7cS/0vTTs6lcMeU88W+Dy/mn5mMB3WZF8KTSCQr6csdSIdH8RWndD7Q6gCe8y/1td31z2i9dxZKxc68FuGppHNtq7tYnGKG/q9coV0uSdvdt/g7s+gUou7IczCXoXcpExqjswOMr0BUPxZyQ8y8XBsM333VGYFD8L/nuYPrGMiEXo9v0D74DIdw7YSM0hwFR8Ux5fVyLTdABcybr1kRMhWSLXcvL24EfruKINJdb9+viOioFf0B4ZmYzgKsQ6lB3RxSJagY1W3oY+HR0ALelex32UWszVyjKDF6HPC7OOZ7AvB5bO7P5BYHMLBHs9dYlB3ltUsyRG9Ge8ubJ+KpnCBBwsZQfaagltc9+y5UHqCI5XL5pG3CpYzO38Vhm2rI+PNF41h0tuzsfs9Wqctg78Gcs0kL5ok7vd/XiX9gYMu7+s38toMzr7w3nQgdt4zJUGblahTamfEWmRsfr/YJtQz81JA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR04MB5648.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3hHWnRmdC9DYzJobnVJUmRuZ0MvWndSOEllTmhwNjhxMGoyZmdSM0VCOTJX?=
 =?utf-8?B?ajMxaDRmT0tLVndnRGhueThLL3dudjU4dVF4aXlVWXllYi8xU0pTRStWdmJP?=
 =?utf-8?B?QWh1czdXdkt5b1ZtOHcwM2RkbkFlakduRm5vWXVtcVNLNTlmaWNSbFBsZ2hZ?=
 =?utf-8?B?Y1lZNDlJc1V1clovNVM4eTJKdG9ZM0F3S1ZHYU02enpUNCt0TFJXYUxlZlJT?=
 =?utf-8?B?R0toUzZZaEN1cHdSdXQza1JZMU1hWC9xdllQNG5QZHJlUlFpM3NkbGI4TGVQ?=
 =?utf-8?B?N0lFMkdXaDUrMGhKL3o0dnFqeFZlcDBWNCtmTUoraGRPSXF0cm1zOTFJNUdR?=
 =?utf-8?B?b283SWZaSXplN0ZjajQvckhKR29Yc25rOXN3aERYZCs5WUhMZnJnTTlsTnIx?=
 =?utf-8?B?aTdGOEJoUURvNFlnMzdPaVJoZVp2Zmo2TVNFdVJmMVhCU2NWRHora0MrKzJI?=
 =?utf-8?B?RXIzWmUvS3RiaGlheUNDSDAxdG5LRzAxVjYzR1BWMkQ2ZjNEcmFBZVBJYUNs?=
 =?utf-8?B?bDVCamwwNitUdVNYeERIOU5Ja3NpZ28vdUg4a1p4ZTFnUUVJYTlhRlA5Q2RV?=
 =?utf-8?B?MHNiVlRuY0gwQkZ0QUZodTdBR2xLNUV3V1dZTDhMZ2xPakxyeGFFRU1yelor?=
 =?utf-8?B?R2RNdVdqK1UwL3hyT0tmYlVrOStZWWlvditmL0Z5dWdQRDZNSFN2a3RoU3Fy?=
 =?utf-8?B?ZGlJVkx2SmVnNjVReE0waGVGajc0ckQ5KzY5c1JvWThNYnY0VVVFTUltczNx?=
 =?utf-8?B?SXZ3YXFkNS9SOXc5RDE3ejM1dExlaUZ3Y0p5aE1VTjNJQ21aRm9peUNmMUNz?=
 =?utf-8?B?bktsNkR1NVNOQ0NuYzhXYnNDWjJhYk1WZ0JXS0Y2aXdmNWdsdXlKeWFkZDFD?=
 =?utf-8?B?YTUxck1aOWNNY05BVWVJVVBBeU1YUDhoZ0ZMaHcwbnJCY0xpa1J0OTZMY01W?=
 =?utf-8?B?VDBaMm1zbFZhY014U3BjRHZCcmtWbFJmZG1zWXlaelhaak1WZnpHR2RwTlMy?=
 =?utf-8?B?VWhRWVE5QzBRVmc4Y1hSOFB1TTZRZUVhRU1RZG45S1RGalZuWlFDcUFiMHZi?=
 =?utf-8?B?eW9Wa2FUVTFjQzVtS01idWI0Q3NwL3JTYmk5SDRkUlRrWHhyUG5sWHhlN0Z0?=
 =?utf-8?B?dEIrWEM2VWk0V2ZNTHMrTlN1OHRnVFg3UDdZbEZvQWEweWJxMlFKRDVqSzE4?=
 =?utf-8?B?cTVldTVSdzMydUNNV3hHMUlYeDhteE1reVBnZ0tYRGJvWTZKSUlYam1CbmVO?=
 =?utf-8?B?YzVjeXhSTTNWUEl4UjNSd1BMV3hwUGd0c1ZwODluQnVMRTJoajIwVVlWQnVw?=
 =?utf-8?B?Zkx0SUZWakpNL016OWFtTktGbWhwQy9zd1l1N3BkZmQzdk9zaThoaHJGYmVG?=
 =?utf-8?B?bTNqbysyTTFvWTJLUU5tdHZIREU1VDM3N29HMHdmc3BDL001b1pjNG1GRWNk?=
 =?utf-8?B?VGV3UWk4WVlFQ0tCTXVIWGZ1Sm1laFJrV09FQm03c3pCeWhxS0plN1RIcEZ6?=
 =?utf-8?B?eUswM0tSUEZpRkd4cWVNL3JKUHhkMjIrZ1EvMXZHNFlJVnZFcXNwK2djaHRR?=
 =?utf-8?B?Vm9HMis0ZVBicWZOWkEzN2RkdkVhdUZ1SHBtWnhDNjFwVG9yeDIrOTRBT3BD?=
 =?utf-8?B?dVFnRWxJeTU3ZGlaZTNHbzg1S1o3aXFZd25JZTdGaHNSdTFqWTNOOWF2bmMv?=
 =?utf-8?B?OUI0aVZhVzF6UWhRblZkc2t2cmMybFhnMThvR1Eydk11OWUxdk04RkVva2lQ?=
 =?utf-8?B?ekFGcE1kS2NHVi9XZ3ZDb056NmdCQmJOekVuRVV1NFRnTUN0UVNmUm10NUl5?=
 =?utf-8?B?YlNSUlE2ZmlSanRsb3l0cGE1cnhhSE5veFFKV3BUU2orMjM5NVI0WThvRTlN?=
 =?utf-8?B?RjZKMXl6ZUxrdWNwZHU2emJPUzgvbWQ3Q3lZMGxVQmZ4dEhmS2tXN2RWR2RV?=
 =?utf-8?B?M1U1MHF6d3d0WTlaWWd3L3dnenYrR256SllwYTNKZEFjYzBJUkYvaTdzdi8z?=
 =?utf-8?B?T2VWQUtwVW5wTjB1UzBjZ0VoNlljNkZSMXROUlpmaGtLUlU2eVZDaEFJR1R0?=
 =?utf-8?B?dkZHd3h1VWRsakg3TmNMejBEU1hQL2tJMWtNejdMYTRRRDJPNWFIOHJVT3Uw?=
 =?utf-8?B?M0hoandadzlkVmRJQlNrR0VRT1pmVWsrM2dOSC9lZ2JtUnZMcjJ2cC80VEp2?=
 =?utf-8?B?aTNHVVJIUXJBQ2s3djdNYzBueStoUFFHYVQ3ZjFaeXFVT1RiRUY2NDE2dHdP?=
 =?utf-8?B?ejBROWcwTnE4U2QwWTdOL0RXMXluWU80YUUxSFF2aE9zVEY2NDJLZGRqSFlO?=
 =?utf-8?B?WUt6S2ROUzdTM1I2WmtLemZBQlFLbytvNHlmZDM2TjR2RHdaMHIxUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E38EEAE1A0819C48932A4CA2800434FA@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB5648.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08fd68a-60ba-42fc-5eb0-08dee347f8b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 14:38:58.7625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cgmrzXH4iOBRQQhFOl9o9XWn1gQn1JaMwqu87yfvtxtiWUVu0xFTYErbgmQHE5vclUb/i2QO+DpLBD3CkCNcrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_073920_467605_73661041 
X-CRM114-Status: GOOD (  17.21  )
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
Cc: Hongyan Xia <hongyan.xia@transsion.com>, Jiazi Li <jiazi.li@transsion.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "naveen@kernel.org" <naveen@kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

T24gNy8xNi8yMDI2IDk6MjQgUE0sIFdpbGwgRGVhY29uIHdyb3RlOg0KPiBPbiBGcmksIEp1bCAx
MCwgMjAyNiBhdCAwNjozMjo1NUFNICswMDAwLCBQdSBIdSB3cm90ZToNCj4+IEZyb206IFB1IEh1
IDxodXB1QHRyYW5zc2lvbi5jb20+DQo+Pg0KPj4gQSBrcHJvYmUgY2FuIGJlIGhpdCB3aGlsZSBh
bm90aGVyIGtwcm9iZSBpcyBpbiBLUFJPQkVfSElUX1NTIHN0YXRlLiBUaGlzDQo+PiBjYW4gaGFw
cGVuIHdoZW4gdHJhY2luZyBvciBwZXJmIGNvZGUgcnVucyBmcm9tIHRoZSBkZWJ1ZyBleGNlcHRp
b24gcGF0aA0KPj4gd2hpbGUgdGhlIGZpcnN0IGtwcm9iZSBpcyBwcmVwYXJpbmcgb3IgZXhlY3V0
aW5nIGl0cyBvdXQtb2YtbGluZQ0KPj4gc2luZ2xlLXN0ZXAgaW5zdHJ1Y3Rpb24uDQo+IA0KPiBJ
IGRvbid0IHVuZGVyc3RhbmQgdGhpcyBwYXJ0LiBUaGUgc2luZ2xlLXN0ZXAgcnVucyB3aXRoIGRl
YnVnIGV4Y2VwdGlvbnMNCj4gZGlzYWJsZWQgKGtwcm9iZXNfc2F2ZV9sb2NhbF9pcnFmbGFnKCkg
c2V0cyBQU1RBVEUuRCkgc28gaG93IGRvIHdlIGVuZA0KPiB1cCB0YWtpbmcgb25lPw0KPiANCj4g
V2lsbA0KDQpIaSBXaWxsLA0KDQpUaGFua3MgZm9yIGxvb2tpbmcgYXQgdGhpcy4NCg0KWW91IGFy
ZSByaWdodCB0aGF0IHRoZSBzaW5nbGUtc3RlcCBydW5zIHdpdGggZGVidWcgZXhjZXB0aW9ucyBk
aXNhYmxlZC4NCkhvd2V2ZXIsIHRoZSBjYXNlIEkgd2FzIHJlZmVycmluZyB0byBpcyBub3QgYSBo
YXJkd2FyZSBicmVha3BvaW50IG9yIGENCnNvZnR3YXJlLXN0ZXAgZXhjZXB0aW9uLCBidXQgYW5v
dGhlciBCcmVha3BvaW50IEluc3RydWN0aW9uIGV4Y2VwdGlvbg0KZ2VuZXJhdGVkIGJ5IGV4ZWN1
dGluZyBhIEJSSyBpbnN0cnVjdGlvbi4gQSBCUksgaW5zdHJ1Y3Rpb24gZXhjZXB0aW9uIGlzIA0K
bm90IG1hc2tlZCBieSBQU1RBVEUuRCwgc28gaXQgY2FuIHN0aWxsIGJlIHRha2VuIHdoaWxlIGhh
bmRsaW5nIGEga3Byb2JlLg0KDQpBcyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoZSBhcmNoaXRlY3R1
cmUsIHRoZXJlIGFyZSB0d28gZGlmZmVyZW50IGNhc2VzIGhlcmU6DQoNCiAgIC0gQnJlYWtwb2lu
dCBJbnN0cnVjdGlvbiBleGNlcHRpb25zLCBnZW5lcmF0ZWQgYnkgZXhlY3V0aW5nIGEgQlJLDQog
ICAgIGluc3RydWN0aW9uLg0KICAgLSBCcmVha3BvaW50IGV4Y2VwdGlvbnMsIGdlbmVyYXRlZCBi
eSB0aGUgZGVidWcgbG9naWMsIGZvciBleGFtcGxlIGJ5DQogICAgIHByb2dyYW1tZWQgYnJlYWtw
b2ludCByZWdpc3RlcnMuDQoNClBTVEFURS5EIG1hc2tzIGRlYnVnIGV4Y2VwdGlvbnMgc3VjaCBh
cyBoYXJkd2FyZSBicmVha3BvaW50cywgDQp3YXRjaHBvaW50cyBhbmQgc29mdHdhcmUtc3RlcCBl
eGNlcHRpb25zLCBidXQgaXQgZG9lcyBub3QgbWFzayANCkJyZWFrcG9pbnQgSW5zdHJ1Y3Rpb24g
ZXhjZXB0aW9ucyBnZW5lcmF0ZWQgYnkgQlJLLiBUaGlzIGFsc28gc2VlbXMgDQpjb25zaXN0ZW50
IHdpdGggdGhlIHBzZXVkb2NvZGUgZm9yIEJSSywgDQpBcmNoNjQuU29mdHdhcmVCcmVha3BvaW50
KGltbTE2KSwgd2hpY2ggZG9lcyBub3QgYXBwZWFyIHRvIGNoZWNrIA0KUFNUQVRFLkQgYmVmb3Jl
IHRha2luZyB0aGUgZXhjZXB0aW9uLg0KDQpUaGVyZWZvcmUsIGV2ZW4gaWYga3Byb2Jlc19zYXZl
X2xvY2FsX2lycWZsYWcoKSBzZXRzIFBTVEFURS5EIHdoaWxlIA0KaGFuZGxpbmcgdGhlIGZpcnN0
IGtwcm9iZSwgaWYgdGhlIGNvZGUgZXhlY3V0ZWQgZnJvbSB0aGF0IHBhdGggcmVhY2hlcyANCmFu
b3RoZXIgaW5zdHJ1Y3Rpb24gcGF0Y2hlZCB3aXRoIEJSSywgaXQgY2FuIHN0aWxsIHRha2UgYSBC
cmVha3BvaW50IA0KSW5zdHJ1Y3Rpb24gZXhjZXB0aW9uLiBJbiBvdGhlciB3b3JkcywgdGhlIG5l
c3RlZCBjYXNlIEkgbWVudGlvbmVkIGlzIA0KYW5vdGhlciBrcHJvYmUgQlJLIGJlaW5nIGhpdCwg
bm90IGEgaGFyZHdhcmUgZGVidWcgZXhjZXB0aW9uIG9yIGEgDQpzb2Z0d2FyZS1zdGVwIGV4Y2Vw
dGlvbi4NCg0KVGhlIGFib3ZlIGFuYWx5c2lzIGlzIGJhc2VkIG9uIHRoZSBBcm0gQXJjaGl0ZWN0
dXJlIFJlZmVyZW5jZSBNYW51YWwsDQppbmNsdWRpbmcgdGhlIGRlc2NyaXB0aW9ucyBvZiBCUkss
IEJyZWFrcG9pbnQgSW5zdHJ1Y3Rpb24gZXhjZXB0aW9ucyBhbmQNCkJyZWFrcG9pbnQgZXhjZXB0
aW9ucy4NCg0KVGhhbmtzLA0KUHUgSHUNCg==

