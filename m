Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1E9F36BAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 04:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPtcU0tdjwkI7Oi76nLZRda3lVgg/M15sIbQcUYTH7I=; b=hJ//GZwOZDGLdlCiAYuXmBzeuc
	+rAyrRll8WtIB2yrTEOiwTXwugUzTGh8NVvvKnZO7WafwCytjNJXevyAScJ3yJCUYHuxO0yKMAD9C
	T55BvVKwjHwjFLJn40HiVxGXFHFOCZPg79WvkDZsArrUIauRuIV+6YwS6le07ePfC+7HFTp3kmih5
	fM+gKXpZk6l5d1Xr30PjyHdP1OOFgLgIYvEFFCaneTGx7ASdfM418Js13gtphlODJ8+Z5Y71V8dhB
	lJCNV+LOWKwecLI9Zzy13SywvWRPaV3jezqhtzppL4Qq7WMIxKZGLRH1+c5O0jfc+e0TwI8pezflo
	uvJWwwMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3aW-0000000Baqa-33FF;
	Fri, 10 Apr 2026 04:35:24 +0000
Received: from mail-westeuropeazon11011003.outbound.protection.outlook.com ([52.101.70.3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3aS-0000000BaqD-2ffR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 04:35:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0aqO37C47f1/1jjABRKyxTP++jnbhagw+wrX+yxmwECVquG+u73fc16shIHxFwljYuPEY7kktaVYNmCD3QRSGmb/V3eJCA1UQQqoP+Lsb8aoyDKV7Va0ODdhco6p+D5PumamUIEt6plcxPfiubjL/4G1NQQPdqAMn+eOsyBrKfRQB8Ok2Xquyw6TY5wJa4L0KWVJcCMCWoIbFE2Yczbp4VyVMCMNdJG5W38W9TpRG/0SInFq8FvMMEfHF7tERbdkzSsmtn4dewdcFIr0pxa0UphSUNMAOAD3EbSfBG1d2FHy1xPIJWsUz6vyG0FIeq2uHkNN50W2bJrbOUU8jiwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPtcU0tdjwkI7Oi76nLZRda3lVgg/M15sIbQcUYTH7I=;
 b=DA1avcuwsl0NVyoiPde8Y+cEEwjsf+e7nEyxETL3PMLR1QdJiqZLVshnpDL861IlbPoUcyTvFCUeR1EL3O2wxigyEm40Ndu7U2dNbDEzPU3LhOyC3AqrcFvyyv/Ehqd/MYrWmdDEnH/A3URNaGuGbOZGex+NkkDGCEk1DH5UcANi9ZRQrNx45ytymRqiibImQtQvpmwBOBsqJ0KZvel5FtaPARDwFiB1aUHrqcO6evxnpfGDcSF3SxifAhOKg5h5mEBOB0ZbH0FO5jziysubzpB8WUePRlt5VAdhBEnSLFHGMHs5L3YP9EG6HJpO/oq5WwfE6mA+Uie9CuU06TxDhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPtcU0tdjwkI7Oi76nLZRda3lVgg/M15sIbQcUYTH7I=;
 b=MGyTm7ugmQ6K5SrwDQicHUT0HQ8Tqtc5MuQyz1OXCKWz+60EpBeVFOJ8t4AEYcT2Oz7sobascu+cW6pq3aBJrCT3xsMYtd4kFViRmo83/pMANNNfPA6ZyFmo22i9tN+LX8dypjdfoyJgMNHvI5olq9Y0Cwl0URAWlDSTDjWZ63YuzCIqbZAtATnzNmmGmL9LKwLrOnlrbgzQMTKPQunBxc5VSAzhY5OlX9xmZ1rCzrZuYFXweJnI0fTRwSKaVF7nX2UeB3Y47il5iVWZnVaAgSpo0YEF6Fx0R7/v4KzGozSseEOJOwbvwqeIP8DsyYdCdJqUIOTqGeVHc2DvEeRQ9A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AMBPR04MB12207.eurprd04.prod.outlook.com (2603:10a6:20b:75b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 04:35:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Fri, 10 Apr 2026
 04:35:14 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>, "abelvesa@kernel.org"
	<abelvesa@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "imx@nxp.com"
	<imx@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH v1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x
 PCIe
Thread-Topic: [PATCH v1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x
 PCIe
Thread-Index: AQHcyJhTB9fYU+1lS0mqTMDZtSZhA7XXtSBA
Date: Fri, 10 Apr 2026 04:35:13 +0000
Message-ID: <PAXPR04MB8459C5F6CD0A8A18BBFA306488592@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260410031656.2578632-1-hongxing.zhu@nxp.com>
In-Reply-To: <20260410031656.2578632-1-hongxing.zhu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AMBPR04MB12207:EE_
x-ms-office365-filtering-correlation-id: d6274b86-4216-4984-293d-08de96ba8f0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: pqtzO9hy2p5LkJzyUdLaXNS1y1cbt2G0aVGiFCjmMZaAI/iWkuLbX0RtYQM6WzOt1ZP8gdwyPKZh3wzQzRfwGYFobrhu3AQw5W9HtSCnrP996ASE16MGoulcJGqPeb3lCC8xTLxgwL2YbSl/F/R00XB4RFFj6oElHqTJGGWZCtYvsj9ZOg8PxvAKbXwGiF5eA/V27ciQZ4XE0rY0VhSQFyke/mEvX0k1eeARdK4I7FtySvULknjIIKxvLHp++IkIRki8mLPKZVaPLpLxRJrAPfvNkG2QyhvaBikAeD+tkp8yDrgHbx67lIUL+EKQDWYs79tK83vlZG2PKFTZGk8jv0T+L2+kpO+wBks/qEPZOuWiVQuZop5rWWAOwtiCKWNpK5WLinyBEbOurC326WHmsHxF8q++8rXH7Zn+V1dTLXAa5OyVya5Xu84NMV/M7rxD4TSmIU2msYm0gfUrSa+GqCpiEwbZtlCNQ+YB3vlH4XtQidB6UaGsC0kp5BwveSZYv5fNj7fonvto86hfPwEXyHum46vuXgl0wqeCy9ld8H5UwTh1zC25rpbXliXPCIWCQvGKUUOO4GtW9nm548KWb4I5firH+DyPbI0c+gz8y+pZb1g3Gby9It/MEEuu0cO19ewjFsjUmFcDB0/fII09g0l2Q2zT1d4vDH+pnWnxy78kNNb9+SKCZ2SyToE47BukUjIT2+Tvgl5bAHUCtJVZtVO4cSPmr42ol6u5bAbUVXqsq47hTHrF2rOlChlsMV145rfUKXwFNgUgbgJAI2WbC21hih7eelLgExLcTVsxUuo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F03aIPagTaJkz3DHkS0zsKbIW6UJFNBfagDsjmTfF68Cqd2Hy1QlgbfE0fX9?=
 =?us-ascii?Q?x4G0U5149twVdJswWQrc4s7I0mKTFcA32Zz2yOlkqU8Oda8hf5RhdHaSHuyA?=
 =?us-ascii?Q?l7jbIHpQSO5uPbvJCx9ZRgz/B9fxDU9196aiy0u0kMJp3YFIJ+EbU+54Seb0?=
 =?us-ascii?Q?rAP6SIAhD8yMghRJrM4L4I4so3xmdiDjbS0bZTNaZrfEVGewBaAyXsAgkmkI?=
 =?us-ascii?Q?6Kmntxy86MEVGXAaAvjr9spx0m30HtIEjijkem3Nee/3E0bmvBrESULOBydV?=
 =?us-ascii?Q?htwV8Yu+42LW0abzutjtxBD0pXHgswCCNaky+yN74TA+m3EhdYj80IKXlwrV?=
 =?us-ascii?Q?suZLCKe2RyQJLafLZ0rxsZNnVYWEngIEP8d9R7vd9T67d5ZGL9VVaeGPtWzQ?=
 =?us-ascii?Q?Vr+JTfcltEsIkrV314fyQSGqQ/Q2e2tsi6qTU6iEhAp4mY4ujn3Lpj1LRxtc?=
 =?us-ascii?Q?2/+d2/aInKYK5KzBwfu6a+QtZHAvKhFK0EFwcaS6/dFHMfebtrwquwB97wq4?=
 =?us-ascii?Q?gvsuFMGS2T0QJ/q+roiFokOFUtKDLFL/Cm6H/yQURePRsAsbZm6mvTQfCqPw?=
 =?us-ascii?Q?ba/0d3htWdmWEpeDu10IFNOs6HlCp4V66uGi8MmOTuOJPsZchzIe03y8QQI4?=
 =?us-ascii?Q?cUW1brKfPqksxin/SwVtncMPEcSJeZwweT8BZK9Yn1nWBr2a9IvmmOU8Klvc?=
 =?us-ascii?Q?5bpZU3Iugr8fayhRu33Ixyo07lBcR7At9U85I7sMuqX53p3gFUfoJxAJ1TwD?=
 =?us-ascii?Q?djS6aerv6WwR5YVfiE4TgzyLCYefJK2r5L49L0jTVNXtUHei/dFJRUfArPQL?=
 =?us-ascii?Q?3pYxMuMKqNcjtoHhpbQ8wqoUm4oWCtH/IS3bWvwG/2EiPDioFxbWfsd7si29?=
 =?us-ascii?Q?79r6+V/Us+16YImJwHefCU7Qqig7UenCbCRXCHklI+5hzsFAbJZ++x09esOj?=
 =?us-ascii?Q?MzCLvmbFS8qZgzB3NbUoT3HA7pZ+74Vu4qH/hxjWFpLPVv4K+Sp4z9Fb4zGo?=
 =?us-ascii?Q?eiWzlQ26OT1CqKZ65+neHLngvlJOjT9O5HDGnaeZ5ZBC6ngH9dL2hErfcFSB?=
 =?us-ascii?Q?fnO8U+AOTuXBFJ8eaI/D7LXcIuAzZMkHboWwh968PY8D6nwoKXqR5tV1Z+VX?=
 =?us-ascii?Q?vk3BYl5KRhQxfJL8ibW617fj/HDuwKisvC/Zp1OmP5hJlASrpPy3Ure4ijfW?=
 =?us-ascii?Q?bztfJZPDZOfwoedwtG41N2adJT2ejPLq65wKDetg0QoEwZl4ZipCZub2I36b?=
 =?us-ascii?Q?gSJ7oaFoNa+TsBejbNglgZayscBcOQeS77C7TAtPNP5Bg5UjSGISMwtE7HSL?=
 =?us-ascii?Q?aI7zVLkhdO/2Mlo0UR5oxECMDOujpfMqnqQAQCPnn7rcTzMhXZgHapf6EKD2?=
 =?us-ascii?Q?Csrq7nrwtjgO7fQu3OYYslS/e/lyHqmk0KWd7SE0MBt6tJUQv6ku59RDnOp0?=
 =?us-ascii?Q?rIrgg00fMZ8kBeVcVYEovpaVdE22tfpndOXr91j9HhMePLT/nzRRskwSxjwn?=
 =?us-ascii?Q?5Cl3C29HkCqYK0Va7QuPMoomQyHxU61iWrrYX5PZgEqielgk3xTB22k1v+Sl?=
 =?us-ascii?Q?OL00DbgWdiQD8EzRZ//WDKAyYXmsPqYLLoqql3b1xJagxtNq41N9n7umzDVm?=
 =?us-ascii?Q?hQEHPMXXS69jUsBadGPuwifwFfHoKYkNStE6evYNkcXW4FuvMpvzHiqhqbCk?=
 =?us-ascii?Q?t9lDrvxSniJMgfkmQJg8VAOKhtNr8dhYf8UJMCkFwZdfGdoA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6274b86-4216-4984-293d-08de96ba8f0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 04:35:14.0704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCPxzSLQ6iHvghZUnQ7izxyRp5Zwf9p1g0vbxINpJpD1akGU4Cvdkksr066nLSFRjjLWNwPKhzYSegXd9LfS1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_213520_704359_6B303630 
X-CRM114-Status: GOOD (  12.64  )
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

> Subject: [PATCH v1] clk: imx95-blk-ctl: Add func_out_en clock for
> i.MX9x PCIe
>=20
> When internal PLL clock is used as PCIe REF clock, the BIT6(CREF_EN)
> and
> BIT2(FUNC_OUTPUT_EN) control the PCIE_REF_OUT_CLK.
>=20
> If the default value of BIT6(CREF_EN)&BIT2(FUNC_OUTPUT_EN) is 1b'1.
> With the typical 100-ohm termination on the board, this results in
> approximately 6mA of power consumption.
>=20
> When PCIe internal PLL clock is not enabled, these two bits should be
> cleared to 1b'0 to eliminate this power consumption.
>=20
> Add a func_out_en clock for i.MX9x PCIe to serve as the parent gate
> clock of the CREF_EN (BIT6) gate clock. Both of these two gate clocks
> enable the output of the internal 100MHz differential reference clock.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

