Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C9ECA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQm/mBCJ6lVeaoWzEDZQulJUpbOSNMV9lspJAheOEZU=; b=mezufDm858Eskx5D1oJAOj2gWe
	FTW31n4cx/TSEo59SUGOe1kE0TMvBh6QQL/FDMdw6Cyt23VhJOa+y3A+nKAcgGpPw0agU5PK37Ns5
	x2CvK9R2hmvcPKUsUB0gBT4Kj2bHCAp9pO8SZHmD33TntVS2szNQo9UqH4DjRlDeEIRRVUdKrhDKt
	0rLGNLm4hM8oYgKYi3vj6gmqYIAkmiY1UBxl0auWzuk+de3GhRHUa8tzabp2wCE9BLO5Rp+tMkiUk
	MJpXamA/f2+XhkJMNdzKXyp6JgZw7gV6wz2d2KB8EU4u4j2xaeLl8X/mdqMgUWsrFgggNgJGv97eM
	oLwe4fgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNbI-0000000GaGS-2nVK;
	Fri, 05 Sep 2025 03:59:00 +0000
Received: from mail-westeuropeazon11013066.outbound.protection.outlook.com ([52.101.72.66] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM37-0000000G1iQ-2zD4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 02:19:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLzD8fvrr7ncdx3mtl+hrDKhIJYlu8kruC1yvqmPWT8OqU0eEGlvwhIL/qde7VOltK2eWkBTTusk6A9xChBtahaDrWhyQCENMxTuTN5glcjzvtLzH1hkdJYfgVT95uJ/TkT0dWGBRFfUWl+SupcuINh8MFl518scjlTCHNYkRWqWAffZeNRamZmKc01dwlQcrd1KWG0TCjuiXEDS/QeZPGRgxxUlxcixlBme+MfPPmxDrmAp8C9uUjOzalhvAoyh+XLTm/fG7+mLPtcRddCtal4i2aUYABI2mutv1SZIVvcd9Zvr8MQpyZypvyQOyl/Mlq9lt9LdsIbz6qN5WA0fcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQm/mBCJ6lVeaoWzEDZQulJUpbOSNMV9lspJAheOEZU=;
 b=jSJEwdwUyLtOSAXzOo/vyWWYh+QrapxURdrqYGtMYf6+phfDkWeGhqcSAncoz8vQgMoJHZgtGs9I98IlYVFD34eHNV5kyB4lAIqNk+rcvfLpHOovSwhhVknszK54jk2sg+VH8FeRI5PWgDsBSjzOOh/C7rNwaDo2Atmqc4+MhKLTipU5ixonMuRkrGr6yw2ta2d9Pnob6QywGvuXe2SJeasTzve4C653p2ULqCKMQVMoG/C6rRpA+eRhCSFYAksCc194uQAqrJqtbKxVzKqDf/sYzMd+ogjfFQxczsmxQvA3mVSQy1UKp7Gk1jnBg7PMfSD935rjtpKYfOli+3XHug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQm/mBCJ6lVeaoWzEDZQulJUpbOSNMV9lspJAheOEZU=;
 b=IB3EwNaXXTdZUbcxY95GA+fTi94Dt3NS5XlIHJgEO+GA4D64tPckkIrV35Z32LElAIKxygBBGy24ilDdM2PMsNjwMpnYeo3Znl+ZCE1+4lZPkTZl5iku7Q652+/qf1SUvCj4iBNVX4qpbj4mTX0pEHaqN0B0fgFCD4PBppVvXsEogDKj6p8rVNl6uw+qEuwuDl2zuzLZ4JJhPCYl+aHaVmLDTJy3/168t053ismZzCRznSYNjZS82kBJpljGlniymSOleG7Gbtoenh5vf0L7gVdGRNUGVU3SDLb/9zcamLl/W64KKq+6HyNBuXVfsjNyHl2K9cIhdjg4fLxArPCQRw==
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AS8PR04MB7670.eurprd04.prod.outlook.com (2603:10a6:20b:297::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 02:18:45 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%7]) with mapi id 15.20.9094.015; Fri, 5 Sep 2025
 02:18:45 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Richard Cochran <richardcochran@gmail.com>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, Frank Li <frank.li@nxp.com>, "Y.B. Lu"
	<yangbo.lu@nxp.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH net-next 0/3] ptp: add pulse signal loopback support for
 debugging
Thread-Topic: [PATCH net-next 0/3] ptp: add pulse signal loopback support for
 debugging
Thread-Index: AQHcHLD5iK57qqmEXUuEFtuGvb40JbSBd4YAgADLQNCAALzkAIAA3Yxw
Date: Fri, 5 Sep 2025 02:18:45 +0000
Message-ID: <AM9PR04MB8505775FBCCD61B1F3E4582E8803A@AM9PR04MB8505.eurprd04.prod.outlook.com>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
 <aLhFiqHoUnsBAVR7@hoboy.vegasvil.org>
 <PAXPR04MB8510785442793740E5237AFA8800A@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <aLmOfsgjumBX3ftE@hoboy.vegasvil.org>
In-Reply-To: <aLmOfsgjumBX3ftE@hoboy.vegasvil.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8505:EE_|AS8PR04MB7670:EE_
x-ms-office365-filtering-correlation-id: 3ea3718c-0bea-4956-7ba2-08ddec228a6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?tGr6XySyJwRS/k5CIhjN35ErRfDZ284RKQgXzcAk975mU4j1OvDWLMuKNknB?=
 =?us-ascii?Q?gZUylj8bygfq3gunbb221Gq7+p51Yu3/oh1Og++0Jbjt1ZdahsGXJifCAbeT?=
 =?us-ascii?Q?XpSf2LqABcykBv1nnyPr3cLXGnKyZVTjBIgICkLW3l2ZXvTUYnalAXZ5mNHK?=
 =?us-ascii?Q?bc/+KQUB637K4x+TWwWbuqhLKBS6pFeHtnzdW+SNulzaNdepbVOFWdxXU9EY?=
 =?us-ascii?Q?RwY3h9+d1SHow78l10lrObeoN6RKkw2vjQDDgw8YGAKuebwopNVje2tHf3DB?=
 =?us-ascii?Q?r3Rnhg+9f7loS1HMDXap+FjQCUhKN4D7QXQJTD7P4F7llsPtYPVNNpKcmURb?=
 =?us-ascii?Q?RuVJwtMtfrmpLdKBHxuFvHc/013CK44DJBsjdtWjkmZrA8tI0BN2bsALxeHB?=
 =?us-ascii?Q?IvB1xoJ/ZCgiJ4xVEwFm+/IhraLyq2zTjeMyzkM3AdG/r5uQ+2hwq20/EIPs?=
 =?us-ascii?Q?nZ2IiAmud4KNyCpRZKCFjW6MJ8Ktbhxhql2YSxLyA3zS9D/MccKb9Xg/I0s9?=
 =?us-ascii?Q?elZuALUWrz7WypnBO89qbVnq2MvmJqJgV+qgiXGqjaxxeHPYO+lnPyV+GQmb?=
 =?us-ascii?Q?tr+VMMUs2MQKFro4PTcnVuopvdMR9zhxoStRxXzk1WmzG7K6lPf9Txr/AEgF?=
 =?us-ascii?Q?XThrOd54hWAg1R9P/I/KN3wlPJqfUXwwaqGmnY4DGuRgsdBO5NA4UYqTXL+F?=
 =?us-ascii?Q?dt0WXCYZFTqM0OpnKvrqGL8wJV4qCdQnTUIcOloLDPHgpicf/78jIRmX+72V?=
 =?us-ascii?Q?httXWsa5+MILkQ+/9kU7vPlzP7kx2CbprlXH8MXSKstyqpeprEcZ6fUD158Q?=
 =?us-ascii?Q?KIoVS5WiR+PWZ0jDFkg6V9HbevWU4CUZstDCG2HzNJq5j3VKuf2bysOEMZJT?=
 =?us-ascii?Q?stmw5zR5OUiHKv4wX4BBlLPb7iSYo4m1Qfk6d22csjWFV8TlwPzk/j/djwNg?=
 =?us-ascii?Q?u3zrBotXT0v5MoLZJk3LIEXBNqjPicIyRLGT1gMF4MIU898M2dRtMpVfQ7tr?=
 =?us-ascii?Q?QmI7LaMe2e5A5FayczSq+lU69exGaGPqdSRBfnvfEVzM5T0X1nW8u3ziqxGC?=
 =?us-ascii?Q?vqSAhHpJOxI5wbSm5Na0Rcew6PxXFjgKCe5UO6F3kdvj3kYC+Di3oRRtOouJ?=
 =?us-ascii?Q?SAGWh126csTCs32S6nvfvTi0AwG004QrZTTWFWG3m8gGE1piTi7FIyDUY6Z0?=
 =?us-ascii?Q?xbJGwiDk3ztRPxugKVPEO/chKa309fw4Im8n8svcytoI99Zy9v+OWlaAqIfH?=
 =?us-ascii?Q?GZiBDe6A54+GXgBPM5gl3JEj5XrLV0VcUhQx/LPAZuqvXLUfki4lUPCB3ywS?=
 =?us-ascii?Q?dQQ7CjtxXfsJpP7pZhMf6NqXuulTbbhjlCJ2ri/oy/J4rYHR/Y0bojg+xu1n?=
 =?us-ascii?Q?OtY0KxUyv36dERs22f8Vhhjo/GwokPoQjjX72IQGrDGtSLxzH/AU6JVVo74m?=
 =?us-ascii?Q?Sk0Sns6gtOs0UzxBZGcDrUF0Qwrqnod9n2pWLc4t+FMxvJ2euYkaGQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3o2ChNpkLVJYjdwTBLZDAXcoZOPvaOpqI7Vjuk5KEKdRkj4exuuXS3R3iHMC?=
 =?us-ascii?Q?aKEp1hRUnD+4mGOsOUqJBwaRO0ctYY1fay6KYiWobGtPgDgCCpRAjFi0KIyY?=
 =?us-ascii?Q?xQaeRGJrEjTsQIoJucifRxE1NN3R/EtUJCLNU3gwTO7A/Vkr7OxOa02f4PvM?=
 =?us-ascii?Q?ZFRCtWSIj1X2PWpmB/CzkwshulKD9UGj4+IVUSfUwMHynviv96fymAQ5saoo?=
 =?us-ascii?Q?LllSO6gEvUHlHXDLZ8QiMjbrICRdilt1gTtpBIfyZfAjzzyJ+x8XBeccvT1z?=
 =?us-ascii?Q?z6b9LltDrdu9Kr4mNgRQ0/3XHJU2EanF/e9P1SE7WR7tw3AfUY5Yh6wZ/ll6?=
 =?us-ascii?Q?TlaIghuILlsMCGRO4ZeijP8otLmJ8e6yvt/3cHctXjYfE1gl9IMVIuU7QeXX?=
 =?us-ascii?Q?0Th7ntlgGVtbMdDIjqkWR1w81OGs9fX8TbvUyvJDHKBXQlVGf190awKs+US/?=
 =?us-ascii?Q?UmxYdugdUXpLfBWAc0n04fxsjKhPvacIEbQfX+pzZzobaM4hJBES725sP1c6?=
 =?us-ascii?Q?SyCl3f5XiJG7ZxIXlfXKF32YtJ2Ok6J/pGDJNx8rROpchBOhnO6PTrs2meJp?=
 =?us-ascii?Q?3mLiCOSG/MEvvBCE15M6/iZMQtEH5Gn0XT2gHHppTWQsZSQIkp4gI48nwbkF?=
 =?us-ascii?Q?gbTF5CJSyIdmfmtKm8E9LqgHqbGrV9e+0Hg+hTiNBiru6Nu8Ed4KBoLDhuZ9?=
 =?us-ascii?Q?DAsz/4HwG6YsSoYPaGMJtqi3Co2fPDuHoLcWoqmxUsXhpOBuNhiTdSYd/Fxf?=
 =?us-ascii?Q?Z0po2DfYLx/D0aUjCOVMtT0BABssxuHpIXV7mQo9w9Xf5RpBtKpPThk3uLGO?=
 =?us-ascii?Q?iI3q1TjBmo1bonZi+HMmzvHp6Gokj7IGWj1H2u3JroL90Pwqr0ywQgTpejFV?=
 =?us-ascii?Q?uH0QUxm0RA5oSQf8ZeDSosJw4bFrGBJLZzWNU2hU/3F6a9xWCFyBm1u60m3P?=
 =?us-ascii?Q?fSViFrx4h95sW4WrZbawyX/VY9nRWIqNQvrm8s3HClhY0V//CmEE2FugV6Pd?=
 =?us-ascii?Q?3KR8AbxgwmivxDY1MYsSLTOy6paXvgJCGSkXaeDKDmGKFDENonVjt9/ngSdQ?=
 =?us-ascii?Q?CjTRxq9d2pwmhVTOhhyjaFRqIqaAbvdhaasuCRKa7/T2VwNQimkUYWpUsqP0?=
 =?us-ascii?Q?Ds5TiJ2C1R8+3TjP+E+d/I+61lOlyuRHHky7SoqX1lcOBcSsIVpgn64JlGLy?=
 =?us-ascii?Q?PsZY6HUyl+7ygU+iplso5lqMW5jcE7oFc3oQrxg35/I1kMJnCA9GhWdZ93Wb?=
 =?us-ascii?Q?TUwK0tjLG/+4FQ87VAaRX65BKEr4fXX3A9b4x0JeFvqJ2ew2hWUNrdu3XcGZ?=
 =?us-ascii?Q?U3xNprd9BEsoW/fdOFecqflTEoq35JBkPby7rmy0KpL5aydNbOZLeXjZR6PK?=
 =?us-ascii?Q?EfC5sb3H+41BL+AMM0ToeqwO15s/iZYkDmFA6yQKi5KRsG8UtsZG8p0EUv2f?=
 =?us-ascii?Q?tplCiwKONPXtnsvURVIGS38iLy2wmaoet/CZtFjBlBHqquUuLTPscAP9e6YN?=
 =?us-ascii?Q?zsBrLLG6Xcq4vmQ3+ZdVhWfYciaz97op10d+Z88iadriG0mWf0KaMOYW5Sxx?=
 =?us-ascii?Q?2r5U7UUa2IAE4ZW/vhg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea3718c-0bea-4956-7ba2-08ddec228a6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 02:18:45.1376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1lS72TySdIkjAQziPlVcTsr0AycrF0HxXm4+KfKnlDz9qtDyybGKWFGyhe8Fz1AOvdPR5lTqhdkviyFfYXoV7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7670
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_191937_828304_F81F758B 
X-CRM114-Status: GOOD (  10.57  )
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

> On Thu, Sep 04, 2025 at 01:55:43AM +0000, Wei Fang wrote:
> > Vladimir helped explain its purpose in the thread, do you still think
> > it is pointless?
>=20
> Vladimir gave practical examples for the use case, so no objection
> from my side.  I just wanted to understand how this is useful.
>=20
> Next time, it would be helpful to have that info in the cover letter.
>=20

Okay, I will. Thanks.


