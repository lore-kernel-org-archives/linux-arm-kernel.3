Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1967CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiFgGOiGzonfYR2R2W4ruskD2Dc+rwWef/8Nlv6mRzM=; b=116tdgTwAFP0mhkYiMuthUTD2X
	bhd8+/vGHqH4MEO0ksjbz5nWgmYfTA8++oOfRzMtLrjItd/ubJNBclqO6/qKetHr4dF/D/QHY9wXy
	ZguMKik6/G6SldnJYR4RezZLEK7BwLNo55PAGNdP3amM4FV72fJ/PxmOgc003xEt4LOyruhLWhFCh
	VMDNbiRGeTzzJIbMip+psj5h7fDPMa7OcJWv9qd+Ew92KZyOXo1601N2nSlgZ3Yr/zALya/0gjdSj
	x8W/QKy3M+vkpjhDIISKlynTRhel4Be9ypo4Tkd2L0cq5bYAyz1QuuyIBd/mRQEr5KHJhJJHStkmd
	UKqapzDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYBY-0000000BtJC-0nXv;
	Mon, 24 Nov 2025 15:09:00 +0000
Received: from mail-westeuropeazon11013028.outbound.protection.outlook.com ([52.101.72.28] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYBW-0000000BtIM-0UJH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:08:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9gamuQ+HKC2ZvDQQM7B35A8rHN6qSk3diqxHhxQcTHKlHlzM6qRfy1ffzyJZnCMXlqYtWmw710HGjaLsk25gFwHiiZmRjJj/2x8fxac/lr1TX6QaVpJDYTyIEd3wvLnQJC5BBnh5Ku2jw3cyGEPTLzPpOfHj615tWJ/lPS7SrThNRby/i6GdJEEjJs3mrvCVVBR8S9DRA+ge+TGVVKRI1MSsnVWHrANBLvQ8XmVg4S8JU/3lLIkZkX1h1I3SE4msbltCjdKK/uA1M/cc7cnL+1vCfFFImpIdOZgq7p4wtxlaGQIqxrsxKZ/dg4l+82mKS3Ujr0VeIDvCoi8UrlKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiFgGOiGzonfYR2R2W4ruskD2Dc+rwWef/8Nlv6mRzM=;
 b=EQpXxcUM/F9Y3SBf8iDoUg3LwIDbAWsDLxyHbBhCo+ZllsIMfjZDrmPTfzcgS8wyaLPgyMswiT9MTmM4Kj4/5xMXiMrA8oBteHNjhTwartfANClYZYcswOZn9Z/upjD0+7SZEnojNEQv3Q2G0kCyrIDjBM5TbxZaHbskT+jC6NHHdR8GmDdfGuNbh0X19KKx2eZBoTDxme3oBpWM5GdGe+mrcFS72X1vFNCwnABBGX1LyvwdKgmTdsewQVZ2IoQ+Fc55I90aYi07Yt4p3SPdEkas5xGTbmMl7S9iKsoQP19AoEDwh/jqyK6WNVtZfxbRWFWdU7GK9ijh/wKS2JLJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiFgGOiGzonfYR2R2W4ruskD2Dc+rwWef/8Nlv6mRzM=;
 b=SkWR7rTyllxVHw3rFnS4BVa3KwTOyFX2oLf1npFy3geKOKPjZrK36u4ubwXULAkB+sOSVlIe2K5DJY9frCOkect3Ia/Ed4BT6GW8mmcd8B8JTRwT1ZRT4xfwJMEGPpqGBp+qjRcf3oT3OvRsBmVGHANmiGveVllB0JqdomA8AhjymW6odqUYEZpooWU8hqb0rx7PYE1BelFHJr9Gzr1NZ3pp5QRI/APkS9cnV/MKxDonCp8JYOK7gDzN2LsGx+ghzVr6hacUMQb9gjFN0u8zdAwufWE3oQwaUjAp7bwA9/a6781hevHO3xyn9zRzWYR84PozNuOfW7ADqv3uK37zTQ==
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7)
 by PR3PR04MB7276.eurprd04.prod.outlook.com (2603:10a6:102:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 15:08:54 +0000
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a]) by DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 15:08:54 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "dongas86@gmail.com"
	<dongas86@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, Frank Li
	<frank.li@nxp.com>, "kernel@dh-electronics.com" <kernel@dh-electronics.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux@ew.tq-group.com"
	<linux@ew.tq-group.com>
Subject: RE: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
 according to Rev.D RM
Thread-Topic: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
 according to Rev.D RM
Thread-Index: AQHcXShvkeNcu2VmTUKLRIhokyBnebUBu3KAgAAXeFCAAAZ3gIAADvuA
Date: Mon, 24 Nov 2025 15:08:53 +0000
Message-ID: <DU0PR04MB9299811B113C555FD795FDC280D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
References: <20251124095449.4027676-1-aisheng.dong@nxp.com>
 <5432a356-7694-46a5-966b-29257f37a8f5@pengutronix.de>
 <DU0PR04MB929990AF168DA048D26E993480D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
 <18901222-fa5a-4e5e-91c9-f252d6bf1a18@pengutronix.de>
In-Reply-To: <18901222-fa5a-4e5e-91c9-f252d6bf1a18@pengutronix.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9299:EE_|PR3PR04MB7276:EE_
x-ms-office365-filtering-correlation-id: dc6dbfc8-9bd2-4396-091e-08de2b6b620c
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?feQu/ZR0hzgXAGbxsiXusO0/D0x8USOtKdeT1ivRJV+meuslUPkDTK+fVHw2?=
 =?us-ascii?Q?rtbOpQI0Hg7z3E/dL/wF08tQgkj+BAPMoWDx5w+F4bt70TVZ9S66eG+6WYuO?=
 =?us-ascii?Q?Qv2auutUUZsjdUf13DQjxgcTS2YIvogrnEoh+Q1LieQEaAQuBDmuR1Sw0MP5?=
 =?us-ascii?Q?cIgl8yj7TaHeZf3TEfrk7RpM3yiHnfXaX9WyNKxkuvHplnWkAY05JxNQNa6v?=
 =?us-ascii?Q?ntAM+/ZPAZD58zn51wH/JDtYFckx/Lvl3+94Boc8EUmbWFZx4MDckatkvfF+?=
 =?us-ascii?Q?goO+I2TNlJdNU0vImME4mZ6QEaHx3dbIgMLfgVYC/r2I7ToHzmjtNQcZPwYO?=
 =?us-ascii?Q?HoNZGDhPPG7yzCLXhzP3V9hDOtS/ebvXFH2y6AASqRibw+t9j5HWUtelh4sF?=
 =?us-ascii?Q?U93NggiTa7KFXFzvYnlrScYUNClTp7k2D/41FEzmBa+q34JXWvOk9yeKFHMd?=
 =?us-ascii?Q?Gv2yaV8SnitBsdB7F2s67Ne/3YvfoUrEc8rx3qBPuPgIMQ5TDJfrBcl7iP7B?=
 =?us-ascii?Q?BEBQ4U/Ig5ry61IO5AvAYGI1SUVy/NPfOQPAP/QZ2LQMZMUtnum4U6DW6jGW?=
 =?us-ascii?Q?YPslyCUud0AkoE3XJfnn9r4sZEtckwGB3GHaayHWXMd/tUgfvAFT7g15OvlL?=
 =?us-ascii?Q?rEdE2FoUAWsjyz7c6RBceR7s0VKAfXvHvcte6xnzi6KqBMPsjHRp+bzO7l5h?=
 =?us-ascii?Q?gi7UG+86lTdrDX+MUhCiYcAfwEx4bsHsc/snkgUQWKcS1y+FkvHlQ1GNQN+9?=
 =?us-ascii?Q?t3LGq79iZVQosOKCrOSk2BzRHzvg9Rq1rr8M32f3rud2Kv5nP/mevhgxyXCP?=
 =?us-ascii?Q?TlUCHgFdlB8+TnyWcWGa0Bs3OOwHM6qoVhgGyFlnckGyXrBgeuNS7qT0A0BP?=
 =?us-ascii?Q?JpPWgdZ0b+Olld1PieudFFnmjACugDlOzTJ4RHeVdBdzMsHvNIGVg8Hdxle7?=
 =?us-ascii?Q?fVSYSQiiqnr8XOHbqFmyje8FjbkVaPRFtgfmR880wA41ZkKZ2kgrTaoJLf2v?=
 =?us-ascii?Q?FW9M9GzfDzva5VkkBv+9AHt4KJUpOZ04KKcDjcxH219Vg0sk4lDElHodkfNN?=
 =?us-ascii?Q?G6N4esXMxSMiIHhyeMXoT96pr9KtCoGxinwDkMv3+c46vqQwz7RavMpY0o0s?=
 =?us-ascii?Q?ScEUdPGfVI/dL6PgHkQydyZagH9W23KNGtaPARV2e/kghjkQnUN5XhxlbzyD?=
 =?us-ascii?Q?rdKJjDqjAFhGZ53nHyN/KnyuEnD3LHFG9YebQmIBvjHvJ8nHH75tG55nf1is?=
 =?us-ascii?Q?GMtwyORxlZIIH3fjlxdKRTU1ImLKLssci82N2WbbuDkw2oGNmReOVRX7X31z?=
 =?us-ascii?Q?qS2CAahxOHuDIqbl8hWA4pGYe9UzBur3aDUCaue7+36MMyyeks20aI5DRR3m?=
 =?us-ascii?Q?AJkC8CgXsZEBRCbHNkE70islzDFE9fUZKZ/vD+9Mr94vW6trtrP0ti7G57qv?=
 =?us-ascii?Q?0SydPMd931xFe0qPwcs0TG3Kl+XkZ7eBzFwJ2kLPGWUiGVk5ytS8vAnH4/B6?=
 =?us-ascii?Q?zsP0CWz7zGprxSoHsdpYPDlrOXkNtT9Z7u4+?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9299.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+QsvnL2NSjpxPMvfIBcnKvxWyTpagaivDoJT4XGfiY7BRwj9UzeRRkLPHiXU?=
 =?us-ascii?Q?g/UdzanPLDvW5VbLtMTVeTyZvEbnP8STHC49HUMF1I/Z/Ko5f0n8CB9CmuNv?=
 =?us-ascii?Q?3+T9Al76fjp7Y79YLQ8NM++BQfEi1GEzKnOAl/d8ZAyZJNwbu9sZdZYH+xYk?=
 =?us-ascii?Q?u/MWoTaYBdi07XGEsHrlcxZz+fI1Uvdw7j2hvAYxSvyQdoB00HP4p0Mkgdrt?=
 =?us-ascii?Q?bLA4UixawtfUyf21qBgSRfJFwP7ks6IeN7ilaRnfjxxfn8Xk3LYFM4LVQtNA?=
 =?us-ascii?Q?hOrau6BVX8qemiRmTHTervHbjWvihnDXAVLoCD6hpv65GE4STDtsyOehBKPz?=
 =?us-ascii?Q?qwOLMlbiVzl/vYLQg5KxT5h+pAQq9l81EPTNk6r+gOfVoIZPGFdQh5VUIpIz?=
 =?us-ascii?Q?CX8aM+wOfaTYHFnWvGBaXZnywGjTgjug6pAoh1thyDtK7hzf7/4FQV4q0tBS?=
 =?us-ascii?Q?33kgn+E6wKgnlkO225xZs8Hbp2tK1e7Oo9ZkT4jncCzozgjwO3i4O9QkBTyc?=
 =?us-ascii?Q?b6fA2sEalcPLpMeFvD4aPNTZiKBe/6RX8u39ym8Ts2o9XOrjOciBPS3ZGQRp?=
 =?us-ascii?Q?GaOfnHkcm9T5ntlW1QgtB2K6ves1sIa5E8lTYME/WbweBrHMCXnBCdgLHnnU?=
 =?us-ascii?Q?dvCUPK0vH/pnOgAup4jYwk8yhJc3AodRVRn9ieyXJFqM+aD+RYOKA1Mbx51n?=
 =?us-ascii?Q?EgX5TUwrWhoX2naZ5eA238dUbD6w1bkb4FWa0NaLOaKj/XylOSHA0sWuYtcS?=
 =?us-ascii?Q?4ev7lVY7vFVN1HOYriOhI5gUz9SqiWigOsCRp95LzbcO95Zo0u4W4w/1Iif/?=
 =?us-ascii?Q?UPtZTMTAXQ2MROKhM1JhDvyWiF2VxAbbaCJyFE2iNG0ZkTRP+r/vrJYbn987?=
 =?us-ascii?Q?3537sVOIwZo0AQ9wJxVgRdK1oISQ5Z18CzCxX6SPOz4Uxr3HNril+2CMl8ow?=
 =?us-ascii?Q?1cEvW9fDJnKqDm5Fby/3pikR2yg7Z9dzG/L9po9K0p9O2h/m82ZncwXAFdFN?=
 =?us-ascii?Q?tOSit2CZz+Kp3N37G/UgLsVaY4W19kgzSgLkGJ00+RakPE3gSkO44Wy3fg6m?=
 =?us-ascii?Q?WkYQLLDe3p4cl97r8W/MFSO+R6C271VYx0BxeYBuD09JkHDpvBNuMeagS4Dq?=
 =?us-ascii?Q?1SOvOu9/A/3KpzQKtyofoIIMxqLOa0cepBtgieMigvTXmyzSeVKsxAYp+/gB?=
 =?us-ascii?Q?QswYUk+a+3NCtfM0xW3e0xLLwsqbu+EcuSbCFRZsVwE9KN4y3nGVaN2N2Ij+?=
 =?us-ascii?Q?wiqvUjNUMl/8IzeOal+1XJuBUlPJCibGVnwnN70/0tcsKdQklYQVazkXFcYb?=
 =?us-ascii?Q?+zNYkFt2zcCcEnfshCo6oyl8e/6Er+YTKjfG+sCkhBhBRXEu88mmKebr5hcm?=
 =?us-ascii?Q?XU3PS+vocT37Tb5W3hKPIe+RelqJWNduwnHu+VN0/2WutnmhLDISM5qmIjcT?=
 =?us-ascii?Q?j50sxQWDh5/GIwcpZFji1NEvSVZDLtz2PwB0Qgv1hZdIszCH9h8hgZreP7sg?=
 =?us-ascii?Q?oW+hSbGyIqKvmUZSgD/qfb0+9ekkDZ1+J5aWqjuPHUn6oCqIhiOOGXgQTXOi?=
 =?us-ascii?Q?axXOtTEcEEH3Cf4/GfhzMufyPx782SBoQ7/5T1IG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9299.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6dbfc8-9bd2-4396-091e-08de2b6b620c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 15:08:53.8524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLVyc2GTPrFrGUByu1QF3BpbAmiJos2LsnyMzp5bBhq9yE3PkdjSk8aXJ8hoMiNQMc3qCD7UYInuHHa1JlSRcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_070858_200937_601F408D 
X-CRM114-Status: GOOD (  21.43  )
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

> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Sent: Monday, November 24, 2025 9:54 PM
>=20
> Hi,
>=20
> On 11/24/25 2:39 PM, Aisheng Dong wrote:
> >> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> >> Sent: Monday, November 24, 2025 8:07 PM
> >> Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
> >> according to Rev.D RM
> >>
> >> Hi,
> >>
> >> On 11/24/25 10:54 AM, Dong Aisheng wrote:
> >>> From: Anson Huang <Anson.Huang@nxp.com>
> >>>
> >>> Update i.MX8MP imx8mp-pinfunc.h file according to reference manual
> >> Rev.D.
> >>>
> >>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> >>> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> >>
> >> At the very least, we should keep around the old defines.
> >>
> >
> > Could you help elaborate a bit more why need keep the old defines as I
> > saw the previous update patch also didn't keep them?
>=20
> Which previous update patch do you refer to?
>=20

I mean this patch:

commit bcf7206fe9c35e048e1dc90cf62216b0f5eaf091
Author: Anson Huang <Anson.Huang@nxp.com>
Date:   Fri Aug 14 17:27:19 2020 +0800

    arm64: dts: imx8mp: Update pinfunc header file

    Update some pins' name and adjust pin options to i.MX8MP pinfunc
    header file according to latest reference manual.

    Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
    Signed-off-by: Shawn Guo <shawnguo@kernel.org>

> Generally, If the defines are wrong or misleading, I am all for renaming =
them.
>=20
> In this case, NXP changed their mind and renamed the function in an
> (unreleased)) reference manual.

This is not accurate. The RM with updated names has been released.

>=20
> The tradeoff here is between:
>=20
> - amount of confusion avoided when we rename USB_OTG to USB
> - amount of overhead introduced to adapt device trees
>=20
> I think the benefit of the rename is marginal at best and not worth the
> unnecessary breakage it would impose on countless downstream users with
> out-of-tree board device trees.

I agree the benefit of USB renaming may be arguable.
But how about the remain changes (drop invalid defines and adding new ones)=
?
Are they still need to be fixed?

Regards
Aisheng

