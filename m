Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FCECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pz9AkXLqPYOp//tVxgtmT4PxsWV2/EqqG8HRDRx9zb4=; b=tN4aRdX5iZlfZMUiYGw6pr/die
	likSF9vqfwcoK6eFp+QXSFGYUBdEl/eaiDTJGp/gFtq09sEI1GCPGexQcPg42I9uC5Hvt68y4i7jk
	rHFlB7uZWqs1aeGUX4DLG/NdJN+Vp0VeHCx8Ta5ZlyplyIeDW/toJ8JVyeilaJ8noQ1Fckyv6daEn
	PSjcGjeOdVBL7JR8QNnRYjuR+c0NUQORXWiDkxkE3PmWwUmCWDYIsBtxCRSY+hfdNvPGs8rQBFZLp
	W5MWIOeX7GasZmTWDXHmJuBx8nfhZR/rk3lgoBBtLv+enm5XNgfjKdHz09RrK11hvPjy1D3jrUuF1
	KaYXLbeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uploU-00000004f0s-38aQ;
	Sat, 23 Aug 2025 10:49:34 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upT36-00000002srj-0XaM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:47:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdzE9o5UWmz6Q5OsuOmwkkL+etaKjnnTDDshVZn9DGncl8G/dz1Qyv58Nh4htZpFUVTotf9xA24EdTnkbdy7dZ7lRtCUUIW9LQggFOjBtTULiPwKJtM6sBXPWnC3fc2zsM5i3OtaZG2vf/lepaVc4HOYQc2d65AU4RyXrbsJA0wnzz/fF235h1brI1I832fQ6FbzJp8EZ6+5Xn/cK0PNI27Pcclo1HLC85tXS1aNb0x4Z6QTqtgDznlbJbAMvGx3ObzvC0wvI3AXqXQAUYYwhq212QsEB1DSFKp2efA/a/bM+d+40INOf62kGT23dV0C2NuAEL1ARJxGj1jgjFWfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pz9AkXLqPYOp//tVxgtmT4PxsWV2/EqqG8HRDRx9zb4=;
 b=WNFulOnG+MztxZYd1N1C9XO284jqfy77KDc47XVB1Yvqfkw/idk987uJZPQeR+aXZ3S4jv8ovxXzEIFp4EaR5eOzf9Fr5vJ4Z0kPBGq6ot4H5YeiVplmcsl+/FB+R+jX3s+DXB9nVxlypLyvy6IrieQZtdwAC9CNcvvsuCySB6sP6Pp8Wa2YCdX5ZPOd7P4U9cDpQ8QXkTEzAY4TXbHwVcRl9Wq23entyn/S/4gG6VptZzYcFvgG3/cO833O5+vRneorLc5+tjaUr7Edz+6oy777UMkBCil0cnubAQJArsv7jXU+L25IkIAy1Ok01J2FyAECvihnWfjeT5QP5Bw03g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pz9AkXLqPYOp//tVxgtmT4PxsWV2/EqqG8HRDRx9zb4=;
 b=SxNqfIZ+f4LGtzpCqhY6TE0fkC8f6PpkqL9l48WJigqkwjYF8KGzaj6OKqeMmoG9k4S3dXBDgY73tJINn+kMDhhJhLlFhBV/tI5h9Yd48wJNNNHT5TQvBOHpdfGwzE9AjBdavsxMmWbGASsO57/hSmaLKRPhQjm1IdYzBuoTLNoPtiSMGKWGueQV3UNh+JUIhdm+bO2K0mf09m+MlF5glvXYTvQKEnHbjroYgWLKQEndFh8RKP8qXIAs7hxW5F/9JtMF+tcx+1hFZ9CgC/yjlPAEr5EvYH8q387aAwKBvxx1TailgbYXQnZgwMzaM6PPQ0aiFOolrtqhfENzVY4sfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB9086.eurprd04.prod.outlook.com (2603:10a6:150:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Fri, 22 Aug
 2025 14:47:14 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Fri, 22 Aug 2025
 14:47:14 +0000
Date: Fri, 22 Aug 2025 10:47:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 06/13] media: imx-mipi-csis: Use GENMASK for all
 register field masks
Message-ID: <aKiC6SB4xPnERkaF@lizhi-Precision-Tower-5810>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
 <20250822002734.23516-7-laurent.pinchart@ideasonboard.com>
 <aKh7DmnEB2KChVol@lizhi-Precision-Tower-5810>
 <20250822144000.GA22572@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822144000.GA22572@pendragon.ideasonboard.com>
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: a56cf130-667c-41eb-df48-08dde18ac889
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lsk0TVfHTVHQ6KikjGrbugYWLDWh0zNcYWToRj3gKuj2s/yFPeR7TpalFSV1?=
 =?us-ascii?Q?C74uvzn47+2zU9QZKv7N4aAMjAtcJAe4yeyny2cnp1SdoZa1XgsPRQ1KhGiz?=
 =?us-ascii?Q?6AOCQ6u3usTT6Qla0//m8CpOCsVzrQy0QIX+mbKiD31QqaJT7ngDLLyZWXDS?=
 =?us-ascii?Q?/5j35htn/kCtNL44u5ojLn9yf6b9NQxbA6wFaT2r0z2fxvUCIvy+HfES1NGe?=
 =?us-ascii?Q?NNZB4RMvWcqZqlozP/lN+5eTzjkHisdYjPLCo6yAhVqAnU7J65KmM7qW7v/c?=
 =?us-ascii?Q?9lr7LgcSHPY6aNOQfVtxaOy8G/ROolHWzHTuNq1x/1FlvoFLdMBtERrotE1P?=
 =?us-ascii?Q?W6vZnFeTI45Xyd4iPDmZF81thBnYknesF2ADAsYYzi1ocHmYSl0cqF0Lqo+v?=
 =?us-ascii?Q?H4agI5Gj78r9R5psIR5IdOzhj2p/NZSD2g1sTVhm4R07GuhPG/oJojudQLIh?=
 =?us-ascii?Q?yovOW2FWGl9m3x/v1O7Q1vcub9yBA5lgyFME+tkRH5PhQVlAtUNkLp9QmZHw?=
 =?us-ascii?Q?fuiKThfJq+QsViCEKirvE1dJzOfsupsaXkUvPRNfcmorxQVuzR4VY50oSS80?=
 =?us-ascii?Q?d4xyNz0+7SGMInkQ2yfWxm9HKk6mx852Hw0nvickxZIqnzQe3kFZXOs1pxFO?=
 =?us-ascii?Q?MWpCDjXay484T1t3XUrI64w7w4kYzfyMjFaK8WtWd32IOprmCLdJIuA/X2Nf?=
 =?us-ascii?Q?4fNfbs3nIFUB2gSAi4LxyaXXFRzjn8Xe5GqQFH79DQS77n4Qr7JM6eqcK2kh?=
 =?us-ascii?Q?Hnphg8mpr/PQnI2SMr/aemDkOaJv2TRxuC8jBc182U3kEzAiIgYU9WiLPTE0?=
 =?us-ascii?Q?PmU/IjS6NKYVL7XMyVwNSQ/YKFu37KHcOD3Wak9gD7S++aiX7R5o7d+8HatX?=
 =?us-ascii?Q?GSO9Pmi3CxIpRTWnDfLwyBGsBTl7fC7FSVkV43pCrH1G4EuZ/2bnkSIL+nS1?=
 =?us-ascii?Q?R4XtTdq8wQvZa1n5TFb6gl/DVCS+WKtnJxUWDaAS0eZee1xkyw5KUb5kgguZ?=
 =?us-ascii?Q?/cwmdBoiesGqiAPGK7T2Q8XCvGJ+cWqzVEHN3T5Dyi6JEDW9okHkppCRyNQf?=
 =?us-ascii?Q?jyQNtcCf6WiGkLwB/8E5fMQkJaSLRtmLX4qe2dXnvIgYW4bZCr7i76a96BP8?=
 =?us-ascii?Q?UW1D889tfewalvH97EVLhettAQ+SgQ+VbLqBGBqAhdvKQ/MX3UH/X0cfkn3m?=
 =?us-ascii?Q?9kiJ5yO34fSg7axQzdadNpWZdPR+La8i1L+pAH/T44cBsN8Kdbz3w77FaAmW?=
 =?us-ascii?Q?jXvU1rlSD6/tK96ANqOQohvIjAaoyFv0ZpAlQX+xIjIkw5HoZ/86et6AE2WX?=
 =?us-ascii?Q?Arn6LzQTXxwhvsZT9+B63ds47ENu668XxGTtQPsYXHOE44Dbs4oAnGIlM4gC?=
 =?us-ascii?Q?cABUrkvsgQlf5vJIV+8Q+HHoCQ3bUoA+8MOlMh9gvVf2fFUqnYrT6hDatm0B?=
 =?us-ascii?Q?Z4yOXIfgCRg7eEI926ICipkTczohCqn6G0lDuEKfnatHjqIu1I3kpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6YifSSLNjyp07m3NfZFrjvy70gskq15Jxoq3xUV9qS0jlFE+RlkTDee5PnK0?=
 =?us-ascii?Q?OZj8FCDfnmiTKEK1x9hFuJ+WUavK/L/lDUApiu5ePeIjBxcpRYfUUbYhg8td?=
 =?us-ascii?Q?7qakgDyxEzN+C8NmIOB2bQkXJMrsRDi4dILDN2lG4IsdokEPHvbmOeG4ugkG?=
 =?us-ascii?Q?kH9nbKOFePL7shOp1GBCg+Yjwbz2wEkVLJk07/uNXCU9HrSbiu//jixuCzoI?=
 =?us-ascii?Q?dqwapJ4l157orlpICPTBkkfiJaP7L/Fs9eS+S07AaEF9lhqBr8MBrWZAntdz?=
 =?us-ascii?Q?zKVHavrrDkqwyJ/H79DlXjUTNxGjJgtz4E+NkWgqddBk3fzU1noFEbxINeDR?=
 =?us-ascii?Q?HQIaAJGGHSts+l9B1HPCnsD0Y6+ujKp04IRirTjz81ESJyvk77Wt/D2HlGEj?=
 =?us-ascii?Q?PDiksbZgATU3wYYvsltzlEiZyaPDKbuLpkgf3dE6j5QJI7woEGOucVsd7Uxo?=
 =?us-ascii?Q?MgzviuNR+IJt4B3tWXxrHPCO0TrUahEZQ5rGjVpjSTSqJ6vSMK5FvxwCFYqm?=
 =?us-ascii?Q?EuyhjezcVXuOCxh8YeoQe1LkTZmiJIrsW+PE+x62eLElKVblp8BRRO910gJj?=
 =?us-ascii?Q?AFXAjj00aqQNV1uK2XsWNJB6oh9AEH+uEaYTpuDQc1LWCpQSl3ujydN/n2NZ?=
 =?us-ascii?Q?V1/WtPgSdtrz2fjTR+bh6yJl5ITlvpfyZMpbDo7XVZQ7RNCkcHdbLgwZfU4g?=
 =?us-ascii?Q?Wtxeu4AAhplQTlYliuBlhtZDuAPwLHeB1t1Ekg+YxoJopM6orAHK/cH1HscF?=
 =?us-ascii?Q?9p8JkiAPH6BTr/JoMMlgs/Rg4pj4pF6YcTWnJWt5UxohBJ4sHmKtk70Mf6wT?=
 =?us-ascii?Q?IT8hGIahduI6zLm8hFFavzJ69E1dByb+//vFYqR84gg1TnRrzCVDn+yvtVNC?=
 =?us-ascii?Q?qX2OHz5jqJNFsB0xYzrglbTc38aI2x0TRdci7jg1KcfreR8nFoTQoB8Y27ml?=
 =?us-ascii?Q?37wWe7TBBIhJ1/ML6jBEddWXUjCeu3yVMkgt00yV4q96OLE2n/Rrmbgq+g3L?=
 =?us-ascii?Q?FvR/WqkOF5Jl8DfHljMQv8F+6AHuyQfGTwu+vnUs9q3/PZUBF6QyXVbfLeXA?=
 =?us-ascii?Q?LmqGhE31JrFsca3Y6V3S03OAx9T/oM2+ESYLU9gXKbNh8tk3xOvIcpqy5Rec?=
 =?us-ascii?Q?ro+hWT35HkShHR+H6vL+tLbuLIedWmgU/hgMa92rDjn2XAwSFficBVPcE7kE?=
 =?us-ascii?Q?+wAmfEYwkOrSgU7Hy+ouX3fqqhyjAGrdY7+UqyLFqMXeEu/MjxKgiSHkL8eC?=
 =?us-ascii?Q?qwzoG0LTR0aY+AgBBrVHkFEXmUEEDNd4JEQDJD9FK8ueTXlRQxvjuvUHKJdY?=
 =?us-ascii?Q?QdfMPvRoruDcsh2p3G3codgp7JCHCEN7EWgSXo6utJAk5k+zUug9wsx7XAHQ?=
 =?us-ascii?Q?5tIVQB1LPa235Kk6rA5waPz+TE70QnvvyjjWTpM88RCCdYR+V3Z9VdPUZRBX?=
 =?us-ascii?Q?bMZfTxR/hBZDF9cxNJOpxI5Zj3Nd+DaFWYVM8H2zaeprF1CV7tDi786zVBzk?=
 =?us-ascii?Q?QropJ3o/h4KZLeoWP4zlp28W6xC8E1PhmVaAHpmWpUWKsR9svirxwMCh3v49?=
 =?us-ascii?Q?H9gZ9ltfByq37jksff4a7U6MT7rXaw6FzwlWfT1J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56cf130-667c-41eb-df48-08dde18ac889
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 14:47:14.3763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMXhhU3kV/yC6VPuN6tQ0yX/P/WWJPgJfvOAEo416GwSV5v9SW/PvUm4NuTq1U+iKJRTzhwB7TKt5EkIH3lEkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_074724_173094_6817BA13 
X-CRM114-Status: GOOD (  23.11  )
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

On Fri, Aug 22, 2025 at 05:40:00PM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> On Fri, Aug 22, 2025 at 10:13:34AM -0400, Frank Li wrote:
> > On Fri, Aug 22, 2025 at 03:27:26AM +0300, Laurent Pinchart wrote:
> > > Multiple register field mask macros use GENMASK, while other define the
> > > mask value manually. Standardize on GENMASK everywhere, as well as on
> > > the _MASK suffix to name the macros. This improves consistency and helps
> > > with readability.
> > >
> > > No functional change is intended.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/nxp/imx-mipi-csis.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > index ce889c436cb1..50f6f4468f7b 100644
> > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > @@ -57,7 +57,7 @@
> >
> > ...
> > >
> > >  /* ISP Image Resolution register */
> > >  #define MIPI_CSIS_ISP_RESOL_CH(n)		(0x44 + (n) * 0x10)
> > > @@ -655,7 +655,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> > >  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
> > >  	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
> > >  	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
> > > -	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
> > > +	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK;
> >
> > nit: if need create new verison, I suggest add "change MSK to MASK"
> > informaiton at commit message.
>
> The information is there already, the commit message already states
> "Standardize [...] on the _MASK suffix to name the macros".

Sorry, I missed it.

Frank
>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> > >  	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
> > >
> > >  	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_L,
>
> --
> Regards,
>
> Laurent Pinchart

