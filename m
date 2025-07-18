Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F6EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 01:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OLuk52EfRUEYqqS3NPmlZlcClLUsDUXEQRCWRkwO2o0=; b=g9vz+wL+oIDBvTGRjK+rEVTsD5
	2u4UrBaiLu9Q9DVtvMhvkkrxjYaC8g017EtYRQXt5JD2Jp0gCKWervAiP5Z7YLOYDEgc+Ouq2M0j0
	kGgy268NKNJMxJxYpPOcqAEk1QkyDuZVtquuTegkegsZLvpEq/HkIbmzjDDm44Yshc7K6teTaTI9I
	PbXwFaJ79FBNr07UGCA0gMM3NKm8CvsNr5rJwM4P/k7wZgqdMoSyCjevzWJw+7ymSQD+Ga3Uxs5BQ
	hJjh+0vIQF2qgz0+1kw1FGowfwONuNIjOtog9AhQa2i6LZJftLDMM9j7yW2w/MMyAkMRRguoqfonL
	tuMt84Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaMZ-0000000BUi2-0Q2t;
	Fri, 18 Jul 2025 01:58:15 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaG8-0000000BU9J-1Vmn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 01:51:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0kYvJ0ZoDkerW3ZYt9Psyo4OPePa90f3jVBpmUhi8uhkioL6wkrgnVxhly58Jcwhfm7W2kcZNvOrdzmhEVlHvxVdq++99cTdMI3B6sUNgsLxzJubdy4MwlGG2guLXonUFlRjODzPWFogS74ZdoyFq2bfaPEd8kfAWW/HlyI2XyPYo99LsksTAS7kkvsM86odGMFZDcDRZMJ6bNvh7EFz3A+N5UrPtcA6h1zGcdXNpGxpdwXNkZO3kblrxVdr4q8ZmuhvtXev7C8+aKqz8kEZnF0nM/YVZx0WJKtanYDdYs6DZbSjVgA+SJcOZnGF6bF4Fbfl/YW4HzHJoVE9dBN6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLuk52EfRUEYqqS3NPmlZlcClLUsDUXEQRCWRkwO2o0=;
 b=qvwChjV0qVUuc3NAFpkoeBvO8+W6AB/ayLNi9rbWJsSlYi5yusukNzm6sx7+QPoiLuEboh760iistRV3HuUdsNh5WNBnyMIMg67JgLqOZHaSU1hwJTmy/KWgHw8cQJEVT/W/2Y8F5EtEM4D9h3MiplqZS4pnHNQ9w7URzSn7x9WKihQywGGvj4LbUz/ASCt1gGfe47G1MuM/sAuMvG+TJJVYoazVroxaSprcLTftBOJwGFiGCJ4awp6xqUu0W73Ux1d7hp3YJwmXHSK/hNja3ICixl40hmijSQvBK7ggiM3JSleRyKmsILs8HxVpBCv1LEDj/r124OS2I3l7GiO8oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLuk52EfRUEYqqS3NPmlZlcClLUsDUXEQRCWRkwO2o0=;
 b=GM0h9Dv44CVpZ2nR22OB+N9j7ITuBu1RsFovXoJk3DAMhmG1+wLG8KOYkr9+Woow/li1f+R6wdfshNKRll3AJGi5xduZpKFFR5Y2iYiP7UmoW0zFuyPZoJBGCA7JwdQ4yA2+Ql/qbUHRjjkUvb5pXfJazH+9HvbyESPS4GeKF6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12514.jpnprd01.prod.outlook.com
 (2603:1096:405:1aa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 01:51:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 01:51:23 +0000
Message-ID: <87ms925krp.wl-kuninori.morimoto.gx@renesas.com>
To: rmk+kernel@armlinux.org.uk, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [resend][PATCH v2] arm: mm: l2x0: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Jul 2025 01:51:23 +0000
X-ClientProxiedBy: TYCPR01CA0163.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12514:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f639ef-4f99-4abb-b93d-08ddc59d9975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CnEsAjLyqhwct2d1PU1yI/dJQhdfhgS/jcAQ20oHz0V+OuEOzRRq0H1RRtOx?=
 =?us-ascii?Q?RrVTV7y9AZyWz9L7VII5jJHpWQmW7pNBGFkN2kfNsnbD/1rMGPG6fjT8XoRC?=
 =?us-ascii?Q?JghpHUtUcpBFOlQ7mE5s0Hlvo/+xipkHW5ohnY6se7t8unuWbd/4WX2MNXbP?=
 =?us-ascii?Q?M1q+kWB6/uDGsG/2sZweMSxXupykGfkCEzgXkGGL0TaKcJ0kvEv+2GLaWQWg?=
 =?us-ascii?Q?okBQNuFj/Z2oKWtHN5j53jY96esHrZ48jxj6/QZZQDxg+rGIkUoEBz4q7/Cq?=
 =?us-ascii?Q?IJOtah/IPQ7dDJtKqUzQ93hDU5NgtyoFcZOvsEqknm7jbR1i1/w79L6s684/?=
 =?us-ascii?Q?t/gpBtVVUsPh7piTHLpql9+TmBlo3Y7hxrEVqva8Z+6pQvYN/O6uwD0hiapM?=
 =?us-ascii?Q?IznXk6D/OsaZQwpxOo1FBD326YGm/I9CSrFdFwPLaprgrT2GsZWleFdxkUx/?=
 =?us-ascii?Q?C4lmaZBbew7nFChocekNTwHgvyS7XcfYJpFboqyZeISo91JBMY7qpW7xkGot?=
 =?us-ascii?Q?h3tLC9p02wNNmsSmH+slYGlRi/qugIAirJ3uxbOE2MfoGS9ToU1+78dleZTM?=
 =?us-ascii?Q?TPf33G4YILCNr4ia0Ml8juBf1bvDSzEtaIiRYx8WCB+V2W8syL2LIOnp+5cD?=
 =?us-ascii?Q?fSS3DEWHWPPP+ytMt2PDDY+s+1YYgzRo+A3OYn9LKQ3KZ4px62vv9mwQ+IMd?=
 =?us-ascii?Q?wyJwtSuuC0LbHAOoTgIet2wLJoX68y71zdZ0ZtuS8emOw9OsTC2yXcYTmEqZ?=
 =?us-ascii?Q?JPNwLhK2Bgil9qkgEYJvUXdW7fUm6J+CuICmAvdt7IweJPaU3OJxKP5+GvHM?=
 =?us-ascii?Q?zPKuTTcXDELEpFmiFCqJRoHGoiZUXOPTYMd89SSq7hBJvV83XzSbHEIZvzs/?=
 =?us-ascii?Q?8fgZ4AjHvi1rZCXWqtK0dLDgSP/dWOcVodU8qJUw92Cv/p0lDjshQhNdEHnS?=
 =?us-ascii?Q?zRMtkbIc6rWnLAGoiO7uEQIoiA7cxwCg/w8dxSh0cgKxTiYnGo00+24OS2C1?=
 =?us-ascii?Q?f0QHxanwi4iUpk1a0saValXWoMzkZj2KKbqYiHNqYnJoTBWXzSC+8DvklbJZ?=
 =?us-ascii?Q?JSzKe8JmUy6+BkYm2GgDqyoeGwanLR3I7waflE8wS9+uxaJlxaXqdFbWcgey?=
 =?us-ascii?Q?i1XPjlcyvgyBl2Xsql2KD0YOomN0e98FWATU1AxBXGudjMifVFinCxHycyMR?=
 =?us-ascii?Q?PaBn1GcLUDvJtzXF6ufJWSyJPDpRcMUQh8UfE868Xx9yCXrvZcbogZ3i6Z/J?=
 =?us-ascii?Q?Dxofgco44y1MzJYKL0z7AAd6nN8jGS6Gh6egRJ/4/649nkLOPhWOA5j4aFkr?=
 =?us-ascii?Q?j8LEJQw405pauDv47XU3/VrlY1jAxG4QU+7p3Fdvsq+7DL74G9jxrf5ohBLb?=
 =?us-ascii?Q?oxSqbyCgr2lq7q1TukzYsHdVVhu//yXt0cvqF0mSel1FU/Hn5u2Sn9/HXJOV?=
 =?us-ascii?Q?l5qpnncMcHyZ+yovCXl5/HchZSaXcSkmgxYXg91BQ0wMAGL3te/vpg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f6PsJamKKASnfhW+6Pz5+qw6so8E+wpORJAstlRnn11o884bPgRkxb3ellY5?=
 =?us-ascii?Q?mDtyrd75myVZ6iyA1dbH5dh1M8qYj788hVDCJkh8yNqj6IgoDeCkvBJ/xZwE?=
 =?us-ascii?Q?Ga3FoEc+DeWVbgGnxmrrGjWQY+C7IpSRj1ROuok9sonRKQP/9ki2Eo7nl72O?=
 =?us-ascii?Q?VBN9Dgrw/DUbnH6UiAMhfsQQBDdGdwcE/raiednlLx7HAO4PagkVUBhi0yp0?=
 =?us-ascii?Q?fv0QpI2mGChS3GaLuTWbAd0OKTQxy8oqeeHd3GW0wgV8ew+dss76CVKMQ3zq?=
 =?us-ascii?Q?MbaWvkQMtBb1NsMT7ZZZtXpevNn5xL+oM8twIHZHiB1yZcXMazWQCSgPIfHZ?=
 =?us-ascii?Q?bJFasRh6TiGtY5Oo3Y4FJx78KkLgK6d8kfsxHYEmdXGJBFY6d60dDiL8D3ra?=
 =?us-ascii?Q?K/+Gw3JxyUZPAZPKsv5LFuM+d0znPKF8tNaLEFJzAXKf86crP95sI/K+5Uk6?=
 =?us-ascii?Q?+t5d727VID6I+o+1Cc9XdR2cQGjnRB8slJcGkB7cxGd1WNRUaSlsUFZMZ2Yz?=
 =?us-ascii?Q?ZMUZi7U8qjp5MytV4zEG3NX7XwFMXKMGqgTl1uKGZSmu0BIonXIJ2rEJ9MdN?=
 =?us-ascii?Q?o6X9ry7yNWdFZzIO/6OKw4QDmJ8TaemTbgNgodPRGyxqBZ48Nl2rYUqxhIwG?=
 =?us-ascii?Q?gJPuNkU0EVBHC8Gtj1F5uoDl+Fc8ikeIVbjOlQUJwRIpxyWkMzzHRtXyihWi?=
 =?us-ascii?Q?Y2txsVAD+3KmXudRGxEuhEKIfCvy8QhWd0RFcCxy0DV/gxdy86vaqguVs+pq?=
 =?us-ascii?Q?PakprgGAdtaNM7LcNDgzXxJA8RJQoQ3zG5Yf8vWDguGK9wfEeqC72fTsb1Oz?=
 =?us-ascii?Q?7D8Y8z19MhXdZpXMI68sOgyX1SFLch/esBNbAQUypPnvr5UtvNryi2qv710z?=
 =?us-ascii?Q?UQezeZWXGmiBajdGK+PeuC9J5IEIQY1jo/YZ7iqCYWSo8RWTUGI9VDaCiAlg?=
 =?us-ascii?Q?4quZlvN5Kf12M1RZZfygaFauywJGjQkglvRC1mLvPwbFj7Ylcn2pTCj97icQ?=
 =?us-ascii?Q?OYmPkuqBMIRqiHGI3YPH/GZuU6whsB68uvTbWdwVJRe6//Elytnlx7zdLhEw?=
 =?us-ascii?Q?gHYQM6hbkIjDWYRPYaEWQYfo04mOANvH2ZZ0UfNXm2mc9Gw3I7xLFLueo0XY?=
 =?us-ascii?Q?qlJtt3qV5nP2MJK+4wdbpiwV5vbU/0mWqYT+3krEJnrD5DeU+KvRcNljD+NH?=
 =?us-ascii?Q?vkdHsYut7Xp+mMRms3TumSKZmIlrFk9+1a9ehxnUj5l2cEuIFDjKPKJohHoe?=
 =?us-ascii?Q?Ue2K364obr7Dzwq6CPj5QJqNiAuXC/h82ORmiLaczgRdhhOHzbptYSEY/scO?=
 =?us-ascii?Q?3C5rDj/WJeFQwNsloljZdB3rjpOC1gWwRs6UOVH9PaAwkv6FUJYmSOL2uBpe?=
 =?us-ascii?Q?YaiTZkdthVMVfNGyNeaXIzNcUZ/Ik7JUFJFhX1a62Rwx8wFlYDoWjln1nrk4?=
 =?us-ascii?Q?5tdqPHPtYCtpgVOrQI90VhQugma5lXzf9qfBpxoOXvTpw4jshjJQfgZX1UwR?=
 =?us-ascii?Q?0j5ElPsfUZJOVFWC5yGK059Ga5ubdyGX94rtroxPfur0+IJ9GI/5tv4q7TED?=
 =?us-ascii?Q?ubK2E76SXiAaIxmJtTcsz5/LUu9z/NHajBTLPt4tWefGxmitMOvTov6hhQr6?=
 =?us-ascii?Q?2oLROYDqKUexhgONq6OwUmc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f639ef-4f99-4abb-b93d-08ddc59d9975
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 01:51:23.2979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ic1fkXTSyTYyLWBQp8cwbbJYlpuR0Xdvuqen4ofGlcmnSRI95J2rFs92wIpa+rQMr9RenL4mRfbEAjdrsVWosjlthprZwoDno2I2b75j40BDl0xFoY83W42MZCqbn1Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_185136_400952_EC5E0452 
X-CRM114-Status: UNSURE (   8.86  )
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

We can use string choices helper, let's use it.

It updates format

-	..."%sabled", ...? "en" : "dis",
+	..."%s",      ...  str_enabled_disabled(...)
	      ^^^^^

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm/mm/cache-l2x0.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 43d91bfd2360..470867160076 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/string_choices.h>
 
 #include <asm/cacheflush.h>
 #include <asm/cp15.h>
@@ -667,9 +668,9 @@ static void __init l2c310_enable(void __iomem *base, unsigned num_lock)
 		u32 power_ctrl;
 
 		power_ctrl = readl_relaxed(base + L310_POWER_CTRL);
-		pr_info("L2C-310 dynamic clock gating %sabled, standby mode %sabled\n",
-			power_ctrl & L310_DYNAMIC_CLK_GATING_EN ? "en" : "dis",
-			power_ctrl & L310_STNDBY_MODE_EN ? "en" : "dis");
+		pr_info("L2C-310 dynamic clock gating %s, standby mode %s\n",
+			str_enabled_disabled(power_ctrl & L310_DYNAMIC_CLK_GATING_EN),
+			str_enabled_disabled(power_ctrl & L310_STNDBY_MODE_EN));
 	}
 
 	if (aux & L310_AUX_CTRL_FULL_LINE_ZERO)
-- 
2.43.0


