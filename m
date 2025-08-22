Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A3CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+izj6wu6pDSR73L4OKUXTvbQsGqN+KcEcRcu93yW6s=; b=fiqDQpx6Xf4hggw0W3bnamUWkz
	qY9oMkrg9DKr/VR7AMjhdpJRyj0G6ejsmnmis4xkrV86yYnI4RQOH3vVPr+YJPk9IOpsULNFsXrpz
	DYoid/Mj5Pd1aeNS4DwUWPaEqKdKzOp81113SrYYoSK8KaadFxwlUjFjdYD+pV4j58Mq8bhjS+II0
	cF40OzZLTz4xEbhSYSFEERwo58Oj5zA0K5iTP9Wvh1O9hYnlcicgqk0l9OHOv973Tgr/E48BphMsy
	skR7qYNCnafoCWJ/NtrY+/L8HaWTeb0i7kqFKoNIkTt+H+PfwEvkr1pXLSwAZSV8Z7PGQ+A+8QdXq
	0e1kE5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqm-00000002I3n-17Sd;
	Fri, 22 Aug 2025 11:22:28 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHcp-00000001I3P-2Yo9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 02:35:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZ0eQE2zItm7oyZmKon+lF2sG7t2Q9+JlQK0jKlerMQk1qyzBY4IIUwIHE9OpbViQJizXBwxms5Nkrr/91k58dgXopdG4CYJ1yeG5uHBHUP828S3wTht+33RONu2gmnSch5VbPkOwnJOlhtXwTuhSvSFfYoGlTS3SYhbG0mGss7QAP616FkxLQGxAsLMaeTvlj+xcpg+d0nbsf5fWV+RZSCIgbAlptjn6j+ikizzNleDT+hz/QoXD71j9MdmzLXWt5KysTUHdOdb+q0wKkofywz8rDFncmJvL4CGRDlkrz/5VJ4hRFIi7ScKwqm6bAKGKguC8mt5Z36l/QTaCEGtow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+izj6wu6pDSR73L4OKUXTvbQsGqN+KcEcRcu93yW6s=;
 b=t3txgsO7Jv+Rv9lAAx11tPQv9EdBih67xf16DYcbJYLGaaZ2WDLhsGH9zZWw3QzXuCVCA5jSDBdSG5mqG23rEA9NCLN5KnqSoad1y4kRg99zCi172mf4AYqWbIf9Y8cxrvJQ6iRZYX6Hzfxy5ftNA4fR2EEKcb317nB+kYwcmhJfLMuD1XQXwXqqh76hjmLg5LUDwxCLQ27YTBzztcCbCsWw3X9nHZvLszujf2ZFGsHkrz2kAZXgGzsSinwn7jjDVTf8C4Af4bV4zbFSZsyZf2iLTcCbnjDhlJ39MiwXB2EEs3Q//HQ3NABjvS2ICgWrv6uWWy7pVOyeq+5oyidU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+izj6wu6pDSR73L4OKUXTvbQsGqN+KcEcRcu93yW6s=;
 b=iHVcM4sfuaMeW01l1Hiwpa1aRyeywbwDzoGfAcfzag8jlHnO1An1QTxKK54eiyd/liRN0ibdfRlZ2TyqwxbTS1VPsLmJrfGvMHaW7mBVFzolPBp1uDVqT+uw7n+YCgW94HBEWgkIRnBakDEuKvgYLn34ipeoekhGbPdUz2X3bw+hiJGD94rU2SDRHOTx3p2kWolpAEaMjf/vru60Zu4SoKfPD4e8uDZVwvwY2B79qly/98COxwA3Ik1LuiizfP5tuTxSxNjtnWUMvmGDFhgIrOu+QbPbGuou0dIzu7QfH/sjGHZJpkdWVTAXsOFteMBGmYTUbkNCT/pFeoXTrWwmQg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9677.eurprd04.prod.outlook.com (2603:10a6:102:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 02:35:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 02:35:26 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] firmware: imx: Add stub functions for SCMI MISC API
Thread-Topic: [PATCH 1/3] firmware: imx: Add stub functions for SCMI MISC API
Thread-Index: AQHcBz1TBTPV3H4wi0eTdwCdNhCrY7RrpacAgAFPuoD//+8UgIABJv3A
Date: Fri, 22 Aug 2025 02:35:26 +0000
Message-ID: <PAXPR04MB8459FAD02E2530FAA21A568A883DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250807-imx9-sm-v1-0-3489e41a6fda@nxp.com>
 <20250807-imx9-sm-v1-1-3489e41a6fda@nxp.com>
 <2ff85fec-b571-4423-9161-674f88a32e18@app.fastmail.com>
 <20250821095657.GB19763@nxa18884-linux.ap.freescale.net>
 <b92218a6-e30c-4163-b441-1187d2e429d0@app.fastmail.com>
In-Reply-To: <b92218a6-e30c-4163-b441-1187d2e429d0@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB9677:EE_
x-ms-office365-filtering-correlation-id: 0fa6fe5e-d29b-45fd-21f4-08dde1248d6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?qiF+V7zmdRiJ3XF+2/2zob2L+A4cHoCsNQhouKXP7QqP8O/z24omiLqK2G8E?=
 =?us-ascii?Q?AYGlIAl7g/VzHA2Cksp6EoJyH6Mq6UH2Jbz5Nv51hX0Etzt3tX4SwjESNn6M?=
 =?us-ascii?Q?CGdKUgvyWnPq3OuXLIESTBffgnCsPPIa1fWukF8r1JYtvyiSXtB//xAOczPI?=
 =?us-ascii?Q?OaQxZRTMD9aOk6f38RVE/XDdb8qi8anNRu/z/I11z1t67WV9jZqMR8d/VZs8?=
 =?us-ascii?Q?1U33UF92FIfrrzk2fkjfEbxZOmJV00udYLg3HZ3X4/QV6to9QCKSqoCTQ6TX?=
 =?us-ascii?Q?SMrwsqtgAT3Cy8mXFfBl68ztzdc1UsnF8GBKpuuY0MPtgPmgjxzYI/4DD+dG?=
 =?us-ascii?Q?V9f3rzwLuZzz84eF2qZmOCHIjyYMrl+QzRoqfAH6pzsfecJ5OZ0TS1UBhls/?=
 =?us-ascii?Q?CvdcUIU4M0nq3Ctolc8kPu2QDG6Qvv81UIOCOGf3JyQ1j8ZJabe6TAfzZgYG?=
 =?us-ascii?Q?NXNMAOS9Jw+yKwtdaCaX5EFKH3hY9KRZu5AuIfS9YMf7vebyOv9B9X0/SF7I?=
 =?us-ascii?Q?F2Wej+5xYxwGflYJ+n0EkpN+mPau74obaK+1jvTKQFd4o1iH+oQ5tUypEt2t?=
 =?us-ascii?Q?oXYJ2XIfh0UCc7nzx4J3X/NDYTrVpKNjZyQtXv3+pTr2WWMU8INc6R+a2tYQ?=
 =?us-ascii?Q?dpZiNIecvo5G1oyg56XuaRwL8SQmM/IeTqNKpYtVV5x1p91QOgJrW08dTY+n?=
 =?us-ascii?Q?IsFxprEtyvg8qK3vuaOdp1z08NxCUE+2CazwWUP93NSnzFhnIgfknjl+8zoC?=
 =?us-ascii?Q?zgT0shSeHSj7D0ROiFi8TZGm5hDCXR6a+s81oekhSsVoA4o+H7mZpqJyMqcW?=
 =?us-ascii?Q?+i7H32JA2XANf0MI4UhcWaYCEDHgLro0MWOilm86o6ioP96ugMAOkr+d8XBi?=
 =?us-ascii?Q?+PRZnAOcPrrmUdGkKRA6rFI052GDSGo+d4+w1OwYAq8tIUfLjuaT6mv8DuIe?=
 =?us-ascii?Q?sUk5UaDuKwpAB/J+2K8Mh96x5VDEv+EXfYpWB6fwtpCEyFsV8MbzunOX/11p?=
 =?us-ascii?Q?f/97JuAdkq8GCp8UhAcDyATADNC6rIOpRPepVvJ2j1p65s9JPU+KATaPs2jx?=
 =?us-ascii?Q?1S3ECZLmfslffip8SCTOxDBogqzol+aTVjjUgooLMCVh8fuIALr5FLiDhGbh?=
 =?us-ascii?Q?OG4uSVKfP6qTVSVRC59NgTiLE+epCUK6Qm4CFl6OkDe5UU5EzuQj5HAml+wx?=
 =?us-ascii?Q?ZmpsxFujaw76sZkK9E1/6lIIpQnySG4ydkqNKW6EqiSQT275n6awET90B9C1?=
 =?us-ascii?Q?HYr2aMpZYDMJRgXNZvfOuRLIkcI70RARj1Oy2q1xAEyPi1WJoIenTqPAA7s9?=
 =?us-ascii?Q?+/Bx1bKaQQRvgRpYA1SyV3NZJJBYliDEK7VN5FxLKdFI0Bkkuq1/co5TOD15?=
 =?us-ascii?Q?RHegB9E/DQOICSbZZ9MYfjpsBTXWrlrVpSFhNE76PZEgSsfmoRxjP7KaIvCq?=
 =?us-ascii?Q?o3CCQyZa7MOlzguPleeExm3tccGSgS9gSE9F7unXD0r/YAbjuFMjhkF04m54?=
 =?us-ascii?Q?l4IdbzOs61CUDM0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h9L4jq1IEvfmNj+Y94MEu7eAyVhw6Lnj5bejEOq6sSIFVQx6h08HJwNsOoTo?=
 =?us-ascii?Q?S14rOi6Wcjtgmtlzd3O4snl/lyxbAoD/CsadRRA0kly/QqsprWQVg7Ql+of5?=
 =?us-ascii?Q?SomS9ovteqa0i8GBa+/gE+6IVcxj1AnJn5ALjBrDNP0uPVoSrmrbuuKDUSwZ?=
 =?us-ascii?Q?40l5qQP4+svMJggYmmUvzeg45PDRiwREiiko6D3ahULHp5pk15iXDw9g4nr3?=
 =?us-ascii?Q?Do47hNWXWZnZkn8ij7MsxNzVQpoMD7dNMGTfeYiKyvJGz45iLb3mvonRBlsl?=
 =?us-ascii?Q?hSe2gNH3dY2f4tBCZUGyWQKpo54s9/MtGtD+v3aVfRbvxwwm4pb1lnox6b6k?=
 =?us-ascii?Q?b056RVZojuSOmKfs/xOMNf+1uWkrho9N71vqoTFVWNUk/KZCcpGYOsUk8VcP?=
 =?us-ascii?Q?pD+6InZB3gF38j4cMCiFvrSMHkl7vr8oZdsrz8TRqTRmwzqRw4RsQU02xp5g?=
 =?us-ascii?Q?CY05zi1dBX5s2UWmmNZYFHhPGvscDmL7IbHCY78CQnfIUyVsktCHw6T+BoO/?=
 =?us-ascii?Q?Gy+4V6yII/8p9oD8WnwBZaG+Yh9rEdtWH/b8tIlsz6qLXE0w5b6x1A3x8tUg?=
 =?us-ascii?Q?N3cm6/ckQ8WMdkHj2dMiDEw6PeuxnVW5okJf0sI/ZS/6YLVSt6FkksrFtymw?=
 =?us-ascii?Q?YyTy3JmEUzk8T3ZN8JORHhPJDtKKO/whtnz7pZu4OXsEqb6uBu2gJzx7p4EU?=
 =?us-ascii?Q?XgnPfpP2OcoaXfKPQzMwVl9+M2dBXFJph6ASWrrOXEmFFF0W6TaRR3TvmXhd?=
 =?us-ascii?Q?QQpe22y/UpIGlgvHi5eAfxcwPtQV69EY6Xry4e8xUOwpQe125kpoZSGsQcm3?=
 =?us-ascii?Q?wWDOmY12zF+3qTlNPX2VmFom8gOarJMGoEw5L1aoFkgABkevQJty8fU9MgP+?=
 =?us-ascii?Q?GbWw9q6wMamce2yI+JaHksjBijBEfUI5ro1mcb9bNBwl6g2XkQAkb1dpODlU?=
 =?us-ascii?Q?azXNCC9cJeZUuxHt0pcmeGoQm7kqr7Jz2G/Eh/+BVUI+MTeNKTbAUIe1Hy5k?=
 =?us-ascii?Q?b5Tg+h9KeMdlUZ8lMyHRKa9U6Ef8ZoFB9QU27GpE9Y+iaGBLOCsNBJxpnwwF?=
 =?us-ascii?Q?dDL3YJkUjEjeUSm6B43jXfU04C3jPOztwxSp7I8LIcIEnbWfnQqmEKzHEXOE?=
 =?us-ascii?Q?a1IWTzbyD5gvhcVWd0XCJy4W66/HezWUm+0j0DjII0hbuNgc7bvPbJdAdNcG?=
 =?us-ascii?Q?QOh4HQATso4CK5fFz2kUzyCwh91bG2T7QzOzEWYbbN8wm1pDdNBQvLYL61PX?=
 =?us-ascii?Q?JtgbczMfssP4sKwtvEUENJRDQmEgiRpqP83/BHTaYLZlI1Adb44v6SozF82m?=
 =?us-ascii?Q?OcQcE6kocMBt8iRXuT9TNZ+kmXtJU2xyZ+cY6pF3XDN+cCmnpSAJcGcgS7Fr?=
 =?us-ascii?Q?hYUknX3EVzyiKgV1cEAyoMPJg9u2UGDc/2H4CPQvhJq0QsHT0RhfTfEmVUn9?=
 =?us-ascii?Q?qB5DNckRlqPyCp5f5GzYD+rPR6zE0A8Dl1Nv2bv1Vp13jiwRWbFpyvBveR/v?=
 =?us-ascii?Q?VGRZ7zVYVXOEr6g/s2AmQIala1WyC55HpP2tA76o98YcBJQaOyoY1fxktYA4?=
 =?us-ascii?Q?2yyhnsiA5EA8C9scUDI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa6fe5e-d29b-45fd-21f4-08dde1248d6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 02:35:26.4094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LVKsSzxEcljzY5gjq7G5J+SoRUEIzSxPcDffsbcv5YEgZOgkqruz21ZHfXV3xk5uvgeg+gJhcQQlIIjMJwhHeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_193531_650074_2660DAAB 
X-CRM114-Status: GOOD (  38.20  )
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

Hi Arnd,

> Subject: Re: [PATCH 1/3] firmware: imx: Add stub functions for SCMI
> MISC API
>=20
> On Thu, Aug 21, 2025, at 11:56, Peng Fan wrote:
> > On Wed, Aug 20, 2025 at 03:55:20PM +0200, Arnd Bergmann wrote:
> >>On Thu, Aug 7, 2025, at 03:47, Peng Fan wrote:
> >>
> >>
> >>When a caller of this function is in a built-in driver but the
> >>IMX_SCMI_MISC_DRV code is in a loadable module, you still get a
> link
> >>failure, see 514b2262ade4 ("firmware: arm_scmi:
> >>Fix i.MX build dependency") for an example.
> >>
> >>As you still need the correct Kconfig dependencies, I think your patch
> >>here is not helpful.
> >
> > The consumer driver still needs Kconfig dependcies, such as
> >   depends on IMX_SCMI_MISC_DRV || !IMX_SCMI_MISC_DRV
> >
> > So when IMX_SCMI_MISC_DRV is module built, the consumer driver
> will
> > also be module built.
> >
> > But if IMX_SCMI_MISC_DRV is n, the consumer driver is y, there will
> be
> > link error.
> >
> > The consumer driver is to support platform A and platform B.
> >
> > Platform A does not require the real API in IMX_SCMI_MISC_DRV.
> > Platform B requires the real API in IMX_SCMI_MISC_DRV.
> >
> > So when producing an image for platform A, IMX_SCMI_MISC_DRV
> could set
> > to n to make Image smaller. Introducing the stub API is mainly for
> > this case.
> >
> > Hope this is clear
>=20
> I see. In this case the stub helpers are not wrong, but I still find them
> more error-prone than not having them and using IS_ENABLED() checks
> as in commit 101c9023594a
> ("ASoC: fsl_mqs: Support accessing registers by scmi interface"):
>=20
> +static int fsl_mqs_sm_read(void *context, unsigned int reg, unsigned
> +int *val) {
> +       struct fsl_mqs *mqs_priv =3D context;
> +       int num =3D 1;
> +
> +       if (IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV) &&
> +           mqs_priv->soc->ctrl_off =3D=3D reg)
> +               return
> + scmi_imx_misc_ctrl_get(SCMI_IMX_CTRL_MQS1_SETTINGS, &num,
> val);
> +
> +       return -EINVAL;
> +};
>=20
> The logic is the same here in the end, but the link failure is easier to
> trigger and repair if someone gets it wrong.
>=20
> Also, for drivers that actually need the exported interface, the
> dependency becomes the simpler 'depends on IMX_SCMI_MISC_DRV'.

Yeah, but since consumer drivers supports multiple platforms,
if platform A not requires the real API in IMX_SCMI_MISC_DRV,
no need to link the real API.

>=20
> Which driver using this symbol are you actually looking at? I see you
> have three similar patches for a couple of interfaces, and want to make
> sure the added complexity is really needed here. I do a lot of
> randconfig build tests, so quite often I end up being the one that runs
> into the subtle link failures from these.

The patch is here
https://lore.kernel.org/linux-remoteproc/20250821-imx95-rproc-1-v5-0-e93191=
dfac51@nxp.com/T/#macc660f61873742de447ac8c20d34f2d494ff712

Please help give a look.

Thanks,
Peng.

>=20
>       Arnd

