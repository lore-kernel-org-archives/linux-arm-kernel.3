Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D289FCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 20:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJCu7BP7oNAwAWqWZKRWNgigdzLaQeOLs0hy0FjMFsk=; b=omwv0ZRullB30ytDRL6T2fw2/o
	umwNpUt+HlSkVkbtLbW95qx5dyMO+fZ2GGfbRkrKBGY73WK+VYhgoMP/AztmMeVVpkzOd4m2AqbLL
	PWMs8rYyS5uqXzjYKOfAZ9JD20NCrkwigSbutVHg5brjSQKLdVvP4a9KyvK+TuhfGxJmmb1p85Oky
	olRB5Aq7jIDxEdMKU9iV012rm/tl0YtSMSPDZBGadLm+myXkjBBfT0CS3CZqPDP/IKPReAy296SmL
	F5QRiROyYsfQfwQYzRk7v6O3ZDmAhOZRuRJIv83CdfGrbjzcAaWld9j6W1uXu6imy/u+o47jt0CNs
	NuGyufCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8Q1-0000000BXOJ-2yt2;
	Fri, 12 Jun 2026 20:23:57 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8Pz-0000000BXNm-10rj;
	Fri, 12 Jun 2026 20:23:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEvGgEJ6JDotx5te0cWEWYQt3BBIBsNQh29LnD9UqLJ5ovHJkSnE7Pd0ui01G6JjoN2s3A7aWFE1ms5hWTRxG6xv6n27lakJSDbTLPFyjdexc/un2tM7PsSXiGGJrRBt5NKYtEIeG3/wkMExpPuMpmBFh2+Uerqcd+MxAaZsDX3rKbVx4/QNUe8dK2yNfWteHuf0iyMavHgnLbBaQgg+/kgwGJfRYDxq5gbjpLid8DSWTk4tg02BSUTXNc/L/rCf4PSsUIzs4qILOeAo2m6USM+1PxN6x1Nq7vL7fpcUJG+WLMUQgW6oOjz5c8LvsP9+7us9fnvQRSVmV1kTFWSnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJCu7BP7oNAwAWqWZKRWNgigdzLaQeOLs0hy0FjMFsk=;
 b=UE4mFKlbk7Ve6RUMrAlvFqlxsF+AFg+DR+dCcDZWViIdl47F72DfvQswG9D85lFPPODSwwakOu6FGgzrLO2u642JdBTq0hhxlli44bwsLTmyUf7H4QOTcp3dI+cQaI8A5eJLPORgSm1Y99ESjSLWlRwNJxbDU296h+jTcd3vxdYVWsPXAAG1WkS7liyYb4IsByvoIDmaoPX8zgxjfnFRCCDqf7ksVeaql10fJq+MtcDXSOo1SY8nXrv5+99ljWhOZPjQf4MwPBvQ2DWFvpPyToB9dxVfhVm4gnLOw8MN2oIZnCzA0jgvRhQv5QlPcRI5Yc0rB2OMG/g4cYtgF13oUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJCu7BP7oNAwAWqWZKRWNgigdzLaQeOLs0hy0FjMFsk=;
 b=n9Z5NeOPXEZ9zn12NS4wwh2ml8BVVHH0ql00QNjBzFSRBolxJK9QQ1+iCtZghFOEjtT8ZaKKLbARaZz/9uX1J4H8LI+yoCoJ2JqfDhtAi+jW0wgo2bb/r5zrAe30HiZF8ILjC5wxdk/0wlLy84gg2G6ad5i0vws6BEE1GA+HYkpZtiENY3GoNYNTW1RsKUe5y2a1CvHD+s9iMBvlpj6a+mla2dQYOjhXTzdvAeF7UJOxfOd0QMV/xNIbm00Fg51nnQa7mnDaF9iuFTBoajS9l8QJ7AVMNc/wVWZ872Om164VkP+JkWqsyYPlBD8Nm6ovuAkYssMGcxkFOrXf2e3Lcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 20:23:46 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 20:23:46 +0000
Date: Fri, 12 Jun 2026 23:23:42 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 phy-next 6/8] dt-bindings: fsl: layerscape-dcfg:
 define DCFG_DCSR region
Message-ID: <20260612202342.c2suvscqkpkkixro@skbuf>
References: <20260611193940.44416-1-vladimir.oltean@nxp.com>
 <20260611193940.44416-7-vladimir.oltean@nxp.com>
 <20260612-graveyard-hacked-c65d54a1ece8@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-graveyard-hacked-c65d54a1ece8@spud>
X-ClientProxiedBy: VIXP296CA0012.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::6) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac43c88-c0a4-4029-1f0c-08dec8c08128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|10070799003|376014|7416014|56012099006|4143699003|11063799006|5023799004|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WsZQwnzvIFIzOz2wOPG4uwbSUxi5n41vW/zJYKr5lDqk/VL1gBLVknaPfqwxNOp4l4Yxfy5tRIzKl2SxAZ8HbdzyJFi2OQQBrqhxZo1im9i1d5D0NNF3G0F+jvEciN7NmrSt7ILXw5ElbO7wIdo89yPR//S0LCBBJVMt+CACmlwvNMiuDOCLsDGjVBOxCAzKLxZf9+EMrogfh3koZ5b5iHLnbRmvKBpKygdozDV4jH1uJR3J3Fp2Fy+25cG0o+lcPxzidzH3boeDUKqeQcUrSDKESOCAKlFO1dc8Xc3kCsRExCd4aiqoej0gmUZaKncieAXwN17Qe984nzg/GMZWSnAA4hd75t2434O9Sc2LLTDBt1gbzbo2y6yNHRFixv02BSufloWhZsqgMs+6S5TpVtkNsk4iemGQSH64EizstvFdLcOwPLRfG3IDFxqEvN+3uL5mMf+AFEOg/hb4J7lfr7gNH0eWu3/0DtEMah5A98Q9zmjo9ULU4dys3BbfGX5he5lvLkgp9xBbMOIrTODqfLVOzlG5LLZsUkOUS4XUYxrbseMoyYSRmP6SJmN60f+0E7BpoHUWMk9YORHT+v0fLWBQLZcvBkKSLqcOpAuE6GSv2yfOp/KYsMDP6wohGl4Xk9OIfFGQThrO0onuv7eTtFbVXhhEqVzTs1YQkPWS+wNVtuZ6EQHEcT8flq3Ad0g2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(10070799003)(376014)(7416014)(56012099006)(4143699003)(11063799006)(5023799004)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PgkWDfBR24NLsIIQIu1Nu7VUoe8IwhAfYi2fCkk5w1PQ/VZBVp0W1BrJQgLq?=
 =?us-ascii?Q?rZnjItOf/nqBBhViFYUUfJzHDKw8ck6Yl2qQyUE6x8DyYi7l87NXzLY9Enhj?=
 =?us-ascii?Q?e47w4iLKFl0+QnjZjKQvBIqa42Ni+KzCqpChjSc4t/PROInc8fbECAqjn+pV?=
 =?us-ascii?Q?uG0JXnyuJKUw6WUF2j0w9t2xThTwAxeW0oFrNkac8KcwCkZjLEW7MPglTiHd?=
 =?us-ascii?Q?u+oiEoqzYb+QC5WcY7XU38OC2xTLBesrKV/res+La2sXjp8PDDTrxuXHvpFc?=
 =?us-ascii?Q?p4fK8MvJPWqZxVnxMECBk0boapBG0vMK2zF16WiRRgtdFZHk9Tpt83X2xv9d?=
 =?us-ascii?Q?kJkZUu3BaFHDxPleECYY7mZ+wm1YF4lAcl0dI9lDddNXUT7UW8VFYdIL5XDg?=
 =?us-ascii?Q?l8i55DBD3PDHch50wRCzvgOL+mkXtqZ3BX0ARxbDINwFRJaD2EJxWMVfeskf?=
 =?us-ascii?Q?ayYtRI7j8wmjrmvU+gI+LzCOTdSNxfUbODHRcn1TMcBu16EKdNcQc9LAy5Fw?=
 =?us-ascii?Q?lZyKnvmo2WwjnrmouijgszawGpfUixdnNc/9DLElpqeXQq2/Q0cGb/3Zt++J?=
 =?us-ascii?Q?vjloGGB9MQ8xMkrtmxMGMjDcBT3QqeCe/nNz/1lxIIOLis3d5geV8SYuLE9Q?=
 =?us-ascii?Q?EeNEgBqlDHOOqdzaK0AqbcES/L1yUEGNO2HprcFpSUTCqzGEIZy0YUf0cdTG?=
 =?us-ascii?Q?2U41Uqwoy6i0d4qJRfgUTzY43/KE+rJSELS8U7huhRquZ6Wm926USM64GFaZ?=
 =?us-ascii?Q?pgypG7BbA+PrTkdrjJXDYwtLmlmpUsQ6bwR37q7V0qiQrgyn8RSAcWvghKN1?=
 =?us-ascii?Q?zEBxjg+HTw0aTWdFpcL7hY0dOaJOlaaoROYzfRjoj2o5Uapr6RSgGeSuGLpB?=
 =?us-ascii?Q?vCqI4Rleji2ZAVzGjsv4FY8gWVG0c0enj9mhDSj91w5pEp8Vl0U9UP/TAhXb?=
 =?us-ascii?Q?su9QLUJBPwY6crqLTVJNdS+00lSDlnHK1/47UzAI6HZ+QUH3U+fqDWoE5zaf?=
 =?us-ascii?Q?WncwneLNVCzWTVKZ/pP8TWc453rNbPFQc7rDkGOB9g9Hoo/9KbIfJutQ9gik?=
 =?us-ascii?Q?2Kd2M5jLtA0+ociCVSx+SrBukobOzF4nS9pkYG+05VT1OtL1TsM28SrbArnV?=
 =?us-ascii?Q?j/lcqgePLVAB8Ot6HGenrVfLUgTbGLl9dM5uwJczig2X55JfbrVAyBNF7DR5?=
 =?us-ascii?Q?L5n0QgiAP629YivGDcRpU9eToJgaKPSni+m7nyVs+8xR9RaHGo79aPpIBdEB?=
 =?us-ascii?Q?KhDuXI4MwVyl6+tOzP6yY0XOuAZYlB7kbEfWe16Fuo7sa1tgQagszJMFS+fu?=
 =?us-ascii?Q?9veO6K9tpW+IREd0KMs4tgValGwM+VqFB+MP4m/LnuZaie1C3qsfS0/xYLnh?=
 =?us-ascii?Q?pSIoX7lJFSn3Wt/hvL94K5Gr9uZMtokUIFQY7sSSl9C0CIF3XZw/jW1zWNI/?=
 =?us-ascii?Q?cwIi7zygQMz10JflDTYebWVN12ZEMkvkVbvVgKUn11b/vw/EhyP6igwJca2G?=
 =?us-ascii?Q?XUr0yeiP6sQyz58Fppio2HhKaEe6zvLtFWHl/3enSXFLnuGZpBD475D7J1U4?=
 =?us-ascii?Q?QTwACK5pYiz+L4HS/bmrn5dWuvfIFpTmxnbgf9jtWrRL0qoO8PsD89ONPuCB?=
 =?us-ascii?Q?srk1PEjIWb9ddRdHvatJqWhQtdGjeMymT42PNfRBsXXl1fGRfo6MyIsf+vxw?=
 =?us-ascii?Q?80bzgl37P9CKAnHGPqXbvFAiNA0ARtmWk9ApzEzw/f0Z+KDHq8tdN/9OiCzp?=
 =?us-ascii?Q?6R7/Xjz69P7NnMlbk7YfrGQ5o6jLuaxEpVB++LsK7xe+ym5aRedGSGvoZCfR?=
X-MS-Exchange-AntiSpam-MessageData-1: TxE2rzhpfRHmyA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac43c88-c0a4-4029-1f0c-08dec8c08128
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 20:23:46.1010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldnRmx5w/VAZOesLs6UJA0upR5WWW9HBBpGMRjeTCX5oiP8DkgRpWbzb3mL5XEeg1ieMFs7oiKpNe+4pdWjBOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_132355_322737_2AA6E9BC 
X-CRM114-Status: GOOD (  28.07  )
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

On Fri, Jun 12, 2026 at 04:44:00PM +0100, Conor Dooley wrote:
> On Thu, Jun 11, 2026 at 10:39:38PM +0300, Vladimir Oltean wrote:
> > In Layerscape (Arm) and QorIQ (PowerPC) devices, hardware peripherals
> > are accessed by the CPU through a portion of the SoC address space
> > called CCSR ("Configuration, Control, and Status Registers"). All
> > hardware IP blocks have their registers mapped here, and the Device
> > Configuration block makes no exception.
> > 
> > However, there exists a secondary range of the address space named DCSR
> > ("Debug Control and Status Registers") which, like CCSR, also holds
> > registers of hardware IP blocks, except the DCSR contents is hidden in
> > all public reference manuals.
> > 
> > The intention of the CCSR/DCSR split, to the best of my knowledge, was
> > to place the functionality that is too low level for normal use, and
> > which is necessary only for debug, in a completely separate address
> > space which can be hidden.
> > 
> > A use case has appeared where networking SerDes lanes need to be
> > reconfigured at runtime for a different protocol (example: 10GBase-R to
> > SGMII), and the architecture of the SoCs does not normally permit that.
> > The Reset Configuration Word (RCW) is a data structure read by the SoC
> > preboot loader (PBL) which contains stuff like pinmuxing and SerDes
> > protocol mapping for each lane.
> > 
> > The RCW that the PBL has loaded is visible in the DCFG block's normal
> > status registers (from CCSR), as read only. Turns out, the RCW is also
> > mapped in the DCFG's shadow register map (in DCSR), in a write-only
> > form. Writing to the RCW registers from the DCFG's DCSR space to change
> > what the PBL has loaded is called "RCW override".
> > 
> > It has been validated that the RCW override procedure is necessary to
> > reconfigure the networking data path when a SerDes lane performs a major
> > protocol change. It changes some internal muxes which connect the PCS to
> > either the 10G MAC or to the 1G MAC.
> > 
> > Defining the DCSR area of the DCFG as a secondary 'reg' array element
> > allows operating systems to perform RCW overrides. Since it is
> > introduced late in the binding's lifetime, it is optional. It can be
> > identified by name, but also by index (first 'reg' is CCSR).
> > 
> > Note that while all SoCs should have a DCFG register block in DCSR, we
> > only need to expose it for the SoCs where the RCW override procedure is
> > known to be needed and has been validated.
> > 
> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > ---
> > Cc: Conor Dooley <conor@kernel.org>
> 
> Where did this email come from btw? get_maintainer.pl result should have
> +dt in it.

Historical data. I am keeping all sorts of commands (here git send-email)
in *.txt files and that's where I got the stale email addresses from.
Krzysztof's is also bouncing. Will fix for v2.

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Thanks for the review!

