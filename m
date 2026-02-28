Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2201048922
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LA5/cHLgqF5UdTP1ya20OuOQjObbaBOtuyuP2d6unaw=; b=De+Qd/ujeMh+zpvDipvN8jG7L2
	KKdC2LO5VJ75ckL4TyW/Qe8UxIGjxZI+xS0mnpcVrRgD42H9vX3bxyQYrVJ51fvp/cjute3FUEPs1
	SGPUULUlZpdCx68pB3SNEXVNXm+k+9hJQMep4QZbYvw9TkjpaTtTpYoSnhajelAk+oDRfr9PBvLtc
	TX1tTqW6NdoTyaW8edlSqCnoMLZlrkDXdJf8nc4Mtkoh5+FDFRDtR5z6CGHPiCGgNGqQPaOdO8lSV
	DXysAfEyeFZfyjM5/vUljy6vtJRfFyIXYWViG5sLugGPfha60LM/JYQmAncoi557UjMBufoLcpzrH
	vIIJsx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8b6-00000009LFX-0ruL;
	Sat, 28 Feb 2026 00:54:20 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8b2-00000009LCO-0koP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:54:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJxsA2SWp5SnKjd9WIitzLR5uKPH0A+V2pX+qMzjogLYrxPEQsk5TAYtyElLOFtKm8ln9ZpAUtzgMy/55buHsNO1+PMZtrPJ2/4ZbCekM7BGMWWU3lXdAIoRlUOSabEu4+y/xVljO7UDEXY6rx7xwCcmvop6GvNx7DgdWEdPyHkMjSLh42T0phJdggYZEE/AntcSir7IU+19zq6sVEODeoUaABfv0wZOWh9gGc9PVIV3AFzOImMfb8UbznoyBhbKfMcQ7l+MHR8XvxHHH2xx6Ig5546cMWAIIh7WmWKRbFIipuXgSHnuFItKEh5RhcDmGYFkORsTx/PxMvuc9GzCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LA5/cHLgqF5UdTP1ya20OuOQjObbaBOtuyuP2d6unaw=;
 b=EbX0A2CsIUo8j8IDEFDYF3qgtLku+WW8++ivF15IUXGaqrUj4zQ2ckzXhXV2rk5q5yA1NdwBtw5x6JMP/sYewCo4DeRuAWh9bdK+iyFPcvdPtO9zWV96FXCYaiQb4Y5F8g9/BPVOYkueUcB2H8OmHpPUXBblNCz9ocwjI52FNXATog6CvsS8Zn76AkPjX7nqdL4hhWxlkC36QJAWzBU7OubdP1f4c8ydkCEPgk/skYUwUqKsYT7p4bKagKG6qZyzGb4D0vKkxdsAhrDNAwakMJ7eCnp9IN5cx+COCB33ORoQd8Lztj4ZxciffGomHW+W5oEnrvYvLgNKS+7mk3lFUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LA5/cHLgqF5UdTP1ya20OuOQjObbaBOtuyuP2d6unaw=;
 b=qhwvund48p01sZ77EN/bi4BXkWuQlhmxCiyGwIX6m9Af7NeyzuQWcx4a+DIrMBV0rVfBZWWNn6ccZ+eNZp4Eb6W0OH83vZ5/UUYaN/isEbBjTYx7hTEZNRc8OXLokv+fiWwiijrgzTOCXzsDV/jufg9JkZe0PB4ouogWKqSmOmeea56z/O3VF1+d09NvkYPS/Gw6AiI8+Yxz/9fMF10NnNnY4IWz74IPZjNUMWgE/AKZFPL0d9ic5KYwShKcni16jvsPqWQjkdhgycCB/Psw59L/EaKxyHegV9NuFTXyem7OQpr914o6H+MMdgipZiOi0JnlSvijf0+laCIlkqNt7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Sat, 28 Feb
 2026 00:54:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 00:54:10 +0000
Date: Sat, 28 Feb 2026 08:56:04 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aaI9JBwWaMmfBbd/@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-3-cristian.marussi@arm.com>
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cefb6bb-37eb-4ed5-f2ca-08de7663e23b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: 1sT7DDM1YUwJi7i8RNdIIJMT/hdze0+o5zBt+cWXjjbfYJioGGn1HM7tdLLK0tyDF4UX2YQ/vEk6oH7LP1iQdF092ACKSQINyyj802dmKu5oQLfp2nj6Y0gdTPp98OuROMi40uFy9wVNvIQiYDv2AmNbqyeIKbHXPmWjfAcOS2NKCoYLC+Lclegr2s7V/YMh42UeWi9ewZPXeFbuwWlNSVyI0+wv7yWsrTuooNAlLMz+6amFO2/mf3AFOPTaGl4QReh3Qh1FrtCsFCksqF83PklsxMMI3j0GSXjGZYi1EfaGwVB42ohgJOKPIl0Hgvry9lALJaJN+85NT4htQc+BverI3MFRigM1UYgc1J3EDrEPu9hue5uCOBhQNmmZ2kkVjLP0wtK9es3hhuTNsuT0ZIjdRp3O2W5fw8hYUSS1mlXeo9KNdMLnM4aE2dYSEXY2u6ZY2b/QK8iklhby4o+bgeDIvotskValsaX0JHHgyLT23KEYtunAId70H0c/Bc8liS0BqD24kMqlxRPZ4cCKoBsU456y/E6w/vHltT5Tf0LC+pepPSe3rskysrBje8iPU+pHcadJTq8j80sKAVz9gC2AWiZGw3AUkbj6PSWbVL9esc8KtWpXYUd70JN6hapBGMdU7hHTi3BOxc+bxDihgyrf1zTK0K5ucm+zlDB9rrAj8+nFObg4F8zR9K/txnFVDqiaX4rD01MSWlr1m6E99JhaY2MIex+NuAIqBl7pLI7S57nePaOIkLpukAaeK1WCl7PfBNIgIwn5QbApZNF+z5ee/mICxIWuN1Pj8Fm++sY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rhRqqrZ12+W4x9iXmIBOLQO8CH/CiCT6fc8PltNxcX91AitXAT+pjKJIyUOZ?=
 =?us-ascii?Q?hKtASMXdSbdng+IGhNTWTuK6EnmXCx+pb1PcguuTgiVJA6RX+2K8q5VTU8V7?=
 =?us-ascii?Q?lJDh5NX70gKGiq4lT6AKVY5lmPAVQGPU+cah6fo5Px7eZrn8sgcEPgBOd3kC?=
 =?us-ascii?Q?M6Uw4SDZMkc6kFL2cca7lRTYr0oXzZ+AaSMMygzdRwZ1y/dcVcFhTuUrB1LJ?=
 =?us-ascii?Q?8GKtQJsXJJ1mcebE9BCgyrmkPTs3grgymrRhbzpgCd8Dz/zPqvqiBoXeElzB?=
 =?us-ascii?Q?39eEsXXrutKRjk0DkHNmGDzW7gM1fmCnL3F4Wxeo8wcq8wbi8SB9OPuixuIC?=
 =?us-ascii?Q?irolkwKqBJHjLPPn9EEjk1TW3fyXXNZ+iJXhSBQlNwZyWE0bWAffgC1VSnmZ?=
 =?us-ascii?Q?CZEjjffbvCiNVzzbkHIx4n8cVNP+5+mTU3tnyxz3XCm3SFVHMvH400XcxMuB?=
 =?us-ascii?Q?TCFR0Ek4ZadsMSp8BQXbra9Mjw8iufu/jA6FfM+5gqdZh6ZousJl6bnZmxKS?=
 =?us-ascii?Q?Mm89h/8GgkDjRQdUgKlN65FgpTtgO12rkTpyHxXv23hWaTziITwXe4Yf0cxy?=
 =?us-ascii?Q?/ISxKc7nm/hpAqHmEoVx57e5CqlBZ9Y50dpHrgetN8mHLTlOzJpz9Z+t70Dr?=
 =?us-ascii?Q?PpTDK7T/aS8yB4OUW6Vm0UIQg9LYHKZ8gTkD2i2LGMwluM/B7cqhCrbkMMI+?=
 =?us-ascii?Q?KS/oi21w4ZadbHM6Gzj8QMkSszOmEtqdQbsFReFn6BrCpwLwPmvI59ZKuJ57?=
 =?us-ascii?Q?t4MQjDJ+zKLuB/tIF/65DLDw54fp56FR2+xiRF7ZGSqWlYZHW5XfOml0Isk0?=
 =?us-ascii?Q?OHoaGqYlfICod4Qj2oHGgo4CC1p0gGuEejoHLgsr+ziJe24MoQpzDjrNCo3J?=
 =?us-ascii?Q?PfRaDNagAnXtITigsb/w5zH2Xz96AjaK/CK2yXVEsXHc3uU1zajwl8msPi5z?=
 =?us-ascii?Q?zgz01ezzEGVjo7epgc0PpQErsf2tN5r9B+vauFYWA8kWlHEZv9N1LWq9n4gY?=
 =?us-ascii?Q?p1yVF+y4TQn5m3sELuE7QDz/g2qnAFBunPYQyXexXJEadxi6wpepwdTtuYl7?=
 =?us-ascii?Q?45+9J8jDgGGzRb35jahGO6Bz3fwfnmDWewoLj0l4sqDCzmqhS06WijVqdBLr?=
 =?us-ascii?Q?+uFACBmm4mTCmLRMotvNsZkMn/hPcU7VF/QO9ESbq+RafA58J/rfA3gPXZ20?=
 =?us-ascii?Q?sdXEUW3paYa4fsf9jOK9+8tHaSnsTRTjUM5gO5JjP2rRQ2D9YOXiIA6nExqY?=
 =?us-ascii?Q?YETplsP4ykbUwEz1oSFRZrTeEvU1QMbEoflXUd04WoQr6Bbkv37aXQodGQTe?=
 =?us-ascii?Q?dOnrjFPrXlMtbm2VJ2ZcgHZlegKc4dcdUUr38LA/ACqzgx8d0FuV+tB1LhrB?=
 =?us-ascii?Q?oD8kcX1HguUDJGUddIJiZtN8oZevVOpNQ/qtLW/Nxk5zc+oA9mGnnmOC/YDe?=
 =?us-ascii?Q?QJ2Jc47y6pIXDnN5Dt5nu65PtcImin+C9Z8Yjs2MdUPpxeIWaRU9wdGzPyhj?=
 =?us-ascii?Q?MMEz8d+J3/gSzGqC2CacHuuBzV1aerRque3ABkObSpn617OU0IXDHPnUCqZD?=
 =?us-ascii?Q?8kw8gui1Ul1WAgA8cHKyQVs8ASF97qA16e0cLMYd6XD2wDV74/D/CU736AfU?=
 =?us-ascii?Q?Kc30ejleOgG/btBXq2rUk3qJxn/5ob/IPj8GaqKCCEU/8ZnwvOS6YIatErLE?=
 =?us-ascii?Q?N6rrfUrNz6sM0ejEGpvcWu4xXF5OmDgXsEoRibmgVHRTaMxvNZM9MMHV6+fi?=
 =?us-ascii?Q?ij2+AH3HZw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cefb6bb-37eb-4ed5-f2ca-08de7663e23b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 00:54:10.4044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x43CnBvtaOcZqRon2o6i6vsrPo+pAOgfLvgvcuVav5AdzITgfMErtCDAdjve7iRTzedL7silwMDqazV4XFoT1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_165416_226424_7DC4DC61 
X-CRM114-Status: GOOD (  16.84  )
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

On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
>Use the Clock protocol layer determine_rate logic to calculate the closest
>rate that can be supported by a specific clock.
>
>No functional change.
>
>Cc: Brian Masney <bmasney@redhat.com>
>Cc: Michael Turquette <mturquette@baylibre.com>
>Cc: Stephen Boyd <sboyd@kernel.org>
>Cc: linux-clk@vger.kernel.org
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
>Note that the calculation logic in the protocol layer is exactly the same
>as it wes here.
>
>@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis is merged I can flag
>such SCMI clocks.

Per my reading of Brain's thread, if ->determine_rate exists,
->determine_rate() will be used.

 	} else if (core->ops->determine_rate) {
 		return core->ops->determine_rate(core->hw, req);
+	} else if (clk_is_rounding_fw_managed(core)) {
+		return 0;

So unless update scmi_clk_determine_rate() to something:
--------
if (clk & CLK_ROUNDING_FW_MANAGED)
	return 0;

return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
--------

It maybe better to update Brain's patch to move clk_is_rounding_fw_managed()
above the check of core->ops->determine_rate().

>---
> drivers/clk/clk-scmi.c | 31 ++++++-------------------------
> 1 file changed, 6 insertions(+), 25 deletions(-)
>
>diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
>index 6b286ea6f121..c223e4ef1dd1 100644
>--- a/drivers/clk/clk-scmi.c
>+++ b/drivers/clk/clk-scmi.c
>@@ -12,7 +12,6 @@
> #include <linux/of.h>
> #include <linux/module.h>
> #include <linux/scmi_protocol.h>
>-#include <asm/div64.h>
> 
> #define NOT_ATOMIC	false
> #define ATOMIC		true
>@@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> static int scmi_clk_determine_rate(struct clk_hw *hw,
> 				   struct clk_rate_request *req)
> {
>-	u64 fmin, fmax, ftmp;
>+	int ret;
> 	struct scmi_clk *clk = to_scmi_clk(hw);
> 
> 	/*
>-	 * We can't figure out what rate it will be, so just return the
>-	 * rate back to the caller. scmi_clk_recalc_rate() will be called
>-	 * after the rate is set and we'll know what rate the clock is
>+	 * If we could not get a better rate scmi_clk_recalc_rate() will be
>+	 * called after the rate is set and we'll know what rate the clock is
> 	 * running at then.
> 	 */
>-	if (clk->info->rate_discrete)
>-		return 0;
>-
>-	fmin = clk->info->range.min_rate;
>-	fmax = clk->info->range.max_rate;
>-	if (req->rate <= fmin) {
>-		req->rate = fmin;
>-
>-		return 0;
>-	} else if (req->rate >= fmax) {
>-		req->rate = fmax;
>-
>-		return 0;
>-	}
>-
>-	ftmp = req->rate - fmin;
>-	ftmp += clk->info->range.step_size - 1; /* to round up */
>-	do_div(ftmp, clk->info->range.step_size);
>-
>-	req->rate = ftmp * clk->info->range.step_size + fmin;
>+	ret = scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
>+	if (ret)
>+		return ret;

nit:
"return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);"

Otherwise:
Reviewed-by: Peng Fan <peng.fan@nxp.com>

> 
> 	return 0;
> }
>-- 
>2.53.0
>

