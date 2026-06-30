Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EEDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 03:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxgeVDvqVebINMSaVkzrvy6A7CBqjscVU/HSWZfnNNQ=; b=TzNLdVToNNZdibFTvMgdjX1nE1
	Cz8vXafQW1Cng1BfxS1XWddXI2zRyuMGCMGQ+9CQomd6fIUTa0OEju9MvSfNgmxNQow3u9yRkMWyV
	6zvr9J/TC9w31zV/VCiBVkn9T+qVqbgm06C7rxEnhEeFdh02EnqDYqol8ijXdtB5ZlMjRvQ7bk6bJ
	HvnXkr3Duh8M7mCpzuvJQuwtAcEkMGtYsg6yuDIX3HMwF0DbRKbyli1HgwT72/Lop/3nVxI6WNSBh
	dDfGXvZhGliqa49itDdNgdT86RJvUHyFWWvIxvDTj3r4486ECDrOx4gwqpQGX3IV5ZSOnAFrkDYRF
	qtYahIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weO8a-0000000FhYZ-11o1;
	Tue, 30 Jun 2026 02:23:48 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weO8Y-0000000FhXz-1cLh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 02:23:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpWH3d3kh9UnieyjOW6m6TtFNNUSVqLnMDjE0QZ3nbCOOA2Qs0jTjLhHiIKfbOScka/KaT5dYHQp1dIFLKIHNDj7DRQ9H/xJhZdLLKZ60Rfvl+4gqNjeZFQWjWVlZpHKB3kroQ6aX2nf62YwUlC7dTJ2c3bLQvXVDO89FJzUULaCQJR5Oujhb7C8FvpzWcI3a4v1sK9mXVEf8KIL9RsUxFSI/l9qkiGhckxEB1M6mnP1KDPqYO0ZFw/VMI5yQlDrPKjmX83My89sIP5bdFT6sw7VlOn22GH5hXC21CZrxHB93MtT4DqjnLKccF6K1ItGL43u3HSZWLgYKaHCeFBVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxgeVDvqVebINMSaVkzrvy6A7CBqjscVU/HSWZfnNNQ=;
 b=KicVXHDdu0xK/Ng4SzdfXnPSg5K7z2r/ouHHz8wx0np79k27yuCBeRwOqh7kivysnF6xotsMnIRYrqZRkIsIF3ljevgKG945xpP6yDrpai3/IneqThG5czXSPqYShXkQdm0KI5iaw1Pc+7MTv28f3aa0vPYw6t11A+Nr6PjHiH38cOiiPhXAvGdSkM1Zx5KLpE9RyR9kxlq5pu6hoNRC5WnDRbpJp4/Y46oGOtZmN6P9lXijKUzsduh4umCmYeFC/sYkzZbNw2LAAcat9gIc/tK0W+vPscAWsHKKzl6lE7xJ8CFNqewpx+OxxCxwL5/OpZC0X9S1Kckv8P7fS3cuZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxgeVDvqVebINMSaVkzrvy6A7CBqjscVU/HSWZfnNNQ=;
 b=URxUinEh9fQV6n3tN7dgLK76X5Am5Wq1NbIcz2WQXmc4s1cm6G/Djz+r7lD0Oo6cJDitns9Sq9P3ChoJsEanbh1/YQooQFfWRWw1YtWtXAcz8VtjaVhtUdwjjptOBVAG7uH+Mn6ft2mBgFdLOHRpQ3ErVL5LKDAwqH3TC2wtaENwB6Hq048U7rJSOcRoooj141mUvo6sYdlbzNeXAnfIi+PWDBCIVkRLz3eA7iS7D8CoGbCR/mosVUwjrPlcizeE1WeUsSAqoMRzhLL7k/+KI3VwlZhYCG/nbzWKqbY2CjGklu3iyiEUmCWyPBNRRqkRWCosf0qQe0BUSJ1Vgv5fww==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM7PR04MB6951.eurprd04.prod.outlook.com
 (2603:10a6:20b:10f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 02:23:41 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.21.0159.015; Tue, 30 Jun 2026
 02:23:41 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, Hongxing Zhu <hongxing.zhu@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "Sherry Sun (OSS)"
	<sherry.sun@oss.nxp.com>
CC: Frank Li <frank.li@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: (subset) [PATCH V3 0/8] PCI: imx6: Integrate pwrctrl API and
 update device trees
Thread-Topic: (subset) [PATCH V3 0/8] PCI: imx6: Integrate pwrctrl API and
 update device trees
Thread-Index: AQHc6DU2YdAUpw9yUEWcsc6vIequoLZV9VyAgAAvOICAAHm1AA==
Date: Tue, 30 Jun 2026 02:23:41 +0000
Message-ID: <VI0PR04MB1211446ABF3E33BA0547DF4CF92F72@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
 <178274988899.2274593.17371952702316181859.b4-ty@b4>
 <akLCY21tQ6o-f43V@lizhi-Precision-Tower-5810>
In-Reply-To: <akLCY21tQ6o-f43V@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AM7PR04MB6951:EE_
x-ms-office365-filtering-correlation-id: ccb3d6c0-3379-4faf-c3a9-08ded64e9a32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|19092799006|921020|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: Zqnu8sCqD3DhuJ8tbSaGphDMapiDKrlBulZbdxxsD6ldh+1jzf6URH7wafu9Ty2k3L6PAtIC3W2Z2H6Aw/Hvwmkaq7xYVQ4MbIKhlM4hsCXGiVfhVTJOSok2OQ3df/0GihuQKh1ifBuQ4ExjHfd+LwKv8RuYo9epcOQ+1ay1OUKg3k/row/qRSEM5QWP4QsdZEEhWbEBpBtAVjS2HUM1vAIgAPMjQCVT1ReH5Q0jI7aaz5rE9yXZ8Y2GmUrSiBJUHWS++rp+z5O/pv9wDpBoi/dFWj9NEKAaM7GWdDwzwpCvetr/6NOp2GdQLJrZXVeawU3sK4Cj3XUGfQEwrVkOKrodd15YuVpYQE+S/5/liEVVudFBvMF6giEija6NV9kuYFQCoXDkiYI7CG5myUazIzgGtkbIw94P/HtKZAITCk9ouywpApKB8zxb7jRauIk8hHS1j5E30IEtK9b9zE3QCNDDhqouw/gDpNH52dhTQJrCOfI/AO9qAxPM0G5BQc/5j4VYaAdDBD1DkH6ZUOE9vczEvv5A6aGS9zwLHJnKrfOLV6HUHMHTCgaY5zQl2frIG/Lg9Xnopybtxar8O18g2kV8N57tL0bYpNE9YbwTC6jbBeuhz5v60ZE3rQCWsLq3WOBTTmaW4DOwvt9Kq+NWZt1YctlBdN3uI9CH2SaFWJLpT5WgSIrqN6aE8pwIhyb/KasIvilSD9dih7JdO4F0EaXxK4F7/YvCNB8sjRYR1KWxtDuQKsET3g7M/dU+BpUa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(19092799006)(921020)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OauPnfnJkcyDhXPiPfgOmySrJO7bAOLXsFXiJrb6B9nYovRp7sm8YBFk1G/r?=
 =?us-ascii?Q?PD8tokICuYJ7Ubmv4xscrjPAcFkZir7pJqn5HwlR5NZg/7eezM8Gm2uT9tCV?=
 =?us-ascii?Q?PSlokNGKtDKf1M3TSu+vXmQ1RSithm6YWJca9JHlzrhYJi4LCn7wmUCPTJQv?=
 =?us-ascii?Q?DYGw+DNQXctBwmW9cpRrDg5tEbb6W/9paS1bWc8SBTquh3vvp10LQg/P/dlz?=
 =?us-ascii?Q?Bq3ekh+hp3d4MPePtEoLkgViXs1k7ug2Zn1GUoStpiclhybIve1AJWxXgQ6k?=
 =?us-ascii?Q?TlumXOutcsMcSj6I9EBnNrzSxRZwKCi8FfaUmzt3KwjYOVHrGzl9MDX9Urzs?=
 =?us-ascii?Q?FLOwxhiKWXxPwBRnWVRFuRHnhmw05vYYv/OSfXxbiUbscCcCVM23Wx96O4oL?=
 =?us-ascii?Q?zUxY/r9jTvzJNSkKmzLyXanvhQLGLQKTsYD0oIQ8usvD5s3mkyEFsP0K2jDV?=
 =?us-ascii?Q?VN54uH3s9HgkZeRDzS6MeBykh3Uv+KF53gsSONnDk05bPjMi2x67ebsnbZv/?=
 =?us-ascii?Q?pA1cV+Z8htWi3i4yWZJgEpIu3lee/2N9DCk6jqP4cgQ3yf6gC/hCTw5l75zR?=
 =?us-ascii?Q?NgBKXiGdnicdgIxRvSHAE7rLr2Fvj4W2lvXSKhvbW27BHyu7AwE3YzHFcObj?=
 =?us-ascii?Q?pYvjm90ARYKJt9KhAJH4GhnDYVsXk1zKdnszVVwh8vXArFZ8cOBpDGp836dY?=
 =?us-ascii?Q?atmI39ikUVmJ/luWGJslet4UAw93N0TTJkoroIDpuFk1R/g5wwcHJGJSJclv?=
 =?us-ascii?Q?3HoJy1pu0I9yNpD2QfLkbLdOOOmPMNbVjMzQ0JHAvmWWUcJ2Q/ibtrBEmFrI?=
 =?us-ascii?Q?3oVf9iZ2MOD8yeuwkrqvcSw5g4twmED+9hLNuL1cLiYppBRU/Zhp1YszLBqn?=
 =?us-ascii?Q?5FcVzme+LpSUC080bugncu5URzG1MhOehjhCp6oZDNmvONKF6s+onoL52pL5?=
 =?us-ascii?Q?me4D3KScvYpRh0lRCLE+WuEYPh/jYnGrIesUruWL3iV/9UKcc/hMnwKqe8Mv?=
 =?us-ascii?Q?FgGaiPJI1FQtM/gNiUcXr3JfU0IaPS/iJ2HoJ/RpMyUz+fI398p67qXKw0HQ?=
 =?us-ascii?Q?VGFPOn/Z+f5uDW+W4U3m0YS/iRiPhnjMFYdrghxxXWjXbiBmu8ycltwdbDFX?=
 =?us-ascii?Q?8GsG6+ZzFoms9+C1g1RRNRQGs7lLcVzf4kR1ODL4M2E8rYxJFxzDi7SUsRFJ?=
 =?us-ascii?Q?D5LxhlAB6ue4PgT5AxH3c90dAO1+ODvPK8pAweVRlNRj9efkDGnO38s/yEuM?=
 =?us-ascii?Q?a3FZmvJE1OgcTCX1V4yz9gHjgGKl3EMGveTKfaVhUZhMhUftRWhplaDjphcW?=
 =?us-ascii?Q?YQ2sM+wUtoqEU2bWH6ZfhS2NsXS/d+p8Fl6d6nf2OuVzurY3ArFqAiSV16FD?=
 =?us-ascii?Q?WhynajS/0uhSu63R5gnHcDtlQBIgJrYcbLLDCOXKp0lgpjLQDjArhuyBZFla?=
 =?us-ascii?Q?IkUzZIDEjuQhXGIC10Q5Jir7e/07OS5WJrBkTEfrxjNhJ5jaZTINIhQ0Yk4/?=
 =?us-ascii?Q?2ggKJ8HtLmljzY/nmr7MTtIsWAzaMTqXlCPkMaeX7bFJ/pidTNjqivJM44h1?=
 =?us-ascii?Q?/EAE+w7JrwyHSBo+aCYrDmvtBVh3/eejMYbbi6TfNxEE7585eWrmsjgts3Xq?=
 =?us-ascii?Q?fb7XioCj/nw7gFsKxJ+1Cl/loyrX/MrWU0RsKikaVypE/9aksD2GEiat52Xx?=
 =?us-ascii?Q?uPjPcOe3qw1cHLa1pVfqSL5e+m7qzZmxXNjfGCmkJ7L6EihR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb3d6c0-3379-4faf-c3a9-08ded64e9a32
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 02:23:41.5917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uv+3tEo6bkMYOvlZaEZ7iEK6xVZC87RoSxzUG3YwE6L0mxrFRHrCMQEwA3djWHCcuXBk806gRzFNWs7eFHo7fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6951
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_192346_469891_923AB099 
X-CRM114-Status: GOOD (  15.15  )
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

> Subject: Re: (subset) [PATCH V3 0/8] PCI: imx6: Integrate pwrctrl API and
> update device trees
>=20
> On Mon, Jun 29, 2026 at 12:18:15PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> >
> > On Wed, 20 May 2026 16:48:56 +0800, Sherry Sun (OSS) wrote:
> > > From: Sherry Sun <sherry.sun@nxp.com>
> > >
> > > This series integrates the PCI pwrctrl framework into the pci-imx6
> > > driver and updates i.MX EVK board device trees to support it.
> > >
> > > Patches 2-8 update device trees for i.MX EVK boards which maintained
> > > by NXP to move power supply properties from the PCIe controller node
> > > to the Root Port child node, which is required for pwrctrl framework.
> > > Affected boards:
> > > - i.MX6Q/DL SABRESD
> > > - i.MX6SX SDB
> > > - i.MX8MM EVK
> > > - i.MX8MP EVK
> > > - i.MX8MQ EVK
> > > - i.MX8DXL/QM/QXP EVK
> > > - i.MX95 15x15/19x19 EVK
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [2/8] arm: dts: imx6qdl-sabresd: Move power supply property to Root Por=
t
> node
> >       commit: 6ae623838bba6b1d7dab2164bd12a166eae670b7
> > [3/8] arm: dts: imx6sx-sdb: Move power supply property to Root Port nod=
e
> >       commit: 090ca78c5f5b8b475d51d729a7b79c5b7d8bbc47
>=20
> Patches dropped since CHECK_DTBS warnings.
>=20

Sorry, will fix and re-send.

Best Regards
Sherry

