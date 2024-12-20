Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBB6E77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 00:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/e51GvyrQnHEMqJKF9SDH++J0wx5NY1fcxzIefJnKDk=; b=PLQTB1uPRhVT9J+ObI3wMNp2Nr
	xgDGoMuqDnqENsBCp/chxAW2BGk/Jt7QXymHfgJrLMFGGNZ6Sas32fEnOb2jJWdWyRnv0QAt7C1PT
	RoeE8gSCMmcQpTsFv8wGLObmbKPcuP48i3aZ6TODdtH/s20JY8uvtdzNso3S5yVne73v4ypt+Zw9m
	s2wlbb+0Z44kTYkOF8vo6AY2BzflUHXwzejGPwAJYhJVwLqPZT+lXHwM//m9NNb00zjYKRJJs5VYz
	jTpEN2mEk7cc/cio5sHkEkB1evwquiy7IlrF+0nE/aS1oHpuna/1GH3cFBKh+pYCpw3/UMMAOndg3
	vpFkpwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQcx-00000003QdT-2bnb;
	Fri, 20 Dec 2024 00:12:23 +0000
Received: from mail-am0eur02on20603.outbound.protection.outlook.com ([2a01:111:f403:2606::603] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQbp-00000003QTF-0E3Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 00:11:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=greZogsOcsWyQa2gru9W4zRdyQc2Vq6nXmk3EoNTpVyR47kv9eRdvJbsnxt96EOJ7SO9UXpWVeojc2S9vqX1UGVoPv7BIFjk4kM7I0cpj2q1W/AYz60dW4tUb0nQGsIHjDhTDF3aeVKhBdUPEvLVR3kevZr6mmWK4pPHknPBkX12duAdxXG8fYLWKbhgeAAmRbd6fEh5UcJYxOHurn4PO1aK8z4cQgMH6wx47w/XHKHpgL4yMApL1dvVQU2kVaTwzWl1ylBVwzban8FsnQ/cqSpgW7jRjH7PejRIvMEDeNtRROGNw3ntyifYtKpGMn1+N5K2SyGQkyI+/k+ScE0fvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e51GvyrQnHEMqJKF9SDH++J0wx5NY1fcxzIefJnKDk=;
 b=mYKe8Zj8a3hNPvSt1ybce8vs/vlX+h801vsNxNBrTf1Nnt5rmIRMGnaa5WKvMCIInTZS6EJz2y66mGs9LCQELYgJd8hPsUcmqs4WVKYWv7m+gooo2JvqILYXXVTPYftPRTpnnrivtFenDCG25MRtyBiAwoFdd3FNUXT7SLbdC+FoK80UA22aqyoFCxdx4xy/p5LJDF0zCvxLLegAYaWpKGjahYgFl3FK+Uxivi2z+lrU87T4AW4utiV31RHqFTZQNNROoulacsQRY/JT0haTPCTJVI18gCdftidCO1yOztKIZRQD7sxxFUK1VUdYKoy81uvWuwAEkTTZF8CAViXGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e51GvyrQnHEMqJKF9SDH++J0wx5NY1fcxzIefJnKDk=;
 b=Ekxb51Eg6LBcQELgHMWcjQB/OcB9VVkTwXNGO9OOyERxiJyjvWepKBmdY5k+7OHd/pH0aGPepB44NMtcgT3Ynpq/J3tLUEETHP2u3/7OGNefiVkuZMY7jNFi+VVnpmb1BQdPAyuiEyFWvYRpcU2dkpn746NdeOEfNSEfjuIB95K+1z0n+ESiqc++1/5RYJ+Q12NANYGRPCFNUZvtPjS/wYc11XaOuTmSn7oY8OUSPIpbyWOcvIKLoEedPJ41GunPoO69ZgXpg4E48t/M8eYnffu48Yz7C48kCl6zNeOD0fyBGBk0yWndmdL6RyBQdGWiqFfDcs9VIItZoM0bK5UD8g==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8602.eurprd04.prod.outlook.com (2603:10a6:20b:439::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 00:11:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 00:11:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Frank Li <frank.li@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Thread-Topic: [PATCH v3 2/2] nvmem: imx-ocotp-ele: Support accessing
 controller for i.MX9
Thread-Index: AQHbUiHrXeSngRxPAUCxE4kfPl6ji7LtzoEAgAB0YzA=
Date: Fri, 20 Dec 2024 00:11:05 +0000
Message-ID: <PAXPR04MB8459E92CDCE9AE6EE7BDA95188072@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20241219-imx-ocotp-v3-0-b22371098071@nxp.com>
 <20241219-imx-ocotp-v3-2-b22371098071@nxp.com>
 <Z2RUVK/nj5Mf8hVr@lizhi-Precision-Tower-5810>
In-Reply-To: <Z2RUVK/nj5Mf8hVr@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8602:EE_
x-ms-office365-filtering-correlation-id: c4b31eaf-0020-4d36-541b-08dd208acc1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?qQrIehzgFBUd3cxZz06oWxBXPO7/N+8Fu6kNoYQBgrLFyXnlel9ztm/9pqBX?=
 =?us-ascii?Q?b5htqTEZ681dwGbbWy6V9vep8FglWCGTX9MkaG24e6J0skWrOpZwdYAuWrIx?=
 =?us-ascii?Q?vuHkPd0mq/EthpsgN4R10jc0cq9gnF7sA4zH0pOIQ/rYb8ytlaCxOz/KHn7Q?=
 =?us-ascii?Q?6RJWSq8KQT2IlZAU6PETtvq3aNi3vAs8eaCPAEViF1Js4bvEcUWXkQ/BLOaK?=
 =?us-ascii?Q?hIlBYmE4NtFz2cg6Vpo52f8u6oAdcUQDTOmNSraYDfQuxCcL7GKBE2LWo117?=
 =?us-ascii?Q?CEHTECizxbTPzqGpDWi4BU1vkQEZJ2/ulEgDTozzaPGjzu1Hrh0/JhCDuxmB?=
 =?us-ascii?Q?gxrk5gT4NBLaZ7HxCgF9t27aeGo9qPDn0nTGGYgKKRcbgTwLI6OpM2bYCc3m?=
 =?us-ascii?Q?c6WQRMpsnpHbkVCfU30UsakfDbLHzxjnuMA63fLwJ8HrD4ucVC2xGj2MOb6h?=
 =?us-ascii?Q?boPmVYYcrPDLXWGQxFkBZocYQRc2pGH6oykLaAusYwQQyHExQTF28iexRrEJ?=
 =?us-ascii?Q?u2uXcg+kmWfB8zzA5ytR23/oneP9hVWg6/ngN2Wrp/Q0orAMwP3Nc1WKBHCU?=
 =?us-ascii?Q?H234hQCrD9uzwkC/z3TGVZ6QR1U/fVnqk9wwPUifALfmh4VHSQ6rThmvIhqT?=
 =?us-ascii?Q?q4xS8j6YLwZkMVBhtjNsh9RcmUV/1QaSjni4GyWEiqXa8Uoib8baEEjR8L/A?=
 =?us-ascii?Q?W5CUm9NV5vgBnM9MuoXckX7SYyKqJvM0vpbgAaQEPvGgqBZArej3lxaUCM65?=
 =?us-ascii?Q?ELTXEPfhMwRDhcc6TNcWDDHCNINtMea3upGkWCPOrkU2j3eQO72smQPdi8GN?=
 =?us-ascii?Q?X6tYd5BVwbMoS8RdOT+Yz3jpO6kiCLN20ZUwgVfIYcziRrBBLBcAXcNYWxwm?=
 =?us-ascii?Q?Nukf3kIAIpmEevQn6IyaanjeY/fJFcp4WNaEEQcFX0Oah9f6L6r7jpD8OJnS?=
 =?us-ascii?Q?D1xK4vefk1r8oj1p2MaPTcTQXUutDy4jq4rjgu4cvnBiCSmf0OD0jujHlcgy?=
 =?us-ascii?Q?pbWphYslJE8cH4c8uPR6KX+1xo7IOBAL+a0NXXId36zdcd4amPzYbtTdmvNf?=
 =?us-ascii?Q?VUNjbHDgGfzZxEoUzT3Zkk6qOf6VFBDVeG5PHU8tlFs9eZj6cTFIcbZEaGdu?=
 =?us-ascii?Q?WrNquhEu4UvjMeGVwmZu14ylQHtMizC8tPMjcMyK8o4DRFYTBKDvvi0JABeP?=
 =?us-ascii?Q?3xRVNZXwAkwkHtD3oG1bpFsjyR0stIHpLnv0DI6LRCdZJuEzPTjgQBrsDq9w?=
 =?us-ascii?Q?uSrIAFWN2HBCPkdH3EMXAtQ8QtDeFrCfPXUU181RRLvSHygeVRu/AUqIqJMN?=
 =?us-ascii?Q?giX890dJajbYcHlOmz/l6e8LzAYBhpymNX5+q6aJ7ts35P5N97C73NnoR+gF?=
 =?us-ascii?Q?EhxabjBbkNthSNwGSDsvY0U1k+80rgVcifpyTukHiNx39QMr/rj5BkMkfEQV?=
 =?us-ascii?Q?VZFi7viEb9onaesGazUjc63H8MKTDdnp?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jMNE2apTQHSh4/upIPZ7opRfXBbd0ijm+XOx4JPX0ke+Sc7B0b50avgnkKSC?=
 =?us-ascii?Q?Nd9C2B3+yTr3TlhIENQCE5o10OPyokk0S7Cu43feMVoShjc4/htTH+Vp4N4w?=
 =?us-ascii?Q?zFnnW4Ab3pnOHUjKNKwPT8c0zJQJWzp5XXaB/XXDiatQY5RxfBaikeYuge+0?=
 =?us-ascii?Q?FUwVroWj04D0zJe7oo52b1jlo/Y1WY82WnpBAjAZUsLm7gwAPBGd5+6RtrQM?=
 =?us-ascii?Q?KI1P9eB2ihHw6y1fghwzYe1lU2+NUK4rit5RKiTRiPUZ7Cbj8Bcxnd5QC/Je?=
 =?us-ascii?Q?lOxjD1Zx4JI1ass3sIZ2c/o0WDOYN75tMeYVM7I25GZkz//yzBLFZhqHVQxe?=
 =?us-ascii?Q?Ohn4T4TfdIV/l8/XmOzE5PVPBuKqqsBLasu/NwWGqNOGXGvU8Ax1EbuPEzdb?=
 =?us-ascii?Q?n7A4PYlD3mgxZ3oQ+ZVn29ZkTf5oTAEwH4bAJ17y7HMeDqgjIRWu7ClSUBXr?=
 =?us-ascii?Q?vpG+zuNiVog4pSpMwAcMADYwugvIoXk0JYuvOWSBUNmFpsoGckkw/kFyQjgf?=
 =?us-ascii?Q?z82+/xq/reO47SmttsIvrTIFODSUSXHzQ6bnToxcX/HGVu6auiSLeFKnRceU?=
 =?us-ascii?Q?s8oxd/k/TGQsx8ieby+qBL6v+G16rMu2NiNVyUif1vYmgvQlXuAw2P06PUmB?=
 =?us-ascii?Q?rptay5X31lA2u2LYF7e7865nVEyNE1Cy37Zp/leLbgyK0F50OgVlwPEZdFck?=
 =?us-ascii?Q?P0sMPgyzgJE8+RglzRjqAYjKbHXQ7FurGkXI4S7bSAeVsg3Iy0UrAve26oMt?=
 =?us-ascii?Q?h5RzB1OOfW+OLY7IYbzjsWFnlWpEO5N75d8IAQ9JJ5y08bKDPQnZ/RHeaXD+?=
 =?us-ascii?Q?Ah2Ep6UaNum7tpOkCEC+vrHjhprj7bfxNKFo9pQWxtQ0LSsm8ouRoolAQ+Km?=
 =?us-ascii?Q?IomH6PWchQfcV0ae7BZ7k4FHtjekvw3JU0j2xkuTx+mLAuqmDaaXsMHs3Rbp?=
 =?us-ascii?Q?4APIUHxgnyEwcPBnUlOyyfvaRzWnjuXCvOOr4MtWlP3Af1+4iXXLxiD9/d0Y?=
 =?us-ascii?Q?vBBTpFcI4trENQIoehUTbjHpTYJ6dCVAOb1QKyKL9emxdKD+y/Z4B9zmf5JR?=
 =?us-ascii?Q?UC5mi5zrvKSr+0zSjYT3PaDfAWDCyjaaVGUY8sqayyAdlwOLwCzi74FqP4ZD?=
 =?us-ascii?Q?e3JG8Uo/dvF+vL6nVJGCsRqOApsGqLrk0mYjJpP7rW7r4jJ60FlfVqrD0YqZ?=
 =?us-ascii?Q?PJz96QwLZAXkbivB20C+Kk3AduhOrkEWhWSCNOYpJzbmXSPmSNrC16FnAGFq?=
 =?us-ascii?Q?X3TeXcVlEj3e+Mb5MFtOVCqomKPTJ5m5681u0aTxo6ST+AV+y6fb/HexIplD?=
 =?us-ascii?Q?HsJQ4sKRyzsyEEOnb90xUliOSElc7KA1dKPs2nfM7CNinMwmKjREzucEV6S4?=
 =?us-ascii?Q?s6/6LwR9UuNNcYiY57+bJ09zRn//+QcfjLMTImWXe1t4mdbMdwHvMF4Z3aIg?=
 =?us-ascii?Q?Sk7DfBCkV20EybpImveu6/yu6BSTBtnhlxSXMRwsXGI6tOS31nBbaUi+MWfe?=
 =?us-ascii?Q?KnEnDhQIJhZ0sMB9AjAps1ypJDqMDAPa1enKyQ+wxIVZkdzKCDRS0fWeGYIn?=
 =?us-ascii?Q?JTo4KqFJi2kCI3K/GfQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b31eaf-0020-4d36-541b-08dd208acc1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 00:11:05.8305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/rgHQDWENp7xZ3gMuNSYVduT+/SSE96gFyRtMmZGFvI6W9jtMYk9UlVmd7DA/i+5ka84pD6TBj3foPjpa8sKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_161113_130763_38BC8F3F 
X-CRM114-Status: GOOD (  24.16  )
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

> Subject: Re: [PATCH v3 2/2] nvmem: imx-ocotp-ele: Support accessing
> controller for i.MX9
>=20
> On Thu, Dec 19, 2024 at 10:25:18PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > i.MX9 OCOTP supports a specific peripheral or function being fused
> > which means disabled, so
> >  - Introduce ocotp_access_gates to be container of efuse gate info
> >  - Iterate each node under '/soc' to check accessing permission. If
> > not
>=20
> Nit: Iterate all nodes to ....
>=20
> >    allowed to be accessed, detach the node
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/nvmem/imx-ocotp-ele.c | 183
> > +++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 182 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/nvmem/imx-ocotp-ele.c
> > b/drivers/nvmem/imx-ocotp-ele.c index
> >
> ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..173863b1fd7de1505
> 76b78f03c25
> > 6a151b174389 100644
> > --- a/drivers/nvmem/imx-ocotp-ele.c
> > +++ b/drivers/nvmem/imx-ocotp-ele.c
> > @@ -5,6 +5,8 @@
> >   * Copyright 2023 NXP
> >   */
> >
> [...]
> > +
> > +	for_each_available_child_of_node_scoped(parent, child) {
> > +		struct of_phandle_iterator it;
> > +		int err;
> > +		u32 id;
> > +
> > +		of_for_each_phandle(&it, err, child, "access-
> controllers",
> > +				    "#access-controller-cells", 0) {
> > +			struct of_phandle_args provider_args;
> > +			struct device_node *provider =3D it.node;
> > +
> > +			if (err) {
> > +				dev_err(dev, "Unable to get access-
> controllers property for node %s\n, err: %d",
> > +					child->full_name, err);
> > +				of_node_put(provider);
> > +				return err;
> > +			}
> > +
> > +			/* Only support one cell */
> > +			if (of_phandle_iterator_args(&it,
> provider_args.args, 1) !=3D 1) {
> > +				dev_err(dev, "wrong args count\n");
>=20
> you call of_node_put(provider) in above err branch.
> why not call it here?

Good catch. I will fix in v4.

Thanks,
Peng.

>=20
> Frank
> > +				return -EINVAL;
> > +			}
> > +
> > +			id =3D provider_args.args[0];
> > +
> > +			dev_dbg(dev, "Checking node: %s gate: %d\n",
> child->full_name,
> > +id);
> > +
> > +			if (imx_ele_ocotp_check_access(pdev, id)) {
> > +				of_detach_node(child);
> > +				dev_err(dev, "%s: Not granted,
> device driver will not be probed\n",
> > +					child->full_name);
> > +			}
> > +		}
> > +
> > +		imx_ele_ocotp_grant_access(pdev, child);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
>=20
> [...]
>=20
> >
> > --
> > 2.37.1
> >

