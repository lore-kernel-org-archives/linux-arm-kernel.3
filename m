Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8D6C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P48sLGsD6eEqr2ySKyw4dHg5J6/Btwi/MdCmP24TWBM=; b=iH9yRF0MNTLxOmcan6mIhroqlg
	GgQdg/Tju/bJiizKb1q2teETitw2eNTEXeYmdiql0a59o5wZJ0FuTa4/v4l2gTfm8HRr16M9800Ms
	n++xFVzp34xKspstZGAjEWZKIv7hXof1lAb+UFk+Zg3UheY2hX+qb+klpBP8DwaA/oy8tksXsRLnF
	bKHUVGU4XIAB0MMSEUd3KqqhSvYrSN+3tCr/zUaepa2ctK76yr9uqWO8Touf1BYxPgBwjDiYmvc4j
	1lNQgZhy1lDOkIarVUci6XaR0qqk6P+QwDDJfrqaZe/a29732r5YMiVg3q7rdXHUCs+rBnjc/dNYr
	G6ImfuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSpn-0000000CnLb-2fTc;
	Thu, 03 Jul 2025 22:55:15 +0000
Received: from mail-dm6nam12olkn20824.outbound.protection.outlook.com ([2a01:111:f403:2c17::824] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQL0-0000000CQ9F-1hc3;
	Thu, 03 Jul 2025 20:15:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYMoFhO0vVRw0bFh7EGYJ06odbrl6WISBSfRTFXuD17cDPzwjBjvEu8PvJhp0YtkBzCn4UxWD+V4xQrRlEWdTuvvnuR7Oap3Be7HLSLH+7TGZNVGQye4HpkRZkemy3F6vk+DqHWrjoofcIL5InSsCy0TxrvXxzB3uv2ynpcSeej+uNBbuDKvGKrgf2pHGcFKJqxIOjyFtz0YV0yo4VqYtsRI8ZxB0jRncoOOZeZDg2VEpy+2rECfwxFWmQjVbH8n52s982DuvYz5S2bDR0LToPAegiI5Yw6IaRE5oz7aYpTxlImhZ8NdtrBei9STMCLFG2wmdcgeRCo9wkxR10kLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P48sLGsD6eEqr2ySKyw4dHg5J6/Btwi/MdCmP24TWBM=;
 b=WiCXQ/k70smFgrywiveXPi0LEp2PDc6GlMpc4TCHz8dRRePYOq60N3PFutU+gct/0sI/pTGNJHHW5kG9wYHsfz+5yhlMAzQxZbjSosMtnE2kMdg6GIKA07D6vw8m/wwAktfNChJY5M3MJ5PyWXTE1F0otfu3C4IZ+EiYDloD0GSzEzuLEKyiWO84/1a1K+uzTdrlld3Yf3Yx4c/qz5+vCJnbarMJ6Fff495ArwpMQCyouBjUCjM2kl7mDIILuwMnr5jTksIfsvXKGhCAe7C8RiQT2BGgv7SuaS4WHtEKca7qvhljMS/1v1hxOQkpsLW6n8URAVEWgmxK01vRvWbXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P48sLGsD6eEqr2ySKyw4dHg5J6/Btwi/MdCmP24TWBM=;
 b=TQZtEj29JguBy2cDgZuUykZx8g0aG631qZuzh76Qbto6J4iNn89POAsluPLO8B2muMPUpGydWJiYOy40ReaVebukDfk0kDZTWIohmpWoF7bOz6ciSQQf9FH7bj13Zd2DI5lE1PmTEadCua2qUxDXJwNXM3Fb4uzJXgijvu0dmRt8fVNayVGOTWmYB4wlyzOqF6hgSvjZatYOesW3zJm1xWEj04WuK/jQwmd+B64hYBE6UBWASI4rn5NgFYIliB3FFQp8OTHnoQZqjbIzDeq1ZTMO3qg5vyZ6ZtOkEh940eA8XKHmsi2Ixrolc0NyVUeAl0o/VBGFLIxPGS/HJs3AOg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DS7PR02MB9551.namprd02.prod.outlook.com (2603:10b6:8:e3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 20:15:08 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 20:15:08 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Thomas Gleixner <tglx@linutronix.de>, Nam Cao <namcao@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Karthikeyan Mitran
	<m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, =?iso-8859-2?Q?Pali_Roh=E1r?=
	<pali@kernel.org>, "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang
	<haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
	<decui@microsoft.com>, Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan
	<jim2101024@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, Marek Vasut
	<marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, Nirmal Patel
	<nirmal.patel@linux.intel.com>, Jonathan Derrick
	<jonathan.derrick@linux.dev>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-rpi-kernel@lists.infradead.org"
	<linux-rpi-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 14/16] PCI: hv: Switch to msi_create_parent_irq_domain()
Thread-Topic: [PATCH 14/16] PCI: hv: Switch to msi_create_parent_irq_domain()
Thread-Index: AQHb5qqGWI9T0Ene10yNxUr1s0p/CbQgsvtAgAAprgCAAAJH0A==
Date: Thu, 3 Jul 2025 20:15:07 +0000
Message-ID: <SN6PR02MB41576745C28D8F49081B8E77D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <cover.1750858083.git.namcao@linutronix.de>
 <024f0122314198fe0a42fef01af53e8953a687ec.1750858083.git.namcao@linutronix.de>
 <SN6PR02MB4157A6F9B2ABD3C69CE5B521D443A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87cyaht595.ffs@tglx>
In-Reply-To: <87cyaht595.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DS7PR02MB9551:EE_
x-ms-office365-filtering-correlation-id: 1684491c-b5f4-41b7-cbe5-08ddba6e4e58
x-microsoft-antispam: BCL:0;ARA:14566002|8062599006|8060799009|15080799009|19110799006|461199028|440099028|4302099013|3412199025|40105399003|12091999003|10035399007|102099032|1602099012;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?FBiRYiTlHwCkxk22fqMXcrUtHw3Z7bNt1J5qq6D6AsKIKS8VKevna+ixx8?=
 =?iso-8859-2?Q?RamadjufESQYNPOY+S5kJsGoDgUdy5CEoOh43awxX6tEmm1xz9k2ZZyuT+?=
 =?iso-8859-2?Q?p2yK3TRD/t02wQtpTu1x5Ffc/8PEbr4KmkiBLlHC8npslx3+kqNeB4dyAs?=
 =?iso-8859-2?Q?5ogwQ2ythKeakZfOLiYbQZOSurUrbFhCR0q1Bupy59vY7bP0GBjRVtOU6U?=
 =?iso-8859-2?Q?hF96SN9xE2pGRoPAPDoZsiMqU9Ed5jV4l1b5WbdWEfpnsQlb4tkqOshIxv?=
 =?iso-8859-2?Q?P15dmv/9/HJP/GyNE5Y8wXZB5D98KCjdOvNb+leJxnIt/yv3mL5U6THH9W?=
 =?iso-8859-2?Q?4fME7aRyJpJj9oRb080x3H02YT/QVoA12NX/6EseYwj25azvdA8mtFYnZ7?=
 =?iso-8859-2?Q?92kHFxR65KUm+//O6vEl7JzJEZMzKk6GQolv11cArwsESAbBsWDDMaROuG?=
 =?iso-8859-2?Q?gGiZinpMcr1cHCxPKHFRu4D5oOB4sjYOC/+MqLmYSIeyfaCXvnOdBbq4FD?=
 =?iso-8859-2?Q?eUeFFRmnukDuIFoChs6EZSCMk4m99kkqGg6UA6eWMJUy/65ENpHFAXLPcY?=
 =?iso-8859-2?Q?BmWFbf6szKDj1yPaPT0+xj6M/BAbI5Ogk9v+koIgoyijg7YclQgOuRoNP2?=
 =?iso-8859-2?Q?9NBSZJwyEPYexDiPmb+dKnMitaNEwcDtHVrs4g/Eqc31QPKO5UisBnTkXG?=
 =?iso-8859-2?Q?c0AWEieDUBFFQ3aB3S0NTl+c9vFmAaaifK8VsV0BHLmvW6f3d8j+piHBDo?=
 =?iso-8859-2?Q?ogquqkQrfXI/YqtwA/YNERLmkf6EXpR5qkz3tYnfHyAXO+iQma0jZZPooB?=
 =?iso-8859-2?Q?p59KlMaWCDL1Z7uUKMrJ1V5kK524Y3ZNXDk/we3uNJoIkQ2ot3ls3TopQk?=
 =?iso-8859-2?Q?Ko3GiPCNyqrHHHIzgMPwk8k7jPvvV8jHZegpQCwQdIVIwiAYa1N4lfq6NB?=
 =?iso-8859-2?Q?e9nt3u1Bufntx7qVKrNSv+Lyo7Fhjh1jHXLL40lTfgIhX7wIz23mUp901a?=
 =?iso-8859-2?Q?m57gWWs72xJM+36Z0amKO4wNWARmTm24VRuIPqHitvozvqwbiesp0gmESa?=
 =?iso-8859-2?Q?ILayXA+F9ed4gPSFREPLg2p5KdZqmQTB8HX4b+P8JJ9CdTu5Mx7qGXm7fT?=
 =?iso-8859-2?Q?30gd31fk60brQsT2184bM/sLy8BhX1NSWPZBV3lrAihel9GvkOUN3r1Zlv?=
 =?iso-8859-2?Q?txjKFWHmDNBhhZGan9R/l+1QUN5BCnIBFDs8HBv+TIdXuo+e+U8Kpmjh4L?=
 =?iso-8859-2?Q?iPhDD23mWIhKPnwOHOXpF4yA2hvvDqMYy9Mya+bgQjxIISsFIVuUlrp/uv?=
 =?iso-8859-2?Q?Y2/5O9kePUg/kSeeNQ99hqeS2g=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?aV30hbEUONKmfQvslOd8ynEsAtLrcC7sm86sq6O7k5UcOlhs3jbHkzk7Ws?=
 =?iso-8859-2?Q?WQZaUBSRiSdaav+rnBBApx+Lunq9+hEFuDnArFIsQ6l2FP27Ioov/akdLe?=
 =?iso-8859-2?Q?W9hiczfaZ/gX5+JesXjmxEXz8+vkmDNsKNvkF3+V9HuZI5yA3jv3mcxPvu?=
 =?iso-8859-2?Q?Z67rGczY5lBpRsv8YrvyQDAGW1XJKQMRNxPsDf8bnNhJbIDOrm3B2HkFK3?=
 =?iso-8859-2?Q?/m/qwIr/YmbeAGNuPYgjz20lm0/Ci62JkQnYm0i0WdrCn3pIc7fiqXzFjd?=
 =?iso-8859-2?Q?5mQoAL6g5Ob4tTPhwdVSthoTB8ml7Hsm5ePonp2h9OQaNQW7tqsEj+1J8Z?=
 =?iso-8859-2?Q?pY904gXKVrrKQh1g6jBgUxxhpzKxuBBlON54M0OXnGeCXXY+OZ+3/JpUDP?=
 =?iso-8859-2?Q?METHmtTArbgCrok7hV0adq+IFeCfbNpq6d45Twg3uOy/9JeZsFkuPoOxKU?=
 =?iso-8859-2?Q?bLS0j6UbBIUsqBpsoMcnB9ehuzjf5ghH4W5CRfgWqK7Oy4GItIxH5E9lAO?=
 =?iso-8859-2?Q?3f4AwsgkiJurHCqEZTsU+4rFWirTr0V+Fl+3OldO6JvFltLOJKMt9SN2oA?=
 =?iso-8859-2?Q?rGI6fPbs7z4y1g5MgZ2wkOpNikGtdVBUyHPyPjHLYo3dqDJ1yxybN5/WoB?=
 =?iso-8859-2?Q?L290mB7UrWVBjZ2T+449XCNkg34zmZgeBaTl11Ji+4FC9iQ/5MTU5YZTQJ?=
 =?iso-8859-2?Q?EwhRrpoy/UBgh1Oz3fhUfPNoi8VqXH83qCLse9aRXAOnCMLDqqMeK26Ga6?=
 =?iso-8859-2?Q?sdxfCoBjMHc8dl7YcdPrE2NuSuhMJ4lXrkwR3g/aYYOzUEimpgAhC5ZSyh?=
 =?iso-8859-2?Q?ns04Hn3/hxE1Q2HLSa8NlMIh14RZVkezOumVaMwW14pxwoJ64Kis3vxWB+?=
 =?iso-8859-2?Q?3KigopfFw7T1kG+mUvsajXyWH4DTPWLxlpVY9w8uY+fUQof/B8chrk822O?=
 =?iso-8859-2?Q?AvC+vt6Fr9v2etDs4uRn53uQXfqTN6m4YRXXM9MrLrf/YtmJsYy4PM2mb8?=
 =?iso-8859-2?Q?7pnnXWpWxZoDCVdBb30VBsDBGCGACjteFimPdu2qMDLLQVLESlSbMWCkiS?=
 =?iso-8859-2?Q?b8tjLo88c1w+2u9j04cKRoa/lvb2puqC+XqACnZVZAh35k5luvhc5BPf2l?=
 =?iso-8859-2?Q?uaOMuQXNGSB4Zipr874q4fs8y/95aAFejyHICoOdKtUTjeEoYg3b7c3aBe?=
 =?iso-8859-2?Q?/VrLstCIIftLfh9JvDfAg+M9eyLEb8JskUve3nwFVFvLa9NRmCoWATUNQE?=
 =?iso-8859-2?Q?y6po1jxqK5eIbJKNX2gHAJ2xa3rYKQYNCR0k+9p2c=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1684491c-b5f4-41b7-cbe5-08ddba6e4e58
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 20:15:07.9765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR02MB9551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_131518_463349_6987A030 
X-CRM114-Status: GOOD (  23.21  )
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

From: Thomas Gleixner <tglx@linutronix.de> Sent: Thursday, July 3, 2025 1:0=
0 PM
>=20
> On Thu, Jul 03 2025 at 17:41, Michael Kelley wrote:
> > From: Nam Cao <namcao@linutronix.de> Sent: Thursday, June 26, 2025 7:48=
 AM
> >>
> >> Move away from the legacy MSI domain setup, switch to use
> >> msi_create_parent_irq_domain().
> >
> > From a build standpoint, this patch does not apply cleanly to
> > linux-next20250630. See also an issue below where a needed irq
> > function isn't exported.
>=20
> Does it conflict against the PCI tree?

There's no conflict in the "next" or "for-linus" tags in
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/.

The conflict is with Patch 2 of this series:

https://lore.kernel.org/linux-hyperv/1749650984-9193-1-git-send-email-shrad=
hagupta@linux.microsoft.com/

which is in netdev/net-next.

Michael

>=20
> > At runtime, I've done basic smoke testing on an x86 VM in the Azure
> > cloud that has a Mellanox NIC VF and two NVMe devices as PCI devices.
> > So far everything looks good. But I'm still doing additional testing, a=
nd
> > I want to also test on an ARM64 VM. Please give me another day or two
> > to be completely satisfied.
>=20
> Sure.
> >> +static void hv_pcie_domain_free(struct irq_domain *d, unsigned int vi=
rq, unsigned int nr_irqs)
> >> +{
> >> +	struct msi_domain_info *info =3D d->host_data;
> >> +
> >> +	for (int i =3D 0; i < nr_irqs; i++)
> >> +		hv_msi_free(d, info, virq + i);
> >> +
> >> +	irq_domain_free_irqs_top(d, virq, nr_irqs);
> >
> > This code can be built as a module, so irq_domain_free_irqs_top() needs=
 to be
> > exported, which it currently is not.
>=20
> Nam, can you please create a seperate patch, which exports this and take
> care of the conflict?
>=20
> Thanks,
>=20
>         tglx

