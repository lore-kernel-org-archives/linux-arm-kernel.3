Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCF1EFCBD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIzj7ZA9vpJ2WYklWg+cNhOeNkFfYh8yTwz5h01ztoM=; b=PI3M5SnWb8ddNLF+jF2xhJPFRb
	FMf1UY3DKhEPMARm+nqQYMMhdQVsl7q1Ghf4+SgQ9kKkWdoihLv3ZC/WciLuotTZb7ixpeyKstmhc
	pL3v3LvOPAE0QD5hT3d37R0Npjk18OBpTuS18fKJ6EQslmq46BXO8qXft0FF5axASukZaIaysO3+b
	7r2VlKwx8YvHgeSkbkuveNZm8ldRUtnk3RqTOd3tHaSgPTYTlpt23M855CcRcQ3tVyYTBbPbkYRmh
	0lPpHdh0XEMhKRlze2SFCRsBmLhcFwK8yj6jB/Mfx8GxwN8BDLrmCBjoXrd2GtnMAHel7/ZwOVR9U
	6Wjq+lrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w239A-00000003XPa-2K0Z;
	Mon, 16 Mar 2026 08:17:56 +0000
Received: from mail-japaneastazon11022085.outbound.protection.outlook.com ([52.101.126.85] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2398-00000003XPC-15p4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:17:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=js5sLjAi+Oiu1P6qKh5a01jAhVPz3MS2A9DjoOtfvXVl9E03I701894iXKqsgX4zwbkfhy80imIKoQG08ltESMYdQ5TTjuHQ9JuNhgruonByujuaj0vNKqVGPrdUZPkF/GnxmJZ+Vv/ipq1sgYjyE9q6gU177cucwn+iWJCK4i/X26dcBFjeC6bEWvICEICkN5T7J/4qdvur9+Cjv8M3iobGqEJW5AdpX3RjjFKUfor3vI36BeNElkAqTAIL+I5aGvQs+rtyibrydMEL4tIh+28hLYVVLxHUHEOB3ycS4lVyBhrbKcQ/+vjys4MjWmP0y9Ni5kNvNStheMc18ofDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIzj7ZA9vpJ2WYklWg+cNhOeNkFfYh8yTwz5h01ztoM=;
 b=Gu8mjycBTI4Jkq4OnvNOY4DSEUdvbN2HDsWED3lBQeeRsoUwVhga3ighXUtWQw4DJa70SAOGylNod6fRGEfgIIGCYsK6akx78PwXv1ultTnBIL3BGvX/kEHXIwJGdK+Iw8FqHg3nkoTtJT6w7LColH966Qh2rKRAY7pfRb1A5gJSNR427nsRibn9Coqpf8M6KhX3sAHADRLZlHWX4hlh/muGGot3dya7nwAYDqHBwIoPESXMKb63MD4Z0zN1vmAjDzBTCcBmluv3Q4s+iGwzyl1w3iHZhjAp7qsLxOEWTFyIkDo3dQfrzr4DxkhJuLgvE6U85DhUMzapGm8kaqAQbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIzj7ZA9vpJ2WYklWg+cNhOeNkFfYh8yTwz5h01ztoM=;
 b=nQNBox4EA/BLw9qbEVtGweFGvVcFPtZ1dSI7LzTMKn+5ubNAsPEgqtlQ6O6P8oU47YuhqhSFtLXkWCDY2SkVEMtOK4EFWBm9xwp+mWr9Q/est2Q7vHsrgqp+Y/B2IlhmhDqiEGnCtcBFA4772jWvPco0Ciq+m6Dh2WXc/xBkj+0snIRfW8XDjgcOmPNTsdOg68CGqS4VVgi8FLusdIO7+UOIieDuYRnENd7aEvwonsST8OvlSDCeMI0ka66DttNmv9PPvYOqPRfhyGfAzl0+cg5QTK50hano4FUaf+95mDjXVSUkBgb7mT8tzhr7f261/gdkjJ3zRrt8OCBu6Y2i6g==
Received: from KL1PR0601MB4276.apcprd06.prod.outlook.com
 (2603:1096:820:78::12) by SEYPR06MB5325.apcprd06.prod.outlook.com
 (2603:1096:101:80::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 08:17:49 +0000
Received: from KL1PR0601MB4276.apcprd06.prod.outlook.com
 ([fe80::b7f3:3c41:fd0e:e3f6]) by KL1PR0601MB4276.apcprd06.prod.outlook.com
 ([fe80::b7f3:3c41:fd0e:e3f6%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 08:17:49 +0000
From: YH Chung <yh_chung@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "maciej.lawniczak@intel.com"
	<maciej.lawniczak@intel.com>
Subject: RE: [PATCH 1/7] dt-bindings: soc: aspeed: Add AST2600 eSPI controller
Thread-Topic: [PATCH 1/7] dt-bindings: soc: aspeed: Add AST2600 eSPI
 controller
Thread-Index: AQHcstFOhnecqp+8vEODwE67uQSGWLWwwXmAgAAQs4A=
Date: Mon, 16 Mar 2026 08:17:48 +0000
Message-ID: <KL1PR0601MB4276A4B81C2E2DB02BE8F2059040A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-upstream_espi-v1-1-9504428e1f43@aspeedtech.com>
 <3f2d964a-4e82-414c-b373-af0d531b0fcd@kernel.org>
In-Reply-To: <3f2d964a-4e82-414c-b373-af0d531b0fcd@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4276:EE_|SEYPR06MB5325:EE_
x-ms-office365-filtering-correlation-id: 6bd7feb8-d6ad-437e-43ee-08de833482e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|42112799006|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: LTJDKWPuz5ZxcyB0e/Zqpf5JalFhlVWd0jYh1LUQZ79Q4tkCA05SdZLB03+35+umawEHgmrAZktOQgeBQgeAqiDEDXjcDGeKxMZuWXWzQxJjomhE2qirX1KovbJQLV0NiMyi0RvcXoP46OwrZ+duyXmIRbD7hdVa79rCB5zfydBV4dqqcBqICuQKP1HlPRct1M+mxQaSk2GNF2xxx3XT/45PPUXtT6254rFxrmBZvw7IDIYHkIGejhDRGZc5VVqpuSefSuGVKMy0bFPX9dix8K4tQ4tnJQvgd/aD2Trmp0jWGXyB1YyIufRQA4Z9DWkkRN/x3K65j8ZmZh9eMX2FqqRXPAbfFVn+9AnHHZAoe8T7yzzncHgf30cuYQ6DP6+Ao7b7oO4gxFj9XvHu+9uLY5mzDvV52eqVpWtLb+bRMal5/i+OF1rdtEGCt1Dhkp1aAe4ExaB/9CiixTjuj8tQO6B/gMAG67NHrf0M4t9JX11LcF/7qBqyszCg+Yo4oUq7w/V9EcjTxBNGocEIeBPn9GEEGJbm4BdGb+7Ewzkf45/O//onWuozo35BynSb4E7N060wasLt4sysRfvFRO/qMI6Y2xuVATHY3/kRhQ1NeKHiXItG9ZCrF5sASPhPQ2bQ5vt+ttD8GNzU9qNBeuYy+fVPXSAdY8AGo26EL22uRbCmk74Wf9k2+z0b54q/n/vrYPNWUPiGikUTfh13YtOyoce6RspE4NIMy0NIt9XjzAQ/mXS2ckAH3yBT+/DVuqS542lRsb1LmsFG/SF4sQgUNsOzHjwaqKMDJ8syYois/e8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4276.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(42112799006)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFNjakhyZXQwVHhqcHNidXpVM3NXZlUwV2RsZjU0UzB2bHhkaHVCeDhCWEFD?=
 =?utf-8?B?RGduRWRBUWJxdlRtNnNVaVQ5azVEdDU1NDVrOTc4Wm4vT2dNTVRVeUR2VTVT?=
 =?utf-8?B?TlcwZ0UyTXpXOElSL3R2WGlibEdocGZlUUlmRUZLVHFJdDN2WXJKNno4eVFr?=
 =?utf-8?B?bEd2bldvMlVWSWgxellBT1hxcG5URVZjM212V0JBZGxwQzhiK242T1pMSTM5?=
 =?utf-8?B?U1VhRU54b1NYVTVWL1FFQXd3eDZFeUZseEp4aUExdEtjZXAxeDdCQzMyUWJI?=
 =?utf-8?B?WVRvK1NsWlZoSnYycmtWU1dzWUFrait0Tm5tNW9EbTY3bzlpOGZSZmpXRkZm?=
 =?utf-8?B?VSt3aFBDZUM3SzhsR2RmZkJLcWl2YlliMjJaU2oranlEOHc0RERjSkYxOFBq?=
 =?utf-8?B?UWV2S0lWajVEeU1CaDZaakpLb1hNekdyKy94c0F3K1N3Q2czMndYanFiUWp4?=
 =?utf-8?B?ajc4STkwbTRGb2NQamhENVhBcjUrSTBIblNNTVNzaExrcnhOdEwvZzZ0S01t?=
 =?utf-8?B?bWVwQmhSK01lcWNxK3VDV3JHeHdKN1g4OWowaEpJdmFqTTExanhObkxDNjUv?=
 =?utf-8?B?RXVScXc2VnVPeGt2d0V1WFBUN2g2QVo5UjV2ODdaUzJydHRvZ0J3SmpiQVdU?=
 =?utf-8?B?dk0wS1dheFc1OUVFZ1BnYW81cyt5NG1pVmtkRysxVWMxeFdOY2VQaFF2SUUv?=
 =?utf-8?B?SmhBa1NtSnpBUWwwZUl0ZFBQTE1GT3h1TFgrd0NjRjVBK3Ayd0UyZjAxQkx0?=
 =?utf-8?B?b2c4NEduY1RjSFZteWlnTWJpMXBGTGJRQjBvU3cxbmFrVWNMa3RydVdJM2Va?=
 =?utf-8?B?Z1l0MVlZOGRSK3FoN0VsYnVaTTdmVUZpK3RoV05hN1ZhQ2ZSMmN0YmRMQ2th?=
 =?utf-8?B?Yjl6ZDFMNWlFbWkwSVZwVXlFakh2S0hIQ2piQ1VTSllSR3d6RXo5N1g3RDZa?=
 =?utf-8?B?MkwrZE40ZzFNNXZMVVZ5NS9CZmdNdG96TTlDQ1hhQ21lWkRJeDg5bGtEbVBl?=
 =?utf-8?B?Ui9xYVhGdzN6MkdCK21QSk9ROFJxblF4NFQvaSszK0c3czIyeWpXVHZ6aUJX?=
 =?utf-8?B?UDhja0JrOXFadkJESUdld0VmU1B3SVE0M2EzR0pBODdzNldidWlvd0doRitC?=
 =?utf-8?B?c3hDTStGb0NwQWlCa2pDR2F3NWVSTzhyV1Q3TDYyYi8vK0NYUmtHaXo4RCtE?=
 =?utf-8?B?MlAyQUE2dlVEeTh1OXdaNC9ZbUtsUHB3ZXpVWlVlYS9DOG9rVmRtejR6b0Vm?=
 =?utf-8?B?eHJsMG1tUXBlWXBNcUU3Uk42cEVranEwUFRvajFFNkJkRVlpZ0t2ZmpkKzhL?=
 =?utf-8?B?elVnQ0FIQXBvVHRsOXRySmptdllXcFczd2pQVEkzSXhMMjRrYlFQV2o2SFEx?=
 =?utf-8?B?YXRtYVRvSGFEaTNiQS94c0RxcXBvYkpSZlMvR2o3Y0V3RWEwL2NMaDZMMHhO?=
 =?utf-8?B?bEQ1emJQV0lPTFVxOG83UXVNZHFOMVdocGRtS2FDNzhMMkVSUVRIdFhCai9h?=
 =?utf-8?B?VERFbGtMT2RpY3hBdHpHRUlXdUFIVEEzNGxMUmYxTUN0bTJOZTRyb2VHUTkw?=
 =?utf-8?B?TDlSeFZ6dVIxNXp0SVA3ZGs5ZnlIZVRJL0hCUzBqVi96Ky9za3BhbHdHMEFi?=
 =?utf-8?B?cUZaUnUzTlJQMktOL2wvRmJYT21za0FiY2Ziam9vOU9NaVZvL1VFVXJWMldx?=
 =?utf-8?B?QjJPR3lUT0dzS1V4SGpEU0FBQ3pKR0VqanRoQjhHUjNicFZkdWdrOWtzZjA4?=
 =?utf-8?B?bFgzdEs4TmdFTzdqMkNlTC9kSmhMbjBzS2R4cGY1QzRzaENXbUUvSWE1QzFU?=
 =?utf-8?B?TmswZjUySnhEcXNlZW1mUWlYdWlTdFRaNldqQWQyaWI0OU95V2ZqRjlZU2w0?=
 =?utf-8?B?UUtnUkZYNHE0YlNTcTVmMlliYzVkVG1YWUIrQ1RXYjQrU3crQVFQeU5BZE9K?=
 =?utf-8?B?c1FmeXRHcmhMcTJYTEhSL0ZZSFFlZmF4elp3MldrNWErL1hpTWtVcVRuVlNa?=
 =?utf-8?B?MHlzUWxqY1EvSkcwcU1ubVlYN1orOWZ6WlVId2RBa3hycE1od0s0K3VKRVJX?=
 =?utf-8?B?UlJ2NDZiakNzVWlmS3Nra1JlUWsrU0prSjRjcjF0UVpZc3R0MVBSbUNiNkVJ?=
 =?utf-8?B?K1I2bzE5T1RHckY2blVQdFVrb01raXoySyt1dDg0OG1xMDMvUmJQcjVWZkti?=
 =?utf-8?B?TFpkL0toMVRvcDhnc1d4eXBJQklXS0RMdlNBMjFCb2RkaWpOUVJFUnpPUWdB?=
 =?utf-8?B?MW1SRFYrVFpqaVJKcUY2VTk0YmcvcjJxaE5Ld0c5R01rNy8zWDlPSGN6eFUw?=
 =?utf-8?B?bFhFejhYRmN3WEYwb1RFWCtoOGF3a0s5cnl2blB2RGg2aFJNd0ZPQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4276.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd7feb8-d6ad-437e-43ee-08de833482e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 08:17:49.0278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rj2UAuWilI558RsErpE3gykPtLzppa76GPXmTh9wse5gWGxsBF1+xi8dAsqJT5OL/ak1azVOFH3pX7fE1eUz7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5325
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_011754_328420_428DC03A 
X-CRM114-Status: GOOD (  13.49  )
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

SGkgS3J6eXN6dG9mLA0KDQo+IE9uIDEzLzAzLzIwMjYgMTE6MDcsIGFzcGVlZHloIHdyb3RlOg0K
PiA+IEludHJvZHVjZSB0aGUgZGV2aWNlLXRyZWUgYmluZGluZ3MgZm9yIHRoZSBFbmhhbmNlZCBT
ZXJpYWwNCj4gPiBQZXJpcGhlcmFsIEludGVyZmFjZSAoZVNQSSkgY29udHJvbGxlciBmb3VuZCBv
biBBU1QyNjAwDQo+ID4gQk1DIFNvQ3MuDQo+ID4NCj4gPiBUaGUgY29udHJvbGxlciBvcGVyYXRl
cyBhcyB0aGUgQk1DLXNpZGUgZVNQSSBzbGF2ZSBhbmQgcHJvdmlkZXMgdGhlDQo+ID4gcGVyaXBo
ZXJhbCwgdmlydHVhbCB3aXJlLCBvdXQtb2YtYmFuZCwgYW5kIGZsYXNoIGNoYW5uZWxzIHVzZWQg
Zm9yDQo+ID4gaG9zdC1CTUMgY29tbXVuaWNhdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IGFzcGVlZHloIDx5aF9jaHVuZ0Bhc3BlZWR0ZWNoLmNvbT4NCj4gDQo+IFBsZWFzZSB1c2UgeW91
ciBmdWxsIG5hbWUuIFNlbWktYW5vbnltb3VzIGNvbnRyaWJ1dGlvbnMgYXJlIG5vdCBhY2NlcHRl
ZC4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNClRoYW5rcyBmb3IgdGhlIHJl
bWluZGVyLg0KV291bGQgeW91IHByZWZlciB0aGF0IEkgcmVzZW5kIHRoaXMgc2VyaWVzIHdpdGgg
dGhlIGNvcnJlY3RlZCBzaWduLW9mZiwgb3Igd291bGQgaXQgYmUgZmluZSB0byB1cGRhdGUgaXQg
aW4gdGhlIG5leHQgdmVyc2lvbj8NCg0KVGhhbmtzLA0KWXVuSHN1YW4NCg==

