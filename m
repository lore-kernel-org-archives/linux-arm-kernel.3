Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98E5C71159
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 00:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xEAHI0Gu6UHh0oa16s7J263XUPodySZ1X2NLkCggu5g=; b=2r2CCxNpF+SV5+33Z6eGK4SvDr
	xPIuQ9uHNAY5q+lZ5yFRt2baF7GWs3X9n5F+XD/7yM6nR9sJoWNmNGEp0Ix8E8/DCp3zz+gRrqnLi
	yQvCPrSDXY6yx6JRoUzVOMVwTDgceHEQImupYjwjDufOK7qzgA9wqbSjoV2MIlEhlh7duNuqvSkNj
	WiBIQgPzaPmHTPBVb7q1G/0az46MrKvyXUj5PgKV4ijulUh+nJmfXQm4pU7sxKVjc89r46ndYBIY9
	+TkK/yfS4XWhu7Fc3tgU7roXoI6Azspwm3TsM93lhBtzYOkds1tkLtdRxQQAhTfS747rEbZA7IF33
	nmjHdBGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRK2S-00000005sJg-0yHg;
	Tue, 17 Jun 2025 00:18:56 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJr6-00000005rWb-1WEJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 00:07:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q//vduWika87PA4Okj82iTlFHhsvRKJz0M3Nlf6PeyzltMuufHc3t3lTnjLPiUKuO2PoLZUngklxbYa+BEQvuYfwXF9j9aXAjNWlDDlyBG9a8b8TNEtYkdtupbZs0ynFNl4LnYxEg06hMNZf3bAx7ej3EVw13VAHyyBb//3gEqDJfrBxq1h0GaIkv+oHDl354f0qmaGb7WxBP4iRyYlvxRIEUgv5ULlC3HJPabgrPhBJEwXgbuhj7OS7meMKnIGeXZNlnxnZ58L/afah7b4v98IUMxkW8qAsHUUJ8Kr174wWzAqRL66bZQlKiGiqC+6nZC90hOGRvLC287htbpRFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEAHI0Gu6UHh0oa16s7J263XUPodySZ1X2NLkCggu5g=;
 b=xVKQK2/qK5RrugwSI0K+Eiqn0w9cHQlZvOIrJjzD8O7i4TKcz/nR5aUZhdkryopaklHJjUcQSqVqJHHlCwuLgRDvG/8ZKUEZp727oLuTuaOFWg6PoG6s1CsL1aYmT5d80jb6Vf3feu3wFjSMn+6ahHcKiXcn05k63c/6Cm0aDJ7nIxMNWnteYl2Ym2EVfKCTqTNRrrRdhZVqhCZoZ/NyOozRo5j4ezdPyjpFk7JRWMod5IezXg65/ydK+yxsYVthSrULoFpxp/LTMQN9RipE4YEM/nX4gCGfM7T/nX67tO97oFFZLfK/80gWLvEy7bN26WXgDSghzB1iPRUPQTPmCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEAHI0Gu6UHh0oa16s7J263XUPodySZ1X2NLkCggu5g=;
 b=VQ/tZLClm54n9Pq6mxYeikHJraSY4S4qJfQHEyDReugQqAGozVgMGytrXfrU3LJlZgcwhAWJUhFx5FOQbzTB0BSKDFoASX/0LOPPjkpi5I0R8r2VrF/ovtAaKdPtiK8htSU5T26hNH4Z8C+UyDMpSPcUrajf7cv+oNKuJhnV9r8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6804.jpnprd01.prod.outlook.com
 (2603:1096:400:b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 00:07:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 00:07:10 +0000
Message-ID: <87o6unnscy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>
Cc: Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm: omap2: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 00:07:10 +0000
X-ClientProxiedBy: TYCP286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e721eb-5187-4117-58f7-08ddad32e7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dYuArTBtPzZg3ojlZQ3vitR4pr0tbRhKqt0WmXQLLH/e3Ef1gl3PCdi8NryU?=
 =?us-ascii?Q?5tYxeGl8XscE4Oo6+x6T/RYtr0ByFxA10hROgo4w8snYWMdqQlrzhOYR4sjl?=
 =?us-ascii?Q?ZHs8PkpBAEk4wAMyOFj8qQKfVHbYbizr4TpfhB4sSs150hlOFq0MOcUuscMi?=
 =?us-ascii?Q?28W55pZIcWgPCBxb6/DPoUZuyI91kzfW8BG3286/km71vrhRq6346MhKiryb?=
 =?us-ascii?Q?idCEGZN5JCfsG5VNhe4rlQ+/pcIuk/PAh8Ea5HHdgGGdG4dOi8DFsKkaZCHd?=
 =?us-ascii?Q?RV96/sIBBuAWP9a+qPUFdRxxMe3RPWY9T4ecxjp1qWqDswJpUDsYiCby3eV1?=
 =?us-ascii?Q?Q12wkhBdCO2c36Gq4/7uvMuNULpTBB/jpDH9LUKOaZbBuecRakx48dcUT3xu?=
 =?us-ascii?Q?LT0qWJkVR/ZozfIDKkiHM6XhD2uzbARAQxsKVVVwMLzjQb9tExeu8MCwWWwp?=
 =?us-ascii?Q?LzOiWTBwcztYz0MUaPFWo1w1TU36OPxIhFo/hD/WQ87aDvDzls2PQX4tCp7G?=
 =?us-ascii?Q?/Pc9HxGto3yMzGxrs70hEy+x7rVebpCGNDNxVi4mjQbKYYzKWbKxjg7LX6WD?=
 =?us-ascii?Q?B9vvMVKdIchdBxFqAdoRtjHDLTdtMZrgPhC4FXTW12ueKHh/gZyV1oS/yoaE?=
 =?us-ascii?Q?xAMbF0G75eqAZ8qucHe8tcy2syX8P3Hu7RzthoN7EtnfK0qJxR27jVo4vM6q?=
 =?us-ascii?Q?In+EEKyO8Yjhw2njuPVhoCWcI6payHIDh4TUMyb1EepHFi96Yn8HsiO2R747?=
 =?us-ascii?Q?ilydIqDdH0XkzBSSuelzqxOzrkcofYWkP28ZBruEbFjqeBFxhLxRNupCRe/T?=
 =?us-ascii?Q?nYZVzt4OV2fYaLrwMEbaW6mfqMqedXHMjE17USt+LGr15KUdF7N/8TjnoKQ6?=
 =?us-ascii?Q?sNgBuPGURWlYX6XVXqSKSHNELjhc0JT9Vh37tRgEGu/6wiWsGqtcM1vRweue?=
 =?us-ascii?Q?BISkoa6QSKFY4sJxofhJ1EIK6q57TI03b1xcSsKyybEWnGNVCr2Kjq6pNglQ?=
 =?us-ascii?Q?pseLmKdzW+9o5q77xnS0HKb47QrSjU2lc7uqsoB3xBM3zpzEXtaWAUmqNHmV?=
 =?us-ascii?Q?DvVGY/r+zNkEN94KjlwPtdpd3ox3ID9a7e7UjbfSi5ikJB5JmH6I5o5qiWoe?=
 =?us-ascii?Q?6Na/BsueIYQbzv6KE+bMzkLLvIIFDuTaDWFi6g2D8Zs5hVXWKllVdBZN/2+R?=
 =?us-ascii?Q?KpcN5gWR3FES/VBCcjpz4qn4KkFom+qBh/nYnbF1hXLAni/YSyupIf3mDKNn?=
 =?us-ascii?Q?fN1y93o4TOvtHTT+rtqW5BEWQhzrgpcO4TdHQ7B0O9u0Xh63e+tM8shXZ3ap?=
 =?us-ascii?Q?qdn7gD1B984StkxrAhCPKmBnaC32VrQnDuwNnBqMLsbo2uw7fMWrGaV6Qtot?=
 =?us-ascii?Q?FI4gzNBjk514biwIY3BbQtq7eQ8rpXrdfqhoVKfbn9p1+scZhC7lR9eGzLTo?=
 =?us-ascii?Q?ILWedhvIGJb9K3w2e2BNJOa7qHorNOL/niLtWoa3rGp0+6HUv/lTyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YLDFYkPIseUNt8Pn+4s8KT3+NY4ahOnqNPr/FvLfKwsyoU+Xlqn+FZLjMtrt?=
 =?us-ascii?Q?2AjnLvrjkmY1oM1iWbwud4Ntepj8YOsFoZbho4YQXTVxm7CF6aaCMhNntnaJ?=
 =?us-ascii?Q?T9TQsuq/FTR0k1uLa22zpxJWkZkwzBK1ZM9/z9zkfRCf8AI8hZ+x+45sf2K9?=
 =?us-ascii?Q?Ss//YPQ0idnbymt54nXVlzWukjO+hChso295d7AHCtt4EXeKeQfGSom1vOvp?=
 =?us-ascii?Q?ae1EvoxWF5giCAkkc6gAKr7lBq9PmuaJUmfAZ8gyvi3/YebhGsRxfMwWGG5F?=
 =?us-ascii?Q?VljEikw0wGsYYavPv4c8pMZ8nkx+N9VSf5bEI0w3faG6efu+DvaG9wsYaAFS?=
 =?us-ascii?Q?g+GJagKPawF1d0bsFRwuYmVUfBaMoTPk3eQsCEDaqgopoPO4D1EKFhdKmpyb?=
 =?us-ascii?Q?od4CQ6MU3YAIGHnkhbPlhKnnFkI1LcpcfiCjNjWQ13AGKPzAiSxUgCziJxbv?=
 =?us-ascii?Q?TaERG4ilaXT0TmSf0qGTz1KVSSYZMK4H8ubYtAIMcnH5xjT0eQjC8Hy7aApz?=
 =?us-ascii?Q?En1rtMeuvIOZyWrsWTb8CYanu3rRadpP5v70j8vbPti8YPW04yKPFT3vd5fx?=
 =?us-ascii?Q?eBESs4XwA8EE/P2q0YwcgXKm2YyLcAD9N+QxuCu45hTRfza7kXaxr19gNmCB?=
 =?us-ascii?Q?41uwbWtL2EGKEUq7qYg3l6Z3Fwq0Si0f1IcPXHgXIW2DdFPo4KJD+5gtCCdy?=
 =?us-ascii?Q?6caa+H3iWDpxZK1zLqVTDgF5C+w7xkm/ytBwJDTbYq7A4Ue11gBnSQ8c+3mx?=
 =?us-ascii?Q?xH0B52xI3JlEV6l86zoOtG9MSn6IBB3hRHk1USwgIhC/nZ7jdj1+f4JRVj3l?=
 =?us-ascii?Q?H98rAWlRfSLeSuB2NzPWKEbJSoFXpocuhuBfOjdMy6tJjOCxVIFZC/5iIrgt?=
 =?us-ascii?Q?4lgU9uwnMNr0bbQKtw7tDn6hTvzpKVSjCuXPzx9qKaRh90WwoMrJfzbjlDnl?=
 =?us-ascii?Q?x1BlEfgpwuvSU6CbYSEIKNb1YwCjQWGSx0IqPSEHLFOtf2c4CbyI7Pz3oHiF?=
 =?us-ascii?Q?lHuvU1NcrGcrK03n4AQnZuDHLjDYdc19KI55td4IOhLko7++G8ZRa36R4X7l?=
 =?us-ascii?Q?Bo5fp0L23w1O4h+ptfWnBvx8ajLR25ATNti973RIl55Pb9OQ3Y5zcyJo1E7l?=
 =?us-ascii?Q?4bEcrw/DReyxE6/UOhuhZvaZCAndP8M5fXws3furliamEk9Bt748pC2vgB9C?=
 =?us-ascii?Q?w+wbAUBsR+tCI5PZ7abw74Kl10mKiTB0+MuPQAyOeb32qzbh0oiKb4OMxgkA?=
 =?us-ascii?Q?Apj+4+1KmHAxSwkBgaMMXaKWetJlBXajKnTGOmRjJA2Lssw+CPtMzEkUUKtM?=
 =?us-ascii?Q?6H+0BAqQIwjFgtgPSYJ0GoAuoSxwj1LdheHdD/FIs6DW5y3xnDQbOGQ1nOII?=
 =?us-ascii?Q?qyzJlLjFqOLSZW2kqipPVUXbYx7hZm1zHzzhJlV90UXgtE6IxsG/JVjOq7l/?=
 =?us-ascii?Q?EOG2jvoqo5LX1CwueKiIHotKWuXI3h+nZMyHC+gPYBtk3j9nI7fYTYo8UGwa?=
 =?us-ascii?Q?HfagQgNHDXhlBhtXLRKfLsWJzqn+esUHE2bNl0aSw4otZaaAtyjmwXmyLn4V?=
 =?us-ascii?Q?UldEXET33ySEthatyH4/CTMKfMU8QsC3plqKpbz3ncjGBZ7qesMcG5KCAcJK?=
 =?us-ascii?Q?DgMHBG73fUDiXzwRj1CA/mE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e721eb-5187-4117-58f7-08ddad32e7b4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 00:07:10.4853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Adx+WYPZFIki1Zxk/37ptH5pu8JprV5gN5G9efJTahh3Qb3SmB/r5J3EoTY200KY/9wtqxvamdtwJG5FgrkSodHoutaLQ0trrNXecVz5ldqHc9E5aWAdsHKeTGrhwCso
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_170712_431364_F67B834B 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm/mach-omap2/board-n8x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index ff2a4a4d8220..969265d5d5c6 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -167,7 +167,7 @@ static int n8x0_mmc_set_power_menelaus(struct device *dev, int slot,
 
 #ifdef CONFIG_MMC_DEBUG
 	dev_dbg(dev, "Set slot %d power: %s (vdd %d)\n", slot + 1,
-		power_on ? "on" : "off", vdd);
+		str_on_off(power_on), vdd);
 #endif
 	if (slot == 0) {
 		if (!power_on)
-- 
2.43.0


