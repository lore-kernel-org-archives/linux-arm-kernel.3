Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE145CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snOZVOW99CIyLQjhF6YsJGloAjqPgDT6mJDRZsasKCw=; b=uGL3IOR8Z3uiVUJe23v52asK1K
	Rj1XhgWUfZqPHGimgsw5ez2wO10fFATuVuLwijHHAUDYwXANko97T4fszunwAzRq5k5nQpj7aX5jg
	/CZWTQtsKoP9RDoPIxsFmAy5UNVU43vD3Msy0jM6X/HpS7wAWa4+eCq8HzpaAQIwV8IJVaHYV0W76
	YHHdRTiiWGcJnqtCoWw9wRRlPeSkzVYfL3bE62HfFb0v9FQnbPPwViRI6MA+GBXXptkEDwNueX1+E
	zDpm9WmxTzqU7vU5f7uyH2QI7HSl8suT1wIOxRGuqfPmiYBC1I07jx/xdVqwXsi4hi4gyI5M04Td5
	1ZaAIYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXWX-00000000uwf-0S34;
	Fri, 05 Jun 2026 16:35:57 +0000
Received: from mail-westeuropeazon11011034.outbound.protection.outlook.com ([52.101.70.34] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXWU-00000000uw8-2htI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 16:35:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9zosIdLkKY+g8ep1EzZGG38EfNBhuwxtRXUZH27QLcvCxUkJFoQj56L3sa6A89/876Fo9cJnuZyq5bF8VqC/342UGpbrtdkuhQWoPAbWRin9o3GJjh/5ZcO/WHYbwhkT3Rej4TkfhiyAf15vlrUD5fSFD/lwzUHeAtxhdngylP5g0XkeJSM+q/zqYWwgFQFiqH3xKlX11NQdQFPGnTiQJiQLGc4modpYPQ1jaXlslSXa1TW1Xax06LX29enSk3pkrrA3PxSfyBtPtHxlwt3XUie864Kzx9e8ZJwiqot8X7CtbPvjK7FkPot4kcR3WHn/Aaue+SLTXCurVHUsFpJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snOZVOW99CIyLQjhF6YsJGloAjqPgDT6mJDRZsasKCw=;
 b=LdlNxSkaFJaWhrelatIEeIXn6XciO5rGsUoRoS4ozrd48mZQh8N/FyW6gFSpolllHSMdmbH6nJMlYM4ubQ9jNky65Edqux41Gs0ITb/fFfEn5e/l0tr68eugGDwrWSI5mYT0nPnWoCklOpNHtL4HSOfUh8UDS4WkKQ9bo44V3IUegD8vSwIKdNZQ4BaBljkf7zurndyj4kSzeBbZMghyFIwUi1nODPOYahfd7MgwJ7Uu/cQAOJ32hmD7bMbpeHolO5y0ps9yKJ2jIsUuhiSTBxF/qww+euzchk9JAMBHA8Bn3KFY02cCM+oUZiUeVBKYOsuJUcM0j5T6/bc8uyzlOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snOZVOW99CIyLQjhF6YsJGloAjqPgDT6mJDRZsasKCw=;
 b=kVCiuvjGDlD73Y+wF0ppCWLVKJJq/pUzyaRKDbj/AYJ2537yQNweMKqNZRlCxiI8wOKua4Q9INUt0XtxxPwWCm8dn1ygJojCSPwvxd/Chny18CkvRv1qkDv1dEWqbGOOxpjLERuTNXmPbEXcCEROt7mUGYk4wtnQGCuSM8yejDcJ/da/q294khaFQjQw1VftBihqx6FAX1tEQW7Lts3jFf4DfMFop3vvnVDzojGLmj9grcMhuI4SzZxbOud1IKPbTRE+UoVU1R9FIop8ubyICa6Rvh/DtJHlMz3HGP9RlS1LXaLP5sSCepEIwn/f6VkZq4zuUEYei46Nv7Tf2KEJJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB7093.eurprd04.prod.outlook.com (2603:10a6:20b:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 16:35:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 16:35:50 +0000
Date: Fri, 5 Jun 2026 12:35:43 -0400
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
Message-ID: <aiL638OLrfntKmSC@lizhi-Precision-Tower-5810>
References: <20260527151414.184823-1-wahrenst@gmx.net>
 <5cf05aec-bc70-4758-9c00-812a33a44946@gmx.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cf05aec-bc70-4758-9c00-812a33a44946@gmx.net>
X-ClientProxiedBy: SN7P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca95678-b0cd-4b93-fe49-08dec32080bb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: cPYFyMG4DbRF4LUpn599QP5Jg5S3WPAZ9CEdjgL6QQ6nZNL11VSuHHyZzGkBOm9DYS1hlUATjFO1qBDlpGOeI8PoAosKC0EeUW+Q4m+etgxhDh4eDEa39bGaiKGhFgXryemZ3PoEb/qyIdrWxgM2AY3x+pU/m6toWk5J8GWnFjZbGVehKZKHxumIDstfB7wm172cVjr5mpYZSZN0kQPKvqmVumf9iNbocVddMx8/6McD4sy6KmigQUIiltjjcHP9y89iaMrTyCzISO97bh2SWBqcCc3T/Kj4jlGAHnR7kwWgQYVIWHycW6R7LPlbzIThcWyNwRA6xQO5vVnL3E12hhQVeOzCXAg1NSwLVxQoSE4xZBi1/sKyJ2CNSxBHw/Zf2/01AEkQfmqse6DHiRBK7eSGh4jozPgUuqspG29j20W8TVumrD0+JENxmyHCcpbQZJ7kXW9+XFOddu2nx1ONydHL4JMGS45OFw7y6lAgvJVX9+UWamHoAofXdEgjW+q9tQIfMbiqPPCgvMMLm0HQNhkPRCwwWiVF3tAa4STyhYsV4Q+8GpUobERELPu4FNq4HpSFSYmsp5iyeCgVkw5ITZi6FAwtrVFu/lS+9NipaxoQVJNLk0i2lsWP6EeaNwmT6KEM26+vhmHwinsFA+M1nFJTWxkCIerkZIremHPm4bbdd7Oks63fAkIDH7xUxF97F+l9J0A5xkxvrIHOdwc3tyU7ozkiEcLlTuWopXdEwHk/tPTf0dR71T1KQkMSDZLb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rTvYds1p6PWIVmkbsg1JeBPRgzgtivT7+2cQto0GaoDBvqZr0xOjukqzjT+/?=
 =?us-ascii?Q?c7BtAhetupsoL050mzHpe/xUS7kDzwEHPYSut/FnRilJlpqve8s3hgoH1s3P?=
 =?us-ascii?Q?PNS7JkpCyuzNzSnbmXtYzVmKtx6xbgzJD/cm+jUAMq+1Nt34A731Ch4YTgeP?=
 =?us-ascii?Q?LVZOHysh8tKquvQnwXejl5VsHIzXH04KD5hR7uruuJFcL9lfUP22DnW8Z5X0?=
 =?us-ascii?Q?QbLrN9BvMYajHqOg9pZHxrccVU6wNQzKi4mfwaheSBIZWHKdoR/ABMUmlj0g?=
 =?us-ascii?Q?qyk3asPKE0dQdKUBG4xTo0Xdx8I9QyXjFTda1PjfSJAEquaPxEyOqpYwFLMS?=
 =?us-ascii?Q?UxABuyt+9o0bIZgtrGI9v/6Ty9GUlUvdEQ3bTkTiSls9n8Xs/m/Nf9rIMCH7?=
 =?us-ascii?Q?yD7drcf/er1YHevsyQu44hH85MgLmKWknlUMHgNA6HvxMALrp0SpM1HhyoEG?=
 =?us-ascii?Q?fjMwYB31wqvJ95gqt6HyeqCTMK0Fby9iFwzuOfhhD/ggWFgqiQTcvV/QTRQV?=
 =?us-ascii?Q?QOqsF91EYRI2VPiI5EiEMZym9P/6mvWU+Nyho1l2kZLa2Xk+L3YwD9RxQuTD?=
 =?us-ascii?Q?8oPt7FS5RsPEXH7gfc8haEcnOSms6aLAjd/4IU+4vuXQ/CUY4TuaUbumScVW?=
 =?us-ascii?Q?Pfej21TetVpMYJqabEpB2wlzkKHRH0DQLekSI0ISM5H0sB90BC1g1IU7Eup/?=
 =?us-ascii?Q?YId5M9IGoeXtppGufPj/AInq+CITclTJpeBUKcFMl0rMyN8AxCuMM2PTDiyc?=
 =?us-ascii?Q?DlGvR3M2mRI4SqcUyfR26Bv6viQDcxSN9tjB0ddB323qqYLZ5ULnQ7pK3ZQJ?=
 =?us-ascii?Q?RYVCNIqZtwkSeXi+XLcwngbApMteZN6Xb+dt6lc0iHheaSAABucZyxRCjKc1?=
 =?us-ascii?Q?BI33wqYJf6rupTdd+F4n8GeS1pjJNz5JjfxtzHKquNkwWMxUHgoyFjEPlYiy?=
 =?us-ascii?Q?+uNk8Hd8KgOfK3fEGDypHDRgfbrsBmWPJrSG/tpPjV+jKIKYy1qHT3X97Ppz?=
 =?us-ascii?Q?9gDsDK5HO87ZOtJWzl4arNh+++sAPypAV5m6GH2f52fQHg0snh9kmd9fej0u?=
 =?us-ascii?Q?55zqeATrxpV/fOhxBas/Oq0F1uaWDaiqGn9WkOvm5ooI0qPZNPJ+CzTHLey5?=
 =?us-ascii?Q?6FDrxMTGMII5L0AD8kAf6Hk7kFlfE7P+vIa6CPRvCoY4vGXLWrXUQX+UoUj0?=
 =?us-ascii?Q?FEeYMDn0DA6ZN80T35Xr4tLkkaDoe1NMwIP2Na9PGnp9JP/YvG5M8cd+N43X?=
 =?us-ascii?Q?68CgXM3p8jZvX9P2g4vQ9VtDulXLeoceZmQCIukE3OToayTShySQox2U3KUl?=
 =?us-ascii?Q?V8c6wNcGuyfuBgZ03K7noGuAzODiFEIfnmLZ0pSH1TuD/21BDywImva1D9XG?=
 =?us-ascii?Q?GQbONFh7MRrmryZLrNwglOVmNVSDX2M7jA3lBT/zJGrigtxBQ46t/TaOyCYn?=
 =?us-ascii?Q?Sur4GDxpfT645XQDUGaYloJeQptgc6D5w3oGYfCx4lzIifuvJaLzbAmaIks0?=
 =?us-ascii?Q?QFtYX801HCEMvQH+f8WJuT6JOytUY3AWGRhOwdMT01Fv4kUhU/hip+00S/Bp?=
 =?us-ascii?Q?TAUii0StmeKRjG2mL5OU9B3UleSs60VTcloL3elLu/LXCG2lQ2L7sa3sCGxA?=
 =?us-ascii?Q?WFe02b5F/ZNhskx0Vs0hWTqTEB0SsYSECGCkCG6owYJE3CmDDkedyAFDj6L1?=
 =?us-ascii?Q?QdMXFi4YbOfgHXDAh9XpYXMMxik7ZVjuSoOiQT/0X9mhXQDdNLqScqVuBs/L?=
 =?us-ascii?Q?8tcX06eKQw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca95678-b0cd-4b93-fe49-08dec32080bb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 16:35:50.0962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIC2PaDGl/5Spfomv3dYbR9Ace4Y8/OKniGZiIoLbZ1SraBMbcFN2nesgw5ps9FPYFd97NGdKgMJZWwJmiL2qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_093554_688388_EAD03BBA 
X-CRM114-Status: GOOD (  17.22  )
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

which is base commit, I can't apply clearly.

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

