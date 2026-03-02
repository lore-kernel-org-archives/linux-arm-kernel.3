Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57AAEA4E0E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DHgQBdMjIifbJakwiv9c2diCf0e8qNoU/aeD30XnEY=; b=qtLtrqSlHO519ufUXME5BvG6J9
	fm0M6DOpXpoCf+auMS42iOGW2fNuFI3kub1yMq1EuQQg06RAZmTdyGUUMOWrzpL/6sLJreskPMmoy
	GqlKEDGrIMVTRPK0enkyJIMjWUcfrxIZTVwBfLcWUj5Sm5CJeFu4fVex0E+MeU8ybFt95+dPjKXc1
	o76YCCKttTxxuH8dPsRpj/3aDp/LRNFNbabwBNIcwGeBJNrfTelTjT2EArkf17RJAjeISn6J75HXp
	JQEphU1IosYM/bBpR121cDi8g6cWDoY1oFV1y+r9HxRBrltrRGslcXGEIarRHJvNvBDj09fSffncH
	jsnICkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4hx-0000000DH2C-2Cam;
	Mon, 02 Mar 2026 14:57:17 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4hv-0000000DH1R-0MAw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:57:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gC0FT908hciMY2dGmvzKgbatohVFdEUsFIAgQ1wYlDpJJGtZF35PowLA5LJtZ/uw1AKU7KuvB28+3spzW9qtutFX9/lXUujBsCIq+r+8syYBqtzfN/NP7q5exRoCMQBVVcrhBqoqZxRavSCbRVPL7t4NynVebCyc6EbTCw9a3uBiWa6YZkxZN11kKadOVn2TFiBwzmFQ8vFbaOM9SftR+CAya4fb4J1RjLpgWC8K8YVN0I62aghAc54KPSNZpJpGm/GJftgHvPKmliZ3Q2BOX7MwR74ULsd93XEcQZoZ8w8sl3TY7Hvls7YpgYOWO6lan8yWCfg8ACZoC4fn65SMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DHgQBdMjIifbJakwiv9c2diCf0e8qNoU/aeD30XnEY=;
 b=OPeabaGvW+LN83R01jsDpiwlqqF4j0OJx+9WDd+GDo4ODquGZjLvpFQTdRj4Gac4q4a2QRXCVbPFMexI++whmQ4wc/RTcvMHWUCzCtGIrFthlCxKoJqAlYvIU2ahNJwmBR50mbABarJyLanQ47KTSEuzLKAAQA84V7XIKQmpDY+bodsl3GAYJAXr6+SrAer7CNQteJHXhaukNU20i2/wYpwVIDjIyawA2ese3w4mPQoEE0VS63AdLAEYgLOsuA1ReVtv274tNavSy5OHZPImcAQ8WslNzYZa3qwQu/mPlqKalNSlbwD9vSur3Ht+ybc/HuNyX755HLgdzrMbx5ZjSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DHgQBdMjIifbJakwiv9c2diCf0e8qNoU/aeD30XnEY=;
 b=TivToU9axOIjMyA/T0nV1f643c5eijWa9uCt5ntX3saqkRRkmxnzb5/ukCOcSjZbt/c9SJwPFIZZWZjIjzd9DFa7KH33Y75r4Gh811NfFs+LXJpyVxTKyzs3K3q6BMd/bbD2SvHQlFx6Wg1fo1sN52LdAMfupqTQweynL+66VPJ0hJtG+r+8Das0iy6dQ+TghNYXzhy8Q+mFuLVULcSTLEM8szUMv/6PGvovpHP8OfaxmDGLLf3pUEgPrOvROueE2px8jqUIMPBqlasVWi1VmQtjsYAV8+UlBHmZ3UJs0uyXItwiAGPznv2oMSuqYlAZtDRU9YzCphiDQtnYw5v1zw==
Received: from DB9PR04MB9426.eurprd04.prod.outlook.com (2603:10a6:10:36a::14)
 by MRWPR04MB12041.eurprd04.prod.outlook.com (2603:10a6:501:93::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 14:57:10 +0000
Received: from DB9PR04MB9426.eurprd04.prod.outlook.com
 ([fe80::9024:608b:852c:f484]) by DB9PR04MB9426.eurprd04.prod.outlook.com
 ([fe80::9024:608b:852c:f484%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 14:57:10 +0000
From: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
	<christian.koenig@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi
	<xuelin.shi@nxp.com>, Alexandru Iulian Taran <alexandru.taran@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: RE: [PATCH 3/9] dt-bindings: npu: Add bindings for NXP Neutron
Thread-Topic: [PATCH 3/9] dt-bindings: npu: Add bindings for NXP Neutron
Thread-Index: AQHcpyWNgEFrUuUjek+Hd2v4H4n447WWINoAgAU5y2A=
Date: Mon, 2 Mar 2026 14:57:10 +0000
Message-ID: <DB9PR04MB94265986C9FBF23C5C734337947EA@DB9PR04MB9426.eurprd04.prod.outlook.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
 <20260226-neutron-v1-3-46eccb3bb50a@nxp.com>
 <9970272b-b406-4a25-a7d9-8197934f8c3a@kernel.org>
In-Reply-To: <9970272b-b406-4a25-a7d9-8197934f8c3a@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9426:EE_|MRWPR04MB12041:EE_
x-ms-office365-filtering-correlation-id: 0c647501-fdb1-41a9-bee3-08de786bfb20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|921020|38070700021;
x-microsoft-antispam-message-info: js3zNi0ABhUxCAVQqpJwQWTIIk5ML4EHlDzrZ5eNZ0lY3W79miqWq2bk7TjzVyARX1ITG/uupC1bYUyDb8fIelIUCPJ1iwaHV/Zy1Zssj7PfpmUNUKeyvRaEIaIVWuJ0WT0YDomDWRb8KPQjAwI9VyPxWQlw4ltxdBBSvYIB2IylshbeI+ICFkMxrZmVEQnq/uk2rl6xyWLv9F7pGgpB3EnCRC50Cs1G5FM+b4O9DP73+qzTBpZCKY9T4M2a9sRwOl9/7fXVIc67XnpP3GG/uj6VP5vnkg4j8+8Mn4aeJkzoq/j2lQtzh3oWVK3XtLrF9e+8NnOw8Q3ZKMhfClh8J/6mLrmlbbm++jELKx1U+BYVtLT8hEHYJgUHVAxv1ywyB+zN5u9hQikxcTt6fTgJcpICOqbKhPv9JkUZ10F0bUvvZJFic/fyyUstIaw0Pu/DuCiiyNX2BwdCcOZP252VyQ3lQRtAzUuyqWusngFB+2CJdEz8xUEySR6VwqGIvMvMRswdHKAmcK/LK2+kn77mKeoHAfqt6Eq70+gKlKhUYTfwBRmT0tXb7cS/+b6kgD1+38fw+4v10Eovc58nCYVaVnBBf/fcjdtYtCVwGVKb3PdSksi7YQ4z8LlNlJUc6hxWyfsIK7u+xA5nMP1sRCesSXCcinbuJ4twJy2SgBVe0Hz8MZxKRFRHjeS/WcIorOMQyRsPfasIDIgioBddxRfzWfz8cfoCt32Y4J0ocVSZOuDyRl3kG1+PjSExZ+2Zui1J
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9426.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QL5Ytb/p2j1/klkLBFOMEM0kO3ZYpIUeFtZksPZsvLX5Cj+2jaEihIvAxf?=
 =?iso-8859-1?Q?eiJNPrwR3wG0uESeGA4RuFiT8O74xLyhZ7xWaQnR5Pn+9C8dRv6KBHfMDy?=
 =?iso-8859-1?Q?jwdCcO31qoIfanpd2+Pf1WnOwXJ/YhspuCGpmCMenIPT0bT1M1hcQ8kEYL?=
 =?iso-8859-1?Q?Jjzg+nr24IC329/J/YfKr4pY50UGWNGcNLOqaLScVGREMlCkFokqHIYktj?=
 =?iso-8859-1?Q?040Of146Y2dFasvjIg43qTPvcjuIeO8DpESQQS5PeBXZuRjuyJ2Pm+hBrE?=
 =?iso-8859-1?Q?r8SRYn46i06l8zEKeAB/rMko1EJfdZ/KCTTieIsyFY5Uz0/6F4rqNeZYeA?=
 =?iso-8859-1?Q?Fa/6hZ+CAkyNbOVWwGLex07brcmzCbLxEBuYBhrzhfdrxl+3Pi0v6HM2RV?=
 =?iso-8859-1?Q?Bmeu1HcrNW9/ZtN1Cb6FWsl6+wukD8m5FccXTw7gdlP2aYvuU8oNAGCiqm?=
 =?iso-8859-1?Q?aWe5eYIMVZ9fnNLyTlDXI3xfLqyqwiW95YKO1W6JiXohrRqHj8NuyjQMbB?=
 =?iso-8859-1?Q?mVyv8Sq9zkySvhP9tuB8+5SGECM4xIjZgO2gt/Qq66WhmUs/q/SU51hQyv?=
 =?iso-8859-1?Q?W3BE+i7L2DeP424m/ZIHcK0Ipk2kLZHB3mFojmn2CLSsa3XRdh5CPn5v5J?=
 =?iso-8859-1?Q?9iSJEpPf77sZYiDSh7yWlSGG/2HhmKzew5rTjfSjY9eOd8H1H0FvtSxhlw?=
 =?iso-8859-1?Q?2QdsBQAr1NZqxIbUSkuUd+CLxui6UiBUIA6ofumS6FisB37QJzzQwSqCBN?=
 =?iso-8859-1?Q?mJUoeWWkzQK2JckHRE+r/PvlkDVJeu7OXntlSzC1IFTeV3rY/ySLemjAwo?=
 =?iso-8859-1?Q?YcXbqomwfS0zV3LkRoDjG1SN70W4a4+NfGKFmEgHPEh2U/i72UT8zmWtkM?=
 =?iso-8859-1?Q?ynueIvU4aP/BU+8E/lQwAJ5muZTnGzKmMjgjrAMSZ3JSQP9B4q8XXaOwM3?=
 =?iso-8859-1?Q?AuFzArdkamgE5Lp+uLmGmmjQEYk1QWzzCC9bHBzftMg46PLw6BHfR1cBJ/?=
 =?iso-8859-1?Q?aDVI2QC5J6HxwVA6KmeOH8cAV+OUXcHrBYbDWli1luKt12F/NIxqTM2ueU?=
 =?iso-8859-1?Q?E5ix7vo8elAC6E88ZZg9N2fY59OvffMwukXgpszx9yZB8rlvANyeAlJT5D?=
 =?iso-8859-1?Q?oq3NAudFJiR7R9Nce7DgLCt3wYfVY3Je1pILeDPy7CTgVSyjJSn9te/Kvy?=
 =?iso-8859-1?Q?CjZ/Xn4weh3luQLmbJ5UbDG+gaoWoVWz91CMpAcS7XblvH542Av1IcUpv1?=
 =?iso-8859-1?Q?EWOrZY58Yv9gm751bgq8wej2kzPBrnUohEZirTaNzRGjWoxd1fMeICvkEC?=
 =?iso-8859-1?Q?INgG6FLZn2rtiLC2ElGCHKx2vHys9kHyY3o2HcW+2s2M68doQkPeeVAZuN?=
 =?iso-8859-1?Q?R/Gyma938Fa672YnaEsngcJ1VBoK57G7Lb/X1ZuVHzDRUs0TVKtzjDm88V?=
 =?iso-8859-1?Q?w7gmrxFsnx1zBSduUWgBKVRSwLV7J3A+Xgv0Qsx0ZEk6U+hvys8XKhIWgz?=
 =?iso-8859-1?Q?6k/zCiHnqgJHL4XzQg0MsRRcNdeXXqyUKh6d/GXQXTLF5Yry8l9nAovM+L?=
 =?iso-8859-1?Q?ReOkOgpShjy9Tjv/l5DGKLAntzEkSkS4OTmb8sWegHczESYCJIYGTX4vyh?=
 =?iso-8859-1?Q?5hyvuPi2fwiGW7QbKVxzKohXMOpEuSdykyQOe5CINAPtlhPiQ8U03kBKTz?=
 =?iso-8859-1?Q?lPw9jZlFSuXUDwywm5yUnJ/whQ4UcPGy0ZROctNKK7TRPal+SIMwekvU3L?=
 =?iso-8859-1?Q?cSoqPq39CJfGjmUlGW6MRaoj5YYbAggS6aZtGmbGrbMR+/UGT9FQhGvUcX?=
 =?iso-8859-1?Q?gqQ65ZMm3Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9426.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c647501-fdb1-41a9-bee3-08de786bfb20
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 14:57:10.3184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XrHOJ5Tqjfse1/VTASfo71JRRE8XJ+vWGRsw7AOOI+nNw31tlBUofLSbChqCd6XS33pVQ4mcxj5+BD/bH7cgCXDSM4b0tN4YMqbMwpebvD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_065715_124759_DF379B2F 
X-CRM114-Status: GOOD (  15.78  )
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

On Friday, February 27, 2026 at 9:06 AM, Krzysztof Kozlowski wrote:
> On 26/02/2026 14:40, Ioana Ciocoi-Radulescu wrote:
>=20
> A nit, subject: drop second/last, redundant "bindings for". The "dt-bindi=
ngs"
> prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18

Will fix.

> > +
> > +  memory-region:
> > +    description:
> > +      Phandle referencing a "shared-dma-pool" to be used for Neutron
> > +      inference buffers, which need to be 1MB aligned.
> > +
> > +      The memory region must be defined with alignment of 1MB and size
> > +      should be large enough to accommodate the targeted ML models. It
> > +      should be marked as reusable.
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 3
>=20
> Why is this flexible?

It shouldn't be, I'll fix in v2.

>=20
> > +
> > +  clock-names:
> > +    minItems: 2
> > +    items:
> > +      - const: npu
>=20
> Name "npu" is pretty pointless.
>=20
> > +      - const: npu_apb
> > +      - const: npu_cgc
>=20
> Drop npu perfix everywhere.

Ok, will rename.

>=20
>=20
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - memory-region
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    bus {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      neutron@4ab00000 {
> > +              compatible =3D "nxp,imx95-neutron";
>=20
> Messed indentation. Read writing bindings / writing schema.

Will fix.

Thanks for reviewing,
Ioana

>=20
>=20
>=20
> Best regards,
> Krzysztof

