Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A18CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 11:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npc2tRk1miYC8CWATwY37tYhMrC85aM4Yv87ceV/RiM=; b=mSqdQCSUVMQVrOh1w+goet+Bqw
	lEZBRGQZa2jINmta/MJ8PuOySExPlubiKnzeRastyUSYPFwom+R2jg0HQd0+bnTEMgkPl0yAalz7K
	Boo8jY5BXS39mJPSZSQ+V2WALK4ZFKyZHVxZRBB+IVY1KAyH/1XSuCPG/qQ8PVBDPqVUR1B7A/RUE
	ZErUWsgdbKCMUwWWwC4YXwKYOxe0weQL0WtGUNO7BNdr7s1O7RbU1gy9i6v8cX37a1LKtqyZRzO9R
	0qQIVei4dyUAQvIu0cESmUBFpKgimDmkRr3+VuLZeLetadwu+W5AXmLMDQzmHsnbLWHia8PkAhtrN
	irSGkypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXwr-00000003Ovn-270M;
	Mon, 08 Jun 2026 11:15:17 +0000
Received: from mail-westeuropeazon11010040.outbound.protection.outlook.com ([52.101.69.40] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXwp-00000003OuI-0pdh;
	Mon, 08 Jun 2026 11:15:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7eL6WucqHzKmvhcRq8ebV9BiH5EQ5jabSjVA/IKjCok4a0ln0qxFZ3EXnRieemS/RiTlue5mYiDxMLFNco4VvVXeZ1/S8/uxvbjOoj+lfl5gBCqAbwqrIVqz5o2YKm9PqLa5wl/cO0uZ/OJvxj5QAmIAucX/INo8jqF/jXF357FBzYq/MOwTppZ/JFN9g9Wt+NCQ3gH/4TlWfaSzdmByTquD/GpI0gTtfrwAPfEadd9nr1qj/uG+ggZeWE9MJsPx0lOOmBsOqMwFGuhSFN9Uhv2LL9JUl7ZYalQdh39snS1f6/4VjeW9+x29hfhTkfxTOA+E+6aNe0hiUk+my+sEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npc2tRk1miYC8CWATwY37tYhMrC85aM4Yv87ceV/RiM=;
 b=L471HvsSGpbImm7+Cpg6gdkH3eN2yFuwysmC28mIZSCUHlEDYAy5J9nvhD9ZrMfKWcrsE4cXrdrS9/1Eu/FfREg4k0rMZoXtUS/xgdpdq4UMoe9bNgFhXCUtPC21w+eIonapYhLmgkq3tdMzDoB2/YUOfyKFwIabSqolsCI8BgOzkipzoyUnd9eWg+JE31YzoVTWMRLA0IWQQhOHrQZXguk6IcitdUWVZq3uffAovjdeRdmz1c5EzUjGqp3fZ7NpcxyynPltWy8okrMslII6iIWSEIzwlaIinoaWGaf5AX6ISjNlBV97tTWSmQgdU55Ro044MrdK+azlQ5UbcMgRpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npc2tRk1miYC8CWATwY37tYhMrC85aM4Yv87ceV/RiM=;
 b=Eo0SH7rEO03P4FCWwR0IsQSrs6G6Y5vsivWaR76rhgsBxKD/xdlSd/gESRc8nYXLstiwBtB6BirOxmH+jAIxwhSUuw642wk/PtWtUTY3fkWQ/xfDntza8SgJFJEPWY0rc87B9CbT5hmrmZ3lZZ4YuhkwC1LRjuLG/8gIfZT2BPLpCfWOfSzWvzPB66ruG+1w8htVXSyVV8tyhOKud3cKrvy01zEjLbJJqDRGxtwBq5Y1Rmli/T0dYk2gJjOslJKFkz8aSKdt5ewCBC5pfaWRGFd3Ss/T6d1PYbghxZuL5IA/cQqh9PJdGztAiyFh2Rycgt+EV6oy8IOa0Y8w4+yt3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 11:15:07 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:15:07 +0000
Date: Mon, 8 Jun 2026 19:14:03 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v4 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <tnspfyzela6xjtjxchhr5wlmc4zbjgxp77itvmeopa4547l6ja@mrsqvuekdiuq>
References: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
 <20260605-imx8mp-usb-phy-improvement-v4-3-b2ddf2f3862c@nxp.com>
 <aiLn81lg32BPDZVp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiLn81lg32BPDZVp@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AM8P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::6) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM9PR04MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: d9693ef3-5169-478f-395a-08dec54f3247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|56012099006|3023799007|11063799006|4143699003|18002099003|22082099003|27256017;
X-Microsoft-Antispam-Message-Info: FP2v3C1r1WGRXU67pDgGr+BpxzJhuMJllokWnbb4/7WqClnp/lqs3QXXgEiUYSjiIwveXG3CfZAJ0YReVo3VvVDCcID1hxyhZFpUb+Lo/9+0wpo89gfzoOil6CGu1VInY0sdpmllXSGJjDaSiw4Q6IjWPI0Q3KIYy5v+53kRUj8NCLTRCYRoCeLoaztF6KisK/4eIcy8bSmfqPzmJ0NmJ0yTCjXUtMkXbHv1CsOKZ7QImj9qtaLPOCAQk8/1wS5MiNAp8ZB2nnJTsXOTj/F2nqH+Jq9LYD2V/Opo2dx4CKx7bU7fnnTKQq3n0VsNL0CsXX2AIPgKbtWhLB3gb2W5iTPsfw93yFSYTkX9Zf1hR9HoSrzwmXo7237Y/FErg3zA0uyZG9VTjtG0JCKfUZ27UZ5ThgRue73QUrBbem4zD6KLjBrnq7CYKla1ZstGMHYrB4wyBOS8Gv0VMKWi5+WJyGqbCy9DPe4I7XpELgsrN8Og9OIBZfP6E5molhnfTj1Q9GNn0kyEL5rdI93wcRRR2dDnjTfvT5ZKx5it+QdCkqR8RoupNGua5h9X5NIb8Cd9DzgfEyQQdQSsnXH93Idgs/QOBxkRSdyT5xMQkAlG7843d8s3ZNCDWAO28pEE5mYTgz15VAsUbv97xJwmlzGhkjE4TD6mpfZML6uEmbkg2dFXtX9+2W0zBUiGijynXXMQ2tb/fIP3QEQ8AuLH9zRptctv5jqHR4xaL9Z0SbK8yPHbSl9vZl0tAmXAIp0ZRltH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(56012099006)(3023799007)(11063799006)(4143699003)(18002099003)(22082099003)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6gEuVW6Tognt1jH3JBYUc1iJ5xrulfe0jR0ZV3crKrzg5BLEqPqT0G7CsLC9?=
 =?us-ascii?Q?XdJO5MPzSJM0QIrG/oPvFlJPbc7w6rqdbzCqEDuM20Ak34phvTX0LAC2OXu4?=
 =?us-ascii?Q?f4JE2CdZdbwhStUy79cTIFdJN0133TvEyNQws9u9rO2PFGKoYkjc8/ECbJ3E?=
 =?us-ascii?Q?I3C0NxmZjl23gCDqXypn2H/wgevdUzApSwel1UleUR/CY7TUC5ecVqIZxoYr?=
 =?us-ascii?Q?+aAPyYRPoI10dQcqzFg59KNg9xUHUkodPUpTccPNjtCJNRKmdFwC5ApyS8vx?=
 =?us-ascii?Q?2TaFSacUT5vWoSwRLPqIp2Rsz3biE6rKCZDMUs6TKLGBogX4PTQvL/zzTuEj?=
 =?us-ascii?Q?hpt7ihL3fr/BxAUqSzyH9PGXxX+6gCnwOtiC5k5Ae+IiFErSjUUxEA9aDQDF?=
 =?us-ascii?Q?yyNm5CktJyGKKlnY4B9HaYo8+0PuaOo7QQSoRzEKoTwoDCOABY78+ii6tjVG?=
 =?us-ascii?Q?E8CFl+i7T6edwcXgyCcy87xXRwbu9qpywKVB6mEM1Ihv8WUpHRCEAu9oRV5z?=
 =?us-ascii?Q?22QXPpdl2B5momxSSM1F0Agz+BjEbkPpgfi1KRQR1HxLT4JUP4Y/bAcBIJL/?=
 =?us-ascii?Q?cVK6a2xF+i1IAeyM9tiAkKSZrNQbzPCUYK/MRAIhLZ9rWSQtsD0QIbRC7bwX?=
 =?us-ascii?Q?vuFFc0b+zPwlRcw+XysYqmw26A4Ubx/x+AQ6vfDyJlEfcCAVcFym/RN5NCrP?=
 =?us-ascii?Q?x3B4tZCBsAVrjF8ZcbhZHavgFJdcHt4Q8H19sGyN1gbHP3KuNId7u6I7qVfQ?=
 =?us-ascii?Q?5JbDHgCxWlah/3qBHsMmEeDnLWZDI5K2sTKy1dpxseXofa35z1MmG8XKLEhL?=
 =?us-ascii?Q?k7/aQQJBiWZ935gacbT0m51HhLYPTReSWpFb+5iM1w3yPCmas372goBENYIZ?=
 =?us-ascii?Q?cSuatyE7ZMAtC8nx31/ZIjIry/dwwwVYvurSvK6qmcGihqW7kpvHWbr5lcGv?=
 =?us-ascii?Q?ZI26+zpQicEBhP0H4Q7/5SHqyzJTE3V6yPebBfULa+lEcXrKrZ/C7FcFBq/g?=
 =?us-ascii?Q?zxFYPu8hT51zcu7flXGAogsHRReCV8WqVCTYIb/QWFJW8gBmiZONTaTq/99z?=
 =?us-ascii?Q?ZU9agYWq/1un+yAKvFRUJnPPkBI4iHgc6ShHO/c2LhDYdRGn/rkxNHnEhcBC?=
 =?us-ascii?Q?IhUKHdVb+7ZfOg1hwaWgSLYYuDy5AvtrSjhpI7iHOBoJ9dD/3PmskpDBLmvy?=
 =?us-ascii?Q?GXC8mIUBiFd+pSWyAQCUWpbnSTrQKkmfFXPksM+aA3+Aq0jOxHWuGS+XUKNd?=
 =?us-ascii?Q?BTrCFtExelpdBY1IVR6DKAAoDBsk4RaR+VrhR/YTUt8zb8dDwnUbYr+uhpeR?=
 =?us-ascii?Q?d7XqYucqnGv95qNqUKU9Pih3hIwifKlfjE0WjhT0Df0iH0EnJisOTGMrPhpm?=
 =?us-ascii?Q?JbuJJwHW3QxErPkWuB+uYDhgdgS6rbNEfoIAtm/JilHIE9e7gCLtdQ1nlQ9u?=
 =?us-ascii?Q?sKfFqOUcNCgwPbneg2LWn6b07ZD/y5ECN25ql1tbtp/Q3RBk+bhMhdw2BX3h?=
 =?us-ascii?Q?jFfWghyLYN4ELCqNYG88/gkH6X25JQm7VtjJxunbwViX7OP0Di0gR6b51/z/?=
 =?us-ascii?Q?hLfrobbT2TwWa5wcTcr01E1YnJFRq2phNs6mhCoUJE7JzFcNWIn4XG3lE7VL?=
 =?us-ascii?Q?RBWGXAHmWx0yuNQCZWtkaDXMKQff7NvPfksqWPtO/bAONmuvq9O9ttJpUywV?=
 =?us-ascii?Q?Hg5uoO8P6gEN7271DOFmchs2K7dnv3UIi8CgWW5gueylunSZJC73urVebzKJ?=
 =?us-ascii?Q?yxorFAbeYH5Ibp7CkiSffyq3SsYuZAVdKkELzgqz6lXhY8swEzoJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9693ef3-5169-478f-395a-08dec54f3247
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 11:15:07.2585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rR5/ftFrFevHMXD92jsbIbyNac3apn8So+yBLgzUHo7XUapWP2QlROngAeEdqFP/YdLa4sqg5swEhAUgvfEVKCASNsCPCrIS6EyJBmamuzPFnBSKk843mAML8kWumCW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8469
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_041515_253064_FBCEEF0E 
X-CRM114-Status: GOOD (  25.61  )
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

On Fri, Jun 05, 2026 at 11:14:59AM -0400, Frank Li wrote:
> On Fri, Jun 05, 2026 at 07:13:04PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > Add runtime PM to ensure the PHY is properly powered and clocked during
> > register access, preventing potential system hangs.
> >
> > It guards register access in the following scenarios:
> > - PHY operations: init() and power_on/off() callbacks are guarded by
> >   phy core
> > - Type-C orientation switching when PHY/Controller are suspended which
> >   needs explicitly care
> > - Future PHY control port register regmap debugfs access
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v4:
> >  - replace guard() with PM_RUNTIME_ACQUIRE()
> > Changes in v3:
> >  - new patch
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 62 +++++++++++++++++++++---------
> >  1 file changed, 43 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index 591ddf346061..27aa696f5dd4 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/of.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/usb/typec_mux.h>
> >
> > @@ -136,17 +137,15 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
> >  {
> >  	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
> >  	struct tca_blk *tca = imx_phy->tca;
> > -	int ret;
> >
> >  	if (tca->orientation == orientation)
> >  		return 0;
> >
> > -	ret = clk_prepare_enable(imx_phy->clk);
> > -	if (ret)
> > -		return ret;
> > +	PM_RUNTIME_ACQUIRE(&imx_phy->phy->dev, pm);
> > +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> > +		return -ENXIO;
> >
> >  	tca_blk_orientation_set(tca, orientation);
> > -	clk_disable_unprepare(imx_phy->clk);
> >
> >  	return 0;
> >  }
> > @@ -620,16 +619,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
> >  	if (ret)
> >  		return ret;
> >
> > -	ret = clk_prepare_enable(imx_phy->clk);
> > -	if (ret)
> > -		return ret;
> > -
> > -	ret = clk_prepare_enable(imx_phy->alt_clk);
> > -	if (ret) {
> > -		clk_disable_unprepare(imx_phy->clk);
> > -		return ret;
> > -	}
> > -
> >  	/* Disable rx term override */
> >  	value = readl(imx_phy->base + PHY_CTRL6);
> >  	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> > @@ -648,8 +637,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
> >  	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> >  	writel(value, imx_phy->base + PHY_CTRL6);
> >
> > -	clk_disable_unprepare(imx_phy->alt_clk);
> > -	clk_disable_unprepare(imx_phy->clk);
> >  	regulator_disable(imx_phy->vbus);
> >
> >  	return 0;
> > @@ -686,6 +673,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct imx8mq_usb_phy *imx_phy;
> >  	const struct phy_ops *phy_ops;
> > +	int ret;
> >
> >  	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
> >  	if (!imx_phy)
> > @@ -693,13 +681,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >
> >  	platform_set_drvdata(pdev, imx_phy);
> >
> > -	imx_phy->clk = devm_clk_get(dev, "phy");
> > +	imx_phy->clk = devm_clk_get_enabled(dev, "phy");
> >  	if (IS_ERR(imx_phy->clk)) {
> >  		dev_err(dev, "failed to get imx8mq usb phy clock\n");
> >  		return PTR_ERR(imx_phy->clk);
> >  	}
> >
> > -	imx_phy->alt_clk = devm_clk_get_optional(dev, "alt");
> > +	imx_phy->alt_clk = devm_clk_get_optional_enabled(dev, "alt");
> 
> when driver remove, devm will disable clock, which may cause refcound
> wrong if device already suspend by runtime pm

Right, so it's improper to use both devm for clk and runtime PM. I will
remove devm_pm_runtime_set_active_enabled() and use non-devm callbacks
to avoid such issue.

> 
> >  	if (IS_ERR(imx_phy->alt_clk))
> >  		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
> >  				    "Failed to get alt clk\n");
> > @@ -708,6 +696,10 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	if (IS_ERR(imx_phy->base))
> >  		return PTR_ERR(imx_phy->base);
> >
> > +	ret = devm_pm_runtime_set_active_enabled(dev);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> > +
> 
> You have not set auto suspend, so runtime_suspend will never entry.

At the end of __driver_probe_device(), it will call pm_request_idle() for
the device. So runtime_suspend() will run. And the test result align with
this logic.

Thanks,
Xu Yang

