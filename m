Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33810104BEA7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnZNIWIW4gT5McnrjCEND2AtO1gcUI+SveDgwJ7DLI8=; b=ZaaH4umOQp/bdNQoevpO2l3BPn
	LnKL5Bli+RD1b8kPEehd5/Zn0l9C5UFsvMRAAmK10AxBli3QGOFlvUwvJ8a59vRj3IaMTYoNteatJ
	8THwTcejsOhLRrgDJ4UDLfGuSE4WAXoaiGJV9p6wlgYK8tNTXDgqfqIWDZQZf2JPebpadYqOGqMW/
	qRmALbfTZFIgIFLD6eZzkzMxxyusi0dcWTTLkg9GtCit7T4RavwIKueLdHt9Rgap3001zpHBmhRIt
	auhcuzj+Z7P7s375OOFGRkIbZbsedYJT0zkMRpaMuFhMWmflidSDSFaje3r2Nq+qsdfKLgCqu07Wr
	GpNxkM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GPN-0000000BMbp-0SFG;
	Wed, 11 Mar 2026 10:03:17 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GPK-0000000BMb4-2vpw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:03:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhA+avuQXMkF91U6SuLEOls/p3BeRVUVvy6mw9EnDnb7AivgUI2ePCvPHz6ht00Yh1rxjNNI+/F0h+egnD8SE2rm7q+IET4HYB2ivqp9/6gy5YybC4DkdL4xn4E+pto6MJeybO35VibP28fIXwRoOcesOEkRSzT435YSxKVybRDnFIK+u5L4CTaYfFpDErY+oOdFMqADFFAJ82BVMsQ2vWKDGqDv/BteAmCieNW6h61ZLRSk8yFiydkgOspxS3GQugzCGzPJFpx2R3zkVKDVCPFBrmLF48NU1ivndlLC/A2d6w/k/CT/47qH86OZqymsGEcCrcQVUd5cmLHp0d1FKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnZNIWIW4gT5McnrjCEND2AtO1gcUI+SveDgwJ7DLI8=;
 b=ON7DXbEbfOeJOAgZFBQbdfVMFC4Wd31P/H9wa/txxidQ0IqhnGPqJ/5c2gaJEHF5AWwoIldt1nxhoRxcfifLEj4Et6X37KrendVyH97IwxpwW+gf/sJJB1BDFwlVwu7ZOAIvFoQwsyWWs9aGPyraHywPu1sY6nLTLXrXl3EMfonhynrJH9DP5zdFZtsv1/22hi0aVNxXBEbDGAToLEZiebmP+E0Huj/9UadMxlOMHpu0ayaB1sRYE05CCnbKghpDOc14pt6cp+P/b98JGHwleEpYgvxQNZYXjXUkNCNYuCtjQbC1cBThYauGTYodW6r5NluLyQTJHy2Qw0pnReR+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnZNIWIW4gT5McnrjCEND2AtO1gcUI+SveDgwJ7DLI8=;
 b=Hcz+TjaEFAfm3wONBOoWPiZYrHSe6cHRSSUfxrVjH/2qNkxwvfn4m8JLQqrOED5h5PdXcISNevRwaW2PErNqDkqBH3ARlbfocVlKOzvy/uEbAnZ5W31fjhrC4A75ZUjnmFjbhwcx4e5TEbNSpp3lZq3/rp6G7udV+v57WYD27NbNpZGeeWULKdaiZlkWj5sJIAmejEt/FbS5hS3UoPRwnwi2Hrbo8eAK1jaJYfu3nQjaVhktpmfV/YSnGXfY8iNd9pkt/9GqBc9z4Pd/j2YTyY86cYnwXYLbzRFhU/DOXMUP58jsvV+fOKA802rEuM4vgXHrRgbzNqdzV2GukEUcxQ==
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
 by VI1PR04MB7167.eurprd04.prod.outlook.com (2603:10a6:800:12a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 10:03:02 +0000
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944]) by GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 10:03:01 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>, Hongxing Zhu <hongxing.zhu@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, Frank Li
	<frank.li@nxp.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
CC: Frank Li <frank.li@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V7 02/13] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Thread-Topic: [PATCH V7 02/13] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Thread-Index: AQHcsDCq7m53HNRMHk2x8UrCaDSWs7WoFx2AgADdkaA=
Date: Wed, 11 Mar 2026 10:03:01 +0000
Message-ID: <GV2PR04MB121020F9D89A4025C6C59535E9247A@GV2PR04MB12102.eurprd04.prod.outlook.com>
References: <20260310015426.365675-3-sherry.sun@nxp.com>
 <20260310182854.2226939-1-Frank.Li@nxp.com>
In-Reply-To: <20260310182854.2226939-1-Frank.Li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12102:EE_|VI1PR04MB7167:EE_
x-ms-office365-filtering-correlation-id: cf8a813e-639f-44e0-e957-08de7f556146
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|38070700021|921020|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: a2GG/qxc3dsNTCZkHekh/ud06lvDgintIyWsV3rhoCbE+25yCTsk48JSZ4hZFVaTsoThZQtw2AGwpKK3r7HMJ4d3GvVO9iB/ZhwJhzQBw4Gekl7/XgohoQoeL/aPsqBJcMdhoDhCRCoVVgkmoc0dDxsjuqEQZ569MZgJ6DV9bNLxvDreLfhPib6192/Piaa1kqUjrqh1sO8wMpLTCQlxtTeA2fxHrXmE/BAdPC9Dy48gkfLqzjvJydSH4Q3liuAEpy02oUwKTO5S/F7HBb9RJcDHKxe6mGSiOxGPF1eAWKN/GR+MWGbJZEYMEBxB2MF7HIuE4tluvkkj0c+IEkoH9dMzj3SIN9Ix5hJN2IkWhuCa02UyH8iGRnKaWGyezmniInFpAFsjN+M/LuxpThqnf2rGoG2I6SrOmvHCReQV0fPh/ERn0zECLM+CgXDin7pBwVPcLsdIzxBxmna/TBZp2Cq//42grMLOqp02r2T+pUS6UZLQ+RBmOAoJOMWkm+Uj5/ZGFR4/tJJDFcgBJum+U9yshToMt6IVx7O5obkqbGHKyi7vK/b7p+SYrahFAudk42KQxOChFvTyxvf2o91rnK4ArjzVjPD18JtxwvdtE2IugBEMH+ZjDVZdO/9xenKhzIu2oZiiCsmml0fZCsPrGAFysMkTlGuvOlxECQDj5K1a7LT/EdV1i1Ad8ItA4MLX3GfJAfCPlnHPiKb+yo7gOif4Q0q2vKa8HsGm2iRB2rwsT/iDIkUOsyDJPxioO1phf4lkTzXylFhq1vZkrE4i/QyLcPrugrP1JWEJ5UnIvBUCAKXuzz5Q6XQQmlgRQBX5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(38070700021)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DkUplO7J7tuwUSxaEx/dyCraORsahzFRMmAv+coLhvjXmL3zaDBLm45ep2gQ?=
 =?us-ascii?Q?4+mtPaCZYPbmDyIFGgfKPpUTgRM9VxkEdYfyweTyKrJgSHw9w4gRtcEyxTFb?=
 =?us-ascii?Q?YU66tmA5PMncZZoaWUAGgqOSlIeKFWdPGpvyRGYrt6Awzt9N4jOcQDWYrGiK?=
 =?us-ascii?Q?cJys5Nu1kOhT96I9dAbAhkH5+IDOevRi/R8zeEc4QD9hJaVICLfS8yw592av?=
 =?us-ascii?Q?JDxq3CxWYLqTCrTzsSoxjfZFB518jsshVYAs+aO6kZt3kJqqTT9is5+ylitM?=
 =?us-ascii?Q?hnI3GDAgibs95OHgnfJP4ypitjupSCMaCLtU20lc6wOniwTb/niYkvoGZEbI?=
 =?us-ascii?Q?yO1Oh2ORVqmzZOCDcAIHvV+ACTLxojpuGpZyF03xQvPUXqtEyTl7cHXDHytG?=
 =?us-ascii?Q?PmlYFpev69T3jeRi1huVkoO9o0rhrcAcgANjvCfWP/Efjo3elN1/l/1ZwRwD?=
 =?us-ascii?Q?DYyQACHpoL3rN+Y6jSoIjFR0yCi0SgqbIH7SFzuo1eufbuP9C0hmh4Mle++H?=
 =?us-ascii?Q?hDPrNY1or2fV1TayPHVkQXQ6W8nwHYS4LA9xhdjB3ZEsjnyFUb2HC5+Ph835?=
 =?us-ascii?Q?cRgfT/GolX/E0KgT1WJvI9Dwa6S7Xbdxh0S3H5N2wX+VIvTEqZxcj28J6qp3?=
 =?us-ascii?Q?9U3W0mXLeDUSanD4Xuq9aBcMGBiEZMzGy/xCVzclSUu9rL4MII/ef7HZURXI?=
 =?us-ascii?Q?ugqRMbyA25bRtj8l+5ctavr9KXuco1povbcfk7mC92LxEOWdoML+wUVZEhlJ?=
 =?us-ascii?Q?ZKDLVRiAELVjUWhhtWtuR/7NtXX7FPk5Lktoz4HLByUzlJKNshO1bGJKom3D?=
 =?us-ascii?Q?GPDbSutlaviynrd9B0wl8ys8nF6nbpQBqcOPIaHnMegUrWA7r0sibOg0Pxeo?=
 =?us-ascii?Q?O8H79I/zrLthJmF3JNLCA8c29oWGk6xw5YjDNQkoewNnxkWYWdDfI4KZssfd?=
 =?us-ascii?Q?gQcbe/azcXexvi9Y3I7cYJABXyHtIb6sXzL1lKx1D0yJB3NF+EuLf7BhoHqG?=
 =?us-ascii?Q?lNE1sCg7NtJFgPQDcRyr1hJTeuH7Q9Bi4nkW8l43wW0PRvqlHamChz9zm+6t?=
 =?us-ascii?Q?A97vG+fXh4sPSXCTiTEs3z6GDJ7OdTfuirLuNfGNdmg+B2HEeWa+eeARMrg1?=
 =?us-ascii?Q?6ULtp+0aXOjV6XZsJZfmLWXPA/FtRGB/seHeBOn/Q1PT8c4ymySthYyUgu+q?=
 =?us-ascii?Q?0SWkPFqUftoWTjWzK686V452HLgC7l4on3vEzdstaqQmSnTwcZLQjMLELwrF?=
 =?us-ascii?Q?xvzZdlbLVe5EbvJOipIJbG9zzNuZ7qh/JcNjY2bzAqNJGEh6riEB1t9B4Tuc?=
 =?us-ascii?Q?x0WCaKVU/PZRKHNsZLcB0wrIB5NklQeK74kZzgBMhhsjK400OE8LhjGrtcYp?=
 =?us-ascii?Q?OGMcdUfI3FOk257Wn1XQS9R0I34UJyo/Xud0VNwkAo6zTRSqkfTVp4C6FTgy?=
 =?us-ascii?Q?4yx2SACXhtZTjA7UBwoEkiDz+0XLgNMQN/gSOUn9QSmI+Qnm673YuUkNw4vH?=
 =?us-ascii?Q?Z22g+QI3PG+Ba7/ZTN/K7WhG4UluPqGax7LlgGkpEAppv1XZoxjcKy9Hz5Ge?=
 =?us-ascii?Q?jc3Omjz9HgyekNnksWK4WoaWmMJjmXqL0zqpSieh1F+dDIEhjxWnHLRwODsG?=
 =?us-ascii?Q?wCABXIOFt4lNiAiXtLNRVwxUlRMuGAUEpBHQTiwR/meThyEwwrlFgC6G6JdR?=
 =?us-ascii?Q?67eRnjwCuApUS/vjNeFUs1q+EB668TU/7RMM31Pta8JhIUHN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8a813e-639f-44e0-e957-08de7f556146
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 10:03:01.3753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JjMfXm5eO42TqZyIQqYCBW2bLkDNt6Ni7d+g3+I79OrHOCKN1x9rAbAcmLDgTurEufz66CvmQZGPtnMvxZh6EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_030314_762532_EA1EA56B 
X-CRM114-Status: GOOD (  15.98  )
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

> From: Frank Li (AI-BOT) <frank.li@nxp.com>
>=20
> > +int pci_host_common_parse_ports(struct device *dev, struct
> > +pci_host_bridge *bridge) {
> > +	int ret =3D -ENOENT;
> > +
> > +	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> > +		if (!of_node_is_type(of_port, "pci"))
> > +			continue;
> > +		ret =3D pci_host_common_parse_port(dev, bridge, of_port);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return ret;
> > +}
>=20
> AI: Returning -ENOENT when no ports are found may be unexpected by
> callers.
> Consider whether this should return 0 (success, zero ports parsed) or if =
callers
> must explicitly handle -ENOENT. Document the semantics clearly.
>=20

Returning -ENOENT when no ports are found is intentional and aligns with th=
e
design requirements for this use case. This pattern is common in the kernel=
 where
parsing functions return -ENOENT when expected nodes/properties are missing=
.

1. -ENOENT semantically means  "the expected entity was not found", which a=
ccurately
    reflects the situation when no Root Port nodes exist in the device tree=
.
2. The callers of this function need to distinguish between:
   - Success with ports found (return 0)
   - No ports found in DT (-ENOENT) - this may be a DT configuration issue,=
 for controllers
     where ports are optional, they can explicitly check for -ENOENT and tr=
eat it as non-fatal.
   - Actual parsing errors (other negative error codes like -ENOMEM, -EPROB=
E_DEFER)

> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c index
> > bccc7a4bdd79..9cc3f4ebb370 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -647,6 +647,7 @@ static void pci_release_host_bridge_dev(struct
> > device *dev)
> >
> >  	pci_free_resource_list(&bridge->windows);
> >  	pci_free_resource_list(&bridge->dma_ranges);
> > +	pci_free_resource_list(&bridge->ports);
>=20
> AI: pci_free_resource_list() expects struct resource_entry nodes. The por=
ts list
> contains struct pci_host_port nodes. This will corrupt memory or crash. U=
se
> list_for_each_entry_safe() with proper cleanup, or define a dedicated
> pci_free_host_ports() function.

Yes, thanks for catching this, pci_free_resource_list() expects struct reso=
urce_entry
nodes and cannot be used for struct pci_host_port nodes.=20
I will add back the cleanup function pci_host_common_delete_ports() in earl=
ier version=20
patchset to properly handles the ports list.=20

Best regards,
Sherry

