Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0198C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvjUdTQQjv7uLK9DobOWGrKfOZv6veIKjSuffiORI90=; b=RTtu8+JlKdEtmxQj2xNxlMLvIL
	TxbN44ieV8mExPB1Qzrf9U481hxmguwvM0ACb6O20xI1L8KWxBCoBTxUVHSHUDXyQa5lgTn+hbajE
	I6pd82MW8jVO0eWpYcMN0P/1NoJi3W0Qxd+T/uOWYFR7CEOaMePvv5GKENi1vegInvnez+EBfnDQp
	zq3B/I604qMpOR17wedq6FF46F91MRJOVo40mIJ6thdouGILaeDgoT0bcb9oVmGHviTNDhrlgf5TZ
	/DXI0sgISZ0eq9Px5s1xgokgjQ3Pbs/uMVVAoeHxZqDmFJ/kghZravmrTVPRybtzCvJe8Xw4R/Ulz
	yL2MnKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhzK-00000001xb2-0lwl;
	Mon, 07 Jul 2025 09:18:14 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYh4F-00000001q20-0lsM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 08:19:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSUyozsUzUOJqV8uFHczC5yCBSxqn14z+spuhn9kg7WdcPS5J51f6T3F0cWOSzn0fW0vmsups6f6cqd+p9MG9zXlnjVCMrI3sM1CQQqpW5TZgt8YslyqYCm3RynsMiQS0wEEuQYKwythT4wcZ0vamHEpoJ332mwNtoPQv4Wbl4ScX4sdoqJTCcWo5BxYWGtTlLmJVPM80HgIWqtcoLVI4gLF6vehonAF2BtemtktTtQavz0rQyPRJrQGO/M1yXM5meoDtOXVwnxapWp7djthvdRDFpn/EmMtrQOJaf6itSRuOPOG/IAWfmfUdkZgp2HZ5YoTjtUjv1T3HAWa4EqjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvjUdTQQjv7uLK9DobOWGrKfOZv6veIKjSuffiORI90=;
 b=uAPK5J5BJLH7CKMK802wZRj583nm4WNq1B0Oe3rk9C+oCbheQj+LR7vLVtG1LvalVz/mvZa2Se4Tn2e8q1HfKD0Rr38VlQhojKH1n9Imu1BmTW5D/i9mauFzsIAdJ1Zn53O8xWtzTSQkL+EEM4HtCp2ztS/RILXZcAtgX1kXej25KpZNQ1mzqSmx1h5RW9kGI5jM5xXRNNRtjoy6yUppKMC01yppdZbA0ldgcqYBn7jv+RudsFEt8zq24jE1AIRy8ycTdt6HvzFXmleIPgHaVVJiZWa8pFqFzaplFTxl3zRVV0ORmAgqbi/+l6f34BVEg+DzDqFHDYPdM5280lwnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvjUdTQQjv7uLK9DobOWGrKfOZv6veIKjSuffiORI90=;
 b=JTjpSK1t+qhFPKWrHKCcodi+Hlxej4emcYXuqGI2ULmeM0FN9hAKED1o/D6LY7x1HHniD3oi72IS7rgRDkNEDz67s1hONJKQW7Qr8xtvOkQXcJpO0idd5vzokOvI8bfRyCHwmGVFV/z6zs1hNeMn8ZddLwko+FANuxhjAHOSwzw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 08:18:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 08:18:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "lizhi.hou@amd.com"
	<lizhi.hou@amd.com>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
Thread-Topic: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
Thread-Index: AQHb7P8PBMpfnLgFvkWQvju7tLKMl7QmU8ew
Date: Mon, 7 Jul 2025 08:18:58 +0000
Message-ID: <TY3PR01MB113464920ECAC2C3CB89DE2D5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB5990:EE_
x-ms-office365-filtering-correlation-id: 60b17bcb-603b-4010-7806-08ddbd2eec5c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?us-ascii?Q?mZnl6W+CQlqmEauptIU30x209/ekb41HH+lAq8oW2ksc3X9q7/c8zUEt5LQv?=
 =?us-ascii?Q?MUIFzpMzT93KmZCa9lo2JsnK7kjblz2ogLs/QR2fXYEawmgnqQ3mQ1d2uBw9?=
 =?us-ascii?Q?73XHWRQmXvC3+sVcd3NWH3M9loNKZOM5NlByhDfn+7iy3LWaqIT4ttc52wW8?=
 =?us-ascii?Q?T09J7rOuFAexKEzzfNOILjhai+Dz7h5tO1ipI39z+nH7DIPe7d4gpg8M9HZN?=
 =?us-ascii?Q?32DuUe7fhtVYWVQwF+Juj2rYY1sSoa4Jg4F+Y455U3aFEFy+u0jtoIwJvuL9?=
 =?us-ascii?Q?DY5t2FC5ZDHRyW0FLeyTP6wYxuTNaGKfErryoH5zJfsiOiktnYGhxRzCFCmt?=
 =?us-ascii?Q?jdXYwmRBiI51abbf8wNSbnFTODntayKb+ltSQZ+fVksJQ6r3bVq0k3FNMxYs?=
 =?us-ascii?Q?dx5U9Enjy3zfBJrW3CHtXH7Hxbx1TuGxhDaEc5KeY5lkKT8jZXX1bOci5cBT?=
 =?us-ascii?Q?I5QeMXWjzDjTZ/6D7KLS8V1+N0T+rP4Pvh2nk8evmbFhbx3mrmP86BYIzxKc?=
 =?us-ascii?Q?Q/Bps2uiIkz6lCYMr5vykyCu4rEyjELGqQCSag5k3zbY98XR0SMLz7VONK6i?=
 =?us-ascii?Q?Zco3aupVS00HI0X7dDxQ4cTpCc3BbXIEY6joILKrEiBAt/g6JZP7Rh9G3DIj?=
 =?us-ascii?Q?FFfGnQ/9muoH7b8UW9vVD5W9Rvi+tpMBbLjmj9hxomDw5sKo5LCh61iYjv+1?=
 =?us-ascii?Q?DkCVIIQ4w9A3Ax2aXvgMNsUAxSvzY84cstrsrp7VDHCxVHGaDeReQiIh/sRA?=
 =?us-ascii?Q?k+RRmbz19/8B7zz++mcu2d2Zi5AAWXwQHvpL01cUrXqtRo87lN7F7CJ6+bY/?=
 =?us-ascii?Q?0GKxSrsMD6ep+Niuegn2Gd9k9w3yFrB2J2O1plGbDuWPPPwo9r/gTpaEXJow?=
 =?us-ascii?Q?z54Jj4GwczZTQ7n951tE7hAJDBnvgCv4la2tbWDcUHLpIfbAN+G6SnJdzhzs?=
 =?us-ascii?Q?rROpMRCmcZ0ofL0zqY/ySPnTzaOZ2GxjEsHZ+8pf9+xgtB1cADNvYKE9x9+w?=
 =?us-ascii?Q?vNf7wwFy11xMyu4/srdTa9x9yimOGbdMMtf43GGyzKu9m3gx3AG/Vrq27NgU?=
 =?us-ascii?Q?Rrv2Lg+FwJTYYfyfzU9qMz2qVQFVYAj+A/8I70e1d82vpGrjdF1aK1YGU1xg?=
 =?us-ascii?Q?PrU/gISZVe5ytipnmOfCHTCjd9vJOiB81FSTl326uZ0oPzTwJFQSfoiekrQo?=
 =?us-ascii?Q?Zq6QMJOeu7rWc19rA35FQiNUJIKOhAmhHXqdyzyuY1fDT7QytOR5fclKm4Ao?=
 =?us-ascii?Q?n9ahyCNbPu7oiKFIa3c5uYIjcgLesgKCArAoIV6lZ2WWYX5ECHeje09mcKWI?=
 =?us-ascii?Q?xaGQTg5YTU0rokKYWKGUl+JyMza5QTjnIZyG+zyob2SM+K1ylxH5NW6K5h11?=
 =?us-ascii?Q?9Cuo4Muv//f6aPyMu00T1jAUKfgFK/aJVDH6lua0rPgu15JUNniERjBFGgWX?=
 =?us-ascii?Q?V2eLU7cgKFgz1NZrs0jl03eq1K4T72GU?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vc+oHzMLaIrsufioxum8GTaU/76kyK5Brv0lzE8q9xb0ZX/OSlwxVrj9dKFs?=
 =?us-ascii?Q?+rw+ouP628BhmoVGwL1nu1CHd4O8TondcRipGx5PnSRM84laKcuFwpdjB4bC?=
 =?us-ascii?Q?8arV144nbhnHFwyuLZkbdGkdaTUzqDSpS8G9VNSOIwoj7z/H7xTHRIhQRfkO?=
 =?us-ascii?Q?2iFyvUY+ZWIweJFHuvQRoEsAiTw8DAKc+/58cMkZn5l1x6xl0R646Tw/dOJq?=
 =?us-ascii?Q?NOmnd2vriKhuepXX5VogjKv8AOBwAGnvLR2it9VqIUvjajMoCzz7CzBwWIlJ?=
 =?us-ascii?Q?nNvBj4/MaO8opSEAm6N8pejxb0emuVmFv1VXveTtcl13yItNw84ZJF1yEKrA?=
 =?us-ascii?Q?PuTLccJfxv6UECfBwQpw2Rac9IPWcdQkaaJZAcO7Y2zGo2Z3D7+YQ+XT9F4L?=
 =?us-ascii?Q?x9pZy8Q5Jod7+qKZ6nnH3MQna2+FJ+ihkTnDBNkj0TciWzSXsZAitz2SaUgK?=
 =?us-ascii?Q?IISsN8tBLDdw7HqSPpj4vCXaEo6lPRYLYISQeYITJlEfPzL5Q4i3CQihsvUn?=
 =?us-ascii?Q?j550tZRgpg+x30QC/jd5IVJaQ6aClmmrFj1kEeKAX7xaokG4acHJEKguEYU5?=
 =?us-ascii?Q?YtvYJ4jYYKesM6C7/q/A4f7Br0Qd1DNNr8wCroncMFTLcL9E9WC0k8fsLmwH?=
 =?us-ascii?Q?6lOykn+dJhybshg3LHA4vaqQkilcS9ZXBTLcmAQsnEFpyxWzlVVYlLS0HuSR?=
 =?us-ascii?Q?cwSi/4ah1FZYXZg7opL1lAtMOBORZSZd0OpvQPwHSsKNkyoM6pYhQym89RQ4?=
 =?us-ascii?Q?TtFVSSWoCMlk/nRmUWVA7xLTdaKDjAyPS4eRs72OKqoSw1NEtSRp+Fkoo/uU?=
 =?us-ascii?Q?gKOoRuJSxJmjKXi1UnlnRu4pYuVkCHvty65OVS2HOa8dXgXBBK4fiv3KadI6?=
 =?us-ascii?Q?zqqsH1WreTkdZ5ilJZgpka3dFCjmt5OVpEKRkwQUIR3UfvOeagNJ4pOnHgNy?=
 =?us-ascii?Q?N/8SYetBpzrM6NHU6clOSIVdamRExcBLEFTGy/HDLv5R0UyvQXtApSHgQrrj?=
 =?us-ascii?Q?GJJR2nzoIOe0Om/GbC+K4hM9YnOed4zW2FCx9MOahEsL+JrCjF6xItsorF9M?=
 =?us-ascii?Q?HkrJhMRJWdNRZex0ED2jUZt4YpAM/W2ZVtV0ft/b5JRadieatbjnIQ32y/sE?=
 =?us-ascii?Q?lFDZwQzBrQiYw4y/FeMMlov4OBIsvVC2YJEMNCxobJgbdOtpObAIUfwLcQlm?=
 =?us-ascii?Q?dohWLZ7/tWWkd9BHWG2ANh3VKhSFqwbB1PiSqVkzXYaxohUA7D8QMCwLi12o?=
 =?us-ascii?Q?9fz/XrSTwz/A/n5I4wvI9LMASaXLNjT8v+KuhGFQi1e59yBAYFrsTwvUcdzD?=
 =?us-ascii?Q?lMydo9ZApIzjUaK+3uDzz5Db1yRRnRnoH01NAzNT2Cl/UEglpH6zyMU00WPt?=
 =?us-ascii?Q?vforiH2eBhQNJgBN4jsuiPEwNgAYUmCU14YSBtCqYH8/81gxQ6iIUIAqs+MJ?=
 =?us-ascii?Q?gXozX7No5lU6FzeWdOE7hvgUi+bCDiV8Gf44YKX2SzMO/jhaXUciBm6/vohH?=
 =?us-ascii?Q?1HFwdehF8M+GIe1eEW6+vtA5gh9Fa6lfHCQyn/PfGZkV/7Cug/UvGAs/SgaV?=
 =?us-ascii?Q?61yhfbLIT2MTIilKqWsb6dKtOwlK2fb123Z2H47+5VDxxjYa66/3xb0qHANA?=
 =?us-ascii?Q?vg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b17bcb-603b-4010-7806-08ddbd2eec5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 08:18:58.7815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mcx+dKyH3pdpwgIDXPhO4UKEox9cH+9nLNVHH5YFUST1H7Fqb0xsp4kTkLDhMc7l2cDp9o1xNOnoJ44+DZ0QHrCyqQ+8sKzlVrjo2zd9O0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_011915_572900_18393520 
X-CRM114-Status: GOOD (  16.74  )
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

Hi Claudiu,

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 04 July 2025 17:14
> Subject: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update dma-=
ranges for PCIe
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The first 128MB of memory is reserved on this board for secure area.
> Update the PCIe dma-ranges property to reflect this.

I see R-Car PCIe dma-ranges[1] and [2] maps all possible DDR area supported=
 by the SoC?
Do we need to make board specific as well there?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm64/boot/dts/renesas/r8a774e1.dtsi?h=3Dnext-20250704#n2487
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm64/boot/dts/renesas/salvator-common.dtsi?h=3Dnext-20250704

Cheers,
Biju

>=20
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v3:
> - collected tags
>=20
> Changes in v2:
> - none, this patch is new
>=20
>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3s-
> smarc-som.dtsi
> index 39845faec894..1b03820a6f02 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -214,6 +214,11 @@ &sdhi2 {
>  };
>  #endif
>=20
> +&pcie {
> +	/* First 128MB is reserved for secure area. */
> +	dma-ranges =3D <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>; }=
;
> +
>  &pinctrl {
>  #if SW_CONFIG3 =3D=3D SW_ON
>  	eth0-phy-irq-hog {
> --
> 2.43.0
>=20


