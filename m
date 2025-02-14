Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208B2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bujvcYJhTh9c8kPzoKTAfCOIXY7BHtINqKo8IJ5FoCM=; b=mXXXgqAXsZ8jvz8bkDVXN3Rj8h
	6p5/KgH6pYUNee1Z3vcD4NVSI8t90BvCWSyK/E7aIuhyLliWvZ/2IC74icH4yFMthpL6Xq8b++nOS
	LsI3tga2h4yZcIzmlUeuoCqufEbm11AzJmWTmmVQ3lqqewDUuy3YRjd/aMzsV4irYc2buQM0kvzzq
	48qA5csiQiGqfKVEqHiINflboQ2YwHGcZqKm3tmo4uRKCmvP4Pt8tS5Siq3D/1JgrUGlMDGPEMdX8
	oHPBTQgW0VVtas7vmyL31GKn636nKgSMbYHP1WzvF4bnh8Lx3mJBTJ23Hk0n5pNiUb1aMmV1GH9qk
	HLy9JBLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisLm-0000000EOU3-0F5o;
	Fri, 14 Feb 2025 09:51:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisG0-0000000ENHj-0vEO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 09:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bujvcYJhTh9c8kPzoKTAfCOIXY7BHtINqKo8IJ5FoCM=; b=L51FHk+nGNwg7Ww7uOpK+f7zV7
	rVUQhDjxwcU2aSLvT6E9+NGt8CasHaJMG+HoDH/pdJlybZPNX79/7Nj8rLwRcD6wJMzh1MrYQY2Wz
	ZipiZ1uHShyP1DWT6DmOR6EEFDX7434EAYGpU85SW9ISQGPUdQmcOmp/oExY6Niwu3EQ7nXZhaDKd
	J9gFcZFfbZRQadRRj1bqQxmzgE+6to5QSPDbRsr6dKLbHMB+mLlmJHuD50BxL75/3diVCO8zL9rfi
	0hpCxtDdj+SFolrHIG2+cmrU0IE6XRuV8gsWAqZgxcB+B7mGwyYCN5e+3yvco+XVFu2nmBNyWhFaR
	+GtXtHRA==;
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisFt-00000001DcD-41UL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 09:45:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvQCAWZJiu+4im+YbjjVGzMMGq1180+GNdHDRyWAv6XENf2M4pJTs4DvihPnfbdDS3220VXdBPGSk40dZ/SFKSXU8yb4lCwxA7aUPOvZjoi+Rcl/MlOZT/U/G8qQGXHHOE9C5n8l0eea3XNHAg8L8rLLrWNa7eQ/0pMMJWkMI/AF902Y+puoigerzjIyFY090+NdJWzbkJ5Nqa7xuNZ5Zr7QYdgk0ft5dQ6GwFAiimQ7koObQdwCHtGq2DQz+jkvCIsv7XjORDzuVPhcGzwrRUDjp0TXFSekhTtYHwjLyoE6IEuPuWUsw7qrp3y1vMB7PxrqgpQA5FSH0nrOE+FbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bujvcYJhTh9c8kPzoKTAfCOIXY7BHtINqKo8IJ5FoCM=;
 b=AjqF5sJRD6ptr8ffPeOdnbgAzh/Cz1dPlfeG+QWnKofJctXSAAut6MtZyM5fdNk3QCOU9dQhaIewMgnc0IzrobPpfN53V+vl9KRnoS6gclvW3Yf2kemLQ/lMAi/YE/gOVwjeVblbrLiLstBQ1+w8whjxYK83hanr7nLq3w7q5T2gABrvC5QngZ3dh2aGgfehy+yqVESY0OP/Tl+e7V3QUXHoQSu2f9TCk2+Lo6x72/Ps9wTxoWPNG4V9eSL9mX+U5GGxvRZTJe7CGEM692iVmVtEvt5Mxq3ssvI6bVBVkO2kmojLNKquCmDgl6KDC0xLEtMVfV6lhQcsE+4/9ytpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bujvcYJhTh9c8kPzoKTAfCOIXY7BHtINqKo8IJ5FoCM=;
 b=Zi2bkm6ycGrUGoJ+H9tEQHSg4pjwjXTbPvjyfAV6WIx+nK+IyWHzqhcW4U6OTjIJPVBNLQGJ1U+pemDBtnOYgf35G++5xJM0wRbkyjxWlk9Xvn8sEtiytQlrOfG9Fd4A2v88o1LJKXdBkM+srNQL8acOVAE6Y/PMpF1E2Pxtq+Y=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9352.jpnprd01.prod.outlook.com (2603:1096:400:194::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 09:44:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 09:44:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Ralph Siemsen
	<ralph.siemsen@linaro.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH 0/2] ARM: dts: renesas: r9a06g032: UART dtbs_check fixes
Thread-Topic: [PATCH 0/2] ARM: dts: renesas: r9a06g032: UART dtbs_check fixes
Thread-Index: AQHbfsTDIMl0Ekjt2E+rZBsc1tYqDLNGjF2A
Date: Fri, 14 Feb 2025 09:44:55 +0000
Message-ID: <TY3PR01MB113466880CA3FAB64A624E3A486FE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1739525488.git.geert+renesas@glider.be>
In-Reply-To: <cover.1739525488.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9352:EE_
x-ms-office365-filtering-correlation-id: 2d0a6964-0dab-40f5-2a19-08dd4cdc3ca9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BmuLZBNjFxlGS8/0WF/d7n8zzewo32geHc3tf6JLb0CUNdZ4wPjmzHOEFnq7?=
 =?us-ascii?Q?KNqBDAC/fvvdLNikJmPa5P61pAvbsmNxwnl/F35TPyXHJ9GTpDUbNZDbIa1T?=
 =?us-ascii?Q?Uzh1Lh/BjOLIYImvR3kCcPwRKfeh195ACHqul2DKndmP+sxx/ou3e7RUGMVO?=
 =?us-ascii?Q?kajfugpOqjJYd90mhWGBKvv5GQSjcfolU76tyW83rBo/jI3J00Q5EBFh3/on?=
 =?us-ascii?Q?bw+2wSv71I+VP2fXZQ5EhnU0qE/O6svRd9DLq7wwDNLVkrS9Oy2e+Pn2Qjz4?=
 =?us-ascii?Q?758gx/5vvg1wvf0obfonzXpAZynUXiMxmMtkFjJyuWNsAy6pE0C1wJEsBqix?=
 =?us-ascii?Q?Qo84YIj+TOFONgWdnukqSBz7p6+q2juZ7mEn3TNCVSY8sfdSEkQq1Sjj/jjN?=
 =?us-ascii?Q?WEZOfjwxNtCtIg0oj/EW2gY/kZg8PILRYZ35wuPyXDPNwXeyG+WTDV8eH3c0?=
 =?us-ascii?Q?OWPgN+U0XUHTHu4bNqouAKII8POb//xezKP4tABQ66rZSyxCqLo2fX1qw5Or?=
 =?us-ascii?Q?Q4edAfXa5vPygtiU6AmxjGY3PQY44+RY+7mzYmfZVd7XKFYRGf1zTLoVrJie?=
 =?us-ascii?Q?1SCj6k54eKIRkGZeRDTnFBVXCRF6VCvaueQZrLGiG4kxcVTts7HN/cgS++8v?=
 =?us-ascii?Q?tZlRyh0P4Vx1JV51VjtAiZH3Bjy3f7WLDKk2mXrzjb9MpQBwYW7yQMmZpTWg?=
 =?us-ascii?Q?xc+7mEM7O2T/yhthfJoq3QKPD5CqRPidyiML9sZY9E11zBiBohColmr1t31O?=
 =?us-ascii?Q?YDo9WGG7//y0ia1qsQ2mByv+ta2HFkT/tArxV1dIyuGbohQDrTNecSY4ugF7?=
 =?us-ascii?Q?hMpdIe4Nx7PHx+aB8CgWhmmN6igCorT9YxqJ+0bNqNL4kHTH2t22SWHrqgwv?=
 =?us-ascii?Q?qAtrBKTeaV3oQOXMjD1pE4EtkK2HJSLpw4RsH2CtDXXDOv+RihqQ4Oo6b1Gc?=
 =?us-ascii?Q?ZmSvrgl7hlDe+Rsf+0IUY9XWSB2xOv+tSre7hQAtetDQVEgLQ/6OhfzdTD9V?=
 =?us-ascii?Q?kdlFDo+VXbHS5kQ8BZqvI829Bh9oBYx4w7vUwDyAhOBMibvkaT2iWr/79PX8?=
 =?us-ascii?Q?NFEKKKm95B5Fn/IkNloetNIUqkVN7agTcSOPd06hsQ1nPnJlyzcOjvdhQtdY?=
 =?us-ascii?Q?YC6BdHZmUkNajSqJsP9ZOXTNf2UlilFiIZCAbDj+435ExmtSX3dFZjolAj14?=
 =?us-ascii?Q?OQQlqmg9nO0fBugjhmuJB6mSbFxn2CT1fkf/RvX/Mv0Wrb1jKYzkYq3GPRQA?=
 =?us-ascii?Q?GPA4I0HsLamiijAo/XmynN0NdePqbOLA8ar2NjwhMvMTT2sIxODO9Urc5lVM?=
 =?us-ascii?Q?SLmN7ozMUrKNp24hlChpHTDoHNDxv9wSNcAkyMM9aDmvrnTovWnD7Ep3Vi6E?=
 =?us-ascii?Q?KQc/6n70solbglI7tgvxGotTpIeNX3bfRHFiUQJNN3kLHW58LBn+hUE2OTYn?=
 =?us-ascii?Q?8cx2ENwurElclbEmhmbKCzSvkuB1CwTV?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?arXLwK2ZJq80RtOEFF6Ssajy6hhZCDixGXavf4QRi9cAfv/ovdGKDY1qyBJ6?=
 =?us-ascii?Q?3g35tlXp68vkmIpee4rCvy7MnkJJJPly3kSTaFNrCgSYnLtl/1jxdgf5UKIA?=
 =?us-ascii?Q?R6rBw91FNP83gF+GyykpyK8bOFc9YDlQLX1AKAkxv9Y8HO51sUrssNpXkfr9?=
 =?us-ascii?Q?rOTwof/aW2l4XhltR2FEu5j0//7zPhfhVLQWhCeo9UfdZYJPozNey4oCvKth?=
 =?us-ascii?Q?H36ltaKWP1OaEDdBDsnJAXa5iQlcfrFtrvzGqqRzrZcO35yNcE9is8vU7cSQ?=
 =?us-ascii?Q?oQbHnMI5QrTAun2aIWGrtAImrMOQ6KPkCwuXzX3ssBjMxp/IJAnOsCf/xTK6?=
 =?us-ascii?Q?tayPI/ohFFcA+GxVV7M4OvvEDO+L94dzjtF+/mAki03wezluZ53mEBaNBv15?=
 =?us-ascii?Q?vi6r0ixAJfsLh0elMY2y4JC1lCfvbr0+wU2f6uIOrX4VT0ooW/dwAvjzK8ne?=
 =?us-ascii?Q?59VDf+OyJZCqbgPXZNggt3t8q454wMJiYZ6Mhc55iy7IIRBDQW5RFg/mcXTB?=
 =?us-ascii?Q?RWLxO2D3TL/SgjMoAgPSYaFyPJy95YUMiD5uzsoHw2uSB3cRRsrhpun4gQEv?=
 =?us-ascii?Q?HfgfsG/HlPrNw4w+9T7x10emWD8oCIqUBZOwqpRkrclukalINBDcGjFXm3IR?=
 =?us-ascii?Q?B4CyiCd2NRsG62VZBiY2w5Qsw/zV1Tnx8Z9zWXF+61A5OEc3A+rQWnI+Z0mB?=
 =?us-ascii?Q?1tzUDDasFdLpYM+S2rSf5PiG3LnUmP0/u8Syw1G7iD6+Sx8j+qotIkWhPfUM?=
 =?us-ascii?Q?TXU55tUN+Xglr2Hut+zn3Sr0FsIlkTIjSQq9ubqPX34CDzY9AvBv2VzpBRFw?=
 =?us-ascii?Q?dEECkWmLWK7DXhmUVIYY842Q+fot7VXBjSXBuLnr+Tq2gB5z3dcSlN08dTaU?=
 =?us-ascii?Q?onBjsubIYJ2LcN5e/yScnbTNRkaeiSheV7vay6IFY0vCI14ai1Q3hYJFw8Ke?=
 =?us-ascii?Q?QUOiwdQTBvFdlGGJHwFGMkir1K4S47qinBIupAUfwbBLhrTFfoEs1Bs1W/4X?=
 =?us-ascii?Q?jptP4INLubBkGei6sF0SX4UqEaRUjmVKgebGz+Rv1D6sPw1kt2qZmbZehBvv?=
 =?us-ascii?Q?GAocsIwhM6y9rjzu/m8xAG3DYXgak2mcq1GRenRhZGZWH6sj4VjYwG2h1dBB?=
 =?us-ascii?Q?IMSnEEqyjHHlsNSpFhbjCxeELNsNPrb/0koNKBs2pbDRV8RfWYu0cgDGoENm?=
 =?us-ascii?Q?NsTg/XqUttsxzY1cTnr/eDOdGAzEYNHcpVpTtUg7YYFxqh5GaARhGxnj4/gc?=
 =?us-ascii?Q?16KQN1H7isOTOk0KjgfNNXQaPJE+gkO/YKlte/qb5rX8TNKNrU0WwpdDDxSe?=
 =?us-ascii?Q?tedLse3LallZvtHuQoOidbf4G7+WXhzw1l4ALPeHVMTrGqRJGpLn3RSHv2dD?=
 =?us-ascii?Q?eDwXYZT08pmkrtdP4rSmrJOwUNhHSqdzWbNwLfrFx16292Y6HvrQKhxXPkBd?=
 =?us-ascii?Q?UMr6Ma4GsStmWcCWLRhzSMF7oX3oIZFLNKCJ/EZZAr1lC6xSFMoxRRemH48n?=
 =?us-ascii?Q?UXW0B15cuEpOeTTHdOZuSg5b0UQDce1EnWB0lkjsabaCEudIH5svz6A8I4m5?=
 =?us-ascii?Q?sgtx9oNorYwubnNd3ewc4/zFhlPCPH1D4D4JdymvVFImeR3Xt3TW/u5i9VU8?=
 =?us-ascii?Q?HQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0a6964-0dab-40f5-2a19-08dd4cdc3ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 09:44:55.0361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lhJS/F3nu5eixp0VusHAuAjPf5II52VnDoupsaO/tHyDenl3p171BoIZTRCkHTF/D6e+vzE9INqOLUNFGuDWX0kjDOqnxggbGfd2Rgads9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_094506_961630_D27653DC 
X-CRM114-Status: GOOD (  20.64  )
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

+CC
 Ralph Siemsen <ralph.siemsen@linaro.org> who has RZ/N1 board.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 14 February 2025 09:42
> To: Magnus Damm <magnus.damm@gmail.com>; Wolfram Sang <wsa+renesas@sang-e=
ngineering.com>; Miquel
> Raynal <miquel.raynal@bootlin.com>
> Cc: linux-renesas-soc@vger.kernel.org; linux-arm-kernel@lists.infradead.o=
rg;
> devicetree@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH 0/2] ARM: dts: renesas: r9a06g032: UART dtbs_check fixes
>=20
> 	Hi all,
>=20
> This patch series fixes two "make dtbs_check" issues for the RZ/N1 UARTs.=
  As I do not have access to
> an RZ/N1 board, this was not tested on actual hardware.

Adding Ralph Siemsen <ralph.siemsen@linaro.org> who has RZ/N1 board.

Cheers,
Biju
>=20
> Thanks for your comments!
>=20
> Geert Uytterhoeven (2):
>   ARM: dts: renesas: r9a06g032: Fix UART dma channel order
>   ARM: dts: renesas: r9a06g032: Drop snps,dw-apb-uart compatibility
>=20
>  arch/arm/boot/dts/renesas/r9a06g032.dtsi | 26 ++++++++++++------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>=20
> --
> 2.43.0
>=20
> Gr{oetje,eeting}s,
>=20
> 						Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But when I'm talking to
> journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds


