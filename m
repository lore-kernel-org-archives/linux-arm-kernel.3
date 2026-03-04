Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8771FEDEC01
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 03:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwuTX4qo9lq+6RVPV98rWxh1RcYzAP3Ifn12m4AM5AQ=; b=LKU4kP2b8nJ2YG/uRD75PVs6EU
	fwnu04V/V04wbjflMSZh/cRQwL88tK0B0WSmrc9l9xq2K91BBpFrRFYzRC1Iu8c+PSVS0WUF84gLh
	uCq9AKfGUoAHkK+DpvQsmO6YvDKzf1MlJ/nHdd5EZj5gwyF9UwWUG7HArXdwVVU+Eo/VyfBd6toSp
	5FZtUd+rOvAQpvxTSX3JEiGV8vOVahyPCu5cleOIcGMTUfaAtAmvfut/ouXArr46rmAp2SPciUSba
	6uodMDX3Zx3nGHV1vbwun+UqTlCWcKhmakvwswIaCZKsBo9zyUSAJ10OalUFs/iVvkP9Tpqa+R/1/
	hsic9gDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcyB-0000000GNCr-3Pwz;
	Wed, 04 Mar 2026 03:32:19 +0000
Received: from mail-japanwestazon11022141.outbound.protection.outlook.com ([40.107.75.141] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcy9-0000000GNBk-1OnU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 03:32:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXfxFCSd49YFgDnxEpgsiolBGsUEqGJn6B5vlWxuFycj/7Xn5RRYRG6w6ZysLKcl5XCgK1vG7zwLEqohQFmp+q5jM4qZ8tU8kTCeLHj03C53576wSYRvoNain3HojF+py/GGHh0SRfa/vk4oMASD2Vc05kngNeQE+EmjXK+mvKBLAPDfFJgPORjFBrxz7hy82JPWywzGehO2MPBsPaT2lhuo2GwBgBkjTsvWdoEUiW2XokBJIARg8EfC651NYMC1Shlzoiq374AKCshn/s042KSgTRU9eqwQM10hx66dGU4MI07mwCaTORTlyl2B3trTJI9+U3kN/uYDDq+CeGJ55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwuTX4qo9lq+6RVPV98rWxh1RcYzAP3Ifn12m4AM5AQ=;
 b=INWwNq5Umz9q0pumX/AEtlmyy3hQpjLvNectHZhpE2DkYp1P8nlZVCDXHt1vldAhqZWqgJRUwPpxkIQDRUDI6AYv6kbtBOxFmabxJK0ueFHh2NE2sfn3x7Fnuf3mfoudhOBGaEozvkQWZChKbUuh5HIHqqK44wMJgJQtiQ15/nsaI4qhVQudNYOhYC+pJDsdlyie3+ZUZO0yI/9WRr1nMKJctPtTC5BSgNoycQiwUrndKImFB4MZZL2hv3rSpRDwu270GBrngcP131NBYynkXBgdX/DyyqmSRQoj/boBsfL9nTXydhTWp7bvwrf7XcCjvZQRrEBHwcrlM36hI9KvIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwuTX4qo9lq+6RVPV98rWxh1RcYzAP3Ifn12m4AM5AQ=;
 b=DJYIvBMVV2T++obD0+ieBYLBK/vPrwSZElP75kCSHNSgVNHzQzh//ZoATqrhVPQCXlZ03AgQRwbSD0rWhXD8aOhtmrk0cK/es59i3t9lqU4pKcnGJpY91rz07Du++pBqg/oPSw66ylrjwoINKIoRFT0Q9o1HtdGEzmz2rmt4VGF/qbL2kGcRaHbvM01nd8dO/RbS5/dgkfKPaJxdhHbA1xD88wxXsrv/VSglogUZGfJ7v79z3zPKmWqGb0CwMbbzUukSGLLsIbohOL4nEerN6UmzN5bb/zWC3F7F/b/ZkauXPnxKM1GWAw4OxAA42frHeo3+riYtf6t2DYHNFbKpLw==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TYZPR06MB6189.apcprd06.prod.outlook.com (2603:1096:400:335::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 03:32:10 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::f53d:547a:8c11:fc6c]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::f53d:547a:8c11:fc6c%4]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 03:32:10 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "taoren@meta.com" <taoren@meta.com>
Subject: =?big5?B?pl7C0DogW1BBVENIIG5ldC1uZXh0IHY2IDQvNV0gbmV0OiBmdGdtYWMxMDA6IFN1?=
 =?big5?Q?pport_rgmii_delay_in_old_dts_with_AST2600?=
Thread-Topic: [PATCH net-next v6 4/5] net: ftgmac100: Support rgmii delay in
 old dts with AST2600
Thread-Index: AQHcqi7Gr7cJtLyoHkiNbL3G/34e77WbiMaAgAIxoEA=
Date: Wed, 4 Mar 2026 03:32:10 +0000
Message-ID: <SEYPR06MB51342D919495EC1B3B1BC8899D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
 <20260302-rgmii_delay_2600-v6-4-68319a4c4110@aspeedtech.com>
 <4a3975a5-f002-4c32-b45f-0f04edbfd25f@lunn.ch>
In-Reply-To: <4a3975a5-f002-4c32-b45f-0f04edbfd25f@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TYZPR06MB6189:EE_
x-ms-office365-filtering-correlation-id: 6010be66-695e-4238-a5b1-08de799e9e6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info: WNqKWpNFgs5i1WwojryBVI8ZPSlwyzYkzwld0a2L0A6aYXJowzKIZL5bBsEWwJfrfGM5gO2RMdXHgNpUAIbAVsBO8R2VYpL4Fajjx2syxHz2bCqtXkdgJ4A53a+FhuAyMLq/vQ3CgPaRWymG10XKTDk6hBcm07kI5MtS8k9fQbOY2g/e1UwGTtPhDvlJZ9RePO8bGy7SzgAaVvvzvMd4NLnJKeWiXm/0TXC0qazbAmq0NKves9qofuuERJdlQOeVoe6cUHwX5Cx3ccU1zLNLAXhO5rvODpUsmxIVnQYI/Utyh93vhg6mYdwxOTEIdSwmqWTHtK7Ol9bG/++nuZuvASrN7LV/b5BHO1whfowovg1N6oXw2+Ae0NeqLZN7RK+XuEuRsl/Bhu2zObfJ6zcY4LC4jkSGyGCkObmyFJffFSZmFTpcdIGEVbNIbhVFoScDg81GPcTD+yAJL/Q08FVfJa6tanD2mNy/tsSp+bzfxoUy0udQxI+kSLFJk3BkEzaT4kWItNqb8ks4FmI3koSj1fbasynY2HZN5l6QBhCPK3UbkDbXGDyyhpql0ZQ+JRWlQxFbEBrEb+4zh2IRBBd959EnP9ZoB0SBVcgWjkmxid9SEWb8qGMtG2cX6OOKUN/vg4a/GnOz3mY6do/BaVUtMHXHKqcZkCQrWNu0Jag2/tj9k10SV9yT5YVl3i9lWGzHF6JCUAVkwbBMV5wkKv47U3CPG2jkwKQ+W045LuDoMKcYsdb64B0fECr+hJMrorjlEyRkAvh7Y7h9YgQ4q5PjyPZ2P/h9eSC57ZZPg/uE2uw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?RTNnajgxL24wM0hkOSsxZzNac0drdmNtemJjM2x3RDlqNGphUnZmRHdmWFFJbWpY?=
 =?big5?B?MEdwZ3oyb1dPRkY3WUpBSXluWElGK0dkRjNrWGV1M1c2aEYzR2gyWFZTRGJUdk51?=
 =?big5?B?ZnFxc0p4cHVYSWZiZDFWNEc3SkxDNVZGS09NaGJiazlPV0RTWXFFZzIyQWpZTVUr?=
 =?big5?B?Mlp0YzJDVS9MeTRwRVI1V1FCVFBhK0xNd1FCVWpTSTYra3VqL0RyektmQ2xvL3M0?=
 =?big5?B?VjFoZWJBSEE2K1ljUkQvOTQyZEVUSXZvMk03d0RURXlCQURkcmxJV0wxZm1xMjVk?=
 =?big5?B?SzJPNVpobm9LMCtucTZBVkRkd1FnNWJ2YTJNU1BHS3pBeHVYY3loQjdpOVpFWTZB?=
 =?big5?B?aFo2bXZNcTRnTHpWUVpnVVdrWjBFYWRjTHBVRC9ndVFIY2RyM21QQ2tSKytxSEtE?=
 =?big5?B?aGl2ZlNwM3l0WGdiS3FNeWVRSVJaMFEvaGRpcHZ6am9zTDZXaWhzSUhCamIvaWY0?=
 =?big5?B?YzBWb1lWUnJxVG1XSUJudjRCKzhMdjdSdVQrb3NJWU1kNmx5NlpkZlUrSUNqMVQv?=
 =?big5?B?d3oyZW0xRUJ2QXorZ0hJUUpnSk9aL3JCTVErb0JRTW5XVzB4RkxXRjdEL0RieWdv?=
 =?big5?B?cTF4WlJwSzFNZC8vdStlWnJ0c29MTDI3c2VkazA5ZkF2YnJ3MWNaTG9ndEtuQTV5?=
 =?big5?B?SEtWK0loWmhXYkpiT0ZyZTRrZmF3YVJRbGp6UXloM1JOV2pHQW95NHVtYjlxYnVT?=
 =?big5?B?Vlo4aitxcm56UWx4bFNIWFZGNHk3OHpMa1EraGN3Qndab2cxNnVOMmNpamFXMnVW?=
 =?big5?B?cmhjaG9xZm1DSTJjbEdlUmpVRUl6aWZVUHRPVDV3UzlXb0hFNDltbDNIakovTk1k?=
 =?big5?B?bWFYTXpabHhzVXZ1M0hQemFGcDNsWDg1bFArRW9sRnprMHlPTnhDeVgyR0NXMmt1?=
 =?big5?B?ZXdESzJDUHZ3VExxZWxFZ3hwTXV2K0ljVE5mbzdPa2dVRlZhditTRmE0TWhQcmlI?=
 =?big5?B?T3pUNzk1cmU4UlI3aFNMRm90OWNzanJlbTVLN1ZqbDU2ditMeVBxRWdwM2dUMmR1?=
 =?big5?B?L2NLYnQ2d0FFcFQ1RFJzcytqSHQxZXFJdUV2VENWUE9SWDh4QmVHYmtvYWpRcVRv?=
 =?big5?B?a3NkWmdNd1FDQkp5TGpIRjNxeVlMUktNQXdpbnIzTTdyeFNQbVRBVjJFZENCdDUv?=
 =?big5?B?YWtOU3Y2VmRVS2ttZVRJdERCVUZNSWpSelhLT0srNHJEV0dJTXlicXpWbDlNeEFw?=
 =?big5?B?TjhlcTh5NTNLRmZoOFhId1U2UUZCNlZaVTk0N1VPbnpxRDcxZDBVcHQxMUtYcFU0?=
 =?big5?B?YmNqUFY1RGl3a1VERndNWkUrRHNNUFFDN2hqWjR6a2k5eFJPUy9tTlpZRW1iOUdp?=
 =?big5?B?WFFESmVUUTA1aG50SEVtamg0TVFvN2hlLytYQ05xNlNzMmp1YUV5OE5xa28wQWlP?=
 =?big5?B?MnJRZU1XOW5pWHUybEkwVjJ2Vy9ieHZlUmVRemVPU2FkSU96U3JmQkdUNTNQS2U4?=
 =?big5?B?T05uNDVYM1A0N0pHM1BmZm01Y2d3dmU4WHpKT080ZGt4amJnVVhYUjZQTERvbGJ1?=
 =?big5?B?TytjWVN6UFJ2cEFyelk3ZlJmZnRHRS9kRkdMQ1FpUGlMNGwxNmNKOHUwVHEvMkpX?=
 =?big5?B?VXNCaFZsNXJyQndmR0JhSjRTMjhKaVcweU1va2RRRjlhd1EwaWxrMEU2MkJQaUps?=
 =?big5?B?c0VBYlBFRjVyQVhDSEt0QWJ3aDA2QitwOUZIblRsTktYTG0wWU9hWlhBSnJsZ2p2?=
 =?big5?B?b1QzWlVseFhQNHFQYnpOaU91OFQ3NnU2YkJvdlFmYUhPZWhSVEt2ejVvVU93NTNE?=
 =?big5?B?WGVOQmhiWkt2aGc0SGhkTit6RUYrU2M1T1hpNTFDLzlOL1REK0pMdnU2SlVrTER1?=
 =?big5?B?bnYvdnlFa3k0RjVURU5NQlZnSTcrNHgvRkwvODBhY0tFdDAyRXk4ZkpNbm5tUWNJ?=
 =?big5?B?RmtQN2d6ZUVGZmpYOHRIQ0hrMVlUdTJtS05tREZ3ZGZEcVcyb3loNFlCVkFnK2ZD?=
 =?big5?B?ZWdZdHhwZkJ3Y2hOeEpTallacm9TZnBIUWRlNm5hdDdKaFQvT3poOW5KMWpEcWFp?=
 =?big5?B?Y09lRzFab3ZIbjNoT3pCMEp2Nm81NVBwL1F3eGE0TGprTzFQYzlvQVhGNGpZRG42?=
 =?big5?B?UkF6NkN2SlFiUFNoQ2RCUTdEZ3pZNUNvVVZEczRzc3dWTXZoZnhwbWVuajRURnhL?=
 =?big5?B?Tk45UHhBSTFLUHp4NEJLYUl1RjByRWtlV3RVR2pTY3RXN3Y5bUJON1dhSU9ETXlh?=
 =?big5?B?TVdnR3psY3RaNWx2bUEwWDI5aitLQT09?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6010be66-695e-4238-a5b1-08de799e9e6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 03:32:10.2574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: juvO+szar0QQA9OgsCu+Pd8kRsSgc8F9i/lW0LipDCbduIN68DbcTAQwNQ/uVlaPxo4k66BgEFp5E/eSTrdEjNA10gaHjaBvd+htSPDd4PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_193217_394683_8AABFB7B 
X-CRM114-Status: GOOD (  11.06  )
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

SGkgQW5kcmV3LA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCj4gPiAgc3RhdGljIGlu
dCBmdGdtYWMxMDBfc2V0X2FzdDI2MDBfcmdtaWlfZGVsYXkoc3RydWN0IGZ0Z21hYzEwMCAqcHJp
diwNCj4gPiAtCQkJCQkgICAgIHUzMiByZ21paV90eF9kZWxheSwNCj4gPiAtCQkJCQkgICAgIHUz
MiByZ21paV9yeF9kZWxheSwNCj4gPiAtCQkJCQkgICAgIHBoeV9pbnRlcmZhY2VfdCBwaHlfaW50
ZikNCj4gPiArCQkJCQkgICAgIHMzMiByZ21paV90eF9kZWxheSwNCj4gPiArCQkJCQkgICAgIHMz
MiByZ21paV9yeF9kZWxheSwNCj4gDQo+IFlvdSBpbnRyb2R1Y2VkIHRoZXNlIHBhcmFtZXRlcnMg
aW4gdGhlIHByZXZpb3VzIHBhdGNoLiBQbGVhc2UgZ2V0IHRoZSB0eXBlcw0KPiBjb3JyZWN0IGZy
b20gdGhlIHN0YXJ0Lg0KDQpBZ3JlZWQuDQpJIHdpbGwgYWRqdXN0IGluIG5leHQgdmVyc2lvbi4N
Cg0KVGhhbmtzLA0KSmFja3kNCg0K

