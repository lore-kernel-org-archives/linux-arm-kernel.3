Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D748F364C3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 21:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kAj7slkvePYTD93asw0UnvnHbPShfyClmqFIv/KyE0=; b=JrRfqp3jI/Tf6BzL9bzx88iinW
	U2JQ3v5f1GeySyy0tpNjbqnKSGVFDF0/72tOLRR3bdLw6GWfIBs9u/x03kKoVfwgj3fmJRvTpy3eQ
	y5ZzdK4jEV6VnlIxPLlij/Ou7IPKYRUKU2cVEzHF7IwTx/0qCVcw+8iIp6sta5Ix62/5yhvopKb58
	HJQswlGlJwse3DW9ggyXdWdwZnG3PHM1/xAWKEiqslIkRonOaFi6J1OVp5PazfD3EA1/eRcYle3oA
	lFDHA/a8Jneq25tLtjeUzR4zuWZ+HCNpmdB0EVMcJkMJs8D7wdMHYoyAFnUUdFDe/yRG1Wq6AbHPs
	PA6gIMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxIv-0000000BFh6-0dQt;
	Thu, 09 Apr 2026 21:52:49 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxIs-0000000BFgH-1bPR;
	Thu, 09 Apr 2026 21:52:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Urs0b9lHn2SSMw/Wrr33bBRF8PtP2DD3ZftxAR8ONWwYM3qtnjX4pKDC86kocmMKHZtuScKB9C90yOtUb0PlJWyKSjqBHRgf/cHsEXQ2Qn1KFIWaI6A+hXuo8OSpeN0MGyt0JwFg7O33rMnxICDPhy6qgqG8o7ux4NIol0i40BGARb+uuVJ3F1Cn+GCHQ6Dms4tW2GxVAGIRH981SdRRPgm0p6ld7cJ3XVmXa5du/Pf6AnbfRrh90bq5T2MN9pD/3RO3I/SXTPw8wfXQ9l8FkOSoX/9R43SvlFU0kBUz7Ds4KgJQAd6RE342vw9A9G0brr6zDk6u8piD4pXQ+it9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kAj7slkvePYTD93asw0UnvnHbPShfyClmqFIv/KyE0=;
 b=w1i8NEzT2VEwR8M70aJL/GDssGnpS0kcRC0v3KjCTUcNejmnDrKN4ywiUMd7BZNYJmwLJ3Q9W1VdU4XupF6AQX/2tc0vwif8aBaSbGHPKlEWpumiswSJkIr1mx/q+RekbiP+TL0V8CWwXsYwwOkoMam2mWJ4sXh80Tp3grc3Wzvk1lNJ/cJgSic3yv7tpgAB4LlG3xfJrFak3+/RkyV9uorHs+/xkV1wu4J1qiAqJN2JMGyvXWT5bRKxLGVP4VWHD+0F9YhBMyt6WmDZrgaIv7hKn40iU26x5wn/BYOVOJEySGGo7uIn0dyDUwaB+FkZBpV5yV7HFVujAPE2RLRKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kAj7slkvePYTD93asw0UnvnHbPShfyClmqFIv/KyE0=;
 b=KoPaUuG17Tt+0gb0H3SFiVSP56MoOk4cPqJSIa3HUGXzU1Xwqba7t3KiodvF+/pROF4rc5VTVTwrSLBZ4UlplozabL9edi/X8OQOcHzZridfrkGPRcIrQaCWrEn0ySs9YltnRTcS8u4LAnmACKwCLK5V/po4ZU2Z9D/lnFCvwdWwQfhwCH2qaRHnrVmwLynwigc+Zwp4QFh5Xo+xolo2mi3RO/trzV10NgKdtoHrLKRNIFTRtV/0gOcx7ArUV3RgyVjDOXpzuWsqcfBu3HEpG+lscsf8HBbtJALrZcpx9V+M9sODvuL1gmnVKIB5aZB032WpXnqi0Q+eN04/MCkq3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10425.eurprd04.prod.outlook.com (2603:10a6:150:1d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 21:52:40 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 21:52:40 +0000
Date: Fri, 10 Apr 2026 00:52:37 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Frank Wunderlich <linux@fw-web.de>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Felix Fietkau <nbd@nbd.name>, Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC net PATCH v1] net: pcs: pcs-mtk-lynxi: fix bpi-r3 serdes
 configuration
Message-ID: <20260409215237.deqjdkezmzdvr6yt@skbuf>
References: <20260409133344.129620-1-linux@fw-web.de>
 <20260409164942.wbmwtkpd5d5zibyy@skbuf>
 <adgSXDUn-oL6V_TK@makrotopia.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adgSXDUn-oL6V_TK@makrotopia.org>
X-ClientProxiedBy: VI6PEPF00000208.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8c7) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10425:EE_
X-MS-Office365-Filtering-Correlation-Id: 0038df1d-a57f-4631-3b59-08de96825264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|10070799003|376014|7416014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VIWRCE27wdl6/ZX4KEdBWFlCDHwWRXZBeIp8Xzrtje4ykwrSFHptL/wbkZfYz2vHu7oW7WveWXDJ6AdulYpeD8O20WDFwuUfphMIGeiqxT2ckXuUvMwPFEJPXED+d9W74q3ZQyNEbxUPXeWX4VnXr1facgQSYnSwAjru82D8VvELmb0ihbDXC6j5dH6bsRIGx9fYS3nWUtwx1A1/h7VhCh+0Ht4RYTc61ZmnWHfaVA35DpG4R8JxA0Ebix3dnlv7RStnLMIOznP+EWSD4dGBqNhShGBjpw2TCe5e1elXZ24C/oBM7QW+dMWMupYbV/ipaQKVla5u4/xZz8klJpt9/Ux81ZkfP8IDpO9LY1ryIEopRsfCGJZ9eJ5+As71/B2j8cNFXya0qnB35n2nfQd3473YYb0CSeA3VliIO54BZSd3uCTKjsbbHwKVgWfvttcq99Ysg66cq1hVAivvLwJL4HuK/1a+2BTD4fbU7iUzGVez34HZNgB4Oxb+wbLQ4axwx6xDf6l16cs6JvRSjNE2ooHs/in6XmVYpuNL0cVzulxVMnIz8UfOwcM69elB39RbKiVQvNFKQD1xNGhPphsUHm2LGCwYZbA5ckYAr3IrFQTquF5JAXmqaC7STeQ41Fujtu267OpcLeOJWhgY72EgGDaZTORTqNuNek00/AXA2zLL91l7fHJMK8NnCpASfgft
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(10070799003)(376014)(7416014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b2rHlGaV00LCMlQx7h8QYErWGBGVYdWNaHcME++CyF2B3FEkWJucaCqsn3?=
 =?iso-8859-1?Q?Dy75+uVhhGqLIsot1rcX1bLVVEQfCC1eRaec2N4QnmL0x2XnNxy6qGcEfr?=
 =?iso-8859-1?Q?IJA38Wk2RY8WrUcCIqH4N0L1P1gJdPGJuosQvVw4j6jXKJXwu0uMkY9rYT?=
 =?iso-8859-1?Q?h/oUCHiSGA0yNWTUn4U4OdvfaSHP4pHy+2INQxIA70VyWXI5P9XFJLP7jO?=
 =?iso-8859-1?Q?HcOsHWOvdgonR4XDYaDgD0lNzsulu3hyk2cbru8nL6qB7GvvMJWqnRj8+H?=
 =?iso-8859-1?Q?QphDpVRiM2v5lOe9iUplGY3pHjNeZV9vuVWGdfIEVtix+JvQhRNuJOfZZL?=
 =?iso-8859-1?Q?9RRzxW6rbJunOZGx598GbGVE7ugeh+IUbPH8wWWkPdVxF16h/t2Auq/xBK?=
 =?iso-8859-1?Q?V5+FdUvD8zMgFa4bKB6APZt2XWVYug94TK2NCxycFhEAQ8+zu6AFcAii1u?=
 =?iso-8859-1?Q?/2OWp/+GDW15Vg1f1wyvWaPnK3er6WjhJUq3sX8mdPx8poq6gqIloqv0nt?=
 =?iso-8859-1?Q?7CV+b5Nmk7Y/yuSp5ATCZe4ItYGaTKidT+3MAb4m57h/NTFa9fW5jSbObv?=
 =?iso-8859-1?Q?QTY7MoXkCvjuqyUhsNnX/478c5s/TJq0aoaL4WBvnFZ6eZqmcTZDEOS3Zi?=
 =?iso-8859-1?Q?/f/gQE8UU1HFi19dcN5q1JHZgHzXWS2U17Rqqdhx9Kj671QC9/whGYdgFx?=
 =?iso-8859-1?Q?SPico8h0kJb6AKztE4qI1+ozHoH4lstKtcEqQk12fyQQ2DJNVMh6uBGNBK?=
 =?iso-8859-1?Q?4fyvV8paFhyJN0IEKiarmylqMjLyVZZQ+hSFTcpYUHt8JikS7ynqy417tV?=
 =?iso-8859-1?Q?5E4LOM/r0fg5+/aFu02GM1j6togL+K8pRp2D/Y4eQsmhUVAkEPpBd0GFhj?=
 =?iso-8859-1?Q?phc1zW0A74uryvQ1WVFseyfnduWJoRGBSzMpmZbHwwyyyNTP9DINMTHORc?=
 =?iso-8859-1?Q?smgvY97XoAc/Z2jqBuRChobsjITtWiUBelO1A3YHDAQACsvYo3TFdyd1EH?=
 =?iso-8859-1?Q?XzoKQBKQD0EDUA5TdXQZOs4oaFY1c5/52zbV3fyeQuddCkeopeb7QA++Uo?=
 =?iso-8859-1?Q?ECUoVEbIJZIqlRgc/nCmLja99iRfAx2SsFjimVbnMBRHMioIDc5Fs1R0Np?=
 =?iso-8859-1?Q?0n87hxlTPuEBB6pBPrrmEaeOhKDnyjD9wYiOgbZV/ABbONK/GXKrjxnxRu?=
 =?iso-8859-1?Q?VnGTP6Dn7sbHaa6CycWdd765vRoAlCxwm8kyvdgQ7XnLiTJ72AeTCxwCz8?=
 =?iso-8859-1?Q?4EjQ9Hq8rYpDA+hODQVEy6ZXX9gCDs3xEAV2siVW3WU+i/KO8eBcMHtyOH?=
 =?iso-8859-1?Q?qVXj5t4tAk9MGyxlbjM46KanIblJmYGl8xJQ0Zn0fHcG0hGNPQCWgrCe3a?=
 =?iso-8859-1?Q?ztIKrvbHJiX3JPAlMzXo+Z6aKCnZY04eGYqY1baWbaUNW/xjOt4bOgb3rH?=
 =?iso-8859-1?Q?qXTMOF8ifK61/ZyvSdCshI9loBJCKuqArgcAIKYF1+vpcHngP/YrW1RMpr?=
 =?iso-8859-1?Q?go9XbZAcFMjLzSrHJqUKyGoShOPqha30XdZJkQrP5gM13XQuJ4fZfkTItT?=
 =?iso-8859-1?Q?VvgYgK1lT0KCXVcr/q2LUy9C0DQ6zKBZ3VG9wGkg83wNbCPr992eIB9GEE?=
 =?iso-8859-1?Q?LHsqlM+3YDm6GJCZBDV4X+OmiLDy45rRIdpVFwruZCVevUVtVpu1gMHPWO?=
 =?iso-8859-1?Q?x8GHHVEAncwDycp54XG+zWc1BKm1h2vyo99c4ACjWkJrI1qb/UshK9KRhn?=
 =?iso-8859-1?Q?MOribfrpH92A1rSJi7CgIQxG2RCWfjKIFZxip8S2APs/bA75Yn3FdGOv74?=
 =?iso-8859-1?Q?TGruDR2Ng0+z4z9dM0V9dFTrDGADU7fjF2/xphjBtDg0AjgEqu3PvDuzqC?=
 =?iso-8859-1?Q?Bo?=
X-MS-Exchange-AntiSpam-MessageData-1: pJgjH8CrOSr1NTlcy5k573iIJ1O6H5V96Ls=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0038df1d-a57f-4631-3b59-08de96825264
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 21:52:40.7595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKpYfXzCJDqlIIfUyQt8XGYX3yd5DuR/lfG2S0fElkpKvJ9prZeyGDKoKpLXFVomvaG4txvHQxVlZxjh8K3gnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10425
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_145246_452108_3A795659 
X-CRM114-Status: GOOD (  19.64  )
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

On Thu, Apr 09, 2026 at 09:55:56PM +0100, Daniel Golle wrote:
> On Thu, Apr 09, 2026 at 07:49:42PM +0300, Vladimir Oltean wrote:
> > I notice Arınc, listed by ./scripts/get_maintainer.pl drivers/net/dsa/mt7530.c,
> > and Felix, listed by ./scripts/get_maintainer.pl drivers/net/ethernet/mediatek/mtk_eth_soc.c,
> > are not on CC. Maybe they have more info.
> > 
> > Only the switch port has a chance of having a non-zero default polarity
> > setting? (coming from the efuse, if I understood this discussion properly)
> > https://lore.kernel.org/netdev/C59EED96-3973-4074-A4D8-C264949D447E@linux.dev/
> > The GMAC doesn't?
> 
> Yes, vendor SDK uses DT mediatek,pnswap{,-rx,-tx} properties only for the
> SoC GMACs. For MT7531 there are **no** strap pins deciding the SerDes
> polarity, and also no software-way to override the defaults in the vendor
> SDK.
> 
> However, the MT7531 datasheet quite clearly states:
> Register 000050EC QPHY_WRAP_CTRL -- QPHY wrapper control
> Reset value: 0x00000501
> 
> BIT 1 RX_BIT_POLARITY -- RX bit polarity control
>  1'b0: normal
>  1'b1: inverted
> 
> BIT 0 TX_BIT_POLARITY -- TX bit polarity control (TX default inversed in MT7531)
>  1'b0: normal
>  1'b1: inverted
> 
> Hence the best would be to just assume the documented default in the driver
> as well.
> 
> A quick register dump using the BPi-R3 confirms that this applies to *both*
> SerDes PCS on MT7531A (port 5 and port 6) equally, both read 0x00000501
> after reset.

OK. Excepting the DSA driver for MT7531 from polarity configuration
based on lack of a fwnode for the PCS should be fine (for now, to
address the regression).

