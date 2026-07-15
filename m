Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C105FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1hnJT8uss3uYoYbJKqT44ulymvR7gl48yZgap0rH5U=; b=PeHKEtdtl0DoPJKvz05HZNVX7x
	E8eaKy+ABnZnjFRfNqJu5e3FtRJZWTZFahFC1rncfovmNuys8Ogoypcfxl+D6NeVgSOidpmNkZgjN
	+OhHbNlf20OKoSCtARfw8b0PYq9H6yBruUkJ40edAsU3gQ3Mgvea2KDBse7eAtbAV5GwwT7w12Xii
	drxTRxBHPWSsI/h3m0zn3zHoUuYka5kZ0wltUR9qtU/7AVvFpqJeOL9ZmKmrEghRpjQ3u3H8R5cno
	TNcxWf9vnr1XbXLplarrQAHf3+tPMdhPcVRJzv9rmwFn8XPby67IPSILTRNFhdPPLZq9nQ97nO7Ni
	zx6PHlEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxBN-0000000EVCO-1TA2;
	Wed, 15 Jul 2026 10:49:41 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxBK-0000000EVBJ-0J4d;
	Wed, 15 Jul 2026 10:49:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFDEOkxTp03oQ5T72nLxFvpp7EZ/9EH1mMH1h14/1YaZtR+kpEgF8MnsRgQhn3At/le6NmOVzIFSh626inhOUQmVHRo9cnyJwxhUAXBv30pE1P+tUO/25JHT50KNhMk9OMXlccub/iT28oGbAvloBYFcyZ4kJN4pBg8a/vLG1FcK9jm2MAk/Nwm8v4FmqMNMiFj1N+jF/6YPUf8zfQ/J25I07h+zbVUQXsUz8dvCBguiIg6MCdHMquB89GBPV0JqzJ5M5ddH2R6XJ5+8kpyWDwPG6tdE05k+D6R7h6PVMpqzaFX5vF9tLCC1GYV3A2gad9ROdikKS6uHj/tQ+DffHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1hnJT8uss3uYoYbJKqT44ulymvR7gl48yZgap0rH5U=;
 b=FhLZKYnZTziimCQFbmEIofhyrf6eJkPk1zt9PwreH0Q/QtJzIioChov3Aav2YyVNDsbmp2zzQc+hg6Ywve+I5e4RCC8ikpaUW85vCNwPMCnXkJ2M8QL740tE4DgzvcuAB8bstmYn/rOMDBBr3LP0jeMQW11U7ThNXOvGlDrQtWw+4ZhgdDI/e/kOB6PqLaYkEBKJRsKNVJiU6I2/l7gSTuQQ2TF1zw/KAiPLQC+R0/vioq078SitoItYFirDtyggqDYEqjFeSsSZ9TOkz4b4OTNL1z/ZeggPP2pnVmbrna8yZCJ7/OLuZUa9Le433Uwf6As6xhFXDIa+g5MfBMujfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1hnJT8uss3uYoYbJKqT44ulymvR7gl48yZgap0rH5U=;
 b=d2TkecsOfmnitOxIyhrzNdQ78f9CGlpK81XbkLS442Wg7V77X4qj8CIpVNnWqT0nTQ6nFvhEoQk9nz/gUXSixnqcY/Zo8KtOH++6lIC6MrHx2ftPKGvxyfATtBpruNcaa5EXxXOSUcQc9qu5pNL1Xxyine36l3+EhxVRXW/4gT1iIRixNYEpcoCy54og9JMjh3m45D5vcpwKXCAWS95t5ISzjDzBsPczHhAtTf7KrpQ173WZ1rRLshJ3whRXQpwDp9O25F6ADg227eeDMcgAtAEAOziu3Ij2r/ArqcGMi6p2q080n76tGrnbBgWTzI5DsfilA/s74C9n2Y7qRWkihQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by VI0PR04MB10950.eurprd04.prod.outlook.com (2603:10a6:800:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 10:49:32 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 10:49:32 +0000
Date: Wed, 15 Jul 2026 18:48:09 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v5 5/5] phy: fsl-imx8mq-usb: keep PHY power domain
 runtime always-on for i.MX8MP
Message-ID: <bur5gz6wvbsoihajeufuerbsud4zf4wkl4n2avmdwl32lsepfw@6utezaj2mtgd>
References: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
 <20260630-imx8mp-usb-phy-improvement-v5-5-25d616403844@nxp.com>
 <akQVXYu27qG-SobS@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akQVXYu27qG-SobS@SMW015318>
X-ClientProxiedBy: AM0PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::15) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|VI0PR04MB10950:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc150ee-f46f-48be-1b20-08dee25ec0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: hIaWjOYstAjPY94zuOptrVYeZmDy4D6XwSUInTmBxDwGylCu/5zI3ULAe9lV9uFGeg9/Y6g7h852aqL6QRvrIWGAoNS/+T36I2i/S85TyFPvoIxjPQUA9bDUH9eEnVtmEBDDVleKGWtyisgIrF1fjr4VD2PinoyU0eRy+BemD0N9Ik3tJXQVyMBRKtGaEXFlnsKAqflPLH9ul4CetAcUuMSJsPHWanpjciVvhqUe24AlomK8E7IQfWRcHk9gpJFBr8pSTUOXH4oKH3DrDrIYB70whcvzmzwWFlj6dkY7xQAlvfGmiXYYbRkxwh6rQHNJPbRc1SS1dle1JdAIeu5oA740bOI1TtuvKMgbwLHGHxDt+ZW1YFb9CiI6zpMlzyTN/3JzrjA2GLixVe5eJ/fjERwg5RUHOvScuGmWE4L8DBKFrKpabARzGOArVINnQEPnMwtheTNwrrk5tRpZDNF5waRXbibZZDCgA6LbxD4tD4Zfr4p654l1BNNfRSvtQndzX7jtnKuLR8Nm1/m1HhicSI8RuGb6lJ/Xxq+AWH8f0ciGutHqH0YVxrAv/jrw4Wgx+QQ1nNkHNzv7xPhkj9d/TJxVZt5I2NWqW3ICc86HcIoVhYRTrDSQYoyG0NMuCaKj2gJqkRxbJ1WMGBUPJr5vNJc8C/C+ju16/giOfnTPFqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ir5DTeLiaUioArnqRTup9Tzk4q1syUmU6ZBUS1nqKysd1NlEmDzoS+5fa6EF?=
 =?us-ascii?Q?1WoQeKK6zmK4e6YcBgrZb3eBqAr5SmGQsT/ikDs8J9MmZPx+3cQLIVQ+3SXZ?=
 =?us-ascii?Q?Uj6HrgSYW0H5R4uELdanhJ+GmU++uqz9qcTQ9YnD5eQCduPE7C/lw/pijBtW?=
 =?us-ascii?Q?IoCI5s60jg9kN5pI89xIekpYyLgd2ac/TyrGEUoNFZaSbQdi8qJ869YDbJAU?=
 =?us-ascii?Q?zjhf+IaZauDNTZkG/fBr0vltDJ+QEZQ2/Hu57xU4MDgj2l3kqh4xYRfavjbo?=
 =?us-ascii?Q?ipfa52mausDiR65gIgPQKzHxrTzvGZtgwPTg2nv7z3DtWx6pJQLo99pRkYAv?=
 =?us-ascii?Q?iylxUCEMytYRyGYyJDnF/ozwOdC/374ZIPTQwfTDTYsyfsTgTJZQdBcQCEtC?=
 =?us-ascii?Q?PPMuo7uX2xrwpp953F0L6nJ0fOmS9JOcNqt7K/ni/rPel2UzpGE3Lh8qP1Sq?=
 =?us-ascii?Q?C6I8rfJBOqt7AmmGMdS0WhPJYNIc0soGaJwZHbGY1M6ae6y9sovIBkOyLFxx?=
 =?us-ascii?Q?ZtlJcL/zdvmvaqn5yBBVMyByXhcGlbttGq+dpFAxHVDmemwILYtztkmaQ0HI?=
 =?us-ascii?Q?pnZTsXfExVmI6r4BRMv7eXdtSbpNvwYGrV6TRRihAnLtO3pwiP5l0ALKs0k6?=
 =?us-ascii?Q?zhb1sdd5h4cyZ+4PE4zKeRP3iTmaum6Dw33NYS3fY7pZa2sB/Usaxim8S9Dx?=
 =?us-ascii?Q?9rfgOkPOJaAkBd6C3dlYuM9f1dfNJxUiKV9eePLpmr4wGcCFga7w2rDAJQva?=
 =?us-ascii?Q?koykZd9ssT0I2tKlnxEMwvEmygn3pUkezx6cJ/M1sHZncV8vuN7gzBRcw1QX?=
 =?us-ascii?Q?Z8DwUV5JDhTSsHQEBgC0HoI05LSK1JRilPb5/WuKiunpPqp/+tOdfXPMvG8Z?=
 =?us-ascii?Q?CRYbbU93nk3w9kqetTE3fiqg7Zr/LPPeAV8bRvGHe8vvWcA3QPQs7roMVuUS?=
 =?us-ascii?Q?bnSvJgVEExB//LncPDN6QWd9zMe+SGydjmb01BaKkQdpKfC8hWgQza+yN8CY?=
 =?us-ascii?Q?iCfvnhJa50QrbSsivL1P6nlmV+dhyqMO2pBZytlK/fAosmnV9RhJ971XS8iu?=
 =?us-ascii?Q?meJBkRmNxbAXKYgZeXVucEbHRIVqwRoCqFrLO473Av7IIiqjT9lqP44mlmmr?=
 =?us-ascii?Q?OJ1ieTg7Bc8MzUPsEuC9A1riAM4ZVjI7U5m0O6GHcRXSohAcfYWwymlNR6VO?=
 =?us-ascii?Q?q3IH+Byl8kHEtZFIrkmtULILuLPR9DlAD7x3KCpspFRrffeCJeuOaXSGUkea?=
 =?us-ascii?Q?kRWdr6Cd13VaHns0NL3cB3SkoP6EBOU9JR1VZGkOxKWJpRDtL/s7zFzQPB+V?=
 =?us-ascii?Q?hub3IBWcK+QzEhG85IiMnrKepKM4nxVVYW8y0ztrOX84x27p9QbOBNzFTBvz?=
 =?us-ascii?Q?iW6KiVNf+GicKccDtdkQzZgvvnH1pJ/+MewExysMFEKBdmfLENaDkUCy9r59?=
 =?us-ascii?Q?7cnjh410rEtoJMlWmYYTBjVnH4eIcVS2s7BiGI9pdWKYzQNTJ6PPMQitdyf6?=
 =?us-ascii?Q?LY60Lp0cXGt7yhtv2e+e09bmErDiayrv2uMx8xJJrAjti+Wy2EGqIgyh9As9?=
 =?us-ascii?Q?SToaQyS+BN/6c5PGZkELeiWj71kX9UigsO49c+GqsQQGP3sZ3vAqqfrOyqOV?=
 =?us-ascii?Q?DKpZZZTDVW4IWGZHJ4SRUtGSzZ+WuJOUm037BdSWkTU1ZXwe8v+1ZOh78D4g?=
 =?us-ascii?Q?BgYXjhyxYBSSRTG31PCNCgzofZfJi+akANXhT/T41U4a6rRHP5xf/+Kz/8/6?=
 =?us-ascii?Q?AySTeRInkMUMupfjjj+UMv+VF5jl5THX3tI2KGbuJNKcTVIJBxkf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc150ee-f46f-48be-1b20-08dee25ec0e5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 10:49:32.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7dKrluBFGcGyesYPo1bGwLCE45+RSFj3s6md+TPtyov5e6XcnbB9PjgqnnSR9GHZun/81fNLeY1qPFHARuEK1XTSzpxg9wP6PdmGySmNJiy0tvOWXazymb6XmSnFUjg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10950
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_034938_115483_10E8CA6C 
X-CRM114-Status: GOOD (  26.05  )
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

On Tue, Jun 30, 2026 at 02:13:33PM -0500, Frank Li wrote:
> On Tue, Jun 30, 2026 at 06:11:32PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > On i.MX8MP, the USB PHY has a dedicated power domain that was previously
> > never powered off at runtime. With the introduction of runtime PM support,
> > the power domain will be powered off if the device is runtime suspended,
> > which breaks USB wakeup functionality.
> >
> > To preserve wakeup functionality, mark the PHY power domain as runtime
> > always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
> > new imx95_usb_phy_ops for i.MX95 and introduce usb_phy_is_imx8mp() helper
> > to identify i.MX8MP PHY instance.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v5:
> >  - no changes
> > Changes in v4:
> >  - no changes
> > Changes in v3:
> >  - new patch
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index 4949ec78d304..c9741b532663 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/of.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/regmap.h>
> > @@ -660,13 +661,20 @@ static const struct phy_ops imx8mp_usb_phy_ops = {
> >  	.owner		= THIS_MODULE,
> >  };
> >
> > +static const struct phy_ops imx95_usb_phy_ops = {
> > +	.init		= imx8mp_usb_phy_init,
> > +	.power_on	= imx8mq_phy_power_on,
> > +	.power_off	= imx8mq_phy_power_off,
> > +	.owner		= THIS_MODULE,
> > +};
> > +
> >  static const struct of_device_id imx8mq_usb_phy_of_match[] = {
> >  	{.compatible = "fsl,imx8mq-usb-phy",
> >  	 .data = &imx8mq_usb_phy_ops,},
> >  	{.compatible = "fsl,imx8mp-usb-phy",
> >  	 .data = &imx8mp_usb_phy_ops,},
> >  	{.compatible = "fsl,imx95-usb-phy",
> > -	 .data = &imx8mp_usb_phy_ops,},
> > +	 .data = &imx95_usb_phy_ops,},
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> > @@ -679,6 +687,11 @@ static const struct regmap_config imx_cr_regmap_config = {
> >  	.max_register = 0x7,
> >  };
> >
> > +static bool usb_phy_is_imx8mp(const void *data)
> > +{
> > +	return data == &imx8mp_usb_phy_ops;
> > +}
> > +
> 
> It is not good direct use drvdata as it.
> 
> Can you add new drvdata
> 
> drvdata
> {
> 	phy_ops ops;
> 	bool always_on;
> }
> 
> in follow probe check
> 
> if (always_on)
> 	...
> 
> it is more extendable in future.

OK. I already create a new patch to add drvdata.

Thanks,
Xu Yang

