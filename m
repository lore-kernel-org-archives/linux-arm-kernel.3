Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08840CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMwG5YPHM+hqYjjbOf6L2ODzJWCs4Q2W7IPQSonBseo=; b=aOCjEYBSgkCLToief51qX9atVW
	KzGej1GM/h7Vv5RO0FwYCPg5GSSqInTvi8QWDBO0eXFYKQkJsXCUR6sJldje6EApdwBedtzjocBOz
	od0SmaoE/F5/ejssTgZDVO3F0Jil3DEFU6FtfuDlHY3JZaCT1PGIqbqM195XbkIjp8m48GP4V5jdk
	lQkD9lbfftnabWv/fljcs7XjXZra+l2uZQ+iyjYx1ZqbhqV7uMopgMd2fcFHIfNM/SP0qqUUZMcJx
	FIBdAkRC7evByzPh49rOC6QvI6BxEUQngdXvajK4ThG6Cq1CiES8H8Gdcxts+qgP2f3Kjw/bO/+zi
	BkS2zzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEmJ-0000000DdNR-20qM;
	Thu, 04 Sep 2025 18:33:47 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuApE-0000000CAK5-1QR5;
	Thu, 04 Sep 2025 14:20:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBmKjBHth3exDux7PwBYC2FNlwsTz/vtrDlLML4P0YrmKjO+8yijB6OHSfqfXZQcAXMkC3Ti/nHa6FpUTyhhLp2ouw+AZjxYRAEogHhgHydPevyNITnFMG8kY7YYHslLrjdgJC7l1oX5YGtcxA1FEIqHDqUAtrfcVpVp41CBE7H4WDfNmpQHbF3XdDx+lCSwIAWvFz9zHslPW+sPRR8lz5lOXPpR6MyqxheRdOqQwiDIR3VS1x7RRiP9JEEvzZWhITeU/i1k5xfKHjn2IgNRU5dzmMJO+qUl3WIdBBuYlClS3yBxhKIRHHaf75t7xD2VhGha6OOHMgOiZmYcd6meYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMwG5YPHM+hqYjjbOf6L2ODzJWCs4Q2W7IPQSonBseo=;
 b=Yk5mtZXTtvtz6xjy2sl0L1010g0p1XULv0qcweW981N+6OswNQx4pvCbg/v3SJlAJRKpibprfJqd3JnAAJWQY0d/gu++eH+2PGBhljzHq5b5Yz0mmHn1xTfOsPDmwvQNgn49wPWQEknBRj2fOaba3iwHf1jKlg5Xixhp4vG2rF49ULqMvImWpJ9OfoZFnQuYa0J0jawYsPwmhJmz5VdMouknqLqAi3x4zAsXdF46p0fuLiC4w0+BHemorO5Cz36yvJzduEjiArvtd1iUW/2wnO1jwtpci9QS2xLMFtfdvXuywyoyrofQb7qkaIBS1BELALZ+4v3Yq4PNqEnro6+/Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMwG5YPHM+hqYjjbOf6L2ODzJWCs4Q2W7IPQSonBseo=;
 b=csebam9MnTrUbww0sHoZh8rAxOGa+JrRR6mG80AwNz+BDtmHfVj/i1U9BjB0WKQMYtBymVLXv2IbCdrH6OvCsa1f91Fq6jCOz347WJaD2z7AHlHEFpK+RuaUigw5pIlnlZADIQAB0n6Q/WlF4KwKaWQOiwQu4YNFwv9b4ZvAsLNUSFobN0AcFyO1Qz5CxA4DBgITacN7BX8S79F8+FFJPXrMMj0R2Xb3WgL2uaPqZ4Hvb9Vo9Rut74hLHH345SK8YAA/o+6INygp/BNiB7vZl2dj4l3xqeVblBt+oATFCspPwTan64PzVDd7USBM2RUGjp7yERPMUX7hC0CBnlvxuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DUZPR04MB9823.eurprd04.prod.outlook.com (2603:10a6:10:4d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 14:20:25 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Thu, 4 Sep 2025
 14:20:25 +0000
Date: Thu, 4 Sep 2025 10:20:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/9] phy: phy-can-transceiver: Propagate return value
 of gpiod_set_value_cansleep
Message-ID: <aLmgH1O+xOrg/Zdy@lizhi-Precision-Tower-5810>
References: <20250904-can-v5-0-23d8129b5e5d@nxp.com>
 <20250904-can-v5-5-23d8129b5e5d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-can-v5-5-23d8129b5e5d@nxp.com>
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DUZPR04MB9823:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eebc801-a243-418f-6dce-08ddebbe3099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MY7PWKtN1KxdLZFhlF7m8mML/Rl20pBxJ2lM6OZcT9BwRQerT1dFPm6FycRX?=
 =?us-ascii?Q?c0STiAycJ70lWLJaQnYnyfPjZzr2mwq0TolYiW+JyRs4dLGC9L2rRtyAJiq0?=
 =?us-ascii?Q?NIpXY4/xMQ+cjt88IZc0cKsK7QFsDFDQ3D+y/UKoP61WHVVPya9kWrfCTfMK?=
 =?us-ascii?Q?W9jXt89XawZfAMz6cIb5Y9gFmZCoLHWmSB61aSJ/QUNWJOnjo1MAuwKSroBY?=
 =?us-ascii?Q?0hLMuxfjenG3Ab5IFWuWiJWOjRCtoR0klHo492TC3IgGphVFfAis0dYoD0ny?=
 =?us-ascii?Q?z+D1OxhDf5X8nggn34IiYlR7onYQzrwGNFtgmx6dQQBtiCRtXMrWQYQpTbql?=
 =?us-ascii?Q?fYXxYF5QSqH8f5vdrLZzAyOnn4+ZRXUJsg9tXosmHwpWSne4/6ZgnVS43Wja?=
 =?us-ascii?Q?ll31F5lvJetV032S1i7yLJTU3A0F/igOxdEA5XB10Krz06GvCSMuyKNIPvc5?=
 =?us-ascii?Q?m+1CqV2KQla7Vc8rkZvZ2fY2CyzuN6FD6C3J3CUcHi43a2XKujfY4acSks2d?=
 =?us-ascii?Q?SUWhgZPhfF6ehB4aLspdE9OlOXxAjLlVN3c0EnGTnXT9ztFclu+zTJwvuStQ?=
 =?us-ascii?Q?e0S+tyIQIoEKkI5cRZW9KyRGjeODjwJXCYezufK+xTIjNBjl0YCcQwSwoVVI?=
 =?us-ascii?Q?lk5u08wrQkoC4t8flqZuVLI/qixSkf6sBblMOTBPmKQw5hCiQjzgGp+h832x?=
 =?us-ascii?Q?wKYl6zpHgj5sJcaZUQgsztAKybSN+Zw4djeGFDt9LM1/O1UJeW4/UaSit9cP?=
 =?us-ascii?Q?13h68DgYQ8ljUbqt5+xfrTtc5zVIg2CcVFbQpArR2J7u0eD453JH/itt/XDz?=
 =?us-ascii?Q?MaG7SVl2gOA8/562RXsNLFOqsvk7vCZ0YAEGRIrDP810xImMhZ/a9m8NieHI?=
 =?us-ascii?Q?LVhdt8WWhLKSXkI4OX8JMOp4aaH/x9Mw5Mxc6XW3OGZLY7AjMUGR8dK+pvWJ?=
 =?us-ascii?Q?0bfZzQnGh2W9otLVJvxouLx8iwqY/9TVADFR/ufpp3lN3bfJMiI51ytzXWeK?=
 =?us-ascii?Q?qUC8NmJOHCvkEOtbB4XZdAijehHRun4+ajbhY68k0PoqzV4GXaQw1IWldXf9?=
 =?us-ascii?Q?XTknoDF6G0qoLkuwPqx0K4gYlPcHe0B3ucJeUVUtUKKTdPu6aT7aMcDh34PE?=
 =?us-ascii?Q?b+RLMOCmlJx4WMXnB2JQlOjIxhud9L0FDM8S4H1UFDyZWpjCGcj8vrp+FLVs?=
 =?us-ascii?Q?kdSldK0pOFEgMbALTkJ1N6lUDv67dBdWVLZ6QFC8F3mwey2pR3jvInsC+srg?=
 =?us-ascii?Q?zUGahBjCvH/w/R8yttcqkXqEiH/zj+bbEldNTQotQnmp9+h3h39Q1vr2axdg?=
 =?us-ascii?Q?wZNwSWVifa0/VRVRNCZRgvITkmxWGbnn29Egv4cXxa5qtIJQ++h3TwQnMGHY?=
 =?us-ascii?Q?gPL+HibXxRuQnPO0K8SF7DAtVwjrYeHL4+HyEKkkybwA0AJGHsZDAT5kF18g?=
 =?us-ascii?Q?nrl5RAOn8gQ8uE7XJfjXInm+0xC+j4i1p2IXiTAoxJNNHpXDrZcptg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gvuh+RblMxBvpWnaVVSZ3EJ+uwrcge7jEpSeYbrir8P7kF34KSDWfL808zKr?=
 =?us-ascii?Q?9d4ohnh6DW+BGPIr2LZvBcYdn6ULJ4hv1xONTfeMij+FqiRa1xfe0k9C8cx6?=
 =?us-ascii?Q?WLX4M664/1f4PZbi0UVsDbb3kK1HPjArS6dXSoBgOAlCH8+klqfIsS2iuFMj?=
 =?us-ascii?Q?2J5s3H6p3KIm9MjTXM/ilm7h9mVXuMGpcTrqt4VKwT62iiCMyaBmUn1q2NYb?=
 =?us-ascii?Q?rUSQYAh9+JP7zb8y362QXCcY0lBwGwO/9TMFNEjFv9CubSwVda0qrDKecpaH?=
 =?us-ascii?Q?XlnEfX7JzxCARhamYrOmFrFJqaBDYL0vGzGVjtnpe6i8QiWBGNGA868g4pEz?=
 =?us-ascii?Q?xRVSAeBtWI9DQBxg4WCoSBUJlihP9ucn5wf11ahiU91gkTDiQ2OYPKaWybky?=
 =?us-ascii?Q?DbDrjtXjpLZBbbP5Bhyz7NQPwQraZISl6Wq+Kh02CZjkAbD72iA2pZy4PKkL?=
 =?us-ascii?Q?aFvTMnUdHAdlZi5qmx+ugBa7Fg1f5WxQEeIaCdPBF+quaTcBLjcF+6Ur/h2Z?=
 =?us-ascii?Q?hrzmg/hXHcb/8VXSPdBVQYSYvayT7psyFrb1iBrF4ifeKL/9m5UmoMO/ttX1?=
 =?us-ascii?Q?4FbKSzOdI3cBZzNqAOKmiQAJ3VhAbhB4PtLAfQo0r2YXvlK7TD2i6AGZGgk9?=
 =?us-ascii?Q?YvpNaoYTtehdtjnWeWp+G7UCcEMpY8+SyvPJ47CfrHOnZ1rfahVUWeUfvWq8?=
 =?us-ascii?Q?ox4+/d6ICUPuFw7eRRx6CvMxxVyZdTvedZDSLDP8b4fqyiDx6jaulF0e1F2K?=
 =?us-ascii?Q?dqJZjMTkqfTWaWtx7UGF7JX0PWnz0KkntU8shm7jfMwxnaw1+rEijcPEQgbT?=
 =?us-ascii?Q?JnZ7BcDT1tbDaOnOzDXAfAfQ7PPqZ5Z6BcFNYmdUEl0p2OdLqAO7ssvuxarS?=
 =?us-ascii?Q?DnUxhSn4KGPreTOIzUpgwy1V/GpGuim0qJRf4I+KxyKd+iJLriYIHHZZJ62O?=
 =?us-ascii?Q?Z60Aqe6Gnn0+6A7vGhG+xJbM6uQ0qq1FECCfCtgzMTqXJQGHyAVAz7YthS7t?=
 =?us-ascii?Q?8QOop0WIAgZvcJs8D6SW2M65w6mUdXEOkKwIe6a0xg64gY57e9F6dsyo3wtq?=
 =?us-ascii?Q?57Ivf4Pn4MkbYBQU0WRmpPEGhDmmoo/JoHjs3cj5UyLJ+ErVk9+uWwhg2aUW?=
 =?us-ascii?Q?2osf79Q9xKajnnxji93MN4PVeC78N74jkMGZ69yab4YYOrI1MIcLrOy8fbmR?=
 =?us-ascii?Q?14S59AgrpDiQ2amgfUVqn3D5eaMGVn7HXzQLptLNZKWS/GkFRfnfAJcnzeYd?=
 =?us-ascii?Q?MJCr3tvBCqfquURkCVRvCreFjym+uLaDtzKXH87DdkhT0yMrDOvYO6nxNvCx?=
 =?us-ascii?Q?0fPxOPqL32giC7R1P5dSgYeJ+DyktRMpb7TvlRCybJjS2viIzeKqYYBakNx2?=
 =?us-ascii?Q?ESuQ1bBE/z2So5MsnZmK+vWi7aiXzCUay404LW2OltzxoStT9PVcFsqHsSUn?=
 =?us-ascii?Q?1G1EoV2+DN2TN1v7OcLKhOdlAbsaIHTDP6dfcbbCChnkB4lGQmi8hLnpp/Mz?=
 =?us-ascii?Q?65/VHGJAGQktiEgU4eEV/hmWyJKXZYhkVqGcjqY2hpz8jkQHE/CcQwHF9MSf?=
 =?us-ascii?Q?UYzR+KSoqTIZs8f0hBCqpkB8+kTdjmmLgVzy7oav?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eebc801-a243-418f-6dce-08ddebbe3099
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:20:25.2012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zot8uoa2yn+Wap2a+jNxokIDYOGOfzA+jQBfc/XeOlKSBLDC39c3uiX2rSGErsxBwEhKue8Eya901q87V5esIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_072032_378789_3E7F882B 
X-CRM114-Status: GOOD (  18.07  )
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

On Thu, Sep 04, 2025 at 04:36:48PM +0800, Peng Fan wrote:
> gpiod_set_value_cansleep might return failure, propagate the return value
> of gpiod_set_value_cansleep to parent.

Nit: require "()" for function. gpiod_set_value_cansleep().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/phy/phy-can-transceiver.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-transceiver.c
> index b7d75a78d9242e2003660a87d2d4c9f784aea523..ccb29e1dfe0d07005b4bcd8fefa2787292d921a0 100644
> --- a/drivers/phy/phy-can-transceiver.c
> +++ b/drivers/phy/phy-can-transceiver.c
> @@ -46,23 +46,32 @@ static int can_transceiver_phy_power_on(struct phy *phy)
>  			return ret;
>  		}
>  	}
> -	gpiod_set_value_cansleep(can_transceiver_phy->standby_gpio, 0);
> -	gpiod_set_value_cansleep(can_transceiver_phy->enable_gpio, 1);
>
> -	return 0;
> +	ret = gpiod_set_value_cansleep(can_transceiver_phy->standby_gpio, 0);
> +	if (ret)
> +		return ret;
> +
> +	return gpiod_set_value_cansleep(can_transceiver_phy->enable_gpio, 1);
>  }
>
>  /* Power off function */
>  static int can_transceiver_phy_power_off(struct phy *phy)
>  {
>  	struct can_transceiver_phy *can_transceiver_phy = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = gpiod_set_value_cansleep(can_transceiver_phy->standby_gpio, 1);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpiod_set_value_cansleep(can_transceiver_phy->enable_gpio, 0);
> +	if (ret)
> +		return ret;
>
> -	gpiod_set_value_cansleep(can_transceiver_phy->standby_gpio, 1);
> -	gpiod_set_value_cansleep(can_transceiver_phy->enable_gpio, 0);
>  	if (can_transceiver_phy->priv->mux_state)
> -		mux_state_deselect(can_transceiver_phy->priv->mux_state);
> +		ret = mux_state_deselect(can_transceiver_phy->priv->mux_state);
>
> -	return 0;
> +	return ret;
>  }
>
>  static const struct phy_ops can_transceiver_phy_ops = {
>
> --
> 2.37.1
>

