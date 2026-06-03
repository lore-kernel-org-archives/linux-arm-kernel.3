Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61B2CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VtQGt2M8UPoHeh1Ke8d+pj00cJtJhfx3tvqCIBtXSM=; b=IHM/VatRrQHrPGe99ROnGHXTAz
	dQqI1kPXFNO+l6Ig4v5eYNeeYSTS72We1PicSFWEZAoF8WC4Hp9+ikyatNPlDmbo9JGTzr21VujH7
	KmfTUIrQ4jb8t5fXZC/s4pEv/Czk1K95Ql6ySmTzMOoTTGnLUXfkTVlHckdfv4YW7lUNe8bL8eS1O
	FkcpFllQP3q7/0JCF9QFZFyU/KWcVYZf2houDm71r+Ri2k4wk0pSoQzkyxkZTmGqOiDIh/+NIo247
	chG1T8E7eJ9yGy4bbAVc78VMv1C5Sj5IgSRLHCh/s0VEuHYkvkxx+A0cRMtkehrXA+oMM+0+1U06L
	FpOvh9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUidu-0000000EnFp-1qJH;
	Wed, 03 Jun 2026 10:16:10 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUids-0000000EnDZ-0fiR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryDbq5Bnedn+exNO9rbyFThRWsMx/HhIRIiNk6Nskt0suCu+NAKFN7ilJ5NzRgR1AtnK+QV5dCahOwqBNcpmC9ZpI4tD2Uz3s1lrPS3FyH/IPAd8/pKYpAJ6LeWVyYrByS5Vu/kjrGA3PKzjw1cfF+xoWhpAuliYpWiIjR0jgIkVDYZ9ZKi2Z/ZubeFUPG9Dtfd4TiH4kA6RaBGXFsX1TfMaZbmZv1QezbO+8pXk0Kadhl2JGU1LjP3MzesIuiS3ymesTvgT6QaWJlzGbN/J2aXZpDhu1o7bz5hngBQReIrq8wIB8BAOOOG5MkzwnfQVDeao7dFRoC98bGy/nqrggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VtQGt2M8UPoHeh1Ke8d+pj00cJtJhfx3tvqCIBtXSM=;
 b=gEiEWv4v0Wf4mtpdAZ9HbO0iZYZvAEo/PBUnPYASVxRcsHO9wxAHtZXPoDCAKWOLOcTUmCqg24MP77Atcl1SW3A5zWv9c1fadCS4skeFHprgYUSWP+1Y6XHjoxex+dhwpZIMYqtaOM8mZaQGAAEZadqaGMZaY8AO40GmFlVpGrnudk+QMb/ZgXl90irAKmtUZjToPU3Kk3G/G8YVgcBqBPeyZUDZ7y3iVmS9EEzkaFRGdEpR8JwUrpm9CNbtHXffLa6n5U1SomwUvPHeFmzRizGXR2K4sX6CAGoHcY0Qw0FRCkFQErDESH9YyM3jMoIQ94YXBqCGfC2xqENBBS7vNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VtQGt2M8UPoHeh1Ke8d+pj00cJtJhfx3tvqCIBtXSM=;
 b=RqCp2a4HvLaTld1378U+lqVCbzZc2NgJCBGEFin27qsSwiu5rJEnPh7kVwge+JvnRiZ8LjxzBYGX+zukf5IC8GGegFGMkS02JfxWNELN70iPusxMYcZXKHlnlnhpjcn3ocXMIXS2nrVj0586ZAat8pz6SIgJvg2nB6S+97W2diY3KAx6bjtmlMasBUNbq1jrlCL6QA8JK8JAi03/pnLLQZXzF4JMOVwVknIIPUfBbB/vtJ1dsjWxX/7ELwrRkAOywBwoP2IYsInnbQOTwKCSKhE14pwnXV/+U38ZV/PDNtYp8e2eZUN1iWU+/qgya5SYEb/6JIa6HqB6P2hHGsSbNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12)
 by PAXPR04MB8336.eurprd04.prod.outlook.com (2603:10a6:102:1c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:15:57 +0000
Received: from AS8PR04MB8150.eurprd04.prod.outlook.com
 ([fe80::24f0:af2:c6f6:38f1]) by AS8PR04MB8150.eurprd04.prod.outlook.com
 ([fe80::24f0:af2:c6f6:38f1%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 10:15:56 +0000
Date: Wed, 3 Jun 2026 18:18:10 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Frank.Li@nxp.com, conor+dt@kernel.org, festevam@gmail.com,
	krzk+dt@kernel.org, mchehab@kernel.org, p.zabel@pengutronix.de,
	robh@kernel.org, s.hauer@pengutronix.de,
	sakari.ailus@linux.intel.com, sebastian.krzyszkowiak@puri.sm,
	slongerbeam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual
 OV5640 cameras
Message-ID: <20260603101810.GA540052@shlinux88>
References: <20260529132334.3333294-1-robby.cai@nxp.com>
 <20260529132334.3333294-2-robby.cai@nxp.com>
 <178031282290.662668.15145642423417739969@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178031282290.662668.15145642423417739969@ping.linuxembedded.co.uk>
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To AS8PR04MB8150.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f0::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8150:EE_|PAXPR04MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 48bfbef5-2fb4-47e3-aecb-08dec15919b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|4143699003|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: RDmEAQb6G1/xRAeWONinl/m+Iva96oaeV3GxbPvftkC9EEMD7jf0RYkTyJpwuiBXklO9KYlxd1SIB1lxdqvR0qG7+rh5QuuLbk8NIQWH83UAwk7URQoRksjbA2XclNwHJQS5IbeCjRXoUyyvUn7nZZQkaRZVG0WLsOb3ROszgTl+wNaUYnWGYK430NwrXsNLIcDiyJOuXFpar4VX3hNxedP5EPr4u81E5y4DXrdyH0k41eH2Dlja0ONFvNktz1Yx23HSpcbTCZWrisODbuGbJt+WFzECiUB3Ihj+38ziLtYDOZ5vMi1xUcmh+feSEwSCbjfWpDYhGGXFb0l4OfNyYkz98iTAdoW3Wg0Eqzm2bI2aSByX9smQ44IaNHWz3hgccqitL9inlXgg20+9uGB1bS6hS7mLOipvtOBwb9zfQivbe7k/TL8EUfyM4LV9uqVkOdfB9DUCNQxkp3xMwtgsB7PCJq7S9QifIBch1/OYdShF29aom+QZrefwe4O9XVXOt3GVGJbw929Ef7QTUjyiZu+wPqyxhGLJDnqEY4v6WjwXCFBAqfoAe8CE2LL0Yqd+WA8Ms5W3pxL/XkRX1IJ1KQdbw7nnwBRIsYwcE+HUQ5xvAfXvs5Wfdn+gtpbeq7LvIvGE2P4Y0NPqJEj95uaTnc7HEGcjzeM9QJWgZdwFpsaNOWZEKSmiEUMA+aNiAaXaeXlb+0W5+HIKI8DE1ngRfD3Ke/WGWVc3D7CtF/Vr6jRuEE8+1mJHO92MFhuYdlMu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8150.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/7boNb8I7Z7zWqCxmdOIU0qTPzACo7VjDYJZaq/SJqDNlZT6jOR9EjBUXt9e?=
 =?us-ascii?Q?oGya3hueFeMc4cxmALzl8Jtm9emILOTlsJWQpWfY2zArGhsC0zShONBj1v3p?=
 =?us-ascii?Q?ElJIwHUmLBzGcusnKyn8KWz4JkDitGilzIWBmvIkeqP7s/CMBaGfX8+YYlax?=
 =?us-ascii?Q?PNhSnitdarzlPQtisqQ/ish9zLh7xQXEk57xhazvFuJBoKiRYzA4U28e6ywg?=
 =?us-ascii?Q?hMNEIRIRdGBPWQaEYKs7w29daoClTI6Ak+Hkd/RT/gdjL6HQkWBTGPFKh7iI?=
 =?us-ascii?Q?t8jqylzybLhP0PnAeSN7xmIxTBJYTnx/H8IKYORbJmXsiUixAWryOMPQgx0s?=
 =?us-ascii?Q?LxcY7lOWQDMCFcQtcQgDOBZH5mufDImEuJEKU3qWRvfKMUI/Hq9hWnENc/qH?=
 =?us-ascii?Q?k7Qias2UiFmf2Dzsta+sQjE9kkilFxTiGkRhpIPS653RygOyX3MzDlrPmPQN?=
 =?us-ascii?Q?0XmBvJih5rHFvUVNhfyLG/uS7jkUg8bk7rACitJbddYNqH6r9TJum1Kba6f7?=
 =?us-ascii?Q?X9MnmpaxUMGBD9R0CJ7fUg6agYjDVSWzROhsNAgZe2qBBPddfuVU/6LKREYj?=
 =?us-ascii?Q?r6BHwRl4xUuS2j/C1Hj5add0LmAQojFVfwHNvhhA+7pWQhYG1Xdhy7BpoLpN?=
 =?us-ascii?Q?RutQuRjKVvsYyDYNfCyxluW5WFty5JPy0bviXGgrgE7bkpelZphbk+LIJvNY?=
 =?us-ascii?Q?/pIx1i2cy7Zl9RqG+lETZLVrdKyzcXU3SgBAfDNi665cdE1vGdhXDzGzb6ZQ?=
 =?us-ascii?Q?fEDfrzA4jSoIx8Rs1n82sZMQpnIDSKlbO9u8plzJMnGbyauTXAKVWRbc37vB?=
 =?us-ascii?Q?/2582AltQ741v6KEVuFdrfTxsnCARTElSR8F4qcHQTtzAL1B40UjyfEBnnvs?=
 =?us-ascii?Q?vozUGGYDUAl26Lf2uBi/SZRp01vF3/jh6o5psISvJdUZuM4meUETG4fpdZHD?=
 =?us-ascii?Q?DQ1bwDYMFE03LDb+XujlvVrc7ExF0DVWwznw14WeUXkUTJr5vTIctKFqSNXk?=
 =?us-ascii?Q?g43a3sitciDxkFB4Y3Ocs90y2/xonhoGh32hnvpQpKsOG+Af+z7n8003Bk5i?=
 =?us-ascii?Q?eDR6g2499euVf5q/eqVw5/y43NaVRFUVRmqMRPAn1k1hDT7JlwoDaRqsIUf3?=
 =?us-ascii?Q?M9UwZEgJznsf4jNyNAQY5tQRf0Ut3V3bG0CNNUdZ0pxGgmTGdnBmpZvCp7UV?=
 =?us-ascii?Q?R/7AEwTojWH8jgxJ2nAndcHSedJ4HcY3ce3xPxwBnaYaEl9LGLrGeo6IBAW4?=
 =?us-ascii?Q?AWltbYpR/vAAGQKFrRxwLFVU2rXqPtTn5AXY64XAQrZLZhwychi1lsK/ZBaa?=
 =?us-ascii?Q?esJUyEYseimaZ00vHyI860xNbKv6w8kpALpFCb6czqe0LKX6pdJDVEdFfUwO?=
 =?us-ascii?Q?gytuKvLOW8zzME9Tu+hUAaPIX0/t+oNQzyWagZw0y1294thR6q63MhaEAX2W?=
 =?us-ascii?Q?oqjqPpLc6pIOyj5p0WN+K3ngs7MHWkRkFmsJLO3kYijMGRCx6Q4w7I5gAyPQ?=
 =?us-ascii?Q?tIyIS0tVcYe6zhESwHqYMXMnqyNxk1tBd+rpf0RsJ6IIYiBCx1z6QHXuUIwa?=
 =?us-ascii?Q?iKVwNgpMKxOldf6zGgWVgk3Q0Gfp/8whI9gGgHPie8YrbGn4KKfKAgbSf7uO?=
 =?us-ascii?Q?9crCXLtn7JDtIL3dNif3T2crttOOMVikMkkIa4S1K9ih9sujZTFn7RLND5gT?=
 =?us-ascii?Q?EUAoEaTZYDexTVzccVm4xA9pmlsbhG5I1L5InDwxXnW8LVI7R/mEiLYkAwJ6?=
 =?us-ascii?Q?MPONh3Zlzg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bfbef5-2fb4-47e3-aecb-08dec15919b9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8150.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:15:56.2840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0lqsMM+WiP05YdDl52QslJAZEREyf+D4mEDdvAykeSVyheyiEE+ncZ70oACD7AV3QlpxRZnzNy8lSMNhwJQLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_031608_235947_4F394861 
X-CRM114-Status: GOOD (  14.93  )
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

On Mon, Jun 01, 2026 at 12:20:22PM +0100, Kieran Bingham wrote:
> Quoting Robby Cai (2026-05-29 14:23:33)
> > Enable the MIPI CSI-2 host controllers and CSI bridges, and add two
> > OV5640 sensors on I2C1 and I2C2, forming two media pipelines:
> > 
> >   - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
> >   - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge
> > 
> > On the i.MX8MQ EVK, both sensors share a single reset GPIO line,
> > while each sensor has an independent powerdown (PWDN) GPIO.
> > 
> > Both sensors also share the same MCLK source (CLKO2), configured
> > identically as required by the hardware design.
> 
> Shouldn't these be overlays? Does *every* IMX8MQ-EVK always have 2 x
> OV5640 modules attached? And never anything else ?
> 

You are right. I'll use overlays in next revision.

Thanks,
Robby
> --
> Regards
> 
> Kieran
> 
> > 
> > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 150 +++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> > 

[ ... ]

