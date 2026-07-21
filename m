Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C343EC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 23:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16b8xemgFkcJqbY5LZiSU0Iy4MCUz8RvXcGIy7gYCL0=; b=33a9aUXkKv9ReRwrZNKfAU6xs7
	6lLsojyki1mBewgt5KW/1HYPKzxEndYdTIwt3FkYWSvEEJRla96Y2CsxjepsfW0Fx07jnoAusv+Jw
	WBi+dch8TfFrAGkz+s+xw7Et68ds2klkvg5KLS2mWN5PS2sK2PYQF76jsGKiDNH1JzOrCuQGs67/d
	oR5a0G5L8osl2pz+kfS1O8pc695RQn/lDZhfxx56lind7m5YO6WAjd1f87TIcgbrlbvQRLCdDIhia
	r/Av9OOPnOx6+qfCqPZE7yiP1NB6JeUQPCLmt7Z58JNA0cjFuv5jqEiDghWQxi+CKHX3oxorau5dF
	1pnTycQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJn3-0000000AaM3-0KE4;
	Tue, 21 Jul 2026 23:22:21 +0000
Received: from mail-japaneastazon11010033.outbound.protection.outlook.com ([52.101.229.33] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJmz-0000000AaLL-2PXP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 23:22:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDdVJKutul9VbZ72yVnk+M9BB596gnjTAY/WbPJRkidWKg/98828JsZfifs9I8v4hz3jKfRarb6Vz7JF228D8UX1rX8mvMTFSRtg9+AorHJAJV0KqbA8brPMLzWMXW/gUlNZJ59OJsXlX1iztyo6LagzTNYMZhO3EWIe5NHVhQGfkxsNTOrG+GNx2AiDRXyaCq2rQLHQnNivrap1qcztTMxnHMoCai9u6hVOWFcPSiw0T2JpJrAhPJ3wTpdi8lWQwL6d/DLIe9L/Jw9Zme9AWBzFEFLrjdbUe6ez809jhBWpZZ4DlUK5oa2Vt70My02uD0oAEZ3J3gI8aUDhUbJxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16b8xemgFkcJqbY5LZiSU0Iy4MCUz8RvXcGIy7gYCL0=;
 b=EsTBX0nO2eWmxSkSmSfRmMUZKgRoMMtlxUVuK5CSLIOlHzsh8GJ2i3duIpW9uhiRNjmCS52PmB5RAtRSLc09CG7/Z2spIyC52zNChRnbPGOBzwnW1iGrwYgm7YwjiBkFch+5SGkkTvLRiMwYLBg7KSdeBqaEhLV7ax/lhur3WJrFxbFbuLx0n8MviJlXi//O1wd/Jiru5oGGqUnNEv0k7CLnQIeSmpbAVfUvPs121zixadIQ3TOlDWGLnDfww9fNoHNaTluxmI4YS9VG9lxkQDe6EbYzEsA5tT28Hdl8D/9NnHk3qU6QNBcu5UGUP2bKmmCOIle7sJ+W8L+T6MN/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16b8xemgFkcJqbY5LZiSU0Iy4MCUz8RvXcGIy7gYCL0=;
 b=XfP8vZBCWyVBINr6gh+i25lyN+VsGKAwBqrWycnQqjf5WeHjxLLablqKOX48IFjC/cssRkSSglHer1ZO6QV6nUCyUrUxASiryX6rJqVdjvOWP01wQjc9GTkysZRGzvlZbRq8QB3FrohjFxclKm+w0mYC8gfoa4a2C/j2zuAOV9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB8712.jpnprd01.prod.outlook.com (2603:1096:400:16b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 23:22:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 23:22:08 +0000
Message-ID: <874ihs0vz3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong
 <neil.armstrong@linaro.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card: use priv instead of card on each functions
In-Reply-To: <1jfr1ceqx5.fsf@starbuckisacylon.baylibre.com>
References: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
	<87se5di0n8.wl-kuninori.morimoto.gx@renesas.com>
	<1jfr1ceqx5.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 23:22:08 +0000
X-ClientProxiedBy: TYCP301CA0017.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: c964cfcd-e782-4039-7b3b-08dee77ee262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|23010399003|7416014|1800799024|366016|11063799006|10067099003|56012099006|4143699003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: c9D5NgWMSz78K/6vtTqzyWtcEHKcksSmci7MOKDFkS6CnO/LLuP+/db/vX9DaZds0rya7t52srRyg/yjrVo8rna3staWtEg5l9lQEZ/YFDM+e0eUp0XHkBNXiouU/cStsIzXC+0y29OO8fFfmF6MUVrjdXuh/QAfh04fnF76d+RPlss+Y09UYnNtDgrEwhVXKYKRyKfl84HLZj2wuGUQsf83Ci4p2CJMsPyj3hjCAeDKcxKb/79rSbWBcsnb5ulfO86puVtz+fJXGizjcaMGvLSQ5zBpFJhRlwtFSY6xWnknakEDwkuFuKROi/71gJU6v38AIKwLSEOXm+QaVWXm3L0ASZDzIEw0/tyOSj9TAwym3A471EPbmU0SMC1rOul3kAFMW7Kq2CiOH0j45iTMJhDX7nribobYe48LR3J0bqya1Y2nlK9E9n8sWXau1xp19UVG/U+4TJ5eL1VAwSlvN4OFEKOcPJqdfupPwhfB+rzZucW6IO31ncRT4BT048wQAl2K75MPIdTjQxFYJngWGOnexky6Bi57oN1yJeHoqmls7hjc1Xf0P2Vw427IQubjSgSir5PkWuaIJp5dbPLa7NSLC4Esasz+BI01Vrx88YeI3i9x1zF2/29xbD29PN0aHWurrz9AWWsGnPCdC7ilQI65EGE70aok7Ss/YhQWeaKpV/KGwVgVLfpziswPThps0M9WXWA8XYwXF+mTxJsLA/WCkU9Pu7hKc7ZtS+SADao=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(7416014)(1800799024)(366016)(11063799006)(10067099003)(56012099006)(4143699003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+8xmdoV3ymzOra+XloPM4pfqSO78icMrzTWqxSX4fEXVqTDuTe/DMwfXPIe?=
 =?us-ascii?Q?OeEclgQ0Y5cQSzgdws+cijcvlnmJZ7i9oG2XISOnX6LEkZ4wBCq6sgnN4QV8?=
 =?us-ascii?Q?lo3EK9jFhOhmacUKq2JqY5jSmRYmJE9VttUCOEuJjATQ8D5JE7puIzrgR5Za?=
 =?us-ascii?Q?ewPbVlx9Ux/+Bqhvwme40PXby9UTuU8X2NUS0Y+69o8wmKN+5YP8BMzmp3qS?=
 =?us-ascii?Q?srEHAp1OOu4o7gXKspTJtCGxh3og82/gTtLJjtZ5tAGjY7sIIyBRQb5Y+Slb?=
 =?us-ascii?Q?dgkhxcQv/PaG5SCPJKML7QkwGF8/zoDoV9FG6o3AVJ2b1DYPLIipmQUhQOJ5?=
 =?us-ascii?Q?Xy0ijfo4kRk4qCnYjn4XOyaqM2CwNr1hxBOprzbNRYvf8+sxFn9qTpoMkQUT?=
 =?us-ascii?Q?wfRLbcSPhm38X3ocj6n0szIZf78tiCllG8sziMxWY5cI2se/xjrZUYZMLb1b?=
 =?us-ascii?Q?v4roAGKG60ir5wZMmUBc/OgZJreg5sh67RsGDOWE+5uZnxSw8IW4JmlgVtBt?=
 =?us-ascii?Q?kgLLbAM1EtZHNSDXUlxnY2YXpV4DIEDk/LByDVnKLM5Rfvy/H2ldYk5H1dNt?=
 =?us-ascii?Q?8HNlQuqJk/vccLXhSzZ4hCEvxV7rIumNxRea0wc8536Qbzit+UfZxiW10lf1?=
 =?us-ascii?Q?0Sna4eQIfOZJSDWZCx7tVElaKfDn9Amgd7/dxgnx61YDuOQYACZsNBz82AuW?=
 =?us-ascii?Q?NBxQuhtxFYQW96Gauu+O1jcIHZb/pkgqgC3SgRvNHoP/ZNq81QRTsie7WQ+p?=
 =?us-ascii?Q?WzOWDqnCSTKj/gCUQSGmRjDy9LdEYJqeyIhUlPiXXw6toPjgZqCObfZn+lA4?=
 =?us-ascii?Q?qjzKBvyOXNBnPjaGQd3uB6C8s7X3ebwZrQQ++IpaO+RoeZbBb//nK15rZDca?=
 =?us-ascii?Q?qj1lw+OuZZ+IXDVKyMzoMoUvXcgJA3B1Uf9L0nvCYPZxDaKUMguLlH2ql4uz?=
 =?us-ascii?Q?/lA+ObfqHA4bUwkCh5BCZUXLC93et+cUfoAL5bXuJISYx5UzX2laubUlWBDS?=
 =?us-ascii?Q?YJEVYLuudR5MvyX7FxNt1Ieb9A9S1cdTvtrh/yvobyIUaEWw650W/EVIvFb3?=
 =?us-ascii?Q?EsIX0IpGmYPX3c8Ca3fwMw0yjZCtGB8PlI4fBtZKeqyilv79n7Gf3b/uznm0?=
 =?us-ascii?Q?VCZB22OoGwtsSbr5t6DWmVwwbj5FnrqhNTx31BXQHXpdXiY4Ka/CPNAQxYXF?=
 =?us-ascii?Q?YQsumWJ/AFJh/zhBDupVkYDWTQREKEqHndhhjNmea79xO72ZjQrpyuFIc49y?=
 =?us-ascii?Q?p9Jd/n0vL7rUWr+EreYJ853TNTnM6GDw0trw5syeyPhEhFZcEau44k0AZ1BD?=
 =?us-ascii?Q?dah3fOB7CQm3yaXauhssjKL5sillf3sBF1zCieb0SJGXmTYy2WGfwJ3kmm0k?=
 =?us-ascii?Q?pJPz9xTra0uNJpWqxmwIszP8ssQYc1590i4wuHFwo3MgELb2/Bxp5nIyJBJP?=
 =?us-ascii?Q?BwX9pHBko5fOu3sope3IabGmsUCv1Gnstw9xvk5y18nD0h61+pjr02p3xaAh?=
 =?us-ascii?Q?qSwm7ThZB1vNl6WWxXx/8YNgizEMQfd+XUjvhFbhuBCy14pqmoYPB9lKTX+x?=
 =?us-ascii?Q?/SBO5D6+ks8mfWPc5BVUB1rIKFDDulXXnrfXNx6Y4lzDHOQM9HzwrnQjwC/a?=
 =?us-ascii?Q?13SbxwgrOQK8POqKAdFF7ddZZ/I2XHKvXn8zjOMme9132rlDh0yVpYHHGJdO?=
 =?us-ascii?Q?Z1DfrKoe5y3o+jj24kpg1zdfqPUPfEls/AurjsMS0IKZTQ0kKWzPAgg2BeZb?=
 =?us-ascii?Q?Yho6m6O2cbuDdzC1K6/uNZz7YqeHEb7hLxShAzZrk3gJ14ISgtfb?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c964cfcd-e782-4039-7b3b-08dee77ee262
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 23:22:08.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+gtT6mtgVxQcqElx/i3WkBq7qpLn3otxs27zT4ymF8eJoLI40mjtuXSOwxKTB0LGODqIlB3eTjffin1cFq8d7dUMNgZBvGKXSoqnTVjSmTaQid9/th8divCX1iRJDQn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_162217_702172_2F2587CD 
X-CRM114-Status: GOOD (  15.28  )
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


Hi Jerome

Thank you for your review

> > We can get card via priv->card, use priv for function param.
> > No functional change, but is preparation for Card capsuling.
> 
> The change is simple but it will make more complex to backport fix an
> older kernel once this fix is applied. So again, getting more context to
> understand what you are trying to accomplish and why it needs a standard
> card variable name would help.

Basically, after "Card capsuling" has done, we can't directly use card->xxx
anymore. So we need to update all of such code.
I would like to update such code as much as possible in advance.
Otherwise, "Card capsuling" patch itself will be more complex and difficult
to review.

But looking at the code again, indeed it is some rather exaggerated changes.
I think v2 can be more simple.


About [1/2], I have noticed that there is meson_card_parse_of_optional(),
but snd_soc_card_driver_of_parse_aux_devs() case didn't use it.
I wondered if it was a mistake not to use it, even though it was the same
pattern. Not a big-deal. If it is intentional, there is no problem.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

