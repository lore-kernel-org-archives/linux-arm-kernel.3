Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295A8C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 02:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alC5JTZfa0lrSilyE+Voxz9ZR8nVZRExv9PycePKFjA=; b=Iqbw9aIjp54y2jceSvYBk3QJvM
	mfb1NHvC+gBMGUpvxjbBjM9Noir9OrMbf7bd7Nm7h+KwuoASI4gzCTkxDVgnkwNLtAsa4magaOngo
	Tq1LGzTqCi34S6FL2s9nL8BSOzTe3zyuC79qOHEdE5h4rnzG7QcDRX4xQQTZTifF581/k3kM70x6j
	51Esf8i37P8aQFs00qHiDS0EPI7fPZkgzGfbjQdI6ivk9ZWj5XdmJaSlFBVFEwJt6GdzAA0GrI8ko
	mrySLP42cthlQygryvN8QZbf57MQut+GQc4x8LkSqXo/LtxdSc9XpONUDtlgKPAMC5GbYjCDtn/8A
	lXJ27hlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFNP-0000000DcDO-0vmz;
	Thu, 16 Jan 2025 02:12:55 +0000
Received: from mail-dbaeur03on20615.outbound.protection.outlook.com ([2a01:111:f403:260d::615] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFJn-0000000Dbj4-3dfg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 02:09:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFBV5yKLfA1Y2NR5vhIRFn+5BfClxpAkEYx8U7vquUAFRb2GoGksNUwA3Hew+eYg0waXX/sxR1NIIUXlJc9uZ+DKud9s5JwV6C/3E3SHmcmZqC8Bb9rBPGW5oZ3SS4tfjDDkO8NeRY0h38AzL35NApPs8OlcL3KWxMMknc1QOnkh++ARARS95vHS+SBb8oDb08FeEi14CDfHWM1fPAgFvnlSMKRswR2pXaUKjqgC6PVOoREmJ/ZqZHGkVbt32Vo6eircaQPM5LJPx0IUocKH7eQncLUOhteZt5zk+KuN65BsuIMA42n/g2mk0qlv29AV3qqlzEUvBO1aBimoTNBrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alC5JTZfa0lrSilyE+Voxz9ZR8nVZRExv9PycePKFjA=;
 b=Y8tzkJwsq9CAsizgw5sIkw59T2Gj2VoynNmyHGrja4FMczmjEzVFqx+vV4IlGoEEhEeCAB5HOK9ubFEymjZfmy/RuGmJ7gZSASAOFqHjp7qqiLPfNr9XbTC7Iph8gt4vbhmtsKtWL0j3N26GHqXIqhU3TAZQlSgZ3ivvacot/cBM89/FPlhWsxEnweYbZtyZJQd+CzKsdJvD8hwala9X2XC46256DoXVffPPmBTUogcLYpe0yiWhBsokFlajytD/5C+QS0cKAwwNgEsHFxVSmHPCRsrfFxUf3VCvQQFV++1Wi5rZdOEKQkwLvpWzsVJn+J1u2mZGqX0sajDny68mqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alC5JTZfa0lrSilyE+Voxz9ZR8nVZRExv9PycePKFjA=;
 b=lRaeATWt/g5ibzQYSF2ivo8CtxX5rPf88TjfhKs8+ZJskQ6BaCgEZuw8vkV4TZ12k8FYmW/rJLT+FQq89yK066GE/JDXdlNEiRdFWQVzRCD7M3spoidWAaRoGrVLWlaQfCSAfmHc2fyF7mSf6ObneTCadXchHN1K6mDmkda/d85+G7Jz+xNyC7N6vpW3Bb8NHmKDVzvGhE4Htcx95UCKo7tKjUkbvMNfgyaljgb1YvPDv19QjhVsoc2vc+g9hcB3DaXqD3PDwz+ckFX1jnSXsylLJkYOK7Jre8UD/oRJ38Fzu0lVrO2tnYqQOCCo5btFc7DWxWsBZsVQlE7aGtPgew==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10313.eurprd04.prod.outlook.com (2603:10a6:10:56a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Thu, 16 Jan
 2025 02:09:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 02:09:02 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Thread-Topic: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing
 controller for i.MX9
Thread-Index: AQHbYZsaAtqq5Jn1xUGKkk8ZemwvxLMMqVIAgAEiMQCAAHVZAIADR+kAgAMeDgCAAVOusIABd16AgAFBuJA=
Date: Thu, 16 Jan 2025 02:09:02 +0000
Message-ID: <PAXPR04MB8459EE43FD37732822893343881A2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com>
 <4956524.GXAFRqVoOG@steina-w>
 <PAXPR04MB84598515572A669E5856379F88182@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <6018578.MhkbZ0Pkbq@steina-w>
In-Reply-To: <6018578.MhkbZ0Pkbq@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU4PR04MB10313:EE_
x-ms-office365-filtering-correlation-id: cdd404bd-5005-4839-6d87-08dd35d2bf09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?/6MLtqTiYGvzNrGWjDgz4hOUYiRCVvD1VgIKW+b6dHb4VkgvkGuGcihbzg?=
 =?iso-8859-1?Q?cLtWhBUTnNlJYN7JJ+UOOzL6jM6un0nJdFtnLwSJZRHascuQCutVMFwOrk?=
 =?iso-8859-1?Q?sEq5ekRXZG3kqylFlYybvRo0GkJH0nB3jyCC0P/YWrbfZeIkrCWN8rwfRD?=
 =?iso-8859-1?Q?o0XgegyGUfeXI+ViylvdvbkOOFX+zP1DvYzRuNhHiLZ4lIE7cUBelbeOzO?=
 =?iso-8859-1?Q?wwjjxREhQIcgycnK1gVvt1snkHRGcINntI1tnALo+8xiDn1oJnzttcv+bZ?=
 =?iso-8859-1?Q?SsDXL1zufrGwhYwPMA0Jd0HDMni3ODsD/lak5L0Qt+fWTh6MC8dWp2fHvT?=
 =?iso-8859-1?Q?pPcmjSUc6J3JCnLHXrSbj8hnoFTjyIJLC2PkQ5CWqn2Hr7g3G7Yp6Tup8n?=
 =?iso-8859-1?Q?qr+Fsvm/k1c6zGach48pm81Vl1KS0WLTNy3ygI6x7qsNe0wjqu9soTYf65?=
 =?iso-8859-1?Q?BecJhO1xOgN7SPysk4671jYtuSr5J+P+TxagS1CFatuObpEx7Z7k20HZMY?=
 =?iso-8859-1?Q?LTXGwHlyXgPGhfnDH9bm2QFToqjugdGVaLeESP1T7lny65x5RIAcn//VaL?=
 =?iso-8859-1?Q?drNDOI2y877TCdCn5eQifYVOq0+tsEAKIFJf0jrJBV5F2eMrjNP0UrHjyR?=
 =?iso-8859-1?Q?GGDjb1TgxXuxgMFmMEr9pqMeo7xhCXavJwPl0dYN6wN/BBUn1XaM1aP51i?=
 =?iso-8859-1?Q?YOuwi3a9Q7KzlgCj5V9v68iVxu4SxZjgSKXVKdMyJBaGpQiMZIEjbUoYpj?=
 =?iso-8859-1?Q?gJj2YPpsXta2xvoFrc0HehMYELe0C2jmQaMVXrNR9THBYeiP+C+WK1g7CY?=
 =?iso-8859-1?Q?GgBxAmMa4xd/wY8pMfq06GANSVpTp3I2EttM/4ZMiY49L7l+QMV5LUV6HW?=
 =?iso-8859-1?Q?bs5dF6WqSGYH4egpq8h02czptt6UJGIMyyvulSCVhZVpqtIEuiL2f0YYn9?=
 =?iso-8859-1?Q?l8QT+njpM63kj7c43nRUOIdsOrRscGfd5rhUl3aW2ryRTc8PHUvj1/lTAP?=
 =?iso-8859-1?Q?2vJF7uHc+hd0VRLyYrQr13VWoTvTG4Y1T4o/uHvEPnNa00WIcTLkvaNI+7?=
 =?iso-8859-1?Q?ANmnmIQvKU8WvbjeNRBwi2N/tWzIWfoe0MXeqfknhSsgixzX8cyz0qMMS8?=
 =?iso-8859-1?Q?CpWMNv1mMp7kf2h5ZTFmPJOc/Hu/cLuD/vK1VUpw0P5HZmQGtvwyo92lK0?=
 =?iso-8859-1?Q?RvxbWRtY6lcGbyMgQeSCJYeMrpI6SO3t/YNbxNDAYvPIG5XlT6CiRfjKrE?=
 =?iso-8859-1?Q?5A2FfcFa7Psz3DEeMP3MrU739AP93/8ZCeo+YSAJS0V7idBSlw8gqKNgos?=
 =?iso-8859-1?Q?Y2myx+c3XFY+Jub2uhOAAEmfSuoWCC1RM/LLnXpwECKI//sul9SFdaQA4t?=
 =?iso-8859-1?Q?MNcvKwOTYDtUmuUZRaygH89WvtBj3rUD0Oivb9HBKJSNya9rswOWO1O4NQ?=
 =?iso-8859-1?Q?KH5WhwjCQQRc43cF?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?P+P24C9K3rJpSdQcCWw//rybmUmnHXFClqAAdn9EBh3QDQbuPxpN53po3B?=
 =?iso-8859-1?Q?QxMOovdo0xKFgaIau8Q8YXUls6MLUdT/icWLrMlk/KM4Gln+oFdxRzcudu?=
 =?iso-8859-1?Q?2P1hY/snqn+ZNXA8PbgARkCmj/29/w06VUWbaG/o7mgm4mtinoYGfLHGS1?=
 =?iso-8859-1?Q?ZCaF6pve52oocwqzEsOcrvl6cg56BhoyL8FCWpzwYVIYyw86VlYZsGpusz?=
 =?iso-8859-1?Q?H+om+tASi1eV4AOEKORuL/gBFl9REfry1emqQi7atMHL6sezOkLk4rzl7N?=
 =?iso-8859-1?Q?KoqXO3V4IblE8+qOtUkogp/1pqRmo2YrOeXqyAfjhqF4EixwXQx/whwrhG?=
 =?iso-8859-1?Q?jNEc3XoNECl8PDCpe6OeFhBjhByVCFBZAF9/7DT8k+0RcJN4sLAMO4TpME?=
 =?iso-8859-1?Q?O8JpD4OxxJj814zxDdwelZjBSMzMHgTIqTyhXHO5hvbD77x4yPYOwKVWMe?=
 =?iso-8859-1?Q?rv9651yQ7zE0JCeYGSd3U8onAigSC1qxBYOkeJFA3zK1/aMGQy/zsHtJx5?=
 =?iso-8859-1?Q?BJHfbJ9AHEO2mozzQ9Kum929g4GyRKt88BHfkHmT2tm6SUYG29oxqmqV5N?=
 =?iso-8859-1?Q?sjlB2PPnblFKC9aavLPe76HTOAUuvmJ2Pjtix6Q/M1PQeFImOnAvugnxGA?=
 =?iso-8859-1?Q?NOpgecGZR4zvOjl2PFI9qqyjbc9wu0BTOu73LKhx15ZkMowBD3RxTn7UxC?=
 =?iso-8859-1?Q?lAo6TvS/CbGkcSzbjj4HYNqRbC8v6dlJASjZxiOrhbZWI1g2CeDMbQrE4y?=
 =?iso-8859-1?Q?xMyf4C8fpfU8iDsBWXlRzNsKBvAcR30tt028uHdvNGvE/tJm3dcbxDhLoA?=
 =?iso-8859-1?Q?aydf4qBpi2T+kA7xrswkyKXVMOUoAcLN4QoyBsBA1srYv0IfBMyBbfI08T?=
 =?iso-8859-1?Q?UXlUbaVbjdOKwGK2nE3F+JpJDfNxgLP6iANQlFjyqjjZkhZ2qXJch87Knx?=
 =?iso-8859-1?Q?FcC8N9k7zxNL785hmRfIF3AChk+DAin78rjVWVDSaiQk1ugWb9ltVl7J9a?=
 =?iso-8859-1?Q?OJHCwndtLgGj8gQnjMhJM8BiZSZzPbrJQiqQF3amlyGl7b3K9SG9iKd2FK?=
 =?iso-8859-1?Q?oqE+3FIkmL3xXBKibvAaisBaf42jwUSXbyJe3jD4L9dsSNtxYJmaXm8cv0?=
 =?iso-8859-1?Q?1HTHkkKV0AmsIv17iZ7j1lMOewLVCbCll5Ph3kI8xK6gnK25jwNrTF1AfT?=
 =?iso-8859-1?Q?6zDDa9HInQ+nWLcyY6VIbO35KxCG9UldySIlh3B6CqmFM6aMkDrsOS3p8b?=
 =?iso-8859-1?Q?noGn4Dw+mM3nRCFjiMKpUrQs4hHl8UVdjpCTXnj9f+DjixFMoj6aoiuLNv?=
 =?iso-8859-1?Q?TFuVBJgCDjky5kJyywd3Ekamd1HgWxgF2AF96ShqPie6mCEIYFe/SBxhTf?=
 =?iso-8859-1?Q?W5U6clliY9Bv1X2tpe9zf/qKxZb8CxB4DJJxjKuhjNhffbUg0efXyELI0J?=
 =?iso-8859-1?Q?A4NdzUHoxIrLREeaUwUWYNF1uOBjQlLaUmhQZ+iSASCdHRe9lQBVfGucDp?=
 =?iso-8859-1?Q?j3Rhtknl6e6B5BedhPa0GKaRpGZoSb9QWTcqxbuJYUD3TlYF0D7Ec8CdRg?=
 =?iso-8859-1?Q?bVtK0sNF1ZT6VhAYFTwHGbtwShZDH3+VO6WCM/6bGiCH7ALmvOSeltPUWx?=
 =?iso-8859-1?Q?wr7P5FBbh5Tg8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd404bd-5005-4839-6d87-08dd35d2bf09
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 02:09:02.0350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +OxsIpaZQJWeYkcKJV0E/H3UaWi6PraTJ5K45vTn50Cl1+PZClDTPcAZX4k2i1K+cDtn6bMXqVQ+ezfUNQOWgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_180911_907264_D0580370 
X-CRM114-Status: GOOD (  38.02  )
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

> Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing
> controller for i.MX9
>=20
> Hi,
>=20
> Am Dienstag, 14. Januar 2025, 09:35:41 CET schrieb Peng Fan:
> > > Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support
> accessing
> > > controller for i.MX9
> > >
> > > Hi,
> > >
> > > Am Samstag, 11. Januar 2025, 13:41:58 CET schrieb Peng Fan:
> > > > > Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support
> > > accessing
> > > > > controller for i.MX9
> > > > >
> > > > > Hi,
> > > > >
> > > > > Am Donnerstag, 9. Januar 2025, 04:34:18 CET schrieb Peng Fan:
> > > > > > On Wed, Jan 08, 2025 at 11:15:40AM +0100, Alexander Stein
> > > wrote:
> > > > > > >Hi Peng,
> > > > > > >
> > > > > > >Am Mittwoch, 8. Januar 2025, 08:00:18 CET schrieb Peng
> Fan
> > > (OSS):
> > > > > > >> From: Peng Fan <peng.fan@nxp.com>
> > > > > > >>
> > > > > > >> i.MX9 OCOTP supports a specific peripheral or function
> > > > > > >> being
> > > > > fused
> > > > > > >> which means disabled, so
> > > > > > >>  - Introduce ocotp_access_gates to be container of efuse
> > > > > > >> gate info
> > > > > > >>  - Iterate all nodes to check accessing permission. If not
> > > > > > >>    allowed to be accessed, detach the node
> > > > > > >>
> > > > > > >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > > >> ---
> > > > > > >>  drivers/nvmem/imx-ocotp-ele.c | 172
> > > > > > >> +++++++++++++++++++++++++++++++++++++++++-
> > > > > > >>  1 file changed, 171 insertions(+), 1 deletion(-)
> > > > > > >>
> > > > > > [....]
> > > > > > >> +
> > > > > > >> +	return imx_ele_ocotp_access_control(priv);
> > > > > > >
> > > > > > >In [1] you mentioned devlink should solve the probe order.
> > > > > > >How
> > > > > does
> > > > > > >this play when the driver is compiled in (e.g. ethernet for
> > > > > > >NFS
> > > > > > >boot) but this OCOTP driver is just a module?
> > > > > >
> > > > > > OCOTP needs to built in for using devlink. Or the users needs
> > > > > > to be built as module.
> > > > >
> > > > > I don't like this kind of assumption. Would it make more sense
> > > > > to make CONFIG_NVMEM_IMX_OCOTP_ELE as bool instead of
> tristate?
> > > >
> > > > No. Users could setup their own system with this driver build in
> > > > or built related drivers as modules.
> > >
> > > Sure, but if the kernel locks/fails/panics while accessing
> > > peripherals just because of the kernel config seems at east very
> unfortunate to me.
> > > How is someone supposed to analyze/debug this?
> > >
> > > > At least for Android GKI, this driver needs to be as module.
> > >
> > > Any particular reason this needs to be a module?
> >
> > Android has a minimal kernel which is controlled by Google.
> > Vendors could only built modules based on Google's Image.
> >
> > Updating this to y in upstream, means we need to change it back to
> m
> > in NXP downstream android kernel.
>=20
> Ok, that's an Android thing.
>=20
> > If you need it built in, you could modify your downstream config,
> > right?
>=20
> I'm not saying I need a built-in. My concern is that a wrong Kconfig will
> result in silent errors/lockups.

You wanna me to put this default y in arm64 defconfig in
upstream kernel?

If yes, this could be separate patch to Shawn if this patchset got
merged by Srinivas.

Thanks,
Peng.=20

>=20
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld,
> Germany Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F
> www.tq-
> group.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C0d5a5fb
> 27ca2413b928908dd3531b436%7C686ea1d3bc2b4c6fa92cd99c5c30
> 1635%7C0%7C0%7C638725209780487039%7CUnknown%7CTWFpbG
> Zsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa
> W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata
> =3DPv9BNodu49Lcup54Xri7vprRc%2FpC1zw19o3oitvIad4%3D&reserved=3D
> 0
>=20


