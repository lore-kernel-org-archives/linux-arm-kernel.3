Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69E4CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 01:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EUV+aIPHF6Bk/VkaRup+hCAXO+khyiRsp9uhGk5l/A=; b=c0/5cucsXtUfORDwFWqXPAnZ7i
	ZzD7/cjINo+YaDEib39iOtYtIG6jYXak15NwBagWZOF80PYBL5xfbDIzKFX+xSry0+oJ8fHhXoi2a
	G21XkbXB8maj6tNO7O3ZPgOk8BbxaNZ5la0jkniFwjAcx59WZ1yUeRIsQIUSnT6GjxaBwFtiYo82m
	Qv57f1I0qYLjO/f0J+oFlKhkuHiYSEUItYL+vL/iux2IOnqKwkn/dxFYCKL0WIS/8LGOxEouYbT2K
	UNN3hfPxMiwEjhP3cQQn6IHO1MIu0qSlCq2cbN0DtGwcMbnOQan15+9OzfXy0LkLjvyq5MwK4x9fC
	z5RSe4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHB1Z-0000000GUO1-0aJc;
	Fri, 07 Nov 2025 01:12:21 +0000
Received: from mail-koreacentralazon11023073.outbound.protection.outlook.com ([40.107.44.73] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHB1W-0000000GUNg-2QOY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 01:12:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqnOHgJc9FKJJcQVyAfZvS/tBKgguMUjto4yDaXF9KmeBbilCRvmn9qqMBKJpXZTva6qPMFTfneQhrMDU9p5ij6cQ85+cV8Ts0a0q/vy9jFbMr9swDTIPMhAoL+4hihOYfeM6eaoOLoQicmhfBUUBY4w+c+NqZ4bX0sTfBJNU0UMZnVcolCpL7qCvo0bt5sjufQdKxXcYJwOYvglkVyllnP6S4UixC7uswLvmrcfuEh6azzM0RNoXbZZKhqquldgeuljoQiCv2642CMed9Ku9Rc3ZNzj/B3OXZelKSjVpFbozWTgfXFNVPECY/L+7X0V4hDdKYpa7WOFq91UreRneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EUV+aIPHF6Bk/VkaRup+hCAXO+khyiRsp9uhGk5l/A=;
 b=SFXn5LbgPzsZNLkDLFkFF6+gYw7mQ6E3vB88qsFP2oJxPsyC/fTZNr6OGo4z+FUd6MCEh8qxUDXe82Y7jw4YBM4xo7h7nAqDA38XDOOXPW7kJgiADNeER4nChKmgi1GodptjSM2lTqk3GhcWkvPBl19VdQs8/taKDlFkJ8d0uCPb0lC6t6KuGXM/GjxNbcvwfarv305WZep2fRkJskyghxMxXcH/uFTs/D3GfdyM88wuM0wm5QZto9uUllUp2w12bCmnXtE+By17lAL9Jb6RC9tcVrhhKSbm4VEaz3WZBsE2oe9qxFLSo8bsGR5cEYiY5RX05L5dpMVSRTpdqqO/sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EUV+aIPHF6Bk/VkaRup+hCAXO+khyiRsp9uhGk5l/A=;
 b=qJaE3ddx3a5woYIp5+E4PuRqRVWbuv1R0kuWxVnvm/KZuCMK4xx8qaml/XFw5X3R/5bnLPWm40lq44NXFdbYQry6cH5z5XLP1pjCfrzWMqEJcwCgzPl3etigQW7D10JX4Iv0G6O8KQ3/DEgk3JqunfuT2hd4j9KyBAkHFaKNZAoCGDLE9s9aaB8KqRkv+CBJCLpleUDEMlYBPbZpf2nuTpHJ6BDtikSmOtqerpUReDAxpkrmG/7Bt/DLA6UxKqoUm1PSwrQg7j5BKcGlaun0ER2jEAdzNX5p+NKQmhpJMgVUH2y4gJvzovvJ72OVVy0cN9DquUnAVLn1zreHFmi77w==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TYSPR06MB7158.apcprd06.prod.outlook.com (2603:1096:405:8c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 01:12:09 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 01:12:08 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Po-Yu Chuang
	<ratbert@faraday-tech.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "taoren@meta.com" <taoren@meta.com>
Subject: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Thread-Topic: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Thread-Index: AQHcTJUB+TmCwKSgIEaeQsrh+oaRd7TiLi+AgAAZOmCAAAUCAIAC1hMQgAAyMgCAAQXHkIAADFOAgAAHHhA=
Date: Fri, 7 Nov 2025 01:12:08 +0000
Message-ID: <SEYPR06MB5134F0CF51189317B94377C09DC3A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
 <20251104-victorious-crab-of-recreation-d10bf4@kuoka>
 <SEYPR06MB5134B91F5796311498D87BE29DC4A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <9ae116a5-ede1-427f-bdff-70f1a204a7d6@kernel.org>
 <SEYPR06MB5134004879B45343D135FC4B9DC2A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <1f3106e6-c49f-4fb3-9d5a-890229636bcd@kernel.org>
 <SEYPR06MB51346AEB8BF7C7FA057180CE9DC3A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <44776060-6e76-4112-8026-1fcd73be19b8@lunn.ch>
In-Reply-To: <44776060-6e76-4112-8026-1fcd73be19b8@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TYSPR06MB7158:EE_
x-ms-office365-filtering-correlation-id: 1b48de68-061e-45c0-193f-08de1d9aac65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?5CKdgwLCk3jPFljKfxbSOcFgF67hSyTQCkz6WieU7M3e2jq9gDp17EBT44bB?=
 =?us-ascii?Q?+m1JooaGlY7HwCtTs0BfzFhr/Syg/L6uAe2Jnet5RQ7bClDtCyQwNLrotSvF?=
 =?us-ascii?Q?CeFp5Z7h4aeF+qsVNVnk0mP5eZcd0mokIEGTj+D4MgeHJpgcVWawyx29qhY8?=
 =?us-ascii?Q?TviIDC13dFoNCPTmxZ7BDPR+Opvcm5a9XKpw2us2mq8eYlyDnX3DdUDCr38z?=
 =?us-ascii?Q?idlJ4Yh0P87khBy4HPugSymJr0pt2hEs3e7F3myJ2dqm98C4zZiVO6FSvzOJ?=
 =?us-ascii?Q?gKopr4rcZhEsFsx+Gu6/s7k4IU7ecl8fH/SL/ThbFJnTXeVherwWm4/Rvv8B?=
 =?us-ascii?Q?GAtfXxXa7nG5D+mORuA8qNG7YUwIEg9H25jSc6rqGHHey5HRLpXMfm1hIXB9?=
 =?us-ascii?Q?XnzJwxGqxgao6W5oGWQDrs24WAGdSOjC/ArIqQJKIt6ezHhikkQIIRHd5zv9?=
 =?us-ascii?Q?ImmkAVzCPNwfHnKstXff8fDo8DOPZR8EM3W95spOY2VCVqGNNU+hP0g5syrF?=
 =?us-ascii?Q?tpqSQN22RXJkGrU/fHaz8knsRp9ZZ1TSCwnRrCZ0eSvH09qpLgGQAn3/zOm9?=
 =?us-ascii?Q?gkR/onYDuqhNsI8G3IGAEaPBXnouctoX9p9AuDEp1/ovY1td402BL+gYRAKN?=
 =?us-ascii?Q?YtGsjOkVeLDXg5yBjPVG6jmox54EK6XhokXr4qrqSqWTbqNibChKY6ZaVlGa?=
 =?us-ascii?Q?gv/EY+TmjvDFlqSJfBWKGj722YyJxQBbarSWGsm6FSx6qbnt97pLJQoWky7a?=
 =?us-ascii?Q?lOhBIN4DQf4NqKwTOQj/X6zNzqcVvUxR+ucQOYsLHZ3saT1f8DniMBWe9j0r?=
 =?us-ascii?Q?3wlT7tm3B2e5cqVpSxCuQbo/lypebY53AoiFtAy5sKsYxS2dsydfAP8IEOrh?=
 =?us-ascii?Q?V6Ze3un2mvSEJk15c6fHYGR0RGZI0raNZrQAwElNfEIC6JoqaiKDGmiX+957?=
 =?us-ascii?Q?MMNGvP7Z+PRc73wDgBzhYM82AOaHmGRT3VKX3EpleGDP70H8AdN1Y0LvTngV?=
 =?us-ascii?Q?iyUcMskzxihFS2aMpXCwLaIWxeMMtfghFgstkxYyEKCrWZ0iGn+f2Q1K8PBt?=
 =?us-ascii?Q?iJFJe430bJE+xq9ylKE5eXWSRgjW28bOgdbQJ+49NVpdgxeExC6gquffY0Cz?=
 =?us-ascii?Q?hn/76u3ycFBVWSgGxfwj83V22I7hJfocAylzqOVuSo9DlEKTIdglYng24Qof?=
 =?us-ascii?Q?iGJRTvtvh5pbmivqFCrCD31tztwZUVrucN+t7+zDobh2sh7yZgEuzwm6ft8Q?=
 =?us-ascii?Q?SAGG/XOZEIafohfxt6CwfqC2s2l6/rwx4wpVt56kY1AoxLC3chwKNIIGWJ01?=
 =?us-ascii?Q?O6YVoZwyKqSBX3GoKny7soBYNfSmA3lizaEuc7HC7UdCxJPeFo9zf7XE0/L0?=
 =?us-ascii?Q?4yRfUtz/2ZyOvA3m7uHb7qX0Tjz++db9UZAblQQQ+RkcIDPmrR6wLM+GJ6Pm?=
 =?us-ascii?Q?FZoQJRJBtekY3KuYLhGNMNalbWjq/1RylyLAgwR232vUhP8ebA66KlpQJTDx?=
 =?us-ascii?Q?6DmfF6FWx4BpbL/CT3nGMsLhl6y6RX1Wu4W1?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RdUTMv4yn9h+1CDAybwi6+CkHO/c/k1sYx8KAKvuZI2GuaspbFfQaa7oFxm0?=
 =?us-ascii?Q?NWTsEVEBx+11BW5Qs2600xCP+RXDYTJhhDjx7UhVwVez9ShsJev2ATYi5Jei?=
 =?us-ascii?Q?8VV8p3vyKMdpbCE2BsgXfqeqQysaYutT93MZlpbR7XBI36WLbE8ctYt1ILns?=
 =?us-ascii?Q?9s7Zra+E9Hj53v5Und6nWnD5qjWHj1LFx5pIhl6YlTVBsFqVfNDnXMqHcjw0?=
 =?us-ascii?Q?TxoqQpm5t4lGV5VwNXfGXJ+5EgeFpcgQroQSdV2QsxR6zvp9zowgPtO79Umr?=
 =?us-ascii?Q?EPIJ97dwakh1DflhUtBP7hxyBMpdA+LBOrUaq1J+2Obvzrl+N/cmGrV2J9J3?=
 =?us-ascii?Q?2HrGKUBhV29DvuGkQru2K3H5iT+gyqNin0Xu2jXt2n431dEAYI+ARNvr0QmM?=
 =?us-ascii?Q?Z1VVtkNw+xRddl2wkcQ96vINPXILIikeSagwW2HTiiRXYGZIbh6TeggROa/h?=
 =?us-ascii?Q?pm3A3kHDTUtMCk39AIhbt5CBPN2sRvNpjia/zOxVzo9G+vLNKuW6IpA3chTD?=
 =?us-ascii?Q?j9OwncNiQ8uca1TicRgHHdo+B6EUDZkojtQagcfOfIhYsx/JLpYCDdvJrOWQ?=
 =?us-ascii?Q?Q4DdksceRq8IaXTRY+Zhl4jmTdLonXZMvqnVqXGrAYDwX1OUokRRQcz7PVii?=
 =?us-ascii?Q?xQEoqcBZu28EFcxoKc0asXfDba5Uo/DRXSHduWDqu09dXuNh1wncpaNWbF+Z?=
 =?us-ascii?Q?RunFLal0CHHCk0cUcvdD1dSdFXsHa3eRTgIEyEju3AGeDsn8vsiJRtrpZu4C?=
 =?us-ascii?Q?BhGWU4WrorHU41TuFCL8H4joyqxkBpk3iiHkHhCF4DM1UksSiS+WBB6ezN1W?=
 =?us-ascii?Q?cf4muNd+787bYN607SCQOJQOEjiO2NRtv+BihyCG7XmpsPRdiL8IclC0SZuZ?=
 =?us-ascii?Q?SjhUjmg5olXSE0QhhdCXRFGRE6A4ucub6iH2qyUGIr6KmyxGgjYb5PadmklZ?=
 =?us-ascii?Q?1IoPdBFAwpMvNeNUIrS9z3NWf/IH48sRtvu4AXX3rJwFPh2sh99qGiDzb16A?=
 =?us-ascii?Q?aymKP7a/yfK243UcOIq8f1g58+DkkyOFZIqQ90CYAxWNoofGGa5d1kV5qQWe?=
 =?us-ascii?Q?fPw2qrOzAUGs0sG5en6eMRytQ2pBvESsb6yZ1Sc9UYpbPoDrdW0uS57iIqDW?=
 =?us-ascii?Q?qKqJIh4UyrBbF5dYvwZIZnHDRNI7n+IkGZIoGhOioc9DkEBgbE703WKP1YXa?=
 =?us-ascii?Q?fP0He31XDtkr7hdGs8Dlj7wgAmUjuCu8q5+BQWz66UXrx+4kcVVjexyEVjx3?=
 =?us-ascii?Q?hWvUEpwqmIWyLqyxLcngrXSl98YlhRJnqxHXX5v8PK1n8VdLafvYfW5udK5u?=
 =?us-ascii?Q?Gani7JXa+wtAzh4yPR3pZNGz8pdJgjqqDWpWaY9ujj2Zw/FB24CVJ11ib8bt?=
 =?us-ascii?Q?HYEpUgp66NkjTY+iC7WBfBEMT6mlWlU0sGsgKxa56B5aNFLdH/Ig4RHqMVKL?=
 =?us-ascii?Q?j/pTpO5BhICAaeTPIDseFdVh4RryIqjHh4XgDA1ZyMnGPtnqz/MLjVdpQsjk?=
 =?us-ascii?Q?oSMeBriaVv9e12ve0JpemHVcLXlF3Gvy8ZUhX/5xhDvtwzl87x37O8G47QDa?=
 =?us-ascii?Q?zk4N6ZcmmaeMQhiybO1EdcJbacapvpVKUzRVYG4M58lNAvt1hN4cqAglLWcR?=
 =?us-ascii?Q?lw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b48de68-061e-45c0-193f-08de1d9aac65
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 01:12:08.7037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fyVWJnNdjnaCYvBVJuJfKrJ0ikJhikTwY7LKLq9XSD2LrUgT6Fbh+0W2saZ7zQxr5vnLxPoHNvd4jH3eSoXFkfvz1ryvDlXWAN9LL/Equr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_171218_620377_6EDDE029 
X-CRM114-Status: GOOD (  16.16  )
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

Hi Andrew

> > There are four MACs in the AST2600. In the DT bindings and DTS files,
> > what would be the recommended way to identify which MAC is which?
> > In version 3 of my patches, I used the aliases in the DTSI file to
> > allow the driver to get the MAC index.
>=20
> It is a bit ugly, but you are working around broken behaviour, so sometim=
es you
> need to accept ugly. The addresses are fixed. You know
> 1e660000 is mac0, 1e680000 is mac1, etc. Put the addresses into the drive=
r,
> for compatible aspeed,ast2600-mac.
>=20

I used this fixed address as MAC index in the first version of this series.
But the other reviewer mentioned maybe there has the other better way to=20
identify index.
https://lore.kernel.org/all/20250317095229.6f8754dd@fedora.home/
I find the "aliase", on preparing the v2 and v3, I think it may be a way to
do that. But I am not sure.
So, I would like to confirm the other good way before submitting the next
version.

Thanks,
Jacky

