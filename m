Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51623C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQ2XQJJpEbG8LgVhOYRov9PedDbL7AzaPPHgDBxSjGc=; b=A2kD40iqvfEvOj7g6QBiWoc6E/
	kP5691XFowDNE7zKtR5dFQu/XrCOG4xxD6JeFwQwVKC6p/88h6nkDRDgzm5/s5ChykQXyj3v4cDfb
	JX/VuXf9TIrjjv59hoQefTcq2V4mINlvrkTKwlco9g/0uKEfEj/6Spo9TCp/xKwMe7/ifWrk9SfJ3
	Ufx06Si15AuEwSooN4jFGrsL6jwHGCx2bPpWFDIiOmALc3LJXiLw79PRwNvoYUFk9jRbCaS66i2IB
	0mhmCyYZAiz4ntDSgBWnlZF6cVXLxU/3jq063gofh84/uTVaWjp+BKItS5+xl5wXguIWkYzhKk/Gp
	YLXPruiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0nG-00000003wsO-29c4;
	Fri, 10 Jul 2026 02:16:46 +0000
Received: from mail-northeuropeazon11012007.outbound.protection.outlook.com ([52.101.66.7] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0nE-00000003wrZ-0PTj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:16:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prFbypYXp3xFsX8mTURR4YSRL8QSM4rDJCdXmzxVY35QG66tEm731C7OKTJLhq10ESW7c27uboavS4SHKCUXLo4Ghw+SlTp+lhW0HzNt5kbOIG9ZWw0O5oHVNv7u9hFcbtK2lxHwwCwM/sLPzF0sG5Sct/8pKjafTfU01I8Z8/fL0IEbMuU3wvQ6oRLOm0yI/wmKGe2cVQmAwL5CDXdK9yquHtO+qdomTzn4e2nRR1EizWpgDWs3vccDB8gesKoR3GvZU+BpxCdOEtLEbwn1DplWOldsnUd6Isj9+X2JYjxdP4pi/Fa0Uc+4bfG/MTKBGoEMflYgVwvdwSchulB3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ2XQJJpEbG8LgVhOYRov9PedDbL7AzaPPHgDBxSjGc=;
 b=Bu0+rWu10L8mB54EXh5M1nxONuF2YYnk1nW2gTEFZ2HQEa5rHojZbetT6ArPxPcR9LsPolOed9Aj7ZSk+NdRk7x3e74ZGuSv8wTNDUooLj0cyiHFyKRZtV/K9JINsh+hQ9B1SNUjAQMD7jUQaBZTwK94JCVkRFv1SEToQJ77FztWSww7vPpASXK7RD99FHewOyt5vGAcqlibhCU/vmlchIAEXYyS+J2UYIKdT2D0qOvgdu6/qZw1N8EUC3ikkhiqSTrAgSvlkBcF32pSRJm+uqjy4yBXnEVCr97DXRBUm7+jk6KMR1H9vRDwPgWQn00WEZoUsoGjqN1k8iGw1vvYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQ2XQJJpEbG8LgVhOYRov9PedDbL7AzaPPHgDBxSjGc=;
 b=h3IEK8vDUyLMNreCw8yEf8D3n9Mbep7JPxc8AiKfjucaovmXgqtKznkRWc2hJTzsfaAlVnZDDi984uK7kPOLvcvggIkqYSG/ngifjKRZxiVDepbED1CynaETXwH/abOxUTE3g5MPFUi5WZbuNhguFTKUnr4GwmPfx8n2yZmDk7Wgjzeo+zap1qanZijBOXxzugtuRWVXc6a6+J7d4Z5HMLX989vrP9OAgscyT2utiLfsss1gMcEn392s/K4eLrF/nntje8UrLzni/g7ZMUWM43lnTApIrOZUnjHnyGzxL1fn+/s6HyonaEdVNYeGXGDjzYl4wOwOC0wiPu03+MbQlA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AMCPR04MB12669.eurprd04.prod.outlook.com
 (2603:10a6:20b:76f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 10 Jul
 2026 02:16:36 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.21.0181.009; Fri, 10 Jul 2026
 02:16:35 +0000
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
	<linux-bluetooth@vger.kernel.org>
Subject: RE: [PATCH V5 2/4] PCI: imx6: Add skip_pwrctrl_off flag support
Thread-Topic: [PATCH V5 2/4] PCI: imx6: Add skip_pwrctrl_off flag support
Thread-Index: AQHdD4ujVRVB+PtT7EGhgJZURkmGHLZlRnKAgAC5bGA=
Date: Fri, 10 Jul 2026 02:16:35 +0000
Message-ID: <VI0PR04MB12114FB4F1C79ADFA5F3F215092FD2@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260709101555.3034853-1-sherry.sun@oss.nxp.com>
 <20260709101555.3034853-3-sherry.sun@oss.nxp.com>
 <ak-2BQEUMg8Ewjz9@SMW015318>
In-Reply-To: <ak-2BQEUMg8Ewjz9@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AMCPR04MB12669:EE_
x-ms-office365-filtering-correlation-id: 7ae9bebe-f584-4d1f-eee6-08dede294481
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|7416014|23010399003|1800799024|376014|366016|18002099003|22082099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: hkbmZ2N+vfpkNmtnDcbnxFqMwhE1eGg73stt+yljn4wikbWufOcIvbrj2KxXj79CQ6PTjnTzoqKT4KutfQiYBUWf01kkvme3kErX/UorjAwpRrtlJV7Jgwi5kL7hZp6Tl/IDk03ZImvhCzgdkpmsBKhQwth58euZBXrGFCr0iR3mwFPWjXh3tMXRQ64wMrlfhPTemWfZGMoxDrTsf/lqA1pRUVRzbsiSyrDXHIZgXijMbhfwD3HWxEa3K/c/ZvbCyfWkmdi0Yqsg+Cx+DrjYnNPITq1SgSq22xduwKbruhzwkOewhGrl9F/26zZX2E44kV7l5ls7BqIOfaMbGcvv9VcvSyNCRcCnM3taONS8D3OeR/CoKaO9NNOq3tQVa0IeMU0c7UJVbIZvbCo9AlRwcQvZ6hYQa5WYYXFl5GjXjGso2033Z6u+9L6uoyws2SY/TRDbgUBhf+4sN0qwUyasa25KUPGwKeCBkqcDcm06pSZjwcnjfTgY0J31GQRaSt7m2tJgBD7aw2huIQyuEzl5Gq6+M3nCwoHOzRIqJSa4iT+o4DCMLwXz6h1h1JyQ2NuE8VaEb0hUJgd7oEBxNzBb62SbjfKsgt4IOvIs17DIFMNexO/tPkQKagxmzbcUJlzrV7bhPg6lxmfG1y1zv1E/4c9q3Z31WwBWESmvqjnqVFlYvL2iPu2uGTEShyZCCAs5vKPZCSPE8wZnuwPBWMhFTWg5jZi5BoHhrg8cJMqK8Tk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EUJdiA0FqUOMQuIxrePlXDyjeBRPzSuvJ00Rr1JDFuA/hXcGUNY9OSVLwUmg?=
 =?us-ascii?Q?c9K1fdlOqA664RlEWmUZkToDLLd8/mJy6EFWNm1gLJIW8rTdoaDHeTbmuubA?=
 =?us-ascii?Q?oOY2rTRNB7EaOfZ6WplzpS2ql7//Ny3jcujcG+MgaFH/3EqdkHH3Ne3R5vKI?=
 =?us-ascii?Q?595dAUmASFIQZLIMQVaQrUGTDSKa3Z5Wv/c0D+Yu3jetE3xNsgHvGhdHUQYL?=
 =?us-ascii?Q?sIKx85t9Rl6eicn2IW5g0mzkfpFjR41q+GKFgzPlTCk2LYvTJi7NFp9Qjld+?=
 =?us-ascii?Q?+JmNLiRG3/0N3kuwXsT2rg3rzxn2i+ZUX7B8mw2EB1Ui4FIuq9Nlnd4Cb5WE?=
 =?us-ascii?Q?Hbgqa3kbUF1zPpPeLlRTCjngXC27IbnZFikNl+mDaWf2eySpRk+SPP+6V8yP?=
 =?us-ascii?Q?qq6HS3wl00iKCHYKWoQgzcnwIUdS0Di5DCwpEsJSw2wFToR0jKercFcuH0Dy?=
 =?us-ascii?Q?RKpwha5w1rJLcW+Wx9guaZjCLjC2OvVDyJgJWNDecOsx19+6uN/2U5qJuwA5?=
 =?us-ascii?Q?R5eusxTQha+LW1P8kFmd4cJiFzmkiav1Uv5mEibtuHYfyLo+h1Ig9JAce2Qj?=
 =?us-ascii?Q?dlwtX1OTZuolnovB308Jq9NXMFpMci7JiFk/5t31SNapCbIlr/HxG2Auc2aF?=
 =?us-ascii?Q?EmbYZecsmVmN1ZouSHiHqDhcAQbhR1XIKoL9hxx5mF//MmOj9Sk/2hrWESGy?=
 =?us-ascii?Q?XQiivtOwZqXZLXkUIfhoKRWSrtBc266Ay+BXH9wwOPqivJM5RGbnmIoV70NG?=
 =?us-ascii?Q?UpflIi6qC2S08qm3kGkNsZ1ql8qhVZFhwrYAs785jI5i/zF2A2xPXNBmy2mt?=
 =?us-ascii?Q?2op0EVbFzRc2hc0S6oIOqt5Gon7ADHzgdS/d2Fz/T6//s30YwjCQJC6hLK7S?=
 =?us-ascii?Q?IcoXpKiEVeUOgpYi2lClt9A/87Y2uMd8w7Nw+hRJ7Hc6tnzMiXC1huZt2i0s?=
 =?us-ascii?Q?wcoYLBy2kooP36LMzSaLOGCqX/9j2Ni1y/6RFDRVzXp2uw8AGyNzSQYfpgkE?=
 =?us-ascii?Q?I1d3WqIhWjYcTxbqTc2emIFtvy0yU9fYDYel+B2aoNXRBz0KrJNZ5A9zrfDL?=
 =?us-ascii?Q?ZUYlpGq8l7q9bmaqyuj6Jiu+A4VK5GmRE+7JXek1G/XFi+yEtVPKe+FWjIPC?=
 =?us-ascii?Q?0oIlDEXrtmfp1x4YqRGPpRW7Anf4hAzN5ENQH/jXYyLGQpa2gTUN/ZzdGyo+?=
 =?us-ascii?Q?j+Sr+ni0ZasLgFvFAKpRPnhWoh+LGCz1PxiYmVWAt67v3gB68o1sU8swndki?=
 =?us-ascii?Q?zLn5BJRWxOh+SpYSfK6Hnhdk4/RyfjrZjOcJAHWHm3DvZZ3+Mog9UJNFe8YR?=
 =?us-ascii?Q?NTPNifL+aYinm20+q+1l7nMaT3/LRCC8PBtJzrDLJZ3VoC6bqI2CXbkcsl5n?=
 =?us-ascii?Q?87k9LvC5GKp2PQOB4H06olaqdPbWl6kpU5SwoM/Ls4DP2JqQkpdGE6UNFczn?=
 =?us-ascii?Q?XXjodG12GrjfpChdSGhBk42heyPrBGECYaZepemxnaf4Qss9WTjgrNUurNdJ?=
 =?us-ascii?Q?O2rFRDLeVUIM5WQNjsGjEh0KsBniOD50/tuY+r3wu3g9x8V34ND3EyzLUcb2?=
 =?us-ascii?Q?KfdsJ9mwxVZZCugrMETD8HAJ58mtTWdx0b5R2QbdjIJJmu7+CcP0ENZH7/sa?=
 =?us-ascii?Q?yRl9yHJc8frmib4hNxhoh/4vUuTcVipFgZ7p1vCtmdFfNvENXn/+kGVRUQYN?=
 =?us-ascii?Q?M0n4wILkfz7WzIE1P+wiuxsNHT0JgCTRqFRKhPjvx26CwXO1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae9bebe-f584-4d1f-eee6-08dede294481
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 02:16:35.7026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R0q5HGzvMd5koOpedF7dFMtkimtkCvz/frfbaa1NOVaJkFxQS9s/NyCJoaSwp7nOe3FQrzJu61/8kFukuKqldA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12669
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_191644_165556_0E664656 
X-CRM114-Status: GOOD (  24.94  )
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

> Subject: Re: [PATCH V5 2/4] PCI: imx6: Add skip_pwrctrl_off flag support
>=20
> On Thu, Jul 09, 2026 at 06:15:53PM +0800, Sherry Sun (OSS) wrote:
> > From: Sherry Sun <sherry.sun@nxp.com>
> >
> > Use dw_pcie_rp::skip_pwrctrl_off to avoid powering off devices during
> > suspend to preserve wakeup capability of the devices and also not to
> > power on the devices in the init path.
> >
> > This allows controller power-off to be skipped when some devices (e.g.
> > M.2 Key E cards without auxiliary power) need to support PCIe L2 link
> > state and wake-up mechanisms.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  drivers/pci/controller/dwc/pci-imx6.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > b/drivers/pci/controller/dwc/pci-imx6.c
> > index 92f8e4a299e8..afcf3b6bf3cd 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -1382,10 +1382,12 @@ static int imx_pcie_host_init(struct dw_pcie_rp
> *pp)
> >  		}
> >  	}
> >
> > -	ret =3D pci_pwrctrl_power_on_devices(dev);
> > -	if (ret) {
> > -		dev_err(dev, "failed to power on pwrctrl devices\n");
> > -		goto err_reg_disable;
> > +	if (!pp->skip_pwrctrl_off) {
>=20
> if pci_pwrctrl_power_on_devices is true, where call
> pci_pwrctrl_power_on_devices()

Hi Frank,
The skip_pwrctrl_off flag defaults to false during the pcie bus probing pha=
se,
so the pci_pwrctrl_power_on_devices() is called at least once to ensure all
regulators are enabled.
The value of skip_pwrctrl_off is only changed in dw_pcie_suspend_noirq(),
and is refreshed by calling the pci_host_common_d3cold_possible() each
time a suspend occurs.
This is why we use this flag at runtime to avoid powering off devices durin=
g
suspend to preserve wakeup capability of the devices.

>=20
> > +		ret =3D pci_pwrctrl_power_on_devices(dev);
> > +		if (ret) {
> > +			dev_err(dev, "failed to power on pwrctrl devices\n");
> > +			goto err_reg_disable;
> > +		}
> >  	}
> >
> >  	ret =3D imx_pcie_clk_enable(imx_pcie); @@ -1454,7 +1456,8 @@ static
> > int imx_pcie_host_init(struct dw_pcie_rp *pp)
> >  err_clk_disable:
> >  	imx_pcie_clk_disable(imx_pcie);
> >  err_pwrctrl_power_off:
> > -	pci_pwrctrl_power_off_devices(dev);
> > +	if (!pp->skip_pwrctrl_off)
> > +		pci_pwrctrl_power_off_devices(dev);
> >  err_reg_disable:
> >  	if (imx_pcie->vpcie)
> >  		regulator_disable(imx_pcie->vpcie);
> > @@ -1473,7 +1476,8 @@ static void imx_pcie_host_exit(struct dw_pcie_rp
> *pp)
> >  	}
> >  	imx_pcie_clk_disable(imx_pcie);
> >
> > -	pci_pwrctrl_power_off_devices(pci->dev);
> > +	if (!pci->pp.skip_pwrctrl_off)
> > +		pci_pwrctrl_power_off_devices(pci->dev);
>=20
> Not sure if there are counter in side power_(on|off) function, if not, ju=
st skip
> power_off is enough.

It depends on the pwrctrl drivers implementation, for the generic pwrctrl, =
it will
call regulator_bulk_enable/disable() to handle this, so has enable/use coun=
ter.

As mentioned above, the value of skip_pwrctrl_off is refreshed in
dw_pcie_suspend_noirq() for each suspend/resume, so we need this runtime
check to avoid powering off some specific devices during suspend.

Best Regards
Sherry

