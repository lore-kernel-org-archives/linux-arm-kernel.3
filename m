Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0902E68151
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IyTEry+J1Aou4t3VEoH0UTk3tieHRzgKydfD3ybVZME=; b=eBTG3nA6eBRQfEP/RUTnL8C4n/
	wdeRTHmZ9/QSeg4hGQFCTEa5f+aGFZcfzBQL1r7B0baGTmBKY8BrOyVs1CEgTo/bzAQcZ7MH08XAF
	DCFgR8S4TfjEIv3NMpaojdLn9UBL8zkJJdxyEAIsbFzyR+Tul7LZ4SbQH/oxeQXbE91SGFFnZio5B
	QiXBKyS0dyKbkkbRd8+UhnC2LiWxGPaQHG4WM5Tm4A9B5/Q/8dYoR2fm5NoZnXgIpa/TBcXXa0SmM
	ygeWH6ccJZtxR86wTWx3ZJMoIJnmHebDQ8YG+tP6zOmIxOhp6gpupop35OfAeEyIg9kTxrsPbr7my
	CR0qQKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHao-00000007y05-0FZk;
	Tue, 17 Feb 2026 09:42:06 +0000
Received: from mail-westus3azon11010005.outbound.protection.outlook.com ([52.101.201.5] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHam-00000007xzM-0KK0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeQc9mLvA2YOXB24XRqOZ/6+2e0HKFqIJMUd1zWQajfUDYug3Ws0ZHuoKna1BqE21tql9C09Rikc9HDhL+K5hSt0JQSlvU9LeA/zbhnM1CpqxLIlkoKWpzpgwe13HrALb48tLDpmxmKHEg8F9yAskqqw+yKStKe6USGyFUA33DD3XKjTzs8wNKHuVGs+/1rk/y1Wa6mOshzIi/ETChNHi0jkJ+59HmZawk59+DIeGA6nj+Fme5fpiT25VKeV2x1RBxlUebjV9q1Q1uZ0NKqTujhQUl9YBgNEkNZJ5WOGfez+l4AL0p2jbwJzJdaZai5ei4Ma3fRX98TFsYwKq/SsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyTEry+J1Aou4t3VEoH0UTk3tieHRzgKydfD3ybVZME=;
 b=EwIXX06UWVtsvQqkswO7+wvRqX6HqKIngP7lRcD7adUHwTqE/Dt42pxr+DgHpII0xN8cbjoiSbexQpy4N8kdiuUcLKWUIXEOeUoMxHTC5bY/ZWjl/WElEOV6rQ3inMRY3unM/uCy3h6z+W7Dy4bkmSWeC8u7W2606lrsgnqpHauZv+EFe+MhvdMdxumCAbHdq1feJj/Sg2n1gqwi/4/+epE+vdCYj0LdtgW+VOJdFSKK8fLYKGlVVEeJ+tePojXuNBht4zt6tl0alTuMfFgQjOaRzsQsXKskjP7YlGaOBnv+XjUcfMabPcsZFEZv+8gGy6vd3vcOMQRZDwMWa+05iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyTEry+J1Aou4t3VEoH0UTk3tieHRzgKydfD3ybVZME=;
 b=Ai/lld2VDYZMfYq9PMPoD7Gajx+7hEi/MuRT1UuxB6SvQIvOM7ewAZpwf/TtGkItIhXWeFvAqNoAP1pVczWYEfPplysmczWzzHJZFKPkutGU3tcvA6TSw6yumMW+wGGqVoew22FrJIdQP8QcO/jUT2Fq7V8fo7AT6Fu3zihSVpuHYWVKkKFToyZ0k1MKGiCITUKoI56jBGRRP/zHumG4rGwELANs25ISPCnd2IpL6QU6vHi8MtDT+PzQjyKLtFz6NMul+pjFHKFrgqESAsYmP50vnN5A3Y3DmRWd0fGpiEVTdRd6q/0emdnOuSypu3FkepriXKhL3m7LpHbrlz6+7Q==
Received: from BYAPR01CA0072.prod.exchangelabs.com (2603:10b6:a03:94::49) by
 CH3PR22MB5573.namprd22.prod.outlook.com (2603:10b6:610:1d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 09:41:58 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::b0) by BYAPR01CA0072.outlook.office365.com
 (2603:10b6:a03:94::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 09:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 09:41:58 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 31A39E8F41;
	Tue, 17 Feb 2026 11:41:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: imx: pll14xx: Add 756 MHz entry for PLL1443x
Date: Tue, 17 Feb 2026 11:41:52 +0200
Message-ID: <20260217094152.19958-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|CH3PR22MB5573:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 44cfe50c-6d86-4004-f6d9-08de6e08cb61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Od4LbYYRyp4zbPBNFrAPt5xrKqBRAY90BjVcnvqhVcVOwPFaaAkmcGZ6f9fo?=
 =?us-ascii?Q?0apmy5piaft9H2TjecluGg5sPryw0x/0FBU/eZZT1SWZHNGLFHTleCgZFXnq?=
 =?us-ascii?Q?p/PBLnBRI519Cfhu6WuGsiW9ZwV16TcxswL76XZLJ3Q++HjRY1ejP8Nif4Lc?=
 =?us-ascii?Q?7P+hprQp3NbvoCJ1mwz3COkzbMQoCH65NT3rxdsgfNfVS9yb9U4QnV2RpBr+?=
 =?us-ascii?Q?7nbGRcGW2hXoCssBlvwVt1owZm5O0DQQWqETarG5l3A815AaM7b87CIXxvVR?=
 =?us-ascii?Q?F7B45RAMTuhAfPb09tXNmyAKiN8N1Slt9bg6nO+v5QXUplHnADdPmo057HZd?=
 =?us-ascii?Q?hTYlrul1TodBkqFeSRq2pv2UuvwAeJxVGrO3WEcUhgVffujz986f9Cjoxw7s?=
 =?us-ascii?Q?7FJOttDrgd6ZPb08bS6rqoy8a4DrHvdH9ZL7RETqzsvLTYsnA5j7X9+Lm/7A?=
 =?us-ascii?Q?QHFy2zRh2NVPF20JKlAR1psJ6tqzfArLDBUyK6BzaSoY2eqIkhbX2Vp0hfmO?=
 =?us-ascii?Q?HUHWLNkeTfM5EBNNW49hwIc7QZq92cjA5OS4zmkHTltne/dDfRgWkgcIJBhV?=
 =?us-ascii?Q?01tWiESB4fRMPVTYeAVmPCzaE2TRN/M57vg1IDUHJQgGqvtx4DbPrutUqoNX?=
 =?us-ascii?Q?w6zJOZafcHYKviTGfzSQJs3v4xbhP+bIiy9hBZJg38JofPxjQydbyDmQA45q?=
 =?us-ascii?Q?u36oh9L93RoQ9AOvUZ/6C0QovJY8UI/lSYhgaWlZLYle6LBcnjfLqUqkT/q6?=
 =?us-ascii?Q?m3fKPIN08wXOTwsnXq+eURzKKYHOYzgycnsHzWFMXTmUpstM5AJgCrB4xbc3?=
 =?us-ascii?Q?rObgedoRSkHV4xgldUH8e7N16KThOE7+DMqLXx9xoJfX6GigBog83Cqhhac6?=
 =?us-ascii?Q?crq2EbQNsZw6FdNWjCXHB3fj2cA4+N5PDpN/xTjgFQEJ+vEuQWzYpSZP0Bd6?=
 =?us-ascii?Q?FTjFUwdNuqRfbrEHa2+vyPl1XEJbsawGVr4GX8V2kMsU/Mlv8JUric+qXC/n?=
 =?us-ascii?Q?zIwpE7gHyabQnJ/Lkdy+AGSpxxBwbh1aV7X/MtONx9wcuLqhCeJ+mB8WDNM6?=
 =?us-ascii?Q?Phl6pe4y075m9ln5PamI0+WW+TWiWst0AMED3d+bF/P2HMEcKP+PbHb4HfbM?=
 =?us-ascii?Q?THpXwiEjzpfViV35EXmpKcysOdoTwv8ZAYgrbWMb9o75TcIqrGV7s73YXs0G?=
 =?us-ascii?Q?bJ1euX+iBHOhJLgDRwDEi6LOfXg0edrNBJpUosKjTUkY92eJCbUtwuJQcS0V?=
 =?us-ascii?Q?OAKIx6p4kOnEazZILh6Ba5FGfHp0Z2B7iRJ4yGKztZczU/UbUQfb2/cANmLf?=
 =?us-ascii?Q?H1sPXeE+5dKvz9SDGQ4mtR5VABIaDAOH1ZIZb5jo+Ud9tV7B2AzgDjHexbZg?=
 =?us-ascii?Q?fp4UPKxGfOqwCl3Cf7V/VNcZLYFK9fON7K67HNkc+HlgMkBWe9U+gn8oSHqb?=
 =?us-ascii?Q?O12xFnhJo0stKtLqniUeHFVgqCvKjoufJe0owv6HjDE6u9t+kXlpF0phcsZU?=
 =?us-ascii?Q?jahLO06UJhkSBIwQNFe+68Rg3p8K57KhkWmxc+qySX5gdm/s4qlXNVVd7Pf7?=
 =?us-ascii?Q?OK7RqVZpw+N4lxz1mW2Nvm7z0VT2skynPd/PVFlxNV5124SAhANXwsyyA9Gr?=
 =?us-ascii?Q?53861W69/lZyLDr5PlR8XriyAKvBgdwlaGC1WjdQR+v0?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EeeCAr/BllpD2WKScS/TM5mQIq87RVMGE0TRiM3s/L+OtwLRnCDsp1s5AcqyzS74HMBfRZyQ07bgXQ2tr7U8iTrr74aunZsMArDMCqa230j1ohqIui/XL+bbW8w59h5x7s2hhbiP21STLrY1M9NY2FalW4phYoomCgIMJlqx/MGbhXFnl9iiqeB28tKd3wwmn7OKeWHG1ah/Zr35+YwgNTAe34gOowFtnR4r3TNmYsFc8V4vmfxIe/lFFmOgj8CvPjtnewI6cGcJBmnIXXef4BdJka31eYKnPnhmQjMV0H4QhRd24nTk6eXS925gIClOr4a1TPyGzViukQD/NYX6CLivA4Jl4exQ7lFGLmYsN2Y3jR0wpojZhuAYNBqvbY2QIT2nHR58uE1VxJSYEIrkFHJpMe+e1O/T6ajtK1TAN1iq8HxI1iH0fQy9gC5tCdaT
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:41:58.2026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44cfe50c-6d86-4004-f6d9-08de6e08cb61
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR22MB5573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_014204_118358_8332526F 
X-CRM114-Status: UNSURE (   8.05  )
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

The PLL1443x is used to implement VIDEO_PLL1 on i.MX8MP and can be used
for dual-channel LVDS displays.  Add new rate 756 MHz, which divides by
7 to provide 108 MHz LVDS pixel clock, and by 2 for 378 MHz LDB clock.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 drivers/clk/imx/clk-pll14xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 36d0e80b55b8..84279cf9f12b 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -63,6 +63,7 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
 
 static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
 	PLL_1443X_RATE(1039500000U, 173, 2, 1, 16384),
+	PLL_1443X_RATE(756000000U, 252, 2, 2, 0),
 	PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
 	PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
 	PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
-- 
2.49.0


