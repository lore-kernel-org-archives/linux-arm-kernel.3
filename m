Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F673FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 02:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATzFWOLmnOJ/n9e8MwDo7IheDF2x+KCB0Kkoa7P/Xy8=; b=ef4eYjkv3lFwZ9FwMBGg8wh7UA
	v6lN2bTyZQ1hmHnJx0MrkK1Ea7V1S/yLRWEgRv0mlxAGSJy5od7S/bcsfraXzbJE+VyuMX4GpMBb6
	cT9HOsfrkikvUbgHOYsB5Na51dKdzRTl4hj97NXijLvG7QriLysIgx7vKTTou11aXvvuvtEqYWzHF
	FFMY0yKHKwgIU7LFkIXzjQf/Fx3xGXK7VQX4kuW0hUcL2KiXTMHMj/d2upukWhW1Y/CoE+mbxjjMI
	jsjTv2i+lQBjEtOAxw42Z1kGD5dIVxJyQQfNQIEDmXl7BThketno2BwVEgHk2v8ZsF3UDGKYaLdW4
	1dbXiEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHY2i-00000000RHW-22fo;
	Tue, 28 Apr 2026 02:19:20 +0000
Received: from mail-francecentralazon11013002.outbound.protection.outlook.com ([40.107.162.2] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHY2f-00000000RH2-32At
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 02:19:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciV2Rs9X2TauthFaB0pfw0NmBy1gHw2UdbHQfoYDC4lPwID+LBXCEYmUw6ZWviTc8ANeT+ZB6ixhUjeYPz/Cmjfu6bnV3z4B+YcMxl+ZroJBNSclsBzv8XPxwUSvvxrtNItkMRObcF6DReQRATYaRe5ed+k6sR8GdEt0Z/nmUTAtX5bBTR3vj5XGf6AbslEaQoaPungbxOMPGJfRMxrTei55qkUR6EUC4c1swg+axvRPwRQrc/EsuCeh2aCNqpch2F/cXvhLCxer7qVeienkZ4th9V0KzaOFOO1QgJCrVfWWlsdnUjPbivba6+abxGYgWltIUTThq5zRQjYO9MkRKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATzFWOLmnOJ/n9e8MwDo7IheDF2x+KCB0Kkoa7P/Xy8=;
 b=piBqNnIA+V6d5LnsQu6UeXajs4Hgg0nyhv8kAGweCpL4eboihhKa1MJc3auOnaWuKrgh3EsOgpdNT/2ZAZ+VCAq+6o6Qb0DmLv/WWXkOugcm06XAeXAAYkOui8kkbuE9UMCM8FHToG0pt2msTWpDavA1CSJxPFjeJsInrsUSKkpBzr1/f0XPL99EbYmMaFuaA9skm4OXUa4JuTVeF5g8SBCWtRXbhXRi9BQaSdLfnUeJUJ6WpQgnU+mBWrAle53NBPzondHhLwsYLqD1bsKT7AfNDFGo1YqMR6BlcJfXw6tFly/PmntYIrROwGYX9feDpnxZ/NIB6IWSNCv+RBE4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATzFWOLmnOJ/n9e8MwDo7IheDF2x+KCB0Kkoa7P/Xy8=;
 b=X1nUwtrfJlq30Hh9S6wgiq5LTGalJPlvh9WMjcbpzK5risVncKri8mMWvGm/qpVVU7c3nD/Q/h/wSkhmpuXLELn3w+aFdqzYoiYIvc+kS+YNtT95bo6nuxFBDvQtYNAnw9VN9yStaanZSlagv+AVL1tw2pFva/iU/D0uEjrr0oYXhB+qBTjS3j+5/WPuX4pqS66QaAjy8xP752aZ5DyRPtCOnA/vrKaQTj6WP4VpsdGqV/uuwA8Dm/OqA7dQM/56D4lzUb7BpRttAP2ZwAMWeXzhHBa83OIIYnl++CJKbdp1DAZhGjMDTBvkhHI4gxt9joIahUbe4a7C5Jug0K3Eyg==
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com (2603:10a6:208:c2::19)
 by DB9PR04MB8495.eurprd04.prod.outlook.com (2603:10a6:10:2c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 02:19:13 +0000
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5]) by AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 02:19:13 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Soeren Moch <smoch@web.de>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>, Manivannan Sadhasivam
	<mani@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Bjorn Helgaas
	<bhelgaas@google.com>, Frank Li <frank.li@nxp.com>, Fabio Estevam
	<festevam@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] PCI: imx6: Keep Root Port MSI capability also for i.MX6Q
Thread-Topic: [PATCH] PCI: imx6: Keep Root Port MSI capability also for i.MX6Q
Thread-Index: AQHc1j02pL1yKLxXyk+WT7EvKyovarXzvQ/Q
Date: Tue, 28 Apr 2026 02:19:13 +0000
Message-ID: <AM0PR04MB5220EBE4BF61ECBFAF162A4D8C372@AM0PR04MB5220.eurprd04.prod.outlook.com>
References: <20260427115804.134231-1-smoch@web.de>
In-Reply-To: <20260427115804.134231-1-smoch@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5220:EE_|DB9PR04MB8495:EE_
x-ms-office365-filtering-correlation-id: 9862cb08-a3d4-4f0c-4a79-08dea4cc8a50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: ZW1yL1V4NnCJxKlPXP8/AKXTcvzwk008EsAapVEiU7inaJfbtOHUUNr5jiXJxFOHd8GlKrKxuXSLaX1LM86JnztADs+mpA/Yp+9ahMH5foY7zAGxXpEnjR2y/MGRoeXyc1AMNcpQgbbBFczc6p24kexakliUepTBzUCv9N9fuznp8UghQNEVLedg/+lPydV+4C4M6R4vIBYZbhiwYe7PhQwAhwgs4bZbXZrI2s+QRM9JP0HGhW7W9DVHbmzTQUg8d2+tSRM/QXTq0FjlZXlAbQNlWv7FXryo23/Gz0gthqad9jT9b2Xw6nbwTmty/+A0Nx///bElTvV5isMQB5zmQmzJuLqVsC1UPFcKoHR8dOAu2vc8ss7PjNHcPme+R5NQYH6BenUoREMtrZuwHkNZLrHs3lIAL4R3e9iGUP47mEICPC9KyJgvz56jqz3dBJ5YlnwEFnYxN48q5CebcyXZfc1LOlL7QSWcGDPHBCz35UmyM+99cIbtN28hagJGJn/q/aokOR3LuWIHOtOSbPy+fyfSZoPjvkiZ/BgXYXCudrSWPCnr3XDveb4NRE9k35h+yqCeZUKtppmGbo0j1TZt+itk9EhSBskKsutYcchgTKalblpDF0nrEfLxZsHoHAOBZQqzkWrM7CAg5QtLTFni9hbUpK9R/3gvywnOJt5Zo+BgCX6Pha6BcL/0SpOrde5KsBZ0o7C/r5G8NqELX/oPc3UEw2fnulgljW4LiNGV1vQO+KxOxVXWw4MF22ubQ0lMkPgRz4gU5yPLTE9t1KiVQhAhHKl4qzai75aNt6x0xUM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5220.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cboNcjyg4YHPhdQNg0EcUeGmCaGC7oJlh9pMFI9JKIp9HdF9a6hcRSs3eq/i?=
 =?us-ascii?Q?zr2XWNqy//iX1MvG/XQYxOxfewWGDK4idNCC91bjo3j0ebxP6AG1Nzf42UAw?=
 =?us-ascii?Q?02+xM9y5eL7EczbxJUDCdwOll66hcgMMGnoXwCXMwd3oRsTRtUgbKlfR0mJL?=
 =?us-ascii?Q?5Pg2bYwqeRWLJomJT8ZTYOflTWIle90JRVZPRkRuzYjk4FopAaIRH2IQwCE6?=
 =?us-ascii?Q?ODhx+l9igEvCv/3rUSuNzQnlbZzMGXJJhVzg/bRiMH+V1bKr4LjKmwFRpLQT?=
 =?us-ascii?Q?rXr87IEhR0BuDPDarAuX0ieGsXvpgDdIOzgqfrceBWstprc1zXGP9ePoo8R0?=
 =?us-ascii?Q?lmRMHvvr4j241jLneciRYeHlC8js6nBKJ37oHbzIKJEHFGWZ03CS2Cei76wu?=
 =?us-ascii?Q?P9PGeGRH9FCgQoP7TRMjR9EaOx5zfbb/QFn28NLkBInKVZNFD7W1XrgPJNzm?=
 =?us-ascii?Q?9skw3f5qqiaguOhgG/C5D4LIt4UC1gCVRBXWItzbX01nJTORuyzTkLry5rt+?=
 =?us-ascii?Q?d/SQYtSy8q4/CP7SAe+O6AlVoHmEwLufpmgeGwDIjV50WwIMXKdQp5PiGHmx?=
 =?us-ascii?Q?I6JUGZByBUjm7kIqVbHk3ey0fkgUy4VcguWxh07T9ENRyEQSsVWHWsSXsXLU?=
 =?us-ascii?Q?ttG7rra7npfdGQq9cEhTh6D5M/5EEzNtvx2riLZiQ+Z5YxfJksSOFjQuykTX?=
 =?us-ascii?Q?TzUCfh6/IlJ8uiNZF5A0H89a8I+T0h9tHp629Hv2Kq63TNVk/CY53v7s5d//?=
 =?us-ascii?Q?YTX3n4/Ymcfkm/awH5IHMwfQt4AFIzN+/xpVl6HTZeV21ijZfZUf7X6JMWvF?=
 =?us-ascii?Q?rJkXt3MRv2MnwwS4Wl1mVKa3w0G5vMVopElZ7tXwOxxUirnbaYeutXR7TBTi?=
 =?us-ascii?Q?eOcOG/Db8h6N1PqlJVskhxDkovOCqzyPZ5tTRiCYrs0JFNSu8COcao7YDB58?=
 =?us-ascii?Q?IROkQnTkAb6YNZHGeLQSBYSo1IDayAOK+LDy7QJnkoQLQMKkbm5haWw6VdAv?=
 =?us-ascii?Q?PNjnVPj/CIYZvAx41jgSw8dw1pKh6kSZWIwmegXyzj2CNWaH7pWlz2+W55hl?=
 =?us-ascii?Q?j2Rj7Z2OKiFdT3J+NF4CtcDURBgZPm8faQNy1pwn5RFiVa9bgwx5o4W6gGhY?=
 =?us-ascii?Q?vKPN4YoprgnHrASFowCTQUh0rUVjYR+m8zabwREUfCH8xx29neD61JXYhowC?=
 =?us-ascii?Q?r2BGgikOXUEK+0WGyP6MAZsKKp2Ke0uMzhS52lb54wzfTdXDFv/ii1zKmq1x?=
 =?us-ascii?Q?csngXue5u9kRbWWSDSj3ly4H4zXcHTcX2n8FL+uAeAUMTwnB2ybEjp0inHlk?=
 =?us-ascii?Q?RAKTkh28ihLIP6QL2OVv0Q1l2x/L4lCFW1Im+taecU4lWnKHgGeDsIuROKzE?=
 =?us-ascii?Q?QW0ZJmToFbuZAs3QvS8m9Z6F8cK+aBgkZ84vY0CbqFoMQiUktDaquMrn8mXj?=
 =?us-ascii?Q?V2VLp2STPvUTfenCLEF/QQNehxyN8XbsG1RPHw7zwoh5dWZW0hwhFBCC25nX?=
 =?us-ascii?Q?ozTcuWV9smlKx4IShca+EftkVgo02r/yPpHihiNN9v0KLTiuMNpachY7wc5H?=
 =?us-ascii?Q?/bVDgOI+HLtc74mRrw57/eV59K6aiact6q0dVA7FWWF8gMsiHki2QjNCT44V?=
 =?us-ascii?Q?zHkWxtHctEU5OKWaf7n8kIp7jWPhWeANL/qGa1YWFE3g2eRUbsYf3hUtDxDk?=
 =?us-ascii?Q?4IbarYfAdcCaOvaEe36od4YwzfcjLnBynSdJxIwvPyc3oY+c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5220.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9862cb08-a3d4-4f0c-4a79-08dea4cc8a50
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 02:19:13.3610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RYcHkHceBSAZmH1zuw7MdQleYZ7w0co8w7SVRXf6PMm4z1aBoRDrMEcupqoGVY580COMxD/ej+YrbJ4VqrqrhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_191917_785238_F522FC84 
X-CRM114-Status: GOOD (  21.75  )
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

> -----Original Message-----
> From: Soeren Moch <smoch@web.de>
> Sent: Monday, April 27, 2026 7:58 PM
> To: Hongxing Zhu <hongxing.zhu@nxp.com>
> Cc: Soeren Moch <smoch@web.de>; stable@vger.kernel.org; Manivannan
> Sadhasivam <mani@kernel.org>; Lucas Stach <l.stach@pengutronix.de>; Bjorn
> Helgaas <bhelgaas@google.com>; Frank Li <frank.li@nxp.com>; Fabio Estevam
> <festevam@gmail.com>; linux-pci@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; imx@lists.linux.dev; linux-kernel@vger.kernel=
.org
> Subject: [PATCH] PCI: imx6: Keep Root Port MSI capability also for i.MX6Q
>=20
> [You don't often get email from smoch@web.de. Learn why this is important=
 at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Also on the NXP i.MX6Q chipset MSIs from the endpoints won't be received =
by
> the iMSI-RX MSI controller if the Root Port MSI capability is disabled.
>=20
> Even though the Root Port MSIs won't be received by the iMSI-RX controlle=
r due
> to design, this chipset has some weird hardware bug that prevents the end=
point
> MSIs from reaching when the Root Port MSI capability is disabled.
>=20
> Hence, always keep the Root Port MSI capability for this chipset.
>=20
> Note that by keeping Root Port MSI capability, Root Port MSIs such as AER=
, PME
> and others won't be received by default. So users need to use workarounds=
 such
> as passing 'pcie_pme=3Dnomsi' cmdline param.
>=20
> Fixes: 3a4e8302e72f ("PCI: imx6: Keep Root Port MSI capability with iMSI-=
RX to
> work around hardware bug")
> Cc: <stable@vger.kernel.org> # 7.0.x
> Signed-off-by: Soeren Moch <smoch@web.de>
Acked-by: Richard Zhu <hongxing.zhu@nxp.com>

Best Regards
Richard Zhu
> ---
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: imx@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
>=20
> Tested on a tbs2910 board [1]
> [1] arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> b/drivers/pci/controller/dwc/pci-imx6.c
> index 6d6a1688e7eb..3d461bdef967 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1865,7 +1865,8 @@ static const struct imx_pcie_drvdata drvdata[] =3D =
{
>                 .flags =3D IMX_PCIE_FLAG_IMX_PHY |
>                          IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
>                          IMX_PCIE_FLAG_BROKEN_SUSPEND |
> -                        IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> +                        IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +                        IMX_PCIE_FLAG_KEEP_MSI_CAP,
>                 .dbi_length =3D 0x200,
>                 .gpr =3D "fsl,imx6q-iomuxc-gpr",
>                 .ltssm_off =3D IOMUXC_GPR12,
> --
> 2.43.0


