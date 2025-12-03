Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1E9D1268C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 01:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycIoHANqAWc6reNSkKjt04uPrxEmcz2MrJYvCtA3EN4=; b=daFj7Ysv5k3nMjS8/Ev4Z2zMlD
	swLkWKEEiRCJDqSMV2mIUqaC2Llf8LZP13v8TN2ScuV2kfiQeb+/bErOPhmBJz9Af4XdRL8UPBLxF
	EqbG1E2g+7ZifVKcim50Wsv0/OgUOigpIC0BmhxxyUoMM8QRUHq99WQ0JkrAyeqw+UsevFv1PV1EY
	/zFC7+f0yKMItTfviBHGmc1QLzOI/sDlrTz/rl3KZ1BBBRrZa2u0eD93AHekvdGCHxQpfLcRDGKNT
	iWjpRlKjRzviYxgKXydC86dHF/jWW33S4TeczDa0ym2VjKnniRaZUnVK8EYnWFfZXYmdDPAjwK4b/
	1cqc1ocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbyY-000000060tm-0rUU;
	Wed, 03 Dec 2025 01:48:14 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbyV-000000060sx-20A3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 01:48:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPtGzbOqMrt2pWVr5DA6B4XAJN3Pw2GXc+Qk6DhjKqIBOE7Tf7zV7Vh7nWDT0LTyFOq4Vv6HcaPx1dUXxBlYgWLLBw7MJloxDXTS/9aXtnR+PjMUqoKMXGG0OEFmTmaF4b1y7bUzaUfkvv16yn63pVBe1Ml6/m1oMvlmPDHZYYTYzzQWlQ0iEvdk+dHJ78hEXrESNmOA5a4ZyZRTAACfzeaHsJ2vEKyBtb4wQLp4IFqxux3bd8rvJwwUl2OAC3741wdJymvABEqbMIyfKJ6wGqd2TG0tOnz1owKtVoSjNX3SYVW+wRzNAmeWmqdoLRJeD4eCCKLH1mwbAvPwQfy0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycIoHANqAWc6reNSkKjt04uPrxEmcz2MrJYvCtA3EN4=;
 b=SO0qmuTH1DmBKlFc7sbWxYe4cCvrUcKUd43tah5roGZAgTqTUZVk0T0OQ1RJzIag1dLpeFtTw0HeAS/u/GpN+TT4DK3/D78JKC/aepVnv8VcH2kEe+H1jhZcsoGpyQiS4GdDcIwvKFuD6GX4eniC3ReZdPs0uaJ75DgmQTN5XjuXALfxoht0o7E20YTqAEuFgz2egIOlfCqnhkb/HAcNCt23CbYhzc3WAngo5L9jysajfodCQYnQw7CkoSB0FYJjXik0nc20CTIUiCcSovYkRmNJA0m/AZ/6ovJ/JlIbHuEHLYtYZINC2HjKED5qt3UHRy//A0ltFvtv9GjlVumz5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycIoHANqAWc6reNSkKjt04uPrxEmcz2MrJYvCtA3EN4=;
 b=JBHHu0U1rm19+cDKJJucZaciQh/L2ibQ9/Wy6bhdeFweuKcGhtslw6bBfc90GP4BDnxeULDI5uJOD6KUYu91NPANC2JDUmmB22khCjTi0zzuGJKCDcA/He+NgiuYshLJ756Dc0D6SUk5oTy3nk0N9TLrmxu4YMxW446sL9tWDx4TcAbVYyCvii+9DrauwOX1J5+z0UKo1TjF33HuUwcqbbPuo9hfWMpDAE8rUUH0RElRN5DLH2NPSB8JMf73/GAXfbRVgBAZmFG+34wrNVxDdwuykitO1GMRFx2EWeK4Ku/bsbZsHKjeJGfjp8iAq7NPcXHmqucZKMArZPO2Gkp8IA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB8381.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 01:48:07 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%3]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 01:48:06 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>, Alexander Stein
	<alexander.stein@ew.tq-group.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] arm64: dts: imx8qm-ss-dma: correct the dma channels of
 lpuart
Thread-Topic: [PATCH] arm64: dts: imx8qm-ss-dma: correct the dma channels of
 lpuart
Thread-Index: AQHcY30pDC9u9LkrLUePkA/s772XarUOPBuAgAAyZACAALgf4A==
Date: Wed, 3 Dec 2025 01:48:06 +0000
Message-ID: <VI0PR04MB12114DF96354253F961BAD66D92D9A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20251202111638.3553-1-sherry.sun@nxp.com>
 <2395053.ElGaqSPkdT@steina-w> <aS78RJQAJDf6iU6X@lizhi-Precision-Tower-5810>
In-Reply-To: <aS78RJQAJDf6iU6X@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AM9PR04MB8381:EE_
x-ms-office365-filtering-correlation-id: 29135c9c-d83a-41b1-a896-08de320e014c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?qsej0OlDS8SAAlA6OuaruZa4YM3UfR4WBpvACYZnE+PIcwA9bZbyw6rnFU?=
 =?iso-8859-1?Q?RNAgwGXChpw7qPdJ5TAz12119oSZ/o61ytQqx0SuPS9kFrbjum+RP280if?=
 =?iso-8859-1?Q?Xpt7glM4QqGm9qSJmcYth0Cg0O061lHhZ6GV1Eu+U7Qk/MzgNsaUHScQk/?=
 =?iso-8859-1?Q?vGa6GTYpl18puQFy9Rebmsig/fzUPiRqFZ7lX1ll2V7CYTW9XyaTVhTn5D?=
 =?iso-8859-1?Q?S96xyESlOLJxJfVdZkOr2pBB0tcZ5cO5w1MlAPl1n7TlaOjkNA4XNoVdqb?=
 =?iso-8859-1?Q?VG6Kx7xN06CEeHaXBY1qTBDMquNVephlo/LlzCScEyg8Z/fKmSe6EIgAes?=
 =?iso-8859-1?Q?FjAD/1V0eSQoyEbYUWJ1oOTyK/UIAptJF7vfIEH9TDuEKggItvo2NExnDo?=
 =?iso-8859-1?Q?Kh3XKUmdGXmzhgVPJ1Cct1xgdYHU46KxANoqSey74uimr+E+UxT5W97Sfq?=
 =?iso-8859-1?Q?qC6Ug5FHgA32pOXP3FoaRj2kgwbnTUD7UCNN527kC4mI/KlPKG5s6zutaG?=
 =?iso-8859-1?Q?HsxfBbdckLjpIUzrLtRALt1qApCI1KZTbTSDTCRmWhiNP10fcFBLbM/hkz?=
 =?iso-8859-1?Q?Q9dmDec2Amn2HbIctC7pZQznkILqwhPGM7l0wxqmkKjx33OsVSOR/Uksu7?=
 =?iso-8859-1?Q?xHgVSx9t+qIJLlNJv7d+5VOQWq8bOM5obERMlO5ly7BkM5uDwqNwaZmECU?=
 =?iso-8859-1?Q?QuLWSb5a7mVrdUMXXl4TRgCAn5t08FYEn2SjvZMisUir2O6aPHsoDUyQhp?=
 =?iso-8859-1?Q?xB0+fe+1hNDmXMaqOCTZChOtJVcIwjBAVlA50F0opvWpevj1scI72jloJQ?=
 =?iso-8859-1?Q?7IlWc9QkW80JthHM8ux3+dyELiGxKDPT9tUSjw5d/qujZUvLpfTTc7Mctd?=
 =?iso-8859-1?Q?OWUsoUZw4IxL+RtMfJHnXGFIKBk0y9BJp7IcQPhY7j3MpC6REt26viyLzi?=
 =?iso-8859-1?Q?SvPaOhOwGlR6iZL15JrU3DaUDXnrtztHGVh34jCkBS4hHpK4pKvCgu/goa?=
 =?iso-8859-1?Q?UDVD+dUNsv0w/K0kmD53Jd3uqlUOgnfQpfwIx7Wg73h2F7nrGTTvcSkjB/?=
 =?iso-8859-1?Q?/Bqm4Z8qx+/lHVZjQbewzp/kNtvYOWlpZH7qiT3JcxdSoBH1Jt+cOH0hO2?=
 =?iso-8859-1?Q?34IkxtLFmmCqSpyiuYWvPvwHXECudbcdlA60S2/3bgKCE+0XHKYQlduOXK?=
 =?iso-8859-1?Q?18N9El9QZyMNPrFXJe9K2b41UbVChX1aI+9137la4r5qrCxE/K4TeZy9mz?=
 =?iso-8859-1?Q?9rH7ymGJrxpZ1QWapkNZGkPBeXfROnpOzPMjbtHK/JnId5ThOV8AXJhA8F?=
 =?iso-8859-1?Q?Q2j+1CiMzxyi8SjDr28LiPjA7B6924uyFLuPH1MGTWFFiiLrn2CDgItKTo?=
 =?iso-8859-1?Q?H+6NL2/b/UXi5zZuGqAMRzFC3Y5DbRWZA/RdSmBoCRRsCUP0sLGsKO6aJ3?=
 =?iso-8859-1?Q?CL67Zr9ylIL3mkkhDu06bKzq3vJvRWO7eEbM89ujGwbDlkSwrPKC6X8HP+?=
 =?iso-8859-1?Q?2+B8in9t5MlrYttpQwO1Ef?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3EZuGloHzmWZhSFIqMmM4C7cPJV34ur6VUTZljKLyD+yzE1MuQFlumkMES?=
 =?iso-8859-1?Q?7j5QYbNphC9XXdCevRTnSrwaK72qqGcQWorMKz1zaMwIfLIaKuVYRXKHG5?=
 =?iso-8859-1?Q?2eurmw6taufQDf6TQSQESZoMCMh1tEd6hLINVLkElTfNxIfkqksahHAC2V?=
 =?iso-8859-1?Q?AvuA64BuuNdK3u+tJsHviemtH+giC5RwyLbBUAED8NTFxMlw/+ffJcAoBZ?=
 =?iso-8859-1?Q?uz8GbQMMMLWr33yCjMTEt8N8TpWgJkrTzs9Tn5ymVttaMlY/wGvaMU/FZQ?=
 =?iso-8859-1?Q?xpVeO1RKhCl5WBfKbHkg9W0e4Z/GWALK4UkTQ89uajEaPks3T1lOw7ZnKS?=
 =?iso-8859-1?Q?OLwK6Pa/C005SXuF52dywC99z2KuJBk8LJm4gZFZFcJd/d9DkQZ/SOIGq1?=
 =?iso-8859-1?Q?uu9sxnb0QACjdvDwfyujzYVPSBbb3nqDsdKYydgB62v8j3t+44U/+cg6Jo?=
 =?iso-8859-1?Q?RkVvIpMBhEznZVYEl5ana0zeE8/1GQRHvjqi8IjFi32jEtrePxWv9b12v6?=
 =?iso-8859-1?Q?1y6ahL/gh7o95gzkYFMKxkSV3a/kQht3rN6vPwvYZzYajKOd2e1T82/K2j?=
 =?iso-8859-1?Q?9RTG3+uRBUi6K/bVmnFKFpWZ6lAkVpVx8jcKFk4SaQw6QC8CNRRD9pO5px?=
 =?iso-8859-1?Q?LFslGSUq6JvbeGGlOieQrU/s/CSjTCq5SRSF2iUDHoVrETESS7QSxXcOLo?=
 =?iso-8859-1?Q?SL3ca9HJ9vsB3oGo/KN4sOJ5Q3R2pg1BTKwQNEEOFlBOVzbipvtUlSp4np?=
 =?iso-8859-1?Q?cBB0k+VNYIqc22o4P+36KMfTt/By1XUOI7eCqm3pqBcCkeyuY34NDSLEUQ?=
 =?iso-8859-1?Q?u/FtI0ZAgEXAB+DgW20ID3uyOCa3V6/DuqvGrBLjLcseR12+rDHXMLiMaG?=
 =?iso-8859-1?Q?Q5jQSiXSa9pMMUoyBPfczqxvYcrU1ziCdf3W5YFlYIfhfQebc8O/CVjurj?=
 =?iso-8859-1?Q?IHwelimAemHTRoOf64wKfdbaCAt+/LamUb33ovGPATF4cfCxDt23nzN8df?=
 =?iso-8859-1?Q?VEjmZnLhjLzaLvJQIZp7FK2GMS6gjz8KIi22IlAYijT2QwwdSfd4Fd+1fK?=
 =?iso-8859-1?Q?9JFDzH8a+uaFThnJsiOyXJ0kxOs0hdMrPYr9dzH4Wjk0+suOdT5PL+A6R4?=
 =?iso-8859-1?Q?XbDWAy9ZRl+/jZHGdeTjKlrQTPKQOHXe6wF7mOun20Hy5n6qCmpQakxx4q?=
 =?iso-8859-1?Q?kmBcVPNUZk3GgmwFiMFQmDMykDVVdlKI37JzrbwHXB80IPN0XZrNm+r0we?=
 =?iso-8859-1?Q?LchXhP1QHKRVYI+4AgWK5J1HDxl2hzU9yNYB6fmKnjiMeosvSz/48ZNu7i?=
 =?iso-8859-1?Q?0/zKcyLcSHsTnRH3BberNyt4J7h9AJWXxFmyBr4aXGmvmiAeX5Tha7EX9Z?=
 =?iso-8859-1?Q?x4KLQl9DHfhkt6B7QCSausy0E/CjJ9C4hbSSgVcUmVsgmPBzYNQqlcfzDU?=
 =?iso-8859-1?Q?yKifZyJOwE/9gyFSO7daUvitv0ebk0SUaox+Uf5Z7vZdqLYh/I6SUGuJtG?=
 =?iso-8859-1?Q?jiybI5/s6c2XiLSD8JUiLoqoBmAuYMbYBPRhbmrstmogevxV/mU0ENSDo1?=
 =?iso-8859-1?Q?eAh9VEr/hy+nmT/FTxkNULiASJMxoW892K4M1SXsMlaFQ0+aW/U7hiozEW?=
 =?iso-8859-1?Q?kCowDUJu/4rUw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29135c9c-d83a-41b1-a896-08de320e014c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 01:48:06.5722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9DyIt1inJ4kebkHVlI5EehLTXOXuNZWCa8Vkw4Eb5DljoSiJRkeYnXU1GCSIGaQ/VX/KNGSzlpJde17aL6O7BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_174811_538915_1CF74714 
X-CRM114-Status: GOOD (  25.94  )
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



> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Tuesday, December 2, 2025 10:49 PM
> To: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> Sherry Sun <sherry.sun@nxp.com>; devicetree@vger.kernel.org;
> kernel@pengutronix.de; linux-kernel@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH] arm64: dts: imx8qm-ss-dma: correct the dma channels
> of lpuart
>=20
> On Tue, Dec 02, 2025 at 12:48:15PM +0100, Alexander Stein wrote:
> > Hi,
> >
> > Am Dienstag, 2. Dezember 2025, 12:16:38 CET schrieb Sherry Sun:
> > > The commit 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel
> > > order") swap uart rx and tx channel at common imx8-ss-dma.dtsi. But
> > > miss update imx8qm-ss-dma.dtsi.
> > >
> > > The commit 5a8e9b022e569 ("arm64: dts: imx8qm-ss-dma: Pass lpuart
> > > dma-names") just simple add dma-names as binding doc requirement.
> > >
> > > Correct lpuart0 - lpuart3 dma rx and tx channels, and use defines
> > > for the FSL_EDMA_RX flag.
> > >
> > > Fixes: 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel
> > > order")
> >
> > I'm wondering if this is actually a fix for 5a8e9b022e569 ("arm64: dts:
> > imx8qm-ss-dma: Pass lpuart dma-names") instead. 616effc0272b5 just
> > focuses on the common parts. But I don't have a strong opinion here.
>=20
> Yes, it should be 5a8e9b022e569.

Sure, will update this in V2.

Best Regards
Sherry
>=20
> Frank
> >
> > Thanks and best regards,
> > Alexander
> >
> > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> > > index 5f24850bf322..974e193f8dcb 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> > > @@ -172,25 +172,25 @@ &flexcan3 {
> > >
> > >  &lpuart0 {
> > >  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> > > -	dmas =3D <&edma2 13 0 0>, <&edma2 12 0 1>;
> > > +	dmas =3D <&edma2 12 0 FSL_EDMA_RX>, <&edma2 13 0 0>;
> > >  	dma-names =3D "rx","tx";
> > >  };
> > >
> > >  &lpuart1 {
> > >  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> > > -	dmas =3D <&edma2 15 0 0>, <&edma2 14 0 1>;
> > > +	dmas =3D <&edma2 14 0 FSL_EDMA_RX>, <&edma2 15 0 0>;
> > >  	dma-names =3D "rx","tx";
> > >  };
> > >
> > >  &lpuart2 {
> > >  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> > > -	dmas =3D <&edma2 17 0 0>, <&edma2 16 0 1>;
> > > +	dmas =3D <&edma2 16 0 FSL_EDMA_RX>, <&edma2 17 0 0>;
> > >  	dma-names =3D "rx","tx";
> > >  };
> > >
> > >  &lpuart3 {
> > >  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> > > -	dmas =3D <&edma2 19 0 0>, <&edma2 18 0 1>;
> > > +	dmas =3D <&edma2 18 0 FSL_EDMA_RX>, <&edma2 19 0 0>;
> > >  	dma-names =3D "rx","tx";
> > >  };
> > >
> > >
> >
> >
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, German=
y
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneide=
r
> > http://www.tq-group.com/
> >
> >

