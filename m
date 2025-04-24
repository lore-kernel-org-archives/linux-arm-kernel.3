Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5463FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Klj8mxS4l2I6l9KVTxd0YIp5f8NRu+DgZUjtDztw6rY=; b=Y7VK4RgIoKbjzi9gyuJPoI0nUp
	JxwUbYQHtaA/Mu1w2mol/zogBvy1hjeUUtyvg1nYBjXFhFz6cshdUtxN42adZOHI6rO4Xk4Yg6hTw
	1KqOTGMUOJj663DITHpL9oGHsjdg320Z7QmzzdEu/7nKWE6C/GMa8l0NqA+iPy22A47F2AvGLuDD/
	TqGZ0DcmSHoXJ+Po1Gdynbi6ZWWsGeZVWroO7esvNIywt1nx5Gq4dbsDuBS86WiuN66LyjRFgevTp
	/+aen1kBSm1Hu8ZrBRpwfcVYHdyf/7Rpvn+AdqUkO57XAqqx0umCRYFFDDp5QlKDL4V7RlJca4cyu
	/jr6sYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7put-0000000CxcD-3jGo;
	Thu, 24 Apr 2025 06:18:35 +0000
Received: from mail-am7eur03on20606.outbound.protection.outlook.com ([2a01:111:f403:260e::606] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7psr-0000000CxGT-0OI7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:16:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNdAzoyMX0aNsrB6CzA+kLTngYU+FqTIItOJqO0r61fTb9gsm6YR6XiBIDi/iI2GTmgNRy4ZU6u0APlzwcwhuTE/GcLjRBWcXzC/rA+PvCkzzxMTjeQRui+loQVtxXFQaIZFaNPHl0jXURnL2z61PI9K1h+ig3g2+T/LlYW7bfRJQE13CbfRXiWL8o8tzK+jprMqhC1vbR5/RvVdVYh1h6c0qUYhaME/2cGefWlIO0rhKfL5fsdNdlKLwWe2J6mNm5hK6GXdsl/8u9z98ggP92am94o7EIho/+oSETckuNApnJymJcjSpnYitLKc1hrMJ665ywfDGgTVyeJCWLMRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Klj8mxS4l2I6l9KVTxd0YIp5f8NRu+DgZUjtDztw6rY=;
 b=Vu8Gor+r0ht4aEpfK8GOdT7JTB9+G7eUE0yfIUtfdltFl/netfGzCCBvNeGiLt/wM6KA5vuUXCNIsTncSSg/e44IhrYEi/BYPCo0H6qB8YdyhSOdeNAuHUiSUbFdPBBW5vI8a5lEKC+D70a/7yy4twPHodU08RGOS/Hj/6VCRVo3/E3QsEjesidcO+9MSRESxMn7zwqj2/JpJ1bg1lNYK8nl64zp8t5cmqWjqJ1UF78w+iLGTFVQBMFF+a6EppGlQWED7OAcOucjFo6EvpeWG+YUmnyGP00qPgD0mhQnx2KJ/ozcFgCameL+wbNu9eoWLThF7rP+kjKLYWJcTOTqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Klj8mxS4l2I6l9KVTxd0YIp5f8NRu+DgZUjtDztw6rY=;
 b=RRpb0REB3fsQJSKrYqENyuxk90zQKjmYMISYRLH+ZGTeQIcjNWLVi1BiHssqn/ijQVuf+uc7s01d0DzwnZnckWRkdUjx5H0dj/OHYrcquZ8g47XrGtOSqKUfEd+xlaj0QROUIq4JK1aJdpQ2DEW4MFlyLK2nCqeFIOlysNzXy2jjIN2rpZc1p+TucaWdVaw6yxn+K4hDguo+2La9afRfS/LOu8XinrOZNZ/AM6jYb5sckmDWofuDPsD1Hkcr3wELimLLn3KOy6Ovp1cc/SqaXadPRWQtEJOHTs+iCXpfkQHlpqOJGCHPOxOmpMvIgugc2uB9qhZ/9R/hRmo/LW7WJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB7PR03MB3723.eurprd03.prod.outlook.com (2603:10a6:5:6::24) by
 DU0PR03MB8440.eurprd03.prod.outlook.com (2603:10a6:10:3b4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.33; Thu, 24 Apr 2025 06:16:21 +0000
Received: from DB7PR03MB3723.eurprd03.prod.outlook.com
 ([fe80::c4b9:3d44:256f:b068]) by DB7PR03MB3723.eurprd03.prod.outlook.com
 ([fe80::c4b9:3d44:256f:b068%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 06:16:21 +0000
Date: Thu, 24 Apr 2025 08:16:11 +0200
From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
To: Philippe Schenker <philippe.schenker@impulsing.ch>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: EXTERNAL - [PATCH v3] arm64: dts: imx8mm-verdin: Link
 reg_usdhc2_vqmmc to usdhc2
Message-ID: <aAnXK0sAXqfTNaXg@mt.com>
References: <20250422140200.819405-1-Wojciech.Dubowik@mt.com>
 <20250423095309.GA93156@francesco-nb>
 <222ce25ee0bb1545583ad7a04f621bac2617893c.camel@impulsing.ch>
 <aAi_PPaZRF26pv_d@gaggiata.pivistrello.it>
 <9eb7b15068eb8a4337ad0ea2512d02141afd491c.camel@impulsing.ch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eb7b15068eb8a4337ad0ea2512d02141afd491c.camel@impulsing.ch>
X-ClientProxiedBy: ZR2P278CA0044.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::6) To DB7PR03MB3723.eurprd03.prod.outlook.com
 (2603:10a6:5:6::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB3723:EE_|DU0PR03MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a04b9a4-f297-4e5e-1594-08dd82f7888b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lZ0RsDZ1Eb2G9aGKSTIZYKuh1voaBq01cLJ46VvRHQKFtV1QW4SpdxzjnSDv?=
 =?us-ascii?Q?Bu1znYkUHINPiz7o1Y2t457m/J7kZzO2nSGj1kaq7eyS0+vGanNn0yCIiZbO?=
 =?us-ascii?Q?5TZBE4PsePefy1o/iNish/A41TNVTNrC+nlhM5ahyW/40YvrQx1DcLiCvHsB?=
 =?us-ascii?Q?bJtrttDcZzvD2wOtup4SC8bzfWIugEDVLJX4DDuD3N6uGZ4CwfVElsUvoLSu?=
 =?us-ascii?Q?y1vzLR0poC0QXWSD183C8iSTe1OeHzgZCF2noPlUz4brSIlsTmGuEn4fPk4g?=
 =?us-ascii?Q?nipAAzccSqKRt7ZA5ZG8mHTlrdtU+vvhTpbH1ZUzlSFi5N/sOh7MeU4xu627?=
 =?us-ascii?Q?jOv297gy3Z2Qnz5O75JfAZnivrIJPCGCpxSPTqB2blK1lg3U+CPaqi2NgCdX?=
 =?us-ascii?Q?dUo4Lo3rpRMeu6z8X/5vOt7hdXvKog94SPw0S4l48WvHFuxPOcbBSVh+uus9?=
 =?us-ascii?Q?p3hwjNPC5ywUW4gGdVzfjlois36dCK7jVUePyOw5bnNNeks0FV566n+tU6XS?=
 =?us-ascii?Q?N8ZvSSBEyPXWUa9MIR8wevfCJn7PcknMoBFZWwC1NrhAu0HKbx2vl0xH/5Cm?=
 =?us-ascii?Q?ApSMQEyWP0k71B+CKUAjuuAOOb7xv2jwaaLKk/prhFpP3EHtfq1hAj+3BzHY?=
 =?us-ascii?Q?0LZJaQ0mR2GRiyzXPKF2ex7hpjfLaJ5t11cqVCN6KVLsPk92B4pamvuqwPPt?=
 =?us-ascii?Q?ivl8eU7bH3z9s6rKkcewLLB5SvNkBLYbhFbOVymshQR9x6CpLP7So8UUENlH?=
 =?us-ascii?Q?TWmgChek9AbjI+HU+SEcFZmczmcJbSC7tSfDY5p8rGScUTplIQ/aj3QNrxzw?=
 =?us-ascii?Q?kAtlenVqk5WAZ7dnyAdkcZxyjJGAEtSZJRlrBmZO/vfGg5i98FO5cs49BDDz?=
 =?us-ascii?Q?DgdQvrANlBOENt7clgoRulgh8Q+3eEynFcg9nxtpl0+f0/bdg4w+VQnm0Ks0?=
 =?us-ascii?Q?/8+yZQMPu6zaCBwbz9zDfn0/RQt7cBWLt1W2nkvoSI+m6mQUrz9DzLodlbKR?=
 =?us-ascii?Q?OEhz+kCzs7AUyykdd4xbMVkxBNg70UGS3Qh6WLdNahHR0P5kl4azyCjYbizw?=
 =?us-ascii?Q?PAgf4IR8UAi38so3LmxnT6MBJ07ioFD0YAXyNXI9NPPVEcxLEmdcXEN/f7GM?=
 =?us-ascii?Q?kYwl6IJ9RIFThaM0HJGho979SxBQ0iJvXX8Efnu+Zpa67Hr2gOqyrpnAc3nR?=
 =?us-ascii?Q?ZdKRDg6cATL+Bf5LaeLn1Ugqt8VhrF575OLOOIEPbEmdmVDuWEKBFY/mC+Zc?=
 =?us-ascii?Q?0GlJlNLx/1GhN/A+trQeQ5oKNCLer15J3nXS/Y9neMMDaQ1is+W0oLJC5ybM?=
 =?us-ascii?Q?i23kt1LxN75TE6oBCSe07UW0FFOO2VK/McBUxcG2HNm+lZWlqjlyThYmEsig?=
 =?us-ascii?Q?Mi685QXKZM9GtIYLcvNRchA+nj1Vm2SaUbP+sLH5BB+8JzGUSIB22ab57Jfd?=
 =?us-ascii?Q?ihYibkF/mgOW3OmLJsNl+LOn44zOV0NpBt5DayWnz7Vy3/MdCJ6nnw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB3723.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TgoxNHCdtIjhod9ZtENgKbvytUuXvyOOSVM5MO12vbeLJNQA/jQLdV+5Q768?=
 =?us-ascii?Q?XbTShjdPygDv4OuEbHD72HDeL/UXFyR7kEpUCilznuVYwa6WmX8nt8iKd0pA?=
 =?us-ascii?Q?GQuiEP5auRZAL5bPF4NzdYkz7hepLlJsRVs/37CoQadauDMIUEfSV0N62GMT?=
 =?us-ascii?Q?IMP68OfOxCGsyGdBcuGAZo9ZHsahOSVnza4ZJk6RjGBUSfzGKJnrjMkonNH6?=
 =?us-ascii?Q?miyyEfGbUHgRftJFYnO1rTRwxCnYUm6Bpui+38be6sNYv8/v1uuJzIE/b2YT?=
 =?us-ascii?Q?SCLLPvf0iy2t/WMC3QpVYeRXWeM5LhlWHGjeuPC1Bpd0kxynXYU3LtKzgcsd?=
 =?us-ascii?Q?8NAMLOnZhDB2zm2KG9bAqUYRvP00E8a2Ogprepk8yTkgUX6W8scxDzDR08dK?=
 =?us-ascii?Q?PGZxQUOR6aOx4H6718rSgBRQdDX5Kbj/x6jjbs5na2nz87BPDR+SPVCrTtcm?=
 =?us-ascii?Q?+67srUb10YgWWs2Y/bcDjVgzlHs5pYs9GnvE2/ngCO0bSDF9RMLxiTTN025k?=
 =?us-ascii?Q?QfcFMK3AnFFAbvKyRaeCsvO1iBHr6r/Uvjqb63KmtugsJCPpfuH7+W0biviV?=
 =?us-ascii?Q?Q3oeMb20hYsssq7RExji1Y8DMt8k4/lNAbroJEfYBbl62dFct4bM3fV6AHt1?=
 =?us-ascii?Q?G4wnMvFSniTKRmSmhrw3knyYVepWat62+DLu4kpnMs3FEB3f162T8ML0ZKoS?=
 =?us-ascii?Q?2EzweuRcJ93i6EMikIXacKYzPakQkc4qIhbDlblnFiL2ZIQx7gFXOZ9SM7OS?=
 =?us-ascii?Q?4PTxr5jJj/lSWkGN9is0Fa01ytvN190NQCdz+h8ngrRjHL3V5tEjRuMa2vOE?=
 =?us-ascii?Q?jRrKWDJVYvERhwbx3NtwFIYLLTCa81z+YgfO6zj5L6T5quMKxAdWlCNqf5YS?=
 =?us-ascii?Q?HQXG8swf9uVq8DB49SpkXQ61qCXrgpiuklbOUCP6FKWELT7iJzyz6LakfDfQ?=
 =?us-ascii?Q?wyAlALgL+wc+MZgsqwFJkcWG4NOLXxWX7B4897wQGQG+t1xxVKwmC9bNaz/A?=
 =?us-ascii?Q?JYHpc2bIjeEV/XI0kPe0Wt89kgpg/wItLZ10OqMGvIgpNLkrnGGIZgb8hWrN?=
 =?us-ascii?Q?XVI7H+uHJCPmVrKgpP4890d5LIZBRL+QRnuNvaIqMV0jaLxdJWvkhF77+DRv?=
 =?us-ascii?Q?bZIpvBL84bcYXFdxEoRtE9p6tIrz+iuMA6Fgis0USaksOlbCvwxLzDXv3YqJ?=
 =?us-ascii?Q?AVCZ5tfjpXr72dntQVTixqZubaU1/ZjcytEZcnf4/6INRW/nGEh6VJstdPIU?=
 =?us-ascii?Q?zjw1ALzS1MmMZUoMB18j9V+nS7UpVzJjQ4xitpWsYFzfehG937FL20LkkNNy?=
 =?us-ascii?Q?0FMTEUEjE4TiDHg18k9jxDNtZpExgY4alQFOxFcdjcdwWSjMvXyMsu8HYkJl?=
 =?us-ascii?Q?ECxpWOJS/DwLL8TSC0/X3Z+r0fS7U1J52gPo4GmxXzLNA6nn7WRiyxkxGVdb?=
 =?us-ascii?Q?GEyQOZLOrSEfg8RDZ99CXsU8MehzHyOx9TOnK1tzcScOA/IkgRkau1Fop1Wg?=
 =?us-ascii?Q?szR7YO9PHNPr40E/yuv1P9ODhsBW8Vq5iU3YQrrBKHA3oiCatDEPoTdgKphr?=
 =?us-ascii?Q?4gM/ycoYegKiDC4V2tnQrj+mwVJeGf8q+ZbbBpAb?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a04b9a4-f297-4e5e-1594-08dd82f7888b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB3723.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 06:16:21.8360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xqd5CbHSuyNt6DNYtt0eQTkdialpa6olfMLAEzKX9cgDZb2jS5vuBKJTe5a/U1rGKmi6osjYqBu+vb+AB8mzEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_231630_157622_22959BDD 
X-CRM114-Status: GOOD (  21.06  )
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

On Wed, Apr 23, 2025 at 11:23:09AM +0000, Philippe Schenker wrote:
> On Wed, 2025-04-23 at 12:21 +0200, Francesco Dolcini wrote:
> > > > 
> > > > I would backport this to also older kernel, so to me
> > > > 
> > > > Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support
> > > > for
> > > > verdin imx8m mini")
> > > 
> > > NACK for the proposed Fixes, this introduces a new Kconfig which
> > > could
> > > have side-effects in users of current stable kernels.
> > 
> > The driver for "regulator-gpio" compatible? I do not agree with your
> > argument,
> > sorry. 
> > 
> > The previous description was not correct. There was an unused
> > regulator in the DT that was not switched off just by chance.
> > 
> > Francesco
> > 
> My previous reasoning about the driver is one point. The other is that
> the initial implementation in 6a57f224f734 ("arm64: dts: freescale: add
> initial support for verdin imx8m mini") was not wrong at all it was
> just different.
> 
> My concern is for existing users of stable kernels that you change the
> underlying implementation of how the SD voltage gets switched. And
> adding the tag
> 
> 
> Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for
> verdin imx8m mini")
> 
> to this patch would get this new implementation also to stable kernels
> not affected by the issue introduced in f5aab0438ef1 ("regulator:
> pca9450: Fix enable register for LDO5")

I will wait a day and send V4 with what I beleive was result of this
discussion.

Wojtek

> 
> Philippe



