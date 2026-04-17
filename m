Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4851F8E497
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 03:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhC5Hv4KFrMNALYAHm6wZQl+WhK88pPM2cqbui3I3KQ=; b=BQaEyQjri+wwhxt965uWl+NdlA
	DGU4ChOXahp6D+wop17rdZB2sMqUMNFe3kCO/qj0+Q5tlX7HNK+IENzstUjYCRLhdLT/DawLEswPr
	oKVsNk22tmn0KeeNeiPSPZYu+L03vZ5lGR9dWAlOitxeZ0aahz1Pcme2iWoYEt8xjujpCUCHUK8uv
	B8Q66jboFV1kzciJkOxE5PI9TFHRPNDCLD3S6hOCGrXZ/ZRfw4hTot9UrVZU304U/C8EabfJrJMZq
	9c1rrn+L8rIEnpSIBHRRktZkE2Ko5gh9Fz9qao52PQfU5+tCZBw0NY/ATF1YbCs8g/tftFOqj+r/7
	RG9wn2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDZhs-00000003Mm4-3bL0;
	Fri, 17 Apr 2026 03:17:24 +0000
Received: from mail-francecentralazon11013066.outbound.protection.outlook.com ([40.107.162.66] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDZhp-00000003Mlf-2c7B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 03:17:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDSxQGqf0vX4sn7CVr2qFTvE3szE8Cl1tOBLlnZ4G1kZRQRPTxi1Aul3oBGu46AjiZQCcud3dOyIfrw/8aig8TnpikTeGGwgq4RTuLzDjx3Evqz3yB60XOfRFovXUz8+Gq8e98ErJLldm16TseZ6O26e6oLpANl8jhzoiGP+XlzDNSLe0B4ldtwvNuEJCr/FAHOsYNoEgVUEfljHexgP9QLkEWe1eVVYqjh9yKncGAo+4UdIxVR7wG8UfJrpG/qTDT8ntsU9t/UtNAd374OtgCb3gM196pbN813ApXvh+TqTDMgdQh05YE3EL39jUilFISmPQl6WxsAdseUxtXpsHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhC5Hv4KFrMNALYAHm6wZQl+WhK88pPM2cqbui3I3KQ=;
 b=KbtXo4GlKJI4DAhoqutxjLI2MK8eD+Su4pU17IJusZHndyCOViK+3zaL/Lf8RnNUL+Tl2lNDUtOzNALZQYLAxoGPzXLasdBSvH8VJvKq6LR/HCRtMtmy6EFNqdAKYYzH2RIMQPHPJFPBm6G5oQyA2UDTjkfxciUHAie5sFFYRB+JP6CfNZBRgj5WORF3QvLx3ImBqBMN4/rsNljm/wvZtPbEn/9hd8Ffu4ntj3yvZT9BWldIxKqyOA4qHXorpWVusCs8e+b7rvYJBEy/JvYQaaqFRjPK/WtAwlGbOPiLnpKcTheli3jlPL9k0AJGTqLDTW1UpK9tO97CbMDjPwEfWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhC5Hv4KFrMNALYAHm6wZQl+WhK88pPM2cqbui3I3KQ=;
 b=neKor8hfqjWXq7sjGhoGjURzKBadCGI6ZG/6InrMJ5oLK3KMVSFTGzsV21oLoqDa39EIVZo/fD2z8NHNkdNH65gvaNqpw1GxdRwukI75gNvYn69vw5H+aEFtNwZHBsiIv0Pwrmi34/9STjAfGrND80WkJ2AX+v1soOALih/78uZ7a0Az4O6J0dG7VeX7o/mXEIT24EjLslWn0NgoSG2VCmiZLswy0B5PIK+FCwpjh9P2SvH55HIWFZVhHWEppFZSsrv4w/ISEwFemK1uO5R8gbcA3uBOAchcHYPVmtO02SUhswFb8YAFyhxNhC2OPHK0RrH4gbdICMacC29VKlWPYw==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DBBPR04MB7787.eurprd04.prod.outlook.com
 (2603:10a6:10:1e3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 03:17:16 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 03:17:16 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, Hongxing Zhu
	<hongxing.zhu@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V13 02/12] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Thread-Topic: [PATCH V13 02/12] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Thread-Index: AQHczZH9Fw0NTzMvoUCb4PMSz4pIBbXiJv2AgABoHuA=
Date: Fri, 17 Apr 2026 03:17:16 +0000
Message-ID: <VI0PR04MB1211449884AC3BC8E3711F1AB92202@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260416111422.183860-3-sherry.sun@nxp.com>
 <20260416203905.GA29913@bhelgaas>
In-Reply-To: <20260416203905.GA29913@bhelgaas>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DBBPR04MB7787:EE_
x-ms-office365-filtering-correlation-id: 31cdc49b-118a-4f80-b97a-08de9c2fd3e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: nQIKTtESUfv6o46CI4Td4FzMFJe4PF9Tg4PN9sKoaMxfYLvHjiAxi1DndPEc3Ci+mxVDtxk8KnX8qcfcNhhqu1CHqw5E1zuMuROFOs/O9Lsxf3d7adCeKq2sktlEO6SL2WPbb2kbbZ8sgEk0RUKFEf4bGOJCnK/r1C30KYgRyhP4830RHjRH5nqrlvhGiESk7W59oYLaIySc5DK2+CgWd/wosdq1JtINNYUNm8dN8dkVXpYGc7VBXf97HpMuIwVAd5Alk5RLQjANifGAZyuVoR7GF0B2pp+LiOU1sxRp6O8+e4lyFljtdUYnHH7lRmCnBPygM94Fd/7Pgzy/m0UX1i2zSjXVoUQIJtvp1fYJeByJjngaxgYIeYOUZ8cUeO9FUQnDS2o5uyWf9bP9u+L4fjZaQI1NwI+FFc6ZdYO740qv6o9iJGNY9EGX89XqJYw4gdmGzowBxI/PuDuFLNrgeP0BoZY6LRJJQmmXWN0nw6mYs6fcHuF2AXZpe4wfRIia/kO22MRKjiMjC3YTs2mruN27eUjScQAdH/KbOuV97Md7o+ioNMxlBpShPMxbO1KBH+SdIlHZZMxcuxfOm2zXWswD6+Ia6I9gw4MUtGY7R6BMvir4HpffDh3RXuwwSkf7PdJfNWJkiXFKe3dZKna/m54zAFduWETkZkhsBkjhF/aloVesT/QzeCWk7a/gDDgg0PdPSWh8rzShTTA0SPuPTsYogfuJnbQCVNUZEx4K4BdbxRpZ2oxoeFL9wHEM2lE4iTBdkEf5g3sz4xiMUNcsulQFEMAWd//oDv/UO9qvU8A3faOIPl89Fco1gndBMwi2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tclBypOWKFdk9iMx18xMwQSwD2cv54njDR8Xluk9ZaeV51yjMwB6KuuBYsCw?=
 =?us-ascii?Q?wuN0J9/ScCAyQbRmNkTe+Oacmy2q09fouDKjkxZHJjQ5Q66jFwfi+M7/BTok?=
 =?us-ascii?Q?+rSBu5d6ZWjCXQ8bnlp6waIe6F+9ki0THZyktP/7Ks2kiRAvqoAssVyMDx6i?=
 =?us-ascii?Q?D/Phl+xYOXjEArq2cnttkVbRw58z06uQwaIn10/Sff4BcKec1FNY6F1CMFca?=
 =?us-ascii?Q?eUogdLxYObGHrvtcZMRhVNY4gjfNRyRNv1tzmzc4rTzIXKYgRmr3hc6xPwa4?=
 =?us-ascii?Q?E9XkaLW9jo1CUKdRkz3YTtauyEX7rPMxBU9KYRhq22NMzyw+5DoZHY5jG1i3?=
 =?us-ascii?Q?rkE7fafbh8+55RbwUsS48dStiFJHtqn3cduJHLQDGrl119mlK0BCwMn2NDEB?=
 =?us-ascii?Q?sY6Ar2PhGkw7wTMvS1rmiWk1fkACaTsGNy2tZkqAcAzzCIa87i9Ugc+QHDlG?=
 =?us-ascii?Q?Zu46+DR1sp/xWQGwigXhbfUTYNQCZ6yabBP5qoJPMC/KXeHcxhOQRQ1EQ6+5?=
 =?us-ascii?Q?852hYvphVFDOodxBvHmEOM3Gk0oIre9l8x7GIf7Uy8AXZ4sV4CTRuCmctpCe?=
 =?us-ascii?Q?AykB5APG7o3pDEh9lMkxTu0aa72vBvxA4QzC3NEQagiFuf/IRaR4OxCySfXu?=
 =?us-ascii?Q?wPN36xzcLqxi8Q5jXvCGUH534ohZ1CKIUQG7U+AlVlSI7oXXCMoN++R4zKNI?=
 =?us-ascii?Q?+arZyiwuN9yuj3ZN59tFpaqXZQ+KzudYYWd463eYt1s0c/yvHdiC+ybuZgKI?=
 =?us-ascii?Q?Ta/jtfnGjGdAHa6/D78M5reTf2j7CwI/CyldB+y2xU0Lw4UptevU+Aus6J56?=
 =?us-ascii?Q?ZRWkbpvFwKBoC9a3wKLGKfolAsQlJJGSKwWxtMLJq/xSoO5J91xioSeQuXwy?=
 =?us-ascii?Q?ljJZ3ko2nqGRIPQcv9IU6bt6GfFGHDgj2/nDzaupn/JYgTu9P9zB2RviLWQz?=
 =?us-ascii?Q?bjBcdsHq+GIsKjYCQ0NPvp0OOhpkVl7kY9NUV/QUCE2XlJhxLi4zRDSybIXY?=
 =?us-ascii?Q?K2fcQC2r2YdhOrblYYx1/TLMtXU2/23xi32iBpEhQQiAVvmyRPxxXUhja+mz?=
 =?us-ascii?Q?tuwUOU/716ityTLm6IaiZ8dzp2/50+drC4SAFXBniGTgaOaZS/5PaUS1Xi8x?=
 =?us-ascii?Q?Gtgbl6Xs8Nn6SXoDk8iWPUS0A+VdJfQol8whQqPgjAu+1DkFFhda9W5i0rkF?=
 =?us-ascii?Q?fWypMGIdE5QkJfSlIvUGYmc3AGTTmAx52piXSfNoyjhCIT+ozevZIiPRDsrv?=
 =?us-ascii?Q?Nie1VqENexN6KXnDgcY9oh2/5F8neHqZ5K/gts62NZGGDWoCmVfTyuD7zH0t?=
 =?us-ascii?Q?KljMyHGets8+QekgCqQ5hXHPTgQ1/V4JV6/9BATkPXZUHM9m26gQwJukvEWG?=
 =?us-ascii?Q?MuvZMfIsPArXtvHnWEUALBD/UybITcokEWz3XkvH9tynqIhYuCx8/oOI23t0?=
 =?us-ascii?Q?igHPwDychlyOSZx+bREjuAAHGJo0nZKQVp9aQddSsyAcz68vnOgpxpiIGBbu?=
 =?us-ascii?Q?eweMty64ZDsoTg0J7YAsz2bBMf2EJV2oKmqXRFkHYF9DaaKr4yKU1spZyDv7?=
 =?us-ascii?Q?6FLX9ZDgnumBOMKiv+E2YT9t8Ki5oLNG0XiWX8stSaYjxBLTowMYgMTdZyAf?=
 =?us-ascii?Q?nuwBE9Z6oJLe7d+YnWDoavSr1JQe5jLpPQtou2MnThfQ7e7w63XAjRdO7MwQ?=
 =?us-ascii?Q?m1tN0fYx/TY96wy1yo+ufcNbIe7dYi1V4Sq0RNIn96PTSJqo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cdc49b-118a-4f80-b97a-08de9c2fd3e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 03:17:16.5279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8kzFib327Xh6xMpSpeD5lpgCFemiEBMr5Rg/E/uSri75ahCK74H6/IIoEsBbrqD5gI6zdkpLpkdE9HRtY83nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7787
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_201721_693888_174F4C54 
X-CRM114-Status: GOOD (  14.86  )
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

> On Thu, Apr 16, 2026 at 07:14:12PM +0800, Sherry Sun wrote:
> > Introduce generic helper functions to parse Root Port device tree
> > nodes and extract common properties like reset GPIOs. This allows
> > multiple PCI host controller drivers to share the same parsing logic.
> >
> > Define struct pci_host_port to hold common Root Port properties
> > (currently only reset GPIO descriptor) and add
> > pci_host_common_parse_ports() to parse Root Port nodes from device
> tree.
>=20
> Are the Root Port and the RC the only possible places for 'reset' GPIO
> descriptions in DT?  I think PERST# routing is outside the PCIe spec, so =
it
> seems like a system could provide a PERST# GPIO routed to any Switch
> Upstream Port or Endpoint (I assume a PERST# connected to a switch would
> apply to both the upstream port and the downstream ports).

Hi Bjorn,

Thanks for the feedback. You're right that PERST# routing could theoretical=
ly be
connected to any device in the hierarchy. However, for this patch series, I=
've focused
on the most common use case in practice: use Root Port level PERST# instead=
 of the
legacy Root Complex level PERST#.

Root Port level PERST# - This is the primary target, where each Root Port h=
as individual
control over devices connected to it.
RC level PERST# - Legacy binding support, where a single GPIO controls all =
ports.

We can extend this framework later if real hardware emerges that needs Swit=
ch or
EP-level PERST# control. I can add a comment documenting this limitation if=
 needed.

BTW, Mani and Rob had some great discussions in dt-schema about PERST# and =
WAKE#
sideband signals settings.
You can check here:
https://github.com/devicetree-org/dt-schema/issues/168
https://github.com/devicetree-org/dt-schema/pull/126
https://github.com/devicetree-org/dt-schema/pull/170

Best Regards
Sherry

