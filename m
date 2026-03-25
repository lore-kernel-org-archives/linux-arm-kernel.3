Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755C1FEA82F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhP+ywTh4vCBzdbbO1sQkHCZ7/5t8ldfXrr0dIqHKl4=; b=xk26UltYWFpGKPMSnyrsrGlzL5
	t8oHwPchplrO1DHvJfT5pZTke4Tq9ZTjXK4RPtejI22Wio0OZ//groLwmF6E7abJtA53fPPsDciJV
	377FoY8/NnqLrrI/tEjZqOFi1pH3qmoOz1ZckURL69oVtMxl8xxg8oSIG8wxeVnvEcygMtnp3MMAf
	BqHTROn//jwtvrhNICW4nwGfwVHTnUX0EC1flatyLOfMY4I5bbxECkBgjHQRYOBhLPDU/v+m//1QJ
	+c4OhfQieT5/VtRir6qRiZkqwyA12pxvq472C6UxUFDL8PsxIltX9Xewq1XbLqVfiwdZSvPMI8yIQ
	XeUD6zHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J2O-00000002sZ7-1U57;
	Wed, 25 Mar 2026 07:52:24 +0000
Received: from mail-norwayeastazon11013064.outbound.protection.outlook.com ([40.107.159.64] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J2L-00000002sYd-3yyH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 07:52:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzNR443jg/AhbEGxxD2a0Lp+gBHHSyAU6/JVanG/o0IYXagIsVrCyVWv7koHckJpvtYsayBi/ekrVeTw95LNfUV3X2PQZ8C9enn8L8c4vpHminAh1C5jta9nAxPczi/F0t/BfbqUK6eDlybrDnpitIy7WMts1mJqorWmmZu2PeCCP2YYYQis5pJgtQbKls3WA6Lvwf45T3JJAFWRebmJKpz1xp97XiIy15pFvcrwMx13OmyJlFX89FUVvU5ANs4oR63TzqtbfN+c5eB2KcJEpqRmcCAXPD5bn/jAq+UO8wYybI/FJe/3kJ+Z+8Xb3VQMP8ujO/IzbcPZaL0Wzd2d9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhP+ywTh4vCBzdbbO1sQkHCZ7/5t8ldfXrr0dIqHKl4=;
 b=oE8FAVFdKkJixn/RH47Tch09uyVv2ysMPeG82nIEMy9uO/zloXK8tPY1wPLVOf/8jUkzStLac4KYXbXzFBMoBGkqoCkCxWAbltiKokqKO3M6YSbKRVd8NM0RtTB7o2Zn4+JOx8hiuMuLJr2++n4sc433ezt75NVbUwXNFkeJuskYcPCQ15FCKR758BN66Rm1/pUze611Er8Z+NWlu+OK6kxr72q9QdBSa6kY2x9xOT8jW7MLG8k8VxV3KqCgPGijm0mhdGkT8p4Si431pW5KfU7C8RCdHgcTu7FeYxeerRNGF+p9gjSHwgyOIzyvlwshfOlDQiYnw7MRB1Dq799AHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhP+ywTh4vCBzdbbO1sQkHCZ7/5t8ldfXrr0dIqHKl4=;
 b=DmkOOuN9jzeMzOqiFotvp7mET1T6kBFXWJeElJNWVn7L8by9nBjYe0pKoR963HBJ17U4WutcCFE2ByXcsWnK53iHv+N+ABWSaVukNxQ/XM3tDbPOy4yILBCpo39+QoZAt6jwuizNFlPCHP4Hj7tU1B6RAbX1G4cmO/e7iu63tVDdSF4ui2K10CLqlnEPrnf61nySXXTIrBzQUqrhzUHEQWJFLFmro4pAEDnKFvn+ZULE67eiFHaLN+2H0Pe9C/TC7CwHpFQl339pORzwHzpDtGpE9RGHIkkGi6aaOhqZ1xbx/JlzZ6u5VikmKQXMS0iXlagkBWKlMddYTwUPkFYgbw==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by GV4PR04MB11942.eurprd04.prod.outlook.com (2603:10a6:150:2e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 07:52:10 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 07:52:10 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Thread-Topic: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Thread-Index: AQHcsFgtipls7Q9Tf0ij/80NuUVIBrWn34OAgBcWzSA=
Date: Wed, 25 Mar 2026 07:52:10 +0000
Message-ID: <AM9PR04MB8353EC1BDFB60DDA2137B4B4E349A@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260310063522.362545-1-chancel.liu@nxp.com>
 <abA0W82MyPtB2iVj@lizhi-Precision-Tower-5810>
In-Reply-To: <abA0W82MyPtB2iVj@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|GV4PR04MB11942:EE_
x-ms-office365-filtering-correlation-id: c09a91d1-019a-4ded-46b3-08de8a436bbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: uoNJMooHSzgfkfIKqFMNn085qJj4AF/ZfmVUfurgm7CXP8Sfwuo/sodZIqw3Le1VQKRHpP8W2y+EXRvvmhuIzUQ2g1Xh0CLX1XzQaJo+fjsNXhDlQoGjSX6kwLpIjQyIyPduvgAk6nHhJoyuyfCpjC5ShuPyO6PdmAVaAegKwl/k6x8xYjGJ5HpTicTCUmoY0R//dSFfbIINPp0RjdqZM4DH9l3k8bbfYPrNH0E8n5vrOuSY36kKUNwDSeQlcjhSDqM5VsXSpamqIigd8hpN38cEuj/sTG/CXvKwAp7iPKVqmZORiOWAH+XevtvxdBLAIVAXvSyTmbctgE0MdKfLEC7Fjz1UqvAA7SfClbGRkox2alt8kRpcYr8AUPenwLS3ytVIHg9Z4T2cvkMJO12dIm0V8BjWqrB7IEeFIR1JqfJwtvyxqX8SGuNj+LdMXhv70NuRxmyBMeAqSO7jJ7FUZtyy1+p7jZpW7Gz771WT9lIOjCkewzIeh2CMnmpE5wog/TYVnPkm2fF/UgZLPTyXRiB6DI4MZa96jNV4UOYKuikqvE998wiKf7AXSmziaMT9x1ecjgoiGg89RrrbhlLBqWqClmZXfDcMixhrwUsZecvUqUi1ElKM5EnmlEjtPJppE8cMp/wf22oXHS7CwsZWZ1qQTdHhPN3ClKBpDA/CPMRwf3yKRZNjEAjKfd9tTOT6PuVve+BSbNPdskyS4pienLfkfPSrgBKJnKBC/taftIbrZrMFv/IZDGPV8JIcaJhRQi6RqWFwXux7eDd88FBuDsQf0jZxyb2TiSoQUF4AXGs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jT5hRMwpQxgoQ0U5PZKiRXKgiH0dQ8U+6gQ+I2vNjDkZILtmox/4p2LkvoD3?=
 =?us-ascii?Q?Y047kjVLOEs5KXEKVJrFyvBQI9haM3JIAh+qZ5yQZE30mx++4M9+hWau7sgv?=
 =?us-ascii?Q?NPoL16mnliD+eg2uSmYrnneUjmZVHOO5OeRiLGFPSB8I5OWIdj026Q8SuVZb?=
 =?us-ascii?Q?8Axu6q7Q28iGfWXFqvGsuGOlFncDlRoNU1ZW4S2GuyUva9vuhjD3VVzLdV/h?=
 =?us-ascii?Q?EpI5fPDCI4rkI6rwVGBqOYMou8P9TxOSRPRZi3isiz93GapvFXmjWkm3fFkk?=
 =?us-ascii?Q?m1z0dPVP7CAuiiySzmOKd/uaXrC3i5VNSKOAm/Bru5L034A3+hPpv9+Mryg7?=
 =?us-ascii?Q?QZ0tOoOC0b6nOrOPEM2/IFxYvXKDML/MQS6ZmMLHS8I+VT5dJNy27aZ0uJHg?=
 =?us-ascii?Q?D8QHqbFVDhPOXQBMtNxW3OmtYYLV9cbBgpENK+3wf1Bv4mR3F9zEsBKeFy9V?=
 =?us-ascii?Q?ogd9hDNENnBUIKpLbPxUzyguDoVr8RQwiKoYTMdyE8yhFOVqkUhMzhfHkSns?=
 =?us-ascii?Q?Zm8qvwo/escvrfkUgZNP8YG79XgYEK73jKgQD7A6eIRxgYuoheqoJG2esVht?=
 =?us-ascii?Q?tH78pI6Q/w7bnf0LMgH2U+Z3KcWAmAYe7Xmk/DroVXJZMNsMPp1suOFwT3QW?=
 =?us-ascii?Q?gdpm1OuOMv7Qhd33rN8nYzFFzaPVPsHDDe6vlhdz00ivmixQLedK25mnaPfY?=
 =?us-ascii?Q?1WwYuVi+pZ/yWAbAiz6qwR7rXQxZlDUr1xS5nDeyNLY9qlhAMkoduhBp8VdT?=
 =?us-ascii?Q?lNLBdCq7v/+TpVhoYQ8VwOe/Lcz82hAhnTXkiP+c4+lpAzwLI8lVoeR8HPa2?=
 =?us-ascii?Q?s4LkWFTKQc1IPx0I1fyA+kg7+YucZIryFdoV63fjn7davnjPeP79Omc+ucIv?=
 =?us-ascii?Q?RDDfPNG+oAOzj3q6nDpXbwGsru/DLJr5ki/z64TdDs4DpuBw++VFtEm7A6Q/?=
 =?us-ascii?Q?46eflkMbEs1UQrG8G0c/5rlJLbSM2tm2Cc9h2zEVonFtnZ5Xv9tdPeO6KuCF?=
 =?us-ascii?Q?wjHr1cM8TQxhN1vdx39YnDbKaYhBG/pfVMPUhw7/siOZBdBq13t8BBMznUbv?=
 =?us-ascii?Q?L8dlZv/eAo0ZxuIoL85JykzM4F0qBMc58fShM3yqdlMV0QAUuA00DAVguQJR?=
 =?us-ascii?Q?fhieNOnEjJ0HmkuWEnTjjQkmMaPsb35JtpD5ibCCrcsHB4yvWlielFTCwcEt?=
 =?us-ascii?Q?JYyK/AcMZq+ytUq/7T/86O9B2tEtqx8NqqZjDTZWGpNTdcJeas8nyU9PGcKi?=
 =?us-ascii?Q?CzW/aJVthAf5eTFWBL0grKBvx8RGj1jIyMCpH0clyI9abf5SixDXy+/AaJaC?=
 =?us-ascii?Q?a5vZ4w40B/Xbfo48Lo+C+ENkVUbrGV/syT8EUW0eZLMOHQX3RMwwv7+HbOOP?=
 =?us-ascii?Q?2Ykjv37Wova4G1cfqM8HeS75UoyBFt3HrCdHMwZ9cRlMBLpnHyJe0DiatLfC?=
 =?us-ascii?Q?g9sNkdeEzioNJbFmp+TO1OBXjZcSPKK0FGzjhEb+uJ63LHOUT+mdJvUGf87u?=
 =?us-ascii?Q?1Lif1GMm37I5zUqY44wYtNqMlqZ1dEpHTnz17MPCkLK5R4/uJhKTdEpmLkgd?=
 =?us-ascii?Q?f+fm36sfgKf9K+26nR5VDAjVZ2W0nv23WArnu1hEqG533MKT53/hVkwzdlA5?=
 =?us-ascii?Q?JL2D7ByhIesTmYJMAcD5yme4isKZO72+7lkHbGLJOnWoeiTpgZFzspHUHqFy?=
 =?us-ascii?Q?yekoE45u292fhsBkYT/0F2vB2mgd5QiymTXsIU/FzdkI7ej3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09a91d1-019a-4ded-46b3-08de8a436bbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 07:52:10.7534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOUljzeBzDMvfo75Z2sAuqx19T/PsG8kXwoRMIfORfAXQuQYZhHDFvyzo/GyyIrtIIArWVt07ZqPs0AGlDoqVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11942
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_005222_014667_3AD86F84 
X-CRM114-Status: GOOD (  17.28  )
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

> > The imx-card machine driver originally supported only codecs operating
> > in i2s or dsp_b formats. This machine driver can support CS42448 codec
> > and this codec typically uses dsp_a for its TDM interface. Therefore,
> > dsp_a format support is required for describing such sound cards in DT.
>=20
> binding is descript hardware not driver. s/driver/device.
>=20
> Frank

Yes. I realize the commit message is incorrect. The intention is to
describe the codec hardware requirement. I will fix it.

Regards,=20
Chancel Liu

> >
> > Update DT bindings to include "dsp_a" in the list of supported DAI
> > formats.
> >
> > Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > index 3c75c8c78987..5c08289346c0 100644
> > --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > @@ -36,6 +36,7 @@ patternProperties:
> >          items:
> >            enum:
> >              - i2s
> > +            - dsp_a
> >              - dsp_b
> >
> >        dai-tdm-slot-num:
> > --
> > 2.50.1
> >

