Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C7CE69E8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 20:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EM7J18TNS4jIX3r7Waqpa/KAZoKkaFOBeHEkLktc0Aw=; b=SsDWf9YKW4+2h58fxhPUVuB7vT
	i+c8p8Jk7TXsaAY9aJNexNmpRe7sTK6yXrAhWVAYD0v6RSkVYZh2xhLsMJMoFt3bHDQCyZGY8JRNp
	bDeH/T1JpC15nIv3LvZI9tHKIUgTiUXRL+GJYMwuBenR/tatBHDxfBz7QEal1vVqwE0PsOHaS1zHJ
	iZemR23Z+bV7nqNjrrGWQOYBMB5AbxC2fX0R1fJ8XX1X68d/WQd+B9/YUzJJwrbfIxagDDczQCbmX
	XK6VFeTq00NQV7wrUw15BPYIB5oOx5kOnovvY6rSkmOO6j1GCluc7z0h/zrehLggk2xGK5puF8wj2
	pCc+ZTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tICxA-00000007PD4-3ZXy;
	Mon, 02 Dec 2024 20:23:32 +0000
Received: from mail-vi1eur02on2061f.outbound.protection.outlook.com ([2a01:111:f403:2607::61f] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tICw0-00000007P6T-20hu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 20:22:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T18RHMomNLK5+C8r/D5PcdGEBSsY+VlFgz5pnFt2PFH4jpOzW9uygtt5RleUKkbIYquOvGVKqa68Fny21xlZWD05/uPl7JCNzw/JoiDcHqBxBB+1B8VRoZDg8yTR+9k4NlJO8cAZtr00QnpxZtoODVM7UosNseqqF+Fyk8A1ZwOOZjUuBTeiOKQwzFuJU2loXOw6vbFU/imA2drj12FvrCKjRekJbAqllqz3K57J43uROD6fr6jMWXPYijDaK/ikGo8mvXW+lLrNfUDPYhJlqSnd21AxuUuzI5Y4Nh4fe40FkeWEUE/ywfQOB3deUgL1YngaGB6NfcZVJ14RvrHtag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EM7J18TNS4jIX3r7Waqpa/KAZoKkaFOBeHEkLktc0Aw=;
 b=wSBVrE5p68KfOcUewPXdJp/xprZIuTS8+sP9+FTuYeoOUBXULuTiS9zEQ0bxGi2acD8c92VfqwSZCW+cNYgJ7FMLDId+tNgmHi/GWjEhzFmYPYpKxOVg+REkzKHxng1KkXu++ecQ4fryn5u82e1/e6J4x6KJItai03ho13Y/fUZu2EQfzVj0ZhIwsGdc42rXegvCiEb56yoC7Az1buyJmAqu8hNcIgZhzcwV+OmnVr7cAKcXZTQQ1n3WdnaZC6yXiisCf1+w0dbHVbaOTfi37uVX5KFEaO3aRQnY8F8WpJZgIDpKFjw1wE+QKlzR6jL7AibdyC7c6D923wZ5kTrn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM7J18TNS4jIX3r7Waqpa/KAZoKkaFOBeHEkLktc0Aw=;
 b=DtVLRUET6rLGvlypMLAxxzMNtE2S1ajvtnuxoqBzVoc3q+l5AGJNW5MXVjTSu3nCWI37qwLsLczb8O3YE4kTzKIQHxSV3bF2HkA7a6FNACQR8UJsIU4msshujNsFWh+o+v19qnpRE87HlIntDXIdakpw+2jV4WcO5sXNC7y1BNgj/xblQaQKl4hnx793B+5fOPwfrWRkFkwhKKimuHAvEQUnAvBlcr+rgh0GwcEoIEGz8z9yONZKRPJ33s+fqn1LjLD66KahT8Vf3IEyv+CsGoqLXIoFRxBps6fTLmzva+3IekDrQHeR0xlMbikHzayWjMsUcgbJcgWS/MXwWXil7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7230.eurprd04.prod.outlook.com (2603:10a6:800:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 20:22:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 20:22:11 +0000
Date: Mon, 2 Dec 2024 15:21:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de,
	catalin.marinas@arm.com, will@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, joao.goncalves@toradex.com, marex@denx.de,
	hvilleneuve@dimonoff.com, hiago.franco@toradex.com,
	peng.fan@nxp.com, frieder.schrempf@kontron.de,
	alexander.stein@ew.tq-group.com, m.othacehe@gmail.com,
	mwalle@kernel.org, Max.Merchel@ew.tq-group.com,
	quic_bjorande@quicinc.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	arnd@arndb.de, nfraprado@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, ping.bai@nxp.com,
	ye.li@nxp.com, aisheng.dong@nxp.com, carlos.song@nxp.com
Subject: Re: [PATCH v3 0/4] Add i.MX91 platform support
Message-ID: <Z04W5chGq5TitB9f@lizhi-Precision-Tower-5810>
References: <20241120094945.3032663-1-pengfei.li_1@nxp.com>
 <Z01gfuVIIhl0rYwI@pengfei-OptiPlex-Tower-Plus-7010>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z01gfuVIIhl0rYwI@pengfei-OptiPlex-Tower-Plus-7010>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: ad52e275-31ce-475f-84c5-08dd130f006f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nVE4aEUr8yTU35HqKhSARgcEXLOf2pzuT7VlEhKLzzj8RxwddrmtTcxv/zgm?=
 =?us-ascii?Q?A1g2C6u2zfqZv5HPnUQTHxsIMj4hbDfiFZKzqKVvTJ4MatOQkkJBDBa4mgNj?=
 =?us-ascii?Q?8ve7IWzyxQp1GEIZ534QPujro9/Rh7WRnxakyr6R4rizLwFa4+VDpqs6u5Fi?=
 =?us-ascii?Q?CcDCwb2dCl3bl74Sz/jOcAu4Fvi0hRT3AEQK9rLGngvUlfzxZGpMn8U7sX4B?=
 =?us-ascii?Q?e7mAQnZPG7WIGYpyIXRpKDuT8VstOKUSdgj0JjkMOdQi+Q7aMLkmNm96Kdt2?=
 =?us-ascii?Q?XPN6y+3Swm8BkTL+qqiyqnYWvUsjtty6B2vyNVFZWz480t1gojpQ97/+9Euj?=
 =?us-ascii?Q?n1k+Y9tBsLC4CYVxPBgz2FgnNxQiOm3WLKUUKE3gq+npN6tkShBmWxbbN/di?=
 =?us-ascii?Q?Mlc5uLanxuEgehTtwGsrEMdyxCsTz9kpjIuZCKn2Jj5XEergFNlNclFDYhxh?=
 =?us-ascii?Q?0l4NUM1Izh7cTbJbh2E3pW7ZhjBoVPpNPogTPAMhBZl02VZiCAtFGrdJkVL0?=
 =?us-ascii?Q?BTwHaC5r6ZebWj0P4O6snznGLcu2htZh0dwbBbKP7k7P0xoNjworIrIfsaGz?=
 =?us-ascii?Q?DZ+BXWohv2arV9Q9irmOOYWAPinF13HLQoy+EbVFJPIthTyKQbUcbv6+FpyU?=
 =?us-ascii?Q?FltnrQ6hUiOuHV7p1r2hwVuMOzvgX9Ch9BCoTDb8npegBkFuqCq40A9d3PWC?=
 =?us-ascii?Q?AJXFfIRPoO2sHVK2lPJ808WCRrR29qJOMeoWym8zgTFIDtyQGmzW/pZep0Rv?=
 =?us-ascii?Q?bNekkE9HksksvjzSpOTOxrJhF6p5FErCewMqSdo6vJLYv+vo34jHj4j/JNqk?=
 =?us-ascii?Q?CBrZiDMFhbQJAiBl3Fy95cWfWh7ScopT9IHxdsQYLHIs3lK1vUsZSe/kcHF8?=
 =?us-ascii?Q?9p4GM2UL4CZjLy4cmko7pUNC3pMw1PnVj18+K20do6K6PN75jfhTFHg15roT?=
 =?us-ascii?Q?iRt3Z2t0OOrvLd9nHjKpWT+sqi7cC8Kxh3skthIO5WWR+GJ/9Wrh23zSEyqD?=
 =?us-ascii?Q?xCAZ80Du2XqBJCqBCpebQc/QgbHwqen2GD2ghRGnTg9d/vf1buqPBYnEMm7w?=
 =?us-ascii?Q?wt9Q5nnoanEuZEHFSV9sOLOO70p76pmJe1NiXqU5tP3IM/qQXE5vDeBrze6k?=
 =?us-ascii?Q?IauKJOrCLHCFHiDb75PIj3JDXeWdXI29R9SFRHVOG5WI9UHeHTghIsjs+NGx?=
 =?us-ascii?Q?YPZLvfsCMv493C3r3/5ZrZOUVAaQFCtZhKT2whiNVId3f1zIsy7scEf1Gsn+?=
 =?us-ascii?Q?83/nS9aHT9LgIgJaCi31Sx8XEZ7cgP1r98bbz6xBrxcP1Z+xlnfOW4o8IjWB?=
 =?us-ascii?Q?tNXfCIUrz/bvdGGFPaMVqyIk3OH36tS41EMcdhQLTxCjEa6ZwJnQHBlVykDu?=
 =?us-ascii?Q?NUoSoD6a7jhRxrFmeAjSWsLfab1EF35iR/074WQJhwOG5KZSKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1aMxOZbrJcXfHT5e7CD9ENRl5xygoP+cxNkUoIqPtk87JXWJVsYVcRT3b4VK?=
 =?us-ascii?Q?dJsltWykDlb3w9c+ZJTmvGJ89pFCmwBhlBwB/PITrEl7wIWUqYEMu4GXjTaK?=
 =?us-ascii?Q?FK/q7JdvHhffE+BxJvaLyu3QaHKRv6W52SSDCxiiwc+96U+JLZnaIyxuUqCx?=
 =?us-ascii?Q?kX8QkRoyVcXO1xbeCEvicerUZYLveHXC7WHLAbqL985pNjirWGfaTQ/PYnuf?=
 =?us-ascii?Q?IuN1DZP0Ve0lgF9pRbOzmfCoeBJDBCrGJnY1tVL93ZK7sSLoa7MhyXGtQ+K1?=
 =?us-ascii?Q?xiH2/jKK+wyxBi+Vuy8Qer7edPQjt/8JYhlEA1QkEbauSPiSDhDuitDWi66/?=
 =?us-ascii?Q?WinzWpNuInJnda0zq7AJ8A9gT7GqepedNvdO6lrlTl7e+CgagGPmY0mFC1U0?=
 =?us-ascii?Q?WnQ++JB2lycugPS85aOho392IKDmtmhgLTdDmG2XumHD5bkQYROuFYHpcTQ3?=
 =?us-ascii?Q?Tzg1G4hxJb5nszGYx7ArByi0j/TuNA60K3F3sIxVRx5WkdSBiV4ZUzI3kX/G?=
 =?us-ascii?Q?3CZqxQr1uNQeiN7m5nLW2NyZ13zAMUQN6DyM/nmxR2fpHVhAwwScZRwx5Gdt?=
 =?us-ascii?Q?+ex3GXYO3S68rvdDTPTaquHYNPW888UYVjDMH2r8d0YyaTVSGZiz0z3dbYi+?=
 =?us-ascii?Q?MWctm6CROGld+DzQp3D/VvFcP1sC8RahNLu7FeHzsj6bngr3YQ/K/EVMU/rd?=
 =?us-ascii?Q?L/NKxlzawLSa1utyJFWkOjHnEvrntEejy8dlbJWhgK2f56x3YX4YuNyebu3L?=
 =?us-ascii?Q?M0MIqE0R+yHuLehlY2FJXuVdD9TGtL6HHaU3F8Uo1ivat2KeRv6vHgx6+u23?=
 =?us-ascii?Q?eNi/5aOcPmKHKchuvh0gKD4ESsy0gL+CyO4ZL2rlrtKBCkAmFz/0kT1LyHwq?=
 =?us-ascii?Q?kOewwLX3g2uZN5WV25w3yrNUg2FQMUlGYRGV21iNEPGwds+E3z0ADHPOk+IY?=
 =?us-ascii?Q?watjjlY/Y3fG36gHHUxOOiMD3mZ/PJ7g4ywQTUSzYyKH5sMP+ZEZpQDd1kEV?=
 =?us-ascii?Q?VOp6jtBYEkqq8vnBYI3WHHWY0q36n3sJuN9B8VnAoIAjJ6Sjr29wSn8J1B99?=
 =?us-ascii?Q?uwq7cL3+S55FBvTMoFrsvFfnhJLyd7JPEwab0lQkpwRp/v4zBQzDaa5PF8nI?=
 =?us-ascii?Q?uATDmni3FLbO9KPAYAWK2OrEdDqxrpZ4DUOF9aAbsMAauowABflhlEqAk8oM?=
 =?us-ascii?Q?m4gl+cz/Zdkhq0ticUrZZuyMIaT3eoAky1/Lxdx7Pg78T5YzhOtJKJ7SdZLz?=
 =?us-ascii?Q?bbPWzvcPHvuu5HEZjLLR+EevtgwhqBf7+8oWjiMHROp0Z+rC7gNs2PzIcxC+?=
 =?us-ascii?Q?AfAX+GjVYAXzJJmBK78dASMf6sZzAt6aEitfiEPEp5oPZASPjdwS/xGRP2Nq?=
 =?us-ascii?Q?+i0muWS499HST46CNQDe9FuCVWf/Dri14e9x2qTGbXzdH2j5G9oV9lr3ff0K?=
 =?us-ascii?Q?KcOidSggVYzjasWCWtYIpI9pqLsDJ8nvm10RdvAJ17OWL7mRswNouWQbBaRA?=
 =?us-ascii?Q?sY0E1WEZZUCKLo0UnWYwyXcyr8K2gDo7+fsy2cNp0CsiitZo2w+zqI0s3dJ3?=
 =?us-ascii?Q?Xew/ncTfBacYorSCHsjVwDHUF3LT56vGLmi6K7ek?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad52e275-31ce-475f-84c5-08dd130f006f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 20:22:11.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dswn9ToAiPu0yC3KMr77Gcya+rG75AzrWP4ya5QkKVy/CH8rzXTaMpY+hYl9wv9U3CdYLdD7r7PpIwjyG+9cLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_122220_545915_FC8D952A 
X-CRM114-Status: GOOD (  21.61  )
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

On Mon, Dec 02, 2024 at 03:24:44PM +0800, Pengfei Li wrote:
> On Wed, Nov 20, 2024 at 05:49:41PM +0800, Pengfei Li wrote:
> > The design of the i.MX91 platform is very similar to i.MX93.
> > The mainly difference between i.MX91 and i.MX93 is as follows:
> > - i.MX91 removed some clocks and modified the names of some clocks.
> > - i.MX91 only has one A core
> > - i.MX91 has different pinmux
> >
> > Therefore, i.MX91 can reuse i.MX93 dtsi.
> >
> > ---
> > Change for v3:
> > - Add Conor's ack on patch #1
> > - format imx91-11x11-evk.dts with the dt-format tool
> > - add lpi2c1 node
> > - link to v2: https://lore.kernel.org/all/20241118051541.2621360-1-pengfei.li_1@nxp.com/
> >
> > Pengfei Li (4):
> >   dt-bindings: arm: fsl: Add i.MX91 11x11 evk board
> >   arm64: dts: freescale: Add i.MX91 dtsi support
> >   arm64: dts: freescale: Add i.MX91 11x11 EVK basic support
> >   arm64: defconfig: enable i.MX91 pinctrl
> >
> >  .../devicetree/bindings/arm/fsl.yaml          |   6 +
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../boot/dts/freescale/imx91-11x11-evk.dts    | 875 ++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx91-pinfunc.h | 770 +++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx91.dtsi      |  70 ++
> >  arch/arm64/configs/defconfig                  |   1 +
> >  6 files changed, 1723 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
> >
> > --
> > 2.34.1
> >
> >
>
> Hi Rob Herring,
>
> I haven't received any comments from others about this version of the patch set, is this patch set applicable?

Pengfei:

	Conor Dooley have acked binding patch. Wait for guo shawn pick up
these. v6.13-rc1 just create.

Frank


>
> BR,
> Pengfei Li
>

