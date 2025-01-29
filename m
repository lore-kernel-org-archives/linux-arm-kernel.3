Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8605C02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfbmqNBDqrWOukxWZuC7AHUAnY9glJGXGa6b6YiMHZU=; b=NOd21Y28zHnlGwStTSnewak3RM
	TwSgUMOB+li1gYIGV5sDiYRjpmaLcYRvIYTFpAVP78COM7J74aivoTzw3fjGDL4+LAhSeMrx2fsf9
	72R5Lr+hplJeEUqtwh8LOJV1fxUQtdGRME374XnZnkHiODxkxab2FZ5f940hLujhGv+52mT3rxxcC
	iYmSNK3f5x25FnTeoIxdR9hh4D+6N+01MUouX3/UO2TH+EFYdwtLueh6DDw3wFR2MohvvuKFrq8pd
	ZT3YVYSo2yaZ1Stz9SP3Mjft584swLoxA6HEJUwL0miDcgiuuYv/Ce6qzelaPADLxIDRg0qB60f0X
	H7WBLVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBVa-00000007SG2-1Nia;
	Wed, 29 Jan 2025 17:05:46 +0000
Received: from mail-dbaeur03on2062e.outbound.protection.outlook.com ([2a01:111:f403:260d::62e] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBUG-00000007S5K-1nA1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 17:04:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwpFu5QeJlQMg2r5pkIRRag7lAu2A03LpLxMZ+HJHhN8Dl1PE6WIl5ZdNFHOu3iZKXwbq5txmuybZscFwsEWtuZWzHbNmoWl4PhrwxBrOCw8IO24DgbphTF311KmCQT6RlgVM2ZFGAlTbURnXtqEjQTb3RvYAMgrlOt7HjsR0kDXwbWqw5SkYm053NHGik/wS3tWF5O6QSXH6yhdHwGsr2vcAX7257mqEztXfSmhEXrwHximfjUlDdNRh6do9MfUwDlE396Z5e9DGLpXMfUFwH7PE/gYdEQmLfm9JimY4YUkHBSAEoRsHu3824aysJ6sI6/lEU/f0YLKHYZMS4ACpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfbmqNBDqrWOukxWZuC7AHUAnY9glJGXGa6b6YiMHZU=;
 b=n9b2qjWIm+RkdNsqQndPQcPk6oWi5IwNYWf0DO1gMQXfR08YMhDfkfA/wtw8UN1ntr/Gz180XDpNzwCK2J+D/ZrVUZ2WYrIHj+ICX4r9ccnwcxc9qFTrT3nJNphSlN9HM5z9C4esZ10Pf1ciAUgEeeYbUEyoEfYma3QJ574CfnnlkwOCG8sHVyJU9iAxqNNHwCB+mw6M08MOCRw1VivvLwlq3qDhMLpZ+hKvjGS8ZcuraOFWS1hHLG9ZIqC/kLysbGYgHe3DxKDYi1/AII7G7Myqjlv85tPOV5LD+/Nk00Fzkz0hWsClYCRgAD70DduSaRgunufnY6/KwVMzuM3+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfbmqNBDqrWOukxWZuC7AHUAnY9glJGXGa6b6YiMHZU=;
 b=Kjep2I9qjXVyC9eshQ+zd6fR8RGVnVLIjwXCARJimYT1gxJ6Zd023dqQgA2TWyy0VZ5puW/qd3BQoCr8Y1MyCtJnU/cizU/KDBN7/2p4tKDV8l2knPjSYYEP8y9KRiLwmFge0Jag7afm0dOIpTFuUovBf1HkeBFTFruukhKHbraH29qiQZLxv32ItCZvqzmXBexd68EHzHL18B+1qgos49+sbyZASC0eVEFb3qodaQzBwWGpIX5lOaQmND1paWx/94Z5oJDlPIyrNxpdYojO+vP5hOdOgw3jc8Qbc1lxlTmEOmev1vDca8a8p2g2oqvG/mcQGIkFXa9QlC+bIuJ1cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8371.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 17:04:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 17:04:18 +0000
Date: Wed, 29 Jan 2025 12:04:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v9 0/7] PCI: dwc: opitimaze RC Host/EP pci_fixup_addr()
Message-ID: <Z5pfiJyXB3NtGSfe@lizhi-Precision-Tower-5810>
References: <20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com>
 <Z5n_VrN8HUmdVPUq@ryzen>
 <Z5pJF9MGENNDqq/O@lizhi-Precision-Tower-5810>
 <Z5pZtsa4FFKq0AZD@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5pZtsa4FFKq0AZD@ryzen>
X-ClientProxiedBy: SJ0PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: 56210716-a4ad-4ad7-fc1c-08dd4086f75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wu4n626ckwyl5lEoq5cizLh8sj8xNt8PRlTvRIgvPtSylBPZQ1PJwJZYt7sw?=
 =?us-ascii?Q?v4zX5GAmQihQ4o97OGTn1yKJc6Rw1V2dZw4ti+YyVo4eIzxVBK7JthWPA+iy?=
 =?us-ascii?Q?IzUlDa7/nVy3MXUB2IQ1qLguJM2JxxYJKyFHISCN05UMbpVoQCCFsQGCayOU?=
 =?us-ascii?Q?HH3xBRqXC8fVr/PJvs4onHokgrNAQEkXfssA513P9sicVCM8ZXxHQ0cCNiYI?=
 =?us-ascii?Q?8mRoCKppieHkd7aqEg5yyh6QMl+KZwhcz/bYFCTB/hrFqOvFsLOV4YjwvTvq?=
 =?us-ascii?Q?l8YcCv2APQFNT9AZ6xDfI3GhU4SOvjbgJFa6dNtqcHTAySl/azovE8hRq/ru?=
 =?us-ascii?Q?PAucTgGnL/97OP5wiqDmeidDghG5Sl9lvNJaBAhQJ15IeVX2WYcVmLZ7O088?=
 =?us-ascii?Q?gIvrZ//3y7AwgmrtSTo+JeAuCoPxh6vVQGaUITI8bUl2FieEqJ6KBVLGvMyd?=
 =?us-ascii?Q?KB12J+/yiL1DTqpviQbe2qIm5XXRgxVs+/Qq2K8tkZqs8PF45aOKf7QlzOjn?=
 =?us-ascii?Q?y07i8oaRZAr+huACj8xGhjKpVoh6kcQr6zKbnTXxNM0greHvPxkmkRlNlv49?=
 =?us-ascii?Q?Jz88Ck5axy61jrNYOKy+4Ldx9/tbROBi/CHx7l7Fokeda4QuccP56D7D8tzR?=
 =?us-ascii?Q?XOzNOL8QcUHzsg2WoRcC8O64r/6k8jPuhBI+3VtuJ2eUW8tpHDtDFe0gnsL9?=
 =?us-ascii?Q?cAe/UUy/XWnPcDoKgfQR39pAltZTynOd1USRSB1WnbXXuofQj7XwSI+O/1Bi?=
 =?us-ascii?Q?EQ+hCTisyla7XbNXt1S4320bfRVv3FJUnQrJp5dycOda7e9DmkiqnV42JU/c?=
 =?us-ascii?Q?35IV60gtC8MFaGJsdhLYcjWyebupdvg2iqilkzrk+BkFsPBmD24bGO9ovQiU?=
 =?us-ascii?Q?j4tRqT7PZ32FRBNT+wNo6OjX52n3t5St99Gf2NX4xs81c+p6fCpPe1rDCpW6?=
 =?us-ascii?Q?FRhg1r0YbG/R08djG/sJQgsR+onI2o114ffF9nhGxflTQCpxj6Zp3o423tCU?=
 =?us-ascii?Q?4dcV0XqP0DgbayghBnzeGe1ZOO1ez4g+q6RFSfCA4s/rH6yiUyoIOdy9miz4?=
 =?us-ascii?Q?5X3fLGPtvpsbxw4REVB7YxXQ6fi8Z1K1gLtstlg7yobYkiAITbqPl5SV/rKG?=
 =?us-ascii?Q?quZS4YkeVRdNeTa39zXAbnaN2Im4r9Ud+Q0K0HrrjlVG7yHjjvJ9M9TnIUmQ?=
 =?us-ascii?Q?7UHQ5NZiRNq/xJrOeOCXsTLeIF3MWK4TO85vvoQ/YCdqkXZowyY2s5UEFX4Z?=
 =?us-ascii?Q?zkZy4D2L19H5+0gKvgG7SuOw1UAGZJTWbOIyJK+RN60sFJYSymBtAKF8ajAY?=
 =?us-ascii?Q?n2yhFtH1jKvU1lG2B4FUvPhnpWW0aX5XVt8E4PgUzsexYRCgRC6JLEo+7yXx?=
 =?us-ascii?Q?2Z8GWb8pSc9u5IHq9WXjpHzvofx8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FTlrC4KHyKe1ppSdKp3kmwptVHPItySeVYhzy8R1ADN6NSI9RsGy08+9Wlnz?=
 =?us-ascii?Q?gqcyHRcRUsnJckt8SQgDvks3SWgfikJtCINhuGgOjLhtYyG/SU80xgwpEohQ?=
 =?us-ascii?Q?bmmHBvP8+CHj/Od9rFBYd6OZ3tue3M4+jy8XL4RtYukbjWhYDbE9czGZiDxP?=
 =?us-ascii?Q?RJdAkHezD32YlXUehmFE8PibSWb01BUNNYhn2UYVRF4K2YMzmzyZKX483qKe?=
 =?us-ascii?Q?G9m5LTeECuIGLRRm04X48xQqyOLpnSIk8mfDbT/v5ggXvXZ2es2rXPom894h?=
 =?us-ascii?Q?IMnb5egyMQJdzNSkOB6iAoJZem8aHwAE+Z/v/rtaP3DC93C0G+cfE6mPjSlM?=
 =?us-ascii?Q?F4vJqsStIlBBF+I1o/CzuArm2XFp03eSjisMqIsq1KOgVWY2AxvnKmCxnitp?=
 =?us-ascii?Q?1ecFWJlvFFkDvaNn5ZF3kD3FzAXcA6ahj0F4h0NtzcMeFb/sLBEzY1ZoXjEZ?=
 =?us-ascii?Q?jOHZ4DR78dQ/ylH0SWAXdMfd55wEEXruTDjQcZjFH4Jxf41DkazuMqItmBKk?=
 =?us-ascii?Q?nsHWQlV3KBeDaK8vOY2yF1+iXyw5AwDvVtjd56LB64j54dlEivA9rFBuw3ES?=
 =?us-ascii?Q?hpzk9O9ERKV/xpnx5LvR+YTAQ3z/PBh2sLQZ8x4yDOKdCqpXm3soZSi9t7Ml?=
 =?us-ascii?Q?2Jcu3STCz39gs3iRmjgg9sey4EcyKQ7uTpSATOkL171Vemtaoj9/9lFUKNK/?=
 =?us-ascii?Q?CrkyYiR/rB2U8MP3v6E2MA7lwWC+7Z+nDcBE+6IBdJsbNIjYc08j+TzTlp+a?=
 =?us-ascii?Q?8/KXk0HF/GO0d7dZwwxAaZQDxW/N/6Ww5Lj36AOngkMVFuOF6NHAx42qoMO2?=
 =?us-ascii?Q?chuC5L4usRKta3Bk6mchuCumWlsg4+0l+kn480hFmCHdYrMDXppSFL/fMY1E?=
 =?us-ascii?Q?Sfclole0gEy82wxEljXrsIr25Edx4RjlExznBP7wO7YVP0irsEgv8vNUNY29?=
 =?us-ascii?Q?npWV9AFtU1De0d5uXQBRCNID8IvW95Fkigk8Cu9z8MHGVSmW3ZO8kB37J+22?=
 =?us-ascii?Q?Zf8+ySqnOv/gZgTVuNRjohc1SjhmHlbUVZOH3KX6zovXAypOuD8CHaNNCzXd?=
 =?us-ascii?Q?jUQfMvxCOGoM0fcyQO9wsKMBuM2tLaXMu5/TWFcQVeXjVzWHLJeUd+83jOrO?=
 =?us-ascii?Q?EuVme0JeqghWeqewffDm9kFhr+qMwKU78vqhg7Nqcp6CJ14U+F5vWOzN9Yf7?=
 =?us-ascii?Q?hrr5P01injxNo/df5iIgfY7Vr10ajwTB8KjknEWv349ZK+CmD2TDrxnbrCq+?=
 =?us-ascii?Q?70SDFrvghD+/2rLNLwrDiq/RJaj9Cr5z6u0Jlk1A8lDnjPJKzQvCxRt8q1Al?=
 =?us-ascii?Q?NAXK6tUS5E1y4wbu0MSm5vR1B33/8WpJPcFausgco8eTYsU9PZ4YLWZQApUY?=
 =?us-ascii?Q?jhR8NhltraJG4IRqXLwvWSRL/bhzBBWbkFD13P/lzPb9Rx6srbSH5+rqiMZF?=
 =?us-ascii?Q?lpR5726q1wlqmgpkP9wl1AzOe5KcAfPuYBMsg9vj3IaoGPI47lhNYfyjuAl6?=
 =?us-ascii?Q?wokBI8HcB9vuUjoEailRDmMwQibUeFXn8Es29jRZxGHbjmelLycMeYZLNK+t?=
 =?us-ascii?Q?r6C2vF0Tgwqd+jqU+q7JGmLWdZhXROCuTmaJTR91?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56210716-a4ad-4ad7-fc1c-08dd4086f75d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 17:04:17.9463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtODRuoQtkViVPPqAbzA8JAMkzlZGn4zqyyPf0Gli9QkhvTpO64x1ZzZMZj2ONSUdpNn4j0bKJlBGBurVtVYJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8371
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_090424_487742_29BF7CD2 
X-CRM114-Status: GOOD (  28.86  )
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

On Wed, Jan 29, 2025 at 05:39:18PM +0100, Niklas Cassel wrote:
> Hello Frank,
>
> On Wed, Jan 29, 2025 at 10:28:23AM -0500, Frank Li wrote:
> > On Wed, Jan 29, 2025 at 11:13:42AM +0100, Niklas Cassel wrote:
> > >
> > > Please don't shoot the messenger, but I don't see any reply to (what I
> > > assume is the biggest reason why Bjorn did not merge this series):
> > >
> > > ""
> > > .cpu_addr_fixup() is a generic problem that affects dwc (dra7xx, imx6,
> > > artpec6, intel-gw, visconti), cadence (cadence-plat), and now
> > > apparently microchip.
> > >
> > > I deferred these because I'm hoping we can come up with a more generic
> > > solution that's easier to apply across all these cases.  I don't
> > > really want to merge something that immediately needs to be reworked
> > > for other drivers.
> > > ""
> > >
> > > It should probably state in the cover letter how v9 addresses Bjorn's
> > > concern when it comes to other PCI controller drivers, especially those
> > > that are not DWC based.
> >
> > Thank you for your reminder, I forget mentions this in cover letter. I
> > create new patch to figure out this Bjorn's problem.
> >
> > PCI: Add parent_bus_offset to resource_entry
>
> I see.
>
> If you are solving this problem in a generic way, then it would make sense
> if the generic patch comes first in the series, and then the driver (DWC)
> specific patches come after that.
>
> Your cover letter, including the subject is also written in a DWC specific
> manner.
>
> If you are solving a generic problem, then describe first how you solve
> the generic problem, followed by DWC specific details.
>
> See e.g. my cover letter here:
> https://lore.kernel.org/linux-pci/20250119050850.2kogtpl5hatpp2tv@thinkpad/T/#t

Thanks, let's wait for Bjorn's comments about new method. I will do that
next time if need respin.

Frank

>
>
> Kind regards,
> Niklas

