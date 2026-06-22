Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F70CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 05:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDM3fvTKzjZ9oc9rw4GcXDI3iSesQf7qCX53jsL2qXM=; b=WMzNZ/0UszbuK6W0kYCzrGYg/L
	oZ+qepjMRBebek7Y3Be+fP96KxHBPtMTwAyr/uQTNGxupZoUDh0gYcXdh5X+YDJ5BOjB/Eh0mSw+e
	jJdc5Dj7OtWSvdXh+5V5MUNGVSfABoV+tYbmCLRCzECzDy4BmwqbsA5KrVJCYpeOB9IVWDqSI6SuU
	TfCpqXkdH3N+iVzTLRNu0E3olBlfdu69cVdnu2oJWrGnXebn5Q//DIctvd4aWQNptpoiQANu9Qgia
	f5gnA9Qp0RG0CEN3JdqIHFsSSUGsxNEeHXrWg7Pv4Fd0egAjkjmKOROI/+IkcBVbsYSdu5YyneYPe
	9IUpIrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbXa4-00000004RxV-0c8f;
	Mon, 22 Jun 2026 05:52:24 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbXa1-00000004Rx4-2Crk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 05:52:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wn773tCE4kgxFxjy0YHBwkAiPObrw0wKUwcjNy8yHAW5aXrbAFnjPDzgMjdgsI5cGrhRAqrXa3gC1VWWnkj3omU5BQ+8pGOUm/YhJLbIsTNFNH7lxf4m/y7dq2M1FWdOoTLaOTTQHV0BwK57Zygg49R5jKQDbv4P98YGBzuUx+R+0Uxz0Cu70CuADbR1jfDAPN1p9ACw2DoCbp2jBET2B+6mVGeneolOYesroHfWGzBOPbK400Co2M21U7j85BN27Crw+lBZxzjcw9HwaY7rdGfPqAWmBLcX3m4v0BiKHxtfhSxP1vd9gOzzArXyvhjW/kvgSvuSCSfb6mDYVJRbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDM3fvTKzjZ9oc9rw4GcXDI3iSesQf7qCX53jsL2qXM=;
 b=ygBhcvwAame4AycIu05WJPm3JuqKJjqFtUGeHXL2kJOZNKukrhTKszru8L510VeTsnZn8dGuRkCCOmc6tDNUw/aETiMI6SEdwTEXgn3ZTfFaxnAkbUEnYOjdmBb5/wHo8CEgnM/zm7oBw50N2aSRw0Jxi2I7gxsko/UVSm5kVAizbKpzvXnXe4wUw4FCFa84ku+es5kCRqHP7qNym98rNkJkKv80ll+eJX8+P6lL6RoYKQG00ZLmVUPvKwxqtsv1OWKPAWg89ABE6ih3lRfBEuahYIcn8A0tLXaZ2XLmMofTYo6rGmc5dKIFPn5V4bgAIQdDc+NSopdp3JMoAhMTCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDM3fvTKzjZ9oc9rw4GcXDI3iSesQf7qCX53jsL2qXM=;
 b=hnY995Y/OPPcrkIzYY2jJCQ9HiJ4LopAdwZxeTtWE9mjxqVjjyGxY7zlRjLWXhUDdTBm72/OBYGLt21ihz6McosV65l0lnlhgzEi3JlMGfbo4pfgbeXx2amOownphWOC+ADe41cr5XODCB39BVwmwUbXe90b9oA4uCArTCA2fWpAuPHwzjtucIsKFqu0UUM3IEGYjLDwN5WVLL/iMMj3/2yxzs8YQurQI9R8ar5Ug/f2CLBu6JcLGdzJeSc5UO09wMlwrm1SqaXfZUrw4kbCOm6VWVLrnPFZOS0/H0nzp4o3TLYPgfbrYTo4i6OcL0KMrRkryry4kDLFS9N7AgOGwA==
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
 by VI0PR04MB10736.eurprd04.prod.outlook.com (2603:10a6:800:25c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 05:52:15 +0000
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944]) by GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 05:52:15 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "Sherry Sun (OSS)"
	<sherry.sun@oss.nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, Amitkumar Karwar <amitkumar.karwar@nxp.com>, Neeraj
 Sanjay Kale <neeraj.sanjaykale@nxp.com>, "marcel@holtmann.org"
	<marcel@holtmann.org>, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
	Hongxing Zhu <hongxing.zhu@nxp.com>, "l.stach@pengutronix.de"
	<l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"brgl@kernel.org" <brgl@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-bluetooth@vger.kernel.org"
	<linux-bluetooth@vger.kernel.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>
Subject: RE: [PATCH 1/8] PCI: imx6: Add skip_pwrctrl_off flag support
Thread-Topic: [PATCH 1/8] PCI: imx6: Add skip_pwrctrl_off flag support
Thread-Index: AQHc/wp8x9g+aPXO20GYXbwWY4Cp3bZEpOmAgAVSGHA=
Date: Mon, 22 Jun 2026 05:52:14 +0000
Message-ID: <GV2PR04MB121027AF682B10DC55E9A503892EF2@GV2PR04MB12102.eurprd04.prod.outlook.com>
References: <20260618101047.4185497-1-sherry.sun@oss.nxp.com>
 <20260618101047.4185497-2-sherry.sun@oss.nxp.com>
 <ajQ64ZswbmTceIGO@SMW015318>
In-Reply-To: <ajQ64ZswbmTceIGO@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12102:EE_|VI0PR04MB10736:EE_
x-ms-office365-filtering-correlation-id: a3ae6233-81b0-4481-212b-08ded022697e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|23010399003|1800799024|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: 4Gb8lXsGYIAjhUym8Jgxrhf9y+kzzn63AlDZJB7Q8FZUSYD7n92Wp+rfijYwR6lrBRC1+8SAnRiNI1L9RYYD3aCGBRnOSQUWBczDJ1IcqZdmc3wJRpFoILs0cdM4kuKt9VRZqaEBPE+3+3UU5Y9UU36MdVLD0VkzbaLUjGpnR1KqlZqD54pvcOX6RmejBtyrA+2Pq/tRsDNW3C/YGI5+PDiPxvKX8mTXRFG1ObB/scvBHY70lJgZul0nr4p8ykpKA7wsJIbwGg/7tqHVmiCfpXpXjtp8+KmoaF+FivS2Nw3y8weoBjnevIc2XPiPNrTHdHKB9XAlP0WGvbjXFDxn7VDP6OW4jYRe0ey8nD6Vcl21VFZwHJySK+zmGyZG1voXp8+j67q6i1UEcZ7XopDsSD4Xy5WWKC0cnm1s6s4NxjI6WMAJ0D0LI3leysmXnDQihtj0JApsDiuxDGfQtAl7U1D87aGFXchkR8eSLZG9Y/j7Qesx/oWw8URLbTdWRBvTfD1FgmG9v8F7UELePRrL6iZDqiBPmYA8d3Bz60ucTwOysQfFetmh8EHokCCb7AElOEMEvPCZYuzHnVa8wYTLvVmvR+ufD9sIt3TSc0vXiuwluV4ioPadcY54/4aRXVc3iaClDyTRciplIf1cIMlv+Yerw+yPGNoB2Xt0mk2FV0jYslpCvI5iggaAOdxLgdZotbhdTJsy3+YUfMb08OaD+Ue2rIOIPKfAlAY8vKo+40w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2YFOzR/UuI6krq+sUNiEp+kdQp0bocS2UB6hH5u+uoX8PZBK35ITO1vJK3Az?=
 =?us-ascii?Q?AoIJDGFiF83XFnAmX1SB2xI3DUSpbV3Q7m9NachGV4ILBLXkwToE2NmFMC1M?=
 =?us-ascii?Q?WE8MGUUIy8HMh2kiI07xU1QXS81AnDWv5X/3NKseFGW+Knz5JiJiWCblkIQx?=
 =?us-ascii?Q?K5+U1aiPWvkw/eQ6KEgmbne9RdIZi3MyHWy+lUIsjPfN4IiwQ9B8q3ACbzV5?=
 =?us-ascii?Q?ABJJhnF4i2zLIntsKOsKje0GdV+YQik+J2y5wMNmMzdB/TZIWUAS/y8SsLLx?=
 =?us-ascii?Q?IQWI0g5D4hMUTMzQkWiFz1frvBvVLeulw9iwPG686FPHlVjiWcc8oSjOPGk4?=
 =?us-ascii?Q?0OZM1ijMVGLLWNSBqsF5PVCNAcnqt3PYRuA6YiTg4r7NGspuyYnt/69jCwBQ?=
 =?us-ascii?Q?X3IV5HYHcwYf5Dh3EDw7pH+0KviXW7D/nEZenk4Vb6gWXmJDL13euQM7Vh3R?=
 =?us-ascii?Q?bPlV5ga4yImht9PxbfJBEU0PrLCp/Z6ULU3cRxq36PQD+CHaA6sPKru8z9+z?=
 =?us-ascii?Q?D9+LFOapxduQup5bi/5NAItr9LzZgDht7nEQgMG3QpDLv7uB6xC666T9hdFF?=
 =?us-ascii?Q?PWDy6oV31pvAm0hcVdF2FBIegaMaJnB6fJ6sVrq8N6rCMwVm+tsw4rnJrBWU?=
 =?us-ascii?Q?l6JXmPpirIkQovjBXRFAOMTXM7WRwpLFeZ5HN/OZ432Tl54LRBnLwVped/v+?=
 =?us-ascii?Q?p71axpKWDyaTJKDqLe8HxQHnJwdrQ+YL30+/4lcNlWx8hK6Qu2YJ4beRLhI4?=
 =?us-ascii?Q?KdrXR0xr1R45dBLQmBZOo1ZDm6jpci5UJXKfZASRVQsqapdK8X0hV/ZfDssl?=
 =?us-ascii?Q?Tp6yvEzSMtLmo3r/rB449LGWYeUfjeFxHgoGl4Jjw2b5yCCt21N3GPKF6EJe?=
 =?us-ascii?Q?2yAIVZFw+v7L1Qr4Qy6EAEBETjXWO5N4vrvj5F4RdHZMqG8F2rLpqCCD79lp?=
 =?us-ascii?Q?T8FFfz3Lcv1pzFfxeFE/JZ6havTQ4mQcPU8RgV1uqIe4wFg7hy2TmR8od5qM?=
 =?us-ascii?Q?Ske7b9zXnZKefgHDNO88YbDZW7ZzjpWjKSx5yADxpMbdF4MMiAfERtFq5pOR?=
 =?us-ascii?Q?dKPUmRnUc1gu5EWEh0CbGn9Siu5kbo/Od3w3YDH2a89hq098xOGKck7/UIk3?=
 =?us-ascii?Q?ccmzxFkKnMnb9SzS5WrnsXBKtP6fnByD/U9ZFmw9j4HjUKXKk8afNmzNMfge?=
 =?us-ascii?Q?h0u7mMIay6SmiC3/7gWAjguGP/4bxs/kM9SAzFMO8yU4NUioeaGycgSDhDD5?=
 =?us-ascii?Q?NtW0asS7QfFh4EDbgDWG+TgycU8/LzqmhKjAsXwq4vZUoVsVS15RD52KpWoo?=
 =?us-ascii?Q?Ttz6eBXIF7te0l20jEOnlLueCEUVgXiHXzLLmCo+T0GKGtOEcGgImLzu6YuG?=
 =?us-ascii?Q?7nmRu41AA2geDG/JCDEkC97Vah4t8g5/apifROYOz51UH/ecy/dyvOS8A+c7?=
 =?us-ascii?Q?uzwffb+8CwyuUE9Mi7UcvAvBKnpMUW/cXMa37ymu2tXaEmB5oZzys8axvi1k?=
 =?us-ascii?Q?arkFJH+8pgX+147Vnvqyl+TXdlQEXFnyN955S0CcyrCr6RMwGCmrwxxKd1iZ?=
 =?us-ascii?Q?R1dSNMS7eLWfWgsDd54J/OB/IsnMYQ/brfTz4l8Fx7GxPOi6zDq0SZRa0/de?=
 =?us-ascii?Q?0xANFcuDcQUdtcI8+fLA5b4Fo0T2sa47x9U9BVDsmRAMO5vsa64n0HvPdWy+?=
 =?us-ascii?Q?n1oxlqCRwYUMxx5aHpwIP0djiGUmG/V7Be2CvEPCkGqlxcJG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ae6233-81b0-4481-212b-08ded022697e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 05:52:15.0258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ODPNNbPBQ3nzEUz3ZvY/2lxkhke4OQwIu45bFh3qSM4k30I3DhgoocyJZNNTSI8uUSITHGZoRkskURB9yWW0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10736
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_225221_594591_C044588C 
X-CRM114-Status: GOOD (  23.95  )
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

> On Thu, Jun 18, 2026 at 06:10:40PM +0800, Sherry Sun (OSS) wrote:
> > From: Sherry Sun <sherry.sun@nxp.com>
> >
> > Use dw_pcie::skip_pwrctrl_off to avoid powering off devices during
> > suspend to preserve wakeup capability of the devices and also not to
> > power on the devices in the init path.
> > This allows controller power-off to be skipped when some devices(e.g.
> > M.2 cards key E without auxiliary power) required to support PCIe L2
> > link state and wake-up mechanisms.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  drivers/pci/controller/dwc/pci-imx6.c | 36
> > +++++++++++++++++----------
> >  1 file changed, 23 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > b/drivers/pci/controller/dwc/pci-imx6.c
> > index 0fa716d1ed75..ff5a9565dbbf 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -1382,16 +1382,20 @@ static int imx_pcie_host_init(struct dw_pcie_rp
> *pp)
> >  		}
> >  	}
> >
> > -	ret =3D pci_pwrctrl_create_devices(dev);
> > -	if (ret) {
> > -		dev_err(dev, "failed to create pwrctrl devices\n");
> > -		goto err_reg_disable;
> > +	if (!pci->suspended) {
> > +		ret =3D pci_pwrctrl_create_devices(dev);
> > +		if (ret) {
> > +			dev_err(dev, "failed to create pwrctrl devices\n");
> > +			goto err_reg_disable;
> > +		}
>=20
> supposed create_devices only do once.
>=20
> pci_pwrctrl_power_on_devices() controller on and off for difference case.
>=20

Hi  Frank,
Yes, pci_pwrctrl_create_devices() is currently only called once
during imx_pcie_probe.
pci_pwrctrl_power_on_devices() is called during imx_pcie_probe
and during suspend/resume (depending on skip_pwrctrl_off flag).

Best Regards
Sherry
> >  	}
> >
> > -	ret =3D pci_pwrctrl_power_on_devices(dev);
> > -	if (ret) {
> > -		dev_err(dev, "failed to power on pwrctrl devices\n");
> > -		goto err_pwrctrl_destroy;
> > +	if (!pp->skip_pwrctrl_off) {
> > +		ret =3D pci_pwrctrl_power_on_devices(dev);
> > +		if (ret) {
> > +			dev_err(dev, "failed to power on pwrctrl devices\n");
> > +			goto err_pwrctrl_destroy;
> > +		}
> >  	}
> >
> >  	ret =3D imx_pcie_clk_enable(imx_pcie); @@ -1460,9 +1464,10 @@
> static
> > int imx_pcie_host_init(struct dw_pcie_rp *pp)
> >  err_clk_disable:
> >  	imx_pcie_clk_disable(imx_pcie);
> >  err_pwrctrl_power_off:
> > -	pci_pwrctrl_power_off_devices(dev);
> > +	if (!pp->skip_pwrctrl_off)
> > +		pci_pwrctrl_power_off_devices(dev);
> >  err_pwrctrl_destroy:
> > -	if (ret !=3D -EPROBE_DEFER)
> > +	if (ret !=3D -EPROBE_DEFER && !pci->suspended)
> >  		pci_pwrctrl_destroy_devices(dev);
> >  err_reg_disable:
> >  	if (imx_pcie->vpcie)
> > @@ -1482,7 +1487,8 @@ static void imx_pcie_host_exit(struct dw_pcie_rp
> *pp)
> >  	}
> >  	imx_pcie_clk_disable(imx_pcie);
> >
> > -	pci_pwrctrl_power_off_devices(pci->dev);
> > +	if (!pci->pp.skip_pwrctrl_off)
> > +		pci_pwrctrl_power_off_devices(pci->dev);
> >  	if (imx_pcie->vpcie)
> >  		regulator_disable(imx_pcie->vpcie);
> >  }
> > @@ -1990,12 +1996,16 @@ static int imx_pcie_probe(struct
> > platform_device *pdev)  static void imx_pcie_shutdown(struct
> > platform_device *pdev)  {
> >  	struct imx_pcie *imx_pcie =3D platform_get_drvdata(pdev);
> > +	struct dw_pcie *pci =3D imx_pcie->pci;
> > +	struct dw_pcie_rp *pp =3D &pci->pp;
> >
> >  	/* bring down link, so bootloader gets clean state in case of reboot =
*/
> >  	imx_pcie_assert_core_reset(imx_pcie);
> >  	imx_pcie_assert_perst(imx_pcie, true);
> > -	pci_pwrctrl_power_off_devices(&pdev->dev);
> > -	pci_pwrctrl_destroy_devices(&pdev->dev);
> > +	if (!pp->skip_pwrctrl_off)
> > +		pci_pwrctrl_power_off_devices(&pdev->dev);
> > +	if (!pci->suspended)
> > +		pci_pwrctrl_destroy_devices(&pdev->dev);
> >  }
> >
> >  static const struct imx_pcie_drvdata drvdata[] =3D {
> > --
> > 2.50.1
> >
> >

