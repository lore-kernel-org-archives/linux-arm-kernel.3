Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D69BFCC9AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 06:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWlDmrrCphfg79rf7xGxtgoqXZpJnZHPXpmup1eEHj8=; b=niNoo3bdU7iq50CldVCa+zMMtQ
	dIK6JN3bRZJlF2q4LRAGJQBZ2qVbiUPZI5iVjkubNmTOEz98myhmZUAISVrhFKkmk2aIRvhJvlseZ
	eLwp9dcQTT1p/Bks5xOx8BKTALxPwgVeyt0aYhRxQ6C/2cTroLQoarv6tFNgB5DXtBw32+kpomJy8
	YWwwUIDV9XJTNe6GSDkE1ZrbVfdXzn52Q7GKV77dmln64+pc+M1C9DrEUBo36NHfeIcm/EUc2eIct
	PBgNh9rALbCwyK1zLXZKLi0+a7VzynD8krhziMtb94QiKVGixmsvLVc6GClxNBJjpjET8n2jVZjEi
	sSqLBy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CiF-0000000AsVx-15aG;
	Wed, 11 Mar 2026 06:06:31 +0000
Received: from mail-francecentralazon11013011.outbound.protection.outlook.com ([40.107.162.11] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CiC-0000000AsUY-011o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 06:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtEVcyxfrKnUQ3eOBZEwqEJbXtztFTNE/g5+T2FEP6ULVpSdnqD9lUpqDGQfo0miJMh/BRAytl5SJP+28MswSSGOyI4//QIcw6BwtTR6k81wj1jMIKGx96FCWC3n10t/rksJUaWqaXpEyjJzi6Cjpf4DLqMUzgf5Y1HWKfh0+Y2wBovm6M8RbONnlAuj2jjeDdkNVuUUxhXJ5Imz+pkdAebIJSkE/c2vTnXW5InO/3d3VA5urr6CVpL+/uE3h/JsVyfrXN02FGYmzXVWe31nQCs9VDmB85kpGtz+1RTJoWFJdEkbXNMhh/epvY/BwM4A7PMMlS/10GJG7L9j7wcKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWlDmrrCphfg79rf7xGxtgoqXZpJnZHPXpmup1eEHj8=;
 b=jaZMhPys6fbnGPU9xb8KXO3Jko8WKR+8wZR5jrV3t3RIGCBRf8PiRx2UGLc/1qMAcC0lJKS1prb7kNSUi86kjkerz9x09uoKFsrj4QZf5a8kmZSPrqFdIO43r0bx0aFAS4Uq9II/IMnHmh8BgYY4O1YvjQ0NmRG7GPEwvMZShE+R825bp0xvpjrlf7sE5hA5jy8T6nmfwmDzWLYi43quXPj+7nk/hguAZ99LZiCb4RZ0gm33yc/zJa3gxyzkqe1NgWXVQp7lYga93WHDGXNfODyRx042I3a+5Yg1xgTZAXONhBDyKGGFi03GOX6b6Y6oc2Nj/2E7nFkdoPTbAFJRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWlDmrrCphfg79rf7xGxtgoqXZpJnZHPXpmup1eEHj8=;
 b=MqrqlUC0VYi2mh4yBL3lIH5l9GAnwiLtsC07Y+to8pRiGPJPWxDKqUySj483hLZqDMfnlY8BVuienflUVOikS4OwihW2oMkjlVa7HSeyoaIvmcerN5RehrSrAp6CdX7eQOpKZOMKXZA6wOSxapYLEMTX6gS5UNvsAQUexZz4FOQSdCEboqDzbkDxim/exSw6pdPWAP4W0lROKWu5nKcmeIb8dziTYQV55B+swPu6BnyuW6chwK5BlraC9EZzDmRwdCD8ixz9CJy4nl7PxkQH83ftTlH2+oqSQ0qmZO0G0E9idLqV+gF4PNycBhlDbSxXwxieMfDusvR0JMx7yEZnnQ==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AMDPR04MB11620.eurprd04.prod.outlook.com
 (2603:10a6:20b:717::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 06:06:20 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9678.020; Wed, 11 Mar 2026
 06:06:20 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Hongxing Zhu <hongxing.zhu@nxp.com>, "l.stach@pengutronix.de"
	<l.stach@pengutronix.de>, Frank Li <frank.li@nxp.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V7 00/13] pci-imx6: Add support for parsing the reset
 property in new Root Port binding
Thread-Topic: [PATCH V7 00/13] pci-imx6: Add support for parsing the reset
 property in new Root Port binding
Thread-Index: AQHcsDCiSUQezRcS5k+mCscse2hcFbWoI10AgACzNJA=
Date: Wed, 11 Mar 2026 06:06:20 +0000
Message-ID: <VI0PR04MB12114CC9831943D024C50F5209247A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260310015426.365675-1-sherry.sun@nxp.com>
 <20260310191244.GA764308@bhelgaas>
In-Reply-To: <20260310191244.GA764308@bhelgaas>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AMDPR04MB11620:EE_
x-ms-office365-filtering-correlation-id: 8e70afeb-8e53-49b4-eb07-08de7f3450c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: KOUM+j2ek3utHpOBgPK5fQ1sqOvrPcvjGvmvPxBa0O23yPsFKSRNCOLfXe3WTBqQrNsIA9TES/7GpLJ4kowxdN5BFWLDpmlrzxdj5DGIusS0nADpFEWrycF/uNYAPWZXTKoEJ1gtsNF0pmRCajeljeMHRvmJ8LbOYiqlP5F7pv1P/3FlPO/YJ/ZZkOn6n2hxfHLtFgJ3F30AUehrAAHXUrTfST578LuKzx0RSQnHZqltSfvx88/3gUx7lN3Y2pzxqaX73wJKwasg7AkkLBLfGdY4aiqT+YfuikC2tRJHm5fQQUqK0c687MH53bpImDZhw5G/uIEnp1h5rY0oV7VKQBadspm7XYCgGdVNJSLtd90CN6/k9LiY4MbQJN5U/9+y4h4hX4j/fqq2hphDiWVZahC9YSrnEd4BScgzfz/p12iWjxwpV1/L1ulAFzI83Rgx9WjM67CxW7xfDXxHwL/AjMDsjLwyFz1FG63kkc/CNF1mi4bX1vfTBDy38wQe7WsVwe6PQMUEoLBhWnjAzlMl8PjYuCabnaepQhrNehwLOI9G1FaONSXb93O3bqMrTdmYjLjKkwy9jqbz0KvHBQebH8MdATWy6wUZv5BDQpRdIz2vn+IACtZoUttdDwPhhzruX21mbJu7Z+SMCTi9dputlPFE5ukjzLxdKm5MfOLRY2XACffHuLy3XHBOjDQTuLEOpfcFhk3bPc5CtCGUtgN59+52hv7ddbg5BxKmJaX/+i/Kbe46BMa++eQAy/vXp0FmOfaI8rEyg6L0povKG2l4kXavVFygcIN9zcydGemw8BM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P5Cof5ja/AlgUL7TSk1CwztCE6yR/AzAu+5dIPl++dXCkSWX1Q0KrHucbcMD?=
 =?us-ascii?Q?oFLrQMLgWoLjXgQmGOQwUdgGN0qAYSa5Mw+wLwrjOP8lq+hTKI/X0uFAjI5T?=
 =?us-ascii?Q?V5+CyZcqNLTvWIVS0YAFO1yNhBuVPXAUAUU4xmMZ3sv6tsrbcE1Bvx4wsByl?=
 =?us-ascii?Q?Ok3ni6IcLHf0F6i4NQB27j2ZaiYKcHBuOw5KDMnLBuwVQjWi1s3dsT17+teR?=
 =?us-ascii?Q?YZ8WY8IR+4hCaD6KbGTASRo2LHvjSOnW2yxGTHAUuiKlzaTcBKc/ZINWnCI8?=
 =?us-ascii?Q?q4p1pPDwfU7rZgO8jO7SSu6nt8Ue4wmAkOGBM8SClJc2lhk/a3yW82MH7FIf?=
 =?us-ascii?Q?dU0Yx8CoJ6vEx986qFn1MMvsXIREQWTAfe51G8K3vI4WAOo3nNdz0od8JwGf?=
 =?us-ascii?Q?dSxuiUHNMYqkPr+ouwukxoErrnreHkovDYLRj7CwMzLPCt/VW4sHm1cBJWf9?=
 =?us-ascii?Q?8smH5Zgh1sGQUi0+H13wJUQeaVXPE3n5tJrHOzdT8L48HqjdtJXcw4ncQnkl?=
 =?us-ascii?Q?1CPLpA6/oQqjcZPjPrv45mZuyzv5zd384g1nBDUwvtkej4V/qToTxa663LlB?=
 =?us-ascii?Q?eLFP7TqmK3opmTAmUTZN/yVM2Af8g8ywz4ZTcyTKSumDguNsP1CLdm3bjsRb?=
 =?us-ascii?Q?ItR9U8fNPli/l7VWsDUXApnHwnz7tcw5zKwbW4Mj7Kfh1fbrxJwJaWneMpRZ?=
 =?us-ascii?Q?XTMAqxmmSeL+2zlKEaOIMZWdDiKNsJvpNe4aZqyd/K/DaWAZ473Mdn2yJwfV?=
 =?us-ascii?Q?1UQQl2cEsP+RaEeI5khv5waRv0tnhqna7Oq8qVR2qJ8p6HCaL3iQgJlo2oFl?=
 =?us-ascii?Q?NV6VFkuZAiCdRf0wPs2H8mPMYKbPiWaFmL0ArvITY+KpAh8DU7dSp+oh9mqn?=
 =?us-ascii?Q?nbxj7xJm8hjcKgt53AEM0RLROTKCVV+IhF83kLVKsl4FDEhSCNYP5RL2huAY?=
 =?us-ascii?Q?DgyDAxG9ei2VsT/ht52N0YLRN3HUIlTKhcN06ijVgOGs7dNScihm8hZY2YFV?=
 =?us-ascii?Q?WeeNLaN0nB3y3Y1fNKOQszked3oTyC541RCnwyBQ6OsiOzoH/nrJmUow5LTE?=
 =?us-ascii?Q?/r/1e2yXyoBcW6pySRbtTDpSsFNaP6jp5v/v+Lhnz83+8oPh3bF8eVBrm/2h?=
 =?us-ascii?Q?nPaFDbcdd8WyUtbouDnP4CNglg5XEd0TBCzB8BiJfSLH342Y1A+5EQsRvpio?=
 =?us-ascii?Q?Yv2nUvbojylWH7KcPAwjgjWyXRvRHlhFcJnekaaATQZDKJ2q0B1+SeA26+Me?=
 =?us-ascii?Q?j7nm5vykQSe514b1qsABAD4t4Cj1nyqM2ru+7w4Kk/OyHSuexHrXtePD2XY0?=
 =?us-ascii?Q?D7jOqsV9ZbRAOZ8j6d/zUvDvzcepCeD6HyEiZczP8vb5PVDEyc4jSnXQ7o5l?=
 =?us-ascii?Q?MmMi2AeXmKXvmuWaI22yAg9+x9JZrvtaCLjAbUWZQstk5gzzBB0rRJ/Wg249?=
 =?us-ascii?Q?K5ahsNxjROjD9b8CDQWIHw0FBwvTfeuZCO3yvlESN7QdLI8YPGd49TrJAWMG?=
 =?us-ascii?Q?WV9rgjgmDadg/65ilmrCCg2MFus8OgsBM7wxa0vUkX4NgSuNLmTG6V0ho2Gr?=
 =?us-ascii?Q?dajEW1Mop0tHdycxMw/CWG+n1LsZ4z8jkwCwwTAgTyTsdOG7tNi3/EFqPZoC?=
 =?us-ascii?Q?OTY4CNCA6VUWQR2PqDYsoaG41A/d6I0pV/dbK09eUZNKr5FGpiWPy6V+kmzb?=
 =?us-ascii?Q?6b73Q6iwyL4R73dTHYwTGmbHgOGmyFqdWzFyOi9XPTW/8iai?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e70afeb-8e53-49b4-eb07-08de7f3450c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 06:06:20.2571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qv5gXhRB9egTeKR6WyThFzdJnY7pZ4DZqf0p1sZctYjFzRN7dZ2ZoCaAhGZ3Y/maA4A91qLIXpylb/LvU++pvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11620
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_230628_060649_A800D82F 
X-CRM114-Status: GOOD (  14.56  )
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


> On Tue, Mar 10, 2026 at 09:54:13AM +0800, Sherry Sun wrote:
> > This patch set adds support for parsing the reset property in new Root
> > Port binding in pci-imx6 driver, similar to the implementation in the
> > qcom pcie driver[1].
>=20
> What is this series based on?  It doesn't apply to v7.0-rc1
> (preferred) or pci/next.

Hi Bjorn,
It's actually based on v7.0-rc1, but I forgot to mention that the series de=
pends
on the following my two patches for the pci-imx6 driver. Really sorry for t=
he
inconvenience and, I'll add this information in the cover letter.
[PATCH V2] PCI: imx6: Change imx_pcie_deassert_core_reset() to return void =
https://lore.kernel.org/all/20260306021247.991976-1-sherry.sun@nxp.com/
[PATCH] PCI: imx6: Separate PERST# assertion from core reset functions http=
s://lore.kernel.org/all/20260306030456.1032815-1-sherry.sun@nxp.com/

Best Regards
Sherry

