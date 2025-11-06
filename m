Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6D4CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 05:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jc0hgzNsCUrlypGoz6xaylxgITXf8AZbeIzxe8ltDBQ=; b=VSIvjzvitTxzdOHe9S5oSVn9ND
	ZKHnebGSypDJ2YYoljjxltPeS/yEJZn94e7Va2UbhJveCMGSuI20bHJpATMkRrTAm9xptYnlbRPFx
	OkI/K7YOIGQRnl84XBszmsMeBJZ+7jHKsEuf54/VQpY4lwD0prnfKBhy4P8gtiug62rsP6Lq8VbjI
	HzpxVDkeUl/hUTeMNNJm1O1mGZaVgjApVxqSnEcMMDU4nI8RRHpLxiUjxopuaa27S/Y9xSI4qN4LQ
	RePk5m0Ut5WeQGbjtHgGy+sD1DOZKV0NV+bVLSH2KecsO9dRTLIK8k9pRrvCOncOmmXGoq02TiyrL
	Xf+MLLSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsVX-0000000EsoC-1IYx;
	Thu, 06 Nov 2025 05:26:03 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsVU-0000000Esne-2iXB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 05:26:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtI9xFS4Bz2KdQ6Joxozb8ddfagu0YPQbLYsw1Aixp802ytgZwu1PY9U9DLB7djsgglZa4usp4YYDODCH1TXM86+2rjQ8S6C2YjRTqXumAbaPcGo9cF5+egSntLLYX4ggcZAaJxDHPiDH+f1Fea+PkzRNerudwPzKeHyM/TkYP40yXPuPVxYewpCDajoZUKDkZAAEi8pA8CjFnphgIwAa/r1JOHoHvJoo5d/p302kUpm+G8rX7viIH5D5dMS2txJ7fY9i6jLqysCPaanbiyMZ9g5GHg2SsL13gNyYnZQTpmQ+kr7FrIAths/C5oNoFmBl9pFuDtirZ7kyDl8tforqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jc0hgzNsCUrlypGoz6xaylxgITXf8AZbeIzxe8ltDBQ=;
 b=ayJgBYLrt6TOPAzznFmjr0OyDyaV2OTVtUwV29ebrtB43d4cnqcJHkcIMXtHqJY6iqYC+wk6ONIE3WHMdVzodsQkWQPW9/t64zkxKRfm+fBUbJEv2DdoQYHbwk/WRVg5mXGkZUQlzcjjaCqqLjUOsyhShQy46LVU1kwHOGbZRV74w86fJKDMoOyx4iemtVCDF0fCK5efMZOZjnw3LvgELpfr9K9xm2eEwYo497QyIL2aKnj6FVC5tyW0ydA6cuq+tVT47mhKVW5GERcmzrrUlBcPMCPjT9MrJXSOmc3Ocw/o2jBKI1921TYFYWgE1Si+U+wy9pLNVSFO7N3XfBCxqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jc0hgzNsCUrlypGoz6xaylxgITXf8AZbeIzxe8ltDBQ=;
 b=P0IFWugsHMvQ/F94AUwONFBkMp4xdmT3jEFXRauzxpmQSnbKtKEm1vUN+wob3GmA5ir2UWN1y6YZlqvDWz3XV8kcScF9kjycameX3jcGKL91bo90/Ilw8cEXkPqfR/yYsHKFj26h1duWuI/+z9DlwMNVeziX4KxN66QHZzwcKhKiWVQZXTS4GOn7Nb1O8CntFO7MK11JbRb1FNxAFkjGOT/8Nb31z2d/QmAcmawh0R+uH2gCCHPmEicHvQvDsLSffeF19jmCRhDLAHEe1pEHq4z/3HFKSotI20rW/pwy0DRx/YWJBRuiMmLJxJQTA37qmF9A529oBb98xgi6298QqQ==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEYPR06MB5208.apcprd06.prod.outlook.com (2603:1096:101:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 05:25:49 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 05:25:49 +0000
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
Subject: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Thread-Topic: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Thread-Index: AQHcTJUB+TmCwKSgIEaeQsrh+oaRd7ThzyYAgAAnFuCAAJHDAIACl+pQ
Date: Thu, 6 Nov 2025 05:25:48 +0000
Message-ID: <SEYPR06MB5134524038F2FFEA3009AA209DC2A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
 <2424e7e9-8eef-43f4-88aa-054413ca63fe@lunn.ch>
 <SEYPR06MB5134AB242733717317AAEDEA9DC4A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <d7b08607-73a3-4f6b-ab8b-3eb4ff8b8647@lunn.ch>
In-Reply-To: <d7b08607-73a3-4f6b-ab8b-3eb4ff8b8647@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEYPR06MB5208:EE_
x-ms-office365-filtering-correlation-id: 9f2de97b-bb93-4ffb-ff89-08de1cf4f1d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Km1iDnzQryRl05lw2FF6gZaq9BhQUzYIQj1Q2pX6cBprxFuxFIF2CMG9ztE4?=
 =?us-ascii?Q?g9AxtVBak4Hccigeki+YYCJnxmcn+hkQXZagmYikShEypIIp0QDCovw88wY5?=
 =?us-ascii?Q?nq4qwhXr8qRGr263FeXyKolFDzHlshDiZjdKhqidt5tmaHm2T6okd3Wd2R7K?=
 =?us-ascii?Q?RZPaHFui86Sa1HyBP/mM97ASpJDli4M2C+pE7ydbz/dvGyM5eG7jzwYNffnl?=
 =?us-ascii?Q?Q/8fwY/Us53AIzNi2rAJWeKkey4TdXGJsl1ADbRQ+PmO8vhJKJdnVZ/Iovon?=
 =?us-ascii?Q?BRnUQUzng3LzpG/YzXuom/YUoGLmqN2qBOK/pW0eCaNgXoo0Ez9z1yRC/hFr?=
 =?us-ascii?Q?6C8qTTMjbrgslj9T8f32E0CplY0zbbGuuh4DMy3ZPhsQuRozMTekbv7mVnqN?=
 =?us-ascii?Q?VSYHbcztbC2HU6atOCsVqIVzzWGdS6V1xrjOV++0zXzhGCLzdUVC/6vXeXrQ?=
 =?us-ascii?Q?FLOZxXjhHwi5l0nhvKrXBF80ciVI8fkgi9xErBISekAYDtmvpfRuGgmYrApa?=
 =?us-ascii?Q?vWIKolcAZKSKzTCHHAUKvHVbbc7sUbXF25KIJdm005/LS61+Bn9UYAYxpqWO?=
 =?us-ascii?Q?cnGolYV139mC0wTSD5XDzRH0/Z5TkG8yXG+0TMB6MauKD/w6md659HrckXln?=
 =?us-ascii?Q?3//BXHMl2V0BnZ3mHstUUmGAvgC+/NTibO2bc+B2HzjDlZxKTfQAmvae+ylH?=
 =?us-ascii?Q?QxderDFMqiqjsioxM64+ns6R9u1c//Pz83YnLAVXcS1w1aTlgTJMcVz5wsEO?=
 =?us-ascii?Q?GYgX/LNK8XuMmHKPU5ULHorxjupAWMCE6UM99KXci2wHB1DC1G7VOT0c8CCh?=
 =?us-ascii?Q?aQx2w/8b/kq+mqn4V8/OYYt1Y1Gx31PmWDaZFSV6y2HKKKEHiihVM5nlWTnU?=
 =?us-ascii?Q?ZRR7lYCAD0LR3os8x4/FOxHOy9w583Ksc+UEjNLyVCvZTVE/5EB6DkJAS2jf?=
 =?us-ascii?Q?jviWXvGbcw4wgz9Uv+DaOhP4WJIDhAQmgYaMh14P9S1liXWI0qe1uztLIiy3?=
 =?us-ascii?Q?gtIPEhmjkBCBQbLQ/9P55+5g5NygUli2E2ErHf2CAvvTrLiVIzo7BcaTcV8N?=
 =?us-ascii?Q?AsdqbQgyGZoCHsYjnPich5w9btX0Va64+J7+OujZRslyqtbUnrRPmf7F669x?=
 =?us-ascii?Q?4VrbhVntv/wJbCfQuyNfC/CupC309RU/ZioTaXMoTV9Q4pVrhHtwiKPYKg/y?=
 =?us-ascii?Q?J0l2Emj8ArRi1P1ec44l5YWiy8Skq7hAwiiJgbcBopTOyMsqcCSDfarpN/eK?=
 =?us-ascii?Q?LUb6Zp7pGxJX44jXEBauCMYIU8A0erl6mZqBMpJsBcJdG5iwgvDJt1Se2ONF?=
 =?us-ascii?Q?R676puA3T9x5b92FO22e90Cs1xeDhWt8UqlQcL9j0uAE8qQ0hb/SJIf5Hx1K?=
 =?us-ascii?Q?Kt3Rs4rYEuMJwSpsLfATYs/94uOmBsg9DEx/Mo3MbrR/4jjom6fnf3KcCVfC?=
 =?us-ascii?Q?Y8vgZksD4S8hYi1SMjycKugMKgH06RkbU9rGN8aTeDNGnZ6rbCLJs7njspow?=
 =?us-ascii?Q?tTPeX4ey1At8aWCWVHhLfAoYVMp6p4/b6ELB?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+jml/Y2nxQY0AH/H2i9ARJtW+uJjGiocDBRXiCXd93IjmNEJ1KBbRf/wrSsQ?=
 =?us-ascii?Q?nCaiwbWO3R9ZRxio/CFU8RMPce7ZSprG6YgYD2RWcIDEgLIykQHhqScV1f2L?=
 =?us-ascii?Q?Kt2nzUR/n/NS+Cl5uObgfyYy7F4TjiMM9PZdEK4JQCr6yZ7zvXz2LziUFJHc?=
 =?us-ascii?Q?JcpULEkOaSPm5huArWemjh7d/nVoATBJbVK5nemqlYVQHWMb/YlbI3E7Lljm?=
 =?us-ascii?Q?3CXkUMmClAws17TI2r4QeGYJ4h+dqsdcOWepjayCSgJk/yweTsde23JjcGTt?=
 =?us-ascii?Q?naTEH9bBlbg06CQxnPNo8pqCTuI0Xp17leTXw3VbYkqjUgLrbJ+qRwvCobuR?=
 =?us-ascii?Q?r8y0b6goEVSgWIKRvy7Pipa93xtJAPD6WEXN2f8RarXOt8Pc/KrfoJCdBkdu?=
 =?us-ascii?Q?D3sDhiYHJoFuSOGnbQxt+3HvJlF8oceJaxWMCW43A1k51j5c6mq3GH89wGON?=
 =?us-ascii?Q?WabdDrJBPfdck7ABFUgpj/8Z8/5DyyTIPfdTZpq4uPTfsT9JzrjwNCrjvP4/?=
 =?us-ascii?Q?0+hSMn+SKbWGeDY5F8ooGYAOhAMcDOjMF9+161Ocwq/Qmkh9D17iM3ipqLyR?=
 =?us-ascii?Q?V8LUzaKf1R68WlsYif9KHDyeFt5J9m/cA4w+EZed3QnViqcZIzcbCHfy4V0t?=
 =?us-ascii?Q?L7vxJLP7ab+9DCskCwLLmXyrCo5XP9oSquELNI+4ochMx0x88n8y6P6ufBSv?=
 =?us-ascii?Q?sJP07EecdbgDnEIXn0F8oLKn3NI+Vx/kWYMyBVV5mLxS4ZeVrEEq+s6Ti7fX?=
 =?us-ascii?Q?+yyI6YadEnHxiTp77xa0fmmXeltgU9obGtIb9VpTbENvLV69iC6FYlrtUcRH?=
 =?us-ascii?Q?F8OSmE/lB+h/3q5O5OcuuWeVDsVTag5+rdz1pM2u5nVvv/SbnODKzhcTetw1?=
 =?us-ascii?Q?uI2uJph6ELaQUH8NrDrf3CLEN9OiS5f8l0kkS0uQ9bJHZrTNmm49AcGww4xD?=
 =?us-ascii?Q?7LYAlEFad16iNcoOYujZQ/XYoL1K22tWWp0yGG2KCffcKmdVZziP0B0br8Q1?=
 =?us-ascii?Q?qtfYT/lEj0jMhB4vkbP+kCAzfUmuDKb720W29GT5JAEKSjBke5gCS9EPNdDb?=
 =?us-ascii?Q?wXUtA7g7XR/Nbsz7BZV7y44doFDzC7DPKSQ3O9TDlBGOQG/9G2wgUFCXpSZi?=
 =?us-ascii?Q?rtFN2FZpClylABKP/hWLbSNQHT/69ZIxmK6FBrSfeRUgr0DTWgyZ0L529bA0?=
 =?us-ascii?Q?cRp4VtTUnpWEd7hXcaNErlH/7oX4fmmnsQwr6C1c638cc0e0ZpGDlJ5ig50m?=
 =?us-ascii?Q?zdG2qO/ITmZ/i8aLFInZin/P1aQaC7tBOz/Mw12ui7T0eO9EqTw2JInQkDFP?=
 =?us-ascii?Q?7kec1VUcsPwQMHk098aoWZBSwVUattXMuoxCNn7sM2Xc+I1UIrXMRi784/Sb?=
 =?us-ascii?Q?TDkChcD+Xm6+/TfmMeLUXmQniyUxjlPP62+nXjCLuR6vnMXJjN0LNWPfrcr0?=
 =?us-ascii?Q?7ddsSxTulo4LjrJQt93mThfxEanH6WGHQ+QAzwaqahtHQ0i8oIeRft17rS+c?=
 =?us-ascii?Q?/mCIcCsWrsrpu/V+dJAaqVCqdm3Ft/CYEhD8klNeU/kgOb3b2n8GpeKt/BIY?=
 =?us-ascii?Q?StR9VC9TiN7jpFMJ6CloFSvB3oerloHIJ+6j+cC3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2de97b-bb93-4ffb-ff89-08de1cf4f1d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 05:25:48.7597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /JOrobkDSc7CbfZU6yAu8MDx168r5/OiW+6UdAV8Z86nMc3pkwC5yfEFwR3cI7d2tLPyr3czwWxU/OyD57xlU88Qd9ZabgPqdyFvG+X2l1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_212600_718985_9FC8CA39 
X-CRM114-Status: GOOD (  24.50  )
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

> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: aspeed,ast2600-mac01
> > > > +    then:
> > > > +      properties:
> > > > +        rx-internal-delay-ps:
> > > > +          minimum: 0
> > > > +          maximum: 1395
> > > > +          multipleOf: 45
> > >
> > > I would add a default: 0
> > >
> >
> > Agreed.
> > I will add it in next version.
> >
> > > > +        tx-internal-delay-ps:
> > > > +          minimum: 0
> > > > +          maximum: 1395
> > > > +          multipleOf: 45
> > >
> > > and also here.
> > >
> >
> > Agreed.
> >
> > > > +      required:
> > > > +        - scu
> > > > +        - rx-internal-delay-ps
> > > > +        - tx-internal-delay-ps
> > >
> > > and then these are not required, but optional.
> > >
> >
> > Configure the tx/rx delay in the scu register.
> > At least, the scu handle must be required.
>=20
> Sorry, i was unclear. By says 'and then', i was trying to chain it to the=
 previous
> comment, that the delays should default to 0. With defaults set,
> rx-internal-delay-ps and tx-internal-delay-ps become optional. I agree sc=
u is
> required.
>=20
> > Here I have one question.
> > In v3 patches series, if the ftgmac driver cannot find one of
> > tx-internal-delay-ps and rx-internal-delay-ps, it will return error in
> > probe stage.
> > If here is optional, does it means that just add warning and not
> > return error when lack one of them and use the default to configure?
> > Or not configure tx/rx delay just return success in probe stage?
>=20
> Once you add the default statement, it is clear what delay should be adde=
d if
> they property is not listed, 0. No warning is needed.
>=20
> What you should find in the end is that most boards just set the new
> compatible and 'rgmii-id', and need nothing else. Only badly designed boa=
rds
> tend to need tx-internal-delay-ps and rx-internal-delay-ps.
>=20

Thanks for the clarification and detailed explanation.

In the next version, I'll mark "aspeed,ast2600-mac" as deprecated and conti=
nue=20
using "aspeed,ast2600-mac01" and "aspeed,ast2600-mac23".
I'll also add the default delay values for tx/rx-internal-delay-ps.

In the driver, if those properties are missing, it will use the default val=
ues for configuration.
Additionally, I'll treat aspeed-ast2600-evb.dts as a new board using the ne=
w
compatible and 'rgmii-id'.

Thanks again for your helpful feedback.

Thanks,
Jacky


