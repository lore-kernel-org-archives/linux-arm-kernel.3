Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875A0CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILIsVE+/61ubQeNm5drklDRMU3pNI5q6CXnD5UmgG04=; b=Q986cVuAS+BRocRsSvkNPHBugL
	JpdVcojJYz0+12x1Qt+zER6L2IU7WVEgPz4BxaAg7eZwNQLZZ7hZEoHhjtpDwh2C+t4lPDvXyC613
	YoTQeng/BSl/mxQNAFOXMAXHT2MtUeQLT1xnZpGAiPrKr/evKZ++A/JFAgL8UBWwH7OvCQHD4wCKc
	53la0+cLyNUQl5ha2IZ46FVhZl2zQ+QKGZkbBmch72B5etZbplbdFo4gV+u4iC08tyFTFkotBBZCr
	0V3cJ837wLSyU02Y/X2mduGy9u+HeORj22EOquZY4MGQbVBxnEFihXksyMf1yEP4jabokcSafTN8u
	Ra0+bHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXQP-00000000uct-1rpx;
	Fri, 05 Jun 2026 16:29:37 +0000
Received: from mail-northeuropeazon11012053.outbound.protection.outlook.com ([52.101.66.53] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXQM-00000000ucP-2Yeo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 16:29:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUL5juyGw7Fn7Izwb5k5ZyQ1T8r4kv7rDqy4adwlyqJnBf1yx6zZh5z3TJGSUz5WDlXlcD+hAUfKJvUGEZaLMq+f3HWYD3gJTk4h69nIUJ/0vUoxFAFB5RQznHDYZitkS9nmI4X6BzWo0X4vIYkNdeFomdReURnOsGpM+pSBbQVlquffF1Pu/LgIPRsld1/QEwCtHm0zVWqI4ED8nUB8171SCDYRlcXj9BJyezRGBNLx3cf3N2kOcxMTuOy8Fl8jNCTHZUBgh0ac9Oy6zir/AtA1TNtJj79HIKCns7iuM5md2liy49qbDCX0LuO1v2IuME4TbBbF5lJ9iXddvbl9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILIsVE+/61ubQeNm5drklDRMU3pNI5q6CXnD5UmgG04=;
 b=SIhS7I1DpDqNGei7GtbG8QkGEqBUoKl3LtzF/dpvethOcxJvhoC1tSL7O5g93nhotUoM4Xzl8ssGD6tDxMrZhg/OENmzfX1jBvNQyzoEoVG+B5N47YXkvmrwDpAwJdJ9QzOqV2h7GchI88riOHJqoK6H3WLy+n4HHTE9MSiYtj6cV7N+/re1/QMy22emnRB0wPQMKt/rYhZa2gJW+ZhU63Hh06ZhHw6HhLrvNFRPu/s1IJbI2lqRFHp6bvA96wrzCbgaiFiAQKgPHbt7Fo+vPKJUKpi1yzooJOBp6VNY5hUi0Dct/bWf8gAJzoBF3saUBFRA5KSyD0CzHPWJyDGm9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILIsVE+/61ubQeNm5drklDRMU3pNI5q6CXnD5UmgG04=;
 b=RF+zBT5BoT+7y+TSS9s44Vi3PemZNpIhyiAF8fNNmxpfDi24KLdAvajjU0bN3SIi5s1bc5Fdikga4SeN1/oujsiwF46lJHMlVmdyGf9jnfIlFu0LD3JxepUtNyCNGqmE3Q30DGOMsQpWIbECl9gCgE6lotm6+l8+G/strHYokIflRA2rfv52WC3IZVuRkKZrFtoXEt7MEkJfg3avIX8JcyFTb3GEITEyKTyx9xZjPi9uYsih7v8biYT57la0a+Pr4PRK88K30MckyTX4BFEPLAM6Ery3a+PhxD18wJZx9PYEvrlwbAyborOn+xuDKVYZUYH662Kgxpb8EDXmFWLyhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10140.eurprd04.prod.outlook.com (2603:10a6:800:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 16:29:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 16:29:29 +0000
Date: Fri, 5 Jun 2026 12:29:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Christoph Stoidner <c.stoidner@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH V2] arm64: defconfig: Enable DP83822 PHY driver
Message-ID: <aiL5Yy7hiL30FENV@lizhi-Precision-Tower-5810>
References: <20260527151414.184823-1-wahrenst@gmx.net>
 <5cf05aec-bc70-4758-9c00-812a33a44946@gmx.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cf05aec-bc70-4758-9c00-812a33a44946@gmx.net>
X-ClientProxiedBy: SA0PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:806:d3::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10140:EE_
X-MS-Office365-Filtering-Correlation-Id: 4685ab29-89c4-4e29-cce2-08dec31f9e24
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|19092799006|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info: /xh5yeVwqN6PzOhzHsKsmUoMCnNAmNtBb/M24yeiL+pk399e3l5eyeH+lfYS3ckj6eYe2fDiRp/AlHo0B58uSdSgIg5MSwc225t4YbVg/3jDllxBxpNCqGxXV0rPGInivUQakPw6mTUN4ptTT9OIJ2JmA9Lp+jTjWAaxQO/O0dLYAcbeEgGLDxF+zoI67qrDP05TdmHW4+al1VOURa1Wj+AjoPbI3b4C533bn2X+Z45EYJq8Loao4xUEXkdFofG+98zxAXtHcqTyKlt83R2xPIJ2wOS07UaLFcEHgsrReut0pyTIXpjhl38xokmCpq+ENjPulV8IBm7TLrL9L0Mj/8kAOrTtnJ/QgDc2tgUXkJdxjYMCdZZwOCvgrW6YHWJC4L4SLBBdysfE+Wj1IVyzZN4GRhBAEagJ5YAhcx6uNas/IkysvL/JdhpVQfgIpEp8YazEg9lRZR6waq2GT+sPILj812nX3B14dg8Xyl7Y0gPkj1zCDlY4+pKwLpmfHkYLRkKcp0cWjm4PRicp6xF6fdLlYHMZ4h9az/NAPqMvhjKG2ajZd5bOE5fF+H55r8JVzug79rXPLuQ2W7WlIHiI5mwpl2TNfPXf68anKeOdkYO2BNs3NYkrn/Gt+Ni3ycsh3+aZgn9HbVCgHvp6A0sImlLF5JaQdhl62sfq+6euIKl1hXWlw0OdY5iGEv/XZwheWpBGGg1ZQTzKQLoniz6zGl4C/Y05prN0CuT5BYO6t9bxGiHsZKrMOaSFxde6domy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(19092799006)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i+jH21C1X5fhBj/ulg2gBrFhs6CGISD8jSjPHsLfyGSPGUw1w+IfIAwtvV3j?=
 =?us-ascii?Q?yxOqAoLI/ag2kM28zqil8JmCe0VWZ7LPgyAJaQvzjl03jFqCQvTS4sKqDXS8?=
 =?us-ascii?Q?QKQsQTaN2kfkz9EyaAxscwfbwBAGOU6tjxVdEh86m6ssGJnE6v4AZn9QYWDX?=
 =?us-ascii?Q?Ou/IQcEPWGtlXbU88K5T4y05MdAJBlnaiNeVbL4733wrrmSrIyVwJsXjXeW0?=
 =?us-ascii?Q?VSNf2k6Ans0fnJI6xeT2+TW3J/MSU4KqD/XnF2KbpLm0wFnlTQwN6CHN/nR0?=
 =?us-ascii?Q?wQ73+RlTrh2eHAw6cSwDcxOew4qgUgZmC1w9j5377k3woDQnjraaN6T8kYOv?=
 =?us-ascii?Q?soo3GzcrtsTOneWa789rLiqk4ZAd6ownlcA/DZ+30qIMitOQ61xxVKntOw4b?=
 =?us-ascii?Q?4/kyr3N0gOjn3RH2JihdOx1nCUvjXwPaHU7FZvSDzonRoE3sUW+0sKuU3Rvb?=
 =?us-ascii?Q?t/SfGqwUt3oKWvvgITdo5PzocTtJ1VhEJMKjcPWt6inuglkgmqLMv7Jh/ojq?=
 =?us-ascii?Q?AcFGgmz2aZbN+Bj5pFOBeg1jfwiq+PwkVvrWxBV6ngQW3EdBTbnvT3y3R76o?=
 =?us-ascii?Q?BGZHEmlAiuLKG7ygi6h7QJO0/dJ9biEAhqZUGLrl++jWPb0XjSXOONYo4S/m?=
 =?us-ascii?Q?kkCjZcQTnip7zBnSFiLQuNZP+B4of8PsUTS1yJ3yHo6R5DkY80rhJoHQduns?=
 =?us-ascii?Q?ekoqW5PeOJTwcF29EABdF/D4lbaYoBSpkTE3ko8h1HWivPTmC0eni1xK5+5b?=
 =?us-ascii?Q?vCUDWnOyLLdg0nYq7eK/JIXEMFFkl2zumm2DEyBt0UkjnFtIMZ+Jmo6nh92+?=
 =?us-ascii?Q?6FzPpShlWlYTUQFUqOHTiE0gXWc13TZcingrdc3YLfMybeyjVvw7rK9MojgN?=
 =?us-ascii?Q?72JM7Ex/B0lZ+C9ZPJDJyYuwt5c5bgGSXh909++WVCkHp36jgjDA12iXBML1?=
 =?us-ascii?Q?Akyw+xL5npJGVnIpHwaMa9mC44D/GKV0mIu8Wc48zJASU9QebwR+6BFFRcfa?=
 =?us-ascii?Q?ooIGAalNk6mIrBP7Lk6qUbrdQUt9EHR9XhAsKeSWqLUSHlpJvH6x3OKV/HvD?=
 =?us-ascii?Q?tDZI53xRntCdv/eM+wgGbwG7PFieqhXUyXDq4ebQeyfRt5lZSzbd3rv6OiqJ?=
 =?us-ascii?Q?zqfQRiPKZ69rtIjtwYGLToL7IBwSpqx23VtCGHvRAJtIgotgCUri9tkKlSrk?=
 =?us-ascii?Q?dnw7qrW3VLIUGIh6cSomvaZLDOUHaLTAjwrOCw6wAf0knle3oJhoTK6ZBGGe?=
 =?us-ascii?Q?X0zVTsdBl0snCaHgudaSlh2Q4ws1AgWFJVkzWaexq+2z5czZorCs9OX9TYqu?=
 =?us-ascii?Q?9dqTjCRev3GnjQNWkupWMSKIzKPHDtJ2At8Vj7zxyYi8/ZGM3r6YAkABrckJ?=
 =?us-ascii?Q?WZvKPs4x1BL+L7qhDwfsfNPRAe3JdBS1SNs5E/s/7HyXXHCeP+3fv4YQC8Ht?=
 =?us-ascii?Q?NlcGMT1njIJgknj23dc7l+ZrYrwGUiTz4zAmzSvANGLyzTJB6VIhjJGjPQHz?=
 =?us-ascii?Q?6ZMtBqYXEP/w3QfEZn9cfw/IGjti4+AQphhp0OGSmHhBHLTCdoj4Wsc8jH1E?=
 =?us-ascii?Q?2u4QTJdFXjvlA7TfaBhECaVmKoDNliYL5Yr+5W9nPa7UzVfcvvz9dSpPGNxt?=
 =?us-ascii?Q?la1+tfuVx4WfGYFVYkUCaILQFME0wS8PS33r6a+TvnXez3nIcTriBsZ5g8oo?=
 =?us-ascii?Q?4DhAPURam0u5c40MafyL7DQAiO+RJ5sstMKWNN/R7VTvUb5M5GRivPgegc5J?=
 =?us-ascii?Q?A53ogzjxnQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4685ab29-89c4-4e29-cce2-08dec31f9e24
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 16:29:29.9029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLOKUE+LjdpAXE8oIJFjmyi2jYmqKH4cn3hVGD/qGZ+2Tov7QmZLOQ9F8t8BebY6Mn468Rtb1w5pbMECt1o2DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_092934_654034_EFE260D6 
X-CRM114-Status: GOOD (  17.98  )
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

On Fri, Jun 05, 2026 at 06:22:14PM +0200, Stefan Wahren wrote:
> Hi Frank,
>
> Am 27.05.26 um 17:14 schrieb Stefan Wahren:
> > Enable DP83822 PHY driver as a module to support the Ethernet PHY,
> > which is placed on phyCORE-i.MX93 SOM.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> could you please take care of this patch?

I will pick it, next time please cc imx@lists.linux.dev, otherwise, my imx
patchwork can't see your patch

Frank

> > ---
> >
> > Changes in V2:
> > - rebase patch
> > - add Krzysztof's Reviewed-by
> >
> >   arch/arm64/configs/defconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index d905a0777f93..20bbbd310d2f 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -421,6 +421,7 @@ CONFIG_AT803X_PHY=y
> >   CONFIG_QCA808X_PHY=m
> >   CONFIG_REALTEK_PHY=y
> >   CONFIG_ROCKCHIP_PHY=y
> > +CONFIG_DP83822_PHY=m
> >   CONFIG_DP83867_PHY=y
> >   CONFIG_DP83869_PHY=m
> >   CONFIG_DP83TG720_PHY=m
>
>

