Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D39CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 05:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eJ+Vi4+B5kPJUFu/fodRO6Xgp2oKpWw/SA0EwT0Bjy4=; b=gGseInDoTroURUjEplwSoc+P6m
	Fz/n6tY85uGIuVBKqo8ABUB8vjaO2/rrVZxHnMD0U35hdSR58E+3TjrCtfdppRVKqZSgUIFnd1xFM
	BpIpvCLFWJCs0jK6FBoo1KuN1iBQ1CNcuhnk+QMtncKq9vrWVkYpTKJRTOWiuU37yitVJok7sKwKP
	yJhnrDjipvZ20erFmGdC98BdYxI9ZMe9Yc6EBB7qch01GkJEDHaFWhIOqeUeDm5uYtlY4qxjV9rbg
	XHxEiVtjVJiTO26VbGZLPex/C5oYDbw9g05zV9pBJec99hloF3mkFAIxahC66p5I9mYZOchcaskyN
	ToqK0bMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRkCP-000000013xb-2IeD;
	Tue, 26 May 2026 05:19:29 +0000
Received: from mail-northcentralusazon11010047.outbound.protection.outlook.com ([52.101.193.47] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRkCN-000000013x9-0ZPG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 05:19:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbtwVvo4OG1HspWPmvateho+MvOmBDBAmE/JsipdWqTVhz6619K7Op6MiU/tpCy4+719XTHO+g0/o32cnPfweoRyUOAxLgt2Tp9fKcaZY8AHds4DlDl5i1Hs5l3rbdIe9hmzn1YiR26W99UZIUm1L3ugTDQFvKee6kR19ysj5WBGmzLMkacswOpsDKz+QYFPgTSRtfbFSRozsnAQ53vuEm6nvIWup7B+gP3lieY4y9PtQPcc7NPmTwT9GlMDajScoJX+/9xCkJ6NAOySeop7mjjp6DM2/mkyhNljKtPaZgasahYhu4bf0hIMz6OLLZkSIamG47NS+9DDV/2pSAU5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ+Vi4+B5kPJUFu/fodRO6Xgp2oKpWw/SA0EwT0Bjy4=;
 b=fpX8gV1vaypJw4YQ9nu1S+tPN4gyt3qEWcOm7I2dhqm2aMi7jVurnlAlvsYoVx11Rr1EwmP5KyzOmC0QrWP4mAU5KxKyqlC+uxdEQC2t2njc0VSNetFaj7hVNhB+/UQiBUPvQ/RfzRXCE/xUmsfMuURUbDCJ8xvwBZjC6hr5VbEdqTap4dnViKpyvuRsn2VfteCmFxNImJxa0aDLgxUnM5dv2peEOyfIL9UyVQbK61hvc8NoMt8kNOCkQnBG1cw2cgsMUqov7y/bn40QwlwmbSpT9CYlf3um9ULDZ9UVJeAdFJGR3o/oFsdwZHlajMwCJtiWHLAIj4mjHE4PXTXcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJ+Vi4+B5kPJUFu/fodRO6Xgp2oKpWw/SA0EwT0Bjy4=;
 b=asirksYik12U9qwYXLOeFFCVVWPIemLoaA1DG4Djs4JLbGJFOkUuaLzdTRGucjDXQGFbyhML3N5MkM7vi3Sfs1QXM9GH1ADfxqHHRJApjuoWU2eaCi1C3roE08bki5bcFrbq+p2htAydEHf3qucpdxev/xwt2EDWw8L2YBalmDprInxAuWFI5ulsJR4VDr1GOhI27AaDHXUIIX/Kw/v5FXaQLQFCaipLi/qMyzF58KMYEnx7cZImRBaO81Uy6HvHgXz47zWjDyFWJAVuuKNNupqtUz3Fjrc02M2gGlpnczsw0/m24+8R878UX9N/4XhC9YRT3XT1VLzAW7HakXMwbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA1PR03MB989270.namprd03.prod.outlook.com (2603:10b6:806:4f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 05:19:23 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 05:19:22 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] net: stmmac: Improve Tx timer arm logic further
Date: Mon, 25 May 2026 22:19:21 -0700
Message-ID: <20260526051921.14540-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0199.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::24) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SA1PR03MB989270:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b7257e-7371-469d-1409-08debae658cb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|55112099003|11063799006|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: PTV++ier5csNlMPFdMFAaJLPmrL94YWJtII/u3E5pvdIMGUngqfNySyhvxBb6A7Y/yu1+SbX1+y+lKqogfULh4YlJN44gSEcTLhGWrTFCPG+nvvG2O0vcLDwfw2CzzKJNMaw9FVpT1DiDqynubTJOH92FN43R5P6CusQ9UkD7P4k+l4uUK9YPorhwl5Lm8glQNeQWQ2xNwOci6XVcPXWU8MQbhRqot12TwZHF/TJP85JN3AHhIt0TIjiyyAEIdksTyQ33lCaPQUGfadBRQjDE+Vt7NCu0n2vksvtrEXVk78WnGI5taEFOyz09VqrwaXj8WMN9syZJ0b4/H6fJ2iTB9Pflk0vsLGGOVt2FOZPwhUkHgIZhsTrxl6RyrnXrnPr2gA353Y3+cMy4ax159LiPUE0Ku+IRALt+IfEPn06tO5bgowR9ZN22ZD1aaYsLU52Zw/sF//sgOY3Ley/6SEtabiMmoUBSTlgyzjilvMaOpJAa9vVfVmuujNcyrOz07yUGMltJ5RN2+Fi0D43jxKv9VDXRw4hnuIjxIF1DWFG23EicgeKq9A8nw2cJMR7zdfmR2lehMtN3xvQrAsXL3CGbOQuMWyX6T8p0i7EYNUvNvYDdVWWGV69Gq7PlSy4AjUzEAQ3ZBEiAxp2yqt+LkWMskCQ7OcGiF6fe5QBurZqookGymdeQMMPJS8eVte+Taxu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(55112099003)(11063799006)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u65+tg35OUOV4CLq9G0hzLAos5KvkOP/6fK+1LPFZHboGY/A9K5OYHKRv1xs?=
 =?us-ascii?Q?bOpYWYqaDy+Pigu+xiT+x7AO45BtgPA/NFoXlO6v5A3ov/RfWCa4lJMvNqAF?=
 =?us-ascii?Q?OWVeDZQeB3EUhsYh5YY0zn9MDTF029+0qISKwV+NZiv/1tzli/xXkKjEopWg?=
 =?us-ascii?Q?bVixLS0Uy0EUo3ukwr3vVcwuGYZn/mZCACQgW0OrVGshyBMSj5PMCaMqYXjQ?=
 =?us-ascii?Q?QG+4vOZ0N2v2fOGUA9MacR2c696fC377wFIepz28+1EX+9ng14N6YW5MJZ5v?=
 =?us-ascii?Q?2drFfBTXs8pI/gAxzSzvF7Je+CJGFLOCWudP9b+LvW3C0KBTjXEiuxEMoPZR?=
 =?us-ascii?Q?Pu5ks/FC6pFDJphGbmZubbRHZd1rPzx2iM08R2NT3R0wWp/CZnS7QxiFgo+C?=
 =?us-ascii?Q?W6Xo89k9ANp+yACqSyhnB/LcAVJrD0O2QaSL/Y+ysoJ4c5aCmF3JdQdYUCne?=
 =?us-ascii?Q?InjPPg3WsAiexqI1aGuv+AlygHXOdVuT70rxkqruOx/VpQWfSybhamG5cCda?=
 =?us-ascii?Q?aSYcabD+4fPrUhNzbJSQEvtzeKThHbzTK1rA3DL7NPLoGwh5InJbZUPp3/yW?=
 =?us-ascii?Q?QRrn2kidBsKE+yg2DubNf8JMO5qZHmcmqHgSVcVNj/qZDWHDLZ3JeYL+J8xK?=
 =?us-ascii?Q?czbgKJpC0ljEIE5RaU3B9MLG/+KrGfJCaNVJn2EF96ja+PvJA0L8af5jUuXv?=
 =?us-ascii?Q?nUTWWFAw8mcR7XbLa7+GryqhT7eIEB4F8EqTQsb5l56gfQdd8A5xiOB1Zwcn?=
 =?us-ascii?Q?7GgMfBM14z0hnb/zusJY9jfYbtZ+ebJA4ply/SZZQ+adbCh+skkizhjoTOMX?=
 =?us-ascii?Q?heIEpm7/Pf3oaO3OfQaH1GpiPZ1qyLfAZDTMANs1HvMi1x6QPryQmeGeVX80?=
 =?us-ascii?Q?2d8aZhuEBHmmBnW2FKJ5udmDKlP7D1CoqrisBBjr/pM6OvOrdmvGC/QBck/6?=
 =?us-ascii?Q?lehUcXqVDmLeVtOl5SUqX5EbSnMCU9suo9sKmnN1lKpQuZWc+joeqTTLmasx?=
 =?us-ascii?Q?UJ5xOZ4olbAiruAMpuoH8gs6XnnoP0XxIGGZ8u0oXnUzuTnBDaktw+62I1HC?=
 =?us-ascii?Q?fiPZlZfsZJ6WpjxcXl/fZZ7n8h4s+LafrvmXx/iuGtph+vralrDRmpTVuDAc?=
 =?us-ascii?Q?QfPcEiESZjj5TPYdSkerJPfvNGr8BKdHfaT3vuX6UJOt9l5s6h06VQoFt+X1?=
 =?us-ascii?Q?KB4b3yCWJqh4UuCZRnp+P2se7iTcI9UoQJk0runj8bo8+gNQS4pPZKZh4qu2?=
 =?us-ascii?Q?BN7wm1tXRWSuoBLHkeTDB1TsrAP173p/2T3Or3778TEA1j0+ZYhb7Gk9rJF+?=
 =?us-ascii?Q?6FxDkT5YX2YJmaL8aewXSXgmM2ePAUXWrzFafecZCtf0ShHTkQuRpwjE8Ra1?=
 =?us-ascii?Q?Vj/LYlCE2oc0J7Wr2uSLRefGutZXeEkOJzRKBSKb5Qlefz3LhJWD0BsK3/IB?=
 =?us-ascii?Q?wIdaAM+n+S6SmIMXrI3Q/IQQ7ePZh/5TecHz7gxN92ENKJaKivWzRlYnhsI7?=
 =?us-ascii?Q?wqGqEgogpkGZZn48vO6FoldLlESP7aBBFGsEnTqRjGxf3SdaUkstXbRcxnm0?=
 =?us-ascii?Q?88ZOceytMGcsgpW9WqZBF8oPYeA0MMqA5qSI++kRok3ly1l0zP8k+1nnqXD0?=
 =?us-ascii?Q?bViQSgIXa8UweA1HQLLGtmTl8MbipBlXYu988g5OedWurFveWIK/QdJKCx6H?=
 =?us-ascii?Q?27/19zeXyINsglNzZjYqcjT/JBr6kk/rVND4kc88vXkxcwzV5MyvYCnADYzx?=
 =?us-ascii?Q?do2XNe79ZBIuidb5LqM0GAxdiFLrfwh16GfubtBopOOP3SzvP9B1hJOxyr6E?=
X-MS-Exchange-AntiSpam-MessageData-1: 5vs0yLLhHIAdHw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b7257e-7371-469d-1409-08debae658cb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 05:19:22.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQIURGYrut8GK2Y8eHQFTcNDCuvA5bvaNzqtcmHAvFgEMsuPdvPDrCOkz0jN/18Y9LGxxLHnHNEI4E0m9EF7zb3nwSaMTXjqYKFla4T0mdGOSpHyBm7VZ5fPTwxNffh1+SByAyx/PTM8uxTZoxQsUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_221927_196626_69C17424 
X-CRM114-Status: GOOD (  12.84  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Calling hrtimer_start() on an already-active txtimer is unnecessary
and expensive. Skip the restart if the timer is already active by
adding an hrtimer_active() check before hrtimer_start().

This avoids redundant timer restarts under burst traffic and ensures
NAPI is scheduled within tx_coal_timer microseconds of the first
packet rather than having the window reset on every packet.

There is no race concern: hrtimer_start() is internally serialized and
safe to call on an active timer. In the event of a race between
hrtimer_active() and hrtimer_start(), the worst case is calling
hrtimer_start() on an already-active timer, which is identical to the
pre-patch behaviour. The meaning of tx_coal_timer is unchanged.

Performance on Cyclone V with dwmac-socfpga (iperf3 -u -b 0 -l 64):
  Before: ~45200 pps
  After:  ~52300 pps (~15% improvement)

Additionally, ~10% improvement in UDP throughput observed on Agilex5,
with hrtimer CPU usage reduced from ~8% to ~0.6%.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v2:
 - Expanded commit message to address race condition concern and clarify
   tx_coal_timer semantics (Andrew Lunn)
 - Added performance numbers to commit message (Andrew Lunn)
 - Added Agilex5 performance data with hrtimer CPU usage improvement
 - Added Tested-by and Reviewed-by from Maxime Chevallier
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions()

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea30b..35da51c26248 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3341,12 +3341,14 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
 	 * Try to cancel any timer if napi is scheduled, timer will be armed
 	 * again in the next scheduled napi.
 	 */
-	if (unlikely(!napi_is_scheduled(napi)))
-		hrtimer_start(&tx_q->txtimer,
-			      STMMAC_COAL_TIMER(tx_coal_timer),
-			      HRTIMER_MODE_REL);
-	else
+	if (unlikely(!napi_is_scheduled(napi))) {
+		if (unlikely(!(hrtimer_active(&tx_q->txtimer))))
+			hrtimer_start(&tx_q->txtimer,
+				      STMMAC_COAL_TIMER(tx_coal_timer),
+				      HRTIMER_MODE_REL);
+	} else {
 		hrtimer_try_to_cancel(&tx_q->txtimer);
+	}
 }
 
 /**
-- 
2.43.7


