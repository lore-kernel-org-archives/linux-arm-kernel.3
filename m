Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC63C02192
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 00:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xV/IOQuHpZNwYd+fjOixvGNA4GaqiQtkuvDwt+WWR4=; b=E88yzOHMJ1p3tDpY9XQaUJBd+9
	G27ow2o3X8jdW+Zw1hwlPa0yh3zxOKAkt03QmTRiKYw5dWxT00GXxvyCbwAqCTjcG8QEJRRK6dFrS
	SPZu/o7MdQNsYXQrZ7G6MvsDYeFE5Vt9eHzTHgrCf0WBtUmXKfABqP7ptNMmjkiM6Ne50MkgN+moD
	qBT0Z5xTW2wosTC9ul7f7sbzw4QdSkyocZON99WE/UWfyNHGqFdnE9Ezvr4uSyc7b0z7dxhKKKWlp
	zWO9zV92WSmKDBr84cng3GbNmqzhfyCv5faqxjZ161QvFr4q+SyyAtEAo4OfmcDTCvIiT6ijevAJz
	o/Yo9/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf6t3-0000000Gy3F-2sZo;
	Tue, 04 Feb 2025 00:33:57 +0000
Received: from mail-am6eur05on2062a.outbound.protection.outlook.com ([2a01:111:f403:2612::62a] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf6rf-0000000Gxm6-2AJT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 00:32:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWHmclGX043663qOYiJySqJwT3Z8OjsrTjtR0tRDeOLXgaGYy6LpA5D1MF6SAZ0FLG2pN7dJZ8buj5uU1kyF8QJL581bGp/z0C2i1PMCEt0s8jql95HbAtq+4P6Vt9Q1t3Cz+hwjlxtHUS9iNhIB6EKdt5bAUZkUj4sqU7+3jOzGAe6oYyz0tpeNIhA/DgWgs8H+LiPhDSVAcP5hs/lgVcW6LGAfr3zRPRtZOKH/nNiCYWLu1Tantrw6D2jWhq5DCmUsdjGkGM7tG2crMzlBJKMytMcpVLqGYp1oLI/euIL6+KeBQvQqhYIvBNjjgSaOzJ5cTmTm5DvzR9/FUq6f1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xV/IOQuHpZNwYd+fjOixvGNA4GaqiQtkuvDwt+WWR4=;
 b=cwEovOqjnSv4g3nYQdLc3ojNcklAbKDJ1wkDCAdwQLG0HsluqPkgz8pkuVqL252mjAtaTqAFHdJvlQEcDkuaJw1rlhPW7ZQydf6ez1J/1M79stv/O9dqHhDTmZ9w/06eTHwsA0nwljm8iba/cB60NXAgaRYg1TWr127fLKS5SDKQBDlu4tWCX+evovyFnv1aGHFZPqtCeyc+eO54DLMlfdoBv/R6BwY2bklKLu+wu3q7FVds7LHL2W9OC8ZkzCCMaq/lVC/J9+91dtSiQMdT8aDPZVXDsyBUZmK25xHDc2M9C/tCbKSl646cM5bFxXo4VsRGhpAjB+EqsmNmVxBztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xV/IOQuHpZNwYd+fjOixvGNA4GaqiQtkuvDwt+WWR4=;
 b=agfste1pEu7JSRW509gWRmfGbBtGbPVPnfBBT0DRF0BrAkus49Cd/vAi08sGJTzJrohi96SCkFYqSdJQTdE4FtYen1f1EjiIzDDYWmHQqSlEWw8D6c8/xeYygTHH6YUGxO2aXowPPsKoJtkWGZl+AjMWI/Q43Be2jj92JXJ9Ep54md5cU/GpfzOEwtin8ZTGS/umhGErfcz8BMeU9bVXElxqXnTE7nS6phNTldGg0kjF/C84FYUa6lMpxr9zRJCjzuL9YklVjnr7tPKlH5ZlkxKjD/T9+eNcHxdGv5WwqrPB8q4hG30lm4glAO2TambjEVAbyBUOgCY86J5BWKjqbw==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PA2PR04MB10259.eurprd04.prod.outlook.com (2603:10a6:102:409::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 00:32:27 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%5]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 00:32:27 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: imx: fsl,aips-bus: Ensure all properties are
 defined
Thread-Topic: [PATCH] dt-bindings: imx: fsl,aips-bus: Ensure all properties
 are defined
Thread-Index: AQHbdoLdsiTmqE9IPkyXqrKqJ3HXibM2S2rA
Date: Tue, 4 Feb 2025 00:32:27 +0000
Message-ID: <DB9PR04MB846118E6883D79526C5C190388F42@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20250203213027.8284-1-robh@kernel.org>
In-Reply-To: <20250203213027.8284-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|PA2PR04MB10259:EE_
x-ms-office365-filtering-correlation-id: a88b9788-f960-4d8c-d77c-08dd44b36740
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?cS24rLGs7T2D2Rv5QRJVrOOyAllehz+29EMev8loifAx0qfH0alieO3jRcnb?=
 =?us-ascii?Q?fW5syvDamprHriUIXvU6+gZW6yBfApTNHS7Kqj5bk2xSYUo+pNK+xUp5wcix?=
 =?us-ascii?Q?TzUG9hi8EQkWdg6sAMQ7+Ur6B1aevlm6+Wcd3TUpxwUbviUnL0rMFiqXkozt?=
 =?us-ascii?Q?BGXN3NF/I7Pji/70GcdPSzgXfmzUpE14hUtyHMqnF9o38bRmFwM7cqB+OL3O?=
 =?us-ascii?Q?3vJvstEEw9foDmjL3jPvJOumbPoUYJgAeqSMpTl3A+EqfHLYrDjV8gCzo7jh?=
 =?us-ascii?Q?EfHuNSW+gZVGaboTEvoYmnrHJh6TZtNtW/d1fYvBMb4HgJB/stfNy3YlevFe?=
 =?us-ascii?Q?FTIM+871RiNX8R6BpCVAiEK0aEMB8Y7rbzrApqg2/N2ijW5YBjadmEDnWsz8?=
 =?us-ascii?Q?e1vzyuOsZXuAXV9wCkIGbmhU3JzmRekZpHQbeEyr+CuvPxxwzIIIJ0juCbHI?=
 =?us-ascii?Q?G6ME1pq3JVFs5OBpDYkjBsp9ZF4drGV/7wQwT7CCmCFi2IGew6ZK9RSrPVGt?=
 =?us-ascii?Q?tcDqBUG0HPeCiy/fSC2M3yIwnF0rfIpwXtbc9JHtlDhVqT2LqRUKI3EF73v+?=
 =?us-ascii?Q?/4jJPVbfTc8pITMB/pdxH2BGfiAE2C0q6gnNWrmVygE6S2DFX2BsCu5ITw3L?=
 =?us-ascii?Q?seh1QfAAa9t5g+hPoFrb7eOv61wdCY3fPX/peKZ8WqoVdb/gX8si1YGhEdhi?=
 =?us-ascii?Q?8UOHqJKjmJmCTF9TayyimSEaHSigvl/Pcfyj7LJvoxjm9et1+GAujyq9xZjC?=
 =?us-ascii?Q?5w74avurFofDiUp0OdOIG1T75TdwXd6P1Ayky16PHR+WQ/ScVBUXWAv9XbE2?=
 =?us-ascii?Q?ovKfouF2P/8KnKp6J2baBbOm3lajockiH+0rPXvCIq0Xl0VI7wMOwySS5IUq?=
 =?us-ascii?Q?8n2PTGKSGWHgz1I9hHSR1sFB1f0JVXeTYHrVrlUHDhRmtWPwR5+NfLQyJq3W?=
 =?us-ascii?Q?kPZ9kNAyqBBs6LJ//rRy/ghz/ziCiJsE1z+qBrOsuywtSmOyoD1kugLGZ5Y6?=
 =?us-ascii?Q?5Q+fiIC0q/rJoqsr+p4GCuNrQyxZLwAtKQjcrgNBiEW5AXXJIgpDMXYvywua?=
 =?us-ascii?Q?TZKl4NJGKAan3tDpmx0E3NaEmOyszy05U611kYMB9kZdYD/qFYZBeFapZwCH?=
 =?us-ascii?Q?ekJZ/JyaVOIndC0SJx8Qez3Ryt+yPy+yfoPCFftkMYYFmba281D+HA/ZYQA5?=
 =?us-ascii?Q?5C2AuEbwrtLFkKBPLU3L8w+/8OydsBbYHK7PVaA2TvrxhL37uDjdvWm4ag+v?=
 =?us-ascii?Q?X29q+y9Nk1Y9ueKzRLsCshxDVbYMP3II2domfOSPHnGOfSgA1jSrQIGMRaVL?=
 =?us-ascii?Q?NilqXxDP8SbMn1I2UkFYCs3b0DvehX4PT+aSw1PMhjmC0HaDjpLJbmKh3Qfu?=
 =?us-ascii?Q?gSoBfNVtznZCe1EHUZVqctswvvWaNRp7m7K17feKHmHdfPPt10nrK3Il11iU?=
 =?us-ascii?Q?T9v2TUdyUBA4XYTeIVe7U8ocAAAj/17U?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nbMLKwjKeVwuuw4qSxRMAUzffQazsvTGi2M8eM2tOZldx/l8m/JXZX9ES7YL?=
 =?us-ascii?Q?FOcnjwg21kML3yDNzZqGbaYpbILJoP5ct63BMBzyY6SSKl1tp4Stq9mt53sv?=
 =?us-ascii?Q?XhB5X6rLnD8GLnYAWYJcICQZNTSro37XscELMrc/o/7BbsHM1XN2SuPFhPlv?=
 =?us-ascii?Q?1jWRPi6lnkmAREzs8+C1Al+1bWCCCLdRTfm0w8wj1nAmZragRQ/ZWLazDxGY?=
 =?us-ascii?Q?dYNpJALLHO8tJEHTkr7aKpoI+Tl4xD69E4qH1k8+/c/3DRsapLWaaOuk38vw?=
 =?us-ascii?Q?NOgbVHgZ9Z9YSPP5pKYIZkB88Z5C93LaXkt6mLXrJznDPJG26aLG/Tp/oMJR?=
 =?us-ascii?Q?I66bjniU8hfi7pcQdvaUwMb6Te75vR6haOFqtie7i07IMgRiS60ZyH29R82g?=
 =?us-ascii?Q?3nOTMAgEtmICSQfDLcaTHe2tJX+oy1AVQhQTQV7fOlaBt4VofJRPEOwnNRUs?=
 =?us-ascii?Q?crwCdq/dfvRVS6cFhPWWpDXopkv6cW68JQ/qWlRio39H8gZ6dwxvZRRu4lje?=
 =?us-ascii?Q?KcCwnouX+2Un3rrVlAr8Kst/hFCfV2SxUDzCI8e7xhcd2BnXTEpb/ygBNB3B?=
 =?us-ascii?Q?cbTs+25E2ndywAUeUPcaBTX24yjQjnvWmrbe947WtEoZc96PlltRqaj4D5dT?=
 =?us-ascii?Q?u2QTslIXiktGuLxETC5nc7Z/GCMZbHa7TOi5h0CpmCMJgECxHLGj3S4Kydsl?=
 =?us-ascii?Q?PwaluOGKoraT1bDGTOmzk64ktMoH9MKWDD+7OS4a5z9zdOOV5sitluhzvp3O?=
 =?us-ascii?Q?jAQ3bRWfkZP1i8bHmIbJcr0z1Tx1iq4Tzhv6LZwm0RcxLr64FArCCBDAGlMf?=
 =?us-ascii?Q?oCmmafYvgPg0kRdA3DOpnyeHdJXhXIvYCEAy/v1c7CrO7uw39YLNyTZgQsxu?=
 =?us-ascii?Q?RQrQfiSqXtIl/0BqOFC+syKU46w2e+StB0UKcovhqzs5h1BL050t2oCQt9Hc?=
 =?us-ascii?Q?Lss26A0biXoSmlFvU2jmH1/UOJbng1tWvfTqaoymBdrkIocf+BlPQC4c29Zm?=
 =?us-ascii?Q?FmZuVAblQWIq/d1nVPLftlVhXsLT7Jjczh462zqkNibeNiogCHKZNDKiUwzd?=
 =?us-ascii?Q?nom6ZKTCeYs2oKxxPPO4B+6Xyxc/VCsdwP7dafOwqQuTqaQNbjsuza2U9AaP?=
 =?us-ascii?Q?3CY0r6H1Yf9bBR9pZc4150u84GUbGxlVQHwfPsJoFlN46jmL2wq9PaVvhCXR?=
 =?us-ascii?Q?in2nOzV5n9iToL6qNMOebp74nN9uTi2luneG8aDY17jV21R9iYSqsz0WyHYs?=
 =?us-ascii?Q?UDEAsHwzAO5MRRWSmkHmLHfmc4w9YpeyjLGiI9f+9s+C60Z8W+ozpOfUnZ2X?=
 =?us-ascii?Q?AiKrW3H/uSAlRtiHrPWmZKI7PS+esR3g3RdCMAwpDJ5ZOswkuZRFFWNDOctp?=
 =?us-ascii?Q?Y62Fc0lFpWuOFx6CqxYRk7lQeaH/zWcY6bb594uIqkvLGqdehwNn4qxSfaCs?=
 =?us-ascii?Q?OaIe1gEj66ffD+O9kXdZ1V528K1+eHaV8vHuHAXTWAGbCKgMB2k3oVfvN+AK?=
 =?us-ascii?Q?XIKHkujFqZky6pPLfOaferCGF6eVjE04lB/hFngFaemULP7tIO/rhAR+u12T?=
 =?us-ascii?Q?hhq9qlQntIEOHf3haNs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88b9788-f960-4d8c-d77c-08dd44b36740
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 00:32:27.8556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HApqgT5e6imoHRX0ZOgkew9cMz4atUg5HfHSFVr5Cbge2GBbM1YF8Vb5fgOoWyhVpYyl6GvbPbWxrFMB3p18TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_163231_560060_725DB1E4 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

> Subject: [PATCH] dt-bindings: imx: fsl,aips-bus: Ensure all properties ar=
e
> defined
>=20
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add a reference to simple-
> bus.yaml which has the additional properties used, and fix this
> constraint.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Peng Fan <peng.fan@nxp.com>


