Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A795CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXE0KKCJnPBhWOAi2INIxBeMTjZc73PTP6vLWnW3ALI=; b=kCLUk5eta0s/XTLjf1fAfephJz
	9FwCq5xJeRfz/Dh+RVYOvI7p9DMpndwXGgMzfj/WdpOklbZUkIHNQFA50T1k3Qy7luw/TQmuEdgBo
	QThSgCXVo+Z168+VThOzShWFACb20M6JhIscO7DpfyHTFi3UL925g9iuKt6akYAa/pHoJdfPBBrve
	q5FNK23HBV8OSapSQg13w5+6cNy41Ig659tf54pPTJQtSxGxs8T4FCVjBoOgHzTeGLtUQa8GnYEBU
	suZfLkelTrfwyuRZfoQfupUkwVeSCE1Brkb4C+sRff5dgUUVu5BMoMKmQNRy849yNbBNtnQEcDL0I
	aRcBpq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8L2l-0000000Do6J-2uBY;
	Mon, 13 Oct 2025 16:05:03 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8L2j-0000000Do4F-2XkU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:05:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W98clfQ21T0rTDDhV6y+tUWUDnAWYbJvLsf8CkMusMrM1hG/tC9e4q/rH17IJ6fALAiSPhh6HwMQJxquSY3bmC8YOWE43cArOZ3xI+1uTMVWNdJLAJdOW79i4FwpmWg76PEc8SmOBfCkKjVGI/U9JmULL1eIspb5oPlQCVHVKH64JZRK+uUSjA4YNdzVsgTGLaziP/tggwIzvCj6dQiyd+wauMkdCkMUB85Mtg1ieAxZBI+9SaNlZ9ASIeVAy6atYWDdWu238KDUnZZRIYAXCSzF4wEo8Lxe15UuU/ZSLxloXurBjvq0Qejqulrlw+Bo2rONYewxxl4p9QIW/6VhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXE0KKCJnPBhWOAi2INIxBeMTjZc73PTP6vLWnW3ALI=;
 b=MYzH1gfr6c1d6iNrDDLJ8QaJLpOAd+6YWch7VajA2wn8lChUVRQjoxVzyN+xBbDRRxCuZjcbMa/CWQs63Wab2OtAfkatAEl/6IeOr3NcR1EoNt8gZcORwUp9gHhV2iUvaBRhBa9G69AbWxAc4KTGloJ5hD/nnw3A3G+0FCIlrkedWAhAEP5XXaQFxXnWQWCuk+UgEG7iY67cmEGkmm7CoQmSVkAO+99QFTBUsDDT0pD3vLgOoIYM5Sn6F4S8bRhQVUPGUpMyP394KqSlT7LdH0Yik1mncKGeCa+W5lr7i8hDi70UNfMgKPnOW4nMl7CJ4gOLyqlbQwhgr6xBxzdOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXE0KKCJnPBhWOAi2INIxBeMTjZc73PTP6vLWnW3ALI=;
 b=J9eTMJ2WPChUqncBF9UKfFh2LABLq7OA9SNa6ufcYL+9qQ2u96MrW/IPFcYD+eyq+SFJS6RCEwuq2aHRmKHthMg/Kr3+vsvyOPIPG5xCa/xCOSmWiEW6/bTe8+8FyrouNttobCMGUurjhr6iMDJN0q2i3ay3no1/AJ7OzNlAsTOqTb2m52yj8YtkwQV+RUZBuS8rp5J77RG+wVfJXeqZlcLYv06iJNOl0VXJ39WCxKIG80ifCkTXf0kjxJQV3ugCPZ1VfdK4CkdLbAjFXPnT9iY/MfA3B4IC1UsHz1/8mozD0bRhULHUTplkAFnnyE4waHrayZ+ylOIsawyHqJ8WfA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8205.eurprd04.prod.outlook.com (2603:10a6:102:1c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 16:04:56 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:04:56 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Topic: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Index: AQHcPFseaqLDV5jXpkKppzwlfIiIgA==
Date: Mon, 13 Oct 2025 16:04:55 +0000
Message-ID: <PAXPR04MB9185A0A5494A00280F97676C89EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
 <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6025be80-7007-48bb-bdd1-c8198e951400@lunn.ch>
 <PAXPR04MB918524EAA74F72D64AE0ACA489EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <f5b15eeb-a183-40bc-993a-49736739c0f5@lunn.ch>
In-Reply-To: <f5b15eeb-a183-40bc-993a-49736739c0f5@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PAXPR04MB8205:EE_
x-ms-office365-filtering-correlation-id: c6790db7-84fc-46bf-bc5e-08de0a7240a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?1nGZS0NEDtd5go/OGmPibAdFKqLHOkTQumICLSg8YD36f/Lll735zcpnZvJM?=
 =?us-ascii?Q?iaLGQH9MYK0EQP18AKomvsMH9h/QeoLIRqaPqvfCYxNKvnW2CvigKrhD1ZoJ?=
 =?us-ascii?Q?3syqEDUCcrjnIjKj5ToixBh6sJRXgcZDOPryb11NOxg1T7AmGk6sl3UcBZTN?=
 =?us-ascii?Q?QyPiDIHiH6/kO+GhKtN/2kQEa67t6Cld7Z4UW4+Q/m5csOyhINLPDzdKQ8Pk?=
 =?us-ascii?Q?B5UFozV/d1u9YJhb7BHzI+j/M9gr6uoytRYQHiFC+HLOw9M+LSdr3QpaH7pO?=
 =?us-ascii?Q?0SEoNdgOEkpmmBxiSawHotlZ9YBH3IzjMeczhEKLpQtdXFWAYuLYHVwCHAO7?=
 =?us-ascii?Q?uKeqDt4PdqS1LkpdaEDgSaBXaeWBtY4Fuqb4Weux9SttA4trtpHymgm7VRgt?=
 =?us-ascii?Q?rq7MEYxiQ1s0ZAfr8NzJuxh+tJ4cpi8FWdkieF/zFd6LZQImHKWilIK8vLJi?=
 =?us-ascii?Q?/0Xh+H8HHX2gHqg5Jh14P1BUjI0kQO+GbS9n+xoRbmDyq3VdwdN5jC67lDIR?=
 =?us-ascii?Q?r16bFjcCdkuT6Q+jAUW5YSxn7BjtUGM9MvKKjxitwLh5AassPltrdAGUrA58?=
 =?us-ascii?Q?BUxsK6+pJFK5A9o9I/TPlJnubB0ciDgVfKPaUC0MQQSj1ZhYZjB/+2kNNQ98?=
 =?us-ascii?Q?pDydIocP/9r7Q/JG0L9x0KPRBEHlcLuwcPzsE+O5ui4XbFXaxDNzcf0cvSnG?=
 =?us-ascii?Q?r+bRxewH7frdkE4uItHcGC99xbIfi7dl4J9ikkekxMRzG0X9sq1q/l5mz5XS?=
 =?us-ascii?Q?kNmqkf2la04VpCNWwN9Vveabv0pMbclpHf8X82uMJ8bpaN7ecF9nJ2TFzeJV?=
 =?us-ascii?Q?+psKfwmAXdqP46KGjzXRQM+v+4SoCEXFS6z1ZB7nX0HLCnQfHONPZvR8aKmk?=
 =?us-ascii?Q?V2WTApown0OdJSOV+DGAWR4zmWWZBhsno4KMSGvon//Ty8G4JmIK2y0C4BWC?=
 =?us-ascii?Q?bVrIyQ6HtBQlfmd84olKPo8fVA2iCQ0flErXPAD/g/f4DSHnUItOinoPWfdP?=
 =?us-ascii?Q?CbyL8NZu2RNoKCXk4+9hnaOFWVUdy52mSoYt4qsgDlS4EKD7mrNCEjJpHKy9?=
 =?us-ascii?Q?Dy61TthAttLDnrUETuC/lvUyCSIyj46uAb+Djr76P0lUYlYriJ8iPpBtEeYo?=
 =?us-ascii?Q?HmUIyFMp10MDSLJTvh9OKefPwq4zq+i/pcgWuIBnm16jH/PRbB6AO0ejrklV?=
 =?us-ascii?Q?cWicBRW84BtJZjc9v8p6AQxvOmgb/znY7H3mzoVY3fZpdjl9WgUqyFeA5CUQ?=
 =?us-ascii?Q?kGB/b20hVqo4DsrgvlxLOE9VJsOQo9uKiUu96dH6LIOfvpkCg5UOz34dmtYm?=
 =?us-ascii?Q?T0Q1/ELkJLXB55RaxzpgePIfOfd8omgd4njxLkEcuM10BNbnjTLqlRTOKfL7?=
 =?us-ascii?Q?Fcfr4y+ZN2a8RJGpkT/Nd5r00GwbA9CnjHOxLvAeiW+ySdziRwO41oJavxZb?=
 =?us-ascii?Q?qpdLLtyzk5atlzXyB+CyoPNo+7Dm8rrx?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ake2ysEMT0SkFYDAFtlmXyHoLNek6WYI1Fshrc7IO16cUsknvxGxW/nJ7IP0?=
 =?us-ascii?Q?YB5QJ+KWS+VsUbcNxy1d1/fj70TGlCT6TknBl3ZtphYU+mhY0tMnhFNju5iP?=
 =?us-ascii?Q?+FYIgT4Bbg3Ox29loyPL5vBCWhnU8jUgPylOzcqa0UULxx4dJAoJ3IE6+KoJ?=
 =?us-ascii?Q?+oUkyCvL9ao8QjtjHQTGukaolbgrYUsjfM7NnEHALAQOU0BaFOgDmc+ZXSJt?=
 =?us-ascii?Q?qSA5v5c9Mw+VEgzeRrBgMnEyw+vOPd3mQOZMqXR0KK4pCTSyX6n6U/Zn95mO?=
 =?us-ascii?Q?KhC9jt4Z7UtmHLJ6R1wLBpTzmDrxK53Gj24/bY7GMe+I1esl6otkmDDquIq6?=
 =?us-ascii?Q?o7alZOTk88W6/JazhlvJFrt/b78ekPY9xgEAY3/om4U0f/N7muPqRiUgyb9s?=
 =?us-ascii?Q?ROFXDqrytb6Nx4wKvi5EOj0cJUmRCC/PJTZGPM00huqn/kqhd5DpJvCBZhqU?=
 =?us-ascii?Q?V+bB77zEvE0Nc1W3XhuP6b2olmIiOFlzoKuCiKIJ5BXyGLvGWHYYNrAF7/Ed?=
 =?us-ascii?Q?xF+PjVyNbZr4nIdo9iaaxrIzgRRI1915CDGQrJow650tkt5lzTWoj+/nkrIO?=
 =?us-ascii?Q?7SzAYOwAoYblGtFYOJLh+3nLkjQ8tKOorYVx5Yy8347sT7jWewathRl5QbNm?=
 =?us-ascii?Q?ZcBA8FcndZFxGUEKXweB3bjYP4JupxeozhWMsabUvdsrtXpscjaYpRyQ/3Zv?=
 =?us-ascii?Q?UNroQJFxf5rRm/8E22ZNYD+2V1rxZ3QL5yB4+h+SdTDpKlZGnTau9rcYQLj9?=
 =?us-ascii?Q?kCD+soz7vNALZBET5KKCorn5SanW6hr8efQcRBmHc6zFIlkjf1NX4WbUB3XR?=
 =?us-ascii?Q?HHV0ptyj3vt7hbqFQgXdvfFTA/zsKrcowf98EMs3r96PwvrcdzV2DfpXRtKt?=
 =?us-ascii?Q?J4xv+WReAgbOcQ6mgWz83LsuwbR88F8eO7qbDSNFgtdWU0JzA9wyo5u+XWri?=
 =?us-ascii?Q?MT55n/wEqg0R8SOwZQznD9MPR/pMPsrx8hF+41fmIokmASGkjVwvQcLMDujn?=
 =?us-ascii?Q?XAx0e/W7N7EgdlD4LNP909A5t2NB1DbOr/ZQWjOxkvXslKD+vCoDVeMO87A9?=
 =?us-ascii?Q?1NOV7I0pXe/sfRXy2/ZrCdzlZ4JSR0ASreRxEXtHAeoWvAGxfUwD9zd2GXFB?=
 =?us-ascii?Q?Dhpfj4NHrImLJra2w046p/3CrkfAOILYuLQ7zOlrz0z1c7SaTTDGURQILD+Z?=
 =?us-ascii?Q?nqpjAeByTDjmWwUEH5PLSAmtVi3ospMsygv82QG8mYuwAXe/9Vy3b9bWC+AL?=
 =?us-ascii?Q?SlIr+SlWaSzEQ9h4k7NkXCEoYyfXHGeYaq2PtORuRTmSUb4x4uRSYhij1kw2?=
 =?us-ascii?Q?C4qUxfmQqcrlVGZ1Fyx7QESLFoZsZPb08PHXNLkssgPkB1QjOEasgxZpvi6r?=
 =?us-ascii?Q?QBnD7p/oNxemVSRJhmJ5sV0kSFPN5eo8G26JfmlpdkPaUsBBaBsQOWxdDAh0?=
 =?us-ascii?Q?YPviGSQ+OU888iK5hgzr8k7HML+cwgVVVCBmTNUU414AKu/u8rMJwqp1CCmH?=
 =?us-ascii?Q?+eDbRTJO45CENEyp94XX3koDK6a8eWR1+u8jneChD/YKkjccmACD2qruxesr?=
 =?us-ascii?Q?iAaUAz0HsgsR+dHdWAw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6790db7-84fc-46bf-bc5e-08de0a7240a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 16:04:55.9896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xjkm2ETOcZzvZXwQsnlSnqWK+vbitbzpw8DBNtiJQfnaSSVMcdPmRcU+xykT61Y4ICuHFbv4Q3ugGvXweoPdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_090501_649378_66EA947F 
X-CRM114-Status: GOOD (  17.85  )
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
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Monday, October 13, 2025 9:56 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Linus
> Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.d=
ev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-li=
nux-imx
> <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO dri=
ver
> > > Maybe Documentation/admin-guide/gpio-rpmsg.rst would be better.  You
> > > should also document how to handle features the device does not
> > > support. e.g. i _think_ your hardware supports all 4 interrupt
> > > types. But maybe other hardware needs to return something meaning -
> EOPNOTSUP?
> > >
> >
> > That should be one type of the error return code in the out field of RE=
PLY
> message.
> > The return code of 0 means success, and the others are error codes.
>
> You need to be careful of architecture code:
>
> https://elixir.bootl/
> in.com%2Flinux%2Fv6.17.1%2FA%2Fident%2FEOPNOTSUPP&data=3D05%7C02%7
> Cshenwei.wang%40nxp.com%7Ce2c6c89bb8cb41882a5208de0a68aa7b%7C686
> ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638959641921284557%7CUn
> known%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs
> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata
> =3DLx%2B8iM3d8flgUq8kn8bnaDmxZDea8pPp2wL5V7JT%2BDM%3D&reserved=3D0
>
> Notice how ENOPNOTSUPP can be 45, 122, 223, or 95. Returning EL2NSYNC or
> EDQUOT to user space is going to cause confusion...
>

I think we should just follow the definitions in include/uapi/asm-generic/e=
rrno.h, right?

Thanks,
Shenwei

>        Andrew

